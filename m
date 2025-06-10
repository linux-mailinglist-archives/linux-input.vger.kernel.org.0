Return-Path: <linux-input+bounces-12753-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB475AD2CA5
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 06:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BA3E188E8D1
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 04:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E447F21D59B;
	Tue, 10 Jun 2025 04:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9Ewd1D2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE56F747F;
	Tue, 10 Jun 2025 04:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529738; cv=none; b=Ypob/A099KkBCKmipAf559O4raxBqVkoEpsZmJYRs1JN2f5s2thXgTiKCPi+kJzvTccAIVj2YAneBU3R6gWQxRvB5SdnAaLE4E0ddh5ZaerLlxwrWGTbLz9F6+wiXsu0UtHUndp3A+s8aYeH9wtyzI8zB3P3I57GNMYwE97LDR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529738; c=relaxed/simple;
	bh=Oao07hypcH5jb7fN3Rsu9beY0ZyDCoNjdDgbWlSaeaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FJb9/U0ORkWgZlTLTJtr/ypHelVscKF7ftVu5MNwvtAL/cxfrBbTnBWwtv5FkIDDR7ra5TqYHpA+9sO/I2AEPC5/51ebI++ztTJHzWcoxu7EOwO7od/fkgxL6W9izC5uoGzZoJyZcwAy00YVeFabeQaDy+2NMMNSY2KzIqmA01E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9Ewd1D2; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fafdd322d3so56044656d6.3;
        Mon, 09 Jun 2025 21:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749529736; x=1750134536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feks1a3YHZmwH+P9tHDFigOqZBfHHZ536vQ+fQxpwi4=;
        b=X9Ewd1D2ZKvQ9RFiAoIPfp2tktu+2P/HqgVLIyxCu8786qQgy77e528MVgHlTabdN4
         k7Rw+i38nzFJlrQjgHtQhwdbvVT7SvMXtmdxbSosOLq/Ctw8+BG4Jryct7oT50tA7ECi
         POjnX8RwH6mcZL0i5I8E1uwbBz8T4n4oJ00duN2HYwIp0139UOZytxnNt2vlLJz2TRBf
         B9zZHCJolKbBGb1mZZj+bwtk0kDkFP+OcZ6e3cjXsFBBV6R6PP4pQj+X303fbl5aj+2z
         JObaGpwLJr6AOLLmaIomtco64a5OotLukgfR/9j7ek139soK6W/k7rxZT1C1yKGIK6ff
         dM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749529736; x=1750134536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feks1a3YHZmwH+P9tHDFigOqZBfHHZ536vQ+fQxpwi4=;
        b=MdeVvQsKt8bdV1bvf6JC4Z69QcJpRVOJlakCc2pBlu2263b4yPBJv0tIXPkdUvNqfY
         WNQ5h7XEQ8et6ZcEr2lboZXfkOw07NcD1A6PMEJDmNg/XNV1YvlkucqOXH1Tx05e78mp
         ChkAfeXDeJJM0a65URqe9+v+z35xgAbfHrE+7+ZUMxThQY1rhiEG/9uEz5x1vbISYysD
         mgxshSNZCXDr3Soedn74VdEh6LPQg1XeYbweFQXQh9O/dwqKVRICrKY2J9sEDFVR5zYn
         WOeeLd4voHWPGK+wWD3s4JhraoB22k2szP48m1HxzSGKueaUNglRDHFHy8V63Ot1jNH4
         1lkA==
X-Forwarded-Encrypted: i=1; AJvYcCUMyVwPGzP5VyYHItl/JLuWnckyUVt1vQPIcSUmUwHdAUC+WaUfS7rM5h7f3mZiEPKC8B1UkgkTe5ABEw==@vger.kernel.org, AJvYcCUTE32bNbJGuFqEPTYttA2vdQTLQfMV0zDjZ7rNoR8epkAWkxazXfYGSTjaSoZ20ZIRyhQbTu5toZX9udVr@vger.kernel.org
X-Gm-Message-State: AOJu0YxNm78NwbAmUCL9ZihtrSNzNdTOy5f72Qrb+Kj15kGBG6+PTK0v
	A3F4UX1px1WyCmfOG9nVjUdp8RdAtldO26CDGcLOxiOCjmkbCXRcQLM44zW+s2f+CXrpBQBC5OX
	yhbwSgY/I1mw+FgV5EwEnseLWAFinFiQ=
X-Gm-Gg: ASbGncuLL/+7sSdB2d4IRzedkoxgwQf4GFhTjgAIVOeVewLyz5yTqKUGzA7HRmdKnR4
	MAudJaV1OWCNXhCMEqQvKQRc3SV6yqVHX8aGhgFG8pVb9NIC4C/9zcKZXL/js52stdGwV6zDJqk
	ndd3QrSzZIU/Et0fKIO0tl3J67qsOYS0zK8q+ZMTW9Sj2m
X-Google-Smtp-Source: AGHT+IFhD/7zXsPb1JIWqolSfxfa64taoSmCwiHuTb0T6AykDG8dxH84jE5MGXBEB+8DIhuzzQXq9mAITcu+CvBQycw=
X-Received: by 2002:ad4:5e8e:0:b0:6f8:e66b:5744 with SMTP id
 6a1803df08f44-6fb08f5de02mr274658836d6.18.1749529735622; Mon, 09 Jun 2025
 21:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com> <20250526-dualsense-hid-jack-v1-3-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-3-a65fee4a60cc@collabora.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 9 Jun 2025 21:28:44 -0700
X-Gm-Features: AX0GCFsIi2CigAy8y3mHwTLJEGUnOtoGtfptMa6TXD44mU_gzZYoIsGr9oJX0lo
Message-ID: <CAEc3jaDRCD66B3Y7V4Ehzw2GPUNLXV8DmLfEcDhjRokOeXc8Xw@mail.gmail.com>
Subject: Re: [PATCH 03/11] HID: playstation: Simplify locking with guard() and scoped_guard()
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

This patch look fine and does simplify some things. Though in terms of
size the patch is a bit long, so it took some careful looking at the
code.

Thanks,
Roderick

On Mon, May 26, 2025 at 5:53=E2=80=AFAM Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Use guard() and scoped_guard() infrastructure instead of explicitly
> acquiring and releasing spinlocks and mutexes to simplify the code and
> ensure that all locks are released properly.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/hid/hid-playstation.c | 216 ++++++++++++++++++------------------=
------
>  1 file changed, 93 insertions(+), 123 deletions(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index a82174a21dcce6523a69a8ec374a72504614cedc..16c576cc74284cc680cc7fc17=
e1bbe6bbcf84177 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -7,6 +7,7 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> +#include <linux/cleanup.h>
>  #include <linux/crc32.h>
>  #include <linux/device.h>
>  #include <linux/hid.h>
> @@ -567,26 +568,25 @@ static int ps_devices_list_add(struct ps_device *de=
v)
>  {
>         struct ps_device *entry;
>
> -       mutex_lock(&ps_devices_lock);
> +       guard(mutex)(&ps_devices_lock);
> +
>         list_for_each_entry(entry, &ps_devices_list, list) {
>                 if (!memcmp(entry->mac_address, dev->mac_address, sizeof(=
dev->mac_address))) {
>                         hid_err(dev->hdev, "Duplicate device found for MA=
C address %pMR.\n",
>                                         dev->mac_address);
> -                       mutex_unlock(&ps_devices_lock);
>                         return -EEXIST;
>                 }
>         }
>
>         list_add_tail(&dev->list, &ps_devices_list);
> -       mutex_unlock(&ps_devices_lock);
>         return 0;
>  }
>
>  static int ps_devices_list_remove(struct ps_device *dev)
>  {
> -       mutex_lock(&ps_devices_lock);
> +       guard(mutex)(&ps_devices_lock);
> +
>         list_del(&dev->list);
> -       mutex_unlock(&ps_devices_lock);
>         return 0;
>  }
>
> @@ -650,13 +650,12 @@ static int ps_battery_get_property(struct power_sup=
ply *psy,
>         struct ps_device *dev =3D power_supply_get_drvdata(psy);
>         uint8_t battery_capacity;
>         int battery_status;
> -       unsigned long flags;
>         int ret =3D 0;
>
> -       spin_lock_irqsave(&dev->lock, flags);
> -       battery_capacity =3D dev->battery_capacity;
> -       battery_status =3D dev->battery_status;
> -       spin_unlock_irqrestore(&dev->lock, flags);
> +       scoped_guard(spinlock_irqsave, &dev->lock) {
> +               battery_capacity =3D dev->battery_capacity;
> +               battery_status =3D dev->battery_status;
> +       }
>
>         switch (psp) {
>         case POWER_SUPPLY_PROP_STATUS:
> @@ -1174,19 +1173,17 @@ static int dualsense_player_led_set_brightness(st=
ruct led_classdev *led, enum le
>  {
>         struct hid_device *hdev =3D to_hid_device(led->dev->parent);
>         struct dualsense *ds =3D hid_get_drvdata(hdev);
> -       unsigned long flags;
>         unsigned int led_index;
>
> -       spin_lock_irqsave(&ds->base.lock, flags);
> -
> -       led_index =3D led - ds->player_leds;
> -       if (value =3D=3D LED_OFF)
> -               ds->player_leds_state &=3D ~BIT(led_index);
> -       else
> -               ds->player_leds_state |=3D BIT(led_index);
> +       scoped_guard(spinlock_irqsave, &ds->base.lock) {
> +               led_index =3D led - ds->player_leds;
> +               if (value =3D=3D LED_OFF)
> +                       ds->player_leds_state &=3D ~BIT(led_index);
> +               else
> +                       ds->player_leds_state |=3D BIT(led_index);
>
> -       ds->update_player_leds =3D true;
> -       spin_unlock_irqrestore(&ds->base.lock, flags);
> +               ds->update_player_leds =3D true;
> +       }
>
>         dualsense_schedule_work(ds);
>
> @@ -1235,12 +1232,9 @@ static void dualsense_init_output_report(struct du=
alsense *ds, struct dualsense_
>
>  static inline void dualsense_schedule_work(struct dualsense *ds)
>  {
> -       unsigned long flags;
> -
> -       spin_lock_irqsave(&ds->base.lock, flags);
> +       guard(spinlock_irqsave)(&ds->base.lock);
>         if (ds->output_worker_initialized)
>                 schedule_work(&ds->output_worker);
> -       spin_unlock_irqrestore(&ds->base.lock, flags);
>  }
>
>  /*
> @@ -1338,7 +1332,6 @@ static int dualsense_parse_report(struct ps_device =
*ps_dev, struct hid_report *r
>         int battery_status;
>         uint32_t sensor_timestamp;
>         bool btn_mic_state;
> -       unsigned long flags;
>         int i;
>
>         /*
> @@ -1400,10 +1393,10 @@ static int dualsense_parse_report(struct ps_devic=
e *ps_dev, struct hid_report *r
>          */
>         btn_mic_state =3D !!(ds_report->buttons[2] & DS_BUTTONS2_MIC_MUTE=
);
>         if (btn_mic_state && !ds->last_btn_mic_state) {
> -               spin_lock_irqsave(&ps_dev->lock, flags);
> -               ds->update_mic_mute =3D true;
> -               ds->mic_muted =3D !ds->mic_muted; /* toggle */
> -               spin_unlock_irqrestore(&ps_dev->lock, flags);
> +               scoped_guard(spinlock_irqsave, &ps_dev->lock) {
> +                       ds->update_mic_mute =3D true;
> +                       ds->mic_muted =3D !ds->mic_muted; /* toggle */
> +               }
>
>                 /* Schedule updating of microphone state at hardware leve=
l. */
>                 dualsense_schedule_work(ds);
> @@ -1496,10 +1489,10 @@ static int dualsense_parse_report(struct ps_devic=
e *ps_dev, struct hid_report *r
>                 battery_status =3D POWER_SUPPLY_STATUS_UNKNOWN;
>         }
>
> -       spin_lock_irqsave(&ps_dev->lock, flags);
> -       ps_dev->battery_capacity =3D battery_capacity;
> -       ps_dev->battery_status =3D battery_status;
> -       spin_unlock_irqrestore(&ps_dev->lock, flags);
> +       scoped_guard(spinlock_irqsave, &ps_dev->lock) {
> +               ps_dev->battery_capacity =3D battery_capacity;
> +               ps_dev->battery_status =3D battery_status;
> +       }
>
>         return 0;
>  }
> @@ -1508,16 +1501,15 @@ static int dualsense_play_effect(struct input_dev=
 *dev, void *data, struct ff_ef
>  {
>         struct hid_device *hdev =3D input_get_drvdata(dev);
>         struct dualsense *ds =3D hid_get_drvdata(hdev);
> -       unsigned long flags;
>
>         if (effect->type !=3D FF_RUMBLE)
>                 return 0;
>
> -       spin_lock_irqsave(&ds->base.lock, flags);
> -       ds->update_rumble =3D true;
> -       ds->motor_left =3D effect->u.rumble.strong_magnitude / 256;
> -       ds->motor_right =3D effect->u.rumble.weak_magnitude / 256;
> -       spin_unlock_irqrestore(&ds->base.lock, flags);
> +       scoped_guard(spinlock_irqsave, &ds->base.lock) {
> +               ds->update_rumble =3D true;
> +               ds->motor_left =3D effect->u.rumble.strong_magnitude / 25=
6;
> +               ds->motor_right =3D effect->u.rumble.weak_magnitude / 256=
;
> +       }
>
>         dualsense_schedule_work(ds);
>         return 0;
> @@ -1526,11 +1518,9 @@ static int dualsense_play_effect(struct input_dev =
*dev, void *data, struct ff_ef
>  static void dualsense_remove(struct ps_device *ps_dev)
>  {
>         struct dualsense *ds =3D container_of(ps_dev, struct dualsense, b=
ase);
> -       unsigned long flags;
>
> -       spin_lock_irqsave(&ds->base.lock, flags);
> -       ds->output_worker_initialized =3D false;
> -       spin_unlock_irqrestore(&ds->base.lock, flags);
> +       scoped_guard(spinlock_irqsave, &ds->base.lock)
> +               ds->output_worker_initialized =3D false;
>
>         cancel_work_sync(&ds->output_worker);
>  }
> @@ -1562,14 +1552,12 @@ static int dualsense_reset_leds(struct dualsense =
*ds)
>
>  static void dualsense_set_lightbar(struct dualsense *ds, uint8_t red, ui=
nt8_t green, uint8_t blue)
>  {
> -       unsigned long flags;
> -
> -       spin_lock_irqsave(&ds->base.lock, flags);
> -       ds->update_lightbar =3D true;
> -       ds->lightbar_red =3D red;
> -       ds->lightbar_green =3D green;
> -       ds->lightbar_blue =3D blue;
> -       spin_unlock_irqrestore(&ds->base.lock, flags);
> +       scoped_guard(spinlock_irqsave, &ds->base.lock) {
> +               ds->update_lightbar =3D true;
> +               ds->lightbar_red =3D red;
> +               ds->lightbar_green =3D green;
> +               ds->lightbar_blue =3D blue;
> +       }
>
>         dualsense_schedule_work(ds);
>  }
> @@ -1756,7 +1744,6 @@ static struct ps_device *dualsense_create(struct hi=
d_device *hdev)
>  static void dualshock4_dongle_calibration_work(struct work_struct *work)
>  {
>         struct dualshock4 *ds4 =3D container_of(work, struct dualshock4, =
dongle_hotplug_worker);
> -       unsigned long flags;
>         enum dualshock4_dongle_state dongle_state;
>         int ret;
>
> @@ -1775,9 +1762,8 @@ static void dualshock4_dongle_calibration_work(stru=
ct work_struct *work)
>                 dongle_state =3D DONGLE_CONNECTED;
>         }
>
> -       spin_lock_irqsave(&ds4->base.lock, flags);
> -       ds4->dongle_state =3D dongle_state;
> -       spin_unlock_irqrestore(&ds4->base.lock, flags);
> +       scoped_guard(spinlock_irqsave, &ds4->base.lock)
> +               ds4->dongle_state =3D dongle_state;
>  }
>
>  static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
> @@ -2049,26 +2035,23 @@ static int dualshock4_led_set_blink(struct led_cl=
assdev *led, unsigned long *del
>  {
>         struct hid_device *hdev =3D to_hid_device(led->dev->parent);
>         struct dualshock4 *ds4 =3D hid_get_drvdata(hdev);
> -       unsigned long flags;
>
> -       spin_lock_irqsave(&ds4->base.lock, flags);
> +       scoped_guard(spinlock_irqsave, &ds4->base.lock) {
> +               if (!*delay_on && !*delay_off) {
> +                       /* Default to 1 Hz (50 centiseconds on, 50 centis=
econds off). */
> +                       ds4->lightbar_blink_on =3D 50;
> +                       ds4->lightbar_blink_off =3D 50;
> +               } else {
> +                       /* Blink delays in centiseconds. */
> +                       ds4->lightbar_blink_on =3D min_t(unsigned long, *=
delay_on / 10,
> +                                                      DS4_LIGHTBAR_MAX_B=
LINK);
> +                       ds4->lightbar_blink_off =3D min_t(unsigned long, =
*delay_off / 10,
> +                                                       DS4_LIGHTBAR_MAX_=
BLINK);
> +               }
>
> -       if (!*delay_on && !*delay_off) {
> -               /* Default to 1 Hz (50 centiseconds on, 50 centiseconds o=
ff). */
> -               ds4->lightbar_blink_on =3D 50;
> -               ds4->lightbar_blink_off =3D 50;
> -       } else {
> -               /* Blink delays in centiseconds. */
> -               ds4->lightbar_blink_on =3D min_t(unsigned long, *delay_on=
 / 10,
> -                                              DS4_LIGHTBAR_MAX_BLINK);
> -               ds4->lightbar_blink_off =3D min_t(unsigned long, *delay_o=
ff / 10,
> -                                               DS4_LIGHTBAR_MAX_BLINK);
> +               ds4->update_lightbar_blink =3D true;
>         }
>
> -       ds4->update_lightbar_blink =3D true;
> -
> -       spin_unlock_irqrestore(&ds4->base.lock, flags);
> -
>         dualshock4_schedule_work(ds4);
>
>         /* Report scaled values back to LED subsystem */
> @@ -2082,36 +2065,33 @@ static int dualshock4_led_set_brightness(struct l=
ed_classdev *led, enum led_brig
>  {
>         struct hid_device *hdev =3D to_hid_device(led->dev->parent);
>         struct dualshock4 *ds4 =3D hid_get_drvdata(hdev);
> -       unsigned long flags;
>         unsigned int led_index;
>
> -       spin_lock_irqsave(&ds4->base.lock, flags);
> -
> -       led_index =3D led - ds4->lightbar_leds;
> -       switch (led_index) {
> -       case 0:
> -               ds4->lightbar_red =3D value;
> -               break;
> -       case 1:
> -               ds4->lightbar_green =3D value;
> -               break;
> -       case 2:
> -               ds4->lightbar_blue =3D value;
> -               break;
> -       case 3:
> -               ds4->lightbar_enabled =3D !!value;
> -
> -               /* brightness =3D 0 also cancels blinking in Linux. */
> -               if (!ds4->lightbar_enabled) {
> -                       ds4->lightbar_blink_off =3D 0;
> -                       ds4->lightbar_blink_on =3D 0;
> -                       ds4->update_lightbar_blink =3D true;
> +       scoped_guard(spinlock_irqsave, &ds4->base.lock) {
> +               led_index =3D led - ds4->lightbar_leds;
> +               switch (led_index) {
> +               case 0:
> +                       ds4->lightbar_red =3D value;
> +                       break;
> +               case 1:
> +                       ds4->lightbar_green =3D value;
> +                       break;
> +               case 2:
> +                       ds4->lightbar_blue =3D value;
> +                       break;
> +               case 3:
> +                       ds4->lightbar_enabled =3D !!value;
> +
> +                       /* brightness =3D 0 also cancels blinking in Linu=
x. */
> +                       if (!ds4->lightbar_enabled) {
> +                               ds4->lightbar_blink_off =3D 0;
> +                               ds4->lightbar_blink_on =3D 0;
> +                               ds4->update_lightbar_blink =3D true;
> +                       }
>                 }
> -       }
> -
> -       ds4->update_lightbar =3D true;
>
> -       spin_unlock_irqrestore(&ds4->base.lock, flags);
> +               ds4->update_lightbar =3D true;
> +       }
>
>         dualshock4_schedule_work(ds4);
>
> @@ -2243,7 +2223,6 @@ static int dualshock4_parse_report(struct ps_device=
 *ps_dev, struct hid_report *
>         uint8_t battery_capacity, num_touch_reports, value;
>         int battery_status, i, j;
>         uint16_t sensor_timestamp;
> -       unsigned long flags;
>         bool is_minimal =3D false;
>
>         /*
> @@ -2421,10 +2400,10 @@ static int dualshock4_parse_report(struct ps_devi=
ce *ps_dev, struct hid_report *
>                 battery_status =3D POWER_SUPPLY_STATUS_DISCHARGING;
>         }
>
> -       spin_lock_irqsave(&ps_dev->lock, flags);
> -       ps_dev->battery_capacity =3D battery_capacity;
> -       ps_dev->battery_status =3D battery_status;
> -       spin_unlock_irqrestore(&ps_dev->lock, flags);
> +       scoped_guard(spinlock_irqsave, &ps_dev->lock) {
> +               ps_dev->battery_capacity =3D battery_capacity;
> +               ps_dev->battery_status =3D battery_status;
> +       }
>
>         return 0;
>  }
> @@ -2442,7 +2421,6 @@ static int dualshock4_dongle_parse_report(struct ps=
_device *ps_dev, struct hid_r
>          */
>         if (data[0] =3D=3D DS4_INPUT_REPORT_USB && size =3D=3D DS4_INPUT_=
REPORT_USB_SIZE) {
>                 struct dualshock4_input_report_common *ds4_report =3D (st=
ruct dualshock4_input_report_common *)&data[1];
> -               unsigned long flags;
>
>                 connected =3D ds4_report->status[1] & DS4_STATUS1_DONGLE_=
STATE ? false : true;
>
> @@ -2451,9 +2429,8 @@ static int dualshock4_dongle_parse_report(struct ps=
_device *ps_dev, struct hid_r
>
>                         dualshock4_set_default_lightbar_colors(ds4);
>
> -                       spin_lock_irqsave(&ps_dev->lock, flags);
> -                       ds4->dongle_state =3D DONGLE_CALIBRATING;
> -                       spin_unlock_irqrestore(&ps_dev->lock, flags);
> +                       scoped_guard(spinlock_irqsave, &ps_dev->lock)
> +                               ds4->dongle_state =3D DONGLE_CALIBRATING;
>
>                         schedule_work(&ds4->dongle_hotplug_worker);
>
> @@ -2465,9 +2442,8 @@ static int dualshock4_dongle_parse_report(struct ps=
_device *ps_dev, struct hid_r
>                             ds4->dongle_state =3D=3D DONGLE_DISABLED) && =
!connected) {
>                         hid_info(ps_dev->hdev, "DualShock 4 USB dongle: c=
ontroller disconnected\n");
>
> -                       spin_lock_irqsave(&ps_dev->lock, flags);
> -                       ds4->dongle_state =3D DONGLE_DISCONNECTED;
> -                       spin_unlock_irqrestore(&ps_dev->lock, flags);
> +                       scoped_guard(spinlock_irqsave, &ps_dev->lock)
> +                               ds4->dongle_state =3D DONGLE_DISCONNECTED=
;
>
>                         /* Return 0, so hidraw can get the report. */
>                         return 0;
> @@ -2489,16 +2465,15 @@ static int dualshock4_play_effect(struct input_de=
v *dev, void *data, struct ff_e
>  {
>         struct hid_device *hdev =3D input_get_drvdata(dev);
>         struct dualshock4 *ds4 =3D hid_get_drvdata(hdev);
> -       unsigned long flags;
>
>         if (effect->type !=3D FF_RUMBLE)
>                 return 0;
>
> -       spin_lock_irqsave(&ds4->base.lock, flags);
> -       ds4->update_rumble =3D true;
> -       ds4->motor_left =3D effect->u.rumble.strong_magnitude / 256;
> -       ds4->motor_right =3D effect->u.rumble.weak_magnitude / 256;
> -       spin_unlock_irqrestore(&ds4->base.lock, flags);
> +       scoped_guard(spinlock_irqsave, &ds4->base.lock) {
> +               ds4->update_rumble =3D true;
> +               ds4->motor_left =3D effect->u.rumble.strong_magnitude / 2=
56;
> +               ds4->motor_right =3D effect->u.rumble.weak_magnitude / 25=
6;
> +       }
>
>         dualshock4_schedule_work(ds4);
>         return 0;
> @@ -2507,11 +2482,9 @@ static int dualshock4_play_effect(struct input_dev=
 *dev, void *data, struct ff_e
>  static void dualshock4_remove(struct ps_device *ps_dev)
>  {
>         struct dualshock4 *ds4 =3D container_of(ps_dev, struct dualshock4=
, base);
> -       unsigned long flags;
>
> -       spin_lock_irqsave(&ds4->base.lock, flags);
> -       ds4->output_worker_initialized =3D false;
> -       spin_unlock_irqrestore(&ds4->base.lock, flags);
> +       scoped_guard(spinlock_irqsave, &ds4->base.lock)
> +               ds4->output_worker_initialized =3D false;
>
>         cancel_work_sync(&ds4->output_worker);
>
> @@ -2521,12 +2494,9 @@ static void dualshock4_remove(struct ps_device *ps=
_dev)
>
>  static inline void dualshock4_schedule_work(struct dualshock4 *ds4)
>  {
> -       unsigned long flags;
> -
> -       spin_lock_irqsave(&ds4->base.lock, flags);
> +       guard(spinlock_irqsave)(&ds4->base.lock);
>         if (ds4->output_worker_initialized)
>                 schedule_work(&ds4->output_worker);
> -       spin_unlock_irqrestore(&ds4->base.lock, flags);
>  }
>
>  static void dualshock4_set_bt_poll_interval(struct dualshock4 *ds4, uint=
8_t interval)
>
> --
> 2.49.0
>
>

