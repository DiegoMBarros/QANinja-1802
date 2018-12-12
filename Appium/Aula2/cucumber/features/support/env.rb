require 'appium_lib'
require 'pry'

#1 - Saber quais caps queremos na nossa sessão (appium.txt) - Como o arquivo não está na mesma pasta, é necessário que se configure desta forma. No caso usa-se 0 '..'
caps_path = File.join(File.dirname(__FILE__), '..', '..', 'appium.txt')
caps = Appium.load_appium_txt file: caps_path, verbose: true
#2 - Criar um cliente e usar as caps
Appium::Driver.new caps, true

class AppiumWorld #Criar uma classe vazia
end

Appium.promote_appium_methods AppiumWorld #preencher a classe com os metodos padões do appium

World do #chamar a classe através do World do cucumber
    AppiumWorld.new
end

#3 - Iniciar a sessão
Before { $driver.start_driver }

#4 - Fechar a sessão
After { $driver.driver_quit }