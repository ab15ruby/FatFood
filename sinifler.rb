class Kisi
	attr_accessor :kullanici_adi, :sifre, :ad, :soyad, :yas, :cinsiyet, :kilo, :boy, :hastalik
	def initialize(veriler)
		fail ArgumentError unless veriler.is_a? Array
		@kullanici_adi,@sifre,@ad,@soyad,@yas,@cinsiyet,@kilo,@boy,@hastalik = *veriler
	end
	def satir
		"#{@kullanici_adi},#{@sifre},#{@ad},#{@soyad},#{@yas},#{@cinsiyet},#{@kilo},#{@boy},#{@hastalik}"
	end
	def kaydet
		File.open("kisiler","a") do |dosya|
			dosya.puts satir
		end
	end
  
	def Kisi.satir(satir)
		Kisi.new(satir.split(","))
	end
	def endeks
		kilo_endeks
	end	
	def ideal
		ideal_kilo
	end

	def self.kisiler
		kisiler = []
		File.open("kisiler","r") do |dosya|
			dosya.readlines.each do |satir| 
				kisiler << self.satir(satir.chomp)
			end
		end
		kisiler
	end
	private
	def kilo_endeks
		(@kilo.to_f / ((@boy.to_f/100)**2).round(2)).round
	end
	def ideal_kilo	
		(kilo_endeks*(@boy.to_i**2)).round
	end
end
