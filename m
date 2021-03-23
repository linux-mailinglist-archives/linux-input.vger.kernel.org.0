Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB567346DC0
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 00:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhCWXNe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 19:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbhCWXNa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 19:13:30 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C2D6C061574;
        Tue, 23 Mar 2021 16:13:30 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id v3so13319639pgq.2;
        Tue, 23 Mar 2021 16:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C+tV4c1x30JCp5rEYKPpQnxaj8sCoeqmi9XpQcRE93E=;
        b=Sl1aBCgMNUqnxkFK4xI/JexbTTEUdRKN175j+USbrS7ZtSmEnxDohCchV8TSLvjXUe
         FEl9ugNjFBcYLF1xDT6RyuEN8NjaFeR2dEUFDDeH9zkVfpPIQuAu3xJpix1WWJZUeQ4F
         z9oKh2C6DWyXttKvy6f19bC06MiE1CfXEsz9Ft12ZF0w2qMQxZ4MhL+nGLP/Rp86/AKD
         M8iPB7e30+bRly9I2J+O+bpOpnzasTfTcVAbPw1rh25vFTFlc9iF8YwZa/wfRpp5c7+Z
         R3BzU/IZ6BOTLOt5+njv8Ae38T+k+AKscPSUoakDSSskAAbPNA4/fyuPSR7OgRuM+ZIl
         rvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C+tV4c1x30JCp5rEYKPpQnxaj8sCoeqmi9XpQcRE93E=;
        b=QQ1sb67OKOa3m7EbKQaAkHaM7QrzUhLNF9m78XUk0oY4yxu6/2arqXtA6gTwlzOrrT
         /T4lVTXN2uuKiRnKiH9rDxsr5GJ2434xdjFJCyzy+91HYRLPS5vvM6MNs8mCof5uPZgx
         oxjbBBVJJuQ9BPLL8S0ydkI/GiKQYncgxLwWsnnMAuViRxvfOoDBhyrykvxOILOfIo9X
         vjkSKHJvfZ/PfBJsqVYntACN3rOC6iF+CssrGxF43NdxXLtznVjrNeyq5ntw7G4IDgu3
         EBB/kDQim9aJYhHEGNcgT8Nwsb+tf13Jw5fgHToVl4EtSZeebsWy5g5CCdCvoKq53nZL
         yVLw==
X-Gm-Message-State: AOAM530B4s3WE50Hh3RTaQtfwRfQDvKwlSBsCdn9ojxdo2pOMsBGQkSS
        70+zORf5l/bXDGHfW+qCD2E=
X-Google-Smtp-Source: ABdhPJwzwUKBOJdb6rwVDm6i4mwlNljUovAmlld6geEnZOsLTOhzn9Y8J0KOg6T6uxDwbNa2xlLH7g==
X-Received: by 2002:a17:902:b68c:b029:e6:bb9f:7577 with SMTP id c12-20020a170902b68cb02900e6bb9f7577mr763315pls.0.1616541209698;
        Tue, 23 Mar 2021 16:13:29 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4d6b:ca5a:c720:f5c9])
        by smtp.gmail.com with ESMTPSA id b140sm248587pfb.98.2021.03.23.16.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 16:13:28 -0700 (PDT)
Date:   Tue, 23 Mar 2021 16:13:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Joe Hung <joe_hung@ilitek.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, luca_hsu@ilitek.com
Subject: Re: [RESEND v6 2/2] input: touchscreen: Add support for ILITEK Lego
 Series
Message-ID: <YFp2FZCbvWcj1wTz@google.com>
References: <20210322104131.4136679-1-joe_hung@ilitek.com>
 <20210322104131.4136679-2-joe_hung@ilitek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322104131.4136679-2-joe_hung@ilitek.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Joe,

On Mon, Mar 22, 2021 at 06:41:31PM +0800, Joe Hung wrote:
> Add support for ILITEK Lego series of touch devices.
> Lego series includes ILITEK 213X/23XX/25XX.
> 
> Tested/passed with evaluation board with ILI2520/2322 IC.

The driver looks pretty good, a few more comments though.

> 
> Signed-off-by: Joe Hung <joe_hung@ilitek.com>
> ---
> Changes in v6:
>   - Modified print message from sysfs file node
>   - Add i2c functionality check in probe function
>   - Add single touch ABS_X/ABS_Y registration
>   - Remove TOUCH_MAJOR/WIDTH_MAJOR
> 
> Changes in v5:
>   - None
> 
> Changes in v4:
>   - Remove unused inlcude header file
>   - Remove parenthesis for scalar values
>   - Place to use standard macro DIV_ROUND_UP
>   - Remove unused/unrequired member of struct
>   - Remove retries when I2C transfer
>   - Remove irq_disable/enable wrapper
>   - Remove key handler
>   - Adjust to use get_unaligned_le16/be16
>   - Modify ilitek_reset() to leave reset gpio in-active finally
>   - Remove null check for input argument that should not happen
>   - Modify return value for read_tp_info()
>   - Modify to use common touchscreen_* api
>   - Add error handling for input_mt_init_slots
>   - Modify input flag for irq request, and parse it from ACPI/DTS
>   - Return stored value instead of querying via I2C in *_show api
>   - Modify to use devm_* APIs and get rid of remove api
>   - Add PM (suspend/resume) handling
> 
> Changes in v3:
>   - None
> 
> Changes in v2:
>   - Remove irq-gpio and related flow
> 
>  drivers/input/touchscreen/Kconfig         |  12 +
>  drivers/input/touchscreen/Makefile        |   1 +
>  drivers/input/touchscreen/ilitek_ts_i2c.c | 753 ++++++++++++++++++++++
>  3 files changed, 766 insertions(+)
>  create mode 100644 drivers/input/touchscreen/ilitek_ts_i2c.c
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index f012fe746df0..03a16852d4bc 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -1334,4 +1334,16 @@ config TOUCHSCREEN_ZINITIX
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called zinitix.
> 
> +config TOUCHSCREEN_ILITEK
> +	tristate "Ilitek I2C 213X/23XX/25XX/Lego Series Touch ICs"
> +	depends on I2C
> +	help
> +	  Say Y here if you have touchscreen with ILITEK touch IC,
> +	  it supports 213X/23XX/25XX and other Lego series.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ilitek_ts_i2c.
> +
>  endif
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index 6233541e9173..1622e66c4eaa 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -112,3 +112,4 @@ obj-$(CONFIG_TOUCHSCREEN_ROHM_BU21023)	+= rohm_bu21023.o
>  obj-$(CONFIG_TOUCHSCREEN_RASPBERRYPI_FW)	+= raspberrypi-ts.o
>  obj-$(CONFIG_TOUCHSCREEN_IQS5XX)	+= iqs5xx.o
>  obj-$(CONFIG_TOUCHSCREEN_ZINITIX)	+= zinitix.o
> +obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
> diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
> new file mode 100644
> index 000000000000..507ab735f2b6
> --- /dev/null
> +++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
> @@ -0,0 +1,753 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ILITEK Touch IC driver for 23XX, 25XX and Lego series
> + *
> + * Copyright (C) 2011 ILI Technology Corporation.
> + * Copyright (C) 2020 Luca Hsu <luca_hsu@ilitek.com>
> + * Copyright (C) 2021 Joe Hung <joe_hung@ilitek.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/input.h>
> +#include <linux/input/mt.h>
> +#include <linux/i2c.h>
> +#include <linux/slab.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/errno.h>
> +#include <linux/acpi.h>
> +#include <linux/input/touchscreen.h>
> +#include <asm/unaligned.h>
> +
> +
> +#define ILITEK_TS_NAME					"ilitek_ts"
> +#define BL_V1_8						0x108
> +#define BL_V1_7						0x107
> +#define BL_V1_6						0x106
> +
> +#define ILITEK_TP_CMD_GET_TP_RES			0x20
> +#define ILITEK_TP_CMD_GET_SCRN_RES			0x21
> +#define ILITEK_TP_CMD_SET_IC_SLEEP			0x30
> +#define ILITEK_TP_CMD_SET_IC_WAKE			0x31
> +#define ILITEK_TP_CMD_GET_FW_VER			0x40
> +#define ILITEK_TP_CMD_GET_PRL_VER			0x42
> +#define ILITEK_TP_CMD_GET_MCU_VER			0x61
> +#define ILITEK_TP_CMD_GET_IC_MODE			0xC0
> +
> +#define REPORT_ADDRESS_COUNT				61
> +#define ILITEK_SUPPORT_MAX_POINT			40
> +
> +#define PTL_V3						0x03
> +#define PTL_V6						0x06

Are these needed? Do you plan bringing in V3 protocol support?

> +
> +#define MOD_AP						0x5A
> +#define MOD_BL						0x55

These are not used?

> +
> +struct ilitek_protocol_info {
> +	u16 ver;
> +	u8 ver_major;
> +	u8 flag;
> +};
> +
> +struct ilitek_touch_info {
> +	u16 id;
> +	u16 x;
> +	u16 y;
> +	u16 p;
> +	u16 w;
> +	u16 h;
> +	u16 status;
> +};
> +
> +struct ilitek_ts_data {
> +	struct i2c_client		*client;
> +	struct gpio_desc		*reset_gpio;
> +	struct input_dev		*input_dev;
> +	struct touchscreen_properties	prop;
> +
> +	int (*process_and_report)(struct ilitek_ts_data *ts);

Until the driver supports multiple protocol versions there is no point
in having this pointer.

> +
> +	struct PROTOCOL_MAP		*ptl_cb_func;
> +	struct ilitek_protocol_info	ptl;
> +
> +	struct ilitek_touch_info	tpinfo[ILITEK_SUPPORT_MAX_POINT];
> +
> +	char				product_id[30];
> +	u16				mcu_ver;
> +	u8				ic_mode;
> +	u8				firmware_ver[8];
> +
> +	s32				reset_time;
> +	s32				screen_max_x;
> +	s32				screen_max_y;
> +	s32				screen_min_x;
> +	s32				screen_min_y;
> +	s32				max_tp;
> +};
> +
> +enum ilitek_cmds {
> +	/* common cmds */
> +	GET_PTL_VER = 0,
> +	GET_FW_VER,
> +	GET_SCRN_RES,
> +	GET_TP_RES,
> +	GET_IC_MODE,
> +	GET_MCU_VER,
> +	SET_IC_SLEEP,
> +	SET_IC_WAKE,
> +
> +	/* ALWAYS keep at the end */
> +	MAX_CMD_CNT
> +};
> +
> +typedef int protocol_func(struct ilitek_ts_data *ts,
> +			  u16 cmd, u8 *inbuf, u8 *outbuf);
> +
> +struct PROTOCOL_MAP {
> +	u16 cmd;
> +	const char *name;
> +	protocol_func *func;
> +	u8 flag;
> +};
> +
> +/* ILITEK I2C R/W APIs */
> +static int ilitek_i2c_write_and_read(struct ilitek_ts_data *ts,
> +				     u8 *cmd, int write_len, int delay,
> +				     u8 *data, int read_len)
> +{
> +	int ret = 0;
> +	struct i2c_client *client = ts->client;
> +	struct i2c_msg msgs[2] = {
> +		{.addr = client->addr, .flags = 0,
> +		 .len = write_len, .buf = cmd,},
> +		{.addr = client->addr, .flags = I2C_M_RD,
> +		 .len = read_len, .buf = data,}
> +	};
> +
> +	if (delay == 0 && write_len > 0 && read_len > 0) {
> +		ret = i2c_transfer(client->adapter, msgs, 2);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		if (write_len > 0) {
> +			ret = i2c_transfer(client->adapter, msgs, 1);
> +			if (ret < 0)
> +				return ret;
> +		}
> +		if (delay > 0)
> +			mdelay(delay);
> +		if (read_len > 0) {
> +			ret = i2c_transfer(client->adapter, msgs + 1, 1);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/* ILITEK ISR APIs */
> +static void ilitek_touch_down(struct ilitek_ts_data *ts,
> +			      int id, int x, int y, int p, int h, int w)
> +{
> +	struct input_dev *input = ts->input_dev;
> +
> +	input_report_key(input, BTN_TOUCH, 1);
> +
> +	input_mt_slot(input, id);
> +	input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
> +
> +	touchscreen_report_pos(input, &ts->prop, x, y, true);
> +
> +	ts->tpinfo[id].status = 1;
> +	ts->tpinfo[id].id = id;
> +	ts->tpinfo[id].x = x;
> +	ts->tpinfo[id].y = y;
> +	ts->tpinfo[id].p = p;
> +	ts->tpinfo[id].h = h;
> +	ts->tpinfo[id].w = w;
> +}
> +
> +static void ilitek_touch_release(struct ilitek_ts_data *ts, int id)
> +{
> +	struct input_dev *input = ts->input_dev;
> +
> +	if (ts->tpinfo[id].status == 1) {
> +		input_mt_slot(input, id);
> +		input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
> +		ts->tpinfo[id].status = 0;
> +	}
> +}
> +
> +static void ilitek_touch_release_all(struct ilitek_ts_data *ts)
> +{
> +	struct input_dev *input = ts->input_dev;
> +	int i = 0;
> +
> +	for (i = 0; i < ts->max_tp; i++)
> +		ilitek_touch_release(ts, i);
> +	input_report_key(input, BTN_TOUCH, 0);
> +}
> +
> +static int ilitek_process_and_report_v6(struct ilitek_ts_data *ts)
> +{
> +	int ret = 0;
> +	u8 buf[512] = {0};
> +	int packet_len = 5;
> +	int packet_max_point = 10;
> +	int report_max_point = 6;
> +	int release_point = 0;
> +	int i = 0, count = 0;
> +	struct input_dev *input = ts->input_dev;
> +	struct device *dev = &ts->client->dev;
> +	u16 x, y, p = 10, w = 10, h = 10, status, id;
> +
> +	ret = ilitek_i2c_write_and_read(ts, NULL, 0, 0, buf, 64);
> +	if (ret < 0) {
> +		dev_err(dev, "get touch info failed, err:%d\n", ret);
> +		goto err_release_touch_and_key;
> +	}
> +
> +	report_max_point = buf[REPORT_ADDRESS_COUNT];
> +	if (report_max_point > ts->max_tp) {
> +		dev_err(dev, "FW report max point:%d > panel info. max:%d\n",
> +			report_max_point, ts->max_tp);
> +		ret = -EINVAL;
> +		goto err_release_touch_and_key;
> +	}
> +
> +	count = DIV_ROUND_UP(report_max_point, packet_max_point);
> +	for (i = 1; i < count; i++) {
> +		ret = ilitek_i2c_write_and_read(ts, NULL, 0, 0,
> +			buf + i * 64, 64);
> +		if (ret < 0) {
> +			dev_err(dev, "get touch info. err, count=%d\n", count);
> +			goto err_release_touch_and_key;
> +		}
> +	}
> +
> +	for (i = 0; i < report_max_point; i++) {
> +		status = buf[i * packet_len + 1] & 0x40;
> +		id = buf[i * packet_len + 1] & 0x3F;
> +
> +		if (!status) {
> +			release_point++;
> +			ilitek_touch_release(ts, id);
> +			continue;
> +		}
> +
> +		x = get_unaligned_le16(buf + i * packet_len + 2);
> +		y = get_unaligned_le16(buf + i * packet_len + 4);
> +
> +		if (x > ts->screen_max_x || x < ts->screen_min_x ||
> +		    y > ts->screen_max_y || y < ts->screen_min_y) {
> +			dev_warn(dev, "invalid position, X[%d,%d,%d], Y[%d,%d,%d]\n",
> +				 ts->screen_min_x, x, ts->screen_max_x,
> +				 ts->screen_min_y, y, ts->screen_max_y);
> +			continue;
> +		}
> +		ilitek_touch_down(ts, id, x, y, p, h, w);
> +	}
> +
> +err_release_touch_and_key:
> +	if (ret < 0 || release_point == report_max_point)
> +		ilitek_touch_release_all(ts);

If you use input_mt_sync_frame() here you will not need to are about
releasing BTN_TOUCH or doing single-touch emulation.

> +	input_sync(input);
> +	return (ret < 0) ? ret : 0;
> +}
> +
> +
> +/* APIs of cmds for ILITEK Touch IC */
> +static int api_protocol_set_cmd(struct ilitek_ts_data *ts,
> +				u16 idx, u8 *inbuf, u8 *outbuf)
> +{
> +	u16 cmd;
> +	int ret = 0;
> +
> +	if (idx >= MAX_CMD_CNT)
> +		return -EINVAL;
> +
> +	/* check if cmd is supported by its protocol version */
> +	if (!(ts->ptl.flag & ts->ptl_cb_func[idx].flag))
> +		return -EINVAL;
> +
> +	cmd = ts->ptl_cb_func[idx].cmd;
> +	ret = ts->ptl_cb_func[idx].func(ts, cmd, inbuf, outbuf);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int api_protocol_get_ptl_ver(struct ilitek_ts_data *ts,
> +				    u16 cmd, u8 *inbuf, u8 *outbuf)
> +{
> +	int ret = 0;
> +	u8 buf[64] = {0};
> +
> +	buf[0] = cmd;
> +	ret = ilitek_i2c_write_and_read(ts, buf, 1, 5, outbuf, 3);
> +	if (ret < 0)
> +		return ret;
> +
> +	ts->ptl.ver = get_unaligned_be16(outbuf);
> +	ts->ptl.ver_major = outbuf[0];
> +
> +	return 0;
> +}
> +
> +static int api_protocol_get_mcu_ver(struct ilitek_ts_data *ts,
> +				    u16 cmd, u8 *inbuf, u8 *outbuf)
> +{
> +	int ret = 0;
> +	u8 buf[64] = {0};
> +
> +	buf[0] = cmd;
> +	ret = ilitek_i2c_write_and_read(ts, buf, 1, 5, outbuf, 32);
> +	if (ret < 0)
> +		return ret;
> +
> +	ts->mcu_ver = get_unaligned_le16(outbuf);
> +	memset(ts->product_id, 0, sizeof(ts->product_id));
> +	memcpy(ts->product_id, outbuf+6, 26);
> +
> +	return 0;
> +}
> +
> +static int api_protocol_get_fw_ver(struct ilitek_ts_data *ts,
> +				   u16 cmd, u8 *inbuf, u8 *outbuf)
> +{
> +	int ret = 0;
> +	u8 buf[64] = {0};
> +
> +	buf[0] = cmd;
> +	ret = ilitek_i2c_write_and_read(ts, buf, 1, 5, outbuf, 8);
> +	if (ret < 0)
> +		return ret;
> +
> +	memcpy(ts->firmware_ver, outbuf, 8);
> +
> +	return 0;
> +}
> +
> +static int api_protocol_get_scrn_res(struct ilitek_ts_data *ts,
> +				     u16 cmd, u8 *inbuf, u8 *outbuf)
> +{
> +	int ret = 0;
> +	u8 buf[64] = {0};
> +
> +	buf[0] = cmd;
> +	ret = ilitek_i2c_write_and_read(ts, buf, 1, 5, outbuf, 8);
> +	if (ret < 0)
> +		return ret;
> +
> +	ts->screen_min_x = get_unaligned_le16(outbuf);
> +	ts->screen_min_y = get_unaligned_le16(outbuf + 2);
> +	ts->screen_max_x = get_unaligned_le16(outbuf + 4);
> +	ts->screen_max_y = get_unaligned_le16(outbuf + 6);
> +
> +	return 0;
> +}
> +
> +static int api_protocol_get_tp_res(struct ilitek_ts_data *ts,
> +				   u16 cmd, u8 *inbuf, u8 *outbuf)
> +{
> +	int ret = 0;
> +	u8 buf[64] = {0};
> +
> +	buf[0] = cmd;
> +	ret = ilitek_i2c_write_and_read(ts, buf, 1, 5, outbuf, 15);
> +	if (ret < 0)
> +		return ret;
> +
> +	ts->max_tp = outbuf[8];
> +
> +	if (ts->max_tp > ILITEK_SUPPORT_MAX_POINT) {
> +		dev_err(&ts->client->dev, "Invalid MAX_TP:%d from FW\n",
> +			ts->max_tp);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int api_protocol_get_ic_mode(struct ilitek_ts_data *ts,
> +				    u16 cmd, u8 *inbuf, u8 *outbuf)
> +{
> +	int ret = 0;
> +	u8 buf[64] = {0};
> +
> +	buf[0] = cmd;
> +	ret = ilitek_i2c_write_and_read(ts, buf, 1, 5, outbuf, 2);
> +	if (ret < 0)
> +		return ret;
> +
> +	ts->ic_mode = outbuf[0];
> +	return 0;
> +}
> +
> +static int api_protocol_set_ic_sleep(struct ilitek_ts_data *ts,
> +				     u16 cmd, u8 *inbuf, u8 *outbuf)
> +{
> +	u8 buf[64] = {0};
> +
> +	buf[0] = cmd;
> +	return ilitek_i2c_write_and_read(ts, buf, 1, 0, NULL, 0);
> +}
> +
> +static int api_protocol_set_ic_wake(struct ilitek_ts_data *ts,
> +				    u16 cmd, u8 *inbuf, u8 *outbuf)
> +{
> +	u8 buf[64] = {0};
> +
> +	buf[0] = cmd;
> +	return ilitek_i2c_write_and_read(ts, buf, 1, 0, NULL, 0);
> +}
> +
> +struct PROTOCOL_MAP ptl_func_map[] = {
> +	/* common cmds */
> +	[GET_PTL_VER]	= {ILITEK_TP_CMD_GET_PRL_VER, "GET_PTL_VER",
> +			   api_protocol_get_ptl_ver, PTL_V3 | PTL_V6},
> +	[GET_FW_VER]	= {ILITEK_TP_CMD_GET_FW_VER, "GET_FW_VER",
> +			   api_protocol_get_fw_ver, PTL_V3 | PTL_V6},
> +	[GET_SCRN_RES]	= {ILITEK_TP_CMD_GET_SCRN_RES, "GET_SCRN_RES",
> +			   api_protocol_get_scrn_res, PTL_V3 | PTL_V6},
> +	[GET_TP_RES]	= {ILITEK_TP_CMD_GET_TP_RES, "GET_TP_RES",
> +			   api_protocol_get_tp_res, PTL_V3 | PTL_V6},
> +	[GET_IC_MODE]	= {ILITEK_TP_CMD_GET_IC_MODE, "GET_IC_MODE",
> +			   api_protocol_get_ic_mode, PTL_V3 | PTL_V6},
> +	[GET_MCU_VER]	= {ILITEK_TP_CMD_GET_MCU_VER, "GET_MOD_VER",
> +			   api_protocol_get_mcu_ver, PTL_V3 | PTL_V6},
> +	[SET_IC_SLEEP]	= {ILITEK_TP_CMD_SET_IC_SLEEP, "SET_IC_SLEEP",
> +			   api_protocol_set_ic_sleep, PTL_V3 | PTL_V6},
> +	[SET_IC_WAKE]	= {ILITEK_TP_CMD_SET_IC_WAKE, "SET_IC_WAKE",
> +			   api_protocol_set_ic_wake, PTL_V3 | PTL_V6},
> +};
> +
> +/* Probe APIs */
> +static void ilitek_reset(struct ilitek_ts_data *ts, int delay, bool boot)
> +{
> +	if (!boot)
> +		disable_irq_nosync(ts->client->irq);

I am confused about this flag. ilitek_reset() is called from probe and
resume handlers, and in resume interrupts are already disabled, so why
are you trying to disable them again here?

> +
> +	if (ts->reset_gpio) {
> +		gpiod_set_value(ts->reset_gpio, 1);
> +		mdelay(10);
> +		gpiod_set_value(ts->reset_gpio, 0);
> +		mdelay(delay);
> +	}
> +
> +	if (!boot)
> +		enable_irq(ts->client->irq);
> +}
> +
> +static int ilitek_protocol_init(struct ilitek_ts_data *ts)
> +{
> +	int ret = 0;
> +	u8 outbuf[64] = {0};
> +
> +	ts->ptl.flag = PTL_V6;
> +	ts->ptl_cb_func = ptl_func_map;
> +	ts->process_and_report = ilitek_process_and_report_v6;
> +	ts->reset_time = 600;
> +
> +	ret = api_protocol_set_cmd(ts, GET_PTL_VER, NULL, outbuf);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Protocol v3 is not support currently */
> +	if (ts->ptl.ver_major == 0x3 ||
> +	    ts->ptl.ver == BL_V1_6 ||
> +	    ts->ptl.ver == BL_V1_7)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int ilitek_read_tp_info(struct ilitek_ts_data *ts, bool boot)
> +{
> +	u8 outbuf[256] = {0};
> +	int error = 0;
> +
> +	error = api_protocol_set_cmd(ts, GET_PTL_VER, NULL, outbuf);
> +	if (error < 0)
> +		return error;


api_protocol_set_cmd() returns normalized (-<rc>, 0], i.e. it is never
positive, so simply

	if (error)
		return error;

> +
> +	error = api_protocol_set_cmd(ts, GET_MCU_VER, NULL, outbuf);
> +	if (error < 0)
> +		return error;
> +
> +	error = api_protocol_set_cmd(ts, GET_FW_VER, NULL, outbuf);
> +	if (error < 0)
> +		return error;
> +
> +	if (boot) {
> +		error = api_protocol_set_cmd(ts, GET_SCRN_RES, NULL,
> +					     outbuf);
> +		if (error < 0)
> +			return error;
> +	}
> +
> +	error = api_protocol_set_cmd(ts, GET_TP_RES, NULL, outbuf);
> +	if (error < 0)
> +		return error;
> +
> +	error = api_protocol_set_cmd(ts, GET_IC_MODE, NULL, outbuf);
> +	if (error < 0)
> +		return error;
> +
> +	return 0;
> +}
> +
> +static int ilitek_input_dev_init(struct device *dev, struct ilitek_ts_data *ts)
> +{
> +	int ret = 0;
> +	struct input_dev *input = NULL;

No need to initialize variables like this, it only hurts, as otherwise
compiler can warn you if you forger to assign a value to a variable and
try to use it.

> +
> +	input = devm_input_allocate_device(dev);
> +	if (!input)
> +		return -ENOMEM;
> +
> +	ts->input_dev = input;
> +	input->name = ILITEK_TS_NAME;
> +	input->id.bustype = BUS_I2C;
> +
> +	__set_bit(INPUT_PROP_DIRECT, input->propbit);
> +	input->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
> +	input->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);

I do not think anything of this besides INPUT_PROP_DIRECT is needed, as
input_set_abs_params, and input_mt_init_slots will set needed
capabilities.

> +
> +	/* Single touch input setup */
> +	input_set_abs_params(input, ABS_X, ts->screen_min_x,
> +			     ts->screen_max_x, 0, 0);
> +	input_set_abs_params(input, ABS_Y, ts->screen_min_y,
> +			     ts->screen_max_y, 0, 0);
> +
> +	/* Multi-touch input setup */
> +	input_set_abs_params(input, ABS_MT_POSITION_X,
> +			     ts->screen_min_x,
> +			     ts->screen_max_x, 0, 0);
> +	input_set_abs_params(input, ABS_MT_POSITION_Y,
> +			     ts->screen_min_y,
> +			     ts->screen_max_y, 0, 0);
> +
> +	touchscreen_parse_properties(input, true, &ts->prop);
> +
> +	ret = input_mt_init_slots(input, ts->max_tp, INPUT_MT_DIRECT);

I prefer variables that hold error codes to be called "error".

Also, if you specify INPUT_MT_DROP_UNUSED as an additional flag for
input_mt_init_slots() and use input_mt_sync_frame() when reporting
events you would not need to track the state of contacts in your driver
and explicitly release them.


> +	if (ret) {
> +		dev_err(dev, "failed to initialize MT slots, err:%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = input_register_device(input);
> +	if (ret) {
> +		dev_err(dev, "failed to register input device, err:%d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t ilitek_i2c_isr(int irq, void *dev_id)
> +{
> +	struct ilitek_ts_data *ts = dev_id;
> +	int ret = 0;
> +
> +	ret = ts->process_and_report(ts);
> +
> +	if (ret < 0) {
> +		dev_err(&ts->client->dev, "[%s] err:%d\n", __func__, ret);
> +		return IRQ_NONE;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static ssize_t firmware_version_show(struct device *dev,
> +				     struct device_attribute *attr, char *buf)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ilitek_ts_data *ts = i2c_get_clientdata(client);
> +
> +	return scnprintf(buf, PAGE_SIZE,
> +			 "fw version: [%02X%02X.%02X%02X.%02X%02X.%02X%02X]\n",
> +			 ts->firmware_ver[0], ts->firmware_ver[1],
> +			 ts->firmware_ver[2], ts->firmware_ver[3],
> +			 ts->firmware_ver[4], ts->firmware_ver[5],
> +			 ts->firmware_ver[6], ts->firmware_ver[7]);
> +}
> +static DEVICE_ATTR_RO(firmware_version);
> +
> +static ssize_t product_id_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ilitek_ts_data *ts = i2c_get_clientdata(client);
> +
> +	return scnprintf(buf, PAGE_SIZE, "product id: [%04X], module: [%s]\n",
> +			 ts->mcu_ver, ts->product_id);
> +}
> +static DEVICE_ATTR_RO(product_id);
> +
> +static struct attribute *ilitek_sysfs_attrs[] = {
> +	&dev_attr_firmware_version.attr,
> +	&dev_attr_product_id.attr,
> +	NULL
> +};
> +
> +static struct attribute_group ilitek_attrs_group[] = {
> +	{.attrs = ilitek_sysfs_attrs},
> +};
> +
> +static int ilitek_ts_i2c_probe(struct i2c_client *client,
> +			       const struct i2c_device_id *id)
> +{
> +	struct ilitek_ts_data *ts = NULL;
> +	struct device *dev = &client->dev;
> +	int ret = 0;

Please drop unneeded initializations, s/ret/error/

> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(dev, "%s: i2c check functionality failed\n",
> +			ILITEK_TS_NAME);

I do not think you need to have ILITEK_TS_NAME as device and driver name
are already printed by dev_err.

> +		return -ENXIO;
> +	}
> +
> +	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
> +	if (!ts)
> +		return -ENOMEM;
> +
> +	ts->client = client;
> +	i2c_set_clientdata(client, ts);
> +
> +	ts->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);

Make it devm_gpiod_get_optional() as you already handle it being not
present in ilitek_reset().

> +	if (IS_ERR(ts->reset_gpio)) {
> +		ret = PTR_ERR(ts->reset_gpio);
> +		dev_err(dev, "request gpiod failed, err:%d", ret);
> +		return ret;
> +	}
> +
> +	ilitek_reset(ts, 1000, true);
> +	ret = ilitek_protocol_init(ts);
> +	if (ret < 0) {
> +		dev_err(dev, "protocol init failed, err:%d", ret);
> +		return ret;
> +	}
> +
> +	ret = ilitek_read_tp_info(ts, true);
> +	if (ret < 0) {
> +		dev_err(dev, "read tp info failed, err:%d", ret);
> +		return ret;
> +	}
> +
> +	ret = ilitek_input_dev_init(dev, ts);
> +	if (ret < 0) {
> +		dev_err(dev, "input dev init failed, err:%d", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_request_threaded_irq(dev, ts->client->irq, NULL,
> +					ilitek_i2c_isr, IRQF_ONESHOT,
> +					"ilitek_touch_irq", ts);
> +	if (ret) {
> +		dev_err(dev, "request threaded irq failed, err:%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_device_add_group(dev, ilitek_attrs_group);
> +	if (ret) {
> +		dev_err(dev, "sysfs create group failed, err:%d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused ilitek_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ilitek_ts_data *ts = i2c_get_clientdata(client);
> +	int error = 0;
> +
> +	disable_irq(client->irq);
> +
> +	if (device_may_wakeup(dev)) {
> +		enable_irq_wake(client->irq);

You do not need to enable irq wake here, i2c core will do it for you.

> +	} else {
> +		error = api_protocol_set_cmd(ts, SET_IC_SLEEP, NULL, NULL);
> +		if (error < 0)
> +			return error;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused ilitek_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ilitek_ts_data *ts = i2c_get_clientdata(client);
> +	int error = 0;
> +
> +	if (device_may_wakeup(dev)) {
> +		disable_irq_wake(client->irq);
> +	} else {
> +		error = api_protocol_set_cmd(ts, SET_IC_WAKE, NULL, NULL);
> +		if (error < 0)
> +			return error;
> +	}
> +
> +	ilitek_reset(ts, ts->reset_time, false);

Are you sure you need to perform reset when device is a wakeup source?
I'd expect in that case it would stay operational.

> +	enable_irq(client->irq);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(ilitek_pm_ops, ilitek_suspend, ilitek_resume);
> +
> +static const struct i2c_device_id ilitek_ts_i2c_id[] = {
> +	{ILITEK_TS_NAME, 0},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, ilitek_ts_i2c_id);
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id ilitekts_acpi_id[] = {
> +	{ "ILTK0001", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, ilitekts_acpi_id);
> +#endif
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id ilitek_ts_i2c_match[] = {
> +	{.compatible = "ilitek,ili2130",},
> +	{.compatible = "ilitek,ili2131",},
> +	{.compatible = "ilitek,ili2132",},
> +	{.compatible = "ilitek,ili2316",},
> +	{.compatible = "ilitek,ili2322",},
> +	{.compatible = "ilitek,ili2323",},
> +	{.compatible = "ilitek,ili2326",},
> +	{.compatible = "ilitek,ili2520",},
> +	{.compatible = "ilitek,ili2521",},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ilitek_ts_i2c_match);
> +#endif
> +
> +static struct i2c_driver ilitek_ts_i2c_driver = {
> +	.driver = {
> +		.name = ILITEK_TS_NAME,
> +		.pm = &ilitek_pm_ops,
> +		.of_match_table = of_match_ptr(ilitek_ts_i2c_match),
> +		.acpi_match_table = ACPI_PTR(ilitekts_acpi_id),
> +	},
> +	.probe = ilitek_ts_i2c_probe,
> +	.id_table = ilitek_ts_i2c_id,
> +};
> +
> +module_i2c_driver(ilitek_ts_i2c_driver);
> +
> +MODULE_AUTHOR("ILITEK");
> +MODULE_DESCRIPTION("ILITEK I2C Touchscreen Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
> 
> 

Thanks.

-- 
Dmitry
