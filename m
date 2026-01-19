Return-Path: <linux-input+bounces-17194-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C13AD3A6F1
	for <lists+linux-input@lfdr.de>; Mon, 19 Jan 2026 12:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2789030185EE
	for <lists+linux-input@lfdr.de>; Mon, 19 Jan 2026 11:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE0E313526;
	Mon, 19 Jan 2026 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="TZjTJWxL"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19213313272
	for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 11:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822497; cv=none; b=hc+p4og11SZYfBGNM8pV3XjaIwJSlPhHka4erEy+6UaTUTNj+xN/hDyRqfUX0aFNjbZnfP4+wv0XlLGXN7Jfozfl0lLExkSADywuOOT4si+tCb9an3iFJq8mRhqsbSd5kC/NLFttdZEDIsQRID0PHauM0/r1Av5VqtJ4ZJrB6G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822497; c=relaxed/simple;
	bh=cH4f2Q7EQH9zur7Usd58A7hfCQ9blNGrAJSm7FGnf8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S2/7Oo5oiliGgLZDwoM0hj+GzH3tgXWRCKKRGzEsW6F4SC0dNJhLZGkmKVbFMML5b7spEfS5JnNTMUMymwaWscBaN6Oug93rpk2VZRB7N9mTFYx/2Wx1jgh6JNSJlOKPNj+LwFOBvmjWw0mrcvWAe1iVJOJz1N/l0WpnYEpbtc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=TZjTJWxL; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id F1A46BC179
	for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 13:34:45 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 3E7C3BC17E
	for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 13:34:44 +0200 (EET)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 6F8D52025B2
	for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 13:34:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1768822483;
	bh=Z4Pi1sOHmhuepA1pWLEI/8HtOxcMi/6ODPNd7i5vzV4=;
	h=Received:From:Subject:To;
	b=TZjTJWxLfUWdXkfIRq6r5KIj/Iftil2Eov5APltinW5ynN880G2KLqmbv97Rn8E9v
	 29mwY3MUCx9FMjS0CNiyNDUIkPV1WsaCw3ek+uhQlJERc2aSEOTs/Vd1ox0u0v/z6L
	 nmtdujQ8ML2+PPhbhIGkO+ahZHZZGKbxOiYe4WcC1bZU3Jvv/v8sQ6JpLMR2ADFo73
	 wiZYwvYGMvPwVllYzen2sUjreCm8HrKeTJfCyRykTlm6QyLlDuy2dpeCs8sn1E249G
	 abBSyBBtvb0tR41DYnYJyI7VFnZ+ijnQvWTao3lJ59vjvzhLxQd0eRu2JUEiSN/lAY
	 1jPKct9hqudxQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-382fa0dc9f4so45770361fa.3
        for <linux-input@vger.kernel.org>;
 Mon, 19 Jan 2026 03:34:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVV9v0iucQIfOcdJsR4lgKlxJfZttzKvHWZmHX/ynj1d7uRmY+4Vg79PrWi3i9KpdlPZ3a2DXAXtQoeCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpk08ut4p8AJuS7MXS3wn4HtDD3JIY1CkRF7mWDqCw78ITY6eq
	zhaWQz6+mzJ/KBoprdSvohU0T1G8aWdGLV60MFYQ01WVysd7AnAM6S0tirccGwIWCBgnctEpVPl
	7hbgZXnPJivItkyI+z6BddGCcAr3og/Q=
X-Received: by 2002:a2e:b8c4:0:b0:383:246a:74ec with SMTP id
 38308e7fff4ca-3849d202cf1mr10117711fa.18.1768822482847; Mon, 19 Jan 2026
 03:34:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116133150.5606-1-lkml@antheas.dev>
 <20260116133150.5606-8-lkml@antheas.dev>
 <3354c446-3e1c-40c7-ac08-43b3ef630d91@linux.dev>
 <CAGwozwF0KaG0VJDJSPWfX8DVty-nZ+m8_ugDOk9wwHr+UbvYQA@mail.gmail.com>
 <2f7c8e80-274e-4cec-98bf-cd9cc49fb363@linux.dev>
 <CAGwozwEEd8+Gfrs=9zX2ES-tLpNQLmcWicRqHaWgd_UsCsHjPg@mail.gmail.com>
 <22651aa1-5677-4d76-8850-49e6a348a257@linux.dev>
 <73924a7a-ab91-a11d-313e-5f94f73f5e53@linux.intel.com>
In-Reply-To: <73924a7a-ab91-a11d-313e-5f94f73f5e53@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 19 Jan 2026 12:34:31 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF2HzEfWUtkEptdBBVdhob2OzP3EXGPA+qy9at5r5MXwA@mail.gmail.com>
X-Gm-Features: AZwV_QicXCjPQgf4IArPkHRBbC5sXE8Ouo-n9oxdnhDNzsukEBqVu6mUhcnt3Gk
Message-ID: 
 <CAGwozwF2HzEfWUtkEptdBBVdhob2OzP3EXGPA+qy9at5r5MXwA@mail.gmail.com>
Subject: Re: [PATCH v11 07/11] platform/x86: asus-wmi: Add support for
 multiple kbd led handlers
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <denis.benato@linux.dev>,
 platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176882248374.555034.3003418779683205502@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 19 Jan 2026 at 10:53, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sat, 17 Jan 2026, Denis Benato wrote:
> > On 1/17/26 15:11, Antheas Kapenekakis wrote:
> > > On Sat, 17 Jan 2026 at 14:56, Denis Benato <denis.benato@linux.dev> w=
rote:
> > >>
> > >> On 1/17/26 14:49, Antheas Kapenekakis wrote:
> > >>> On Sat, 17 Jan 2026 at 14:16, Denis Benato <denis.benato@linux.dev>=
 wrote:
> > >>>> On 1/16/26 14:31, Antheas Kapenekakis wrote:
> > >>>>> Some devices, such as the Z13 have multiple Aura devices connecte=
d
> > >>>>> to them by USB. In addition, they might have a WMI interface for
> > >>>>> RGB. In Windows, Armoury Crate exposes a unified brightness slide=
r
> > >>>>> for all of them, with 3 brightness levels.
> > >>>>>
> > >>>>> Therefore, to be synergistic in Linux, and support existing tooli=
ng
> > >>>>> such as UPower, allow adding listeners to the RGB device of the W=
MI
> > >>>>> interface. If WMI does not exist, lazy initialize the interface.
> > >>>>>
> > >>>>> Since hid-asus and asus-wmi can both interact with the led object=
s
> > >>>>> including from an atomic context, protect the brightness access w=
ith a
> > >>>>> spinlock and update the values from a workqueue. Use this workque=
ue to
> > >>>>> also process WMI keyboard events, so they are handled asynchronou=
sly.
> > >>>>>
> > >>>>> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> > >>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > >>>>> ---
> > >>>>>  drivers/platform/x86/asus-wmi.c            | 183 +++++++++++++++=
+++---
> > >>>>>  include/linux/platform_data/x86/asus-wmi.h |  15 ++
> > >>>>>  2 files changed, 173 insertions(+), 25 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x=
86/asus-wmi.c
> > >>>>> index 4aec7ec69250..df2365efb2b8 100644
> > >>>>> --- a/drivers/platform/x86/asus-wmi.c
> > >>>>> +++ b/drivers/platform/x86/asus-wmi.c
> > >>>>> @@ -31,13 +31,13 @@
> > >>>>>  #include <linux/pci.h>
> > >>>>>  #include <linux/pci_hotplug.h>
> > >>>>>  #include <linux/platform_data/x86/asus-wmi.h>
> > >>>>> -#include <linux/platform_data/x86/asus-wmi-leds-ids.h>
> > >>>>>  #include <linux/platform_device.h>
> > >>>>>  #include <linux/platform_profile.h>
> > >>>>>  #include <linux/power_supply.h>
> > >>>>>  #include <linux/rfkill.h>
> > >>>>>  #include <linux/seq_file.h>
> > >>>>>  #include <linux/slab.h>
> > >>>>> +#include <linux/spinlock.h>
> > >>>>>  #include <linux/types.h>
> > >>>>>  #include <linux/units.h>
> > >>>>>
> > >>>>> @@ -256,6 +256,9 @@ struct asus_wmi {
> > >>>>>       int tpd_led_wk;
> > >>>>>       struct led_classdev kbd_led;
> > >>>>>       int kbd_led_wk;
> > >>>>> +     bool kbd_led_notify;
> > >>>>> +     bool kbd_led_avail;
> > >>>>> +     bool kbd_led_registered;
> > >>>>>       struct led_classdev lightbar_led;
> > >>>>>       int lightbar_led_wk;
> > >>>>>       struct led_classdev micmute_led;
> > >>>>> @@ -264,6 +267,7 @@ struct asus_wmi {
> > >>>>>       struct work_struct tpd_led_work;
> > >>>>>       struct work_struct wlan_led_work;
> > >>>>>       struct work_struct lightbar_led_work;
> > >>>>> +     struct work_struct kbd_led_work;
> > >>>>>
> > >>>>>       struct asus_rfkill wlan;
> > >>>>>       struct asus_rfkill bluetooth;
> > >>>>> @@ -1615,6 +1619,106 @@ static void asus_wmi_battery_exit(struct =
asus_wmi *asus)
> > >>>>>
> > >>>>>  /* LEDs ********************************************************=
***************/
> > >>>>>
> > >>>>> +struct asus_hid_ref {
> > >>>>> +     struct list_head listeners;
> > >>>>> +     struct asus_wmi *asus;
> > >>>>> +     /* Protects concurrent access from hid-asus and asus-wmi to=
 leds */
> > >>>>> +     spinlock_t lock;
> > >>>>> +};
> > >>>>> +
> > >>>>> +static struct asus_hid_ref asus_ref =3D {
> > >>>>> +     .listeners =3D LIST_HEAD_INIT(asus_ref.listeners),
> > >>>>> +     .asus =3D NULL,
> > >>>>> +     /*
> > >>>>> +      * Protects .asus, .asus.kbd_led_{wk,notify}, and .listener=
 refs. Other
> > >>>>> +      * asus variables are read-only after .asus is set.
> > >>>>> +      *
> > >>>>> +      * The led cdev device is not protected because it calls ba=
cklight_get
> > >>>>> +      * during initialization, which would result in a nested lo=
ck attempt.
> > >>>>> +      *
> > >>>>> +      * The led cdev is safe to access without a lock because if
> > >>>>> +      * kbd_led_avail is true it is initialized before .asus is =
set and never
> > >>>>> +      * changed until .asus is dropped. If kbd_led_avail is fals=
e, the led
> > >>>>> +      * cdev is registered by the workqueue, which is single-thr=
eaded and
> > >>>>> +      * cancelled before asus-wmi would access the led cdev to u=
nregister it.
> > >>>>> +      *
> > >>>>> +      * A spinlock is used, because the protected variables can =
be accessed
> > >>>>> +      * from an IRQ context from asus-hid.
> > >>>>> +      */
> > >>>>> +     .lock =3D __SPIN_LOCK_UNLOCKED(asus_ref.lock),
> > >>>>> +};
> > >>>>> +
> > >>>>> +/*
> > >>>>> + * Allows registering hid-asus listeners that want to be notifie=
d of
> > >>>>> + * keyboard backlight changes.
> > >>>>> + */
> > >>>>> +int asus_hid_register_listener(struct asus_hid_listener *bdev)
> > >>>>> +{
> > >>>>> +     struct asus_wmi *asus;
> > >>>>> +
> > >>>>> +     guard(spinlock_irqsave)(&asus_ref.lock);
> > >>>>> +     list_add_tail(&bdev->list, &asus_ref.listeners);
> > >>>>> +     asus =3D asus_ref.asus;
> > >>>>> +     if (asus)
> > >>>>> +             queue_work(asus->led_workqueue, &asus->kbd_led_work=
);
> > >>>>> +     return 0;
> > >>>>> +}
> > >>>>> +EXPORT_SYMBOL_GPL(asus_hid_register_listener);
> > >>>>> +
> > >>>>> +/*
> > >>>>> + * Allows unregistering hid-asus listeners that were added with
> > >>>>> + * asus_hid_register_listener().
> > >>>>> + */
> > >>>>> +void asus_hid_unregister_listener(struct asus_hid_listener *bdev=
)
> > >>>>> +{
> > >>>>> +     guard(spinlock_irqsave)(&asus_ref.lock);
> > >>>>> +     list_del(&bdev->list);
> > >>>>> +}
> > >>>>> +EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
> > >>>>> +
> > >>>>> +static void do_kbd_led_set(struct led_classdev *led_cdev, int va=
lue);
> > >>>>> +
> > >>>>> +static void kbd_led_update_all(struct work_struct *work)
> > >>>>> +{
> > >>>>> +     struct asus_wmi *asus;
> > >>>>> +     bool registered, notify;
> > >>>>> +     int ret, value;
> > >>>>> +
> > >>>>> +     asus =3D container_of(work, struct asus_wmi, kbd_led_work);
> > >>>>> +
> > >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> > >>>>> +             registered =3D asus->kbd_led_registered;
> > >>>>> +             value =3D asus->kbd_led_wk;
> > >>>>> +             notify =3D asus->kbd_led_notify;
> > >>>>> +     }
> > >>>>> +
> > >>>>> +     if (!registered) {
> > >>>>> +             /*
> > >>>>> +              * This workqueue runs under asus-wmi, which means =
probe has
> > >>>>> +              * completed and asus-wmi will keep running until i=
t finishes.
> > >>>>> +              * Therefore, we can safely register the LED withou=
t holding
> > >>>>> +              * a spinlock.
> > >>>>> +              */
> > >>>>> +             ret =3D devm_led_classdev_register(&asus->platform_=
device->dev,
> > >>>>> +                                              &asus->kbd_led);
> > >>>>> +             if (!ret) {
> > >>>>> +                     scoped_guard(spinlock_irqsave, &asus_ref.lo=
ck)
> > >>>>> +                             asus->kbd_led_registered =3D true;
> > >>>>> +             } else {
> > >>>>> +                     pr_warn("Failed to register keyboard backli=
ght LED: %d\n", ret);
> > >>>>> +                     return;
> > >>>>> +             }
> > >>>>> +     }
> > >>>>> +
> > >>>>> +     if (value >=3D 0)
> > >>>>> +             do_kbd_led_set(&asus->kbd_led, value);
> > >>>>> +     if (notify) {
> > >>>>> +             scoped_guard(spinlock_irqsave, &asus_ref.lock)
> > >>>>> +                     asus->kbd_led_notify =3D false;
> > >>>>> +             led_classdev_notify_brightness_hw_changed(&asus->kb=
d_led, value);
> > >>>>> +     }
> > >>>>> +}
> > >>>>> +
> > >>>>>  /*
> > >>>>>   * These functions actually update the LED's, and are called fro=
m a
> > >>>>>   * workqueue. By doing this as separate work rather than when th=
e LED
> > >>>>> @@ -1661,7 +1765,8 @@ static void kbd_led_update(struct asus_wmi =
*asus)
> > >>>>>  {
> > >>>>>       int ctrl_param =3D 0;
> > >>>>>
> > >>>>> -     ctrl_param =3D 0x80 | (asus->kbd_led_wk & 0x7F);
> > >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock)
> > >>>>> +             ctrl_param =3D 0x80 | (asus->kbd_led_wk & 0x7F);
> > >>>>>       asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_pa=
ram, NULL);
> > >>>>>  }
> > >>>>>
> > >>>>> @@ -1694,14 +1799,23 @@ static int kbd_led_read(struct asus_wmi *=
asus, int *level, int *env)
> > >>>>>
> > >>>>>  static void do_kbd_led_set(struct led_classdev *led_cdev, int va=
lue)
> > >>>>>  {
> > >>>>> +     struct asus_hid_listener *listener;
> > >>>>>       struct asus_wmi *asus;
> > >>>>>       int max_level;
> > >>>>>
> > >>>>>       asus =3D container_of(led_cdev, struct asus_wmi, kbd_led);
> > >>>>>       max_level =3D asus->kbd_led.max_brightness;
> > >>>>>
> > >>>>> -     asus->kbd_led_wk =3D clamp_val(value, 0, max_level);
> > >>>>> -     kbd_led_update(asus);
> > >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock)
> > >>>>> +             asus->kbd_led_wk =3D clamp_val(value, 0, max_level)=
;
> > >>>>> +
> > >>>>> +     if (asus->kbd_led_avail)
> > >>>>> +             kbd_led_update(asus);
> > >>>>> +
> > >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> > >>>>> +             list_for_each_entry(listener, &asus_ref.listeners, =
list)
> > >>>>> +                     listener->brightness_set(listener, asus->kb=
d_led_wk);
> > >>>>> +     }
> > >>>>>  }
> > >>>>>
> > >>>>>  static int kbd_led_set(struct led_classdev *led_cdev, enum led_b=
rightness value)
> > >>>>> @@ -1716,10 +1830,11 @@ static int kbd_led_set(struct led_classde=
v *led_cdev, enum led_brightness value)
> > >>>>>
> > >>>>>  static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_b=
rightness value)
> > >>>>>  {
> > >>>>> -     struct led_classdev *led_cdev =3D &asus->kbd_led;
> > >>>>> -
> > >>>>> -     do_kbd_led_set(led_cdev, value);
> > >>>>> -     led_classdev_notify_brightness_hw_changed(led_cdev, asus->k=
bd_led_wk);
> > >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> > >>>>> +             asus->kbd_led_wk =3D value;
> > >>>>> +             asus->kbd_led_notify =3D true;
> > >>>>> +     }
> > >>>>> +     queue_work(asus->led_workqueue, &asus->kbd_led_work);
> > >>>>>  }
> > >>>>>
> > >>>>>  static enum led_brightness kbd_led_get(struct led_classdev *led_=
cdev)
> > >>>>> @@ -1729,10 +1844,18 @@ static enum led_brightness kbd_led_get(st=
ruct led_classdev *led_cdev)
> > >>>>>
> > >>>>>       asus =3D container_of(led_cdev, struct asus_wmi, kbd_led);
> > >>>>>
> > >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> > >>>>> +             if (!asus->kbd_led_avail)
> > >>>>> +                     return asus->kbd_led_wk;
> > >>>>> +     }
> > >>>>> +
> > >>>>>       retval =3D kbd_led_read(asus, &value, NULL);
> > >>>>>       if (retval < 0)
> > >>>>>               return retval;
> > >>>>>
> > >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock)
> > >>>>> +             asus->kbd_led_wk =3D value;
> > >>>>> +
> > >>>>>       return value;
> > >>>>>  }
> > >>>>>
> > >>>>> @@ -1844,7 +1967,9 @@ static int camera_led_set(struct led_classd=
ev *led_cdev,
> > >>>>>
> > >>>>>  static void asus_wmi_led_exit(struct asus_wmi *asus)
> > >>>>>  {
> > >>>>> -     led_classdev_unregister(&asus->kbd_led);
> > >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock)
> > >>>>> +             asus_ref.asus =3D NULL;
> > >>>>> +
> > >>>>>       led_classdev_unregister(&asus->tpd_led);
> > >>>>>       led_classdev_unregister(&asus->wlan_led);
> > >>>>>       led_classdev_unregister(&asus->lightbar_led);
> > >>>>> @@ -1882,22 +2007,26 @@ static int asus_wmi_led_init(struct asus_=
wmi *asus)
> > >>>>>                       goto error;
> > >>>>>       }
> > >>>>>
> > >>>>> -     if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_syste=
m(asus_use_hid_led_dmi_ids)) {
> > >>>>> -             pr_info("using asus-wmi for asus::kbd_backlight\n")=
;
> > >>>>> -             asus->kbd_led_wk =3D led_val;
> > >>>>> -             asus->kbd_led.name =3D "asus::kbd_backlight";
> > >>>>> -             asus->kbd_led.flags =3D LED_BRIGHT_HW_CHANGED;
> > >>>>> -             asus->kbd_led.brightness_set_blocking =3D kbd_led_s=
et;
> > >>>>> -             asus->kbd_led.brightness_get =3D kbd_led_get;
> > >>>>> -             asus->kbd_led.max_brightness =3D 3;
> > >>>>> +     asus->kbd_led.name =3D "asus::kbd_backlight";
> > >>>>> +     asus->kbd_led.flags =3D LED_BRIGHT_HW_CHANGED;
> > >>>>> +     asus->kbd_led.brightness_set_blocking =3D kbd_led_set;
> > >>>>> +     asus->kbd_led.brightness_get =3D kbd_led_get;
> > >>>>> +     asus->kbd_led.max_brightness =3D 3;
> > >>>>> +     asus->kbd_led_avail =3D !kbd_led_read(asus, &led_val, NULL)=
;
> > >>>>> +     INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
> > >>>>>
> > >>>>> +     if (asus->kbd_led_avail) {
> > >>>>> +             asus->kbd_led_wk =3D led_val;
> > >>>>>               if (num_rgb_groups !=3D 0)
> > >>>>>                       asus->kbd_led.groups =3D kbd_rgb_mode_group=
s;
> > >>>>> +     } else {
> > >>>>> +             asus->kbd_led_wk =3D -1;
> > >>>>> +     }
> > >>>>>
> > >>>>> -             rv =3D led_classdev_register(&asus->platform_device=
->dev,
> > >>>>> -                                        &asus->kbd_led);
> > >>>>> -             if (rv)
> > >>>>> -                     goto error;
> > >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> > >>>>> +             asus_ref.asus =3D asus;
> > >>>>> +             if (asus->kbd_led_avail || !list_empty(&asus_ref.li=
steners))
> > >>>>> +                     queue_work(asus->led_workqueue, &asus->kbd_=
led_work);
> > >>>>>       }
> > >>>>>
> > >>>>>       if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_L=
ED)
> > >>>>> @@ -4372,6 +4501,7 @@ static int asus_wmi_get_event_code(union ac=
pi_object *obj)
> > >>>>>
> > >>>>>  static void asus_wmi_handle_event_code(int code, struct asus_wmi=
 *asus)
> > >>>>>  {
> > >>>>> +     enum led_brightness led_value;
> > >>>>>       unsigned int key_value =3D 1;
> > >>>>>       bool autorelease =3D 1;
> > >>>>>
> > >>>>> @@ -4388,19 +4518,22 @@ static void asus_wmi_handle_event_code(in=
t code, struct asus_wmi *asus)
> > >>>>>               return;
> > >>>>>       }
> > >>>>>
> > >>>>> +     scoped_guard(spinlock_irqsave, &asus_ref.lock)
> > >>>>> +             led_value =3D asus->kbd_led_wk;
> > >>>>> +
> > >>>>>       if (code =3D=3D NOTIFY_KBD_BRTUP) {
> > >>>>> -             kbd_led_set_by_kbd(asus, asus->kbd_led_wk + 1);
> > >>>>> +             kbd_led_set_by_kbd(asus, led_value + 1);
> > >>>>>               return;
> > >>>>>       }
> > >>>>>       if (code =3D=3D NOTIFY_KBD_BRTDWN) {
> > >>>>> -             kbd_led_set_by_kbd(asus, asus->kbd_led_wk - 1);
> > >>>>> +             kbd_led_set_by_kbd(asus, led_value - 1);
> > >>>>>               return;
> > >>>>>       }
> > >>>>>       if (code =3D=3D NOTIFY_KBD_BRTTOGGLE) {
> > >>>>> -             if (asus->kbd_led_wk =3D=3D asus->kbd_led.max_brigh=
tness)
> > >>>>> +             if (led_value =3D=3D asus->kbd_led.max_brightness)
> > >>>>>                       kbd_led_set_by_kbd(asus, 0);
> > >>>> This is the toggle leds button, right? I would expect that pressin=
g the toggle
> > >>>> button turns off leds if they are on and turns them on if they are=
 off.
> > >>>>
> > >>>> so if (led_value > 0) { .... }.
> > >>>>
> > >>>> I see the previous code was equivalent to yours but is that what w=
e want?
> > >>> It is common to do 0->1->2->3->0 for the toggle. This is what is
> > >>> currently done for WMI Asus keyboards and e.g., Thinkpads. This pat=
ch
> > >>> unifies the behavior for USB keyboards too.
> > >>>
> > >>> I would argue it is better, as you do not need to reach for a
> > >>> userspace slider to set a lower brightness.
> > >>>
> > >>> The current behavior of KDE is 0->3->0 and if the event goes to
> > >>> userspace this is what happens currently. Unless the keyboard
> > >>> reconnects, where brightness just stops working afterwards because
> > >>> upower only probes at boot (I have a follow patch to fix this for
> > >>> Duos).
> > >> Whatever goes for me if hid and wmi handles them the same,
> > >> especially if userspace does the same thing.
> > >>
> > >> In 11/11 you do:
> > >>
> > >> caseASUS_EV_BRTTOGGLE:
> > >> if(brightness >=3DASUS_EV_MAX_BRIGHTNESS)
> > >> brightness =3D0;
> > >> else
> > >> brightness +=3D1;
> > >> break;
> > >> }
> > >>
> > >> So perhaps here you should do
> > >>
> > >> if (led_value >=3D asus->kbd_led.max_brightness)
> > >>
> > >>
> > >> purely for consistency?
> > > If I reroll the series I will do it, otherwise you can do a followup
> >
> > The current version is functionally okay.
> >
> > I would only change the name of _LEGACY and see this series merged.
> >
> > Or I can do it after it has been merged together with this change,
> > whatever maintainers think it's best.
>
> In general, I'd prefer we address all known things right away. This is
> kind of same as we prefer not to do back-and-forth changes within a
> series. But since this is equivalent to existing code, it would be nice t=
o
> finally get this series merged so this particular thing can be addressed
> later.
>
> Also, having lots of back-and-forth emails over some small thing usually
> consumes considerable amount of time from multiple people who have to
> read all the discussion through (including me), so if a review request is
> not unreasonable, it often would be the path of least resistance and leas=
t
> burdensome to just act upon the feedback instead of arguing whether it ca=
n
> be delayed.

Hi,
I agree. As for the name, my reasoning for legacy is that this init
only affects legacy devices (pre 2022) as far as I know (some devices
might refuse RGB commands without an ID1 init, but this driver does
not provide RGB currently). Denis has a (modern) device with one of
the affected PIDs, but he did not test if his device malfunctions or
if it does in which way. He also did not suggest an alternative name

So I am stuck from my side.

Best,
Antheas

> --
>  i.
>
>


