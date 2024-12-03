Return-Path: <linux-input+bounces-8371-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A969E2F82
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 00:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DA4D164B33
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 23:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D511207A3E;
	Tue,  3 Dec 2024 23:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoj7azqK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE0D188A0E;
	Tue,  3 Dec 2024 23:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733267276; cv=none; b=Q11+a6vLAQwJgkYocTtrtZep7Msfk5OyaNTF7zwJXuzb43aimpRXGVTkeW57Znp1gbRU+v6Z+tsnRKUQT0uj6OLKIxl/Pr+YxFbQDDcrngv8gB5aV40nKONGcL5FtCy2M6pJQkzdSv5MXPT22JqL0Qpn55Kr57IF//F4ZUHSBi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733267276; c=relaxed/simple;
	bh=kHiQBMy3aYHBgCS0HchD2CiLDJ8EsDFCYOp2N6k6Enc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHLc7fNO4ZgL/2yMhEmUorA3AR0n+HIUnF07jEwoNK1yp+xzLbnxiIxHRQ2KRGVIUUUp1hAuG9qRBMvU4ZEzTwdoy4gHYTSzLSmtcBUp7mxB9LHQLxZlR8YcpYjktENfaN5zWIbnfVOVDl3taLRzvQKwMi5ff+QHGiRM0PgerdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoj7azqK; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7242f559a9fso6015211b3a.1;
        Tue, 03 Dec 2024 15:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733267273; x=1733872073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0U49IlDCeK7HBEN/uQHlg2wgkfetKLVDfbkQU/1cTBw=;
        b=hoj7azqK+zwDjlrHwp7ljtNB6HtttRA9TlaCGzcmubwSBcN7SeNfKwtYjdUTBPkEgJ
         Dlc5WbdzwF2J0n0KS9h0TMHYUSzWvL8dVYhXpZaQofHieWaM4KfFHPoie9DaY98IJZku
         dbFqY8HcvhaccKyA/1xNnoZH7qlUq77XyphTk0xqj84aYwxZc1YyeGx4D1a0cGpzsdgb
         8EajkQNs5nmJMYOf+ipTEywz65X8xH81aSiHrpHvrwReMCc0r0hCht3UfE1OFIXmozF7
         Owa2S4WoJ2K4GQfaukRwaSz2196BwXkpKCrJhlY0bNIcSY41bZdPy0CeUClTsgDtkNDW
         QlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733267273; x=1733872073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0U49IlDCeK7HBEN/uQHlg2wgkfetKLVDfbkQU/1cTBw=;
        b=FHI1iMOeDz/ja5LXIn23exZh74DkRBGCKykM36gkT7Hh0R7U0aFl0+QrJ//3PXMM5/
         EQdjbNCkbeiCxm6byWLjtCQV2G/eialDG6sbjB7IoU6IEdBwznChcjD8fQZq65d4OmLX
         fn3ANnyD9YB5aEvIxCJ7D4cy/NM/Aq4lFvYAM487gRG061nhMAyymssgfzRsTGJvLe8E
         kxJu5OClpgGfm+SyrDIZE+Z4P49VePUDc2S5uCmajeev3k+jBIgE/5vA9jpwclk0jYFV
         3jcm1ZIEDIzNoNOaDqNNh5U/YJaIkv2wOTzga1lsh839izlUOEzVI/pI9v3g27FM6+dW
         oE2w==
X-Forwarded-Encrypted: i=1; AJvYcCUwHBnCF+GeOzuwXrO6TWolVu0wWv2D2T2KIOaXaBeRIh4cM2KtJWF/IaI/9cXzbuzskG63Qe+1C7LB@vger.kernel.org, AJvYcCWfzXfdtbjxoVP5uwTPhLVnTtQYFVPu/vZ2SvoenxkTSQ6YqW9y7PI76KMonLIKADdj+kfEN4isFh7YsPEz@vger.kernel.org, AJvYcCXqR42Gi9kRdlrXfm94NlWMolEvpAKX53FZfLNaBGyKyfc67Rj0t7oaZvK3nf76yokXFTnH/R+m2bGR+IA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYp4i1YngFqajYJ7bUfs89aECi4OHrXFv6uHshlCiHjdRzFSFi
	Ok8px6i4BA/d7VpFShxbX+7K/Ck6SWlF5FwxvM4R5Y24DpYGB1Dj
X-Gm-Gg: ASbGncutfM4vevScrNJiqsnCmfpwUZ1huUwxUDumBFAwpyqlcUC68pRIB7pN/RyJk5S
	IO2kafdc1N0WJae8bz1rLf1mLPBsgy2tLzkCSCetBsIo14Mfws5brlYLVle+2wnfuUeoW88vUXZ
	YKpBvPjs7ESUbC0FsZoh4n2zifajHqOEqdsxclwxmwxm7I9Z+lpDN6QoSg5zhn7ckpwGspeCb0O
	W9S/PMTihQREJft9EGKbvI0TkrBB7lWdWgQhqrcWN3sirdM6rY=
X-Google-Smtp-Source: AGHT+IFYI13VkWwRgLVB6DJuGypi9ZrShZ3JEfdse7w4DS+ip8vdeR1La5zhbMRPmcRoJpitV0yweg==
X-Received: by 2002:a05:6a00:3a05:b0:725:24c2:b794 with SMTP id d2e1a72fcca58-7257fcc4097mr6531055b3a.23.1733267272791;
        Tue, 03 Dec 2024 15:07:52 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:a614:a365:7f4d:1d6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f401sm10993630b3a.52.2024.12.03.15.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 15:07:52 -0800 (PST)
Date: Tue, 3 Dec 2024 15:07:49 -0800
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
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z0-PRapfiAUGvr4W@google.com>
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
 <20241128-z2-v2-2-76cc59bbf117@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-z2-v2-2-76cc59bbf117@gmail.com>

Hi Sasha,

On Thu, Nov 28, 2024 at 11:29:17PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds a driver for Apple touchscreens using the Z2 protocol.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/input/touchscreen/Kconfig    |  13 +
>  drivers/input/touchscreen/Makefile   |   1 +
>  drivers/input/touchscreen/apple_z2.c | 458 +++++++++++++++++++++++++++++++++++
>  3 files changed, 472 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index 1ac26fc2e3eb94a4f62a49962c25ec853b567a43..4ad5002191f77a17414f9e1494b0afd6447355c0 100644
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
> index 0000000000000000000000000000000000000000..05f8e8d01a242415ad79f1b7bae2306dd30d94e3
> --- /dev/null
> +++ b/drivers/input/touchscreen/apple_z2.c
> @@ -0,0 +1,458 @@
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
> +	int booted;

bool.

> +	int counter;
> +	struct touchscreen_properties props;
> +	const char *fw_name;
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
> +	struct apple_z2_read_interrupt_cmd *len_cmd __free(kfree) = NULL;
> +	char *len_rx __free(kfree) = NULL;
> +	char *pkt_rx __free(kfree) = NULL;

Have you considered pre-allocating rx and tx buffers instead of doing
these allocations in the interrupt handler? You can probably have tx
buffer as part of apple_z2 structure annotated as ____cacheline_aligned,
and rx allocated separately (depending on how large it is).

> +
> +	spi_message_init(&msg);
> +	memset(&xfer, 0, sizeof(xfer));
> +	len_cmd = kzalloc(sizeof(*len_cmd), GFP_KERNEL);
> +	len_rx = kzalloc(16, GFP_KERNEL);
> +	if (!len_cmd || !len_rx)
> +		return -ENOMEM;
> +
> +	len_cmd->cmd = APPLE_Z2_CMD_READ_INTERRUPT_DATA;
> +	len_cmd->counter = z2->counter + 1;
> +	len_cmd->checksum = cpu_to_le16(APPLE_Z2_CMD_READ_INTERRUPT_DATA + 1 + z2->counter);
> +	z2->counter = 1 - z2->counter;

Is this toggling between 1 and 0? Should it be "counter = !counter"? And
is there better name than counter?

> +	xfer.tx_buf = len_cmd;
> +	xfer.rx_buf = len_rx;
> +	xfer.len = sizeof(*len_cmd);
> +
> +	spi_message_add_tail(&xfer, &msg);
> +	error = spi_sync(z2->spidev, &msg);
> +	if (error)
> +		return error;
> +
> +	pkt_len = (get_unaligned_le16(len_rx + 1) + 8) & (-4);
> +	pkt_rx = kzalloc(pkt_len, GFP_KERNEL);
> +	if (!pkt_rx)
> +		return -ENOMEM;
> +
> +	spi_message_init(&msg);
> +	memset(&xfer, 0, sizeof(xfer));
> +	xfer.rx_buf = pkt_rx;
> +	xfer.len = pkt_len;
> +
> +	spi_message_add_tail(&xfer, &msg);
> +	error = spi_sync(z2->spidev, &msg);
> +
> +	if (!error)
> +		apple_z2_parse_touches(z2, pkt_rx + 5, pkt_len - 5);
> +
> +	return error;

The preferred form is:

	error = spi_sync(...);
	if (error)
		return error;

	apple_z2_parse_touches(...);

	return 0;

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
> +	error = device_property_read_u8_array(&z2->spidev->dev, CAL_PROP_NAME, data + 10, cal_size);

What is 10? Can we have a #define for it?

> +	if (error < 0)

Does device_property_read_u8_array() return positive values on success?
If not then just "if (error)". Same for the rest of the checks.

> +		return error;
> +
> +	for (i = 0; i < cal_size; i++)
> +		checksum += data[i + 10];
> +
> +	put_unaligned_le32(checksum, data + cal_size + 10);
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
> +	if (!int_ack)
> +		return -ENOMEM;
> +	int_ack[0] = 0x1a;
> +	int_ack[1] = 0xa1;
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
> +	return 0;
> +}
> +
> +static int apple_z2_upload_firmware(struct apple_z2 *z2)
> +{
> +	const struct firmware *fw __free(firmware) = NULL;

Please keep __free() annotated definitions close to the site of first
use. In this case directly above call to request_firmware().

> +	struct apple_z2_fw_hdr *fw_hdr;
> +	size_t fw_idx = sizeof(struct apple_z2_fw_hdr);
> +	int error;
> +	u32 load_cmd;
> +	u32 size;
> +	u32 address;
> +	char *data;
> +	u8 bits_per_word;
> +	size_t cal_size;
> +	error = request_firmware(&fw, z2->fw_name, &z2->spidev->dev);
> +	if (error) {
> +		dev_err(&z2->spidev->dev, "unable to load firmware");
> +		return error;
> +	}
> +
> +	fw_hdr = (struct apple_z2_fw_hdr *)fw->data;

You are losing constness think.

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
> +		fw_idx += 4;

sizeof(u32)?

> +		if (load_cmd == LOAD_COMMAND_INIT_PAYLOAD || load_cmd == LOAD_COMMAND_SEND_BLOB) {
> +			size = le32_to_cpu(*(__le32 *)(fw->data + fw_idx));
> +			fw_idx += 4;
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
> +			address = le32_to_cpu(*(u32 *)(fw->data + fw_idx));
> +			fw_idx += 4;
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
> +	z2->booted = 1;
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
> +	z2->spidev = spi;
> +	init_completion(&z2->boot_irq);
> +	spi_set_drvdata(spi, z2);
> +
> +	z2->reset_gpio = devm_gpiod_get_index(dev, "reset", 0, 0);
> +	if (IS_ERR(z2->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(z2->reset_gpio), "unable to get reset");
> +
> +	error = devm_request_threaded_irq(dev, z2->spidev->irq, NULL,
> +					apple_z2_irq, IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					"apple-z2-irq", spi);
> +	if (error < 0)
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
> +	if (error < 0)
> +		return dev_err_probe(dev, error, "unable to initialize multitouch slots");
> +
> +	error = input_register_device(z2->input_dev);
> +	if (error < 0)
> +		return dev_err_probe(dev, error, "unable to register input device");
> +
> +	/* Reset the device on boot */
> +	gpiod_direction_output(z2->reset_gpio, 1);
> +	usleep_range(5000, 10000);
> +	return apple_z2_boot(z2);

	error = apple_z2_boot(z2);
	if (error)
		return error;

	return 0;

> +}
> +
> +static void apple_z2_shutdown(struct spi_device *spi)
> +{
> +	struct apple_z2 *z2 = spi_get_drvdata(spi);
> +
> +	disable_irq(z2->spidev->irq);
> +	gpiod_direction_output(z2->reset_gpio, 1);
> +	z2->booted = 0;
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
> +	},
> +	.id_table = apple_z2_of_id,
> +	.probe    = apple_z2_probe,
> +	.remove   = apple_z2_shutdown,

Purring the device into reset state before tearing down interrupt
handler, etc, may lead to weird errors. Why do you need to do this on
removal instead of letting devm tear down the device?

> +	.shutdown = apple_z2_shutdown,

Are you sure you need shutdown? Why?

> +};
> +
> +module_spi_driver(apple_z2_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_FIRMWARE("apple/dfrmtfw-*.bin");
> 
> -- 
> 2.47.1
> 
> 

Thanks.

-- 
Dmitry

