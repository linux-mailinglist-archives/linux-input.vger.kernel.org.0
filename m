Return-Path: <linux-input+bounces-13703-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA3DB13559
	for <lists+linux-input@lfdr.de>; Mon, 28 Jul 2025 09:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 089643AA440
	for <lists+linux-input@lfdr.de>; Mon, 28 Jul 2025 07:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B31A222577;
	Mon, 28 Jul 2025 07:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Eu4msL2k"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C611865FA;
	Mon, 28 Jul 2025 07:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753686587; cv=none; b=XlhWGfK/z1dgB6CRLt1LeiHBnykpPCM9rbbA1DhOsNzEWTTvgEPYBIOLCiljhzUnJBA4umo7Ut7FCVsU6MPHVUOFCBLNPZs8JNwBW64qoEGVt6dj9nvp+MZWtqJwfCWXPAXGCR+ZP5kCGPYvauCYjwITE9ZL1Hdcd33xNWhVlhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753686587; c=relaxed/simple;
	bh=r1bq8wBy0jTbwxVWUTT5R9m+mMw9313dzlfYQSQxnPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rh760vr82Qo886uK6f4ywgi09+3NiBNQaS4UqpM24H5OO6TcYNoxxceX0favO/tDcDJrxwcG7JZ77RwcxDYqwIiJ/Ysuw/lLYXfHgEenM5zhdymLrp2puwwSZYdNACfiX2Fxp6D5UlrxB2u9u+OZDDTmhEzjQZgEt4wM8WPlmMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Eu4msL2k; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1753686523;
	bh=r1bq8wBy0jTbwxVWUTT5R9m+mMw9313dzlfYQSQxnPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Eu4msL2k8vTCSyec58hN5OkM+FXUKU0miDL1uI/Qfuf7JjGGYi44W88AVoHMGuDrd
	 aNfWPa+OJbvL7tet8UXu5YWfBZUEEA0N4PGi62L9h8Q85XCvjwYA5hncGPi5RGGtJg
	 nEmMaAkXOKqFkMiKpfBSs0NHxvJUB/5sYU878Vxo=
X-QQ-mid: zesmtpip2t1753686464te6f70992
X-QQ-Originating-IP: YAb0L1vdO7c1PX6TQfjfsRKcKUJSJFnpoqeSNqaSGd8=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 28 Jul 2025 15:07:42 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4090114396778964496
EX-QQ-RecipientCnt: 12
Message-ID: <921F8D487468018A+141227fc-070d-4ed9-8828-d446236eccd2@uniontech.com>
Date: Mon, 28 Jul 2025 15:07:42 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] input: Add tracepoint support
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: dmitry.torokhov@gmail.com, guanwentao@uniontech.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mhiramat@kernel.org,
 niecheng1@uniontech.com, wangyuli@deepin.org, zhanjun@uniontech.com,
 Winston Wen <wentao@uniontech.com>
References: <19571F312EE197A5+20250710072634.3992019-1-wangyuli@uniontech.com>
 <C1C54D7FA3DF3958+20250710073148.3994900-1-wangyuli@uniontech.com>
 <20250722202551.1614f59a@gandalf.local.home>
 <2b31b238-667e-47b9-b61f-76832a1f77a7@efficios.com>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <2b31b238-667e-47b9-b61f-76832a1f77a7@efficios.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oHWYTD0dDJEH0jV4jUDKX0Al"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Mh7ao6TKkA3I1hoqrWn6m/sQVYAx8RWrFYGoY0yTiZ+70EzjZCuw/o6J
	GKL1hsQilLzvK8Ghlkqy+OYStvS65oHYMoQp5X/mK4XfHdhLiNZGmayNRkZ+lTkIlmBX8cI
	AvO8xysjCYJ0bovWK9jUIMz6He1uQdmpLdaFEAYInb0m/HBQ9DCucYPrbHMT/Y3UN/gxt+2
	DkAXlQPLt5XXhfQB7wSncyhf+1JhDOPjqd5cHvGtPNVO1XdtNvceb5rskyvD8zzKJ3cTlk6
	Z9sLBbGwbNrLoBGzGbqtd/n90K8a6DTmf5hgfcfJ1ovJgFqAs/uBlGRKbO+ibQXm69eUGtX
	MEZmIdGupuBUclzpDh1Ozu3bAWme8V3LZbQzx1iMFjVeubc+dqlFBfL/R1vkeJ+brj1xCX5
	gVr+TXCEX1mjbfbErdh6oUfa0brJ28D6J2R3jUg9cyNwqT+cZ/WpwG7V29paabWqByufzmq
	sgbAlnQKvHEvf+F2w4wHPjvlcyMHj+X1cUwPCQyxIAsFUtJI4w9Z1dPFtV39E9hhnxapOIB
	eW54v+dfCzrLToi0EW+9CrEP6QeJILqQTSvJuaT+pbSw5F0MOR2lBZRcihzVqxHtm8xn1PR
	I2ozM0s9Lvt4dP2d6RhVXpAczCcIfmaWg1G0ZImbjzbX9WY7pPmQj1X6dsQFJyDglrizyb4
	wCw4yxSV1YfomFxpf9Hd4Tv7pI2DLtS2BJPb2GOriYRd8tnferfG88E9HxyKIEWO5rN30qT
	U5YLEfQfP1YoQl5klYDwoTCYS4ONP5piScSq504AHtuiRueVaMPFw8rnQdhYQzL5GZHynFD
	qekq57fFpUZ2T/GjTSEKTyz7w9f6ARL8NIOGMZlBEnWCw+TtWwuZFkkftX6bJODC+9qEXVI
	szDnmsL4EyT7vD/+rs1m5vK6yTd+l2CHDg0WHLOsvhWYWMGo9ejU/DSZNjRLbvriXtL6Vbn
	cHcNHkV2EMKwCJmubYmnA3GsxpsLKiR54wRPV6TcjAMj2GPVK2OfWFt85+tBc0V8BTpJL51
	lB+FqdKMJHU+WsvvxDm5ElDa5V7dUwqhTSROTUOg0/Qod4x0TqJ270oXPJdZPW9BegRmLjk
	vP9URXiwNGYy9z9KGLx9UZ1ez4wLhRqIMQWvQvHWbfZni+xX1TGvgsul5i+y798Bg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oHWYTD0dDJEH0jV4jUDKX0Al
Content-Type: multipart/mixed; boundary="------------tqGbotQOjplZ0kezqXM5oZdY";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Steven Rostedt <rostedt@goodmis.org>
Cc: dmitry.torokhov@gmail.com, guanwentao@uniontech.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mhiramat@kernel.org,
 niecheng1@uniontech.com, wangyuli@deepin.org, zhanjun@uniontech.com,
 Winston Wen <wentao@uniontech.com>
Message-ID: <141227fc-070d-4ed9-8828-d446236eccd2@uniontech.com>
Subject: Re: [PATCH 1/2] input: Add tracepoint support
References: <19571F312EE197A5+20250710072634.3992019-1-wangyuli@uniontech.com>
 <C1C54D7FA3DF3958+20250710073148.3994900-1-wangyuli@uniontech.com>
 <20250722202551.1614f59a@gandalf.local.home>
 <2b31b238-667e-47b9-b61f-76832a1f77a7@efficios.com>
In-Reply-To: <2b31b238-667e-47b9-b61f-76832a1f77a7@efficios.com>

--------------tqGbotQOjplZ0kezqXM5oZdY
Content-Type: multipart/mixed; boundary="------------fc1I6wLPuEDOv0vTtM2yhlaM"

--------------fc1I6wLPuEDOv0vTtM2yhlaM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF0aGlldSwNCg0KT24gMjAyNS83LzIzIDA5OjI0LCBNYXRoaWV1IERlc25veWVycyB3
cm90ZToNCj4gSSd2ZSBhbHdheXMgYmVlbiB3b3JyaWVkIGFib3V0IGFkZGluZyB0cmFjZXBv
aW50IGluc3RydW1lbnRhdGlvbiBvZiB0aGUNCj4gaW5wdXQgc3Vic3lzdGVtIHRoYXQgaW5j
bHVkZXMgdGhlIGFjdHVhbCBrZXlzdHJva2VzIGludG8gdGhlIGV2ZW50DQo+IHBheWxvYWQu
IFdoYXQgSSdtIHRyeWluZyB0byBhdm9pZCBoZXJlIGlzIHBlb3BsZSBsZWFraW5nIHRoZWly
IHBhc3N3b3JkDQo+IGJ5IG1pc3Rha2UganVzdCBiZWNhdXNlIHRoZXkgaGFwcGVuZWQgdG8g
cmVjb3JkIGEgdHJhY2Ugd2hpbGUNCj4gdHlwaW5nIG9uIHRoZWlyIGtleWJvYXJkLg0KPg0K
VGhlIGV2dGVzdCB0b29sIGNhbiBhbHNvIGRvIHRoaXMuDQoNCkhvd2V2ZXIsIGl0IGRvZXNu
J3QgZnVsbHkgcmVwb3J0IGFsbCBldmVudHMgZnJvbSB0aGUgaW5wdXQgc3Vic3lzdGVtLg0K
DQogRnJvbSBhIGRlYnVnZ2luZyBwZXJzcGVjdGl2ZSwgYWRkaW5nIHRyYWNlcG9pbnRzIHRv
IHRoZSBpbnB1dCBzdWJzeXN0ZW0gDQppcyBzdGlsbCBtb3JlIGNvbnZlbmllbnQgZm9yIGRl
YnVnZ2luZy4NCg0KPiBJIGRvbid0IG1pbmQgaWYgdGhpcyBnZXRzIGVuYWJsZWQgd2l0aCBh
IG5ldyBrZXJuZWwgY29tbWFuZCBsaW5lDQo+IG9wdGlvbnMgInRyYWNpbmdfbGVha19teV9j
cmVkZW50aWFscz15ZXMiIG9yIHN1Y2gsIGJ1dCBJJ2QgdHJ5IHRvDQo+IGF2b2lkIG1ha2lu
ZyBpdCBlYXN5IHRvIGVuYWJsZSBieSBtaXN0YWtlIHVubGVzcyB0aGlzIGluZm9ybWF0aW9u
DQo+IGlzIHNwZWNpZmljYWxseSBuZWVkZWQuDQo+DQpJJ20gbm90IHN1cmUgaWYgdGhpcyBp
cyBvdmVyLWVuZ2luZWVyaW5nLi4uDQoNCkkgZmVlbCB0aGF0IGFkZGluZyB0b28gbWFueSBj
b21tYW5kLWxpbmUgcGFyYW1ldGVycyB3aWxsIGluY3JlYXNlIHRoZSANCnVzZXIncyBjb2du
aXRpdmUgbG9hZC4NCg0KSG93ZXZlciwgdGhlIGxlYWthZ2Ugb2Yga2V5Ym9hcmQgaW5wdXQg
cmVjb3JkcyBpcyBpbmRlZWQgYSB2ZXJ5LCB2ZXJ5IA0Kc2lnbmlmaWNhbnQgcmlzay4NCg0K
QXMgYSBjb21wcm9taXNlLCB3b3VsZCBpdCBiZSBiZXR0ZXIgaWYgd2UgYWRkZWQgYSBzZXBh
cmF0ZSBLY29uZmlnIA0Kb3B0aW9uIHNwZWNpZmljYWxseSBmb3IgdGhlIGlucHV0IHN1YnN5
c3RlbSdzIHRyYWNlcG9pbnRzIHRvIGRlY2lkZSANCndoZXRoZXIgdG8gZW5hYmxlIHRoZW0g
YXQgY29tcGlsZSB0aW1lLCBhbmQgdGhlbiBkb2N1bWVudGVkIHRoZSANCnBvdGVudGlhbCBy
aXNrcyB3aXRoaW4gdGhhdCBLY29uZmlnJ3MgZGVzY3JpcHRpb24/DQo+IEJ1dCBtYXliZSBJ
J20gYmVpbmcgdG9vIGNhcmVmdWwgYW5kIHBlb3BsZSBzaG91bGQgcmVhbGx5IGxlYXJuIG5v
dA0KPiB0byBzaGFyZSBrZXJuZWwgdHJhY2VzIHdpdGggb3RoZXJzLg0KPg0KPiBUaG91Z2h0
cyA/DQo+DQpUaGFua3MsDQotLSANCldhbmdZdWxpDQo=
--------------fc1I6wLPuEDOv0vTtM2yhlaM
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------fc1I6wLPuEDOv0vTtM2yhlaM--

--------------tqGbotQOjplZ0kezqXM5oZdY--

--------------oHWYTD0dDJEH0jV4jUDKX0Al
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCaIchvgUDAAAAAAAKCRDF2h8wRvQL7hIp
AP0btAUsJm8iM4VDC8j24xR1IrZgEhdWbQHnO71OaDmnyAD+IUcXJ0U8jot3sCQKFSoePfba2iW3
NEs1tBpw/2d3EwI=
=znwt
-----END PGP SIGNATURE-----

--------------oHWYTD0dDJEH0jV4jUDKX0Al--

