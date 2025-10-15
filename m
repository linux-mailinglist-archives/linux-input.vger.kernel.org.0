Return-Path: <linux-input+bounces-15507-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEFDBDF76B
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 17:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C40B919C0458
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 15:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EC232ED4E;
	Wed, 15 Oct 2025 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ddYFpOlp"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169242DECDE
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760543163; cv=none; b=YSbCRfDXFdPLXrsMLSDMaB4l31eubLlgHlmAfSBt7Vb6TZOXAUaX0xZztnphcCQd0aGHyH3IcoNGAtL6fOI2gA2fBlOakio4qn+hq1KJsFaXhciMjmnjIfGuuz8sMY0kSm6tRqz8kYbIUhSEYa9K+C+FVb3C5lL3rZejjmhIRAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760543163; c=relaxed/simple;
	bh=oXGz/pdMtnBuTW5Bt6KSUWxdlsAPJi+fLnNWzYruH4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+exzdiUOTgOHO0Sj9g9jO2nCLHlpdAqoe1/rmd7MypTnuLl9jw3q0+AzvB9h8vSeSP+DBgNYsWJ49HmIfZf85LA1JliCjViPU94P+CN6CcctYojGYIUf9zZuE7HZbZV68fJUdav8oRV7GrDwBJWMu5l6badwPN1WXryuQQyHKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ddYFpOlp; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 3C84BC7715
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 18:45:59 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 214ACC7635
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 18:45:58 +0300 (EEST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 5B1021FFE16
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 18:45:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760543157;
	bh=cJzUdAFSrT1epRSZeZxLIv7x0TNLJr23sf2Ve0lI0MA=;
	h=Received:From:Subject:To;
	b=ddYFpOlpBTxaOiILAe7yabTQWPgjGWOuERyzxuTgQr0cAcdNUstaoIbS9u/J3Pl5T
	 ftU8fmygs5BhC8FS0ZkLov51x8djCvWcJnKMyYQrr3e6C8bqCGULGV0PMx0Gy6dawz
	 IqdyTaPqwMyZzC+UWxBuFV70UwNKidN6IF3uWdwm79vkjZ2liKR/mN//9NZrTPgisz
	 1m7cInoHpj02XbpeoXF8BiDFUYaaq+lbwJ74Jpdk1Iy690dbJ1hSUwnPmy+8dbnYpN
	 gG+nF3wZ66ntrHgDXqPY5RI1ZPMeNcCKEAOfWqkgWI+gq3BgZoopuJWqezMqdWS7bg
	 FRS5ehkypa/wA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.175) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f175.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-36639c30bb7so46925001fa.3
        for <linux-input@vger.kernel.org>;
 Wed, 15 Oct 2025 08:45:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUAv1xibAW0wSAMYJAmh0RIIuJ8W8uhttrEEjKOJMxPYpiF2mnMS+y49GtV025NsjUwUF9CAiX/l/7gww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFAB3bNOSOACHsfZcngxv6KX7Dc2Faop8jarnuQL/0Sli9723b
	4F+uNdnwcFpCyIoIA9dCf8d0TmxxKWBMW2TNcQljHICImo0iSXsmgI7CSW05BRL2IeCjEM8vlZd
	BKUksjlTGEsjoW5hxZov5hDTzmkPYlVQ=
X-Google-Smtp-Source: 
 AGHT+IHitjmkTtP5C9XUdXZ0cvQtc95pkXCAVcw7VNjwBep52z7ZaHmSMqUWro028Q7nZeXdx7lP3ZLOQ9xOsCj6U5I=
X-Received: by 2002:a2e:a9ac:0:b0:372:80ac:a33a with SMTP id
 38308e7fff4ca-37609e604b8mr87314511fa.28.1760543156831; Wed, 15 Oct 2025
 08:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013201535.6737-1-lkml@antheas.dev>
 <20251013201535.6737-4-lkml@antheas.dev>
 <cf0ca840-6e0d-2d99-cb23-eabf0ac5263b@linux.intel.com>
In-Reply-To: <cf0ca840-6e0d-2d99-cb23-eabf0ac5263b@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 15 Oct 2025 17:45:45 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFBQ4DWS5s-La5f-6H=ZQvQFjU3=7U2RiJStGxO1sM+bQ@mail.gmail.com>
X-Gm-Features: AS18NWBVetYnX8geidmIlrkiwWArRFkvhUq-tMDFG1TQJPCQgVSuEqOrihAq2aI
Message-ID: 
 <CAGwozwFBQ4DWS5s-La5f-6H=ZQvQFjU3=7U2RiJStGxO1sM+bQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] platform/x86: asus-wmi: Add support for multiple
 kbd RGB handlers
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176054315759.2589137.3752027857337960209@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 15 Oct 2025 at 13:59, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 13 Oct 2025, Antheas Kapenekakis wrote:
>
> > Some devices, such as the Z13 have multiple AURA devices connected
> > to them by USB. In addition, they might have a WMI interface for
> > RGB. In Windows, Armoury Crate exposes a unified brightness slider
> > for all of them, with 3 brightness levels.
> >
> > Therefore, to be synergistic in Linux, and support existing tooling
> > such as UPower, allow adding listeners to the RGB device of the WMI
> > interface. If WMI does not exist, lazy initialize the interface.
> >
> > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > Tested-by: Luke D. Jones <luke@ljones.dev>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/platform/x86/asus-wmi.c            | 118 ++++++++++++++++++---
> >  include/linux/platform_data/x86/asus-wmi.h |  16 +++
> >  2 files changed, 121 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asu=
s-wmi.c
> > index e72a2b5d158e..a2a7cd61fd59 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -258,6 +258,8 @@ struct asus_wmi {
> >       int tpd_led_wk;
> >       struct led_classdev kbd_led;
> >       int kbd_led_wk;
> > +     bool kbd_led_avail;
> > +     bool kbd_led_registered;
> >       struct led_classdev lightbar_led;
> >       int lightbar_led_wk;
> >       struct led_classdev micmute_led;
> > @@ -1530,6 +1532,53 @@ static void asus_wmi_battery_exit(struct asus_wm=
i *asus)
> >
> >  /* LEDs **************************************************************=
*********/
> >
> > +struct asus_hid_ref {
> > +     struct list_head listeners;
> > +     struct asus_wmi *asus;
> > +     spinlock_t lock;
>
> Please always document what a lock protects.
>
> I started wonder why it needs to be spinlock?
>
> It would seem rwsem is more natural for it as write is only needed at
> probe/remove time (if there's no good reason for using a spinlock).
>
> You're also missing include.

I went through the comments. Thanks. The reason that it is a spinlock
is that both hid-asus and asus-wmi interact with the primitives to
register and unregister listeners, either of which can prompt the
creation of the led device which has to be atomic. And they do so from
IRQs too.

Perhaps the driver could be refactored to use rwsem, I am not sure.

The fixed version can be found here[1]. I will give it 1-2 more days
in case someone else wants to chime in and resend.

Antheas

[1] https://github.com/bazzite-org/patchwork/commits/asusrgb/

> > +};
> > +
> > +struct asus_hid_ref asus_ref =3D {
>
> Should be static ?
>
> > +     .listeners =3D LIST_HEAD_INIT(asus_ref.listeners),
> > +     .asus =3D NULL,
> > +     .lock =3D __SPIN_LOCK_UNLOCKED(asus_ref.lock),
> > +};
> > +
> > +int asus_hid_register_listener(struct asus_hid_listener *bdev)
> > +{
> > +     unsigned long flags;
> > +     int ret =3D 0;
> > +
> > +     spin_lock_irqsave(&asus_ref.lock, flags);
> > +     list_add_tail(&bdev->list, &asus_ref.listeners);
> > +     if (asus_ref.asus) {
> > +             if (asus_ref.asus->kbd_led_registered && asus_ref.asus->k=
bd_led_wk >=3D 0)
> > +                     bdev->brightness_set(bdev, asus_ref.asus->kbd_led=
_wk);
> > +
> > +             if (!asus_ref.asus->kbd_led_registered) {
> > +                     ret =3D led_classdev_register(
> > +                             &asus_ref.asus->platform_device->dev,
> > +                             &asus_ref.asus->kbd_led);
> > +                     if (!ret)
> > +                             asus_ref.asus->kbd_led_registered =3D tru=
e;
>
> I suggest you use guard() for the spinlock and return early where possibl=
e.
>
> With guard() in use, you can do normal error handling here with return re=
t
> immediately.
>
> Please also add a local var for asus_ref.asus.
>
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
> > @@ -1609,6 +1658,7 @@ static int kbd_led_read(struct asus_wmi *asus, in=
t *level, int *env)
> >
> >  static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
> >  {
> > +     struct asus_hid_listener *listener;
> >       struct asus_wmi *asus;
> >       int max_level;
> >
> > @@ -1616,25 +1666,39 @@ static void do_kbd_led_set(struct led_classdev =
*led_cdev, int value)
> >       max_level =3D asus->kbd_led.max_brightness;
> >
> >       asus->kbd_led_wk =3D clamp_val(value, 0, max_level);
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
> >  static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightn=
ess value)
> >  {
> > -     struct led_classdev *led_cdev =3D &asus->kbd_led;
> > +     struct led_classdev *led_cdev;
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&asus_ref.lock, flags);
> > +     led_cdev =3D &asus->kbd_led;
> >
>
> I'd remove the empty line from the critical section.
>
> I think you should mention the locking in the changelog too as it clearly
> impacts not only the new code.
>
> >       do_kbd_led_set(led_cdev, value);
> >       led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led=
_wk);
> > +     spin_unlock_irqrestore(&asus_ref.lock, flags);
> >  }
> >
> >  static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
> > @@ -1644,6 +1708,9 @@ static enum led_brightness kbd_led_get(struct led=
_classdev *led_cdev)
> >
> >       asus =3D container_of(led_cdev, struct asus_wmi, kbd_led);
> >
> > +     if (!asus->kbd_led_avail)
> > +             return asus->kbd_led_wk;
> > +
> >       retval =3D kbd_led_read(asus, &value, NULL);
> >       if (retval < 0)
> >               return retval;
> > @@ -1759,7 +1826,15 @@ static int camera_led_set(struct led_classdev *l=
ed_cdev,
> >
> >  static void asus_wmi_led_exit(struct asus_wmi *asus)
> >  {
> > -     led_classdev_unregister(&asus->kbd_led);
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&asus_ref.lock, flags);
> > +     asus_ref.asus =3D NULL;
> > +     spin_unlock_irqrestore(&asus_ref.lock, flags);
> > +
> > +     if (asus->kbd_led_registered)
> > +             led_classdev_unregister(&asus->kbd_led);
> > +
> >       led_classdev_unregister(&asus->tpd_led);
> >       led_classdev_unregister(&asus->wlan_led);
> >       led_classdev_unregister(&asus->lightbar_led);
> > @@ -1773,6 +1848,8 @@ static void asus_wmi_led_exit(struct asus_wmi *as=
us)
> >  static int asus_wmi_led_init(struct asus_wmi *asus)
> >  {
> >       int rv =3D 0, num_rgb_groups =3D 0, led_val;
> > +     struct asus_hid_listener *listener;
> > +     unsigned long flags;
> >
> >       if (asus->kbd_rgb_dev)
> >               kbd_rgb_mode_groups[num_rgb_groups++] =3D &kbd_rgb_mode_g=
roup;
> > @@ -1797,23 +1874,38 @@ static int asus_wmi_led_init(struct asus_wmi *a=
sus)
> >                       goto error;
> >       }
> >
> > -     if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus=
_use_hid_led_dmi_ids)) {
> > -             pr_info("using asus-wmi for asus::kbd_backlight\n");
> > +     asus->kbd_led.name =3D "asus::kbd_backlight";
> > +     asus->kbd_led.flags =3D LED_BRIGHT_HW_CHANGED;
> > +     asus->kbd_led.brightness_set =3D kbd_led_set;
> > +     asus->kbd_led.brightness_get =3D kbd_led_get;
> > +     asus->kbd_led.max_brightness =3D 3;
> > +     asus->kbd_led_avail =3D !kbd_led_read(asus, &led_val, NULL);
> > +
> > +     if (asus->kbd_led_avail)
> >               asus->kbd_led_wk =3D led_val;
> > -             asus->kbd_led.name =3D "asus::kbd_backlight";
> > -             asus->kbd_led.flags =3D LED_BRIGHT_HW_CHANGED;
> > -             asus->kbd_led.brightness_set =3D kbd_led_set;
> > -             asus->kbd_led.brightness_get =3D kbd_led_get;
> > -             asus->kbd_led.max_brightness =3D 3;
> > +     else
> > +             asus->kbd_led_wk =3D -1;
> >
> > -             if (num_rgb_groups !=3D 0)
> > -                     asus->kbd_led.groups =3D kbd_rgb_mode_groups;
> > +     if (asus->kbd_led_avail && num_rgb_groups !=3D 0)
> > +             asus->kbd_led.groups =3D kbd_rgb_mode_groups;
>
> Can't this be placed into the block above?
>
> >
> > +     spin_lock_irqsave(&asus_ref.lock, flags);
> > +     if (asus->kbd_led_avail || !list_empty(&asus_ref.listeners)) {
> >               rv =3D led_classdev_register(&asus->platform_device->dev,
> >                                          &asus->kbd_led);
> > -             if (rv)
> > +             if (rv) {
> > +                     spin_unlock_irqrestore(&asus_ref.lock, flags);
>
> Please use scoped_guard() so you don't need to call unlock yourself.
>
> Unrelated to this patch, I'd also simplify error label by adding return 0
> before it so the code after the label doesn't need if (rv) check.
>
> >                       goto error;
> > +             }
> > +             asus->kbd_led_registered =3D true;
> > +
> > +             if (asus->kbd_led_wk >=3D 0) {
> > +                     list_for_each_entry(listener, &asus_ref.listeners=
, list)
> > +                             listener->brightness_set(listener, asus->=
kbd_led_wk);
> > +             }
> >       }
> > +     asus_ref.asus =3D asus;
> > +     spin_unlock_irqrestore(&asus_ref.lock, flags);
> >
> >       if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
> >                       && (asus->driver->quirks->wapf > 0)) {
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux=
/platform_data/x86/asus-wmi.h
> > index 8a515179113d..f13a701f47a8 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -163,11 +163,19 @@ enum asus_ally_mcu_hack {
> >       ASUS_WMI_ALLY_MCU_HACK_DISABLED,
> >  };
> >
> > +struct asus_hid_listener {
> > +     struct list_head list;
> > +     void (*brightness_set)(struct asus_hid_listener *listener, int br=
ightness);
> > +};
>
> Please add kerneldoc to this struct and the exported functions.
>
> > +
> >  #if IS_REACHABLE(CONFIG_ASUS_WMI)
> >  void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
> >  void set_ally_mcu_powersave(bool enabled);
> >  int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
> >  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *r=
etval);
> > +
> > +int asus_hid_register_listener(struct asus_hid_listener *cdev);
> > +void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
> >  #else
> >  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
> >  {
> > @@ -184,6 +192,14 @@ static inline int asus_wmi_evaluate_method(u32 met=
hod_id, u32 arg0, u32 arg1,
> >  {
> >       return -ENODEV;
> >  }
> > +
> > +static inline int asus_hid_register_listener(struct asus_hid_listener =
*bdev)
> > +{
> > +     return -ENODEV;
> > +}
> > +static inline void asus_hid_unregister_listener(struct asus_hid_listen=
er *bdev)
> > +{
> > +}
> >  #endif
> >
> >  /* To be used by both hid-asus and asus-wmi to determine which control=
s kbd_brightness */
> >
>
> --
>  i.
>
>


