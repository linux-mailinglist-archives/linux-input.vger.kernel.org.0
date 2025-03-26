Return-Path: <linux-input+bounces-11288-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B36C4A7135B
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 10:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 074641891DAC
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 09:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AD11A4F3C;
	Wed, 26 Mar 2025 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="JiMFdNXs"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EA03D6A;
	Wed, 26 Mar 2025 09:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742980194; cv=none; b=sfsTb3DD3cQYyvnUj2txjxrsbMwcwM9KNQS8aonFNTXKKJLGY55VF+NTpHUkJ+P+RKD7qNe5D6uKZjFpeD0tOC2r/t3S7eAA+YWmm+Quz1RPq15GoMUXA2wrepKuvuz3fCJKFs3fp19zN58FoPGqxfjScviMt+MZwOyB11Z74f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742980194; c=relaxed/simple;
	bh=p0cKfEP+bjfl72KKkgTYkAWIZXt2jvtB5ODQm25PxgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWt3qbGnT7LpQGEjzyeLU+M47VpoEzGPX2zSUzXa2jaTkQxTNIaLQVu3EKU8mgi86Y2kSjvtaV6NmhQwu5hstJY3QDGW1u9Rn7NmmWDnEz2Z2/JfXe+RvF+GqaHJUhAyn43dKB8JeDhO93+eGGLoc8olH3kebuWQUw7Xu9TJl3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=JiMFdNXs; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 2AA0B2E00E60;
	Wed, 26 Mar 2025 11:09:40 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742980182;
	bh=WKOnlopo2CQvGKLU16faGsYD05kWZcND2oYE3H1cQI4=;
	h=Received:From:Subject:To;
	b=JiMFdNXsoks89mU+I7PphMYzXyw0D1Q0L4BlJ+l+h2jfX8YAN9DsLCJ4cWMBomiCP
	 zgM++pjp5/VbGLMTwYSRdTgnEGSK1IRGNNSuEQ7LpvVEpuZEHBh5vxqavDi0uA+pXP
	 nXWEj5FjueEggDp8W7mTMlOtd0kBw5ZSEPlepthI=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f169.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30613802a6bso67941041fa.1;
        Wed, 26 Mar 2025 02:09:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU2kOgWSN0G1N+mDFQINSSDwz3SK+W0OfP6HBqP1G7x+bINkM+iz2vQtYYFct0S7nFRUG+3kWNRpVShbhlT@vger.kernel.org,
 AJvYcCXnpjYJnXIiT2PeDeeJIWsSBj3Eoyz7NScmC42jvgmazHBJrzK3/+f2psJchkD37jf8E/s+Fl5l+1R3mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrITU2pIsHoK5B0zK4JZJnICRkOquLwKfE0z9cltcwMe/XeEyP
	LpBz+qUuecT0KhSyZSvgZBtcQXO0LPPewco6y1t6X2jrTgYDxgiEeaavHdRsBPySCuEEO9fFo+5
	BuJC4lwyomqzGjW3oPdDsSGeJa/U=
X-Google-Smtp-Source: 
 AGHT+IGhHbB9nQZa3dl2ypP5P7iRoqd9R0DRQQZd2tNZ0GbGcx55BSER33OO93H3b6vSxZbrM9UetLF/13tNm8HL+aw=
X-Received: by 2002:a05:651c:230d:b0:30c:1308:1333 with SMTP id
 38308e7fff4ca-30d7e230ed9mr57403201fa.13.1742980179382; Wed, 26 Mar 2025
 02:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325184601.10990-1-lkml@antheas.dev>
 <20250325184601.10990-10-lkml@antheas.dev>
 <f04e6a59-cb72-9ca9-2c98-85702b6194fa@linux.intel.com>
In-Reply-To: <f04e6a59-cb72-9ca9-2c98-85702b6194fa@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 26 Mar 2025 10:09:27 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF8PZczpqOFm3ONDdJTVCgcWOZ8mXrASbmiAXUhQvOhdg@mail.gmail.com>
X-Gm-Features: AQ5f1JofAUJskmm4ktV3rSUi2Ry3vFm3ingK2ts5rc-tcu_4Q5hpPTsWbG0PDSk
Message-ID: 
 <CAGwozwF8PZczpqOFm3ONDdJTVCgcWOZ8mXrASbmiAXUhQvOhdg@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] HID: asus: add basic RGB support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <174298018119.10401.9322238334048763819@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Wed, 26 Mar 2025 at 09:54, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 25 Mar 2025, Antheas Kapenekakis wrote:
>
> > Adds basic RGB support to hid-asus through multi-index. The interface
> > works quite well, but has not gone through much stability testing.
> > Applied on demand, if userspace does not touch the RGB sysfs, not
> > even initialization is done. Ensuring compatibility with existing
> > userspace programs.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/Kconfig    |   1 +
> >  drivers/hid/hid-asus.c | 171 +++++++++++++++++++++++++++++++++++++----
> >  2 files changed, 156 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > index dfc245867a46a..d324c6ab997de 100644
> > --- a/drivers/hid/Kconfig
> > +++ b/drivers/hid/Kconfig
> > @@ -151,6 +151,7 @@ config HID_APPLEIR
> >  config HID_ASUS
> >       tristate "Asus"
> >       depends on USB_HID
> > +     depends on LEDS_CLASS_MULTICOLOR
> >       depends on LEDS_CLASS
> >       depends on ASUS_WMI || ASUS_WMI=3Dn
> >       select POWER_SUPPLY
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index a4d1160460935..c135c9ff87b74 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -23,6 +23,7 @@
> >  /*
> >   */
> >
> > +#include <linux/array_size.h>
> >  #include <linux/dmi.h>
> >  #include <linux/hid.h>
> >  #include <linux/module.h>
> > @@ -30,6 +31,7 @@
> >  #include <linux/input/mt.h>
> >  #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf =
check */
> >  #include <linux/power_supply.h>
> > +#include <linux/led-class-multicolor.h>
> >  #include <linux/leds.h>
> >
> >  #include "hid-ids.h"
> > @@ -52,6 +54,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >  #define FEATURE_KBD_REPORT_SIZE 64
> >  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> >  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> > +#define FEATURE_KBD_LED_REPORT_SIZE 7
> >
> >  #define SUPPORT_KBD_BACKLIGHT BIT(0)
> >
> > @@ -86,6 +89,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
> >  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >  #define QUIRK_HANDLE_GENERIC         BIT(13)
> > +#define QUIRK_ROG_NKEY_RGB           BIT(14)
> >
> >  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPOR=
T | \
> >                                                QUIRK_NO_INIT_REPORTS | =
\
> > @@ -98,9 +102,15 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad"=
);
> >
> >  struct asus_kbd_leds {
> >       struct asus_hid_listener listener;
> > +     struct led_classdev_mc mc_led;
> > +     struct mc_subled subled_info[3];
> >       struct hid_device *hdev;
> >       struct work_struct work;
> >       unsigned int brightness;
> > +     u8 rgb_colors[3];
> > +     bool rgb_init;
> > +     bool rgb_set;
> > +     bool rgb_registered;
> >       spinlock_t lock;
> >       bool removed;
> >  };
> > @@ -501,23 +511,67 @@ static void asus_schedule_work(struct asus_kbd_le=
ds *led)
> >       spin_unlock_irqrestore(&led->lock, flags);
> >  }
> >
> > -static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
> > +static void do_asus_kbd_backlight_set(struct asus_kbd_leds *led, int b=
rightness)
> > +{
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&led->lock, flags);
> > +     led->brightness =3D brightness;
> > +     spin_unlock_irqrestore(&led->lock, flags);
> > +
> > +     asus_schedule_work(led);
> > +}
> > +
> > +static void asus_kbd_listener_set(struct asus_hid_listener *listener,
> >                                  int brightness)
> >  {
> >       struct asus_kbd_leds *led =3D container_of(listener, struct asus_=
kbd_leds,
> >                                                listener);
> > +     do_asus_kbd_backlight_set(led, brightness);
> > +     if (led->rgb_registered) {
> > +             led->mc_led.led_cdev.brightness =3D brightness;
> > +             led_classdev_notify_brightness_hw_changed(&led->mc_led.le=
d_cdev,
> > +                                                       brightness);
> > +     }
> > +}
> > +
> > +static void asus_kbd_brightness_set(struct led_classdev *led_cdev,
> > +                                 enum led_brightness brightness)
> > +{
> > +     struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(led_cdev);
> > +     struct asus_kbd_leds *led =3D container_of(mc_cdev, struct asus_k=
bd_leds,
> > +                                              mc_led);
> >       unsigned long flags;
> >
> >       spin_lock_irqsave(&led->lock, flags);
> > -     led->brightness =3D brightness;
> > +     led->rgb_colors[0] =3D mc_cdev->subled_info[0].intensity;
> > +     led->rgb_colors[1] =3D mc_cdev->subled_info[1].intensity;
> > +     led->rgb_colors[2] =3D mc_cdev->subled_info[2].intensity;
> > +     led->rgb_set =3D true;
> >       spin_unlock_irqrestore(&led->lock, flags);
> >
> > -     asus_schedule_work(led);
> > +     do_asus_kbd_backlight_set(led, brightness);
> > +}
> > +
> > +static enum led_brightness asus_kbd_brightness_get(struct led_classdev=
 *led_cdev)
> > +{
> > +     struct led_classdev_mc *mc_led;
> > +     struct asus_kbd_leds *led;
> > +     enum led_brightness brightness;
> > +     unsigned long flags;
> > +
> > +     mc_led =3D lcdev_to_mccdev(led_cdev);
> > +     led =3D container_of(mc_led, struct asus_kbd_leds, mc_led);
> > +
> > +     spin_lock_irqsave(&led->lock, flags);
> > +     brightness =3D led->brightness;
> > +     spin_unlock_irqrestore(&led->lock, flags);
> > +
> > +     return brightness;
> >  }
> >
> > -static void asus_kbd_backlight_work(struct work_struct *work)
> > +static void asus_kbd_backlight_work(struct asus_kbd_leds *led)
> >  {
> > -     struct asus_kbd_leds *led =3D container_of(work, struct asus_kbd_=
leds, work);
> >       u8 buf[] =3D { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
> >       int ret;
> >       unsigned long flags;
> > @@ -531,10 +585,68 @@ static void asus_kbd_backlight_work(struct work_s=
truct *work)
> >               hid_err(led->hdev, "Asus failed to set keyboard backlight=
: %d\n", ret);
> >  }
> >
> > +static void asus_kbd_rgb_work(struct asus_kbd_leds *led)
> > +{
> > +     u8 rgb_buf[][FEATURE_KBD_LED_REPORT_SIZE] =3D {
> > +             { FEATURE_KBD_LED_REPORT_ID1, 0xB3 }, /* set mode */
> > +             { FEATURE_KBD_LED_REPORT_ID1, 0xB5 }, /* apply mode */
> > +             { FEATURE_KBD_LED_REPORT_ID1, 0xB4 }, /* save to mem */
>
> Hmm, I don't know why I didn't notice this the last scan... Since you're
> anyway adding those comments to explain the literals (I assume), wouldn't
> it be simply better to add defines for 0xB* and forgo the comments.
>
> Usually when one adds any comment, it's always good to ask first oneself
> if things could be named such that the code itself explains itself. This
> leaves comments mostly for places where something really
> odd/tricky/complex occurs as the rest can be covered by simply naming
> better.

I guess I can turn them into FEATURE_KBD_LED_CMD_SETMODE etc.

> > +     };
> > +     unsigned long flags;
> > +     uint8_t colors[3];
> > +     bool rgb_init, rgb_set;
> > +     int ret;
> > +
> > +     spin_lock_irqsave(&led->lock, flags);
> > +     rgb_init =3D led->rgb_init;
> > +     rgb_set =3D led->rgb_set;
> > +     led->rgb_set =3D false;
> > +     colors[0] =3D led->rgb_colors[0];
> > +     colors[1] =3D led->rgb_colors[1];
> > +     colors[2] =3D led->rgb_colors[2];
> > +     spin_unlock_irqrestore(&led->lock, flags);
> > +
> > +     if (!rgb_set)
> > +             return;
> > +
> > +     if (rgb_init) {
> > +             ret =3D asus_kbd_init(led->hdev, FEATURE_KBD_LED_REPORT_I=
D1);
> > +             if (ret < 0) {
> > +                     hid_err(led->hdev, "Asus failed to init RGB: %d\n=
", ret);
> > +                     return;
> > +             }
> > +             spin_lock_irqsave(&led->lock, flags);
> > +             led->rgb_init =3D false;
> > +             spin_unlock_irqrestore(&led->lock, flags);
> > +     }
> > +
> > +     /* Protocol is: 54b3 zone (0=3Dall) mode (0=3Dsolid) RGB */
>
> BTW, this comment is very cryptic to me and I'm unable to connect it with
> the code below. My only guess is that each non-parenthesized word is
> explaining one index but things don't add up given what rgb_buf[0][0] and
> [0][1] have.

Maybe i fatfingered 54 and it should be 5a. Protocol is 54b3 zone mode
R G B. So colors go to indexes 4, 5, 6

> > +     rgb_buf[0][4] =3D colors[0];
> > +     rgb_buf[0][5] =3D colors[1];
> > +     rgb_buf[0][6] =3D colors[2];
> > +
> > +     for (size_t i =3D 0; i < ARRAY_SIZE(rgb_buf); i++) {
> > +             ret =3D asus_kbd_set_report(led->hdev, rgb_buf[i], sizeof=
(rgb_buf[i]));
> > +             if (ret < 0) {
> > +                     hid_err(led->hdev, "Asus failed to set RGB: %d\n"=
, ret);
> > +                     return;
> > +             }
> > +     }
> > +}
> > +
> > +static void asus_kbd_work(struct work_struct *work)
> > +{
> > +     struct asus_kbd_leds *led =3D container_of(work, struct asus_kbd_=
leds,
> > +                                              work);
> > +     asus_kbd_backlight_work(led);
> > +     asus_kbd_rgb_work(led);
> > +}
> > +
> >  static int asus_kbd_register_leds(struct hid_device *hdev)
> >  {
> >       struct asus_drvdata *drvdata =3D hid_get_drvdata(hdev);
> >       unsigned char kbd_func;
> > +     struct asus_kbd_leds *leds;
> >       int ret;
> >
> >       ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > @@ -562,20 +674,47 @@ static int asus_kbd_register_leds(struct hid_devi=
ce *hdev)
> >       if (!drvdata->kbd_backlight)
> >               return -ENOMEM;
> >
> > -     drvdata->kbd_backlight->removed =3D false;
> > -     drvdata->kbd_backlight->brightness =3D 0;
> > -     drvdata->kbd_backlight->hdev =3D hdev;
> > -     drvdata->kbd_backlight->listener.brightness_set =3D asus_kbd_back=
light_set;
> > -     INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work)=
;
> > +     leds =3D drvdata->kbd_backlight;
> > +     leds->removed =3D false;
> > +     leds->brightness =3D ASUS_EV_MAX_BRIGHTNESS;
> > +     leds->hdev =3D hdev;
> > +     leds->listener.brightness_set =3D asus_kbd_listener_set;
> > +
> > +     leds->rgb_colors[0] =3D 0;
> > +     leds->rgb_colors[1] =3D 0;
> > +     leds->rgb_colors[2] =3D 0;
> > +     leds->rgb_init =3D true;
> > +     leds->rgb_set =3D false;
> > +     leds->mc_led.led_cdev.name =3D devm_kasprintf(&hdev->dev, GFP_KER=
NEL,
> > +                                     "asus-%s:rgb:peripheral",
> > +                                     strlen(hdev->uniq) ?
> > +                                     hdev->uniq : dev_name(&hdev->dev)=
);
> > +     leds->mc_led.led_cdev.flags =3D LED_BRIGHT_HW_CHANGED;
> > +     leds->mc_led.led_cdev.max_brightness =3D ASUS_EV_MAX_BRIGHTNESS;
> > +     leds->mc_led.led_cdev.brightness_set =3D asus_kbd_brightness_set;
> > +     leds->mc_led.led_cdev.brightness_get =3D asus_kbd_brightness_get;
> > +     leds->mc_led.subled_info =3D leds->subled_info;
> > +     leds->mc_led.num_colors =3D ARRAY_SIZE(leds->subled_info);
> > +     leds->subled_info[0].color_index =3D LED_COLOR_ID_RED;
> > +     leds->subled_info[1].color_index =3D LED_COLOR_ID_GREEN;
> > +     leds->subled_info[2].color_index =3D LED_COLOR_ID_BLUE;
> > +
> > +     INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_work);
> >       spin_lock_init(&drvdata->kbd_backlight->lock);
> >
> >       ret =3D asus_hid_register_listener(&drvdata->kbd_backlight->liste=
ner);
> > -     if (ret < 0) {
> > -             /* No need to have this still around */
> > -             devm_kfree(&hdev->dev, drvdata->kbd_backlight);
> > +     /* Asus-wmi might not be accessible so this is not fatal. */
> > +     if (!ret)
> > +             hid_warn(hdev, "Asus-wmi brightness listener not register=
ed\n");
>
> Is the condition correct way around given the message?

You are right.

> Please also note that you don't need to send an update every day or so
> after minor comments like this. We're in merge window currently which
> means I likely won't be applying any next material until -rc1 has been
> released.

If this is 6.16 material I am happy to put a pause on this for the
next 1-3 weeks.

Antheas

> > +     if (drvdata->quirks & QUIRK_ROG_NKEY_RGB) {
> > +             ret =3D devm_led_classdev_multicolor_register(&hdev->dev,=
 &leds->mc_led);
> > +             if (!ret)
> > +                     leds->rgb_registered =3D true;
> > +             return ret;
> >       }
> >
> > -     return ret;
> > +     return 0;
> >  }
> >
> >  /*
> > @@ -1282,7 +1421,7 @@ static const struct hid_device_id asus_devices[] =
=3D {
> >         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >           USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> > -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_N=
KEY_RGB },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
> >         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > @@ -1311,7 +1450,7 @@ static const struct hid_device_id asus_devices[] =
=3D {
> >        */
> >       { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> >               USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLI=
O),
> > -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_N=
KEY_RGB },
> >       { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> >               USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBO=
ARD) },
> >       { }
> >
>
> --
>  i.
>

