Return-Path: <linux-input+bounces-14961-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E69B8FBC1
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 11:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA2BC3A778F
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 09:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF38B275AF0;
	Mon, 22 Sep 2025 09:22:08 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462C8281530;
	Mon, 22 Sep 2025 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758532928; cv=none; b=C1PyJRUkACtDszWWMVJgt6fQ67LepY+elN69hNlJ8QpN6POpHAJZ7FG++zHFSxb65uczB41qnGEpGOpoeem+gJZwKww78C/6I8VyII18z8eNIwh/i27l3RAr0WJf6q96VlA+Xv76V3/focncIPCeTLJ3WXmZPUq5eKzXxu5Ec/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758532928; c=relaxed/simple;
	bh=F+j1gvDZbC9a4flx5aJ9RBjMLgi+Sw6IZ3alWei2zeQ=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:Subject:To:Cc:
	 References:In-Reply-To; b=d67oHd26SxAktUXX1ZGH3vo0Qi0IIrwaqv/x1aG/yj94vULytErvYR9suk5coCjoEg+82B6epCyjxFCOQp0TjrqFfft4Voi7ZYT2uOXg8VynrY5v+wX8AMk43RlHX6n/v+sujBtCHr0Pt79IA4FwbDyO9P81wjLyIwFfUxon/ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 96f8533a979511f08b9f7d2eb6caa7cf-20250922
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:d9c9921b-7714-432e-882c-02884a80c62c,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:5,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6493067,CLOUDID:f7e65d22eba6cc0d3236e2eccb66e2fe,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102,TC:nil,Content:0|50,EDM:2,I
	P:nil,URL:0,File:2,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 96f8533a979511f08b9f7d2eb6caa7cf-20250922
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 560678075; Mon, 22 Sep 2025 17:21:58 +0800
Content-Type: multipart/mixed; boundary="------------HTXT9pUf30m2Q1iVCgv0L0Ai"
Message-ID: <01ce8d55-6054-4efa-bed5-ce4c6c6bc0e6@kylinos.cn>
Date: Mon, 22 Sep 2025 17:21:54 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: zhangheng <zhangheng@kylinos.cn>
Subject: Re: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
To: Staffan Melin <staffan.melin@oscillator.se>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>,
 Salvatore Bonaccorso <carnil@debian.org>, Jiri Kosina <jkosina@suse.com>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, 1114557@bugs.debian.org
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
 <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
 <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>
 <aMUxHZF-7p7--1qS@eldamar.lan> <aMUxg6FLqDetwiGu@eldamar.lan>
 <f08669ec112d6ab2f62e35c0c96d1f06@oscillator.se>
 <94520aac-2a68-40d2-b188-80f9e361d6de@kylinos.cn>
 <735c20da-c052-4528-ad91-185a835ca40c@cosmicgizmosystems.com>
 <54b4b55c-ef29-40ae-a576-0c0b35ea9625@kylinos.cn>
 <3c299b65351c489fea95ec8b93518b6b@oscillator.se>
In-Reply-To: <3c299b65351c489fea95ec8b93518b6b@oscillator.se>

This is a multi-part message in MIME format.
--------------HTXT9pUf30m2Q1iVCgv0L0Ai
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please help test this patch, I will push it to the kernel community. 
Currently, the microphone device is functioning normally
--------------HTXT9pUf30m2Q1iVCgv0L0Ai
Content-Type: text/plain; charset=UTF-8;
 name="0001-HID-quirks-Add-device-descriptor-for-4c4a-4155.patch"
Content-Disposition: attachment;
 filename*0="0001-HID-quirks-Add-device-descriptor-for-4c4a-4155.patch"
Content-Transfer-Encoding: base64

RnJvbSA1MzJiODdkYmFkNGJkNjM0Y2E0ZDVmZjQxMDAxMDc1Zjc2OGUwYmMxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBaaGFuZyBIZW5nIDx6aGFuZ2hlbmdAa3lsaW5vcy5j
bj4KRGF0ZTogRnJpLCAxMiBTZXAgMjAyNSAyMDozODoxOCArMDgwMApTdWJqZWN0OiBbUEFU
Q0hdIEhJRDogcXVpcmtzOiBBZGQgZGV2aWNlIGRlc2NyaXB0b3IgZm9yIDRjNGE6NDE1NQoK
TXVsdGlwbGUgVVNCIGRldmljZXMgaGF2ZSB0aGUgc2FtZSBJRDsKYWRkIGRldmljZSBkZXNj
cmlwdG9ycyB0byBkaXN0aW5ndWlzaCB0aGVtLgoKU2lnbmVkLW9mZi1ieTogWmhhbmcgSGVu
ZyA8emhhbmdoZW5nQGt5bGlub3MuY24+Ci0tLQogZHJpdmVycy9oaWQvaGlkLXF1aXJrcy5j
IHwgMTIgKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1xdWlya3MuYyBi
L2RyaXZlcnMvaGlkL2hpZC1xdWlya3MuYwppbmRleCBmZmQwMzQ1NjZlMmUuLmQyOGIxODBh
YmQ3MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9oaWQvaGlkLXF1aXJrcy5jCisrKyBiL2RyaXZl
cnMvaGlkL2hpZC1xdWlya3MuYwpAQCAtOTEzLDcgKzkxMyw2IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaGlkX2RldmljZV9pZCBoaWRfaWdub3JlX2xpc3RbXSA9IHsKICNlbmRpZgogCXsg
SElEX1VTQl9ERVZJQ0UoVVNCX1ZFTkRPUl9JRF9ZRUFMSU5LLCBVU0JfREVWSUNFX0lEX1lF
QUxJTktfUDFLX1A0S19CMkspIH0sCiAJeyBISURfVVNCX0RFVklDRShVU0JfVkVORE9SX0lE
X1FVQU5UQSwgVVNCX0RFVklDRV9JRF9RVUFOVEFfSFBfNU1QX0NBTUVSQV81NDczKSB9LAot
CXsgSElEX1VTQl9ERVZJQ0UoVVNCX1ZFTkRPUl9JRF9TTUFSVExJTktURUNITk9MT0dZLCBV
U0JfREVWSUNFX0lEX1NNQVJUTElOS1RFQ0hOT0xPR1lfNDE1NSkgfSwKIAl7IH0KIH07CiAK
QEAgLTEwNjIsNiArMTA2MSwxNyBAQCBib29sIGhpZF9pZ25vcmUoc3RydWN0IGhpZF9kZXZp
Y2UgKmhkZXYpCiAJCQkJCSAgICAgc3RybGVuKGVsYW5fYWNwaV9pZFtpXS5pZCkpKQogCQkJ
CQlyZXR1cm4gdHJ1ZTsKIAkJYnJlYWs7CisJY2FzZSBVU0JfVkVORE9SX0lEX1NNQVJUTElO
S1RFQ0hOT0xPR1k6CisJCS8qIE11bHRpcGxlIFVTQiBkZXZpY2VzIHdpdGggaWRlbnRpY2Fs
IElEcyAobWljICYgdG91Y2hzY3JlZW4pLgorCQkgKiBUaGUgdG91Y2ggc2NyZWVuIHJlcXVp
cmVzIGhpZCBjb3JlIHByb2Nlc3NpbmcsIGJ1dCB0aGUKKwkJICogbWljcm9waG9uZSBkb2Vz
IG5vdC4gVGhleSBjYW4gYmUgZGlzdGluZ3Vpc2hlZCBieSBtYW51ZmFjdHVyZXIKKwkJICog
YW5kIHNlcmlhbCBudW1iZXIuCisJCSAqLworCQlpZiAoaGRldi0+cHJvZHVjdCA9PSBVU0Jf
REVWSUNFX0lEX1NNQVJUTElOS1RFQ0hOT0xPR1lfNDE1NSAmJgorCQkgICAgc3RybmNtcCho
ZGV2LT5uYW1lLCAiU21hcnRsaW5rVGVjaG5vbG9neSIsIDE5KSA9PSAwICYmCisJCSAgICBz
dHJuY21wKGhkZXYtPnVuaXEsICIyMDIwMTExMTAwMDAwMSIsIDE0KSA9PSAwKQorCQkJcmV0
dXJuIHRydWU7CisJCWJyZWFrOwogCX0KIAogCWlmIChoZGV2LT50eXBlID09IEhJRF9UWVBF
X1VTQk1PVVNFICYmCi0tIAoyLjQ3LjEKCg==

--------------HTXT9pUf30m2Q1iVCgv0L0Ai--

