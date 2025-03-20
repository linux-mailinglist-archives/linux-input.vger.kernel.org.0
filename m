Return-Path: <linux-input+bounces-11031-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8BA6AFA8
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 22:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 245511891A15
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 21:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A72922A1ED;
	Thu, 20 Mar 2025 21:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="OgrcsJSg"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42B9227E9F;
	Thu, 20 Mar 2025 21:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742504987; cv=none; b=nkAapzv0MtL33oVRk0awxPacrAkKt6R1QPdYsrSe+uW8xcDUh6IedvZw9O4ADMiAXxE/O+TajMSnZztlTSECS2d6QNxL08sQG1Ve9jYpvdgqGKgbLzRFjgTKDPcXzNBPdkhIi1I4MBtIEd4uoz27yz4cBq0bg3geQVlRN4EJK+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742504987; c=relaxed/simple;
	bh=SlsuyA7V4iyc/GyQzMegNuxFiMcFHwNB0y8pYQLUaAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fcKdDj42BwzY8Xil1C+gRXwcKDQL0dAajznFu1BDhgolBl0qSRPERR7Tq2Wt+AOxqU77IaR/B4cyDxCdxQAVbFgluv70bjp9WvX0E4I8fUvEJA1BUx5ARw8L+dpaTcphiy+llPf03GqAXFhYkSotMk/beW0FG4lpY6Bc1MWZteM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=OgrcsJSg; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id A58422E09500;
	Thu, 20 Mar 2025 23:09:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742504980;
	bh=59n+yQJv3o9GiBlf8oGmhXQWxbgqRRxB1d9kz8fKI8Q=;
	h=Received:From:Subject:To;
	b=OgrcsJSgHwVEflwkVg6GjYjCNGzDLi47p0QXhQOblOmruU90z376Z8C9U5D1SLQFi
	 Gf5xD2zKmhJ27hkhCve0OF4Ev4ZykkmIPvvidYe3pBZxih8PwapxZ2CfQNaPmRGnbi
	 DW2IDJoLeFEV8HriOMc0LplRf6cmN6KG+IUWXXUM=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f169.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30613802a04so13914581fa.2;
        Thu, 20 Mar 2025 14:09:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUHI9Tq0OD9JgISKk2yBLVlvWVkmHIT32Iby6wvuDBmxeb3X6aEiV6CG4bs0vJ19FdxBEeo7XUaKfByjQ==@vger.kernel.org,
 AJvYcCVFcfHv6eKNUjB5Q0ehTt4GRHCQ4APiR/3pTmwpGeVsqF3P98ygl92y8C9F7cp7zm84wvvyT5XD18Dwntlh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9yKb6hMmpWO/KKWbtsvlvuhQ3k7J5m04clRbw5ftFSf2rqKpv
	79IkOxGP3hMs48P9UHMlwpaRv7H6BkP6q3Erpkw2YT7HDKJCys93rpiIUZNtC+9+gonSKEztiy6
	bSdT6QsF8tCHr3F0Gf2BP64tFkdU=
X-Google-Smtp-Source: 
 AGHT+IFfxHakwOdh6OBszFy2pKTqvgNtbuTCiur/XTPlSAYGwirk89aGTSmouU79HocLstggsMcM5wBi/8BlppJj8G8=
X-Received: by 2002:a2e:a99f:0:b0:30b:f24a:651a with SMTP id
 38308e7fff4ca-30d7e20642dmr2555661fa.5.1742504978851; Thu, 20 Mar 2025
 14:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319191320.10092-1-lkml@antheas.dev>
 <20250319191320.10092-2-lkml@antheas.dev>
 <567b2056-8687-4f92-b4d2-7f289321275e@ljones.dev>
 <CAGwozwGB69__pYzeTOmKnJrx1M8X4mgnDeRXE-dyFy9p495sBQ@mail.gmail.com>
 <11dc0b16-84a3-4eee-9e38-7db0db8b4d5e@ljones.dev>
In-Reply-To: <11dc0b16-84a3-4eee-9e38-7db0db8b4d5e@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 20 Mar 2025 22:09:27 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFTs9i+hsOX9=6KFXxqaqcC8-RsVWtacFg8jEV829S_vQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jp-GnwFC5l4y2j_txX8NPeeib4q1sfV_zW57YsCQHQwRvx9uCfu0zbt9zY
Message-ID: 
 <CAGwozwFTs9i+hsOX9=6KFXxqaqcC8-RsVWtacFg8jEV829S_vQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] HID: asus: refactor init sequence per spec
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174250498016.18045.16757385680336241210@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Thu, 20 Mar 2025 at 22:01, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 20/03/25 22:50, Antheas Kapenekakis wrote:
> > On Thu, 20 Mar 2025 at 08:19, Luke D. Jones <luke@ljones.dev> wrote:
> >>
> >>
> >> On 20/03/25 08:13, Antheas Kapenekakis wrote:
> >>> Currently, asus_kbd_init() uses a reverse engineered init sequence
> >>> from Windows, which contains the handshakes from multiple programs.
> >>> Keep the main one, which is 0x5a (meant for drivers).
> >>
> >> 0x5A is also used for Ally setup commands, used from userspace in
> >> Windows. Only a nit but I don't think stating it's only for drivers is
> >> accurate but then again asus kind of blurs the line a bit.
> >
> > ROG devices contain a HID USB endpoint that exposes multiple
> > applications. On my Z13, that is 4 hiddev devices.
> >
> > However, we only care about two. Those are:
> >
> > Application / Report ID:
> > 0xff310076 / 0x5a meant for Asus drivers
> > 0xff310079 / 0x5d meant for Asus applications
>
> I'm curious how you determined that. From what I've seen asus are
> consistent until they're not - typically it's when they have a weird
> device like the Slash or Anime. The slash on the G16 uses the same MCU
> and endpoint as the keyboard, but with a new report ID, while the slash
> on a G14 is a separate MCU (or at least device exposed by MCU) with own
> endpoints and hid report.
>
> It's not important here yet, I'm just trying to add context and provide
> some extra information for you.
>
> > Both require the same handshake when they start. Well, in theory. But
> > as you say in some of the Anime stuff requires it in practice too.
>
> Yeah as above, the G14 slash needs it, so does the older Anime dispaly.
> But the G16 slash being on the same MCU doesn't. In any case those
> gadgets are being handled in userspace just fine regardless of the
> driver state. Still, not really relevant here and I'm just adding context.
>
> > The handshake is set_report 0x5X + "Asus...", then get_report with the
> > same ID which should return the asus string.
> >
> > In hiddraw, they appear under the same endpoint, both on the Ally and
> > the Z13. But in hiddev (with hid-asus disabled or with this series),
> > they appear as separate.
> >
> > I cannot comment on the Aura protocol, because I don't know, but for
> > the basic sticky RGB mode that supports set and apply, they _should_
> > behave identically. I use 0x5d in my userspace software for everything
> > now [1]. Previously, I used 0x5a but I am not a driver.
> >
> > They do behave identically on the Ally X and the Z13 2025 though.
>
> It is something I do have to test, and I'll add your v2 to kernels to
> get some feedback from my discord group too. I know for sure that there
> were some laptops that didn't accept 0x5D for brightness - I'm sorry I'm
> so vague on this part, I really don't remember the details and I lost
> notes so it will need to be tested.

Well, different ODMs different years stuff changes, theory is theory.
I looked it up and I still use 0x5a for the Ally for RGB.

I am almost done with an initial version of the RGB patch. KDE seems
to not be cooperating and setting the brightness to 0 though. I would
not say it is ready to consume yet. The rest of the series as a V2
should work well though. Should post it in around an hour.

Antheas

> > I do not know about 0x5e. Perhaps Asus made a special endpoint for
> > their Anime creation app.
>
> It is only for that yes.
>
> Cheers,
> Luke.
>
> >>> In addition, perform a get_response and check if the response is the
> >>> same. To avoid regressions, print an error if the response does not
> >>> match instead of rejecting device.
> >>>
> >>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>> ---
> >>>    drivers/hid/hid-asus.c | 82 +++++++++++++++++++++++-------------------
> >>>    1 file changed, 46 insertions(+), 36 deletions(-)
> >>>
> >>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>> index 46e3e42f9eb5f..aa4a481dc4f27 100644
> >>> --- a/drivers/hid/hid-asus.c
> >>> +++ b/drivers/hid/hid-asus.c
> >>> @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >>>    #define FEATURE_REPORT_ID 0x0d
> >>>    #define INPUT_REPORT_ID 0x5d
> >>>    #define FEATURE_KBD_REPORT_ID 0x5a
> >>> -#define FEATURE_KBD_REPORT_SIZE 16
> >>> +#define FEATURE_KBD_REPORT_SIZE 64
> >>>    #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> >>>    #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> >>>
> >>> @@ -386,16 +386,43 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
> >>>        return ret;
> >>>    }
> >>>
> >>> -static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
> >>> +static int asus_kbd_init(struct hid_device *hdev)
> >>>    {
> >>> -     const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
> >>> -                  0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> >>> +     /*
> >>> +      * Asus handshake identifying us as a driver (0x5A)
> >>> +      * 0x5A then ASCII for "ASUS Tech.Inc."
> >>> +      * 0x5D is for userspace Windows applications.
> >>
> >> 0x5D is the report ID used for commands such as RGB modes. Probably
> >> don't need to mention it here, and only where it is used.
> >
> > Yep, see above. Not required for basic RGB. Maybe it is for Aura, but
> > I'd leave that to userspace.
> >
> >>> +      * The handshake is first sent as a set_report, then retrieved
> >>> +      * from a get_report to verify the response.
> >>> +      */
> >>> +     const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0x41, 0x53, 0x55, 0x53, 0x20,
> >>> +             0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> >>> +     u8 *readbuf;
> >>>        int ret;
> >>>
> >>>        ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
> >>> -     if (ret < 0)
> >>> -             hid_err(hdev, "Asus failed to send init command: %d\n", ret);
> >>> +     if (ret < 0) {
> >>> +             hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
> >>> +             return ret;
> >>> +     }
> >>>
> >>> +     readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> >>> +     if (!readbuf)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
> >>> +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> >>> +                              HID_REQ_GET_REPORT);
> >>> +     if (ret < 0) {
> >>> +             hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> >>> +     } else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> >>> +             hid_err(hdev, "Asus handshake returned invalid response: %*ph\n",
> >>> +                     FEATURE_KBD_REPORT_SIZE, readbuf);
> >>> +             // Do not return error if handshake is wrong to avoid regressions
> >>
> >> I'll have to test this on the oldest model I have. Hopefully it's a
> >> non-issue and this can return error instead.
> >>
> >> Side-note: I notice you're using a msleep to try and work around an
> >> issue in a later patch - it might be worth trying replacing that with a
> >> retry/count loop with an inner of small msleep + a call to this init,
> >> see if it still responds to this during that critical period.
> >
> > The call did not fail. I was thinking it was because the device needs
> > some time to warm up (it happens with certain devices).
> >
> > Turns out it was hid-multitouch not attaching.
> >
> >>> +     }
> >>> +
> >>> +     kfree(readbuf);
> >>>        return ret;
> >>>    }
> >>>
> >>> @@ -540,42 +567,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >>>        unsigned char kbd_func;
> >>>        int ret;
> >>>
> >>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> >>> -             /* Initialize keyboard */
> >>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> >>> -             if (ret < 0)
> >>> -                     return ret;
> >>> -
> >>> -             /* The LED endpoint is initialised in two HID */
> >>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>> -             if (ret < 0)
> >>> -                     return ret;
> >>> -
> >>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>> -             if (ret < 0)
> >>> -                     return ret;
> >>
> >> Ah, I recall now. Some devices like the Slash or AniMe Matrix required
> >> the 0x5E and 0x5D report ID (device dependent) however these are
> >> currently being done via userspace due to not being HID devices.
> >>
> >> There *are* some older laptops still in use that require init on 0x5E or
> >> 0x5D for RGB to be usable, from memory. It's been over 5 years so I'll
> >> pull out the laptop I have with 0x1866 PID MCU and see if that is
> >> actually true and not just my imagination.
> >
> > Hopefully you handshake with these devices over userspace, so they
> > will not be affected.
> >
> >>> +     ret = asus_kbd_init(hdev);
> >>> +     if (ret < 0)
> >>> +             return ret;
> >>>
> >>> -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> >>> -                     ret = asus_kbd_disable_oobe(hdev);
> >>> -                     if (ret < 0)
> >>> -                             return ret;
> >>> -             }
> >>> -     } else {
> >>> -             /* Initialize keyboard */
> >>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> >>> -             if (ret < 0)
> >>> -                     return ret;
> >>> +     /* Get keyboard functions */
> >>> +     ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> >>> +     if (ret < 0)
> >>> +             return ret;
> >>>
> >>> -             /* Get keyboard functions */
> >>> -             ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> >>> +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> >>> +             ret = asus_kbd_disable_oobe(hdev);
> >>>                if (ret < 0)
> >>>                        return ret;
> >>> -
> >>> -             /* Check for backlight support */
> >>> -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >>> -                     return -ENODEV;
> >>>        }
> >>>
> >>> +     /* Check for backlight support */
> >>> +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >>> +             return -ENODEV;
> >>> +
> >>>        drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
> >>>                                              sizeof(struct asus_kbd_leds),
> >>>                                              GFP_KERNEL);
> >>
> >> I've left only small comments on a few patches for now. I'll review in
> >> full after I get testing done on a variety of devices whcih I'm aiming
> >> for this weekend. Overall impression so far is everything looks good and
> >> this is a nice improvement. Thank you for taking the time to implement it.
> >>
> >> Cheers,
> >> Luke.
> >
> > I'll try to have V2 out today. I finished it yesterday and fixed all
> > the lockups and the hid-multitouch issue. Just needs a good
> > lookthrough.
> >
> > Perhaps I will also do a small multi-intensity endpoint that works
> > with KDE and only applies the colors when asked. This way our programs
> > are not affected and normal laptop users get basic RGB OOTB.
> >
> > If I do that, I will make the quirk for the Ally in a separate patch,
> > so that you can nack it if you'd rather introduce RGB support with
> > your driver, so that it does not need to be reverted.
> >
> > Antheas
> >
> > [1] https://github.com/hhd-dev/hhd/blob/d3bbd7fa25fe9a4838896a2c5cfda460abe48dc6/src/hhd/device/rog_ally/const.py#L5-L8
>

