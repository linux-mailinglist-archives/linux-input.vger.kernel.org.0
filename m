Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79C74720DB
	for <lists+linux-input@lfdr.de>; Mon, 13 Dec 2021 06:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhLMF6P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Dec 2021 00:58:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhLMF6O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Dec 2021 00:58:14 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F7EC06173F;
        Sun, 12 Dec 2021 21:58:14 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso12436141pjb.2;
        Sun, 12 Dec 2021 21:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LXooKokoFdfMfusIuJlucPIuSwt1na2aWIfLy8ZA/1c=;
        b=FY/VbnGtBsXpvo9FTcO4Y1/LUPzNqvAgvsLyY9i0AYhUI2hFyOjlfDLBp2mLMSLI/h
         nF/2JHwqplmap9RH5QokIhbv6A9KRxclUeGqMG5FEhR5dbeMgkvuLx+hCL0c6HisEQdg
         61mVJbHeatjE5b6n1ynvo0v8bjyfy2b4KVOrE9APABewRPnJOvr4yc//1G3wGiH5ziT1
         hdN6SeWNwFQmlth4MSWWBt4ZfG2W82gmBD1Qb+fRh8N/Wpht28bhwZ2O4KW11eYXik79
         rfck0rjddaXx127RlU++EM2ENq98q8hFQEcPpgvRwASEquabETu32/iarnSW8AF/ITWb
         YXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LXooKokoFdfMfusIuJlucPIuSwt1na2aWIfLy8ZA/1c=;
        b=kasFPgCYfG1IIAilTdJMjV9lODxbK/JMp13WVI7bc5WDB3cieOz1Go0OnXuJdcKA3u
         m27F+D5e+6Av8MXT5UcVkTM8XFfdnvFEoZrPToiMUBEUi5wQxXgloLbZrEjgIp4xJNfg
         Sb/54eqzaJ5pYpwQAXle9w++/+sUBkwmSW0UQzGXJkK8dDBBD7wTOO6LsdRQjqHufjaP
         nw8NvLEjLywPsRMhh/8KFJgOMKb8CyuSqgzKGVh/aquRV0p19HYAh4UY894uvrTog5jY
         0dqN8nHG/NMBbWU/PUYygKJwQ/sKQ97kho9UjEjOV8DtQUr4UvVnGhuRJxQyBB92aJx+
         N2Sw==
X-Gm-Message-State: AOAM533V4MBZXg8ZyY/5rgByiH5t3qaAhzL0kf1SpyczFDw4BBGRMyVP
        n5968CMCVmwqb5cGV/3Sa1Q=
X-Google-Smtp-Source: ABdhPJzrHFta/jjR+6qYIhO8OVdVQ/sZEfZjXUQSV9x5A1o/2RdpjLxP+EsYVANUoxNeO/sfBgtzZA==
X-Received: by 2002:a17:902:7007:b0:143:c6e8:4117 with SMTP id y7-20020a170902700700b00143c6e84117mr94828660plk.55.1639375093625;
        Sun, 12 Dec 2021 21:58:13 -0800 (PST)
Received: from google.com ([2620:15c:202:201:e537:8856:7d40:7c6])
        by smtp.gmail.com with ESMTPSA id m13sm9024694pgt.22.2021.12.12.21.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 21:58:12 -0800 (PST)
Date:   Sun, 12 Dec 2021 21:58:09 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, andreas@kemnade.info, alistair23@gmail.com,
        linus.walleij@linaro.org, rydberg@bitmath.org,
        =?iso-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 1/4] Input: Add driver for Cypress Generation 5
 touchscreen
Message-ID: <Ybbg8bxJvlfc3ZPx@google.com>
References: <20211202122021.43124-1-alistair@alistair23.me>
 <20211202122021.43124-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211202122021.43124-2-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 02, 2021 at 10:20:18PM +1000, Alistair Francis wrote:
> From: Myl�ne Josserand <mylene.josserand@bootlin.com>
> 
> This is the basic driver for the Cypress TrueTouch Gen5 touchscreen
> controllers. This driver supports only the I2C bus but it uses regmap
> so SPI support could be added later.
> The touchscreen can retrieve some defined zone that are handled as
> buttons (according to the hardware). That is why it handles
> button and multitouch events.
> 
> Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>
> Signed-off-by: Myl�ne Josserand <mylene.josserand@bootlin.com>
> Message-Id: <20180703094309.18514-2-mylene.josserand@bootlin.com>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/input/touchscreen/Kconfig   |   14 +
>  drivers/input/touchscreen/Makefile  |    1 +
>  drivers/input/touchscreen/cyttsp5.c | 1002 +++++++++++++++++++++++++++
>  3 files changed, 1017 insertions(+)
>  create mode 100644 drivers/input/touchscreen/cyttsp5.c
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index 2f6adfb7b938..61f0452050f6 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -284,6 +284,20 @@ config TOUCHSCREEN_CYTTSP4_SPI
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called cyttsp4_spi.
>  
> +config TOUCHSCREEN_CYTTSP5
> +	tristate "Cypress TrueTouch Gen5 Touchscreen Driver"
> +	depends on OF && I2C
> +	select REGMAP_I2C
> +	select CRC_ITU_T
> +	help
> +	  Driver for Parade TrueTouch Standard Product
> +	  Generation 5 touchscreen controllers.
> +	  I2C bus interface support only.
> +	  Say Y here if you have a Cypress Gen5 touchscreen.
> +	  If unsure, say N.
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called cyttsp5.
> +
>  config TOUCHSCREEN_DA9034
>  	tristate "Touchscreen support for Dialog Semiconductor DA9034"
>  	depends on PMIC_DA903X
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index 39a8127cf6a5..0ea5c47f7fd9 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_TOUCHSCREEN_CYTTSP_SPI)	+= cyttsp_spi.o
>  obj-$(CONFIG_TOUCHSCREEN_CYTTSP4_CORE)	+= cyttsp4_core.o
>  obj-$(CONFIG_TOUCHSCREEN_CYTTSP4_I2C)	+= cyttsp4_i2c.o cyttsp_i2c_common.o
>  obj-$(CONFIG_TOUCHSCREEN_CYTTSP4_SPI)	+= cyttsp4_spi.o
> +obj-$(CONFIG_TOUCHSCREEN_CYTTSP5)	+= cyttsp5.o
>  obj-$(CONFIG_TOUCHSCREEN_DA9034)	+= da9034-ts.o
>  obj-$(CONFIG_TOUCHSCREEN_DA9052)	+= da9052_tsi.o
>  obj-$(CONFIG_TOUCHSCREEN_DYNAPRO)	+= dynapro.o
> diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> new file mode 100644
> index 000000000000..b5d96eb71e46
> --- /dev/null
> +++ b/drivers/input/touchscreen/cyttsp5.c
> @@ -0,0 +1,1002 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Parade TrueTouch(TM) Standard Product V5 Module.
> + *
> + * Copyright (C) 2015 Parade Technologies
> + * Copyright (C) 2012-2015 Cypress Semiconductor
> + * Copyright (C) 2018 Bootlin
> + *
> + * Authors: Myl�ne Josserand <mylene.josserand@bootlin.com>
> + *                Alistair Francis <alistair@alistair23.me>
> + *
> + */
> +
> +#include <asm/unaligned.h>
> +#include <linux/crc-itu-t.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/gpio.h>
> +#include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/interrupt.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +
> +#define CYTTSP5_NAME				"cyttsp5"
> +#define CY_I2C_DATA_SIZE			(2 * 256)
> +#define HID_VERSION				0x0100
> +#define CY_MAX_INPUT				512
> +#define CYTTSP5_PREALLOCATED_CMD_BUFFER	32
> +#define CY_BITS_PER_BTN			1
> +#define CY_NUM_BTN_EVENT_ID			((1 << CY_BITS_PER_BTN) - 1)
> +
> +#define MAX_AREA				255
> +#define HID_OUTPUT_BL_SOP			0x1
> +#define HID_OUTPUT_BL_EOP			0x17
> +#define HID_OUTPUT_BL_LAUNCH_APP		0x3B
> +#define HID_OUTPUT_BL_LAUNCH_APP_SIZE		11
> +#define HID_OUTPUT_GET_SYSINFO			0x2
> +#define HID_OUTPUT_GET_SYSINFO_SIZE		5
> +#define HID_OUTPUT_MAX_CMD_SIZE		12
> +
> +#define HID_DESC_REG				0x1
> +#define HID_INPUT_REG				0x3
> +#define HID_OUTPUT_REG				0x4
> +
> +#define REPORT_ID_TOUCH			0x1
> +#define REPORT_ID_BTN				0x3
> +#define REPORT_SIZE_5				5
> +#define REPORT_SIZE_8				8
> +#define REPORT_SIZE_16				16
> +
> +/* Touch reports offsets */
> +/* Header offsets */
> +#define TOUCH_REPORT_DESC_HDR_CONTACTCOUNT	16
> +/* Record offsets */
> +#define TOUCH_REPORT_DESC_CONTACTID		8
> +#define TOUCH_REPORT_DESC_X			16
> +#define TOUCH_REPORT_DESC_Y			32
> +#define TOUCH_REPORT_DESC_P			48
> +#define TOUCH_REPORT_DESC_MAJ			56
> +#define TOUCH_REPORT_DESC_MIN			64
> +
> +/* HID */
> +#define HID_TOUCH_REPORT_ID			0x1
> +#define HID_BTN_REPORT_ID			0x3
> +#define HID_APP_RESPONSE_REPORT_ID		0x1F
> +#define HID_APP_OUTPUT_REPORT_ID		0x2F
> +#define HID_BL_RESPONSE_REPORT_ID		0x30
> +#define HID_BL_OUTPUT_REPORT_ID		0x40
> +
> +#define HID_OUTPUT_RESPONSE_REPORT_OFFSET	2
> +#define HID_OUTPUT_RESPONSE_CMD_OFFSET		4
> +#define HID_OUTPUT_RESPONSE_CMD_MASK		0x7F
> +
> +#define HID_SYSINFO_SENSING_OFFSET		33
> +#define HID_SYSINFO_BTN_OFFSET			48
> +#define HID_SYSINFO_BTN_MASK			0xFF
> +#define HID_SYSINFO_MAX_BTN			8
> +
> +/*  Timeout in ms */
> +#define CY_HID_OUTPUT_TIMEOUT			200
> +#define CY_HID_OUTPUT_GET_SYSINFO_TIMEOUT	3000
> +#define CY_HID_GET_HID_DESCRIPTOR_TIMEOUT	4000
> +
> +/* maximum number of concurrent tracks */
> +#define TOUCH_REPORT_SIZE			10
> +#define TOUCH_INPUT_HEADER_SIZE		7
> +#define BTN_REPORT_SIZE			9
> +#define BTN_INPUT_HEADER_SIZE			5
> +
> +#define MAX_CY_TCH_T_IDS	32
> +
> +/* All usage pages for Touch Report */
> +#define TOUCH_REPORT_USAGE_PG_X		0x00010030
> +#define TOUCH_REPORT_USAGE_PG_Y		0x00010031
> +#define TOUCH_REPORT_USAGE_PG_P		0x000D0030
> +#define TOUCH_REPORT_USAGE_PG_CONTACTID	0x000D0051
> +#define TOUCH_REPORT_USAGE_PG_CONTACTCOUNT	0x000D0054
> +#define TOUCH_REPORT_USAGE_PG_MAJ		0xFF010062
> +#define TOUCH_REPORT_USAGE_PG_MIN		0xFF010063
> +#define TOUCH_COL_USAGE_PG			0x000D0022
> +
> +/* helpers */
> +#define HI_BYTE(x)				((u8)(((x) >> 8) & 0xFF))
> +#define LOW_BYTE(x)				((u8)((x) & 0xFF))
> +
> +/* System Information interface definitions */
> +struct cyttsp5_sensing_conf_data_dev {
> +	u8 electrodes_x;
> +	u8 electrodes_y;
> +	__le16 len_x;
> +	__le16 len_y;
> +	__le16 res_x;
> +	__le16 res_y;
> +	__le16 max_z;
> +	u8 origin_x;
> +	u8 origin_y;
> +	u8 btn;
> +	u8 scan_mode;
> +	u8 max_num_of_tch_per_refresh_cycle;
> +} __packed;
> +
> +struct cyttsp5_sensing_conf_data {
> +	u16 res_x;
> +	u16 res_y;
> +	u16 max_z;
> +	u16 len_x;
> +	u16 len_y;
> +	u8 origin_x;
> +	u8 origin_y;
> +	u8 max_tch;
> +};
> +
> +enum hid_cmd_state {
> +	HID_CMD_DONE,
> +	HID_CMD_BUSY,
> +};
> +
> +enum cyttsp5_tch_abs {	/* for ordering within the extracted touch data array */
> +	CY_TCH_X,	/* X */
> +	CY_TCH_Y,	/* Y */
> +	CY_TCH_P,	/* P (Z) */
> +	CY_TCH_T,	/* TOUCH ID */
> +	CY_TCH_MAJ,	/* TOUCH_MAJOR */
> +	CY_TCH_MIN,	/* TOUCH_MINOR */
> +	CY_TCH_NUM_ABS,
> +};
> +
> +struct cyttsp5_tch_abs_params {
> +	size_t ofs;	/* abs byte offset */
> +	size_t size;	/* size in bits */
> +	size_t min;	/* min value */
> +	size_t max;	/* max value */
> +	size_t bofs;	/* bit offset */
> +};
> +
> +struct cyttsp5_touch {
> +	int abs[CY_TCH_NUM_ABS];
> +};
> +
> +struct cyttsp5_sysinfo {
> +	struct cyttsp5_sensing_conf_data sensing_conf_data;
> +	int num_btns;
> +	struct cyttsp5_tch_abs_params tch_hdr;
> +	struct cyttsp5_tch_abs_params tch_abs[CY_TCH_NUM_ABS];
> +	u32 key_code[HID_SYSINFO_MAX_BTN];
> +};
> +
> +struct cyttsp5_hid_desc {
> +	__le16 hid_desc_len;
> +	u8 packet_id;
> +	u8 reserved_byte;
> +	__le16 bcd_version;
> +	__le16 report_desc_len;
> +	__le16 report_desc_register;
> +	__le16 input_register;
> +	__le16 max_input_len;
> +	__le16 output_register;
> +	__le16 max_output_len;
> +	__le16 command_register;
> +	__le16 data_register;
> +	__le16 vendor_id;
> +	__le16 product_id;
> +	__le16 version_id;
> +	u8 reserved[4];
> +} __packed;
> +
> +struct cyttsp5 {
> +	struct device *dev;
> +	wait_queue_head_t wait_q;

I think you want "struct completion".

> +	struct cyttsp5_sysinfo sysinfo;
> +	int hid_cmd_state;
> +	struct cyttsp5_hid_desc hid_desc;
> +	u8 cmd_buf[CYTTSP5_PREALLOCATED_CMD_BUFFER];
> +	u8 input_buf[CY_MAX_INPUT];
> +	u8 response_buf[CY_MAX_INPUT];
> +	struct gpio_desc *reset_gpio;
> +	struct input_dev *input;
> +	char phys[NAME_MAX];
> +	int num_prv_rec;
> +	struct regmap *regmap;
> +	struct touchscreen_properties prop;
> +	struct regulator *vdd;
> +};
> +
> +/*
> + * For what understood in the datasheet, the register does not
> + * matter. For consistency, used the Input Register address
> + * but it does mean anything to the device. The important data
> + * to send is the I2C address
> + */
> +static int cyttsp5_read(struct cyttsp5 *ts, u8 *buf, u32 max)
> +{
> +	int error;
> +	u32 size;
> +	u8 temp[2];
> +
> +	/* Read the frame to retrieve the size */
> +	error = regmap_bulk_read(ts->regmap, HID_INPUT_REG, temp, sizeof(temp));
> +	if (error)
> +		return error;
> +
> +	size = get_unaligned_le16(temp);
> +	if (!size || size == 2)
> +		return 0;
> +
> +	if (size > max)
> +		return -EINVAL;
> +
> +	/* Get the real value */
> +	return regmap_bulk_read(ts->regmap, HID_INPUT_REG, buf, size);
> +}
> +
> +static int cyttsp5_write(struct cyttsp5 *ts, unsigned int reg, u8 *data,
> +			 size_t size)
> +{
> +	u8 cmd[HID_OUTPUT_MAX_CMD_SIZE];
> +
> +	if (size + 1 > HID_OUTPUT_MAX_CMD_SIZE)
> +		return -E2BIG;
> +
> +	/* High bytes of register address needed as first byte of cmd */
> +	cmd[0] = HI_BYTE(reg);
> +
> +	/* Copy the rest of the data */
> +	if (data)
> +		memcpy(&cmd[1], data, size);
> +
> +	/* The hardware wants to receive a frame with the address register
> +	 * contains in the first two bytes. As the regmap_write function
> +	 * add the register adresse in the frame, we use the LOW_BYTE as
> +	 * first frame byte for the address register and the first
> +	 * data byte is the high register + left of the cmd to send
> +	 */
> +	return regmap_bulk_write(ts->regmap, LOW_BYTE(reg), cmd, size + 1);
> +}
> +
> +static void cyttsp5_report_slot_liftoff(struct cyttsp5 *ts, int max_slots)
> +{
> +	int t;
> +
> +	if (ts->num_prv_rec == 0)
> +		return;
> +
> +	for (t = 0; t < max_slots; t++) {
> +		input_mt_slot(ts->input, t);
> +		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, false);
> +	}
> +}
> +
> +static void cyttsp5_mt_lift_all(struct cyttsp5 *ts)
> +{
> +	struct cyttsp5_sysinfo *si = &ts->sysinfo;
> +	int max = si->tch_abs[CY_TCH_T].max;
> +
> +	if (ts->num_prv_rec != 0) {
> +		cyttsp5_report_slot_liftoff(ts, max);
> +		input_sync(ts->input);
> +		ts->num_prv_rec = 0;
> +	}
> +}
> +
> +static void cyttsp5_get_touch_axis(int *axis, int size, int max, u8 *xy_data,
> +				   int bofs)
> +{
> +	int nbyte;
> +
> +	for (nbyte = 0, *axis = 0; nbyte < size; nbyte++)
> +		*axis = *axis + ((xy_data[nbyte] >> bofs) << (nbyte * 8));
> +
> +	*axis &= max - 1;
> +}
> +
> +static void cyttsp5_get_touch_record(struct cyttsp5 *ts,
> +				     struct cyttsp5_touch *touch, u8 *xy_data)
> +{
> +	struct cyttsp5_sysinfo *si = &ts->sysinfo;
> +	enum cyttsp5_tch_abs abs;
> +
> +	for (abs = CY_TCH_X; abs < CY_TCH_NUM_ABS; abs++)
> +		cyttsp5_get_touch_axis(&touch->abs[abs],
> +				       si->tch_abs[abs].size,
> +				       si->tch_abs[abs].max,
> +				       xy_data + si->tch_abs[abs].ofs,
> +				       si->tch_abs[abs].bofs);
> +}
> +
> +static void cyttsp5_get_mt_touches(struct cyttsp5 *ts,
> +				   struct cyttsp5_touch *tch, int num_cur_tch)
> +{
> +	struct cyttsp5_sysinfo *si = &ts->sysinfo;
> +	int i, t = 0, offset = 0;
> +	DECLARE_BITMAP(ids, MAX_CY_TCH_T_IDS);
> +	u8 *tch_addr;
> +	int tmp;
> +
> +	bitmap_zero(ids, MAX_CY_TCH_T_IDS);
> +	memset(tch->abs, 0, sizeof(tch->abs));
> +
> +	switch (ts->input_buf[2]) {
> +	case HID_TOUCH_REPORT_ID:
> +		offset = TOUCH_INPUT_HEADER_SIZE;
> +		break;
> +	case HID_BTN_REPORT_ID:
> +		offset = BTN_INPUT_HEADER_SIZE;
> +		break;
> +	}
> +
> +	for (i = 0; i < num_cur_tch; i++) {
> +		tch_addr = ts->input_buf + offset + (i * TOUCH_REPORT_SIZE);
> +		cyttsp5_get_touch_record(ts, tch, tch_addr);
> +
> +		/* Convert MAJOR/MINOR from mm to resolution */
> +		tmp = tch->abs[CY_TCH_MAJ] * 100 * si->sensing_conf_data.res_x;
> +		tch->abs[CY_TCH_MAJ] = tmp / si->sensing_conf_data.len_x;
> +		tmp = tch->abs[CY_TCH_MIN] * 100 * si->sensing_conf_data.res_x;
> +		tch->abs[CY_TCH_MIN] = tmp / si->sensing_conf_data.len_x;
> +
> +		t = tch->abs[CY_TCH_T];
> +		input_mt_slot(ts->input, t);
> +		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, true);
> +		__set_bit(t, ids);
> +
> +		/* position and pressure fields */
> +		touchscreen_report_pos(ts->input, &ts->prop,
> +				       tch->abs[CY_TCH_X], tch->abs[CY_TCH_Y],
> +				       true);
> +		input_report_abs(ts->input, ABS_MT_PRESSURE,
> +				 tch->abs[CY_TCH_P]);
> +
> +		/* Get the extended touch fields */
> +		input_report_abs(ts->input, ABS_MT_TOUCH_MAJOR,
> +				 tch->abs[CY_TCH_MAJ]);
> +		input_report_abs(ts->input, ABS_MT_TOUCH_MINOR,
> +				 tch->abs[CY_TCH_MIN]);
> +	}
> +
> +	input_mt_sync_frame(ts->input);
> +	input_sync(ts->input);

These 2 need to go into cyttsp5_xy_worker().

> +
> +	ts->num_prv_rec = num_cur_tch;
> +}
> +
> +/* read xy_data for all current touches */
> +static int cyttsp5_xy_worker(struct cyttsp5 *ts)
> +{
> +	struct device *dev = ts->dev;
> +	struct cyttsp5_sysinfo *si = &ts->sysinfo;
> +	int max_tch = si->sensing_conf_data.max_tch;
> +	struct cyttsp5_touch tch;
> +	u8 num_cur_tch;
> +
> +	cyttsp5_get_touch_axis((int *) &num_cur_tch, si->tch_hdr.size,
> +			       si->tch_hdr.max,
> +			       ts->input_buf + 3 + si->tch_hdr.ofs,
> +			       si->tch_hdr.bofs);
> +
> +	if (num_cur_tch > max_tch) {
> +		dev_err(dev, "Num touch err detected (n=%d)\n", num_cur_tch);
> +		num_cur_tch = max_tch;
> +	}
> +
> +	if (num_cur_tch == 0 && ts->num_prv_rec == 0)
> +		return 0;
> +
> +	/* extract xy_data for all currently reported touches */
> +	if (num_cur_tch)
> +		cyttsp5_get_mt_touches(ts, &tch, num_cur_tch);
> +	else
> +		cyttsp5_mt_lift_all(ts);

If you have

	input_mt_sync_frame(ts->input);
	input_sync(ts->input);

here then the INPUT_MT_DROP_UNUSED will actually do the right thing and
you can drop cyttsp5_report_slot_liftoff() and cyttsp5_mt_lift_all(). 

> +
> +	return 0;
> +}
> +
> +static int cyttsp5_mt_attention(struct device *dev)
> +{
> +	struct cyttsp5 *ts = dev_get_drvdata(dev);
> +	int error;
> +
> +	/* core handles handshake */
> +	error = cyttsp5_xy_worker(ts);
> +	if (error < 0)
> +		dev_err(dev, "xy_worker error r=%d\n", error);
> +

I'd combine it with cyttsp5_xy_worker().

> +	return error;
> +}
> +
> +static int cyttsp5_setup_input_device(struct device *dev)
> +{
> +	struct cyttsp5 *ts = dev_get_drvdata(dev);
> +	struct cyttsp5_sysinfo *si = &ts->sysinfo;
> +	int max_x, max_y, max_p;
> +	int max_x_tmp, max_y_tmp;
> +	int error;
> +
> +	__set_bit(EV_REL, ts->input->evbit);

Please drop.

> +
> +	max_x_tmp = si->sensing_conf_data.res_x;
> +	max_y_tmp = si->sensing_conf_data.res_y;
> +	max_x = max_x_tmp - 1;
> +	max_y = max_y_tmp - 1;
> +	max_p = si->sensing_conf_data.max_z;
> +
> +	error = input_mt_init_slots(ts->input, si->tch_abs[CY_TCH_T].max,
> +		INPUT_MT_DROP_UNUSED | INPUT_MT_POINTER);

INPUT_MT_DIRECT for touchscreen.

> +	if (error < 0)
> +		return error;
> +
> +	input_set_abs_params(ts->input, ABS_MT_POSITION_X, 0, max_x, 0, 0);
> +	input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0, max_y, 0, 0);
> +	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, max_p, 0, 0);
> +
> +	input_set_abs_params(ts->input, ABS_MT_TOUCH_MAJOR, 0, MAX_AREA, 0, 0);
> +	input_set_abs_params(ts->input, ABS_MT_TOUCH_MINOR, 0, MAX_AREA, 0, 0);
> +
> +	error = input_register_device(ts->input);
> +	if (error < 0)
> +		dev_err(dev, "Error, failed register input device r=%d\n", error);
> +
> +	return error;
> +}
> +
> +#ifdef CONFIG_OF

Do not make it dependent on OF, if property is there use it.

> +static int cyttsp5_parse_dt_key_code(struct device *dev)
> +{
> +	struct cyttsp5 *ts = dev_get_drvdata(dev);
> +	struct cyttsp5_sysinfo *si = &ts->sysinfo;
> +	int i;
> +
> +	if (!si->num_btns)
> +		return 0;
> +
> +	/* Initialize the button to RESERVED */
> +	for (i = 0; i < si->num_btns; i++)
> +		si->key_code[i] = KEY_RESERVED;
> +
> +	return device_property_read_u32_array(dev, "linux,keycodes",
> +				   si->key_code, si->num_btns);
> +}
> +#else
> +static int cyttsp5_parse_dt_key_code(struct device *dev)
> +{
> +	struct cyttsp5 *ts = dev_get_drvdata(dev);
> +	struct cyttsp5_sysinfo *si = &ts->sysinfo;
> +	int i;
> +
> +	if (!si->num_btns)
> +		return 0;
> +
> +	/* Initialize the button to RESERVED */
> +	for (i = 0; i < si->num_btns; i++)
> +		si->key_code[i] = KEY_RESERVED;
> +
> +	return 0;
> +}
> +#endif
> +
> +static int cyttsp5_btn_attention(struct device *dev)
> +{
> +	struct cyttsp5 *ts = dev_get_drvdata(dev);
> +	struct cyttsp5_sysinfo *si = &ts->sysinfo;
> +	int cur_btn, offset = 0;
> +	int cur_btn_state;
> +
> +	switch (ts->input_buf[2]) {
> +	case HID_TOUCH_REPORT_ID:
> +		offset = TOUCH_INPUT_HEADER_SIZE;
> +		break;
> +	case HID_BTN_REPORT_ID:
> +		offset = BTN_INPUT_HEADER_SIZE;
> +		break;
> +	}
> +
> +	if (ts->input_buf[2] != HID_BTN_REPORT_ID || !si->num_btns)
> +		return 0;
> +
> +	/* extract button press/release touch information */
> +	for (cur_btn = 0; cur_btn < si->num_btns; cur_btn++) {
> +		/* Get current button state */
> +		cur_btn_state = (ts->input_buf[offset] >> (cur_btn * CY_BITS_PER_BTN))
> +			& CY_NUM_BTN_EVENT_ID;
> +
> +		input_report_key(ts->input, si->key_code[cur_btn],
> +				 cur_btn_state);
> +		input_sync(ts->input);
> +	}
> +
> +	return 0;
> +}
> +
> +static int cyttsp5_validate_cmd_response(struct cyttsp5 *ts, u8 code)
> +{
> +	u16 size, crc;
> +	u8 status, report_id;
> +	int command_code;
> +
> +	size = get_unaligned_le16(&ts->response_buf[0]);
> +
> +	if (!size)
> +		return 0;
> +
> +	report_id = ts->response_buf[HID_OUTPUT_RESPONSE_REPORT_OFFSET];
> +
> +	switch (report_id) {
> +	case HID_BL_RESPONSE_REPORT_ID: {
> +		if (ts->response_buf[4] != HID_OUTPUT_BL_SOP) {
> +			dev_err(ts->dev, "HID output response, wrong SOP\n");
> +			return -EPROTO;
> +		}
> +
> +		if (ts->response_buf[size - 1] != HID_OUTPUT_BL_EOP) {
> +			dev_err(ts->dev, "HID output response, wrong EOP\n");
> +			return -EPROTO;
> +		}
> +
> +		crc = crc_itu_t(0xFFFF, &ts->response_buf[4], size - 7);
> +		if (ts->response_buf[size - 3] != LOW_BYTE(crc) ||
> +		    ts->response_buf[size - 2] != HI_BYTE(crc)) {
> +			dev_err(ts->dev, "HID output response, wrong CRC 0x%X\n",
> +				crc);
> +			return -EPROTO;
> +		}
> +
> +		status = ts->response_buf[5];
> +		if (status) {
> +			dev_err(ts->dev, "HID output response, ERROR:%d\n",
> +				status);
> +			return -EPROTO;
> +		}
> +		break;
> +	}
> +	case HID_APP_RESPONSE_REPORT_ID: {
> +		command_code = ts->response_buf[HID_OUTPUT_RESPONSE_CMD_OFFSET]
> +			& HID_OUTPUT_RESPONSE_CMD_MASK;
> +		if (command_code != code) {
> +			dev_err(ts->dev,
> +				"HID output response, wrong command_code:%X\n",
> +				command_code);
> +			return -EPROTO;
> +		}
> +		break;
> +	}
> +	}
> +
> +	return 0;
> +}
> +
> +static void cyttsp5_si_get_btn_data(struct cyttsp5 *ts)
> +{
> +	struct cyttsp5_sysinfo *si = &ts->sysinfo;
> +	unsigned int btns = ts->response_buf[HID_SYSINFO_BTN_OFFSET]
> +		& HID_SYSINFO_BTN_MASK;
> +
> +	si->num_btns = hweight8(btns);
> +}
> +
> +static int cyttsp5_get_sysinfo_regs(struct cyttsp5 *ts)
> +{
> +	struct cyttsp5_sensing_conf_data *scd = &ts->sysinfo.sensing_conf_data;
> +	struct cyttsp5_sensing_conf_data_dev *scd_dev =
> +		(struct cyttsp5_sensing_conf_data_dev *)
> +		&ts->response_buf[HID_SYSINFO_SENSING_OFFSET];
> +
> +	cyttsp5_si_get_btn_data(ts);
> +
> +	scd->max_tch = scd_dev->max_num_of_tch_per_refresh_cycle;
> +	scd->res_x = get_unaligned_le16(&scd_dev->res_x);
> +	scd->res_y = get_unaligned_le16(&scd_dev->res_y);
> +	scd->max_z = get_unaligned_le16(&scd_dev->max_z);
> +	scd->len_x = get_unaligned_le16(&scd_dev->len_x);
> +	scd->len_y = get_unaligned_le16(&scd_dev->len_y);
> +
> +	return 0;
> +}
> +
> +static int cyttsp5_hid_output_get_sysinfo(struct cyttsp5 *ts)
> +{
> +	int rc;
> +	u8 cmd[HID_OUTPUT_GET_SYSINFO_SIZE];
> +
> +	ts->hid_cmd_state = HID_CMD_BUSY;
> +
> +	/* HI bytes of Output register address */
> +	cmd[0] = LOW_BYTE(HID_OUTPUT_GET_SYSINFO_SIZE);
> +	cmd[1] = HI_BYTE(HID_OUTPUT_GET_SYSINFO_SIZE);
> +	cmd[2] = HID_APP_OUTPUT_REPORT_ID;
> +	cmd[3] = 0x0; /* Reserved */
> +	cmd[4] = HID_OUTPUT_GET_SYSINFO;
> +
> +	rc = cyttsp5_write(ts, HID_OUTPUT_REG, cmd,
> +			   HID_OUTPUT_GET_SYSINFO_SIZE);
> +	if (rc) {
> +		dev_err(ts->dev, "Failed to write command %d", rc);
> +		goto error;
> +	}
> +
> +	rc = wait_event_timeout(ts->wait_q, (ts->hid_cmd_state == HID_CMD_DONE),
> +				msecs_to_jiffies(CY_HID_OUTPUT_GET_SYSINFO_TIMEOUT));
> +	if (!rc) {
> +		dev_err(ts->dev, "HID output cmd execution timed out\n");
> +		rc = -ETIME;
> +		goto error;
> +	}
> +
> +	rc = cyttsp5_validate_cmd_response(ts, HID_OUTPUT_GET_SYSINFO);
> +	if (rc) {
> +		dev_err(ts->dev, "Validation of the response failed\n");
> +		goto error;
> +	}
> +
> +	return cyttsp5_get_sysinfo_regs(ts);
> +
> +error:
> +	ts->hid_cmd_state = HID_CMD_DONE;
> +	return rc;
> +}
> +
> +static int cyttsp5_hid_output_bl_launch_app(struct cyttsp5 *ts)
> +{
> +	int rc;
> +	u8 cmd[HID_OUTPUT_BL_LAUNCH_APP];
> +	u16 crc;
> +
> +	ts->hid_cmd_state = HID_CMD_BUSY;
> +
> +	cmd[0] = LOW_BYTE(HID_OUTPUT_BL_LAUNCH_APP_SIZE);
> +	cmd[1] = HI_BYTE(HID_OUTPUT_BL_LAUNCH_APP_SIZE);
> +	cmd[2] = HID_BL_OUTPUT_REPORT_ID;
> +	cmd[3] = 0x0; /* Reserved */
> +	cmd[4] = HID_OUTPUT_BL_SOP;
> +	cmd[5] = HID_OUTPUT_BL_LAUNCH_APP;
> +	cmd[6] = 0x0; /* Low bytes of data */
> +	cmd[7] = 0x0; /* Hi bytes of data */
> +	crc = crc_itu_t(0xFFFF, &cmd[4], 4);
> +	cmd[8] = LOW_BYTE(crc);
> +	cmd[9] = HI_BYTE(crc);
> +	cmd[10] = HID_OUTPUT_BL_EOP;
> +
> +	rc = cyttsp5_write(ts, HID_OUTPUT_REG, cmd,
> +			   HID_OUTPUT_BL_LAUNCH_APP_SIZE);
> +	if (rc) {
> +		dev_err(ts->dev, "Failed to write command %d", rc);
> +		goto error;
> +	}
> +
> +	rc = wait_event_timeout(ts->wait_q, (ts->hid_cmd_state == HID_CMD_DONE),
> +				msecs_to_jiffies(CY_HID_OUTPUT_TIMEOUT));
> +	if (!rc) {
> +		dev_err(ts->dev, "HID output cmd execution timed out\n");
> +		rc = -ETIME;
> +		goto error;
> +	}
> +
> +	rc = cyttsp5_validate_cmd_response(ts, HID_OUTPUT_BL_LAUNCH_APP);
> +	if (rc) {
> +		dev_err(ts->dev, "Validation of the response failed\n");
> +		goto error;
> +	}
> +
> +	return rc;
> +
> +error:
> +	ts->hid_cmd_state = HID_CMD_DONE;
> +
> +	return rc;
> +}
> +
> +static int cyttsp5_get_hid_descriptor(struct cyttsp5 *ts,
> +				      struct cyttsp5_hid_desc *desc)
> +{
> +	struct device *dev = ts->dev;
> +	__le16 hid_desc_register = HID_DESC_REG;
> +	int rc;
> +	u8 cmd[2];
> +
> +	/* Read HID descriptor length and version */
> +	ts->hid_cmd_state = HID_CMD_BUSY;
> +
> +	/* Set HID descriptor register */
> +	memcpy(cmd, &hid_desc_register, sizeof(hid_desc_register));
> +
> +	rc = cyttsp5_write(ts, HID_DESC_REG, NULL, 0);
> +	if (rc < 0) {
> +		dev_err(dev, "Failed to get HID descriptor, rc=%d\n", rc);
> +		goto error;
> +	}
> +
> +	rc = wait_event_timeout(ts->wait_q, (ts->hid_cmd_state == HID_CMD_DONE),
> +				msecs_to_jiffies(CY_HID_GET_HID_DESCRIPTOR_TIMEOUT));
> +	if (!rc) {
> +		dev_err(ts->dev, "HID get descriptor timed out\n");
> +		rc = -ETIME;
> +		goto error;
> +	}
> +
> +	memcpy(desc, ts->response_buf, sizeof(struct cyttsp5_hid_desc));
> +
> +	/* Check HID descriptor length and version */
> +	if (le16_to_cpu(desc->hid_desc_len) != sizeof(*desc) ||
> +	    le16_to_cpu(desc->bcd_version) != HID_VERSION) {
> +		dev_err(dev, "Unsupported HID version\n");
> +		return -ENODEV;
> +	}
> +
> +	goto exit;
> +
> +error:
> +	ts->hid_cmd_state = HID_CMD_DONE;
> +exit:
> +	return rc;
> +}
> +
> +static int fill_tch_abs(struct cyttsp5_tch_abs_params *tch_abs, int report_size,
> +			int offset)
> +{
> +	tch_abs->ofs = offset / 8;
> +	tch_abs->size = report_size / 8;
> +	if (report_size % 8)
> +		tch_abs->size += 1;

DIV_ROUND_UP()?

> +	tch_abs->min = 0;
> +	tch_abs->max = 1 << report_size;
> +	tch_abs->bofs = offset - (tch_abs->ofs << 3);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t cyttsp5_handle_irq(int irq, void *handle)
> +{
> +	struct cyttsp5 *ts = handle;
> +	int report_id;
> +	int size;
> +	int error;
> +
> +	error = cyttsp5_read(ts, ts->input_buf, CY_MAX_INPUT);
> +	if (error)
> +		return IRQ_HANDLED;
> +
> +	size = get_unaligned_le16(&ts->input_buf[0]);
> +
> +	if (size == 0) {
> +		/* reset */
> +		report_id = 0;
> +		size = 2;
> +	} else {
> +		report_id = ts->input_buf[2];
> +	}
> +
> +	switch (report_id) {
> +	case HID_TOUCH_REPORT_ID:
> +		cyttsp5_mt_attention(ts->dev);
> +		break;
> +	case HID_BTN_REPORT_ID:
> +		cyttsp5_btn_attention(ts->dev);
> +		break;
> +	default:
> +		/* It is not an input but a command response */
> +		memcpy(ts->response_buf, ts->input_buf, size);
> +
> +		ts->hid_cmd_state = HID_CMD_DONE;
> +		wake_up(&ts->wait_q);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int cyttsp5_deassert_int(struct cyttsp5 *ts)
> +{
> +	u16 size;
> +	u8 buf[2];
> +	int error;
> +
> +	error = regmap_bulk_read(ts->regmap, HID_INPUT_REG, buf, 2);
> +	if (error < 0)
> +		return error;
> +
> +	size = get_unaligned_le16(&buf[0]);
> +	if (size == 2 || size == 0)
> +		return 0;
> +
> +	return -EINVAL;
> +}
> +
> +static int cyttsp5_fill_all_touch(struct cyttsp5 *ts)
> +{
> +	struct cyttsp5_sysinfo *si = &ts->sysinfo;
> +
> +	fill_tch_abs(&si->tch_abs[CY_TCH_X], REPORT_SIZE_16,
> +		     TOUCH_REPORT_DESC_X);
> +	fill_tch_abs(&si->tch_abs[CY_TCH_Y], REPORT_SIZE_16,
> +		     TOUCH_REPORT_DESC_Y);
> +	fill_tch_abs(&si->tch_abs[CY_TCH_P], REPORT_SIZE_8,
> +		     TOUCH_REPORT_DESC_P);
> +	fill_tch_abs(&si->tch_abs[CY_TCH_T], REPORT_SIZE_5,
> +		     TOUCH_REPORT_DESC_CONTACTID);
> +	fill_tch_abs(&si->tch_hdr, REPORT_SIZE_5,
> +		     TOUCH_REPORT_DESC_HDR_CONTACTCOUNT);
> +	fill_tch_abs(&si->tch_abs[CY_TCH_MAJ], REPORT_SIZE_8,
> +		     TOUCH_REPORT_DESC_MAJ);
> +	fill_tch_abs(&si->tch_abs[CY_TCH_MIN], REPORT_SIZE_8,
> +		     TOUCH_REPORT_DESC_MIN);
> +
> +	return 0;
> +}
> +
> +static int cyttsp5_startup(struct cyttsp5 *ts)
> +{
> +	int error;
> +
> +	error = cyttsp5_deassert_int(ts);
> +	if (error) {
> +		dev_err(ts->dev, "Error on deassert int r=%d\n", error);
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * Launch the application as the device starts in bootloader mode
> +	 * because of a power-on-reset
> +	 */
> +	error = cyttsp5_hid_output_bl_launch_app(ts);
> +	if (error < 0) {
> +		dev_err(ts->dev, "Error on launch app r=%d\n", error);
> +		return error;
> +	}
> +
> +	error = cyttsp5_get_hid_descriptor(ts, &ts->hid_desc);
> +	if (error < 0) {
> +		dev_err(ts->dev, "Error on getting HID descriptor r=%d\n", error);
> +		return error;
> +	}
> +
> +	error = cyttsp5_fill_all_touch(ts);
> +	if (error < 0) {
> +		dev_err(ts->dev, "Error on report descriptor r=%d\n", error);
> +		return error;
> +	}
> +
> +	error = cyttsp5_hid_output_get_sysinfo(ts);
> +	if (error) {
> +		dev_err(ts->dev, "Error on getting sysinfo r=%d\n", error);
> +		return error;
> +	}
> +
> +	return error;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id cyttsp5_of_match[] = {
> +	{ .compatible = "cypress,tt21000", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, cyttsp5_of_match);
> +#endif
> +
> +static const struct i2c_device_id cyttsp5_i2c_id[] = {
> +	{ CYTTSP5_NAME, 0, },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, cyttsp5_i2c_id);
> +
> +static int cyttsp5_probe(struct device *dev, struct regmap *regmap, int irq,
> +			 const char *name)
> +{
> +	struct cyttsp5 *ts;
> +	struct cyttsp5_sysinfo *si;
> +	int error, i;
> +
> +	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
> +	if (!ts)
> +		return -ENOMEM;
> +
> +	/* Initialize device info */
> +	ts->regmap = regmap;
> +	ts->dev = dev;
> +	si = &ts->sysinfo;
> +	dev_set_drvdata(dev, ts);
> +
> +	/* Initialize wait queue */
> +	init_waitqueue_head(&ts->wait_q);
> +
> +	/* Power up the device */
> +	ts->vdd = regulator_get(dev, "vdd");

devm_regulator_get().

> +	if (IS_ERR(ts->vdd)) {
> +		error = PTR_ERR(ts->vdd);
> +		dev_set_drvdata(dev, NULL);
> +		kfree(ts);
> +		return error;
> +	}
> +
> +	error = regulator_enable(ts->vdd);
> +	if (error) {
> +		regulator_put(ts->vdd);

Need to use devm_add_action_or_reset() to disable regulator.

> +		dev_set_drvdata(dev, NULL);
> +		kfree(ts);
> +		return error;
> +	}
> +
> +	ts->input = devm_input_allocate_device(dev);
> +	if (!ts->input) {
> +		dev_err(dev, "Error, failed to allocate input device\n");
> +		return -ENODEV;
> +	}
> +
> +	ts->input->name = "cyttsp5";
> +	scnprintf(ts->phys, sizeof(ts->phys), "%s/input0", dev_name(dev));
> +	ts->input->phys = ts->phys;
> +	input_set_drvdata(ts->input, ts);
> +
> +	/* Reset the gpio to be in a reset state */
> +	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ts->reset_gpio)) {
> +		error = PTR_ERR(ts->reset_gpio);
> +		dev_err(dev, "Failed to request reset gpio, error %d\n", error);
> +		return error;
> +	}
> +	gpiod_set_value(ts->reset_gpio, 0);
> +
> +	/* Need a delay to have device up */
> +	msleep(20);
> +
> +	error = devm_request_threaded_irq(dev, irq, NULL, cyttsp5_handle_irq,
> +				       IRQF_ONESHOT, name, ts);
> +	if (error) {
> +		dev_err(dev, "unable to request IRQ\n");
> +		return error;
> +	}
> +
> +	error = cyttsp5_startup(ts);
> +	if (error) {
> +		dev_err(ts->dev, "Fail initial startup r=%d\n", error);
> +		return error;
> +	}
> +
> +	error = cyttsp5_parse_dt_key_code(dev);
> +	if (error < 0) {
> +		dev_err(ts->dev, "Error while parsing dts %d\n", error);
> +		return error;
> +	}
> +
> +	touchscreen_parse_properties(ts->input, true, &ts->prop);
> +
> +	__set_bit(EV_KEY, ts->input->evbit);
> +	for (i = 0; i < si->num_btns; i++)
> +		__set_bit(si->key_code[i], ts->input->keybit);
> +
> +	return cyttsp5_setup_input_device(dev);
> +}
> +
> +static int cyttsp5_i2c_probe(struct i2c_client *client,
> +			     const struct i2c_device_id *id)
> +{
> +	struct regmap *regmap;
> +	static const struct regmap_config config = {
> +		.reg_bits = 8,
> +		.val_bits = 8,
> +	};
> +
> +	regmap = devm_regmap_init_i2c(client, &config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(&client->dev, "regmap allocation failed: %ld\n",
> +			PTR_ERR(regmap));
> +		return PTR_ERR(regmap);
> +	}
> +
> +	return cyttsp5_probe(&client->dev, regmap, client->irq, client->name);
> +}
> +
> +static struct i2c_driver cyttsp5_i2c_driver = {
> +	.driver = {
> +		.name = CYTTSP5_NAME,
> +		.of_match_table = of_match_ptr(cyttsp5_of_match),
> +	},
> +	.probe = cyttsp5_i2c_probe,
> +	.id_table = cyttsp5_i2c_id,
> +};
> +
> +module_i2c_driver(cyttsp5_i2c_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Touchscreen driver for Cypress TrueTouch Gen 5 Product");
> +MODULE_AUTHOR("Myl�ne Josserand <mylene.josserand@bootlin.com>");
> -- 
> 2.31.1
> 

Thanks.

-- 
Dmitry
