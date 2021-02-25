Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C29E324A82
	for <lists+linux-input@lfdr.de>; Thu, 25 Feb 2021 07:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhBYGYV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Feb 2021 01:24:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbhBYGYT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Feb 2021 01:24:19 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E674FC061574;
        Wed, 24 Feb 2021 22:23:38 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id t26so3135317pgv.3;
        Wed, 24 Feb 2021 22:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=j0eJyTmhgDRkrOyLvXbdUSAetDg2GBG5emXROm5jvhk=;
        b=RH2e7S6ULkHbXWJBvFvERmcUuutPHo+c6XfSJz6RqYErgxESklXj5dxPPhdqIXw51r
         VesfGIO2Lw0+HqQaW29RUMZCD4n18XLwuMmFiHFsocrYM7BDu8d8/GTra3QFW9CkUJzW
         ESTR1CDBuXJ9/zx3AoBBo3bOcfI///3CwzBsUIp1do3DQSLTrHf0WQUQKlZs9mb5eqfL
         OYSpRSj7bZW0plWsuXsn1M6O+OOaKW79Phm4f1gzCpPoWBDEut5jxZLnJrSGArxFqUxy
         HZXFpSjCQxImq1uDVvIU7l9Hws8Z2eiWfFl6ko10GEJt63CH+tn0S+c84uX9vkV4kVB8
         fFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=j0eJyTmhgDRkrOyLvXbdUSAetDg2GBG5emXROm5jvhk=;
        b=kxd8jNDUJbVrTqrQz0wxqbYNChHkKpsqZlcbrvGOicVQ+B87VHzRE8naJ+rBYVXeQR
         pkHrlt2JqewIr27i4rmFxt2d+HLvA2tVZdZMzfQDOyjaG0ONYyAsaun+ulu3l5NFIswd
         7PY8BeJu6FjC9JovxbPg8WB7yswD0ZycdtV4BvnrjA7tkUtmlgn1+RrQWZrVZCxTJFzT
         ExseDhvjzt88feH9cZSI4utT7QYF1FSq4X3euCnWIqhDaoLhDC/Rv1LP5L1U+m0uTJjq
         ulc9mvpaiPNdoi4nk/9tIQ9+7nvd9AQHe7sx0j1Kg83ekmLEkfsd5sSRho7Nx6thOqMm
         crVw==
X-Gm-Message-State: AOAM533YzHTUPA8VkJ3Oa0WnOWMNmSvuJyPbE6VbboKOgrUI01YWGXGc
        CJuZDNfQZ+VFR0Qoe3Ua4NY=
X-Google-Smtp-Source: ABdhPJzh2qDPeeCjD763hMUuexx9ZgXdWfvy0xJHoQMfrhnQlO9edi7R7qqGeLiwQ6iYXnHL0mnp7w==
X-Received: by 2002:a62:b416:0:b029:1e4:fb5a:55bb with SMTP id h22-20020a62b4160000b02901e4fb5a55bbmr1731923pfn.80.1614234217923;
        Wed, 24 Feb 2021 22:23:37 -0800 (PST)
Received: from google.com ([2620:15c:202:201:552:720f:2933:5745])
        by smtp.gmail.com with ESMTPSA id z29sm4728114pfr.114.2021.02.24.22.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 22:23:36 -0800 (PST)
Date:   Wed, 24 Feb 2021 22:23:33 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Joe Hung =?utf-8?B?KOa0qumKmOmZvSk=?= <joe_hung@ilitek.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Luca Hsu =?utf-8?B?KOW+kOWYiemNiik=?= <luca_hsu@ilitek.com>
Subject: Re: [PATCH v3 2/2] input: touchscreen: Add support for ILITEK Lego
 Series
Message-ID: <YDdCZdRJAqBvVZFZ@google.com>
References: <20210218064435.1360483-1-joe_hung@ilitek.com>
 <20210218064435.1360483-2-joe_hung@ilitek.com>
 <YDH0/tSytUagrzKP@google.com>
 <3d8c4d2e56fd40cc859b393c292432ac@ilitek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d8c4d2e56fd40cc859b393c292432ac@ilitek.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Joe,

On Tue, Feb 23, 2021 at 12:18:31PM +0000, Joe Hung (洪銘陽) wrote:
> Hi Dmitry,
> 
> Many thanks for your kind review, most of comments sound great to me.
> There some questions with "[Question]" prefix, response as below.
> 
> Looking forward to further discussion.
> 
> On Sat, Feb 20, 2021 at 21:51:58PM -0800, Dmitry Torokhov wrote:
> > Hi Joe,
> > 
> > On Thu, Feb 18, 2021 at 02:44:35PM +0800, Joe Hung wrote:
> > > Add support for ILITEK Lego series of touch devices.
> > > Lego series includes ILITEK 213X/2316/232X/252X.
> > > Designed in compatible way for ILITEK 23XX/251X ICs.
> > > 
> > > Tested and passed with evaluation board with ILI2520 IC.
> > 
> > Thank you for your submission.
> > 
> > > 
> > > Signed-off-by: Joe Hung <joe_hung@ilitek.com>
> > > ---
> > > Changes in v3:
> > >   - None
> > > 
> > > Changes in v2:
> > >   - Remove irq-gpio and related flow
> > > 
> > >  drivers/input/touchscreen/Kconfig         |   12 +
> > >  drivers/input/touchscreen/Makefile        |    1 +
> > >  drivers/input/touchscreen/ilitek_ts_i2c.c | 1010 +++++++++++++++++++++
> > >  3 files changed, 1023 insertions(+)
> > >  create mode 100644 drivers/input/touchscreen/ilitek_ts_i2c.c
> > > 
> > > diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> > > index f012fe746df0..9dea7fd0d94f 100644
> > > --- a/drivers/input/touchscreen/Kconfig
> > > +++ b/drivers/input/touchscreen/Kconfig
> > > @@ -1334,4 +1334,16 @@ config TOUCHSCREEN_ZINITIX
> > >  	  To compile this driver as a module, choose M here: the
> > >  	  module will be called zinitix.
> > > 
> > > +config TOUCHSCREEN_ILITEK
> > > +	tristate "Ilitek I2C 23XX/25XX/Lego Series Touch ICs"
> > > +	depends on I2C
> > > +	help
> > > +	  Say Y here if you have touchscreen with ILITEK touch IC,
> > > +	  it supports 23XX/25XX/other Lego series.
> > > +
> > > +	  If unsure, say N.
> > > +
> > > +	  To compile this driver as a module, choose M here: the
> > > +	  module will be called ilitek_ts_i2c.
> > > +
> > >  endif
> > > diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> > > index 6233541e9173..6749bdc42f41 100644
> > > --- a/drivers/input/touchscreen/Makefile
> > > +++ b/drivers/input/touchscreen/Makefile
> > > @@ -112,3 +112,4 @@ obj-$(CONFIG_TOUCHSCREEN_ROHM_BU21023)	+= rohm_bu21023.o
> > >  obj-$(CONFIG_TOUCHSCREEN_RASPBERRYPI_FW)	+= raspberrypi-ts.o
> > >  obj-$(CONFIG_TOUCHSCREEN_IQS5XX)	+= iqs5xx.o
> > >  obj-$(CONFIG_TOUCHSCREEN_ZINITIX)	+= zinitix.o
> > > +obj-$(CONFIG_TOUCHSCREEN_ILITEK)        += ilitek_ts_i2c.o
> > > diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
> > > new file mode 100644
> > > index 000000000000..72cb7c82170c
> > > --- /dev/null
> > > +++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
> > > @@ -0,0 +1,1010 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * ILITEK Touch IC driver for 23XX, 25XX and Lego series
> > > + *
> > > + * Copyright (C) 2011 ILI Technology Corporation.
> > > + * Copyright (C) 2020 Luca Hsu <luca_hsu@ilitek.com>
> > > + * Copyright (C) 2021 Joe Hung <joe_hung@ilitek.com>
> > > + */
> > > +
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/input.h>
> > > +#include <linux/input/mt.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/vmalloc.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/kthread.h>
> > 
> > Are you sure you need this include?
> 
> Agreed; will remove it in v4.
> 
> > > +#include <linux/sched.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/irq.h>
> > > +#include <linux/cdev.h>
> > 
> > You do not create character devices in this driver.
> 
> Agreed; will remove it in v4.
> 
> > > +#include <linux/uaccess.h>
> > > +#include <linux/version.h>
> > 
> > Why do you need this include?
> 
> Agreed; will remove it in v4.
> 
> > > +#include <linux/rtc.h>
> > 
> > I do not think this driver uses rtc.
> 
> Agreed; will remove it in v4.
> 
> > > +#include <linux/gpio.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <linux/proc_fs.h>
> > > +#include <linux/fs.h>
> > > +#include <linux/pm_runtime.h>
> > 
> > I do not think your driver uses runtime PM.
> > 
> 
> Agreed; will remove it in v4.
> 
> > > +#include <linux/ctype.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/acpi.h>
> > 
> > Please double-check that you include only facilities that the driver
> > actually uses.
> 
> Agreed; will do.
> 
> > 
> > > +
> > > +#define ILITEK_TS_NAME					"ilitek_ts"
> > > +#define BL_V1_8						(0x10800)
> > > +#define BL_V1_7						(0x10700)
> > > +#define BL_V1_6						(0x10600)
> > > +
> > > +#define ILITEK_TP_CMD_GET_TP_RES			(0x20)
> > > +#define ILITEK_TP_CMD_GET_SCRN_RES			(0x21)
> > > +#define ILITEK_TP_CMD_GET_KEY_INFO			(0x22)
> > > +#define ILITEK_TP_CMD_GET_FW_VER			(0x40)
> > > +#define ILITEK_TP_CMD_GET_PRL_VER			(0x42)
> > > +#define ILITEK_TP_CMD_GET_MCU_VER			(0x61)
> > > +#define ILITEK_TP_CMD_GET_IC_MODE			(0xC0)
> > > +
> > > +#define REPORT_ADDRESS_COUNT				(61)
> > > +#define ILITEK_SUPPORT_MAX_POINT			(40)
> > > +#define ILITEK_SUPPORT_MAX_KEY_CNT			(50)
> > 
> > No need to use parenthesis for simple scalar values.
> > 
> 
> Agreed; will modified here in v4.
> 
> > > +
> > > +#define CEIL(n, d)	(((n) % (d)) ? ((n) / (d) + 1) : ((n) / (d)))
> > 
> > I think you want standard DIV_ROUND_UP().
> 
> Agreed; will use DIV_ROUND_UP directly in v4.
> 
> > 
> > > +
> > > +struct ilitek_protocol_info {
> > 
> > Let's use ili23xx instead of ilitek prefix throughout the file. Or
> > whatever the first generation of the product supported by this driver.
> > 
> 
> This driver is planned to support 213X/23XX/25XX.

OK, then I'd use ili213x as the prefix and would have source as
ili213x.c

> 
> [Question]
> Was wondering why ilitek prefix is not feasible ?

Just because the driver does not support all Ilitek devices and we
already have drivers/input/touchscreen/ili210x.c

> Is it fine that 23XX prefix that still support 25XX ICs ?

That is fine.

> 
> > > +	s32 ver;
> > > +	u8 ver_major;
> > > +	u8 ver_mid;
> > > +	u8 ver_minor;
> > > +};
> > > +
> > > +struct ilitek_key_info {
> > > +	s32 id;
> > > +	s32 x;
> > > +	s32 y;
> > > +	s32 status;
> > > +};
> > > +
> > > +struct ilitek_touch_info {
> > > +	u16 id;
> > > +	u16 x;
> > > +	u16 y;
> > > +	u16 p;
> > > +	u16 w;
> > > +	u16 h;
> > > +	u16 status;
> > > +};
> > > +
> > > +struct ilitek_ts_data {
> > > +	struct i2c_client		*client;
> > > +	struct gpio_desc		*reset_gpio;
> > > +	struct input_dev		*input_dev;
> > > +
> > > +	struct mutex			ilitek_mutex;
> > > +	spinlock_t			irq_lock;
> > > +	bool				irq_status;
> > > +	int (*process_and_report)(struct ilitek_ts_data *ilitek_data);
> > > +
> > > +	struct PROTOCOL_MAP		*ptl_cb_func;
> > > +	struct ilitek_protocol_info	ptl;
> > > +
> > > +
> > > +	struct ilitek_key_info		keyinfo[ILITEK_SUPPORT_MAX_KEY_CNT];
> > > +	struct ilitek_touch_info	tpinfo[ILITEK_SUPPORT_MAX_POINT];
> > > +
> > > +	bool				is_touched;
> > > +	bool				touch_key_hold_press;
> > > +
> > > +	bool				ilitek_repeat_start;
> > > +
> > > +	char				product_id[30];
> > > +	u8				mcu_ver[2];
> > > +	u8				ic_mode;
> > > +	u8				firmware_ver[8];
> > > +
> > > +	s32				reset_time;
> > > +	s32				tp_max_x;
> > > +	s32				tp_max_y;
> > > +	s32				screen_max_x;
> > > +	s32				screen_max_y;
> > > +	s32				screen_min_x;
> > > +	s32				screen_min_y;
> > > +	s32				max_tp;
> > > +	s32				x_ch;
> > > +	s32				y_ch;
> > > +	s32				slave_count;
> > 
> > What is the importance of this?
> 
> slave_count is different among different ILITEK touch ICs.
> It would be used during FW upgrade.
> We needs FW upgrade touch IC's slave also.

I do not see it currently being used anywhere, that is why I question.
If it is needed for future enhancements, I would prefer it was added
with them, not ahead of time.

> 
> > > +	s32				format;
> > > +	s32				keycount;
> > > +	s32				key_xlen;
> > > +	s32				key_ylen;
> > > +};
> > > +
> > > +enum ilitek_cmds_v6 {
> > > +	GET_PTL_VER = 0,
> > > +	GET_FW_VER,
> > > +	GET_SCRN_RES,
> > > +	GET_TP_RES,
> > > +	GET_IC_MODE,
> > > +	GET_MCU_VER,
> > > +	GET_KEY_INFO,
> > > +
> > > +	MAX_CMD_CNT	/* ALWAYS keep at the end */
> > > +};
> > > +
> > > +typedef int protocol_func(struct ilitek_ts_data *ilitek_data,
> > > +			  u16 cmd, uint8_t *inbuf, uint8_t *outbuf);
> > 
> > In kernel please use u8 instead of uint8_t, etc.
> 
> Agreed; should correct it in v4.
> 
> > 
> > > +
> > > +struct PROTOCOL_MAP {
> > > +	u16 cmd;
> > > +	const char *name;
> > > +	protocol_func *func;
> > > +};
> > > +
> > > +/* ILITEK I2C R/W APIs */
> > > +static int ilitek_i2c_transfer(struct i2c_client *client,
> > > +			       struct i2c_msg *msgs, int cnt)
> > > +{
> > > +	int ret = 0, retry = 4;
> > > +
> > > +	while (retry--) {
> > > +		ret = i2c_transfer(client->adapter, msgs, cnt);
> > > +		if (ret >= 0)
> > > +			break;
> > > +		mdelay(20);
> > > +	}
> > 
> > Why does it this device need retries?
> > 
> 
> I2C transfer may failed cause FW not ready for some reason.
> It should be fine for basic probe/ISR flow, and risky for FW update.
> 
> [Question]
> Should it be removed, and patched with FW update patch ?

I think I would prefer firmware update executing retries as needed, and
common paths not having them.

> 
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int ilitek_i2c_write_and_read(struct ilitek_ts_data *ilitek_data,
> > > +				     u8 *cmd, int write_len, int delay,
> > > +				     u8 *data, int read_len)
> > > +{
> > > +	int ret = 0;
> > > +	struct i2c_client *client = ilitek_data->client;
> > > +	struct i2c_msg msgs[2] = {
> > > +		{.addr = client->addr, .flags = 0,
> > > +		 .len = write_len, .buf = cmd,},
> > > +		{.addr = client->addr, .flags = I2C_M_RD,
> > > +		 .len = read_len, .buf = data,}
> > > +	};
> > > +
> > > +	if (ilitek_data->ilitek_repeat_start && delay == 0 &&
> > 
> > Where is this being set? As far as I understand, repeated start is
> > property of the i2c controller, not peripheral device.
> > 
> > Also, please see if you can switch to using regmap, as it should take
> > care of selecting right mode, depending on controller's capabilities.
> > 
> 
> Some ilitek touch ICs may not support "I2C repeat start".

OK, then we need to somehow activate this feature, because as it is it
is a dead code.

> And agreed; it should be removed here in v4.
> 
> > > +		write_len > 0 && read_len > 0) {
> > > +		ret = ilitek_i2c_transfer(client, msgs, 2);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +	} else {
> > > +		if (write_len > 0) {
> > > +			ret = ilitek_i2c_transfer(client, msgs, 1);
> > > +			if (ret < 0)
> > > +				return ret;
> > > +		}
> > > +		if (delay > 0)
> > > +			mdelay(delay);
> > > +		if (read_len > 0) {
> > > +			ret = ilitek_i2c_transfer(client, msgs + 1, 1);
> > > +			if (ret < 0)
> > > +				return ret;
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void ilitek_irq_enable(struct ilitek_ts_data *ilitek_data)
> > > +{
> > > +	unsigned long irqflag = 0;
> > > +
> > > +	spin_lock_irqsave(&ilitek_data->irq_lock, irqflag);
> > > +	if (!ilitek_data->irq_status) {
> > > +		enable_irq(ilitek_data->client->irq);
> > > +		ilitek_data->irq_status = true;
> > > +	}
> > > +	spin_unlock_irqrestore(&ilitek_data->irq_lock, irqflag);
> > 
> > The driver should know at any time whether interrupts are disabled or
> > not, so I'd prefer if we did not have this wrapper, and the one below.
> > 
> 
> Agreed; will remove in v4.
> 
> > > +}
> > > +
> > > +static void ilitek_irq_disable(struct ilitek_ts_data *ilitek_data)
> > > +{
> > > +	unsigned long irqflag = 0;
> > > +
> > > +	spin_lock_irqsave(&ilitek_data->irq_lock, irqflag);
> > > +	if (ilitek_data->irq_status) {
> > > +		disable_irq_nosync(ilitek_data->client->irq);
> > > +		ilitek_data->irq_status = false;
> > > +	}
> > > +	spin_unlock_irqrestore(&ilitek_data->irq_lock, irqflag);
> > > +}
> > > +
> > > +/* ILITEK ISR APIs */
> > > +static void ilitek_key_down(struct ilitek_ts_data *ilitek_data,
> > > +			    int x, int y)
> > > +{
> > > +	int j = 0;
> > > +	int x_min;
> > > +	int x_max;
> > > +	int y_min;
> > > +	int y_max;
> > > +
> > > +	for (j = 0; j < ilitek_data->keycount; j++) {
> > > +		x_min = ilitek_data->keyinfo[j].x;
> > > +		x_max = ilitek_data->keyinfo[j].x + ilitek_data->key_xlen;
> > > +		y_min = ilitek_data->keyinfo[j].y;
> > > +		y_max = ilitek_data->keyinfo[j].y + ilitek_data->key_ylen;
> > > +
> > > +		if (x >= x_min && x <= x_max && y >= y_min && y <= y_max) {
> > > +			input_report_key(ilitek_data->input_dev,
> > > +					 ilitek_data->keyinfo[j].id, 1);
> > > +
> > > +			ilitek_data->keyinfo[j].status = 1;
> > > +			ilitek_data->touch_key_hold_press = true;
> > > +			ilitek_data->is_touched = true;
> > > +			break;
> > > +		}
> > > +	}
> > > +}
> > 
> > This sounds like handling of "soft keys" which is better left for
> > userspace. OTOH the Linux keycode seems to be coming from controller
> > firmware. This is really weird.
> 
> It handles keys which key ID and region are get from touch device firmware.
> Then check region of touch points to trigger key event.
> 
> [Question]
> Is it not feasible for a touchscreen driver do key handling?

Typically this is better handled in userspace, as then it works across
various touch controllers, vs. needing this special one.

> 
> > > +
> > > +static int ilitek_key_release(struct ilitek_ts_data *ilitek_data,
> > > +			      int x, int y, bool check_point)
> > > +{
> > > +	int j = 0;
> > > +	int x_min;
> > > +	int x_max;
> > > +	int y_min;
> > > +	int y_max;
> > > +
> > > +	for (j = 0; j < ilitek_data->keycount; j++) {
> > > +		x_min = ilitek_data->keyinfo[j].x;
> > > +		x_max = ilitek_data->keyinfo[j].x + ilitek_data->key_xlen;
> > > +		y_min = ilitek_data->keyinfo[j].y;
> > > +		y_max = ilitek_data->keyinfo[j].y + ilitek_data->key_ylen;
> > > +
> > > +		if (ilitek_data->keyinfo[j].status == 1) {
> > > +			if (!check_point ||
> > > +			    (x < x_min || x > x_max ||
> > > +			     y < y_min || y > y_max)) {
> > > +				input_report_key(ilitek_data->input_dev,
> > > +						 ilitek_data->keyinfo[j].id, 0);
> > > +				ilitek_data->keyinfo[j].status = 0;
> > > +				ilitek_data->touch_key_hold_press = false;
> > > +			}
> > > +		}
> > > +	}
> > > +	return 0;
> > > +}
> > > +
> > > +static void ilitek_touch_down(struct ilitek_ts_data *ilitek_data,
> > > +			      int id, int x, int y, int p, int h, int w)
> > > +{
> > > +	struct input_dev *input = ilitek_data->input_dev;
> > > +
> > > +	input_report_key(input, BTN_TOUCH, 1);
> > > +
> > > +	input_mt_slot(input, id);
> > > +	input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
> > > +
> > > +	input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
> > > +	input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
> > > +
> > > +	input_event(input, EV_ABS, ABS_MT_TOUCH_MAJOR, h);
> > > +	input_event(input, EV_ABS, ABS_MT_WIDTH_MAJOR, w);
> > > +
> > > +	ilitek_data->tpinfo[id].status = 1;
> > > +	ilitek_data->tpinfo[id].id = id;
> > > +	ilitek_data->tpinfo[id].x = x;
> > > +	ilitek_data->tpinfo[id].y = y;
> > > +	ilitek_data->tpinfo[id].p = p;
> > > +	ilitek_data->tpinfo[id].h = h;
> > > +	ilitek_data->tpinfo[id].w = w;
> > > +	ilitek_data->is_touched = true;
> > > +}
> > > +
> > > +static void ilitek_touch_release(struct ilitek_ts_data *ilitek_data, int id)
> > > +{
> > > +	struct input_dev *input = ilitek_data->input_dev;
> > > +
> > > +	if (ilitek_data->tpinfo[id].status == 1) {
> > > +		input_mt_slot(input, id);
> > > +		input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
> > > +		ilitek_data->tpinfo[id].status = 0;
> > > +	}
> > > +}
> > > +
> > > +static void ilitek_touch_release_all(struct ilitek_ts_data *ilitek_data)
> > > +{
> > > +	struct input_dev *input = ilitek_data->input_dev;
> > > +	int i = 0;
> > > +
> > > +	for (i = 0; i < ilitek_data->max_tp; i++)
> > > +		ilitek_touch_release(ilitek_data, i);
> > > +	input_report_key(input, BTN_TOUCH, 0);
> > > +	input_sync(input);
> > > +
> > > +	ilitek_data->is_touched = false;
> > > +}
> > > +
> > > +static int ilitek_process_and_report_v6(struct ilitek_ts_data *ilitek_data)
> > > +{
> > > +	int ret = 0;
> > > +	u8 buf[512] = {0};
> > > +	int packet_len = 5;
> > > +	int packet_max_point = 10;
> > > +	int report_max_point = 6;
> > > +	int release_point = 0;
> > > +	int i = 0, count = 0;
> > > +	struct input_dev *input = ilitek_data->input_dev;
> > > +	struct device *dev = &ilitek_data->client->dev;
> > > +	u16 x, y, p = 10, w = 10, h = 10, status, id;
> > > +
> > > +	ret = ilitek_i2c_write_and_read(ilitek_data, NULL, 0, 0, buf, 64);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "get touch info failed, err:%d\n", ret);
> > > +		goto err_release_touch_and_key;
> > > +	}
> > > +
> > > +	report_max_point = buf[REPORT_ADDRESS_COUNT];
> > > +	if (report_max_point > ilitek_data->max_tp) {
> > > +		dev_err(dev, "FW report max point:%d > panel info. max:%d\n",
> > > +			report_max_point, ilitek_data->max_tp);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	count = CEIL(report_max_point, packet_max_point);
> > > +	for (i = 1; i < count; i++) {
> > > +		ret = ilitek_i2c_write_and_read(ilitek_data, NULL, 0, 0,
> > > +			buf + i * 64, 64);
> > > +		if (ret < 0) {
> > > +			dev_err(dev, "get touch info. err, count=%d\n", count);
> > > +			goto err_release_touch_and_key;
> > > +		}
> > > +	}
> > 
> > This means you have 1 + count transactions on i2c bus. Have you
> > considered reading max number of bytes in one transaction, and then soft
> > out how much of received data is valid?
> > 
> 
> Due to limitation on FW of touch device, data byte for each I2C transaction
> is limited. It would lead to I2C communication issue when large count of bytes
> are request.
> 
> Also, for only a few touch points,
> It should be less efficient to query max number of bytes.

I was thinking about having one read transaction for up to <max bytes
your devices can transmit>, then look at the header and decide how many,
if any, more requests you would need to issue. This way for majority of
cases I believe you would need only one read per interrupt.

> 
> > > +
> > > +	for (i = 0; i < report_max_point; i++) {
> > > +		status = buf[i * packet_len + 1] & 0x40;
> > > +		id = buf[i * packet_len + 1] & 0x3F;
> > > +
> > > +		if (!status) {
> > > +			release_point++;
> > > +			ilitek_touch_release(ilitek_data, id);
> > > +			continue;
> > > +		}
> > > +
> > > +		x = (buf[i * packet_len + 3] << 8) + buf[i * packet_len + 2];
> > > +		y = (buf[i * packet_len + 5] << 8) + buf[i * packet_len + 4];
> > 
> > 		x = le16_to_cpup(....);
> > 
> > Please adjust here and elsewhere. Also, if data may be unaligned, please
> > use get_unaligned_le16() instead.
> > 
> 
> Agreed; will check and update elsewhere in v4.
> 
> > > +
> > > +		if (!ilitek_data->is_touched)
> > > +			ilitek_key_down(ilitek_data, x, y);
> > > +
> > > +		if (!ilitek_data->touch_key_hold_press) {
> > > +			if (x > ilitek_data->screen_max_x ||
> > > +			    y > ilitek_data->screen_max_y ||
> > > +			    x < ilitek_data->screen_min_x ||
> > > +			    y < ilitek_data->screen_min_y)
> > > +				continue;
> > > +
> > > +			ilitek_touch_down(ilitek_data, id, x, y, p, h, w);
> > > +		} else {
> > > +			ilitek_key_release(ilitek_data, x, y, 1);
> > > +		}
> > > +	}
> > > +
> > > +	if (release_point == report_max_point) {
> > > +		ilitek_touch_release_all(ilitek_data);
> > > +		ilitek_key_release(ilitek_data, 0, 0, 0);
> > > +		ilitek_data->is_touched = false;
> > > +	}
> > > +	input_sync(input);
> > > +	return 0;
> > > +
> > > +err_release_touch_and_key:
> > > +	ilitek_touch_release_all(ilitek_data);
> > > +	ilitek_key_release(ilitek_data, 0, 0, 0);
> > > +	ilitek_data->is_touched = false;
> > > +	input_sync(input);
> > > +	return ret;
> > > +}
> > > +
> > > +
> > > +/* APIs of cmds for ILITEK Touch IC */
> > > +static int api_protocol_set_cmd(struct ilitek_ts_data *ilitek_data,
> > > +				u16 idx, u8 *inbuf, u8 *outbuf)
> > > +{
> > > +	u16 cmd;
> > > +	int ret = 0;
> > > +
> > > +	if (!ilitek_data || !ilitek_data->ptl_cb_func)
> > > +		return -EINVAL;
> > > +
> > > +	if (idx >= MAX_CMD_CNT)
> > > +		return -EINVAL;
> > > +
> > > +	cmd = ilitek_data->ptl_cb_func[idx].cmd;
> > > +	ret = ilitek_data->ptl_cb_func[idx].func(ilitek_data, cmd,
> > > +						 inbuf, outbuf);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int api_protocol_get_ptl_ver(struct ilitek_ts_data *ilitek_data,
> > > +				    u16 cmd, u8 *inbuf, u8 *outbuf)
> > > +{
> > > +	int ret = 0;
> > > +	u8 buf[64] = {0};
> > > +
> > > +	if (!ilitek_data)
> > > +		return -EINVAL;
> > > +
> > > +	buf[0] = cmd;
> > > +	ret = ilitek_i2c_write_and_read(ilitek_data, buf, 1, 5, outbuf, 3);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ilitek_data->ptl.ver = (outbuf[0] << 16) + (outbuf[1] << 8);
> > > +	ilitek_data->ptl.ver_major = outbuf[0];
> > > +	ilitek_data->ptl.ver_mid = outbuf[1];
> > > +	ilitek_data->ptl.ver_minor = outbuf[2];
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int api_protocol_get_mcu_ver(struct ilitek_ts_data *ilitek_data,
> > > +				    u16 cmd, u8 *inbuf, u8 *outbuf)
> > > +{
> > > +	int ret = 0;
> > > +	u8 buf[64] = {0};
> > > +
> > > +	if (!ilitek_data)
> > > +		return -EINVAL;
> > > +
> > > +	buf[0] = ILITEK_TP_CMD_GET_MCU_VER;
> > > +	ret = ilitek_i2c_write_and_read(ilitek_data, buf, 1, 5, outbuf, 32);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	memcpy(ilitek_data->mcu_ver, outbuf, 2);
> > > +	memset(ilitek_data->product_id, 0, sizeof(ilitek_data->product_id));
> > > +	memcpy(ilitek_data->product_id, outbuf+6, 26);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int api_protocol_get_fw_ver(struct ilitek_ts_data *ilitek_data,
> > > +				   u16 cmd, u8 *inbuf, u8 *outbuf)
> > > +{
> > > +	int ret = 0;
> > > +	u8 buf[64] = {0};
> > > +
> > > +	if (!ilitek_data)
> > > +		return -EINVAL;
> > > +
> > > +	buf[0] = ILITEK_TP_CMD_GET_FW_VER;
> > > +	ret = ilitek_i2c_write_and_read(ilitek_data, buf, 1, 5, outbuf, 8);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	memcpy(ilitek_data->firmware_ver, outbuf, 8);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int api_protocol_get_scrn_res(struct ilitek_ts_data *ilitek_data,
> > > +				     u16 cmd, u8 *inbuf, u8 *outbuf)
> > > +{
> > > +	int ret = 0;
> > > +	u8 buf[64] = {0};
> > > +
> > > +	if (!ilitek_data)
> > > +		return -EINVAL;
> > > +
> > > +	buf[0] = ILITEK_TP_CMD_GET_SCRN_RES;
> > > +	ret = ilitek_i2c_write_and_read(ilitek_data, buf, 1, 5, outbuf, 8);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ilitek_data->screen_min_x = (outbuf[1] << 8) + outbuf[0];
> > > +	ilitek_data->screen_min_y = (outbuf[3] << 8) + outbuf[2];
> > > +	ilitek_data->screen_max_x = (outbuf[5] << 8) + outbuf[4];
> > > +	ilitek_data->screen_max_y = (outbuf[7] << 8) + outbuf[6];
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int api_protocol_get_key_info_v6(struct ilitek_ts_data *ilitek_data,
> > > +					u16 cmd, u8 *inbuf, u8 *outbuf)
> > > +{
> > > +	int ret = 0, i = 0;
> > > +	u8 buf[64] = {0};
> > > +
> > > +	if (!ilitek_data)
> > > +		return -EINVAL;
> > > +
> > > +	if (ilitek_data->keycount > ILITEK_SUPPORT_MAX_KEY_CNT)
> > > +		return -EINVAL;
> > > +
> > > +	buf[0] = ILITEK_TP_CMD_GET_KEY_INFO;
> > > +	ret = ilitek_i2c_write_and_read(ilitek_data, buf, 1, 10,
> > > +					outbuf, ilitek_data->keycount * 5 + 5);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ilitek_data->key_xlen = (outbuf[2] << 8) + outbuf[1];
> > > +	ilitek_data->key_ylen = (outbuf[4] << 8) + outbuf[3];
> > > +
> > > +	for (i = 0; i < ilitek_data->keycount; i++) {
> > > +		ilitek_data->keyinfo[i].id = outbuf[i * 5 + 5];
> > > +		ilitek_data->keyinfo[i].x = (outbuf[i * 5 + 7] << 8) +
> > > +					    outbuf[i * 5 + 6];
> > > +		ilitek_data->keyinfo[i].y = (outbuf[i * 5 + 9] << 8) +
> > > +					    outbuf[i * 5 + 8];
> > > +		ilitek_data->keyinfo[i].status = 0;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int api_protocol_get_tp_res_v6(struct ilitek_ts_data *ilitek_data,
> > > +				      u16 cmd, u8 *inbuf, u8 *outbuf)
> > > +{
> > > +	int ret = 0;
> > > +	u8 buf[64] = {0};
> > > +
> > > +	if (!ilitek_data)
> > > +		return -EINVAL;
> > > +
> > > +	buf[0] = ILITEK_TP_CMD_GET_TP_RES;
> > > +	ret = ilitek_i2c_write_and_read(ilitek_data, buf, 1, 5, outbuf, 15);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ilitek_data->tp_max_x = (outbuf[1] << 8) + outbuf[0];
> > > +	ilitek_data->tp_max_y = (outbuf[3] << 8) + outbuf[2];
> > > +	ilitek_data->x_ch = (outbuf[5] << 8) + outbuf[4];
> > > +	ilitek_data->y_ch = (outbuf[7] << 8) + outbuf[6];
> > > +	ilitek_data->max_tp = outbuf[8];
> > > +	ilitek_data->keycount = outbuf[9];
> > > +	ilitek_data->slave_count = outbuf[10];
> > > +	ilitek_data->format = outbuf[12];
> > > +
> > > +	if (ilitek_data->keycount > ILITEK_SUPPORT_MAX_KEY_CNT) {
> > > +		dev_err(&ilitek_data->client->dev, "Invalid KEY count:%d from FW\n",
> > > +			ilitek_data->keycount);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	if (ilitek_data->keycount > 0) {
> > > +		ret = api_protocol_set_cmd(ilitek_data, GET_KEY_INFO,
> > > +					   NULL, outbuf);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +	}
> > > +
> > > +	if (ilitek_data->max_tp > ILITEK_SUPPORT_MAX_POINT) {
> > > +		dev_err(&ilitek_data->client->dev, "Invalid MAX_TP:%d from FW\n",
> > > +			ilitek_data->max_tp);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int api_protocol_get_ic_mode(struct ilitek_ts_data *ilitek_data,
> > > +				    u16 cmd, u8 *inbuf, u8 *outbuf)
> > > +{
> > > +	int ret = 0;
> > > +	u8 buf[64] = {0};
> > > +
> > > +	if (!ilitek_data)
> > > +		return -EINVAL;
> > > +
> > > +	buf[0] = ILITEK_TP_CMD_GET_IC_MODE;
> > > +	ret = ilitek_i2c_write_and_read(ilitek_data, buf, 1, 5, outbuf, 2);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ilitek_data->ic_mode = outbuf[0];
> > > +	return ret;
> > > +}
> > > +
> > > +struct PROTOCOL_MAP ptl_func_map_v3[] = {
> > > +	{ /* V3 cmds */},
> > > +};
> > > +
> > > +struct PROTOCOL_MAP ptl_func_map_v6[] = {
> > > +	[GET_PTL_VER]	= {ILITEK_TP_CMD_GET_PRL_VER, "GET_PTL_VER",
> > > +			   api_protocol_get_ptl_ver},
> > > +	[GET_FW_VER]	= {ILITEK_TP_CMD_GET_FW_VER, "GET_FW_VER",
> > > +			   api_protocol_get_fw_ver},
> > > +	[GET_SCRN_RES]	= {ILITEK_TP_CMD_GET_SCRN_RES, "GET_SCRN_RES",
> > > +			   api_protocol_get_scrn_res},
> > > +	[GET_TP_RES]	= {ILITEK_TP_CMD_GET_TP_RES, "GET_TP_RES",
> > > +			   api_protocol_get_tp_res_v6},
> > > +	[GET_IC_MODE]	= {ILITEK_TP_CMD_GET_IC_MODE, "GET_IC_MODE",
> > > +			   api_protocol_get_ic_mode},
> > > +	[GET_MCU_VER]	= {ILITEK_TP_CMD_GET_MCU_VER, "GET_MOD_NAME",
> > > +			   api_protocol_get_mcu_ver},
> > > +	[GET_KEY_INFO]	= {ILITEK_TP_CMD_GET_KEY_INFO, "GET_KEY_INFO",
> > > +			   api_protocol_get_key_info_v6},
> > > +};
> > > +
> > > +/* Probe APIs */
> > > +static int ilitek_request_gpio(struct device *dev,
> > > +			       struct ilitek_ts_data *ilitek_data)
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	if (!dev || !ilitek_data)
> > > +		return -EINVAL;
> > > +
> > > +	ilitek_data->reset_gpio = gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > > +	if (IS_ERR(ilitek_data->reset_gpio)) {
> > > +		ret = PTR_ERR(ilitek_data->reset_gpio);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void ilitek_reset(struct ilitek_ts_data *ilitek_data,
> > > +			 int delay, bool boot)
> > > +{
> > > +	bool init_stats = ilitek_data->irq_status;
> > > +
> > > +	if (!boot)
> > > +		ilitek_irq_disable(ilitek_data);
> > > +
> > > +	if (ilitek_data->reset_gpio) {
> > > +		gpiod_set_value(ilitek_data->reset_gpio, 1);
> > > +		mdelay(10);
> > > +
> > > +		gpiod_set_value(ilitek_data->reset_gpio, 0);
> > > +		mdelay(10);
> > > +
> > > +		gpiod_set_value(ilitek_data->reset_gpio, 1);
> > > +		mdelay(delay);
> > 
> > I do not believe you mean to leave reset line activei here. Remember,
> > gpiod is logical API, with 1 representing line being active, and 0 -
> > inactive.  gpiolib internally takes into account line polarity, so for
> > active-low GPIOs gpiod_set_value(gpio, 1) will drive the line low.
> 
> Agreed; reset pin should reset touch device when pin logically be low.
> Should modified bindings to be active-low.
> Then leave reset line inactive here after reset.
> Should be updated in v4.
> 
> > 
> > > +	}
> > > +
> > > +	if (!boot && init_stats)
> > > +		ilitek_irq_enable(ilitek_data);
> > > +}
> > > +
> > > +static int ilitek_protocol_init(struct ilitek_ts_data *ilitek_data)
> > > +{
> > > +	int ret = 0;
> > > +	u8 outbuf[64] = {0};
> > > +
> > > +	if (!ilitek_data)
> > > +		return -EINVAL;
> > 
> > How can it be NULL?
> 
> It should not be NULL in current patch.
> Should be removed it and elsewhere below in v4.
> > 
> > > +
> > > +	ilitek_data->ptl_cb_func = ptl_func_map_v6;
> > > +
> > > +	ret = api_protocol_set_cmd(ilitek_data, GET_PTL_VER, NULL, outbuf);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	if (ilitek_data->ptl.ver_major == 0x3 ||
> > > +	    ilitek_data->ptl.ver == BL_V1_6 ||
> > > +	    ilitek_data->ptl.ver == BL_V1_7) {
> > > +		ilitek_data->process_and_report = NULL;
> > > +		ilitek_data->ptl_cb_func = NULL;
> > > +		ilitek_data->reset_time = 200;
> > > +	} else {
> > > +		ilitek_data->process_and_report = ilitek_process_and_report_v6;
> > > +		ilitek_data->ptl_cb_func = ptl_func_map_v6;
> > > +		ilitek_data->reset_time = 600;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int ilitek_read_tp_info(struct ilitek_ts_data *ilitek_data, bool boot)
> > > +{
> > > +	u8 outbuf[256] = {0};
> > > +
> > > +	if (api_protocol_set_cmd(ilitek_data, GET_PTL_VER, NULL, outbuf) < 0)
> > > +		return -EFAULT;
> > > +	if (api_protocol_set_cmd(ilitek_data, GET_MCU_VER, NULL, outbuf) < 0)
> > > +		return -EFAULT;
> > > +	if (api_protocol_set_cmd(ilitek_data, GET_FW_VER, NULL, outbuf) < 0)
> > > +		return -EFAULT;
> > > +	if (boot && api_protocol_set_cmd(ilitek_data, GET_SCRN_RES, NULL,
> > > +					 outbuf) < 0)
> > > +		return -EFAULT;
> > > +	if (api_protocol_set_cmd(ilitek_data, GET_TP_RES, NULL, outbuf) < 0)
> > > +		return -EFAULT;
> > > +	if (api_protocol_set_cmd(ilitek_data, GET_IC_MODE, NULL, outbuf) < 0)
> > > +		return -EFAULT;
> > 
> > EFAULT is weird error code to be used here, maybe EIO or EINVAL?
> 
> Agreed; will refactor it and return error code from api_* func. directly.
> 
> > 
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int ilitek_input_dev_init(struct device *dev,
> > > +				 struct ilitek_ts_data *ilitek_data)
> > > +{
> > > +	int ret = 0, i = 0;
> > > +	struct input_dev *input = NULL;
> > > +
> > > +	if (!dev || !ilitek_data)
> > > +		return -EINVAL;
> > 
> > How can either these 2 be NULL?
> 
> It should not be NULL in current patch.
> Should be removed in v4.
> 
> > 
> > > +
> > > +	input  = input_allocate_device();
> > > +	if (!input)
> > > +		return -ENOMEM;
> > > +
> > > +	input->name = ILITEK_TS_NAME;
> > > +	input->id.bustype = BUS_I2C;
> > > +
> > > +	__set_bit(INPUT_PROP_DIRECT, input->propbit);
> > > +	input->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
> > > +	input->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
> > > +
> > > +	input_set_abs_params(input, ABS_MT_POSITION_X,
> > > +			     ilitek_data->screen_min_x,
> > > +			     ilitek_data->screen_max_x, 0, 0);
> > > +	input_set_abs_params(input, ABS_MT_POSITION_Y,
> > > +			     ilitek_data->screen_min_y,
> > > +			     ilitek_data->screen_max_y, 0, 0);
> > > +	input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
> > > +	input_set_abs_params(input, ABS_MT_WIDTH_MAJOR, 0, 255, 0, 0);
> > 
> > Please support common touchscreen properties by using
> > touchscreen_parse_properties() and then touchscreen_set_mt_pos() and/or
> > touchscreen_report_pos() when reporting contacts.
> 
> Agreed; should update driver flow and bindings in v4.
> 
> > 
> > > +
> > > +	input_mt_init_slots(input, ilitek_data->max_tp, INPUT_MT_DIRECT);
> > 
> > This needs error handling.
> 
> Agreed; will update in v4.
> 
> > 
> > > +
> > > +	for (i = 0; i < ilitek_data->keycount; i++)
> > > +		set_bit(ilitek_data->keyinfo[i].id & KEY_MAX, input->keybit);
> > 
> > As I mentioned, soft keys are better handled in userspace.
> 
> As replied above, FW of touch device could report key id and region.
> Is it not feasible for a touchscreen driver do key handling?
> 
> > 
> > > +
> > > +	ret = input_register_device(input);
> > > +	if (ret)
> > > +		dev_err(dev, "failed to register input device, err:%d\n", ret);
> > > +
> > > +	ilitek_data->input_dev = input;
> > > +	return ret;
> > > +}
> > > +
> > > +static irqreturn_t ilitek_i2c_isr(int irq, void *dev_id)
> > > +{
> > > +	struct ilitek_ts_data *ilitek_data = dev_id;
> > > +	int ret = 0;
> > > +
> > > +	if (!ilitek_data->process_and_report) {
> > > +		dev_err(&ilitek_data->client->dev, "report touch cb is NULL\n");
> > 
> > How can this happen?
> 
> This driver should support two different protocol formats.
> One for 231X/251X, the other for Lego 213X/2316/232X/252X.
> This patch currently support Lego series, assigned in ilitek_protocol_init()
> Then assign null func. ptr for the other one protocol format.
> 
> > 
> > > +		return IRQ_NONE;
> > > +	}
> > > +
> > > +	ilitek_irq_disable(ilitek_data);
> > 
> > You are in the interrupt handler, why do you need to disable interrupts?
> > Current one will not be acknowledged until you return from ISR.
> 
> To make sure IRQ number is disabled during ISR handling and avoid
> ISR re-entry, and the IRQ is requested as one-shot; there should be
> no need for irq number disable.
> 
> Agreed; should remove it and update in v4.
> 
> > 
> > > +	mutex_lock(&ilitek_data->ilitek_mutex);
> > 
> > What does this mutex protect?
> 
> Mutex protect I2C write cmd and read data in concurrent situation.
> Such as getting X/Y pos. data in IRQ handling and querying FW info.
> It may result in double I2C write cmds, then read unexpected data.
> 
> However, current patch should not generate I2C concurrent situation.
> (already remove the querying FW versiom from I2C comm.)
> I think it could be removed, and patched if needed afterward.
> Will update in v4.
> 
> > 
> > > +	ret = ilitek_data->process_and_report(ilitek_data);
> > > +	mutex_unlock(&ilitek_data->ilitek_mutex);
> > > +	ilitek_irq_enable(ilitek_data);
> > > +
> > > +	if (ret < 0) {
> > > +		dev_err(&ilitek_data->client->dev, "process and report point failed, err:%d\n",
> > > +			ret);
> > > +		return IRQ_NONE;
> > > +	}
> > > +
> > > +	return IRQ_HANDLED;
> > > +}
> > > +
> > > +static int ilitek_request_irq(struct device *dev,
> > > +			      struct ilitek_ts_data *ilitek_data)
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	spin_lock_init(&ilitek_data->irq_lock);
> > > +	ilitek_data->irq_status = true;
> > > +
> > > +	ret = request_threaded_irq(ilitek_data->client->irq, NULL,
> > > +				   ilitek_i2c_isr,
> > > +				   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> > 
> > Please reply on platform (ACPI, DT, etc) to set up proper trigger for
> > the interrupt line. Additionally, you should prefer having level
> > interrupt, rather than edge, or you risk missing interrupts.
> 
> Agreed; will update here in v4.
> Also, bindings will be modified to active_level_low in v4.
> 
> > > +				   "ilitek_touch_irq", ilitek_data);
> > > +	if (ret)
> > > +		dev_err(dev, "request threaded irq failed, err:%d\n", ret);
> > 
> > I am not sure what is the value of this wrapper.
> 
> It put irq-related manipulation together from probe flow.
> And agreed; it's less necessary.
> Will remove this wrapper in v4.
> 
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static ssize_t firmware_version_show(struct device *dev,
> > > +				     struct device_attribute *attr, char *buf)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct ilitek_ts_data *ilitek_data = i2c_get_clientdata(client);
> > > +	int ret = 0;
> > > +	u8 outbuf[64] = {0};
> > > +
> > > +	ilitek_irq_disable(ilitek_data);
> > > +	mutex_lock(&ilitek_data->ilitek_mutex);
> > > +	ret = api_protocol_set_cmd(ilitek_data, GET_FW_VER, NULL, outbuf);
> > 
> > Do you need to query this all the time? Is it possible to collect this
> > data at boot or after firmware flash and store for subsequent use?
> 
> Agreed; just return the stored FW version (queried at boot or after FW update).
> The same modification in showing product_id below.
> Will update in v4.
> 
> [Question]
> Is it a kind of consensus that don't do I2C transaction from show/read function via "cat"?

It just seems simpler to me to do this once at probe time, since it is
not going to change unless firmware is updated. If amount of data was
large, I'd consider querying it dynamically in show() as then it would
be more expensive memory-wise to store it on the off-chance userspace
might want to see it.

> 
> > > +	mutex_unlock(&ilitek_data->ilitek_mutex);
> > > +	ilitek_irq_enable(ilitek_data);
> > > +
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "api set cmd failed, err:%d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return scnprintf(buf, PAGE_SIZE,
> > > +			 "ILITEK FW ver: %d.%d.%d.%d.%d.%d.%d.%d\n",
> > > +			 ilitek_data->firmware_ver[0],
> > > +			 ilitek_data->firmware_ver[1],
> > > +			 ilitek_data->firmware_ver[2],
> > > +			 ilitek_data->firmware_ver[3],
> > > +			 ilitek_data->firmware_ver[4],
> > > +			 ilitek_data->firmware_ver[5],
> > > +			 ilitek_data->firmware_ver[6],
> > > +			 ilitek_data->firmware_ver[7]);
> > > +}
> > > +static DEVICE_ATTR_RO(firmware_version);
> > > +
> > > +static ssize_t product_id_show(struct device *dev,
> > > +			       struct device_attribute *attr, char *buf)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct ilitek_ts_data *ilitek_data = i2c_get_clientdata(client);
> > > +	int ret = 0;
> > > +	u8 outbuf[64] = {0};
> > > +
> > > +	ilitek_irq_disable(ilitek_data);
> > > +	mutex_lock(&ilitek_data->ilitek_mutex);
> > > +	ret = api_protocol_set_cmd(ilitek_data, GET_MCU_VER, NULL, outbuf);
> > > +	mutex_unlock(&ilitek_data->ilitek_mutex);
> > > +	ilitek_irq_enable(ilitek_data);
> > > +
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "api set cmd failed, err:%d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return scnprintf(buf, PAGE_SIZE, "MCU: %s\n", ilitek_data->product_id);
> > > +}
> > > +static DEVICE_ATTR_RO(product_id);
> > > +
> > > +static struct attribute *ilitek_sysfs_attrs[] = {
> > > +	&dev_attr_firmware_version.attr,
> > > +	&dev_attr_product_id.attr,
> > > +	NULL
> > > +};
> > > +
> > > +static struct attribute_group ilitek_attrs_group[] = {
> > > +	{.attrs = ilitek_sysfs_attrs},
> > > +};
> > > +
> > > +static int ilitek_create_sysfsnode(struct device *dev)
> > > +{
> > > +	int ret = 0;
> > > +
> > > +	ret = sysfs_create_group(&dev->kobj, ilitek_attrs_group);
> > > +	if (ret)
> > > +		dev_err(dev, "sysfs create group failed, err:%d\n", ret);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int ilitek_ts_i2c_probe(struct i2c_client *client,
> > > +			       const struct i2c_device_id *id)
> > > +{
> > > +	struct ilitek_ts_data *ilitek_data = NULL;
> > > +	struct device *dev = &client->dev;
> > > +	int ret = 0;
> > > +
> > > +	ilitek_data = kzalloc(sizeof(*ilitek_data), GFP_KERNEL);
> > > +	if (!ilitek_data)
> > > +		return -ENOMEM;
> > 
> > Please use devm APIs to make sure resources are freed automatically
> > after errors. It will also allow you to get rid of
> > ilitek_ts_i2c_remove().
> 
> Agreed; will update probe and remove function in v4.
> 
> > > +
> > > +	ilitek_data->client = client;
> > > +	i2c_set_clientdata(client, ilitek_data);
> > > +
> > > +	mutex_init(&ilitek_data->ilitek_mutex);
> > > +
> > > +	ret = ilitek_request_gpio(dev, ilitek_data);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "request gpio failed, err:%d", ret);
> > > +		goto err_put_gpiod;
> > > +	}
> > > +
> > > +	ilitek_reset(ilitek_data, 1000, true);
> > > +	ret = ilitek_protocol_init(ilitek_data);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "protocol init failed, err:%d", ret);
> > > +		goto err_put_gpiod;
> > > +	}
> > > +
> > > +	ret = ilitek_read_tp_info(ilitek_data, true);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "read tp info failed, err:%d", ret);
> > > +		goto err_put_gpiod;
> > > +	}
> > > +
> > > +	ret = ilitek_input_dev_init(dev, ilitek_data);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "input dev init failed, err:%d", ret);
> > > +		goto err_free_input_dev;
> > > +	}
> > > +
> > > +	ret = ilitek_request_irq(dev, ilitek_data);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "request irq failed, err:%d", ret);
> > > +		goto err_free_input_dev;
> > > +	}
> > > +
> > > +	ret = ilitek_create_sysfsnode(dev);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "create sysfs node failed, err:%d", ret);
> > > +		goto err_free_irq;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +err_free_irq:
> > > +	free_irq(ilitek_data->client->irq, ilitek_data);
> > > +
> > > +	input_unregister_device(ilitek_data->input_dev);
> > > +err_free_input_dev:
> > > +	if (ilitek_data->input_dev)
> > > +		input_free_device(ilitek_data->input_dev);
> > > +err_put_gpiod:
> > > +	if (!IS_ERR(ilitek_data->reset_gpio))
> > > +		gpiod_put(ilitek_data->reset_gpio);
> > > +	kfree(ilitek_data);
> > > +	return ret;
> > > +}
> > > +
> > > +static int ilitek_ts_i2c_remove(struct i2c_client *client)
> > > +{
> > > +	struct device *dev = &client->dev;
> > > +	struct ilitek_ts_data *ilitek_data = i2c_get_clientdata(client);
> > > +
> > > +	sysfs_remove_group(&dev->kobj, ilitek_attrs_group);
> > > +
> > > +	free_irq(ilitek_data->client->irq, ilitek_data);
> > > +
> > > +	input_unregister_device(ilitek_data->input_dev);
> > > +
> > > +	if (!IS_ERR(ilitek_data->reset_gpio))
> > > +		gpiod_put(ilitek_data->reset_gpio);
> > > +
> > > +	kfree(ilitek_data);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct i2c_device_id ilitek_ts_i2c_id[] = {
> > > +	{ILITEK_TS_NAME, 0},
> > > +	{ /* not omitted */ },
> > 
> > What does "not omitted" mean in this context?
> 
> It reminds developers that the empty brackets should not be removed.
> Will remove the comment in v4.

I think typical notation is "{ /* sentinel */ }" for this.

> 
> > > +};
> > > +MODULE_DEVICE_TABLE(i2c, ilitek_ts_i2c_id);
> > > +
> > > +#ifdef CONFIG_ACPI
> > > +static const struct acpi_device_id ilitekts_acpi_id[] = {
> > > +	{ "ILTK0001", 0 },
> > > +	{ /* not omitted */ },
> > > +};
> > > +MODULE_DEVICE_TABLE(acpi, ilitekts_acpi_id);
> > > +#endif
> > > +
> > > +#ifdef CONFIG_OF
> > > +static const struct of_device_id ilitek_ts_i2c_match[] = {
> > > +	{.compatible = "ilitek,ili2520",},
> > > +	{.compatible = "ilitek,ili2510",},
> > > +	{ /* not omitted */ },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, ilitek_ts_i2c_match);
> > > +#endif
> > > +
> > > +static struct i2c_driver ilitek_ts_i2c_driver = {
> > > +	.driver = {
> > > +		.name = ILITEK_TS_NAME,
> > > +		.owner = THIS_MODULE,
> > 
> > No need to set owner.
> 
> Agreed; will update.
> 
> > > +		.of_match_table = of_match_ptr(ilitek_ts_i2c_match),
> > > +		.acpi_match_table = ACPI_PTR(ilitekts_acpi_id),
> > 
> > You need power management (suspend/resume) handling too.
> > 
> 
> Agreed; will update.
> 
> > > +	},
> > > +	.probe = ilitek_ts_i2c_probe,
> > > +	.remove = ilitek_ts_i2c_remove,
> > > +	.id_table = ilitek_ts_i2c_id,
> > > +};
> > > +
> > > +module_i2c_driver(ilitek_ts_i2c_driver);
> > > +
> > > +MODULE_AUTHOR("ILITEK");
> > > +MODULE_DESCRIPTION("ILITEK I2C Touchscreen Driver");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.25.1
> > > 
> > > 
> > 
> > Thanks.
> > 
> > -- 
> > Dmitry
> 
> Many thanks,
> 
> --
> Joe Hung

Thank you.

-- 
Dmitry
