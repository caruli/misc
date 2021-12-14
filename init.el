(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
	   (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time)))  gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq package-enable-at-startup nil)
(straight-use-package 'use-package)	
;; with window manager only
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(toggle-frame-fullscreen)

(setq warning-suppress-types t)
(setq gc-cons-trashold (* 50 1000 1000))
(let ((file-name-handler-alist nil))  'init-file-user)
(setq inhibit-startup-message t)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(menu-bar-mode -1)          ; Disable the menu bar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 5)         ; Give some breathing room

;; (setq visible-bell t)
;; (load-theme 'wombat)
;; (set-face-attribute 'default nil :font "Inconsolata" :height 177)
;;(setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))
(setq make-backup-files nil)
;; (setq user-emacs-directory (expand-file-name "~/.cache/emacs"))
;; (setq auto-save-list--file-prefix nil)
;; (setq auto-save-default nil)
;; (make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t) 
(set-face-attribute 'default nil  :height 195)
(straight-use-package 'no-littering)
(require 'no-littering)

;; (straight-use-package 'org-roam)
;; (with-eval-after-load 'org)
;; ;; like :init in (use-package)
;; (setq org-roam-v2-ack t)
 ;; (require 'org-roam)
;; (custom-set-variables
;;  '(org-roam-directory  "~/notes")
;;  '(org-roam-completion-everywhere  t))
;;(straight-use-package 'olivetti)
(use-package olivetti
  :straight t
  :defer
  :diminish
  :config
  (setq olivetti-body-width 0.65)
  (setq olivetti-minimum-body-width 72)
  (setq olivetti-recall-visual-line-mode-entry-state t)

  (define-minor-mode prot/olivetti-mode
    "Toggle buffer-local `olivetti-mode' with additional parameters.

Fringes are disabled.  The modeline is hidden, except for
`prog-mode' buffers (see `prot/hidden-mode-line-mode').  The
default typeface is set to a proportionately-spaced family,
except for programming modes (see `prot/variable-pitch-mode').
The cursor becomes a blinking bar, per `prot/cursor-type-mode'."
    :init-value nil
    :global nil
    (if prot/olivetti-mode
        (progn
          (olivetti-mode 1)
          (set-window-fringes (selected-window) 0 0)
          (prot/variable-pitch-mode 1)
          (prot/cursor-type-mode 1)
          (unless (derived-mode-p 'prog-mode)
            (prot/hidden-mode-line-mode 1)))
      (olivetti-mode -1)
      (set-window-fringes (selected-window) nil) ; Use default width
      (prot/variable-pitch-mode -1)
      (prot/cursor-type-mode -1)
      (unless (derived-mode-p 'prog-mode)
        (prot/hidden-mode-line-mode -1))))
  :bind ("C-c o" . prot/olivetti-mode))

(use-package emacs
  :commands prot/hidden-mode-line-mode
  :config
  (setq mode-line-percent-position '(-3 "%p"))
  (setq mode-line-defining-kbd-macro
        (propertize " Macro" 'face 'mode-line-emphasis))
  (setq-default mode-line-format
                '("%e"
                  mode-line-front-space
                  mode-line-mule-info
                  mode-line-client
                  mode-line-modified
                  mode-line-remote
                  mode-line-frame-identification
                  mode-line-buffer-identification
                  "  "
                  mode-line-position
                  (vc-mode vc-mode)
                  " "
                  mode-line-modes
                  " "
                  mode-line-misc-info
                  mode-line-end-spaces))

  (define-minor-mode prot/hidden-mode-line-mode
    "Toggle modeline visibility in the current buffer."
    :init-value nil
    :global nil
    (if prot/hidden-mode-line-mode
        (setq-local mode-line-format nil)
      (kill-local-variable 'mode-line-format)
      (force-mode-line-update))))

(use-package face-remap
  :diminish buffer-face-mode            ; the actual mode
  :commands prot/variable-pitch-mode
  :config
  (define-minor-mode prot/variable-pitch-mode
    "Toggle `variable-pitch-mode', except for `prog-mode'."
    :init-value nil
    :global nil
    (if prot/variable-pitch-mode
        (unless (derived-mode-p 'prog-mode)
          (variable-pitch-mode 1))
      (variable-pitch-mode -1))))


(use-package emacs
  :config
  (setq-default scroll-preserve-screen-position t)
  (setq-default scroll-conservatively 1) ; affects `scroll-step'
  (setq-default scroll-margin 0)

  (define-minor-mode prot/scroll-centre-cursor-mode
    "Toggle centred cursor scrolling behaviour."
    :init-value nil
    :lighter " S="
    :global nil
    (if prot/scroll-centre-cursor-mode
        (setq-local scroll-margin (* (frame-height) 2)
                    scroll-conservatively 0
                    maximum-scroll-margin 0.5)
      (dolist (local '(scroll-preserve-screen-position
                       scroll-conservatively
                       maximum-scroll-margin
                       scroll-margin))
        (kill-local-variable `,local))))

  ;; C-c l is used for `org-store-link'.  The mnemonic for this is to
  ;; focus the Line and also works as a variant of C-l.
  :bind ("C-c L" . prot/scroll-centre-cursor-mode))


(use-package display-line-numbers
  :defer
  :config
  ;; Set absolute line numbers.  A value of "relative" is also useful.
  (setq display-line-numbers-type t)

  (define-minor-mode prot/display-line-numbers-mode
    "Toggle `display-line-numbers-mode' and `hl-line-mode'."
    :init-value nil
    :global nil
    (if prot/display-line-numbers-mode
        (progn
          (display-line-numbers-mode 1)
          (hl-line-mode 1))
      (display-line-numbers-mode -1)
      (hl-line-mode -1)))
  :bind ("<f7>" . prot/display-line-numbers-mode))


(use-package frame
  :commands prot/cursor-type-mode
  :config
  (setq-default cursor-type 'box)
  (setq-default cursor-in-non-selected-windows '(bar . 2))
  (setq-default blink-cursor-blinks 50)
  (setq-default blink-cursor-interval nil) ; 0.75 would be my choice
  (setq-default blink-cursor-delay 0.2)

  (blink-cursor-mode -1)

  (define-minor-mode prot/cursor-type-mode
    "Toggle between static block and pulsing bar cursor."
    :init-value nil
    :global t
    (if prot/cursor-type-mode
        (progn
          (setq-local blink-cursor-interval 0.75
                      cursor-type '(bar . 2)
                      cursor-in-non-selected-windows 'hollow)
          (blink-cursor-mode 1))
      (dolist (local '(blink-cursor-interval
                       cursor-type
                       cursor-in-non-selected-windows))
        (kill-local-variable `,local))
      (blink-cursor-mode -1))))







(use-package org-roam
  :straight t
  ;;:after org
  ;;:hook
  ;;  (after-init . org-roam-mode)
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory  "~/notes")
  ;; (org-roam-directory  "~/org-roam-notes")
  (org-roam-completion-everywhere  t)
  :bind  (("C-h /" . org-roam-node-find)
	 ("<f8>" . org-roam-node-find)
	 ("C-h 0" . org-roam-capture)
	 ("C-h i" . org-roam-node-insert)
	 ("C-h b" . org-roam-buffer-toggle)
	 :map org-mode-map
	 ("C-M-i" . completion-at-point))
  :config
  (org-roam-db-autosync-mode))

;; custom compilation
;;(setq compilation-read-command nil)
(global-set-key "\C-x\C-m" 'compile)


;; (add-hook 'c-mode-hook
;; 	  (lambda ()
;; 	    (unless (file-exists-p "Makefile")
;; 	      (set (make-local-variable 'compile-command)
;; 		   ;; emulate make's .c.o implicit pattern rule, but with
;; 		   ;; different defaults for the CC, CPPFLAGS, and CFLAGS
;; 		   ;; variables:
;; 		   ;; $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
;; 		   (let ((file (file-name-nondirectory buffer-file-name)))
;; 		       (format "%s -o  %s %s %s %s"
;; 			       (or (getenv "CC") "gcc")
;; 			     (file-name-sans-extension file)
;; 			     (or (getenv "CPPFLAGS") "-DDEBUG=9")
;; 			     (or (getenv "CFLAGS") " -Wall -g")
;; 				   file))))))

;; (defun notify-compilation-result(buffer msg)
;; "Notify that the compilation is finished,
;; close the *compilation* buffer if the compilation is successful,
;; and set the focus back to Emacs frame"
;;   ;;  (if (string-match "^finished" msg)
;; 	(progn
;; 	  ;;(shell-command "st")
;; 	  ;;(shell-command (format "%s %s" "st"  buffer-file-name))
;; 	  (delete-windows-on buffer))
;;      	  ;;(tooltip-show "\n Compilation Successful :-) \n "))

;;       ;;(tooltip-show "\n Compilation Failed :-( \n ")
;;       ;;(set (make-local-variable 'compile-command "make -k" ))
;;       )
;;      (setq current-frame (car (car (cdr (current-frame-configuration)))))
;;       (select-frame-set-input-focus current-frame))
      
;;      (add-to-list 'compilation-finish-functions
;; 	  'notify-compilation-result  )

;; org-links 
;; (setf (cdr (assoc 'file org-link-frame-setup)) 'find-file)
(setq gc-cons-trashold (* 2 1000 1000))
