@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\brigada\LR1\labels.tmp" -fI -W+ie -C V2E -o "C:\brigada\LR1\LR1.hex" -d "C:\brigada\LR1\LR1.obj" -e "C:\brigada\LR1\LR1.eep" -m "C:\brigada\LR1\LR1.map" "C:\brigada\LR1\LR1.asm"
