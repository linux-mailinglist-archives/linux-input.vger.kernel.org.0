Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE9C75B878
	for <lists+linux-input@lfdr.de>; Thu, 20 Jul 2023 22:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjGTUE2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jul 2023 16:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjGTUE2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jul 2023 16:04:28 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D9301BE2
        for <linux-input@vger.kernel.org>; Thu, 20 Jul 2023 13:04:26 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-991ef0b464cso503486066b.0
        for <linux-input@vger.kernel.org>; Thu, 20 Jul 2023 13:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689883465; x=1690488265;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dDFIAcwAcuPukeSsVlebeH8uoYZwF3kck16WI+jf71k=;
        b=l/Yk9L0HIBEIX2FVSMhGo5e4FICTGtV11EMDMbkEMju08l714+s5E8WsmNL2+4IJK7
         JrxWYvOInsSsNwHo6V3P3AkRSnt9gyNjCL8atqGx0xnLcGEpKp7MQhEH2bpmKRWIHtK9
         ECmxNj+dhEWSDiHg9cgTV2ADLtkNyGD4DX3oxy9vyPZ5ngHKh2Ey6WHuyX1Wb47YGmBX
         hviZd0eYzu2x1hBB/qSPx5JbHfIEa5HsQ6C80sI6D/b7s0aW/WN+EzpFHIk1MZtoG2oC
         xNVFclwZZIjGRXh3xbDyGT3JNwP3j2vgR/pUUouv4Y/7J22S6Zm/6/OPLo4jlOUshFLX
         aA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689883465; x=1690488265;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dDFIAcwAcuPukeSsVlebeH8uoYZwF3kck16WI+jf71k=;
        b=ewDKE4H9EO734WOW2RSQHDAUvzDLgj89SgvpHPfROSvzfxVz4TwlSVxHhVa9nT7P60
         w0PfsP4v3Q2T1p7NQHneKU7YN8Ppa/ImtqoYc5l0s0pVFuhjRfX7/pMtHl6RHnEGjx1q
         UB0X4c/B6Atiq6zwQ8qSOj/E/rn4rEAg84Gsdabq16EeQJGabdczOGbd+HPwpIwngUVM
         +AtAxTEAj70racVw7yO+g8NJft2Y8sfGXOQWZgEx4rubezsJN5gv4PlcWUs1mU7CPMza
         7c05APpIJP8hO9kubW1hWDFBp5MPvoIeDNPaU0dR+YfNh9C5CI34SXJeHSDPa7U3CdwH
         hcug==
X-Gm-Message-State: ABy/qLZODL5m70q+0QwZNjswHP+e+9l3m3zvEj2Ncol7nhFZpc/V0pSJ
        usj4U2WduuDO3JNErMD905A=
X-Google-Smtp-Source: APBJJlHFvkYh11Mh5oKyzT2G+7skuBqNHnx/Z/4efe2575Ss37//DwwSLDIHI9pmX3bBf1bc0GzY7g==
X-Received: by 2002:a17:906:9f25:b0:98e:2413:952f with SMTP id fy37-20020a1709069f2500b0098e2413952fmr6783365ejc.18.1689883464439;
        Thu, 20 Jul 2023 13:04:24 -0700 (PDT)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id qk15-20020a170906d9cf00b009929d998ab6sm1105095ejb.131.2023.07.20.13.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 13:04:24 -0700 (PDT)
Date:   Thu, 20 Jul 2023 22:04:23 +0200
To:     Martino Fontana <tinozzo123@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: nintendo: cleanup LED code
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20230712121433.26134-1-tinozzo123@gmail.com>
In-Reply-To: <20230712121433.26134-1-tinozzo123@gmail.com>
Message-Id: <2KDZBNL37MH80.3RZBUHZA85LM7@homearch.localdomain>
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

Hi!

Some comments inline below.

Martino Fontana <tinozzo123@gmail.com> wrote:
> - Only turn on the nth LED, instead of all the LEDs up to n. This better =
matches Nintendo consoles' behaviour, as they never turn on more than one L=
ED (still not a complete match, see https://bugzilla.kernel.org/show_bug.cg=
i?id=3D216225)
> - Split part of `joycon_home_led_brightness_set` (which is called by hid)=
 into `joycon_set_home_led` (which is what actually sets the LEDs), for con=
sistency with player LEDs
> - Instead of first registering the `led_classdev`, then attempting to set=
 the LED and unregistering the `led_classdev` if it fails, first attempt to=
 set the LED, then register the `led_classdev` only if it succeeds (the cla=
ss is still filled up in either case)
> - If setting player LEDs fails, still attempt setting the home LED (I don=
't know if this is actually possible, but who knows...)
> - Use `JC_NUM_LEDS` when appropriate instead of 4
> - Print return codes

Wrapping the git commit message around 78 chars or so is conventional.

=20
> Signed-off-by: Martino Fontana <tinozzo123@gmail.com>
> ---
>  drivers/hid/hid-nintendo.c | 116 ++++++++++++++++++-------------------
>  1 file changed, 55 insertions(+), 61 deletions(-)
>=20
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 586c7f8d7..89631e19b 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -699,6 +699,25 @@ static int joycon_set_player_leds(struct joycon_ctlr=
 *ctlr, u8 flash, u8 on)
>  	return joycon_send_subcmd(ctlr, req, 1, HZ/4);
>  }
> =20
> +static int joycon_set_home_led(struct joycon_ctlr *ctlr, enum led_bright=
ness brightness)
> +{
> +	struct joycon_subcmd_request *req;
> +	u8 buffer[sizeof(*req) + 5] =3D { 0 };
> +	u8 *data;
> +
> +	req =3D (struct joycon_subcmd_request *)buffer;
> +	req->subcmd_id =3D JC_SUBCMD_SET_HOME_LIGHT;
> +	data =3D req->data;
> +	data[0] =3D 0x01;
> +	data[1] =3D brightness << 4;
> +	data[2] =3D brightness | (brightness << 4);
> +	data[3] =3D 0x11;
> +	data[4] =3D 0x11;
> +
> +	hid_dbg(ctlr->hdev, "setting home led brightness\n");
> +	return joycon_send_subcmd(ctlr, req, 5, HZ/4);
> +}
> +
>  static int joycon_request_spi_flash_read(struct joycon_ctlr *ctlr,
>  					 u32 start_addr, u8 size, u8 **reply)
>  {
> @@ -1849,7 +1868,6 @@ static int joycon_player_led_brightness_set(struct =
led_classdev *led,
>  	int val =3D 0;
>  	int i;
>  	int ret;
> -	int num;
> =20
>  	ctlr =3D hid_get_drvdata(hdev);
>  	if (!ctlr) {
> @@ -1857,21 +1875,10 @@ static int joycon_player_led_brightness_set(struc=
t led_classdev *led,
>  		return -ENODEV;
>  	}
> =20
> -	/* determine which player led this is */
> -	for (num =3D 0; num < JC_NUM_LEDS; num++) {
> -		if (&ctlr->leds[num] =3D=3D led)
> -			break;
> -	}
> -	if (num >=3D JC_NUM_LEDS)
> -		return -EINVAL;
> +	for (i =3D 0; i < JC_NUM_LEDS; i++)
> +		val |=3D ctlr->leds[i].brightness << i;
> =20
>  	mutex_lock(&ctlr->output_mutex);
> -	for (i =3D 0; i < JC_NUM_LEDS; i++) {
> -		if (i =3D=3D num)
> -			val |=3D brightness << i;
> -		else
> -			val |=3D ctlr->leds[i].brightness << i;
> -	}
>  	ret =3D joycon_set_player_leds(ctlr, 0, val);
>  	mutex_unlock(&ctlr->output_mutex);
> =20
> @@ -1884,9 +1891,6 @@ static int joycon_home_led_brightness_set(struct le=
d_classdev *led,
>  	struct device *dev =3D led->dev->parent;
>  	struct hid_device *hdev =3D to_hid_device(dev);
>  	struct joycon_ctlr *ctlr;
> -	struct joycon_subcmd_request *req;
> -	u8 buffer[sizeof(*req) + 5] =3D { 0 };
> -	u8 *data;
>  	int ret;
> =20
>  	ctlr =3D hid_get_drvdata(hdev);
> @@ -1894,25 +1898,13 @@ static int joycon_home_led_brightness_set(struct =
led_classdev *led,
>  		hid_err(hdev, "No controller data\n");
>  		return -ENODEV;
>  	}
> -
> -	req =3D (struct joycon_subcmd_request *)buffer;
> -	req->subcmd_id =3D JC_SUBCMD_SET_HOME_LIGHT;
> -	data =3D req->data;
> -	data[0] =3D 0x01;
> -	data[1] =3D brightness << 4;
> -	data[2] =3D brightness | (brightness << 4);
> -	data[3] =3D 0x11;
> -	data[4] =3D 0x11;
> -
> -	hid_dbg(hdev, "setting home led brightness\n");
>  	mutex_lock(&ctlr->output_mutex);
> -	ret =3D joycon_send_subcmd(ctlr, req, 5, HZ/4);
> +	ret =3D joycon_set_home_led(ctlr, brightness);
>  	mutex_unlock(&ctlr->output_mutex);
> -
>  	return ret;
>  }
> =20
> -static DEFINE_MUTEX(joycon_input_num_mutex);
> +static DEFINE_SPINLOCK(joycon_input_num_spinlock);
>  static int joycon_leds_create(struct joycon_ctlr *ctlr)
>  {
>  	struct hid_device *hdev =3D ctlr->hdev;
> @@ -1920,17 +1912,16 @@ static int joycon_leds_create(struct joycon_ctlr =
*ctlr)
>  	const char *d_name =3D dev_name(dev);
>  	struct led_classdev *led;
>  	char *name;
> -	int ret =3D 0;
> +	int ret;
>  	int i;
> -	static int input_num =3D 1;
> +	unsigned long flags;
> +	int player_led_number;
> +	static int input_num;
> =20
> -	/* Set the default controller player leds based on controller number */=

> -	mutex_lock(&joycon_input_num_mutex);
> -	mutex_lock(&ctlr->output_mutex);
> -	ret =3D joycon_set_player_leds(ctlr, 0, 0xF >> (4 - input_num));
> -	if (ret)
> -		hid_warn(ctlr->hdev, "Failed to set leds; ret=3D%d\n", ret);
> -	mutex_unlock(&ctlr->output_mutex);
> +	/* Set the player leds based on controller number */
> +	spin_lock_irqsave(&joycon_input_num_spinlock, flags);
> +	player_led_number =3D input_num++ % JC_NUM_LEDS;
> +	spin_unlock_irqrestore(&joycon_input_num_spinlock, flags);
> =20
>  	/* configure the player LEDs */
>  	for (i =3D 0; i < JC_NUM_LEDS; i++) {
> @@ -1938,31 +1929,33 @@ static int joycon_leds_create(struct joycon_ctlr =
*ctlr)
>  				      d_name,
>  				      "green",
>  				      joycon_player_led_names[i]);
> -		if (!name) {
> -			mutex_unlock(&joycon_input_num_mutex);
> +		if (!name)
>  			return -ENOMEM;
> -		}
> =20
>  		led =3D &ctlr->leds[i];
>  		led->name =3D name;
> -		led->brightness =3D ((i + 1) <=3D input_num) ? 1 : 0;
> +		led->brightness =3D (i =3D=3D player_led_number) ? 1 : 0;
>  		led->max_brightness =3D 1;
>  		led->brightness_set_blocking =3D
>  					joycon_player_led_brightness_set;
>  		led->flags =3D LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
> +	}
> +	mutex_lock(&ctlr->output_mutex);
> +	ret =3D joycon_set_player_leds(ctlr, 0, 0x1 << player_led_number);
> +	mutex_unlock(&ctlr->output_mutex);
> +	if (ret) {
> +		hid_warn(hdev, "Failed to set players LEDs; ret=3D%d\n", ret);
> +		goto home_led;
> +	}
> =20
> +	for (i =3D 0; i < JC_NUM_LEDS; i++) {
> +		led =3D &ctlr->leds[i];
>  		ret =3D devm_led_classdev_register(&hdev->dev, led);
> -		if (ret) {
> -			hid_err(hdev, "Failed registering %s LED\n", led->name);
> -			mutex_unlock(&joycon_input_num_mutex);
> -			return ret;
> -		}
> +		if (ret)
> +			hid_err(hdev, "Failed registering %s LED; ret=3D%d\n", led->name, ret=
);
>  	}
> =20
> -	if (++input_num > 4)
> -		input_num =3D 1;
> -	mutex_unlock(&joycon_input_num_mutex);
> -
> +home_led:
>  	/* configure the home LED */
>  	if (jc_type_has_right(ctlr)) {
>  		name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:%s:%s",
> @@ -1978,17 +1971,18 @@ static int joycon_leds_create(struct joycon_ctlr =
*ctlr)
>  		led->max_brightness =3D 0xF;
>  		led->brightness_set_blocking =3D joycon_home_led_brightness_set;
>  		led->flags =3D LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
> -		ret =3D devm_led_classdev_register(&hdev->dev, led);
> -		if (ret) {
> -			hid_err(hdev, "Failed registering home led\n");
> -			return ret;
> -		}
> +
>  		/* Set the home LED to 0 as default state */
> -		ret =3D joycon_home_led_brightness_set(led, 0);
> +		mutex_lock(&ctlr->output_mutex);
> +		ret =3D joycon_set_home_led(ctlr, 0);
> +	    mutex_unlock(&ctlr->output_mutex);

We shouldn't use any spaces for indentation here.

>  		if (ret) {
> -			hid_warn(hdev, "Failed to set home LED default, unregistering home LE=
D");
> -			devm_led_classdev_unregister(&hdev->dev, led);
> +			hid_warn(hdev, "Failed to set home LED; ret=3D%d\n", ret);
> +			return 0;
>  		}

Adding an empty line here would be more consistent with the rest of
the code.

> +		ret =3D devm_led_classdev_register(&hdev->dev, led);
> +		if (ret)
> +			hid_err(hdev, "Failed registering home led; ret=3D%d\n", ret);

In the old code we returned "ret" in this case. We probably want to do
the same here.

Cheers,
Silvan

>  	}
> =20
>  	return 0;


