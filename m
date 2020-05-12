Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF6B1CEC72
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 07:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbgELF3e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 01:29:34 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:54685 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725776AbgELF3e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 01:29:34 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id B962F6BB;
        Tue, 12 May 2020 01:29:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 12 May 2020 01:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=cwPlHxgbZYyoWd2uf2dkE330y1B
        N/9f6c8vfB7ZGdh0=; b=NDXewzlDwWrn66FhYioZs9vHwBRlcOYdv0f5mj1QFbn
        EupVfyQOqxnMjallYnbr0y32+C3B0zUjGUroEQCVH+sYBoAZ2tgp0sF5AtD29ytp
        jeZA84abRH2a+lT4uFktaHMvuyHiemEon3K151E0s57SUI0nEFWrTfbJHoKzVWSF
        i5pS7rGeGBAyAGp5wJPkYYuJOi7vzFSZVZmyJ8q3jfxYxuge7uPocjt4iGobXPvO
        970BAmtuE8YUkHGPCJQWVMOPGf+npB/0px+40J7NlxPLZUraqut4FGKLZ/lhUgTU
        k077W91kYtSUWePAyQjljkxdwDYJf8MhMIVKTwdvYjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cwPlHx
        gbZYyoWd2uf2dkE330y1BN/9f6c8vfB7ZGdh0=; b=t3qt56V9VpCIdyHmLBPLRA
        flFc1CBe7Lcg70WhykrwTxxMoPRGucVVvMMQ+wF6j0m1HC41YcwwUzdajrcF0CJX
        kW1QKKLse4dIPsvFz3HqI0bHrp3PvpIi/ixlYC/StfwrgK4aHMhyVBfuA9C/zGdP
        8u+9E4HyCQwlRpq32guU0WBpjbQ0mx+n/68e/ijLKLp9LYxNxYhexTFfzAUvxitC
        JALnQtKNJOQrZy8WClzyWAkTRbp0ItB8GbSPV3vQK3i4dAZQfdhDvJf+ps+hwHxh
        zkBGbzdaKjSw9+b8tFXcDyHUIit4XK4gDDtmcQcbfJQk+N9dQenUd8N75GD/iUkw
        ==
X-ME-Sender: <xms:PTS6Xumu_IgBJ1YF_Gl8xDgSRmvPYexi9WhszN5FgfKmL8wKGDJZmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledugdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgvrhcu
    jfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtqe
    enucggtffrrghtthgvrhhnpeegffffleeviedugfegudeuudehieehueffueekfeejgfef
    veetjeekfedufeeigfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenuc
    fkphepuddujedrvddtrdejuddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnh
    gvth
X-ME-Proxy: <xmx:PTS6Xl3rfe1knmYKCnoOPsy-t2BJ13d6vN1a0CAMC2FPokoWbP84Sw>
    <xmx:PTS6XsocL9cVhJttEHhvO5dEzDcITvshLKQ6z1lRW2-aDTLFWapR4Q>
    <xmx:PTS6XikqCO5t7U9WDe83jEJBRQvr8sEiT9SxbbUHecXeAoF6GvRhxQ>
    <xmx:PTS6Xh9Jc8ekViHxRjTzKs-VcaJrb8pet3u2PsutZytRLT7zwI6LvQ>
Received: from koala (117-20-71-109.751447.bne.nbn.aussiebb.net [117.20.71.109])
        by mail.messagingengine.com (Postfix) with ESMTPA id 799F630662A8;
        Tue, 12 May 2020 01:29:31 -0400 (EDT)
Date:   Tue, 12 May 2020 15:29:27 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Cristian Klein <cristian.klein@elastisys.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Add quirks for Trust Panora Graphic Tablet
Message-ID: <20200512052927.GC48688@koala>
References: <20200508152604.21143-1-cristian.klein@elastisys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508152604.21143-1-cristian.klein@elastisys.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 08, 2020 at 05:26:04PM +0200, Cristian Klein wrote:
> The Trust Panora Graphic Tablet has two interfaces. Interface zero
> reports pen movement, pen pressure and pen buttons. Interface one
> reports tablet buttons and tablet scroll. Both use the mouse protocol.
> 
> Without these quirks, libinput gets confused about what device it talks
> to.

For reference libinput bug originally filed here:
https://gitlab.freedesktop.org/libinput/libinput/-/issues/482
The issue is less libinput getting confused and more the device lying
about... well, almost everything :)

Cheers,
   Peter

> 
> For completeness, here is the usbhid-dump:
> 
> ```
> $ sudo usbhid-dump -d 145f:0212
> 003:013:001:DESCRIPTOR         1588949402.559961
>  05 0D 09 01 A1 01 85 07 A1 02 09 00 75 08 95 07
>  81 02 C0 C0 09 0E A1 01 85 05 09 23 A1 02 09 52
>  09 53 25 0A 75 08 95 02 B1 02 C0 C0 05 0C 09 36
>  A1 00 85 06 05 09 19 01 29 20 15 00 25 01 95 20
>  75 01 81 02 C0
> 
> 003:013:000:DESCRIPTOR         1588949402.563942
>  05 01 09 02 A1 01 85 08 09 01 A1 00 05 09 19 01
>  29 03 15 00 25 01 95 03 75 01 81 02 95 05 81 01
>  05 01 09 30 09 31 09 38 09 00 15 81 25 7F 75 08
>  95 04 81 06 C0 C0 05 01 09 02 A1 01 85 09 09 01
>  A1 00 05 09 19 01 29 03 15 00 25 01 95 03 75 01
>  81 02 95 05 81 01 05 01 09 30 09 31 26 FF 7F 95
>  02 75 10 81 02 05 0D 09 30 26 FF 03 95 01 75 10
>  81 02 C0 C0 05 01 09 00 A1 01 85 04 A1 00 26 FF
>  00 09 00 75 08 95 07 B1 02 C0 C0
> ```
> 
> Signed-off-by: Cristian Klein <cristian.klein@elastisys.com>
> ---
>  drivers/hid/hid-ids.h    | 3 +++
>  drivers/hid/hid-quirks.c | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 1c71a1aa7..f03f1cc91 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1157,6 +1157,9 @@
>  #define USB_DEVICE_ID_TPV_OPTICAL_TOUCHSCREEN_8882	0x8882
>  #define USB_DEVICE_ID_TPV_OPTICAL_TOUCHSCREEN_8883	0x8883
>  
> +#define USB_VENDOR_ID_TRUST             0x145f
> +#define USB_DEVICE_ID_TRUST_PANORA_TABLET   0x0212
> +
>  #define USB_VENDOR_ID_TURBOX		0x062a
>  #define USB_DEVICE_ID_TURBOX_KEYBOARD	0x0201
>  #define USB_DEVICE_ID_ASUS_MD_5110	0x5110
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index e4cb543de..ca8b5c261 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -168,6 +168,7 @@ static const struct hid_device_id hid_quirks[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_TOUCHPACK, USB_DEVICE_ID_TOUCHPACK_RTS), HID_QUIRK_MULTI_INPUT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_TPV, USB_DEVICE_ID_TPV_OPTICAL_TOUCHSCREEN_8882), HID_QUIRK_NOGET },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_TPV, USB_DEVICE_ID_TPV_OPTICAL_TOUCHSCREEN_8883), HID_QUIRK_NOGET },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_TRUST, USB_DEVICE_ID_TRUST_PANORA_TABLET), HID_QUIRK_MULTI_INPUT | HID_QUIRK_HIDINPUT_FORCE },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_TURBOX, USB_DEVICE_ID_TURBOX_KEYBOARD), HID_QUIRK_NOGET },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC, USB_DEVICE_ID_UCLOGIC_TABLET_KNA5), HID_QUIRK_MULTI_INPUT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC, USB_DEVICE_ID_UCLOGIC_TABLET_TWA60), HID_QUIRK_MULTI_INPUT },
> -- 
> 2.20.1
> 
