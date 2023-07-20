Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F263C75B857
	for <lists+linux-input@lfdr.de>; Thu, 20 Jul 2023 21:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjGTTyl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jul 2023 15:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjGTTyk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jul 2023 15:54:40 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343372118
        for <linux-input@vger.kernel.org>; Thu, 20 Jul 2023 12:54:39 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fbc0314a7bso1846253e87.2
        for <linux-input@vger.kernel.org>; Thu, 20 Jul 2023 12:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689882877; x=1690487677;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+mn9HlYrjFpygr87Eq5TvXtz3QjihYAGbumCv9YcCkU=;
        b=ipUZxZXgY1N5dVMTPafA0pRyrzb91k0lMLjF8DnpDa8MXMcUYmG1RzIs97ZP+wzM31
         TrzZpTMK8clLRXinwYMKATxMCsZdz2C7QGVCtOIjXij9SAXnssrJ6gbENIT5e4XQpqie
         Zkp2NWfakh4KYLSJL0OnT2BF2ku6ptoMMZ9yg1dvJHfEPgBO3FZ/a1QBl4ZAVjB7B8rt
         rdmNVfRRiGAY6AsscCoextcQPPqX4rs1c4dmkPwiy5PFBH1Svk2VIeb+Ntmmso+iuhRj
         q3pZDf9Zbte+Js8PDAhI6imVLjg1yMytDqidQ70fVJNgxF2Wx2UfLUUHnqImgQhYTGyx
         W8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689882877; x=1690487677;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+mn9HlYrjFpygr87Eq5TvXtz3QjihYAGbumCv9YcCkU=;
        b=NYYDopsPBMqFFKXPaF1oQERKRyRLysob35BMyzcS1aZaqXSg7xlkMhEywU5zzZgcxT
         T+puUQhTXZf0z5EOhbvsyQCzx4UXYd1I0/b6iehm2rSR/34Du7ArqTfn/jBN91BLmzN0
         NIF4MI1pMA5mu72tJglyl7wpdHkxnvu2Wo/hf7As5EcYKv1aIyRvpIP2y+WiydqnCG/F
         jpk2CXUOrFZrkLhvuA3l6ZzwevT53vNQ4tDU/7tHuSfyJF75tS2YO7G82/VIuLDnmwWy
         qGKoFnqMIebIzPHXEFXA/euOz7rlPzDJsUHKWDYmbebWLt7RY547+tI7n9Gp+BHPPy6y
         cEzA==
X-Gm-Message-State: ABy/qLY3fmvsrGWBk5vY4bl62YQCdNTXIhbKPbMtZKYuUAHg3aF0DDdo
        G2oqoue1K42ps9nP3ThKuVU3Ft1grrQ=
X-Google-Smtp-Source: APBJJlFRUyJFKEwNALzh8zsiAjKDcaPc9S+/cQUX/dVPqrDmBEft2HA0UVH79Rr/QislWPFxq0ffaQ==
X-Received: by 2002:ac2:4c1a:0:b0:4fb:8a92:4fba with SMTP id t26-20020ac24c1a000000b004fb8a924fbamr2492329lfq.25.1689882876839;
        Thu, 20 Jul 2023 12:54:36 -0700 (PDT)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id e22-20020a50fb96000000b0051a5cf5fcaasm1149435edq.23.2023.07.20.12.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 12:54:36 -0700 (PDT)
Date:   Thu, 20 Jul 2023 21:53:00 +0200
To:     Martino Fontana <tinozzo123@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: nintendo: reinitialize USB Pro Controller after
 resuming from suspend
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20230712121042.25318-2-tinozzo123@gmail.com>
In-Reply-To: <20230712121042.25318-2-tinozzo123@gmail.com>
Message-Id: <27ZF1I9PL9SUH.27UHPHBWRZ1LC@homearch.localdomain>
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

Hi

Thanks for the patch!

Some comments below.

Martino Fontana <tinozzo123@gmail.com> wrote:
> When suspending the computer, a Switch Pro Controller connected via USB w=
ill lose its internal status.
> However, because the USB connection was technically never lost, when resu=
ming the computer, the driver will attempt to communicate with the controll=
er as if nothing happened (and fail).
> Because of this, the user was forced to manually disconnect the controlle=
r (or to press the sync button on the controller to power it off), so that =
it can be re-initialized.
>=20
> With this patch, the controller will be automatically re-initialized afte=
r resuming from suspend.

The commit message would read nicer when wrapped around 78 chars or so.


> Fixes https://bugzilla.kernel.org/show_bug.cgi?id=3D216233
>=20
> Signed-off-by: Martino Fontana <tinozzo123@gmail.com>
> ---
>  drivers/hid/hid-nintendo.c | 178 ++++++++++++++++++++++---------------
>  1 file changed, 106 insertions(+), 72 deletions(-)
>=20
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 250f5d2f8..586c7f8d7 100644
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

Removing this empty line would be more consistent with the rest of
the code.


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
> +	.resume	          =3D nintendo_hid_resume,

We shouldn't mix tabs and spaces for formatting here.


Cheers,
Silvan

> +#endif
>  };
>  module_hid_driver(nintendo_hid_driver);
> =20


