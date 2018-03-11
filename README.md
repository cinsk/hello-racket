
hello-racket
============


Emacs
-----

The contents of this section assumes that you installed *geiser*, and optionally *racket-mode* and *company-mode*.

1. Open a racket file (`.rkt`), and do `C-c !` or `M-x geiser-mode-switch-to-repl`.
2. Typing `C-c !` again in the racket buffer will switch to existing REPL buffer if any.
3. In the REPL buffer, pressing `C-c C-m` or `M-x switch-to-geiser-module`, and enter "filename.rkt" to switch to that module.  (With double-quotation!).
   * Swithing to module may fail if the REPL process cannot parse the buffer content properly.
   * Note that `C-c C-m` only works in the REPL buffer, not a racket buffer.
   * Unless the REPL switched to proper module, you may not access evaluated result.
   * Or, you could use `,enter "FILENAME"` in the REPL buffer.
4. You can optionally enable `company-mode` for the auto-completion feature.
5. To terminate REPL process, press `C-c C-q` in the REPL buffer.

Here's list of eval commands available to a racket buffer:

* `C-x C-e` -- `geiser-eval-last-sexp`
* `C-c C-b` -- `geiser-eval-buffer`
* `C-c C-r` -- `geiser-eval-region`

You can browse the manual in a racket buffer:

* `C-c C-d TAB` `geiser-doc-look-up-manual` open racket reference manual (possible through a web browser) at point.
* `C-c C-d d` `geiser-doc-symbol-at-point` open other buffer for the docstring


License
-------

[WTFPL](http://www.wtfpl.net/about/) Version 2.
