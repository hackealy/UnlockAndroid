Este script solicita que o usuário coloque o dispositivo em modo de teste digitando o código `#0#`, em seguida ativa a depuração USB usando o comando `adb shell settings put global adb_enabled 1`. Depois, o script verifica se a depuração USB está ativada usando o comando `adb devices` e remove as contas do Google sincronizadas e as configurações de sincronização usando os comandos `adb shell "pm list packages -d --user 0 | grep 'google' | cut -d':' -f2 | xargs -I {} sh -c 'adb shell pm uninstall --user 0 \"{}\"'"` e `adb shell settings put global auto_sync 0`, respectivamente.

Por fim, o script solicita que o usuário insira o link que deseja abrir e usa o comando `adb shell am start -a android.intent.action.VIEW -d "$link"` para abrir o link no navegador padrão do dispositivo.

O comando `adb` para realizar o hard reset em um dispositivo Android é:
adb shell recovery --wipe_data
