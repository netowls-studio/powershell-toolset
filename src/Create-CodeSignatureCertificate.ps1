﻿<#
 # *******************************************************************************************************************************************************
 # Copyright © 2006 - 2021 Wang Yucai. All rights reserved.
 # Licensed under the MIT License See LICENSE in the project root for license information.
 # *******************************************************************************************************************************************************
 #>

## 此脚本用于创建 PowerShell 自签名证书
## 作者：Wang Yucai
## 时间：2021-4-2 09:44:23

<#
	.SYNOPSIS
		创建 PowerShell 自签名证书。
	
	.DESCRIPTION
		创建 PowerShell 自签名证书。
	
	.PARAMETER DnsName
		证书适用于的 DNS 名称。
	
	.PARAMETER ExpireMonth
		证书在几个月之后过期。
	
	.PARAMETER KeySize
		证书密钥长度。
	
	.PARAMETER FriendlyName
		证书友好名称。
	
	.PARAMETER ExpiredMonth
		证书在几个月之后过期。
	
	.EXAMPLE
		PS C:\> .\Create-CodeSignatureCertificate.ps1
	
	.NOTES
		Additional information about the file.
#>
param
(
	[Parameter(HelpMessage = '证书适用于的 DNS 名称。')]
	[ValidateNotNullOrEmpty()]
	[Alias('DN')]
	[string]$DnsName = "developer.wangyucai.net",
	[Parameter(HelpMessage = '证书在几个月之后过期。')]
	[ValidateRange(1, 0)]
	[Alias('Expires')]
	[datetime]$ExpireMonth = 36,
	[Parameter(HelpMessage = '证书密钥长度。')]
	[ValidateSet('4096', '2048', '1024')]
	[Alias('Size')]
	[int32]$KeySize = 4096,
	[Parameter(HelpMessage = '证书友好名称。')]
	[ValidateNotNullOrEmpty()]
	[Alias('FN')]
	[string]$FriendlyName = 'PowerShell Code Signature'
)

$ExpireDate = (Get-Date).AddMonths($ExpireMonth)

New-SelfSignedCertificate -DnsName $DnsName -CertStoreLocation Cert:\CurrentUser\My -NotAfter $ExpireDate -KeyLength $KeySize -Type CodeSigningCert -FriendlyName $FriendlyName



# SIG # Begin signature block
# MIIhkwYJKoZIhvcNAQcCoIIhhDCCIYACAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBpR06w1696kp0F
# IS4JnMGQ69qBOyWWC1om/S85g7EiOKCCGsMwggNfMIICR6ADAgECAgsEAAAAAAEh
# WFMIojANBgkqhkiG9w0BAQsFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3Qg
# Q0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2ln
# bjAeFw0wOTAzMTgxMDAwMDBaFw0yOTAzMTgxMDAwMDBaMEwxIDAeBgNVBAsTF0ds
# b2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYD
# VQQDEwpHbG9iYWxTaWduMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
# zCV2kHkGeCIW9cCDtoTKKJ79BXYRxa2IcvxGAkPHsoqdBF8kyy5L4WCCRuFSqwyB
# R3Bs3WTR6/Usow+CPQwrrpfXthSGEHm7OxOAd4wI4UnSamIvH176lmjfiSeVOJ8G
# 1z7JyyZZDXPesMjpJg6DFcbvW4vSBGDKSaYo9mk79svIKJHlnYphVzesdBTcdOA6
# 7nIvLpz70Lu/9T0A4QYz6IIrrlOmOhZzjN1BDiA6wLSnoemyT5AuMmDpV8u5BJJo
# aOU4JmB1sp93/5EU764gSfytQBVI0QIxYRleuJfvrXe3ZJp6v1/BE++bYvsNbOBU
# aRapA9pu6YOTcXbGaYWCFwIDAQABo0IwQDAOBgNVHQ8BAf8EBAMCAQYwDwYDVR0T
# AQH/BAUwAwEB/zAdBgNVHQ4EFgQUj/BLf6guRSSuTVD6Y5qL3uLdG7wwDQYJKoZI
# hvcNAQELBQADggEBAEtA28BQqv7IDO/3llRFSbuWAAlBrLMThoYoBzPKa+Z0uboA
# La6kCtP18fEPir9zZ0qDx0R7eOCvbmxvAymOMzlFw47kuVdsqvwSluxTxi3kJGy5
# lGP73FNoZ1Y+g7jPNSHDyWj+ztrCU6rMkIrp8F1GjJXdelgoGi8d3s0AN0GP7URt
# 11Mol37zZwQeFdeKlrTT3kwnpEwbc3N29BeZwh96DuMtCK0KHCz/PKtVDg+Rfjbr
# w1dJvuEuLXxgi8NBURMjnc73MmuUAaiZ5ywzHzo7JdKGQM47LIZ4yWEvFLru21Vv
# 34TuBQlNvSjYcs7TYlBlHuuSl4Mx2bO1ykdYP18wggVHMIIEL6ADAgECAg0B8kBC
# QM79ItvpbHH8MA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24g
# Um9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9i
# YWxTaWduMB4XDTE5MDIyMDAwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEgMB4GA1UE
# CxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24x
# EzARBgNVBAMTCkdsb2JhbFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQCVB+hzymb57BTKezz3DQjxtEULLIK0SMbrWzyug7hBkjMUpG9/6SrMxrCI
# a8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDKRN5zlE7zp4l/T3hjCMgS
# UG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEGxb7ibTIG
# ph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndh
# fuDqjDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1X
# kvp+vFAEYzTfa5MYvms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFv
# VIrxclZuLojFUUJEFZTuo8U4lptOTloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZ
# kZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4LsgizYWYJarEGOmWWWcDwNf3J
# 2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiDD9H/3zAR+YXP
# M0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
# DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo4IBJjCC
# ASIwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFK5s
# BaOTE+Ki5+LXHNbH8H/IZ1OgMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i
# 3Ru8MD4GCCsGAQUFBwEBBDIwMDAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmds
# b2JhbHNpZ24uY29tL3Jvb3RyMzA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3Js
# Lmdsb2JhbHNpZ24uY29tL3Jvb3QtcjMuY3JsMEcGA1UdIARAMD4wPAYEVR0gADA0
# MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0
# b3J5LzANBgkqhkiG9w0BAQwFAAOCAQEASaxexYPzWsthKk2XShUpn+QUkKoJ+cR6
# nzUYigozFW1yhyJOQT9tCp4YrtviX/yV0SyYFDuOwfA2WXnzjYHPdPYYpOThaM/v
# f2VZQunKVTm808Um7nE4+tchAw+3TtlbYGpDtH0J0GBh3artAF5OMh7gsmyePLLC
# u5jTkHZqaa0a3KiJ2lhP0sKLMkrOVPs46TsHC3UKEdsLfCUn8awmzxFT5tzG4mE1
# MvTO3YPjGTrrwmijcgDIJDxOuFM8sRer5jUs+dNCKeZfYAOsQmGmsVdqM0LfNTGG
# yj43K9rE2iT1ThLytrm3R+q7IK1hFregM+Mtiae8szwBfyMagAk06TCCBUswggMz
# oAMCAQICEGxM8p1dRYe/TKhIDrxBmTUwDQYJKoZIhvcNAQELBQAwJTEjMCEGA1UE
# AwwabmV0b3dscy1zdHVkaW9Ab3V0bG9vay5jb20wHhcNMjEwNDAyMDExMTEyWhcN
# MjQwOTE1MTU1OTU5WjAlMSMwIQYDVQQDDBpuZXRvd2xzLXN0dWRpb0BvdXRsb29r
# LmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAMFzTEsknngRC1Xn
# m7Q1FRc+9ENb0GGAMHL//hf46/8vDxVRXG0NNNu9oSWB11j8Lxmty/vGLyoLlE7p
# 39bGrAI4y8p/yiRY6GWUHFh6xX49aN0DhK3ZSpleEc+DSUk7bc/u+TFJhii4BrNq
# 4YrnRDWo8ovmif33MAFziBkC/FfkQlSGP+nzDaJ5LOvLPJ07+FdtBzPhagRHx2XG
# zOEs3m3ABdl30LOo6kVSq0Q4SlG5EqYNZ3RKnFVuTaywKMCswbtdCyIf8S6wA52t
# 3hV4vaIzAzIqxgK4l7ZAsiek/AB2yrOc3bnY2b/vG5tXdqOa+VROKAQrSLUR8VEG
# Uz+w+976A0/6aKA8XziSMgOW29MuDyyVA1vpAGe/pLTM22jOdkhE69A21qEOCk4b
# x5O25OoMnO9UVgRgTd2Es0BLXkkf6TsKJYTY1q2fa/MpPQavGpriGNWWXnu5nwSm
# ZuXtXhnVxKH9d+bEZg4QxAkm4GWGuDsiF8jagbLmWv3mBw6jY0I2ka3jmXn0rOzD
# y10nKVQOaY6lrVUxudoSy1oM8cpkCU8I+U3AG3zAArolN0KRazbKKBjq0gBCm36Y
# PFJXvD/5GctZCdRsAkxx6jk699gFNk4YTGTt0CEx58FtdCacssF3npAZBPb7Yayy
# DMjaBgjgDBc3ehXpJYfbxMtwwaB5AgMBAAGjdzB1MA4GA1UdDwEB/wQEAwIFoDAd
# BgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwEwJQYDVR0RBB4wHIIabmV0b3ds
# cy1zdHVkaW9Ab3V0bG9vay5jb20wHQYDVR0OBBYEFPx5FCuij/IFNFXbfwUvYjzu
# 9jngMA0GCSqGSIb3DQEBCwUAA4ICAQC/3+/M6TzZdFUTMRL+UEwPLv1Ej9z8Nnrl
# vkWjpvfQ9beGOCr2OlXLqLALZqL30hco2cwhcpWdLw51JN7EihGfOI/UqBdMUGOx
# ZFdMEXSxdMTBqdbC/mXFN3qN1VGRy0K5ZV8EsNO3ecDucXf6GechUt+FA83WSmIe
# B3lJEDnAwdP1GxSm3sIVC248Rhhtd6TdeOdGjsITdaODDop509dzlpCw11xSYoTg
# LSynY72bOiAoQVoOCUvg5+eZroPXZiTO+Xdy9ru6gcdhTFOzg0XWrg4s6WwMNo7I
# KlogIUFyGgK1nxb+LH/vsE263ztxkU1Jk5qmzcZrYEOX75WaEN6UWJxN5qT+9qeU
# bk9Q6/fZ9p4lZ1p2OVbpCcCTYYB0hjyWeEEYX4/M++dSHQLoAfxMuMO4k/8cLzmg
# yG8sEJJITakFcj2/7TMO8UW5FNHzZEss+ZpLXBihr917scP2SMCZyANne/9Rq6f3
# ZnFgEDJWG+ID7prC4Vrud69ZkJkIF3464N1Y0S1ja/w4sUMS1RC2cREh4HThxaOR
# 26AFvZHyR9Dwk1GKXO/AyBHm93nQJp2Cg+MUTt5iNvMb1G7E9N+2XJNBi8aDsuQq
# Cy+wF5h/JFnVqhQHEFAyXq/OJVQxDyu468ftGqBr3jvpOojJHxqO+Unm11uJFeve
# tPcAlibt9DCCBlkwggRBoAMCAQICDQHsHJJA3v0uQF18R3QwDQYJKoZIhvcNAQEM
# BQAwTDEgMB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoT
# Ckdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2JhbFNpZ24wHhcNMTgwNjIwMDAwMDAw
# WhcNMzQxMjEwMDAwMDAwWjBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFs
# U2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBUaW1lc3RhbXBpbmcgQ0Eg
# LSBTSEEzODQgLSBHNDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAPAC
# 4jAj+uAb4Zp0s691g1+pR1LHYTpjfDkjeW10/DHkdBIZlvrOJ2JbrgeKJ+5Xo8Q1
# 7bM0x6zDDOuAZm3RKErBLLu5cPJyroz3mVpddq6/RKh8QSSOj7rFT/82QaunLf14
# TkOI/pMZF9nuMc+8ijtuasSI8O6X9tzzGKBLmRwOh6cm4YjJoOWZ4p70nEw/XVvs
# tu/SZc9FC1Q9sVRTB4uZbrhUmYqoMZI78np9/A5Y34Fq4bBsHmWCKtQhx5T+QpY7
# 8Quxf39GmA6HPXpl69FWqS69+1g9tYX6U5lNW3TtckuiDYI3GQzQq+pawe8P1Zm5
# P/RPNfGcD9M3E1LZJTTtlu/4Z+oIvo9Jev+QsdT3KRXX+Q1d1odDHnTEcCi0gHu9
# Kpu7hOEOrG8NubX2bVb+ih0JPiQOZybH/LINoJSwspTMe+Zn/qZYstTYQRLBVf1u
# kcW7sUwIS57UQgZvGxjVNupkrs799QXm4mbQDgUhrLERBiMZ5PsFNETqCK6dSWcR
# i4LlrVqGp2b9MwMB3pkl+XFu6ZxdAkxgPM8CjwH9cu6S8acS3kISTeypJuV3AqwO
# VwwJ0WGeJoj8yLJN22TwRZ+6wT9Uo9h2ApVsao3KIlz2DATjKfpLsBzTN3SE2R1m
# qzRzjx59fF6W1j0ZsJfqjFCRba9Xhn4QNx1rGhTfAgMBAAGjggEpMIIBJTAOBgNV
# HQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQU6hbGaefj
# y1dFOTOk8EC+0MO9ZZYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6Aw
# PgYIKwYBBQUHAQEEMjAwMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFs
# c2lnbi5jb20vcm9vdHI2MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xv
# YmFsc2lnbi5jb20vcm9vdC1yNi5jcmwwRwYDVR0gBEAwPjA8BgRVHSAAMDQwMgYI
# KwYBBQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkv
# MA0GCSqGSIb3DQEBDAUAA4ICAQB/4ojZV2crQl+BpwkLusS7KBhW1ky/2xsHcMb7
# CwmtADpgMx85xhZrGUBJJQge5Jv31qQNjx6W8oaiF95Bv0/hvKvN7sAjjMaF/ksV
# JPkYROwfwqSs0LLP7MJWZR29f/begsi3n2HTtUZImJcCZ3oWlUrbYsbQswLMNEhF
# Vd3s6UqfXhTtchBxdnDSD5bz6jdXlJEYr9yNmTgZWMKpoX6ibhUm6rT5fyrn50hk
# aS/SmqFy9vckS3RafXKGNbMCVx+LnPy7rEze+t5TTIP9ErG2SVVPdZ2sb0rILmq5
# yojDEjBOsghzn16h1pnO6X1LlizMFmsYzeRZN4YJLOJF1rLNboJ1pdqNHrdbL4gu
# PX3x8pEwBZzOe3ygxayvUQbwEccdMMVRVmDofJU9IuPVCiRTJ5eA+kiJJyx54jzl
# mx7jqoSCiT7ASvUh/mIQ7R0w/PbM6kgnfIt1Qn9ry/Ola5UfBFg0ContglDk0Xuo
# yea+SKorVdmNtyUgDhtRoNRjqoPqbHJhSsn6Q8TGV8Wdtjywi7C5HDHvve8U2BRA
# bCAdwi3oC8aNbYy2ce1SIf4+9p+fORqurNIveiCx9KyqHeItFJ36lmodxjzK89kc
# v1NNpEdZfJXEQ0H5JeIsEH6B+Q2Up33ytQn12GByQFCVINRDRL76oJXnIFm2eMak
# aqoimzCCBmUwggRNoAMCAQICEAEYeIPv9D5AQszFgZoFuYcwDQYJKoZIhvcNAQEL
# BQAwWzELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExMTAv
# BgNVBAMTKEdsb2JhbFNpZ24gVGltZXN0YW1waW5nIENBIC0gU0hBMzg0IC0gRzQw
# HhcNMjEwMTI4MTEwNDE3WhcNMzIwMzAxMTEwNDE3WjBjMQswCQYDVQQGEwJCRTEZ
# MBcGA1UECgwQR2xvYmFsU2lnbiBudi1zYTE5MDcGA1UEAwwwR2xvYmFsc2lnbiBU
# U0EgZm9yIE1TIEF1dGhlbnRpY29kZSBhZHZhbmNlZCAtIEc0MIIBojANBgkqhkiG
# 9w0BAQEFAAOCAY8AMIIBigKCAYEAppXTSWtYja0sHWAlkCJczsONdVVHhcdL92fw
# WQBrVLrqpXV809/pAAA/0CiwtzkANwYTmldMhjbDZKxpPF1LUI7VOREDfl0a5gui
# QJMvHGXFPQbYsowpWRZHAQ3ojlHjQhqWMm5nZfqlStohSsmRb+XFUheRkKlbGjlG
# TWLtTQfldEzxKg9X8LJ4cr+hqdHjxBJFU2GOzH7hqqovZCVh/mNT9fg0LUzbrnUY
# 2FUTwZLN9AW7elHovhTx+XhV/BS8+MxGIg/2byuOnWdAERVPJqiTLGtLA4LigoBE
# Sc25ghqUefDdjkAAZWheXO2sOIhotUvdAEdX/kCFh31YCqsCQ4eLmabsp0Y35Amq
# kKiag79AGu/4K9tbpQ3uCrK4Ek4ez/zOohVXuzLKsxM+oFFct6cGKt1kFwsflU+7
# O/hayZb55z+7K3KHEpVRDQE2KBPm0J2CaRgSNSjlxrYDGXtrH4fW2w7ww2yugkJu
# 6H0vC9K7ZAqTYNaaCAgtTrM4Jh4NAgMBAAGjggGbMIIBlzAOBgNVHQ8BAf8EBAMC
# B4AwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwHQYDVR0OBBYEFA8RhDqdy6Xf2Pp5
# einvnwebAr0sMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEeMDQwMgYIKwYBBQUHAgEW
# Jmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQC
# MAAwgZAGCCsGAQUFBwEBBIGDMIGAMDkGCCsGAQUFBzABhi1odHRwOi8vb2NzcC5n
# bG9iYWxzaWduLmNvbS9jYS9nc3RzYWNhc2hhMzg0ZzQwQwYIKwYBBQUHMAKGN2h0
# dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzdHNhY2FzaGEzODRn
# NC5jcnQwHwYDVR0jBBgwFoAU6hbGaefjy1dFOTOk8EC+0MO9ZZYwQQYDVR0fBDow
# ODA2oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9jYS9nc3RzYWNhc2hh
# Mzg0ZzQuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQCRGQamIdb4gdQ4ILnKFSfY07yj
# LiR8piPyiVdV1X1tqt0NZLpiVDiuOiMx19/Q0mKwD944gf2TRumWfs5xDYJtmQe6
# 38Y3vah+GJZGPDRzbLzyfQY6/upOezEjHHm+3oYV7UhpKOfLMyIEgp+itUkcPW6m
# j1Dg3AxWQy9B0vwqAJuTN4M5k5nDNdDIhHnbT3jBrFg3dL0aDJOd/uZR4id6O7CX
# OCLOdWRDNK3hqGI1JaEEs++8SjCF0G3lqe0wRPIKrJAxXI69JGqT8hV7NcTiYskD
# 1Kbba6HWS7lFaPdOFwbgsfZ9fgKQ0nvpJPi6++REz7Lb/0F6aW/z8HGk9ARZeA9x
# wdzB7YTyzwIT8ANRY5ZCGhucV4XhRmWrxEpeDVsvIpoAeLsJm0ljDlolSyxg4rzZ
# RwKYGbTHyJi5Ha299AzjZN60do7GzdJ34lUwgsIsihwwuddT8Sx01Ui1zVj1r2/s
# bIcFrVjWsQYLrqa9pN49FngRODBsIZMdOXnEqOqWPdswuTzBRND/Ec/SXJ+nT29V
# P88cIBQdtqAMVvtYgvdjXgtfDw3S0fg0nTeddDwpzOnaJOQCYICxkpqBkUxItVC2
# Lu8/Zt3p8zcN+w1Duu0WhoYslO0nUJkoqVl00sVi7gTDOZImQ+WwRY+OntED5Z5A
# yJGXFB7ibWbOjrtIbTGCBiYwggYiAgEBMDkwJTEjMCEGA1UEAwwabmV0b3dscy1z
# dHVkaW9Ab3V0bG9vay5jb20CEGxM8p1dRYe/TKhIDrxBmTUwDQYJYIZIAWUDBAIB
# BQCgTDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQg
# 7286fUTvXIo9Qhir+nFGM4fizrSsVnGJISLVPyxtchUwDQYJKoZIhvcNAQEBBQAE
# ggIAgrJI/SCOHclvQ+I/94GVN1ZD3Oby8ZDCMoulqMkz+4lXvn8l6WxVYK7FalIl
# rrN4/EcehkUo0y5HicVq74O5eh3rvAMdns1imBdo94nOKICcuMXtkX9S7qOzPVPK
# CAzQHR6Fj+PhsxKl7F1gCNQ0SgP82Lpeqhvn8+dth/baV2HwtvZzqx1PaUNlEpKj
# PVx0Ggah03RMcIqHIIWDf8+i3IgLQxxSV8aQ2TbpojdSqFWl1GEucVTst/swXCSC
# EiLW182TxgiMTaqcfJJnY5Jk50WHKBhpTZY6jff27m9RYF+yPPA5ubHInwKDI80A
# 51+Aet3fxDsoc+DBK22fk1ALKCiIMgeHChR9wqyjeaZ/PhMcz6QwG4i0tz+LZXQv
# OObWyeeG1Ncjzckd+ppp5TZ2SKN1d+5hpUHpAevZDXteHvo8zo40A2OK0QGqK9oH
# gizHsZiMhml+rRvbYF1XHbzSGfTxL5xTuFwKj2XaQm4xhO6p9K0QsDyrwKd7m6GB
# /elZe2bxuUNGc44BNn4RaYwkWY0hDOcMKCSeeDC8OWy3542/TmGBgKzVSFG440aI
# 3BIuckXzIW++0Vhp9e6Q5xcx8g/c3fsUk5yzi5GL6fG9if8uQIj/2CeYugrk5SN0
# tq33RbvkT5Rem0O5Ynxiah9EjPAzkXRmEcU7vjJ/W4C5Z7ihggNwMIIDbAYJKoZI
# hvcNAQkGMYIDXTCCA1kCAQEwbzBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xv
# YmFsU2lnbiBudi1zYTExMC8GA1UEAxMoR2xvYmFsU2lnbiBUaW1lc3RhbXBpbmcg
# Q0EgLSBTSEEzODQgLSBHNAIQARh4g+/0PkBCzMWBmgW5hzANBglghkgBZQMEAgEF
# AKCCAT8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcN
# MjEwNDAyMDI0NTM0WjAtBgkqhkiG9w0BCTQxIDAeMA0GCWCGSAFlAwQCAQUAoQ0G
# CSqGSIb3DQEBCwUAMC8GCSqGSIb3DQEJBDEiBCA+4I/6Xx5EpvZmdBAPjhGx8mQo
# y0jNawTxKRuWm6XuSzCBpAYLKoZIhvcNAQkQAgwxgZQwgZEwgY4wgYsEFHCARsJo
# OLyLBYEfaQ+pq4iBjUj3MHMwX6RdMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBH
# bG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIFRpbWVzdGFtcGlu
# ZyBDQSAtIFNIQTM4NCAtIEc0AhABGHiD7/Q+QELMxYGaBbmHMA0GCSqGSIb3DQEB
# CwUABIIBgJ4n4cV58oW/DtnG6GYGm/Jt5LUFDOdhfeLoNVdkCxwMFOYOhAtuFafB
# 2eOUIGo8bsaH7XLYfkZ91a/fUNY2D1R3mx/OODdvBbPd15AgTS1va9vXMiCENs98
# HPWJ1n+jJ2Oqddl4jbd8Tub020HwtOTpDBs9ak0B9GHFh+4spa6ETvzv8mjH1RbJ
# 0vXVnbKQWxpiCwHhFfa4PHz7p+SFEB07HPE/lKnDG4krnpn5tXJuBq5Ej06jmat3
# rB7f0i2NE74IrtXRJYgLaZx+3ivzUo9EMdKqWzr+qvr7Fu0/arLqqmW5XKcpcmkp
# rXlhgR5Za0thQDqDz//P+VYlYmWOpb/YxDBM9b1qHfj/nFzaSSjhfhXvSMfwZx8J
# DK3pRDUnBANnHCicYxWJ7/ydvPYYVTYj13ZEX+shfRvheHPO2bCeFzUn4nljjYoB
# +JSpDs1H/tBEvT9/OVc43JNzH8CxUZ5pQDr3Z4JFXKcMAn2gBtXpmXKtojSxHN2A
# /kl33lQtbQ==
# SIG # End signature block