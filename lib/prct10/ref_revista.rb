#clase hija revistas la cual contiene los elementos propios de la bibliografia y los comunes de la clase padre

class Revistas < Bibliografia
    
    attr_accessor :volumen, :paginas, :t_articulo, :editor 
    
    def initialize(autores, titulo, publicacion, edicion, volumen, paginas, t_articulo, editor)
        
        super(autores,titulo,publicacion,edicion)
        
        @volumen = volumen
        @t_articulo = t_articulo
        @paginas = paginas
        @editor = editor
       
    end
    
    
    
    def to_s
         "#{@autores} (#{@publicacion}). #{@t_articulo}. En (Eds.), #{@titulo} (#{@paginas}) (#{@edicion}) (#{@volumen}). #{@editor}\n"
    end
    
end