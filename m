Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56FD97BC876
	for <lists+linux-input@lfdr.de>; Sat,  7 Oct 2023 16:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbjJGO4O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Oct 2023 10:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjJGO4N (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 Oct 2023 10:56:13 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F83BA
        for <linux-input@vger.kernel.org>; Sat,  7 Oct 2023 07:56:11 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40666aa674fso28782125e9.0
        for <linux-input@vger.kernel.org>; Sat, 07 Oct 2023 07:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696690570; x=1697295370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OVjpLjaqD4ZAlq88+61n2Qsd8s/pScFzAO2vnODdZFk=;
        b=kaRuJPIjXUyboJ0lXM4u+Vp9pV/kP+fi8snoM76UH2IrAsdsp9iYrHC9inmBrCvrXX
         GhpX+tnxRxmGtRjc6ZrgEJWUe1qEhQT4S2WaB4Lh1s0iCB6HsJ46YWkD/ZhdyYTIYKp/
         ZRVz5E1kzg5xxHBjeSQnwbgJ9BrgV4xJTciRu0ltIYJzAxV95ygCGMxpurP2B5SKwwf5
         wKjLjgIiDKuP7Saw+GPWd+GqClDIRh9fUrWk1elfQfPFXpXCHVKI46wOD2Owo2VDZYju
         eK/gY4w+ODUKzHIgx3V5zgkJKcX81DdavlJOVbscBl12mJq+mn2jeRTAGvX2RbYdtOZu
         xmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696690570; x=1697295370;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVjpLjaqD4ZAlq88+61n2Qsd8s/pScFzAO2vnODdZFk=;
        b=qoKD3TC7K7/toYEmVsqQ7I2qF+bAB7RIVIAqNOstgD+4IDQCNiKAe1BliR4NEsVgOR
         HTvUoGktYZNCNW4FubcCPnNZR5Xw+y2MwrqrHPtaZz2YjiOwsU23QMckvyW351c9Vkfh
         qvma8D65jLsgRrMcaJRaIro7LzFczNYwFwaG2KBxXpDoSnA1yfrGEIcuzJ3GAVCGPCcV
         WjardhEPKyyHSdSJ5FGmnvVKio3ARG3lZqOX+/kC8SVoIgkIZ94DA/US9OBITL5xP154
         TX2MQKL4uIy5P0YxUBrXqIcH6CWnRbjpAHQ/kPX2Ka5xGQImX31LCmZYtzbWICt+ESlG
         WGhQ==
X-Gm-Message-State: AOJu0YwIcrKoPi3So5OlvdRZ/8BBeFH6B1LYYpp6gn69U3V/JxdXE4Iu
        yHUf0BBp6poYGIf5Mr5jO5wniA==
X-Google-Smtp-Source: AGHT+IHFOylkHYQamsdN3MVrwHv4vjWwUSa1iqJF3uMvMncE3ZEKL7BJmnOjR9wnKH9QCGJgD4tb9w==
X-Received: by 2002:a1c:ed17:0:b0:3fe:d1e9:e6b8 with SMTP id l23-20020a1ced17000000b003fed1e9e6b8mr10210643wmh.12.1696690569582;
        Sat, 07 Oct 2023 07:56:09 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c228400b003fee53feab5sm6356049wmf.10.2023.10.07.07.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Oct 2023 07:56:08 -0700 (PDT)
Message-ID: <a49deeb6-728c-4527-8399-57c52214e1d3@linaro.org>
Date:   Sat, 7 Oct 2023 16:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] input: add Adafruit Seesaw Gamepad driver
Content-Language: en-US
To:     Anshul Dalal <anshulusr@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20231007144052.1535417-1-anshulusr@gmail.com>
 <20231007144052.1535417-2-anshulusr@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231007144052.1535417-2-anshulusr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 07/10/2023 16:40, Anshul Dalal wrote:
> A simple driver for a mini gamepad that communicates over i2c, the gamepad
> has bidirectional thumb stick input and six buttons.
> 
> The gamepad chip utilizes the open framework from Adafruit called 'Seesaw'
> to transmit the ADC data for the joystick and digital pin state for the
> buttons. I have only implemented the functionality required to receive the
> thumb stick and button state.
> 
> Steps in reading the gamepad state over i2c:
>   1. Reset the registers
>   2. Set the pin mode of the pins specified by the `BUTTON_MASK` to input
>       `BUTTON_MASK`: A bit-map for the six digital pins internally
>        connected to the joystick buttons.
>   3. Enable internal pullup resistors for the `BUTTON_MASK`
>   4. Bulk set the pin state HIGH for `BUTTON_MASK`
>   5. Poll the device for button and joystick state done by:
>       `seesaw_read_data(struct i2c_client *client, struct seesaw_data *data)`
> 
> Product page:
>   https://www.adafruit.com/product/5743
> Arduino driver:
>   https://github.com/adafruit/Adafruit_Seesaw
> 
> Tested on RPi Zero 2W
> 
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> ---
>  MAINTAINERS                              |   7 +
>  drivers/input/joystick/Kconfig           |   9 +
>  drivers/input/joystick/Makefile          |   1 +
>  drivers/input/joystick/adafruit_seesaw.c | 275 +++++++++++++++++++++++
>  4 files changed, 292 insertions(+)
>  create mode 100644 drivers/input/joystick/adafruit_seesaw.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 81d5fc0bba68..cd4f9deb77e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -441,6 +441,13 @@ W:	http://wiki.analog.com/AD7879
>  W:	https://ez.analog.com/linux-software-drivers
>  F:	drivers/input/touchscreen/ad7879.c
>  
> +ADAFRUIT MINI I2C GAMEPAD
> +M:	Anshul Dalal <anshulusr@gmail.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/input/adafruit_seesaw.yaml
> +F:	drivers/input/joystick/adafruit_seesaw.c
> +
>  ADDRESS SPACE LAYOUT RANDOMIZATION (ASLR)
>  M:	Jiri Kosina <jikos@kernel.org>
>  S:	Maintained
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index ac6925ce8366..b8337edc6e22 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -412,4 +412,13 @@ config JOYSTICK_SENSEHAT
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called sensehat_joystick.
>  
> +config JOYSTICK_SEESAW
> +	tristate "Adafruit Mini I2C Gamepad with Seesaw"
> +	depends on I2C
> +	help
> +		Say Y here if you want to use the Adafruit Mini I2C Gamepad.

This does not look like correct indentation. Just look at other code and
do not do it differently.

> +
> +		To compile this driver as a module, choose M here: the module will be
> +		called adafruit_seesaw.
> +
>  endif

...

> +
> +static int seesaw_probe(struct i2c_client *client)
> +{
> +	int err;
> +	struct seesaw_gamepad *private;
> +	unsigned char register_reset[] = { SEESAW_STATUS_BASE,
> +					   SEESAW_STATUS_SWRST, 0xFF };
> +	unsigned char get_hw_id[] = { SEESAW_STATUS_BASE, SEESAW_STATUS_HW_ID };
> +
> +	err = i2c_master_send(client, register_reset, sizeof(register_reset));
> +	if (err < 0)
> +		return err;
> +	if (err != sizeof(register_reset))
> +		return -EIO;
> +	mdelay(10);

Why 10? This should be explained somehow in the code.


> +
> +	private = devm_kzalloc(&client->dev, sizeof(*private), GFP_KERNEL);
> +	if (!private)
> +		return -ENOMEM;
> +
> +	err = i2c_master_send(client, get_hw_id, sizeof(get_hw_id));
> +	if (err < 0)
> +		return err;
> +	if (err != sizeof(get_hw_id))
> +		return -EIO;
> +	err = i2c_master_recv(client, &private->hardware_id, 1);
> +	if (err < 0)
> +		return err;
> +	if (err != 1)
> +		return -EIO;
> +
> +	dev_dbg(&client->dev, "Adafruit Seesaw Gamepad, Hardware ID: %02x\n",
> +		private->hardware_id);
> +
> +	private->i2c_client = client;
> +	scnprintf(private->physical_path, sizeof(private->physical_path),
> +		  "i2c/%s", dev_name(&client->dev));
> +	i2c_set_clientdata(client, private);
> +
> +	private->input_dev = devm_input_allocate_device(&client->dev);
> +	if (!private->input_dev)
> +		return -ENOMEM;
> +
> +	private->input_dev->id.bustype = BUS_I2C;
> +	private->input_dev->name = "Adafruit Seesaw Gamepad";
> +	private->input_dev->phys = private->physical_path;
> +	input_set_drvdata(private->input_dev, private);
> +	input_set_abs_params(private->input_dev, ABS_X, 0,
> +			     SEESAW_JOYSTICK_MAX_AXIS, SEESAW_JOYSTICK_FUZZ,
> +			     SEESAW_JOYSTICK_FLAT);
> +	input_set_abs_params(private->input_dev, ABS_Y, 0,
> +			     SEESAW_JOYSTICK_MAX_AXIS, SEESAW_JOYSTICK_FUZZ,
> +			     SEESAW_JOYSTICK_FLAT);
> +	input_set_capability(private->input_dev, EV_KEY, BTN_A);
> +	input_set_capability(private->input_dev, EV_KEY, BTN_B);
> +	input_set_capability(private->input_dev, EV_KEY, BTN_X);
> +	input_set_capability(private->input_dev, EV_KEY, BTN_Y);
> +	input_set_capability(private->input_dev, EV_KEY, BTN_START);
> +	input_set_capability(private->input_dev, EV_KEY, BTN_SELECT);
> +
> +	err = input_setup_polling(private->input_dev, seesaw_poll);
> +	if (err) {
> +		dev_err(&client->dev, "failed to set up polling: %d\n", err);
> +		return err;
> +	}
> +
> +	input_set_poll_interval(private->input_dev,
> +				SEESAW_GAMEPAD_POLL_INTERVAL);
> +	input_set_max_poll_interval(private->input_dev,
> +				    SEESAW_GAMEPAD_POLL_MAX);
> +	input_set_min_poll_interval(private->input_dev,
> +				    SEESAW_GAMEPAD_POLL_MIN);
> +
> +	err = input_register_device(private->input_dev);
> +	if (err) {
> +		dev_err(&client->dev, "failed to register joystick: %d\n", err);
> +		return err;
> +	}
> +
> +	/* Set Pin Mode to input and enable pull-up resistors */
> +	unsigned char pin_mode[] = { SEESAW_GPIO_BASE,	SEESAW_GPIO_DIRCLR_BULK,
> +				     BUTTON_MASK >> 24, BUTTON_MASK >> 16,
> +				     BUTTON_MASK >> 8,	BUTTON_MASK };
> +	err = i2c_master_send(client, pin_mode, sizeof(pin_mode));
> +	pin_mode[1] = SEESAW_GPIO_PULLENSET;
> +	err |= i2c_master_send(client, pin_mode, sizeof(pin_mode));
> +	pin_mode[1] = SEESAW_GPIO_BULK_SET;
> +	err |= i2c_master_send(client, pin_mode, sizeof(pin_mode));
> +	if (err < 0)
> +		return err;
> +	if (err != sizeof(pin_mode))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id of_seesaw_match[] = {
> +	{
> +		.compatible = "adafruit,seesaw_gamepad",
> +	},
> +	{ /* Sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, of_seesaw_match);
> +#endif /* CONFIG_OF */
> +
> +static const struct i2c_device_id seesaw_id_table[] = { { KBUILD_MODNAME, 0 },
> +							{ /* Sentinel */ } };

Please format it just like all other drivers have it.

> +MODULE_DEVICE_TABLE(i2c, seesaw_id_table);
> +
> +static struct i2c_driver seesaw_driver = {
> +	.driver = {
> +		.name = SEESAW_DEVICE_NAME,
> +		.of_match_table = of_match_ptr(of_seesaw_match),
> +	},
> +	.id_table = seesaw_id_table,
> +	.probe		= seesaw_probe,

Some mixed indentation before =.

> +};
> +module_i2c_driver(seesaw_driver);
> +
> +MODULE_AUTHOR("Anshul Dalal <anshulusr@gmail.com>");
> +MODULE_DESCRIPTION("Adafruit Mini I2C Gamepad driver");
> +MODULE_LICENSE("GPL");

Best regards,
Krzysztof

