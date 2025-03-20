Return-Path: <linux-input+bounces-11016-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4BCA6A566
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 12:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75BF5189467F
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 11:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B28A21D5A6;
	Thu, 20 Mar 2025 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="djBuFE9g"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3AD13C695;
	Thu, 20 Mar 2025 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471290; cv=none; b=VHU7xghRd1UZNEfPsouBysFGO1v5QJUqub6H8HIEz+i/qaorioEyzxW0w1tJPrGYx8bVpZkAlqh+zBlHegADDGPCapU6ApDKyZ4sf5mc4Xw9kAv8Zl90hvnWKhagiHmoUo6yp3moy/hlk0XBYOsMkkFo9CCWfEEDsK7+Ey24C5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471290; c=relaxed/simple;
	bh=Yo4P9bC4QqT5mF3N37EnSs8M9X/HGUCUs0Pj2uq7ynI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cK7tybdY7V0OZckt5vjYA55Cy/7hO/aNAQS7BMDamHbbati4ziVmFjj6jC/7c2jtfn8ML7J3T32OY5oUoaBy+ygsAlc9NBJ+zRh2nVFS6Yhalg2qL1l72nvwN1kR/FXeaJU2EGL7mMmLzrxsnw1OGqojGO2Qv0JMTLaV3FCmNTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=djBuFE9g; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 97D192E08E07;
	Thu, 20 Mar 2025 13:48:03 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742471285;
	bh=SRmg7HpS0nS2d+yA4haeDWzBOeOxBaAv60Wmo8Uo4KI=;
	h=Received:From:Subject:To;
	b=djBuFE9gg0Qbg1cEqdMZHOEJUNRX2EzIa7Wb22qhQdIbjAgNRT7qea4NxBgu0Kxdt
	 xQgo9Q8NJBBU9ChL9keHcRf/d9NQByNU2NgDrMHQhd/kJ/NYU0djy/8YyDoKBkXWaH
	 E++bZWBPwjANNEW9BM90OlmJClYNLwfiPKPXUsI4=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30bfe0d2b6dso8070681fa.3;
        Thu, 20 Mar 2025 04:48:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUJg2aEMEoteJEsS69t8/GtyTVNraAts2DbGeFAmYnC8JTXdBy+2IhrK2nuf3JFC5Rd/odHSM1fUaf83A==@vger.kernel.org,
 AJvYcCXVlACaF7z0KtCQmBB9wSYtv7jtgwpsOb8IEpBJAWvcCJEEurCvapWrQwAFScQFTB1q3poC6bVMg4xHMpZL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+QJlhZAqWmfuTGOjbzD2OAsHfIfwiN976meSAuCylbDGBwW0o
	vE0OSWvqpcWqks1CtO2Jzs0vm4gC79SwIunsv5jzvuEMeY9WpJ8jX9oCPSV7U/0PozsnLIWSWyD
	evUnVkMvZexrfPWH369zZpLecXwg=
X-Google-Smtp-Source: 
 AGHT+IF17OfE7zMti/MYqPmeV5fwPzF74RPLd/rllrkpbLpxb0cakB0QSaDtLUUY0X4kLxKXdg3Sy9Oivy8RaZcV2nA=
X-Received: by 2002:a2e:6808:0:b0:30b:b7c3:ea4d with SMTP id
 38308e7fff4ca-30d72a86f14mr9361991fa.12.1742471281745; Thu, 20 Mar 2025
 04:48:01 -0700 (PDT)
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
In-Reply-To: 
 <CAGwozwGB69__pYzeTOmKnJrx1M8X4mgnDeRXE-dyFy9p495sBQ@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 20 Mar 2025 12:47:50 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEZ=zoeEui0=Tjcjfu8+DQjCNntTt-ZL0aLqHgoVrtDjA@mail.gmail.com>
X-Gm-Features: AQ5f1JpnV3ewICZ0dJrAb7g2VGl96RaRqox9X0_fF9JU3jLY-F52q-TSTmMpelo
Message-ID: 
 <CAGwozwEZ=zoeEui0=Tjcjfu8+DQjCNntTt-ZL0aLqHgoVrtDjA@mail.gmail.com>
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
 <174247128415.5826.13290285293814777676@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Thu, 20 Mar 2025 at 10:50, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Thu, 20 Mar 2025 at 08:19, Luke D. Jones <luke@ljones.dev> wrote:
> >
> >
> > On 20/03/25 08:13, Antheas Kapenekakis wrote:
> > > Currently, asus_kbd_init() uses a reverse engineered init sequence
> > > from Windows, which contains the handshakes from multiple programs.
> > > Keep the main one, which is 0x5a (meant for drivers).
> >
> > 0x5A is also used for Ally setup commands, used from userspace in
> > Windows. Only a nit but I don't think stating it's only for drivers is
> > accurate but then again asus kind of blurs the line a bit.
>
> ROG devices contain a HID USB endpoint that exposes multiple
> applications. On my Z13, that is 4 hiddev devices.
>
> However, we only care about two. Those are:
>
> Application / Report ID:
> 0xff310076 / 0x5a meant for Asus drivers
> 0xff310079 / 0x5d meant for Asus applications
>
> Both require the same handshake when they start. Well, in theory. But
> as you say in some of the Anime stuff requires it in practice too.
>
> The handshake is set_report 0x5X + "Asus...", then get_report with the
> same ID which should return the asus string.

I might have misread here and only 0x5d can be used for RGB. Actually
I probably misread. Let me get back to you on that.

But brightness is both 0x5d and 0x5a for sure. If I do RGB I will
defer initializing 0x5d until userspace tries to write the color.

Antheas

> In hiddraw, they appear under the same endpoint, both on the Ally and
> the Z13. But in hiddev (with hid-asus disabled or with this series),
> they appear as separate.
>
> I cannot comment on the Aura protocol, because I don't know, but for
> the basic sticky RGB mode that supports set and apply, they _should_
> behave identically. I use 0x5d in my userspace software for everything
> now [1]. Previously, I used 0x5a but I am not a driver.
>
> They do behave identically on the Ally X and the Z13 2025 though.
>
> I do not know about 0x5e. Perhaps Asus made a special endpoint for
> their Anime creation app.
>
> > > In addition, perform a get_response and check if the response is the
> > > same. To avoid regressions, print an error if the response does not
> > > match instead of rejecting device.
> > >
> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >   drivers/hid/hid-asus.c | 82 +++++++++++++++++++++++-------------------
> > >   1 file changed, 46 insertions(+), 36 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > > index 46e3e42f9eb5f..aa4a481dc4f27 100644
> > > --- a/drivers/hid/hid-asus.c
> > > +++ b/drivers/hid/hid-asus.c
> > > @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> > >   #define FEATURE_REPORT_ID 0x0d
> > >   #define INPUT_REPORT_ID 0x5d
> > >   #define FEATURE_KBD_REPORT_ID 0x5a
> > > -#define FEATURE_KBD_REPORT_SIZE 16
> > > +#define FEATURE_KBD_REPORT_SIZE 64
> > >   #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> > >   #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> > >
> > > @@ -386,16 +386,43 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
> > >       return ret;
> > >   }
> > >
> > > -static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
> > > +static int asus_kbd_init(struct hid_device *hdev)
> > >   {
> > > -     const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
> > > -                  0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> > > +     /*
> > > +      * Asus handshake identifying us as a driver (0x5A)
> > > +      * 0x5A then ASCII for "ASUS Tech.Inc."
> > > +      * 0x5D is for userspace Windows applications.
> >
> > 0x5D is the report ID used for commands such as RGB modes. Probably
> > don't need to mention it here, and only where it is used.
>
> Yep, see above. Not required for basic RGB. Maybe it is for Aura, but
> I'd leave that to userspace.
>
> > > +      * The handshake is first sent as a set_report, then retrieved
> > > +      * from a get_report to verify the response.
> > > +      */
> > > +     const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0x41, 0x53, 0x55, 0x53, 0x20,
> > > +             0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> > > +     u8 *readbuf;
> > >       int ret;
> > >
> > >       ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
> > > -     if (ret < 0)
> > > -             hid_err(hdev, "Asus failed to send init command: %d\n", ret);
> > > +     if (ret < 0) {
> > > +             hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
> > > +             return ret;
> > > +     }
> > >
> > > +     readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> > > +     if (!readbuf)
> > > +             return -ENOMEM;
> > > +
> > > +     ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
> > > +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> > > +                              HID_REQ_GET_REPORT);
> > > +     if (ret < 0) {
> > > +             hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> > > +     } else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> > > +             hid_err(hdev, "Asus handshake returned invalid response: %*ph\n",
> > > +                     FEATURE_KBD_REPORT_SIZE, readbuf);
> > > +             // Do not return error if handshake is wrong to avoid regressions
> >
> > I'll have to test this on the oldest model I have. Hopefully it's a
> > non-issue and this can return error instead.
> >
> > Side-note: I notice you're using a msleep to try and work around an
> > issue in a later patch - it might be worth trying replacing that with a
> > retry/count loop with an inner of small msleep + a call to this init,
> > see if it still responds to this during that critical period.
>
> The call did not fail. I was thinking it was because the device needs
> some time to warm up (it happens with certain devices).
>
> Turns out it was hid-multitouch not attaching.
>
> > > +     }
> > > +
> > > +     kfree(readbuf);
> > >       return ret;
> > >   }
> > >
> > > @@ -540,42 +567,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> > >       unsigned char kbd_func;
> > >       int ret;
> > >
> > > -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> > > -             /* Initialize keyboard */
> > > -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > > -             if (ret < 0)
> > > -                     return ret;
> > > -
> > > -             /* The LED endpoint is initialised in two HID */
> > > -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> > > -             if (ret < 0)
> > > -                     return ret;
> > > -
> > > -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> > > -             if (ret < 0)
> > > -                     return ret;
> >
> > Ah, I recall now. Some devices like the Slash or AniMe Matrix required
> > the 0x5E and 0x5D report ID (device dependent) however these are
> > currently being done via userspace due to not being HID devices.
> >
> > There *are* some older laptops still in use that require init on 0x5E or
> > 0x5D for RGB to be usable, from memory. It's been over 5 years so I'll
> > pull out the laptop I have with 0x1866 PID MCU and see if that is
> > actually true and not just my imagination.
>
> Hopefully you handshake with these devices over userspace, so they
> will not be affected.
>
> > > +     ret = asus_kbd_init(hdev);
> > > +     if (ret < 0)
> > > +             return ret;
> > >
> > > -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > > -                     ret = asus_kbd_disable_oobe(hdev);
> > > -                     if (ret < 0)
> > > -                             return ret;
> > > -             }
> > > -     } else {
> > > -             /* Initialize keyboard */
> > > -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > > -             if (ret < 0)
> > > -                     return ret;
> > > +     /* Get keyboard functions */
> > > +     ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> > > +     if (ret < 0)
> > > +             return ret;
> > >
> > > -             /* Get keyboard functions */
> > > -             ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> > > +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > > +             ret = asus_kbd_disable_oobe(hdev);
> > >               if (ret < 0)
> > >                       return ret;
> > > -
> > > -             /* Check for backlight support */
> > > -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > > -                     return -ENODEV;
> > >       }
> > >
> > > +     /* Check for backlight support */
> > > +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > > +             return -ENODEV;
> > > +
> > >       drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
> > >                                             sizeof(struct asus_kbd_leds),
> > >                                             GFP_KERNEL);
> >
> > I've left only small comments on a few patches for now. I'll review in
> > full after I get testing done on a variety of devices whcih I'm aiming
> > for this weekend. Overall impression so far is everything looks good and
> > this is a nice improvement. Thank you for taking the time to implement it.
> >
> > Cheers,
> > Luke.
>
> I'll try to have V2 out today. I finished it yesterday and fixed all
> the lockups and the hid-multitouch issue. Just needs a good
> lookthrough.
>
> Perhaps I will also do a small multi-intensity endpoint that works
> with KDE and only applies the colors when asked. This way our programs
> are not affected and normal laptop users get basic RGB OOTB.
>
> If I do that, I will make the quirk for the Ally in a separate patch,
> so that you can nack it if you'd rather introduce RGB support with
> your driver, so that it does not need to be reverted.
>
> Antheas
>
> [1] https://github.com/hhd-dev/hhd/blob/d3bbd7fa25fe9a4838896a2c5cfda460abe48dc6/src/hhd/device/rog_ally/const.py#L5-L8

