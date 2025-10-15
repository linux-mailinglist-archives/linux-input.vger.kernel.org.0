Return-Path: <linux-input+bounces-15506-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F74BDF6BD
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 17:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77287188EF5D
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 15:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C87303A11;
	Wed, 15 Oct 2025 15:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="EereNS/C"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC7F2FFFB1
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 15:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542710; cv=none; b=Vk1dhMO6mbXGtkx3OJvvpQUVjtHqv61EKDiS4YqqE5HJucuwcKXypjKiStNVV8whY31hA8U9oZzpEBUFKsUISOiHbqW/FkjYoa+fKerVSGLr0+9+m/TO40QADVUa2vTiaI0zN4EYg7ce4tdgpvNUmhc7PnO/MAsrwV5O1jzk014=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542710; c=relaxed/simple;
	bh=gIezYiTegFyBcP/3Fb+EbVWbtQuVMFl/3rnZU/geUsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOPMraiNx5jEy69TW8q+5xMmu7A8S6YVcLu2sMqIogz5eqhYdmsW6qyQjZAH0KjL5w2dXStydniPxWM/3VhQDvsmoXX06xrLIUq7ae4MJdfpTjiTSZec1d7MFZJCqqC/669+sVYRv7HrjtJN84ukn5KjoJgUPc709oBJd39A/X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=EereNS/C; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 79E035E70B
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 18:38:25 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id A52C85E6AE
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 18:38:23 +0300 (EEST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 58C90200793
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 18:38:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760542702;
	bh=mQ7/WGOdGYf6mG7n10jnlLe+eDnokaXF7eAESwWnDQA=;
	h=Received:From:Subject:To;
	b=EereNS/CupQur/0Dwu+NtIaLahU+oHejs2PLUSEu2hNXlV4797W5cf0XVZN5el9Ci
	 JfTux6sP7A37p0qYI1FyRT0hT1OmSaN9I52/lWIO5XeODPg5X5qXasW4gl7lu+kdev
	 h4vcoz0H9+sf/jStFMhc2mVik6zU8VIyuw2PYfNOKapc5HNq+L4rQQKH9wobeyB88N
	 ZUuIUZxv1Rf40an9TGYcGKdd8bwoWU0Na2e5e+RWQ+URLBnqozrIa9jBL6H9UK7bU1
	 X731Ptn2Tle2GaioS6oE92q+q/qiiD08B2qCAmwAIEDrpXRoL8U1JfqjIaL/CG9rE6
	 zh9D0htKC465Q==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.176) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f176.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-37634d352dfso55224431fa.3
        for <linux-input@vger.kernel.org>;
 Wed, 15 Oct 2025 08:38:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWCp+xxBTLujn7CL/Y3RgaEYb2f/bhrjAgIhhcDq7quZ+tBYFMpABXRSXaKCGlfm94VtNjaxgcJYxB4bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA3Z0nrOc7vBG1SVJ1I1J/POt/93fgtLsWZmuZ9+Of3l8GbVBQ
	YC0YoP/NlMhdOIgSMATuVMfyu/aYZQiLmZr4LkOziNSrGcOQEyG6dW8jDWSTShrPBt1P/YYjNol
	zv9Jwby/nyxO2D1N7LsnIvGwsvMPDBsE=
X-Google-Smtp-Source: 
 AGHT+IFjqcKyYvGe7pHZIYE2H4S3rda8I4BB4biO+WOCIaCVKhqZUt8ACTiws2IWJ8pMURwHRVEKmxtrfAqtqNdZfcQ=
X-Received: by 2002:a05:651c:199e:b0:333:b6b1:a151 with SMTP id
 38308e7fff4ca-37609ce579cmr80632981fa.7.1760542701798; Wed, 15 Oct 2025
 08:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013201535.6737-1-lkml@antheas.dev>
 <20251013201535.6737-7-lkml@antheas.dev>
 <4e4af3e9-26d3-ad03-7868-7fd7dbd541f3@linux.intel.com>
In-Reply-To: <4e4af3e9-26d3-ad03-7868-7fd7dbd541f3@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 15 Oct 2025 17:38:10 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFb9HsT4DCDvASdyxBjO6rJoODbBchXt1GXmRD7gqZ1nA@mail.gmail.com>
X-Gm-Features: AS18NWDUdsfcgcvuMLIdgA9AW5hQrdjU8rtiJSwIpWPukhUnQInxKfrQt1LW6ig
Message-ID: 
 <CAGwozwFb9HsT4DCDvASdyxBjO6rJoODbBchXt1GXmRD7gqZ1nA@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] platform/x86: asus-wmi: add keyboard brightness
 event handler
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176054270264.2565086.8574477263268073134@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 15 Oct 2025 at 14:19, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 13 Oct 2025, Antheas Kapenekakis wrote:
>
> > Currenlty, the keyboard brightness control of Asus WMI keyboards is
>
> There's a typo here but preferrably avoid "currently" altogether where
> possible.
>
> > handled in the kernel, which leads to the shortcut going from
> > brightness 0, to 1, to 2, and 3.
> >
> > However, for HID keyboards it is exposed as a key and handled by the
> > user's desktop environment. For the toggle button, this means that
> > brightness control becomes on/off. In addition, in the absence of a
> > DE, the keyboard brightness does not work.
> >
> > Therefore, expose an event handler for the keyboard brightness control
> > which can then be used by hid-asus.
> >
> > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > Tested-by: Luke D. Jones <luke@ljones.dev>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/platform/x86/asus-wmi.c            | 41 +++++++++++++++++++++-
> >  include/linux/platform_data/x86/asus-wmi.h | 13 +++++++
> >  2 files changed, 53 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asu=
s-wmi.c
> > index a2a7cd61fd59..58407a3b6d41 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -1579,6 +1579,45 @@ void asus_hid_unregister_listener(struct asus_hi=
d_listener *bdev)
> >  }
> >  EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
> >
> > +static void do_kbd_led_set(struct led_classdev *led_cdev, int value);
> > +
> > +int asus_hid_event(enum asus_hid_event event)
> > +{
> > +     unsigned long flags;
> > +     int brightness;
> > +
> > +     spin_lock_irqsave(&asus_ref.lock, flags);
> > +     if (!asus_ref.asus || !asus_ref.asus->kbd_led_registered) {
>
> Please add a local variable for asus_ref.asus. Check other
> patches/functions too if its use is repeated in some function many times,
> the local var seems to be in order.
>
> > +             spin_unlock_irqrestore(&asus_ref.lock, flags);
>
> Use guard() instead.
>
> > +             return -EBUSY;
> > +     }
> > +     brightness =3D asus_ref.asus->kbd_led_wk;
> > +
> > +     switch (event) {
> > +     case ASUS_EV_BRTUP:
> > +             brightness +=3D 1;
> > +             break;
> > +     case ASUS_EV_BRTDOWN:
> > +             brightness -=3D 1;
> > +             break;
> > +     case ASUS_EV_BRTTOGGLE:
> > +             if (brightness >=3D ASUS_EV_MAX_BRIGHTNESS)
> > +                     brightness =3D 0;
> > +             else
> > +                     brightness +=3D 1;
> > +             break;
> > +     }
> > +
> > +     do_kbd_led_set(&asus_ref.asus->kbd_led, brightness);
> > +     led_classdev_notify_brightness_hw_changed(&asus_ref.asus->kbd_led=
,
> > +                                               asus_ref.asus->kbd_led_=
wk);
> > +
> > +     spin_unlock_irqrestore(&asus_ref.lock, flags);
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(asus_hid_event);
> > +
> >  /*
> >   * These functions actually update the LED's, and are called from a
> >   * workqueue. By doing this as separate work rather than when the LED
> > @@ -1878,7 +1917,7 @@ static int asus_wmi_led_init(struct asus_wmi *asu=
s)
> >       asus->kbd_led.flags =3D LED_BRIGHT_HW_CHANGED;
> >       asus->kbd_led.brightness_set =3D kbd_led_set;
> >       asus->kbd_led.brightness_get =3D kbd_led_get;
> > -     asus->kbd_led.max_brightness =3D 3;
> > +     asus->kbd_led.max_brightness =3D ASUS_EV_MAX_BRIGHTNESS;
> >       asus->kbd_led_avail =3D !kbd_led_read(asus, &led_val, NULL);
> >
> >       if (asus->kbd_led_avail)
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux=
/platform_data/x86/asus-wmi.h
> > index 1f85d76387a8..e78e0fbccede 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -168,6 +168,14 @@ struct asus_hid_listener {
> >       void (*brightness_set)(struct asus_hid_listener *listener, int br=
ightness);
> >  };
> >
> > +enum asus_hid_event {
> > +     ASUS_EV_BRTUP,
> > +     ASUS_EV_BRTDOWN,
> > +     ASUS_EV_BRTTOGGLE,
>
> Where does "BRT" come from. To me it doesn't associate with brightness
> (might be due to me being non-native). If there's a good reason why it's
> that way, fine but otherwise I suggest changing it so that it becomes
> easier to understand.
>
> It's not a big problem as is because the context in the code above allows
> decrypting the meaning but without the other names, I'd have been totally
> lost what it means.

Comes from e9809c0b9670 ("asus-wmi: add keyboard backlight support")

I matched it to the driver, other alternative is KBDILLUM. I will keep
it as BRT for now to match the current driver.

> > +};
> > +
> > +#define ASUS_EV_MAX_BRIGHTNESS 3
> > +
> >  #if IS_REACHABLE(CONFIG_ASUS_WMI)
> >  void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
> >  void set_ally_mcu_powersave(bool enabled);
> > @@ -176,6 +184,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg=
0, u32 arg1, u32 *retval);
> >
> >  int asus_hid_register_listener(struct asus_hid_listener *cdev);
> >  void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
> > +int asus_hid_event(enum asus_hid_event event);
> >  #else
> >  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
> >  {
> > @@ -200,6 +209,10 @@ static inline int asus_hid_register_listener(struc=
t asus_hid_listener *bdev)
> >  static inline void asus_hid_unregister_listener(struct asus_hid_listen=
er *bdev)
> >  {
> >  }
> > +static inline int asus_hid_event(enum asus_hid_event event)
> > +{
> > +     return -ENODEV;
> > +}
> >  #endif
> >
> >  #endif       /* __PLATFORM_DATA_X86_ASUS_WMI_H */
> >
>
> --
>  i.
>
>


