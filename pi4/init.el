(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
	   (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time)))  gcs-done))
(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(setq inhibit-startup-message t
      visible-bell -1) ; C-M-x Ctrl-Alt-x eval-defun evaluate anywhere in funcion
(setq initial-scratch-message "")
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(hl-line-mode -1)
(blink-cursor-mode -10)
(load-theme 'deeper-blue t)
(recentf-mode 1)
(setq history-length 20)
(savehist-mode 1)
(save-place-mode 1)
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(set-face-attribute 'default nil :font "JetBrainsMono" :height 220)
;;(set-face-attribute 'default nil :font "DejaVu Sans Mono"  :height 220)

(setq-default bidi-display-reordering nil)

(defun bidi-reordering-toggle ()
   "Toggle bidirectional display reordering."
   (interactive)
   (setq bidi-display-reordering (not bidi-display-reordering))
   (message "bidi reordering is %s" bidi-display-reordering))

(setq-default bidi-paragraph-direction 'left-to-right)
(defun bidi-direction-toggle ()
      "Will switch the explicit direction of text for current
      buffer. This will set BIDI-DISPLAY-REORDERING to T"
    (interactive "")
    (setq bidi-display-reordering t)
    (if (equal bidi-paragraph-direction 'right-to-left)
        (setq bidi-paragraph-direction 'left-to-right)
      (setq bidi-paragraph-direction 'right-to-left)
      )
    (message "%s" bidi-paragraph-direction))

(defun bidi-display-reodering-on ()
  "Sets bidi-display-reodering on"
  (setq-local bidi-display-reodering t))
(add-hook 'text-mode-hook 'bidi-display-reodering-on)

(defun close-and-kill-this-pane ()
      "If there are multiple windows, then close this pane and kill the buffer in it also."
      (interactive)
      (kill-this-buffer)
      (if (not (one-window-p))
          (delete-window)))

(defun close-and-kill-next-pane ()
      "If there are multiple windows, then close the other pane and kill the buffer in it also."
      (interactive)
      (other-window 1)
      (kill-this-buffer)
      (if (not (one-window-p))
          (delete-window)))
(define-key emacs-lisp-mode-map (kbd "<f2>") 'close-and-kill-next-pane)

;;; describe this point lisp only
	(defun describe-foo-at-point ()
          "Show the documentation of the Elisp function and variable near point.
	This checks in turn:
	-- for a function name where point is
	-- for a variable name where point is
	-- for a surrounding function call
	"
	  (interactive)
	  (let (sym)
	    ;; sigh, function-at-point is too clever.  we want only the first half.
	    (cond ((setq sym (ignore-errors
                               (with-syntax-table emacs-lisp-mode-syntax-table
                                 (save-excursion
                                   (or (not (zerop (skip-syntax-backward "_w")))
                                       (eq (char-syntax (char-after (point))) ?w)
                                       (eq (char-syntax (char-after (point))) ?_)
                                       (forward-sexp -1))
                                   (skip-chars-forward "`'")
        	                   (let ((obj (read (current-buffer))))
                                     (and (symbolp obj) (fboundp obj) obj))))))
                   (describe-function sym))
                  ((setq sym (variable-at-point)) (describe-variable sym))
                  ;; now let it operate fully -- i.e. also check the
                  ;; surrounding sexp for a function call.
                  ((setq sym (function-at-point)) (describe-function sym)))))

(define-key emacs-lisp-mode-map [(f1)] 'describe-foo-at-point)
    (define-key emacs-lisp-mode-map [(control f1)] 'describe-function)
    (define-key emacs-lisp-mode-map [(shift f1)] 'describe-variable)

(quail-define-package "macron-underline" "Macron" "MC")
(quail-define-rules
 (">a" ?ʾ) ;; aleph
 ("<a" ?ʿ) ;; ayin    
 ("_'" ?֫)  ;; accent  
 ("_a" ?ā)
 ("_e" ?ē)
 ("_i" ?ī)
 ("_o" ?ō)
 ("_u" ?ū)
 ("^a"  ?â)
 ("^e"  ?ê)
 ("^i"  ?î)
 ("^o"  ?ô)
 ("^u"  ?û)
 ("_b" ?ḇ)
 ;;("_g" ?)
 ("_d" ?ḏ)
 ("_k" ?ḵ)
 ("_p" ?ꝑ)
 ("_t" ?ṯ)
 (".a" ?ᵃ)
 (".h" ?ḥ)
 ("_s" ?š)
 (".s" ?ṣ)
 (".t" ?ṭ)
 )

(add-hook 'text-mode-hook
  (lambda () (set-input-method "macron-underline")))
(setq org-odt-preferred-output-format "docx")  
;;  p  0070
;;  ̱  0331

(setq gc-cons-trashold (* 2 1000 1000))
;; testing
(setq completion-styles
      '(basic substring initials flex partial-completion orderless))
