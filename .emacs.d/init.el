(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;;(global-linum-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(setq ring-bell-function 'ignore)
(setq dired-listing-switches "-alh")

(setq inhibit-startup-screen t)

(setq cursor-type 'bar)
(icomplete-mode 1)

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-init-file)

(set-face-attribute 'default nil :height 160)

(load-theme 'wheatgrass t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://mirrors.zju.edu.cn/elpa/melpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'evil)
  (package-refresh-contents)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit evil cmake-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/elpa/compat")
(require 'compat)
