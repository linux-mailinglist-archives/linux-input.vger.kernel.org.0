Return-Path: <linux-input+bounces-14406-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B16B3DB96
	for <lists+linux-input@lfdr.de>; Mon,  1 Sep 2025 09:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E20711899D78
	for <lists+linux-input@lfdr.de>; Mon,  1 Sep 2025 07:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1CD20ADD6;
	Mon,  1 Sep 2025 07:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C88O9xPu"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C09A2E7BA0
	for <linux-input@vger.kernel.org>; Mon,  1 Sep 2025 07:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756713411; cv=none; b=An7siAQmzMNYqtMrCmE1EJWjPnp0vN03RcspnAkt4sj0WEZzpc03vj9iyILky202Lh3jPgYhweXWR00WqfUFY6rJ44jMoVPR9iNdjMpZnZMFLdMxTOESZXLjCw9lxgxXeL3NfrbNpf1HfOPRgBkU5f2cDqEU5A9/j7JhjKDzWNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756713411; c=relaxed/simple;
	bh=f3zdNl84VtoewVrOmqRle3OyWSaKITJa7yhG6i4ugLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8fPWle0jLxIj8TQ3V/zWi/3NbuScYBPV+CIMGg5sC7eqaT6yBVGKqfLPQGzlRzU4saQ1w9WGPj1+fYkLN/S9JRh+tP/7HU/bx3R47UYhdt5+oEAwzEfFMXES2blAyL6Q56Y+GJ8OfDz/N87+cJ7MEva/ocIGPurq7w316/3tAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C88O9xPu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756713408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BmMpw8fgJi1rSIBKlvBeKj2lhAjxbmkDviD6tDlITok=;
	b=C88O9xPujnrJhuCa8qqOFZqc5gJvNeVqzJJADofcfTaKfEkjg+3whMAe2rJmZ06N/+Vl+N
	muZ+zh6jROhAh+RhsjxAH7l3oBGRWNOJlXFeFx2VrhNdNtQ8qmWqNCPapICZwdONJ9BAKg
	xTkrWDIjyTQ7I24739rZVW46EWk+tNE=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-qN-ppXxwMbqSRitylJTCmg-1; Mon, 01 Sep 2025 03:56:47 -0400
X-MC-Unique: qN-ppXxwMbqSRitylJTCmg-1
X-Mimecast-MFC-AGG-ID: qN-ppXxwMbqSRitylJTCmg_1756713406
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-435de72bc57so3845145b6e.1
        for <linux-input@vger.kernel.org>; Mon, 01 Sep 2025 00:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756713406; x=1757318206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmMpw8fgJi1rSIBKlvBeKj2lhAjxbmkDviD6tDlITok=;
        b=wj9HSl9ltsqRFCkuK8gXlUd0l9R58xlrbuZ5nCtDfeZF5pp7rp5bXhbZW9UQ5xOke+
         iJGZRxQTaVMqXYolja2lrFRO3xQoHbbkO0odTmoMZYI9u1//uAW3ioiTQCm/kSWbT3EU
         72UvYqqunQcpLNJsGlnWuvDY6irvCmapLW89t95rD9qxharXTUWonSP4Vy1uO8jx0oJt
         nTvtVTWyYijB7yQTm6pkdjnPnR3zdvHGtWhOu+dc260W3I7JKSaSYF3WOUkXB393XLUm
         SMvSHZBx52UNPhSzz0FY7zDB2ul3l16g6sefuhVsBdUe2bolyqrmk2tanEM/SDE6Hm7y
         H6IA==
X-Forwarded-Encrypted: i=1; AJvYcCV8MzepF8PwyYrnwmP8xzPHVSEH03Dw/pLovs1obszpZZPfKxw1E0x6eDiIAEAIZri/1WYAq83b7FGwzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzopjT5pDwKkV+PDRbYNbV4F6/sgbow92geMTP4pYzwFb2tsn8d
	KW1umEVNp2UFL0cIpVmEONlk0CGFS70KKy6V+USFYvdHZ5hxMBkltIlJDpkZom578bMbCR4ISsk
	+5Y77oUpCAiBv3U1rUjNh73PtgJmTvde/0u4KXGkRakBdlgqXZsdVns3ou8fTQ6UvlIr60PKVwf
	SGV9UfwrtEFDiFfZmAIWIfKImr3vsldPBNAI5lY6Y=
X-Gm-Gg: ASbGnctO6Hq+pkETdghU7db37xnYsZ7rOnCMVUrT3YTaV+A8T6qDPc73b/PKo0rNfcv
	qBnDU0BaLhnCUsNnVT+VndqbnYqyJM7ln8KxB7zrnivsREHVX50bvOZyop069iXaxBCXXJ7IMg3
	nUjKl8i+qGNYtTU77NY96l
X-Received: by 2002:a05:6808:2e4c:b0:437:e2b4:c2ea with SMTP id 5614622812f47-437f7d4f696mr2901964b6e.18.1756713405823;
        Mon, 01 Sep 2025 00:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+w6duXWInf7XO3Xe8L03xI6Rr2ULXZ4VusMp/kK+sHdp2OXYacgJcMGwhgcg7ivtl1PbTfpR64d3l6y7j65w=
X-Received: by 2002:a05:6808:2e4c:b0:437:e2b4:c2ea with SMTP id
 5614622812f47-437f7d4f696mr2901956b6e.18.1756713405231; Mon, 01 Sep 2025
 00:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901063108.217295-2-ewhac@ewhac.org>
In-Reply-To: <20250901063108.217295-2-ewhac@ewhac.org>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 1 Sep 2025 15:56:34 +0800
X-Gm-Features: Ac12FXwX-4l3F268TR3DoMKDTEkBdGrIy6zoXGOKzHDI07gT3cu2AeDMs-TIrZk
Message-ID: <CAEth8oGFUO3fQxfy4ScmFFcepe-seFyfcXejFEmJaARt52F1Bw@mail.gmail.com>
Subject: Re: [PATCH v4] HID: lg-g15 - Add support for Logitech G13.
To: "Leo L. Schwab" <ewhac@ewhac.org>
Cc: Hans de Goede <hansg@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Leo,

On Mon, Sep 1, 2025 at 2:34=E2=80=AFPM Leo L. Schwab <ewhac@ewhac.org> wrot=
e:
>
> The Logitech G13 is a gaming keypad with general-purpose macro keys,
> four LED-backlit macro preset keys, five "menu" keys, backlight toggle
> key, an analog thumbstick, RGB LED backlight, and a monochrome LCD
> display.
>
> Support input event generation for all keys and the thumbstick, and
> expose all LEDs.
>
> Signed-off-by: Leo L. Schwab <ewhac@ewhac.org>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> ---
> Changes in v4:
>   - Minor changes recommended by Hans de Goede <hansg@kernel.org>.
> Changes in v3:
>   - Re-revise commit message.
>   - Conditionally compile the section depending on
>     CONFIG_LEDS_BRIGHTNESS_HW_CHANGED correctly this time.
>   - Use led-class-multicolor facilities for the RGB backlight.
>   - Changes recommended by Kate Hsuan <hpa@redhat.com>:
>     - Use guard(mutex) construct.
>     - Fix numerous style nits.
> Changes in v2:
>   - Add `#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED` bracket around new
>     code segment dependent on that feature (fixes test robot build
>     error).
>   - Use `guard(mutex)` construct in new code (existing code left
>     unmodified).
>   - Commit message revised.
>
>  drivers/hid/hid-ids.h    |   1 +
>  drivers/hid/hid-lg-g15.c | 426 +++++++++++++++++++++++++++++++++++++--
>  2 files changed, 411 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 33cc5820f2be..7ed1e402b80a 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -870,6 +870,7 @@
>  #define USB_DEVICE_ID_LOGITECH_DUAL_ACTION     0xc216
>  #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2      0xc218
>  #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2_2    0xc219
> +#define USB_DEVICE_ID_LOGITECH_G13             0xc21c
>  #define USB_DEVICE_ID_LOGITECH_G15_LCD         0xc222
>  #define USB_DEVICE_ID_LOGITECH_G11             0xc225
>  #define USB_DEVICE_ID_LOGITECH_G15_V2_LCD      0xc227
> diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
> index f8605656257b..62cb795c2393 100644
> --- a/drivers/hid/hid-lg-g15.c
> +++ b/drivers/hid/hid-lg-g15.c
> @@ -26,7 +26,11 @@
>  #define LG_G510_FEATURE_BACKLIGHT_RGB  0x05
>  #define LG_G510_FEATURE_POWER_ON_RGB   0x06
>
> +#define LG_G13_FEATURE_M_KEYS_LEDS     0x05
> +#define LG_G13_FEATURE_BACKLIGHT_RGB   0x07
> +
>  enum lg_g15_model {
> +       LG_G13,
>         LG_G15,
>         LG_G15_V2,
>         LG_G510,
> @@ -45,6 +49,12 @@ enum lg_g15_led_type {
>         LG_G15_LED_MAX
>  };
>
> +struct g13_input_report {
> +       u8 report_id;   /* Report ID is always set to 1. */
> +       u8 joy_x, joy_y;
> +       u8 keybits[5];
> +};
> +
>  struct lg_g15_led {
>         union {
>                 struct led_classdev cdev;
> @@ -63,12 +73,172 @@ struct lg_g15_data {
>         struct mutex mutex;
>         struct work_struct work;
>         struct input_dev *input;
> +       struct input_dev *input_js; /* Separate joystick device for G13. =
*/
>         struct hid_device *hdev;
>         enum lg_g15_model model;
>         struct lg_g15_led leds[LG_G15_LED_MAX];
>         bool game_mode_enabled;
>  };
>
> +/********* G13 LED functions ***********/
> +/*
> + * G13 retains no state across power cycles, and always powers up with t=
he backlight on,
> + * color #5AFF6E, all macro key LEDs off.
> + */
> +static int lg_g13_get_leds_state(struct lg_g15_data *g15)
> +{
> +       u8 * const tbuf =3D g15->transfer_buf;
> +       int ret, high;
> +
> +       /* RGB backlight. */
> +       ret =3D hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_BACKLIGHT_RG=
B,
> +                                tbuf, 5,
> +                                HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
> +       if (ret !=3D 5) {
> +               hid_err(g15->hdev, "Error getting backlight brightness: %=
d\n", ret);
> +               return (ret < 0) ? ret : -EIO;
> +       }
> +
> +       /* Normalize RGB intensities against the highest component. */
> +       high =3D max3(tbuf[1], tbuf[2], tbuf[3]);
> +       if (high) {
> +               g15->leds[LG_G15_KBD_BRIGHTNESS].red =3D
> +                       DIV_ROUND_CLOSEST(tbuf[1] * 255, high);
> +               g15->leds[LG_G15_KBD_BRIGHTNESS].green =3D
> +                       DIV_ROUND_CLOSEST(tbuf[2] * 255, high);
> +               g15->leds[LG_G15_KBD_BRIGHTNESS].blue =3D
> +                       DIV_ROUND_CLOSEST(tbuf[3] * 255, high);
> +               g15->leds[LG_G15_KBD_BRIGHTNESS].brightness =3D high;
> +       } else {
> +               g15->leds[LG_G15_KBD_BRIGHTNESS].red        =3D 255;
> +               g15->leds[LG_G15_KBD_BRIGHTNESS].green      =3D 255;
> +               g15->leds[LG_G15_KBD_BRIGHTNESS].blue       =3D 255;
> +               g15->leds[LG_G15_KBD_BRIGHTNESS].brightness =3D 0;
> +       }
> +
> +       /* Macro LEDs. */
> +       ret =3D hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_M_KEYS_LEDS,
> +                                tbuf, 5,
> +                                HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
> +       if (ret !=3D 5) {
> +               hid_err(g15->hdev, "Error getting macro LED brightness: %=
d\n", ret);
> +               return (ret < 0) ? ret : -EIO;
> +       }
> +
> +       for (int i =3D LG_G15_MACRO_PRESET1; i < LG_G15_LED_MAX; ++i)
> +               g15->leds[i].brightness =3D tbuf[1] & (1 << (i - LG_G15_M=
ACRO_PRESET1));
> +
> +       return 0;
> +}
> +
> +static int lg_g13_kbd_led_write(struct lg_g15_data *g15,
> +                               struct lg_g15_led *g15_led,
> +                               enum led_brightness brightness)
> +{
> +       struct mc_subled const * const subleds =3D g15_led->mcdev.subled_=
info;
> +       u8 * const tbuf =3D g15->transfer_buf;
> +       int ret;
> +
> +       guard(mutex)(&g15->mutex);
> +
> +       led_mc_calc_color_components(&g15_led->mcdev, brightness);
> +
> +       tbuf[0] =3D 5;
> +       tbuf[1] =3D subleds[0].brightness;
> +       tbuf[2] =3D subleds[1].brightness;
> +       tbuf[3] =3D subleds[2].brightness;
> +       tbuf[4] =3D 0;
> +
> +       ret =3D hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_BACKLIGHT_RG=
B,
> +                                tbuf, 5,
> +                                HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
> +       if (ret !=3D 5) {
> +               hid_err(g15->hdev, "Error setting backlight brightness: %=
d\n", ret);
> +               return (ret < 0) ? ret : -EIO;
> +       }
> +
> +       g15_led->brightness =3D brightness;
> +       return 0;
> +}
> +
> +static int lg_g13_kbd_led_set(struct led_classdev *led_cdev, enum led_br=
ightness brightness)
> +{
> +       struct led_classdev_mc *mc =3D lcdev_to_mccdev(led_cdev);
> +       struct lg_g15_led *g15_led =3D
> +               container_of(mc, struct lg_g15_led, mcdev);
> +       struct lg_g15_data *g15 =3D dev_get_drvdata(led_cdev->dev->parent=
);
> +
> +       /* Ignore LED off on unregister / keyboard unplug */
> +       if (led_cdev->flags & LED_UNREGISTERING)
> +               return 0;
> +
> +       return lg_g13_kbd_led_write(g15, g15_led, brightness);
> +}
> +
> +static enum led_brightness lg_g13_kbd_led_get(struct led_classdev *led_c=
dev)
> +{
> +       struct led_classdev_mc const * const mc =3D lcdev_to_mccdev(led_c=
dev);
> +       struct lg_g15_led const *g15_led =3D
> +               container_of(mc, struct lg_g15_led, mcdev);
> +
> +       return g15_led->brightness;
> +}
> +
> +static int lg_g13_mkey_led_set(struct led_classdev *led_cdev, enum led_b=
rightness brightness)
> +{
> +       struct lg_g15_led *g15_led =3D
> +               container_of(led_cdev, struct lg_g15_led, cdev);
> +       struct lg_g15_data *g15 =3D dev_get_drvdata(led_cdev->dev->parent=
);
> +       int i, ret;
> +       u8 * const tbuf =3D g15->transfer_buf;
> +       u8 val, mask =3D 0;
> +
> +       /* Ignore LED off on unregister / keyboard unplug */
> +       if (led_cdev->flags & LED_UNREGISTERING)
> +               return 0;
> +
> +       guard(mutex)(&g15->mutex);
> +
> +       for (i =3D LG_G15_MACRO_PRESET1; i < LG_G15_LED_MAX; ++i) {
> +               if (i =3D=3D g15_led->led)
> +                       val =3D brightness;
> +               else
> +                       val =3D g15->leds[i].brightness;
> +
> +               if (val)
> +                       mask |=3D 1 << (i - LG_G15_MACRO_PRESET1);
> +       }
> +
> +       tbuf[0] =3D 5;
> +       tbuf[1] =3D mask;
> +       tbuf[2] =3D 0;
> +       tbuf[3] =3D 0;
> +       tbuf[4] =3D 0;
> +
> +       ret =3D hid_hw_raw_request(g15->hdev, LG_G13_FEATURE_M_KEYS_LEDS,
> +                                tbuf, 5,
> +                                HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
> +       if (ret !=3D 5) {
> +               hid_err(g15->hdev, "Error setting LED brightness: %d\n", =
ret);
> +               return (ret < 0) ? ret : -EIO;
> +       }
> +
> +       g15_led->brightness =3D brightness;
> +       return 0;
> +}
> +
> +static enum led_brightness lg_g13_mkey_led_get(struct led_classdev *led_=
cdev)
> +{
> +       /*
> +        * G13 doesn't change macro key LEDs behind our back, so they're
> +        * whatever we last set them to.
> +        */
> +       struct lg_g15_led *g15_led =3D
> +               container_of(led_cdev, struct lg_g15_led, cdev);
> +
> +       return g15_led->brightness;
> +}
> +
>  /******** G15 and G15 v2 LED functions ********/
>
>  static int lg_g15_update_led_brightness(struct lg_g15_data *g15)
> @@ -390,6 +560,8 @@ static int lg_g15_get_initial_led_brightness(struct l=
g_g15_data *g15)
>         int ret;
>
>         switch (g15->model) {
> +       case LG_G13:
> +               return lg_g13_get_leds_state(g15);
>         case LG_G15:
>         case LG_G15_V2:
>                 return lg_g15_update_led_brightness(g15);
> @@ -417,6 +589,116 @@ static int lg_g15_get_initial_led_brightness(struct=
 lg_g15_data *g15)
>
>  /******** Input functions ********/
>
> +/**
> + * g13_input_report.keybits[] is not 32-bit aligned, so we can't use the=
 bitops macros.
> + *
> + * @ary: Pointer to array of u8s
> + * @b: Bit index into ary, LSB first.  Not range checked.
> + */
> +#define        TEST_BIT(ary, b)        ((1 << ((b) & 7)) & (ary)[(b) >> =
3])
> +
> +/* Table mapping keybits[] bit positions to event codes. */
> +/* Note: Indices are discontinuous to aid readability. */
> +static const u16 g13_keys_for_bits[] =3D {
> +       /* Main keypad - keys G1 - G22 */
> +       [0] =3D KEY_MACRO1,
> +       [1] =3D KEY_MACRO2,
> +       [2] =3D KEY_MACRO3,
> +       [3] =3D KEY_MACRO4,
> +       [4] =3D KEY_MACRO5,
> +       [5] =3D KEY_MACRO6,
> +       [6] =3D KEY_MACRO7,
> +       [7] =3D KEY_MACRO8,
> +       [8] =3D KEY_MACRO9,
> +       [9] =3D KEY_MACRO10,
> +       [10] =3D KEY_MACRO11,
> +       [11] =3D KEY_MACRO12,
> +       [12] =3D KEY_MACRO13,
> +       [13] =3D KEY_MACRO14,
> +       [14] =3D KEY_MACRO15,
> +       [15] =3D KEY_MACRO16,
> +       [16] =3D KEY_MACRO17,
> +       [17] =3D KEY_MACRO18,
> +       [18] =3D KEY_MACRO19,
> +       [19] =3D KEY_MACRO20,
> +       [20] =3D KEY_MACRO21,
> +       [21] =3D KEY_MACRO22,
> +
> +       /* LCD menu buttons. */
> +       [24] =3D KEY_KBD_LCD_MENU5,       /* "Next page" button */
> +       [25] =3D KEY_KBD_LCD_MENU1,       /* Left-most */
> +       [26] =3D KEY_KBD_LCD_MENU2,
> +       [27] =3D KEY_KBD_LCD_MENU3,
> +       [28] =3D KEY_KBD_LCD_MENU4,       /* Right-most */
> +
> +       /* Macro preset and record buttons; have red LEDs under them. */
> +       [29] =3D KEY_MACRO_PRESET1,
> +       [30] =3D KEY_MACRO_PRESET2,
> +       [31] =3D KEY_MACRO_PRESET3,
> +       [32] =3D KEY_MACRO_RECORD_START,
> +
> +       /* 33-35 handled by joystick device. */
> +
> +       /* Backlight toggle. */
> +       [37] =3D KEY_LIGHTS_TOGGLE,
> +};
> +
> +#define        G13_JS_KEYBITS_OFFSET   33
> +
> +static const u16 g13_keys_for_bits_js[] =3D {
> +       /* Joystick buttons */
> +       /* These keybits are at bit indices 33, 34, and 35. */
> +       BTN_BASE,       /* Left side */
> +       BTN_BASE2,      /* Bottom side */
> +       BTN_THUMB,      /* Stick depress */
> +};
> +
> +static int lg_g13_event(struct lg_g15_data *g15, u8 const *data)
> +{
> +       struct g13_input_report const * const rep =3D (struct g13_input_r=
eport *) data;
> +       int i, val;
> +
> +       /*
> +        * Main macropad and menu keys.
> +        * Emit key events defined for each bit position.
> +        */
> +       for (i =3D 0; i < ARRAY_SIZE(g13_keys_for_bits); ++i) {
> +               if (g13_keys_for_bits[i]) {
> +                       val =3D TEST_BIT(rep->keybits, i);
> +                       input_report_key(g15->input, g13_keys_for_bits[i]=
, val);
> +               }
> +       }
> +       input_sync(g15->input);
> +
> +       /*
> +        * Joystick.
> +        * Emit button and deflection events.
> +        */
> +       for (i =3D 0; i < ARRAY_SIZE(g13_keys_for_bits_js); ++i) {
> +               val =3D TEST_BIT(rep->keybits, i + G13_JS_KEYBITS_OFFSET)=
;
> +               input_report_key(g15->input_js, g13_keys_for_bits_js[i], =
val);
> +       }
> +       input_report_abs(g15->input_js, ABS_X, rep->joy_x);
> +       input_report_abs(g15->input_js, ABS_Y, rep->joy_y);
> +       input_sync(g15->input_js);
> +
> +       if (IS_ENABLED(CONFIG_LEDS_BRIGHTNESS_HW_CHANGED)) {
> +               /*
> +                * Bit 23 of keybits[] reports the current backlight on/o=
ff
> +                * state.  If it has changed from the last cached value, =
apply
> +                * an update.
> +                */
> +               bool hw_brightness_changed =3D (!!TEST_BIT(rep->keybits, =
23))
> +                                          ^ (g15->leds[0].cdev.brightnes=
s_hw_changed > 0);
> +               if (hw_brightness_changed)
> +                       led_classdev_notify_brightness_hw_changed(
> +                               &g15->leds[0].cdev,
> +                               TEST_BIT(rep->keybits, 23) ? LED_FULL : L=
ED_OFF);
> +       }
> +
> +       return 0;
> +}
> +
>  /* On the G15 Mark I Logitech has been quite creative with which bit is =
what */
>  static void lg_g15_handle_lcd_menu_keys(struct lg_g15_data *g15, u8 *dat=
a)
>  {
> @@ -572,6 +854,10 @@ static int lg_g15_raw_event(struct hid_device *hdev,=
 struct hid_report *report,
>                 return 0;
>
>         switch (g15->model) {
> +       case LG_G13:
> +               if (data[0] =3D=3D 0x01 && size =3D=3D sizeof(struct g13_=
input_report))
> +                       return lg_g13_event(g15, data);
> +               break;
>         case LG_G15:
>                 if (data[0] =3D=3D 0x02 && size =3D=3D 9)
>                         return lg_g15_event(g15, data);
> @@ -616,13 +902,22 @@ static void lg_g15_setup_led_rgb(struct lg_g15_data=
 *g15, int index)
>  {
>         int i;
>         struct mc_subled *subled_info;
> -
> -       g15->leds[index].mcdev.led_cdev.brightness_set_blocking =3D
> -               lg_g510_kbd_led_set;
> -       g15->leds[index].mcdev.led_cdev.brightness_get =3D
> -               lg_g510_kbd_led_get;
> -       g15->leds[index].mcdev.led_cdev.max_brightness =3D 255;
> -       g15->leds[index].mcdev.num_colors =3D 3;
> +       struct lg_g15_led * const gled =3D &g15->leds[index];
> +
> +       if (g15->model =3D=3D LG_G13) {
> +               gled->mcdev.led_cdev.brightness_set_blocking =3D
> +                       lg_g13_kbd_led_set;
> +               gled->mcdev.led_cdev.brightness_get =3D
> +                       lg_g13_kbd_led_get;
> +               gled->mcdev.led_cdev.flags =3D LED_BRIGHT_HW_CHANGED;
> +       } else {
> +               gled->mcdev.led_cdev.brightness_set_blocking =3D
> +                       lg_g510_kbd_led_set;
> +               gled->mcdev.led_cdev.brightness_get =3D
> +                       lg_g510_kbd_led_get;
> +       }
> +       gled->mcdev.led_cdev.max_brightness =3D 255;
> +       gled->mcdev.num_colors =3D 3;
>
>         subled_info =3D devm_kcalloc(&g15->hdev->dev, 3, sizeof(*subled_i=
nfo), GFP_KERNEL);
>         if (!subled_info)
> @@ -632,20 +927,20 @@ static void lg_g15_setup_led_rgb(struct lg_g15_data=
 *g15, int index)
>                 switch (i + 1) {
>                 case LED_COLOR_ID_RED:
>                         subled_info[i].color_index =3D LED_COLOR_ID_RED;
> -                       subled_info[i].intensity =3D g15->leds[index].red=
;
> +                       subled_info[i].intensity =3D gled->red;
>                         break;
>                 case LED_COLOR_ID_GREEN:
>                         subled_info[i].color_index =3D LED_COLOR_ID_GREEN=
;
> -                       subled_info[i].intensity =3D g15->leds[index].gre=
en;
> +                       subled_info[i].intensity =3D gled->green;
>                         break;
>                 case LED_COLOR_ID_BLUE:
>                         subled_info[i].color_index =3D LED_COLOR_ID_BLUE;
> -                       subled_info[i].intensity =3D g15->leds[index].blu=
e;
> +                       subled_info[i].intensity =3D gled->blue;
>                         break;
>                 }
>                 subled_info[i].channel =3D i;
>         }
> -       g15->leds[index].mcdev.subled_info =3D subled_info;
> +       gled->mcdev.subled_info =3D subled_info;
>  }
>
>  static int lg_g15_register_led(struct lg_g15_data *g15, int i, const cha=
r *name)
> @@ -656,6 +951,23 @@ static int lg_g15_register_led(struct lg_g15_data *g=
15, int i, const char *name)
>         g15->leds[i].cdev.name =3D name;
>
>         switch (g15->model) {
> +       case LG_G13:
> +               if (i < LG_G15_BRIGHTNESS_MAX) {
> +                       /* RGB backlight. */
> +                       lg_g15_setup_led_rgb(g15, i);
> +                       ret =3D devm_led_classdev_multicolor_register_ext=
(&g15->hdev->dev,
> +                                                                       &=
g15->leds[i].mcdev,
> +                                                                       N=
ULL);
> +               } else {
> +                       /* Macro keys */
> +                       g15->leds[i].cdev.brightness_set_blocking =3D lg_=
g13_mkey_led_set;
> +                       g15->leds[i].cdev.brightness_get =3D lg_g13_mkey_=
led_get;
> +                       g15->leds[i].cdev.max_brightness =3D 1;
> +
> +                       ret =3D devm_led_classdev_register(&g15->hdev->de=
v,
> +                                                        &g15->leds[i].cd=
ev);
> +               }
> +               break;
>         case LG_G15:
>         case LG_G15_V2:
>                 g15->leds[i].cdev.brightness_get =3D lg_g15_led_get;
> @@ -702,11 +1014,9 @@ static int lg_g15_register_led(struct lg_g15_data *=
g15, int i, const char *name)
>  }
>
>  /* Common input device init code shared between keyboards and Z-10 speak=
er handling */
> -static void lg_g15_init_input_dev(struct hid_device *hdev, struct input_=
dev *input,
> -                                 const char *name)
> +static void lg_g15_init_input_dev_core(struct hid_device *hdev, struct i=
nput_dev *input,
> +                                      char const *name)
>  {
> -       int i;
> -
>         input->name =3D name;
>         input->phys =3D hdev->phys;
>         input->uniq =3D hdev->uniq;
> @@ -717,12 +1027,42 @@ static void lg_g15_init_input_dev(struct hid_devic=
e *hdev, struct input_dev *inp
>         input->dev.parent =3D &hdev->dev;
>         input->open =3D lg_g15_input_open;
>         input->close =3D lg_g15_input_close;
> +}
> +
> +static void lg_g15_init_input_dev(struct hid_device *hdev, struct input_=
dev *input,
> +                                 const char *name)
> +{
> +       int i;
> +
> +       lg_g15_init_input_dev_core(hdev, input, name);
>
>         /* Keys below the LCD, intended for controlling a menu on the LCD=
 */
>         for (i =3D 0; i < 5; i++)
>                 input_set_capability(input, EV_KEY, KEY_KBD_LCD_MENU1 + i=
);
>  }
>
> +static void lg_g13_init_input_dev(struct hid_device *hdev,
> +                                 struct input_dev *input, const char *na=
me,
> +                                 struct input_dev *input_js, const char =
*name_js)
> +{
> +       /* Macropad. */
> +       lg_g15_init_input_dev_core(hdev, input, name);
> +       for (int i =3D 0; i < ARRAY_SIZE(g13_keys_for_bits); ++i) {
> +               if (g13_keys_for_bits[i])
> +                       input_set_capability(input, EV_KEY, g13_keys_for_=
bits[i]);
> +       }
> +
> +       /* OBTW, we're a joystick, too... */
> +       lg_g15_init_input_dev_core(hdev, input_js, name_js);
> +       for (int i =3D 0; i < ARRAY_SIZE(g13_keys_for_bits_js); ++i)
> +               input_set_capability(input_js, EV_KEY, g13_keys_for_bits_=
js[i]);
> +
> +       input_set_capability(input_js, EV_ABS, ABS_X);
> +       input_set_abs_params(input_js, ABS_X, 0, 255, 0, 0);
> +       input_set_capability(input_js, EV_ABS, ABS_Y);
> +       input_set_abs_params(input_js, ABS_Y, 0, 255, 0, 0);
> +}
> +
>  static int lg_g15_probe(struct hid_device *hdev, const struct hid_device=
_id *id)
>  {
>         static const char * const led_names[] =3D {
> @@ -739,7 +1079,7 @@ static int lg_g15_probe(struct hid_device *hdev, con=
st struct hid_device_id *id)
>         unsigned int connect_mask =3D 0;
>         bool has_ff000000 =3D false;
>         struct lg_g15_data *g15;
> -       struct input_dev *input;
> +       struct input_dev *input, *input_js;
>         struct hid_report *rep;
>         int ret, i, gkeys =3D 0;
>
> @@ -778,6 +1118,25 @@ static int lg_g15_probe(struct hid_device *hdev, co=
nst struct hid_device_id *id)
>         hid_set_drvdata(hdev, (void *)g15);
>
>         switch (g15->model) {
> +       case LG_G13:
> +               /*
> +                * The G13 has an analog thumbstick with nearby buttons. =
 Some
> +                * libraries and applications are known to ignore devices=
 that
> +                * don't "look like" a joystick, and a device with two AB=
S axes
> +                * and 25+ macro keys would confuse them.
> +                *
> +                * Create an additional input device dedicated to appear =
as a
> +                * simplified joystick (two ABS axes, three BTN buttons).
> +                */
> +               input_js =3D devm_input_allocate_device(&hdev->dev);
> +               if (!input_js)
> +                       return -ENOMEM;
> +               g15->input_js =3D input_js;
> +               input_set_drvdata(input_js, hdev);
> +
> +               connect_mask =3D HID_CONNECT_HIDRAW;
> +               gkeys =3D 25;
> +               break;
>         case LG_G15:
>                 INIT_WORK(&g15->work, lg_g15_leds_changed_work);
>                 /*
> @@ -859,6 +1218,34 @@ static int lg_g15_probe(struct hid_device *hdev, co=
nst struct hid_device_id *id)
>                         goto error_hw_stop;
>
>                 return 0; /* All done */
> +       } else if (g15->model =3D=3D LG_G13) {
> +               static char const * const g13_led_names[] =3D {
> +                       /* Backlight is shared between LCD and keys. */
> +                       "g13:rgb:kbd_backlight",
> +                       NULL,   /* Keep in sync with led_type enum */
> +                       "g13:red:macro_preset_1",
> +                       "g13:red:macro_preset_2",
> +                       "g13:red:macro_preset_3",
> +                       "g13:red:macro_record",
> +               };
> +               lg_g13_init_input_dev(hdev,
> +                                     input, "Logitech G13 Gaming Keypad"=
,
> +                                     input_js, "Logitech G13 Thumbstick"=
);
> +               ret =3D input_register_device(input);
> +               if (ret)
> +                       goto error_hw_stop;
> +               ret =3D input_register_device(input_js);
> +               if (ret)
> +                       goto error_hw_stop;
> +
> +               for (i =3D 0; i < ARRAY_SIZE(g13_led_names); ++i) {
> +                       if (g13_led_names[i]) {
> +                               ret =3D lg_g15_register_led(g15, i, g13_l=
ed_names[i]);
> +                               if (ret)
> +                                       goto error_hw_stop;
> +                       }
> +               }
> +               return 0;
>         }
>
>         /* Setup and register input device */
> @@ -903,6 +1290,13 @@ static int lg_g15_probe(struct hid_device *hdev, co=
nst struct hid_device_id *id)
>  }
>
>  static const struct hid_device_id lg_g15_devices[] =3D {
> +       /*
> +        * The G13 is a macropad-only device with an LCD, LED backlighing=
,
> +        * and joystick.
> +        */
> +       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +                        USB_DEVICE_ID_LOGITECH_G13),
> +               .driver_data =3D LG_G13 },
>         /* The G11 is a G15 without the LCD, treat it as a G15 */
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
>                 USB_DEVICE_ID_LOGITECH_G11),
> --
> 2.51.0
>

Thank you for your work.
I tested it on my G510 and G13 and the results are shown as follows.
1. G510 keyboard backlight works properly and the changes didn't
impact the G510 keyboard backlight control.
2. G13 keyboard backlight works and the color and brightness can be control=
led.
3. The keypad event works.
4. G13 Joystick works.

Tested-by: Kate Hsuan <hpa@redhat.com>


--=20
BR,
Kate


