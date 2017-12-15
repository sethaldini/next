;;;; jump-heading.lisp --- functions to enable efficient heading traversal

(in-package :next)

(defparenstatic get-headings
  (defun qsa (context selector)
    "Alias of document.querySelectorAll"
    (ps:chain context (query-selector-all selector)))
  (let ((headings (qsa document "h1, h2, h3, h4, h5, h6")))
    (ps:chain -j-s-o-n (stringify
                        (loop for heading in headings
                           collect (ps:chain heading inner-text))))))
