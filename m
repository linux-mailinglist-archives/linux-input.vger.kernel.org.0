Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7465B53B792
	for <lists+linux-input@lfdr.de>; Thu,  2 Jun 2022 13:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbiFBLB7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Jun 2022 07:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232354AbiFBLB6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Jun 2022 07:01:58 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6AB62CC;
        Thu,  2 Jun 2022 04:01:54 -0700 (PDT)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1nwiaO-0007Cg-HB; Thu, 02 Jun 2022 13:01:52 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linux-input@vger.kernel.org, Chris Morgan <macroalpha82@gmail.com>
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        maccraft123mc@gmail.com, contact@artur-rojek.eu,
        Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 2/3] Input: adc-joystick - Add polled input device support
Date:   Thu, 02 Jun 2022 13:01:51 +0200
Message-ID: <2772745.yaVYbkx8dN@diego>
In-Reply-To: <20220601204927.10256-3-macroalpha82@gmail.com>
References: <20220601204927.10256-1-macroalpha82@gmail.com> <20220601204927.10256-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Mittwoch, 1. Juni 2022, 22:49:26 CEST schrieb Chris Morgan:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add polled input device support to the adc-joystick driver. This is
> useful for devices which do not have hardware capable triggers on
> their SARADC. Code modified from adc-joystick.c changes made by Maya
> Matuszczyk.

as the dts patch mentiones the odroid go2, this probably means the
Rockchip-saradc?

I very much remember that we converted the saradc to also support
triggered buffers [0] two years ago, and as I remember that worked
rather nicely on the Go-1 at least - similar hardware I think.

So it would be really helpful to provide some more explanation on
why this isn't enough for your use-case.


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4e130dc7b41348b13684f0758c26cc6cf72a3449


> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/input/joystick/adc-joystick.c | 52 +++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
> index 78ebca7d400a..5a28fe7b8ebc 100644
> --- a/drivers/input/joystick/adc-joystick.c
> +++ b/drivers/input/joystick/adc-joystick.c
> @@ -13,6 +13,10 @@
>  
>  #include <asm/unaligned.h>
>  
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
>  
> +static void adc_joystick_poll(struct input_dev *input)
> +{
> +	struct adc_joystick *joy = input_get_drvdata(input);
> +	int i, val;
> +
> +	for (i = 0; i < joy->num_chans; i++) {
> +		iio_read_channel_raw(&joy->chans[i], &val);
> +		input_report_abs(input, joy->axes[i].code, val);
> +	}
> +	input_sync(input);
> +}
> +
>  static int adc_joystick_handle(const void *data, void *private)
>  {
>  	struct adc_joystick *joy = private;
> @@ -215,8 +232,19 @@ static int adc_joystick_probe(struct platform_device *pdev)
>  	joy->input = input;
>  	input->name = pdev->name;
>  	input->id.bustype = BUS_HOST;
> -	input->open = adc_joystick_open;
> -	input->close = adc_joystick_close;
> +
> +	if (device_property_read_bool(dev, "adc-joystick,polled"))
> +		joy->polled = 1;
> +
> +	if (joy->polled) {
> +		input_setup_polling(input, adc_joystick_poll);
> +		input_set_poll_interval(input, ADC_JSK_POLL_INTERVAL);
> +		input_set_min_poll_interval(input, ADC_JSK_POLL_MIN);
> +		input_set_max_poll_interval(input, ADC_JSK_POLL_MAX);
> +	} else {
> +		input->open = adc_joystick_open;
> +		input->close = adc_joystick_close;
> +	}
>  
>  	error = adc_joystick_set_axes(dev, joy);
>  	if (error)
> @@ -229,16 +257,18 @@ static int adc_joystick_probe(struct platform_device *pdev)
>  		return error;
>  	}
>  
> -	joy->buffer = iio_channel_get_all_cb(dev, adc_joystick_handle, joy);
> -	if (IS_ERR(joy->buffer)) {
> -		dev_err(dev, "Unable to allocate callback buffer\n");
> -		return PTR_ERR(joy->buffer);
> -	}
> +	if (!joy->polled) {
> +		joy->buffer = iio_channel_get_all_cb(dev, adc_joystick_handle, joy);
> +		if (IS_ERR(joy->buffer)) {
> +			dev_err(dev, "Unable to allocate callback buffer\n");
> +			return PTR_ERR(joy->buffer);
> +		}
>  
> -	error = devm_add_action_or_reset(dev, adc_joystick_cleanup, joy->buffer);
> -	if (error)  {
> -		dev_err(dev, "Unable to add action\n");
> -		return error;
> +		error = devm_add_action_or_reset(dev, adc_joystick_cleanup, joy->buffer);
> +		if (error)  {
> +			dev_err(dev, "Unable to add action\n");
> +			return error;
> +		}
>  	}
>  
>  	return 0;
> 




