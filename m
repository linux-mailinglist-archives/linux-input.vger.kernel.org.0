Return-Path: <linux-input+bounces-12752-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AA0AD2C84
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 06:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CB2F188F18E
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 04:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C98A22127A;
	Tue, 10 Jun 2025 04:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7L3M7ta"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2526F9DA;
	Tue, 10 Jun 2025 04:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529163; cv=none; b=K68yFXvabRNQt1lq5Shg+y19yeOY4GsNzdCSbn5z9//cH7sMMFi1PEmdW7M0LM/yadHJ6OR8LofNUQMF45IOZDkZ6k/MgeVCRBrdRvnRGne2DSWLE8b9LF22s1fJiO+cZm9JHsAvv3dZykcAUcST1ydNVPP3CAs91fYLEnLp7Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529163; c=relaxed/simple;
	bh=b0O05wj+08/t/NBKZHK9HTgRX5cvrl9aXrYxSBNPGvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPSW0B/cSNGtOagSAqaQ0iHisyzMoNQGy9LrX8DXA9R7qu3AQ3lwlIdMJkpsxdjNtVZB4AKspGwWNety9gLkY7Ie3Kjo8njpuw0IadbwNejNAB/72I3JNCe3K8S3sxiLh5fwUGNI+hSCnaj3EnNScoUIk6/sf46zW+bojFVY2FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7L3M7ta; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fad3400ea3so45873626d6.0;
        Mon, 09 Jun 2025 21:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749529160; x=1750133960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDwWZsF7tOLil4xnxkwj6Aqmfw71lSd8PGgC1ekj5cw=;
        b=c7L3M7ta4I9G7J/ulwfUXr0LYS/IRzQJLox+r06eeExP7Ne+Oh8s9GNzM/37awSJbP
         F5Q+C8XuHuGf/VetGkfQpcIi3Rp4UQlDT0wqRfDLukUtaHcmKrHj9dRQirx/k2xnymJA
         FwRE+JonsAVEiyuqXAu2TwEAK39ncvWauGdNYonPh9i22VO21uGgWlTcc4ozs8Eak818
         wiPP+zKlUolfZvCalDWwyfxmtSilHGCJukMU6mVzT9kJkWGyKro993TztzOhs+vzc3yJ
         5TxqIgSV68k5sQY7hxgFcdi4UFpm0kD9syZrs5nTEAE5AetgOxgTE5b8Pe93pY76Q4qz
         g1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749529160; x=1750133960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDwWZsF7tOLil4xnxkwj6Aqmfw71lSd8PGgC1ekj5cw=;
        b=jdfbPCaB70NDmwQrQbtnmo3Jyn3muv1BhkwV3bID4OCiH6GDP50ab6wpMTwfjJB/Wx
         CYjre1T1QSAHvpHcAnj9o3oaKUCZd9GBslWttA1+oFsm8b98u6HUf1PVrF8/lYnVKE/y
         MCOBtpK01Si+4q4G+IIjqdS1QGXR6OMw5ECcBHn06Hs7Rl1UIzY4mwMTCkOZs6vorSwE
         s8xO/82pV9BpEHMCsd2o/DkSMrZQv1u2UJIipBwYb+EOJpGg1aHRTpuFaBKSq/+nPPQp
         xbsDRsdp2w9yOlzB6K5ozOY0WOuhV+a5V4GtMSTN986s97G/tDLIchrHEqHyFs81/HHf
         BMWA==
X-Forwarded-Encrypted: i=1; AJvYcCU2JScfR5E9/exabVZmwjdhDEaShBb+NkThp5OQJec8XZuh8TAhlWwUeyvO1KiLxSuorf1tYnID3ww5ag==@vger.kernel.org, AJvYcCUEl/2pVIxj3JCOSoRHJila1x9l1O8e5B0qRLa4qalM/S54GgKlpQGZW7i2NbveFCrym3lE/307YmFV8iiJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxMd1ds4wLimb3TVeNoXjo/J3QO0KnO9NnECODpc02+bUskROIG
	+sQ7w05+ky0NYkusw5t2U+1WJ91LMaKtwIf0KVf+9iBqKCtTY0G2/dY01FUrnAlI4dTmNx97NnI
	aleelrzkwQv/NjR5JPU77uRzrc77AUyA=
X-Gm-Gg: ASbGncsiZTb2gLbVIwuxXJuhPGv5a1xvGvcHeplGTvyFfGL97yB1hupTbVqQSYw7j/H
	grOb3sIaD0+l3WdXXboEL+IJkJY8gHd+sYxfG1wylV4lhQ+3kNHb2B4nUYsA0P8/19MLF0J/Y0i
	8YU+JAg+Xhs1fQbd1r8wpVYWecAdYDLhz6mxUwgquT0WT+
X-Google-Smtp-Source: AGHT+IELMc4w+FC3TvxqMhFXlwkOdugSzmt1nBs0ctoVgynCHQcB6uWZYjXexRuzLsUGzk5+mw9BZJyXlicztbP5jM4=
X-Received: by 2002:ad4:5f0f:0:b0:6ed:15ce:e33e with SMTP id
 6a1803df08f44-6fb24c97620mr19093366d6.27.1749529160480; Mon, 09 Jun 2025
 21:19:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com> <20250526-dualsense-hid-jack-v1-2-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-2-a65fee4a60cc@collabora.com>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 9 Jun 2025 21:19:09 -0700
X-Gm-Features: AX0GCFtCoUDfE8vaVep0HfyZrJ07Y79cBDBV3PIIbnS2IrBavXxwS_7ITDsyFQU
Message-ID: <CAEc3jaAyybX3C80aB5p2Eeu+U2ZD_07Z_52=5Rn2TG-fqbN8DQ@mail.gmail.com>
Subject: Re: [PATCH 02/11] HID: playstation: Add spaces around arithmetic operators
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

We could change some of this. I guess checkpatch changed some output
since original submission or is more strict in --strict mode. Though I
have an opinion on these kind of silly patches.

Thanks,
Roderick

On Mon, May 26, 2025 at 5:52=E2=80=AFAM Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
>
> Get rid of several checkpatch.pl complaints:
>
>   CHECK: spaces preferred around that '*' (ctx:VxV)
>   CHECK: spaces preferred around that '/' (ctx:VxV)
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/hid/hid-playstation.c | 42 ++++++++++++++++++++++---------------=
-----
>  1 file changed, 22 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index 538194ce8902fe1383b57ac59743f32838dcb0df..a82174a21dcce6523a69a8ec3=
74a72504614cedc 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -155,9 +155,9 @@ struct ps_led_info {
>
>  /* DualSense hardware limits */
>  #define DS_ACC_RES_PER_G       8192
> -#define DS_ACC_RANGE           (4*DS_ACC_RES_PER_G)
> +#define DS_ACC_RANGE           (4 * DS_ACC_RES_PER_G)
>  #define DS_GYRO_RES_PER_DEG_S  1024
> -#define DS_GYRO_RANGE          (2048*DS_GYRO_RES_PER_DEG_S)
> +#define DS_GYRO_RANGE          (2048 * DS_GYRO_RES_PER_DEG_S)
>  #define DS_TOUCHPAD_WIDTH      1920
>  #define DS_TOUCHPAD_HEIGHT     1080
>
> @@ -364,9 +364,9 @@ struct dualsense_output_report {
>
>  /* DualShock4 hardware limits */
>  #define DS4_ACC_RES_PER_G      8192
> -#define DS4_ACC_RANGE          (4*DS_ACC_RES_PER_G)
> +#define DS4_ACC_RANGE          (4 * DS_ACC_RES_PER_G)
>  #define DS4_GYRO_RES_PER_DEG_S 1024
> -#define DS4_GYRO_RANGE         (2048*DS_GYRO_RES_PER_DEG_S)
> +#define DS4_GYRO_RANGE         (2048 * DS_GYRO_RES_PER_DEG_S)
>  #define DS4_LIGHTBAR_MAX_BLINK 255 /* 255 centiseconds */
>  #define DS4_TOUCHPAD_WIDTH     1920
>  #define DS4_TOUCHPAD_HEIGHT    942
> @@ -1016,19 +1016,19 @@ static int dualsense_get_calibration_data(struct =
dualsense *ds)
>         speed_2x =3D (gyro_speed_plus + gyro_speed_minus);
>         ds->gyro_calib_data[0].abs_code =3D ABS_RX;
>         ds->gyro_calib_data[0].bias =3D 0;
> -       ds->gyro_calib_data[0].sens_numer =3D speed_2x*DS_GYRO_RES_PER_DE=
G_S;
> +       ds->gyro_calib_data[0].sens_numer =3D speed_2x * DS_GYRO_RES_PER_=
DEG_S;
>         ds->gyro_calib_data[0].sens_denom =3D abs(gyro_pitch_plus - gyro_=
pitch_bias) +
>                         abs(gyro_pitch_minus - gyro_pitch_bias);
>
>         ds->gyro_calib_data[1].abs_code =3D ABS_RY;
>         ds->gyro_calib_data[1].bias =3D 0;
> -       ds->gyro_calib_data[1].sens_numer =3D speed_2x*DS_GYRO_RES_PER_DE=
G_S;
> +       ds->gyro_calib_data[1].sens_numer =3D speed_2x * DS_GYRO_RES_PER_=
DEG_S;
>         ds->gyro_calib_data[1].sens_denom =3D abs(gyro_yaw_plus - gyro_ya=
w_bias) +
>                         abs(gyro_yaw_minus - gyro_yaw_bias);
>
>         ds->gyro_calib_data[2].abs_code =3D ABS_RZ;
>         ds->gyro_calib_data[2].bias =3D 0;
> -       ds->gyro_calib_data[2].sens_numer =3D speed_2x*DS_GYRO_RES_PER_DE=
G_S;
> +       ds->gyro_calib_data[2].sens_numer =3D speed_2x * DS_GYRO_RES_PER_=
DEG_S;
>         ds->gyro_calib_data[2].sens_denom =3D abs(gyro_roll_plus - gyro_r=
oll_bias) +
>                         abs(gyro_roll_minus - gyro_roll_bias);
>
> @@ -1054,19 +1054,19 @@ static int dualsense_get_calibration_data(struct =
dualsense *ds)
>         range_2g =3D acc_x_plus - acc_x_minus;
>         ds->accel_calib_data[0].abs_code =3D ABS_X;
>         ds->accel_calib_data[0].bias =3D acc_x_plus - range_2g / 2;
> -       ds->accel_calib_data[0].sens_numer =3D 2*DS_ACC_RES_PER_G;
> +       ds->accel_calib_data[0].sens_numer =3D 2 * DS_ACC_RES_PER_G;
>         ds->accel_calib_data[0].sens_denom =3D range_2g;
>
>         range_2g =3D acc_y_plus - acc_y_minus;
>         ds->accel_calib_data[1].abs_code =3D ABS_Y;
>         ds->accel_calib_data[1].bias =3D acc_y_plus - range_2g / 2;
> -       ds->accel_calib_data[1].sens_numer =3D 2*DS_ACC_RES_PER_G;
> +       ds->accel_calib_data[1].sens_numer =3D 2 * DS_ACC_RES_PER_G;
>         ds->accel_calib_data[1].sens_denom =3D range_2g;
>
>         range_2g =3D acc_z_plus - acc_z_minus;
>         ds->accel_calib_data[2].abs_code =3D ABS_Z;
>         ds->accel_calib_data[2].bias =3D acc_z_plus - range_2g / 2;
> -       ds->accel_calib_data[2].sens_numer =3D 2*DS_ACC_RES_PER_G;
> +       ds->accel_calib_data[2].sens_numer =3D 2 * DS_ACC_RES_PER_G;
>         ds->accel_calib_data[2].sens_denom =3D range_2g;
>
>         /*
> @@ -1882,19 +1882,19 @@ static int dualshock4_get_calibration_data(struct=
 dualshock4 *ds4)
>         speed_2x =3D (gyro_speed_plus + gyro_speed_minus);
>         ds4->gyro_calib_data[0].abs_code =3D ABS_RX;
>         ds4->gyro_calib_data[0].bias =3D 0;
> -       ds4->gyro_calib_data[0].sens_numer =3D speed_2x*DS4_GYRO_RES_PER_=
DEG_S;
> +       ds4->gyro_calib_data[0].sens_numer =3D speed_2x * DS4_GYRO_RES_PE=
R_DEG_S;
>         ds4->gyro_calib_data[0].sens_denom =3D abs(gyro_pitch_plus - gyro=
_pitch_bias) +
>                         abs(gyro_pitch_minus - gyro_pitch_bias);
>
>         ds4->gyro_calib_data[1].abs_code =3D ABS_RY;
>         ds4->gyro_calib_data[1].bias =3D 0;
> -       ds4->gyro_calib_data[1].sens_numer =3D speed_2x*DS4_GYRO_RES_PER_=
DEG_S;
> +       ds4->gyro_calib_data[1].sens_numer =3D speed_2x * DS4_GYRO_RES_PE=
R_DEG_S;
>         ds4->gyro_calib_data[1].sens_denom =3D abs(gyro_yaw_plus - gyro_y=
aw_bias) +
>                         abs(gyro_yaw_minus - gyro_yaw_bias);
>
>         ds4->gyro_calib_data[2].abs_code =3D ABS_RZ;
>         ds4->gyro_calib_data[2].bias =3D 0;
> -       ds4->gyro_calib_data[2].sens_numer =3D speed_2x*DS4_GYRO_RES_PER_=
DEG_S;
> +       ds4->gyro_calib_data[2].sens_numer =3D speed_2x * DS4_GYRO_RES_PE=
R_DEG_S;
>         ds4->gyro_calib_data[2].sens_denom =3D abs(gyro_roll_plus - gyro_=
roll_bias) +
>                         abs(gyro_roll_minus - gyro_roll_bias);
>
> @@ -1905,19 +1905,19 @@ static int dualshock4_get_calibration_data(struct=
 dualshock4 *ds4)
>         range_2g =3D acc_x_plus - acc_x_minus;
>         ds4->accel_calib_data[0].abs_code =3D ABS_X;
>         ds4->accel_calib_data[0].bias =3D acc_x_plus - range_2g / 2;
> -       ds4->accel_calib_data[0].sens_numer =3D 2*DS4_ACC_RES_PER_G;
> +       ds4->accel_calib_data[0].sens_numer =3D 2 * DS4_ACC_RES_PER_G;
>         ds4->accel_calib_data[0].sens_denom =3D range_2g;
>
>         range_2g =3D acc_y_plus - acc_y_minus;
>         ds4->accel_calib_data[1].abs_code =3D ABS_Y;
>         ds4->accel_calib_data[1].bias =3D acc_y_plus - range_2g / 2;
> -       ds4->accel_calib_data[1].sens_numer =3D 2*DS4_ACC_RES_PER_G;
> +       ds4->accel_calib_data[1].sens_numer =3D 2 * DS4_ACC_RES_PER_G;
>         ds4->accel_calib_data[1].sens_denom =3D range_2g;
>
>         range_2g =3D acc_z_plus - acc_z_minus;
>         ds4->accel_calib_data[2].abs_code =3D ABS_Z;
>         ds4->accel_calib_data[2].bias =3D acc_z_plus - range_2g / 2;
> -       ds4->accel_calib_data[2].sens_numer =3D 2*DS4_ACC_RES_PER_G;
> +       ds4->accel_calib_data[2].sens_numer =3D 2 * DS4_ACC_RES_PER_G;
>         ds4->accel_calib_data[2].sens_denom =3D range_2g;
>
>  transfer_failed:
> @@ -2059,8 +2059,10 @@ static int dualshock4_led_set_blink(struct led_cla=
ssdev *led, unsigned long *del
>                 ds4->lightbar_blink_off =3D 50;
>         } else {
>                 /* Blink delays in centiseconds. */
> -               ds4->lightbar_blink_on =3D min_t(unsigned long, *delay_on=
/10, DS4_LIGHTBAR_MAX_BLINK);
> -               ds4->lightbar_blink_off =3D min_t(unsigned long, *delay_o=
ff/10, DS4_LIGHTBAR_MAX_BLINK);
> +               ds4->lightbar_blink_on =3D min_t(unsigned long, *delay_on=
 / 10,
> +                                              DS4_LIGHTBAR_MAX_BLINK);
> +               ds4->lightbar_blink_off =3D min_t(unsigned long, *delay_o=
ff / 10,
> +                                               DS4_LIGHTBAR_MAX_BLINK);
>         }
>
>         ds4->update_lightbar_blink =3D true;
> @@ -2340,7 +2342,7 @@ static int dualshock4_parse_report(struct ps_device=
 *ps_dev, struct hid_report *
>         /* Convert timestamp (in 5.33us unit) to timestamp_us */
>         sensor_timestamp =3D le16_to_cpu(ds4_report->sensor_timestamp);
>         if (!ds4->sensor_timestamp_initialized) {
> -               ds4->sensor_timestamp_us =3D DIV_ROUND_CLOSEST(sensor_tim=
estamp*16, 3);
> +               ds4->sensor_timestamp_us =3D DIV_ROUND_CLOSEST(sensor_tim=
estamp * 16, 3);
>                 ds4->sensor_timestamp_initialized =3D true;
>         } else {
>                 uint16_t delta;
> @@ -2349,7 +2351,7 @@ static int dualshock4_parse_report(struct ps_device=
 *ps_dev, struct hid_report *
>                         delta =3D (U16_MAX - ds4->prev_sensor_timestamp +=
 sensor_timestamp + 1);
>                 else
>                         delta =3D sensor_timestamp - ds4->prev_sensor_tim=
estamp;
> -               ds4->sensor_timestamp_us +=3D DIV_ROUND_CLOSEST(delta*16,=
 3);
> +               ds4->sensor_timestamp_us +=3D DIV_ROUND_CLOSEST(delta * 1=
6, 3);
>         }
>         ds4->prev_sensor_timestamp =3D sensor_timestamp;
>         input_event(ds4->sensors, EV_MSC, MSC_TIMESTAMP, ds4->sensor_time=
stamp_us);
>
> --
> 2.49.0
>
>

