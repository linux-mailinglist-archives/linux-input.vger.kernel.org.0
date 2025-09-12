Return-Path: <linux-input+bounces-14646-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E468B54E68
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 14:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A5513AE449
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 12:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEF4302162;
	Fri, 12 Sep 2025 12:49:25 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD071E32B7;
	Fri, 12 Sep 2025 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757681365; cv=none; b=raomfLpv05G3IT04vndn72hTzOhLZFuu6+AkTHeYLJkFW1YEpgV1XhHyH2NBtQg4H1X2qtrVjWlCtJILhXSIO3AiRO6n7d0bNi9SzjyiC4Nd62UliOb0rwjaJRP8NnnKxF2F71LzQKZoPvSuMp3bJJt/ay2Wtyqd0HVASC9hWdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757681365; c=relaxed/simple;
	bh=oi151mNxHUuVdrfzLR78YFpChdK2PjgzYFmvMQ2UUb4=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=LQgKEvBBwIUFColDlcEFcHGYJRXA2vMRj1KBc/67qh+/JNTDgGhvRTD6VqpDwR6g0KEiaY05c5/ntQtNv/l4ix3cQZ2XBJI/Pumy71EbsjAhk4ehW5T3CUFj84QiUHkgAZnMIEN2jvruvUjNHHJCoyxJtqrZJ9wMqbSBEN5W2n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e208d14a8fd611f0b29709d653e92f7d-20250912
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:7ff57fff-cbca-4fd2-bf5e-2daefe46416d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:5,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:7dcd282119355a477bc719e660f0dc54,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:1,File:2,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: e208d14a8fd611f0b29709d653e92f7d-20250912
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1646010829; Fri, 12 Sep 2025 20:49:12 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 719C2E009009;
	Fri, 12 Sep 2025 20:49:12 +0800 (CST)
X-ns-mid: postfix-68C416C8-1693817
Received: from [172.25.120.76] (unknown [172.25.120.76])
	by mail.kylinos.cn (NSMail) with ESMTPA id 2B69FE009008;
	Fri, 12 Sep 2025 20:49:08 +0800 (CST)
Content-Type: multipart/mixed; boundary="------------SLPeU6QBqpLSmPmWisb5FvmK"
Message-ID: <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
Date: Fri, 12 Sep 2025 20:49:07 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
To: Salvatore Bonaccorso <carnil@debian.org>, Jiri Kosina <jkosina@suse.com>,
 Staffan Melin <staffan.melin@oscillator.se>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, 1114557@bugs.debian.org
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
From: zhangheng <zhangheng@kylinos.cn>
In-Reply-To: <aL2gYJaXoB6p_oyM@eldamar.lan>

This is a multi-part message in MIME format.
--------------SLPeU6QBqpLSmPmWisb5FvmK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

I am currently working on resolving this issue by limiting the original=20
patch

based on the information in the device descriptor to avoid affecting=20
your device,

You can try this patch and look forward to your reply.


=E5=9C=A8 2025/9/7 23:10, Salvatore Bonaccorso =E5=86=99=E9=81=93:
> Hi Zhang, hi Jiri,
>
> In Debian Staffan Melin reported that after an update containing the
> commit 1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY"),
> the input device with same idVendor and idProduct, the Jieli
> Technology USB Composite Device, does not get recognized anymore.
>
> The full Debian report is at: https://bugs.debian.org/1114557
>
> The issue is not specific to the 6.12.y series and confirmed in 6.16.3
> as well.
>
> Staffan Melin did bisect the kernels between 6.12.38 (which was still
> working) and 6.1.41 (which was not), confirming by bisection that the
> offending commit is
>
> 1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY")
>
> #regzbot introduced: 1a8953f4f774
> #regzbot monitor: https://bugs.debian.org/1114557
>
> So it looks that the quirk applied is unfortunately affecting
> negatively as well Staffan Melin case.
>
> Can you have a look?
>
> Regards,
> Salvatore
--------------SLPeU6QBqpLSmPmWisb5FvmK
Content-Type: text/plain; charset=UTF-8;
 name="0001-HID-quirks-Add-device-descriptor-for-4c4a-4155.patch"
Content-Disposition: attachment;
 filename*0="0001-HID-quirks-Add-device-descriptor-for-4c4a-4155.patch"
Content-Transfer-Encoding: base64

RnJvbSA5ZmI0ZmQzODczZTU2OTM2NDdlNTE3Yzc5NjAzODNjNDUyM2NkMDkzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBaaGFuZyBIZW5nIDx6aGFuZ2hlbmdAa3lsaW5vcy5j
bj4KRGF0ZTogRnJpLCAxMiBTZXAgMjAyNSAyMDozODoxOCArMDgwMApTdWJqZWN0OiBbUEFU
Q0hdIEhJRDogcXVpcmtzOiBBZGQgZGV2aWNlIGRlc2NyaXB0b3IgZm9yIDRjNGE6NDE1NQoK
VHdvIFVTQiBkZXZpY2VzIHVzZSB0aGUgc2FtZSBJRC4gVG8gYXZvaWQgYWZmZWN0aW5nIGZ1
bmN0aW9uYWxpdHksCmRldmljZSBkZXNjcmlwdG9ycyBhcmUgYWRkZWQgdG8gZGlzdGluZ3Vp
c2ggYmV0d2VlbiB0aGVtCgpTaWduZWQtb2ZmLWJ5OiBaaGFuZyBIZW5nIDx6aGFuZ2hlbmdA
a3lsaW5vcy5jbj4KLS0tCiBkcml2ZXJzL2hpZC9oaWQtcXVpcmtzLmMgfCAxNyArKysrKysr
KysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtcXVpcmtzLmMgYi9kcml2ZXJz
L2hpZC9oaWQtcXVpcmtzLmMKaW5kZXggZmZkMDM0NTY2ZTJlLi5kMzlhOGU1M2VhMzYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvaGlkL2hpZC1xdWlya3MuYworKysgYi9kcml2ZXJzL2hpZC9o
aWQtcXVpcmtzLmMKQEAgLTkxMyw2ICs5MTMsMTcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBo
aWRfZGV2aWNlX2lkIGhpZF9pZ25vcmVfbGlzdFtdID0gewogI2VuZGlmCiAJeyBISURfVVNC
X0RFVklDRShVU0JfVkVORE9SX0lEX1lFQUxJTkssIFVTQl9ERVZJQ0VfSURfWUVBTElOS19Q
MUtfUDRLX0IySykgfSwKIAl7IEhJRF9VU0JfREVWSUNFKFVTQl9WRU5ET1JfSURfUVVBTlRB
LCBVU0JfREVWSUNFX0lEX1FVQU5UQV9IUF81TVBfQ0FNRVJBXzU0NzMpIH0sCisJeyB9Cit9
OworLyoKKyAqIGhpZF9pZ25vcmVfbWljIC0gTWljcm9waG9uZSBkZXZpY2VzIGRvIG5vdCBy
ZXF1aXJlIEhJRCBjb3JlIHByb2Nlc3NpbmcKKyAqCisgKiBOb3cgdGhlcmUgYXJlIHR3byBV
U0IgZGV2aWNlcyB1c2luZyB0aGUgc2FtZSBJRCwgb25lIGlzIHRoZSBtaWNyb3Bob25lIGFu
ZCB0aGUgb3RoZXIKKyAqIGlzIHRoZSB0b3VjaCBzY3JlZW4uIFRoZSB0b3VjaCBzY3JlZW4g
cmVxdWlyZXMgaGlkIGNvcmUgcHJvY2Vzc2luZywgYnV0IHRoZQorICogbWljcm9waG9uZSBk
b2VzIG5vdC4gVGhlIHR3byBoYXZlIGRpZmZlcmVudCBiY2RJRHMsIHdoaWNoIHdpbGwgYmUg
dXNlZCB0bworICogZGlzdGluZ3Vpc2ggdGhlbSBpbiB0aGUgZnV0dXJlCisgKi8KK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgaGlkX2RldmljZV9pZCBoaWRfaWdub3JlX21pY1tdID0gewogCXsg
SElEX1VTQl9ERVZJQ0UoVVNCX1ZFTkRPUl9JRF9TTUFSVExJTktURUNITk9MT0dZLCBVU0Jf
REVWSUNFX0lEX1NNQVJUTElOS1RFQ0hOT0xPR1lfNDE1NSkgfSwKIAl7IH0KIH07CkBAIC0x
MDY4LDYgKzEwNzksOSBAQCBib29sIGhpZF9pZ25vcmUoc3RydWN0IGhpZF9kZXZpY2UgKmhk
ZXYpCiAJICAgIGhkZXYtPnF1aXJrcyAmIEhJRF9RVUlSS19JR05PUkVfTU9VU0UpCiAJCXJl
dHVybiB0cnVlOwogCisJaWYoaGlkX21hdGNoX2lkKGhkZXYsIGhpZF9pZ25vcmVfbWljKSAm
JiAoaGRldi0+dmVyc2lvbiA+IDEuMSkpCisJCXJldHVybiB0cnVlOworCiAJcmV0dXJuICEh
aGlkX21hdGNoX2lkKGhkZXYsIGhpZF9pZ25vcmVfbGlzdCk7CiB9CiBFWFBPUlRfU1lNQk9M
X0dQTChoaWRfaWdub3JlKTsKQEAgLTEyNjYsNyArMTI4MCw4IEBAIHN0YXRpYyB1bnNpZ25l
ZCBsb25nIGhpZF9nZXRzX3NxdWlyayhjb25zdCBzdHJ1Y3QgaGlkX2RldmljZSAqaGRldikK
IAljb25zdCBzdHJ1Y3QgaGlkX2RldmljZV9pZCAqYmxfZW50cnk7CiAJdW5zaWduZWQgbG9u
ZyBxdWlya3MgPSBoZGV2LT5pbml0aWFsX3F1aXJrczsKIAotCWlmIChoaWRfbWF0Y2hfaWQo
aGRldiwgaGlkX2lnbm9yZV9saXN0KSkKKwlpZiAoaGlkX21hdGNoX2lkKGhkZXYsIGhpZF9p
Z25vcmVfbGlzdCkgfHwKKwkgICAoaGlkX21hdGNoX2lkKGhkZXYsIGhpZF9pZ25vcmVfbWlj
KSAmJiAoaGRldi0+dmVyc2lvbiA+IDEuMSkpKQogCQlxdWlya3MgfD0gSElEX1FVSVJLX0lH
Tk9SRTsKIAogCWlmIChoaWRfbWF0Y2hfaWQoaGRldiwgaGlkX21vdXNlX2lnbm9yZV9saXN0
KSkKLS0gCjIuNDcuMQoK

--------------SLPeU6QBqpLSmPmWisb5FvmK--

