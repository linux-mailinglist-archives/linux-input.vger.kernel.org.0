Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5E337BCFA7
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 20:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbjJHSoc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 14:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjJHSob (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 14:44:31 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17DCAC;
        Sun,  8 Oct 2023 11:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1696790666; bh=63Z+R2wvQ0AA6oRA+nliMbSqzvp035ypaHhw56blTdQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FjU3gPjnYiyaSUWH6/zquN5bhFV2XVXKTcYItQCi1IvtICmrLE6od26lIhs2sRcor
         OnoBXoIP+Q2WsUeNFlLxXwoodUuGqbyFuQWkvt4YgPcuwheO7jI9MmbscqcAfJf4ug
         8sNt5G9bDsqvFGNbYDMP563fkcwSxFwUy2B8XG8c=
Date:   Sun, 8 Oct 2023 20:44:26 +0200
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Anshul Dalal <anshulusr@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2 2/2] input: joystick: driver for Adafruit Seesaw
 Gamepad
Message-ID: <ac41373d-3ce0-4fdd-a778-9d303311fb05@t-8ch.de>
References: <20231008172435.2391009-1-anshulusr@gmail.com>
 <20231008172435.2391009-2-anshulusr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231008172435.2391009-2-anshulusr@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

please also Cc linux-kernel@vger.kernel.org on all patches.

Some more comments inline.

On 2023-10-08 22:54:34+0530, Anshul Dalal wrote:
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
> Driver tested on RPi Zero 2W
> 
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> ---
> 
> Changes for v2:
> adafruit-seesaw.c:
> - Renamed file from 'adafruit_seesaw.c'
> - Changed device name from 'seesaw_gamepad' to 'seesaw-gamepad'
> - Changed count parameter for receiving joystick x on line 118:
>     `2` to `sizeof(write_buf)`
> - Fixed invalid buffer size on line 123 and 126:
>     `data->y` to `sizeof(data->y)`
> - Added comment for the `mdelay(10)` on line 169
> - Changed inconsistent indentation on line 271
> Kconfig:
> - Fixed indentation for the help text
> - Updated module name
> Makefile:
> - Updated module object file name
> MAINTAINERS:
> - Updated file name for the driver and bindings
> 
>  MAINTAINERS                              |   7 +
>  drivers/input/joystick/Kconfig           |   9 +
>  drivers/input/joystick/Makefile          |   1 +
>  drivers/input/joystick/adafruit-seesaw.c | 277 +++++++++++++++++++++++
>  4 files changed, 294 insertions(+)
>  create mode 100644 drivers/input/joystick/adafruit-seesaw.c
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
> +F:	Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml
> +F:	drivers/input/joystick/adafruit-seesaw.c
> +
>  ADDRESS SPACE LAYOUT RANDOMIZATION (ASLR)
>  M:	Jiri Kosina <jikos@kernel.org>
>  S:	Maintained
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index ac6925ce8366..4d4fc38087bf 100644
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
> +	  Say Y here if you want to use the Adafruit Mini I2C Gamepad.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called adafruit-seesaw.
> +
>  endif
> diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
> index 3937535f0098..fdc653209542 100644
> --- a/drivers/input/joystick/Makefile
> +++ b/drivers/input/joystick/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_JOYSTICK_N64)		+= n64joy.o
>  obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+= psxpad-spi.o
>  obj-$(CONFIG_JOYSTICK_PXRC)		+= pxrc.o
>  obj-$(CONFIG_JOYSTICK_QWIIC)		+= qwiic-joystick.o
> +obj-$(CONFIG_JOYSTICK_SEESAW)		+= adafruit-seesaw.o
>  obj-$(CONFIG_JOYSTICK_SENSEHAT)	+= sensehat-joystick.o
>  obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+= sidewinder.o
>  obj-$(CONFIG_JOYSTICK_SPACEBALL)	+= spaceball.o
> diff --git a/drivers/input/joystick/adafruit-seesaw.c b/drivers/input/joystick/adafruit-seesaw.c
> new file mode 100644
> index 000000000000..1e8b3f5604d8
> --- /dev/null
> +++ b/drivers/input/joystick/adafruit-seesaw.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2023 Anshul Dalal <anshulusr@gmail.com>
> + *
> + * Driver for Adafruit Mini I2C Gamepad
> + *
> + * Based on the work of:
> + *	Oleh Kravchenko (Sparkfun Qwiic Joystick driver)
> + *
> + * Product page: https://www.adafruit.com/product/5743
> + * Firmware and hardware sources: https://github.com/adafruit/Adafruit_Seesaw
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +/* clang-format off */
> +#define SEESAW_DEVICE_NAME	"seesaw-gamepad"
> +
> +#define SEESAW_STATUS_BASE	0
> +#define SEESAW_GPIO_BASE	1
> +#define SEESAW_ADC_BASE		9
> +
> +#define SEESAW_GPIO_DIRCLR_BULK	3
> +#define SEESAW_GPIO_BULK	4
> +#define SEESAW_GPIO_BULK_SET	5
> +#define SEESAW_GPIO_PULLENSET	11
> +
> +#define SEESAW_STATUS_HW_ID	1
> +#define SEESAW_STATUS_SWRST	127
> +
> +#define SEESAW_ADC_OFFSET	7
> +
> +#define BUTTON_A	5
> +#define BUTTON_B	1
> +#define BUTTON_X	6
> +#define BUTTON_Y	2
> +#define BUTTON_START	16
> +#define BUTTON_SELECT	0
> +
> +#define ANALOG_X	14
> +#define ANALOG_Y	15
> +
> +#define SEESAW_JOYSTICK_MAX_AXIS	1023
> +#define SEESAW_JOYSTICK_FUZZ		2
> +#define SEESAW_JOYSTICK_FLAT		4
> +
> +#define SEESAW_GAMEPAD_POLL_INTERVAL	16
> +#define SEESAW_GAMEPAD_POLL_MIN		8
> +#define SEESAW_GAMEPAD_POLL_MAX		32
> +/* clang-format on */
> +
> +u32 BUTTON_MASK = (1UL << BUTTON_A) | (1UL << BUTTON_B) | (1UL << BUTTON_X) |
> +		  (1UL << BUTTON_Y) | (1UL << BUTTON_START) |
> +		  (1UL << BUTTON_SELECT);

BIT(BUTTON_A), etc. Also below.

> +
> +struct seesaw_gamepad {
> +	char physical_path[32];
> +	unsigned char hardware_id;

This can be dropped.

> +	struct input_dev *input_dev;
> +	struct i2c_client *i2c_client;
> +};
> +
> +struct seesaw_data {
> +	__be16 x;
> +	__be16 y;
> +	u8 button_a, button_b, button_x, button_y, button_start, button_select;
> +};
> +
> +static int seesaw_read_data(struct i2c_client *client, struct seesaw_data *data)
> +{
> +	int err;
> +	unsigned char write_buf[2] = { SEESAW_GPIO_BASE, SEESAW_GPIO_BULK };
> +
> +	unsigned char read_buf[4];
> +
> +	err = i2c_master_send(client, write_buf, sizeof(write_buf));
> +	if (err < 0)
> +		return err;
> +	if (err != sizeof(write_buf))
> +		return -EIO;

The return value of the i2c_master_ APIs should never be != the count
parameter.
So the addition sizeof() checks can go away.

> +	err = i2c_master_recv(client, read_buf, sizeof(read_buf));
> +	if (err < 0)
> +		return err;
> +	if (err != sizeof(read_buf))
> +		return -EIO;
> +	u32 result = ((u32)read_buf[0] << 24) | ((u32)read_buf[1] << 16) |
> +		     ((u32)read_buf[2] << 8) | (u32)read_buf[3];

get_unaligned_be32()

> +	data->button_a = !(result & (1UL << BUTTON_A));

This should be able to use test_bit().

> +	data->button_b = !(result & (1UL << BUTTON_B));
> +	data->button_x = !(result & (1UL << BUTTON_X));
> +	data->button_y = !(result & (1UL << BUTTON_Y));
> +	data->button_start = !(result & (1UL << BUTTON_START));
> +	data->button_select = !(result & (1UL << BUTTON_SELECT));
> +
> +	write_buf[0] = SEESAW_ADC_BASE;
> +	write_buf[1] = SEESAW_ADC_OFFSET + ANALOG_X;
> +	err = i2c_master_send(client, write_buf, sizeof(write_buf));
> +	if (err < 0)
> +		return err;
> +	if (err != sizeof(write_buf))
> +		return -EIO;
> +	err = i2c_master_recv(client, (char *)&data->x, sizeof(data->x));
> +	if (err < 0)
> +		return err;
> +	if (err != sizeof(data->x))
> +		return -EIO;
> +	/*
> +	 * ADC reads left as max and right as 0, must be reversed since kernel
> +	 * expects reports in opposite order.
> +	 */
> +	data->x = SEESAW_JOYSTICK_MAX_AXIS - be16_to_cpu(data->x);
> +
> +	write_buf[1] = SEESAW_ADC_OFFSET + ANALOG_Y;
> +	err = i2c_master_send(client, write_buf, sizeof(write_buf));
> +	if (err < 0)
> +		return err;
> +	if (err != sizeof(write_buf))
> +		return -EIO;
> +	err = i2c_master_recv(client, (char *)&data->y, sizeof(data->y));
> +	if (err < 0)
> +		return err;
> +	if (err != sizeof(data->y))
> +		return -EIO;
> +	data->y = be16_to_cpu(data->y);
> +
> +	return 0;
> +}
> +
> +static void seesaw_poll(struct input_dev *input)
> +{
> +	struct seesaw_gamepad *private = input_get_drvdata(input);
> +	struct seesaw_data data;
> +	int err;
> +
> +	err = seesaw_read_data(private->i2c_client, &data);
> +	if (err != 0)
> +		return;
> +
> +	input_report_abs(input, ABS_X, data.x);
> +	input_report_abs(input, ABS_Y, data.y);
> +	input_report_key(input, BTN_A, data.button_a);
> +	input_report_key(input, BTN_B, data.button_b);
> +	input_report_key(input, BTN_X, data.button_x);
> +	input_report_key(input, BTN_Y, data.button_y);
> +	input_report_key(input, BTN_START, data.button_start);
> +	input_report_key(input, BTN_SELECT, data.button_select);
> +	input_sync(input);
> +}
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
> +
> +	/* Wait for the registers to reset before proceeding */
> +	mdelay(10);
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

This will mangle the errorcode if the calls to i2c_master_send() return
different errors.

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
> +		.compatible = "adafruit,seesaw-gamepad",
> +	},
> +	{ /* Sentinel */ },

No comma after sentinel.

> +};
> +MODULE_DEVICE_TABLE(of, of_seesaw_match);
> +#endif /* CONFIG_OF */
> +
> +static const struct i2c_device_id seesaw_id_table[] = { { KBUILD_MODNAME, 0 },
> +							{ /* Sentinel */ } };

Borked formatting.

Also afaik KBUILD_MODNAME in id-tables is frowned upon.
Use the explicit string instead.

> +MODULE_DEVICE_TABLE(i2c, seesaw_id_table);
> +
> +static struct i2c_driver seesaw_driver = {
> +	.driver = {
> +		.name = SEESAW_DEVICE_NAME,
> +		.of_match_table = of_match_ptr(of_seesaw_match),
> +	},
> +	.id_table = seesaw_id_table,
> +	.probe = seesaw_probe,
> +};
> +module_i2c_driver(seesaw_driver);
> +
> +MODULE_AUTHOR("Anshul Dalal <anshulusr@gmail.com>");
> +MODULE_DESCRIPTION("Adafruit Mini I2C Gamepad driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.42.0
> 
