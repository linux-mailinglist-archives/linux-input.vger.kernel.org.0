Return-Path: <linux-input+bounces-14695-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B324B566DA
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 06:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDD271785A6
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 04:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8F6273805;
	Sun, 14 Sep 2025 04:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwnqoyRI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C748F2652B2
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 04:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757824824; cv=none; b=brd48SkWKgXN0egp96r9DA6anhT7O2sUfSUE8U2RL8FdXFi+hnOKSZUU4EpcCklXnbue9t1csZPJTvhsjazHAnJ58OQdVTCV9ObgDmsCJwGlFDexKOsOqPGc2a53/XM1pW6CorLb3VOmFkKmM2qWYxqNJUzxbLLH9I/l23b/3gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757824824; c=relaxed/simple;
	bh=L7PSsPt5nOa6SmmyE4vt07F4jeXT0e7Gyuh9X0cRwkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V37CjJziXQ9IBgWxtYLt2pjHJezwzkoAucVVV720Gl5d3GjM/1Yi6DnFIMl9n8C7iSCQ68EDudWvvosbDtSSAdIrwHhDebv3rfi664GgJDQJxHlxiMfzMUCvpqJ0PVK7P/Nmp+Ey0acYjRKH3rfGBZhd0Rp3Dw7r6ooFr2HDZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwnqoyRI; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e96e1c82b01so1848185276.1
        for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 21:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757824821; x=1758429621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJuc06CLvzvefazICn2kg2FfQTrT836049eOQrVgizI=;
        b=WwnqoyRI6ku2N3o5sWZz33WYcJI9tY0pMNTIPh4BtydgZpjBHbIhT56xjkas6M7Xg1
         bikvbDFX3XGkYr0Ta9UM0Ti+JNAkZXhT2vOgiJBBm2GtfDvb4tQYvkl+d8BXbyA+EIZe
         oX6jYrZnj7zI9x0P7O9tKFI8Q8C8CS8Er/q2Pwv42jdvZdWAkdKKI9lLubEmhjpsvXmz
         jwCGIyGfdREiMe3rEsJwAWrNCwErDY6zSHbRt9GKQFGRzA5QjZ+ZftS0XPn2tjfHxWMH
         QDEKJzUTu2rKKKRaGfwZEMNM2WEs6kk3eDD7z8lFVymnI6VfpYWR6vLoSAH7/CXn9GED
         CX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757824821; x=1758429621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJuc06CLvzvefazICn2kg2FfQTrT836049eOQrVgizI=;
        b=ZZX9keQw4i21oapOzgpAmZQqYdj2zaDybjyj061Rk3nbQlQtey7XvPgRfDlCfQ+ZEz
         e0rpAH13hIADoe8lBSmlfAUBNQqrekR9/TKJ9zEfAwRllAbg9Ks5UrB7rJDA97pDh+QC
         hnM3pkxXcGPysseDTpDySuatg7N0nZOtGmjHxPlEZ+zGAHWgUJN7M9EsnDfGBc9FyuDt
         EXAnc1WrQGOWlq8vl8qSBXwYrh+5Mrpnxky0eGyRp0v/Wdka4a/5Bxq2/YgEn2ppdSfE
         AUl0041m/ClhHe7Bzg76pKU5KSJ2WbF32ZX7YTdF1Z7JZBmJTQMbXZ0zlWla0wOqy/ZN
         yV2w==
X-Gm-Message-State: AOJu0YyhcDuCj5e7Zys9aIsaIdhmyzBBIKuDqKRuNtf1g0SHRFUuZgHd
	cbA+2fKnAd/LbPsa5Ki52Snn4tsHqZr0YXSQG3nofXl1I9Mrji/ZoPCstlcZjJ1ZP4fL1fttxnl
	Czz3GLaK34lmNYEd+pSbkbal/oiNkuVU=
X-Gm-Gg: ASbGncuFllmOSXobw43E+jxQHipc7m1UPo7dySP1VZRszonRea6uLCjauXf+zQRtQQc
	DlWkElnlz7yQLoPnsB7qUH2LHzbejO51Y2PcRVu/im5HP61Iou3GL1eStyihWBE/tLWpFqCP+Dj
	DXvHivEkVDJ/K/TIOztrluNA6gHee4st4Ecx7z9m0cyaJTNWQ7NzaX/87PLZbtj7jkhbfXtiCdu
	Mau1eQ4I+VDZLmM
X-Google-Smtp-Source: AGHT+IFwowBUT4w82UxP3EWh8JF9wnTyQoGwTI8gw6DzKr/6JoNVgiVx4nXNyZ9/P02jJ6OKcSP+pFOP3VdS948GnbM=
X-Received: by 2002:a05:6902:1208:b0:ea4:3db:3cc1 with SMTP id
 3f1490d57ef6-ea403db401amr677102276.26.1757824820699; Sat, 13 Sep 2025
 21:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEVj2t=mHasbuve8cwWpuPRsN=Wvsfrf+u5hLP_16GR3XqkMfg@mail.gmail.com>
 <20250214225826.154144-1-coolreader18@gmail.com>
In-Reply-To: <20250214225826.154144-1-coolreader18@gmail.com>
From: Daniel Ogorchock <djogorchock@gmail.com>
Date: Sun, 14 Sep 2025 00:40:09 -0400
X-Gm-Features: AS18NWB-f2YJUIlKnHoF9e7Dl3OwIimhPiwVvhJKUBjBZikl33nAe_hc-ONqBW4
Message-ID: <CAEVj2tkb5WTj9gAJmxgnymPRi7sdO3HbvMn88wOHgby2XgXHjQ@mail.gmail.com>
Subject: Re: [PATCH] HID: nintendo: enable HW LED blinking
To: Noa <coolreader18@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Noa,

I tried building with this version of the patch and hit the following error=
:

drivers/hid/hid-nintendo.c:2229:14: error: type defaults to =E2=80=98int=E2=
=80=99 in
declaration of =E2=80=98JC_LED_BLINK_DELAY_ON_MS=E2=80=99 [-Wimplicit-int]
 2229 | static const JC_LED_BLINK_DELAY_ON_MS =3D 500;
      |              ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/hid/hid-nintendo.c:2230:14: error: type defaults to =E2=80=98int=E2=
=80=99 in
declaration of =E2=80=98JC_LED_BLINK_DELAY_OFF_MS=E2=80=99 [-Wimplicit-int]
 2230 | static const JC_LED_BLINK_DELAY_OFF_MS =3D 200;
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~
make[4]: *** [scripts/Makefile.build:287: drivers/hid/hid-nintendo.o] Error=
 1
make[3]: *** [scripts/Makefile.build:555: drivers/hid] Error 2

Making these 'static const unsigned long' fixed that issue. Probably
toolchain version dependent whether it succeeds or fails with the
implicit int.

I also noticed that the HW blink functionality only works in bluetooth
mode. In USB mode it forces the LEDs on.
That seems to match up with the note here:
https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering/blob/maste=
r/bluetooth_hid_subcommands_notes.md#subcommand-0x30-set-player-lights


I was able to modify your patch to gate the new HW logic to only be
active when using bluetooth.

Also please include the commit summary message/description above your
signed-off-by line like you did in v1 of the patch.

Below is my quick modification to your patch that seemed to get things
working right on my local setup. Please feel free to
incorporate it or make your own modifications in v3 to fix the USB
mode. It's probably also worth adding a comment describing
why it doesn't use the HW support for USB:

---
 drivers/hid/hid-nintendo.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 14aed2500a96..03f24e709949 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2201,7 +2201,8 @@ static int joycon_update_player_leds(struct device *d=
ev)
     }

     for (i =3D 0; i < JC_NUM_LEDS; i++) {
-        if (ctlr->leds[i].blink_delay_on || ctlr->leds[i].blink_delay_off)
+        if ((ctlr->leds[i].blink_delay_on || ctlr->leds[i].blink_delay_off=
) &&
+            !joycon_using_usb(ctlr))
             flash |=3D 1 << i;
         else if (ctlr->leds[i].brightness)
             val |=3D 1 << i;
@@ -2217,17 +2218,26 @@ static int joycon_update_player_leds(struct device =
*dev)
 static int joycon_player_led_brightness_set(struct led_classdev *led,
                         enum led_brightness brightness)
 {
+    struct hid_device *hdev =3D to_hid_device(led->dev->parent);
+    struct joycon_ctlr *ctlr;
+
+    ctlr =3D hid_get_drvdata(hdev);
+    if (!ctlr) {
+        hid_err(hdev, "No controller data\n");
+        return -ENODEV;
+    }
+
     led->brightness =3D brightness;

-    if (!brightness)
+    if (!brightness && !joycon_using_usb(ctlr))
         led->blink_delay_on =3D led->blink_delay_off =3D 0;

     return joycon_update_player_leds(led->dev->parent);
 }

 /* the blink period of the leds can't be changed, and is always these valu=
es */
-static const JC_LED_BLINK_DELAY_ON_MS =3D 500;
-static const JC_LED_BLINK_DELAY_OFF_MS =3D 200;
+static const unsigned long JC_LED_BLINK_DELAY_ON_MS =3D 500;
+static const unsigned long JC_LED_BLINK_DELAY_OFF_MS =3D 200;
 /* the different leds on a joycon can't actually be set to hw blink
independently
  * of each other, since they all use the same one subcommand, so this func=
tion
  * actually resets the cycle of all the leds */
@@ -2299,7 +2309,8 @@ static int joycon_leds_create(struct joycon_ctlr *ctl=
r)
         led->max_brightness =3D 1;
         led->brightness_set_blocking =3D
                     joycon_player_led_brightness_set;
-        led->blink_set =3D joycon_player_led_blink_set;
+        if (!joycon_using_usb(ctlr))
+            led->blink_set =3D joycon_player_led_blink_set;
         led->flags =3D LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;

         led_val |=3D joycon_player_led_patterns[player_led_pattern][i] << =
i;
--=20
2.51.0



On Fri, Feb 14, 2025 at 5:58=E2=80=AFPM Noa <coolreader18@gmail.com> wrote:
>
> Updated with proper commit title and clearer constant names.
>
> Signed-off-by: Noa <coolreader18@gmail.com>
> ---
>  drivers/hid/hid-nintendo.c | 45 ++++++++++++++++++++++++++++++++------
>  1 file changed, 38 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 11ac246176ae..f4cdd35eef2a 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -2183,14 +2183,13 @@ static int joycon_input_create(struct joycon_ctlr=
 *ctlr)
>         return 0;
>  }
>
> -/* Because the subcommand sets all the leds at once, the brightness argu=
ment is ignored */
> -static int joycon_player_led_brightness_set(struct led_classdev *led,
> -                                           enum led_brightness brightnes=
s)
> +/* Update the on/flash status of the leds according to their led_classde=
v fields */
> +static int joycon_update_player_leds(struct device *dev)
>  {
> -       struct device *dev =3D led->dev->parent;
>         struct hid_device *hdev =3D to_hid_device(dev);
>         struct joycon_ctlr *ctlr;
>         int val =3D 0;
> +       int flash =3D 0;
>         int i;
>         int ret;
>
> @@ -2200,16 +2199,47 @@ static int joycon_player_led_brightness_set(struc=
t led_classdev *led,
>                 return -ENODEV;
>         }
>
> -       for (i =3D 0; i < JC_NUM_LEDS; i++)
> -               val |=3D ctlr->leds[i].brightness << i;
> +       for (i =3D 0; i < JC_NUM_LEDS; i++) {
> +               if (ctlr->leds[i].blink_delay_on || ctlr->leds[i].blink_d=
elay_off)
> +                       flash |=3D 1 << i;
> +               else if (ctlr->leds[i].brightness)
> +                       val |=3D 1 << i;
> +       }
>
>         mutex_lock(&ctlr->output_mutex);
> -       ret =3D joycon_set_player_leds(ctlr, 0, val);
> +       ret =3D joycon_set_player_leds(ctlr, flash, val);
>         mutex_unlock(&ctlr->output_mutex);
>
>         return ret;
>  }
>
> +static int joycon_player_led_brightness_set(struct led_classdev *led,
> +                                           enum led_brightness brightnes=
s)
> +{
> +       led->brightness =3D brightness;
> +
> +       if (!brightness)
> +               led->blink_delay_on =3D led->blink_delay_off =3D 0;
> +
> +       return joycon_update_player_leds(led->dev->parent);
> +}
> +
> +/* the blink period of the leds can't be changed, and is always these va=
lues */
> +static const JC_LED_BLINK_DELAY_ON_MS =3D 500;
> +static const JC_LED_BLINK_DELAY_OFF_MS =3D 200;
> +/* the different leds on a joycon can't actually be set to hw blink inde=
pendently
> + * of each other, since they all use the same one subcommand, so this fu=
nction
> + * actually resets the cycle of all the leds */
> +static int joycon_player_led_blink_set(struct led_classdev *led,
> +                                    unsigned long *delay_on,
> +                                    unsigned long *delay_off)
> +{
> +       led->blink_delay_on =3D *delay_on =3D JC_LED_BLINK_DELAY_ON_MS;
> +       led->blink_delay_off =3D *delay_off =3D JC_LED_BLINK_DELAY_OFF_MS=
;
> +
> +       return joycon_update_player_leds(led->dev->parent);
> +}
> +
>  static int joycon_home_led_brightness_set(struct led_classdev *led,
>                                           enum led_brightness brightness)
>  {
> @@ -2268,6 +2298,7 @@ static int joycon_leds_create(struct joycon_ctlr *c=
tlr)
>                 led->max_brightness =3D 1;
>                 led->brightness_set_blocking =3D
>                                         joycon_player_led_brightness_set;
> +               led->blink_set =3D joycon_player_led_blink_set;
>                 led->flags =3D LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
>
>                 led_val |=3D joycon_player_led_patterns[player_led_patter=
n][i] << i;
> --
> 2.48.1
>

Thanks,
Daniel

