#===============================
# Installs the passed in version of emacs. Handles the
# Case where it needs to install from source vs package
# management.
#-------------------------------
class emacs($version = '24.2') {

  package { "emacs":
    ensure  => installed,
  }
}
