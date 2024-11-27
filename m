Return-Path: <linux-input+bounces-8262-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 083769DA09A
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 03:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3AA6163E5E
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 02:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F6F200CD;
	Wed, 27 Nov 2024 02:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VC7VrL6B"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C3B1BC3F;
	Wed, 27 Nov 2024 02:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732674127; cv=none; b=lADgy684PYiXKh+Ut+NJztxIMoD62lDujYHAAXTiEvFdHEKrF46Uap8+VX+2FKfecfnaT5JDm6BKSKKJNmU+KB16yXmgPGho4RO2N+HOxl0FkiyEc8V4IPg7pXgNLk6FZ/EWYjDfaJdi0dh8diEgRTt7bsHNc0jXfcg+OG5o9Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732674127; c=relaxed/simple;
	bh=3lRfdSKfdygnoJdDEjLtws1Dp19e1ovU6mEmy+qOIsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3Ip/acfs1x61DYCTLTgZgTkcTjFcBTMhZeI4WPvdGXQOefi26k9XxZ1ah4B8gvpirIIy1uif3dBigW6JwFeKtddDBa/zHHPXZ8ahQ5gk4UBTQjxu7UaieQgRldViCmFgEHCEvMjgCP/KfNq4YptneZ/Qysep1OvfDLOZRXES1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VC7VrL6B; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-724e6c53fe2so4152714b3a.3;
        Tue, 26 Nov 2024 18:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732674124; x=1733278924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U6cFMA97wMCUPk4FMY/xe15A0vCYHHeAmrFxkhhEQC8=;
        b=VC7VrL6BZPdMUbHnNB5s1/D/WkwUTP/jHrtUsJa//Y5ws35D0pXG39K1ZR5TFZhEOY
         aH2vZW6r3hsBB+rNOweCNMb0YfmBC1X64xCMhLY3WbGRWBdZU4+wDqMurx3jKBy126bI
         JJMc3/aoHxKtHA2K57GoIpXMGF1RqtwP1caPs5wQuHNnR4RR9kacSrzLvQPVBg1wL6ip
         t+OOeR2AW6AuRbGYVv3hp0INwWg7asoZTQPSk6m//OK5CdJZvfabyKYwaoBrDjWJ1VBD
         VqJv099EMDYNZtlopI040OMx5AkIEIQAzN17Ma9NP7XRYTAHb8kZkR0gkYwGBCo5EenU
         lvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732674124; x=1733278924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6cFMA97wMCUPk4FMY/xe15A0vCYHHeAmrFxkhhEQC8=;
        b=ffYAET5kR8Gtqd4Ndmtk34/wPN3usviHgUF6gcmaDoYeYAFuMObxZYefTiYZ8i1tWn
         7BCqFPDfW68j6Y+XFkGfBCVMUaa05XkVQdi/aNt6em+B2/IKuJOVVFooGqmRj5MAE2kd
         CvNjfWnb4Ow3xkwie8tmi74satTtaJu0YADXqLvMQCGV66uEkZX4IJtc9GmcgERWDCTQ
         aLnIJtFPvz+eyPYx1zdIT09lNZKM8K1ScQTwYw+V4KucQrTCIfqLNoVMrUfkja+O698l
         MRaBdq66W7cm3RBeBFwMBiI56rzQzzwTba4D+6VtMYB6ZjzJsvF4PgZiEw7ku/gxeOAs
         up+g==
X-Forwarded-Encrypted: i=1; AJvYcCUiEYyYciFQ559WCq6vf+gYscIFt0UNWXqUXVqNlBIxqPIM3lp3Qt284HOb257Geb4xpv+J8RrCu5O7WiW4@vger.kernel.org, AJvYcCVPrmRiwEdH+RIZqOelY/sLlm3ogwuxBd3K14KcFcFzRXFBXL4q51O17FRfXd8dlPUtmdbeB5W3eSh/@vger.kernel.org, AJvYcCXiHnSZ2lQtZ+RbYi2olSHimtYY2mohnviUIahDOYDQmgkZzyv3VYRNpmqExtzxgyerGEu0jHrVxuk2u0c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt9UO7v9Jhni5qXMHdn8qcycHL5oFdMS+yjMCot9ZG1smBWLhX
	jtpWccoJQrdcQJfFMNi7OVwT/RYDRZafbVnO65sfC0EFmZRrYF7ovh/eug==
X-Gm-Gg: ASbGncvsPeeea8Uw6bX2uNvxZUybnRuTwnxaYLga438G0N1Kk+08lspXWHFl7zkw7G7
	sqqsz+gwMOp/VOyD6mqaGXV8L8sk5mtE/CZGQ36xzHaXv+OLFsQ4tyCUoEz0KVCh38t0dWWKV5Z
	bp2yrNiG9CU1Sd2XgixAM0XKM7Q9RCekl1B4sEM/jiAp1qJpkA60/JWi1JbPnrMmqa0D7krnHS2
	qLZllFCqZf6H3dzIUiD/MaN8ovbenQZzctc0jZdHeLZrostBK4=
X-Google-Smtp-Source: AGHT+IF7DB3GIhD4ucxQGS0qe6L7IpexwNdheNcQXCo5anRmV02PU8nV7KQt6qlPQNDAklrGZyIlgQ==
X-Received: by 2002:a05:6a00:b52:b0:71e:7174:3ae with SMTP id d2e1a72fcca58-7253004d67bmr1838422b3a.11.1732674124062;
        Tue, 26 Nov 2024 18:22:04 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de575d9asm9070855b3a.178.2024.11.26.18.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 18:22:03 -0800 (PST)
Date: Tue, 26 Nov 2024 18:22:00 -0800
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
Subject: Re: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z0aCSBNEAJlgNIAI@google.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-z2-v1-2-c43c4cc6200d@gmail.com>

Hi Sasha,

On Tue, Nov 26, 2024 at 09:48:00PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds a driver for Apple touchscreens using the Z2 protocol.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/input/touchscreen/Kconfig    |  13 +
>  drivers/input/touchscreen/Makefile   |   1 +
>  drivers/input/touchscreen/apple_z2.c | 495 +++++++++++++++++++++++++++++++++++
>  3 files changed, 509 insertions(+)
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
> index 0000000000000000000000000000000000000000..9f57708b3d1749bf23db6132d25cbb47fd622a9f
> --- /dev/null
> +++ b/drivers/input/touchscreen/apple_z2.c
> @@ -0,0 +1,495 @@
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
> +
> +struct apple_z2 {
> +	struct spi_device *spidev;
> +	struct gpio_desc *cs_gpio;
> +	struct gpio_desc *reset_gpio;
> +	struct input_dev *input_dev;
> +	struct completion boot_irq;
> +	int booted;
> +	int open;
> +	int counter;
> +	int y_size;
> +	const char *fw_name;
> +	const char *cal_blob;
> +	int cal_size;
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
> +} __packed;
> +
> +struct apple_z2_hbpp_blob_hdr {
> +	u16 cmd;
> +	u16 len;
> +	u32 addr;
> +	u16 checksum;

Does this need endianness annotation? It is being sent to the device...

> +} __packed;
> +
> +struct apple_z2_fw_hdr {
> +	u32 magic;
> +	u32 version;
> +} __packed;
> +
> +struct apple_z2_read_interrupt_cmd {
> +	u8 cmd;
> +	u8 counter;
> +	u8 unused[12];
> +	__le16 checksum;
> +} __packed;

Do these need to be packed? They seem to be naturally aligned.

> +
> +static void apple_z2_parse_touches(struct apple_z2 *z2, char *msg, size_t msg_len)
> +{
> +	int i;
> +	int nfingers;
> +	int slot;
> +	int slot_valid;
> +	struct apple_z2_finger *fingers;
> +
> +	if (!z2->open)
> +		return;

I do not think you need to check this condition (and need to track
whether the device is open or closed). The input core will not be
delivering events for a closed device even if you try sending them.

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
> +		input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid);
> +		if (!slot_valid)
> +			continue;

Shorter form:

		if (!input_mt_report_slot_state(...))
			continue;

> +		input_report_abs(z2->input_dev, ABS_MT_POSITION_X,
> +				 le16_to_cpu(fingers[i].abs_x));
> +		input_report_abs(z2->input_dev, ABS_MT_POSITION_Y,
> +				 z2->y_size - le16_to_cpu(fingers[i].abs_y));
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
> +static int apple_z2_spi_sync(struct apple_z2 *z2, struct spi_message *msg)
> +{
> +	int error;
> +
> +	if (z2->cs_gpio)
> +		gpiod_direction_output(z2->cs_gpio, 0);
> +
> +	error = spi_sync(z2->spidev, msg);
> +
> +	if (z2->cs_gpio)
> +		gpiod_direction_output(z2->cs_gpio, 1);

As I mentioned the CS quirk needs to be at the SPI controller level.

> +
> +	return error;
> +}
> +
> +static int apple_z2_read_packet(struct apple_z2 *z2)
> +{
> +	struct spi_message msg;
> +	struct spi_transfer xfer;
> +	struct apple_z2_read_interrupt_cmd len_cmd;
> +	char len_rx[16];
> +	size_t pkt_len;
> +	char *pkt_rx;
> +	int error;
> +
> +	spi_message_init(&msg);
> +	memset(&xfer, 0, sizeof(xfer));
> +	memset(&len_cmd, 0, sizeof(len_cmd));
> +
> +	len_cmd.cmd = APPLE_Z2_CMD_READ_INTERRUPT_DATA;
> +	len_cmd.counter = z2->counter + 1;
> +	len_cmd.checksum = cpu_to_le16(APPLE_Z2_CMD_READ_INTERRUPT_DATA + 1 + z2->counter);
> +	z2->counter = 1 - z2->counter;
> +	xfer.tx_buf = &len_cmd;
> +	xfer.rx_buf = len_rx;
> +	xfer.len = sizeof(len_cmd);
> +
> +	spi_message_add_tail(&xfer, &msg);
> +	error = apple_z2_spi_sync(z2, &msg);
> +	if (error)
> +		return error;
> +
> +	pkt_len = (get_unaligned_le16(len_rx + 1) + 8) & (-4);
> +	pkt_rx = kzalloc(pkt_len, GFP_KERNEL);

Please use __free(kfree) cleanup for temp allocations.

> +	if (!pkt_rx)
> +		return -ENOMEM;
> +
> +	spi_message_init(&msg);
> +	memset(&xfer, 0, sizeof(xfer));
> +	xfer.rx_buf = pkt_rx;
> +	xfer.len = pkt_len;
> +
> +	spi_message_add_tail(&xfer, &msg);
> +	error = apple_z2_spi_sync(z2, &msg);
> +
> +	if (!error)
> +		apple_z2_parse_touches(z2, pkt_rx + 5, pkt_len - 5);
> +
> +	kfree(pkt_rx);
> +	return error;
> +}
> +
> +static irqreturn_t apple_z2_irq(int irq, void *data)
> +{
> +	struct spi_device *spi = data;
> +	struct apple_z2 *z2 = spi_get_drvdata(spi);
> +
> +	if (!z2->booted)

unlikely()?

> +		complete(&z2->boot_irq);
> +	else
> +		apple_z2_read_packet(z2);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void apple_z2_build_cal_blob(struct apple_z2 *z2, u32 address, char *data)
> +{
> +	u16 len_words = (z2->cal_size + 3) / 4;
> +	u32 checksum = 0;
> +	u16 checksum_hdr = 0;
> +	int i;
> +	struct apple_z2_hbpp_blob_hdr *hdr;
> +
> +	hdr = (struct apple_z2_hbpp_blob_hdr *)data;
> +	hdr->cmd = APPLE_Z2_HBPP_CMD_BLOB;
> +	hdr->len = len_words;
> +	hdr->addr = address;
> +
> +	for (i = 2; i < 8; i++)
> +		checksum_hdr += data[i];
> +
> +	hdr->checksum = checksum_hdr;
> +	memcpy(data + 10, z2->cal_blob, z2->cal_size);
> +
> +	for (i = 0; i < z2->cal_size; i++)
> +		checksum += z2->cal_blob[i];
> +
> +	*(u32 *)(data + z2->cal_size + 10) = checksum;

Endianness? cpu_to_Xe32() or put_unaligned_Xe32().

> +}
> +
> +static int apple_z2_send_firmware_blob(struct apple_z2 *z2, const char *data, u32 size, u8 bpw)
> +{
> +	struct spi_message msg;
> +	struct spi_transfer blob_xfer, ack_xfer;
> +	char int_ack[] = {0x1a, 0xa1};
> +	char ack_rsp[] = {0, 0};
> +	int error;
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
> +	ack_xfer.rx_buf = ack_rsp;

I think these buffers need to be DMA-safe.

> +	ack_xfer.len = 2;
> +	spi_message_add_tail(&ack_xfer, &msg);
> +
> +	reinit_completion(&z2->boot_irq);
> +	error = apple_z2_spi_sync(z2, &msg);
> +	if (error)
> +		return error;
> +	wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
> +	return 0;
> +}
> +
> +static int apple_z2_upload_firmware(struct apple_z2 *z2)
> +{
> +	const struct firmware *fw;
> +	struct apple_z2_fw_hdr *fw_hdr;
> +	size_t fw_idx = sizeof(struct apple_z2_fw_hdr);
> +	int error;
> +	u32 load_cmd;
> +	u32 size;
> +	u32 address;
> +	char *data;
> +	u8 bits_per_word;
> +
> +	error = request_firmware(&fw, z2->fw_name, &z2->spidev->dev);

Please use __free(firmware) annotation.

> +	if (error) {
> +		dev_err(&z2->spidev->dev, "unable to load firmware");
> +		return error;
> +	}
> +
> +	fw_hdr = (struct apple_z2_fw_hdr *)fw->data;
> +	if (fw_hdr->magic != APPLE_Z2_FW_MAGIC || fw_hdr->version != 1) {
> +		dev_err(&z2->spidev->dev, "invalid firmware header");
> +		return -EINVAL;
> +	}
> +
> +	while (fw_idx < fw->size) {
> +		if (fw->size - fw_idx < 8) {
> +			dev_err(&z2->spidev->dev, "firmware malformed");

Maybe check this before uploading half of it?

> +			error = -EINVAL;
> +			goto error;
> +		}
> +
> +		load_cmd = *(u32 *)(fw->data + fw_idx);

Please review endianness handling of firmware upload.

> +		fw_idx += 4;
> +		if (load_cmd == LOAD_COMMAND_INIT_PAYLOAD || load_cmd == LOAD_COMMAND_SEND_BLOB) {
> +			size = *(u32 *)(fw->data + fw_idx);
> +			fw_idx += 4;
> +			if (fw->size - fw_idx < size) {
> +				dev_err(&z2->spidev->dev, "firmware malformed");
> +				error = -EINVAL;
> +				goto error;
> +			}
> +			bits_per_word = load_cmd == LOAD_COMMAND_SEND_BLOB ? 16 : 8;
> +			error = apple_z2_send_firmware_blob(z2, fw->data + fw_idx,
> +							    size, bits_per_word);
> +			if (error)
> +				goto error;
> +			fw_idx += size;
> +		} else if (load_cmd == 2) {
> +			address = *(u32 *)(fw->data + fw_idx);
> +			fw_idx += 4;
> +			if (z2->cal_size != 0) {
> +				size = z2->cal_size + sizeof(struct apple_z2_hbpp_blob_hdr) + 4;
> +				data = kzalloc(size, GFP_KERNEL);
> +				apple_z2_build_cal_blob(z2, address, data);
> +				error = apple_z2_send_firmware_blob(z2, data, size, 16);
> +				kfree(data);
> +				if (error)
> +					goto error;
> +			}
> +		} else {
> +			dev_err(&z2->spidev->dev, "firmware malformed");
> +			error = -EINVAL;
> +			goto error;
> +		}
> +		if (fw_idx % 4 != 0)
> +			fw_idx += 4 - (fw_idx % 4);
> +	}
> +
> +
> +	z2->booted = 1;
> +	apple_z2_read_packet(z2);
> + error:
> +	release_firmware(fw);
> +	return error;
> +}
> +
> +static int apple_z2_boot(struct apple_z2 *z2)
> +{
> +	int timeout;
> +
> +	enable_irq(z2->spidev->irq);
> +	gpiod_direction_output(z2->reset_gpio, 0);
> +	timeout = wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
> +	if (timeout == 0)
> +		return -ETIMEDOUT;
> +	return apple_z2_upload_firmware(z2);
> +}
> +
> +static int apple_z2_open(struct input_dev *dev)
> +{
> +	struct apple_z2 *z2 = input_get_drvdata(dev);
> +	int error;
> +
> +	/* Reset the device on boot */
> +	gpiod_direction_output(z2->reset_gpio, 1);
> +	usleep_range(5000, 10000);
> +	error = apple_z2_boot(z2);

Why can't we wait for the boot in probe()? We can mark the driver as
preferring asynchronous probe to not delay the overall boot process.

> +	if (error) {
> +		gpiod_direction_output(z2->reset_gpio, 1);
> +		disable_irq(z2->spidev->irq);
> +	} else
> +		z2->open = 1;
> +	return error;
> +}
> +
> +static void apple_z2_close(struct input_dev *dev)
> +{
> +	struct apple_z2 *z2 = input_get_drvdata(dev);
> +
> +	disable_irq(z2->spidev->irq);
> +	gpiod_direction_output(z2->reset_gpio, 1);
> +	z2->open = 0;
> +	z2->booted = 0;
> +}
> +
> +static int apple_z2_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct apple_z2 *z2;
> +	int error;
> +	const char *label;
> +	struct touchscreen_properties props;
> +
> +	z2 = devm_kzalloc(dev, sizeof(*z2), GFP_KERNEL);
> +	if (!z2)
> +		return -ENOMEM;
> +
> +	z2->spidev = spi;
> +	init_completion(&z2->boot_irq);
> +	spi_set_drvdata(spi, z2);
> +
> +	z2->cs_gpio = devm_gpiod_get_index(dev, "cs", 0, 0);
> +	if (IS_ERR(z2->cs_gpio)) {
> +		if (PTR_ERR(z2->cs_gpio) != -ENOENT) {
> +			dev_err(dev, "unable to get cs");
> +			return PTR_ERR(z2->cs_gpio);
> +		}
> +		z2->cs_gpio = NULL;
> +	}
> +
> +	z2->reset_gpio = devm_gpiod_get_index(dev, "reset", 0, 0);
> +	if (IS_ERR(z2->reset_gpio)) {
> +		dev_err(dev, "unable to get reset");
> +		return PTR_ERR(z2->reset_gpio);
> +	}
> +
> +	error = devm_request_threaded_irq(dev, z2->spidev->irq, NULL,
> +					apple_z2_irq, IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					"apple-z2-irq", spi);
> +	if (error < 0) {
> +		dev_err(dev, "unable to request irq");
> +		return z2->spidev->irq;
> +	}
> +
> +	error = device_property_read_string(dev, "label", &label);
> +	if (error) {
> +		dev_err(dev, "unable to get device name");
> +		return error;
> +	}
> +
> +	error = device_property_read_string(dev, "firmware-name", &z2->fw_name);
> +	if (error) {
> +		dev_err(dev, "unable to get firmware name");
> +		return error;
> +	}
> +
> +	z2->cal_blob = of_get_property(dev->of_node, "apple,z2-cal-blob", &z2->cal_size);

I would prefer if we used generic device property API instead of
OF-specific one. I know we do not have direct replacement of
of_get_property(), but we need to make a copy anyway, so we can use
device_property_read_u8_array() when we build calibration blob instead
of doing it at probe time.

> +	if (!z2->cal_blob) {
> +		dev_warn(dev, "unable to get calibration, precision may be degraded");
> +		z2->cal_size = 0;
> +	}
> +
> +	z2->input_dev = devm_input_allocate_device(dev);
> +	if (!z2->input_dev)
> +		return -ENOMEM;
> +	z2->input_dev->name = label;
> +	z2->input_dev->phys = "apple_z2";
> +	z2->input_dev->dev.parent = dev;

Not needed because of devm_input_allocate_device(), please drop.

> +	z2->input_dev->id.bustype = BUS_SPI;
> +	z2->input_dev->open = apple_z2_open;
> +	z2->input_dev->close = apple_z2_close;
> +
> +	/* Allocate the axes before setting from DT */
> +	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_X, 0, 0, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_Y, 0, 0, 0, 0);
> +	touchscreen_parse_properties(z2->input_dev, true, &props);
> +	z2->y_size = props.max_y;

You can use input_abs_get_max() to get max coordinate, no need to store
it separately. OTOH you should use touchscreen_report_pos() and use
device property to indicate that the axis is inverted.

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
> +	if (error < 0) {

	if (error) {

> +		dev_err(dev, "unable to initialize multitouch slots");
> +		return error;
> +	}
> +
> +	error = input_register_device(z2->input_dev);
> +	if (error < 0)

	if (error) {

> +		dev_err(dev, "unable to register input device");

		return error;
	}

> +
> +	return error;

	return 0;

> +}
> +
> +static const struct of_device_id apple_z2_of_match[] = {
> +	{ .compatible = "apple,z2-multitouch" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, apple_z2_of_match);
> +
> +static struct spi_device_id apple_z2_of_id[] = {
> +	{ .name = "j293-touchbar" },
> +	{ .name = "j493-touchbar" },
> +	{ .name = "z2-touchbar" },

Why do you need these extra IDs?

> +	{ .name = "z2-multitouch" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, apple_z2_of_id);
> +
> +static struct spi_driver apple_z2_driver = {
> +	.driver = {
> +		.name	= "apple-z2",
> +		.owner = THIS_MODULE,

This is no longer needed, module_spi_driver() will take care of setting
this.

> +		.of_match_table = of_match_ptr(apple_z2_of_match),
> +	},
> +	.id_table       = apple_z2_of_id,
> +	.probe		= apple_z2_probe,
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

