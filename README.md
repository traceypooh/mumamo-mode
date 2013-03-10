mumamo-mode
===========


php + html + javascript + css mixed editing via mumamo-mode (multiple major modes).  

Has indenting, coloring, normal modes syntax parsing, etc.

Has some auto-newline and indent features for JS/CSS/PHP



This repo was made by:
* unzip from latest mumamo source
* removed some htm/doc unused junk
* minor emacs v24 tweaks (had fatal warnings otherwise)
* a few lines after loading turn from light to dark theme



Assumes and works best with emacs v24+
but will try to "gracefully degrade" for earlier versions.

As a special bonus, for randomness, will do similar multi-mode for bash
and shell scripts that have inline php.




Example usage setup:
* cd $HOME;
* git clone git://github.com/traceypooh/mumamo-mode.git;

* Add this line to your $HOME/.emacs:
<code><br>
(load-library (concat (getenv "HOME") "/mumamo-mode/load.el"))
</code>


Works great on linux and MacOSX 
(I'm using macports and "sudo port install emacs php-mode.el" for v24 emacs in Mountain Lion)




Further info / SPEEDING UP:
<pre>
;; http://ourcomments.org/Emacs/nXhtml/doc/nxhtml.html#qg
;; http://ourcomments.org/cgi-bin/emacsw32-dl-latest.pl
;;
;; mumamo-mode/nxhtml/README.txt
;; To compile/speedup per README:
;;    M-x nxhtmlmaint-start-byte-compilation
;;
;;
;; These are the essential changes I made to default mumamo-mode source:
;; byte compiling had 2 fatal warnings had to workaround with first to make the .elc files:
;;    cd $HOME/mumamo-mode/nxhtml/;
;;    perl -i -pe s/font-lock-beginning-of-syntax-function/syntax-begin-function/g */*.el;
;;    perl -i -pe s/font-lock-syntactic-keywords/syntax-propertize-function/g      */*.el;
;; fallback to php-mode always when "&lt;?[LETTER]" is seen that is not "&lt;?xml"
;;    cd $HOME/mumamo-mode/nxhtml/;
;;    perl -i -pe "s/exc-mode 'mumamo-bad-mode/exc-mode 'php-mode/"  util/mumamo-fun.el;
</pre>
