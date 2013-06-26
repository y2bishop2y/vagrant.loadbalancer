#===========================
#---------------------------
stage { [pre, post]: }

Stage[pre] -> Stage[main] -> Stage[post]

class { apt-hupdate: stage => pre }

include tree
include python
include nginx
include emacs 

include iptables::disable
include iscsid::disable




