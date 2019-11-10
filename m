Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7437F6A6B
	for <lists+linux-input@lfdr.de>; Sun, 10 Nov 2019 17:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbfKJQ7s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Nov 2019 11:59:48 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:50301 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726731AbfKJQ7r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Nov 2019 11:59:47 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 6A6F64B6;
        Sun, 10 Nov 2019 11:59:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 10 Nov 2019 11:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=todbot.com; h=
        content-type:mime-version:subject:from:in-reply-to:date:cc
        :content-transfer-encoding:message-id:references:to; s=fm2; bh=c
        gAUO/IYro2z8t924GkE4ciWNC3JkP+tChSSpRp/HTc=; b=UeVRjRypQ1gwG6vzc
        S2bpce/CxG0gbvvOebV0KVZOp5q5C9DfdGm8m/G+XR9zdC+D8LeRSrBELl2sg8hO
        JbM+7OFZn7U9rImpg1QrG2i4vj5cG86VfDmL0xvng/7b78QgGkyMAacNdTgImKET
        4xbkk35jPPlZio1g8ZRRaVXGnjyVcLqUdPIGZq2gUFraY/ACz1B6cOmiZnmwYoos
        UknCpodsDzFOqLZtaJAqY6aEFrVJnoMVzR7Bn+ycY2fjJ6Ub3+EX/FSlGB1IrHP7
        4QTycTCHLLcvb/HrNl+K4BfGT05yje6sb5UKcweMFTMA7maTHoDpgTqFh46VRmlo
        v8n9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=cgAUO/IYro2z8t924GkE4ciWNC3JkP+tChSSpRp/H
        Tc=; b=DuXcOw/G+0P3tB28mk4VS/nSwnFtxxhGCbD4sSt3zzfQF0AYzSpznP6Ci
        CqNZwtAlBEcUhBZBtW3MQtnErIrzc4DPGJQcvwPP7eFh7GxR1B6ZOEB9vvoADcdB
        6UvYR8k9WFqb74UoiDdlYtQmGbKleUDAQeO+MVoiRqqt6LoCyF4j8DE4J+SgMtuS
        6yQfJKIHdgsJ/3qucM8jML5tP6CPH2p6im0Ue/0ncZ7YZRfa9Kqttue0fwLi8JVw
        O6aYo9hSxlGna387fgTY66vwNx0f4PFUg4rJI+2bnC00clyT68PH0CTlygNdIIqk
        gb+TyZ6sZNgc5TX9jYR8YfDhqrQhA==
X-ME-Sender: <xms:AULIXZYi4BVaDfglhN6uY8GUetV8ZZj82RL1YTw6yjs3L3c2J9mr1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvhedgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffgffkfhfvofesthhqmhdthhdtvdenucfhrhhomhepfdfvohgu
    ucfgrdcumfhurhhtfdcuoehtohgusehtohgusghothdrtghomheqnecuffhomhgrihhnpe
    hgihhthhhusgdrtghomhenucfkphepudefjedrvdehrdefgedrudehgeenucfrrghrrghm
    pehmrghilhhfrhhomhepthhougesthhouggsohhtrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptd
X-ME-Proxy: <xmx:AULIXWz8M_g6QHua2bi8a7k_jQCJ-ZNDWyXj-bkz10Nb6CaW-p-C9w>
    <xmx:AULIXYOjazt4WSDpBa5hxszA_aM_qrO51-PnLkY9nxqz1NLoavaQJQ>
    <xmx:AULIXVfw7b2p1q2v3TUQn8GifH_W3T2gyF1ronDDMgJNvEBL6Hx8Rw>
    <xmx:AkLIXSm7S0ZTsvZuk4Hpgp_H_U_5A3ocxr1D-_Npwb4Spn3AXEhlsg>
Received: from bok4bok.home (137-025-034-154.res.spectrum.com [137.25.34.154])
        by mail.messagingengine.com (Postfix) with ESMTPA id 56D6A3060057;
        Sun, 10 Nov 2019 11:59:45 -0500 (EST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Linux "hid_led" vs "hidraw" USB HID question 
From:   "Tod E. Kurt" <tod@todbot.com>
In-Reply-To: <b93817a2-97a2-3bcc-9741-5622b74bcd3c@gmail.com>
Date:   Sun, 10 Nov 2019 08:59:44 -0800
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8A4D1E2D-9918-4A6C-9F8A-6447EE50F9F7@todbot.com>
References: <6A37A3D7-96A6-49A4-83E5-ABE5DB417E8B@todbot.com>
 <b93817a2-97a2-3bcc-9741-5622b74bcd3c@gmail.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Heiner, (and others on the list)

Thanks for your quick and detailed response.=20

I am endeavoring to try the patch out now.  But I've not built a desktop =
Linux kernel or kernel modules in about 15 years.  Do you have a =
preferred recipe for applying this patch to an existing distro?  Since =
'hid-quirks' isn't a module, this means recompiling the entire HID =
driver, correct?  I mostly test against various modern Ubuntu or Raspian =
flavors of Debian, if that matters.

Also, is there a mitigation for users running production distros that =
doesn't involve a recompile?=20

Thanks,
-=3DTod

> On Nov 10, 2019, at 2:44 a, Heiner Kallweit <hkallweit1@gmail.com> =
wrote:
>=20
> On 10.11.2019 04:26, Tod E. Kurt wrote:
>> HiI
>>=20
> Hi Tod,
>=20
>> Since you are listed as author of "hid-led.c":=20
>>   =
https://github.com/torvalds/linux/blob/master/drivers/hid/hid-led.c,=20
>> I was wondering if you could offer some insight on an issue I'm =
seeing.
>> I'm a maintainer of "hidapi" and "node-hid", cross-platform C and =
NodeJs libraries for accessing HID devices, and I'm the creator of the =
ThingM blink(1) USB LED that "hid-led" controls.
>>=20
>> On the distros I've seen (Ubuntu, Raspian) where "hid-led" is =
enabled, when inserting a blink(1) device, the "hid-led" driver appears =
to grab the device and remove it from available "hidraw" devices.  This =
makes generic hidraw-based systems (like "hidapi" and the upcoming =
Chrome WebHID) unable to see the blink(1)
>>=20
>> I have tried blacklisting the "hid-led" module but the problem =
persist. Ffrom dmesg and lsmod the module does appear to not be loaded =
on reboot.
>>=20
>> Any insights on what's going on?  Any tips on how to debug this or =
how to prevent this from occurring?
>>=20
> When hid-led was written it was needed to add the LED devices to =
hid_have_special_driver list.
> Else the driver can't take control over the device. Side effect is =
that even if hid-led
> isn't loaded hid-generic can't take control.
> I think since e04a0442d33b ("HID: core: remove the absolute need of =
hid_have_special_driver[]")
> it's no longer needed to have the LED devices in =
hid_have_special_driver.
> Could you please test the following patch? If hid-led is loaded is =
should control the
> device, if it's blacklisted hid-generic should have the control.
>=20
>=20
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index c50bcd967..bdaab79f7 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -419,13 +419,6 @@ static const struct hid_device_id =
hid_have_special_driver[] =3D {
> #if IS_ENABLED(CONFIG_HID_LCPOWER)
> 	{ HID_USB_DEVICE(USB_VENDOR_ID_LCPOWER, =
USB_DEVICE_ID_LCPOWER_LC1000) },
> #endif
> -#if IS_ENABLED(CONFIG_HID_LED)
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, =
USB_DEVICE_ID_DREAM_CHEEKY_WN) },
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, =
USB_DEVICE_ID_DREAM_CHEEKY_FA) },
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROCHIP, USB_DEVICE_ID_LUXAFOR) =
},
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_RISO_KAGAKU, =
USB_DEVICE_ID_RI_KA_WEBMAIL) },
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_THINGM, USB_DEVICE_ID_BLINK1) },
> -#endif
> #if IS_ENABLED(CONFIG_HID_LENOVO)
> 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, =
USB_DEVICE_ID_LENOVO_TPKBD) },
> 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, =
USB_DEVICE_ID_LENOVO_CUSBKBD) },
> --=20
> 2.24.0
>=20
>> I can send you blink(1) devices and "hidapi" test programs if you'd =
like to try to replicate this.
>>=20
> Thanks for the offer, I've got a blink(1) already. Just tested the =
patch with this device
> and it worked properly like described above.
>=20
>> Thanks!
>> -=3DTod
>=20
> Heiner

