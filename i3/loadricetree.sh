!/bin/bash

i3-msg 'workspace "1: Home" ; append_layout ~/.config/i3/workspace1.i3'

(urxvt -blr 10x3 -tr -sh 35 +sb &)
(urxvt -blr 10x3 -tr -sh 35 +sb &)
(urxvt -blr 10x3 -tr -sh 35 +sb &)
(urxvt -blr 10x3 -tr -sh 35 +sb &)

i3-msg 'workspace "2: Browser" ; append_layout ~/.config/i3/workspace2.i3; exec firefox '

