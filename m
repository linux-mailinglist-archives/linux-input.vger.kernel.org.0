Return-Path: <linux-input+bounces-15689-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5EFC0441F
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 05:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30E1D3B2E8A
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 03:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6953222333B;
	Fri, 24 Oct 2025 03:32:55 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F87D4F5E0;
	Fri, 24 Oct 2025 03:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761276775; cv=none; b=me+3YbNrP90yMUgISb+jTTnMtALNPHwox9Bbf4pxTKtoorSyJZl8Szr9HwYh05+8lyZ9G2TQQvbbbTA29pXy/9+sSPAFcflEQD0Zu6dwC7mozBAwa/eeNUA1kgbSdmr+DYrBxdO38dvHGKeXJ34Mi3B6fuzDuclbfPcuzzqzkEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761276775; c=relaxed/simple;
	bh=QD4Cgeapsnrnp2n93Z54w8V979xx1t4+BbK7P0Lqqak=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=SfIHUcJdnLDV1npbN1xscgdUA3kzEIaPmp3UpOrLhmgMrgJPv8YUo+GBKHDvjTvV4dEickrK3jyIA4m8mG66Ys0OHbMc8goi2KKNNcNsaTzsjMQbrUza7/Uoqj+UYP45ajGg/GuLIIhaI/qeKoV6sX1VfDtgLu6L+IG8yCed/0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 16587800b08a11f0a38c85956e01ac42-20251024
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:cf144003-2c36-4a68-822c-cabf74fbedcd,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:5,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:5
X-CID-META: VersionHash:a9d874c,CLOUDID:e306fcf1116a5780e8993190dbfcd787,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102,TC:nil,Content:0|50,EDM:-3,
	IP:nil,URL:0,File:2|127,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 16587800b08a11f0a38c85956e01ac42-20251024
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 760713475; Fri, 24 Oct 2025 11:32:37 +0800
Content-Type: multipart/mixed; boundary="------------xuCn7F4P8OnNd8rjwF0VvNRA"
Message-ID: <8f0155d4-72a7-45ec-a272-7892e783bbed@kylinos.cn>
Date: Fri, 24 Oct 2025 11:32:33 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: quirks: Add device descriptor for 4c4a:4155
To: Terry Junge <linuxhid@cosmicgizmosystems.com>, jikos@kernel.org,
 bentiss@kernel.org, staffan.melin@oscillator.se
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 1114557@bugs.debian.org, stable@vger.kernel.org
References: <20250923022445.3276026-1-zhangheng@kylinos.cn>
 <e0dde746-3761-414e-8df1-eb8557cadbf8@cosmicgizmosystems.com>
 <e605f642-c967-4d41-8145-a10e8f48fb1b@kylinos.cn>
 <365f9f8e-549e-42e1-ac8c-7ff1f42c6977@cosmicgizmosystems.com>
From: zhangheng <zhangheng@kylinos.cn>
In-Reply-To: <365f9f8e-549e-42e1-ac8c-7ff1f42c6977@cosmicgizmosystems.com>

This is a multi-part message in MIME format.
--------------xuCn7F4P8OnNd8rjwF0VvNRA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Terry Junge，

I have made the changes as per your suggestion.
mic.txt is the microphone report descriptor and is working properly.




--------------xuCn7F4P8OnNd8rjwF0VvNRA
Content-Type: text/plain; charset=UTF-8; name="mic.txt"
Content-Disposition: attachment; filename="mic.txt"
Content-Transfer-Encoding: base64

a2xpbkB6aGFuZ2hlbmc6fi/moYzpnaIkIHN1ZG8gdXNiaGlkLWR1bXAgCjAwMTowMDg6MDAy
OkRFU0NSSVBUT1IgICAgICAgICAxNzYxMjc1ODE3LjI1MzEyMQogMDUgMDEgMDkgMDYgQTEg
MDEgMDUgMDcgMTkgRTAgMjkgRTcgMTUgMDAgMjUgMDEKIDc1IDAxIDk1IDA4IDgxIDAyIDk1
IDAxIDc1IDA4IDgxIDAxIDk1IDAzIDc1IDAxCiAwNSAwOCAxOSAwMSAyOSAwMyA5MSAwMiA5
NSAwMSA3NSAwNSA5MSAwMSA5NSAwNgogNzUgMDggMTUgMDAgMjYgRkYgMDAgMDUgMDcgMTkg
MDAgMkEgRkYgMDAgODEgMDAKIEMwCgo=
--------------xuCn7F4P8OnNd8rjwF0VvNRA
Content-Type: text/plain; charset=UTF-8;
 name="v3-0001-HID-quirks-Change-manufacturer-for-4c4a-4155.patch"
Content-Disposition: attachment;
 filename*0="v3-0001-HID-quirks-Change-manufacturer-for-4c4a-4155.patch"
Content-Transfer-Encoding: base64

RnJvbSA0ZDY3MGE3ODUyNzZhOGZkMTU2OGM5ZTdlNDAxNzk4MDliM2RkNWVjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBaaGFuZyBIZW5nIDx6aGFuZ2hlbmdAa3lsaW5vcy5j
bj4KRGF0ZTogRnJpLCAxMiBTZXAgMjAyNSAyMDozODoxOCArMDgwMApTdWJqZWN0OiBbUEFU
Q0ggdjNdIEhJRDogcXVpcmtzOiBDaGFuZ2UgbWFudWZhY3R1cmVyIGZvciA0YzRhOjQxNTUK
CkJhc2VkIG9uIGF2YWlsYWJsZSBldmlkZW5jZSwgdGhlIFVTQiBJRCA0YzRhOjQxNTUgdXNl
ZCBieSBtdWx0aXBsZQpkZXZpY2VzIGhhcyBiZWVuIGF0dHJpYnV0ZWQgdG8gSmllbGkuIFRo
ZSBjb21taXQgMWE4OTUzZjRmNzc0CigiSElEOiBBZGQgSUdOT1JFIHF1aXJrIGZvciBTTUFS
VExJTktURUNITk9MT0dZIikgYWZmZWN0ZWQgdG91Y2hzY3JlZW4KZnVuY3Rpb25hbGl0eS4g
QSBtYW51ZmFjdHVyZXIgY2hlY2sgd2FzIGFkZGVkIHRvIG1haW50YWluIG1pY3JvcGhvbmUK
Y29tcGF0aWJpbGl0eSwgZW5hYmxpbmcgYm90aCBkZXZpY2VzIHRvIGZ1bmN0aW9uIHByb3Bl
cmx5LgoKRml4ZXM6IDFhODk1M2Y0Zjc3NCAoIkhJRDogQWRkIElHTk9SRSBxdWlyayBmb3Ig
U01BUlRMSU5LVEVDSE5PTE9HWSIpCkNjOiBzdGFibGVAa2VybmVsLm9yZwpUZXN0ZWQtYnk6
IHN0YWZmYW4ubWVsaW5Ab3NjaWxsYXRvci5zZQpTaWduZWQtb2ZmLWJ5OiBaaGFuZyBIZW5n
IDx6aGFuZ2hlbmdAa3lsaW5vcy5jbj4KLS0tCiBkcml2ZXJzL2hpZC9oaWQtaWRzLmggICAg
fCAgNCArKy0tCiBkcml2ZXJzL2hpZC9oaWQtcXVpcmtzLmMgfCAxMSArKysrKysrKysrLQog
MiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1pZHMuaCBiL2RyaXZlcnMvaGlkL2hpZC1pZHMu
aAppbmRleCA1NzIxYjg0MTRiYmQuLjBiMWZmMWVjMjc1ZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9oaWQvaGlkLWlkcy5oCisrKyBiL2RyaXZlcnMvaGlkL2hpZC1pZHMuaApAQCAtMTUzOSw3
ICsxNTM5LDcgQEAKICNkZWZpbmUgVVNCX1ZFTkRPUl9JRF9TSUdOT1RFQwkJCTB4MjEzMwog
I2RlZmluZSBVU0JfREVWSUNFX0lEX1NJR05PVEVDX1ZJRVdTT05JQ19QRDEwMTEJMHgwMDE4
CiAKLSNkZWZpbmUgVVNCX1ZFTkRPUl9JRF9TTUFSVExJTktURUNITk9MT0dZICAgICAgICAg
ICAgICAweDRjNGEKLSNkZWZpbmUgVVNCX0RFVklDRV9JRF9TTUFSVExJTktURUNITk9MT0dZ
XzQxNTUgICAgICAgICAweDQxNTUKKyNkZWZpbmUgVVNCX1ZFTkRPUl9JRF9KSUVMSV9TREtf
REVGQVVMVAkJMHg0YzRhCisjZGVmaW5lIFVTQl9ERVZJQ0VfSURfSklFTElfU0RLXzQxNTUJ
CTB4NDE1NQogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1xdWlya3Mu
YyBiL2RyaXZlcnMvaGlkL2hpZC1xdWlya3MuYwppbmRleCBmZmQwMzQ1NjZlMmUuLjAwNThj
MDFhYThiMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9oaWQvaGlkLXF1aXJrcy5jCisrKyBiL2Ry
aXZlcnMvaGlkL2hpZC1xdWlya3MuYwpAQCAtOTEzLDcgKzkxMyw2IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgaGlkX2RldmljZV9pZCBoaWRfaWdub3JlX2xpc3RbXSA9IHsKICNlbmRpZgog
CXsgSElEX1VTQl9ERVZJQ0UoVVNCX1ZFTkRPUl9JRF9ZRUFMSU5LLCBVU0JfREVWSUNFX0lE
X1lFQUxJTktfUDFLX1A0S19CMkspIH0sCiAJeyBISURfVVNCX0RFVklDRShVU0JfVkVORE9S
X0lEX1FVQU5UQSwgVVNCX0RFVklDRV9JRF9RVUFOVEFfSFBfNU1QX0NBTUVSQV81NDczKSB9
LAotCXsgSElEX1VTQl9ERVZJQ0UoVVNCX1ZFTkRPUl9JRF9TTUFSVExJTktURUNITk9MT0dZ
LCBVU0JfREVWSUNFX0lEX1NNQVJUTElOS1RFQ0hOT0xPR1lfNDE1NSkgfSwKIAl7IH0KIH07
CiAKQEAgLTEwNjIsNiArMTA2MSwxNiBAQCBib29sIGhpZF9pZ25vcmUoc3RydWN0IGhpZF9k
ZXZpY2UgKmhkZXYpCiAJCQkJCSAgICAgc3RybGVuKGVsYW5fYWNwaV9pZFtpXS5pZCkpKQog
CQkJCQlyZXR1cm4gdHJ1ZTsKIAkJYnJlYWs7CisJY2FzZSBVU0JfVkVORE9SX0lEX0pJRUxJ
X1NES19ERUZBVUxUOgorCQkvKgorCQkgKiBNdWx0aXBsZSBVU0IgZGV2aWNlcyB3aXRoIGlk
ZW50aWNhbCBJRHMgKG1pYyAmIHRvdWNoc2NyZWVuKS4KKwkJICogVGhlIHRvdWNoIHNjcmVl
biByZXF1aXJlcyBoaWQgY29yZSBwcm9jZXNzaW5nLCBidXQgdGhlCisJCSAqIG1pY3JvcGhv
bmUgZG9lcyBub3QuIFRoZXkgY2FuIGJlIGRpc3Rpbmd1aXNoZWQgYnkgbWFudWZhY3R1cmVy
LgorCQkgKi8KKwkJaWYgKGhkZXYtPnByb2R1Y3QgPT0gVVNCX0RFVklDRV9JRF9KSUVMSV9T
REtfNDE1NSAmJgorCQkgICAgc3RybmNtcChoZGV2LT5uYW1lLCAiU21hcnRsaW5rVGVjaG5v
bG9neSIsIDE5KSA9PSAwKQorCQkJcmV0dXJuIHRydWU7CisJCWJyZWFrOwogCX0KIAogCWlm
IChoZGV2LT50eXBlID09IEhJRF9UWVBFX1VTQk1PVVNFICYmCi0tIAoyLjQ3LjEKCg==

--------------xuCn7F4P8OnNd8rjwF0VvNRA--

