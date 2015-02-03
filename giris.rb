#!/usr/bin/env ruby
require_relative "sinifler"
require_relative "okumasinifi"

puts "Merhaba, yapacağınız işlemi seçiniz:"
puts "Kullanıcı girişi için : 1"
puts "Kayıt olmak için : 2"
islem=gets.chomp
aktif_kisi = nil
if islem=="1"
	print "Kullanıcı adı: "
	kullanici=gets.chomp
	print "Sifre: "
	sifre=gets.chomp
	dizi = Okuma.new("kisiler").kisiler
	dizi.each do |kisi|
 	  if kisi.kullanici_adi == kullanici && kisi.sifre == sifre	
		aktif_kisi = kisi
	  end
	end
	
	if aktif_kisi
		loop do
			puts "Hoşgeldin #{kullanici}"
			puts "Menülerden yapacağınız işlemi seçebilirsiniz :)"
			puts "Vücut Kitle İndeksi hesaplama için : 1"
			puts "İdeal kilo hesaplama için: 2"
			puts "Bugün ne yiyeceğini öğrenmek için : 3"
			puts "Bilgilerinizi güncellemek için : 4"
			puts "Çıkmak için : 5"
			islemi=gets.chomp
			if islemi == "1"
			  puts aktif_kisi.endeks
			elsif islemi == "2"
				puts aktif_kisi.ideal
			elsif islemi == "3"
				gidalar = []
				File.read("gida").each_line do |line|
					veriler = line.chop.split(".")
					gidalar << { id: veriler[0], ad: veriler[1], kal: veriler[2] }
        end
				puts "Yiyebileceğiniz gıdalar:"
				gidalar.each do |gida|
					dizi.each do |kisi|
 	  					if gida[:id] != kisi.hastalik						
								puts gida[:ad]
	  					end
					end
				end
			elsif islemi == "4"
				puts "Hangi bilgileri güncelleştirmek istiyorsunuz?"
				puts "Kullanıcı adı için : 1"
				puts "Şifre için : 2"
				puts "Kilo için : 3"
				puts "Boy için : 4"
				puts "Yaş için : 5"
				puts "Hastalık için : 6"
				is = gets.chomp.to_i
				
				case is
					when 1
						puts "Yeni kullanıcı adını giriniz: "
						adi = gets.chomp
						aktif_kisi.kullanici_adi= adi
					when 2
						puts "Yeni şifrenizi giriniz: "
						sifre = gets.chomp
						aktif_kisi.sifre= sifre
					when 3
						puts "Yeni kilonuzu giriniz: "
					  kilo = gets.chomp
						aktif_kisi.kilo = kilo
					when 4
						puts "Yeni boyunuzu giriniz: "
						boy = gets.chomp
						aktif_kisi.boy = boy
					when 5
						puts "Yeni yaşınızı giriniz: "
						yas = gets.chomp
						aktif_kisi.yas = yas
					when 6
						puts "Yeni hastalığınızı giriniz: "
						hastalik = gets.chomp
						aktif_kisi.hastalik = hastalik
				end
				aktif_kisi.sifirdan_kaydet
				puts "Başarılı"
			elsif islemi == "5"
				break
			else
				puts "Tekrar deneyiniz."
			end
				
		end
	else
		puts "Kullanıcı adı veya şifre hatalı !"
		
	
	end
elsif islem=="2"
	print " Kullanıcı Adı: "
	k_ad=gets.chomp
	print " Şifre: "
	sifre=gets.chomp
	print "Adınız: "
	ad=gets.chomp
	print "Soyadınız: "
	soyad=gets.chomp
	print "Cinsiyet(E/K): "
	cinsiyet=gets.chomp
	print "Kilo: "
	kilo=gets.chomp.to_i
	print "Boy: "
	boy=gets.chomp.to_f
	print "Yaş: "
	yas=gets.chomp
	print "Hastalığınız var mı? (E/H)"
	hasta=gets.chomp
	if hasta=="E"
		puts "Hastalığınızı seçiniz; Kalp için: 1 , Şeker için: 2"
		hastalik = gets.chomp
	end
	
isim1 = Kisi.new ([k_ad,sifre,ad,soyad,cinsiyet,kilo,boy,yas,hastalik])
isim1.kaydet
puts "Kayıt işlemi başarılı!!"
end


