#Использовать cli
#Использовать fs
#Использовать logos

Перем Лог;

Процедура ОписаниеКоманды(Команда) Экспорт

	Команда.Опция("t tempdir", "", "Путь к каталогу временных файлов");	
		
	Команда.Аргумент("SRC", "", "Путь папке исходных файлов");	
	Команда.Аргумент("NAME", "", "Имя расширения (-Extension)");	
	Команда.Аргумент("OUTPUT", "", "Путь к выходному файлу конфигурации (.cf)");

КонецПроцедуры

Процедура ВыполнитьКоманду(Знач Команда) Экспорт
	
	ИмяФайлаРасширения 		= Команда.ЗначениеАргумента("SRC");
	ИмяРасширения 			= Команда.ЗначениеАргумента("NAME");
	ИмяФайлаКонфигурации 	= Команда.ЗначениеАргумента("OUTPUT");
	КаталогВременныхФайлов 	= Команда.ЗначениеОпции("tempdir");

	Конвертор = Новый КонверторРасширений();

	Конвертор.ИсходныйПуть 				= ИмяФайлаРасширения;
	Конвертор.ИмяРасширения 			= ИмяРасширения;
	Конвертор.ИмяФайлаКонфигурации 		= ИмяФайлаКонфигурации;
	Конвертор.КаталогВременныхФайлов 	= КаталогВременныхФайлов;
	
	Конвертор.ВыполнитьПреобразованиеИзИсходныхФайловРасширения();
	
	УдалитьФайлы(Конвертор.КаталогВременныхФайлов);

	Конвертор.Лог.Информация(СтрШаблон("ОПЕРАЦИЯ ЗАВЕРШЕНА"));
	
КонецПроцедуры

Лог = Логирование.ПолучитьЛог("oscript.lib.cfe2cf.test");