Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 900B453B5E7
	for <lists+linux-input@lfdr.de>; Thu,  2 Jun 2022 11:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232941AbiFBJW2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Jun 2022 05:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbiFBJW1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Jun 2022 05:22:27 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31418C43;
        Thu,  2 Jun 2022 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1654161741; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bdFdEInj0nV0Q6jdOHpTmlRNrwcWRkoYe3jBS5EW5VU=;
        b=Yeg8VI4kw+QOdag7dk9i9fFU/KFOqx4N7r33VJDxXek4OT4hh7rVZiaV+EEmD/cc2oWou6
        sHQkvCRvUQ+ejor8SkcvdtBA/oUCmWPs0a8qHwzCo2dGIEpsZq/Az2Hun5etIrk0/C9a5L
        1lekTokJY3w4jBVH7eOxF0cs75e0jcg=
Date:   Thu, 02 Jun 2022 10:22:11 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 2/3] Input: adc-joystick - Add polled input device
 support
To:     Chris Morgan <macroalpha82@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        maccraft123mc@gmail.com, contact@artur-rojek.eu,
        Chris Morgan <macromorgan@hotmail.com>
Message-Id: <ZCFUCR.XGIL3R7SFVS32@crapouillou.net>
In-Reply-To: <20220601204927.10256-3-macroalpha82@gmail.com>
References: <20220601204927.10256-1-macroalpha82@gmail.com>
        <20220601204927.10256-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Chris,

Le mer., juin 1 2022 at 15:49:26 -0500, Chris Morgan=20
<macroalpha82@gmail.com> a =E9crit :
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add polled input device support to the adc-joystick driver. This is
> useful for devices which do not have hardware capable triggers on
> their SARADC. Code modified from adc-joystick.c changes made by Maya
> Matuszczyk.

I understand what you're trying to do, but maybe there's a better way.

It would be better if pollable IIO devices would also be able to be=20
used with a buffer, with the client driver manually triggering the IIO=20
device through a function call.

Jonathan (Cc'd) might have his reasons why this isn't done this way,=20
and in this case your patch makes sense, but I'd like to hear=20
Jonathan's thoughts first.

As for "adc-joystick,polled"... it doesn't describe the hardware but=20
rather a specific configuration, so it shouldn't appear in the device=20
tree.

Cheers,
-Paul

>=20
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/input/joystick/adc-joystick.c | 52=20
> +++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/input/joystick/adc-joystick.c=20
> b/drivers/input/joystick/adc-joystick.c
> index 78ebca7d400a..5a28fe7b8ebc 100644
> --- a/drivers/input/joystick/adc-joystick.c
> +++ b/drivers/input/joystick/adc-joystick.c
> @@ -13,6 +13,10 @@
>=20
>  #include <asm/unaligned.h>
>=20
> +#define ADC_JSK_POLL_INTERVAL	16
> +#define ADC_JSK_POLL_MIN	8
> +#define ADC_JSK_POLL_MAX	32
> +
>  struct adc_joystick_axis {
>  	u32 code;
>  	s32 range[2];
> @@ -26,8 +30,21 @@ struct adc_joystick {
>  	struct adc_joystick_axis *axes;
>  	struct iio_channel *chans;
>  	int num_chans;
> +	bool polled;
>  };
>=20
> +static void adc_joystick_poll(struct input_dev *input)
> +{
> +	struct adc_joystick *joy =3D input_get_drvdata(input);
> +	int i, val;
> +
> +	for (i =3D 0; i < joy->num_chans; i++) {
> +		iio_read_channel_raw(&joy->chans[i], &val);
> +		input_report_abs(input, joy->axes[i].code, val);
> +	}
> +	input_sync(input);
> +}
> +
>  static int adc_joystick_handle(const void *data, void *private)
>  {
>  	struct adc_joystick *joy =3D private;
> @@ -215,8 +232,19 @@ static int adc_joystick_probe(struct=20
> platform_device *pdev)
>  	joy->input =3D input;
>  	input->name =3D pdev->name;
>  	input->id.bustype =3D BUS_HOST;
> -	input->open =3D adc_joystick_open;
> -	input->close =3D adc_joystick_close;
> +
> +	if (device_property_read_bool(dev, "adc-joystick,polled"))
> +		joy->polled =3D 1;
> +
> +	if (joy->polled) {
> +		input_setup_polling(input, adc_joystick_poll);
> +		input_set_poll_interval(input, ADC_JSK_POLL_INTERVAL);
> +		input_set_min_poll_interval(input, ADC_JSK_POLL_MIN);
> +		input_set_max_poll_interval(input, ADC_JSK_POLL_MAX);
> +	} else {
> +		input->open =3D adc_joystick_open;
> +		input->close =3D adc_joystick_close;
> +	}
>=20
>  	error =3D adc_joystick_set_axes(dev, joy);
>  	if (error)
> @@ -229,16 +257,18 @@ static int adc_joystick_probe(struct=20
> platform_device *pdev)
>  		return error;
>  	}
>=20
> -	joy->buffer =3D iio_channel_get_all_cb(dev, adc_joystick_handle, joy);
> -	if (IS_ERR(joy->buffer)) {
> -		dev_err(dev, "Unable to allocate callback buffer\n");
> -		return PTR_ERR(joy->buffer);
> -	}
> +	if (!joy->polled) {
> +		joy->buffer =3D iio_channel_get_all_cb(dev, adc_joystick_handle,=20
> joy);
> +		if (IS_ERR(joy->buffer)) {
> +			dev_err(dev, "Unable to allocate callback buffer\n");
> +			return PTR_ERR(joy->buffer);
> +		}
>=20
> -	error =3D devm_add_action_or_reset(dev, adc_joystick_cleanup,=20
> joy->buffer);
> -	if (error)  {
> -		dev_err(dev, "Unable to add action\n");
> -		return error;
> +		error =3D devm_add_action_or_reset(dev, adc_joystick_cleanup,=20
> joy->buffer);
> +		if (error)  {
> +			dev_err(dev, "Unable to add action\n");
> +			return error;
> +		}
>  	}
>=20
>  	return 0;


