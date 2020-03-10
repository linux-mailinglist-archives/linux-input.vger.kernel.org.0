Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C22FD18045F
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 18:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgCJRIR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Mar 2020 13:08:17 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44622 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgCJRIQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Mar 2020 13:08:16 -0400
Received: by mail-pg1-f195.google.com with SMTP id 37so2419630pgm.11
        for <linux-input@vger.kernel.org>; Tue, 10 Mar 2020 10:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZzxrjWVvqes9xOLMTj09NfHflxYlObyQPIixAqeU2WA=;
        b=krosgVJ1LYVAdaUk20Rjxb76TvADa0SbhbuHdQi5rVnAEDN+qkgYKfMqRNaylqY1Fn
         EVfiBeVd7wEI5TsopdPtvfZhr0JkRHMpV6MWKFvmdV+wNSbKu0FpyVGehFA6aJxD8D5n
         FQ7YItJmW2LvYgEPOTll2iOFd66o2gDmp5/ATN8SPhDDme0CpANTnxL0qvXBky3nHzpE
         bc4Fc1eobFJbrRzpUmXZX/gRjraMARi4nLxtM+fcUjW8XTaEgJPRM/WmGt/aR/uVyMYY
         zuWCrU4b7cGYphF10KeJKZlD6i+x5ghE1nzm2xzLfFcNPx3QpWpjTJZ1XTgeJx8SKbWZ
         S/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZzxrjWVvqes9xOLMTj09NfHflxYlObyQPIixAqeU2WA=;
        b=c8/+WKvKMF5wyC8GqKC15M9NMIswQ6WEd5qnuZzG20RNHezsakkoTPlaEarGametfl
         FrCNBQBz32wG2ks+8G3LNrYIJMGuosdC2wc599ADZAIfX6139obRCGXngvUei9pWxFlO
         FKlqQAapwqIsJuSjdyYS3rJfY4NGSVQIXPMtwQri9HWXtlefJMBG7W8onMFvIhohk1LD
         W/5FJuCTYGaOg7BZEWrmoH59SLgT1o8TOE4MlCA6t4qwFjSX2hK6S/fz+sorwjhynPMS
         8kVDz4/MV82029JeTYtewYB1C74cpI7eTEvSJrFawWExGqOHIHltNdZiNj1/q2osAYUD
         Eakw==
X-Gm-Message-State: ANhLgQ0mBtNAT6chLXU+G0giF06HH1bGFCl+UWlMsrE8PF3SUzM2Mt9Q
        m2kjrNQQu8hDttVzq0QeK5k=
X-Google-Smtp-Source: ADFU+vvqcuBfu1Pze7l6azRIcz6agQ2QK4AO836EdGZME5Hd4dtSM91rkwcpBxx45u5JfPYeIJd9mg==
X-Received: by 2002:a62:4e57:: with SMTP id c84mr7732973pfb.156.1583860092488;
        Tue, 10 Mar 2020 10:08:12 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 26sm19367958pgs.85.2020.03.10.10.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 10:08:11 -0700 (PDT)
Date:   Tue, 10 Mar 2020 10:08:09 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Ferruh Yigit <fery@cypress.com>,
        Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH 2/2 v1] Input: cy8ctma140 - add driver
Message-ID: <20200310170809.GC192640@dtor-ws>
References: <20200310142818.15415-1-linus.walleij@linaro.org>
 <20200310142818.15415-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310142818.15415-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Tue, Mar 10, 2020 at 03:28:18PM +0100, Linus Walleij wrote:
> This adds a new driver for the Cypress CY8CTMA140 touchscreen.
> 
> This driver is inspired by out-of-tree code for the Samsung
> GT-S7710 mobile phone.
> 
> I have tried to compare the structure and behaviour of this
> touchscreen to the existing CYTTSP and CYTTSP4 generics and
> it seems pretty different. It is also different in character
> from the cy8ctmg110_ts.c. It appears to rather be vaguely
> related to the Melfas MMS114 driver, yet distinctly
> different.
> 
> Cc: Ferruh Yigit <fery@cypress.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  MAINTAINERS                            |   6 +
>  drivers/input/touchscreen/Kconfig      |  13 +
>  drivers/input/touchscreen/Makefile     |   1 +
>  drivers/input/touchscreen/cy8ctma140.c | 380 +++++++++++++++++++++++++
>  4 files changed, 400 insertions(+)
>  create mode 100644 drivers/input/touchscreen/cy8ctma140.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e7433d74530..39163de1a082 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4628,6 +4628,12 @@ T:	git git://linuxtv.org/anttip/media_tree.git
>  S:	Maintained
>  F:	drivers/media/common/cypress_firmware*
>  
> +CYPRESS CY8CTMA140 TOUCHSCREEN DRIVER
> +M:	Linus Walleij <linus.walleij@linaro.org>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	drivers/input/touchscreen/cy8ctma140.c
> +
>  CYTTSP TOUCHSCREEN DRIVER
>  M:	Ferruh Yigit <fery@cypress.com>
>  L:	linux-input@vger.kernel.org
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index c071f7c407b6..279b96d1761a 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -214,6 +214,19 @@ config TOUCHSCREEN_CY8CTMG110
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called cy8ctmg110_ts.
>  
> +config TOUCHSCREEN_CY8CTMA140
> +	tristate "cy8ctma140 touchscreen"
> +	depends on I2C
> +	depends on GPIOLIB || COMPILE_TEST
> +	help
> +	  Say Y here if you have a Cypress CY8CTMA140 capacitive
> +	  touchscreen also just known as "TMA140"
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called cy8ctma140.
> +
>  config TOUCHSCREEN_CYTTSP_CORE
>  	tristate "Cypress TTSP touchscreen"
>  	help
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index 94c6162409b3..006444c8f87b 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_TOUCHSCREEN_BU21029)	+= bu21029_ts.o
>  obj-$(CONFIG_TOUCHSCREEN_CHIPONE_ICN8318)	+= chipone_icn8318.o
>  obj-$(CONFIG_TOUCHSCREEN_CHIPONE_ICN8505)	+= chipone_icn8505.o
>  obj-$(CONFIG_TOUCHSCREEN_CY8CTMG110)	+= cy8ctmg110_ts.o
> +obj-$(CONFIG_TOUCHSCREEN_CY8CTMA140)	+= cy8ctma140.o
>  obj-$(CONFIG_TOUCHSCREEN_CYTTSP_CORE)	+= cyttsp_core.o
>  obj-$(CONFIG_TOUCHSCREEN_CYTTSP_I2C)	+= cyttsp_i2c.o cyttsp_i2c_common.o
>  obj-$(CONFIG_TOUCHSCREEN_CYTTSP_SPI)	+= cyttsp_spi.o
> diff --git a/drivers/input/touchscreen/cy8ctma140.c b/drivers/input/touchscreen/cy8ctma140.c
> new file mode 100644
> index 000000000000..fb79f4251122
> --- /dev/null
> +++ b/drivers/input/touchscreen/cy8ctma140.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for Cypress CY8CTMA140 (TMA140) touchscreen
> + * (C) 2020 Linus Walleij <linus.walleij@linaro.org>
> + * (C) 2007 Cypress
> + * (C) 2007 Google, Inc.
> + *
> + * Inspired by the tma140_skomer.c driver in the Samsung GT-S7710 code
> + * drop. The GT-S7710 is codenamed "Skomer", the code also indicates
> + * that the same touchscreen was used in a product called "Lucas".
> + *
> + * The code drop for GT-S7710 also contains a firmware downloader and
> + * 15 (!) versions of the firmware drop from Cypress. But here we assume
> + * the firmware got downloaded to the touchscreen flash successfully and
> + * just use it to read the fingers. The shipped vendor driver does the
> + * same.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/input.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/input/mt.h>
> +#include <linux/slab.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/i2c.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/delay.h>
> +
> +/* Used for driver name etc */
> +#define CY8CTMA140_NAME "cy8ctma140"
> +
> +/*
> + * The datasheet claims the device supports 4 fingers but the firmware
> + * I've seen certainly only supports 2 fingers.
> + */
> +#define CY8CTMA140_MAX_FINGERS 2
> +#define CY8CTMA140_GET_FINGERS 0x00
> +#define CY8CTMA140_GET_FW_INFO 0x19
> +
> +struct cy8ctma140 {
> +	struct input_dev *input;
> +	struct touchscreen_properties props;
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct regulator *vcpin;
> +	struct regulator *vdd;
> +	struct gpio_desc *irq;
> +};
> +
> +static irqreturn_t cy8ctma140_irq_thread(int irq, void *d)
> +{
> +	struct cy8ctma140 *ts = d;
> +	u8 msgbuf0[1];
> +	u8 buf[31];
> +	struct i2c_msg msg[2] = {

Drop explicit size?

> +		{
> +			.addr = ts->client->addr,
> +			.flags = 0,
> +			.len = 1,
> +			.buf = msgbuf0,
> +		}, {
> +			.addr = ts->client->addr,
> +			.flags = I2C_M_RD,
> +			.len = sizeof(buf),
> +			.buf = buf,
> +		},
> +	};
> +	u8 fingers;
> +	u16 f1x, f1y, f1z;
> +	u16 f2x, f2y, f2z;
> +	int ret;
> +	int slots[CY8CTMA140_MAX_FINGERS];
> +	struct input_mt_pos pos[CY8CTMA140_MAX_FINGERS];
> +
> +	msgbuf0[0] = CY8CTMA140_GET_FINGERS;
> +	ret = __i2c_transfer(ts->client->adapter, msg, 2);

ARRAY_SIZE() instead of 2 here and below.

Who is taking the adapter lock so that __i2c_transfer() can be used?
Why can't normal i2c_transfer() be used here?


> +	if (ret < 0) {
> +		dev_err(ts->dev, "error reading message\n");
> +		goto evt_out;
> +	}
> +	if (ret != 2) {
> +		dev_err(ts->dev, "wrong number of messages\n");
> +		goto evt_out;
> +	}
> +	if (buf[1] & 0x20) {
> +		dev_info(ts->dev, "invalid event\n");
> +		goto evt_out;
> +	}
> +
> +	f1x = buf[3] << 8 | buf[4];

get_unaligned_be16() here and below.

> +	f1y = buf[5] << 8 | buf[6];
> +	f1z = buf[7];
> +
> +	f2x = buf[9] << 8 | buf[10];
> +	f2y = buf[11] << 8 | buf[12];
> +	f2z = buf[13];
> +
> +	fingers = buf[2] & 0x0f;
> +	if (fingers == 0) {
> +		dev_info(ts->dev, "no fingers\n");
> +		goto evt_out;
> +	}
> +
> +	input_mt_assign_slots(ts->input, slots, pos, fingers, 0);
> +
> +	/*
> +	 * When just handling two fingers this code is simple and we do not
> +	 * need a loop increasing the complexity. If you need to modify
> +	 * this driver for some firmware handling more than 2 fingers,
> +	 * this is where you put in an array of coordinated and a loop
> +	 * instead.
> +	 */
> +	if (fingers >= 1) {
> +		dev_dbg(ts->dev, "%d fingers: finger 1 ID: %02x (%d, %d, %d)\n",
> +			fingers, buf[8] >> 4, f1x, f1y, f1z);
> +		input_mt_slot(ts->input, slots[0]);
> +		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, true);
> +		input_report_abs(ts->input, ABS_MT_POSITION_X, f1x);
> +		input_report_abs(ts->input, ABS_MT_POSITION_Y, f1y);
> +		input_report_abs(ts->input, ABS_MT_PRESSURE, f1z);
> +	}
> +	if (fingers >= 2) {
> +		dev_dbg(ts->dev, "%d fingers: finger 2 ID %02x (%d, %d, %d)\n",
> +			fingers, buf[8] & 0x0f, f2x, f2y, f2z);
> +		input_mt_slot(ts->input, slots[1]);
> +		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, true);
> +		input_report_abs(ts->input, ABS_MT_POSITION_X, f2x);
> +		input_report_abs(ts->input, ABS_MT_POSITION_Y, f2y);
> +		input_report_abs(ts->input, ABS_MT_PRESSURE, f2z);


Please use touchscreen_set_mt_pos()/touchscreen_report_pos() so that we
can support common transformation device properties from
of_touchscreen.c

> +	}
> +	if (fingers > 2)
> +		dev_err(ts->dev, "%d fingers - unsupported!\n", fingers);
> +
> +	input_mt_sync_frame(ts->input);
> +	input_sync(ts->input);
> +
> +evt_out:
> +	return IRQ_HANDLED;
> +}
> +
> +static int cy8ctma140_init(struct cy8ctma140 *ts)
> +{
> +	u8 addr[1];
> +	u8 buf[5];
> +	int ret;
> +
> +	addr[0] = CY8CTMA140_GET_FW_INFO;
> +	ret = i2c_master_send(ts->client, addr, 1);
> +	if (ret < 0) {
> +		dev_err(ts->dev, "error sending FW info message\n");
> +		return ret;
> +	}
> +	ret = i2c_master_recv(ts->client, buf, 5);
> +	if (ret < 0) {
> +		dev_err(ts->dev, "error recieveing FW info message\n");
> +		return ret;
> +	}
> +	if (ret != 5) {
> +		dev_err(ts->dev, "got only %d bytes\n", ret);
> +		return -EIO;
> +	}
> +
> +	dev_info(ts->dev, "vendor %c%c, HW ID %.2d, FW ver %.4d\n",
> +		 buf[0], buf[1], buf[3], buf[4]);
> +	return 0;
> +}
> +
> +static int cy8ctma140_power_up(struct cy8ctma140 *ts)
> +{
> +	int ret;
> +
> +	ret = regulator_enable(ts->vcpin);
> +	if (ret) {
> +		dev_err(ts->dev, "failed to enable VCPIN voltage\n");
> +		return ret;
> +	}
> +	ret = regulator_enable(ts->vdd);
> +	if (ret) {
> +		dev_err(ts->dev, "failed to enable VDD voltage\n");
> +		regulator_disable(ts->vcpin);
> +		return ret;
> +	}

Use bulk regulator API?

> +
> +	msleep(250);
> +
> +	return 0;
> +}
> +
> +static void cy8ctma140_power_down(struct cy8ctma140 *ts)
> +{
> +	regulator_disable(ts->vdd);
> +	regulator_disable(ts->vcpin);
> +}
> +
> +/* Called from the registered devm action */
> +static void cy8ctma140_power_off_action(void *d)
> +{
> +	struct cy8ctma140 *ts = d;
> +
> +	cy8ctma140_power_down(ts);
> +}
> +
> +static int cy8ctma140_probe(struct i2c_client *client,
> +			    const struct i2c_device_id *id)
> +{
> +	struct cy8ctma140 *ts;
> +	struct input_dev *input;
> +	struct device *dev = &client->dev;
> +	int ret;
> +
> +	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
> +	if (!ts)
> +		return -ENOMEM;
> +
> +	input = devm_input_allocate_device(dev);
> +	if (!input)
> +		return -ENOMEM;
> +
> +	ts->dev = dev;
> +	ts->client = client;
> +	ts->input = input;
> +
> +	/*
> +	 * This sets up event max/min capabilities and fuzz.
> +	 * Some DT properties are compulsory so we do not need
> +	 * to provide defaults for X/Y max or pressure max.
> +	 *
> +	 * We just initialize a very simple MT touchscreen here,
> +	 * some devices use the capability of this touchscreen to
> +	 * provide touchkeys, and in that case this needs to be
> +	 * extended to handle touchkey input.
> +	 *
> +	 * The firmware takes care of finger tracking and dropping
> +	 * invalid ranges.
> +	 */
> +	touchscreen_parse_properties(input, true, &ts->props);
> +
> +	ret = input_mt_init_slots(input, CY8CTMA140_MAX_FINGERS,
> +				  INPUT_MT_DIRECT);
> +	if (ret)
> +		return ret;

Since this holds and returns error codes, can we call this variable
"error" please?

> +
> +	input->name = CY8CTMA140_NAME;
> +	input->phys = "inpus/ts";

Umm... If there is not a better physical location string, maybe just
omit it?

> +	input->id.bustype = BUS_I2C;
> +	input_set_drvdata(input, ts);
> +
> +	/* VCPIN is the analog voltage supply */
> +	ts->vcpin = devm_regulator_get(dev, "vcpin");
> +	if (IS_ERR(ts->vcpin)) {
> +		if (PTR_ERR(ts->vcpin) != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get VCPIN regulator %d\n",
> +				(int)PTR_ERR(ts->vcpin));
> +		return PTR_ERR(ts->vcpin);
> +	}
> +	/* According to datasheet this should be in the 2.7-3.6 V range */
> +	ret = regulator_set_voltage(ts->vcpin, 2700000, 3600000);
> +	if (ret) {
> +		dev_err(dev, "failed to set VCPIN voltage\n");
> +		return ret;
> +	}

Shouldn't this already be in DT? We typically do not configure voltage
on various rail unless in very specific circumstances.

> +
> +	/*
> +	 * VDD is the digital voltage supply
> +	 * since the voltage range of VDD overlaps that of VCPIN,
> +	 * many designs to just supply both with a single voltage
> +	 * source of ~3.3 V.
> +	 */
> +	ts->vdd = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(ts->vdd)) {
> +		if (PTR_ERR(ts->vdd) != -EPROBE_DEFER)
> +			dev_err(dev, "Failed to get VDD regulator %d\n",
> +				(int)PTR_ERR(ts->vdd));
> +		return PTR_ERR(ts->vdd);
> +	}
> +	/* According to datasheet this should be in the 1.71-3.6 V range */
> +	ret = regulator_set_voltage(ts->vdd, 2700000, 3600000);
> +	if (ret) {
> +		dev_err(dev, "failed to set VDD voltage\n");
> +		return ret;
> +	}
> +
> +	ret = cy8ctma140_power_up(ts);
> +	if (ret)
> +		return ret;
> +	ret = devm_add_action_or_reset(dev, cy8ctma140_power_off_action, ts);
> +	if (ret) {
> +		dev_err(dev, "failed to install power off handler\n");
> +		return ret;
> +	}
> +
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +					cy8ctma140_irq_thread,
> +					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,

The trigger (edge, level) should come from DT.

> +					CY8CTMA140_NAME, ts);
> +	if (ret) {
> +		dev_err(dev, "irq %d busy? error %d\n", client->irq, ret);
> +		goto err_reg_dis;
> +	}
> +
> +	ret = cy8ctma140_init(ts);
> +	if (ret)
> +		return ret;
> +
> +	ret = input_register_device(input);
> +	if (ret)
> +		goto err_reg_dis;
> +
> +	i2c_set_clientdata(client, ts);
> +
> +	device_init_wakeup(dev, 1);

We should not mark device as wakeup source unconditionally. If there is
"wakeup-source" property in DT, i2c core will do the right thing
automatically. Please drop.

> +	return 0;
> +
> +err_reg_dis:
> +	cy8ctma140_power_down(ts);
> +	return ret;
> +}
> +
> +static int __maybe_unused cy8ctma140_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct cy8ctma140 *ts = i2c_get_clientdata(client);
> +
> +	if (device_may_wakeup(&client->dev))
> +		enable_irq_wake(client->irq);

No need as i2c core manages wake irq if there is "wakeup-source"
property. So it should read:

	if (!device_may_wakeup(&client->dev))
		cy8ctma140_power_down(ts);

> +	else
> +		cy8ctma140_power_down(ts);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cy8ctma140_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct cy8ctma140 *ts = i2c_get_clientdata(client);
> +	int ret;
> +
> +	if (device_may_wakeup(&client->dev)) {
> +		disable_irq_wake(client->irq);
> +	} else {
> +		ret = cy8ctma140_power_up(ts);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(cy8ctma140_pm, cy8ctma140_suspend, cy8ctma140_resume);
> +
> +static const struct i2c_device_id cy8ctma140_idtable[] = {
> +	{ CY8CTMA140_NAME, 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, cy8ctma140_idtable);
> +
> +static const struct of_device_id cy8ctma140_of_match[] = {
> +	{
> +		.compatible = "cypress,cy8ctma140",
> +	},
> +};
> +MODULE_DEVICE_TABLE(of, cy8ctma140_of_match);
> +
> +static struct i2c_driver cy8ctma140_driver = {
> +	.driver		= {
> +		.name	= CY8CTMA140_NAME,
> +		.pm	= &cy8ctma140_pm,
> +		.of_match_table = cy8ctma140_of_match,
> +	},
> +	.id_table	= cy8ctma140_idtable,
> +	.probe		= cy8ctma140_probe,
> +};
> +module_i2c_driver(cy8ctma140_driver);
> +
> +MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
> +MODULE_DESCRIPTION("CY8CTMA140 TouchScreen Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.21.1
> 

Thanks.

-- 
Dmitry
