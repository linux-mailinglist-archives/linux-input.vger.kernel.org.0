Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF61675D2B1
	for <lists+linux-input@lfdr.de>; Fri, 21 Jul 2023 21:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbjGUTCh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jul 2023 15:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjGUTCg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jul 2023 15:02:36 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234F830CA
        for <linux-input@vger.kernel.org>; Fri, 21 Jul 2023 12:02:34 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9352ff1aeso34378821fa.1
        for <linux-input@vger.kernel.org>; Fri, 21 Jul 2023 12:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689966152; x=1690570952;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ow3sxsSnSGWEp1O0lgbN3xBRonUn73PCYXlCSJDL5Og=;
        b=BuXsmZOEcWlro2lanCLi2qH86fZyWngCPOIJtfibpRnLAUTG1nDO4nPLSxBt2keB/1
         Uex+9OCV9S6vEPUPVz37ry1naTLuMI1IfGJNXacQpJsO8gG3A6xop7nUzlXDJ5hbONrK
         bY7ItlKvntHayVBrzlE+gMLZ4K7IGYxP1uUYcrbRkqgmBRC9zFv+c5+JhaXv56uwP3G7
         OECCRWuVA+WhYTtq6SXXyVe3tfPWFk8YtFG5Q2UnqC1GoJknv/IPPLtrlRn+LAOUEgHW
         LY18Zs83/R7/fQGcukkAtu8Nws4XUNBktkAxsuWWFWEZlQ1SE246A3v6KSRg2ECR4sP1
         B00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689966152; x=1690570952;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ow3sxsSnSGWEp1O0lgbN3xBRonUn73PCYXlCSJDL5Og=;
        b=PiZh/3FHfq7MZ4F/dg1/78m4g8hukOyFk6SJcHb/r3DL2DMVWCW4qGAadTs8xofznG
         3y7lRVAFPNbAiaWojtf2lg8X1MVMUSIgtn76CG+EQ1JJXT2C+T/9nE/bMM4YanHAaqQr
         wXrCBkVXp/UpA8WROlxnSXUn0PYfoDdj8WiubZko2gwwH5kZ6Z6LeTFSf3ImilAE9ykS
         kXAL201goqKRafqBk7ivRj6Cam+AOsf9pnyuEdjeiVG1yrM7MuiNJoMoTplJDRtdgJGY
         tf1cu0Rvq2Qb+PyCIbp8q2leYhyxnVp7/fN+dpPDZpOe97DekXcSINwJA1lHDpNj5QBp
         +Gcg==
X-Gm-Message-State: ABy/qLa5Hum0tsrbJSbjOYifPhuEMe+ppauaD8Tib/IQhQDBVJZiWOD2
        aH7YmOpOhwk/mFOJfPnH/20=
X-Google-Smtp-Source: APBJJlHpLSfg5c09yyxY1TXy4s80sIYAO0FWOR6gWpmgE+QrGAyjihD9mxlBoZbNeL9+Vfti/L2+Yg==
X-Received: by 2002:a2e:9c10:0:b0:2b6:eceb:9bb with SMTP id s16-20020a2e9c10000000b002b6eceb09bbmr1932523lji.45.1689966151916;
        Fri, 21 Jul 2023 12:02:31 -0700 (PDT)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id h19-20020a1709063c1300b009828e26e519sm2497050ejg.122.2023.07.21.12.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:02:31 -0700 (PDT)
Date:   Fri, 21 Jul 2023 21:02:30 +0200
To:     Martino Fontana <tinozzo123@gmail.com>
Cc:     linux-input@vger.kernel.org, tinozzo123@gmail.com
Subject: Re: [PATCH v2] HID: nintendo: reinitialize USB Pro Controller after
 resuming from suspend
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <27ZF1I9PL9SUH.27UHPHBWRZ1LC@homearch.localdomain>
 <20230720233150.57164-2-tinozzo123@gmail.com>
In-Reply-To: <20230720233150.57164-2-tinozzo123@gmail.com>
Message-Id: <38NABT0Q0GDC0.32EJOTLAGT0T2@homearch.localdomain>
User-Agent: mblaze/1.2-21-g48dd346 (2023-07-08)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Martino Fontana <tinozzo123@gmail.com> wrote:
> When suspending the computer, a Switch Pro Controller connected via USB w=
ill
> lose its internal status. However, because the USB connection was technic=
ally
> never lost, when resuming the computer, the driver will attempt to commun=
icate
> with the controller as if nothing happened (and fail).
> Because of this, the user was forced to manually disconnect the controlle=
r
> (or to press the sync button on the controller to power it off), so that =
it
> can be re-initialized.
>=20
> With this patch, the controller will be automatically re-initialized afte=
r
> resuming from suspend.
>=20
> Fixes https://bugzilla.kernel.org/show_bug.cgi?id=3D216233
>=20
> Signed-off-by: Martino Fontana <tinozzo123@gmail.com>

It would be good to add a small section about what changed between v1
and v2 of the patch. Here is an example for how this can be done.

https://lore.kernel.org/lkml/cover.b24362332ec6099bc8db4e8e06a67545c653291d=
.1689842332.git-series.apopple@nvidia.com/T/#m73dd8d44f40742e67cbb0d4f030a9=
0b6264a88d3

It's probably not worth resending this patch just for this though. Just
something to keep in mind if there will be another patch version needed.

Cheers,
Silvan

> ---
>  drivers/hid/hid-nintendo.c | 178 ++++++++++++++++++++++---------------
>  1 file changed, 106 insertions(+), 72 deletions(-)
>=20
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 250f5d2f8..a5ebe857a 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -2088,7 +2088,9 @@ static int joycon_read_info(struct joycon_ctlr *ctl=
r)
>  	struct joycon_input_report *report;
> =20
>  	req.subcmd_id =3D JC_SUBCMD_REQ_DEV_INFO;
> +	mutex_lock(&ctlr->output_mutex);
>  	ret =3D joycon_send_subcmd(ctlr, &req, 0, HZ);
> +	mutex_unlock(&ctlr->output_mutex);
>  	if (ret) {
>  		hid_err(ctlr->hdev, "Failed to get joycon info; ret=3D%d\n", ret);
>  		return ret;
> @@ -2117,6 +2119,88 @@ static int joycon_read_info(struct joycon_ctlr *ct=
lr)
>  	return 0;
>  }
> =20
> +static int joycon_init(struct hid_device *hdev)
> +{
> +	struct joycon_ctlr *ctlr =3D hid_get_drvdata(hdev);
> +	int ret =3D 0;
> +
> +	mutex_lock(&ctlr->output_mutex);
> +	/* if handshake command fails, assume ble pro controller */
> +	if ((jc_type_is_procon(ctlr) || jc_type_is_chrggrip(ctlr)) &&
> +	    !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
> +		hid_dbg(hdev, "detected USB controller\n");
> +		/* set baudrate for improved latency */
> +		ret =3D joycon_send_usb(ctlr, JC_USB_CMD_BAUDRATE_3M, HZ);
> +		if (ret) {
> +			hid_err(hdev, "Failed to set baudrate; ret=3D%d\n", ret);
> +			goto err_mutex;
> +		}
> +		/* handshake */
> +		ret =3D joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ);
> +		if (ret) {
> +			hid_err(hdev, "Failed handshake; ret=3D%d\n", ret);
> +			goto err_mutex;
> +		}
> +		/*
> +		 * Set no timeout (to keep controller in USB mode).
> +		 * This doesn't send a response, so ignore the timeout.
> +		 */
> +		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
> +	} else if (jc_type_is_chrggrip(ctlr)) {
> +		hid_err(hdev, "Failed charging grip handshake\n");
> +		ret =3D -ETIMEDOUT;
> +		goto err_mutex;
> +	}
> +
> +	/* get controller calibration data, and parse it */
> +	ret =3D joycon_request_calibration(ctlr);
> +	if (ret) {
> +		/*
> +		 * We can function with default calibration, but it may be
> +		 * inaccurate. Provide a warning, and continue on.
> +		 */
> +		hid_warn(hdev, "Analog stick positions may be inaccurate\n");
> +	}
> +
> +	/* get IMU calibration data, and parse it */
> +	ret =3D joycon_request_imu_calibration(ctlr);
> +	if (ret) {
> +		/*
> +		 * We can function with default calibration, but it may be
> +		 * inaccurate. Provide a warning, and continue on.
> +		 */
> +		hid_warn(hdev, "Unable to read IMU calibration data\n");
> +	}
> +
> +	/* Set the reporting mode to 0x30, which is the full report mode */
> +	ret =3D joycon_set_report_mode(ctlr);
> +	if (ret) {
> +		hid_err(hdev, "Failed to set report mode; ret=3D%d\n", ret);
> +		goto err_mutex;
> +	}
> +
> +	/* Enable rumble */
> +	ret =3D joycon_enable_rumble(ctlr);
> +	if (ret) {
> +		hid_err(hdev, "Failed to enable rumble; ret=3D%d\n", ret);
> +		goto err_mutex;
> +	}
> +
> +	/* Enable the IMU */
> +	ret =3D joycon_enable_imu(ctlr);
> +	if (ret) {
> +		hid_err(hdev, "Failed to enable the IMU; ret=3D%d\n", ret);
> +		goto err_mutex;
> +	}
> +
> +	mutex_unlock(&ctlr->output_mutex);
> +	return 0;
> +
> +err_mutex:
> +	mutex_unlock(&ctlr->output_mutex);
> +	return ret;
> +}
> +
>  /* Common handler for parsing inputs */
>  static int joycon_ctlr_read_handler(struct joycon_ctlr *ctlr, u8 *data,
>  							      int size)
> @@ -2248,85 +2332,19 @@ static int nintendo_hid_probe(struct hid_device *=
hdev,
> =20
>  	hid_device_io_start(hdev);
> =20
> -	/* Initialize the controller */
> -	mutex_lock(&ctlr->output_mutex);
> -	/* if handshake command fails, assume ble pro controller */
> -	if ((jc_type_is_procon(ctlr) || jc_type_is_chrggrip(ctlr)) &&
> -	    !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
> -		hid_dbg(hdev, "detected USB controller\n");
> -		/* set baudrate for improved latency */
> -		ret =3D joycon_send_usb(ctlr, JC_USB_CMD_BAUDRATE_3M, HZ);
> -		if (ret) {
> -			hid_err(hdev, "Failed to set baudrate; ret=3D%d\n", ret);
> -			goto err_mutex;
> -		}
> -		/* handshake */
> -		ret =3D joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ);
> -		if (ret) {
> -			hid_err(hdev, "Failed handshake; ret=3D%d\n", ret);
> -			goto err_mutex;
> -		}
> -		/*
> -		 * Set no timeout (to keep controller in USB mode).
> -		 * This doesn't send a response, so ignore the timeout.
> -		 */
> -		joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
> -	} else if (jc_type_is_chrggrip(ctlr)) {
> -		hid_err(hdev, "Failed charging grip handshake\n");
> -		ret =3D -ETIMEDOUT;
> -		goto err_mutex;
> -	}
> -
> -	/* get controller calibration data, and parse it */
> -	ret =3D joycon_request_calibration(ctlr);
> -	if (ret) {
> -		/*
> -		 * We can function with default calibration, but it may be
> -		 * inaccurate. Provide a warning, and continue on.
> -		 */
> -		hid_warn(hdev, "Analog stick positions may be inaccurate\n");
> -	}
> -
> -	/* get IMU calibration data, and parse it */
> -	ret =3D joycon_request_imu_calibration(ctlr);
> -	if (ret) {
> -		/*
> -		 * We can function with default calibration, but it may be
> -		 * inaccurate. Provide a warning, and continue on.
> -		 */
> -		hid_warn(hdev, "Unable to read IMU calibration data\n");
> -	}
> -
> -	/* Set the reporting mode to 0x30, which is the full report mode */
> -	ret =3D joycon_set_report_mode(ctlr);
> -	if (ret) {
> -		hid_err(hdev, "Failed to set report mode; ret=3D%d\n", ret);
> -		goto err_mutex;
> -	}
> -
> -	/* Enable rumble */
> -	ret =3D joycon_enable_rumble(ctlr);
> -	if (ret) {
> -		hid_err(hdev, "Failed to enable rumble; ret=3D%d\n", ret);
> -		goto err_mutex;
> -	}
> -
> -	/* Enable the IMU */
> -	ret =3D joycon_enable_imu(ctlr);
> +	ret =3D joycon_init(hdev);
>  	if (ret) {
> -		hid_err(hdev, "Failed to enable the IMU; ret=3D%d\n", ret);
> -		goto err_mutex;
> +		hid_err(hdev, "Failed to initialize controller; ret=3D%d\n", ret);
> +		goto err_close;
>  	}
> =20
>  	ret =3D joycon_read_info(ctlr);
>  	if (ret) {
>  		hid_err(hdev, "Failed to retrieve controller info; ret=3D%d\n",
>  			ret);
> -		goto err_mutex;
> +		goto err_close;
>  	}
> =20
> -	mutex_unlock(&ctlr->output_mutex);
> -
>  	/* Initialize the leds */
>  	ret =3D joycon_leds_create(ctlr);
>  	if (ret) {
> @@ -2352,8 +2370,6 @@ static int nintendo_hid_probe(struct hid_device *hd=
ev,
>  	hid_dbg(hdev, "probe - success\n");
>  	return 0;
> =20
> -err_mutex:
> -	mutex_unlock(&ctlr->output_mutex);
>  err_close:
>  	hid_hw_close(hdev);
>  err_stop:
> @@ -2383,6 +2399,20 @@ static void nintendo_hid_remove(struct hid_device =
*hdev)
>  	hid_hw_stop(hdev);
>  }
> =20
> +#ifdef CONFIG_PM
> +
> +static int nintendo_hid_resume(struct hid_device *hdev)
> +{
> +	int ret =3D joycon_init(hdev);
> +
> +	if (ret)
> +		hid_err(hdev, "Failed to restore controller after resume");
> +
> +	return ret;
> +}
> +
> +#endif
> +
>  static const struct hid_device_id nintendo_hid_devices[] =3D {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
>  			 USB_DEVICE_ID_NINTENDO_PROCON) },
> @@ -2404,6 +2434,10 @@ static struct hid_driver nintendo_hid_driver =3D {=

>  	.probe		=3D nintendo_hid_probe,
>  	.remove		=3D nintendo_hid_remove,
>  	.raw_event	=3D nintendo_hid_event,
> +
> +#ifdef CONFIG_PM
> +	.resume		=3D nintendo_hid_resume,
> +#endif
>  };
>  module_hid_driver(nintendo_hid_driver);
> =20


