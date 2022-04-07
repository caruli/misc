(require 'package)

(add-to-list 'package-archives
             '("elpa-devel" . "https://elpa.gnu.org/devel/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(menu-bar-mode -1)
(tool-bar-mode -1)

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                   (time-subtract after-init-time before-init-time)))
           gcs-done))
(add-hook 'emacs-startup-hook #'efs/display-startup-time)


;; (prot-emacs-elpa-package 'which-key
;;   ;; NOTE: I only use this for `embark' and `consult' and for the sake
;;   ;; of producing more user-friendly video demonstrations.
;;   (setq which-key-dont-use-unicode t)
;;   (setq which-key-add-column-padding 2)
;;   (setq which-key-show-early-on-C-h nil)
;;   (setq which-key-idle-delay most-positive-fixnum) ; set this to something like 0.8
;;   (setq which-key-idle-secondary-delay 0.05)
;;   (setq which-key-popup-type 'side-window)
;;   (setq which-key-show-prefix 'echo)
;;   (setq which-key-max-display-columns 3)
;;   (setq which-key-separator "  ")
;;   (setq which-key-special-keys nil)
;;   (setq which-key-paging-key "<next>")
;;   (which-key-mode -1))	   ; and turn this on, if you want to use this
