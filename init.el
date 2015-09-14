;;; package -- Summary
;;; Commentary:
;;; samuelleonardo's init.el

;;; Code:
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))


;; https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)

;; https://github.com/magnars/expand-region.el
(require 'expand-region)
(global-set-key (kbd "C-;") 'er/expand-region)

;; https://github.com/fgallina/region-bindings-mode
(require 'region-bindings-mode)
(region-bindings-mode-enable)
(define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
(define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
(define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
(define-key region-bindings-mode-map "r" 'mc/unmark-previous-like-this)
(define-key region-bindings-mode-map "e" 'mc/unmark-next-like-this)
(define-key region-bindings-mode-map "A" 'mc/edit-beginnings-of-lines)
(define-key region-bindings-mode-map "E" 'mc/edit-ends-of-lines)

;; https://github.com/magnars/change-inner.el
(require 'change-inner)
(global-set-key (kbd "M-i") 'change-inner)
(global-set-key (kbd "M-o") 'change-outer)

;; http://www.emacswiki.org/emacs/YamlMode
(require 'yaml-mode)

;; https://github.com/dominikh/go-mode.el
(require 'go-mode)

;; https://github.com/flycheck/flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; http://jblevins.org/projects/markdown-mode/
(require 'markdown-mode)

;; https://github.com/abo-abo/ace-window
(require 'ace-window)
(global-set-key (kbd "C-x o") 'ace-window)

;; no scrollbars
(scroll-bar-mode -1)

;; enable line numbers
(global-linum-mode t)

;; enable column numbers
(column-number-mode t)

;; go away backups!
(setq make-backup-files nil)

;; dired jump
(global-set-key (kbd "C-x j") 'dired-jump)

;; rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; cyberpunk theme yo
(load-theme 'cyberpunk t)

;; highlight line highlight lines
(global-hl-line-mode 1)
(require 'hlinum)
(hlinum-activate)

;; disable annoying toolbar
(tool-bar-mode -1)

;; ido and it's derivatives
(require 'ido-ubiquitous)
(require 'ido-vertical-mode)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces t)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; some smex for IDO - m-x completion
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; dired details
(require 'dired-details+)

;; show me some parens
(show-paren-mode 1)
(setq show-paren-delay 0)

;; projectiles! projectiles everywhere
(require 'projectile)
(projectile-global-mode)

;; magit? more like magic, amirite?
(global-set-key (kbd "C-x g") 'magit-status)
;; remove git-commit-mode's behavior of autobreaking lines at 80 char
(add-hook 'git-commit-mode-hook
          '(lambda () (auto-fill-mode 0))
          ;; append rather than prepend to git-commit-mode-hook, since the
          ;; thing that turns auto-fill-mode on in the first place is itself
          ;; another hook on git-commit-mode.
          t)

;; delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(js-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:background "#000000" :foreground "gray67"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#006400"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "DeepSkyBlue2")))))

;;; init.el ends here
