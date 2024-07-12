Return-Path: <linux-input+bounces-5003-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3478E92F78D
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 11:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 534031C217CC
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE6714374D;
	Fri, 12 Jul 2024 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UwS9a9JS"
X-Original-To: linux-input@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065852E3E5;
	Fri, 12 Jul 2024 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720775274; cv=none; b=S21SYI2L7eB8ZFRBJT7ZV19Ic/LCvcaVHnCGYDMJddMh2w/AwsrX/fwR/79GlRisbw6O4icPFdtJTokUurc9C7+qnV0QLo/5x73v/X8kCWTfClh84GLne6H7wgPNet35tkJA/Kual6DV4gES+dxlSbgGnlwmoSJERQvYOfSsD0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720775274; c=relaxed/simple;
	bh=4D+7XgIZ0ndzH3bvLOTcOGfsK9NLDXQNUxed1i/Q3Vs=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=N0tqFtJXFSeGQvEFWxXs/ThteXAselMAV/CU3B9iJgwd9onBHq+/alKdSYp4sch/WgzgNFnkerfCIYkmk08DP4Rx7aYpJMiMr0zT6tg7q+amIxHAxNteVDHZaBVjStvBJuYBCFjzVg8XAr+EH+4VTjcBMPfqLUJAV+arp/ofolM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UwS9a9JS; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 31EBCE0009;
	Fri, 12 Jul 2024 09:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720775263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWK+hdtT5i1RebZaiDl0mAnVLdiESL3eMzd/5G8jDR4=;
	b=UwS9a9JSCkcJZ2K8I0QUHnG9Ql4Xf0jaDmQVVfpyKnnRV5NMzOPq+DeDLUkJaQx5ZCt1X6
	DzsnQPFidej3FD8C84ZoN6Gvy9uA1N4jL0SD8bMkxZDMq7cBzPHRq6W2w/T/5MDGTyi+Zn
	MSSEs8RmenVpEyO48MA8Ib/bPI5s5+S3HM8E4L0BuePZeRiGSeXsa2FBobwa79MvuMAOT6
	Khsmu4nXiPS5m5vZ2HAi5Y/tH0FMBNoX3ROGiLPtDwkI9WZoH74WSdnxs1ZEbsdjSXMvLK
	JaTeHZzZhWl536FuP9RYrnKOs6wWs9utK79fkPk2a0qNID91Da01Sji9P2QSbg==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 12 Jul 2024 11:07:43 +0200
From: Kamel BOUHARA <kamel.bouhara@bootlin.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Marco Felsch
 <m.felsch@pengutronix.de>, catalin.popescu@leica-geosystems.com,
 mark.satterthwaite@touchnetix.com, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Gregory Clement
 <gregory.clement@bootlin.com>, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v16 3/3] Input: Add TouchNetix axiom i2c touchscreen
 driver
In-Reply-To: <ZorqmaYfsGFd4HN0@nixie71>
References: <20240703142520.207066-1-kamel.bouhara@bootlin.com>
 <20240703142520.207066-4-kamel.bouhara@bootlin.com>
 <ZorqmaYfsGFd4HN0@nixie71>
Message-ID: <a38609ed1d2a181287f4758e3272c553@bootlin.com>
X-Sender: kamel.bouhara@bootlin.com
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kamel.bouhara@bootlin.com

Le 2024-07-07 21:20, Jeff LaBundy a écrit :
> Hi Kamel,
> 

Hello Jeff,

> On Wed, Jul 03, 2024 at 04:25:18PM +0200, Kamel Bouhara wrote:
>> Add a new driver for the TouchNetix's axiom family of
>> touchscreen controllers. This driver only supports i2c
>> and can be later adapted for SPI and USB support.
>> 
>> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
>> ---
> 
> This is coming together nicely; just a few trailing comments on
> top of Marco's feedback.
> 
>>  MAINTAINERS                                  |   1 +
>>  drivers/input/touchscreen/Kconfig            |  14 +
>>  drivers/input/touchscreen/Makefile           |   1 +
>>  drivers/input/touchscreen/touchnetix_axiom.c | 616 
>> +++++++++++++++++++
>>  4 files changed, 632 insertions(+)
>>  create mode 100644 drivers/input/touchscreen/touchnetix_axiom.c
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 2041384d3866..ac6b612bfbba 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22745,6 +22745,7 @@ M:	Kamel Bouhara <kamel.bouhara@bootlin.com>
>>  L:	linux-input@vger.kernel.org
>>  S:	Maintained
>>  
>> F:	Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
>> +F:	drivers/input/touchscreen/touchnetix_axiom.c
>> 
>>  TPM DEVICE DRIVER
>>  M:	Peter Huewe <peterhuewe@gmx.de>
>> diff --git a/drivers/input/touchscreen/Kconfig 
>> b/drivers/input/touchscreen/Kconfig
>> index c821fe3ee794..1ce8f1c25625 100644
>> --- a/drivers/input/touchscreen/Kconfig
>> +++ b/drivers/input/touchscreen/Kconfig
>> @@ -834,6 +834,20 @@ config TOUCHSCREEN_MIGOR
>>  	  To compile this driver as a module, choose M here: the
>>  	  module will be called migor_ts.
>> 
>> +config TOUCHSCREEN_TOUCHNETIX_AXIOM
>> +	tristate "TouchNetix AXIOM based touchscreen controllers"
>> +	depends on I2C
>> +	select CRC16
>> +	select REGMAP_I2C
>> +	help
>> +	  Say Y here if you have a axiom touchscreen connected to
>> +	  your system.
>> +
>> +	  If unsure, say N.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called axiom.
>> +
>>  config TOUCHSCREEN_TOUCHRIGHT
>>  	tristate "Touchright serial touchscreen"
>>  	select SERIO
>> diff --git a/drivers/input/touchscreen/Makefile 
>> b/drivers/input/touchscreen/Makefile
>> index a81cb5aa21a5..6ce7b804adc7 100644
>> --- a/drivers/input/touchscreen/Makefile
>> +++ b/drivers/input/touchscreen/Makefile
>> @@ -91,6 +91,7 @@ obj-$(CONFIG_TOUCHSCREEN_SUR40)		+= sur40.o
>>  obj-$(CONFIG_TOUCHSCREEN_SURFACE3_SPI)	+= surface3_spi.o
>>  obj-$(CONFIG_TOUCHSCREEN_TI_AM335X_TSC)	+= ti_am335x_tsc.o
>>  obj-$(CONFIG_TOUCHSCREEN_TOUCHIT213)	+= touchit213.o
>> +obj-$(CONFIG_TOUCHSCREEN_TOUCHNETIX_AXIOM)	+= touchnetix_axiom.o
>>  obj-$(CONFIG_TOUCHSCREEN_TOUCHRIGHT)	+= touchright.o
>>  obj-$(CONFIG_TOUCHSCREEN_TOUCHWIN)	+= touchwin.o
>>  obj-$(CONFIG_TOUCHSCREEN_TS4800)	+= ts4800-ts.o
>> diff --git a/drivers/input/touchscreen/touchnetix_axiom.c 
>> b/drivers/input/touchscreen/touchnetix_axiom.c
>> new file mode 100644
>> index 000000000000..cea52dafc913
>> --- /dev/null
>> +++ b/drivers/input/touchscreen/touchnetix_axiom.c
>> @@ -0,0 +1,616 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * TouchNetix axiom Touchscreen Driver
>> + *
>> + * Copyright (C) 2020-2023 TouchNetix Ltd.
>> + *
>> + * Author(s): Bart Prescott <bartp@baasheep.co.uk>
>> + *            Pedro Torruella <pedro.torruella@touchnetix.com>
>> + *            Mark Satterthwaite <mark.satterthwaite@touchnetix.com>
>> + *            Hannah Rossiter <hannah.rossiter@touchnetix.com>
>> + *            Kamel Bouhara <kamel.bouhara@bootlin.com>
>> + *
>> + */
> 
> Please include bits.h as well.
> 

Ack, thanks !

[...]

>> +/*
>> + * axiom devices are typically configured to report touches at a rate
>> + * of 100Hz (10ms) for systems that require polling for reports.
>> + * When reports are polled, it will be expected to occasionally
>> + * observe the overflow bit being set in the reports.
>> + * This indicates that reports are not being read fast enough.
> 
> This comment is strange; if reports are not read quickly enough at
> the default rate, why not set the default rate at the slowest for
> which the overflow bit is not set?
> 

The rate has been set to the give a good user experience regardless of
this overflow bit that isn't even processed here.

>> + */
>> +#define POLL_INTERVAL_DEFAULT_MS 10
>> +
>> +/* Translate usage/page/offset triplet into physical address. */
>> +static u16 axiom_usage_to_target_address(struct axiom_data *ts, u8 
>> usage, u8 page,
>> +					 char offset)
>> +{
>> +	/* At the moment the convention is that u31 is always at physical 
>> address 0x0 */
>> +	if (!ts->usage_table_populated) {
>> +		if (usage == AXIOM_DEVINFO_USAGE_ID)
>> +			return ((page << 8) + offset);
>> +		else
>> +			return 0xffff;
> 
> Checkpatch normally gripes if an else follows a return; did that not
> happen here? You should simplify it either way:
> 
>         if (...) {
>                 if (...)
>                         return ...;
> 
>                 return U16_MAX;
>         }
> 

Fixed thanks !
No, checkpatch didn't raised any issue here with "--strict", am I 
missing something ?

>> +	}
>> +
>> +	if (page >= ts->usage_table[usage].num_pages) {
>> +		dev_err(ts->dev, "Invalid usage table! usage: u%02x, page: %02x, 
>> offset: %02x\n",
>> +			usage, page, offset);
>> +		return 0xffff;
>> +	}
>> +
>> +	return ((ts->usage_table[usage].start_page + page) << 8) + offset;
>> +}
>> +
>> +static int axiom_read(struct axiom_data *ts, u8 usage, u8 page, void 
>> *buf, u16 len)
>> +{
>> +	union axiom_cmd_header cmd_header;
>> +	int ret;
> 
> For consistency, please use 'error' as is done throughout.
> 

Sure, thanks.

>> +
>> +	cmd_header.head.target_address =
>> +		cpu_to_le16(axiom_usage_to_target_address(ts, usage, page, 0));
>> +	cmd_header.head.length = cpu_to_le16(len | 
>> AXIOM_CMD_HEADER_READ_MASK);
>> +
>> +	ret = regmap_write(ts->regmap, le32_to_cpu(cmd_header.preamble), 0);
>> +	if (ret) {
>> +		dev_err(ts->dev, "failed to write preamble, error %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = regmap_raw_read(ts->regmap, 0, buf, len);
>> +	if (ret) {
>> +		dev_err(ts->dev, "failed to read target address %04x, error %d\n",
>> +			cmd_header.head.target_address, ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * One of the main purposes for reading the usage table is to 
>> identify
>> + * which usages reside at which target address.
>> + * When performing subsequent reads or writes to AXIOM, the target 
>> address
>> + * is used to specify which usage is being accessed.
>> + * Consider the following discovery code which will build up the 
>> usage table.
>> + */
>> +static u32 axiom_populate_usage_table(struct axiom_data *ts)
>> +{
>> +	struct axiom_usage_entry *usage_table;
>> +	u8 *rx_data = ts->rx_buf;
>> +	u32 max_report_len = 0;
>> +	u32 usage_id;
>> +	int error;
>> +
>> +	usage_table = ts->usage_table;
>> +
>> +	/* Read the second page of usage u31 to get the usage table */
>> +	error = axiom_read(ts, AXIOM_DEVINFO_USAGE_ID, 1, rx_data,
>> +			   (AXIOM_U31_BYTES_PER_USAGE * ts->devinfo.num_usages));
>> +
>> +	if (error)
>> +		return error;
>> +
>> +	for (usage_id = 0; usage_id < ts->devinfo.num_usages; usage_id++) {
>> +		u16 offset = (usage_id * AXIOM_U31_BYTES_PER_USAGE);
>> +		u8 id = rx_data[offset + 0];
>> +		u8 start_page = rx_data[offset + 1];
>> +		u8 num_pages = rx_data[offset + 2];
>> +		u32 max_offset = ((rx_data[offset + 3] & AXIOM_PAGE_OFFSET_MASK) + 
>> 1) * 2;
>> +
>> +		usage_table[id].is_report = !num_pages;
>> +
>> +		/* Store the entry into the usage table */
>> +		usage_table[id].id = id;
>> +		usage_table[id].start_page = start_page;
>> +		usage_table[id].num_pages = num_pages;
>> +
>> +		dev_dbg(ts->dev, "Usage u%02x Info: %*ph\n", id, 
>> AXIOM_U31_BYTES_PER_USAGE,
>> +			&rx_data[offset]);
>> +
>> +		/* Identify the max report length the module will receive */
>> +		if (usage_table[id].is_report && max_offset > max_report_len)
>> +			max_report_len = max_offset;
>> +	}
>> +
>> +	ts->usage_table_populated = true;
>> +
>> +	return max_report_len;
>> +}
>> +
>> +static int axiom_discover(struct axiom_data *ts)
>> +{
>> +	int error;
>> +
>> +	/*
>> +	 * Fetch the first page of usage u31 to get the
>> +	 * device information and the number of usages
>> +	 */
>> +	error = axiom_read(ts, AXIOM_DEVINFO_USAGE_ID, 0, &ts->devinfo, 
>> AXIOM_U31_PAGE0_LENGTH);
> 
> It seems a little safer, and more intuitive, to pass 
> sizeof(ts->devinfo) instead
> of AXIOM_U31_PAGE0_LENGTH. To that end, devinfo is only 11 bytes in 
> size, but
> you're reading 12 bytes. I'm guessing the compiler is padding 
> axiom_data which is
> the only reason the existing implementation seems to work.
> 

OK, I tough this actually could be good to keep this as it help knowing 
which register/page
is used to gatter device information here.

I'll however take your suggestion, thanks !

[...]

>> +
>> +	/* Enables the raw data for up to 4 force channels to be sent to the 
>> input subsystem */
>> +	set_bit(EV_MSC, input_dev->evbit);
>> +	/* Declare that we support "RAW" Miscellaneous events */
>> +	set_bit(MSC_RAW, input_dev->mscbit);
> 
> Neither of these event types are reported; please drop them.
> 

Fixed.

>> +
>> +	ts->input_dev = input_dev;
>> +	input_set_drvdata(ts->input_dev, ts);
>> +
>> +	/* Ensure that all reports are initialised to not be present. */
>> +	for (target = 0; target < AXIOM_U41_MAX_TARGETS; target++)
>> +		ts->targets[target].state = AXIOM_TARGET_STATE_NOT_PRESENT;
>> +
>> +	if (client->irq) {
>> +		error = devm_request_threaded_irq(dev, client->irq, NULL,
>> +						  axiom_irq, IRQF_ONESHOT, dev_name(dev), ts);
>> +		if (error)
>> +			dev_err_probe(dev, error, "failed to request irq");
>> +	} else {
>> +		error = input_setup_polling(input_dev, axiom_i2c_poll);
>> +		if (error)
>> +			return dev_err_probe(ts->dev, error, "Unable to set up polling 
>> mode\n");
>> +
>> +		if (!device_property_read_u32(ts->dev, "poll-interval", 
>> &poll_interval))
>> +			input_set_poll_interval(input_dev, poll_interval);
>> +		else
>> +			input_set_poll_interval(input_dev, POLL_INTERVAL_DEFAULT_MS);
>> +	}
>> +
>> +	error = input_register_device(input_dev);
>> +	if (error)
>> +		return dev_err_probe(ts->dev, error, "failed to register input 
>> device\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct i2c_device_id axiom_i2c_id_table[] = {
>> +	{ "ax54a" },
>> +	{ },
> 
> Please drop the comma after the sentinel as was done below.
> 

Fixed, thanks.

>> +};
>> +MODULE_DEVICE_TABLE(i2c, axiom_i2c_id_table);
>> +
>> +static const struct of_device_id axiom_i2c_of_match[] = {
>> +	{ .compatible = "touchnetix,ax54a", },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, axiom_i2c_of_match);
>> +
>> +static struct i2c_driver axiom_i2c_driver = {
>> +	.driver = {
>> +		   .name = "axiom",
>> +		   .of_match_table = axiom_i2c_of_match,
>> +	},
>> +	.id_table = axiom_i2c_id_table,
>> +	.probe = axiom_i2c_probe,
>> +};
>> +module_i2c_driver(axiom_i2c_driver);
>> +
>> +MODULE_AUTHOR("Bart Prescott <bartp@baasheep.co.uk>");
>> +MODULE_AUTHOR("Pedro Torruella <pedro.torruella@touchnetix.com>");
>> +MODULE_AUTHOR("Mark Satterthwaite 
>> <mark.satterthwaite@touchnetix.com>");
>> +MODULE_AUTHOR("Hannah Rossiter <hannah.rossiter@touchnetix.com>");
>> +MODULE_AUTHOR("Kamel Bouhara <kamel.bouhara@bootlin.com>");
>> +MODULE_DESCRIPTION("TouchNetix axiom touchscreen I2C bus driver");
>> +MODULE_LICENSE("GPL");
>> --
>> 2.25.1
>> 
> 
> Kind regards,
> Jeff LaBundy

Thanks for this review !

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

