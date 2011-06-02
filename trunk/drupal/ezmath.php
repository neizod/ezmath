<?php

function Ezmath($text) {
  static $parser;
  if(!isset($parser)) {
    $parser = new Ezmath_Parser();
  }
  return $parser->translate($text);
}

class Ezmath_Parser {
  var $extended_special_chars = array(
    '\\' => '&#0092;',
    '`' => '&#0096;',
    '*' => '&#0042;',
    '_' => '&#0095;',
    '{' => '&#0123;',
    '}' => '&#0125;',
    '[' => '&#0091;',
    ']' => '&#0093;',
    '(' => '&#0040;',
    ')' => '&#0041;',
    '#' => '&#0035;',
    '+' => '&#0043;',
    '-' => '&#0045;',
    '.' => '&#0046;',
    '!' => '&#0033;',
    '&' => '&#0038;',
    ';' => '&#0059;'
  );

  function translate($text) {
    // standardize line endings
    $text = preg_replace('/\r\n?/', "\n", $text);

    $text_array = explode("\$\$", $text);
    $all_i = count($text_array);
    $math_i = ceil($all_i/2)-1;

    // run through all $$...$$ elements
    for($i = 0; $i < $math_i; $i++) {
      $j = 2*$i + 1;

      // ignore empty input
      if(preg_match("/^\s*$/", $text_array[$j])) {
        continue;
      }

      // parse and check for error
      $math = $this->latex($text_array[$j]);
      if($math != '') {
        // check if math element is in-line or new-line.
        if(preg_match("/^\n/", $text_array[$j]) && preg_match("/\n$/", $text_array[$j])) {
          $text_array[$j] = '\\[' . $math . '\\]';
        } else {
          $text_array[$j] = '\\(' . $math . '\\)';
        }

        // eascape special chars to prevent conflict with html, markdown, etc.
        $text_array[$j] = strtr($text_array[$j], $this->extended_special_chars);
      }
      else {
        $text_array[$j] = $this->error_parse($text_array[$j], 'w');
      }
    }

    // if the last math element dosn't wrap in $$...$$, its will not parse.
    if($all_i%2 == 0) {
      $text_array[$all_i-1] = $this->error_parse($text_array[$all_i-1], 'f');
    }

    $text = implode($text_array);
    return $text;
  }

  // wrap argv before passing it to C parser program
  function wrap_argv($text) {
    return '"' . strtr($text, array('"' => '\\"')) . '"';
  }
  function latex($text) {
    // remove first & last empty lines to prevent LaTeX conflict.
    $text = preg_replace("/^\s+|\s+$/", '', $text);

    return shell_exec(drupal_get_path('module', 'ezmath') . '/ezmath ' . $this->wrap_argv($text));
  }
  // parsing error handler, return original text hilight in darkred.
  function error_parse($text, $type = 'w') {
    // manualy manage newline here since it will be conflict with markdown.
    $text = preg_replace("/\n/", '<br />', $text);
    if($type == 'w') {
      $text = '$$' . $text . '$$';
    } else {
      $text = '$$' . $text;
    }
    // it's ok to use $ directly while its being wrap inside <code>...</code>.
    $text = '<code>' . $text . '</code>';
    $text = '<span style="color:darkred">' . $text . '</span>';
    return $text;
  }
}

