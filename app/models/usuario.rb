#encoding: utf-8
class Usuario < ActiveRecord::Base
	has_many :productos, dependent: :destroy
	has_many :ofertas, dependent: :destroy
	has_many :comentarios, dependent: :destroy

	
	
	#------Validaciones---------
	#nombre: 	presencia, formato
	#alias:		presencia, formato, 		unico
	#password:	presencia
	#mail:		presencia, 					unico
	#telefono:	presencia, 			numero, unico
	#tarjeta: 	presencia, formato, 				tama�o
	
	#----Nuevos------------------
	#domicilio: presencia, ?		?		?		?
	#titular:	presencia, formato
	
	#Sacar comentarios post-migraciones
	validates_uniqueness_of :alias, :mail, :tel, message: " => Ya existe"
	validates_numericality_of :tel, message: " => Debe ser un numero"
	validates_presence_of :nombre, :password, :alias, :mail, :tel, :credit, :domicilio, :vencimiento, :titular, :nac, message: " => Debe completarse"
	validates_length_of :credit, minimum: 16, maximum: 16, message: " => Debe contener 16 digitos"
	validates :nombre,
		format: { with: /\A[a-zA-Z\s]+\z/, message: " => Solo puede tener letras y espacios" }
	validates :alias,
		format: { with: /\A[\w\.-]+\z/, message: " => Solo puede tener letras, numeros o -, ., _"  }
	validates :credit,
		format: { with: /\A[\d]+\z/, message: " => Solo puede tener digitos numericos" }
	validates :titular,
		format: { with: /\A[A-Z\s]+\z/, message: " => Solo puede tener letras mayusculas y espacios" }
	validates :domicilio,
		format: { with: /\A[\w\s]+\z/, message: " => Solo puede tener letras, numeros o espacios"  }
	#validates :mail,
		#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
		#format: { with: VALID_EMAIL_REGEX, message: "Debe tener el siguiente formato ing@comp.com" }

end