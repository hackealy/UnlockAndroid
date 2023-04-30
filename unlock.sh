bash
#!/bin/bash

# Solicita que o usuário coloque o dispositivo em modo de teste
read -p "Coloque o dispositivo em modo de teste pressionando *#0#* e depois pressione Enter para continuar"

# Ativa a depuração USB
adb shell settings put global adb_enabled 1

# Verifica se a depuração USB está ativada
if adb devices | grep "device$" > /dev/null; then
  echo "Depuração USB ativada com sucesso!"
else
  echo "Falha ao ativar a depuração USB"
  exit 1
fi

# Remove contas do Google sincronizadas
adb shell "pm list packages -d --user 0 | grep 'google' | cut -d':' -f2 | xargs -I {} sh -c 'adb shell pm uninstall --user 0 \"{}\"'"

# Remove as configurações de sincronização
adb shell settings put global auto_sync 0

# Solicita que o usuário insira o link a ser aberto
read -p "Insira o link que deseja abrir: " link

# Abre o link no navegador padrão do dispositivo
adb shell am start -a android.intent.action.VIEW -d "$link"
