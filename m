Return-Path: <linux-input+bounces-9244-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0969A119B1
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 07:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84B243A4898
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2025 06:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8C7232452;
	Wed, 15 Jan 2025 06:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MuslxO4n"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EDF22F84E
	for <linux-input@vger.kernel.org>; Wed, 15 Jan 2025 06:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736922794; cv=none; b=abQ5E3knK8eUXBtUN+5oty0YwFCJQZ+NTn4o9Wu/+k3SWZzAOJh75z27O2I/ijLqeRymL0y2OZG73ZyA2BK9Okvv9QUBe08Zer8m0/BZ7EY1km5gxCozMPwFu+A4F/mOf/UW9fQxIdlmIy2XnQGA1ldP5kRpuqQx9qv7B9D7Pgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736922794; c=relaxed/simple;
	bh=5PCyEcmKUEAMskJyuElo0yEmaLEieM5cgWotJjIjnrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EsCgLhIaSidAr7BSvR4WYgjOxmvsRFnwuBbgjnhZQZ24EGMjmMrloYHQw+KygftKVM5S62LKF+LnJz1JHfRv5eX6NZRKXEkX0EJNagadnlh0ps118r3SAN1IKW6u6buo8U+1IY4z/UAq9oWFv5EydyQj104HZhtynIvT0jOIvZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MuslxO4n; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736922790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ssNC5m5+meFLOg1lqMl2aX46eQMwCqtk5xYL2u0PtPg=;
	b=MuslxO4nYeT44Lc04/ZmFW3RjTAUapqm6fqj5tMhwVWIP8rSn1X0KdPbvE2ElYKErPY8hw
	RIsNXqJPfIuLhtdOIbLuw4bmyc6s8kOM9PFiDB9TTOgI9C5KsgYk5+csG/O4CoRw3EO38M
	oJaL65B/55lUx9mQtxyFqDF+QvIezRs=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-EEJUal3nOyeCcVMHNVkHUg-1; Wed, 15 Jan 2025 01:33:09 -0500
X-MC-Unique: EEJUal3nOyeCcVMHNVkHUg-1
X-Mimecast-MFC-AGG-ID: EEJUal3nOyeCcVMHNVkHUg
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-29e8124e922so6697373fac.2
        for <linux-input@vger.kernel.org>; Tue, 14 Jan 2025 22:33:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736922788; x=1737527588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssNC5m5+meFLOg1lqMl2aX46eQMwCqtk5xYL2u0PtPg=;
        b=EQy+//wIEJ2mu6CXmRYHbViE7ZvU4GjmVD6H/8whJ7marlL/LOS7KuEpHvbtE7Kqhr
         pSbEWX+Yj/5dzdW6zwvIRlxKjknL6RwiJCh9Vi7s0f8tIGrPRUYr+9eMcEEfyarWKdey
         busF7Rgi2XtICTBC91toAbtZ8Q549+tF/aWjDchZeXhgekdNbd7iS6i21AVcdDvyStIu
         mzAqUNLNfNv1JgsWLNpuwyqEj+bCesZIuRtXUUitPwCc3jS2AC28efHs8FPRYTU7UP7u
         1r5rIm958lQkmaWpqk64GfIft2dbgWYgas6kG5k/G62FQt9z3JuV9mGnKgMF4Lrp8vC8
         lYuA==
X-Forwarded-Encrypted: i=1; AJvYcCU7H40iUBbldarBKEYM5nomHhL/S9Y8jfOhzSQAjo+G4D54K/FiPTJyPj+euIiiGLVsNm1/fNgM7/ySwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl1kzNiCdJNAAWM7mUYMX+ug/p4J8U1bGRwFVa7LzFyQ5wYqrb
	CNHT+IHj8WsoviCI+U3TLrekN70GQ2rwIHmuwfl1w2k2fcXiDg3oz84sIoPXInjHJaipz9cY0Pg
	vAd0bN/69hX1msNLkJRphjOkzpBJ6zTvU/eTFRaWV8UJHrHaN13YTC2vFISDlzdiAFUxat7VX2e
	KejTPa6wS6Aa+m79FGyDlre+RV6W+0TrZn8t0=
X-Gm-Gg: ASbGncsT+GXBIpBRNA3kLmdWin6K0tATTdytkwipOKkn+twjh8GWjCbbBgnEAYv564v
	pCKRDA86DjLesuZBJbpXHMJeQrDri3vyywTm9nA==
X-Received: by 2002:a05:6870:1594:b0:296:7b65:2fac with SMTP id 586e51a60fabf-2aa06524095mr15162218fac.3.1736922788129;
        Tue, 14 Jan 2025 22:33:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBIPYGeibQSalxPo7YVO7S8khrST96nLiqLQcO5fJ0AzTzuAcTyxF8OMn0UGivqcpzU20X9Yde7UdvtJUICgw=
X-Received: by 2002:a05:6870:1594:b0:296:7b65:2fac with SMTP id
 586e51a60fabf-2aa06524095mr15162207fac.3.1736922787780; Tue, 14 Jan 2025
 22:33:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218085955.555316-1-hpa@redhat.com> <c39ac349-b1f3-4ab3-bbd7-98450fe4f7e9@redhat.com>
In-Reply-To: <c39ac349-b1f3-4ab3-bbd7-98450fe4f7e9@redhat.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 15 Jan 2025 14:32:56 +0800
X-Gm-Features: AbW1kvbfOWWiAndpnLXP_TE44OCQ3sLzdqJjuQZDZJQ7Ng6Pflz7s2g9HY-1Va8
Message-ID: <CAEth8oG6dfBjzH0W++eZHmJ_sK6T6Ym9YWYLSSQwVSJQJ-Jv7A@mail.gmail.com>
Subject: Re: [PATCH] hid: hid-lg-g15: Use standard multicolor LED API
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Thank you for reviewing this work.

On Thu, Jan 9, 2025 at 9:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi Kate,
>
> Thank you for your work on this.
>
> On 18-Dec-24 9:59 AM, Kate Hsuan wrote:
> > This work migrated the multicolor LED control to the standard multicolo=
r
> > LED API. Moreover, the codes related to the "color" attribute used to
> > set up the color previously were removed.
>
> I think the commit message needs some work, I would write for example:
>
> """
> Replace the custom "color" sysfs attribute with the standard multicolor
> LED API.
>
> This also removes the code for the custom "color" sysfs attribute,
> the "color" sysfs attribute was never documented so hopefully it is not
> used by anyone.
>
> If we get complaints we can re-add the "color" sysfs attribute as
> a compatibility wrapper setting the subleds intensity.
> """
I'll update it to the commit message.

>
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  drivers/hid/hid-lg-g15.c | 145 ++++++++++++++++++---------------------
> >  1 file changed, 68 insertions(+), 77 deletions(-)
> >
> > diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
> > index 53e7b90f9cc3..52159cecca27 100644
> > --- a/drivers/hid/hid-lg-g15.c
> > +++ b/drivers/hid/hid-lg-g15.c
> > @@ -8,11 +8,13 @@
> >  #include <linux/device.h>
> >  #include <linux/hid.h>
> >  #include <linux/leds.h>
> > +#include <linux/led-class-multicolor.h>
> >  #include <linux/module.h>
> >  #include <linux/random.h>
> >  #include <linux/sched.h>
> >  #include <linux/usb.h>
> >  #include <linux/wait.h>
> > +#include <dt-bindings/leds/common.h>
> >
> >  #include "hid-ids.h"
> >
> > @@ -44,7 +46,10 @@ enum lg_g15_led_type {
> >  };
> >
> >  struct lg_g15_led {
> > -     struct led_classdev cdev;
> > +     union {
> > +             struct led_classdev cdev;
> > +             struct led_classdev_mc mcdev;
> > +     };
> >       enum led_brightness brightness;
> >       enum lg_g15_led_type led;
>
> red, green and blue are now only used to store the initial color intensit=
ies
> I would add a comment for this:
>
>         /* Used to store initial color intensities before subled_info is =
allocated */

Okay

> >       u8 red, green, blue;
> > @@ -227,17 +232,18 @@ static int lg_g510_get_initial_led_brightness(str=
uct lg_g15_data *g15, int i)
> >  /* Must be called with g15->mutex locked */
> >  static int lg_g510_kbd_led_write(struct lg_g15_data *g15,
> >                                struct lg_g15_led *g15_led,
> > +                              struct mc_subled *subleds,
>
> The g15_led already gives you a pointer to the subleds, so I would
> drop this argument, leaving the function signature unchanged.
>
> >                                enum led_brightness brightness)
> >  {
>
> And then instead at a subleds helper variable here:
>
>         struct mc_subled *subleds =3D g15_led->mcdev.subled_info;
>
> >       int ret;
>
> I would do the led_mc_calc_color_components() call here instead of in
> lg_g510_kbd_led_set():
>
>         led_mc_calc_color_components(&g15_led->mcdev, brightness);
>
Okay. I'll remove this argument.

> >       g15->transfer_buf[0] =3D 5 + g15_led->led;
> >       g15->transfer_buf[1] =3D
> > -             DIV_ROUND_CLOSEST(g15_led->red * brightness, 255);
> > +             DIV_ROUND_CLOSEST(subleds[0].intensity * brightness, 255)=
;
>
> The reason to do this here, is because led_mc_calc_color_components()
> already does the scaling of intensity by brightness for you, see
> its code:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/leds/led-class-multicolor.c#n14
>
> So instead of using subleds[x].intensity, you should directly use
> subleds[i].brightness and drop the calculations, resulting in:
>
>         g15->transfer_buf[0] =3D 5 + g15_led->led;
>         g15->transfer_buf[1] =3D subleds[0].brightness;
>         g15->transfer_buf[2] =3D subleds[1].brightness;
>         g15->transfer_buf[3] =3D subleds[2].brightness;
>
Thank you for the information. led API already scales the intensity. :)

> >       ret =3D hid_hw_raw_request(g15->hdev,
> >                                LG_G510_FEATURE_BACKLIGHT_RGB + g15_led-=
>led,
> > @@ -258,9 +264,11 @@ static int lg_g510_kbd_led_write(struct lg_g15_dat=
a *g15,
> >  static int lg_g510_kbd_led_set(struct led_classdev *led_cdev,
> >                              enum led_brightness brightness)
> >  {
> > +     struct led_classdev_mc *mc =3D lcdev_to_mccdev(led_cdev);
> >       struct lg_g15_led *g15_led =3D
> >               container_of(led_cdev, struct lg_g15_led, cdev);
>
> This container_of() now is incorrect, this assumes that led_cdev points
> to the cdev part of the anonymous union in struct lg_g15_led, but for
> the g510_kbd_led handling the mcdev part of that union is now used.
>
> So the correct container_of() usage would be:
>
>         struct lg_g15_led *g15_led =3D
>                 container_of(mc, struct lg_g15_led, mcdev);
>
> please fix this.

Got it.

>
> (the old code happens to work because the led_cdev member of
> struct led_classdev_mc happens to be the first member)
>
> >       struct lg_g15_data *g15 =3D dev_get_drvdata(led_cdev->dev->parent=
);
> > +     struct mc_subled *subleds;
>
> With my proposal above to keep the lg_g510_kbd_led_write() function
> prototype unchanged the other changes to lg_g510_kbd_led_set() can
> be dropped.
>
> >       int ret;
> >
> >       /* Ignore LED off on unregister / keyboard unplug */
> > @@ -268,7 +276,11 @@ static int lg_g510_kbd_led_set(struct led_classdev=
 *led_cdev,
> >               return 0;
> >
> >       mutex_lock(&g15->mutex);
> > -     ret =3D lg_g510_kbd_led_write(g15, g15_led, brightness);
> > +
> > +     led_mc_calc_color_components(mc, brightness);
> > +     subleds =3D mc->subled_info;
> > +
> > +     ret =3D lg_g510_kbd_led_write(g15, g15_led, subleds, brightness);
> >       mutex_unlock(&g15->mutex);
> >
> >       return ret;
> > @@ -282,76 +294,15 @@ static enum led_brightness lg_g510_kbd_led_get(st=
ruct led_classdev *led_cdev)
> >       return g15_led->brightness;
> >  }
>
> You also need to update the container_of() in lg_g510_kbd_led_get(),
> so you get:
>
> static enum led_brightness lg_g510_kbd_led_get(struct led_classdev *led_c=
dev)
> {
>         struct led_classdev_mc *mc =3D lcdev_to_mccdev(led_cdev);
>         struct lg_g15_led *g15_led =3D
>                 container_of(mc, struct lg_g15_led, mcdev);
>
>         return g15_led->brightness;
> }

Okay
>
>
> > -static ssize_t color_store(struct device *dev, struct device_attribute=
 *attr,
> > -                        const char *buf, size_t count)
> > -{
> > -     struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > -     struct lg_g15_led *g15_led =3D
> > -             container_of(led_cdev, struct lg_g15_led, cdev);
> > -     struct lg_g15_data *g15 =3D dev_get_drvdata(led_cdev->dev->parent=
);
> > -     unsigned long value;
> > -     int ret;
> > -
> > -     if (count < 7 || (count =3D=3D 8 && buf[7] !=3D '\n') || count > =
8)
> > -             return -EINVAL;
> > -
> > -     if (buf[0] !=3D '#')
> > -             return -EINVAL;
> > -
> > -     ret =3D kstrtoul(buf + 1, 16, &value);
> > -     if (ret)
> > -             return ret;
> > -
> > -     mutex_lock(&g15->mutex);
> > -     g15_led->red   =3D (value & 0xff0000) >> 16;
> > -     g15_led->green =3D (value & 0x00ff00) >> 8;
> > -     g15_led->blue  =3D (value & 0x0000ff);
> > -     ret =3D lg_g510_kbd_led_write(g15, g15_led, g15_led->brightness);
> > -     mutex_unlock(&g15->mutex);
> > -
> > -     return (ret < 0) ? ret : count;
> > -}
> > -
> > -static ssize_t color_show(struct device *dev, struct device_attribute =
*attr,
> > -                       char *buf)
> > -{
> > -     struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > -     struct lg_g15_led *g15_led =3D
> > -             container_of(led_cdev, struct lg_g15_led, cdev);
> > -     struct lg_g15_data *g15 =3D dev_get_drvdata(led_cdev->dev->parent=
);
> > -     ssize_t ret;
> > -
> > -     mutex_lock(&g15->mutex);
> > -     ret =3D sprintf(buf, "#%02x%02x%02x\n",
> > -                   g15_led->red, g15_led->green, g15_led->blue);
> > -     mutex_unlock(&g15->mutex);
> > -
> > -     return ret;
> > -}
> > -
> > -static DEVICE_ATTR_RW(color);
> > -
> > -static struct attribute *lg_g510_kbd_led_attrs[] =3D {
> > -     &dev_attr_color.attr,
> > -     NULL,
> > -};
> > -
> > -static const struct attribute_group lg_g510_kbd_led_group =3D {
> > -     .attrs =3D lg_g510_kbd_led_attrs,
> > -};
> > -
> > -static const struct attribute_group *lg_g510_kbd_led_groups[] =3D {
> > -     &lg_g510_kbd_led_group,
> > -     NULL,
> > -};
> > -
> >  static void lg_g510_leds_sync_work(struct work_struct *work)
> >  {
> >       struct lg_g15_data *g15 =3D container_of(work, struct lg_g15_data=
, work);
> > +     struct led_classdev_mc *mc =3D &g15->leds[LG_G15_KBD_BRIGHTNESS].=
mcdev;
> > +     struct lg_g15_led *g15_led =3D &g15->leds[LG_G15_KBD_BRIGHTNESS];
> > +     struct mc_subled *subleds =3D mc->subled_info;
> >
> >       mutex_lock(&g15->mutex);
> > -     lg_g510_kbd_led_write(g15, &g15->leds[LG_G15_KBD_BRIGHTNESS],
> > -                           g15->leds[LG_G15_KBD_BRIGHTNESS].brightness=
);
> > +     lg_g510_kbd_led_write(g15, g15_led, subleds, g15_led->brightness)=
;
> >       mutex_unlock(&g15->mutex);
>
> With my proposal above to keep the lg_g510_kbd_led_write() function
> prototype unchanged all changes to lg_g510_leds_sync_work() can be droppe=
d.
>
Got it and I'll drop it.

>
> >  }
> >
> > @@ -667,8 +618,47 @@ static void lg_g15_input_close(struct input_dev *d=
ev)
> >       hid_hw_close(hdev);
> >  }
> >
> > +static void lg_g15_setup_led_rgb(struct lg_g15_data *g15, int index)
> > +{
> > +     int i;
> > +     struct mc_subled *subled_info;
> > +
> > +     g15->leds[index].mcdev.led_cdev.brightness_set_blocking =3D
> > +             lg_g510_kbd_led_set;
> > +     g15->leds[index].mcdev.led_cdev.brightness_get =3D
> > +             lg_g510_kbd_led_get;
> > +     g15->leds[index].mcdev.led_cdev.max_brightness =3D g15->leds[inde=
x].brightness;
>
> max_brightness should be 255, not the current brightness:
>
>         g15->leds[index].mcdev.led_cdev.max_brightness =3D 255;

Okay

>
> > +     g15->leds[index].mcdev.num_colors =3D 3;
> > +
> > +     subled_info =3D devm_kcalloc(&g15->hdev->dev, 3, sizeof(*subled_i=
nfo), GFP_KERNEL);
> > +     if (!subled_info)
> > +             return;
> > +
> > +     for (i =3D 0; i < 3; i++) {
> > +             switch (i + 1) {
> > +             case LED_COLOR_ID_RED:
> > +                     subled_info[i].color_index =3D LED_COLOR_ID_RED;
> > +                     subled_info[i].intensity =3D g15->leds[index].red=
;
> > +                     break;
> > +             case LED_COLOR_ID_GREEN:
> > +                     subled_info[i].color_index =3D LED_COLOR_ID_GREEN=
;
> > +                     subled_info[i].intensity =3D g15->leds[index].gre=
en;
> > +                     break;
> > +             case LED_COLOR_ID_BLUE:
> > +                     subled_info[i].color_index =3D LED_COLOR_ID_BLUE;
> > +                     subled_info[i].intensity =3D g15->leds[index].blu=
e;
> > +                     break;
> > +             }
> > +             subled_info[i].channel =3D i;
> > +             subled_info[i].intensity =3D 255;
>
> You are already setting subled_info[i].intensity to the correct value abo=
ve,
> which you are overriding here, so this line should be dropped.

Okay
>
>
> > +     }
> > +     g15->leds[index].mcdev.subled_info =3D subled_info;
> > +}
> > +
> >  static int lg_g15_register_led(struct lg_g15_data *g15, int i, const c=
har *name)
> >  {
> > +     int ret;
> > +
> >       g15->leds[i].led =3D i;
> >       g15->leds[i].cdev.name =3D name;
> >
> > @@ -685,6 +675,7 @@ static int lg_g15_register_led(struct lg_g15_data *=
g15, int i, const char *name)
> >               } else {
> >                       g15->leds[i].cdev.max_brightness =3D 1;
> >               }
> > +             ret =3D devm_led_classdev_register(&g15->hdev->dev, &g15-=
>leds[i].cdev);
> >               break;
> >       case LG_G510:
> >       case LG_G510_USB_AUDIO:
> > @@ -697,12 +688,11 @@ static int lg_g15_register_led(struct lg_g15_data=
 *g15, int i, const char *name)
> >                       g15->leds[i].cdev.name =3D "g15::power_on_backlig=
ht_val";
> >                       fallthrough;
> >               case LG_G15_KBD_BRIGHTNESS:
> > -                     g15->leds[i].cdev.brightness_set_blocking =3D
> > -                             lg_g510_kbd_led_set;
> > -                     g15->leds[i].cdev.brightness_get =3D
> > -                             lg_g510_kbd_led_get;
> > -                     g15->leds[i].cdev.max_brightness =3D 255;
> > -                     g15->leds[i].cdev.groups =3D lg_g510_kbd_led_grou=
ps;
> > +                     /* register multicolor */
> > +                     lg_g15_setup_led_rgb(g15, i);
> > +                     ret =3D devm_led_classdev_multicolor_register_ext=
(&g15->hdev->dev,
> > +                                                                     &=
g15->leds[i].mcdev,
> > +                                                                     N=
ULL);
> >                       break;
> >               default:
> >                       g15->leds[i].cdev.brightness_set_blocking =3D
> > @@ -710,11 +700,12 @@ static int lg_g15_register_led(struct lg_g15_data=
 *g15, int i, const char *name)
> >                       g15->leds[i].cdev.brightness_get =3D
> >                               lg_g510_mkey_led_get;
> >                       g15->leds[i].cdev.max_brightness =3D 1;
> > +                     ret =3D devm_led_classdev_register(&g15->hdev->de=
v, &g15->leds[i].cdev);
> >               }
> >               break;
> >       }
> >
> > -     return devm_led_classdev_register(&g15->hdev->dev, &g15->leds[i].=
cdev);
> > +     return ret;
> >  }
> >
> >  /* Common input device init code shared between keyboards and Z-10 spe=
aker handling */
>
> Regards,
>
> Hans
>
>
>

I'll propose a v2 patch to include the fixes mentioned above.

--=20
BR,
Kate


