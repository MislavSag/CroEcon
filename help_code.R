## help code to move public file to Cpanel
if (file.exists('public.zip')) {
  file.remove('public.zip')
}
# if (dir.exists('public')) {
#   unlink('public')
# }
# blogdown::build_site()
blogdown::hugo_build()
blogdown::serve_site()
# REASTART R!!
setwd("D:/data/R/CroEconSite")
files2zip <- dir('public', full.names = TRUE)
zip(zipfile = "public", files = files2zip)

# send public.zip to server
library(RCurl)
ftpUpload("D:/data/R/CroEconSite/public.zip", 
          "ftp://ftp.odvjetnistvo-sagovac.hr/public.zip", 
          userpwd = "croecon.contentio.biz@odvjetnistvo-sagovac.hr:Theanswer0207")

# unzip, and rename
library(pbdRPC)
m <- machine(hostname = "91.234.46.219", 
             user = "odvjet12",
             pport = 22L,
             priv.key.ppk = 'D:/data/R/CroEconSite/id_rsa.ppk')
# .pbd_env$RPC.CT$use.shell.exec <- FALSE
rpc(
  m, 
  'cd public_html; rm -rf croecon.contentio.biz; unzip public.zip; mv public croecon.contentio.biz; rm -rf public.zip'
  )

#-----------------------#
#     MAILING LISTA     #
#-----------------------#

# #send email
# library(mailR)
# sender <- "mislav.sagovac@contentio.biz"
# recipients <- c("mislav.sagovac@contentio.biz", "luka.sikic@pilar.hr",
#                 "gduudac@gmail.com", "vsonje@icloud.com", "tgloban@efzg.hr",
#                 "Jadranka.Svarc@pilar.hr", "Drago.Cengic@pilar.hr",
#                 "Sasa.Boric@pilar.hr", "guste.santini@rifin.com",
#                 "djurlina@eizg.hr", "bskrinjaric@eizg.hr",
#                 "kdumicic@efzg.hr", "kott@ijf.hr", "holzner@wiiw.ac.a",
#                 "gligorov@wiiw.ac.at", "vuksic@wiiw.ac.at", "holzner@wiiw.ac.at",
#                 "zkordej@eizg.hr", "bskrinjaric@eizg.hr", "izilic@eizg.hr",
#                 "Filip.Majetic@pilar.hr", "jtica@efzg.hr",
#                 "antun.sagovac@zg.t-com.hr", "kreso.perackovic@pilar.hr",
#                 "marinko.skare@unipu.hr", "varcabic@efzg.hr"
#                 )
# it <- c("mspremic@efzg.hr", "mpejic@efzg.hr", "boris.zitnik@omniaconsult.hr", "vidovic@wiiw.ac.at",
#         "vsrica@efzg.hr")
# financije <- c("thorvatinovic@net.efzg.hr", "mturuk@efzg.hr", "epecina@efzg.hr", "dzoricic@efzg.hr",
#                "ddolinar@efzg.hr", "dmilos@efzg.hr", "ldedi@efzg.hr", "sorsag@efzg.hr")
# macro <- c("nela.vlahinic.lenz@efri.hr", "bruno.coric@efst.hr", "nstojcic@unidu.hr",
#            "mladen.vedris@pravo.hr", "dtomic@unipu.hr", "sanja.blazevic.buric@unipu.hr",
#            "romina.prziklas.druzeta@unipu.hr", "sasa.stjepanovic@unipu.hr")
# zupanije <- c("s.kozic@zagrebacka-zupanija.hr", "hrvoje.frankic@zagrebacka-zupanija.hr",
#               "nadica.zuzak@zagrebacka-zupanija.hr", "m.ostrec_bosak@zagrebacka-zupanija.hr",
#               "zupan@kckzz.hr", "darko.sobota@kckzz.hr", "ratimir.ljubic@kckzz.hr",
#               "marijan.stimac@kckzz.hr", "info@medjimurska-zupanija.hr", "zupan@vzz.hr",
#               "tomislav.paljak@vzz.hr", "robert.vugrin@vzz.hr", "natalija.martincevic@vzz.hr",
#               "dragutin.vincek@vzz.hr", "zupan@smz.hr",
#               "gradonacelnik@rijeka.hr", "doris.sajn@rijeka.hr", "iva.novak-zeoli@rijeka.hr",
#               "marija.loncaric@rijeka.hr", "irena.mijaljevic@rijeka.hr", "tomislav.petrovic@rijeka.hr",
#               "mario.konic@vegora.hr", "marina.protic@split.hr", 
#               "ines.golijanin@split.hr", "antonia.maletic@split.hr", "jurica.vojnovic@split.hr"
#               )
# 
# noviPost <- readline(prompt = "Link na post: ")
# 
# recipients <- c(recipients)
# recipients <- c(recipients, financije)
# pozdrav <- if (lubridate::hour(Sys.time()) < 11) {"Dobro jutro,"} else {"Dobar dan, "}
# for (i in 1:(length(recipients))) {
#   send.mail(from = sender,
#             to = recipients[i],
#             subject = "CroeCon: novi post",
#             body = paste0(pozdrav, 
#                           
# "Pogledajte novi post: ",
# noviPost,
#                           
# " 
#  Ukoliko ne želite primati obavijesti o novim postovima, molim Vas da mi javite,
# kako bih Vas maknuo s mail liste.
#             
# Srdačan pozdrav,
#             
# CroEcon")
#             , 
#             encoding = "utf-8",
#             smtp = list(host.name = "mail.contentio.biz", port = 25, 
#                         user.name = "mislav.sagovac+contentio.biz",            
#                         passwd = "Contentio0207"),
#             authenticate = TRUE,
#             send = TRUE)
# }