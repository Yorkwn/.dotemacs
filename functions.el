;; -*- lexical-binding: t; -*-

;;Not really needs a function but for organization purposes.
(defun gk/kill-buffer ()
  (interactive)
  (kill-this-buffer))

;;I'd like to have an option to delete before the cursor
(defun gk/kill-line-backwards ()
  (interactive)
  (kill-line 0))

(defun gk/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
		   (format "%.2f seconds"
				   (float-time
					(time-subtract after-init-time before-init-time)))
		   gcs-done))
