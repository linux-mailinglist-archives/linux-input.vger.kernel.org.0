Return-Path: <linux-input+bounces-16175-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E5BC698BF
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 14:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 13AE34F41E2
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 13:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FD730F944;
	Tue, 18 Nov 2025 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="BIOU33tY"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023093126C4
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763471252; cv=none; b=SwFLp/m+gAACths1ew5kBu7vTCTDF10pWGGvZKL7LIrtC42chLKD5i6RGOpEls4taIL9Bxs/ujOG5nAQzOSG7o208VcYt/2WhPUoB4Ys7PN9863IF8eaEbHO0Tv84IVI6nnpj13Z9Wa4WHQoDnZLYNgg0TMGuxbpTY9t/s0UCkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763471252; c=relaxed/simple;
	bh=/9bo5d8b3OD+SMkpRRyp/K+vofrjtZMB5EnTEZph2Wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VxlH/Dl9fU3j00Ac7WNLltijwVHYxnA7rb1u2bBaWAu5Ph1aVcDyBTunBJTRy+QCqoVWPG7rTJcfNQmXbdh53+SQEnt3GcMkpt+JkcjsI60WbANOWK+lLAGmEoqpLkiOlJY8WqvXH+cTE46LWf9A5n13FzW1b/B70T8UuvqJrmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=BIOU33tY; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 81C52C5ADD
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 15:07:23 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id BB289C5ADE
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 15:07:22 +0200 (EET)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 4B68A1FC8AA
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 15:07:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763471242;
	bh=cTSb5c4hQLUTbwYrYNlSOdNQhRNCsvRe4wk/r4ySSp8=;
	h=Received:From:Subject:To;
	b=BIOU33tYkACjdHzsSuLs4qL1wxivVxUXl7wsPSXjt11fbccn1iHS/5ksC+kOYGTP/
	 4fa8aCJyO43Hujn5u7tNqdX+MEt7X9mDTZJHHNyBEcXF5B7yJMx2XO7tt+BsWC2KVp
	 QPgxDN9UTi4S2sksBtsM0s7vbrd4zIfVqjeolUGBXX4evHZTL3pHlZNg3NMajqkZSB
	 zA93p1Q2HbKp566ILhjCM4J2Li6/dD1riJEn6PsudHVToIEADmzt7mSYX3I6kgatt+
	 feP+J+//8blYjJdSm4WlkEomldsRH2BHnvQ0M1M3zqI8NDZQ4nGrBHP7ZmTcWafSg3
	 760/mT8Dv0YlA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.167.46) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f46.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5957c929a5eso6240800e87.1
        for <linux-input@vger.kernel.org>;
 Tue, 18 Nov 2025 05:07:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU76aI3hudh4TZfNr47E1INk+pg4QI2AjHRkdmCsDSrCR2DcLLxJKEoG6yTQD9qeHra4YSLQPpKx5/krA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmmEdTI0Rj8owmiHgvFa/5kG9FyRESD2behwGVtrHRfW/3dOs0
	RU4v8HRvhlI0+U+jj9SIJQmqWzdkN8SolErYzu9pJDBIfD9yU29/rRPpx/1JqvRbF4Jwv0fCaCi
	bPDIEh0qjnbGJcpF8XKLc2DrEMyIclAU=
X-Google-Smtp-Source: 
 AGHT+IFTsgF00L5SeAmJ4YXuUbCI69PSEEgep+CPxYlQ7JBu4lAGduk0h8hdvTBwBslL3PnTykwT8plgiVwlOF8qhJM=
X-Received: by 2002:a05:6512:4017:b0:594:26d7:c443 with SMTP id
 2adb3069b0e04-595842620d0mr5806343e87.39.1763471241808; Tue, 18 Nov 2025
 05:07:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-2-lkml@antheas.dev>
 <3018f443-e1af-7a93-f0f2-558364ecb9eb@linux.intel.com>
In-Reply-To: <3018f443-e1af-7a93-f0f2-558364ecb9eb@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 18 Nov 2025 14:07:10 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEen-gfuSKhRFXD3i7RpZUVWED+EJnA8R1aYYNs2SaWcA@mail.gmail.com>
X-Gm-Features: AWmQ_bnIAqkkumNdiVBzIEWXbkPL3duI035WlVyD4oV0o1_vJ7uqBLD0n5as1EM
Message-ID: 
 <CAGwozwEen-gfuSKhRFXD3i7RpZUVWED+EJnA8R1aYYNs2SaWcA@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] HID: asus: simplify RGB init sequence
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176347124248.3380047.13580266436342862373@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 18 Nov 2025 at 13:23, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:
>
> > Currently, RGB initialization forks depending on whether a device is
> > NKEY. Then, NKEY devices are initialized using 0x5a, 0x5d, 0x5e
> > endpoints, and non-NKEY devices with 0x5a and then a
> > backlight check, which is omitted for NKEY devices.
> >
> > Remove the fork, using a common initialization sequence for both,
> > where they are both only initialized with 0x5a, then checked for
> > backlight support. This patch should not affect existing functionality.
> >
> > 0x5d and 0x5e endpoint initializations are performed by Windows
> > userspace programs associated with different usages that reside under
> > the vendor HID. Specifically, 0x5d is used by Armoury Crate, which
> > controls RGB and 0x5e by an animation program for certain Asus laptops.
> > Neither is used currently in the driver.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 56 ++++++++++++++----------------------------
> >  1 file changed, 19 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index a444d41e53b6..7ea1037c3979 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -638,50 +638,32 @@ static int asus_kbd_register_leds(struct hid_devi=
ce *hdev)
> >       unsigned char kbd_func;
> >       int ret;
> >
> > -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> > -             /* Initialize keyboard */
> > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             /* The LED endpoint is initialised in two HID */
> > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> > -             if (ret < 0)
> > -                     return ret;
>
> This removal of FEATURE_KBD_LED_REPORT_ID2 should definitely be in own
> patch so a focused changelog can be written to it (who said it's
> acceptable, etc. included) and it can be pinpointed with bisect if it
> causes any issues (but I'm not entirely sure what Denis' stance is on thi=
s
> removal so it's going to be subject to some further scrunity, but in any
> case it must be in own patch if to be accepted).

Yeah this is a fair approach.

> I'm wondering though if QUIRK_ROG_NKEY_LEGACY could also cover this? At
> least it would look a path of less resistance when it comes to Denis'
> stance and would decouple the remove or not controversy from acceptance o=
f
> this series.

So a way forward would be on the simplify patch, to use an if rog
statement to do ID1 and ID2 and then on the next patch replace the
quirk in the if check with the legacy quirk. This is ok with me, as
those are older devices.

Antheas

> --
>  i.
>
> > -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > -                     ret =3D asus_kbd_disable_oobe(hdev);
> > -                     if (ret < 0)
> > -                             return ret;
> > -             }
> > -
> > -             if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> > -                     intf =3D to_usb_interface(hdev->dev.parent);
> > -                     udev =3D interface_to_usbdev(intf);
> > -                     validate_mcu_fw_version(hdev,
> > -                             le16_to_cpu(udev->descriptor.idProduct));
> > -             }
> > +     ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > +     if (ret < 0)
> > +             return ret;
> >
> > -     } else {
> > -             /* Initialize keyboard */
> > -             ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > -             if (ret < 0)
> > -                     return ret;
> > +     /* Get keyboard functions */
> > +     ret =3D asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPOR=
T_ID);
> > +     if (ret < 0)
> > +             return ret;
> >
> > -             /* Get keyboard functions */
> > -             ret =3D asus_kbd_get_functions(hdev, &kbd_func, FEATURE_K=
BD_REPORT_ID);
> > +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > +             ret =3D asus_kbd_disable_oobe(hdev);
> >               if (ret < 0)
> >                       return ret;
> > +     }
> >
> > -             /* Check for backlight support */
> > -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > -                     return -ENODEV;
> > +     if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
> > +             intf =3D to_usb_interface(hdev->dev.parent);
> > +             udev =3D interface_to_usbdev(intf);
> > +             validate_mcu_fw_version(
> > +                     hdev, le16_to_cpu(udev->descriptor.idProduct));
> >       }
> >
> > +     /* Check for backlight support */
> > +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > +             return -ENODEV;
> > +
> >       drvdata->kbd_backlight =3D devm_kzalloc(&hdev->dev,
> >                                             sizeof(struct asus_kbd_leds=
),
> >                                             GFP_KERNEL);
> >
>


