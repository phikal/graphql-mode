;;; graphql.el --- An Emacs mode for GraphQL         -*- lexical-binding: t; -*-

;; Copyright (C) 2016  David Vazquez Pua

;; Author: David Vazquez Pua <davazp@gmail.com>
;; Keywords: languages

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(require 'newcomment)

(defvar graphql-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?\" "\"" st)
    (modify-syntax-entry ?\# "<" st)
    (modify-syntax-entry ?\n ">" st)
    st))

(defvar graphql-font-lock-keywords
  (list (regexp-opt (list "type" "fragment"))

        (cons (regexp-opt (list "true" "false" "null"))
              'font-lock-constant-face)

        '("\\$\\w+" . font-lock-variable-name-face)))

(define-derived-mode graphql-mode prog-mode "GraphQL"
  ""
  (setq-local comment-start "# ")
  (setq-local comment-start-skip "#+[\t ]*")
  (setq font-lock-defaults
        (list 'graphql-font-lock-keywords
              nil
              nil
              nil)))

(add-to-list 'auto-mode-alist '("\\.graphql\\'" . graphql-mode))


(provide 'graphql)
;;; graphql.el ends here
