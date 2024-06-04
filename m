Return-Path: <linux-input+bounces-4053-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 882B28FA6B9
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 02:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC9431C21C01
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 00:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4A21FA5;
	Tue,  4 Jun 2024 00:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/Q5H8Dy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C1B674;
	Tue,  4 Jun 2024 00:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717459360; cv=none; b=IiFziItpzHgnoAgJ3XOz3KhtHnPovgYk/Cs/sNal0IsXZn26yfHMeeaif5v+lPjxW8kHhtiQSIzWuG6/SFgXRB0Cvx7k+JQLeVbVWToNbHOMkUQBy3vFq8NejN/cGyhAudD6pf/dNhVWK51bCgPsr8/cBv0aoYlGONbGGfiHPdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717459360; c=relaxed/simple;
	bh=YTEIsAlfdWgwmR39quKLWZ+2CN66tC8B47AR2KgG7uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ko6rbqsckFCnwAIVUqvbaVventosgQglpFYFnT9oZLKZWamKWNGZKil2m/bZQtHUUtIm4bwfNHY3INVDtly7N6dO19BDVgQXOolQdvtJB+WBEpF8R7hl7v6ny6/60b+tRr6qvNFOwbCQtf4Hyqa6fSGmggaz9ibQo1ykqkc967g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/Q5H8Dy; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-6c7bf648207so2112924a12.0;
        Mon, 03 Jun 2024 17:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717459358; x=1718064158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6RPcTzdQbmoPVYpLi+1a7XJcQtNQNlrqNbV6GVX/mVE=;
        b=j/Q5H8DytXb+r/Vw7O6UpArrO36gNqHCc0wmTcuFaBZYt8v8X759YXDRe6r+MUxkG5
         dxT2XuBV4cfGf8cF1i2HltuaQmZzKFb0JRouIZXHc3Upa0mQviptqYV1nb93alBcwNT6
         +BTHCadTVcDmiYt3XnFbbs3N2UxAU/BrWp7VDhLxkOsU3ZXOQkp3xc3hw/dYRavK+Hko
         psUVuvq0VaUQs+hZ0/Ck17qONwzvAM11YbDfem27uZirkFj6g7uz3Lo6heVQdu3fxhdu
         KApGOHv4eb8HNr8D77kTmGcoRBAmPxoyyNrfVCCJT06u4qMJ/rdg//hXVPTzSDGjFJWY
         tfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717459358; x=1718064158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RPcTzdQbmoPVYpLi+1a7XJcQtNQNlrqNbV6GVX/mVE=;
        b=NwKmaOA6eh2KgB1UDct1x8QfE6DzT1lbErUvkOEW7XZ+bSlw+nSFwCCWXyIQoWw3bb
         BShtyWtgNlo/zE8Aenw0Hi2qbN+cXSIX1kWTWBGW5TSUN1UBxSnmAhts8BX9Rka7uujE
         eUqbUvp0ByRT8z1qMBfMvtVuYFqYoO1AGNsOwihikSPZKE6lVcys/B91izsRLEhCX6MB
         XWvXggK3j6ADS21QhEPX0xnfysLcOGHAbgGgwvyL288xLvSOqp7OyJGI8J+KniPeUiEt
         8nb1gUOM6O5uEe0p02lA60Q6LH5Lcs+12lLU5Ks5N8IhWIvn/QR4Mg4xYGxvz0i8YvXq
         5ViQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2JIHdP9HuvMxg6SuMtO38ZNTeDrkljVD+FKt6tLCuvuPSN2SZXRxbcOnOd4gZjLcuNnYis1xFQzkzXrvgEFYyEQVGDfDmPXJfTEPeNtZX+UAHJCruPtC+/CiAMH76eobvlzBTGNv5CVxuWNbErMjnzxyNWxwmD2GBzduwhmvHFpj1fO13
X-Gm-Message-State: AOJu0YxI0p0DeeDyXhiIIKIgoVWREcuwG16viMuikS3EwQxnj0a++Ze5
	P81/Xb3kwhpW+IQIhEi+Xk8GRIrlAu3zsuS5Rdd3mpXmry/Rb5kt
X-Google-Smtp-Source: AGHT+IE7Mu3FdBaD+SAdFtZ7C45gRh30/LKckhW8YANrbdupiabvfl4z7L56LzeBYDURRU3JG2pwow==
X-Received: by 2002:a17:90a:f3cc:b0:2c1:9469:11bd with SMTP id 98e67ed59e1d1-2c1dc566890mr9673617a91.3.1717459357320;
        Mon, 03 Jun 2024 17:02:37 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:17fd:ad4d:2690:4ce2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a77ae986sm8570224a91.39.2024.06.03.17.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 17:02:36 -0700 (PDT)
Date: Mon, 3 Jun 2024 17:02:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jeff LaBundy <jeff@labundy.com>,
	catalin.popescu@leica-geosystems.com,
	mark.satterthwaite@touchnetix.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v13 3/3] Input: Add TouchNetix axiom i2c touchscreen
 driver
Message-ID: <Zl5ZmYyntq7OJOvZ@google.com>
References: <20240603153929.29218-1-kamel.bouhara@bootlin.com>
 <20240603153929.29218-4-kamel.bouhara@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603153929.29218-4-kamel.bouhara@bootlin.com>

Hi Kamel,

On Mon, Jun 03, 2024 at 05:39:25PM +0200, Kamel Bouhara wrote:
> Add a new driver for the TouchNetix's axiom family of
> touchscreen controllers. This driver only supports i2c
> and can be later adapted for SPI and USB support.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>  MAINTAINERS                                  |   2 +
>  drivers/input/touchscreen/Kconfig            |  14 +
>  drivers/input/touchscreen/Makefile           |   1 +
>  drivers/input/touchscreen/touchnetix_axiom.c | 657 +++++++++++++++++++
>  4 files changed, 674 insertions(+)
>  create mode 100644 drivers/input/touchscreen/touchnetix_axiom.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 225309db4110..a3ece12e32d7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22744,9 +22744,11 @@ F:	drivers/platform/x86/toshiba-wmi.c
>  
>  TOUCHNETIX AXIOM I2C TOUCHSCREEN DRIVER
>  M:	Kamel Bouhara <kamel.bouhara@bootlin.com>
> +M:	bsp-development.geo@leica-geosystems.com
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
> +F:	drivers/input/touchscreen/touchnetix_axiom.c
>  
>  TPM DEVICE DRIVER
>  M:	Peter Huewe <peterhuewe@gmx.de>
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index c821fe3ee794..1ce8f1c25625 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -834,6 +834,20 @@ config TOUCHSCREEN_MIGOR
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called migor_ts.
>  
> +config TOUCHSCREEN_TOUCHNETIX_AXIOM
> +	tristate "TouchNetix AXIOM based touchscreen controllers"
> +	depends on I2C
> +	select CRC16
> +	select REGMAP_I2C
> +	help
> +	  Say Y here if you have a axiom touchscreen connected to
> +	  your system.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called axiom.
> +
>  config TOUCHSCREEN_TOUCHRIGHT
>  	tristate "Touchright serial touchscreen"
>  	select SERIO
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index a81cb5aa21a5..6ce7b804adc7 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -91,6 +91,7 @@ obj-$(CONFIG_TOUCHSCREEN_SUR40)		+= sur40.o
>  obj-$(CONFIG_TOUCHSCREEN_SURFACE3_SPI)	+= surface3_spi.o
>  obj-$(CONFIG_TOUCHSCREEN_TI_AM335X_TSC)	+= ti_am335x_tsc.o
>  obj-$(CONFIG_TOUCHSCREEN_TOUCHIT213)	+= touchit213.o
> +obj-$(CONFIG_TOUCHSCREEN_TOUCHNETIX_AXIOM)	+= touchnetix_axiom.o
>  obj-$(CONFIG_TOUCHSCREEN_TOUCHRIGHT)	+= touchright.o
>  obj-$(CONFIG_TOUCHSCREEN_TOUCHWIN)	+= touchwin.o
>  obj-$(CONFIG_TOUCHSCREEN_TS4800)	+= ts4800-ts.o
> diff --git a/drivers/input/touchscreen/touchnetix_axiom.c b/drivers/input/touchscreen/touchnetix_axiom.c
> new file mode 100644
> index 000000000000..09550847392e
> --- /dev/null
> +++ b/drivers/input/touchscreen/touchnetix_axiom.c
> @@ -0,0 +1,657 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * TouchNetix axiom Touchscreen Driver
> + *
> + * Copyright (C) 2020-2023 TouchNetix Ltd.
> + *
> + * Author(s): Bart Prescott <bartp@baasheep.co.uk>
> + *            Pedro Torruella <pedro.torruella@touchnetix.com>
> + *            Mark Satterthwaite <mark.satterthwaite@touchnetix.com>
> + *            Hannah Rossiter <hannah.rossiter@touchnetix.com>
> + *            Kamel Bouhara <kamel.bouhara@bootlin.com>
> + *
> + */
> +#include <linux/bitfield.h>
> +#include <linux/crc16.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/regmap.h>
> +
> +#include <asm/unaligned.h>
> +#define AXIOM_PROX_LEVEL		-128
> +#define AXIOM_DMA_OPS_DELAY_USEC	250
> +#define AXIOM_STARTUP_TIME_MS		110
> +/*
> + * Register group u31 has 2 pages for usage table entries.
> + */
> +#define AXIOM_U31_MAX_USAGES		0xff
> +#define AXIOM_U31_BYTES_PER_USAGE	6
> +#define AXIOM_U31_PAGE0_LENGTH		0x0C
> +#define AXIOM_U31_BOOTMODE_MASK		BIT(7)
> +#define AXIOM_U31_DEVID_MASK		GENMASK(14, 0)
> +
> +#define AXIOM_MAX_REPORT_LEN		0x7f
> +
> +#define AXIOM_CMD_HEADER_READ_MASK	BIT(15)
> +#define AXIOM_U41_MAX_TARGETS		10
> +
> +#define AXIOM_U46_AUX_CHANNELS		4
> +#define AXIOM_U46_AUX_MASK		GENMASK(11, 0)
> +
> +#define AXIOM_COMMS_MAX_USAGE_PAGES	3
> +#define AXIOM_COMMS_PAGE_SIZE		256
> +#define AXIOM_COMMS_REPORT_LEN_MASK	GENMASK(6, 0)
> +
> +#define AXIOM_REPORT_USAGE_ID		0x34
> +#define AXIOM_DEVINFO_USAGE_ID		0x31
> +#define AXIOM_USAGE_2HB_REPORT_ID	0x01
> +#define AXIOM_USAGE_2AUX_REPORT_ID	0x46
> +#define AXIOM_USAGE_2DCTS_REPORT_ID	0x41
> +
> +#define AXIOM_PAGE_OFFSET_MASK		GENMASK(6, 0)
> +
> +struct axiom_devinfo {
> +	__le16 device_id;
> +	u8 fw_minor;
> +	u8 fw_major;
> +	u8 fw_info_extra;
> +	u8 tcp_revision;
> +	u8 bootloader_fw_minor;
> +	u8 bootloader_fw_major;
> +	__le16 jedec_id;
> +	u8 num_usages;
> +} __packed;
> +
> +/*
> + * Describes parameters of a specific usage, essentially a single element of
> + * the "Usage Table"
> + */
> +struct axiom_usage_entry {
> +	u8 id;
> +	u8 is_report;

This is probably a 'bool'.

> +	u8 start_page;
> +	u8 num_pages;
> +};
> +
> +/*
> + * Represents state of a touch or target when detected prior to a touch (eg.
> + * hover or proximity events).
> + */
> +enum axiom_target_state {
> +	AXIOM_TARGET_STATE_NOT_PRESENT = 0,
> +	AXIOM_TARGET_STATE_PROX = 1,
> +	AXIOM_TARGET_STATE_HOVER = 2,
> +	AXIOM_TARGET_STATE_TOUCHING = 3,
> +};
> +
> +struct axiom_u41_target {
> +	enum axiom_target_state state;
> +	u16 x;
> +	u16 y;
> +	s8 z;
> +	bool insert;

What does "insert" mean here?

> +	bool touch;
> +};
> +
> +struct axiom_target_report {
> +	u8 index;
> +	u8 present;

bool?

> +	u16 x;
> +	u16 y;
> +	s8 z;
> +};
> +
> +struct axiom_cmd_header {
> +	__le16 target_address;
> +	__le16 length;
> +} __packed;

You do not need to declare this as packed, it is naturally aligned. You
can also make it a union with __le32 to ensure overall alignment.

> +
> +struct axiom_data {
> +	struct axiom_devinfo devinfo;
> +	struct device *dev;
> +	struct gpio_desc *reset_gpio;
> +	struct i2c_client *client;
> +	struct input_dev *input_dev;
> +	u32 max_report_len;
> +	u8 rx_buf[AXIOM_COMMS_MAX_USAGE_PAGES * AXIOM_COMMS_PAGE_SIZE];
> +	struct axiom_u41_target targets[AXIOM_U41_MAX_TARGETS];
> +	struct axiom_usage_entry usage_table[AXIOM_U31_MAX_USAGES];
> +	bool usage_table_populated;
> +	struct regmap *regmap;
> +	struct touchscreen_properties	prop;
> +};
> +
> +static const struct regmap_config axiom_i2c_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.val_bits = 8,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +};
> +
> +/*
> + * axiom devices are typically configured to report touches at a rate
> + * of 100Hz (10ms) for systems that require polling for reports.
> + * When reports are polled, it will be expected to occasionally
> + * observe the overflow bit being set in the reports.
> + * This indicates that reports are not being read fast enough.
> + */
> +#define POLL_INTERVAL_DEFAULT_MS 10
> +
> +/* Translate usage/page/offset triplet into physical address. */
> +static u16 axiom_usage_to_target_address(struct axiom_data *ts, u8 usage, u8 page,
> +					 char offset)
> +{
> +	/* At the moment the convention is that u31 is always at physical address 0x0 */
> +	if (!ts->usage_table_populated) {
> +		if (usage == AXIOM_DEVINFO_USAGE_ID)
> +			return ((page << 8) + offset);
> +		else
> +			return 0xffff;
> +	}
> +
> +	if (page >= ts->usage_table[usage].num_pages) {
> +		dev_err(ts->dev, "Invalid usage table! usage: u%02x, page: %02x, offset: %02x\n",
> +			usage, page, offset);
> +		return 0xffff;
> +	}
> +
> +	return ((ts->usage_table[usage].start_page + page) << 8) + offset;
> +}
> +
> +static int axiom_read(struct axiom_data *ts, u8 usage, u8 page, void *buf, u16 len)
> +{
> +	struct axiom_cmd_header cmd_header;
> +	u32 preamble;
> +	int ret;
> +
> +	cmd_header.target_address = cpu_to_le16(axiom_usage_to_target_address(ts, usage, page, 0));
> +	cmd_header.length = cpu_to_le16(len | AXIOM_CMD_HEADER_READ_MASK);
> +
> +	preamble = get_unaligned_le32(&cmd_header);
> +
> +	ret = regmap_write(ts->regmap, preamble, 0);
> +	if (ret) {
> +		dev_err(ts->dev, "failed to write preamble, error %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_raw_read(ts->regmap, 0, buf, len);
> +	if (ret) {
> +		dev_err(ts->dev, "failed to read target address %04x, error %d\n",
> +			cmd_header.target_address, ret);
> +		return ret;
> +	}
> +
> +	/* Wait device's DMA operations */
> +	usleep_range(AXIOM_DMA_OPS_DELAY_USEC, AXIOM_DMA_OPS_DELAY_USEC + 50);

What exactly are we waiting for after getting the data?

> +
> +	return 0;
> +}
> +
> +/*
> + * One of the main purposes for reading the usage table is to identify
> + * which usages reside at which target address.
> + * When performing subsequent reads or writes to AXIOM, the target address
> + * is used to specify which usage is being accessed.
> + * Consider the following discovery code which will build up the usage table.
> + */
> +static u32 axiom_populate_usage_table(struct axiom_data *ts)
> +{
> +	struct axiom_usage_entry *usage_table;
> +	u8 *rx_data = ts->rx_buf;
> +	u32 max_report_len = 0;
> +	u32 usage_id;
> +	int error;
> +
> +	usage_table = ts->usage_table;
> +
> +	/* Read the second page of usage u31 to get the usage table */
> +	error = axiom_read(ts, AXIOM_DEVINFO_USAGE_ID, 1, rx_data,
> +			   (AXIOM_U31_BYTES_PER_USAGE * ts->devinfo.num_usages));
> +
> +	if (error)
> +		return error;
> +
> +	for (usage_id = 0; usage_id < ts->devinfo.num_usages; usage_id++) {
> +		u16 offset = (usage_id * AXIOM_U31_BYTES_PER_USAGE);
> +		u8 id = rx_data[offset + 0];
> +		u8 start_page = rx_data[offset + 1];
> +		u8 num_pages = rx_data[offset + 2];
> +		u32 max_offset = ((rx_data[offset + 3] & AXIOM_PAGE_OFFSET_MASK) + 1) * 2;
> +
> +		usage_table[id].is_report = !num_pages;
> +
> +		/* Store the entry into the usage table */
> +		usage_table[id].id = id;
> +		usage_table[id].start_page = start_page;
> +		usage_table[id].num_pages = num_pages;
> +
> +		dev_dbg(ts->dev, "Usage u%02x Info: %*ph\n", id, AXIOM_U31_BYTES_PER_USAGE,
> +			&rx_data[offset]);
> +
> +		/* Identify the max report length the module will receive */
> +		if (usage_table[id].is_report && max_offset > max_report_len)
> +			max_report_len = max_offset;
> +	}
> +
> +	ts->usage_table_populated = true;
> +
> +	return max_report_len;
> +}
> +
> +static int axiom_discover(struct axiom_data *ts)
> +{
> +	int error;
> +
> +	/*
> +	 * Fetch the first page of usage u31 to get the
> +	 * device information and the number of usages
> +	 */
> +	error = axiom_read(ts, AXIOM_DEVINFO_USAGE_ID, 0, &ts->devinfo, AXIOM_U31_PAGE0_LENGTH);
> +	if (error)
> +		return error;
> +
> +	dev_dbg(ts->dev, "  Boot Mode      : %s\n",
> +		FIELD_GET(AXIOM_U31_BOOTMODE_MASK,
> +			  le16_to_cpu(ts->devinfo.device_id)) ? "BLP" : "TCP");
> +	dev_dbg(ts->dev, "  Device ID      : %04lx\n",
> +		FIELD_GET(AXIOM_U31_DEVID_MASK, le16_to_cpu(ts->devinfo.device_id)));
> +	dev_dbg(ts->dev, "  Firmware Rev   : %02x.%02x\n", ts->devinfo.fw_major,
> +		ts->devinfo.fw_minor);
> +	dev_dbg(ts->dev, "  Bootloader Rev : %02x.%02x\n", ts->devinfo.bootloader_fw_major,
> +		ts->devinfo.bootloader_fw_minor);
> +	dev_dbg(ts->dev, "  FW Extra Info  : %04x\n", ts->devinfo.fw_info_extra);
> +	dev_dbg(ts->dev, "  Silicon        : %04x\n", le16_to_cpu(ts->devinfo.jedec_id));
> +	dev_dbg(ts->dev, "  Number usages        : %04x\n", ts->devinfo.num_usages);
> +
> +	ts->max_report_len = axiom_populate_usage_table(ts);
> +	if (!ts->max_report_len || !ts->devinfo.num_usages ||
> +	    ts->max_report_len > AXIOM_MAX_REPORT_LEN) {
> +		dev_err(ts->dev, "Invalid report length or usages number");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(ts->dev, "Max Report Length: %u\n", ts->max_report_len);
> +
> +	return 0;
> +}
> +
> +/*
> + * Support function to axiom_process_u41_report.
> + * Generates input-subsystem events for every target.
> + * After calling this function the caller shall issue
> + * a Sync to the input sub-system.
> + */
> +static bool axiom_process_u41_report_target(struct axiom_data *ts,
> +					    struct axiom_target_report *target)
> +{
> +	struct input_dev *input_dev = ts->input_dev;
> +	struct axiom_u41_target *target_prev_state;
> +	enum axiom_target_state current_state;
> +	int id;
> +
> +	/* Verify the target index */
> +	if (target->index >= AXIOM_U41_MAX_TARGETS) {
> +		dev_err(ts->dev, "Invalid target index! %u\n", target->index);
> +		return false;
> +	}
> +
> +	target_prev_state = &ts->targets[target->index];
> +
> +	current_state = AXIOM_TARGET_STATE_NOT_PRESENT;
> +
> +	if (target->present) {
> +		if (target->z >= 0)
> +			current_state = AXIOM_TARGET_STATE_TOUCHING;
> +		else if (target->z > AXIOM_PROX_LEVEL && target->z < 0)
> +			current_state = AXIOM_TARGET_STATE_HOVER;
> +		else if (target->z == AXIOM_PROX_LEVEL)
> +			current_state = AXIOM_TARGET_STATE_PROX;
> +	}
> +
> +	if (target_prev_state->state == current_state &&
> +	    target_prev_state->x == target->x &&
> +	    target_prev_state->y == target->y &&
> +	    target_prev_state->z == target->z)
> +		return false;

Why is this needed? Input/MT core already tries to suppress duplicate
events, I do not think we need to do it here.

> +
> +	id = target->index;
> +
> +	dev_dbg(ts->dev, "U41 Target T%u, present:%u, x:%u, y:%u, z:%d\n",
> +		target->index, target->present,
> +		target->x, target->y, target->z);
> +
> +	switch (current_state) {
> +	case AXIOM_TARGET_STATE_NOT_PRESENT:
> +	case AXIOM_TARGET_STATE_PROX:
> +		if (!target_prev_state->insert)
> +			break;
> +		target_prev_state->insert = false;
> +
> +		if (!id)
> +			input_report_key(input_dev, BTN_TOUCH, 0);
> +
> +		input_mt_report_slot_inactive(input_dev);
> +		/*
> +		 * make sure the previous coordinates are
> +		 * all off screen when the finger comes back
> +		 */
> +		target->x = 65535;
> +		target->y = 65535;
> +		target->z = AXIOM_PROX_LEVEL;
> +		break;
> +	case AXIOM_TARGET_STATE_HOVER:
> +	case AXIOM_TARGET_STATE_TOUCHING:
> +		target_prev_state->insert = true;
> +		input_report_abs(input_dev, ABS_MT_TRACKING_ID, id);
> +		input_report_abs(input_dev, ABS_MT_POSITION_X, target->x);
> +		input_report_abs(input_dev, ABS_MT_POSITION_Y, target->y);
> +
> +		if (current_state == AXIOM_TARGET_STATE_TOUCHING) {
> +			input_report_abs(input_dev, ABS_MT_DISTANCE, 0);
> +			input_report_abs(input_dev, ABS_DISTANCE, 0);
> +			input_report_abs(input_dev, ABS_MT_PRESSURE, target->z);
> +			input_report_abs(input_dev, ABS_PRESSURE, target->z);

You only need to emit ABS_MT_DISTANCE and ABS_MT_PRESSURE. The
single-touch variants should be generated by the input core as part of
sending out the frame.

> +		} else {
> +			input_report_abs(input_dev, ABS_MT_DISTANCE, -target->z);
> +			input_report_abs(input_dev, ABS_DISTANCE, -target->z);
> +			input_report_abs(input_dev, ABS_MT_PRESSURE, 0);
> +			input_report_abs(input_dev, ABS_PRESSURE, 0);
> +		}
> +
> +		if (!id)
> +			input_report_key(input_dev, BTN_TOUCH, (current_state ==
> +					 AXIOM_TARGET_STATE_TOUCHING));

Why do you emit BTN_TOUCH manually instead of replying on
input_mt_sync_frame() calling input_mt_pointer_emulation().

> +		break;
> +	default:
> +		break;
> +	}
> +
> +	target_prev_state->state = current_state;
> +	target_prev_state->x = target->x;
> +	target_prev_state->y = target->y;
> +	target_prev_state->z = target->z;
> +
> +	return true;
> +}
> +
> +/*
> + * U41 is the output report of the 2D CTS and contains the status of targets
> + * (including contacts and pre-contacts) along with their X,Y,Z values.
> + * When a target has been removed (no longer detected),
> + * the corresponding X,Y,Z values will be zeroed.
> + */
> +static bool axiom_process_u41_report(struct axiom_data *ts, u8 *rx_buf)
> +{
> +	struct axiom_target_report target;
> +	bool update_done = false;
> +	u16 target_status;
> +	int i;
> +
> +	target_status = get_unaligned_le16(rx_buf + 1);
> +
> +	for (i = 0; i < AXIOM_U41_MAX_TARGETS; i++) {
> +		u8 *target_step = &rx_buf[i * 4];
> +
> +		target.index = i;
> +		input_mt_slot(ts->input_dev, i);
> +		input_mt_report_slot_state(ts->input_dev, MT_TOOL_FINGER, true);
> +		target.present = ((target_status & (1 << i)) != 0) ? 1 : 0;
> +		target.x = get_unaligned_le16(target_step + 3);
> +		target.y = get_unaligned_le16(target_step + 5);
> +		target.z = (s8)(rx_buf[i + 43]);
> +		touchscreen_report_pos(ts->input_dev, &ts->prop, target.x, target.y, true);

I find it confusing that you send out coordinates here, and the rest of
events in axiom_process_u41_report_target()... Can it all be done in one
place?

> +		update_done |= axiom_process_u41_report_target(ts, &target);
> +	}
> +
> +	return update_done;
> +}
> +
> +/*
> + * U46 report contains a low level measurement data generated by the capacitive
> + * displacement sensor (CDS) algorithms from the auxiliary channels.
> + * This information is useful when tuning multi-press to assess mechanical
> + * consistency in the unit's construction.
> + */
> +static void axiom_process_u46_report(struct axiom_data *ts, u8 *rx_buf)
> +{
> +	struct input_dev *input_dev = ts->input_dev;
> +	u32 event_value;
> +	u16 aux_value;
> +	int i;
> +
> +	for (i = 0; i < AXIOM_U46_AUX_CHANNELS; i++) {
> +		u8 *target_step = &rx_buf[i * 2];
> +
> +		input_mt_slot(input_dev, i);
> +		input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, true);
> +		aux_value = get_unaligned_le16(target_step + 1) & AXIOM_U46_AUX_MASK;
> +		event_value = (i << 16) | (aux_value);
> +		input_event(input_dev, EV_MSC, MSC_RAW, event_value);

This does not really belong to the input subsystem. I recommend using
debugfs to provide this data. Some drivers also use v4l to provide a
"picture" of the heat map.

> +	}
> +}
> +
> +/*
> + * Validates the crc and demultiplexes the axiom reports to the appropriate
> + * report handler
> + */
> +static int axiom_handle_events(struct axiom_data *ts)
> +{
> +	struct input_dev *input_dev = ts->input_dev;
> +	u8 *report_data = ts->rx_buf;
> +	struct device *dev = ts->dev;
> +	u16 crc_report;
> +	u8 *crc_bytes;
> +	u16 crc_calc;
> +	int error;
> +	u8 len;
> +
> +	error = axiom_read(ts, AXIOM_REPORT_USAGE_ID, 0, report_data, ts->max_report_len);
> +	if (error)
> +		return error;
> +
> +	len = (report_data[0] & AXIOM_COMMS_REPORT_LEN_MASK) << 1;
> +	if (len <= 2) {
> +		dev_err(dev, "Zero length report discarded.\n");
> +		return -ENODATA;
> +	}
> +
> +	/* Validate the report CRC */
> +	crc_bytes = &report_data[len];
> +
> +	crc_report = get_unaligned_le16(crc_bytes - 2);
> +	/* Length is in 16 bit words and remove the size of the CRC16 itself */
> +	crc_calc = crc16(0, report_data, (len - 2));
> +
> +	if (crc_calc != crc_report) {
> +		dev_err(dev,
> +			"CRC mismatch! Expected: %#x, Calculated CRC: %#x.\n",
> +			crc_report, crc_calc);
> +		return -EINVAL;
> +	}
> +
> +	switch (report_data[1]) {
> +	case AXIOM_USAGE_2DCTS_REPORT_ID:
> +		if (axiom_process_u41_report(ts, &report_data[1])) {
> +			input_mt_sync_frame(input_dev);
> +			input_sync(input_dev);
> +		}
> +		break;
> +
> +	case AXIOM_USAGE_2AUX_REPORT_ID:
> +		/* This is an aux report (force) */
> +		axiom_process_u46_report(ts, &report_data[1]);
> +		input_mt_sync(input_dev);
> +		input_sync(input_dev);
> +		break;
> +
> +	case AXIOM_USAGE_2HB_REPORT_ID:
> +		/* This is a heartbeat report */
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void axiom_i2c_poll(struct input_dev *input_dev)
> +{
> +	struct axiom_data *ts = input_get_drvdata(input_dev);
> +
> +	axiom_handle_events(ts);
> +}
> +
> +static irqreturn_t axiom_irq(int irq, void *dev_id)
> +{
> +	struct axiom_data *ts = dev_id;
> +
> +	axiom_handle_events(ts);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void axiom_reset(struct gpio_desc *reset_gpio)
> +{
> +	gpiod_set_value_cansleep(reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(reset_gpio, 0);
> +	msleep(AXIOM_STARTUP_TIME_MS);
> +}
> +
> +static int axiom_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct input_dev *input_dev;
> +	struct axiom_data *ts;
> +	u32 poll_interval;
> +	int target;
> +	int error;
> +
> +	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
> +	if (!ts)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, ts);
> +	ts->client = client;
> +	ts->dev = dev;
> +
> +	ts->regmap = devm_regmap_init_i2c(client, &axiom_i2c_regmap_config);
> +	error = PTR_ERR_OR_ZERO(ts->regmap);
> +	if (error) {
> +		dev_err(dev, "Failed to initialize regmap: %d\n", error);
> +		return error;
> +	}
> +
> +	error = devm_regulator_get_enable(dev, "vddi");
> +	if (error)
> +		return dev_err_probe(&client->dev, error,
> +				     "Failed to enable VDDI regulator\n");
> +
> +	error = devm_regulator_get_enable(dev, "vdda");
> +	if (error)
> +		return dev_err_probe(&client->dev, error,
> +				     "Failed to enable VDDA regulator\n");
> +
> +	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ts->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ts->reset_gpio), "failed to get reset GPIO\n");
> +
> +	if (ts->reset_gpio)
> +		axiom_reset(ts->reset_gpio);
> +	else
> +		msleep(AXIOM_STARTUP_TIME_MS);

Should this be called unconditionally (and matching msleep() be removed
from axiom_i2c_probe)?

> +
> +	error = axiom_discover(ts);
> +	if (error)
> +		return dev_err_probe(dev, error, "Failed touchscreen discover\n");
> +
> +	input_dev = devm_input_allocate_device(ts->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	input_dev->name = "TouchNetix axiom Touchscreen";
> +	input_dev->phys = "input/axiom_ts";
> +
> +	input_set_abs_params(input_dev, ABS_MT_POSITION_X, 0, 65535, 0, 0);
> +	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 0, 65535, 0, 0);
> +	input_set_abs_params(input_dev, ABS_MT_TOOL_TYPE, 0, MT_TOOL_MAX, 0, 0);

The only tool you report is finger, who do you declare more?

> +	input_set_abs_params(input_dev, ABS_MT_DISTANCE, 0, 127, 0, 0);
> +	input_set_abs_params(input_dev, ABS_MT_PRESSURE, 0, 127, 0, 0);
> +
> +	touchscreen_parse_properties(input_dev, true, &ts->prop);
> +
> +	/* Registers the axiom device as a touchscreen instead of a mouse pointer */
> +	error = input_mt_init_slots(input_dev, AXIOM_U41_MAX_TARGETS, INPUT_MT_DIRECT);
> +	if (error)
> +		return error;
> +
> +	/* Enables the raw data for up to 4 force channels to be sent to the input subsystem */
> +	set_bit(EV_REL, input_dev->evbit);

The driver does not emit any relative events...

> +	set_bit(EV_MSC, input_dev->evbit);
> +	/* Declare that we support "RAW" Miscellaneous events */
> +	set_bit(MSC_RAW, input_dev->mscbit);
> +
> +	ts->input_dev = input_dev;
> +	input_set_drvdata(ts->input_dev, ts);
> +
> +	/* Ensure that all reports are initialised to not be present. */
> +	for (target = 0; target < AXIOM_U41_MAX_TARGETS; target++)
> +		ts->targets[target].state = AXIOM_TARGET_STATE_NOT_PRESENT;
> +
> +	error = devm_request_threaded_irq(dev, client->irq, NULL,
> +					  axiom_irq, IRQF_ONESHOT, dev_name(dev), ts);
> +	if (error) {
> +		dev_info(dev, "Request irq failed, falling back to polling mode");

I do not think you should fall back to polling mode if you fail to get
interrupt. If it was not specified (client->irq) then I can see that we
might want to fall back, but if the system configured for using
interrupt and you can not get it you should bail out.

> +
> +		error = input_setup_polling(input_dev, axiom_i2c_poll);
> +		if (error)
> +			return dev_err_probe(ts->dev, error, "Unable to set up polling mode\n");
> +
> +		if (!device_property_read_u32(ts->dev, "poll-interval", &poll_interval))
> +			input_set_poll_interval(input_dev, poll_interval);
> +		else
> +			input_set_poll_interval(input_dev, POLL_INTERVAL_DEFAULT_MS);
> +	}
> +
> +	return input_register_device(input_dev);

Please use

	error = input_register_device(..);
	if (error)
		return dev_err_probe(...);

	return 0;

Thanks.

-- 
Dmitry

