Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72CC5F6BD9
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2019 00:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfKJXH0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Nov 2019 18:07:26 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:35369 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726610AbfKJXH0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Nov 2019 18:07:26 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 457FD210DC;
        Sun, 10 Nov 2019 18:07:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 10 Nov 2019 18:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=todbot.com; h=
        content-type:mime-version:subject:from:in-reply-to:date:cc
        :content-transfer-encoding:message-id:references:to; s=fm2; bh=/
        tcU+SIjOdl7+3YQzLNtqSIwZaki/qmlpfRys52wBaI=; b=lhxXu+z6byo1LCPqg
        PQ3J1jZedf/mpNVQRoNYNelXNyo1YAr2nZjJUNsGtqejsecixvcquj7mXJ4NMS1e
        QJ3h2vmkdaLYUUZQIXGpI2K7LYZ4xL/lzLMqfwnT2wxYjISVWZmXZWRO1l855fEe
        nyZ+Ok7A6x+h8Pgek7kwPhuanjfXgWeapendjFA5IFmwpGwgemaip0lEF5v6mv5D
        Z+FB2sypoRevZkCvRlWOj0vXn0AmzCZMKRpotDjOYMtFDAGgo6XKdk8yNSfxSXzh
        ekIB4kraFuWnul2xkn2innVX/VUTAmfXh6Z+hNOwdjwgxm/Kb40PaLFRryuVlUg2
        KtHQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=/tcU+SIjOdl7+3YQzLNtqSIwZaki/qmlpfRys52wB
        aI=; b=UZK05SEwQE1vV6YfusZmIfG9iNEvtxYuyD9UF+0KyfzO/jlYziLeEJNin
        dcEUBho+LISt7unqpWJ2q29o887H43GiCJ4UXlYUPYiIjdDoDyDG65YzaQg6GyPK
        +fGTpv9x8NjEf/uamamhDWTjLu2RlUDBqQlqXkY0DuT+VQdK7BWZCDK39AA/wWhS
        ZKeFOUBIP7xOsoag3L3fWKDdE7U0AxwySi6aQOFPmLtDDDRVMCCVI9mJkVJn9L5o
        Apr61KGwKR+eXGW9OKHlchrx15w7NVMSaJa/hwYsUunZDs3rnZenO7+mXDTK2Zm9
        pz1P7y83vHC/4EWz+AZFMPzZfHAUA==
X-ME-Sender: <xms:LJjIXTwQKbLy4fNhfcls-dGngDse6WBlkBbnql5sYiNPsf_CYyLNkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddviedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffgffkfhfvofesthhqmhdthhdtvdenucfhrhhomhepfdfvohgu
    ucfgrdcumfhurhhtfdcuoehtohgusehtohgusghothdrtghomheqnecuffhomhgrihhnpe
    husghunhhtuhdrtghomhdpghhithhhuhgsrdgtohhmnecukfhppedufeejrddvhedrfeeg
    rdduheegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtohgusehtohgusghothdrtghomh
    enucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:LJjIXfjGhmAXrE4EE2dBxNoZZcf7cBvn1avmh-mSPFPffr4CJh_hog>
    <xmx:LJjIXYV0cG6cVBQ5q6ES6dFqQz94Nj4pvD4ZcjzhKgc5IQhUVpIY9g>
    <xmx:LJjIXR0kLN6xenm_qliD9C7APEXcITtjQMYSChVyFgeWWKC0BXihtw>
    <xmx:LZjIXaXuL2qVM8kfVAC-aM3c9_1Q0U4v3PRQPfEDPvcsJ3Kwfcdtmw>
Received: from bok4bok.home (137-025-034-154.res.spectrum.com [137.25.34.154])
        by mail.messagingengine.com (Postfix) with ESMTPA id 51DD03060061;
        Sun, 10 Nov 2019 18:07:24 -0500 (EST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Linux "hid_led" vs "hidraw" USB HID question 
From:   "Tod E. Kurt" <tod@todbot.com>
In-Reply-To: <ab4e0840-72ee-4e65-db17-083c187b03ec@gmail.com>
Date:   Sun, 10 Nov 2019 15:07:22 -0800
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B63E1B37-D7A3-4A71-A3F1-73C5952B2653@todbot.com>
References: <6A37A3D7-96A6-49A4-83E5-ABE5DB417E8B@todbot.com>
 <b93817a2-97a2-3bcc-9741-5622b74bcd3c@gmail.com>
 <8A4D1E2D-9918-4A6C-9F8A-6447EE50F9F7@todbot.com>
 <ab4e0840-72ee-4e65-db17-083c187b03ec@gmail.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Heiner,

Yes, that was what I was starting from. I was hoping there was now an =
in-situ way of replacing kernel modules without a full kernel recompile.

I have tried this patch on Raspian 4.19.81 and Ubuntu 19 kernel 5.0.0-32 =
with no config changes.  I believe it solves the main issue.  However, =
I'm seeing another problem that I can't explain.

Specifically:
- On reboot, device shows up in /sys/class/hidraw/
- Opening with hidapi and (mis)using hidapi functions works, but,
- Device is then removed from /sys/class/hidraw/

Under what circumstances can a device be removed from /sys/class/hidraw?=20=


If you'd like to trigger this yourself, run "blink1-tool --list" and see =
the blink(1) disappear. And yet "blink1-tool" can subsequently still =
communicate with the blink(1). Which I don't quite understand yet =
either.

Cheers,
-=3DTod

> On Nov 10, 2019, at 9:25 a, Heiner Kallweit <hkallweit1@gmail.com> =
wrote:
>=20
> On 10.11.2019 17:59, Tod E. Kurt wrote:
>> Hi Heiner, (and others on the list)
>>=20
>> Thanks for your quick and detailed response.=20
>>=20
>> I am endeavoring to try the patch out now.  But I've not built a =
desktop Linux kernel or kernel modules in about 15 years.  Do you have a =
preferred recipe for applying this patch to an existing distro?  Since =
'hid-quirks' isn't a module, this means recompiling the entire HID =
driver, correct?  I mostly test against various modern Ubuntu or Raspian =
flavors of Debian, if that matters.
>>=20
> See e.g. here: https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel
>=20
>> Also, is there a mitigation for users running production distros that =
doesn't involve a recompile?=20
>>=20
> I don't think so (at least from kernel perspective). What you could do =
is adding an integration with
> the /sys/class/led interface in your library (if it should be suitable =
for your use cases) and
> auto-detect which interface to use.
>=20
>> Thanks,
>> -=3DTod
>>=20
> Heiner
>=20
>>> On Nov 10, 2019, at 2:44 a, Heiner Kallweit <hkallweit1@gmail.com> =
wrote:
>>>=20
>>> On 10.11.2019 04:26, Tod E. Kurt wrote:
>>>> HiI
>>>>=20
>>> Hi Tod,
>>>=20
>>>> Since you are listed as author of "hid-led.c":=20
>>>>  =
https://github.com/torvalds/linux/blob/master/drivers/hid/hid-led.c,=20
>>>> I was wondering if you could offer some insight on an issue I'm =
seeing.
>>>> I'm a maintainer of "hidapi" and "node-hid", cross-platform C and =
NodeJs libraries for accessing HID devices, and I'm the creator of the =
ThingM blink(1) USB LED that "hid-led" controls.
>>>>=20
>>>> On the distros I've seen (Ubuntu, Raspian) where "hid-led" is =
enabled, when inserting a blink(1) device, the "hid-led" driver appears =
to grab the device and remove it from available "hidraw" devices.  This =
makes generic hidraw-based systems (like "hidapi" and the upcoming =
Chrome WebHID) unable to see the blink(1)
>>>>=20
>>>> I have tried blacklisting the "hid-led" module but the problem =
persist. Ffrom dmesg and lsmod the module does appear to not be loaded =
on reboot.
>>>>=20
>>>> Any insights on what's going on?  Any tips on how to debug this or =
how to prevent this from occurring?
>>>>=20
>>> When hid-led was written it was needed to add the LED devices to =
hid_have_special_driver list.
>>> Else the driver can't take control over the device. Side effect is =
that even if hid-led
>>> isn't loaded hid-generic can't take control.
>>> I think since e04a0442d33b ("HID: core: remove the absolute need of =
hid_have_special_driver[]")
>>> it's no longer needed to have the LED devices in =
hid_have_special_driver.
>>> Could you please test the following patch? If hid-led is loaded is =
should control the
>>> device, if it's blacklisted hid-generic should have the control.
>>>=20
>>>=20
>>> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
>>> index c50bcd967..bdaab79f7 100644
>>> --- a/drivers/hid/hid-quirks.c
>>> +++ b/drivers/hid/hid-quirks.c
>>> @@ -419,13 +419,6 @@ static const struct hid_device_id =
hid_have_special_driver[] =3D {
>>> #if IS_ENABLED(CONFIG_HID_LCPOWER)
>>> 	{ HID_USB_DEVICE(USB_VENDOR_ID_LCPOWER, =
USB_DEVICE_ID_LCPOWER_LC1000) },
>>> #endif
>>> -#if IS_ENABLED(CONFIG_HID_LED)
>>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, =
USB_DEVICE_ID_DREAM_CHEEKY_WN) },
>>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, =
USB_DEVICE_ID_DREAM_CHEEKY_FA) },
>>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROCHIP, USB_DEVICE_ID_LUXAFOR) =
},
>>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_RISO_KAGAKU, =
USB_DEVICE_ID_RI_KA_WEBMAIL) },
>>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_THINGM, USB_DEVICE_ID_BLINK1) },
>>> -#endif
>>> #if IS_ENABLED(CONFIG_HID_LENOVO)
>>> 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, =
USB_DEVICE_ID_LENOVO_TPKBD) },
>>> 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, =
USB_DEVICE_ID_LENOVO_CUSBKBD) },
>>> --=20
>>> 2.24.0
>>>=20
>>>> I can send you blink(1) devices and "hidapi" test programs if you'd =
like to try to replicate this.
>>>>=20
>>> Thanks for the offer, I've got a blink(1) already. Just tested the =
patch with this device
>>> and it worked properly like described above.
>>>=20
>>>> Thanks!
>>>> -=3DTod
>>>=20
>>> Heiner
>>=20
>>=20
>=20

