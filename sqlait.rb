require "sqlite3"

begin

	if File.exists?("base.db")
		db = SQLite3::Database.open "base.db"
		puts "Solo abrir y añado lo que me digas"
	else
		puts "Creando...con una primera entrada y luego ya añado"
		db = SQLite3::Database.new "base.db"
		db.execute "CREATE TABLE IF NOT EXISTS tablita(id INTEGER PRIMARY KEY, nombre TEXT, edad INTEGER)"
		db.execute "INSERT INTO tablita VALUES(Null,'Pocoyo',5)"
	end
	
	print "¿Nombre? "
	nombre = STDIN.gets.chomp()
	print "¿Edad? "
	edad= STDIN.gets.chomp()


	codigo = "INSERT INTO TABLITA VALUES(Null,'"+nombre+"',"+edad+")"
	puts  "Voy a ejecutar esto =>"+codigo	
	#puts codigo.class
	db.execute codigo
	
	#db.execute "CREATE TABLE IF NOT EXISTS tablita(id INTEGER PRIMARY KEY, nombre TEXT, edad INTEGER)"
	#db.execute "INSERT INTO tablita VALUES(1,'Pocoyo',5)"

	salida = db.execute "SELECT * FROM tablita"

	puts salida.class

	salida.each do |i|
		print "Registro:"
		puts i.join "->"
	end

	puts "\nYa esta"

		

rescue SQLite3::Exception => e
	
	print "Ha cascao y ahora te digo el error : "
	puts e

ensure

	db.close if db

end
