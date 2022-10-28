Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C43B6611B9A
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 22:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbiJ1Ufw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 16:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbiJ1Ufv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 16:35:51 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3330DDA2B;
        Fri, 28 Oct 2022 13:35:47 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id p21so1947097plr.7;
        Fri, 28 Oct 2022 13:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sDUL3TSrznJqSIvxTTJUySuBg7vegO1+QRWcU4/yJSc=;
        b=F96x0ISBID7UwCgc8vnHDWZH+cyF4Az1KqKc9FI0Vv9MOEIdtgaYprHxDAIPWA0FB2
         lg9hKLEI8GgZJx0Nxwxox3kev25BEvn5Rr45ObkHLwTuqt200OB1XtT25/yuJju3pvfm
         jcUEom9BWiOSgvHHFiRchn8/XJ8DsK8FAM6ZR+C0n/1XQ8WeeRUGiB0k0iS3h69/Ch79
         kZG7IAgrYqq+H0xER8MVeJMcmhby2TodXuLGvp8pWLo6uLgGdDTzUyYsu0rIwKTZNnbU
         DdqRFifn36w/KMj78Uxy+ISLLaYqxBgizPayYWyPRqF5EZAR7//T0ho/mEE0ErGl+GsO
         sPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDUL3TSrznJqSIvxTTJUySuBg7vegO1+QRWcU4/yJSc=;
        b=AIY54KQOBsyiiDqNorOuxLpDGR5QWZz09xsfj3Ew/eDm8SqgXN9EIK6MDZc6P1yVCy
         vK6lPSYSObe78kStyHg41b6kMFCsrxSEQWBKnvKQOOhRkRI2+eZsHYDdk8q2P8rc5zZr
         p3KwFnrue6WKnmWhWkYY5X6ZCFxXdrjtW9bbBHTkYauzlRV4pFCfyXgyZUIR/gKZGU10
         guQ+5q02MxnzG2aG3vwjLW9QdUEv8RuX8VsDfp5pqVcXfZfHt8ANOi7AizYJQNLGf4rA
         lVwR0W9ifAe4iaAZuj6E4t9kGIONHp6dyj0vzSxyEjjS9YdOOkZC6moRVNYyhKBfN890
         HqwA==
X-Gm-Message-State: ACrzQf0zZTJReFEF2qrPA4dhvHWKiL+UmTg3p6lWsCDeNW9rkEfzPqmU
        Zteoe3yy56nRfEPihNiZpKI=
X-Google-Smtp-Source: AMsMyM5kFZ4on3QRjlJplp9bbKeUhYaGZutChF6WsY5pymjipxC4sWmAFBEEC550035JmkUJz8FXGg==
X-Received: by 2002:a17:902:c702:b0:186:e151:6b27 with SMTP id p2-20020a170902c70200b00186e1516b27mr808331plp.69.1666989346752;
        Fri, 28 Oct 2022 13:35:46 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2acc:9d2e:bff9:e77])
        by smtp.gmail.com with ESMTPSA id c77-20020a624e50000000b00561b455267fsm3200152pfb.27.2022.10.28.13.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 13:35:46 -0700 (PDT)
Date:   Fri, 28 Oct 2022 13:35:42 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chris Morgan <macroalpha82@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        rydberg@bitmath.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, mkorpershoek@baylibre.com,
        Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V4 3/3] input/touchscreen: Add Hynitron cstxxx touchscreen
Message-ID: <Y1w9HkpkjrUOffE2@google.com>
References: <20221028202636.14341-1-macroalpha82@gmail.com>
 <20221028202636.14341-4-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028202636.14341-4-macroalpha82@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Chris,

On Fri, Oct 28, 2022 at 03:26:36PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Hynitron cst3xx controller found on devices such
> as the Anbernic RG353P and RG353V (the Hynitron CST340). This driver
> was built from sources provided by Hynitron to Anbernic (possibly
> via Rockchip as an intermediary) and marked as GPLv2 in the code.
> This driver was written strictly for the cst3xx series, but in
> most places was left somewhat generic so support could be easily
> added to other devices in the future.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/input/touchscreen/Kconfig           |  12 +
>  drivers/input/touchscreen/Makefile          |   1 +
>  drivers/input/touchscreen/hynitron_cstxxx.c | 505 ++++++++++++++++++++
>  3 files changed, 518 insertions(+)
>  create mode 100644 drivers/input/touchscreen/hynitron_cstxxx.c
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index dc90a3ea51ee..46b158c04c7b 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -422,6 +422,18 @@ config TOUCHSCREEN_HYCON_HY46XX
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called hycon-hy46xx.
>  
> +config TOUCHSCREEN_HYNITRON_CSTXXX
> +	tristate "Hynitron touchscreen support"
> +	depends on I2C
> +	help
> +	  Say Y here if you have a touchscreen using a Hynitron
> +	  touchscreen controller.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called hynitron-cstxxx.
> +
>  config TOUCHSCREEN_ILI210X
>  	tristate "Ilitek ILI210X based touchscreen"
>  	depends on I2C
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index 557f84fd2075..43860ca19b98 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -47,6 +47,7 @@ obj-$(CONFIG_TOUCHSCREEN_EXC3000)	+= exc3000.o
>  obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
>  obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
>  obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
> +obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
>  obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
>  obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
>  obj-$(CONFIG_TOUCHSCREEN_IMAGIS)	+= imagis.o
> diff --git a/drivers/input/touchscreen/hynitron_cstxxx.c b/drivers/input/touchscreen/hynitron_cstxxx.c
> new file mode 100644
> index 000000000000..ca39e8a775b7
> --- /dev/null
> +++ b/drivers/input/touchscreen/hynitron_cstxxx.c
> @@ -0,0 +1,505 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *  Driver for Hynitron cstxxx Touchscreen
> + *
> + *  Copyright (c) 2022 Chris Morgan <macromorgan@hotmail.com>
> + *
> + *  This code is based on hynitron_core.c authored by Hynitron.
> + *  Note that no datasheet was available, so much of these registers
> + *  are undocumented. This is essentially a cleaned-up version of the
> + *  vendor driver with support removed for hardware I cannot test and
> + *  device-specific functions replated with generic functions wherever
> + *  possible.
> + */
> +
> +#include <asm/unaligned.h>

For the future: "asm" goes after "linux".

> +#include <linux/delay.h>
> +#include <linux/gpio.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/module.h>
> +
> +/* Per chip data */
> +struct hynitron_ts_chip_data {
> +	unsigned int max_touch_num;
> +	u32 ic_chkcode;
> +	int (*firmware_info)(struct i2c_client *client);
> +	int (*bootloader_enter)(struct i2c_client *client);
> +	int (*init_input)(struct i2c_client *client);
> +	void (*report_touch)(struct i2c_client *client);
> +};
> +
> +/* Data generic to all (supported and non-supported) controllers. */
> +struct hynitron_ts_data {
> +	const struct hynitron_ts_chip_data *pdata;
> +	struct i2c_client *client;
> +	struct input_dev *input_dev;
> +	struct touchscreen_properties prop;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *irq_gpio;

I do not believe irq_gpio is used so I'll drop it.

> +};
> +
> +/*
> + * Since I have no datasheet, these values are guessed and/or assumed
> + * based on observation and testing.
> + */
> +#define CST3XX_FIRMWARE_INFO_START_CMD		0x01d1
> +#define CST3XX_FIRMWARE_INFO_END_CMD		0x09d1
> +#define CST3XX_FIRMWARE_CHK_CODE_REG		0xfcd1
> +#define CST3XX_FIRMWARE_VERSION_REG		0x08d2
> +#define CST3XX_FIRMWARE_VER_INVALID_VAL		0xa5a5a5a5
> +
> +#define CST3XX_BOOTLDR_PROG_CMD			0xaa01a0
> +#define CST3XX_BOOTLDR_PROG_CHK_REG		0x02a0
> +#define CST3XX_BOOTLDR_CHK_VAL			0xac
> +
> +#define CST3XX_TOUCH_DATA_PART_REG		0x00d0
> +#define CST3XX_TOUCH_DATA_FULL_REG		0x07d0
> +#define CST3XX_TOUCH_DATA_CHK_VAL		0xab
> +#define CST3XX_TOUCH_DATA_TOUCH_VAL		0x03
> +#define CST3XX_TOUCH_DATA_STOP_CMD		0xab00d0
> +#define CST3XX_TOUCH_COUNT_MASK			GENMASK(6, 0)
> +
> +
> +/*
> + * Hard coded reset delay value of 20ms not IC dependent in
> + * vendor driver.
> + */
> +static void hyn_reset_proc(struct i2c_client *client, int delay)
> +{
> +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> +
> +	gpiod_set_value_cansleep(ts_data->reset_gpio, 1);
> +	mdelay(20);
> +	gpiod_set_value_cansleep(ts_data->reset_gpio, 0);
> +	if (delay)
> +		mdelay(delay);
> +}
> +
> +static irqreturn_t hyn_interrupt_handler(int irq, void *dev_id)
> +{
> +	struct i2c_client *client = dev_id;
> +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> +
> +	ts_data->pdata->report_touch(client);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * The vendor driver would retry twice before failing to read or write
> + * to the i2c device.
> + */
> +
> +static int cst3xx_i2c_write(struct i2c_client *client,
> +			    unsigned char *buf, int len)
> +{
> +	int ret;
> +	int retries = 0;
> +
> +	while (retries < 2) {
> +		ret = i2c_master_send(client, buf, len);
> +		if (ret == len)
> +			return 0;
> +		if (ret <= 0)
> +			retries++;
> +		else
> +			break;
> +	}
> +
> +	return ret < 0 ? ret : -EIO;
> +}
> +
> +static int cst3xx_i2c_read_register(struct i2c_client *client, u16 reg,
> +				    u8 *val, u16 len)
> +{
> +	__le16 buf = cpu_to_le16(reg);
> +	struct i2c_msg msgs[] = {
> +		{
> +			.addr = client->addr,
> +			.flags = 0,
> +			.len = 2,
> +			.buf = (u8 *)&buf,
> +		},
> +		{
> +			.addr = client->addr,
> +			.flags = I2C_M_RD,
> +			.len = len,
> +			.buf = val,
> +		}
> +	};
> +	int ret;
> +
> +	ret = i2c_transfer(client->adapter, msgs, 2);

ARRAY_SIZE() instead of 2 is better here.

> +	if (ret >= 0)
> +		ret = (ret == ARRAY_SIZE(msgs) ? 0 : -EIO);
> +
> +	if (ret)
> +		dev_err(&client->dev,
> +			"Error reading %d bytes from 0x%04x: %d\n",
> +			len, reg, ret);
> +
> +	return ret;
> +}
> +
> +static int cst3xx_firmware_info(struct i2c_client *client)
> +{
> +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> +	int ret;
> +	u32 tmp;
> +	unsigned char buf[4];
> +
> +	/*
> +	 * Tests suggest this command needed to read firmware regs.
> +	 */
> +	put_unaligned_le16(CST3XX_FIRMWARE_INFO_START_CMD, buf);
> +	ret = cst3xx_i2c_write(client, buf, 2);
> +	if (ret < 0)
> +		return -EIO;

I do not think we should be overriding errors returned by
cst3xx_i2c_write() and friends.

I'll update on my end, no need to resubmit.

Thanks.

-- 
Dmitry
