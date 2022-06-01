Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9550D53AFFB
	for <lists+linux-input@lfdr.de>; Thu,  2 Jun 2022 00:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbiFAWA2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 18:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232273AbiFAWAX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 18:00:23 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DE7B1DD;
        Wed,  1 Jun 2022 15:00:22 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id z17so3125996pff.7;
        Wed, 01 Jun 2022 15:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WGOCUect1YABbyO7EXQHmxr++jFWXyECExYgfm6V1no=;
        b=RUT2Bpti7ySB+0fWfvmo0VBu5t7Xn8Nao1NVv6h6h0a3dHo4ItQyuyv3GR/4wdJt8D
         OnN0tMfV90N98UgKmi+cToqQsNgU0DXWoKndHMgbCiuzYjm5cRMjYgPLrM1oFlQGA8hS
         DsRtVKz0grFojtpUFDbGfFJ4JUp13PACDav5Jmrjvdy7+KV/i1B44/95aZjNVEnBdUM5
         bttndvR8OgFnnfhjUpjQekcRLZi2NH3jxuyzS6gSc/h3GZojRl99klQIk1PwC+T28oiy
         mQg2pkfCbdRkM3jwOPX8E7/S0Y0CT0sL8l7IYb03Qw50GPj/rN1pjIh71sJjoWJa28l1
         yugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WGOCUect1YABbyO7EXQHmxr++jFWXyECExYgfm6V1no=;
        b=3f7SaUjCzjK/vmn9VUN/+0KyDfapFn2XcmUdrfDbm0/KwOd7K0kp19dByYBCyK900C
         UaDzz/6QGlmy9FN0RvOTCu3fHYiq/M7Bx8B2QuYEjCjmlHBSpNSv3UeQb73x41kB3qu1
         dFmaXtbxxX+fy/stCOYnMvK6lLaeg/qp6pjXL+P+TXmlAdDlpT7//49hoWdbOtaQ0tfI
         8L1o1+XrhwQKsVDeaInpUfuTbpdIsrwzKXUZQQuUXa7Nco0G3uRXeCznCcjfXjZA2bjh
         FUyjJ7hHqxE5hb+5goaVsVxDPcLAZjgQ/p1AJE9LNd60PxcIfRXk57sGJP3Sl4rNfSqK
         GotQ==
X-Gm-Message-State: AOAM53032YXbmDaHDz64kmlZVGpzG1l61lMq6XCCw1fGdYViM+eAzD+u
        ItOp9/PPIiUvP798KhIg9xn/q8uXFVw=
X-Google-Smtp-Source: ABdhPJzp09lAefDHE9hFeAGp9EIINet1pZTp60loy6FQeX0QtivwNPNuPjmteG0LrGvzAFsahYulxA==
X-Received: by 2002:a63:ff5a:0:b0:3fc:c8d7:f3e0 with SMTP id s26-20020a63ff5a000000b003fcc8d7f3e0mr1273770pgk.77.1654120822167;
        Wed, 01 Jun 2022 15:00:22 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:7a22:99c9:242d:6235])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b001640aad2f71sm2064379pll.180.2022.06.01.15.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 15:00:21 -0700 (PDT)
Date:   Wed, 1 Jun 2022 15:00:18 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chris Morgan <macroalpha82@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        heiko@sntech.de, maccraft123mc@gmail.com, contact@artur-rojek.eu,
        Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 2/3] Input: adc-joystick - Add polled input device
 support
Message-ID: <YpfhcgikvPrds63+@google.com>
References: <20220601204927.10256-1-macroalpha82@gmail.com>
 <20220601204927.10256-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601204927.10256-3-macroalpha82@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 01, 2022 at 03:49:26PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add polled input device support to the adc-joystick driver. This is
> useful for devices which do not have hardware capable triggers on
> their SARADC. Code modified from adc-joystick.c changes made by Maya
> Matuszczyk.

I'd like to hear Jonathan's take on this...

> 
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
> -- 
> 2.25.1
> 

-- 
Dmitry
