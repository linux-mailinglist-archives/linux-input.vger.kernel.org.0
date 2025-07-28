Return-Path: <linux-input+bounces-13702-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E78B1351E
	for <lists+linux-input@lfdr.de>; Mon, 28 Jul 2025 08:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B50663A2177
	for <lists+linux-input@lfdr.de>; Mon, 28 Jul 2025 06:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2637E221FBD;
	Mon, 28 Jul 2025 06:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="BF4zk4m0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0DD2C18A;
	Mon, 28 Jul 2025 06:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753685614; cv=none; b=GkDIfjwyDH+Ld5aBVcyynOnpKDKztBPDvZ9asmIXq3l3c82K/3oVBg4bYTEfyLhNr+dJxxWtgEwo69FA0eIRkMClqRMS/P7PdFM0WjhuVAV4j/ZaxxjGQGb/RDw3qJeQp3FyixoOqYDgSfK5uPtmCc3sEInCg6rovNX7cS8c1jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753685614; c=relaxed/simple;
	bh=eUYKVwinVJqY8C1LMcp3ZJ7bcgPDh5ssYDRCuKGBoQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M86vFkAp9K+9gDvR6M45FKDb2k5nAwbO63/LoS09G8SLHVWRZDe1qn8abJsYC/0YGXhSBT5oU9CYo1nkdKnJGOrx09IUUGxW1kulxw7DrbihcPS2Bsn8uw3swAb/CuWknt/7C9RrZQFl2wxZYmP/HKfiP2TCEVY1RgHAR2ofzAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=BF4zk4m0; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1753685560;
	bh=eUYKVwinVJqY8C1LMcp3ZJ7bcgPDh5ssYDRCuKGBoQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=BF4zk4m0Cfe0zCF3dE+Ven2KHXeMxa81g5hP5soNiJVn5nVgNj/E3Cp/jYdHpumm5
	 +KyqnvUhulqkf2dJf1PTM3tJu//eb3Bnh7HiDQWp948ob69sNIMYiHfpNS6ca/jZkF
	 RswWZFviHkvsXk1zl43NsQJ+gFgrHceWxgxdbqQQ=
X-QQ-mid: zesmtpip2t1753685502td22cd6f0
X-QQ-Originating-IP: nHBRBuTZQ1Wlyez3zPHVhNw9QiOisVVCyHKEyDssW+4=
Received: from [IPV6:240e:668:120a::212:232] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 28 Jul 2025 14:51:40 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11660296550804502737
EX-QQ-RecipientCnt: 12
Message-ID: <CBABEDA11FA3B6EF+c3f78605-e0d3-4a4d-a268-4af81422c071@uniontech.com>
Date: Mon, 28 Jul 2025 14:51:39 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] input: Add tracepoint support
To: Steven Rostedt <rostedt@goodmis.org>
Cc: dmitry.torokhov@gmail.com, guanwentao@uniontech.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 mhiramat@kernel.org, niecheng1@uniontech.com, wangyuli@deepin.org,
 zhanjun@uniontech.com, Winston Wen <wentao@uniontech.com>
References: <19571F312EE197A5+20250710072634.3992019-1-wangyuli@uniontech.com>
 <C1C54D7FA3DF3958+20250710073148.3994900-1-wangyuli@uniontech.com>
 <20250722202551.1614f59a@gandalf.local.home>
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
In-Reply-To: <20250722202551.1614f59a@gandalf.local.home>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZuqjbyJz8Op15mz2v1o3RySj"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MdnnQT6NjlK4C95FyCDbOZ6/R1lg5XqiHNpkrERsZpNbpzm821sD4+Og
	Epf/PCSLJlDsD2VLELuS+HNnNoLkT6zkHBAuCuRnO536aFR0ag7qAa54KnO77EgBcsRGiGz
	jjfyZFG8rJVLrJNaxJAw0iCRx2+7y+YL9hwl4KEx5T2ekLFWW2zvHpU9++XDZBdqCPGhQVF
	ijAgxyhzelPawQvImiTvN8bLzREPbBgKOGuFhJmvJp/83oN6hgH7mAYAKcgnQmJeZmwbtB+
	SsPTqNZfv0BeBNflrjnlAuV00UjFhLRdxgFpgJ62cio0czTpBoSdd1AwxtOxPHOWkyDGF7e
	dj/aRzWLvxkxQEqLeVB+q3wULzdjMW8mOVOA7uzwcpIpqUNrW/MRoRCyQOfl60rWQ2W6/Ro
	MfxsnkxVmrupc/MD02Z8GedC1+dS7GAqIrKuv+KcvBYnI8wB09VwoLQTDoE6C7Y4ZWLA3dk
	asST6r52nO8OvNhXQYW0253OiRQFaJoudB7EARi9krukHq3dK+U9eyjEgsSQZ1tJcGfo55O
	aDJ/oI2MpCtWK4xZ8OCDwqEcgTilOcP+hV5HhnV1qdM+QuM9pNAx0eDRP3qcYdhUYrZu0QT
	rXfrAx8pGfrWLaxGz7aLgkHQBi3XUoUKoklh6n1/HTHAKq3tHJQ5nWiJ0eB//V+otg4q7dK
	/VR66/JjGWfgp7cUaJqZlz6ZtHtNfOuAAebvR4uFt483/Ed0IpJWg271NqkQKhHXKPGve3N
	4yCdiW6nki4hnk1OKbPVxUSfjc7zq1gHB+UxB4ttcD671HJqtoA92sVKYhdRLQMg21VKExl
	h6Ma1EubjGvpNP5TGukY2cb5KsmK5Guqwsh4qNq5bmZ7bkXmG3uC0iuqJ5c41kuRUWRWUsa
	m2u8ViC4lD9jN6sQWwHQsFEdKMq92a0RFgb9o8pFspD3ey90ofUVPa3ELu2RE5amrxTt8mf
	1gsjEahN4mEftw5DQKrkkwqrX5aCRinZSuR9aWIUlF5GvXLDXzzDn3bqWi8+QcHzg2dVabD
	3I/xMVfoUzk15bv8LnGhs5sUGqF+KAEGSwPL1E1zReIhF4q0iKoHQTwgi1amwrhHrlcLGCa
	kJPgCFLOJfGtFHO0HvbCYo=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZuqjbyJz8Op15mz2v1o3RySj
Content-Type: multipart/mixed; boundary="------------Yr9mKkasfMZBBJ0f0HqT7M38";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: dmitry.torokhov@gmail.com, guanwentao@uniontech.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 mhiramat@kernel.org, niecheng1@uniontech.com, wangyuli@deepin.org,
 zhanjun@uniontech.com, Winston Wen <wentao@uniontech.com>
Message-ID: <c3f78605-e0d3-4a4d-a268-4af81422c071@uniontech.com>
Subject: Re: [PATCH 1/2] input: Add tracepoint support
References: <19571F312EE197A5+20250710072634.3992019-1-wangyuli@uniontech.com>
 <C1C54D7FA3DF3958+20250710073148.3994900-1-wangyuli@uniontech.com>
 <20250722202551.1614f59a@gandalf.local.home>
In-Reply-To: <20250722202551.1614f59a@gandalf.local.home>

--------------Yr9mKkasfMZBBJ0f0HqT7M38
Content-Type: multipart/mixed; boundary="------------NU7AxYzXihR4tfopA6uPUmVj"

--------------NU7AxYzXihR4tfopA6uPUmVj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU3RldmUsDQoNCk9uIDIwMjUvNy8yMyAwODoyNSwgU3RldmVuIFJvc3RlZHQgd3JvdGU6
DQo+PiArCVRQX1NUUlVDVF9fZW50cnkoX19zdHJpbmcobmFtZSwgZGV2LT5uYW1lID86ICJ1
bmtub3duIikgX19maWVsZCgNCj4+ICsJCXVuc2lnbmVkIGludCwgdHlwZSkgX19maWVsZCh1
bnNpZ25lZCBpbnQsIGNvZGUpDQo+PiArCQkJCSBfX2ZpZWxkKGludCwgdmFsdWUpIF9fZmll
bGQodTE2LCBidXN0eXBlKQ0KPj4gKwkJCQkJIF9fZmllbGQodTE2LCB2ZW5kb3IpDQo+PiAr
CQkJCQkJIF9fZmllbGQodTE2LCBwcm9kdWN0KSksDQo+PiArDQo+IFRoZSBjb250ZW50cyBv
ZiB0aGUgdHJhY2Vwb2ludHMgaW4gdGhlIHN1YnN5c3RlbXMgYXJlIGRldGVybWluZWQgYnkg
dGhlDQo+IHN1YnN5c3RlbSBtYWludGFpbmVycywgYnV0IHBsZWFzZSBmb2xsb3cgdGhlIHRy
YWNlcG9pbnQgZm9ybWF0dGluZy4gVGhlDQo+IGFib3ZlIGlzIGhvcnJpYmxlLiBJdCBzaG91
bGQgbG9vayBsaWtlIGEgc3RydWN0dXJlIGxheW91dC4gT25lIHdvdWxkbid0DQo+IHdyaXRl
Og0KPg0KPiBzdHJ1Y3QgZW50cnkgeyBjaGFyICpuYW1lOw0KPiAJCXVuc2lnbmVkIGludCB0
eXBlOyB1bnNpZ25lZCBpbnQgY29kZTsNCj4gCQkJaW50IHZhbHVlOyB1MTYgYnVzdHlwZTsN
Cj4gCQkJCXUxNiB2ZW5kb3I7DQo+IAkJCQkJdTE2IHByb2R1Y3Q7IH07DQo+DQo+IFRoYXQn
cyB3aGF0IHRoZSBhYm92ZSBsb29rcyBsaWtlLiBJdCBzaG91bGQgYmUgaW5zdGVhZDoNCj4N
Cj4gCVRQX1NUUlVDVF9fZW50cnkoDQo+IAkJX19zdHJpbmcoCW5hbWUsCQlkZXYtPm5hbWUg
PzogInVua25vd24iCSkNCj4gCQlfX2ZpZWxkKAl1bnNpZ25lZCBpbnQsCXR5cGUJCQkpDQo+
IAkJX19maWVsZCgJdW5zaWduZWQgaW50LAljb2RlCQkJKQ0KPiAJCV9fZmllbGQoCWludCwJ
CXZhbHVlCQkJKQ0KPiAJCV9fZmllbGQoCXUxNiwJCWJ1c3R5cGUJCQkpDQo+IAkJX19maWVs
ZCgJdTE2LAkJdmVuZG9yCQkJKQ0KPiAJCV9fZmllbGQoCXUxNiwJCXByb2R1Y3QJCQkpDQo+
IAkpLA0KPg0KPiBTbyB0aGUgZmllbGRzIGNhbiBiZSBlYXNpbHkgdmlzaWJsZSBhbmQgZWFz
aWx5IHJldmlld2VkLg0KDQpNeSBhcG9sb2dpZXMuDQoNClNpbmNlIHRoaXMgd2FzIGEgbmV3
IGZpbGUgSSBhZGRlZCwgSSBkaWRuJ3QgY2FyZWZ1bGx5IGNoZWNrIGl0IGFmdGVyIA0KYXBw
bHlpbmcgY2xhbmctZm9ybWF0LCB3aGljaCBsZWQgdG8gdGhpcyBpc3N1ZS4NCg0KSSdsbCBm
aXggdGhlIGNvZGUgZm9ybWF0dGluZyBhbmQgc2VuZCBhIHBhdGNoIHYyLg0KDQotLSANCldh
bmdZdWxpKg0KKg0K
--------------NU7AxYzXihR4tfopA6uPUmVj
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

--------------NU7AxYzXihR4tfopA6uPUmVj--

--------------Yr9mKkasfMZBBJ0f0HqT7M38--

--------------ZuqjbyJz8Op15mz2v1o3RySj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCaIcd+wUDAAAAAAAKCRDF2h8wRvQL7sNx
AP9NyWSiXMqwWmNPBy3hmq+3xypplYN3Emf8S86XxmyOsAD/VFnXQQi1Gl0fEkKI/EuvNjoUIFw7
hddmbU1QkHp9pQ0=
=jyK3
-----END PGP SIGNATURE-----

--------------ZuqjbyJz8Op15mz2v1o3RySj--

