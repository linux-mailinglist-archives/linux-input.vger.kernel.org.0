Return-Path: <linux-input+bounces-11123-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1F0A6CFCB
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 15:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA0CE3B5ED7
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 14:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9AE15E8B;
	Sun, 23 Mar 2025 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="gcNADe+N"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299F017E;
	Sun, 23 Mar 2025 14:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742741180; cv=none; b=dXkdyPwPtOX86Qgu+juFARj6Bjk7KKlh7QQQlyu9gomqywHHhJrAnyahi8MwMRnKaIP9L/1x/aqF4mYcu8AS6qOd70R4DLhcpQpBbfJy509ILlUu61MUfaf0Dlej9iUHxEQlNoXWAvN6pfi1cVvkpqbFVHy6BckhaPIMDy2ULiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742741180; c=relaxed/simple;
	bh=M28ISDlb1W5CK9exYOrD2QEmHKoXWE/iJ0qJbupBP7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3vXsLtfqO7dFh4vLLS5/i9GfMOSoVEh3xtiAzFJnLo9472P9ytvkK1BOQlVoGDMkYspzAH42x/dVq2/SCOEpIBMfd9nAhNODln/W+CpPbvzVS8S3DPffo7vTDCi3/id1T6+zAurILaM8zoxeoT7uw5GB4rhW854GQRfFWt/kIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=gcNADe+N; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 6C6D42E0942E;
	Sun, 23 Mar 2025 16:46:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742741173;
	bh=nIjuKIgZLgFsutZJraBZ+LXemw50XUzGA0wSmBwF9QY=;
	h=Received:From:Subject:To;
	b=gcNADe+NqBcTwLa3UWzSdqlZYPTzE5d5AxqhnEOA+NwsJSy3nnk4lT3wvyxkk65OF
	 0wgokIogoXFe+y+qQ19zkpnUUzoCOK22EDttUZu3xZllKmvjR39XkNkCdkIXQ4sVgH
	 8nhr1LJL/huEWDW4tzic/9vtn7hy0MtCJOoRCJ2Y=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30beedb99c9so35587231fa.3;
        Sun, 23 Mar 2025 07:46:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVnU8fRiADqc71K68B0x4uVlTPq7516URZ1TvHvUB4J32MTwBxJHIoV+gVXtBkzQc4uSMajvQatM3ca0A==@vger.kernel.org,
 AJvYcCWpLUOnAnurW9bvOi2kF0eFeZr/pOI9+LIyMABajrTNJJGW1NqicxoRulwLhLp/qBouErnkg4S7uFtQOURl@vger.kernel.org
X-Gm-Message-State: AOJu0YwqlEKSDtH0DYEW6qrWEJAjOOvw5QxLnewdfGBQUhe/AGL1MysW
	s+mKOAjIC9NAQBCcj0qFwnLSeEsr1SaV66t448bX2VFEKBTYNGtLnX55Ik+ztHBPg4Vdf26MPFa
	YdajAe5Z+7B0UVtLv1aUgJKDi2Ro=
X-Google-Smtp-Source: 
 AGHT+IEL8qGmkQT4CCogsoRN6Nf69Pj9GUcRts5DjSuBCJ2lcVmjQkt4ZcA+2StrWYI9ybKfAENX8vgoalCvitYFu1A=
X-Received: by 2002:a2e:a78a:0:b0:30c:4610:9e9e with SMTP id
 38308e7fff4ca-30d7e2d9f69mr40665261fa.35.1742741171466; Sun, 23 Mar 2025
 07:46:11 -0700 (PDT)
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
In-Reply-To: 
 <CAGwozwFZAenLmmDC8tVChQMfzHo7NVuxOeqVmE9OVfY+-tAByA@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 23 Mar 2025 15:45:59 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGAFqbiFGdgrKOwc8rGBxQ47T7_vw=28R6FCxwn3MWDaQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrkekyNZesdsDsJ0DpRSUBpiUXalEILEOFpMb31u6t9LVr4qKED2giuVCA
Message-ID: 
 <CAGwozwGAFqbiFGdgrKOwc8rGBxQ47T7_vw=28R6FCxwn3MWDaQ@mail.gmail.com>
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
 <174274117284.8549.12899156043005326554@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Sun, 23 Mar 2025 at 12:37, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Sun, 23 Mar 2025 at 07:40, Luke D. Jones <luke@ljones.dev> wrote:
> >
> > On 22/03/25 23:28, Antheas Kapenekakis wrote:
> > > Adds basic RGB support to hid-asus through multi-index. The interface
> > > works quite well, but has not gone through much stability testing.
> > > Applied on demand, if userspace does not touch the RGB sysfs, not
> > > even initialization is done. Ensuring compatibility with existing
> > > userspace programs.
> > >
> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >   drivers/hid/hid-asus.c | 169 +++++++++++++++++++++++++++++++++++++----
> > >   1 file changed, 155 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > > index 905453a4eb5b7..9d8ccfde5912e 100644
> > > --- a/drivers/hid/hid-asus.c
> > > +++ b/drivers/hid/hid-asus.c
> > > @@ -30,6 +30,7 @@
> > >   #include <linux/input/mt.h>
> > >   #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
> > >   #include <linux/power_supply.h>
> > > +#include <linux/led-class-multicolor.h>
> > >   #include <linux/leds.h>
> > >
> > >   #include "hid-ids.h"
> > > @@ -85,6 +86,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> > >   #define QUIRK_ROG_NKEY_KEYBOARD             BIT(11)
> > >   #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> > >   #define QUIRK_HANDLE_GENERIC                BIT(13)
> > > +#define QUIRK_ROG_NKEY_RGB           BIT(14)
> > >
> > >   #define I2C_KEYBOARD_QUIRKS                 (QUIRK_FIX_NOTEBOOK_REPORT | \
> > >                                                QUIRK_NO_INIT_REPORTS | \
> > > @@ -97,9 +99,15 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> > >
> > >   struct asus_kbd_leds {
> > >       struct asus_hid_listener listener;
> > > +     struct led_classdev_mc mc_led;
> > > +     struct mc_subled subled_info[3];
> > >       struct hid_device *hdev;
> > >       struct work_struct work;
> > >       unsigned int brightness;
> > > +     uint8_t rgb_colors[3];
> > > +     bool rgb_init;
> > > +     bool rgb_set;
> > > +     bool rgb_registered;
> > >       spinlock_t lock;
> > >       bool removed;
> > >   };
> > > @@ -504,23 +512,67 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
> > >       spin_unlock_irqrestore(&led->lock, flags);
> > >   }
> > >
> > > -static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
> > > +static void do_asus_kbd_backlight_set(struct asus_kbd_leds *led, int brightness)
> > > +{
> > > +     unsigned long flags;
> > > +
> > > +     spin_lock_irqsave(&led->lock, flags);
> > > +     led->brightness = brightness;
> > > +     spin_unlock_irqrestore(&led->lock, flags);
> > > +
> > > +     asus_schedule_work(led);
> > > +}
> > > +
> > > +static void asus_kbd_listener_set(struct asus_hid_listener *listener,
> > >                                  int brightness)
> > >   {
> > >       struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
> > >                                                listener);
> > > +     do_asus_kbd_backlight_set(led, brightness);
> > > +     if (led->rgb_registered) {
> > > +             led->mc_led.led_cdev.brightness = brightness;
> > > +             led_classdev_notify_brightness_hw_changed(&led->mc_led.led_cdev,
> > > +                                                       brightness);
> > > +     }
> > > +}
> > > +
> > > +static void asus_kbd_brightness_set(struct led_classdev *led_cdev,
> > > +                                 enum led_brightness brightness)
> > > +{
> > > +     struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
> > > +     struct asus_kbd_leds *led = container_of(mc_cdev, struct asus_kbd_leds,
> > > +                                              mc_led);
> > >       unsigned long flags;
> > >
> > >       spin_lock_irqsave(&led->lock, flags);
> > > -     led->brightness = brightness;
> > > +     led->rgb_colors[0] = mc_cdev->subled_info[0].intensity;
> > > +     led->rgb_colors[1] = mc_cdev->subled_info[1].intensity;
> > > +     led->rgb_colors[2] = mc_cdev->subled_info[2].intensity;
> > > +     led->rgb_set = true;
> > >       spin_unlock_irqrestore(&led->lock, flags);
> > >
> > > -     asus_schedule_work(led);
> > > +     do_asus_kbd_backlight_set(led, brightness);
> > > +}
> > > +
> > > +static enum led_brightness asus_kbd_brightness_get(struct led_classdev *led_cdev)
> > > +{
> > > +     struct led_classdev_mc *mc_led;
> > > +     struct asus_kbd_leds *led;
> > > +     enum led_brightness brightness;
> > > +     unsigned long flags;
> > > +
> > > +     mc_led = lcdev_to_mccdev(led_cdev);
> > > +     led = container_of(mc_led, struct asus_kbd_leds, mc_led);
> > > +
> > > +     spin_lock_irqsave(&led->lock, flags);
> > > +     brightness = led->brightness;
> > > +     spin_unlock_irqrestore(&led->lock, flags);
> > > +
> > > +     return brightness;
> > >   }
> > >
> > > -static void asus_kbd_backlight_work(struct work_struct *work)
> > > +static void asus_kbd_backlight_work(struct asus_kbd_leds *led)
> > >   {
> > > -     struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> > >       u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
> > >       int ret;
> > >       unsigned long flags;
> > > @@ -534,10 +586,69 @@ static void asus_kbd_backlight_work(struct work_struct *work)
> > >               hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
> > >   }
> > >
> > > +static void asus_kbd_rgb_work(struct asus_kbd_leds *led)
> > > +{
> > > +     u8 rgb_buf[][7] = {
> > > +             { FEATURE_KBD_LED_REPORT_ID1, 0xB3 }, /* set mode */
> > > +             { FEATURE_KBD_LED_REPORT_ID1, 0xB5 }, /* apply mode */
> > > +             { FEATURE_KBD_LED_REPORT_ID1, 0xB4 }, /* save to mem */
> > > +     };
> > > +     unsigned long flags;
> > > +     uint8_t colors[3];
> > > +     bool rgb_init, rgb_set;
> > > +     int ret;
> > > +
> > > +     spin_lock_irqsave(&led->lock, flags);
> > > +     rgb_init = led->rgb_init;
> > > +     rgb_set = led->rgb_set;
> > > +     led->rgb_set = false;
> > > +     colors[0] = led->rgb_colors[0];
> > > +     colors[1] = led->rgb_colors[1];
> > > +     colors[2] = led->rgb_colors[2];
> > > +     spin_unlock_irqrestore(&led->lock, flags);
> > > +
> > > +     if (!rgb_set)
> > > +             return;
> > > +
> > > +     if (rgb_init) {
> > > +             ret = asus_kbd_init(led->hdev, FEATURE_KBD_LED_REPORT_ID1);
> > > +             if (ret < 0) {
> > > +                     hid_err(led->hdev, "Asus failed to init RGB: %d\n", ret);
> > > +                     return;
> > > +             }
> > > +             spin_lock_irqsave(&led->lock, flags);
> > > +             led->rgb_init = false;
> > > +             spin_unlock_irqrestore(&led->lock, flags);
> > > +     }
> > > +
> > > +     /* Protocol is: 54b3 zone (0=all) mode (0=solid) RGB */
> > > +     rgb_buf[0][4] = colors[0];
> > > +     rgb_buf[0][5] = colors[1];
> > > +     rgb_buf[0][6] = colors[2];
> > > +
> > > +     for (size_t i = 0; i < ARRAY_SIZE(rgb_buf); i++) {
> > > +             ret = asus_kbd_set_report(led->hdev, rgb_buf[i], sizeof(rgb_buf[i]));
> > > +             if (ret < 0) {
> > > +                     hid_err(led->hdev, "Asus failed to set RGB: %d\n", ret);
> > > +                     return;
> > > +             }
> > > +     }
> > > +}
> > > +
> > > +static void asus_kbd_work(struct work_struct *work)
> > > +{
> > > +     struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds,
> > > +                                              work);
> > > +     asus_kbd_backlight_work(led);
> > > +     asus_kbd_rgb_work(led);
> > > +}
> > > +
> > >   static int asus_kbd_register_leds(struct hid_device *hdev)
> > >   {
> > >       struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> > >       unsigned char kbd_func;
> > > +     struct asus_kbd_leds *leds;
> > > +     bool no_led;
> > >       int ret;
> > >
> > >       ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > > @@ -565,21 +676,51 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> > >       if (!drvdata->kbd_backlight)
> > >               return -ENOMEM;
> > >
> > > -     drvdata->kbd_backlight->removed = false;
> > > -     drvdata->kbd_backlight->brightness = 0;
> > > -     drvdata->kbd_backlight->hdev = hdev;
> > > -     drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
> > > -     INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
> > > +     leds = drvdata->kbd_backlight;
> > > +     leds->removed = false;
> > > +     leds->brightness = 3;
> > > +     leds->hdev = hdev;
> > > +     leds->listener.brightness_set = asus_kbd_listener_set;
> > > +
> > > +     leds->rgb_colors[0] = 0;
> > > +     leds->rgb_colors[1] = 0;
> > > +     leds->rgb_colors[2] = 0;
> > > +     leds->rgb_init = true;
> > > +     leds->rgb_set = false;
> > > +     leds->mc_led.led_cdev.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
> > > +                                     "asus-%s-led",
> > > +                                     strlen(hdev->uniq) ?
> > > +                                     hdev->uniq : dev_name(&hdev->dev));
> >
> > A quick note. This breaks convention for LED names. The style guide is
> > at Documentation/leds/leds-class.rst. Per my parallel email to this one
> > I would like to see the mentioned naming scheme `asus:rgb:kbd_backlight`
> > adopted.
>
> Perhaps. It would be the first kbd_backlight driver to have "rgb" in
> it. It is a bit out of scope for this series as I do not touch the
> functionality of it but I can add a patch for it and a fixes
> e305a71cea37a64c75 tag.
>
> > Expanding further on one of the points there you might need to
> > move the led_classdev_mc in to asus-wmi to fulfil having the single
> > sysfs endpoint. Since you're using the listner pattern it shouldn't be
> > much work.
>
> I only want the brightness to sync, not the color. Only the brightness
> between Aura devices needs to be the same. In this case
> asus::kbd_backlight if it has a color controls the wmi color, and the
> asus- devices control the usb.
>
> Also, groups are not dynamic so this is not possible. E.g., if you
> setup a WMI listener that does not have RGB, and then the USB keyboard
> connects you can no longer change the groups unless you reconnect the
> device.

Sorry, I confused the patches. Yes you are right. I cannot do
kbd_backlight because userspace might pick the wrong handler. And with
this patch series on the Z13 there are 3, one for the common
backlight, one for the keyboard, and one for the lightbar.

I can do asus-UNIQ:rgb:peripheral though. There is no appropriate
function that is close enough currently. Also, since there can be
multiple devices, UNIQ or something similar needs to be added,
otherwise the led handler will suffix _X.

Antheas

> > > +     leds->mc_led.led_cdev.flags = LED_BRIGHT_HW_CHANGED;
> > > +     leds->mc_led.led_cdev.max_brightness = 3,
> > > +     leds->mc_led.led_cdev.brightness_set = asus_kbd_brightness_set,
> > > +     leds->mc_led.led_cdev.brightness_get = asus_kbd_brightness_get,
> > > +     leds->mc_led.subled_info = leds->subled_info,
> > > +     leds->mc_led.num_colors = ARRAY_SIZE(leds->subled_info),
> > > +     leds->subled_info[0].color_index = LED_COLOR_ID_RED;
> > > +     leds->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> > > +     leds->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> > > +
> > > +     INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_work);
> > >       spin_lock_init(&drvdata->kbd_backlight->lock);
> > >
> > >       ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
> > > +     no_led = !!ret;
> > > +
> > > +     if (drvdata->quirks & QUIRK_ROG_NKEY_RGB) {
> > > +             ret = devm_led_classdev_multicolor_register(
> > > +                     &hdev->dev, &leds->mc_led);
> > > +             if (!ret)
> > > +                     leds->rgb_registered = true;
> > > +             no_led &= !!ret;
> > > +     }
> > >
> > > -     if (ret < 0) {
> > > +     if (no_led) {
> > >               /* No need to have this still around */
> > >               devm_kfree(&hdev->dev, drvdata->kbd_backlight);
> > >       }
> > >
> > > -     return ret;
> > > +     return no_led ? -ENODEV : 0;
> > >   }
> > >
> > >   /*
> > > @@ -1289,7 +1430,7 @@ static const struct hid_device_id asus_devices[] = {
> > >         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> > >           USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> > > -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > > +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
> > >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> > >           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
> > >         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > > @@ -1318,7 +1459,7 @@ static const struct hid_device_id asus_devices[] = {
> > >        */
> > >       { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> > >               USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO),
> > > -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > > +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
> > >       { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> > >               USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
> > >       { }
> >

