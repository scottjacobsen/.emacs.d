(rvm-use-default)
(rvm-autodetect-ruby)
(add-hook 'ruby-mode-hook (lambda() (rvm-activate-corresponding-ruby)))
(add-hook 'enh-ruby-mode-hook (lambda() (rvm-activate-corresponding-ruby)))
