Return-Path: <linux-input+bounces-14729-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30935B57323
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 10:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5BBD161583
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 08:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC2C2EB5D4;
	Mon, 15 Sep 2025 08:37:47 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5351FC0EA;
	Mon, 15 Sep 2025 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757925467; cv=none; b=ex0qHV4S3XO41kfpbo0SYQgmZmoYdQpw2kFO9AuMWDpxsATEHtWGaurFqJlJL+0nQWEy54AzdF27FNweTyAIH4BuvsOPYmZv/8B8gjc4I/FR1b+EifoyY2tJNQzUfQv4X1J7EzPUjHRkJuphpoWH5DbvTpoLgfSxeseG4CB+BA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757925467; c=relaxed/simple;
	bh=Q7bkcaIQnbjNFPHv/tC1SIIJFRyufAAQqwPFLV8GJAo=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=eSy+Jsc/Qgk2J8MypY/KkBOZ+wT8q091ChvsQ4bm17ZhZ7ycF+kdVUA8KhWFDMjVb6CHhI0PhQsaigHtBMa/c+Ur9xJZb6PxZ3pO5rB6RMTUfkPekC1RTBM9WM3w5tRFA5KK8SZBgJ5D1wuGgkamJhMlHyjkC0gFjForcGZUnrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3a35dedc920f11f0b29709d653e92f7d-20250915
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:08e1c689-82e9-461f-98a5-e270daf56fe0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:5,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:1739cc9bc6146cabd937cc9efa99b55b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:2,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3a35dedc920f11f0b29709d653e92f7d-20250915
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1963435072; Mon, 15 Sep 2025 16:37:34 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id EB90EE009009;
	Mon, 15 Sep 2025 16:37:33 +0800 (CST)
X-ns-mid: postfix-68C7D04D-860271352
Received: from [172.25.120.76] (unknown [172.25.120.76])
	by mail.kylinos.cn (NSMail) with ESMTPA id C8398E009008;
	Mon, 15 Sep 2025 16:37:31 +0800 (CST)
Content-Type: multipart/mixed; boundary="------------8Ut23cP00acSb4c9XjXIPEhR"
Message-ID: <94520aac-2a68-40d2-b188-80f9e361d6de@kylinos.cn>
Date: Mon, 15 Sep 2025 16:37:29 +0800
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
To: Staffan Melin <staffan.melin@oscillator.se>,
 Salvatore Bonaccorso <carnil@debian.org>
Cc: Jiri Kosina <jkosina@suse.com>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org, 1114557@bugs.debian.org
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
 <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
 <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>
 <aMUxHZF-7p7--1qS@eldamar.lan> <aMUxg6FLqDetwiGu@eldamar.lan>
 <f08669ec112d6ab2f62e35c0c96d1f06@oscillator.se>
From: zhangheng <zhangheng@kylinos.cn>
In-Reply-To: <f08669ec112d6ab2f62e35c0c96d1f06@oscillator.se>

This is a multi-part message in MIME format.
--------------8Ut23cP00acSb4c9XjXIPEhR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Apply this new patch and test the kernel again. I don't have the=20
original mic device in my hands, which means I have to wait for a=20
response for testing now.

You can test it first, and the other mic device also needs to be retested

=E5=9C=A8 2025/9/13 21:11, Staffan Melin =E5=86=99=E9=81=93:
> Ah, thanks, I get it now :)
>
> So I got 6.16.7, and the patch applied without problems.
>
> But no luck, the same results as before: touchscreen not working,=20
> xinput --list not showing the Jieli touchscreen. dmesg shows the same=20
> as before, too.
>
> Best regards,
>
> Staffan
>
>
> On 2025-09-13 10:55, Salvatore Bonaccorso wrote:
>> Hi Staffan,
>>
>> chiming in hopefully it is of help.
>>
>> Now really with the patch ...
>>
>> On Fri, Sep 12, 2025 at 09:57:04PM +0200, Staffan Melin wrote:
>>> Thank you,
>>>
>>> I tried to apply this patch to 6.12.39, the first problematic=20
>>> kernel, as
>>> well as 6.12.41, the first bad I tried, and on both I got an error=20
>>> message:
>>>
>>> Applying: HID: quirks: Add device descriptor for 4c4a:4155
>>> error: patch failed: drivers/hid/hid-quirks.c:1068
>>> error: drivers/hid/hid-quirks.c: patch does not apply
>>> Patch failed at 0001 HID: quirks: Add device descriptor for 4c4a:4155
>>>
>>> To which kernel version should I apply the patch?
>>
>> As the deveopment goes from mainline then down to stable series, the
>> fix needs to be developed first for mainline. So the patch is targeted
>> there.
>>
>> But please find attached an updated patch which hopefully should work
>> which resolved the context changes on top of 6.12.47.
>>
>> But ideally you can provide a Tested-by on zhangheng's mainline patch
>> to get things rolling as needed.
>>
>> Regards,
>> Salvatore
--------------8Ut23cP00acSb4c9XjXIPEhR
Content-Type: text/plain; charset=UTF-8;
 name="v2-0001-HID-quirks-Add-device-descriptor-for-4c4a-4155.patch"
Content-Disposition: attachment;
 filename*0="v2-0001-HID-quirks-Add-device-descriptor-for-4c4a-4155.patch"
Content-Transfer-Encoding: base64

RnJvbSBmM2MxMzEyZWM0YWQ0MzQ4MDE5ODFkYzk3MjA5ZWZmNTEyYjJjMTk1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBaaGFuZyBIZW5nIDx6aGFuZ2hlbmdAa3lsaW5vcy5j
bj4KRGF0ZTogRnJpLCAxMiBTZXAgMjAyNSAyMDozODoxOCArMDgwMApTdWJqZWN0OiBbUEFU
Q0ggdjJdIEhJRDogcXVpcmtzOiBBZGQgZGV2aWNlIGRlc2NyaXB0b3IgZm9yIDRjNGE6NDE1
NQoKVHdvIFVTQiBkZXZpY2VzIHVzZSB0aGUgc2FtZSBJRC4gVG8gYXZvaWQgYWZmZWN0aW5n
IGZ1bmN0aW9uYWxpdHksCmRldmljZSBkZXNjcmlwdG9ycyBhcmUgYWRkZWQgdG8gZGlzdGlu
Z3Vpc2ggYmV0d2VlbiB0aGVtCgpTaWduZWQtb2ZmLWJ5OiBaaGFuZyBIZW5nIDx6aGFuZ2hl
bmdAa3lsaW5vcy5jbj4KLS0tCiBkcml2ZXJzL2hpZC9oaWQtcXVpcmtzLmMgfCAxNyArKysr
KysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtcXVpcmtzLmMgYi9kcml2
ZXJzL2hpZC9oaWQtcXVpcmtzLmMKaW5kZXggZmZkMDM0NTY2ZTJlLi5kMzlhOGU1M2VhMzYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaGlkL2hpZC1xdWlya3MuYworKysgYi9kcml2ZXJzL2hp
ZC9oaWQtcXVpcmtzLmMKQEAgLTkxMyw2ICs5MTMsMTcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBoaWRfZGV2aWNlX2lkIGhpZF9pZ25vcmVfbGlzdFtdID0gewogI2VuZGlmCiAJeyBISURf
VVNCX0RFVklDRShVU0JfVkVORE9SX0lEX1lFQUxJTkssIFVTQl9ERVZJQ0VfSURfWUVBTElO
S19QMUtfUDRLX0IySykgfSwKIAl7IEhJRF9VU0JfREVWSUNFKFVTQl9WRU5ET1JfSURfUVVB
TlRBLCBVU0JfREVWSUNFX0lEX1FVQU5UQV9IUF81TVBfQ0FNRVJBXzU0NzMpIH0sCisJeyB9
Cit9OworLyoKKyAqIGhpZF9pZ25vcmVfbWljIC0gTWljcm9waG9uZSBkZXZpY2VzIGRvIG5v
dCByZXF1aXJlIEhJRCBjb3JlIHByb2Nlc3NpbmcKKyAqCisgKiBOb3cgdGhlcmUgYXJlIHR3
byBVU0IgZGV2aWNlcyB1c2luZyB0aGUgc2FtZSBJRCwgb25lIGlzIHRoZSBtaWNyb3Bob25l
IGFuZCB0aGUgb3RoZXIKKyAqIGlzIHRoZSB0b3VjaCBzY3JlZW4uIFRoZSB0b3VjaCBzY3Jl
ZW4gcmVxdWlyZXMgaGlkIGNvcmUgcHJvY2Vzc2luZywgYnV0IHRoZQorICogbWljcm9waG9u
ZSBkb2VzIG5vdC4gVGhlIHR3byBoYXZlIGRpZmZlcmVudCBiY2RJRHMsIHdoaWNoIHdpbGwg
YmUgdXNlZCB0bworICogZGlzdGluZ3Vpc2ggdGhlbSBpbiB0aGUgZnV0dXJlCisgKi8KK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgaGlkX2RldmljZV9pZCBoaWRfaWdub3JlX21pY1tdID0gewog
CXsgSElEX1VTQl9ERVZJQ0UoVVNCX1ZFTkRPUl9JRF9TTUFSVExJTktURUNITk9MT0dZLCBV
U0JfREVWSUNFX0lEX1NNQVJUTElOS1RFQ0hOT0xPR1lfNDE1NSkgfSwKIAl7IH0KIH07CkBA
IC0xMDY4LDYgKzEwNzksOSBAQCBib29sIGhpZF9pZ25vcmUoc3RydWN0IGhpZF9kZXZpY2Ug
KmhkZXYpCiAJICAgIGhkZXYtPnF1aXJrcyAmIEhJRF9RVUlSS19JR05PUkVfTU9VU0UpCiAJ
CXJldHVybiB0cnVlOwogCisJaWYoaGlkX21hdGNoX2lkKGhkZXYsIGhpZF9pZ25vcmVfbWlj
KSAmJiAoaGRldi0+dmVyc2lvbiA+IDEuMSkpCisJCXJldHVybiB0cnVlOworCiAJcmV0dXJu
ICEhaGlkX21hdGNoX2lkKGhkZXYsIGhpZF9pZ25vcmVfbGlzdCk7CiB9CiBFWFBPUlRfU1lN
Qk9MX0dQTChoaWRfaWdub3JlKTsKQEAgLTEyNjYsNyArMTI4MCw4IEBAIHN0YXRpYyB1bnNp
Z25lZCBsb25nIGhpZF9nZXRzX3NxdWlyayhjb25zdCBzdHJ1Y3QgaGlkX2RldmljZSAqaGRl
dikKIAljb25zdCBzdHJ1Y3QgaGlkX2RldmljZV9pZCAqYmxfZW50cnk7CiAJdW5zaWduZWQg
bG9uZyBxdWlya3MgPSBoZGV2LT5pbml0aWFsX3F1aXJrczsKIAotCWlmIChoaWRfbWF0Y2hf
aWQoaGRldiwgaGlkX2lnbm9yZV9saXN0KSkKKwlpZiAoaGlkX21hdGNoX2lkKGhkZXYsIGhp
ZF9pZ25vcmVfbGlzdCkgfHwKKwkgICAoaGlkX21hdGNoX2lkKGhkZXYsIGhpZF9pZ25vcmVf
bWljKSAmJiAoaGRldi0+dmVyc2lvbiA+IDEuMSkpKQogCQlxdWlya3MgfD0gSElEX1FVSVJL
X0lHTk9SRTsKIAogCWlmIChoaWRfbWF0Y2hfaWQoaGRldiwgaGlkX21vdXNlX2lnbm9yZV9s
aXN0KSkKLS0gCjIuNDcuMQoK

--------------8Ut23cP00acSb4c9XjXIPEhR--

