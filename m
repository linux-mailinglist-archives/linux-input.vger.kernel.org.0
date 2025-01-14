Return-Path: <linux-input+bounces-9242-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 236B2A113F2
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 23:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C4AC165EB6
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 22:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEDE20E6E7;
	Tue, 14 Jan 2025 22:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJMwsGlS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671074644E;
	Tue, 14 Jan 2025 22:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736893071; cv=none; b=uGrf7mGV6bPSOTaB79k5yPbLxYpIe+f/uNiZ0tMtbaf/DSKn7jri3Yy5NNHmG5RlCl8Liul2vuR7thqNxlGqM+axJBhfwheN7XigTCaKnW1LN4SYW0Tk+da2JHPWbAhcRP1sUyYB/WT6pOiK5/gB2OeEpDfd7Jo0pLf67xsRsLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736893071; c=relaxed/simple;
	bh=5CtG252BQpE6OPdmYe8kgWKtcZapsbXLun/J2/WYRzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkoFNBPcXJAaO/e1Heo+JDtU5SQ9At1wQZgJDvV2uqmAPpXuWh24c1RXCpUf5v2Xv32gWKVT5oaMf95YAFgTl2MpnU9y76+1gvcuN+tG1XUpx0UwkGyXDHSApVnRVue8/5SCWq+v0rb7kkyiUfATwtsHub+D/oe7e2nX8GnGlLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJMwsGlS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21670dce0a7so131004265ad.1;
        Tue, 14 Jan 2025 14:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736893069; x=1737497869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vyytEgJ2Vaif7QDiqWZ0BEALNdhLJEQ4VKiXe3NBNB4=;
        b=HJMwsGlSCjnkWmNB5hyF+CnlHLCk1EScWuMLvmFUiLm4hfb446eR5TeZ+tcIOH03ZD
         +GSGlIY31BEzRaMIc7wIY6kNWQtqqo6/Ew8TETL1djT8Py6/phBhXeHm7JOe4EjgxR+E
         35ssiNjhA+m90eo+OhanyNiFQxyNAFhSrjFIyLizs8nwHoQw4NDOFFaZQwRTKqCSziwe
         /W1bQ1JLBYsy8D5iwLlmmM1QgAJ+0hW/KJeacTkujsedUaTPiNWaH/SFlPoUid3t+943
         NRU8TDNK+pOdFBYUO0LXuVkxZOM9nGAoPK058dH/aI2yoYEXFTyg9EjjFbHA8AEebit2
         aaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736893069; x=1737497869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyytEgJ2Vaif7QDiqWZ0BEALNdhLJEQ4VKiXe3NBNB4=;
        b=MO/He4H5Hb7U5tT75ie/PfhQRhAh32NHY8tGmmM0gxBfqld6v6qxbuSTUewTNQNOGr
         IC5l25SA1I+SUL07jw2Qmq1dEmicdSGEqtodvzvn6S2O5d91aSU8Y1RuHhRPFdnCoJ+x
         P46ptQBzViMvHBbLdl0ODdJLhBHLPwGM566jjkrD/aGWaIl2dTND/tL5kNGT6pAyQoc3
         9vGvCaIFUqhNvnEJErajdHSMxlXQCAJlOi9493BoItoppy/e0JcQZBBq84wczMlQXptN
         Q/y1QPrjjLdnCibRP4ydH4jpy0FY/aCREqQnsi3/drAHHqFAmyA/5y1SNitEc/Uji/4X
         5ppw==
X-Forwarded-Encrypted: i=1; AJvYcCU5h94KLxQKPmQXKukq6BIoLO5zkJ3VDZT3MeZ2AOZgvjWWnDockjTC4yQPwxjHjOoK20IApOvkempV03kz@vger.kernel.org, AJvYcCUDOwCISLs0oVBzYcsZVXsgzsINN1/dcsYQelbqXhAC0vMZJF0+XeK5QsKXzvZKBd7mO2c2F4j0e5cUqKo=@vger.kernel.org, AJvYcCVqyd7HhPil7NKdqSuZ4unerogmxYFt6viD2f+9G+INZQN90i17cpeYcnNI7xLIUEKAL6gxHMCQTcvj@vger.kernel.org
X-Gm-Message-State: AOJu0YwGtYasvPv8f4tERHk2aAnW7/D1mbCJvlCBP8ruklODmpkgRXQT
	n2gfjiRCANPRZHKMrDjQMeeUcqhEBZoIev9NQR7jwmFoEK4QXshCkMX6Dw==
X-Gm-Gg: ASbGncvg7patxJrKOlY/1H54IXMa1pRsEqOKwxs1IifvzsGJqf0BYt60QWCOkbTJIPI
	nG9PnRkYGEFauzlXjy8o2rfAHfOCmKGSriLj/jFYthyCL6siE1wtUusS5DtqfHhjgYR6Zn9ji2f
	fU1USfh5/X1JqC3uge5kHyFWQ4fVbAZbkuOvsEY3+R8K2i6wAyvIFSH3m/1kHKS0RdX6esjNuRQ
	XfN4gtTMzxug7tLqgC2WkCXRB3jVfw9+efLILrtyPRhGL/iiY77WSv+Jg==
X-Google-Smtp-Source: AGHT+IF/RAOm/Wsnhh1r6yPyC0nfGad9+tWIdiCwaGqZ9QanxxdPdAZhx09E+tTlD4vvA3dfRg/mcQ==
X-Received: by 2002:a05:6a21:350d:b0:1e1:b105:87b with SMTP id adf61e73a8af0-1e88cfdc0f5mr43403648637.23.1736893068423;
        Tue, 14 Jan 2025 14:17:48 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e152:4a95:d7ea:84d5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d405485b7sm7823896b3a.2.2025.01.14.14.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:17:47 -0800 (PST)
Date: Tue, 14 Jan 2025 14:17:44 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v3 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z4biiJoFTvxCe2IB@google.com>
References: <20250112-z2-v3-0-5c0e555d3df1@gmail.com>
 <20250112-z2-v3-2-5c0e555d3df1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112-z2-v3-2-5c0e555d3df1@gmail.com>

Hi Sasha,

On Sun, Jan 12, 2025 at 07:41:33PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds a driver for Apple touchscreens using the Z2 protocol.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/input/touchscreen/Kconfig    |  13 +
>  drivers/input/touchscreen/Makefile   |   1 +
>  drivers/input/touchscreen/apple_z2.c | 463 +++++++++++++++++++++++++++++++++++
>  3 files changed, 477 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index 1a03de7fcfa66c0f60768be17d776a79e36e570e..6c885cc58f323b3628538d41460248f8ab1dbf7d 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -103,6 +103,19 @@ config TOUCHSCREEN_ADC
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called resistive-adc-touch.ko.
>  
> +config TOUCHSCREEN_APPLE_Z2
> +	tristate "Apple Z2 touchscreens"
> +	default ARCH_APPLE
> +	depends on SPI
> +	help
> +	  Say Y here if you have an Apple device with
> +	  a touchscreen or a touchbar.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called apple_z2.
> +
>  config TOUCHSCREEN_AR1021_I2C
>  	tristate "Microchip AR1020/1021 i2c touchscreen"
>  	depends on I2C && OF
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index 82bc837ca01e2ee18c5e9c578765d55ef9fab6d4..97a025c6a3770fb80255246eb63c11688ebd79eb 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_TOUCHSCREEN_AD7879_I2C)	+= ad7879-i2c.o
>  obj-$(CONFIG_TOUCHSCREEN_AD7879_SPI)	+= ad7879-spi.o
>  obj-$(CONFIG_TOUCHSCREEN_ADC)		+= resistive-adc-touch.o
>  obj-$(CONFIG_TOUCHSCREEN_ADS7846)	+= ads7846.o
> +obj-$(CONFIG_TOUCHSCREEN_APPLE_Z2)	+= apple_z2.o
>  obj-$(CONFIG_TOUCHSCREEN_AR1021_I2C)	+= ar1021_i2c.o
>  obj-$(CONFIG_TOUCHSCREEN_ATMEL_MXT)	+= atmel_mxt_ts.o
>  obj-$(CONFIG_TOUCHSCREEN_AUO_PIXCIR)	+= auo-pixcir-ts.o
> diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..cf2cb19f857785748a96d8787b3af10e48033659
> --- /dev/null
> +++ b/drivers/input/touchscreen/apple_z2.c
> @@ -0,0 +1,463 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Apple Z2 touchscreen driver
> + *
> + * Copyright (C) The Asahi Linux Contributors
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/firmware.h>
> +#include <linux/input.h>
> +#include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/spi/spi.h>
> +#include <linux/unaligned.h>
> +
> +#define APPLE_Z2_NUM_FINGERS_OFFSET      16
> +#define APPLE_Z2_FINGERS_OFFSET          24
> +#define APPLE_Z2_TOUCH_STARTED           3
> +#define APPLE_Z2_TOUCH_MOVED             4
> +#define APPLE_Z2_CMD_READ_INTERRUPT_DATA 0xEB
> +#define APPLE_Z2_HBPP_CMD_BLOB           0x3001
> +#define APPLE_Z2_FW_MAGIC                0x5746325A
> +#define LOAD_COMMAND_INIT_PAYLOAD        0
> +#define LOAD_COMMAND_SEND_BLOB           1
> +#define LOAD_COMMAND_SEND_CALIBRATION    2
> +#define CAL_PROP_NAME                    "apple,z2-cal-blob"
> +
> +struct apple_z2 {
> +	struct spi_device *spidev;
> +	struct gpio_desc *reset_gpio;
> +	struct input_dev *input_dev;
> +	struct completion boot_irq;
> +	bool booted;
> +	int index_parity;
> +	struct touchscreen_properties props;
> +	const char *fw_name;
> +	struct apple_z2_read_interrupt_cmd *len_cmd;

Can we make it u8 *tx_buf ?

> +	char *rx_buf;

Can we make it u8 *?

> +};
> +
> +struct apple_z2_finger {
> +	u8 finger;
> +	u8 state;
> +	__le16 unknown2;
> +	__le16 abs_x;
> +	__le16 abs_y;
> +	__le16 rel_x;
> +	__le16 rel_y;
> +	__le16 tool_major;
> +	__le16 tool_minor;
> +	__le16 orientation;
> +	__le16 touch_major;
> +	__le16 touch_minor;
> +	__le16 unused[2];
> +	__le16 pressure;
> +	__le16 multi;
> +};
> +
> +struct apple_z2_hbpp_blob_hdr {
> +	__le16 cmd;
> +	__le16 len;
> +	__le32 addr;
> +	__le16 checksum;
> +};
> +
> +struct apple_z2_fw_hdr {
> +	__le32 magic;
> +	__le32 version;
> +};
> +
> +struct apple_z2_read_interrupt_cmd {
> +	u8 cmd;
> +	u8 counter;
> +	u8 unused[12];
> +	__le16 checksum;
> +};
> +
> +static void apple_z2_parse_touches(struct apple_z2 *z2, char *msg, size_t msg_len)
> +{
> +	int i;
> +	int nfingers;
> +	int slot;
> +	int slot_valid;
> +	struct apple_z2_finger *fingers;
> +
> +	if (msg_len <= APPLE_Z2_NUM_FINGERS_OFFSET)
> +		return;
> +	nfingers = msg[APPLE_Z2_NUM_FINGERS_OFFSET];
> +	fingers = (struct apple_z2_finger *)(msg + APPLE_Z2_FINGERS_OFFSET);

Is this properly aligned? rx_buf is DMA aligned, but msg is +5 so we
start at an odd offset. APPLE_Z2_FINGERS_OFFSET is 24, so overall offset
is still odd. Do we have to mark apple_z2_finger as packed after all? 

> +	for (i = 0; i < nfingers; i++) {
> +		slot = input_mt_get_slot_by_key(z2->input_dev, fingers[i].finger);
> +		if (slot < 0) {
> +			dev_warn(&z2->spidev->dev, "unable to get slot for finger\n");
> +			continue;
> +		}
> +		slot_valid = fingers[i].state == APPLE_Z2_TOUCH_STARTED ||
> +			     fingers[i].state == APPLE_Z2_TOUCH_MOVED;
> +		input_mt_slot(z2->input_dev, slot);
> +		if (!input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid))
> +			continue;
> +		touchscreen_report_pos(z2->input_dev, &z2->props, le16_to_cpu(fingers[i].abs_x),
> +				       le16_to_cpu(fingers[i].abs_y), true);
> +		input_report_abs(z2->input_dev, ABS_MT_WIDTH_MAJOR,
> +				 le16_to_cpu(fingers[i].tool_major));
> +		input_report_abs(z2->input_dev, ABS_MT_WIDTH_MINOR,
> +				 le16_to_cpu(fingers[i].tool_minor));
> +		input_report_abs(z2->input_dev, ABS_MT_ORIENTATION,
> +				 le16_to_cpu(fingers[i].orientation));
> +		input_report_abs(z2->input_dev, ABS_MT_TOUCH_MAJOR,
> +				 le16_to_cpu(fingers[i].touch_major));
> +		input_report_abs(z2->input_dev, ABS_MT_TOUCH_MINOR,
> +				 le16_to_cpu(fingers[i].touch_minor));
> +	}
> +	input_mt_sync_frame(z2->input_dev);
> +	input_sync(z2->input_dev);
> +}
> +
> +static int apple_z2_read_packet(struct apple_z2 *z2)
> +{
> +	struct spi_message msg;
> +	struct spi_transfer xfer;
> +	int error;
> +	size_t pkt_len;
> +
> +	spi_message_init(&msg);
> +	memset(&xfer, 0, sizeof(xfer));
> +
> +	z2->len_cmd->cmd = APPLE_Z2_CMD_READ_INTERRUPT_DATA;
> +	z2->len_cmd->counter = z2->index_parity + 1;
> +	z2->len_cmd->checksum =
> +		cpu_to_le16(APPLE_Z2_CMD_READ_INTERRUPT_DATA + 1 + z2->index_parity);
> +	z2->index_parity = !z2->index_parity;
> +	xfer.tx_buf = z2->len_cmd;
> +	xfer.rx_buf = z2->rx_buf;
> +	xfer.len = sizeof(*z2->len_cmd);
> +
> +	spi_message_add_tail(&xfer, &msg);
> +	error = spi_sync(z2->spidev, &msg);

Why not spi_sync_transfer() ?

> +	if (error)
> +		return error;
> +
> +	pkt_len = (get_unaligned_le16(z2->rx_buf + 1) + 8) & (-4);
> +
> +	spi_message_init(&msg);
> +	memset(&xfer, 0, sizeof(xfer));
> +	xfer.rx_buf = z2->rx_buf;
> +	xfer.len = pkt_len;
> +
> +	spi_message_add_tail(&xfer, &msg);
> +	error = spi_sync(z2->spidev, &msg);

Maybe simple spi_read()?

> +
> +	if (error)
> +		return error;
> +
> +	apple_z2_parse_touches(z2, z2->rx_buf + 5, pkt_len - 5);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t apple_z2_irq(int irq, void *data)
> +{
> +	struct spi_device *spi = data;
> +	struct apple_z2 *z2 = spi_get_drvdata(spi);
> +
> +	if (unlikely(!z2->booted))
> +		complete(&z2->boot_irq);
> +	else
> +		apple_z2_read_packet(z2);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int apple_z2_build_cal_blob(struct apple_z2 *z2, u32 address, size_t cal_size, char *data)
> +{
> +	u16 len_words = (cal_size + 3) / 4;
> +	size_t hdr_size = sizeof(struct apple_z2_hbpp_blob_hdr);
> +	u32 checksum = 0;
> +	u16 checksum_hdr = 0;
> +	int i;
> +	struct apple_z2_hbpp_blob_hdr *hdr;
> +	int error;
> +
> +	hdr = (struct apple_z2_hbpp_blob_hdr *)data;
> +	hdr->cmd = cpu_to_le16(APPLE_Z2_HBPP_CMD_BLOB);
> +	hdr->len = cpu_to_le16(len_words);
> +	hdr->addr = cpu_to_le32(address);
> +
> +	for (i = 2; i < 8; i++)
> +		checksum_hdr += data[i];
> +
> +	hdr->checksum = cpu_to_le16(checksum_hdr);
> +	error = device_property_read_u8_array(&z2->spidev->dev, CAL_PROP_NAME,
> +					      data + hdr_size, cal_size);
> +	if (error)
> +		return error;
> +
> +	for (i = 0; i < cal_size; i++)
> +		checksum += data[i + hdr_size];
> +
> +	put_unaligned_le32(checksum, data + cal_size + hdr_size);
> +	return 0;
> +}
> +
> +static int apple_z2_send_firmware_blob(struct apple_z2 *z2, const char *data, u32 size, u8 bpw)
> +{
> +	struct spi_message msg;
> +	struct spi_transfer blob_xfer, ack_xfer;
> +	int error;
> +	char *int_ack __free(kfree) = NULL;
> +
> +	int_ack = kzalloc(2, GFP_KERNEL);

When using __free() the preferred form is

	char *int_ack __free(kfree) = kzalloc(2, GFP_KERNEL);

instead of pre-declaring the variable with the rest at the beginning of
the function.

> +	if (!int_ack)
> +		return -ENOMEM;
> +	int_ack[0] = 0x1a;
> +	int_ack[1] = 0xa1;

Can this reuse tx_buf in the device?

> +
> +	spi_message_init(&msg);
> +	memset(&blob_xfer, 0, sizeof(blob_xfer));
> +	memset(&ack_xfer, 0, sizeof(ack_xfer));
> +
> +	blob_xfer.tx_buf = data;
> +	blob_xfer.len = size;
> +	blob_xfer.bits_per_word = bpw;
> +	spi_message_add_tail(&blob_xfer, &msg);
> +
> +	ack_xfer.tx_buf = int_ack;
> +	ack_xfer.len = 2;
> +	spi_message_add_tail(&ack_xfer, &msg);
> +
> +	reinit_completion(&z2->boot_irq);
> +	error = spi_sync(z2->spidev, &msg);
> +	if (error)
> +		return error;
> +	wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));

Why not handling timeouts?

> +	return 0;
> +}
> +
> +static int apple_z2_upload_firmware(struct apple_z2 *z2)
> +{
> +	const struct apple_z2_fw_hdr *fw_hdr;
> +	size_t fw_idx = sizeof(struct apple_z2_fw_hdr);
> +	int error;
> +	u32 load_cmd;
> +	u32 size;
> +	u32 address;
> +	char *data;
> +	u8 bits_per_word;
> +	size_t cal_size;
> +	const struct firmware *fw __free(firmware) = NULL;
> +
> +	error = request_firmware(&fw, z2->fw_name, &z2->spidev->dev);

Please keep the last 2 lines together and separate from declaration
block.

> +	if (error) {
> +		dev_err(&z2->spidev->dev, "unable to load firmware");
> +		return error;
> +	}
> +
> +	fw_hdr = (const struct apple_z2_fw_hdr *)fw->data;
> +	if (le32_to_cpu(fw_hdr->magic) != APPLE_Z2_FW_MAGIC || le32_to_cpu(fw_hdr->version) != 1) {
> +		dev_err(&z2->spidev->dev, "invalid firmware header");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * This will interrupt the upload half-way if the file is malformed
> +	 * As the device has no non-volatile storage to corrupt, and gets reset
> +	 * on boot anyway, this is fine.
> +	 */
> +	while (fw_idx < fw->size) {
> +		if (fw->size - fw_idx < 8) {
> +			dev_err(&z2->spidev->dev, "firmware malformed");
> +			return -EINVAL;
> +		}
> +
> +		load_cmd = le32_to_cpu(*(__le32 *)(fw->data + fw_idx));
> +		fw_idx += sizeof(u32);
> +		if (load_cmd == LOAD_COMMAND_INIT_PAYLOAD || load_cmd == LOAD_COMMAND_SEND_BLOB) {
> +			size = le32_to_cpu(*(__le32 *)(fw->data + fw_idx));
> +			fw_idx += sizeof(u32);
> +			if (fw->size - fw_idx < size) {
> +				dev_err(&z2->spidev->dev, "firmware malformed");
> +				return -EINVAL;
> +			}
> +			bits_per_word = load_cmd == LOAD_COMMAND_SEND_BLOB ? 16 : 8;
> +			error = apple_z2_send_firmware_blob(z2, fw->data + fw_idx,
> +							    size, bits_per_word);
> +			if (error)
> +				return error;
> +			fw_idx += size;
> +		} else if (load_cmd == 2) {

We have LOAD_COMMAND_INIT_PAYLOAD and LOAD_COMMAND_SEND_BLOB, can we
have name for "2" as well please?

> +			address = le32_to_cpu(*(u32 *)(fw->data + fw_idx));
> +			fw_idx += sizeof(u32);
> +			cal_size = device_property_count_u8(&z2->spidev->dev, CAL_PROP_NAME);
> +			if (cal_size != 0) {
> +				size = cal_size + sizeof(struct apple_z2_hbpp_blob_hdr) + 4;
> +				data = kzalloc(size, GFP_KERNEL);
> +				error = apple_z2_build_cal_blob(z2, address, cal_size, data);
> +				if (!error)
> +					error = apple_z2_send_firmware_blob(z2, data, size, 16);
> +				kfree(data);
> +				if (error)
> +					return error;
> +			}
> +		} else {
> +			dev_err(&z2->spidev->dev, "firmware malformed");
> +			return -EINVAL;
> +		}
> +		if (fw_idx % 4 != 0)
> +			fw_idx += 4 - (fw_idx % 4);
> +	}
> +
> +
> +	z2->booted = true;
> +	apple_z2_read_packet(z2);
> +	return 0;
> +}
> +
> +static int apple_z2_boot(struct apple_z2 *z2)
> +{
> +	int timeout;
> +	int error;
> +
> +	enable_irq(z2->spidev->irq);
> +	gpiod_direction_output(z2->reset_gpio, 0);

I think you need reinit_completion() here.

> +	timeout = wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
> +	if (timeout == 0)
> +		return -ETIMEDOUT;
> +
> +	error = apple_z2_upload_firmware(z2);
> +	if (error) {
> +		gpiod_direction_output(z2->reset_gpio, 1);
> +		disable_irq(z2->spidev->irq);
> +	}
> +	return error;
> +}
> +
> +static int apple_z2_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct apple_z2 *z2;
> +	int error;
> +
> +	z2 = devm_kzalloc(dev, sizeof(*z2), GFP_KERNEL);
> +	if (!z2)
> +		return -ENOMEM;
> +
> +	z2->len_cmd = devm_kzalloc(dev, sizeof(*z2->len_cmd), GFP_KERNEL);
> +	z2->rx_buf = devm_kzalloc(dev, 4096, GFP_KERNEL);
> +	if (!z2->len_cmd || !z2->rx_buf)
> +		return -ENOMEM;
> +
> +	z2->spidev = spi;
> +	init_completion(&z2->boot_irq);
> +	spi_set_drvdata(spi, z2);
> +
> +	z2->reset_gpio = devm_gpiod_get_index(dev, "reset", 0, 0);

Why devm_gpiod_get_index() and not devm_gpiod_get()? Also, why don't
you start with GPIOD_OUT_HIGH and use gpiod_set_value() instead of
gpiod_direction_outout()?

> +	if (IS_ERR(z2->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(z2->reset_gpio), "unable to get reset");
> +
> +	error = devm_request_threaded_irq(dev, z2->spidev->irq, NULL,
> +					apple_z2_irq, IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					"apple-z2-irq", spi);
> +	if (error)
> +		return dev_err_probe(dev, z2->spidev->irq, "unable to request irq");
> +
> +	error = device_property_read_string(dev, "firmware-name", &z2->fw_name);
> +	if (error)
> +		return dev_err_probe(dev, error, "unable to get firmware name");
> +
> +	z2->input_dev = devm_input_allocate_device(dev);
> +	if (!z2->input_dev)
> +		return -ENOMEM;
> +	z2->input_dev->name = (char *)spi_get_device_id(spi)->driver_data;
> +	z2->input_dev->phys = "apple_z2";
> +	z2->input_dev->id.bustype = BUS_SPI;
> +
> +	/* Allocate the axes before setting from DT */
> +	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_X, 0, 0, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_Y, 0, 0, 0, 0);
> +	touchscreen_parse_properties(z2->input_dev, true, &z2->props);
> +	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_X, 100);
> +	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_Y, 100);
> +	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MAJOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MINOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MAJOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MINOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_ORIENTATION, -32768, 32767, 0, 0);
> +
> +	input_set_drvdata(z2->input_dev, z2);
> +
> +	error = input_mt_init_slots(z2->input_dev, 256, INPUT_MT_DIRECT);
> +	if (error)
> +		return dev_err_probe(dev, error, "unable to initialize multitouch slots");
> +
> +	error = input_register_device(z2->input_dev);
> +	if (error)
> +		return dev_err_probe(dev, error, "unable to register input device");
> +
> +	/* Reset the device on boot */
> +	gpiod_direction_output(z2->reset_gpio, 1);
> +	usleep_range(5000, 10000);
> +	error = apple_z2_boot(z2);
> +	if (error)
> +		return error;
> +	return 0;
> +}
> +
> +static void apple_z2_shutdown(struct spi_device *spi)
> +{
> +	struct apple_z2 *z2 = spi_get_drvdata(spi);
> +
> +	disable_irq(z2->spidev->irq);
> +	gpiod_direction_output(z2->reset_gpio, 1);
> +	z2->booted = false;
> +}
> +
> +static int apple_z2_suspend(struct device *dev)
> +{
> +	apple_z2_shutdown(to_spi_device(dev));
> +	return 0;
> +}
> +
> +static int apple_z2_resume(struct device *dev)
> +{
> +	struct apple_z2 *z2 = spi_get_drvdata(to_spi_device(dev));
> +
> +	return apple_z2_boot(z2);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(apple_z2_pm, apple_z2_suspend, apple_z2_resume);
> +
> +static const struct of_device_id apple_z2_of_match[] = {
> +	{ .compatible = "apple,j293-touchbar" },
> +	{ .compatible = "apple,j493-touchbar" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, apple_z2_of_match);
> +
> +static struct spi_device_id apple_z2_of_id[] = {
> +	{ .name = "j293-touchbar", .driver_data = (kernel_ulong_t)"MacBookPro17,1 Touch Bar" },
> +	{ .name = "j493-touchbar", .driver_data = (kernel_ulong_t)"Mac14,7 Touch Bar" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, apple_z2_of_id);
> +
> +static struct spi_driver apple_z2_driver = {
> +	.driver = {
> +		.name	= "apple-z2",
> +		.pm	= pm_sleep_ptr(&apple_z2_pm),
> +		.of_match_table = apple_z2_of_match,

You decided not to mark the driver for async probing... Why? Do you see
userspace unhappy if you do so?

> +	},
> +	.id_table = apple_z2_of_id,
> +	.probe    = apple_z2_probe,
> +	.remove   = apple_z2_shutdown,
> +};
> +
> +module_spi_driver(apple_z2_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_FIRMWARE("apple/dfrmtfw-*.bin");
> +MODULE_DESCRIPTION("Apple Z2 touchscreens driver");
> 
> -- 
> 2.48.0
> 
> 

Thanks.

-- 
Dmitry

