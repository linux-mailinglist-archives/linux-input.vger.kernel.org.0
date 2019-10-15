Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED51D8260
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2019 23:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730500AbfJOVrI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Oct 2019 17:47:08 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33187 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730498AbfJOVrH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Oct 2019 17:47:07 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so13340445pfl.0;
        Tue, 15 Oct 2019 14:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=GoNwusyxvoAkXqMriEYK+K+VCrHUKmhN8wx12bUTIdg=;
        b=P5cv5RWiztfn9m/KfSUXxlpG7g7gZgCf3RoeEB8AnLmyQZFZAPbth5bDZT6n+eUv9p
         xVICZ7LGfcDtSth+6ZQZJITvwmxV8xM2AEMfbSuhCQ1m8a1HfETZBJh9bC3Z4j+f3G6E
         HiVeuoktN2xTl/OIQ0PaTrjy5Rc5Z/r7VuEqYLLubRzWMPjQGIVewso+z2C66kViXg5u
         upEmDIZeXWWW535N675fyq/YdPraNtnqVf4RFhtJRgMRframyZ0ATLn1v/Z0sK/drHLs
         GJCcZIzMQhbfU9jfTXLjaehI2mZ8sos+ryYRe9oCUFxxBhsKIW71Vkx71oXleio6hvcK
         pzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GoNwusyxvoAkXqMriEYK+K+VCrHUKmhN8wx12bUTIdg=;
        b=mvHNKYMQlHRSv0SIburQX/bKUacqtW1o4LPfpCoyyVN+ueaIbIkOWeE6j5Uo4YXnrv
         JMBMW84L93pcNHsuD7h1JJVY9NxdlVQ6EPO6xJZnFEZnJKiB9+Cxj036V3kT12frWPF4
         U7xITwj/dtotYQ8gNh7za0gK0j7uaC6pDtgGShHgIyKJJHVQrhpMmJPb4ppmpSE/6KOH
         d3fSvxMJIWFmNujL98B7uvvyoiGHPES2zBOukE8m3MKTAEjIJq5ZJsE9o/kLzzI7+/So
         PdNFqGLVataS3L490JF5XO+92VSelc8XMTecU0SQQpuF8H1ocyBP7FV5GTsdQSqUtm6p
         xX/w==
X-Gm-Message-State: APjAAAUXRjTyButM4Xhb/eZeS/Sjosu5u4vO68mZxesdf+iE/QET4TSr
        nlCN5ju9gPyeubX9WNmrBcM=
X-Google-Smtp-Source: APXvYqwUWsNm3gZAPu4vylJ0gWSLc4tHY6fRovPVLtxwVLs0Gk4VB+t5W3nCUP2EvyMRcuSytTdbVQ==
X-Received: by 2002:a17:90a:c48:: with SMTP id u8mr840264pje.16.1571176024630;
        Tue, 15 Oct 2019 14:47:04 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id k95sm268357pje.10.2019.10.15.14.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 14:47:03 -0700 (PDT)
Date:   Tue, 15 Oct 2019 14:47:01 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     michael.srba@seznam.cz
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: add zinitix touchscreen driver
Message-ID: <20191015214701.GI105649@dtor-ws>
References: <20191012192739.10261-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191012192739.10261-1-michael.srba@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Michael,

On Sat, Oct 12, 2019 at 09:27:38PM +0200, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> Add support for the bt541 touchscreen IC from zinitix, loosely based
> on downstream driver. The driver currently supports multitouch (5 touch points).
> The bt541 seems to support touch keys, but the support was not added because 
> that functionality is not being utilized by the touchscreen used for testing.
> Based on the similartities between downstream drivers, it seems likely that 
> other similar touchscreen ICs can be supported with this driver in the future.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> ---
>  bt541 is used in the Samsung Galaxy A3 (2015) that has recently gained 
>  mainline support [1].
> 
>  The downstream driver this is loosely based on: 
>  https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/tree/SM-A300FU/drivers/input/touchscreen/zinitix
> 
>  [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1329c1ab0730b521e6cd3051c56a2ff3d55f21e6
> 
>  drivers/input/touchscreen/Kconfig   |  12 +
>  drivers/input/touchscreen/Makefile  |   1 +
>  drivers/input/touchscreen/zinitix.c | 508 ++++++++++++++++++++++++++++
>  3 files changed, 521 insertions(+)
>  create mode 100644 drivers/input/touchscreen/zinitix.c
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index 46ad9090493b..6203e0764d5f 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -1314,4 +1314,16 @@ config TOUCHSCREEN_IQS5XX
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called iqs5xx.
>  
> +config TOUCHSCREEN_ZINITIX
> +	tristate "Zinitix touchscreen support"
> +	depends on I2C
> +	help
> +	  Say Y here if you have a touchscreen using Zinitix bt541,
> +	  or something similar enough.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called zinitix.
> +
>  endif
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index 94c6162409b3..bafe9d76ed03 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -110,3 +110,4 @@ obj-$(CONFIG_TOUCHSCREEN_COLIBRI_VF50)	+= colibri-vf50-ts.o
>  obj-$(CONFIG_TOUCHSCREEN_ROHM_BU21023)	+= rohm_bu21023.o
>  obj-$(CONFIG_TOUCHSCREEN_RASPBERRYPI_FW)	+= raspberrypi-ts.o
>  obj-$(CONFIG_TOUCHSCREEN_IQS5XX)	+= iqs5xx.o
> +obj-$(CONFIG_TOUCHSCREEN_ZINITIX)	+= zinitix.o
> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
> new file mode 100644
> index 000000000000..55b1816b39d4
> --- /dev/null
> +++ b/drivers/input/touchscreen/zinitix.c
> @@ -0,0 +1,508 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/kernel.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <asm/unaligned.h>
> +
> +/* Register Map */
> +
> +#define BT541_SWRESET_CMD			0x0000
> +#define BT541_WAKEUP_CMD			0x0001
> +
> +#define BT541_IDLE_CMD				0x0004
> +#define BT541_SLEEP_CMD				0x0005
> +
> +#define BT541_CLEAR_INT_STATUS_CMD		0x0003
> +#define BT541_CALIBRATE_CMD			0x0006
> +#define BT541_SAVE_STATUS_CMD			0x0007
> +#define BT541_SAVE_CALIBRATION_CMD		0x0008
> +#define BT541_RECALL_FACTORY_CMD		0x000f
> +
> +#define BT541_THRESHOLD				0x0020
> +
> +#define BT541_LARGE_PALM_REJECT_AREA_TH		0x003F
> +
> +#define BT541_DEBUG_REG				0x0115 /* 0~7 */
> +
> +#define BT541_TOUCH_MODE			0x0010
> +#define BT541_CHIP_REVISION			0x0011
> +#define BT541_FIRMWARE_VERSION			0x0012
> +
> +#define ZINITIX_USB_DETECT			0x116
> +
> +#define BT541_MINOR_FW_VERSION			0x0121
> +
> +#define BT541_VENDOR_ID				0x001C
> +#define BT541_HW_ID				0x0014
> +
> +#define BT541_DATA_VERSION_REG			0x0013
> +#define BT541_SUPPORTED_FINGER_NUM		0x0015
> +#define BT541_EEPROM_INFO			0x0018
> +#define BT541_INITIAL_TOUCH_MODE		0x0019
> +
> +#define BT541_TOTAL_NUMBER_OF_X			0x0060
> +#define BT541_TOTAL_NUMBER_OF_Y			0x0061
> +
> +#define BT541_DELAY_RAW_FOR_HOST		0x007f
> +
> +#define BT541_BUTTON_SUPPORTED_NUM		0x00B0
> +#define BT541_BUTTON_SENSITIVITY		0x00B2
> +#define BT541_DUMMY_BUTTON_SENSITIVITY		0X00C8
> +
> +#define BT541_X_RESOLUTION			0x00C0
> +#define BT541_Y_RESOLUTION			0x00C1
> +
> +#define BT541_POINT_STATUS_REG			0x0080
> +#define BT541_ICON_STATUS_REG			0x00AA
> +
> +#define BT541_POINT_COORD_REG			(BT541_POINT_STATUS_REG + 2)
> +
> +#define BT541_AFE_FREQUENCY			0x0100
> +#define BT541_DND_N_COUNT			0x0122
> +#define BT541_DND_U_COUNT			0x0135
> +
> +#define BT541_RAWDATA_REG			0x0200
> +
> +#define BT541_EEPROM_INFO_REG			0x0018
> +
> +#define BT541_INT_ENABLE_FLAG			0x00f0
> +#define BT541_PERIODICAL_INTERRUPT_INTERVAL	0x00f1
> +
> +#define BT541_BTN_WIDTH				0x016d
> +
> +#define BT541_CHECKSUM_RESULT			0x012c
> +
> +#define BT541_INIT_FLASH			0x01d0
> +#define BT541_WRITE_FLASH			0x01d1
> +#define BT541_READ_FLASH			0x01d2
> +
> +#define ZINITIX_INTERNAL_FLAG_02		0x011e
> +#define ZINITIX_INTERNAL_FLAG_03		0x011f
> +
> +#define ZINITIX_I2C_CHECKSUM_WCNT		0x016a
> +#define ZINITIX_I2C_CHECKSUM_RESULT		0x016c
> +
> +/* Interrupt & status register flags */
> +
> +#define BIT_PT_CNT_CHANGE	BIT(0)
> +#define BIT_DOWN		BIT(1)
> +#define BIT_MOVE		BIT(2)
> +#define BIT_UP			BIT(3)
> +#define BIT_PALM		BIT(4)
> +#define BIT_PALM_REJECT		BIT(5)
> +#define BIT_RESERVED_0		BIT(6)
> +#define BIT_RESERVED_1		BIT(7)
> +#define BIT_WEIGHT_CHANGE	BIT(8)
> +#define BIT_PT_NO_CHANGE	BIT(9)
> +#define BIT_REJECT		BIT(10)
> +#define BIT_PT_EXIST		BIT(11)
> +#define BIT_RESERVED_2		BIT(12)
> +#define BIT_ERROR		BIT(13)
> +#define BIT_DEBUG		BIT(14)
> +#define BIT_ICON_EVENT		BIT(15)
> +
> +#define SUB_BIT_EXIST		BIT(0)
> +#define SUB_BIT_DOWN		BIT(1)
> +#define SUB_BIT_MOVE		BIT(2)
> +#define SUB_BIT_UP		BIT(3)
> +#define SUB_BIT_UPDATE		BIT(4)
> +#define SUB_BIT_WAIT		BIT(5)
> +
> +#define TOUCH_POINT_MODE		1
> +#define MAX_SUPPORTED_FINGER_NUM	5
> +
> +#define CHIP_ON_DELAY	15 // ms
> +#define FIRMWARE_ON_DELAY 40 // ms
> +
> +#define DELAY_FOR_TRANSACTION		50 // μs
> +#define DELAY_FOR_POST_TRANSCATION	10 // μs
> +
> +struct point_coord {
> +	__le16	x;
> +	__le16	y;
> +	u8	width;
> +	u8	sub_status;
> +	// not used on this model, but needed as padding:
> +	u8	minor_width;
> +	u8	angle;
> +} __packed;

I do not think you need to declare this as packed.

> +
> +struct point_status {
> +	__le16	status;
> +	__le16	event_flag;
> +} __packed;

And neither this.

> +
> +struct bt541_ts_data {
> +	struct i2c_client *client;
> +	struct input_dev *input_dev;
> +	struct touchscreen_properties prop;
> +	struct regulator_bulk_data supplies[2];
> +};
> +
> +static inline s32 zinitix_read_data(struct i2c_client *client,

No need to mark it inline, let's trust the compiler to do its job.
Also, it returns error code or 0, just use int for return type and not
s32.

> +				    u16 reg, u8 *values, u16 length)

Why exactly u16 for length and not int or size_t?

> +{
> +	int ret;

Let's call it "error" here and elsewhere.

> +	__le16 reg_le = cpu_to_le16(reg);
> +
> +	ret = i2c_master_send(client, (u8 *)&reg_le, sizeof(reg_le));
> +	if (ret < 0)
> +		return ret;
> +
> +	udelay(DELAY_FOR_TRANSACTION);
> +	ret = i2c_master_recv(client, values, length);
> +	if (ret < 0)

Ideally we check that if ret >= 0 but ret != length we return -EIO.

> +		return ret;
> +
> +	udelay(DELAY_FOR_POST_TRANSCATION);
> +	return 0;
> +}
> +
> +static inline s32 zinitix_write_data(struct i2c_client *client,
> +				     u16 reg, u8 *values, u16 length)
> +{
> +	int ret;
> +	u8 *packet;
> +	__le16 reg_le = cpu_to_le16(reg);
> +
> +	packet = kmalloc(length + sizeof(reg_le), GFP_KERNEL);

Need to handle memory allocation error;


> +	memcpy(packet, (u8 *)&reg_le, sizeof(reg_le));
> +	memcpy(packet + sizeof(reg_le), values, length);
> +
> +	ret = i2c_master_send(client, packet, length + sizeof(reg_le));

Since you kmalloc()ed the data you can use _dmasafe() here.

> +	kfree(packet);
> +	if (ret < 0)
> +		return ret;
> +
> +	udelay(DELAY_FOR_POST_TRANSCATION);
> +	return 0;
> +}
> +
> +static inline s32 zinitix_write_u16(struct i2c_client *client, u16 reg, u16 value)
> +{
> +	__le16 value_le = cpu_to_le16(value);
> +
> +	return zinitix_write_data(client, reg, (u8 *)&value_le, sizeof(reg));
> +}
> +
> +static inline s32 zinitix_write_cmd(struct i2c_client *client, u16 reg)
> +{
> +	int ret;
> +	__le16 reg_le = cpu_to_le16(reg);
> +
> +	ret = i2c_master_send(client, (u8 *)&reg_le, sizeof(reg_le));
> +	if (ret < 0)
> +		return ret;
> +
> +	udelay(DELAY_FOR_POST_TRANSCATION);
> +	return 0;
> +}
> +
> +static bool zinitix_init_touch(struct bt541_ts_data *bt541)
> +{
> +	struct i2c_client *client = bt541->client;
> +	int i;
> +	int ret;
> +
> +	ret = zinitix_write_cmd(client, BT541_SWRESET_CMD);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to write reset command\n");
> +		return ret;
> +	}
> +
> +	ret = zinitix_write_u16(client, BT541_INT_ENABLE_FLAG, 0x0);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to reset interrupt enable flag\n");
> +		return ret;
> +	}
> +
> +	/* initialize */
> +	ret = zinitix_write_u16(client, BT541_X_RESOLUTION, (u16)bt541->prop.max_x);
> +	if (ret)
> +		return ret;
> +
> +	ret = zinitix_write_u16(client, BT541_Y_RESOLUTION, (u16)bt541->prop.max_y);
> +	if (ret)
> +		return ret;
> +
> +	ret = zinitix_write_u16(client, BT541_SUPPORTED_FINGER_NUM,
> +				(u16)MAX_SUPPORTED_FINGER_NUM);
> +	if (ret)
> +		return ret;
> +
> +	ret = zinitix_write_u16(client, BT541_INITIAL_TOUCH_MODE, TOUCH_POINT_MODE);
> +	if (ret)
> +		return ret;
> +
> +	ret = zinitix_write_u16(client, BT541_TOUCH_MODE, TOUCH_POINT_MODE);
> +	if (ret)
> +		return ret;
> +
> +	ret = zinitix_write_u16(client, BT541_INT_ENABLE_FLAG,
> +				BIT_PT_CNT_CHANGE | BIT_DOWN | BIT_MOVE | BIT_UP);
> +	if (ret)
> +		return ret;
> +
> +	/* clear queue */
> +	for (i = 0; i < 10; i++) {
> +		zinitix_write_cmd(client, BT541_CLEAR_INT_STATUS_CMD);
> +		udelay(10);
> +	}
> +
> +	return 0;
> +}
> +
> +static int zinitix_init_regulators(struct bt541_ts_data *bt541)
> +{
> +	struct i2c_client *client = bt541->client;
> +	int ret;
> +
> +	bt541->supplies[0].supply = "vdd";
> +	bt541->supplies[1].supply = "vddo";
> +	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(bt541->supplies),
> +				      bt541->supplies);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to get regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int zinitix_send_power_on_sequence(struct bt541_ts_data *bt541)
> +{
> +	int ret;
> +	struct i2c_client *client = bt541->client;
> +
> +	ret = zinitix_write_u16(client, 0xc000, 0x0001);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to send power sequence(vendor cmd enable)\n");
> +		return ret;
> +	}
> +	udelay(10);
> +
> +	ret = zinitix_write_cmd(client, 0xc004);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to send power sequence(intn clear)\n");
> +		return ret;
> +	}
> +	udelay(10);
> +
> +	ret = zinitix_write_u16(client, 0xc002, 0x0001);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to send power sequence(nvm init)\n");
> +		return ret;
> +	}
> +	mdelay(2);
> +
> +	ret = zinitix_write_u16(client, 0xc001, 0x0001);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to send power sequence(program start)\n");
> +		return ret;
> +	}
> +	msleep(FIRMWARE_ON_DELAY);	/* wait for checksum cal */
> +
> +	return 0;
> +}
> +
> +static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
> +{
> +	struct bt541_ts_data *bt541 = (struct bt541_ts_data *)bt541_handler;
> +	struct i2c_client *client = bt541->client;
> +	int i;
> +	int ret;
> +	struct point_status point_status;
> +	struct point_coord point_coord[MAX_SUPPORTED_FINGER_NUM] = {0};
> +
> +	memset(&point_status, 0, sizeof(struct point_status));
> +
> +	ret = zinitix_read_data(bt541->client, BT541_POINT_STATUS_REG,
> +				(u8 *)&point_status, sizeof(struct point_status));
> +	if (ret) {
> +		dev_err(&client->dev, "%s: Failed to read point status\n", __func__);

		goto out;

> +
> +		zinitix_write_cmd(bt541->client, BT541_CLEAR_INT_STATUS_CMD);
> +		return IRQ_HANDLED;

Combine this with normal exit code flow.

> +	}
> +
> +	for (i = 0; i < MAX_SUPPORTED_FINGER_NUM; i++) {
> +		if (!(le16_to_cpu(point_status.event_flag) & BIT(i)))

I'd do le->cpu conversion outside the loop, and then use
for_each_set_bit(...).

> +			continue;
> +
> +		ret = zinitix_read_data(bt541->client, BT541_POINT_COORD_REG +
> +					(i * sizeof(struct point_coord) / sizeof(u16)),
> +					(u8 *)&point_coord[i], sizeof(struct point_coord));
> +		if (ret) {
> +			dev_err(&client->dev, "%s: Failed to read point info\n", __func__);
> +
> +			zinitix_write_cmd(bt541->client, BT541_CLEAR_INT_STATUS_CMD);
> +			return IRQ_HANDLED;
> +		}
> +
> +		if (!(point_coord[i].sub_status & SUB_BIT_EXIST))
> +			continue;
> +
> +		input_mt_slot(bt541->input_dev, i);
> +		input_mt_report_slot_state(bt541->input_dev, MT_TOOL_FINGER, true);
> +		touchscreen_report_pos(bt541->input_dev, &bt541->prop,
> +				       le16_to_cpu(point_coord[i].x),
> +				       le16_to_cpu(point_coord[i].y), true);
> +		input_report_abs(bt541->input_dev, ABS_MT_TOUCH_MAJOR, point_coord[i].width);
> +		input_report_abs(bt541->input_dev, ABS_MT_WIDTH_MAJOR, point_coord[i].width);

Why do you report both? I think ABS_MT_TOUCH_MAJOR should be enough.

> +	}
> +
> +	zinitix_write_cmd(bt541->client, BT541_CLEAR_INT_STATUS_CMD);
> +
> +	input_mt_sync_frame(bt541->input_dev);
> +	input_sync(bt541->input_dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int zinitix_init_input_dev(struct bt541_ts_data *bt541)
> +{
> +	int ret;
> +
> +	bt541->input_dev = devm_input_allocate_device(&bt541->client->dev);
> +	if (!bt541->input_dev) {
> +		dev_err(&bt541->client->dev, "Failed to allocate input device.");
> +		return -ENOMEM;
> +	}
> +
> +	bt541->input_dev->name = "Zinitix Capacitive TouchScreen";
> +	bt541->input_dev->phys = "input/ts";
> +	bt541->input_dev->id.bustype = BUS_I2C;
> +
> +	input_set_capability(bt541->input_dev, EV_ABS, ABS_MT_POSITION_X);
> +	input_set_capability(bt541->input_dev, EV_ABS, ABS_MT_POSITION_Y);
> +	input_set_abs_params(bt541->input_dev, ABS_MT_WIDTH_MAJOR, 0, 255, 0, 0);
> +	input_set_abs_params(bt541->input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
> +
> +	touchscreen_parse_properties(bt541->input_dev, true, &bt541->prop);
> +
> +	if (!bt541->prop.max_x || !bt541->prop.max_y) {
> +		dev_err(&bt541->client->dev, "touchscreen-size-x and/or touchscreen-size-y not set in dts\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = input_mt_init_slots(bt541->input_dev, MAX_SUPPORTED_FINGER_NUM,
> +				  INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
> +	if (ret) {
> +		dev_err(&bt541->client->dev,
> +			"Failed to initialize MT slots: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = input_register_device(bt541->input_dev);
> +	if (ret) {
> +		dev_err(&bt541->client->dev,
> +			"Failed to register input device: %d", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int zinitix_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +{
> +	struct bt541_ts_data *bt541;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(&client->dev, "I2C check functionality failed.\n");
> +		return -ENXIO;
> +	}
> +
> +	bt541 = devm_kzalloc(&client->dev, sizeof(*bt541), GFP_KERNEL);
> +	if (!bt541)
> +		return -ENOMEM;
> +
> +	bt541->client = client;
> +	i2c_set_clientdata(client, bt541);
> +
> +	ret = zinitix_init_regulators(bt541);
> +	if (ret) {
> +		dev_err(&client->dev, "regulator initialization failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(bt541->supplies), bt541->supplies);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	msleep(CHIP_ON_DELAY);
> +
> +	ret = zinitix_send_power_on_sequence(bt541);
> +	if (ret) {
> +		dev_err(&client->dev, "sending power-on sequence failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = zinitix_init_input_dev(bt541);
> +	if (ret) {
> +		dev_err(&client->dev, "input dev initialization failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = zinitix_init_touch(bt541);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to init touchscreen ic\n");
> +		return ret;
> +	}
> +
> +	ret = devm_request_threaded_irq(&bt541->client->dev, bt541->client->irq,
> +					NULL, zinitix_ts_irq_handler,
> +					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +					bt541->client->name, bt541);
> +	if (ret) {
> +		dev_err(&client->dev, "request IRQ failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_info(&client->dev, "initialized a zinitix touchscreen\n");
> +
> +	return 0;
> +}
> +
> +static int zinitix_ts_remove(struct i2c_client *client)
> +{
> +	struct bt541_ts_data *bt541 = i2c_get_clientdata(client);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(bt541->supplies), bt541->supplies);

Doing it here means you cut off power to the device while interrupts are
still enabled, etc. Unfortunately we do not have devm interface for
disabling regulators. Please use devm_add_action_or_reset() in
zinitix_ts_probe() and install a custom handler calling
regulator_bulk_disable() and drop zinitix_ts_remove().

> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id zinitix_of_match[] = {
> +	{ .compatible = "zinitix,bt541" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, zinitix_of_match);
> +#endif
> +
> +static struct i2c_driver zinitix_ts_driver = {
> +	.probe = zinitix_ts_probe,
> +	.remove = zinitix_ts_remove,
> +	.driver = {
> +		.name = "Zinitix-TS",
> +		.of_match_table = of_match_ptr(zinitix_of_match),
> +	},
> +};
> +module_i2c_driver(zinitix_ts_driver);
> +
> +MODULE_AUTHOR("Michael Srba <Michael.Srba@seznam.cz>");
> +MODULE_DESCRIPTION("Zinitix touchscreen driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.23.0
> 

Thanks.

-- 
Dmitry
