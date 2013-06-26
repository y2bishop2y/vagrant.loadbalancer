#=============================
#-----------------------------
class apt-hupdate {
  exec { "aptHupdate":
    command => "/usr/bin/apt-get update"
  }
}
