;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Author:   Tracey Jaquith 2013
;;  Source:   git://github.com/traceypooh/php-htm-mode.git
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; color whenever possible
(global-font-lock-mode 1)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;     Pretty display stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun tracey-text-mode ()
  "set indent on newline, auto-fill, show line numbers, color fonts, fill, tab-width 2"
  (local-set-key [return] 'newline-and-indent)
  ;;(turn-on-auto-fill)
  (line-number-mode 1)    ;;; Automagically enter line number in mode bar
  (font-lock-mode 1)
  (set-fill-column 78)


  (setq indent-tabs-mode nil)   ;; DON'T make TABs (convert to multiple <SPACE>)
  (setq tab-width 2)
  (setq sh-basic-offset 2)                   ;; only relevant for sh-mode
  (setq-default css-indent-width tab-width)  ;; only relevant for css-mode
  (setq-default css-indent-offset tab-width) ;; only relevant for css-mode
  (setq-default js-indent-level 2)           ;; only relevant for js-mode
)


(defun tracey-code-mode ()
  (tracey-text-mode)
  (setq c-basic-indent 2) ;; this is for js2-mode, actually, sigh...

  (if (eq emacs-major-version '24)
    (progn
      ;;;;;;;;;;  NOTE: requires emacs 24+
      ;; make it so auto-NEWLINE whenever type any of chars:   ; { }
      (electric-layout-mode t) 
      (set (make-local-variable 'electric-layout-rules) 
           '((?\; . after)
             (?\{ . after)
             (?\} . after)))
      (electric-indent-mode t) 
      (set (make-local-variable 'electric-indent-chars) (cons ?\; electric-indent-chars))
      ;;;;;;;;;;  NOTE: requires emacs 24+
)))


;; like tracey-code-mode, but ";" char doesn't auto newline
(defun tracey-css-mode ()
  (tracey-text-mode)

  (if (eq emacs-major-version '24)
    (progn
      ;;;;;;;;;;  NOTE: requires emacs 24+
      ;; make it so auto-NEWLINE whenever type any of chars:   { }
      (electric-layout-mode t) 
      (set (make-local-variable 'electric-layout-rules) 
           '((?\{ . after)
             (?\} . after)))
      (electric-indent-mode t) 
      (set (make-local-variable 'electric-indent-chars) (cons ?\; electric-indent-chars))
      ;;;;;;;;;;  NOTE: requires emacs 24+
)))

  


;;######################################################################
;; multi-mode for php   (PHP and HTM and JS intermixed)
;; multi-mode for bash  (bash and PHP intermixed)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (from: http://babble.10gen.com/Developer%20Setup )
;;  wget http://www.tex.ac.uk/tex-archive/support/iso-tex/multi-mode.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default indent-tabs-mode nil)


;; maybe some day, add some crazy sh1t?
;; http://blog.deadpansincerity.com/2011/05/setting-up-emacs-as-a-javascript-editing-environment-for-fun-and-profit/
(defun php-htm-mode ()
  (multi-mode 1
              'html-mode
              '("<\?"           php-mode)
              '("<\?php"        php-mode)
              '("\?>"           html-mode)
              '("<script"       js-mode)
              '("</script>"     html-mode)
              '("<style"        css-mode)
              '("</style>"      html-mode)
              ;;'("\{\"" json-mode) ;; not quite ideal...
              ))


(defun tracey-sh-mode ()
  (tracey-text-mode)
  (multi-mode 1
              'sh-mode
              '("<\?" php-mode)
              '("\?>" sh-mode)
              ))




;; These mappings will setup a "peek" of the start of the file to see if it
;; matches one of them -- and if so, to flip on php-htm-mode (and *NOT* use
;; auto-mode-alist -- since php-mode (normal mode) can mangle that)
;; A bonus is that if a file doesn't have a .php or .inc file extension, these
;; will make the file automagically load into php-htm-mode!
(setq magic-mode-alist (append magic-mode-alist '(("<\\?"               . nxhtml-mumamo-mode))))
(setq magic-mode-alist (append magic-mode-alist '(("../usr/bin/env php" . nxhtml-mumamo-mode))))
(setq magic-mode-alist (append magic-mode-alist '(("<html"              . nxhtml-mumamo-mode))))
(setq magic-mode-alist (append magic-mode-alist '(("<head"              . nxhtml-mumamo-mode))))
(setq magic-mode-alist (append magic-mode-alist '(("<body"              . nxhtml-mumamo-mode))))
(setq magic-mode-alist (append magic-mode-alist '(("<\\!DOCTYPE html"   . nxhtml-mumamo-mode))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multi-mode for php   (PHP and HTM and JS intermixed)
;; multi-mode for bash  (bash and PHP intermixed)
;;######################################################################

(setq sh-mode-hook              'tracey-sh-mode)
(setq js-mode-hook              'tracey-code-mode)
(setq js2-mode-hook             'tracey-code-mode)
(setq javascript-mode-hook      'tracey-code-mode)
(setq php-mode-hook             'tracey-text-mode)
(setq css-mode-hook             'tracey-css-mode)


(autoload 'php-mode "php-mode" "PHP mode." t) ;; only really needed for MacOSX

(setq default-tab-width 2)

;; php-mode or similar tries to make "js2-mode" the default for .js files
;; that doesnt bode well always (eg: precise ubuntu w/ a quantal emacs v24 pkg!),
;; so here switch default for .js files back to "js-mode".
;; And avoid "javascript-mode":
;;   http://emacswiki.org/emacs/JavaScriptMode
(setq auto-mode-alist 
      (append '(("\\.js$"   . js-mode))
              auto-mode-alist ))
