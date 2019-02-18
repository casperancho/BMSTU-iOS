@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\brigada\LR1Zak\labels.tmp" -fI -W+ie -C V2E -o "C:\brigada\LR1Zak\LR1Zak.hex" -d "C:\brigada\LR1Zak\LR1Zak.obj" -e "C:\brigada\LR1Zak\LR1Zak.eep" -m "C:\brigada\LR1Zak\LR1Zak.map" "C:\brigada\LR1Zak\LR1Zak.asm"
