Return-Path: <linux-input+bounces-11127-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C682FA6D128
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 22:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BA057A3A3E
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 21:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C425D18F2DF;
	Sun, 23 Mar 2025 21:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="nqcAsfJ4"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D1C1519A7;
	Sun, 23 Mar 2025 21:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742764122; cv=none; b=hx+BsghxIeyO9oAWTflEKbCSOpUavFU3GFCMuqqlVp6mLva5w4DXCZcWs14bmHmjIWXDDp9WhVZYqK8PYtbGf3AWxfV3k2DPnMeUIcgl5ior64rRQlvZxJDI+vBfIMbcYSv8SVM2vg86n01bTOZSvhjiUUThoDpavdlrnjFazKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742764122; c=relaxed/simple;
	bh=MsOFR9NfK9R2e0BxtrEfiwaYXlKnlqr/m4PYtjRYIyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVtrqW2/7k5PDUgMdN/axYEpxwpSvr3mpgB8T3ocpW4Y2R9cQj27t8YCafaTnyYj87PCLk/7yvwlDcN6+Bs3smIxTRZEl5lvf8+Ijr4wC6TBnIKMREEe7MWLdPDjF8vDUa5yKUFlH54ZZTK90/cL9go8DO4ZEh1rnDsJl5kpXxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=nqcAsfJ4; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id CA5812E095E8;
	Sun, 23 Mar 2025 23:08:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742764115;
	bh=3yWLqFWQlfeRYoAzQh6LWPa7MAyGj7mPfJe/YzHgj6A=;
	h=Received:From:Subject:To;
	b=nqcAsfJ4ukQivEcy4RjyuMrbPCsc8QEXzbpSlhPeK7MeKn+1MaMjGH2Lr12quck22
	 0/hEauZj2N0Y+b6wS5adJlI5cEP5/Z7cv0qd0YQ15MsWCzxFi4r/ac5YBjmAtMvtNc
	 EJ3T44XUXVyjbtxjr8CNhqfwdK8uDqDp9uPhCNDY=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.177) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f177.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-307325f2436so38411491fa.0;
        Sun, 23 Mar 2025 14:08:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVclFBPQqq3yWfLcORY2sICzDOoKc3dauc6qRREAimLazcM1h/A/L44EO1cdbI1XqA/9cokZvjCEVmP7A==@vger.kernel.org,
 AJvYcCVhF/VDJtEPfVC0ZTJlGrG3nR3hxoxNRkW8/MIShFAtaf6jQx7VhHhmREb4YiGHmoEmhBoPDnk2UjATxc2c@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn/wwMmwZ/er8316GUrRTzSFMNviWkR8S3TdLDV8pef2CV2phm
	B5EUQw4LcyLXir1e/A+TXkJ2CNY92ZG0dXVnj9zpcXmBBWGp9+6GLuVCd/XR0449ixzPecyRFfl
	jELbOK/FiRGoe7K85G8YdlePujK4=
X-Google-Smtp-Source: 
 AGHT+IH7D0xLF2HEk5S3z8VWIovcea2fWuec6gFZeXbckJOHIPno+nCO1zo4YkUaLzmKPM0HQEYBtwXemicwgh7+wTs=
X-Received: by 2002:a05:651c:211b:b0:30b:fd28:a771 with SMTP id
 38308e7fff4ca-30d7e0c1aacmr44220301fa.0.1742764113828; Sun, 23 Mar 2025
 14:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-10-lkml@antheas.dev>
 <bb3071d4-7910-46c2-ab48-aed574bcd758@ljones.dev>
 <CAGwozwFZAenLmmDC8tVChQMfzHo7NVuxOeqVmE9OVfY+-tAByA@mail.gmail.com>
 <7796b0dc-22a4-40d5-a55b-64969283761c@ljones.dev>
In-Reply-To: <7796b0dc-22a4-40d5-a55b-64969283761c@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 23 Mar 2025 22:08:22 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFw5kdzahbvYdRLMfbj6xj-h3gCPijCow_UO3VnTZg3dQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoctuJxtbF6ODoIcTRb1175tb7be7R7Vzj0-_9tvEhvjVHIV-iNRFN9uhs
Message-ID: 
 <CAGwozwFw5kdzahbvYdRLMfbj6xj-h3gCPijCow_UO3VnTZg3dQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] HID: asus: add basic RGB support
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174276411520.20656.6385236301075540484@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Sun, 23 Mar 2025 at 21:39, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 24/03/25 00:37, Antheas Kapenekakis wrote:
> > On Sun, 23 Mar 2025 at 07:40, Luke D. Jones <luke@ljones.dev> wrote:
> >>
> >> On 22/03/25 23:28, Antheas Kapenekakis wrote:
> >>> Adds basic RGB support to hid-asus through multi-index. The interface
> >>> works quite well, but has not gone through much stability testing.
> >>> Applied on demand, if userspace does not touch the RGB sysfs, not
> >>> even initialization is done. Ensuring compatibility with existing
> >>> userspace programs.
> >>>
> >>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>> ---
> >>>    drivers/hid/hid-asus.c | 169 +++++++++++++++++++++++++++++++++++++----
> >>>    1 file changed, 155 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>> index 905453a4eb5b7..9d8ccfde5912e 100644
> >>> --- a/drivers/hid/hid-asus.c
> >>> +++ b/drivers/hid/hid-asus.c
> >>> @@ -30,6 +30,7 @@
> >>>    #include <linux/input/mt.h>
> >>>    #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
> >>>    #include <linux/power_supply.h>
> >>> +#include <linux/led-class-multicolor.h>
> >>>    #include <linux/leds.h>
> >>>
> >>>    #include "hid-ids.h"
> >>> @@ -85,6 +86,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >>>    #define QUIRK_ROG_NKEY_KEYBOARD             BIT(11)
> >>>    #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >>>    #define QUIRK_HANDLE_GENERIC                BIT(13)
> >>> +#define QUIRK_ROG_NKEY_RGB           BIT(14)
> >>>
> >>>    #define I2C_KEYBOARD_QUIRKS                 (QUIRK_FIX_NOTEBOOK_REPORT | \
> >>>                                                 QUIRK_NO_INIT_REPORTS | \
> >>> @@ -97,9 +99,15 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >>>
> >>>    struct asus_kbd_leds {
> >>>        struct asus_hid_listener listener;
> >>> +     struct led_classdev_mc mc_led;
> >>> +     struct mc_subled subled_info[3];
> >>>        struct hid_device *hdev;
> >>>        struct work_struct work;
> >>>        unsigned int brightness;
> >>> +     uint8_t rgb_colors[3];
> >>> +     bool rgb_init;
> >>> +     bool rgb_set;
> >>> +     bool rgb_registered;
> >>>        spinlock_t lock;
> >>>        bool removed;
> >>>    };
> >>> @@ -504,23 +512,67 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
> >>>        spin_unlock_irqrestore(&led->lock, flags);
> >>>    }
> >>>
> >>> -static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
> >>> +static void do_asus_kbd_backlight_set(struct asus_kbd_leds *led, int brightness)
> >>> +{
> >>> +     unsigned long flags;
> >>> +
> >>> +     spin_lock_irqsave(&led->lock, flags);
> >>> +     led->brightness = brightness;
> >>> +     spin_unlock_irqrestore(&led->lock, flags);
> >>> +
> >>> +     asus_schedule_work(led);
> >>> +}
> >>> +
> >>> +static void asus_kbd_listener_set(struct asus_hid_listener *listener,
> >>>                                   int brightness)
> >>>    {
> >>>        struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
> >>>                                                 listener);
> >>> +     do_asus_kbd_backlight_set(led, brightness);
> >>> +     if (led->rgb_registered) {
> >>> +             led->mc_led.led_cdev.brightness = brightness;
> >>> +             led_classdev_notify_brightness_hw_changed(&led->mc_led.led_cdev,
> >>> +                                                       brightness);
> >>> +     }
> >>> +}
> >>> +
> >>> +static void asus_kbd_brightness_set(struct led_classdev *led_cdev,
> >>> +                                 enum led_brightness brightness)
> >>> +{
> >>> +     struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
> >>> +     struct asus_kbd_leds *led = container_of(mc_cdev, struct asus_kbd_leds,
> >>> +                                              mc_led);
> >>>        unsigned long flags;
> >>>
> >>>        spin_lock_irqsave(&led->lock, flags);
> >>> -     led->brightness = brightness;
> >>> +     led->rgb_colors[0] = mc_cdev->subled_info[0].intensity;
> >>> +     led->rgb_colors[1] = mc_cdev->subled_info[1].intensity;
> >>> +     led->rgb_colors[2] = mc_cdev->subled_info[2].intensity;
> >>> +     led->rgb_set = true;
> >>>        spin_unlock_irqrestore(&led->lock, flags);
> >>>
> >>> -     asus_schedule_work(led);
> >>> +     do_asus_kbd_backlight_set(led, brightness);
> >>> +}
> >>> +
> >>> +static enum led_brightness asus_kbd_brightness_get(struct led_classdev *led_cdev)
> >>> +{
> >>> +     struct led_classdev_mc *mc_led;
> >>> +     struct asus_kbd_leds *led;
> >>> +     enum led_brightness brightness;
> >>> +     unsigned long flags;
> >>> +
> >>> +     mc_led = lcdev_to_mccdev(led_cdev);
> >>> +     led = container_of(mc_led, struct asus_kbd_leds, mc_led);
> >>> +
> >>> +     spin_lock_irqsave(&led->lock, flags);
> >>> +     brightness = led->brightness;
> >>> +     spin_unlock_irqrestore(&led->lock, flags);
> >>> +
> >>> +     return brightness;
> >>>    }
> >>>
> >>> -static void asus_kbd_backlight_work(struct work_struct *work)
> >>> +static void asus_kbd_backlight_work(struct asus_kbd_leds *led)
> >>>    {
> >>> -     struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> >>>        u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
> >>>        int ret;
> >>>        unsigned long flags;
> >>> @@ -534,10 +586,69 @@ static void asus_kbd_backlight_work(struct work_struct *work)
> >>>                hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
> >>>    }
> >>>
> >>> +static void asus_kbd_rgb_work(struct asus_kbd_leds *led)
> >>> +{
> >>> +     u8 rgb_buf[][7] = {
> >>> +             { FEATURE_KBD_LED_REPORT_ID1, 0xB3 }, /* set mode */
> >>> +             { FEATURE_KBD_LED_REPORT_ID1, 0xB5 }, /* apply mode */
> >>> +             { FEATURE_KBD_LED_REPORT_ID1, 0xB4 }, /* save to mem */
> >>> +     };
> >>> +     unsigned long flags;
> >>> +     uint8_t colors[3];
> >>> +     bool rgb_init, rgb_set;
> >>> +     int ret;
> >>> +
> >>> +     spin_lock_irqsave(&led->lock, flags);
> >>> +     rgb_init = led->rgb_init;
> >>> +     rgb_set = led->rgb_set;
> >>> +     led->rgb_set = false;
> >>> +     colors[0] = led->rgb_colors[0];
> >>> +     colors[1] = led->rgb_colors[1];
> >>> +     colors[2] = led->rgb_colors[2];
> >>> +     spin_unlock_irqrestore(&led->lock, flags);
> >>> +
> >>> +     if (!rgb_set)
> >>> +             return;
> >>> +
> >>> +     if (rgb_init) {
> >>> +             ret = asus_kbd_init(led->hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>> +             if (ret < 0) {
> >>> +                     hid_err(led->hdev, "Asus failed to init RGB: %d\n", ret);
> >>> +                     return;
> >>> +             }
> >>> +             spin_lock_irqsave(&led->lock, flags);
> >>> +             led->rgb_init = false;
> >>> +             spin_unlock_irqrestore(&led->lock, flags);
> >>> +     }
> >>> +
> >>> +     /* Protocol is: 54b3 zone (0=all) mode (0=solid) RGB */
> >>> +     rgb_buf[0][4] = colors[0];
> >>> +     rgb_buf[0][5] = colors[1];
> >>> +     rgb_buf[0][6] = colors[2];
> >>> +
> >>> +     for (size_t i = 0; i < ARRAY_SIZE(rgb_buf); i++) {
> >>> +             ret = asus_kbd_set_report(led->hdev, rgb_buf[i], sizeof(rgb_buf[i]));
> >>> +             if (ret < 0) {
> >>> +                     hid_err(led->hdev, "Asus failed to set RGB: %d\n", ret);
> >>> +                     return;
> >>> +             }
> >>> +     }
> >>> +}
> >>> +
> >>> +static void asus_kbd_work(struct work_struct *work)
> >>> +{
> >>> +     struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds,
> >>> +                                              work);
> >>> +     asus_kbd_backlight_work(led);
> >>> +     asus_kbd_rgb_work(led);
> >>> +}
> >>> +
> >>>    static int asus_kbd_register_leds(struct hid_device *hdev)
> >>>    {
> >>>        struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> >>>        unsigned char kbd_func;
> >>> +     struct asus_kbd_leds *leds;
> >>> +     bool no_led;
> >>>        int ret;
> >>>
> >>>        ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> >>> @@ -565,21 +676,51 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >>>        if (!drvdata->kbd_backlight)
> >>>                return -ENOMEM;
> >>>
> >>> -     drvdata->kbd_backlight->removed = false;
> >>> -     drvdata->kbd_backlight->brightness = 0;
> >>> -     drvdata->kbd_backlight->hdev = hdev;
> >>> -     drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
> >>> -     INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
> >>> +     leds = drvdata->kbd_backlight;
> >>> +     leds->removed = false;
> >>> +     leds->brightness = 3;
> >>> +     leds->hdev = hdev;
> >>> +     leds->listener.brightness_set = asus_kbd_listener_set;
> >>> +
> >>> +     leds->rgb_colors[0] = 0;
> >>> +     leds->rgb_colors[1] = 0;
> >>> +     leds->rgb_colors[2] = 0;
> >>> +     leds->rgb_init = true;
> >>> +     leds->rgb_set = false;
> >>> +     leds->mc_led.led_cdev.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
> >>> +                                     "asus-%s-led",
> >>> +                                     strlen(hdev->uniq) ?
> >>> +                                     hdev->uniq : dev_name(&hdev->dev));
> >>
> >> A quick note. This breaks convention for LED names. The style guide is
> >> at Documentation/leds/leds-class.rst. Per my parallel email to this one
> >> I would like to see the mentioned naming scheme `asus:rgb:kbd_backlight`
> >> adopted.
> >
> > Perhaps. It would be the first kbd_backlight driver to have "rgb" in
> > it. It is a bit out of scope for this series as I do not touch the
> > functionality of it but I can add a patch for it and a fixes
> > e305a71cea37a64c75 tag.
> >
>
> Your proposal for naming in other reply is good :)
> If the intent is to keep 0-3 brightness and RGB controls separated the
> kbd_backlight doesn't need adjustment in naming, particularly if the RGB
> is *not* inside `asus:rgb:kbd_backlight`.
>
> >> Expanding further on one of the points there you might need to
> >> move the led_classdev_mc in to asus-wmi to fulfil having the single
> >> sysfs endpoint. Since you're using the listner pattern it shouldn't be
> >> much work.
> >
> > I only want the brightness to sync, not the color. Only the brightness
> > between Aura devices needs to be the same. In this case
> > asus::kbd_backlight if it has a color controls the wmi color, and the
> > asus- devices control the usb.
> >
>
> Hmm, what about multicolour brightness? Otherwise yeah, understood and
> I'm fine with that. Given you now ustilise the kbd_dill<up/down>
> directly I don't see any issues there either.
>
> > Also, groups are not dynamic so this is not possible. E.g., if you
> > setup a WMI listener that does not have RGB, and then the USB keyboard
> > connects you can no longer change the groups unless you reconnect the
> > device.
>
> That's a shame. Oh well.
>
> I would have preferred RGB and brightness combined. At a glance I would
> have stored RGB in a global or similar, then if a listener has mcled
> available that value would be applied.

There is also a brightness var in the usb endpoint thats duplicated.
So it can be controlled individually. But writing a brightness to
asus::kbd_brightness or using the keyboard shortcut will override it.
Only way I could think of to manage it.

> But userpsace should be using udev libs and similar to find devices like
> this, so naming is more of a hint alongside the attributes. Meaning name
> changes or including mcled inside standard led shouldn't break things.
> Neither should keeping them separated as you have.
>
> Apologies for the bikeshedding on this. I had been reluctant to add RGB
> myself for a number of reasons:
>
> 1. Windows uses LampArray for the dynamic LED (new)

Yeah i played a bit with dynamic lighting on windows on the Ally. It
looks like a mess with Armoury crate and windows fighting over the
leds.

> 2. Otherwise you need to use MCU software mode, that's what that mode is for
> 3. I don't know of a capabilities request for MCU software mode
> 4. Or you're forced to set MCU mode static/solid
> 5. Single colour keybaords vs RGB, on same PID :(
>
> I considered adding attributes to mcled in sysfs for
> mode/speed/direction. But then I had to add an enourmous table of
> modes-per-model.
>
> At the end of the day I think your solution is fine and we don't have
> much other choice beyond trying to introduce a new API better suited for
> RGB keyboards with many features. I suspect it will also be fine for
> other laptops since the mode is set on write to RGB, so hidraw is still
> open to userspace.

I think solid is a great start. I found myself using it this week.
Then getting the KDE guys to add a color picker.

> With the other changes in place I'll experiment a little with the
> laptops I have and see how it works. I have two that i will need to
> check HID and WMI on even though it's not an issue for the Z13 and Ally,
> it might highlight any pain points and improve things further. Could be
> a few days, or coming weekend sorry, I've got a massive amount of work
> on, besides my own kernel patches.

That's alright with me. I plan to send a V4 middle of the week. I will
try to include a patch that inits 0x5d that can be reverted later if
it is not needed.

Also have some other stuff to deal with Bazzite. Mesa 25 was a big PITA

Antheas

> Cheers,
> Luke.
>
> >>> +     leds->mc_led.led_cdev.flags = LED_BRIGHT_HW_CHANGED;
> >>> +     leds->mc_led.led_cdev.max_brightness = 3,
> >>> +     leds->mc_led.led_cdev.brightness_set = asus_kbd_brightness_set,
> >>> +     leds->mc_led.led_cdev.brightness_get = asus_kbd_brightness_get,
> >>> +     leds->mc_led.subled_info = leds->subled_info,
> >>> +     leds->mc_led.num_colors = ARRAY_SIZE(leds->subled_info),
> >>> +     leds->subled_info[0].color_index = LED_COLOR_ID_RED;
> >>> +     leds->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> >>> +     leds->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> >>> +
> >>> +     INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_work);
> >>>        spin_lock_init(&drvdata->kbd_backlight->lock);
> >>>
> >>>        ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
> >>> +     no_led = !!ret;
> >>> +
> >>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_RGB) {
> >>> +             ret = devm_led_classdev_multicolor_register(
> >>> +                     &hdev->dev, &leds->mc_led);
> >>> +             if (!ret)
> >>> +                     leds->rgb_registered = true;
> >>> +             no_led &= !!ret;
> >>> +     }
> >>>
> >>> -     if (ret < 0) {
> >>> +     if (no_led) {
> >>>                /* No need to have this still around */
> >>>                devm_kfree(&hdev->dev, drvdata->kbd_backlight);
> >>>        }
> >>>
> >>> -     return ret;
> >>> +     return no_led ? -ENODEV : 0;
> >>>    }
> >>>
> >>>    /*
> >>> @@ -1289,7 +1430,7 @@ static const struct hid_device_id asus_devices[] = {
> >>>          QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>        { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>            USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
> >>>        { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>            USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
> >>>          QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>> @@ -1318,7 +1459,7 @@ static const struct hid_device_id asus_devices[] = {
> >>>         */
> >>>        { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> >>>                USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO),
> >>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
> >>>        { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> >>>                USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
> >>>        { }
> >>
>

