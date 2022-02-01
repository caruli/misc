(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
	   (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time)))  gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(setq inhibit-startup-message t
      visible-bell t) ; C-M-x Ctrl-Alt-x eval-defun evaluate anywhere in funcion
(setq initial-scratch-message "")
(menu-bar-mode -1)
;;(tool-bar-mode -1)
;;(scroll-bar-mode -1)

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



(setq gc-cons-trashold (* 2 1000 1000))
