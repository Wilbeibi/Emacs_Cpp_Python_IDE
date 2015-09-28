;; https://github.com/purcell/emacs.d/blob/master/init-ido.el
;; Use C-f during file selection to switch to regular find-file
(require 'ido-ubiquitous)
(ido-mode t)  ; use 'buffer rather than t to use only buffer switching
(ido-everywhere t)
(ido-ubiquitous-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)

(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)

;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

;; A-F10  chose from recent file
(defun steve-ido-choose-from-recentf ()
  "Use ido to select a recently opened file from the `recentf-list'"
  (interactive)
  (if (and ido-use-virtual-buffers (fboundp 'ido-toggle-virtual-buffers))
      (ido-switch-buffer)
    (find-file (ido-completing-read "Open file: " recentf-list nil t))))

(global-set-key [(meta f10)] 'steve-ido-choose-from-recentf)


;;----------------------------------------------------------------------------
;; ido completion in M-x
;;----------------------------------------------------------------------------
(smex-initialize)
(global-set-key "\M-x" 'smex)


(provide 'wil-ido)
