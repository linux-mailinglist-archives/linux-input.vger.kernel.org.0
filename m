Return-Path: <linux-input+bounces-16413-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6810BC967CA
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 10:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5080D4E080A
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 09:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34013019DA;
	Mon,  1 Dec 2025 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZuOuYCG"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718EB1A3179;
	Mon,  1 Dec 2025 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582738; cv=none; b=jb2soukN4Qb3PfmYq0Bv/GzcNaDUrToZRo68BMhFm26VlYfWAW0L7hfY+wIgBIpGZEYeFsXdZC7M0Bvjwei88qiqPU3NvNs0ja18rIBgIs3OT0lAYkAs2DVJY5onafK354r1ywljuZ6JJgWk6QRxdNUQICNwKTZCzWRb78T4QZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582738; c=relaxed/simple;
	bh=J0tO+6pxLmq9aKmH2mPHXPRgI7vRIqiuEHI0MZYAKyU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=J+1T8p/VJLNXG9iOD+7AU+ayfMcLLEHoDVNqcu0vaSDLXLQWIJLVUeIve0OoFQFhztx8JdVkN2DUpsRFSvPAsxHS3Yr+hOCdha8I+TZ5FDjgQ1dY4UQTwT12WS/dNfTYngo1dlVN4GoblR63S67eQvMKmuwcSvSidDOSQtrYaQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZuOuYCG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764582736; x=1796118736;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=J0tO+6pxLmq9aKmH2mPHXPRgI7vRIqiuEHI0MZYAKyU=;
  b=ZZuOuYCGlvB0aBSpnRrT4zzz3N+KSn/bZKTlMZkyo4YCzCpphDGoG3Z+
   vMgk/0PSqukW2jPgXRHSzpJYRL3zibFEcLzm6fHLPVMkwd9t21GWST0LF
   LpuWifVAQBqpG+0SHf/p7kaxTTNSsMjhA2+ZsxNBGKKwYOdpPtADwELo6
   DPXcFbu5mhYa4gr0ihUeuXpSGylaWk6L6ttYLfX0RFwDfT/xMQM8l2jpL
   gOHVSZpDwmX8ViiVWIu2dPWWaZt1lBknW1tlGyejHABDCy5FvB8k3Eqxa
   d3jf7mjDOX4nRurwBa29qnqVLb1G7cRYQYYT2lLyRtKyTvgoJvs8+g9qb
   w==;
X-CSE-ConnectionGUID: Yujm8dStRtG9jIhrl6VoAg==
X-CSE-MsgGUID: Evq9duttTnCfD2GAJiibpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77618652"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="77618652"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 01:52:16 -0800
X-CSE-ConnectionGUID: nkjbv6vORfm8gzQ94vraMg==
X-CSE-MsgGUID: z6NQ3exFTI6xJb0CutQdfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193290345"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.202])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 01:52:12 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 1 Dec 2025 11:52:08 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: Denis Benato <benato.denis96@gmail.com>, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v10 10/11] platform/x86: asus-wmi: add keyboard brightness
 event handler
In-Reply-To: <CAGwozwGOgE2JPaR34V8ETEq66bMd1rjGNokdnbLDE1Ch7PR5ig@mail.gmail.com>
Message-ID: <4c24cacf-a1e0-186d-5e44-c6772e32ffc2@linux.intel.com>
References: <20251122110032.4274-1-lkml@antheas.dev> <20251122110032.4274-11-lkml@antheas.dev> <713cc4fd-e6a1-4db4-907a-a0575a2b7b8f@gmail.com> <CAGwozwHwi7mopXY=DM2jt82jgdetdhNR-CUicX7R9KbYj4g0Xw@mail.gmail.com>
 <CAGwozwGOgE2JPaR34V8ETEq66bMd1rjGNokdnbLDE1Ch7PR5ig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Dec 2025, Antheas Kapenekakis wrote:
> On Wed, 26 Nov 2025 at 21:39, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> > On Wed, 26 Nov 2025 at 21:23, Denis Benato <benato.denis96@gmail.com> wrote:
> > > On 11/22/25 12:00, Antheas Kapenekakis wrote:
> > > > The keyboard brightness control of Asus WMI keyboards is handled in
> > > > kernel, which leads to the shortcut going from brightness 0, to 1,
> > > > to 2, and 3.
> > > >
> > > > However, for HID keyboards it is exposed as a key and handled by the
> > > > user's desktop environment. For the toggle button, this means that
> > > > brightness control becomes on/off. In addition, in the absence of a
> > > > DE, the keyboard brightness does not work.
> > > >
> > > > Therefore, expose an event handler for the keyboard brightness control
> > > > which can then be used by hid-asus. Since this handler is called from
> > > > an interrupt context, defer the actual work to a workqueue.
> > > >
> > > > In the process, introduce ASUS_EV_MAX_BRIGHTNESS to hold the constant
> > > > for maximum brightness since it is shared between hid-asus/asus-wmi.
> > > >
> > > > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > > > Tested-by: Luke D. Jones <luke@ljones.dev>
> > > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > > ---
> > > >  drivers/platform/x86/asus-wmi.c            | 46 +++++++++++++++++++---
> > > >  include/linux/platform_data/x86/asus-wmi.h | 13 ++++++
> > > >  2 files changed, 54 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > > > index 84cde34ab6a8..a69464e45ca4 100644
> > > > --- a/drivers/platform/x86/asus-wmi.c
> > > > +++ b/drivers/platform/x86/asus-wmi.c
> > > > @@ -1719,6 +1719,44 @@ static void kbd_led_update_all(struct work_struct *work)
> > > >       }
> > > >  }
> > > >
> > > > +/*
> > > > + * This function is called from hid-asus to inform asus-wmi of brightness
> > > > + * changes initiated by the keyboard backlight keys.
> > > > + */
> > > > +int asus_hid_event(enum asus_hid_event event)
> > > > +{
> > > > +     struct asus_wmi *asus;
> > > > +     int brightness;
> > > > +
> > > > +     guard(spinlock_irqsave)(&asus_ref.lock);
> > > > +     asus = asus_ref.asus;
> > > > +     if (!asus || !asus->kbd_led_registered)
> > > > +             return -EBUSY;
> > > > +
> > > > +     brightness = asus->kbd_led_wk;
> > > > +
> > > > +     switch (event) {
> > > > +     case ASUS_EV_BRTUP:
> > > > +             brightness += 1;
> > > > +             break;
> > > > +     case ASUS_EV_BRTDOWN:
> > > > +             brightness -= 1;
> > > > +             break;
> > > > +     case ASUS_EV_BRTTOGGLE:
> > > > +             if (brightness >= ASUS_EV_MAX_BRIGHTNESS)
> > > > +                     brightness = 0;
> > > > +             else
> > > > +                     brightness += 1;
> > > > +             break;
> > > > +     }
> > > > +
> > > > +     asus->kbd_led_wk = clamp_val(brightness, 0, ASUS_EV_MAX_BRIGHTNESS);
> > > > +     asus->kbd_led_notify = true;
> > > > +     queue_work(asus->led_workqueue, &asus->kbd_led_work);
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(asus_hid_event);
> > > > +
> > > >  /*
> > > >   * These functions actually update the LED's, and are called from a
> > > LEDs as opposed to LED's?
> >
> > I agree with you, but the author of that line probably wouldn't -
> > depends on author dialect and both are usually correct.
> >
> > When making acronyms plural, adding a ' is usually accepted as
> > correct. But this is not added as part of this series, so you can do a
> > reword commit if you wish
> >
> > Antheas
> 
> Hm, perhaps this was not clear but the part you commented on was not
> part of the patch/this series. Do you want to finish reviewing this
> patch and add a rev-by?
> 
> @Ilpo: with 6.18 releasing yesterday, what is the status on this? is
> it for 6.20? Hans commented on patch 5

It will have to wait to the 6.20 cycle as it's cross-subsystem series so 
there are other maintainers involved than just me.

-- 
 i.

> Thanks,
> Antheas
> 
> > > >   * workqueue. By doing this as separate work rather than when the LED
> > > > @@ -1801,13 +1839,11 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
> > > >  {
> > > >       struct asus_hid_listener *listener;
> > > >       struct asus_wmi *asus;
> > > > -     int max_level;
> > > >
> > > >       asus = container_of(led_cdev, struct asus_wmi, kbd_led);
> > > > -     max_level = asus->kbd_led.max_brightness;
> > > >
> > > >       scoped_guard(spinlock_irqsave, &asus_ref.lock)
> > > > -             asus->kbd_led_wk = clamp_val(value, 0, max_level);
> > > > +             asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
> > > >
> > > >       if (asus->kbd_led_avail)
> > > >               kbd_led_update(asus);
> > > > @@ -2011,7 +2047,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
> > > >       asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> > > >       asus->kbd_led.brightness_set = kbd_led_set;
> > > >       asus->kbd_led.brightness_get = kbd_led_get;
> > > > -     asus->kbd_led.max_brightness = 3;
> > > > +     asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
> > > >       asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
> > > >       INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
> > > >
> > > > @@ -4530,7 +4566,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
> > > >               return;
> > > >       }
> > > >       if (code == NOTIFY_KBD_BRTTOGGLE) {
> > > > -             if (led_value == asus->kbd_led.max_brightness)
> > > > +             if (led_value == ASUS_EV_MAX_BRIGHTNESS)
> > > >                       kbd_led_set_by_kbd(asus, 0);
> > > >               else
> > > >                       kbd_led_set_by_kbd(asus, led_value + 1);
> > > > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > > > index d347cffd05d5..7b872b5d0960 100644
> > > > --- a/include/linux/platform_data/x86/asus-wmi.h
> > > > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > > > @@ -178,6 +178,14 @@ struct asus_hid_listener {
> > > >       void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
> > > >  };
> > > >
> > > > +enum asus_hid_event {
> > > > +     ASUS_EV_BRTUP,
> > > > +     ASUS_EV_BRTDOWN,
> > > > +     ASUS_EV_BRTTOGGLE,
> > > > +};
> > > > +
> > > > +#define ASUS_EV_MAX_BRIGHTNESS 3
> > > > +
> > > >  #if IS_REACHABLE(CONFIG_ASUS_WMI)
> > > >  void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
> > > >  void set_ally_mcu_powersave(bool enabled);
> > > > @@ -186,6 +194,7 @@ int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
> > > >  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
> > > >  int asus_hid_register_listener(struct asus_hid_listener *cdev);
> > > >  void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
> > > > +int asus_hid_event(enum asus_hid_event event);
> > > >  #else
> > > >  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
> > > >  {
> > > > @@ -213,6 +222,10 @@ static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
> > > >  static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
> > > >  {
> > > >  }
> > > > +static inline int asus_hid_event(enum asus_hid_event event)
> > > > +{
> > > > +     return -ENODEV;
> > > > +}
> > > >  #endif
> > > >
> > > >  #endif       /* __PLATFORM_DATA_X86_ASUS_WMI_H */
> > >
> 

