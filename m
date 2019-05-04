Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7D713B45
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2019 18:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbfEDQ7D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 May 2019 12:59:03 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43763 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbfEDQ7C (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 May 2019 12:59:02 -0400
Received: by mail-pl1-f195.google.com with SMTP id n8so4226825plp.10;
        Sat, 04 May 2019 09:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1NhcTlVjTTQXDVZFyUgbPWuB/sClYgEJhPfJNp6boxY=;
        b=rk1sR5WrGDwROvebUX7SPQ2m9lPJTl+GEkaOYr6O/pIUrMNnddnvpYulI+a0ZKfHBv
         IMB+SP4wE/+B+1iYsZ/tdSq9EIZaWTlQfF0G3VJDshqxzA9dUDoX1B9KSPOdzPAy8myt
         StcCxjAosBfDnOoHzZ8pDklYxC/ZX4wYLxu87EUPr8ZMKs7RySxxQYgtjPe2SssLlsYi
         U7DeBSL3V4UUfVxgj8a8Aj9QUWo2peWRcN6HHgLr2ONGLDbxMWxIKJ7+tSJ98l1T4mQ3
         lJjKt+UKRwJqGuo3JGYaXaPHOpOKCDlhLFZoGcfzU+Fi8BJmPBQbMqLs0GMNjdQu3AtU
         CuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1NhcTlVjTTQXDVZFyUgbPWuB/sClYgEJhPfJNp6boxY=;
        b=g59DqpRWmVtXwksaZ2QVfsxBNv6PvU7Ug41f06xwAYiIraJs/eS6Gde3C5kRzE7zv9
         l0DEjG0edi5kphy8Fqscgknzi6ARjEwYj53joy4d1Xh/2ed2Tt8QZpNGgqcgYER+s++f
         awpK/IQFbBLS3VGjVMXFEXPbH1idaB73nTL5u6hvbCddOw7Jn2CgBoR9LjNdWjqcaucd
         5seSZvNntY2OoFl1gu2yd9c8ynC2OrtShmF6E/Yy0mTPzNFPK4INEFSe+2cvdchAdWpK
         K/gxNwO5n7sBYe2Yy2pvmc0r6Y+cAe8A6y6RsIgJeKWk4d3ED0LtcgFzRUm++Rqzvzh0
         u3UQ==
X-Gm-Message-State: APjAAAVwfxXJUsiJ6F6Y+l4tHWMev63BK+lao8PQqVy3/YE7Gafenhyg
        MHViR3dQDRYagExFaeJayO0=
X-Google-Smtp-Source: APXvYqx8ZSfruJM/arzLCdHwo4gdKuJdIwA2zjMfl6iglDg6PXVA1ObmroY3oWpNnSrIkrULi3xcYA==
X-Received: by 2002:a17:902:8f82:: with SMTP id z2mr20425579plo.51.1556989140926;
        Sat, 04 May 2019 09:59:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j20sm8818325pfn.84.2019.05.04.09.58.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 May 2019 09:58:59 -0700 (PDT)
Date:   Sat, 4 May 2019 09:58:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, raphaelpereira@gmail.com,
        voice.shen@atmel.com, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v3 2/2] Input: qt1050 - add Microchip AT42QT1050 support
Message-ID: <20190504165857.GA108094@dtor-ws>
References: <20190415165655.13016-1-m.felsch@pengutronix.de>
 <20190415165655.13016-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190415165655.13016-3-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 15, 2019 at 06:56:55PM +0200, Marco Felsch wrote:
> Add initial support for the AT42QT1050 (QT1050) device. The device
> supports up to five input keys, dependent on the mode. Since it adds only
> the initial support the "1 to 4 keys plus Guard Channel" mode isn't
> support.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Applied, thank you.

> ---
> Changes:
> 
> v3
> - switch to new i2c probe_new function and drop id_table
> - seperate devm_kzalloc() error checks
> - don't set IRQF_TRIGGER_NONE
> - drop enable/disable_irq_wake() since it is done by the i2c-core
> - fix pm_suspend: disable the chip only if it isn't a wakeup-source
>   else we can't receive a wakeup.
> - fix MODULE_LICENSE to point to correct 'GPL v2' version
> - fix copyright info
> - use __maybe_unused to drop CONFIG_OF ifdef
> - switch to static key allocation to avoid double looping during irq
>   and simplfy the code a bit
> - make use of QT1050_MAX_KEYS macro
> - unifrom comments (always start with capital letter)
> - fix error handling during device_for_each_child_node()
> 
> v2
> - drop static key array allocation
> - drop OF dependencies
> - change fw-layout, so each key is represented by a fw-subnode
> - use qt1050_key_regs_data array to specify button <-> register pairs
> 
>  drivers/input/keyboard/Kconfig  |  11 +
>  drivers/input/keyboard/Makefile |   1 +
>  drivers/input/keyboard/qt1050.c | 597 ++++++++++++++++++++++++++++++++
>  3 files changed, 609 insertions(+)
>  create mode 100644 drivers/input/keyboard/qt1050.c
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index a878351f1643..377c0161918b 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -137,6 +137,17 @@ config KEYBOARD_ATKBD_RDI_KEYCODES
>  	  right-hand column will be interpreted as the key shown in the
>  	  left-hand column.
>  
> +config KEYBOARD_QT1050
> +	tristate "Microchip AT42QT1050 Touch Sensor Chip"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  Say Y here if you want to use Microchip AT42QT1050 QTouch
> +	  Sensor chip as input device.
> +
> +	  To compile this driver as a module, choose M here:
> +	  the module will be called qt1050
> +
>  config KEYBOARD_QT1070
>         tristate "Atmel AT42QT1070 Touch Sensor Chip"
>         depends on I2C
> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
> index 182e92985dbf..f0291ca39f62 100644
> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -50,6 +50,7 @@ obj-$(CONFIG_KEYBOARD_OPENCORES)	+= opencores-kbd.o
>  obj-$(CONFIG_KEYBOARD_PMIC8XXX)		+= pmic8xxx-keypad.o
>  obj-$(CONFIG_KEYBOARD_PXA27x)		+= pxa27x_keypad.o
>  obj-$(CONFIG_KEYBOARD_PXA930_ROTARY)	+= pxa930_rotary.o
> +obj-$(CONFIG_KEYBOARD_QT1050)           += qt1050.o
>  obj-$(CONFIG_KEYBOARD_QT1070)           += qt1070.o
>  obj-$(CONFIG_KEYBOARD_QT2160)		+= qt2160.o
>  obj-$(CONFIG_KEYBOARD_SAMSUNG)		+= samsung-keypad.o
> diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
> new file mode 100644
> index 000000000000..2a816efdedbc
> --- /dev/null
> +++ b/drivers/input/keyboard/qt1050.c
> @@ -0,0 +1,597 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Microchip AT42QT1050 QTouch Sensor Controller
> + *
> + *  Copyright (C) 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> + *
> + *  Base on AT42QT1070 driver by:
> + *  Bo Shen <voice.shen@atmel.com>
> + *  Copyright (C) 2011 Atmel
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/log2.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +/* Chip ID */
> +#define QT1050_CHIP_ID		0x00
> +#define QT1050_CHIP_ID_VER	0x46
> +
> +/* Firmware version */
> +#define QT1050_FW_VERSION	0x01
> +
> +/* Detection status */
> +#define QT1050_DET_STATUS	0x02
> +
> +/* Key status */
> +#define QT1050_KEY_STATUS	0x03
> +
> +/* Key Signals */
> +#define QT1050_KEY_SIGNAL_0_MSB	0x06
> +#define QT1050_KEY_SIGNAL_0_LSB	0x07
> +#define QT1050_KEY_SIGNAL_1_MSB	0x08
> +#define QT1050_KEY_SIGNAL_1_LSB	0x09
> +#define QT1050_KEY_SIGNAL_2_MSB	0x0c
> +#define QT1050_KEY_SIGNAL_2_LSB	0x0d
> +#define QT1050_KEY_SIGNAL_3_MSB	0x0e
> +#define QT1050_KEY_SIGNAL_3_LSB	0x0f
> +#define QT1050_KEY_SIGNAL_4_MSB	0x10
> +#define QT1050_KEY_SIGNAL_4_LSB	0x11
> +
> +/* Reference data */
> +#define QT1050_REF_DATA_0_MSB	0x14
> +#define QT1050_REF_DATA_0_LSB	0x15
> +#define QT1050_REF_DATA_1_MSB	0x16
> +#define QT1050_REF_DATA_1_LSB	0x17
> +#define QT1050_REF_DATA_2_MSB	0x1a
> +#define QT1050_REF_DATA_2_LSB	0x1b
> +#define QT1050_REF_DATA_3_MSB	0x1c
> +#define QT1050_REF_DATA_3_LSB	0x1d
> +#define QT1050_REF_DATA_4_MSB	0x1e
> +#define QT1050_REF_DATA_4_LSB	0x1f
> +
> +/* Negative threshold level */
> +#define QT1050_NTHR_0		0x21
> +#define QT1050_NTHR_1		0x22
> +#define QT1050_NTHR_2		0x24
> +#define QT1050_NTHR_3		0x25
> +#define QT1050_NTHR_4		0x26
> +
> +/* Pulse / Scale  */
> +#define QT1050_PULSE_SCALE_0	0x28
> +#define QT1050_PULSE_SCALE_1	0x29
> +#define QT1050_PULSE_SCALE_2	0x2b
> +#define QT1050_PULSE_SCALE_3	0x2c
> +#define QT1050_PULSE_SCALE_4	0x2d
> +
> +/* Detection integrator counter / AKS */
> +#define QT1050_DI_AKS_0		0x2f
> +#define QT1050_DI_AKS_1		0x30
> +#define QT1050_DI_AKS_2		0x32
> +#define QT1050_DI_AKS_3		0x33
> +#define QT1050_DI_AKS_4		0x34
> +
> +/* Charge Share Delay */
> +#define QT1050_CSD_0		0x36
> +#define QT1050_CSD_1		0x37
> +#define QT1050_CSD_2		0x39
> +#define QT1050_CSD_3		0x3a
> +#define QT1050_CSD_4		0x3b
> +
> +/* Low Power Mode */
> +#define QT1050_LPMODE		0x3d
> +
> +/* Calibration and Reset */
> +#define QT1050_RES_CAL		0x3f
> +#define QT1050_RES_CAL_RESET		BIT(7)
> +#define QT1050_RES_CAL_CALIBRATE	BIT(1)
> +
> +#define QT1050_MAX_KEYS		5
> +#define QT1050_RESET_TIME	255
> +
> +struct qt1050_key_regs {
> +	unsigned int nthr;
> +	unsigned int pulse_scale;
> +	unsigned int di_aks;
> +	unsigned int csd;
> +};
> +
> +struct qt1050_key {
> +	int num;
> +	u32 charge_delay;
> +	u32 thr_cnt;
> +	u32 samples;
> +	u32 scale;
> +	u32 keycode;
> +};
> +
> +struct qt1050_priv {
> +	struct i2c_client	*client;
> +	struct input_dev	*input;
> +	struct regmap		*regmap;
> +	struct qt1050_key	keys[QT1050_MAX_KEYS];
> +	unsigned short		keycodes[QT1050_MAX_KEYS];
> +	u8			reg_keys;
> +	u8			last_keys;
> +};
> +
> +static const struct qt1050_key_regs qt1050_key_regs_data[] = {
> +	{
> +		.nthr = QT1050_NTHR_0,
> +		.pulse_scale = QT1050_PULSE_SCALE_0,
> +		.di_aks = QT1050_DI_AKS_0,
> +		.csd = QT1050_CSD_0,
> +	}, {
> +		.nthr = QT1050_NTHR_1,
> +		.pulse_scale = QT1050_PULSE_SCALE_1,
> +		.di_aks = QT1050_DI_AKS_1,
> +		.csd = QT1050_CSD_1,
> +	}, {
> +		.nthr = QT1050_NTHR_2,
> +		.pulse_scale = QT1050_PULSE_SCALE_2,
> +		.di_aks = QT1050_DI_AKS_2,
> +		.csd = QT1050_CSD_2,
> +	}, {
> +		.nthr = QT1050_NTHR_3,
> +		.pulse_scale = QT1050_PULSE_SCALE_3,
> +		.di_aks = QT1050_DI_AKS_3,
> +		.csd = QT1050_CSD_3,
> +	}, {
> +		.nthr = QT1050_NTHR_4,
> +		.pulse_scale = QT1050_PULSE_SCALE_4,
> +		.di_aks = QT1050_DI_AKS_4,
> +		.csd = QT1050_CSD_4,
> +	}
> +};
> +
> +static bool qt1050_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case QT1050_DET_STATUS:
> +	case QT1050_KEY_STATUS:
> +	case QT1050_KEY_SIGNAL_0_MSB:
> +	case QT1050_KEY_SIGNAL_0_LSB:
> +	case QT1050_KEY_SIGNAL_1_MSB:
> +	case QT1050_KEY_SIGNAL_1_LSB:
> +	case QT1050_KEY_SIGNAL_2_MSB:
> +	case QT1050_KEY_SIGNAL_2_LSB:
> +	case QT1050_KEY_SIGNAL_3_MSB:
> +	case QT1050_KEY_SIGNAL_3_LSB:
> +	case QT1050_KEY_SIGNAL_4_MSB:
> +	case QT1050_KEY_SIGNAL_4_LSB:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_range qt1050_readable_ranges[] = {
> +	regmap_reg_range(QT1050_CHIP_ID, QT1050_KEY_STATUS),
> +	regmap_reg_range(QT1050_KEY_SIGNAL_0_MSB, QT1050_KEY_SIGNAL_1_LSB),
> +	regmap_reg_range(QT1050_KEY_SIGNAL_2_MSB, QT1050_KEY_SIGNAL_4_LSB),
> +	regmap_reg_range(QT1050_REF_DATA_0_MSB, QT1050_REF_DATA_1_LSB),
> +	regmap_reg_range(QT1050_REF_DATA_2_MSB, QT1050_REF_DATA_4_LSB),
> +	regmap_reg_range(QT1050_NTHR_0, QT1050_NTHR_1),
> +	regmap_reg_range(QT1050_NTHR_2, QT1050_NTHR_4),
> +	regmap_reg_range(QT1050_PULSE_SCALE_0, QT1050_PULSE_SCALE_1),
> +	regmap_reg_range(QT1050_PULSE_SCALE_2, QT1050_PULSE_SCALE_4),
> +	regmap_reg_range(QT1050_DI_AKS_0, QT1050_DI_AKS_1),
> +	regmap_reg_range(QT1050_DI_AKS_2, QT1050_DI_AKS_4),
> +	regmap_reg_range(QT1050_CSD_0, QT1050_CSD_1),
> +	regmap_reg_range(QT1050_CSD_2, QT1050_RES_CAL),
> +};
> +
> +static const struct regmap_access_table qt1050_readable_table = {
> +	.yes_ranges = qt1050_readable_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(qt1050_readable_ranges),
> +};
> +
> +static const struct regmap_range qt1050_writeable_ranges[] = {
> +	regmap_reg_range(QT1050_NTHR_0, QT1050_NTHR_1),
> +	regmap_reg_range(QT1050_NTHR_2, QT1050_NTHR_4),
> +	regmap_reg_range(QT1050_PULSE_SCALE_0, QT1050_PULSE_SCALE_1),
> +	regmap_reg_range(QT1050_PULSE_SCALE_2, QT1050_PULSE_SCALE_4),
> +	regmap_reg_range(QT1050_DI_AKS_0, QT1050_DI_AKS_1),
> +	regmap_reg_range(QT1050_DI_AKS_2, QT1050_DI_AKS_4),
> +	regmap_reg_range(QT1050_CSD_0, QT1050_CSD_1),
> +	regmap_reg_range(QT1050_CSD_2, QT1050_RES_CAL),
> +};
> +
> +static const struct regmap_access_table qt1050_writeable_table = {
> +	.yes_ranges = qt1050_writeable_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(qt1050_writeable_ranges),
> +};
> +
> +static struct regmap_config qt1050_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = QT1050_RES_CAL,
> +
> +	.cache_type = REGCACHE_RBTREE,
> +
> +	.wr_table = &qt1050_writeable_table,
> +	.rd_table = &qt1050_readable_table,
> +	.volatile_reg = qt1050_volatile_reg,
> +};
> +
> +static bool qt1050_identify(struct qt1050_priv *ts)
> +{
> +	unsigned int val;
> +
> +	/* Read Chip ID */
> +	regmap_read(ts->regmap, QT1050_CHIP_ID, &val);
> +	if (val != QT1050_CHIP_ID_VER) {
> +		dev_err(&ts->client->dev, "ID %d not supported\n", val);
> +		return false;
> +	}
> +
> +	/* Read firmware version */
> +	regmap_read(ts->regmap, QT1050_FW_VERSION, &val);
> +	if (val < 0) {
> +		dev_err(&ts->client->dev, "could not read the firmware version\n");
> +		return false;
> +	}
> +
> +	dev_info(&ts->client->dev, "AT42QT1050 firmware version %1d.%1d\n",
> +		 val >> 4, val & 0xf);
> +
> +	return true;
> +}
> +
> +static irqreturn_t qt1050_irq_threaded(int irq, void *dev_id)
> +{
> +	struct qt1050_priv *ts = dev_id;
> +	struct input_dev *input = ts->input;
> +	unsigned long new_keys, changed;
> +	unsigned int val;
> +	int i, err;
> +
> +	/* Read the detected status register, thus clearing interrupt */
> +	err = regmap_read(ts->regmap, QT1050_DET_STATUS, &val);
> +	if (err) {
> +		dev_err(&ts->client->dev, "Fail to read detection status: %d\n",
> +			err);
> +		return IRQ_NONE;
> +	}
> +
> +	/* Read which key changed, keys are not continuous */
> +	err = regmap_read(ts->regmap, QT1050_KEY_STATUS, &val);
> +	if (err) {
> +		dev_err(&ts->client->dev,
> +			"Fail to determine the key status: %d\n", err);
> +		return IRQ_NONE;
> +	}
> +	new_keys = (val & 0x70) >> 2 | (val & 0x6) >> 1;
> +	changed = ts->last_keys ^ new_keys;
> +	/* Report registered keys only */
> +	changed &= ts->reg_keys;
> +
> +	for_each_set_bit(i, &changed, QT1050_MAX_KEYS)
> +		input_report_key(input, ts->keys[i].keycode,
> +				 test_bit(i, &new_keys));
> +
> +	ts->last_keys = new_keys;
> +	input_sync(input);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct qt1050_key_regs *qt1050_get_key_regs(int key_num)
> +{
> +	return &qt1050_key_regs_data[key_num];
> +}
> +
> +static int qt1050_set_key(struct regmap *map, int number, int on)
> +{
> +	const struct qt1050_key_regs *key_regs;
> +
> +	key_regs = qt1050_get_key_regs(number);
> +
> +	return regmap_update_bits(map, key_regs->di_aks, 0xfc,
> +				  on ? BIT(4) : 0x00);
> +}
> +
> +static int qt1050_apply_fw_data(struct qt1050_priv *ts)
> +{
> +	struct regmap *map = ts->regmap;
> +	struct qt1050_key *button = &ts->keys[0];
> +	const struct qt1050_key_regs *key_regs;
> +	int i, err;
> +
> +	/* Disable all keys and enable only the specified ones */
> +	for (i = 0; i < QT1050_MAX_KEYS; i++) {
> +		err = qt1050_set_key(map, i, 0);
> +		if (err)
> +			return err;
> +	}
> +
> +	for (i = 0; i < QT1050_MAX_KEYS; i++, button++) {
> +		/* Keep KEY_RESERVED keys off */
> +		if (button->keycode == KEY_RESERVED)
> +			continue;
> +
> +		err = qt1050_set_key(map, button->num, 1);
> +		if (err)
> +			return err;
> +
> +		key_regs = qt1050_get_key_regs(button->num);
> +
> +		err = regmap_write(map, key_regs->pulse_scale,
> +				   (button->samples << 4) | (button->scale));
> +		if (err)
> +			return err;
> +		err = regmap_write(map, key_regs->csd, button->charge_delay);
> +		if (err)
> +			return err;
> +		err = regmap_write(map, key_regs->nthr, button->thr_cnt);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qt1050_parse_fw(struct qt1050_priv *ts)
> +{
> +	struct device *dev = &ts->client->dev;
> +	struct fwnode_handle *child;
> +	int nbuttons;
> +
> +	nbuttons = device_get_child_node_count(dev);
> +	if (nbuttons == 0 || nbuttons > QT1050_MAX_KEYS)
> +		return -ENODEV;
> +
> +	device_for_each_child_node(dev, child) {
> +		struct qt1050_key button;
> +
> +		/* Required properties */
> +		if (fwnode_property_read_u32(child, "linux,code",
> +					     &button.keycode)) {
> +			dev_err(dev, "Button without keycode\n");
> +			goto err;
> +		}
> +		if (button.keycode >= KEY_MAX) {
> +			dev_err(dev, "Invalid keycode 0x%x\n",
> +				button.keycode);
> +			goto err;
> +		}
> +
> +		if (fwnode_property_read_u32(child, "reg",
> +					     &button.num)) {
> +			dev_err(dev, "Button without pad number\n");
> +			goto err;
> +		}
> +		if (button.num < 0 || button.num > QT1050_MAX_KEYS - 1)
> +			goto err;
> +
> +		ts->reg_keys |= BIT(button.num);
> +
> +		/* Optional properties */
> +		if (fwnode_property_read_u32(child,
> +					     "microchip,pre-charge-time-ns",
> +					     &button.charge_delay)) {
> +			button.charge_delay = 0;
> +		} else {
> +			if (button.charge_delay % 2500 == 0)
> +				button.charge_delay =
> +					button.charge_delay / 2500;
> +			else
> +				button.charge_delay = 0;
> +		}
> +
> +		if (fwnode_property_read_u32(child, "microchip,average-samples",
> +					 &button.samples)) {
> +			button.samples = 0;
> +		} else {
> +			if (is_power_of_2(button.samples))
> +				button.samples = ilog2(button.samples);
> +			else
> +				button.samples = 0;
> +		}
> +
> +		if (fwnode_property_read_u32(child, "microchip,average-scaling",
> +					     &button.scale)) {
> +			button.scale = 0;
> +		} else {
> +			if (is_power_of_2(button.scale))
> +				button.scale = ilog2(button.scale);
> +			else
> +				button.scale = 0;
> +
> +		}
> +
> +		if (fwnode_property_read_u32(child, "microchip,threshold",
> +					 &button.thr_cnt)) {
> +			button.thr_cnt = 20;
> +		} else {
> +			if (button.thr_cnt > 255)
> +				button.thr_cnt = 20;
> +		}
> +
> +		ts->keys[button.num] = button;
> +	}
> +
> +	return 0;
> +
> +err:
> +	fwnode_handle_put(child);
> +	return -EINVAL;
> +}
> +
> +static int qt1050_probe(struct i2c_client *client)
> +{
> +	struct qt1050_priv *ts;
> +	struct input_dev *input;
> +	struct device *dev = &client->dev;
> +	struct regmap *map;
> +	unsigned int status, i;
> +	int err;
> +
> +	/* Check basic functionality */
> +	err = i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE);
> +	if (!err) {
> +		dev_err(&client->dev, "%s adapter not supported\n",
> +			dev_driver_string(&client->adapter->dev));
> +		return -ENODEV;
> +	}
> +
> +	if (!client->irq) {
> +		dev_err(dev, "assign a irq line to this device\n");
> +		return -EINVAL;
> +	}
> +
> +	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
> +	if (!ts)
> +		return -ENOMEM;
> +
> +	input = devm_input_allocate_device(dev);
> +	if (!input)
> +		return -ENOMEM;
> +
> +	map = devm_regmap_init_i2c(client, &qt1050_regmap_config);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	ts->client = client;
> +	ts->input = input;
> +	ts->regmap = map;
> +
> +	i2c_set_clientdata(client, ts);
> +
> +	/* Identify the qt1050 chip */
> +	if (!qt1050_identify(ts))
> +		return -ENODEV;
> +
> +	/* Get pdata */
> +	err = qt1050_parse_fw(ts);
> +	if (err) {
> +		dev_err(dev, "Failed to parse firmware: %d\n", err);
> +		return err;
> +	}
> +
> +	input->name = "AT42QT1050 QTouch Sensor";
> +	input->dev.parent = &client->dev;
> +	input->id.bustype = BUS_I2C;
> +
> +	/* Add the keycode */
> +	input->keycode = ts->keycodes;
> +	input->keycodesize = sizeof(ts->keycodes[0]);
> +	input->keycodemax = QT1050_MAX_KEYS;
> +
> +	__set_bit(EV_KEY, input->evbit);
> +	for (i = 0; i < QT1050_MAX_KEYS; i++) {
> +		ts->keycodes[i] = ts->keys[i].keycode;
> +		__set_bit(ts->keycodes[i], input->keybit);
> +	}
> +
> +	/* Trigger re-calibration */
> +	err = regmap_update_bits(ts->regmap, QT1050_RES_CAL, 0x7f,
> +				 QT1050_RES_CAL_CALIBRATE);
> +	if (err) {
> +		dev_err(dev, "Trigger calibration failed: %d\n", err);
> +		return err;
> +	}
> +	err = regmap_read_poll_timeout(ts->regmap, QT1050_DET_STATUS, status,
> +				 status >> 7 == 1, 10000, 200000);
> +	if (err) {
> +		dev_err(dev, "Calibration failed: %d\n", err);
> +		return err;
> +	}
> +
> +	/* Soft reset to set defaults */
> +	err = regmap_update_bits(ts->regmap, QT1050_RES_CAL,
> +				 QT1050_RES_CAL_RESET, QT1050_RES_CAL_RESET);
> +	if (err) {
> +		dev_err(dev, "Trigger soft reset failed: %d\n", err);
> +		return err;
> +	}
> +	msleep(QT1050_RESET_TIME);
> +
> +	/* Set pdata */
> +	err = qt1050_apply_fw_data(ts);
> +	if (err) {
> +		dev_err(dev, "Failed to set firmware data: %d\n", err);
> +		return err;
> +	}
> +
> +	err = devm_request_threaded_irq(dev, client->irq, NULL,
> +					qt1050_irq_threaded, IRQF_ONESHOT,
> +					"qt1050", ts);
> +	if (err) {
> +		dev_err(&client->dev, "Failed to request irq: %d\n", err);
> +		return err;
> +	}
> +
> +	/* Clear #CHANGE line */
> +	err = regmap_read(ts->regmap, QT1050_DET_STATUS, &status);
> +	if (err) {
> +		dev_err(dev, "Failed to clear #CHANGE line level: %d\n", err);
> +		return err;
> +	}
> +
> +	/* Register the input device */
> +	err = input_register_device(ts->input);
> +	if (err) {
> +		dev_err(&client->dev, "Failed to register input device: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused qt1050_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct qt1050_priv *ts = i2c_get_clientdata(client);
> +
> +	disable_irq(client->irq);
> +
> +	/*
> +	 * Set measurement interval to 1s (125 x 8ms) if wakeup is allowed
> +	 * else turn off. The 1s interval seems to be a good compromise between
> +	 * low power and response time.
> +	 */
> +	return regmap_write(ts->regmap, QT1050_LPMODE,
> +			    device_may_wakeup(dev) ? 125 : 0);
> +}
> +
> +static int __maybe_unused qt1050_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct qt1050_priv *ts = i2c_get_clientdata(client);
> +
> +	enable_irq(client->irq);
> +
> +	/* Set measurement interval back to 16ms (2 x 8ms) */
> +	return regmap_write(ts->regmap, QT1050_LPMODE, 2);
> +}
> +
> +static SIMPLE_DEV_PM_OPS(qt1050_pm_ops, qt1050_suspend, qt1050_resume);
> +
> +static const struct of_device_id __maybe_unused qt1050_of_match[] = {
> +	{ .compatible = "microchip,qt1050", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, qt1050_of_match);
> +
> +static struct i2c_driver qt1050_driver = {
> +	.driver	= {
> +		.name = "qt1050",
> +		.of_match_table = of_match_ptr(qt1050_of_match),
> +		.pm = &qt1050_pm_ops,
> +	},
> +	.probe_new = qt1050_probe,
> +};
> +
> +module_i2c_driver(qt1050_driver);
> +
> +MODULE_AUTHOR("Marco Felsch <kernel@pengutronix.de");
> +MODULE_DESCRIPTION("Driver for AT42QT1050 QTouch sensor");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.20.1
> 

-- 
Dmitry
