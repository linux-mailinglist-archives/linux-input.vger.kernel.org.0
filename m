Return-Path: <linux-input+bounces-14849-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C6CB850F2
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 16:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F06E7C7B47
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 14:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F7A313528;
	Thu, 18 Sep 2025 14:06:11 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B003101BA;
	Thu, 18 Sep 2025 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204371; cv=none; b=uWVDdsYxW1Yzmgv/o2Gb2I7Swb2oz7K8Wpoee2IeSsQ0H9g0iVngJq2oqpj0L2VpGE4GIUR6IqF2wZhTITVPNEQyEk5p/i3NbvgiQ8d3QsI88VkKQZC3x46WNs1NPwTYgzyqgsWjTJrtLUhPiQeCr0Betu3etjgvZBXpW7PSm24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204371; c=relaxed/simple;
	bh=nNiky7bO7n+Nv+kvGiLh9fqCGgJeEfwOzXmKd3/EUoc=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=THNGIgxOZu4KbgSWnnRjstRkJPz2GST9XW9WkYjTZXMIjZOzWFEMesRcjIgfdIFKKFV9RSS4+odMgIf+nyaMzPNlOTGQnjjKgbTqIchi7YGtHmw1MDnWJzBrRz2PvBjVTPXMyHcYvi6XB2PpUhifaxDdPNWrXUinE98S2nbm8tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 98520820949811f0b29709d653e92f7d-20250918
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:d02e503e-7d76-4cd7-bec3-4ac829020784,IP:0,U
	RL:0,TC:10,Content:0,EDM:0,RT:0,SF:0,FILE:5,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-META: VersionHash:6493067,CLOUDID:6a408260e95e1b97c4a4950f311338b8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:4,Content:0|52,EDM:-3
	,IP:nil,URL:0,File:2,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 98520820949811f0b29709d653e92f7d-20250918
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 43693983; Thu, 18 Sep 2025 22:05:55 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 2DF4DE00900C;
	Thu, 18 Sep 2025 22:05:55 +0800 (CST)
X-ns-mid: postfix-68CC11C2-9178783
Received: from [172.25.120.76] (unknown [172.25.120.76])
	by mail.kylinos.cn (NSMail) with ESMTPA id D1E90E00900B;
	Thu, 18 Sep 2025 22:05:52 +0800 (CST)
Content-Type: multipart/mixed; boundary="------------h0MF0sOh6d3g8Gjxka4L0jMp"
Message-ID: <54b4b55c-ef29-40ae-a576-0c0b35ea9625@kylinos.cn>
Date: Thu, 18 Sep 2025 22:05:50 +0800
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
To: Terry Junge <linuxhid@cosmicgizmosystems.com>,
 Staffan Melin <staffan.melin@oscillator.se>,
 Salvatore Bonaccorso <carnil@debian.org>
Cc: Jiri Kosina <jkosina@suse.com>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org, 1114557@bugs.debian.org
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
 <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
 <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>
 <aMUxHZF-7p7--1qS@eldamar.lan> <aMUxg6FLqDetwiGu@eldamar.lan>
 <f08669ec112d6ab2f62e35c0c96d1f06@oscillator.se>
 <94520aac-2a68-40d2-b188-80f9e361d6de@kylinos.cn>
 <735c20da-c052-4528-ad91-185a835ca40c@cosmicgizmosystems.com>
From: zhangheng <zhangheng@kylinos.cn>
In-Reply-To: <735c20da-c052-4528-ad91-185a835ca40c@cosmicgizmosystems.com>

This is a multi-part message in MIME format.
--------------h0MF0sOh6d3g8Gjxka4L0jMp
Content-Type: multipart/alternative;
 boundary="------------SA6EzbNlmSo5yvY1VkPGo0CS"

--------------SA6EzbNlmSo5yvY1VkPGo0CS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

It's interesting that I found another USB device with the same ID, but=20
it's a USB headphone, device descriptors in headphone.txt

Microphone.txt is the device descriptor for SMARTLINKTechnology.

I was originally planning to differentiate according to bcdHID, but=20
there is hdev ->version=3D0x100, therefore, I created the v3 patch.

The microphone device is normal, but I'm not sure if your touchscreen=20
function is working properly.

[=C2=A0 =C2=A067.417805] usb 1-3.4.2: new full-speed USB device number 11=
 using=20
xhci_hcd
[=C2=A0 =C2=A067.566700] usb 1-3.4.2: New USB device found, idVendor=3D4c=
4a,=20
idProduct=3D4155, bcdDevice=3D 1.00
[=C2=A0 =C2=A067.566707] usb 1-3.4.2: New USB device strings: Mfr=3D1, Pr=
oduct=3D2,=20
SerialNumber=3D3
[=C2=A0 =C2=A067.566712] usb 1-3.4.2: Product: USB Composite Device
[=C2=A0 =C2=A067.566717] usb 1-3.4.2: Manufacturer: SmartlinkTechnology
[=C2=A0 =C2=A067.566721] usb 1-3.4.2: SerialNumber: 20201111000001
[=C2=A0 =C2=A067.568816] DEBUG: drivers/hid/hid-quirks.c 1227 hid_gets_sq=
uirk=20
hdev->version =3D 0x100
[=C2=A0 =C2=A067.568827] DEBUG: drivers/hid/hid-quirks.c 1025 hid_ignore=20
hdev->version =3D 0x100
[=C2=A0 =C2=A067.568832] DEBUG: drivers/hid/hid-quirks.c 1227 hid_gets_sq=
uirk=20
hdev->version =3D 0x100
[=C2=A0 =C2=A067.569256] DEBUG: drivers/hid/hid-quirks.c 1227 hid_gets_sq=
uirk=20
hdev->version =3D 0x201


[=C2=A0 =C2=A039.692821] DEBUG: drivers/hid/usbhid/hid-core.c 985 usbhid_=
parse=20
dev->serial =3D 20201111000001

Later, I thought of using a serial number, Later, I thought of using a=20
serial number, but the headphone serial number was NULL,

and printing it directly would trigger OOPs, at present, I can only=20
consider distinguishing between manufacturers, this is v4 patch.

If there are better ideas or patches, they can also be provided. The=20
microphone device will arrive in a few days, and I will verify it then.

=E5=9C=A8 2025/9/16 7:06, Terry Junge =E5=86=99=E9=81=93:
>
> On 9/15/25 1:37 AM, zhangheng wrote:
>> Apply this new patch and test the kernel again. I don't have the origi=
nal mic device in my hands, which means I have to wait for a response for=
 testing now.
>>
>> You can test it first, and the other mic device also needs to be retes=
ted
> Your patch will not work as you expect for two reasons.
>
> 	if (hid_match_id(hdev, hid_ignore_list) ||
> 	   (hid_match_id(hdev, hid_ignore_mic) && (hdev->version > 1.1)))
>   		quirks |=3D HID_QUIRK_IGNORE;
>
> hdev->version is U32 not float. Version (bcdDevice) 1.00 would be 0x010=
0. The value 1.1 is probably cast to 0x0001.
>
> Second, both devices have identical VID, PID, bcdDevice, and Product na=
mes.
>
> [  563.104908] usb 1-1.4.1.2: New USB device found, idVendor=3D4c4a, id=
Product=3D4155, bcdDevice=3D 1.00
> [  563.104910] usb 1-1.4.1.2: New USB device strings: Mfr=3D1, Product=3D=
2, SerialNumber=3D3
> [  563.104911] usb 1-1.4.1.2: Product: USB Composite Device
> [  563.104912] usb 1-1.4.1.2: Manufacturer: SmartlinkTechnology
> [  563.104913] usb 1-1.4.1.2: SerialNumber: 20201111000001
>
> [   10.451534] usb 3-3: New USB device found, idVendor=3D4c4a, idProduc=
t=3D4155, bcdDevice=3D 1.00
> [   10.451540] usb 3-3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [   10.451543] usb 3-3: Product: USB Composite Device
> [   10.451545] usb 3-3: Manufacturer: Jieli Technology
> [   10.451546] usb 3-3: SerialNumber: FFFFFFFFFFFFFFFF
>
> If you could get the descriptors for the microphone device, it would be=
 helpful.
>
> Thanks,
> Terry
>
>> =E5=9C=A8 2025/9/13 21:11, Staffan Melin =E5=86=99=E9=81=93:
>>> Ah, thanks, I get it now :)
>>>
>>> So I got 6.16.7, and the patch applied without problems.
>>>
>>> But no luck, the same results as before: touchscreen not working, xin=
put --list not showing the Jieli touchscreen. dmesg shows the same as bef=
ore, too.
>>>
>>> Best regards,
>>>
>>> Staffan
>>>
>>>
>>> On 2025-09-13 10:55, Salvatore Bonaccorso wrote:
>>>> Hi Staffan,
>>>>
>>>> chiming in hopefully it is of help.
>>>>
>>>> Now really with the patch ...
>>>>
>>>> On Fri, Sep 12, 2025 at 09:57:04PM +0200, Staffan Melin wrote:
>>>>> Thank you,
>>>>>
>>>>> I tried to apply this patch to 6.12.39, the first problematic kerne=
l, as
>>>>> well as 6.12.41, the first bad I tried, and on both I got an error =
message:
>>>>>
>>>>> Applying: HID: quirks: Add device descriptor for 4c4a:4155
>>>>> error: patch failed: drivers/hid/hid-quirks.c:1068
>>>>> error: drivers/hid/hid-quirks.c: patch does not apply
>>>>> Patch failed at 0001 HID: quirks: Add device descriptor for 4c4a:41=
55
>>>>>
>>>>> To which kernel version should I apply the patch?
>>>> As the deveopment goes from mainline then down to stable series, the
>>>> fix needs to be developed first for mainline. So the patch is target=
ed
>>>> there.
>>>>
>>>> But please find attached an updated patch which hopefully should wor=
k
>>>> which resolved the context changes on top of 6.12.47.
>>>>
>>>> But ideally you can provide a Tested-by on zhangheng's mainline patc=
h
>>>> to get things rolling as needed.
>>>>
>>>> Regards,
>>>> Salvatore
--------------SA6EzbNlmSo5yvY1VkPGo0CS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>It's interesting that I found another USB device with the same
      ID, but it's a USB headphone,=C2=A0<span style=3D"white-space: pre;=
"
data-slate-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQy=
UyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJWUWFKd1hPWXFWJTIyJTJDJTI=
ycGFyYUlkeCUyMiUzQTAlMkMlMjJzcmMlMjIlM0ElMjJkZXZpY2UlMjBkZXNjcmlwdG9ycyUy=
MGlzJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU4JUFFJUJFJUU1JUE0JTg3JUU2JThGJThGJUU4J=
UJGJUIwJUU3JUFDJUE2JUU2JTk4JUFGJTIyJTJDJTIybWV0YWRhdGElMjIlM0ElMjIlMjIlMk=
MlMjJtYXRjaGVzJTIyJTNBbnVsbCUyQyUyMnRyYW5zbGF0ZWRCeSUyMiUzQW51bGwlMkMlMjJ=
tZXRhRGF0YSUyMiUzQSU1QiU1RCUyQyUyMnRleHQlMjIlM0ElMjJkZXZpY2UlMjBkZXNjcmlw=
dG9ycyUyMGlzJTIyJTdEJTVEJTdEJTVE">device descriptors in headphone.txt</sp=
an></p>
    <p><span style=3D"white-space: pre;"
data-slate-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQy=
UyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJWUWFKd1hPWXFWJTIyJTJDJTI=
ycGFyYUlkeCUyMiUzQTAlMkMlMjJzcmMlMjIlM0ElMjJkZXZpY2UlMjBkZXNjcmlwdG9ycyUy=
MGlzJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU4JUFFJUJFJUU1JUE0JTg3JUU2JThGJThGJUU4J=
UJGJUIwJUU3JUFDJUE2JUU2JTk4JUFGJTIyJTJDJTIybWV0YWRhdGElMjIlM0ElMjIlMjIlMk=
MlMjJtYXRjaGVzJTIyJTNBbnVsbCUyQyUyMnRyYW5zbGF0ZWRCeSUyMiUzQW51bGwlMkMlMjJ=
tZXRhRGF0YSUyMiUzQSU1QiU1RCUyQyUyMnRleHQlMjIlM0ElMjJkZXZpY2UlMjBkZXNjcmlw=
dG9ycyUyMGlzJTIyJTdEJTVEJTdEJTVE">Microphone.txt is the device descriptor=
 for SMARTLINKTechnology.</span></p>
    <p><span style=3D"white-space: pre;"
data-slate-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQy=
UyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJWUWFKd1hPWXFWJTIyJTJDJTI=
ycGFyYUlkeCUyMiUzQTAlMkMlMjJzcmMlMjIlM0ElMjJkZXZpY2UlMjBkZXNjcmlwdG9ycyUy=
MGlzJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU4JUFFJUJFJUU1JUE0JTg3JUU2JThGJThGJUU4J=
UJGJUIwJUU3JUFDJUE2JUU2JTk4JUFGJTIyJTJDJTIybWV0YWRhdGElMjIlM0ElMjIlMjIlMk=
MlMjJtYXRjaGVzJTIyJTNBbnVsbCUyQyUyMnRyYW5zbGF0ZWRCeSUyMiUzQW51bGwlMkMlMjJ=
tZXRhRGF0YSUyMiUzQSU1QiU1RCUyQyUyMnRleHQlMjIlM0ElMjJkZXZpY2UlMjBkZXNjcmlw=
dG9ycyUyMGlzJTIyJTdEJTVEJTdEJTVE">I was originally planning to differenti=
ate according to bcdHID, but there is hdev -&gt;version=3D0x100, therefor=
e, I created the v3 patch.</span></p>
    <p><span style=3D"white-space: pre;"
data-slate-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQy=
UyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJWUWFKd1hPWXFWJTIyJTJDJTI=
ycGFyYUlkeCUyMiUzQTAlMkMlMjJzcmMlMjIlM0ElMjJkZXZpY2UlMjBkZXNjcmlwdG9ycyUy=
MGlzJTIyJTJDJTIyZHN0JTIyJTNBJTIyJUU4JUFFJUJFJUU1JUE0JTg3JUU2JThGJThGJUU4J=
UJGJUIwJUU3JUFDJUE2JUU2JTk4JUFGJTIyJTJDJTIybWV0YWRhdGElMjIlM0ElMjIlMjIlMk=
MlMjJtYXRjaGVzJTIyJTNBbnVsbCUyQyUyMnRyYW5zbGF0ZWRCeSUyMiUzQW51bGwlMkMlMjJ=
tZXRhRGF0YSUyMiUzQSU1QiU1RCUyQyUyMnRleHQlMjIlM0ElMjJkZXZpY2UlMjBkZXNjcmlw=
dG9ycyUyMGlzJTIyJTdEJTVEJTdEJTVE">The microphone device is normal, but I'=
m not sure if your touchscreen function is working properly.</span></p>
    <p>[=C2=A0 =C2=A067.417805] usb 1-3.4.2: new full-speed USB device nu=
mber 11
      using xhci_hcd<br>
      [=C2=A0 =C2=A067.566700] usb 1-3.4.2: New USB device found, idVendo=
r=3D4c4a,
      idProduct=3D4155, bcdDevice=3D 1.00<br>
      [=C2=A0 =C2=A067.566707] usb 1-3.4.2: New USB device strings: Mfr=3D=
1,
      Product=3D2, SerialNumber=3D3<br>
      [=C2=A0 =C2=A067.566712] usb 1-3.4.2: Product: USB Composite Device=
<br>
      [=C2=A0 =C2=A067.566717] usb 1-3.4.2: Manufacturer: SmartlinkTechno=
logy<br>
      [=C2=A0 =C2=A067.566721] usb 1-3.4.2: SerialNumber: 20201111000001<=
br>
      [=C2=A0 =C2=A067.568816] DEBUG: drivers/hid/hid-quirks.c 1227
      hid_gets_squirk hdev-&gt;version =3D 0x100<br>
      [=C2=A0 =C2=A067.568827] DEBUG: drivers/hid/hid-quirks.c 1025 hid_i=
gnore
      hdev-&gt;version =3D 0x100<br>
      [=C2=A0 =C2=A067.568832] DEBUG: drivers/hid/hid-quirks.c 1227
      hid_gets_squirk hdev-&gt;version =3D 0x100<br>
      [=C2=A0 =C2=A067.569256] DEBUG: drivers/hid/hid-quirks.c 1227
      hid_gets_squirk hdev-&gt;version =3D 0x201<br>
    </p>
    <p><br>
    </p>
    <p>[=C2=A0 =C2=A039.692821] DEBUG: drivers/hid/usbhid/hid-core.c 985
      usbhid_parse dev-&gt;serial =3D 20201111000001<br>
    </p>
    <p><span style=3D"white-space: pre-wrap"> Later, I thought of using a=
 serial number, Later, I thought of using a serial number, but the headph=
one serial number was NULL,</span></p>
    <p><span style=3D"white-space: pre-wrap">and printing it directly wou=
ld trigger OOPs, at present, I can only consider distinguishing between m=
anufacturers, this is v4 patch.</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">If there are better ideas or=
 patches, they can also be provided. The microphone device will arrive in=
 a few days, and I will verify it then.</span></p>
    <div class=3D"moz-cite-prefix">=E5=9C=A8 2025/9/16 7:06, Terry Junge =
=E5=86=99=E9=81=93:=C2=A0</div>
    <blockquote type=3D"cite"
cite=3D"mid:735c20da-c052-4528-ad91-185a835ca40c@cosmicgizmosystems.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

On 9/15/25 1:37 AM, zhangheng wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">Apply this new patch and t=
est the kernel again. I don't have the original mic device in my hands, w=
hich means I have to wait for a response for testing now.

You can test it first, and the other mic device also needs to be retested
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Your patch will not work as you expect for two reasons.

	if (hid_match_id(hdev, hid_ignore_list) ||
	   (hid_match_id(hdev, hid_ignore_mic) &amp;&amp; (hdev-&gt;version &gt;=
 1.1)))
 		quirks |=3D HID_QUIRK_IGNORE;

hdev-&gt;version is U32 not float. Version (bcdDevice) 1.00 would be 0x01=
00. The value 1.1 is probably cast to 0x0001.

Second, both devices have identical VID, PID, bcdDevice, and Product name=
s.

[  563.104908] usb 1-1.4.1.2: New USB device found, idVendor=3D4c4a, idPr=
oduct=3D4155, bcdDevice=3D 1.00
[  563.104910] usb 1-1.4.1.2: New USB device strings: Mfr=3D1, Product=3D=
2, SerialNumber=3D3
[  563.104911] usb 1-1.4.1.2: Product: USB Composite Device
[  563.104912] usb 1-1.4.1.2: Manufacturer: SmartlinkTechnology
[  563.104913] usb 1-1.4.1.2: SerialNumber: 20201111000001

[   10.451534] usb 3-3: New USB device found, idVendor=3D4c4a, idProduct=3D=
4155, bcdDevice=3D 1.00
[   10.451540] usb 3-3: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
[   10.451543] usb 3-3: Product: USB Composite Device
[   10.451545] usb 3-3: Manufacturer: Jieli Technology
[   10.451546] usb 3-3: SerialNumber: FFFFFFFFFFFFFFFF

If you could get the descriptors for the microphone device, it would be h=
elpful.

Thanks,
Terry

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
=E5=9C=A8 2025/9/13 21:11, Staffan Melin =E5=86=99=E9=81=93:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">Ah, thanks, I get it now=
 :)

So I got 6.16.7, and the patch applied without problems.

But no luck, the same results as before: touchscreen not working, xinput =
--list not showing the Jieli touchscreen. dmesg shows the same as before,=
 too.

Best regards,

Staffan


On 2025-09-13 10:55, Salvatore Bonaccorso wrote:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"" class=3D"moz-quote-pre">Hi Staffan,

chiming in hopefully it is of help.

Now really with the patch ...

On Fri, Sep 12, 2025 at 09:57:04PM +0200, Staffan Melin wrote:
</pre>
            <blockquote type=3D"cite">
              <pre wrap=3D"" class=3D"moz-quote-pre">Thank you,

I tried to apply this patch to 6.12.39, the first problematic kernel, as
well as 6.12.41, the first bad I tried, and on both I got an error messag=
e:

Applying: HID: quirks: Add device descriptor for 4c4a:4155
error: patch failed: drivers/hid/hid-quirks.c:1068
error: drivers/hid/hid-quirks.c: patch does not apply
Patch failed at 0001 HID: quirks: Add device descriptor for 4c4a:4155

To which kernel version should I apply the patch?
</pre>
            </blockquote>
            <pre wrap=3D"" class=3D"moz-quote-pre">
As the deveopment goes from mainline then down to stable series, the
fix needs to be developed first for mainline. So the patch is targeted
there.

But please find attached an updated patch which hopefully should work
which resolved the context changes on top of 6.12.47.

But ideally you can provide a Tested-by on zhangheng's mainline patch
to get things rolling as needed.

Regards,
Salvatore
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------SA6EzbNlmSo5yvY1VkPGo0CS--
--------------h0MF0sOh6d3g8Gjxka4L0jMp
Content-Type: text/plain; charset=UTF-8;
 name="v3-0001-HID-quirks-Add-device-descriptor-for-4c4a-4155.patch"
Content-Disposition: attachment;
 filename*0="v3-0001-HID-quirks-Add-device-descriptor-for-4c4a-4155.patch"
Content-Transfer-Encoding: base64

RnJvbSA1ZTRhOTI0NWRlMTQyYTBiYzA4NzdhM2Q1MGZiZTAxMzU5YTY1MDIyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBaaGFuZyBIZW5nIDx6aGFuZ2hlbmdAa3lsaW5vcy5j
bj4KRGF0ZTogRnJpLCAxMiBTZXAgMjAyNSAyMDozODoxOCArMDgwMApTdWJqZWN0OiBbUEFU
Q0ggdjNdIEhJRDogcXVpcmtzOiBBZGQgZGV2aWNlIGRlc2NyaXB0b3IgZm9yIDRjNGE6NDE1
NQoKTXVsdGlwbGUgVVNCIGRldmljZXMgdXNlIHRoZSBzYW1lIElELiBUbyBhdm9pZCBhZmZl
Y3RpbmcgZnVuY3Rpb25hbGl0eSwKZGV2aWNlIGRlc2NyaXB0b3JzIGFyZSBhZGRlZCB0byBk
aXN0aW5ndWlzaCBiZXR3ZWVuIHRoZW0KClNpZ25lZC1vZmYtYnk6IFpoYW5nIEhlbmcgPHpo
YW5naGVuZ0BreWxpbm9zLmNuPgotLS0KIGRyaXZlcnMvaGlkL2hpZC1xdWlya3MuYyB8IDI0
ICsrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtcXVpcmtzLmMgYi9kcml2ZXJz
L2hpZC9oaWQtcXVpcmtzLmMKaW5kZXggZmZkMDM0NTY2ZTJlLi5lMWE2YmEwZTA2OWEgMTAw
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
MDY4LDYgKzEwNzksMTMgQEAgYm9vbCBoaWRfaWdub3JlKHN0cnVjdCBoaWRfZGV2aWNlICpo
ZGV2KQogCSAgICBoZGV2LT5xdWlya3MgJiBISURfUVVJUktfSUdOT1JFX01PVVNFKQogCQly
ZXR1cm4gdHJ1ZTsKIAorCWlmIChoaWRfbWF0Y2hfaWQoaGRldiwgaGlkX2lnbm9yZV9taWMp
ICYmIChoZGV2LT52ZXJzaW9uID09IDB4MjAxKSkKKwkJcmV0dXJuIHRydWU7CisJaWYgKGhp
ZF9tYXRjaF9pZChoZGV2LCBoaWRfaWdub3JlX21pYykgJiYgKGhkZXYtPnZlcnNpb24gPT0g
MHgyMDEpKQorCQlyZXR1cm4gdHJ1ZTsKKworCXByX2VycigiREVCVUc6ICVzICVkICVzIGhk
ZXYtPnZlcnNpb24gPSAweCV4XG4iLCBfX0ZJTEVfXywgX19MSU5FX18sIF9fZnVuY19fLCBo
ZGV2LT52ZXJzaW9uKTsKKwogCXJldHVybiAhIWhpZF9tYXRjaF9pZChoZGV2LCBoaWRfaWdu
b3JlX2xpc3QpOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoaGlkX2lnbm9yZSk7CkBAIC0xMjY4
LDYgKzEyODYsMTIgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgaGlkX2dldHNfc3F1aXJrKGNv
bnN0IHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2KQogCiAJaWYgKGhpZF9tYXRjaF9pZChoZGV2
LCBoaWRfaWdub3JlX2xpc3QpKQogCQlxdWlya3MgfD0gSElEX1FVSVJLX0lHTk9SRTsKKwlp
ZiAoaGlkX21hdGNoX2lkKGhkZXYsIGhpZF9pZ25vcmVfbWljKSAmJiAoaGRldi0+dmVyc2lv
biA9PSAweDIwMSkpCisJCXF1aXJrcyB8PSBISURfUVVJUktfSUdOT1JFOworCWlmIChoaWRf
bWF0Y2hfaWQoaGRldiwgaGlkX2lnbm9yZV9taWMpICYmIChoZGV2LT52ZXJzaW9uID09IDB4
MTAwKSkKKwkJcXVpcmtzIHw9IEhJRF9RVUlSS19JR05PUkU7CisKKwlwcl9lcnIoIkRFQlVH
OiAlcyAlZCAlcyBoZGV2LT52ZXJzaW9uID0gMHgleFxuIiwgX19GSUxFX18sIF9fTElORV9f
LCBfX2Z1bmNfXywgaGRldi0+dmVyc2lvbik7CiAKIAlpZiAoaGlkX21hdGNoX2lkKGhkZXYs
IGhpZF9tb3VzZV9pZ25vcmVfbGlzdCkpCiAJCXF1aXJrcyB8PSBISURfUVVJUktfSUdOT1JF
X01PVVNFOwotLSAKMi40Ny4xCgo=
--------------h0MF0sOh6d3g8Gjxka4L0jMp
Content-Type: text/plain; charset=UTF-8;
 name="v4-0001-HID-quirks-Add-device-descriptor-for-4c4a-4155.patch"
Content-Disposition: attachment;
 filename*0="v4-0001-HID-quirks-Add-device-descriptor-for-4c4a-4155.patch"
Content-Transfer-Encoding: base64

RnJvbSA1NWQyY2NkYWJhMzZjNmNmOWEzNjM5ZDA4M2MxMDg5ZjMzMjBhMzQ3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBaaGFuZyBIZW5nIDx6aGFuZ2hlbmdAa3lsaW5vcy5j
bj4KRGF0ZTogVGh1LCAxOCBTZXAgMjAyNSAyMTozNzowNyArMDgwMApTdWJqZWN0OiBbUEFU
Q0ggdjRdIEhJRDogcXVpcmtzOiBBZGQgZGV2aWNlIGRlc2NyaXB0b3IgZm9yIDRjNGE6NDE1
NQoKTXVsdGlwbGUgVVNCIGRldmljZXMgdXNlIHRoZSBzYW1lIElELiBUbyBhdm9pZCBhZmZl
Y3RpbmcgZnVuY3Rpb25hbGl0eSwKZGV2aWNlIGRlc2NyaXB0b3JzIGFyZSBhZGRlZCB0byBk
aXN0aW5ndWlzaCBiZXR3ZWVuIHRoZW0KClNpZ25lZC1vZmYtYnk6IFpoYW5nIEhlbmcgPHpo
YW5naGVuZ0BreWxpbm9zLmNuPgotLS0KIGRyaXZlcnMvaGlkL3VzYmhpZC9oaWQtY29yZS5j
IHwgMTEgKysrKysrKysrKysKIGRyaXZlcnMvaGlkL3VzYmhpZC91c2JoaWQuaCAgIHwgIDIg
KysKIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaGlkL3VzYmhpZC9oaWQtY29yZS5jIGIvZHJpdmVycy9oaWQvdXNiaGlkL2hpZC1j
b3JlLmMKaW5kZXggYWFjMDA1MWEyY2Y2Li5kMGI5OTRmOTdmY2MgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvaGlkL3VzYmhpZC9oaWQtY29yZS5jCisrKyBiL2RyaXZlcnMvaGlkL3VzYmhpZC9o
aWQtY29yZS5jCkBAIC05OTIsNiArOTkyLDEyIEBAIHN0YXRpYyBpbnQgdXNiaGlkX3BhcnNl
KHN0cnVjdCBoaWRfZGV2aWNlICpoaWQpCiAKIAlxdWlya3MgPSBoaWRfbG9va3VwX3F1aXJr
KGhpZCk7CiAKKwlpZiAoKGhpZC0+dmVuZG9yID09IFVTQl9WRU5ET1JfSURfU01BUlRMSU5L
VEVDSE5PTE9HWSkgJiYgKGhpZC0+cHJvZHVjdCA9PSBVU0JfREVWSUNFX0lEX1NNQVJUTElO
S1RFQ0hOT0xPR1lfNDE1NSkpIHsKKwkJaWYoc3RyY21wKGRldi0+bWFudWZhY3R1cmVyLCAi
U21hcnRsaW5rVGVjaG5vbG9neSIpID09IDApIHsKKwkJCXF1aXJrcyB8PSBISURfUVVJUktf
SUdOT1JFOworCQl9CisJfQorCiAJaWYgKHF1aXJrcyAmIEhJRF9RVUlSS19JR05PUkUpCiAJ
CXJldHVybiAtRU5PREVWOwogCkBAIC0xNDMyLDYgKzE0MzgsMTEgQEAgc3RhdGljIGludCB1
c2JoaWRfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsIGNvbnN0IHN0cnVjdCB1
c2JfZGV2aWNlX2lkICoKIAlzcGluX2xvY2tfaW5pdCgmdXNiaGlkLT5sb2NrKTsKIAltdXRl
eF9pbml0KCZ1c2JoaWQtPm11dGV4KTsKIAorCWlmICgoaGlkLT52ZW5kb3IgPT0gVVNCX1ZF
TkRPUl9JRF9TTUFSVExJTktURUNITk9MT0dZKSAmJiAoaGlkLT5wcm9kdWN0ID09IFVTQl9E
RVZJQ0VfSURfU01BUlRMSU5LVEVDSE5PTE9HWV80MTU1KSkgeworCQlpZihzdHJjbXAoZGV2
LT5tYW51ZmFjdHVyZXIsICJTbWFydGxpbmtUZWNobm9sb2d5IikgPT0gMCkKKwkJCXJldHVy
biAwOworCisJfQogCXJldCA9IGhpZF9hZGRfZGV2aWNlKGhpZCk7CiAJaWYgKHJldCkgewog
CQlpZiAocmV0ICE9IC1FTk9ERVYpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC91c2JoaWQv
dXNiaGlkLmggYi9kcml2ZXJzL2hpZC91c2JoaWQvdXNiaGlkLmgKaW5kZXggNzVmZTg1ZDNk
MjdhLi4zNzYwYzczYzM0NTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaGlkL3VzYmhpZC91c2Jo
aWQuaAorKysgYi9kcml2ZXJzL2hpZC91c2JoaWQvdXNiaGlkLmgKQEAgLTQ4LDYgKzQ4LDgg
QEAgc3RydWN0IHVzYl9pbnRlcmZhY2UgKnVzYmhpZF9maW5kX2ludGVyZmFjZShpbnQgbWlu
b3IpOwogICovCiAjZGVmaW5lIEhJRF9JTl9QT0xMSU5HCQkxNAogCisjZGVmaW5lIFVTQl9W
RU5ET1JfSURfU01BUlRMSU5LVEVDSE5PTE9HWQkJMHg0YzRhCisjZGVmaW5lIFVTQl9ERVZJ
Q0VfSURfU01BUlRMSU5LVEVDSE5PTE9HWV80MTU1CQkweDQxNTUKIC8qCiAgKiBVU0Itc3Bl
Y2lmaWMgSElEIHN0cnVjdCwgdG8gYmUgcG9pbnRlZCB0bwogICogZnJvbSBzdHJ1Y3QgaGlk
X2RldmljZS0+ZHJpdmVyX2RhdGEKLS0gCjIuNDcuMQoK
--------------h0MF0sOh6d3g8Gjxka4L0jMp
Content-Type: text/plain; charset=UTF-8; name="headphone.txt"
Content-Disposition: attachment; filename="headphone.txt"
Content-Transfer-Encoding: base64

QnVzIDAwMSBEZXZpY2UgMDA2OiBJRCA0YzRhOjQxNTUgSmllbGkgVGVjaG5vbG9neSBVQUNE
ZW1vVjEuMA0KRGV2aWNlIERlc2NyaXB0b3I6DQogIGJMZW5ndGggICAgICAgICAgICAgICAg
MTgNCiAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgMQ0KICBiY2RVU0IgICAgICAgICAgICAg
ICAxLjEwDQogIGJEZXZpY2VDbGFzcyAgICAgICAgICAgIDAgDQogIGJEZXZpY2VTdWJDbGFz
cyAgICAgICAgIDAgDQogIGJEZXZpY2VQcm90b2NvbCAgICAgICAgIDAgDQogIGJNYXhQYWNr
ZXRTaXplMCAgICAgICAgNjQNCiAgaWRWZW5kb3IgICAgICAgICAgIDB4NGM0YSANCiAgaWRQ
cm9kdWN0ICAgICAgICAgIDB4NDE1NSANCiAgYmNkRGV2aWNlICAgICAgICAgICAgMS4wMA0K
ICBpTWFudWZhY3R1cmVyICAgICAgICAgICAxIEppZWxpIFRlY2hub2xvZ3kNCiAgaVByb2R1
Y3QgICAgICAgICAgICAgICAgMiBVQUNEZW1vVjEuMA0KICBpU2VyaWFsICAgICAgICAgICAg
ICAgICAwIA0KICBiTnVtQ29uZmlndXJhdGlvbnMgICAgICAxDQogIENvbmZpZ3VyYXRpb24g
RGVzY3JpcHRvcjoNCiAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5DQogICAgYkRlc2Ny
aXB0b3JUeXBlICAgICAgICAgMg0KICAgIHdUb3RhbExlbmd0aCAgICAgICAweDAwZTENCiAg
ICBiTnVtSW50ZXJmYWNlcyAgICAgICAgICA0DQogICAgYkNvbmZpZ3VyYXRpb25WYWx1ZSAg
ICAgMQ0KICAgIGlDb25maWd1cmF0aW9uICAgICAgICAgIDAgDQogICAgYm1BdHRyaWJ1dGVz
ICAgICAgICAgMHg4MA0KICAgICAgKEJ1cyBQb3dlcmVkKQ0KICAgIE1heFBvd2VyICAgICAg
ICAgICAgICAxMDBtQQ0KICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOg0KICAgICAgYkxlbmd0
aCAgICAgICAgICAgICAgICAgOQ0KICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNA0K
ICAgICAgYkludGVyZmFjZU51bWJlciAgICAgICAgMA0KICAgICAgYkFsdGVybmF0ZVNldHRp
bmcgICAgICAgMA0KICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMA0KICAgICAgYklu
dGVyZmFjZUNsYXNzICAgICAgICAgMSBBdWRpbw0KICAgICAgYkludGVyZmFjZVN1YkNsYXNz
ICAgICAgMSBDb250cm9sIERldmljZQ0KICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAg
MCANCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDggDQogICAgICBBdWRpb0NvbnRy
b2wgSW50ZXJmYWNlIERlc2NyaXB0b3I6DQogICAgICAgIGJMZW5ndGggICAgICAgICAgICAg
ICAgMTANCiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzNg0KICAgICAgICBiRGVz
Y3JpcHRvclN1YnR5cGUgICAgICAxIChIRUFERVIpDQogICAgICAgIGJjZEFEQyAgICAgICAg
ICAgICAgIDEuMDANCiAgICAgICAgd1RvdGFsTGVuZ3RoICAgICAgIDB4MDA0Nw0KICAgICAg
ICBiSW5Db2xsZWN0aW9uICAgICAgICAgICAyDQogICAgICAgIGJhSW50ZXJmYWNlTnIoMCkg
ICAgICAgIDENCiAgICAgICAgYmFJbnRlcmZhY2VOcigxKSAgICAgICAgMg0KICAgICAgQXVk
aW9Db250cm9sIEludGVyZmFjZSBEZXNjcmlwdG9yOg0KICAgICAgICBiTGVuZ3RoICAgICAg
ICAgICAgICAgIDEyDQogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMzYNCiAgICAg
ICAgYkRlc2NyaXB0b3JTdWJ0eXBlICAgICAgMiAoSU5QVVRfVEVSTUlOQUwpDQogICAgICAg
IGJUZXJtaW5hbElEICAgICAgICAgICAgIDENCiAgICAgICAgd1Rlcm1pbmFsVHlwZSAgICAg
IDB4MDEwMSBVU0IgU3RyZWFtaW5nDQogICAgICAgIGJBc3NvY1Rlcm1pbmFsICAgICAgICAg
IDANCiAgICAgICAgYk5yQ2hhbm5lbHMgICAgICAgICAgICAgMg0KICAgICAgICB3Q2hhbm5l
bENvbmZpZyAgICAgMHgwMDAzDQogICAgICAgICAgTGVmdCBGcm9udCAoTCkNCiAgICAgICAg
ICBSaWdodCBGcm9udCAoUikNCiAgICAgICAgaUNoYW5uZWxOYW1lcyAgICAgICAgICAgMCAN
CiAgICAgICAgaVRlcm1pbmFsICAgICAgICAgICAgICAgMCANCiAgICAgIEF1ZGlvQ29udHJv
bCBJbnRlcmZhY2UgRGVzY3JpcHRvcjoNCiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAg
ICAxMg0KICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2DQogICAgICAgIGJEZXNj
cmlwdG9yU3VidHlwZSAgICAgIDIgKElOUFVUX1RFUk1JTkFMKQ0KICAgICAgICBiVGVybWlu
YWxJRCAgICAgICAgICAgICA0DQogICAgICAgIHdUZXJtaW5hbFR5cGUgICAgICAweDAyMDEg
TWljcm9waG9uZQ0KICAgICAgICBiQXNzb2NUZXJtaW5hbCAgICAgICAgICAwDQogICAgICAg
IGJOckNoYW5uZWxzICAgICAgICAgICAgIDENCiAgICAgICAgd0NoYW5uZWxDb25maWcgICAg
IDB4MDAwMA0KICAgICAgICBpQ2hhbm5lbE5hbWVzICAgICAgICAgICAwIA0KICAgICAgICBp
VGVybWluYWwgICAgICAgICAgICAgICAwIA0KICAgICAgQXVkaW9Db250cm9sIEludGVyZmFj
ZSBEZXNjcmlwdG9yOg0KICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5DQogICAg
ICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMzYNCiAgICAgICAgYkRlc2NyaXB0b3JTdWJ0
eXBlICAgICAgMyAoT1VUUFVUX1RFUk1JTkFMKQ0KICAgICAgICBiVGVybWluYWxJRCAgICAg
ICAgICAgICAzDQogICAgICAgIHdUZXJtaW5hbFR5cGUgICAgICAweDAzMDEgU3BlYWtlcg0K
ICAgICAgICBiQXNzb2NUZXJtaW5hbCAgICAgICAgICAwDQogICAgICAgIGJTb3VyY2VJRCAg
ICAgICAgICAgICAgIDINCiAgICAgICAgaVRlcm1pbmFsICAgICAgICAgICAgICAgMCANCiAg
ICAgIEF1ZGlvQ29udHJvbCBJbnRlcmZhY2UgRGVzY3JpcHRvcjoNCiAgICAgICAgYkxlbmd0
aCAgICAgICAgICAgICAgICAgOQ0KICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2
DQogICAgICAgIGJEZXNjcmlwdG9yU3VidHlwZSAgICAgIDMgKE9VVFBVVF9URVJNSU5BTCkN
CiAgICAgICAgYlRlcm1pbmFsSUQgICAgICAgICAgICAgNg0KICAgICAgICB3VGVybWluYWxU
eXBlICAgICAgMHgwMTAxIFVTQiBTdHJlYW1pbmcNCiAgICAgICAgYkFzc29jVGVybWluYWwg
ICAgICAgICAgMg0KICAgICAgICBiU291cmNlSUQgICAgICAgICAgICAgICA3DQogICAgICAg
IGlUZXJtaW5hbCAgICAgICAgICAgICAgIDAgDQogICAgICBBdWRpb0NvbnRyb2wgSW50ZXJm
YWNlIERlc2NyaXB0b3I6DQogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcNCiAg
ICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzNg0KICAgICAgICBiRGVzY3JpcHRvclN1
YnR5cGUgICAgICA1IChTRUxFQ1RPUl9VTklUKQ0KICAgICAgICBiVW5pdElEICAgICAgICAg
ICAgICAgICA3DQogICAgICAgIGJOckluUGlucyAgICAgICAgICAgICAgIDENCiAgICAgICAg
YmFTb3VyY2VJRCgwKSAgICAgICAgICAgNQ0KICAgICAgICBpU2VsZWN0b3IgICAgICAgICAg
ICAgICAwIA0KICAgICAgQXVkaW9Db250cm9sIEludGVyZmFjZSBEZXNjcmlwdG9yOg0KICAg
ICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgIDEwDQogICAgICAgIGJEZXNjcmlwdG9yVHlw
ZSAgICAgICAgMzYNCiAgICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBlICAgICAgNiAoRkVBVFVS
RV9VTklUKQ0KICAgICAgICBiVW5pdElEICAgICAgICAgICAgICAgICAyDQogICAgICAgIGJT
b3VyY2VJRCAgICAgICAgICAgICAgIDENCiAgICAgICAgYkNvbnRyb2xTaXplICAgICAgICAg
ICAgMQ0KICAgICAgICBibWFDb250cm9scygwKSAgICAgICAweDAxDQogICAgICAgICAgTXV0
ZSBDb250cm9sDQogICAgICAgIGJtYUNvbnRyb2xzKDEpICAgICAgIDB4MDINCiAgICAgICAg
ICBWb2x1bWUgQ29udHJvbA0KICAgICAgICBibWFDb250cm9scygyKSAgICAgICAweDAyDQog
ICAgICAgICAgVm9sdW1lIENvbnRyb2wNCiAgICAgICAgaUZlYXR1cmUgICAgICAgICAgICAg
ICAgMCANCiAgICAgIEF1ZGlvQ29udHJvbCBJbnRlcmZhY2UgRGVzY3JpcHRvcjoNCiAgICAg
ICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQ0KICAgICAgICBiRGVzY3JpcHRvclR5cGUg
ICAgICAgIDM2DQogICAgICAgIGJEZXNjcmlwdG9yU3VidHlwZSAgICAgIDYgKEZFQVRVUkVf
VU5JVCkNCiAgICAgICAgYlVuaXRJRCAgICAgICAgICAgICAgICAgNQ0KICAgICAgICBiU291
cmNlSUQgICAgICAgICAgICAgICA0DQogICAgICAgIGJDb250cm9sU2l6ZSAgICAgICAgICAg
IDENCiAgICAgICAgYm1hQ29udHJvbHMoMCkgICAgICAgMHg0Mw0KICAgICAgICAgIE11dGUg
Q29udHJvbA0KICAgICAgICAgIFZvbHVtZSBDb250cm9sDQogICAgICAgICAgQXV0b21hdGlj
IEdhaW4gQ29udHJvbA0KICAgICAgICBibWFDb250cm9scygxKSAgICAgICAweDAwDQogICAg
ICAgIGlGZWF0dXJlICAgICAgICAgICAgICAgIDAgDQogICAgSW50ZXJmYWNlIERlc2NyaXB0
b3I6DQogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5DQogICAgICBiRGVzY3JpcHRv
clR5cGUgICAgICAgICA0DQogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAxDQogICAg
ICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAwDQogICAgICBiTnVtRW5kcG9pbnRzICAgICAg
ICAgICAwDQogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgICAxIEF1ZGlvDQogICAgICBi
SW50ZXJmYWNlU3ViQ2xhc3MgICAgICAyIFN0cmVhbWluZw0KICAgICAgYkludGVyZmFjZVBy
b3RvY29sICAgICAgMCANCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgDQogICAg
SW50ZXJmYWNlIERlc2NyaXB0b3I6DQogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5
DQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0DQogICAgICBiSW50ZXJmYWNlTnVt
YmVyICAgICAgICAxDQogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAxDQogICAgICBi
TnVtRW5kcG9pbnRzICAgICAgICAgICAxDQogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAg
ICAxIEF1ZGlvDQogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAyIFN0cmVhbWluZw0K
ICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAgMCANCiAgICAgIGlJbnRlcmZhY2UgICAg
ICAgICAgICAgIDAgDQogICAgICBBdWRpb1N0cmVhbWluZyBJbnRlcmZhY2UgRGVzY3JpcHRv
cjoNCiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNw0KICAgICAgICBiRGVzY3Jp
cHRvclR5cGUgICAgICAgIDM2DQogICAgICAgIGJEZXNjcmlwdG9yU3VidHlwZSAgICAgIDEg
KEFTX0dFTkVSQUwpDQogICAgICAgIGJUZXJtaW5hbExpbmsgICAgICAgICAgIDENCiAgICAg
ICAgYkRlbGF5ICAgICAgICAgICAgICAgICAgMSBmcmFtZXMNCiAgICAgICAgd0Zvcm1hdFRh
ZyAgICAgICAgIDB4MDAwMSBQQ00NCiAgICAgIEF1ZGlvU3RyZWFtaW5nIEludGVyZmFjZSBE
ZXNjcmlwdG9yOg0KICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgIDExDQogICAgICAg
IGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMzYNCiAgICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBl
ICAgICAgMiAoRk9STUFUX1RZUEUpDQogICAgICAgIGJGb3JtYXRUeXBlICAgICAgICAgICAg
IDEgKEZPUk1BVF9UWVBFX0kpDQogICAgICAgIGJOckNoYW5uZWxzICAgICAgICAgICAgIDIN
CiAgICAgICAgYlN1YmZyYW1lU2l6ZSAgICAgICAgICAgMg0KICAgICAgICBiQml0UmVzb2x1
dGlvbiAgICAgICAgIDE2DQogICAgICAgIGJTYW1GcmVxVHlwZSAgICAgICAgICAgIDEgRGlz
Y3JldGUNCiAgICAgICAgdFNhbUZyZXFbIDBdICAgICAgICA0ODAwMA0KICAgICAgRW5kcG9p
bnQgRGVzY3JpcHRvcjoNCiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQ0KICAg
ICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1DQogICAgICAgIGJFbmRwb2ludEFkZHJl
c3MgICAgIDB4MDMgIEVQIDMgT1VUDQogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAg
IDkNCiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAgICAgICAgSXNvY2hyb25vdXMNCiAg
ICAgICAgICBTeW5jaCBUeXBlICAgICAgICAgICAgICAgQWRhcHRpdmUNCiAgICAgICAgICBV
c2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQ0KICAgICAgICB3TWF4UGFja2V0U2l6ZSAg
ICAgMHgwMGM0ICAxeCAxOTYgYnl0ZXMNCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAg
ICAgMQ0KICAgICAgICBiUmVmcmVzaCAgICAgICAgICAgICAgICAwDQogICAgICAgIGJTeW5j
aEFkZHJlc3MgICAgICAgICAgIDANCiAgICAgICAgQXVkaW9TdHJlYW1pbmcgRW5kcG9pbnQg
RGVzY3JpcHRvcjoNCiAgICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3DQogICAg
ICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzNw0KICAgICAgICAgIGJEZXNjcmlwdG9y
U3VidHlwZSAgICAgIDEgKEVQX0dFTkVSQUwpDQogICAgICAgICAgYm1BdHRyaWJ1dGVzICAg
ICAgICAgMHgwMA0KICAgICAgICAgIGJMb2NrRGVsYXlVbml0cyAgICAgICAgIDAgVW5kZWZp
bmVkDQogICAgICAgICAgd0xvY2tEZWxheSAgICAgICAgIDB4MDAwMA0KICAgIEludGVyZmFj
ZSBEZXNjcmlwdG9yOg0KICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQ0KICAgICAg
YkRlc2NyaXB0b3JUeXBlICAgICAgICAgNA0KICAgICAgYkludGVyZmFjZU51bWJlciAgICAg
ICAgMg0KICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAgMA0KICAgICAgYk51bUVuZHBv
aW50cyAgICAgICAgICAgMA0KICAgICAgYkludGVyZmFjZUNsYXNzICAgICAgICAgMSBBdWRp
bw0KICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAgMiBTdHJlYW1pbmcNCiAgICAgIGJJ
bnRlcmZhY2VQcm90b2NvbCAgICAgIDAgDQogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAg
ICAwIA0KICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOg0KICAgICAgYkxlbmd0aCAgICAgICAg
ICAgICAgICAgOQ0KICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNA0KICAgICAgYklu
dGVyZmFjZU51bWJlciAgICAgICAgMg0KICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAg
MQ0KICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMQ0KICAgICAgYkludGVyZmFjZUNs
YXNzICAgICAgICAgMSBBdWRpbw0KICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAgMiBT
dHJlYW1pbmcNCiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDAgDQogICAgICBpSW50
ZXJmYWNlICAgICAgICAgICAgICAwIA0KICAgICAgQXVkaW9TdHJlYW1pbmcgSW50ZXJmYWNl
IERlc2NyaXB0b3I6DQogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcNCiAgICAg
ICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzNg0KICAgICAgICBiRGVzY3JpcHRvclN1YnR5
cGUgICAgICAxIChBU19HRU5FUkFMKQ0KICAgICAgICBiVGVybWluYWxMaW5rICAgICAgICAg
ICA2DQogICAgICAgIGJEZWxheSAgICAgICAgICAgICAgICAgIDEgZnJhbWVzDQogICAgICAg
IHdGb3JtYXRUYWcgICAgICAgICAweDAwMDEgUENNDQogICAgICBBdWRpb1N0cmVhbWluZyBJ
bnRlcmZhY2UgRGVzY3JpcHRvcjoNCiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAx
MQ0KICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2DQogICAgICAgIGJEZXNjcmlw
dG9yU3VidHlwZSAgICAgIDIgKEZPUk1BVF9UWVBFKQ0KICAgICAgICBiRm9ybWF0VHlwZSAg
ICAgICAgICAgICAxIChGT1JNQVRfVFlQRV9JKQ0KICAgICAgICBiTnJDaGFubmVscyAgICAg
ICAgICAgICAxDQogICAgICAgIGJTdWJmcmFtZVNpemUgICAgICAgICAgIDINCiAgICAgICAg
YkJpdFJlc29sdXRpb24gICAgICAgICAxNg0KICAgICAgICBiU2FtRnJlcVR5cGUgICAgICAg
ICAgICAxIERpc2NyZXRlDQogICAgICAgIHRTYW1GcmVxWyAwXSAgICAgICAgNDgwMDANCiAg
ICAgIEVuZHBvaW50IERlc2NyaXB0b3I6DQogICAgICAgIGJMZW5ndGggICAgICAgICAgICAg
ICAgIDkNCiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNQ0KICAgICAgICBiRW5k
cG9pbnRBZGRyZXNzICAgICAweDgzICBFUCAzIElODQogICAgICAgIGJtQXR0cmlidXRlcyAg
ICAgICAgICAgIDUNCiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAgICAgICAgSXNvY2hy
b25vdXMNCiAgICAgICAgICBTeW5jaCBUeXBlICAgICAgICAgICAgICAgQXN5bmNocm9ub3Vz
DQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGENCiAgICAgICAgd01h
eFBhY2tldFNpemUgICAgIDB4MDA2MCAgMXggOTYgYnl0ZXMNCiAgICAgICAgYkludGVydmFs
ICAgICAgICAgICAgICAgMQ0KICAgICAgICBiUmVmcmVzaCAgICAgICAgICAgICAgICAwDQog
ICAgICAgIGJTeW5jaEFkZHJlc3MgICAgICAgICAgIDANCiAgICAgICAgQXVkaW9TdHJlYW1p
bmcgRW5kcG9pbnQgRGVzY3JpcHRvcjoNCiAgICAgICAgICBiTGVuZ3RoICAgICAgICAgICAg
ICAgICA3DQogICAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzNw0KICAgICAgICAg
IGJEZXNjcmlwdG9yU3VidHlwZSAgICAgIDEgKEVQX0dFTkVSQUwpDQogICAgICAgICAgYm1B
dHRyaWJ1dGVzICAgICAgICAgMHgwMA0KICAgICAgICAgIGJMb2NrRGVsYXlVbml0cyAgICAg
ICAgIDAgVW5kZWZpbmVkDQogICAgICAgICAgd0xvY2tEZWxheSAgICAgICAgIDB4MDAwMA0K
ICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOg0KICAgICAgYkxlbmd0aCAgICAgICAgICAgICAg
ICAgOQ0KICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNA0KICAgICAgYkludGVyZmFj
ZU51bWJlciAgICAgICAgMw0KICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAgMA0KICAg
ICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMQ0KICAgICAgYkludGVyZmFjZUNsYXNzICAg
ICAgICAgMyBIdW1hbiBJbnRlcmZhY2UgRGV2aWNlDQogICAgICBiSW50ZXJmYWNlU3ViQ2xh
c3MgICAgICAwIA0KICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAgMCANCiAgICAgIGlJ
bnRlcmZhY2UgICAgICAgICAgICAgIDAgDQogICAgICAgIEhJRCBEZXZpY2UgRGVzY3JpcHRv
cjoNCiAgICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5DQogICAgICAgICAgYkRl
c2NyaXB0b3JUeXBlICAgICAgICAzMw0KICAgICAgICAgIGJjZEhJRCAgICAgICAgICAgICAg
IDEuMDANCiAgICAgICAgICBiQ291bnRyeUNvZGUgICAgICAgICAgICAwIE5vdCBzdXBwb3J0
ZWQNCiAgICAgICAgICBiTnVtRGVzY3JpcHRvcnMgICAgICAgICAxDQogICAgICAgICAgYkRl
c2NyaXB0b3JUeXBlICAgICAgICAzNCBSZXBvcnQNCiAgICAgICAgICB3RGVzY3JpcHRvckxl
bmd0aCAgICAgIDUxDQogICAgICAgICBSZXBvcnQgRGVzY3JpcHRvcnM6IA0KICAgICAgICAg
ICAqKiBVTkFWQUlMQUJMRSAqKg0KICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoNCiAgICAg
ICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNw0KICAgICAgICBiRGVzY3JpcHRvclR5cGUg
ICAgICAgICA1DQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4ODIgIEVQIDIgSU4N
CiAgICAgICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAgMw0KICAgICAgICAgIFRyYW5zZmVy
IFR5cGUgICAgICAgICAgICBJbnRlcnJ1cHQNCiAgICAgICAgICBTeW5jaCBUeXBlICAgICAg
ICAgICAgICAgTm9uZQ0KICAgICAgICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBEYXRh
DQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAwMDggIDF4IDggYnl0ZXMNCiAgICAg
ICAgYkludGVydmFsICAgICAgICAgICAgICAxMA0K
--------------h0MF0sOh6d3g8Gjxka4L0jMp
Content-Type: text/plain; charset=UTF-8; name="microphone.txt"
Content-Disposition: attachment; filename="microphone.txt"
Content-Transfer-Encoding: base64

QnVzIDAwMSBEZXZpY2UgMDEzOiBJRCA0YzRhOjQxNTUgU21hcnRsaW5rVGVjaG5vbG9neSBV
U0IgQ29tcG9zaXRlIERldmljZQ0KRGV2aWNlIERlc2NyaXB0b3I6DQogIGJMZW5ndGggICAg
ICAgICAgICAgICAgMTgNCiAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgMQ0KICBiY2RVU0Ig
ICAgICAgICAgICAgICAxLjEwDQogIGJEZXZpY2VDbGFzcyAgICAgICAgICAgIDAgDQogIGJE
ZXZpY2VTdWJDbGFzcyAgICAgICAgIDAgDQogIGJEZXZpY2VQcm90b2NvbCAgICAgICAgIDAg
DQogIGJNYXhQYWNrZXRTaXplMCAgICAgICAgNjQNCiAgaWRWZW5kb3IgICAgICAgICAgIDB4
NGM0YSANCiAgaWRQcm9kdWN0ICAgICAgICAgIDB4NDE1NSANCiAgYmNkRGV2aWNlICAgICAg
ICAgICAgMS4wMA0KICBpTWFudWZhY3R1cmVyICAgICAgICAgICAxIFNtYXJ0bGlua1RlY2hu
b2xvZ3kNCiAgaVByb2R1Y3QgICAgICAgICAgICAgICAgMiBVU0IgQ29tcG9zaXRlIERldmlj
ZQ0KICBpU2VyaWFsICAgICAgICAgICAgICAgICAzIDIwMjAxMTExMDAwMDAxDQogIGJOdW1D
b25maWd1cmF0aW9ucyAgICAgIDENCiAgQ29uZmlndXJhdGlvbiBEZXNjcmlwdG9yOg0KICAg
IGJMZW5ndGggICAgICAgICAgICAgICAgIDkNCiAgICBiRGVzY3JpcHRvclR5cGUgICAgICAg
ICAyDQogICAgd1RvdGFsTGVuZ3RoICAgICAgIDB4MDBhMA0KICAgIGJOdW1JbnRlcmZhY2Vz
ICAgICAgICAgIDQNCiAgICBiQ29uZmlndXJhdGlvblZhbHVlICAgICAxDQogICAgaUNvbmZp
Z3VyYXRpb24gICAgICAgICAgMCANCiAgICBibUF0dHJpYnV0ZXMgICAgICAgICAweDgwDQog
ICAgICAoQnVzIFBvd2VyZWQpDQogICAgTWF4UG93ZXIgICAgICAgICAgICAgIDEwMG1BDQog
ICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6DQogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAg
ICA5DQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0DQogICAgICBiSW50ZXJmYWNl
TnVtYmVyICAgICAgICAwDQogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAwDQogICAg
ICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAwDQogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAg
ICAgICAxIEF1ZGlvDQogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAxIENvbnRyb2wg
RGV2aWNlDQogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAwIA0KICAgICAgaUludGVy
ZmFjZSAgICAgICAgICAgICAgMCANCiAgICAgIEF1ZGlvQ29udHJvbCBJbnRlcmZhY2UgRGVz
Y3JpcHRvcjoNCiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQ0KICAgICAgICBi
RGVzY3JpcHRvclR5cGUgICAgICAgIDM2DQogICAgICAgIGJEZXNjcmlwdG9yU3VidHlwZSAg
ICAgIDEgKEhFQURFUikNCiAgICAgICAgYmNkQURDICAgICAgICAgICAgICAgMS4wMA0KICAg
ICAgICB3VG90YWxMZW5ndGggICAgICAgMHgwMDJmDQogICAgICAgIGJJbkNvbGxlY3Rpb24g
ICAgICAgICAgIDENCiAgICAgICAgYmFJbnRlcmZhY2VOcigwKSAgICAgICAgMQ0KICAgICAg
QXVkaW9Db250cm9sIEludGVyZmFjZSBEZXNjcmlwdG9yOg0KICAgICAgICBiTGVuZ3RoICAg
ICAgICAgICAgICAgIDEyDQogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMzYNCiAg
ICAgICAgYkRlc2NyaXB0b3JTdWJ0eXBlICAgICAgMiAoSU5QVVRfVEVSTUlOQUwpDQogICAg
ICAgIGJUZXJtaW5hbElEICAgICAgICAgICAgIDQNCiAgICAgICAgd1Rlcm1pbmFsVHlwZSAg
ICAgIDB4MDIwMSBNaWNyb3Bob25lDQogICAgICAgIGJBc3NvY1Rlcm1pbmFsICAgICAgICAg
IDANCiAgICAgICAgYk5yQ2hhbm5lbHMgICAgICAgICAgICAgMg0KICAgICAgICB3Q2hhbm5l
bENvbmZpZyAgICAgMHgwMDAzDQogICAgICAgICAgTGVmdCBGcm9udCAoTCkNCiAgICAgICAg
ICBSaWdodCBGcm9udCAoUikNCiAgICAgICAgaUNoYW5uZWxOYW1lcyAgICAgICAgICAgMCAN
CiAgICAgICAgaVRlcm1pbmFsICAgICAgICAgICAgICAgMCANCiAgICAgIEF1ZGlvQ29udHJv
bCBJbnRlcmZhY2UgRGVzY3JpcHRvcjoNCiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAg
ICAxMA0KICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2DQogICAgICAgIGJEZXNj
cmlwdG9yU3VidHlwZSAgICAgIDYgKEZFQVRVUkVfVU5JVCkNCiAgICAgICAgYlVuaXRJRCAg
ICAgICAgICAgICAgICAgNQ0KICAgICAgICBiU291cmNlSUQgICAgICAgICAgICAgICA0DQog
ICAgICAgIGJDb250cm9sU2l6ZSAgICAgICAgICAgIDINCiAgICAgICAgYm1hQ29udHJvbHMo
MCkgICAgIDB4MDAwMQ0KICAgICAgICAgIE11dGUgQ29udHJvbA0KICAgICAgICBpRmVhdHVy
ZSAgICAgICAgICAgICAgICAwIA0KICAgICAgV2FybmluZzogSnVuayBhdCBlbmQgb2YgZGVz
Y3JpcHRvciAoMSBieXRlcyk6DQogICAgICAgIDAwIA0KICAgICAgQXVkaW9Db250cm9sIElu
dGVyZmFjZSBEZXNjcmlwdG9yOg0KICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3
DQogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMzYNCiAgICAgICAgYkRlc2NyaXB0
b3JTdWJ0eXBlICAgICAgNSAoU0VMRUNUT1JfVU5JVCkNCiAgICAgICAgYlVuaXRJRCAgICAg
ICAgICAgICAgICAgNg0KICAgICAgICBiTnJJblBpbnMgICAgICAgICAgICAgICAxDQogICAg
ICAgIGJhU291cmNlSUQoMCkgICAgICAgICAgIDUNCiAgICAgICAgaVNlbGVjdG9yICAgICAg
ICAgICAgICAgMCANCiAgICAgIEF1ZGlvQ29udHJvbCBJbnRlcmZhY2UgRGVzY3JpcHRvcjoN
CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQ0KICAgICAgICBiRGVzY3JpcHRv
clR5cGUgICAgICAgIDM2DQogICAgICAgIGJEZXNjcmlwdG9yU3VidHlwZSAgICAgIDMgKE9V
VFBVVF9URVJNSU5BTCkNCiAgICAgICAgYlRlcm1pbmFsSUQgICAgICAgICAgICAgNg0KICAg
ICAgICB3VGVybWluYWxUeXBlICAgICAgMHgwMTAxIFVTQiBTdHJlYW1pbmcNCiAgICAgICAg
YkFzc29jVGVybWluYWwgICAgICAgICAgMA0KICAgICAgICBiU291cmNlSUQgICAgICAgICAg
ICAgICA1DQogICAgICAgIGlUZXJtaW5hbCAgICAgICAgICAgICAgIDAgDQogICAgSW50ZXJm
YWNlIERlc2NyaXB0b3I6DQogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5DQogICAg
ICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0DQogICAgICBiSW50ZXJmYWNlTnVtYmVyICAg
ICAgICAxDQogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAwDQogICAgICBiTnVtRW5k
cG9pbnRzICAgICAgICAgICAwDQogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgICAxIEF1
ZGlvDQogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAyIFN0cmVhbWluZw0KICAgICAg
YkludGVyZmFjZVByb3RvY29sICAgICAgMCANCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAg
ICAgIDAgDQogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6DQogICAgICBiTGVuZ3RoICAgICAg
ICAgICAgICAgICA5DQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0DQogICAgICBi
SW50ZXJmYWNlTnVtYmVyICAgICAgICAxDQogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAg
ICAxDQogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAxDQogICAgICBiSW50ZXJmYWNl
Q2xhc3MgICAgICAgICAxIEF1ZGlvDQogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAy
IFN0cmVhbWluZw0KICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAgMCANCiAgICAgIGlJ
bnRlcmZhY2UgICAgICAgICAgICAgIDAgDQogICAgICBBdWRpb1N0cmVhbWluZyBJbnRlcmZh
Y2UgRGVzY3JpcHRvcjoNCiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNw0KICAg
ICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM2DQogICAgICAgIGJEZXNjcmlwdG9yU3Vi
dHlwZSAgICAgIDEgKEFTX0dFTkVSQUwpDQogICAgICAgIGJUZXJtaW5hbExpbmsgICAgICAg
ICAgIDYNCiAgICAgICAgYkRlbGF5ICAgICAgICAgICAgICAgICAgMSBmcmFtZXMNCiAgICAg
ICAgd0Zvcm1hdFRhZyAgICAgICAgIDB4MDAwMSBQQ00NCiAgICAgIEF1ZGlvU3RyZWFtaW5n
IEludGVyZmFjZSBEZXNjcmlwdG9yOg0KICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAg
IDExDQogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMzYNCiAgICAgICAgYkRlc2Ny
aXB0b3JTdWJ0eXBlICAgICAgMiAoRk9STUFUX1RZUEUpDQogICAgICAgIGJGb3JtYXRUeXBl
ICAgICAgICAgICAgIDEgKEZPUk1BVF9UWVBFX0kpDQogICAgICAgIGJOckNoYW5uZWxzICAg
ICAgICAgICAgIDINCiAgICAgICAgYlN1YmZyYW1lU2l6ZSAgICAgICAgICAgMg0KICAgICAg
ICBiQml0UmVzb2x1dGlvbiAgICAgICAgIDE2DQogICAgICAgIGJTYW1GcmVxVHlwZSAgICAg
ICAgICAgIDEgRGlzY3JldGUNCiAgICAgICAgdFNhbUZyZXFbIDBdICAgICAgICA0ODAwMA0K
ICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoNCiAgICAgICAgYkxlbmd0aCAgICAgICAgICAg
ICAgICAgOQ0KICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1DQogICAgICAgIGJF
bmRwb2ludEFkZHJlc3MgICAgIDB4ODIgIEVQIDIgSU4NCiAgICAgICAgYm1BdHRyaWJ1dGVz
ICAgICAgICAgICAxMw0KICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBJc29j
aHJvbm91cw0KICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBTeW5jaHJvbm91
cw0KICAgICAgICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBEYXRhDQogICAgICAgIHdN
YXhQYWNrZXRTaXplICAgICAweDAwYzAgIDF4IDE5MiBieXRlcw0KICAgICAgICBiSW50ZXJ2
YWwgICAgICAgICAgICAgICAxDQogICAgICAgIGJSZWZyZXNoICAgICAgICAgICAgICAgIDAN
CiAgICAgICAgYlN5bmNoQWRkcmVzcyAgICAgICAgICAgMA0KICAgICAgICBBdWRpb1N0cmVh
bWluZyBFbmRwb2ludCBEZXNjcmlwdG9yOg0KICAgICAgICAgIGJMZW5ndGggICAgICAgICAg
ICAgICAgIDcNCiAgICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM3DQogICAgICAg
ICAgYkRlc2NyaXB0b3JTdWJ0eXBlICAgICAgMSAoRVBfR0VORVJBTCkNCiAgICAgICAgICBi
bUF0dHJpYnV0ZXMgICAgICAgICAweDAwDQogICAgICAgICAgYkxvY2tEZWxheVVuaXRzICAg
ICAgICAgMCBVbmRlZmluZWQNCiAgICAgICAgICB3TG9ja0RlbGF5ICAgICAgICAgMHgwMDAw
DQogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6DQogICAgICBiTGVuZ3RoICAgICAgICAgICAg
ICAgICA5DQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0DQogICAgICBiSW50ZXJm
YWNlTnVtYmVyICAgICAgICAyDQogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAwDQog
ICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAxDQogICAgICBiSW50ZXJmYWNlQ2xhc3Mg
ICAgICAgICAzIEh1bWFuIEludGVyZmFjZSBEZXZpY2UNCiAgICAgIGJJbnRlcmZhY2VTdWJD
bGFzcyAgICAgIDAgDQogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAwIA0KICAgICAg
aUludGVyZmFjZSAgICAgICAgICAgICAgMCANCiAgICAgICAgSElEIERldmljZSBEZXNjcmlw
dG9yOg0KICAgICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkNCiAgICAgICAgICBi
RGVzY3JpcHRvclR5cGUgICAgICAgIDMzDQogICAgICAgICAgYmNkSElEICAgICAgICAgICAg
ICAgMi4wMQ0KICAgICAgICAgIGJDb3VudHJ5Q29kZSAgICAgICAgICAgIDAgTm90IHN1cHBv
cnRlZA0KICAgICAgICAgIGJOdW1EZXNjcmlwdG9ycyAgICAgICAgIDENCiAgICAgICAgICBi
RGVzY3JpcHRvclR5cGUgICAgICAgIDM0IFJlcG9ydA0KICAgICAgICAgIHdEZXNjcmlwdG9y
TGVuZ3RoICAgICAgNjUNCiAgICAgICAgIFJlcG9ydCBEZXNjcmlwdG9yczogDQogICAgICAg
ICAgICoqIFVOQVZBSUxBQkxFICoqDQogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOg0KICAg
ICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3DQogICAgICAgIGJEZXNjcmlwdG9yVHlw
ZSAgICAgICAgIDUNCiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHg4MyAgRVAgMyBJ
Tg0KICAgICAgICBibUF0dHJpYnV0ZXMgICAgICAgICAgICAzDQogICAgICAgICAgVHJhbnNm
ZXIgVHlwZSAgICAgICAgICAgIEludGVycnVwdA0KICAgICAgICAgIFN5bmNoIFR5cGUgICAg
ICAgICAgICAgICBOb25lDQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERh
dGENCiAgICAgICAgd01heFBhY2tldFNpemUgICAgIDB4MDAwOCAgMXggOCBieXRlcw0KICAg
ICAgICBiSW50ZXJ2YWwgICAgICAgICAgICAgICAxDQogICAgSW50ZXJmYWNlIERlc2NyaXB0
b3I6DQogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5DQogICAgICBiRGVzY3JpcHRv
clR5cGUgICAgICAgICA0DQogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAzDQogICAg
ICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAwDQogICAgICBiTnVtRW5kcG9pbnRzICAgICAg
ICAgICAwDQogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAgICAzIEh1bWFuIEludGVyZmFj
ZSBEZXZpY2UNCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDAgDQogICAgICBiSW50
ZXJmYWNlUHJvdG9jb2wgICAgICAwIA0KICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAg
MCANCiAgICAgICAgSElEIERldmljZSBEZXNjcmlwdG9yOg0KICAgICAgICAgIGJMZW5ndGgg
ICAgICAgICAgICAgICAgIDkNCiAgICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDMz
DQogICAgICAgICAgYmNkSElEICAgICAgICAgICAgICAgMi4wMQ0KICAgICAgICAgIGJDb3Vu
dHJ5Q29kZSAgICAgICAgICAgIDAgTm90IHN1cHBvcnRlZA0KICAgICAgICAgIGJOdW1EZXNj
cmlwdG9ycyAgICAgICAgIDENCiAgICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM0
IFJlcG9ydA0KICAgICAgICAgIHdEZXNjcmlwdG9yTGVuZ3RoICAgICAgMzYNCiAgICAgICAg
IFJlcG9ydCBEZXNjcmlwdG9yczogDQogICAgICAgICAgICoqIFVOQVZBSUxBQkxFICoqDQoN
Cg==

--------------h0MF0sOh6d3g8Gjxka4L0jMp--

