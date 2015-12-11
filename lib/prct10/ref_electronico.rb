#clase hija electronico la cual contiene los elementos de su clase padre y los suyos propios


class Electronicos < Bibliografia
		
	attr_accessor :medio, :editor, :url, :acceso
	
	def initialize(autores, titulo, publicacion, edicion, medio, editor, url, acceso)
		
		super(autores, titulo, publicacion, edicion)
		
		@medio = medio
		@editor = editor
		@url = url
		@acceso = acceso
	end
	
	
	def to_s
		 "#{@autores} (#{@publicacion}). #{@titulo} (#{@edicion}), [#{@medio}]. #{@editor}. Disponible en: #{@url} [#{@acceso}].\n"
	end
end
