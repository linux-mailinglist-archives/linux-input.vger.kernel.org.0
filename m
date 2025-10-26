Return-Path: <linux-input+bounces-15726-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 31829C0A233
	for <lists+linux-input@lfdr.de>; Sun, 26 Oct 2025 04:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C73C344FE9
	for <lists+linux-input@lfdr.de>; Sun, 26 Oct 2025 03:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994CF1D5154;
	Sun, 26 Oct 2025 03:34:44 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6391A314F;
	Sun, 26 Oct 2025 03:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761449684; cv=none; b=MtukDg0FMZqgLG/hQ27uDkyaPcUx4lseqHIu50jkRQNtUgBMj3VTrPzU0QYnnDS+wRmBhtRJXvgj8NjLPNIeDs48Hb6qCU1GJBNfRG92buZ63ZMhHBos7Pi+cJKUS1hXNt9XVgOiwSMuk0rQPNmhryVjREP/kmiAkCm3NNJrSH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761449684; c=relaxed/simple;
	bh=Y1I09DJiUO/uNIaF1NKLu6n6yAYxBTZ1RW/dPuXEPIs=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=sz3OXqtsH9I4rVaB/wd6QpGlNyk5nGKiy6nsaUAFfxX64m/4RK+EyrhsA5qJfHsUDDm1SeZFVgkmzkzYtF16uUDdjz+MjlkC1TR2Fxz+BrXOq8Pbf5XrBWU5i73ObG6mnSUlOI7VHrEKZhL/cxSaHt2mHVlwZZ9BkRZfDG51K7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ab1349d2b21c11f0a38c85956e01ac42-20251026
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:44b6f9c3-6290-4886-a7e6-3bd9357fd70c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:5,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:5
X-CID-META: VersionHash:a9d874c,CLOUDID:4e5baa1b11c108ec7ff3b7b96f6dc9a6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|817,TC:nil,Content:-10|-8|-5|5
	0,EDM:-3,IP:nil,URL:0,File:2|127,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab1349d2b21c11f0a38c85956e01ac42-20251026
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1971309412; Sun, 26 Oct 2025 11:34:24 +0800
Content-Type: multipart/mixed; boundary="------------EG8zjlNRNjcQWj3EtsGJp8Qt"
Message-ID: <e765d91f-3c00-4dc5-ac24-68a5512a0c12@kylinos.cn>
Date: Sun, 26 Oct 2025 11:34:21 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4] HID: quirks: Change manufacturer for 4c4a:4155
To: Terry Junge <linuxhid@cosmicgizmosystems.com>, jikos@kernel.org,
 bentiss@kernel.org, staffan.melin@oscillator.se
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 1114557@bugs.debian.org, stable@vger.kernel.org
References: <20250923022445.3276026-1-zhangheng@kylinos.cn>
 <e0dde746-3761-414e-8df1-eb8557cadbf8@cosmicgizmosystems.com>
 <e605f642-c967-4d41-8145-a10e8f48fb1b@kylinos.cn>
 <365f9f8e-549e-42e1-ac8c-7ff1f42c6977@cosmicgizmosystems.com>
 <8f0155d4-72a7-45ec-a272-7892e783bbed@kylinos.cn>
 <c7aab08b-52fa-41ef-a7fb-118298bb93aa@cosmicgizmosystems.com>
From: zhangheng <zhangheng@kylinos.cn>
In-Reply-To: <c7aab08b-52fa-41ef-a7fb-118298bb93aa@cosmicgizmosystems.com>

This is a multi-part message in MIME format.
--------------EG8zjlNRNjcQWj3EtsGJp8Qt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

--------------EG8zjlNRNjcQWj3EtsGJp8Qt
Content-Type: text/plain; charset=UTF-8;
 name="v4-0001-HID-quirks-Change-manufacturer-for-4c4a-4155.patch"
Content-Disposition: attachment;
 filename*0="v4-0001-HID-quirks-Change-manufacturer-for-4c4a-4155.patch"
Content-Transfer-Encoding: base64

RnJvbSAwMWJlMGUzMWI0ZmQ5OTFmOTU1Zjc3ZWMwNmQwYzhiN2E2ZDBmYjEzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBaaGFuZyBIZW5nIDx6aGFuZ2hlbmdAa3lsaW5vcy5j
bj4KRGF0ZTogRnJpLCAxMiBTZXAgMjAyNSAyMDozODoxOCArMDgwMApTdWJqZWN0OiBbUEFU
Q0ggdjRdIEhJRDogcXVpcmtzOiBDaGFuZ2UgbWFudWZhY3R1cmVyIGZvciA0YzRhOjQxNTUK
CkJhc2VkIG9uIGF2YWlsYWJsZSBldmlkZW5jZSwgdGhlIFVTQiBJRCA0YzRhOjQxNTUgdXNl
ZCBieSBtdWx0aXBsZQpkZXZpY2VzIGhhcyBiZWVuIGF0dHJpYnV0ZWQgdG8gSmllbGkuIFRo
ZSBjb21taXQgMWE4OTUzZjRmNzc0CigiSElEOiBBZGQgSUdOT1JFIHF1aXJrIGZvciBTTUFS
VExJTktURUNITk9MT0dZIikgYWZmZWN0ZWQgdG91Y2hzY3JlZW4KZnVuY3Rpb25hbGl0eS4g
QWRkZWQgY2hlY2tzIGZvciBtYW51ZmFjdHVyZXIgYW5kIHNlcmlhbCBudW1iZXIgdG8KbWFp
bnRhaW4gbWljcm9waG9uZSBjb21wYXRpYmlsaXR5LCBlbmFibGluZyBib3RoIGRldmljZXMg
dG8gZnVuY3Rpb24KcHJvcGVybHkuCgpGaXhlczogMWE4OTUzZjRmNzc0ICgiSElEOiBBZGQg
SUdOT1JFIHF1aXJrIGZvciBTTUFSVExJTktURUNITk9MT0dZIikKQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKVGVzdGVkLWJ5OiBzdGFmZmFuLm1lbGluQG9zY2lsbGF0b3Iuc2UKU2ln
bmVkLW9mZi1ieTogWmhhbmcgSGVuZyA8emhhbmdoZW5nQGt5bGlub3MuY24+Ci0tLQpDaGFu
Z2VzIGluIHY0OgotLSBhZGQgc2VyaWFsIG51bWJlci4gU2luY2UgSSBzYXcgSklFTEkgdXNp
bmcgaWRlbnRpY2FsIElEcyBmb3IgZGlmZmVyZW50CmRldmljZXMgd2l0aCBkaXN0aW5jdCBz
ZXJpYWwgbnVtYmVycywgSSB3b3JyeSBTTUFSVExJTktURUNITk9MT0dZIG1pZ2h0CnJldXNl
IHRoaXMgSUQgZm9yIHRvdWNoc2NyZWVucy4gQWRkaW5nIHNlcmlhbCBudW1iZXIgdmVyaWZp
Y2F0aW9uIHByb3ZpZGVzCmV4dHJhIGluc3VyYW5jZS4KIGRyaXZlcnMvaGlkL2hpZC1pZHMu
aCAgICB8ICA0ICsrLS0KIGRyaXZlcnMvaGlkL2hpZC1xdWlya3MuYyB8IDEzICsrKysrKysr
KysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtaWRzLmggYi9kcml2ZXJzL2hpZC9o
aWQtaWRzLmgKaW5kZXggNjZmMDVkMDJjZmNhLi41ZTZlODc0ODcyMDUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvaGlkL2hpZC1pZHMuaAorKysgYi9kcml2ZXJzL2hpZC9oaWQtaWRzLmgKQEAg
LTE1NDYsNyArMTU0Niw3IEBACiAjZGVmaW5lIFVTQl9WRU5ET1JfSURfU0lHTk9URUMJCQkw
eDIxMzMKICNkZWZpbmUgVVNCX0RFVklDRV9JRF9TSUdOT1RFQ19WSUVXU09OSUNfUEQxMDEx
CTB4MDAxOAogCi0jZGVmaW5lIFVTQl9WRU5ET1JfSURfU01BUlRMSU5LVEVDSE5PTE9HWSAg
ICAgICAgICAgICAgMHg0YzRhCi0jZGVmaW5lIFVTQl9ERVZJQ0VfSURfU01BUlRMSU5LVEVD
SE5PTE9HWV80MTU1ICAgICAgICAgMHg0MTU1CisjZGVmaW5lIFVTQl9WRU5ET1JfSURfSklF
TElfU0RLX0RFRkFVTFQJCTB4NGM0YQorI2RlZmluZSBVU0JfREVWSUNFX0lEX0pJRUxJX1NE
S180MTU1CQkweDQxNTUKIAogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQt
cXVpcmtzLmMgYi9kcml2ZXJzL2hpZC9oaWQtcXVpcmtzLmMKaW5kZXggYmNkNGJjY2YxYTdj
Li4yMjc2MGFjNTBmMmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaGlkL2hpZC1xdWlya3MuYwor
KysgYi9kcml2ZXJzL2hpZC9oaWQtcXVpcmtzLmMKQEAgLTkxNSw3ICs5MTUsNiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGhpZF9kZXZpY2VfaWQgaGlkX2lnbm9yZV9saXN0W10gPSB7CiAj
ZW5kaWYKIAl7IEhJRF9VU0JfREVWSUNFKFVTQl9WRU5ET1JfSURfWUVBTElOSywgVVNCX0RF
VklDRV9JRF9ZRUFMSU5LX1AxS19QNEtfQjJLKSB9LAogCXsgSElEX1VTQl9ERVZJQ0UoVVNC
X1ZFTkRPUl9JRF9RVUFOVEEsIFVTQl9ERVZJQ0VfSURfUVVBTlRBX0hQXzVNUF9DQU1FUkFf
NTQ3MykgfSwKLQl7IEhJRF9VU0JfREVWSUNFKFVTQl9WRU5ET1JfSURfU01BUlRMSU5LVEVD
SE5PTE9HWSwgVVNCX0RFVklDRV9JRF9TTUFSVExJTktURUNITk9MT0dZXzQxNTUpIH0sCiAJ
eyB9CiB9OwogCkBAIC0xMDY0LDYgKzEwNjMsMTggQEAgYm9vbCBoaWRfaWdub3JlKHN0cnVj
dCBoaWRfZGV2aWNlICpoZGV2KQogCQkJCQkgICAgIHN0cmxlbihlbGFuX2FjcGlfaWRbaV0u
aWQpKSkKIAkJCQkJcmV0dXJuIHRydWU7CiAJCWJyZWFrOworCWNhc2UgVVNCX1ZFTkRPUl9J
RF9KSUVMSV9TREtfREVGQVVMVDoKKwkJLyoKKwkJICogTXVsdGlwbGUgVVNCIGRldmljZXMg
d2l0aCBpZGVudGljYWwgSURzIChtaWMgJiB0b3VjaHNjcmVlbikuCisJCSAqIFRoZSB0b3Vj
aCBzY3JlZW4gcmVxdWlyZXMgaGlkIGNvcmUgcHJvY2Vzc2luZywgYnV0IHRoZQorCQkgKiBt
aWNyb3Bob25lIGRvZXMgbm90LiBUaGV5IGNhbiBiZSBkaXN0aW5ndWlzaGVkIGJ5IG1hbnVm
YWN0dXJlcgorCQkgKiBhbmQgc2VyaWFsIG51bWJlci4KKwkJICovCisJCWlmIChoZGV2LT5w
cm9kdWN0ID09IFVTQl9ERVZJQ0VfSURfSklFTElfU0RLXzQxNTUgJiYKKwkJICAgIHN0cm5j
bXAoaGRldi0+bmFtZSwgIlNtYXJ0bGlua1RlY2hub2xvZ3kiLCAxOSkgPT0gMCAmJgorCQkg
ICAgc3RybmNtcChoZGV2LT51bmlxLCAiMjAyMDExMTEwMDAwMDEiLCAxNCkgPT0gMCkKKwkJ
CXJldHVybiB0cnVlOworCQlicmVhazsKIAl9CiAKIAlpZiAoaGRldi0+dHlwZSA9PSBISURf
VFlQRV9VU0JNT1VTRSAmJgotLSAKMi40Ny4xCgo=

--------------EG8zjlNRNjcQWj3EtsGJp8Qt--

