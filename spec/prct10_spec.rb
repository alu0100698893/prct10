require 'spec_helper'
require 'prct10/bibliografia'
require 'prct10/doble_list'
require 'prct10/ref_revista'
require 'prct10/ref_libro'
require 'prct10/ref_periodico'
require 'prct10/ref_electronico'

describe Bibliografia do

  before :each do
    #referencias almacenadas como objetos de la clase Bibliografias
    @libro_1 = Revistas.new(["Lionel Messi","Xavi Hernandez"],"Histria de un pasado: Los dioses del futbol","28 July 2016","1","132","15","Sport","Barcelona")
    @libro_2 = Libros.new(["Dennis Chelistamsky"],"pro git 2009th edition. (pro)","August 27, 2009","2","96","O’Reilly Media")
    @libro_3 = Revistas.new(["Dior Flanagan", "Yahato Matsumoto"],"the ruby programming language","February 4, 2008","3","vol. 45","10","Sciense","McHill")
    @libro_4 = Libros.new(["Sara Chacon", "Dani Astels", "Barto Helmkamp"],"the rspec book: behaviour driven development","December 25, 2010","4","78","O’Reilly Media")
    @libro_nuevo = Libros.new(["Alberto Martinez","Noel Cole"],"El arte de la informatica","12 Mayo 2016","1","2","Santillana") 
    @revista = Revistas.new(["Franklin Rusbell"],"La politica y su lado oscuro","6 Enero 1996","16","132","31","Politica","New York") 
    @periodico = Periodico.new(["Pepe Villuela"],"El club de la comedia","14 Febrero 2010","Mundo deportivo","2")
    @doc_electronico = Electronicos.new(["Juan Villuela"],"La moda hipster","12 Abril 2015","1","web","La casa amarilla","www.lacasaamarilla.com","2015,2,6")
  end

    #Pruebas con la lista y con los nodos
  describe Doble_lista do
  
    before :each do
      #Nodos que contienen las referencias para hacer las pruebas
      @nodo1 = Nodo.new(@libro_1)
      @nodo2 = Nodo.new(@libro_2)
      @nodo3 = Nodo.new(@libro_3)
      @nodo4 = Nodo.new(@libro_4)

      @lista = Doble_lista.new
      
      @lista_1 = Doble_lista.new
      @lista_1.insert_head(@nodo1)
      @lista_1.insert_head(@nodo2)
      @lista_1.insert_head(@nodo3)
      @lista_1.insert_head(@nodo4)
      
      
     
      
    end

    describe "Nodo" do
   
      it "#Debe existir un Nodo de la lista con sus datos y su siguiente" do
        expect(@nodo1.class).to eq(Nodo)
      end 
  
    end
  
    describe "Lista" do

      it "#Se extrae el primer elemento de la lista" do
        @lista.insert_head(@nodo1)
        expect(@lista.remove_head()).to eq(@nodo1.value)
      end
    
      it "#Se puede insertar un elemento" do
     	    @lista.insert_head(@nodo2)
     	    expect(@lista.head.value).to eq(@nodo2.value)
     end

      it "#Debe existir una lista con su cabeza" do
        @lista.insert_head(@nodo2)
        expect(@lista.head.class).to eq(Nodo)
      end

      
    end
  end
  
  describe Revistas do  #Pruebas con la clase hija revistas
  
    before :each do
      @revista = Revistas.new(["Joseph Martin"],"isolation, indentification and synthesis of the sex attractant of gypsy moth","Oct. 14, 1960","first edition","vol. 132","n. 3433","Sciense","New York")
    end
    
    it "#El objeto pertenece a la clase" do
      expect(@revista.class).to eq(Revistas)
    end
    
    it "#El objeto pertenece a la jerarquia" do
      expect(@revista.class.superclass).to eq(Bibliografia)
    end
    
    it "#El objeto pertenece a la clase Object" do
      @revista.is_a? Object
    end
    
     it "#El objeto pertenece a la clase BasicObject" do
      @revista.is_a? BasicObject
    end
    
  end

  describe Libros do  #Pruebas con la clase hija libros
  
    before :each do
      @libro = Libros.new(["Dennis Chelistamsky"],"pro git 2009th edition. (pro)","August 27, 2009","2","96","O’Reilly Media")
    end
    
    it "#El objeto pertenece a la clase" do
      @libro.class == Libros
    end
    
    it "#El objeto pertenece a la jerarquia" do
      expect(@libro.class.superclass).to eq(Bibliografia)
    end
    
     it "#El objeto pertenece a la clase Object" do
      @libro.is_a? Object
    end
    
     it "#El objeto pertenece a la clase BasicObject" do
      @libro.is_a? BasicObject
    end
    
  end
  
  describe "#Modulo comparable" do
    
    it "#La referencia 1 es menor que la referencia 2" do
      expect(@libro_1.autores[0] < @libro_2.autores[0]).to eq(false)
      expect(@libro_3.autores[0] < @libro_1.autores[0]).to eq(true)
      expect(@libro_3.autores[0] < @libro_4.autores[0]).to eq(false)
      expect(@libro_4.autores[0] < @libro_1.autores[0]).to eq(true)
      expect(@libro_4.autores[0] < @libro_2.autores[0]).to eq(false)
    end 
    
    it "#La referencia 1 es mayor que la referencia 2" do
      expect(@libro_1.autores[0] > @libro_2.autores[0]).to eq(true)
      expect(@libro_3.autores[0] > @libro_1.autores[0]).to eq(false)
      expect(@libro_3.autores[0] > @libro_4.autores[0]).to eq(true)
      expect(@libro_4.autores[0] > @libro_1.autores[0]).to eq(false)
      expect(@libro_4.autores[0] > @libro_2.autores[0]).to eq(false)
    end
    
    it "#La referencia 1 es igual que la referencia 2" do
      expect(@libro_1.autores[0] == @libro_2.autores[0]).to eq(false)
    end
    	
    it "#La referencia 1 es menor igual que la referencia 2" do
      expect(@libro_1.autores[0] <= @libro_2.autores[0]).to eq(false)
    end
    	
    it "#La referencia 1 es mayor igual que la referencia 2" do
      expect(@libro_1.autores[0] >= @libro_2.autores[0]).to eq(true)
    end
    
  end
  
  describe "#Programacion Funcional"do
    before :each do
      @nodo1 = Nodo.new(@libro_1)
      @nodo2 = Nodo.new(@libro_2)
      @lista_2 = Doble_lista.new #lista para comprobar que esta ordenada
      @lista_2.insert_head(@nodo1)
      @lista_2.insert_head(@nodo2)
    end
      
    it "#Existe un metodo para ordenar y este ordena correctamente" do
      
        expect(@lista_2.to_s).to eq("Chelistamsky, D. (August 27, 2009). Pro Git 2009th Edition. (pro) (2) (96). O’Reilly Media.\nMessi, L. & Hernandez, X. (28 July 2016). Sport. En (Eds.), Histria De Un Pasado: Los Dioses Del Futbol (15) (1) (132). Barcelona\n") 
      
    end
    
     it "Impresion de nombre y apellido correcta" do
        expect(@libro_nuevo.autores).to eq("Martinez, A. & Cole, N.")
        expect(@revista.autores).to eq("Rusbell, F.")
        
    end
    
    it "Impresion del titulo de manera correcta" do
        expect(@periodico.titulo).to eq("El Club De La Comedia")
         expect(@doc_electronico.titulo).to eq("La Moda Hipster")
    end
  end
  
  describe "#El metodo comparable funciona de manera correcta" do
    
    before :each do
      @nodo1 = Nodo.new(@libro_1)
      @nodo2 = Nodo.new(@libro_2)
      @nodo3 = Nodo.new(@periodico)
      @nodo4 = Nodo.new(@doc_electronico)
      @lista_2 = Doble_lista.new #lista para comprobar que esta ordenada
      @lista_3 = Doble_lista.new #lista para comprobar que ordenamos por el titulo
      @lista_2.insert_head(@nodo1)
      @lista_2.insert_head(@nodo2)
      @lista_3.insert_head(@nodo3)
      @lista_3.insert_head(@nodo4)
    end
    
    it "#Ordenar solo en base al autor" do
      
       expect(@lista_2.to_s).to eq("Chelistamsky, D. (August 27, 2009). Pro Git 2009th Edition. (pro) (2) (96). O’Reilly Media.\nMessi, L. & Hernandez, X. (28 July 2016). Sport. En (Eds.), Histria De Un Pasado: Los Dioses Del Futbol (15) (1) (132). Barcelona\n") 
      
    end
    
    it "#Si los autores coinciden, ordenar en base al titulo" do
       expect(@lista_3.to_s).to eq("Villuela, P. (14 Febrero 2010). El Club De La Comedia. Mundo deportivo, pp. 2.\nVilluela, J. (12 Abril 2015). La Moda Hipster (1), [web]. La casa amarilla. Disponible en: www.lacasaamarilla.com [2015,2,6].\n")
    end
    
  end
  
  
  
  
  
end

  