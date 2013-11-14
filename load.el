
;; Add this dir to load-path
(add-to-list 'load-path (file-name-directory
                         (or load-file-name
                             (when (boundp 'bytecomp-filename) bytecomp-filename)
                             buffer-file-name)))

;; http://ourcomments.org/Emacs/nXhtml/doc/nxhtml.html#qg
;; http://ourcomments.org/cgi-bin/emacsw32-dl-latest.pl
;;
;; /home/tracey/emacs/nxhtml/README.txt
;; To compile/speedup per README:
;;    M-x nxhtmlmaint-start-byte-compilation
;; but that had 2 fatal warnings had to workaround with first to make the .elc files:
;;    cd $HOME/emacs/nxhtml/;
;;    perl -i -pe s/font-lock-beginning-of-syntax-function/syntax-begin-function/g */*.el;
;;    perl -i -pe s/font-lock-syntactic-keywords/syntax-propertize-function/g      */*.el;
;; fallback to php-mode always when "<?[LETTER]" is seen that is not "<?xml"
;;    cd $HOME/emacs/nxhtml/;
;;    perl -i -pe "s/exc-mode 'mumamo-bad-mode/exc-mode 'php-mode/"  util/mumamo-fun.el;

(load-library "nxhtml/autostart.el") ;; mumamo!

;; we prefer a dark theme, not the default light!
(custom-set-faces  ;; M-x customize-group RET mumamo RET
 '(mumamo-background-chunk-major ((t (:background "#1c1c1c"))))
 '(mumamo-background-chunk-submode1 ((t (:background "#101010"))))
 '(mumamo-background-chunk-submode2 ((t (:background "red"))))
 )
;; j*sus, mumamo *** SHUT THE F**K UP ***
(custom-set-variables '(warning-minimum-level :emergency))



;; another multi-mode 3rd party library
(load-library "multi-mode.el")

;; some simple customizations for things like:
;;   auto-newlining upon typing chars like { } ; in certain modes
;;   font colors
;;   ensure indent levels are 2 chars; SPACEs not TABs
;;   bonus allow PHP mode for PHP snippets inside shell-script files (eg: bash functions)
(load-library "php-htm-mode.el")
