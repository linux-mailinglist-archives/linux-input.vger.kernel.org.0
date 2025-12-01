Return-Path: <linux-input+bounces-16412-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E418C964AF
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 09:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBFD93A3536
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 08:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD322FD693;
	Mon,  1 Dec 2025 08:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="HZO0BxK1"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711F92FD680
	for <linux-input@vger.kernel.org>; Mon,  1 Dec 2025 08:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764579515; cv=none; b=tNK1mpkqNgzhC27t8jEJMpDnrie+aXszMyXzhBc5/L0U33PU1tPDcbh63qgu7pLvwOs4ra9VHTJ7cYYY/I0Xvx8epa5XB45v6R3tLicwIu6WCoBz1pMjCyXHptDSWUu2H9btv0AUWuAZ/RmJZFNPazy3d+YwLB6h7u7WcNXEZ7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764579515; c=relaxed/simple;
	bh=Vt+dKKh6OyC+9I2Q8YvEP9ub/CjejoZQOI5OGBCr8+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=duKuT4x1cHxWO2QzhZhkcoOYW7UA0nRRRb3ZNGZQDQsR2lbKjlX3MczwBjFObd0Kmv3CswT+xGE2gi5n3R+nRKBNCiqjcsQZ1gd6KmiXhgrS1cWfzOowFAV3BjHAoJr0AV7SiPAL25WkHia9BNF1qGehl2X8PB7I2S/tCVjvg48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=HZO0BxK1; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 063D8BDBB5
	for <linux-input@vger.kernel.org>; Mon,  1 Dec 2025 10:58:24 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 00DA5BDB53
	for <linux-input@vger.kernel.org>; Mon,  1 Dec 2025 10:58:23 +0200 (EET)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 3C87A1FE22B
	for <linux-input@vger.kernel.org>; Mon,  1 Dec 2025 10:58:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1764579502;
	bh=WShJ8N3UjXsx02KJCsdN52jWdkYPB7hahFbS4+7tMeM=;
	h=Received:From:Subject:To;
	b=HZO0BxK10ofWTsO+CY+oATyaPmR3CET7eABObnh1WvCUxaIXk7kxO20or5C3fS8AH
	 WNNmObePqhSF3Nb/ZwBtZ8GiI7IszQa+Il46ySOF2h43LGj0tmiH7yATa8+0MVIoKt
	 O9Q70MmfCZZzJkofT2AvfiPUgg6iEXb1wEai/TekbAGNIwSGqZaLyxx+vOikF/Rp7Z
	 HM9GnyUQaUx8t6zmkGe9m3AVJM61xmDrTiddKQGYTAFW5+ecB4hhS2PD+vAcxuHuCL
	 /ouUdiTcXFP/6XXgSMltzTyFIWqemooqMIhc3wUzWRaO3NAzP6JPybBq4RVtb7fvcY
	 BU5N0M+EENWYQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f179.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-37b96cbd875so33001081fa.3
        for <linux-input@vger.kernel.org>;
 Mon, 01 Dec 2025 00:58:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWveVzBQj67+rEcdjqAXao20vDAed6erDvS2mCAqb1vEZNUgiSL8aVLYpaW2uut8S5mQ8rw5cjnitseWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSpBguJ8aAf3i4K2pGW2nVRi1J5lpwwhZlNmLQ42SfxMob84r+
	6rpwifecD03SfNUchRRghcIT+ig6GvESSm7kYiuIxwAqKotMLgEWeLg8Uor85QqT/0d40TC0WVm
	5EkNL2BYnOLL+UYZtIcmrcuMnSabrCZ0=
X-Google-Smtp-Source: 
 AGHT+IE2E2Swo+EnhmrAGoolM9K3r+B32elO3jaxG2vcAQ0omSfQFNPcfb4GnfTkRa/9Hv1OpRwyPTzXgCwWPlZUyok=
X-Received: by 2002:a05:651c:420a:b0:373:a5ad:639 with SMTP id
 38308e7fff4ca-37cd9154030mr90531971fa.8.1764579501458; Mon, 01 Dec 2025
 00:58:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122110032.4274-1-lkml@antheas.dev>
 <20251122110032.4274-11-lkml@antheas.dev>
 <713cc4fd-e6a1-4db4-907a-a0575a2b7b8f@gmail.com>
 <CAGwozwHwi7mopXY=DM2jt82jgdetdhNR-CUicX7R9KbYj4g0Xw@mail.gmail.com>
In-Reply-To: 
 <CAGwozwHwi7mopXY=DM2jt82jgdetdhNR-CUicX7R9KbYj4g0Xw@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 1 Dec 2025 09:58:10 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGOgE2JPaR34V8ETEq66bMd1rjGNokdnbLDE1Ch7PR5ig@mail.gmail.com>
X-Gm-Features: AWmQ_bk0zUe6-w-HERllXt2TmxwfEWOUFcS-ggIbgb5iWqlxUB-S-e6RG1HrGnw
Message-ID: 
 <CAGwozwGOgE2JPaR34V8ETEq66bMd1rjGNokdnbLDE1Ch7PR5ig@mail.gmail.com>
Subject: Re: [PATCH v10 10/11] platform/x86: asus-wmi: add keyboard brightness
 event handler
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176457950251.2775308.2046056908702003383@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 26 Nov 2025 at 21:39, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Wed, 26 Nov 2025 at 21:23, Denis Benato <benato.denis96@gmail.com> wrote:
> >
> >
> > On 11/22/25 12:00, Antheas Kapenekakis wrote:
> > > The keyboard brightness control of Asus WMI keyboards is handled in
> > > kernel, which leads to the shortcut going from brightness 0, to 1,
> > > to 2, and 3.
> > >
> > > However, for HID keyboards it is exposed as a key and handled by the
> > > user's desktop environment. For the toggle button, this means that
> > > brightness control becomes on/off. In addition, in the absence of a
> > > DE, the keyboard brightness does not work.
> > >
> > > Therefore, expose an event handler for the keyboard brightness control
> > > which can then be used by hid-asus. Since this handler is called from
> > > an interrupt context, defer the actual work to a workqueue.
> > >
> > > In the process, introduce ASUS_EV_MAX_BRIGHTNESS to hold the constant
> > > for maximum brightness since it is shared between hid-asus/asus-wmi.
> > >
> > > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > > Tested-by: Luke D. Jones <luke@ljones.dev>
> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >  drivers/platform/x86/asus-wmi.c            | 46 +++++++++++++++++++---
> > >  include/linux/platform_data/x86/asus-wmi.h | 13 ++++++
> > >  2 files changed, 54 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > > index 84cde34ab6a8..a69464e45ca4 100644
> > > --- a/drivers/platform/x86/asus-wmi.c
> > > +++ b/drivers/platform/x86/asus-wmi.c
> > > @@ -1719,6 +1719,44 @@ static void kbd_led_update_all(struct work_struct *work)
> > >       }
> > >  }
> > >
> > > +/*
> > > + * This function is called from hid-asus to inform asus-wmi of brightness
> > > + * changes initiated by the keyboard backlight keys.
> > > + */
> > > +int asus_hid_event(enum asus_hid_event event)
> > > +{
> > > +     struct asus_wmi *asus;
> > > +     int brightness;
> > > +
> > > +     guard(spinlock_irqsave)(&asus_ref.lock);
> > > +     asus = asus_ref.asus;
> > > +     if (!asus || !asus->kbd_led_registered)
> > > +             return -EBUSY;
> > > +
> > > +     brightness = asus->kbd_led_wk;
> > > +
> > > +     switch (event) {
> > > +     case ASUS_EV_BRTUP:
> > > +             brightness += 1;
> > > +             break;
> > > +     case ASUS_EV_BRTDOWN:
> > > +             brightness -= 1;
> > > +             break;
> > > +     case ASUS_EV_BRTTOGGLE:
> > > +             if (brightness >= ASUS_EV_MAX_BRIGHTNESS)
> > > +                     brightness = 0;
> > > +             else
> > > +                     brightness += 1;
> > > +             break;
> > > +     }
> > > +
> > > +     asus->kbd_led_wk = clamp_val(brightness, 0, ASUS_EV_MAX_BRIGHTNESS);
> > > +     asus->kbd_led_notify = true;
> > > +     queue_work(asus->led_workqueue, &asus->kbd_led_work);
> > > +     return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(asus_hid_event);
> > > +
> > >  /*
> > >   * These functions actually update the LED's, and are called from a
> > LEDs as opposed to LED's?
>
> I agree with you, but the author of that line probably wouldn't -
> depends on author dialect and both are usually correct.
>
> When making acronyms plural, adding a ' is usually accepted as
> correct. But this is not added as part of this series, so you can do a
> reword commit if you wish
>
> Antheas

Hm, perhaps this was not clear but the part you commented on was not
part of the patch/this series. Do you want to finish reviewing this
patch and add a rev-by?

@Ilpo: with 6.18 releasing yesterday, what is the status on this? is
it for 6.20? Hans commented on patch 5

Thanks,
Antheas

> > >   * workqueue. By doing this as separate work rather than when the LED
> > > @@ -1801,13 +1839,11 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
> > >  {
> > >       struct asus_hid_listener *listener;
> > >       struct asus_wmi *asus;
> > > -     int max_level;
> > >
> > >       asus = container_of(led_cdev, struct asus_wmi, kbd_led);
> > > -     max_level = asus->kbd_led.max_brightness;
> > >
> > >       scoped_guard(spinlock_irqsave, &asus_ref.lock)
> > > -             asus->kbd_led_wk = clamp_val(value, 0, max_level);
> > > +             asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
> > >
> > >       if (asus->kbd_led_avail)
> > >               kbd_led_update(asus);
> > > @@ -2011,7 +2047,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
> > >       asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> > >       asus->kbd_led.brightness_set = kbd_led_set;
> > >       asus->kbd_led.brightness_get = kbd_led_get;
> > > -     asus->kbd_led.max_brightness = 3;
> > > +     asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
> > >       asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
> > >       INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
> > >
> > > @@ -4530,7 +4566,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
> > >               return;
> > >       }
> > >       if (code == NOTIFY_KBD_BRTTOGGLE) {
> > > -             if (led_value == asus->kbd_led.max_brightness)
> > > +             if (led_value == ASUS_EV_MAX_BRIGHTNESS)
> > >                       kbd_led_set_by_kbd(asus, 0);
> > >               else
> > >                       kbd_led_set_by_kbd(asus, led_value + 1);
> > > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > > index d347cffd05d5..7b872b5d0960 100644
> > > --- a/include/linux/platform_data/x86/asus-wmi.h
> > > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > > @@ -178,6 +178,14 @@ struct asus_hid_listener {
> > >       void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
> > >  };
> > >
> > > +enum asus_hid_event {
> > > +     ASUS_EV_BRTUP,
> > > +     ASUS_EV_BRTDOWN,
> > > +     ASUS_EV_BRTTOGGLE,
> > > +};
> > > +
> > > +#define ASUS_EV_MAX_BRIGHTNESS 3
> > > +
> > >  #if IS_REACHABLE(CONFIG_ASUS_WMI)
> > >  void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
> > >  void set_ally_mcu_powersave(bool enabled);
> > > @@ -186,6 +194,7 @@ int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
> > >  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
> > >  int asus_hid_register_listener(struct asus_hid_listener *cdev);
> > >  void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
> > > +int asus_hid_event(enum asus_hid_event event);
> > >  #else
> > >  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
> > >  {
> > > @@ -213,6 +222,10 @@ static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
> > >  static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
> > >  {
> > >  }
> > > +static inline int asus_hid_event(enum asus_hid_event event)
> > > +{
> > > +     return -ENODEV;
> > > +}
> > >  #endif
> > >
> > >  #endif       /* __PLATFORM_DATA_X86_ASUS_WMI_H */
> >


