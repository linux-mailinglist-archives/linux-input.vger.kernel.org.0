Return-Path: <linux-input+bounces-16415-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7BFC97181
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 12:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5D2E44E14DF
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 11:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115912D9EF4;
	Mon,  1 Dec 2025 11:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="XX5fxkeJ"
X-Original-To: linux-input@vger.kernel.org
Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05572DA76F
	for <linux-input@vger.kernel.org>; Mon,  1 Dec 2025 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764589484; cv=none; b=RRc5EcD7mlIefU7DHy3PU/dzytEBn3lJT9WJQvI4sVzvJtJjbYNUCbiPXrF1MddhYYxTthyfMkgpNWYvc4WyKx+gQ7eTY+fOQWVo0811Ay7ckXrB0cuUgOmmg3/8RNSrOhpjhQeLo7pms3MFlYRTqvtpmQx6BFYMreHy9guXqWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764589484; c=relaxed/simple;
	bh=TsBbzYG6kV21XFhXbXZjXim/2PHcbnEJwP+hiihBFos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjZnxiLmWzc/QjuMSDL/tCNyEyl7euEvxm/lM+mmz2WlET+DE8XtdwWEeavPydMVlL7Vk239iIFtJ+nEpKjeIzpEonwa5/mp68te4LCuT+WIATSBOpfR3cTsWRhKOMZYL7fZp0+qNy/hPWoS7YbYQkbuKVNXP/avFTlLHpxQKN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=XX5fxkeJ; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id 247D043EE7
	for <linux-input@vger.kernel.org>; Mon,  1 Dec 2025 11:44:33 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id 1667843EC4
	for <linux-input@vger.kernel.org>; Mon,  1 Dec 2025 11:44:32 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 567151FEF0A
	for <linux-input@vger.kernel.org>; Mon,  1 Dec 2025 13:44:31 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1764589471;
	bh=3JZbRSHwGX4arYVCJTOlVExAvtxi6WruTVEXNFHv7OM=;
	h=Received:From:Subject:To;
	b=XX5fxkeJZyMZS/AO1R0TsIyE0HJQVhiwDtyuQWd69HjRdd0aTtFe++BjBLACHAb92
	 EDEHN0AN/3x64GXdceUWai9o6DiKXtpQq/sNlrgqR9RCsO93yC6Hp7THCmyVfqK9i+
	 yU22fXx/zt39+0siQdrNiOLME8ODCiqciasGIfP1E2ee53WGMGMLx6OI58ngN/uTSs
	 IV/KyQ+0EfpnfFBfwtckTHvh6P74CsFU90ElUBW7D8vQlqkJ/diibpUkhIaOtzDTVC
	 FJictqXcfgxfJe/6AIfOurOsZzFnLC0xLnfQdxTaKDqv1Gno4k+1gHuAgec0PzZ1eZ
	 /wCyi42zI/dvg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f169.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-37bac34346dso28234511fa.2
        for <linux-input@vger.kernel.org>;
 Mon, 01 Dec 2025 03:44:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUBuHtmp9aBqUIWr0yhA6b61W6d/lLLsHKLXhyyyjrxlrB2xHhAAT8xHhS9TQyfbhYOgRhcJ7c4PHj8Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz09iP+rtSHcUlzCp6YFX2WgOaPm8iA5Fd0zhAOQR9ShRpEEJxm
	d6hAH1ubNl/J83m/ChC3iHwlwKVl/GQYqGzVVklq57KjUQIlHfg7zpsk1FZJMomzAzMCokdZKLY
	yHgKaPMY3J9BfR4I8mkymxLETV6MLmJY=
X-Google-Smtp-Source: 
 AGHT+IF35OxllvEWkjK0qxe/OGGTueEv3S7roktr2Sxwo0WQOs5m1EUOtB0k/Wdg0Bp5hVMS5HacFDitAtnLG2i3HoQ=
X-Received: by 2002:a2e:c41:0:b0:37b:970f:d33f with SMTP id
 38308e7fff4ca-37cd9287d6dmr68637781fa.21.1764589470783; Mon, 01 Dec 2025
 03:44:30 -0800 (PST)
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
 <CAGwozwGOgE2JPaR34V8ETEq66bMd1rjGNokdnbLDE1Ch7PR5ig@mail.gmail.com>
 <4c24cacf-a1e0-186d-5e44-c6772e32ffc2@linux.intel.com>
In-Reply-To: <4c24cacf-a1e0-186d-5e44-c6772e32ffc2@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 1 Dec 2025 12:44:18 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGquTikG3-7oJxQWDt6a836FU-Lk+M3JtM6efaTCc0Vng@mail.gmail.com>
X-Gm-Features: AWmQ_bmFkRR95ilHUu8zjgL7h_TkdTnpcRXbTQn2lj0-mU7cRTQd8JiVAkY0iF8
Message-ID: 
 <CAGwozwGquTikG3-7oJxQWDt6a836FU-Lk+M3JtM6efaTCc0Vng@mail.gmail.com>
Subject: Re: [PATCH v10 10/11] platform/x86: asus-wmi: add keyboard brightness
 event handler
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <benato.denis96@gmail.com>,
 platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176458947156.3500911.8933351325022754784@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 1 Dec 2025 at 10:52, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 1 Dec 2025, Antheas Kapenekakis wrote:
> > On Wed, 26 Nov 2025 at 21:39, Antheas Kapenekakis <lkml@antheas.dev> wr=
ote:
> > > On Wed, 26 Nov 2025 at 21:23, Denis Benato <benato.denis96@gmail.com>=
 wrote:
> > > > On 11/22/25 12:00, Antheas Kapenekakis wrote:
> > > > > The keyboard brightness control of Asus WMI keyboards is handled =
in
> > > > > kernel, which leads to the shortcut going from brightness 0, to 1=
,
> > > > > to 2, and 3.
> > > > >
> > > > > However, for HID keyboards it is exposed as a key and handled by =
the
> > > > > user's desktop environment. For the toggle button, this means tha=
t
> > > > > brightness control becomes on/off. In addition, in the absence of=
 a
> > > > > DE, the keyboard brightness does not work.
> > > > >
> > > > > Therefore, expose an event handler for the keyboard brightness co=
ntrol
> > > > > which can then be used by hid-asus. Since this handler is called =
from
> > > > > an interrupt context, defer the actual work to a workqueue.
> > > > >
> > > > > In the process, introduce ASUS_EV_MAX_BRIGHTNESS to hold the cons=
tant
> > > > > for maximum brightness since it is shared between hid-asus/asus-w=
mi.
> > > > >
> > > > > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > > > > Tested-by: Luke D. Jones <luke@ljones.dev>
> > > > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > > > ---
> > > > >  drivers/platform/x86/asus-wmi.c            | 46 ++++++++++++++++=
+++---
> > > > >  include/linux/platform_data/x86/asus-wmi.h | 13 ++++++
> > > > >  2 files changed, 54 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x=
86/asus-wmi.c
> > > > > index 84cde34ab6a8..a69464e45ca4 100644
> > > > > --- a/drivers/platform/x86/asus-wmi.c
> > > > > +++ b/drivers/platform/x86/asus-wmi.c
> > > > > @@ -1719,6 +1719,44 @@ static void kbd_led_update_all(struct work=
_struct *work)
> > > > >       }
> > > > >  }
> > > > >
> > > > > +/*
> > > > > + * This function is called from hid-asus to inform asus-wmi of b=
rightness
> > > > > + * changes initiated by the keyboard backlight keys.
> > > > > + */
> > > > > +int asus_hid_event(enum asus_hid_event event)
> > > > > +{
> > > > > +     struct asus_wmi *asus;
> > > > > +     int brightness;
> > > > > +
> > > > > +     guard(spinlock_irqsave)(&asus_ref.lock);
> > > > > +     asus =3D asus_ref.asus;
> > > > > +     if (!asus || !asus->kbd_led_registered)
> > > > > +             return -EBUSY;
> > > > > +
> > > > > +     brightness =3D asus->kbd_led_wk;
> > > > > +
> > > > > +     switch (event) {
> > > > > +     case ASUS_EV_BRTUP:
> > > > > +             brightness +=3D 1;
> > > > > +             break;
> > > > > +     case ASUS_EV_BRTDOWN:
> > > > > +             brightness -=3D 1;
> > > > > +             break;
> > > > > +     case ASUS_EV_BRTTOGGLE:
> > > > > +             if (brightness >=3D ASUS_EV_MAX_BRIGHTNESS)
> > > > > +                     brightness =3D 0;
> > > > > +             else
> > > > > +                     brightness +=3D 1;
> > > > > +             break;
> > > > > +     }
> > > > > +
> > > > > +     asus->kbd_led_wk =3D clamp_val(brightness, 0, ASUS_EV_MAX_B=
RIGHTNESS);
> > > > > +     asus->kbd_led_notify =3D true;
> > > > > +     queue_work(asus->led_workqueue, &asus->kbd_led_work);
> > > > > +     return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(asus_hid_event);
> > > > > +
> > > > >  /*
> > > > >   * These functions actually update the LED's, and are called fro=
m a
> > > > LEDs as opposed to LED's?
> > >
> > > I agree with you, but the author of that line probably wouldn't -
> > > depends on author dialect and both are usually correct.
> > >
> > > When making acronyms plural, adding a ' is usually accepted as
> > > correct. But this is not added as part of this series, so you can do =
a
> > > reword commit if you wish
> > >
> > > Antheas
> >
> > Hm, perhaps this was not clear but the part you commented on was not
> > part of the patch/this series. Do you want to finish reviewing this
> > patch and add a rev-by?
> >
> > @Ilpo: with 6.18 releasing yesterday, what is the status on this? is
> > it for 6.20? Hans commented on patch 5
>
> It will have to wait to the 6.20 cycle as it's cross-subsystem series so
> there are other maintainers involved than just me.

Unfortunate. Jiri is cc'd on this series and we had around 2 weeks
where the code was frozen. Was it my responsibility to ask for acks so
it can go through x86?

> --
>  i.
>
> > Thanks,
> > Antheas
> >
> > > > >   * workqueue. By doing this as separate work rather than when th=
e LED
> > > > > @@ -1801,13 +1839,11 @@ static void do_kbd_led_set(struct led_cla=
ssdev *led_cdev, int value)
> > > > >  {
> > > > >       struct asus_hid_listener *listener;
> > > > >       struct asus_wmi *asus;
> > > > > -     int max_level;
> > > > >
> > > > >       asus =3D container_of(led_cdev, struct asus_wmi, kbd_led);
> > > > > -     max_level =3D asus->kbd_led.max_brightness;
> > > > >
> > > > >       scoped_guard(spinlock_irqsave, &asus_ref.lock)
> > > > > -             asus->kbd_led_wk =3D clamp_val(value, 0, max_level)=
;
> > > > > +             asus->kbd_led_wk =3D clamp_val(value, 0, ASUS_EV_MA=
X_BRIGHTNESS);
> > > > >
> > > > >       if (asus->kbd_led_avail)
> > > > >               kbd_led_update(asus);
> > > > > @@ -2011,7 +2047,7 @@ static int asus_wmi_led_init(struct asus_wm=
i *asus)
> > > > >       asus->kbd_led.flags =3D LED_BRIGHT_HW_CHANGED;
> > > > >       asus->kbd_led.brightness_set =3D kbd_led_set;
> > > > >       asus->kbd_led.brightness_get =3D kbd_led_get;
> > > > > -     asus->kbd_led.max_brightness =3D 3;
> > > > > +     asus->kbd_led.max_brightness =3D ASUS_EV_MAX_BRIGHTNESS;
> > > > >       asus->kbd_led_avail =3D !kbd_led_read(asus, &led_val, NULL)=
;
> > > > >       INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
> > > > >
> > > > > @@ -4530,7 +4566,7 @@ static void asus_wmi_handle_event_code(int =
code, struct asus_wmi *asus)
> > > > >               return;
> > > > >       }
> > > > >       if (code =3D=3D NOTIFY_KBD_BRTTOGGLE) {
> > > > > -             if (led_value =3D=3D asus->kbd_led.max_brightness)
> > > > > +             if (led_value =3D=3D ASUS_EV_MAX_BRIGHTNESS)
> > > > >                       kbd_led_set_by_kbd(asus, 0);
> > > > >               else
> > > > >                       kbd_led_set_by_kbd(asus, led_value + 1);
> > > > > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include=
/linux/platform_data/x86/asus-wmi.h
> > > > > index d347cffd05d5..7b872b5d0960 100644
> > > > > --- a/include/linux/platform_data/x86/asus-wmi.h
> > > > > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > > > > @@ -178,6 +178,14 @@ struct asus_hid_listener {
> > > > >       void (*brightness_set)(struct asus_hid_listener *listener, =
int brightness);
> > > > >  };
> > > > >
> > > > > +enum asus_hid_event {
> > > > > +     ASUS_EV_BRTUP,
> > > > > +     ASUS_EV_BRTDOWN,
> > > > > +     ASUS_EV_BRTTOGGLE,
> > > > > +};
> > > > > +
> > > > > +#define ASUS_EV_MAX_BRIGHTNESS 3
> > > > > +
> > > > >  #if IS_REACHABLE(CONFIG_ASUS_WMI)
> > > > >  void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
> > > > >  void set_ally_mcu_powersave(bool enabled);
> > > > > @@ -186,6 +194,7 @@ int asus_wmi_set_devstate(u32 dev_id, u32 ctr=
l_param, u32 *retval);
> > > > >  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, =
u32 *retval);
> > > > >  int asus_hid_register_listener(struct asus_hid_listener *cdev);
> > > > >  void asus_hid_unregister_listener(struct asus_hid_listener *cdev=
);
> > > > > +int asus_hid_event(enum asus_hid_event event);
> > > > >  #else
> > > > >  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack sta=
tus)
> > > > >  {
> > > > > @@ -213,6 +222,10 @@ static inline int asus_hid_register_listener=
(struct asus_hid_listener *bdev)
> > > > >  static inline void asus_hid_unregister_listener(struct asus_hid_=
listener *bdev)
> > > > >  {
> > > > >  }
> > > > > +static inline int asus_hid_event(enum asus_hid_event event)
> > > > > +{
> > > > > +     return -ENODEV;
> > > > > +}
> > > > >  #endif
> > > > >
> > > > >  #endif       /* __PLATFORM_DATA_X86_ASUS_WMI_H */
> > > >
> >
>


