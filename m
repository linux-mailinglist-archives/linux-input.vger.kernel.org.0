Return-Path: <linux-input+bounces-57-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 075EA7EB6C2
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 20:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 849741F2493B
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 19:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D88F33CF9;
	Tue, 14 Nov 2023 19:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="QWhmlB5s"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E0417D8;
	Tue, 14 Nov 2023 19:07:58 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8FB119;
	Tue, 14 Nov 2023 11:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1699988874;
	bh=SYGluN3+4eLJfq22jk0bwc/x8ZAsdhZvXpbOhM3QM08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWhmlB5sfntwHNnwjF3kgTBZ9EsKDPxtPP/rsElLiZ+4IM+G1LxbgQLTglDj/zf/o
	 uPDylesv+SAAd8SBnOuNro6NXN8fHkvxJwRKlnzT3abEdjragcsb75obLkj/vi1pXr
	 oBC6RKTUZV68Jul3EPrbLV+mpK2jADhY1nGAIrZQ=
Date: Tue, 14 Nov 2023 20:07:53 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jeff LaBundy <jeff@labundy.com>, 
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v8 2/2] input: joystick: driver for Adafruit Seesaw
 Gamepad
Message-ID: <6384a19d-8b47-43ce-a8ad-16843b8fabf2@t-8ch.de>
References: <20231108005337.45069-1-anshulusr@gmail.com>
 <20231108005337.45069-2-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108005337.45069-2-anshulusr@gmail.com>

On 2023-11-08 06:23:36+0530, Anshul Dalal wrote:
> Adds a driver for a mini gamepad that communicates over i2c, the gamepad
> has bidirectional thumb stick input and six buttons.

With or without the tiny nitpicks mentioned below:

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>

> The gamepad chip utilizes the open framework from Adafruit called 'Seesaw'
> to transmit the ADC data for the joystick and digital pin state for the
> buttons. I have only implemented the functionality required to receive the
> thumb stick and button state.

[..]

> diff --git a/drivers/input/joystick/adafruit-seesaw.c b/drivers/input/joystick/adafruit-seesaw.c
> new file mode 100644
> index 000000000000..8e8ef26a585f
> --- /dev/null
> +++ b/drivers/input/joystick/adafruit-seesaw.c
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2023 Anshul Dalal <anshulusr@gmail.com>
> + *
> + * Driver for Adafruit Mini I2C Gamepad
> + *
> + * Based on the work of:
> + *	Oleh Kravchenko (Sparkfun Qwiic Joystick driver)
> + *
> + * Datasheet: https://cdn-learn.adafruit.com/downloads/pdf/gamepad-qt.pdf
> + * Product page: https://www.adafruit.com/product/5743
> + * Firmware and hardware sources: https://github.com/adafruit/Adafruit_Seesaw
> + *
> + * TODO:
> + *	- Add interrupt support
> + */
> +
> +#include <asm-generic/unaligned.h>

#include <asm/unaligned.h>

> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#define SEESAW_DEVICE_NAME	     "seesaw-gamepad"
> +
> +#define SEESAW_STATUS_BASE	     0x00
> +#define SEESAW_GPIO_BASE	     0x01
> +#define SEESAW_ADC_BASE		     0x09
> +
> +#define SEESAW_GPIO_DIRCLR_BULK	     0x03
> +#define SEESAW_GPIO_BULK	     0x04
> +#define SEESAW_GPIO_BULK_SET	     0x05
> +#define SEESAW_GPIO_PULLENSET	     0x0b
> +
> +#define SEESAW_STATUS_HW_ID	     0x01
> +#define SEESAW_STATUS_SWRST	     0x7f
> +
> +#define SEESAW_ADC_OFFSET	     0x07
> +
> +#define SEESAW_BUTTON_A		     0x05
> +#define SEESAW_BUTTON_B		     0x01
> +#define SEESAW_BUTTON_X		     0x06
> +#define SEESAW_BUTTON_Y		     0x02
> +#define SEESAW_BUTTON_START	     0x10
> +#define SEESAW_BUTTON_SELECT	     0x00
> +
> +#define SEESAW_ANALOG_X		     0x0e
> +#define SEESAW_ANALOG_Y		     0x0f
> +
> +#define SEESAW_JOYSTICK_MAX_AXIS     1023
> +#define SEESAW_JOYSTICK_FUZZ	     2
> +#define SEESAW_JOYSTICK_FLAT	     4
> +
> +#define SEESAW_GAMEPAD_POLL_INTERVAL 16
> +#define SEESAW_GAMEPAD_POLL_MIN	     8
> +#define SEESAW_GAMEPAD_POLL_MAX	     32
> +
> +static const u32 SEESAW_BUTTON_MASK =
> +	BIT(SEESAW_BUTTON_A) | BIT(SEESAW_BUTTON_B) | BIT(SEESAW_BUTTON_X) |
> +	BIT(SEESAW_BUTTON_Y) | BIT(SEESAW_BUTTON_START) |
> +	BIT(SEESAW_BUTTON_SELECT);
> +
> +struct seesaw_gamepad {
> +	struct input_dev *input_dev;

This field is not used, but it doesn't hurt.
If you remove the field you can get rid of the whole struct itself.

> +	struct i2c_client *i2c_client;
> +};
> +
> +struct seesaw_data {
> +	u16 x;
> +	u16 y;
> +	u32 button_state;
> +};
> +
> +struct seesaw_button_description {
> +	unsigned int code;
> +	unsigned int bit;
> +};

Not used anymore.

> +
> +static const struct key_entry seesaw_buttons_new[] = {
> +	{ KE_KEY, SEESAW_BUTTON_A, .keycode = BTN_SOUTH },
> +	{ KE_KEY, SEESAW_BUTTON_B, .keycode = BTN_EAST },
> +	{ KE_KEY, SEESAW_BUTTON_X, .keycode = BTN_NORTH },
> +	{ KE_KEY, SEESAW_BUTTON_Y, .keycode = BTN_WEST },
> +	{ KE_KEY, SEESAW_BUTTON_START, .keycode = BTN_START },
> +	{ KE_KEY, SEESAW_BUTTON_SELECT, .keycode = BTN_SELECT },
> +	{ KE_END, 0 },

No comma after sentinel element.

> +};
> +
> +static int seesaw_register_read(struct i2c_client *client, u8 register_high,
> +				u8 register_low, char *buf, int count)
> +{
> +	int ret;
> +	u8 register_buf[2] = { register_high, register_low };
> +
> +	struct i2c_msg message_buf[2] = {
> +		{
> +			.addr = client->addr,
> +			.flags = client->flags,
> +			.len = sizeof(register_buf),
> +			.buf = register_buf

Commas after normal last elements.

> +		},
> +		{
> +			.addr = client->addr,
> +			.flags = client->flags | I2C_M_RD,
> +			.len = count,
> +			.buf = buf

Same as above.

> +		},
> +	};
> +	ret = i2c_transfer(client->adapter, message_buf,
> +			   ARRAY_SIZE(message_buf));
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int seesaw_register_write_u8(struct i2c_client *client, u8 register_high,
> +				    u8 register_low, u8 value)
> +{
> +	int ret;
> +	u8 write_buf[3] = { register_high, register_low, value };
> +
> +	ret = i2c_master_send(client, write_buf, sizeof(write_buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int seesaw_register_write_u32(struct i2c_client *client,
> +				     u8 register_high, u8 register_low,
> +				     u32 value)
> +{
> +	int ret;
> +	u8 write_buf[6] = { register_high, register_low };
> +
> +	put_unaligned_be32(value, write_buf + 2);
> +	ret = i2c_master_send(client, write_buf, sizeof(write_buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int seesaw_read_data(struct i2c_client *client, struct seesaw_data *data)
> +{
> +	int ret;
> +	__be16 adc_data;
> +	__be32 read_buf;
> +
> +	ret = seesaw_register_read(client, SEESAW_GPIO_BASE, SEESAW_GPIO_BULK,
> +				   (char *)&read_buf, sizeof(read_buf));
> +	if (ret)
> +		return ret;
> +
> +	data->button_state = ~be32_to_cpu(read_buf);
> +
> +	ret = seesaw_register_read(client, SEESAW_ADC_BASE,
> +				   SEESAW_ADC_OFFSET + SEESAW_ANALOG_X,
> +				   (char *)&adc_data, sizeof(adc_data));
> +	if (ret)
> +		return ret;
> +	/*
> +	 * ADC reads left as max and right as 0, must be reversed since kernel
> +	 * expects reports in opposite order.
> +	 */
> +	data->x = SEESAW_JOYSTICK_MAX_AXIS - be16_to_cpu(adc_data);
> +
> +	ret = seesaw_register_read(client, SEESAW_ADC_BASE,
> +				   SEESAW_ADC_OFFSET + SEESAW_ANALOG_Y,
> +				   (char *)&adc_data, sizeof(adc_data));
> +	if (ret)
> +		return ret;
> +	data->y = be16_to_cpu(adc_data);
> +
> +	return 0;
> +}
> +
> +static void seesaw_poll(struct input_dev *input)
> +{
> +	int err, i;
> +	struct seesaw_gamepad *private = input_get_drvdata(input);
> +	struct seesaw_data data;
> +
> +	err = seesaw_read_data(private->i2c_client, &data);
> +	if (err) {
> +		dev_err_ratelimited(&input->dev,
> +				    "failed to read joystick state: %d\n", err);
> +		return;
> +	}
> +
> +	input_report_abs(input, ABS_X, data.x);
> +	input_report_abs(input, ABS_Y, data.y);
> +
> +	for_each_set_bit(i, (long *)&SEESAW_BUTTON_MASK,
> +			 BITS_PER_TYPE(SEESAW_BUTTON_MASK)) {
> +		if (!sparse_keymap_report_event(
> +			    input, i, data.button_state & BIT(i), false)) {
> +			dev_err_ratelimited(&input->dev,
> +					    "failed to report keymap event");
> +			return;

I would drop this return. Report as much data as possible.

> +		};
> +	}
> +
> +	input_sync(input);
> +}
> +
> +static int seesaw_probe(struct i2c_client *client)
> +{
> +	int ret;
> +	u8 hardware_id;
> +	struct seesaw_gamepad *seesaw;
> +
> +	ret = seesaw_register_write_u8(client, SEESAW_STATUS_BASE,
> +				       SEESAW_STATUS_SWRST, 0xFF);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for the registers to reset before proceeding */
> +	usleep_range(10000, 15000);

This would be a very tiny bit clearer:

usleep_range(10 * MSEC_PER_USEC, 15 * MSEC_PER_USEC);

> +
> +	seesaw = devm_kzalloc(&client->dev, sizeof(*seesaw), GFP_KERNEL);
> +	if (!seesaw)
> +		return -ENOMEM;
> +
> +	ret = seesaw_register_read(client, SEESAW_STATUS_BASE,
> +				   SEESAW_STATUS_HW_ID, &hardware_id,
> +				   sizeof(hardware_id));
> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(&client->dev, "Adafruit Seesaw Gamepad, Hardware ID: %02x\n",
> +		hardware_id);
> +
> +	/* Set Pin Mode to input and enable pull-up resistors */
> +	ret = seesaw_register_write_u32(client, SEESAW_GPIO_BASE,
> +					SEESAW_GPIO_DIRCLR_BULK,
> +					SEESAW_BUTTON_MASK);
> +	if (ret)
> +		return ret;
> +	ret = seesaw_register_write_u32(client, SEESAW_GPIO_BASE,
> +					SEESAW_GPIO_PULLENSET,
> +					SEESAW_BUTTON_MASK);
> +	if (ret)
> +		return ret;
> +	ret = seesaw_register_write_u32(client, SEESAW_GPIO_BASE,
> +					SEESAW_GPIO_BULK_SET,
> +					SEESAW_BUTTON_MASK);
> +	if (ret)
> +		return ret;
> +
> +	seesaw->i2c_client = client;
> +	seesaw->input_dev = devm_input_allocate_device(&client->dev);
> +	if (!seesaw->input_dev)
> +		return -ENOMEM;
> +
> +	seesaw->input_dev->id.bustype = BUS_I2C;
> +	seesaw->input_dev->name = "Adafruit Seesaw Gamepad";
> +	seesaw->input_dev->phys = "i2c/" SEESAW_DEVICE_NAME;
> +	input_set_drvdata(seesaw->input_dev, seesaw);
> +	input_set_abs_params(seesaw->input_dev, ABS_X, 0,
> +			     SEESAW_JOYSTICK_MAX_AXIS, SEESAW_JOYSTICK_FUZZ,
> +			     SEESAW_JOYSTICK_FLAT);
> +	input_set_abs_params(seesaw->input_dev, ABS_Y, 0,
> +			     SEESAW_JOYSTICK_MAX_AXIS, SEESAW_JOYSTICK_FUZZ,
> +			     SEESAW_JOYSTICK_FLAT);
> +
> +	ret = sparse_keymap_setup(seesaw->input_dev, seesaw_buttons_new, NULL);
> +	if (ret) {
> +		dev_err(&client->dev,
> +			"failed to set up input device keymap: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = input_setup_polling(seesaw->input_dev, seesaw_poll);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to set up polling: %d\n", ret);
> +		return ret;
> +	}
> +
> +	input_set_poll_interval(seesaw->input_dev, SEESAW_GAMEPAD_POLL_INTERVAL);
> +	input_set_max_poll_interval(seesaw->input_dev, SEESAW_GAMEPAD_POLL_MAX);
> +	input_set_min_poll_interval(seesaw->input_dev, SEESAW_GAMEPAD_POLL_MIN);
> +
> +	ret = input_register_device(seesaw->input_dev);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to register joystick: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id seesaw_id_table[] = {
> +	{ SEESAW_DEVICE_NAME, 0 },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, seesaw_id_table);
> +
> +static struct i2c_driver seesaw_driver = {
> +	.driver = {
> +		.name = SEESAW_DEVICE_NAME,
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

