Ezmath filter Drupal module
================================================================================

Installation
Before installing Ezmath module, make sure you already install MathJax module.
--------------------------------------------------------------------------------

1. Go to your MathJax module folder. Open "mathjax.js" with text editor.
2. Search for the line that start with "'inlineMath: ..." and remove it.
3. Replace that line with "'inlineMath: [["\\\\(","\\\\)"]],' +".
   This will allow you to save single Dollar sign ($) for text.
4. Download and uncompress "ezmath.tar.gz" in side your modules folder,
   which default place is "/sites/all/modules".
5. Enable "Ezmath filter" module at "Administer >> Site building >> Modules".
   (also check MathJax module to be enable!)
6. Add "Ezmath" input at "Administer >> Site configuration >> Input formats".
7. Go to "Rearrange" tab and weight Ezmath to -1,
   make sure that Ezmath will be run first.
8. Test by post new content of Ezmath syntax between $$...$$,
   e.g. $$ a[i][j] * Xi^"T" = [i,j;4,2;x,0] $$.


Credits
--------------------------------------------------------------------------------
Ezmath creator                 by Nattawut Phetmak: <http://neizod.blogspot.com>
