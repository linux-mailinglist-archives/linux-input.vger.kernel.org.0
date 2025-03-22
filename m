Return-Path: <linux-input+bounces-11079-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB24A6C883
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 10:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F65246018D
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 09:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6FF1D63C0;
	Sat, 22 Mar 2025 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="JoGGspQ4"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DBB194080;
	Sat, 22 Mar 2025 09:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742634385; cv=none; b=e+qqDKZ4BaRsbhX/sTj7I2VwC4JOUYF/vDrDgUwMv0+Zk4D50H3NwmIouOt/58D8mclFYJY+wDzltwVdbIAbv0zD67QnpdEbBSLuBqlL1Dc5d5MBywkgGbO5HjuZxfaXOOozgGZhvvtfdLeK6vp09B5R2Jm+KpV8nSe1q1gtFUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742634385; c=relaxed/simple;
	bh=ZADj6djmWacXI5122GUuCc7V11thYCegqW+jNQ237A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlbzZs5flp/45xUOYF0p5cqze6gqsCByA/sAop5z3KGPcV12jmlr1jNZpewDaPfSqCY+0RyVsCUpxgpgTQLKCwuZF+oayWMglxoVgf9NS8l48Xpy/4OpxFtGFv0ie4Ur0VnztDh3vPT0RcxxpwZLsBmiUJuNfwjwkEfqpRsl9Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=JoGGspQ4; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id D8E2D2E08B4C;
	Sat, 22 Mar 2025 11:06:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742634380;
	bh=DYVqvQBKlVkod8fV+HgtzAm4olQ4KbqnOGIxKampGmc=;
	h=Received:From:Subject:To;
	b=JoGGspQ4MdxVZq+iOqIk312ZZaKakSExYm8qZuPqG3XJXOqGoe9z+aFOGrJQHjBcA
	 fZrq2nfLFD8P5w8whHeoOSdsgRNuKAxp12H6aKHuVPP783KOf3emDgWTyjmEoK/uhr
	 42qPvBzMP5H9qoEuhP5klEoyPoLDvz1O5nIr6PDY=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.175) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f175.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30bf251025aso24651911fa.1;
        Sat, 22 Mar 2025 02:06:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV/KSnSb3tlPa4mESqYvoS1KC/Q/21U94qq8dmoY5DtKZfybr4asShrP3F5FMcMuo0L3K+v1hTzmsdUZg==@vger.kernel.org,
 AJvYcCVHLLqplSVE/xhlKaBLvkLWNkzhXx6eJsQ6VaLH3AVuNoUkpXNMI3tT44VuZorhz+MGOUxkbKig9gCiA817@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/nR34q7zjyZDprrKZhn2sHuBrCw5g5vUKvILpPrdU75FdzY0N
	kO/9EnFCY8EdPKO+wwK8aeAYXYRoV2Esq0zKqMOswYEdHm1S2y8wuvpWvWRtQMhVbwrT2c8RcpK
	YR2QoWzMCHXx9ltCd5KNFsnkUEzM=
X-Google-Smtp-Source: 
 AGHT+IH9DqU8aIzLfCo1dumDQgglLCUDetYUtw5MrBBoq+k4U1cI6fnkCjMEZCbspvWM1J3/WdcKxF+MqKrceQ85qGU=
X-Received: by 2002:a2e:9102:0:b0:30b:efa5:69a2 with SMTP id
 38308e7fff4ca-30d7e236973mr20141331fa.19.1742634379085; Sat, 22 Mar 2025
 02:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320220924.5023-1-lkml@antheas.dev>
 <20250320220924.5023-6-lkml@antheas.dev>
 <d06fbb28-6bec-42ed-a161-2456131ca32a@ljones.dev>
 <CAGwozwEdkLjT30v1GPpVeArVd-SCAp2tvwB9ZK9_xrGHe93Cjw@mail.gmail.com>
 <2557385c-6d00-4f2c-a9d4-53f805ec4424@ljones.dev>
In-Reply-To: <2557385c-6d00-4f2c-a9d4-53f805ec4424@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 22 Mar 2025 10:06:07 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGxmxcpT9CH2nyJBrzo54F32G9xGfm23zai7FmqGxAj3A@mail.gmail.com>
X-Gm-Features: AQ5f1JpIDfjAc8M4041SHKVHE_TeYRk7v47Ky6hvqTCh7nRiT6chuu66FVIApvk
Message-ID: 
 <CAGwozwGxmxcpT9CH2nyJBrzo54F32G9xGfm23zai7FmqGxAj3A@mail.gmail.com>
Subject: Re: [PATCH 05/11] platform/x86: asus-wmi: Add support for multiple
 kbd RGB handlers
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174263438034.25509.13756298747702158174@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Sat, 22 Mar 2025 at 09:57, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 22/03/25 21:06, Antheas Kapenekakis wrote:
> > On Sat, 22 Mar 2025 at 04:24, Luke D. Jones <luke@ljones.dev> wrote:
> >>
> >> On 21/03/25 11:09, Antheas Kapenekakis wrote:
> >>> Some devices, such as the Z13 have multiple AURA devices connected
> >>> to them by USB. In addition, they might have a WMI interface for
> >>> RGB. In Windows, Armoury Crate exposes a unified brightness slider
> >>> for all of them, with 3 brightness levels.
> >>>
> >>> Therefore, to be synergistic in Linux, and support existing tooling
> >>> such as UPower, allow adding listeners to the RGB device of the WMI
> >>> interface. If WMI does not exist, lazy initialize the interface.
> >>>
> >>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>> ---
> >>>    drivers/platform/x86/asus-wmi.c            | 100 ++++++++++++++++++---
> >>>    include/linux/platform_data/x86/asus-wmi.h |  16 ++++
> >>>    2 files changed, 104 insertions(+), 12 deletions(-)
> >>>
> >>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> >>> index 38ef778e8c19b..21e034be71b2f 100644
> >>> --- a/drivers/platform/x86/asus-wmi.c
> >>> +++ b/drivers/platform/x86/asus-wmi.c
> >>> @@ -254,6 +254,8 @@ struct asus_wmi {
> >>>        int tpd_led_wk;
> >>>        struct led_classdev kbd_led;
> >>>        int kbd_led_wk;
> >>> +     bool kbd_led_avail;
> >>> +     bool kbd_led_registered;
> >>>        struct led_classdev lightbar_led;
> >>>        int lightbar_led_wk;
> >>>        struct led_classdev micmute_led;
> >>> @@ -1487,6 +1489,46 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
> >>>
> >>>    /* LEDs ***********************************************************************/
> >>>
> >>> +LIST_HEAD(asus_brt_listeners);
> >>> +DEFINE_MUTEX(asus_brt_lock);
> >>> +struct asus_wmi *asus_brt_ref;
> >>
> >> Could these 3 items contained in a new static struct, it would make it
> >> easier to see the associations since they're a group.
> >
> > My V0 tried something like that, but it was messy. I will think about
> > it for V4. Let's do that when we decide the name as it will be hairy
> > to rebase both of those and I want to do it once.
> >
> >>> +int asus_brt_register_listener(struct asus_brt_listener *bdev)
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     mutex_lock(&asus_brt_lock);
> >>> +     list_add_tail(&bdev->list, &asus_brt_listeners);
> >>> +     if (asus_brt_ref) {
> >>
> >> ret is not initialised if this is false
> >
> > I already fixed that for V3.
> >
> >>> +             if (asus_brt_ref->kbd_led_registered && asus_brt_ref->kbd_led_wk >= 0)
> >
> > This nested && is a bug, I will fix that if I havent. We might end up
> > initializing twice.
> >
> >>> +                     bdev->notify(bdev, asus_brt_ref->kbd_led_wk);
> >>> +             else {
> >>> +                     asus_brt_ref->kbd_led_registered = true;
> >>> +                     ret = led_classdev_register(
> >>> +                             &asus_brt_ref->platform_device->dev,
> >>> +                             &asus_brt_ref->kbd_led);
> >>> +             }
> >
> > (2) If asus_wmi launched already before the usb devices but did not
> > support RGB, kbd_led_registered will be false but the struct will be
> > initialized. Therefore, we register the device here, and all works.
> >
> >>> +     }
> >>> +     mutex_unlock(&asus_brt_lock);
> >>> +
> >>> +     return ret;
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(asus_brt_register_listener);
> >>> +
> >>> +void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
> >>> +{
> >>> +     mutex_lock(&asus_brt_lock);
> >>> +     list_del(&bdev->list);
> >>> +
> >>> +     if (asus_brt_ref && asus_brt_ref->kbd_led_registered &&
> >>> +         list_empty(&asus_brt_listeners) && !asus_brt_ref->kbd_led_avail) {
> >>> +             led_classdev_unregister(&asus_brt_ref->kbd_led);
> >>> +             asus_brt_ref->kbd_led_registered = false;
> >>> +     }
> >>> +     mutex_unlock(&asus_brt_lock);
> >>> +}
> >>> +EXPORT_SYMBOL_GPL(asus_brt_unregister_listener);
> >>> +
> >>>    /*
> >>>     * These functions actually update the LED's, and are called from a
> >>>     * workqueue. By doing this as separate work rather than when the LED
> >>> @@ -1566,6 +1608,7 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
> >>>
> >>>    static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
> >>>    {
> >>> +     struct asus_brt_listener *listener;
> >>>        struct asus_wmi *asus;
> >>>        int max_level;
> >>>
> >>> @@ -1573,7 +1616,12 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
> >>>        max_level = asus->kbd_led.max_brightness;
> >>>
> >>>        asus->kbd_led_wk = clamp_val(value, 0, max_level);
> >>> -     kbd_led_update(asus);
> >>> +
> >>> +     if (asus->kbd_led_avail)
> >>> +             kbd_led_update(asus);
> >>> +
> >>> +     list_for_each_entry(listener, &asus_brt_listeners, list)
> >>> +             listener->notify(listener, asus->kbd_led_wk);
> >>>    }
> >>>
> >>>    static void kbd_led_set(struct led_classdev *led_cdev,
> >>> @@ -1583,15 +1631,21 @@ static void kbd_led_set(struct led_classdev *led_cdev,
> >>>        if (led_cdev->flags & LED_UNREGISTERING)
> >>>                return;
> >>>
> >>> +     mutex_lock(&asus_brt_lock);
> >>>        do_kbd_led_set(led_cdev, value);
> >>> +     mutex_unlock(&asus_brt_lock);
> >>>    }
> >>>
> >>>    static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
> >>>    {
> >>> -     struct led_classdev *led_cdev = &asus->kbd_led;
> >>> +     struct led_classdev *led_cdev;
> >>> +
> >>> +     mutex_lock(&asus_brt_lock);
> >>> +     led_cdev = &asus->kbd_led;
> >>>
> >>>        do_kbd_led_set(led_cdev, value);
> >>>        led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led_wk);
> >>> +     mutex_unlock(&asus_brt_lock);
> >>>    }
> >>>
> >>>    static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
> >>> @@ -1601,6 +1655,9 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
> >>>
> >>>        asus = container_of(led_cdev, struct asus_wmi, kbd_led);
> >>>
> >>> +     if (!asus->kbd_led_avail)
> >>> +             return asus->kbd_led_wk;
> >>> +
> >>>        retval = kbd_led_read(asus, &value, NULL);
> >>>        if (retval < 0)
> >>>                return retval;
> >>> @@ -1716,7 +1773,12 @@ static int camera_led_set(struct led_classdev *led_cdev,
> >>>
> >>>    static void asus_wmi_led_exit(struct asus_wmi *asus)
> >>>    {
> >>> -     led_classdev_unregister(&asus->kbd_led);
> >>> +     mutex_lock(&asus_brt_lock);
> >>> +     asus_brt_ref = NULL;
> >>> +     if (asus->kbd_led_registered)
> >>> +             led_classdev_unregister(&asus->kbd_led);
> >>> +     mutex_unlock(&asus_brt_lock);
> >>> +
> >>>        led_classdev_unregister(&asus->tpd_led);
> >>>        led_classdev_unregister(&asus->wlan_led);
> >>>        led_classdev_unregister(&asus->lightbar_led);
> >>> @@ -1730,6 +1792,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
> >>>    static int asus_wmi_led_init(struct asus_wmi *asus)
> >>>    {
> >>>        int rv = 0, num_rgb_groups = 0, led_val;
> >>> +     bool has_listeners;
> >>>
> >>>        if (asus->kbd_rgb_dev)
> >>>                kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
> >>> @@ -1754,24 +1817,37 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
> >>>                        goto error;
> >>>        }
> >>>
> >>> -     if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
> >>> -             pr_info("using asus-wmi for asus::kbd_backlight\n");
> >>
> >> Okay so part of the reason the asus_use_hid_led_dmi_ids table was
> >> created is that some of those laptops had both WMI method, and HID
> >> method. The WMI method was given priority but on those laptops it didn't
> >> actually work. What was done was a sort of "blanket" use-hid. I don't
> >> know why ASUS did this.
> >>
> >>> +     asus->kbd_led.name = "asus::kbd_backlight";
> >>
> >> I'd like to see this changed to "asus:rgb:kbd_backlight" if RGB is
> >> supported but this might not be so feasible for the bulk of laptops.
> >> Given that the Z13 is using a new PID it may be okay there...
> >
> > So for the Z13 it is not rgb, this is used just as the common
> > backlight handler for all rgb devices, so there is no multi-intensity.
> > The only devices that would be good for would be for those where
> > kbd_rgb_dev exists, and as this series tries to not affect them,
> > changing the name is out of scope.
> >
> >>> +     asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> >>> +     asus->kbd_led.brightness_set = kbd_led_set;
> >>> +     asus->kbd_led.brightness_get = kbd_led_get;
> >>> +     asus->kbd_led.max_brightness = 3;
> >>> +     asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
> >>
> >> Per the comment 2x above we will get some laptops returning "yes I
> >> support this" even though it doesn't actually work. It raises two
> >> questions for me:
> >> 1. on machines where it *does* work and they also support HID, do we end
> >> up with a race condition?
> >> 2. what is the effect of that race?
> >>
> >> I suspect we might need that quirk table still. Unfortunately I
> >> no-longer have a device where the WMI method was broken, but I will test
> >> on one 0x1866 device (2019) and a few 0x19b6
> >>
> >> No other comments.
> >
> > We do not need a quirk anymore actually, the endpoint is created on
> > demand and there is no race condition. See (1) and (2). I almost gave
> > up twice writing this until i figured out how to remove the race
> > conditions.
> >
> >> Cheers,
> >> Luke.
> >>
> >>> +
> >>> +     if (asus->kbd_led_avail)
> >>>                asus->kbd_led_wk = led_val;
> >>> -             asus->kbd_led.name = "asus::kbd_backlight";
> >>> -             asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> >>> -             asus->kbd_led.brightness_set = kbd_led_set;
> >>> -             asus->kbd_led.brightness_get = kbd_led_get;
> >>> -             asus->kbd_led.max_brightness = 3;
> >>> +     else
> >>> +             asus->kbd_led_wk = -1;
> >>> +
> >>> +     if (asus->kbd_led_avail && num_rgb_groups != 0)
> >>> +             asus->kbd_led.groups = kbd_rgb_mode_groups;
> >>>
> >>> -             if (num_rgb_groups != 0)
> >>> -                     asus->kbd_led.groups = kbd_rgb_mode_groups;
> >>> +     mutex_lock(&asus_brt_lock);
> >>> +     has_listeners = !list_empty(&asus_brt_listeners);
> >>> +     mutex_unlock(&asus_brt_lock);
> >>>
> >>> +     if (asus->kbd_led_avail || has_listeners) {
> >>>                rv = led_classdev_register(&asus->platform_device->dev,
> >>>                                           &asus->kbd_led);
> >>>                if (rv)
> >>>                        goto error;
> >>> +             asus->kbd_led_registered = true;
> >>>        }
> >
> > (1) If asus-wmi launches first and supports the WMI endpoint,
> > kbd_led_avail is true so the device is created. If it does not support
> > it but there is a usb device, then has_listeners is true so it is
> > still created.
>
> The problem is that there are a small group of laptops that report the
> WMI method as supported, but when used it actually does nothing, so they
> need to be quirked. These are the ones that will regress, the GU605M is
> one, I think the ProArt series was another as they use the same build
> base as the GU605.
>
> If both are created then hopefully it's a non-issue since the WMI
> endpoint is a no-op for set. But what about when both HID and WMI work
> and both are created?

This series is created with the assumption that they both do
something. Hopefully it is not NOOP for get, otherwise the brightness
might get stuck.

Currently there is a little branch in the code that uses the previous
brightness as a reference if a WMI handler is missing.

> >>>
> >>> +     mutex_lock(&asus_brt_lock);
> >>> +     asus_brt_ref = asus;
> >>> +     mutex_unlock(&asus_brt_lock);
> >>> +
> >>>        if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
> >>>                        && (asus->driver->quirks->wapf > 0)) {
> >>>                INIT_WORK(&asus->wlan_led_work, wlan_led_update);
> >>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> >>> index 783e2a336861b..42e963b70acdb 100644
> >>> --- a/include/linux/platform_data/x86/asus-wmi.h
> >>> +++ b/include/linux/platform_data/x86/asus-wmi.h
> >>> @@ -157,14 +157,30 @@
> >>>    #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK       0x0000FF00
> >>>    #define ASUS_WMI_DSTS_LIGHTBAR_MASK 0x0000000F
> >>>
> >>> +struct asus_brt_listener {
> >>> +     struct list_head list;
> >>> +     void (*notify)(struct asus_brt_listener *listener, int brightness);
> >>> +};
> >>> +
> >>>    #if IS_REACHABLE(CONFIG_ASUS_WMI)
> >>>    int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
> >>> +
> >>> +int asus_brt_register_listener(struct asus_brt_listener *cdev);
> >>> +void asus_brt_unregister_listener(struct asus_brt_listener *cdev);
> >>>    #else
> >>>    static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
> >>>                                           u32 *retval)
> >>>    {
> >>>        return -ENODEV;
> >>>    }
> >>> +
> >>> +static inline int asus_brt_register_listener(struct asus_brt_listener *bdev)
> >>> +{
> >>> +     return -ENODEV;
> >>> +}
> >>> +static inline void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
> >>> +{
> >>> +}
> >>>    #endif
> >>>
> >>>    /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
> >>
>

