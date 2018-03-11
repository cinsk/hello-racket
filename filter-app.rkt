#!/usr/bin/env racket
#lang racket/base

(require racket/path)
(require racket/string)
(require racket/cmdline)

(define program-name (path->string (file-name-from-path (find-system-path 'run-file))))

(define (error ecode format-spec . args)
  (let* ([msg (apply format format-spec args)]
         [last (string-ref msg (- (string-length msg) 1))])
    (flush-output (current-output-port))
    (fprintf (current-error-port) "~a: ~a\n" program-name msg)
    (flush-output (current-error-port))
    (unless (eq? ecode 0)
      (exit ecode))))


;;(printf "program: ~a\n" (find-system-path 'run-file))
;;(printf "args: ~a\n" (current-command-line-arguments))

;; (fprintf (current-error-port) ...)

;;(define in (open-input-file "tmp.data"))

;; (for ([l (in-lines in)])
;;   (match-let 
;;       ([(list a b c rest ...) (string-split l)])
;;     (if (string=? a "ubuntu")
;;         (printf "~a ~a ~a\n" a b c)
;;         #f)))

(define output-file (make-parameter "-"))
(define verbose-mode (make-parameter #f))

;;(define command-line-arguments '())
(define (parse-command-line)
  (command-line
   #:usage-help "Short description of the command\n"

                                        ; #:help-labels "group1"
   #:once-each
   [("-v" "--verbose") "enable verbose mode" (verbose-mode #t)]
   [("-o" "--output") out "set outputfile" (output-file out)]

                                        ; #:help-labels "group2"
   #:args files
   files))

(define output-port
  (if (string=? (output-file) "-")
      (current-output-port)
      (open-output-file (output-file))))

(define (main)
  (let [(arguments (parse-command-line))]
    (when (null? arguments)
      (set! arguments '("-")))
    (for-each (lambda (filename)
                (displayln (format "input: ~a" filename) output-port))
              arguments)))

(define (foo)
  (displayln "hello world"))

;; (define (main)
;;   (let [(arguments (parse-command-line))]
;;      (call-with-input-file (car command-line-arguments)
;;        (lambda (in)
;;          (for ([l (in-lines in)])
;;            (let* ([tokens (string-split l)]
;;                   [len (length tokens)])
;;              (if (and (equal? len 3)
;;                       (string=? (car tokens) "ubuntu"))
;;                  (apply fprintf (cons output-port (cons "~a ~a ~a\n" tokens)))
;;                  #f)))))


(module* main #f (main))

