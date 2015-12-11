#Clase padre para las bibliografia tanto de los libros como revistas periodicos entre otras cosas

class Bibliografia

    attr_accessor :autores , :titulo , :publicacion, :edicion #geters y serters 
    
    include Comparable  #Insercion del modulo comparable.

    def initialize(autores, titulo, publicacion, edicion) #el constructor solo contiene los elementos comunes a ambas clases hijas
        @autores = Autores_format_apa (autores)
       
        @titulo = Titulo_format_apa (titulo)
        
        @publicacion = publicacion
        @edicion = edicion
    end

    def <=>(other)

	if(@autores == other.autores)
		
			if(@titulo == other.titulo)
						return 0 
			else
				    arr = [@titulo, other.titulo]
				    arr.sort_by!{|t| t.downcase}
					
					if(arr.first == @titulo)
						return 1
					end
					    return -1
			end

        else

			arr = [@autores, other.autores]
			arr.sort_by!{|t| t.downcase}
			
			if(arr.first == @autores)
				return -1
			end
    			return 1
        end
		
    end
	
	def ==(other)
		
		if other.is_a?Bibliografia
		    
		    @titulo == other.titulo && @autores == other.autores && @publicacion == other.publicacion && @edicion == other.edicion
		
		else
		    false
		end
	end
	
	def Titulo_format_apa (other) # con la siguiente line conseguimos que el titulo y el subtitulo tenga todas las primeras letras en mayusculas
	    t = other.split(" ").map(&:capitalize).join(" ") #t -->variable para almacenar el titulo con la primera letra en mayuscula
	    return t
	end
	
	def Autores_format_apa(other)
	    
	    string=""
        other.each do |a|
				
			vec = a.split(/\W+/)
			string+=vec[1]
			string+=", "
				
				unless vec[2].nil?
					string+=vec[2][0]
					string+=". "
				end
				
			string+=vec[0][0]
			string+="."
			string+=" & " unless a == other.last
		end
			
        return string

	end
	
end