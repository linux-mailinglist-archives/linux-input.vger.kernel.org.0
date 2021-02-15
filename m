Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2522531BB7C
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 15:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhBOO4E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 09:56:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbhBOO4C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 09:56:02 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42045C061574
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 06:55:22 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id r5so3233333wmp.1
        for <linux-input@vger.kernel.org>; Mon, 15 Feb 2021 06:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:to:cc:subject:from:references:in-reply-to:message-id
         :user-agent:mime-version:content-transfer-encoding;
        bh=8z3hP8fxlrfdeOw34bBiyifBBuTphu8VhO6k0Vmx4bI=;
        b=ai7OYA1ZNqNP2l5wG5cVaO4bikvCUSCAX8lz7T8n8oiCOCSrnVlmrcXEA6FomTPe3o
         5t7a9c/ycCG69g7oHZrWI+qy28L2gxoG/KB+RsCTidgygucsBhlZQkX4j3DGGhNiRvCv
         DYDyASsRrgy/a0qkGOUuTb8bLIw9PrqCgB8opH11vM2jDUgsGFYRWV6vUl6/XJ0+lso+
         Anu0DQEidUEaHZTFgrfTU8W8YL3cZ9ruqKcpTumIsfwMmTPLAbYjqqDChvBcsfLiWPhE
         P5q62qYFUtQFppEvqbDDzYhd3uFAWMi6nldDJZHsKnF2ei0ec7BBUqwwQNgeHKTPNp8H
         T5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:to:cc:subject:from:references:in-reply-to
         :message-id:user-agent:mime-version:content-transfer-encoding;
        bh=8z3hP8fxlrfdeOw34bBiyifBBuTphu8VhO6k0Vmx4bI=;
        b=Zc8qSoRcvxwwCtBI8l8ZZ0SbCsp5UQUh7bB1bkZq9r902lojfFpqoDgC1Ron2HSIFA
         NlTOeoB/rNn2mV68fyXtKA2U9y2QG+liYKRSxD9xg7aqykvewf46PoV7SKB0AD2Dyoc8
         SV/REUaH7Sw9i7ySXz13Xy7v9U4OtwYwe9K8qH1/wWtBndQFhsLGVOXMiSdWiIf5x7E1
         xcrjc3sUw+ed0Qw2y1NTQ7yq4ritQAoTRRxVlj44PuC3rXJgEbNWnbWbttba3dMJBGEa
         T4Z090F2IAQohjOl5zJsLMYnI27s20ex9RrtJe3joNVCd0qjEcRO3eKjqZyLMnHkVMFg
         u9EA==
X-Gm-Message-State: AOAM532H9F+W5nCJoHeUPK3/yGPwy24dGkGmYse0CtzW72fbP0Ni6aG7
        tWDPigEoDs6x1rdvY7puH8z8kSPT7dtbqdvw
X-Google-Smtp-Source: ABdhPJw/Hj9mszx46M0foWguB/MQtyjgC5zlM3WHafU5XgoJMgCAQuJATZRDGdAZhXTC7XXiXG9vMg==
X-Received: by 2002:a05:600c:2e48:: with SMTP id q8mr11406966wmf.88.1613400919715;
        Mon, 15 Feb 2021 06:55:19 -0800 (PST)
Received: from localhost ([2a02:169:1e9::acc])
        by smtp.gmail.com with ESMTPSA id o13sm33515036wrs.45.2021.02.15.06.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:55:19 -0800 (PST)
Date:   Mon, 15 Feb 2021 15:53:10 +0100
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net
Subject: Re: [PATCH v12 14/14] HID: nintendo: add IMU support
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20200823044157.339677-1-djogorchock@gmail.com>
 <20200823044157.339677-15-djogorchock@gmail.com>
In-Reply-To: <20200823044157.339677-15-djogorchock@gmail.com>
Message-Id: <2DQD9DNS62US5.3BLS7WE1BNTJQ@homearch.localdomain>
User-Agent: mblaze/1.1-4-g36df5fe (2021-01-22)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel

One comment below.

"Daniel J. Ogorchock" <djogorchock@gmail.com> wrote:
> This patch adds support for the controller's IMU. The accelerometer and
> gyro data are both provided to userspace using a second input device.
> The devices can be associated using their uniq value (set to the
> controller's MAC address).
>=20
> A large part of this patch's functionality was provided by Carl Mueller.
>=20
> The IMU device is blacklisted from the joydev input handler.
>=20
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> ---
>  drivers/hid/hid-nintendo.c | 503 ++++++++++++++++++++++++++++++++++++-
>  drivers/input/joydev.c     |  10 +
>  2 files changed, 501 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 80f33ab58a5e..9bbab3bbeaf1 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -2,7 +2,7 @@
>  /*
>   * HID driver for Nintendo Switch Joy-Cons and Pro Controllers
>   *
> - * Copyright (c) 2019 Daniel J. Ogorchock <djogorchock@gmail.com>
> + * Copyright (c) 2019-2020 Daniel J. Ogorchock <djogorchock@gmail.com>
>   *
>   * The following resources/projects were referenced for this driver:
>   *   https://github.com/dekuNukem/Nintendo_Switch_Reverse_Engineering
> @@ -26,6 +26,7 @@
>  #include <asm/unaligned.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/kernel.h>
>  #include <linux/hid.h>
>  #include <linux/input.h>
>  #include <linux/jiffies.h>
> @@ -115,6 +116,15 @@ static const u16 JC_CAL_USR_RIGHT_DATA_ADDR	=3D 0x80=
1D;
>  static const u16 JC_CAL_FCT_DATA_LEFT_ADDR	=3D 0x603d;
>  static const u16 JC_CAL_FCT_DATA_RIGHT_ADDR	=3D 0x6046;
> =20
> +/* SPI storage addresses of IMU factory calibration data */
> +static const u16 JC_IMU_CAL_FCT_DATA_ADDR	=3D 0x6020;
> +static const u16 JC_IMU_CAL_FCT_DATA_END	=3D 0x6037;
> +#define JC_IMU_CAL_DATA_SIZE \
> +	(JC_IMU_CAL_FCT_DATA_END - JC_IMU_CAL_FCT_DATA_ADDR + 1)
> +/* SPI storage addresses of IMU user calibration data */
> +static const u16 JC_IMU_CAL_USR_MAGIC_ADDR	=3D 0x8026;
> +static const u16 JC_IMU_CAL_USR_DATA_ADDR	=3D 0x8028;
> +
>  /* The raw analog joystick values will be mapped in terms of this magnit=
ude */
>  static const u16 JC_MAX_STICK_MAG		=3D 32767;
>  static const u16 JC_STICK_FUZZ			=3D 250;
> @@ -125,6 +135,47 @@ static const u16 JC_MAX_DPAD_MAG		=3D 1;
>  static const u16 JC_DPAD_FUZZ			/*=3D 0*/;
>  static const u16 JC_DPAD_FLAT			/*=3D 0*/;
> =20
> +/* Under most circumstances IMU reports are pushed every 15ms; use as de=
fault */
> +static const u16 JC_IMU_DFLT_AVG_DELTA_MS	=3D 15;
> +/* How many samples to sum before calculating average IMU report delta *=
/
> +static const u16 JC_IMU_SAMPLES_PER_DELTA_AVG	=3D 300;
> +/* Controls how many dropped IMU packets at once trigger a warning messa=
ge */
> +static const u16 JC_IMU_DROPPED_PKT_WARNING	=3D 3;
> +
> +/*
> + * The controller's accelerometer has a sensor resolution of 16bits and =
is
> + * configured with a range of +-8000 milliGs. Therefore, the resolution =
can be
> + * calculated thus: (2^16-1)/(8000 * 2) =3D 4.096 digits per milliG
> + * Resolution per G (rather than per millliG): 4.096 * 1000 =3D 4096 dig=
its per G
> + * Alternatively: 1/4096 =3D .0002441 Gs per digit
> + */
> +static const s32 JC_IMU_MAX_ACCEL_MAG		=3D 32767;
> +static const u16 JC_IMU_ACCEL_RES_PER_G		=3D 4096;
> +static const u16 JC_IMU_ACCEL_FUZZ		=3D 10;
> +static const u16 JC_IMU_ACCEL_FLAT		/*=3D 0*/;
> +
> +/*
> + * The controller's gyroscope has a sensor resolution of 16bits and is
> + * configured with a range of +-2000 degrees/second.
> + * Digits per dps: (2^16 -1)/(2000*2) =3D 16.38375
> + * dps per digit: 16.38375E-1 =3D .0610
> + *
> + * STMicro recommends in the datasheet to add 15% to the dps/digit. This=
 allows
> + * the full sensitivity range to be saturated without clipping. This yie=
lds more
> + * accurate results, so it's the technique this driver uses.
> + * dps per digit (corrected): .0610 * 1.15 =3D .0702
> + * digits per dps (corrected): .0702E-1 =3D 14.247
> + *
> + * Now, 14.247 truncating to 14 loses a lot of precision, so we rescale =
the
> + * min/max range by 1000.
> + */
> +static const s32 JC_IMU_PREC_RANGE_SCALE	=3D 1000;
> +/* Note: change mag and res_per_dps if prec_range_scale is ever altered =
*/
> +static const s32 JC_IMU_MAX_GYRO_MAG		=3D 32767000; /* (2^16-1)*1000 */
> +static const u16 JC_IMU_GYRO_RES_PER_DPS	=3D 14247; /* (14.247*1000) */
> +static const u16 JC_IMU_GYRO_FUZZ		=3D 10;
> +static const u16 JC_IMU_GYRO_FLAT		/*=3D 0*/;
> +
>  /* frequency/amplitude tables for rumble */
>  struct joycon_rumble_freq_data {
>  	u16 high;
> @@ -259,6 +310,11 @@ struct joycon_stick_cal {
>  	s32 center;
>  };
> =20
> +struct joycon_imu_cal {
> +	s16 offset[3];
> +	s16 scale[3];
> +};
> +
>  /*
>   * All the controller's button values are stored in a u32.
>   * They can be accessed with bitwise ANDs.
> @@ -306,6 +362,15 @@ struct joycon_subcmd_reply {
>  	u8 data[0]; /* will be at most 35 bytes */
>  } __packed;
> =20
> +struct joycon_imu_data {
> +	s16 accel_x;
> +	s16 accel_y;
> +	s16 accel_z;
> +	s16 gyro_x;
> +	s16 gyro_y;
> +	s16 gyro_z;
> +} __packed;
> +
>  struct joycon_input_report {
>  	u8 id;
>  	u8 timer;
> @@ -315,11 +380,11 @@ struct joycon_input_report {
>  	u8 right_stick[3];
>  	u8 vibrator_report;
> =20
> -	/*
> -	 * If support for firmware updates, gyroscope data, and/or NFC/IR
> -	 * are added in the future, this can be swapped for a union.
> -	 */
> -	struct joycon_subcmd_reply reply;
> +	union {
> +		struct joycon_subcmd_reply subcmd_reply;
> +		/* IMU input reports contain 3 samples */
> +		u8 imu_raw_bytes[sizeof(struct joycon_imu_data) * 3];
> +	};
>  } __packed;
> =20
>  #define JC_MAX_RESP_SIZE	(sizeof(struct joycon_input_report) + 35)
> @@ -360,6 +425,13 @@ struct joycon_ctlr {
>  	struct joycon_stick_cal right_stick_cal_x;
>  	struct joycon_stick_cal right_stick_cal_y;
> =20
> +	struct joycon_imu_cal accel_cal;
> +	struct joycon_imu_cal gyro_cal;
> +
> +	/* prevents needlessly recalculating these divisors every sample */
> +	s32 imu_cal_accel_divisor[3];
> +	s32 imu_cal_gyro_divisor[3];
> +
>  	/* power supply data */
>  	struct power_supply *battery;
>  	struct power_supply_desc battery_desc;
> @@ -379,6 +451,16 @@ struct joycon_ctlr {
>  	u16 rumble_rl_freq;
>  	u16 rumble_rh_freq;
>  	bool rumble_zero_amp;
> +
> +	/* imu */
> +	struct input_dev *imu_input;
> +	bool imu_first_packet_received; /* helps in initiating timestamp */
> +	unsigned int imu_timestamp_us; /* timestamp we report to userspace */
> +	unsigned int imu_last_pkt_ms; /* used to calc imu report delta */
> +	/* the following are used to track the average imu report time delta */=

> +	unsigned int imu_delta_samples_count;
> +	unsigned int imu_delta_samples_sum;
> +	unsigned int imu_avg_delta_ms;
>  };
> =20
>  /* Helper macros for checking controller type */
> @@ -563,7 +645,7 @@ static int joycon_request_spi_flash_read(struct joyco=
n_ctlr *ctlr,
>  	} else {
>  		report =3D (struct joycon_input_report *)ctlr->input_buf;
>  		/* The read data starts at the 6th byte */
> -		*reply =3D &report->reply.data[5];
> +		*reply =3D &report->subcmd_reply.data[5];
>  	}
>  	return ret;
>  }
> @@ -723,6 +805,94 @@ static int joycon_request_calibration(struct joycon_=
ctlr *ctlr)
>  	return 0;
>  }
> =20
> +/*
> + * These divisors are calculated once rather than for each sample. They =
are only
> + * dependent on the IMU calibration values. They are used when processin=
g the
> + * IMU input reports.
> + */
> +static void joycon_calc_imu_cal_divisors(struct joycon_ctlr *ctlr)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < 3; i++) {
> +		ctlr->imu_cal_accel_divisor[i] =3D ctlr->accel_cal.scale[i] -
> +						ctlr->accel_cal.offset[i];
> +		ctlr->imu_cal_gyro_divisor[i] =3D ctlr->gyro_cal.scale[i] -
> +						ctlr->gyro_cal.offset[i];
> +	}
> +}
> +
> +static const s16 DFLT_ACCEL_OFFSET /*=3D 0*/;
> +static const s16 DFLT_ACCEL_SCALE =3D 16384;
> +static const s16 DFLT_GYRO_OFFSET /*=3D 0*/;
> +static const s16 DFLT_GYRO_SCALE  =3D 13371;
> +static int joycon_request_imu_calibration(struct joycon_ctlr *ctlr)
> +{
> +	u16 imu_cal_addr =3D JC_IMU_CAL_FCT_DATA_ADDR;
> +	u8 *raw_cal;
> +	int ret;
> +	int i;
> +
> +	/* check if user calibration exists */
> +	if (!joycon_check_for_cal_magic(ctlr, JC_IMU_CAL_USR_MAGIC_ADDR)) {
> +		imu_cal_addr =3D JC_IMU_CAL_USR_DATA_ADDR;
> +		hid_info(ctlr->hdev, "using user cal for IMU\n");
> +	} else {
> +		hid_info(ctlr->hdev, "using factory cal for IMU\n");
> +	}
> +
> +	/* request IMU calibration data */
> +	hid_dbg(ctlr->hdev, "requesting IMU cal data\n");
> +	ret =3D joycon_request_spi_flash_read(ctlr, imu_cal_addr,
> +					    JC_IMU_CAL_DATA_SIZE, &raw_cal);
> +	if (ret) {
> +		hid_warn(ctlr->hdev,
> +			 "Failed to read IMU cal, using defaults; ret=3D%d\n",
> +			 ret);
> +
> +		for (i =3D 0; i < 3; i++) {
> +			ctlr->accel_cal.offset[i] =3D DFLT_ACCEL_OFFSET;
> +			ctlr->accel_cal.scale[i] =3D DFLT_ACCEL_SCALE;
> +			ctlr->gyro_cal.offset[i] =3D DFLT_GYRO_OFFSET;
> +			ctlr->gyro_cal.scale[i] =3D DFLT_GYRO_SCALE;
> +		}
> +		joycon_calc_imu_cal_divisors(ctlr);
> +		return ret;
> +	}
> +
> +	/* IMU calibration parsing */
> +	for (i =3D 0; i < 3; i++) {
> +		int j =3D i * 2;
> +
> +		ctlr->accel_cal.offset[i] =3D get_unaligned_le16(raw_cal + j);
> +		ctlr->accel_cal.scale[i] =3D get_unaligned_le16(raw_cal + j + 6);
> +		ctlr->gyro_cal.offset[i] =3D get_unaligned_le16(raw_cal + j + 12);
> +		ctlr->gyro_cal.scale[i] =3D get_unaligned_le16(raw_cal + j + 18);
> +	}
> +
> +	joycon_calc_imu_cal_divisors(ctlr);
> +
> +	hid_dbg(ctlr->hdev, "IMU calibration:\n"
> +			    "a_o[0]=3D%d a_o[1]=3D%d a_o[2]=3D%d\n"
> +			    "a_s[0]=3D%d a_s[1]=3D%d a_s[2]=3D%d\n"
> +			    "g_o[0]=3D%d g_o[1]=3D%d g_o[2]=3D%d\n"
> +			    "g_s[0]=3D%d g_s[1]=3D%d g_s[2]=3D%d\n",
> +			    ctlr->accel_cal.offset[0],
> +			    ctlr->accel_cal.offset[1],
> +			    ctlr->accel_cal.offset[2],
> +			    ctlr->accel_cal.scale[0],
> +			    ctlr->accel_cal.scale[1],
> +			    ctlr->accel_cal.scale[2],
> +			    ctlr->gyro_cal.offset[0],
> +			    ctlr->gyro_cal.offset[1],
> +			    ctlr->gyro_cal.offset[2],
> +			    ctlr->gyro_cal.scale[0],
> +			    ctlr->gyro_cal.scale[1],
> +			    ctlr->gyro_cal.scale[2]);
> +
> +	return 0;
> +}
> +
>  static int joycon_set_report_mode(struct joycon_ctlr *ctlr)
>  {
>  	struct joycon_subcmd_request *req;
> @@ -749,6 +919,19 @@ static int joycon_enable_rumble(struct joycon_ctlr *=
ctlr, bool enable)
>  	return joycon_send_subcmd(ctlr, req, 1, HZ/4);
>  }
> =20
> +static int joycon_enable_imu(struct joycon_ctlr *ctlr, bool enable)

The 'enable' parameter is always true when the function is called. Maybe
it would be better to get rid of it?


Cheers,

Silvan
