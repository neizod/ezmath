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
    $text = preg_replace('/\r\n?/', '\n', $text);
#################### instruction site #################### 
    function anoy($m) {

      if($m[0][0] == '$') {
        $text = $m[1];
        // wrap argv before passing it to C parser program
        $text = preg_replace('#^\s+|\s+$#s', '', $text);
        $text = '"' . strtr($text, array('"' => '\\"')) . '"';
        $text = shell_exec(drupal_get_path('module', 'ezmath') . '/ezmath ' . $text);
        // check if parse success?
        if($text != '') {
          if(preg_match('#^\n.*\n$#s', $m[1])) {
            $text = '$$' . $text . '$$';
          }
          else {
            $text = '$'  . $text .  '$';
          }
        }
        else {
          // on error parse, return original code.
          $text = '<pre>' . $m[0] . '</pre>';
        }
      }
      else {
        $text = $m[0];
      }
      return $text;
    }
    return preg_replace_callback('#\$\$(.*?)\$\$|<pre>.*?</pre>#s', 'anoy', $text);

##########################################################

  }

  function latex($text) {
    // remove first & last empty lines to prevent LaTeX conflict.
echo $text;
    $text = preg_replace("/^\s+|\s+$/", '', $text);
echo $text;
    return shell_exec(drupal_get_path('module', 'ezmath') . '/ezmath ' . $this->wrap_argv($text));
  }
  // parsing error handler, return original text hilight in darkred.
  function error_parse($text, $type = 'w') {
    if($type == 'w') {
      $text = '$$' . $text . '$$';
    } else {
      $text = '$$' . $text;
    }
    // it's ok to use $ directly while its being wrap inside <pre>...</pre>.
    $text = '<pre>' . $text . '</pre>';
    $text = '<span style="color:darkred">' . $text . '</span>';
    return $text;
  }
}

