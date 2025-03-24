Return-Path: <linux-input+bounces-11138-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DF5A6DA1B
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 13:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D06016B765
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 12:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D4725DAF4;
	Mon, 24 Mar 2025 12:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="JzE7TxB3"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592EA25D527;
	Mon, 24 Mar 2025 12:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742819398; cv=none; b=sWohngxhS66Igqn4AyIZMZ8ZqG1ujFsWbrSbFqIkwrGKrycCzI5Lw/oQf0vfdluebIJMl469jGWfYPQyhsc0kPPb7EP0VT7zPOUDePDevJ/kA8KJpIWj5cj7cVHkG+B6uFoOFSa3CkdT6rn6F0DnXlO5fTdbVPrzDihwmaznro8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742819398; c=relaxed/simple;
	bh=geKehVl6vSb784iSfcc4pGkKqSsdOrxhCBgiI6eqaEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbqWGrfXz+j4BqZ+lr2/+zC7N3R/Dx1dSiGjRHjfn+AWWuUk3YnbrXy+R76WAVBJNhZ7eY2T7LISv9PqqL/eQ5sajpHh91SNcELseyuMoQJQv6eFecMtt9r7WcJAkJweAgm8MFSrLU0bRKsH5kYiDZ2TiLjmwN6Zyq+sSValfVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=JzE7TxB3; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 411F92E093D3;
	Mon, 24 Mar 2025 14:29:53 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742819393;
	bh=VcTqgmM5GukZLTlAISQu9q5RFDtHqSje8kw34HKmVPk=;
	h=Received:From:Subject:To;
	b=JzE7TxB369Eo3gXTFIetr+c+pd8iHc2QnE478DTmmqNjAzursbnSBcs8awi1TzVxj
	 1qTuR1rOf2tjdI2szHj3HmLfPFGwQ2kkFMJOTW136cRweXWKASh1IYC8ta2cL+5szy
	 wRX7bYcoJ2ChZ+7g7tVcP8Ps/MTa4zWZ4AI8uxgs=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.182) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f182.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30762598511so48508671fa.0;
        Mon, 24 Mar 2025 05:29:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUv3Nie01UkvB6xpSMblgdfPTcyw2fQL0Y34649B+KyX2PxvSLLTgHENiTcc/Qaqnm4xGKn4ED4ln3rzQ==@vger.kernel.org,
 AJvYcCWTZLCefWoVRHw37JepR8N4yL9qnxpk0NEqLZvWLE7xZNBBXkcUU8xpRAcSMSiz/6LVENs2b04nndasjc/b@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi2GmGQHwSmdiKOS2gqYPi6K5ZdGW+kLFaMr1ck84zsklrDraR
	UyhcWdYfoS+LhJZjZV8039d5uOzBLlOv8hsjnSnkrWaR7Ln2yLvbubPtzrm9czb84f+tzRC70iL
	0odpDHnWAvicnAxHDbr/2fgke1So=
X-Google-Smtp-Source: 
 AGHT+IFOeVhtPjoxlebYhUVge7grweFFzReHBnEMukFQb4tNtWnb56CToPe9IBg2lR4X587ktRK+iEQS9QuWIRCx1sY=
X-Received: by 2002:a2e:87cc:0:b0:30b:f420:97d9 with SMTP id
 38308e7fff4ca-30d7e31b5eemr40224631fa.33.1742819392426; Mon, 24 Mar 2025
 05:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-5-lkml@antheas.dev>
 <8666efcb-37b5-4201-ac47-0afde8881068@redhat.com>
In-Reply-To: <8666efcb-37b5-4201-ac47-0afde8881068@redhat.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 24 Mar 2025 13:29:41 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEG5S_5nE5Fitv7W161JEOjCAqaqrZq9cFVkbac8crqMA@mail.gmail.com>
X-Gm-Features: AQ5f1JrhksAwiyptGN6FrBkMUFDimbOibkvm89uS2uJK6tF1Xdhk3yZBFxTkM10
Message-ID: 
 <CAGwozwEG5S_5nE5Fitv7W161JEOjCAqaqrZq9cFVkbac8crqMA@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] platform/x86: asus-wmi: Add support for multiple
 kbd RGB handlers
To: Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174281939372.25321.8247333443290876099@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 24 Mar 2025 at 12:31, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Antheas,
>
> Note not a full review, just taking a generic look at the new API
> between asus-wmi and asus-hid.
>
> On 22-Mar-25 11:27, Antheas Kapenekakis wrote:
> > Some devices, such as the Z13 have multiple AURA devices connected
> > to them by USB. In addition, they might have a WMI interface for
> > RGB. In Windows, Armoury Crate exposes a unified brightness slider
> > for all of them, with 3 brightness levels.
> >
> > Therefore, to be synergistic in Linux, and support existing tooling
> > such as UPower, allow adding listeners to the RGB device of the WMI
> > interface. If WMI does not exist, lazy initialize the interface.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/platform/x86/asus-wmi.c            | 113 ++++++++++++++++++---
> >  include/linux/platform_data/x86/asus-wmi.h |  16 +++
> >  2 files changed, 117 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > index 38ef778e8c19b..95ef9b1d321bb 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -254,6 +254,8 @@ struct asus_wmi {
> >       int tpd_led_wk;
> >       struct led_classdev kbd_led;
> >       int kbd_led_wk;
> > +     bool kbd_led_avail;
> > +     bool kbd_led_registered;
> >       struct led_classdev lightbar_led;
> >       int lightbar_led_wk;
> >       struct led_classdev micmute_led;
> > @@ -1487,6 +1489,53 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
> >
> >  /* LEDs ***********************************************************************/
> >
> > +struct asus_hid_ref {
> > +     struct list_head listeners;
> > +     struct asus_wmi *asus;
> > +     spinlock_t lock;
> > +};
> > +
> > +struct asus_hid_ref asus_ref = {
> > +     .listeners = LIST_HEAD_INIT(asus_ref.listeners),
> > +     .asus = NULL,
> > +     .lock = __SPIN_LOCK_UNLOCKED(asus_ref.lock),
> > +};
> > +
> > +int asus_hid_register_listener(struct asus_hid_listener *bdev)
> > +{
> > +     unsigned long flags;
> > +     int ret = 0;
> > +
> > +     spin_lock_irqsave(&asus_ref.lock, flags);
> > +     list_add_tail(&bdev->list, &asus_ref.listeners);
> > +     if (asus_ref.asus) {
> > +             if (asus_ref.asus->kbd_led_registered && asus_ref.asus->kbd_led_wk >= 0)
> > +                     bdev->brightness_set(bdev, asus_ref.asus->kbd_led_wk);
> > +
> > +             if (!asus_ref.asus->kbd_led_registered) {
> > +                     ret = led_classdev_register(
> > +                             &asus_ref.asus->platform_device->dev,
> > +                             &asus_ref.asus->kbd_led);
> > +                     if (!ret)
> > +                             asus_ref.asus->kbd_led_registered = true;
> > +             }
> > +     }
> > +     spin_unlock_irqrestore(&asus_ref.lock, flags);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(asus_hid_register_listener);
> > +
> > +void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
> > +{
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&asus_ref.lock, flags);
> > +     list_del(&bdev->list);
> > +     spin_unlock_irqrestore(&asus_ref.lock, flags);
> > +}
> > +EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
> > +
> >  /*
> >   * These functions actually update the LED's, and are called from a
> >   * workqueue. By doing this as separate work rather than when the LED
> > @@ -1566,6 +1615,7 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
> >
> >  static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
> >  {
> > +     struct asus_hid_listener *listener;
> >       struct asus_wmi *asus;
> >       int max_level;
> >
> > @@ -1573,25 +1623,39 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
> >       max_level = asus->kbd_led.max_brightness;
> >
> >       asus->kbd_led_wk = clamp_val(value, 0, max_level);
> > -     kbd_led_update(asus);
> > +
> > +     if (asus->kbd_led_avail)
> > +             kbd_led_update(asus);
> > +
> > +     list_for_each_entry(listener, &asus_ref.listeners, list)
> > +             listener->brightness_set(listener, asus->kbd_led_wk);
> >  }
> >
> >  static void kbd_led_set(struct led_classdev *led_cdev,
> >                       enum led_brightness value)
> >  {
> > +     unsigned long flags;
> > +
> >       /* Prevent disabling keyboard backlight on module unregister */
> >       if (led_cdev->flags & LED_UNREGISTERING)
> >               return;
> >
> > +     spin_lock_irqsave(&asus_ref.lock, flags);
> >       do_kbd_led_set(led_cdev, value);
> > +     spin_unlock_irqrestore(&asus_ref.lock, flags);
> >  }
> >
> >  static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
> >  {
> > -     struct led_classdev *led_cdev = &asus->kbd_led;
> > +     struct led_classdev *led_cdev;
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&asus_ref.lock, flags);
> > +     led_cdev = &asus->kbd_led;
> >
> >       do_kbd_led_set(led_cdev, value);
> >       led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led_wk);
> > +     spin_unlock_irqrestore(&asus_ref.lock, flags);
> >  }
> >
> >  static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
> > @@ -1601,6 +1665,9 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
> >
> >       asus = container_of(led_cdev, struct asus_wmi, kbd_led);
> >
> > +     if (!asus->kbd_led_avail)
> > +             return asus->kbd_led_wk;
> > +
> >       retval = kbd_led_read(asus, &value, NULL);
> >       if (retval < 0)
> >               return retval;
> > @@ -1716,7 +1783,14 @@ static int camera_led_set(struct led_classdev *led_cdev,
> >
> >  static void asus_wmi_led_exit(struct asus_wmi *asus)
> >  {
> > -     led_classdev_unregister(&asus->kbd_led);
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&asus_ref.lock, flags);
> > +     asus_ref.asus = NULL;
> > +     if (asus->kbd_led_registered)
> > +             led_classdev_unregister(&asus->kbd_led);
> > +     spin_unlock_irqrestore(&asus_ref.lock, flags);
> > +
> >       led_classdev_unregister(&asus->tpd_led);
> >       led_classdev_unregister(&asus->wlan_led);
> >       led_classdev_unregister(&asus->lightbar_led);
> > @@ -1730,6 +1804,8 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
> >  static int asus_wmi_led_init(struct asus_wmi *asus)
> >  {
> >       int rv = 0, num_rgb_groups = 0, led_val;
> > +     unsigned long flags;
> > +     bool has_listeners;
> >
> >       if (asus->kbd_rgb_dev)
> >               kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
> > @@ -1754,24 +1830,37 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
> >                       goto error;
> >       }
> >
> > -     if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
> > -             pr_info("using asus-wmi for asus::kbd_backlight\n");
> > +     asus->kbd_led.name = "asus::kbd_backlight";
> > +     asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> > +     asus->kbd_led.brightness_set = kbd_led_set;
> > +     asus->kbd_led.brightness_get = kbd_led_get;
> > +     asus->kbd_led.max_brightness = 3;
> > +     asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
> > +
> > +     if (asus->kbd_led_avail)
> >               asus->kbd_led_wk = led_val;
> > -             asus->kbd_led.name = "asus::kbd_backlight";
> > -             asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> > -             asus->kbd_led.brightness_set = kbd_led_set;
> > -             asus->kbd_led.brightness_get = kbd_led_get;
> > -             asus->kbd_led.max_brightness = 3;
> > +     else
> > +             asus->kbd_led_wk = -1;
> > +
> > +     if (asus->kbd_led_avail && num_rgb_groups != 0)
> > +             asus->kbd_led.groups = kbd_rgb_mode_groups;
> >
> > -             if (num_rgb_groups != 0)
> > -                     asus->kbd_led.groups = kbd_rgb_mode_groups;
> > +     spin_lock_irqsave(&asus_ref.lock, flags);
> > +     has_listeners = !list_empty(&asus_ref.listeners);
> > +     spin_unlock_irqrestore(&asus_ref.lock, flags);
>
> It seems to me that you should also call brightness_set()
> on all the kbds already in the list so that their brightness
> gets synced with the wmi kbd-backlight brightness when
> the wmi driver loads later then the hid driver ?

You raise a good point here. Let me think about it.

But yes, if we do a notify when kbd_led_wk != -1 if the hid device
connects after, we should do it for the before case too.

> >
> > +     if (asus->kbd_led_avail || has_listeners) {
> >               rv = led_classdev_register(&asus->platform_device->dev,
> >                                          &asus->kbd_led);
> >               if (rv)
> >                       goto error;
> > +             asus->kbd_led_registered = true;
> >       }
> >
> > +     spin_lock_irqsave(&asus_ref.lock, flags);
> > +     asus_ref.asus = asus;
>
> There is race here where a hid keyboard might show up between
> the 2 places you take the lock, in that case if there is
> no wmi kbd-backlight then you will not register the led_classdev
> when asus_hid_register_listener() gets called between the unlock
> and the lock...  I'm not sure what the best way is to fix this.

Thanks for catching that, probably a recheck:

has_listeners = !list_empty(&asus_ref.listeners);
if (has_listeners) goto register;

> Regards,
>
> Hans
>
>
>
> > +     spin_unlock_irqrestore(&asus_ref.lock, flags);
> > +
> >       if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
> >                       && (asus->driver->quirks->wapf > 0)) {
> >               INIT_WORK(&asus->wlan_led_work, wlan_led_update);
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > index 783e2a336861b..ec8b0c585a63f 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -157,14 +157,30 @@
> >  #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK        0x0000FF00
> >  #define ASUS_WMI_DSTS_LIGHTBAR_MASK  0x0000000F
> >
> > +struct asus_hid_listener {
> > +     struct list_head list;
> > +     void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
> > +};
> > +
> >  #if IS_REACHABLE(CONFIG_ASUS_WMI)
> >  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
> > +
> > +int asus_hid_register_listener(struct asus_hid_listener *cdev);
> > +void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
> >  #else
> >  static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
> >                                          u32 *retval)
> >  {
> >       return -ENODEV;
> >  }
> > +
> > +static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
> > +{
> > +     return -ENODEV;
> > +}
> > +static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
> > +{
> > +}
> >  #endif
> >
> >  /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
>

