Return-Path: <linux-input+bounces-12751-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE41AD2C69
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 06:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07F5116C815
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 04:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9C7259C87;
	Tue, 10 Jun 2025 04:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwLHVFzB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0012111;
	Tue, 10 Jun 2025 04:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749528486; cv=none; b=UYSeC1tRMoNcGvI0ftY4TqbBhmErdo1ZbIR4bnFATk/u+qgSVPdws+pbjMptfMm7drSEuIBAn7qC/ZuB5w59lH3YKOSOyLgEABIYj5y8YJ+PvIZF5TUcTr/EOZs1KjhZf9LiYg7uLzUh8xowPsHecINfeCKPmllv0mXb0UYzCfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749528486; c=relaxed/simple;
	bh=2FbQb0j5PmGYCAtDJcQ0kiXNrNozsZAqA7CreMMKfZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgDR0cKQmH8zzlWHIucBlrZn7xl826mH2ZDm0Rsev2+Ll+i03EOp3cVYhJKs/xUOvRVu8BKvZ/8kCfh4JhoSdOY9Kjt6NpCNH7a7jpEYrr0vTv21Ty+5KDQ6iVHjUFRkReBejBboeKZZIeXNanLpVAJGp5zsX1TZ8NVRkgcdIZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwLHVFzB; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fac1c60e19so67823436d6.1;
        Mon, 09 Jun 2025 21:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749528483; x=1750133283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YidR/r+gzeLRp0x2mUg2/Svgj5SNHq457PFKuHajlEg=;
        b=IwLHVFzB6xee+YOzltEeeC4D8+SD0QdHe4+Emyg+ElPXX3xBZSL21srfnloG0YJR9e
         fdQcJTfUuMR0+UF4lqHokp9pxAnibEBqLuY2O6NcOw4DWOdg6wHkSenxdNBgTDGnmdQm
         L63hL5bk5S7ljlCcMW4F7I78GHvbxnOoPhM/df66hlajpPQ16Dpy8kJGw4mdBEaHGQx4
         hp319paSvHP3Sxl0EV9ghgtO4P1eDThEomGpEH8SqL5iMyUGvmxHTzrc+8HkJS8Z79RJ
         fN7zBoQCuQz1awbjOQ2XVJHH2ytpOwXIhxPuYfz7TyrQ+2WrEUjjevfLgkP7wsZxGHtS
         8SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749528483; x=1750133283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YidR/r+gzeLRp0x2mUg2/Svgj5SNHq457PFKuHajlEg=;
        b=sdjfuZtJT9nZLKYGRkTLWsrtiDrGrV3SIhXoIIhJc9upyMyaffx1AsvRgmeq5ZsD5e
         plz1UfgfxYkThr4+J5xWpZetQBZbx3Ky0kr0jrCxML56zeIHpCZt2zdHwv3zcMV/1H7t
         TJCkpNd1TYi9thrnTZUKHGHvOOu6izGjezQB4QNervBgKRDaQLw/iqzW3SeBV4oIQr7e
         FSsVwq+gLfbInL639Az5Vx6VwXngLc6itpT26jJOAhrkqpYZvePKmVrVYyzMsYMiH4kC
         Gru5yZn1zZ2DMeGjp6pj4R4yZg9QhOe/BAxfaMtA/wv26kAmdw0tsA/wM/bH99o/KYNr
         4GBA==
X-Forwarded-Encrypted: i=1; AJvYcCVPzPeRWuptlXP1BxmxubpyYw73FUnBG87odKhqkJzxaui3Biqa71SJQKjKZSrOnKo+kw8W4E5eTouN9A==@vger.kernel.org, AJvYcCVTGEHoDjAp/bedffZMSpYMAT/fxnJLMTJUNkV6gy+2GsV+xMKT7Je4XNe368kBSAYb/6LjyW6yh0g2W/4l@vger.kernel.org
X-Gm-Message-State: AOJu0YylCQG5/GsKpj9G3yLM/oPEcLFTZGEYMdRhBHYLD87f6JKi3zEC
	MO0Iv1GnL7b1wZLmDTYiGmX7Ws5fMhiPRFsNCYrelYaNIDb7IHj4zlJHtk6N94jS8LrpQvw9pIX
	nzgaQn4dInDHeHeL7N0pdOkVmN7onago=
X-Gm-Gg: ASbGncumF5g2DwxuLag1BcppLWK3ifgeyBSIhCWNlati6yeXiWXfv7DW8XcfFpFgZjU
	VO9RynxyEb6+3gOn62X/G3rESlvnVCeDVXy+lRwntX+fZ6aSK0tQXCpfNOE9wvxWpJAa1GSS/n/
	wP7yn1/xx9ICzl9COY5aH52rSYJ6ukdXqBEBzhaxG2UFZ6
X-Google-Smtp-Source: AGHT+IE+txtavHBTUg0jCaqcRr9dyMMTLzy9PmZ6pW/v4e54RWpY6L5i6qn2DPpAJKNpJzKiIB9/luCBYjEpD5oC2VE=
X-Received: by 2002:a05:6214:19e7:b0:6fb:265:a2c5 with SMTP id
 6a1803df08f44-6fb23985764mr30742096d6.17.1749528483089; Mon, 09 Jun 2025
 21:08:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com> <20250526-dualsense-hid-jack-v1-1-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-1-a65fee4a60cc@collabora.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 9 Jun 2025 21:07:52 -0700
X-Gm-Features: AX0GCFuDSZEL4P2XIAHmAYhsx7V2c5Mrab-6N-SUsFTfahCNAdTkkSan0m3RhiY
Message-ID: <CAEc3jaAjUHgv7U59u7RSZ7TK9ycXmYs22b6MsHvSjt-_Do7cjg@mail.gmail.com>
Subject: Re: [PATCH 01/11] HID: playstation: Make use of bitfield macros
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Thanks for the effort into this patch. Personally this is a patch I
would rather drop. There is the trade-off between magical numbers and
code readability. I think this patch makes things much less readable.
Having to introduce more macros and FIELD_PREP vs a single bitshift
here and there.

Thanks,
Roderick

On Mon, May 26, 2025 at 5:52=E2=80=AFAM Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Improve code readability by replacing open coded bit operations with the
> equivalent bitfield macros.
>
> While at it, vertically align all DS_OUTPUT_* bit constants.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/hid/hid-playstation.c | 68 ++++++++++++++++++++++++++-----------=
------
>  1 file changed, 41 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index 1468fb11e39dffc883181663a4ad44252e0a7ebb..538194ce8902fe1383b57ac59=
743f32838dcb0df 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -5,6 +5,7 @@
>   *  Copyright (c) 2020-2022 Sony Interactive Entertainment
>   */
>
> +#include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/crc32.h>
>  #include <linux/device.h>
> @@ -116,29 +117,41 @@ struct ps_led_info {
>  #define DS_STATUS_CHARGING_SHIFT       4
>
>  /* Feature version from DualSense Firmware Info report. */
> -#define DS_FEATURE_VERSION(major, minor) ((major & 0xff) << 8 | (minor &=
 0xff))
> -
> +#define DS_FEATURE_VERSION_MINOR               GENMASK(7, 0)
> +#define DS_FEATURE_VERSION_MAJOR               GENMASK(15, 8)
> +#define DS_FEATURE_VERSION(major, minor)       (FIELD_PREP(DS_FEATURE_VE=
RSION_MAJOR, major) | \
> +                                                FIELD_PREP(DS_FEATURE_VE=
RSION_MINOR, minor))
>  /*
>   * Status of a DualSense touch point contact.
>   * Contact IDs, with highest bit set are 'inactive'
>   * and any associated data is then invalid.
>   */
> -#define DS_TOUCH_POINT_INACTIVE BIT(7)
> +#define DS_TOUCH_POINT_INACTIVE                        BIT(7)
> +#define DS_TOUCH_POINT_X_LO                    GENMASK(7, 0)
> +#define DS_TOUCH_POINT_X_HI                    GENMASK(11, 8)
> +#define DS_TOUCH_POINT_X(hi, lo)               (FIELD_PREP(DS_TOUCH_POIN=
T_X_HI, hi) | \
> +                                                FIELD_PREP(DS_TOUCH_POIN=
T_X_LO, lo))
> +#define DS_TOUCH_POINT_Y_LO                    GENMASK(3, 0)
> +#define DS_TOUCH_POINT_Y_HI                    GENMASK(11, 4)
> +#define DS_TOUCH_POINT_Y(hi, lo)               (FIELD_PREP(DS_TOUCH_POIN=
T_Y_HI, hi) | \
> +                                                FIELD_PREP(DS_TOUCH_POIN=
T_Y_LO, lo))
>
>   /* Magic value required in tag field of Bluetooth output report. */
> -#define DS_OUTPUT_TAG 0x10
> +#define DS_OUTPUT_TAG                          0x10
> +#define DS_OUTPUT_SEQ_TAG                      GENMASK(3, 0)
> +#define DS_OUTPUT_SEQ_NO                       GENMASK(7, 4)
>  /* Flags for DualSense output report. */
> -#define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
> -#define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
> -#define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE BIT(0)
> -#define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
> -#define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
> -#define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
> -#define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE BIT(4)
> -#define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
> -#define DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2 BIT(2)
> -#define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
> -#define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
> +#define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION             BIT(0)
> +#define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT                   BIT(1)
> +#define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE      BIT(0)
> +#define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE                B=
IT(1)
> +#define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE          BIT(2)
> +#define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS                     BIT(3)
> +#define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE  BIT(4)
> +#define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE    BIT(1)
> +#define DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2            BIT(2)
> +#define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE                  BIT(4)
> +#define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT                     BIT(1)
>
>  /* DualSense hardware limits */
>  #define DS_ACC_RES_PER_G       8192
> @@ -315,7 +328,9 @@ struct dualsense_output_report {
>   * Contact IDs, with highest bit set are 'inactive'
>   * and any associated data is then invalid.
>   */
> -#define DS4_TOUCH_POINT_INACTIVE BIT(7)
> +#define DS4_TOUCH_POINT_INACTIVE       BIT(7)
> +#define DS4_TOUCH_POINT_X(hi, lo)      DS_TOUCH_POINT_X(hi, lo)
> +#define DS4_TOUCH_POINT_Y(hi, lo)      DS_TOUCH_POINT_Y(hi, lo)
>
>  /* Status field of DualShock4 input report. */
>  #define DS4_STATUS0_BATTERY_CAPACITY   GENMASK(3, 0)
> @@ -1194,7 +1209,8 @@ static void dualsense_init_output_report(struct dua=
lsense *ds, struct dualsense_
>                  * Highest 4-bit is a sequence number, which needs to be =
increased
>                  * every report. Lowest 4-bit is tag and can be zero for =
now.
>                  */
> -               bt->seq_tag =3D (ds->output_seq << 4) | 0x0;
> +               bt->seq_tag =3D FIELD_PREP(DS_OUTPUT_SEQ_NO, ds->output_s=
eq) |
> +                             FIELD_PREP(DS_OUTPUT_SEQ_TAG, 0x0);
>                 if (++ds->output_seq =3D=3D 16)
>                         ds->output_seq =3D 0;
>
> @@ -1439,11 +1455,10 @@ static int dualsense_parse_report(struct ps_devic=
e *ps_dev, struct hid_report *r
>                 input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, =
active);
>
>                 if (active) {
> -                       int x =3D (point->x_hi << 8) | point->x_lo;
> -                       int y =3D (point->y_hi << 4) | point->y_lo;
> -
> -                       input_report_abs(ds->touchpad, ABS_MT_POSITION_X,=
 x);
> -                       input_report_abs(ds->touchpad, ABS_MT_POSITION_Y,=
 y);
> +                       input_report_abs(ds->touchpad, ABS_MT_POSITION_X,
> +                                        DS_TOUCH_POINT_X(point->x_hi, po=
int->x_lo));
> +                       input_report_abs(ds->touchpad, ABS_MT_POSITION_Y,
> +                                        DS_TOUCH_POINT_Y(point->y_hi, po=
int->y_lo));
>                 }
>         }
>         input_mt_sync_frame(ds->touchpad);
> @@ -2351,11 +2366,10 @@ static int dualshock4_parse_report(struct ps_devi=
ce *ps_dev, struct hid_report *
>                         input_mt_report_slot_state(ds4->touchpad, MT_TOOL=
_FINGER, active);
>
>                         if (active) {
> -                               int x =3D (point->x_hi << 8) | point->x_l=
o;
> -                               int y =3D (point->y_hi << 4) | point->y_l=
o;
> -
> -                               input_report_abs(ds4->touchpad, ABS_MT_PO=
SITION_X, x);
> -                               input_report_abs(ds4->touchpad, ABS_MT_PO=
SITION_Y, y);
> +                               input_report_abs(ds4->touchpad, ABS_MT_PO=
SITION_X,
> +                                                DS4_TOUCH_POINT_X(point-=
>x_hi, point->x_lo));
> +                               input_report_abs(ds4->touchpad, ABS_MT_PO=
SITION_Y,
> +                                                DS4_TOUCH_POINT_Y(point-=
>y_hi, point->y_lo));
>                         }
>                 }
>                 input_mt_sync_frame(ds4->touchpad);
>
> --
> 2.49.0
>
>

