Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E7226B0B2
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 00:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgIOWQz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Sep 2020 18:16:55 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40260 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727714AbgIOQdm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Sep 2020 12:33:42 -0400
Received: by mail-io1-f66.google.com with SMTP id j2so4762378ioj.7;
        Tue, 15 Sep 2020 09:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YpUloxOmiyYoc4eUGVdn8xMYBlRSXLF/jQf6LOfQZOE=;
        b=kHA8u4Kp7UreUAKfh0TUXSrZdjohutCx8dAx8ZL317Omz5jr9vwiNcxjazyI/dhl6B
         Y9rRAJvYkU7tM3YzFMGKd48MbgLPNA/iwDG/xGtkO0Gejw+Z3PG+KCuNNo0j4vBZvaNn
         ODauHiG2zZwfDu6wQY2+fvwvS1FZTNGoqzfS0eKLNpfnb0NkFVuqMhlCJoFhQTN3wwx8
         AlLhrJQIREDWDzwPVryiz8Fq1QzBghwjHWAeMcWHcsW9ahjwKondFvZIdzzsPF7c/pp7
         ICR0dPCcQl7JC2oYrXK2mh34cq/gTbC8y9Z4gaEzulXQiHQmf+8E9lrfltXxnuwOzI4H
         Gq2w==
X-Gm-Message-State: AOAM530pU52M6UaQKZAy+cyB0t8QW8J3Q+jHwLCQ89DN6zaHucqfRtnT
        aT82u7frDC/xw0SLIif/gQ==
X-Google-Smtp-Source: ABdhPJwLrL4G8mq+DgCg8GGlNZN/+c8RSkRPHwrsd/RyW2ftyn4Q26wDTuzcKVvGCACU6fzLu4toUQ==
X-Received: by 2002:a6b:d304:: with SMTP id s4mr14424111iob.104.1600187617987;
        Tue, 15 Sep 2020 09:33:37 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k16sm8882262ilc.38.2020.09.15.09.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 09:33:37 -0700 (PDT)
Received: (nullmailer pid 2080473 invoked by uid 1000);
        Tue, 15 Sep 2020 16:33:35 -0000
Date:   Tue, 15 Sep 2020 10:33:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?iso-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@collabora.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv2 4/4] Input: rotary-encoder - Add gpio as push button
Message-ID: <20200915163335.GA2063609@bogus>
References: <20200907204045.95530-1-sebastian.reichel@collabora.com>
 <20200907204045.95530-5-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200907204045.95530-5-sebastian.reichel@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 07, 2020 at 10:40:45PM +0200, Sebastian Reichel wrote:
> From: Mylène Josserand <mylene.josserand@collabora.com>
> 
> Add the support of a gpio that can be defined as a push button.
> Thanks to that, it is possible to emit a keycode in case of a
> "push" event, if the rotary supports that.
> 
> The keycode to emit is defined using "linux,code" property
> (such as in gpio-keys).

But it is not...

> Signed-off-by: Mylène Josserand <mylene.josserand@collabora.com>
> [code cleanup to current standards and renamed some properties]
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/input/rotary-encoder.yaml        | 21 +++++++++

Bindings should be a separate patch.

>  drivers/input/misc/rotary_encoder.c           | 43 +++++++++++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/rotary-encoder.yaml b/Documentation/devicetree/bindings/input/rotary-encoder.yaml
> index 5b60ea86bd62..682fee104004 100644
> --- a/Documentation/devicetree/bindings/input/rotary-encoder.yaml
> +++ b/Documentation/devicetree/bindings/input/rotary-encoder.yaml
> @@ -74,6 +74,24 @@ properties:
>        need to be passed.
>      type: boolean
>  
> +  push-gpios:
> +    description: GPIO used as a detection of a push from the rotary-encoder.
> +    maxItems: 1
> +
> +  linux,push-code:
> +    description:
> +      keycode to emit with the push-gpio of this rotary encoder.
> +      If not specified defaults to <28> == KEY_ENTER.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 28
> +
> +  linux,push-type:
> +    description:
> +      Specify event type this button/key generates.
> +      If not specified defaults to <1> == EV_KEY.
> +    $ref: /schemas/types.yaml#definitions/uint32
> +    default: 1

Can we just use 'linux,code' and 'linux,input-type' here. That's 
problematic if there's ever more than 1, but so is the current solution 
having to make up new property names every time.

Why can't the gpio-keys binding just be used here? Is it important to 
have the events on the same device? Is there some coordination needed 
between the functions?

> +
>  required:
>    - compatible
>    - gpios
> @@ -97,4 +115,7 @@ examples:
>              linux,axis = <ABS_Y>;
>              rotary-encoder,encoding = "binary";
>              rotary-encoder,rollover;
> +            push-gpios = <&gpio 23 GPIO_ACTIVE_HIGH>;
> +            linux,push-code = <KEY_ENTER>;
> +            linux,push-type = <EV_KEY>;
>      };
> diff --git a/drivers/input/misc/rotary_encoder.c b/drivers/input/misc/rotary_encoder.c
> index 16ad86fad7cb..484042a5afa0 100644
> --- a/drivers/input/misc/rotary_encoder.c
> +++ b/drivers/input/misc/rotary_encoder.c
> @@ -47,12 +47,33 @@ struct rotary_encoder {
>  
>  	unsigned int *irq;
>  
> +	struct gpio_desc *push_gpio;
> +	unsigned int push_code;
> +	unsigned int push_type;
> +
>  	bool armed;
>  	signed char dir;	/* 1 - clockwise, -1 - CCW */
>  
>  	unsigned int last_stable;
>  };
>  
> +static irqreturn_t rotary_push_irq(int irq, void *dev_id)
> +{
> +	struct rotary_encoder *encoder = dev_id;
> +	int val;
> +
> +	mutex_lock(&encoder->access_mutex);
> +
> +	val = gpiod_get_value_cansleep(encoder->push_gpio);
> +
> +	input_report_key(encoder->input, encoder->push_code, val);
> +	input_sync(encoder->input);
> +
> +	mutex_unlock(&encoder->access_mutex);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static unsigned int rotary_encoder_get_state(struct rotary_encoder *encoder)
>  {
>  	int i;
> @@ -248,6 +269,16 @@ static int rotary_encoder_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	encoder->push_gpio = devm_gpiod_get_optional(dev, "push", GPIOD_IN);
> +	if (IS_ERR(encoder->push_gpio))
> +		return dev_err_probe(dev, PTR_ERR(encoder->push_gpio), "failed to get push-gpio\n");
> +
> +	encoder->push_code = KEY_ENTER;
> +	device_property_read_u32(dev, "linux,push-code", &encoder->push_code);
> +
> +	encoder->push_type = EV_KEY;
> +	device_property_read_u32(dev, "linux,push-type", &encoder->push_type);
> +
>  	input = devm_input_allocate_device(dev);
>  	if (!input)
>  		return -ENOMEM;
> @@ -304,6 +335,18 @@ static int rotary_encoder_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (encoder->push_gpio) {
> +		input_set_capability(encoder->input, encoder->push_type, encoder->push_code);
> +		err = devm_request_threaded_irq(dev, gpiod_to_irq(encoder->push_gpio),
> +						NULL, rotary_push_irq,
> +						IRQF_TRIGGER_RISING |
> +						IRQF_TRIGGER_FALLING |
> +						IRQF_ONESHOT,
> +						DRV_NAME, encoder);
> +		if (err)
> +			return dev_err_probe(dev, err, "unable to request push IRQ\n");
> +	}
> +
>  	err = input_register_device(input);
>  	if (err) {
>  		dev_err(dev, "failed to register input device\n");
> -- 
> 2.28.0
> 
