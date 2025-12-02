Return-Path: <linux-input+bounces-16445-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0E8C9B4F9
	for <lists+linux-input@lfdr.de>; Tue, 02 Dec 2025 12:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0D35334757B
	for <lists+linux-input@lfdr.de>; Tue,  2 Dec 2025 11:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6C230F93B;
	Tue,  2 Dec 2025 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpWb5MRs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C1528A3FA;
	Tue,  2 Dec 2025 11:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764674827; cv=none; b=RL+bP6TeY7uBJGHmFMisUQwD9UMR/fWYTrI2UCVIDbT/z/u5JdcHszKBHXGc8l493Ybr63Jxu6t1UMb7m7agXca+qs7ULDix3DpXsP1JFkDO/cHpHBzxrFibDJiWotXi1d8A4rnza4CKs7soIj/ntH8wtJenbQbghgTwepFY1aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764674827; c=relaxed/simple;
	bh=Bhd5zvXLA+YIEJ5mJ9YeaZRY6L549H8KH1TgomgKAyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBX9cGcnPXolIfGLJ/wpzubgQmaDKaw90fJ7ztzb2r9WFHy4akZ9ZSqUmQM9BdvXMDEcbCW5z0HN1SG316gMgDgJtdJmP5TNtCEyOgHqLF4LCQ7Tp/L3DLIi58jdOB39NGykUyo31q73CIwL1yPzR1N9q/QPZUXPQuBEzFErt+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpWb5MRs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D970C4CEF1;
	Tue,  2 Dec 2025 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764674824;
	bh=Bhd5zvXLA+YIEJ5mJ9YeaZRY6L549H8KH1TgomgKAyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpWb5MRsW9tFazvmeyOELmB8XTTdoDjbMFQOxddgCH/XsKWDUQn+UnhzRD3rJM8H9
	 uPA3czIQRaFwtymbjTxa2lSNI4jqg215Bc/mKA/o8u3vtRrUQ7ibtngRd5JropduBg
	 t4lIz427u9+YnBc9769IrO64ojatFEQaeXiAZVRNzifHYRtVgfpsQnAdnXtum0dBjP
	 +eze5iacNHRu56P9Un9rOfFRUbRncD1bIBNmd2yp/FSuXutObEe4dMQKShUJWTK5v2
	 AGa/TkXh9VMa5ZQmqkxfrPBN10UY2ICiJZZrefVXVptB8zN7Mkee9jo3844nqt7dHE
	 ZPzuBc5KOySEQ==
Date: Tue, 2 Dec 2025 12:26:59 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Denis Benato <benato.denis96@gmail.com>, platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>, 
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v10 10/11] platform/x86: asus-wmi: add keyboard
 brightness event handler
Message-ID: <5dmvgp4srucat7mfc5dalklsmujuldlbfe3jawi4uharmku4ab@yb44yaf5v4x4>
References: <20251122110032.4274-1-lkml@antheas.dev>
 <20251122110032.4274-11-lkml@antheas.dev>
 <713cc4fd-e6a1-4db4-907a-a0575a2b7b8f@gmail.com>
 <CAGwozwHwi7mopXY=DM2jt82jgdetdhNR-CUicX7R9KbYj4g0Xw@mail.gmail.com>
 <CAGwozwGOgE2JPaR34V8ETEq66bMd1rjGNokdnbLDE1Ch7PR5ig@mail.gmail.com>
 <4c24cacf-a1e0-186d-5e44-c6772e32ffc2@linux.intel.com>
 <CAGwozwGquTikG3-7oJxQWDt6a836FU-Lk+M3JtM6efaTCc0Vng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGwozwGquTikG3-7oJxQWDt6a836FU-Lk+M3JtM6efaTCc0Vng@mail.gmail.com>

On Dec 01 2025, Antheas Kapenekakis wrote:
> On Mon, 1 Dec 2025 at 10:52, Ilpo Järvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Mon, 1 Dec 2025, Antheas Kapenekakis wrote:
> > > On Wed, 26 Nov 2025 at 21:39, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> > > > On Wed, 26 Nov 2025 at 21:23, Denis Benato <benato.denis96@gmail.com> wrote:
> > > > > On 11/22/25 12:00, Antheas Kapenekakis wrote:
> > > > > > The keyboard brightness control of Asus WMI keyboards is handled in
> > > > > > kernel, which leads to the shortcut going from brightness 0, to 1,
> > > > > > to 2, and 3.
> > > > > >
> > > > > > However, for HID keyboards it is exposed as a key and handled by the
> > > > > > user's desktop environment. For the toggle button, this means that
> > > > > > brightness control becomes on/off. In addition, in the absence of a
> > > > > > DE, the keyboard brightness does not work.
> > > > > >
> > > > > > Therefore, expose an event handler for the keyboard brightness control
> > > > > > which can then be used by hid-asus. Since this handler is called from
> > > > > > an interrupt context, defer the actual work to a workqueue.
> > > > > >
> > > > > > In the process, introduce ASUS_EV_MAX_BRIGHTNESS to hold the constant
> > > > > > for maximum brightness since it is shared between hid-asus/asus-wmi.
> > > > > >
> > > > > > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > > > > > Tested-by: Luke D. Jones <luke@ljones.dev>
> > > > > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > > > > ---
> > > > > >  drivers/platform/x86/asus-wmi.c            | 46 +++++++++++++++++++---
> > > > > >  include/linux/platform_data/x86/asus-wmi.h | 13 ++++++
> > > > > >  2 files changed, 54 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > > > > > index 84cde34ab6a8..a69464e45ca4 100644
> > > > > > --- a/drivers/platform/x86/asus-wmi.c
> > > > > > +++ b/drivers/platform/x86/asus-wmi.c
> > > > > > @@ -1719,6 +1719,44 @@ static void kbd_led_update_all(struct work_struct *work)
> > > > > >       }
> > > > > >  }
> > > > > >
> > > > > > +/*
> > > > > > + * This function is called from hid-asus to inform asus-wmi of brightness
> > > > > > + * changes initiated by the keyboard backlight keys.
> > > > > > + */
> > > > > > +int asus_hid_event(enum asus_hid_event event)
> > > > > > +{
> > > > > > +     struct asus_wmi *asus;
> > > > > > +     int brightness;
> > > > > > +
> > > > > > +     guard(spinlock_irqsave)(&asus_ref.lock);
> > > > > > +     asus = asus_ref.asus;
> > > > > > +     if (!asus || !asus->kbd_led_registered)
> > > > > > +             return -EBUSY;
> > > > > > +
> > > > > > +     brightness = asus->kbd_led_wk;
> > > > > > +
> > > > > > +     switch (event) {
> > > > > > +     case ASUS_EV_BRTUP:
> > > > > > +             brightness += 1;
> > > > > > +             break;
> > > > > > +     case ASUS_EV_BRTDOWN:
> > > > > > +             brightness -= 1;
> > > > > > +             break;
> > > > > > +     case ASUS_EV_BRTTOGGLE:
> > > > > > +             if (brightness >= ASUS_EV_MAX_BRIGHTNESS)
> > > > > > +                     brightness = 0;
> > > > > > +             else
> > > > > > +                     brightness += 1;
> > > > > > +             break;
> > > > > > +     }
> > > > > > +
> > > > > > +     asus->kbd_led_wk = clamp_val(brightness, 0, ASUS_EV_MAX_BRIGHTNESS);
> > > > > > +     asus->kbd_led_notify = true;
> > > > > > +     queue_work(asus->led_workqueue, &asus->kbd_led_work);
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_GPL(asus_hid_event);
> > > > > > +
> > > > > >  /*
> > > > > >   * These functions actually update the LED's, and are called from a
> > > > > LEDs as opposed to LED's?
> > > >
> > > > I agree with you, but the author of that line probably wouldn't -
> > > > depends on author dialect and both are usually correct.
> > > >
> > > > When making acronyms plural, adding a ' is usually accepted as
> > > > correct. But this is not added as part of this series, so you can do a
> > > > reword commit if you wish
> > > >
> > > > Antheas
> > >
> > > Hm, perhaps this was not clear but the part you commented on was not
> > > part of the patch/this series. Do you want to finish reviewing this
> > > patch and add a rev-by?
> > >
> > > @Ilpo: with 6.18 releasing yesterday, what is the status on this? is
> > > it for 6.20? Hans commented on patch 5
> >
> > It will have to wait to the 6.20 cycle as it's cross-subsystem series so
> > there are other maintainers involved than just me.
> 
> Unfortunate. Jiri is cc'd on this series and we had around 2 weeks
> where the code was frozen. Was it my responsibility to ask for acks so
> it can go through x86?

Sorry for the current situation. We were following the series without
much involvment as there were still changes requested here and there.

Anyway, we (Jiri and I) are fine for this series to be merged entirely
through the drivers-platform-x86 tree. The only HID changes are solely
located into hid-asus.c, so we can punt to you the patches for this
cycle if there is anything happening until this gets merge into Linus
tree and we can go back to normal.

Cheers,
Benjamin

> 
> > --
> >  i.
> >
> > > Thanks,
> > > Antheas
> > >
> > > > > >   * workqueue. By doing this as separate work rather than when the LED
> > > > > > @@ -1801,13 +1839,11 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
> > > > > >  {
> > > > > >       struct asus_hid_listener *listener;
> > > > > >       struct asus_wmi *asus;
> > > > > > -     int max_level;
> > > > > >
> > > > > >       asus = container_of(led_cdev, struct asus_wmi, kbd_led);
> > > > > > -     max_level = asus->kbd_led.max_brightness;
> > > > > >
> > > > > >       scoped_guard(spinlock_irqsave, &asus_ref.lock)
> > > > > > -             asus->kbd_led_wk = clamp_val(value, 0, max_level);
> > > > > > +             asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
> > > > > >
> > > > > >       if (asus->kbd_led_avail)
> > > > > >               kbd_led_update(asus);
> > > > > > @@ -2011,7 +2047,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
> > > > > >       asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> > > > > >       asus->kbd_led.brightness_set = kbd_led_set;
> > > > > >       asus->kbd_led.brightness_get = kbd_led_get;
> > > > > > -     asus->kbd_led.max_brightness = 3;
> > > > > > +     asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
> > > > > >       asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
> > > > > >       INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
> > > > > >
> > > > > > @@ -4530,7 +4566,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
> > > > > >               return;
> > > > > >       }
> > > > > >       if (code == NOTIFY_KBD_BRTTOGGLE) {
> > > > > > -             if (led_value == asus->kbd_led.max_brightness)
> > > > > > +             if (led_value == ASUS_EV_MAX_BRIGHTNESS)
> > > > > >                       kbd_led_set_by_kbd(asus, 0);
> > > > > >               else
> > > > > >                       kbd_led_set_by_kbd(asus, led_value + 1);
> > > > > > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > > > > > index d347cffd05d5..7b872b5d0960 100644
> > > > > > --- a/include/linux/platform_data/x86/asus-wmi.h
> > > > > > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > > > > > @@ -178,6 +178,14 @@ struct asus_hid_listener {
> > > > > >       void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
> > > > > >  };
> > > > > >
> > > > > > +enum asus_hid_event {
> > > > > > +     ASUS_EV_BRTUP,
> > > > > > +     ASUS_EV_BRTDOWN,
> > > > > > +     ASUS_EV_BRTTOGGLE,
> > > > > > +};
> > > > > > +
> > > > > > +#define ASUS_EV_MAX_BRIGHTNESS 3
> > > > > > +
> > > > > >  #if IS_REACHABLE(CONFIG_ASUS_WMI)
> > > > > >  void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
> > > > > >  void set_ally_mcu_powersave(bool enabled);
> > > > > > @@ -186,6 +194,7 @@ int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
> > > > > >  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
> > > > > >  int asus_hid_register_listener(struct asus_hid_listener *cdev);
> > > > > >  void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
> > > > > > +int asus_hid_event(enum asus_hid_event event);
> > > > > >  #else
> > > > > >  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
> > > > > >  {
> > > > > > @@ -213,6 +222,10 @@ static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
> > > > > >  static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
> > > > > >  {
> > > > > >  }
> > > > > > +static inline int asus_hid_event(enum asus_hid_event event)
> > > > > > +{
> > > > > > +     return -ENODEV;
> > > > > > +}
> > > > > >  #endif
> > > > > >
> > > > > >  #endif       /* __PLATFORM_DATA_X86_ASUS_WMI_H */
> > > > >
> > >
> >
> 

