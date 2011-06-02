Ezmath filter Drupal module
================================================================================

Ezmath provide an easy way to write math on web.


System Requirement:
  Unix/Linux base sever
  Web server with PHP 5 or above
  Drupal 6

Prerequisite Drupal Modules:
  Filter (core)
  Libraries API
  MathJax


Prerequisite Modules Installation:
--------------------------------------------------------------------------------

Libraries API
1. Download "Libraries API" from http://drupal.org/project/libraries
2. Uncompress archive and rename it to "libraries" under "modules" directory.

MathJax Module
1. Download "MathJax Module" from http://drupal.org/project/mathjax
2. Uncompress archive and rename it to "mathjax" under "modules" directory.

MathJax Software
1. Download "MathJax Software" from http://www.mathjax.org/download/
2. Create your "libraries" directory (e.g. /sites/all/libraries)
3. Uncompress archive and rename it to "mathjax" under "libraries" directory.

After finished this 3 installation, enable "Libraries" and "Mathjax" modules.
   Enable modules at Administer >> Site building >> Modules.


Ezmath Installation:
--------------------------------------------------------------------------------

1. Go to your MathJax module folder. Open "mathjax.js" with text editor.
2. Search for line that contain "inlineMath" (line 18), replace all line with:
                   'inlineMath: ["\\\\(","\\\\)"]],' +
   This will allow your members write Dollar sign $ without turn it into math.

3. Download and uncompress "ezmath1.x.tar.gz" in side your modules folder,
   which default place is "/sites/all/modules".
4. Enable "Ezmath filter" module at "Administer >> Site building >> Modules".
   (also check MathJax module to be enable!)
5. Add "Ezmath" input at "Administer >> Site configuration >> Input formats".
6. Go to "Rearrange" tab and weight Ezmath to 0, or first execute filter.
7. Test by post new content by place Ezmath syntax between $$ ... $$,
   e.g. $$ a[i][j] * Xi^"T" = [i,j;4,2;x,0] $$.


Credits
--------------------------------------------------------------------------------
Ezmath creator                 by Nattawut Phetmak: <http://neizod.blogspot.com>
