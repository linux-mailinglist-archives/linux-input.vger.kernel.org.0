Return-Path: <linux-input+bounces-4054-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 065318FA735
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 02:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 294981C20A53
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 00:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F133D62;
	Tue,  4 Jun 2024 00:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjU8yUVR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1899449;
	Tue,  4 Jun 2024 00:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717462230; cv=none; b=tWsWEFA5mAljMzL4SDVEYWl8rm94mtftHFy9sq6BkTLE8yLo7WbyKdHax1RmgfWSyHaBWtelK9Ux+H/+UnHqmd4/5SCwwBmZ0KDaPNlrBIPf2Z35A4qXZ43iXZCA7uvlSu6BMSB1fndtwu7gERFRfZfR65qAIsCbvldKQWkM6W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717462230; c=relaxed/simple;
	bh=8san4X9JMQjaMdagTvH3mOPKeTv7XpdW7tG7I0MVf/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VecCP4VDQ7zpMUdDquOrC6ALlxa1j/QCOZq/vJLyjjBmu275izJm5uA/igSw72t2qLeHhEsdduXms0IypWTM1ndPnXmYVHwe/vSnmUBIxWRNoI3jfZz+szqrzFdCQTqpFOwGkIZA96YvVaDIAY+3F0/0ZQSuOTwg1P6Juy851I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjU8yUVR; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f6134df05fso45773095ad.1;
        Mon, 03 Jun 2024 17:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717462227; x=1718067027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=//SRNc30i1R7aCxXHEB8EPNobSp6uMkitX0SFQZ4jJM=;
        b=BjU8yUVRyBbzMh52XzegXNwwBmWKvhM+in1K4TTrx8iuDO4BrEPp10F4KfQV57jAZW
         tspGmERb+dq+DV/XEXsenP+wYfNN8s2HVHCItOn2gboM3GuV2ccOTsH5wYeiUXHTqV5G
         j9kx9yb0IqY7ngghHlfHUL3Bnq25vxOZfwggdmsatd4RcrdS2k1VndHooMcAQH5MBIUf
         /yD0GhQNjXy57AAmNHzrEUg5fivIa+BodCNj3+Tj+AmyhzGvd6K+LlHp0vhDqvgVce2v
         p02nTUNKr3ZfSIU/u0TcJq0m1NdIeGH9RlBAKhh6WW6wuVLl3aW4uPvkr5BzbtjX0G4d
         /TPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717462227; x=1718067027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//SRNc30i1R7aCxXHEB8EPNobSp6uMkitX0SFQZ4jJM=;
        b=b0E69nsTX9KbXftYEC+4z77Af+Lpb+nbekLm+Dj8hU8HPZ38MZt/FhbY7kf+ZvlxCZ
         RsU5vgDxRa3HAVL4snmTKdRl3+wHd9wwkcd6BOhAUgMXhVkyaNBoRODH0ILAJQ3sZqC1
         +6aWANsQ1OXSn3RQmyJHwI+Zx9/aQkU2z4sfDAsxhQH/ZOlwSDyf8Tz+tbbbXd5eK07x
         Cc1qt6G/NgqUyHeB1Yeo1SvW7i0KJ0Dylpm2BDpilnNI1sEQvBfZG3cEoBx1orxG9qrz
         XxNN8CZrQDYbWimlsOUWUNmfVU9NToBOfn+Dx1GWE+Bn5dhBdFWCCFbfOkeusgcEfpkP
         pv8w==
X-Forwarded-Encrypted: i=1; AJvYcCWLWHNDPhK/PxYmjLMTeIRGU29CXkVVTQRVeK5CNR6S1EsFGUmfO2idEWjHYyqxVhLbi+Y1A8AJDP3SVeoA5IeIMRN/gQxi5TSJGl4ScUp+CteGqVyNyWjM9CNH3PKDovdNvsTZoMzv3BQ=
X-Gm-Message-State: AOJu0YxWjBiG7S9O42LG1RpQmZxSwT36aeE+Ei3HaBPW8/h2f7PVmQlB
	HGhKiHjAcersfEuQ+UOXOwHhV9hmpJVJJf6diXAHNNJ37/MZ/6Vr
X-Google-Smtp-Source: AGHT+IH1626IG64BWaKqbHgAmgrQZB3RaByqqNtei8LBTIuGoRGXKYi7d4ZBi0z+ovD/D9P1dXd0MA==
X-Received: by 2002:a17:902:7ec8:b0:1f6:62c:96fb with SMTP id d9443c01a7336-1f637016951mr88432445ad.30.1717462226798;
        Mon, 03 Jun 2024 17:50:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:17fd:ad4d:2690:4ce2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f634146d7fsm69899055ad.133.2024.06.03.17.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 17:50:26 -0700 (PDT)
Date: Mon, 3 Jun 2024 17:50:23 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Charles Wang <charles.goodix@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	dianders@chromium.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <Zl5kz_S4FJaGzfiW@google.com>
References: <20240527042945.57054-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527042945.57054-1-charles.goodix@gmail.com>

Hi Charles,

> This patch introduces a new driver to support the Goodix GT7986U
> touch controller. The data reported is packaged according to the
> HID protocol but uses SPI for communication to improve speed. This
> enables the device to transmit not only coordinate data but also
> corresponding raw data that can be accessed by user-space programs
> through the hidraw interface. The raw data can be utilized for
> functions like palm rejection, thereby improving the touch experience.
> 
> Key features:
> - Device connection confirmation and initialization
> - IRQ-based event reporting to the input subsystem
> - Support for HIDRAW operations (GET_REPORT and SET_REPORT)

Can you  please mention in the patch description that this device is not
compatible with Microsoft's HID-over-SPI protocol and therefore needs to
implement its own flavor.

> 
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
> Changes in v2:
> - Fixed build warnings reported by kernel test robot
> ---
>  drivers/hid/Kconfig      |   6 +
>  drivers/hid/Makefile     |   1 +
>  drivers/hid/hid-goodix.c | 652 +++++++++++++++++++++++++++++++++++++++

Do you have similar i2c parts that are not compatible with MS
HID-over-I2C, and if you do have them do you have plans to add support
for them to this driver? If not maybe call this hid-goodix-spi.c?
Or maybe create drivers/hid/spi-hid/hid-goodix.c to separate HID upper
layer drivers from the HID low layer/transport drivers?


>  3 files changed, 659 insertions(+)
>  create mode 100644 drivers/hid/hid-goodix.c
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 4c682c650..f57d8fb88 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -404,6 +404,12 @@ config HID_VIVALDI_COMMON
>  	  option so that drivers can use common code to parse the HID
>  	  descriptors for vivaldi function row keymap.
>  
> +config HID_GOODIX
> +	tristate "Goodix GT7986U SPI HID touchscreen"
> +	depends on SPI_MASTER
> +	help
> +	  Support for Goodix GT7986U SPI HID touchscreen device.
> +
>  config HID_GOOGLE_HAMMER
>  	tristate "Google Hammer Keyboard"
>  	select HID_VIVALDI_COMMON
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 082a728ea..4e799f7e5 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -54,6 +54,7 @@ obj-$(CONFIG_HID_GEMBIRD)	+= hid-gembird.o
>  obj-$(CONFIG_HID_GFRM)		+= hid-gfrm.o
>  obj-$(CONFIG_HID_GLORIOUS)  += hid-glorious.o
>  obj-$(CONFIG_HID_VIVALDI_COMMON) += hid-vivaldi-common.o
> +obj-$(CONFIG_HID_GOODIX)	+= hid-goodix.o
>  obj-$(CONFIG_HID_GOOGLE_HAMMER)	+= hid-google-hammer.o
>  obj-$(CONFIG_HID_GOOGLE_STADIA_FF)	+= hid-google-stadiaff.o
>  obj-$(CONFIG_HID_VIVALDI)	+= hid-vivaldi.o
> diff --git a/drivers/hid/hid-goodix.c b/drivers/hid/hid-goodix.c
> new file mode 100644
> index 000000000..a67f7d9ef
> --- /dev/null
> +++ b/drivers/hid/hid-goodix.c
> @@ -0,0 +1,652 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Goodix GT7986U SPI Driver Code for HID.
> + *
> + * Copyright (C) 2024 Godix, Inc.
> + */
> +#include <asm/unaligned.h>
> +#include <linux/delay.h>
> +#include <linux/hid.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/sizes.h>
> +#include <linux/spi/spi.h>
> +
> +#define GOODIX_DEV_CONFIRM_ADDR		0x10000
> +#define GOODIX_HID_DESC_ADDR		0x1058C
> +#define GOODIX_HID_REPORT_DESC_ADDR	0x105AA
> +#define GOODIX_HID_SIGN_ADDR		0x10D32
> +#define GOODIX_HID_REPORT_ADDR		0x22C8C

I wonder if some if not all of these should come from DT/device
properties.

> +
> +#define GOODIX_HID_GET_REPORT_CMD	0x02
> +#define GOODIX_HID_SET_REPORT_CMD	0x03
> +
> +#define GOODIX_HID_MAX_INBUF_SIZE	128
> +#define GOODIX_HID_ACK_READY_FLAG	0x01
> +#define GOODIX_HID_REPORT_READY_FLAG	0x80
> +
> +#define GOODIX_DEV_CONFIRM_VAL		0xAA
> +
> +#define GOODIX_SPI_WRITE_FLAG		0xF0
> +#define GOODIX_SPI_READ_FLAG		0xF1
> +#define GOODIX_SPI_TRANS_PREFIX_LEN	1
> +#define GOODIX_REGISTER_WIDTH		4
> +#define GOODIX_SPI_READ_DUMMY_LEN	3
> +#define GOODIX_SPI_READ_PREFIX_LEN	(GOODIX_SPI_TRANS_PREFIX_LEN + \
> +					 GOODIX_REGISTER_WIDTH + \
> +					 GOODIX_SPI_READ_DUMMY_LEN)
> +#define GOODIX_SPI_WRITE_PREFIX_LEN	(GOODIX_SPI_TRANS_PREFIX_LEN + \
> +					 GOODIX_REGISTER_WIDTH)
> +
> +#define GOODIX_CHECKSUM_SIZE		sizeof(u16)
> +#define GOODIX_NORMAL_RESET_DELAY_MS	150
> +
> +struct goodix_hid_report_header {
> +	u8 flag;
> +	__le16 size;
> +} __packed;
> +#define GOODIX_HID_ACK_HEADER_SIZE	sizeof(struct goodix_hid_report_header)
> +
> +struct goodix_hid_report_package {
> +	__le16 size;
> +	u8 data[];
> +};
> +
> +#define GOODIX_HID_PKG_LEN_SIZE		sizeof(u16)
> +#define GOODIX_HID_COOR_DATA_LEN	82
> +#define GOODIX_HID_COOR_PKG_LEN		(GOODIX_HID_PKG_LEN_SIZE + \
> +					 GOODIX_HID_COOR_DATA_LEN)
> +
> +#define GOODIX_REPORT_DATA_ADDR		(GOODIX_HID_REPORT_ADDR + \
> +					 GOODIX_HID_ACK_HEADER_SIZE + \
> +					 GOODIX_HID_PKG_LEN_SIZE)
> +
> +struct goodix_hid_report_event {
> +	struct goodix_hid_report_header hdr;
> +	u8 data[GOODIX_HID_COOR_PKG_LEN];
> +} __packed;
> +
> +struct goodix_hid_desc {
> +	__le16 desc_length;
> +	__le16 bcd_version;
> +	__le16 report_desc_lenght;
> +	__le16 report_desc_register;
> +	__le16 input_register;
> +	__le16 max_input_length;
> +	__le16 output_register;
> +	__le16 max_output_length;
> +	__le16 cmd_register;
> +	__le16 data_register;
> +	__le16 vendor_id;
> +	__le16 product_id;
> +	__le16 version_id;
> +	__le32 reserved;
> +} __packed;
> +
> +struct goodix_ts_data {
> +	struct device *dev;
> +	struct spi_device *spi;
> +	struct hid_device *hid;
> +	struct goodix_hid_desc hid_desc;
> +
> +	struct gpio_desc *reset_gpio;
> +
> +	/* Buffer used to store hid report data */
> +	u8 xfer_buf[SZ_4K];

Maybe have it as ____cacheline_aligned to allow SPI controller to DMA to
it directly. 

> +};
> +
> +static int goodix_spi_read(struct goodix_ts_data *ts, u32 addr,
> +			   u8 *data, unsigned int len)
> +{
> +	struct spi_device *spi = to_spi_device(&ts->spi->dev);
> +	struct spi_transfer xfers;
> +	struct spi_message spi_msg;
> +	u8 *buf;
> +	int error;
> +
> +	buf = kzalloc(GOODIX_SPI_READ_PREFIX_LEN + len, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;

Can you try using ts->xfer_buf without making allocations and copies?
Maybe have goodix_spi_read() have data as u8 **data, and do

	*data = buf + GOODIX_SPI_READ_PREFIX_LEN;
	return 0;

at the end. I.e. callers do not supply buffer but rather are given one.
Of course you need to make sure there are no concurrent calls to
goodix_spi_read(), but I do not think you have them anyways.


> +
> +	spi_message_init(&spi_msg);
> +	memset(&xfers, 0, sizeof(xfers));
> +
> +	/* buffer format: 0xF1 + addr(4bytes) + dummy(3bytes) + data */
> +	buf[0] = GOODIX_SPI_READ_FLAG;
> +	put_unaligned_be32(addr, buf + GOODIX_SPI_TRANS_PREFIX_LEN);
> +	memset(buf + GOODIX_SPI_TRANS_PREFIX_LEN + GOODIX_REGISTER_WIDTH,
> +	       0xff, GOODIX_SPI_READ_DUMMY_LEN);

Does the "data" have to be set to 0xff?

> +
> +	xfers.tx_buf = buf;
> +	xfers.rx_buf = buf;
> +	xfers.len = GOODIX_SPI_READ_PREFIX_LEN + len;
> +	xfers.cs_change = 0;
> +	spi_message_add_tail(&xfers, &spi_msg);
> +
> +	error = spi_sync(spi, &spi_msg);
> +	if (error)
> +		dev_err(ts->dev, "spi transfer error:%d", error);
> +	else
> +		memcpy(data, buf + GOODIX_SPI_READ_PREFIX_LEN, len);
> +
> +	kfree(buf);
> +	return error;
> +}
> +
> +static int goodix_spi_write(struct goodix_ts_data *ts, u32 addr,
> +			    u8 *data, unsigned int len)
> +{
> +	struct spi_device *spi = to_spi_device(&ts->spi->dev);
> +	struct spi_transfer xfers;
> +	struct spi_message spi_msg;
> +	u8 *buf;
> +	int error;
> +
> +	buf = kzalloc(GOODIX_SPI_WRITE_PREFIX_LEN + len, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;

Same comments here as for goodix_spi_write()...

> +
> +	spi_message_init(&spi_msg);
> +	memset(&xfers, 0, sizeof(xfers));
> +
> +	/* buffer format: 0xF0 + addr(4bytes) + data */
> +	buf[0] = GOODIX_SPI_WRITE_FLAG;
> +	put_unaligned_be32(addr, buf + GOODIX_SPI_TRANS_PREFIX_LEN);
> +	memcpy(buf + GOODIX_SPI_WRITE_PREFIX_LEN, data, len);
> +
> +	xfers.tx_buf = buf;
> +	xfers.len = GOODIX_SPI_WRITE_PREFIX_LEN + len;
> +	xfers.cs_change = 0;
> +	spi_message_add_tail(&xfers, &spi_msg);
> +
> +	error = spi_sync(spi, &spi_msg);
> +	if (error)
> +		dev_err(ts->dev, "spi transfer error:%d", error);
> +
> +	kfree(buf);
> +	return error;
> +}
> +
> +static int goodix_dev_confirm(struct goodix_ts_data *ts)
> +{
> +	u8 tx_buf[8], rx_buf[8];
> +	int retry = 3;
> +	int error;
> +
> +	gpiod_set_value_cansleep(ts->reset_gpio, 0);
> +	usleep_range(4000, 4100);
> +
> +	memset(tx_buf, GOODIX_DEV_CONFIRM_VAL, sizeof(tx_buf));
> +	while (retry--) {
> +		error = goodix_spi_write(ts, GOODIX_DEV_CONFIRM_ADDR,
> +					 tx_buf, sizeof(tx_buf));
> +		if (error)
> +			return error;
> +
> +		error = goodix_spi_read(ts, GOODIX_DEV_CONFIRM_ADDR,
> +					rx_buf, sizeof(rx_buf));
> +		if (error)
> +			return error;
> +
> +		if (!memcmp(tx_buf, rx_buf, sizeof(tx_buf)))
> +			return 0;
> +
> +		usleep_range(5000, 5100);
> +	}
> +
> +	dev_err(ts->dev, "device confirm failed, rx_buf:%*ph", 8, rx_buf);
> +	return -EINVAL;
> +}
> +
> +/**
> + * goodix_hid_parse() - hid-core .parse() callback
> + * @hid: hid device instance
> + *
> + * This function gets called during call to hid_add_device
> + *
> + * Return: 0 on success and non zero on error
> + */
> +static int goodix_hid_parse(struct hid_device *hid)
> +{
> +	struct goodix_ts_data *ts = hid->driver_data;
> +	u16 rsize;
> +	u8 *rdesc;
> +	int error;
> +
> +	rsize = le16_to_cpu(ts->hid_desc.report_desc_lenght);
> +	if (!rsize || rsize > HID_MAX_DESCRIPTOR_SIZE) {
> +		dev_err(ts->dev, "invalid report desc size %d", rsize);
> +		return -EINVAL;
> +	}
> +
> +	rdesc = kzalloc(rsize, GFP_KERNEL);

We now have nifty

	u8 *rdesc __free(kfree) = kzalloc(rsize, GFP_KERNEL);

(see include/linux/cleanup.h) and you do not need to free memory by
hand.

> +	if (!rdesc)
> +		return -ENOMEM;
> +
> +	error = goodix_spi_read(ts, GOODIX_HID_REPORT_DESC_ADDR, rdesc, rsize);
> +	if (error) {
> +		dev_err(ts->dev, "failed get report desc, %d", error);
> +		goto free_mem;
> +	}
> +
> +	error = hid_parse_report(hid, rdesc, rsize);
> +	if (error)
> +		dev_err(ts->dev, "failed parse report, %d", error);
> +
> +free_mem:
> +	kfree(rdesc);
> +	return error;
> +}
> +
> +/* Empty callbacks with success return code */

Hmm, I see you are using falling edge interrupt. Don't you have concern
of having it "stuck" here? I do not think all these should be stubs...

Does the device have low power mode that can be used when controller is
not in use (inhibited for example)?

> +static int goodix_hid_start(struct hid_device *hid)
> +{
> +	return 0;
> +}
> +
> +static void goodix_hid_stop(struct hid_device *hid)
> +{
> +}
> +
> +static int goodix_hid_open(struct hid_device *hid)
> +{
> +	return 0;
> +}
> +
> +static void goodix_hid_close(struct hid_device *hid)
> +{
> +}
> +
> +/* Return date length of response data */
> +static int goodix_hid_check_ack_status(struct goodix_ts_data *ts)
> +{
> +	struct goodix_hid_report_header hdr;
> +	int retry = 20;
> +	int error;
> +
> +	while (retry--) {
> +		/*
> +		 * 3 bytes of hid request response data
> +		 * - byte 0:    Ack flag, value of 1 for data ready
> +		 * - bytes 1-2: Response data length
> +		 */
> +		error = goodix_spi_read(ts, GOODIX_HID_REPORT_ADDR,
> +					(u8 *)&hdr, sizeof(hdr));
> +		if (!error && (hdr.flag & GOODIX_HID_ACK_READY_FLAG))
> +			return le16_to_cpu(hdr.size);
> +
> +		/* Wait 10ms for another try */
> +		usleep_range(10000, 11000);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +/**
> + * goodix_hid_get_raw_report() - Process hidraw GET REPORT operation
> + * @hid: hid device instance
> + * @reportnum: Report ID
> + * @buf: Buffer for store the reprot date
> + * @len: Length fo reprot data
> + * @report_type: Report type
> + *
> + * The function for hid_ll_driver.get_raw_report to handle the HIDRAW ioctl
> + * get report request. The transmitted data follows the standard i2c-hid
> + * protocol with a specified header.
> + *
> + * Return: The length of the data in the buf on success, negative error code
> + */
> +static int goodix_hid_get_raw_report(struct hid_device *hid,
> +				     unsigned char reportnum,
> +				     __u8 *buf, size_t len,
> +				     unsigned char report_type)
> +{
> +	struct goodix_ts_data *ts = hid->driver_data;
> +	u16 data_register = le16_to_cpu(ts->hid_desc.data_register);
> +	u16 cmd_register = le16_to_cpu(ts->hid_desc.cmd_register);
> +	u8 tmp_buf[GOODIX_HID_MAX_INBUF_SIZE];
> +	int tx_len = 0, args_len = 0;
> +	int response_data_len;
> +	u8 args[3];
> +	int error;
> +
> +	if (report_type == HID_OUTPUT_REPORT)
> +		return -EINVAL;
> +
> +	if (reportnum == 3) {
> +		/* Get win8 signature data */
> +		error = goodix_spi_read(ts, GOODIX_HID_SIGN_ADDR, buf, len);
> +		if (error) {
> +			dev_err(ts->dev, "failed get win8 sign:%d", error);
> +			return -EINVAL;
> +		}
> +		return len;
> +	}
> +
> +	if (reportnum >= 0x0F) {
> +		args[args_len++] = reportnum;
> +		reportnum = 0x0F;
> +	}
> +	put_unaligned_le16(data_register, args + args_len);
> +	args_len += sizeof(data_register);
> +
> +	/* Clean 3 bytes of hid ack header data */
> +	memset(tmp_buf, 0, GOODIX_HID_ACK_HEADER_SIZE);
> +	tx_len += GOODIX_HID_ACK_HEADER_SIZE;
> +
> +	put_unaligned_le16(cmd_register, tmp_buf + tx_len);
> +	tx_len += sizeof(cmd_register);
> +
> +	tmp_buf[tx_len++] = ((report_type == HID_FEATURE_REPORT ? 0x03 : 0x01) << 4) | reportnum;
> +	tmp_buf[tx_len++] = GOODIX_HID_GET_REPORT_CMD;
> +
> +	memcpy(tmp_buf + tx_len, args, args_len);
> +	tx_len += args_len;
> +
> +	/* Step1: write report request info */
> +	error = goodix_spi_write(ts, GOODIX_HID_REPORT_ADDR, tmp_buf, tx_len);
> +	if (error) {
> +		dev_err(ts->dev, "failed send read feature cmd, %d", error);
> +		return error;
> +	}
> +
> +	/* No need read response data */
> +	if (!len)
> +		return 0;
> +
> +	/* Step2: check response data status */
> +	response_data_len = goodix_hid_check_ack_status(ts);
> +	if (response_data_len <= 0)
> +		return -EINVAL;
> +
> +	/* Step3: read response data(skip 2bytes of hid pkg length) */
> +	error = goodix_spi_read(ts, GOODIX_REPORT_DATA_ADDR, buf,
> +				response_data_len - GOODIX_HID_PKG_LEN_SIZE);
> +	if (error) {
> +		dev_err(ts->dev, "failed read hid response data, %d", error);
> +		return error;
> +	}
> +
> +	return response_data_len - GOODIX_HID_PKG_LEN_SIZE;
> +}
> +
> +/**
> + * goodix_hid_set_raw_report() - process hidraw SET REPORT operation
> + * @hid: HID device
> + * @reportnum: Report ID
> + * @buf: Buffer for communication
> + * @len: Length of data in the buffer
> + * @report_type: Report type
> + *
> + * The function for hid_ll_driver.get_raw_report to handle the HIDRAW ioctl
> + * set report request. The transmitted data follows the standard i2c-hid
> + * protocol with a specified header.
> + *
> + * Return: The length of the data sent, negative error code on failure
> + */
> +static int goodix_hid_set_raw_report(struct hid_device *hid,
> +				     unsigned char reportnum,
> +				     __u8 *buf, size_t len,
> +				     unsigned char report_type)
> +{
> +	struct goodix_ts_data *ts = hid->driver_data;
> +	u16 data_register = le16_to_cpu(ts->hid_desc.data_register);
> +	u16 cmd_register = le16_to_cpu(ts->hid_desc.cmd_register);
> +	int tx_len = 0, args_len = 0;
> +	u8 tmp_buf[GOODIX_HID_MAX_INBUF_SIZE];
> +	u8 args[5];
> +	int error;
> +
> +	if (reportnum >= 0x0F) {
> +		args[args_len++] = reportnum;
> +		reportnum = 0x0F;
> +	}
> +
> +	put_unaligned_le16(data_register, args + args_len);
> +	args_len += sizeof(data_register);
> +
> +	put_unaligned_le16(GOODIX_HID_PKG_LEN_SIZE + len, args + args_len);
> +	args_len += GOODIX_HID_PKG_LEN_SIZE;
> +
> +	/* Clean 3 bytes of hid ack header data */
> +	memset(tmp_buf, 0, GOODIX_HID_ACK_HEADER_SIZE);
> +	tx_len += GOODIX_HID_ACK_HEADER_SIZE;
> +
> +	put_unaligned_le16(cmd_register, tmp_buf + tx_len);
> +	tx_len += sizeof(cmd_register);
> +
> +	tmp_buf[tx_len++] = ((report_type == HID_FEATURE_REPORT ? 0x03 : 0x02) << 4) | reportnum;
> +	tmp_buf[tx_len++] = GOODIX_HID_SET_REPORT_CMD;
> +
> +	memcpy(tmp_buf + tx_len, args, args_len);
> +	tx_len += args_len;
> +
> +	memcpy(tmp_buf + tx_len, buf, len);
> +	tx_len += len;
> +
> +	error = goodix_spi_write(ts, GOODIX_HID_REPORT_ADDR, tmp_buf, tx_len);
> +	if (error) {
> +		dev_err(ts->dev, "failed send report %*ph", tx_len, tmp_buf);
> +		return error;
> +	}
> +	return len;
> +}
> +
> +static int goodix_hid_raw_request(struct hid_device *hid,
> +				  unsigned char reportnum,
> +				  __u8 *buf, size_t len,
> +				  unsigned char rtype, int reqtype)
> +{
> +	switch (reqtype) {
> +	case HID_REQ_GET_REPORT:
> +		return goodix_hid_get_raw_report(hid, reportnum, buf,
> +						 len, rtype);
> +	case HID_REQ_SET_REPORT:
> +		if (buf[0] != reportnum)
> +			return -EINVAL;
> +		return goodix_hid_set_raw_report(hid, reportnum, buf,
> +						 len, rtype);
> +	default:
> +		return -EIO;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static struct hid_ll_driver goodix_hid_ll_driver = {
> +	.parse = goodix_hid_parse,
> +	.start = goodix_hid_start,
> +	.stop = goodix_hid_stop,
> +	.open = goodix_hid_open,
> +	.close = goodix_hid_close,
> +	.raw_request = goodix_hid_raw_request
> +};
> +
> +static irqreturn_t goodix_hid_irq(int irq, void *data)
> +{
> +	struct goodix_ts_data *ts = data;
> +	struct goodix_hid_report_event event;
> +	struct goodix_hid_report_package *pkg;
> +	u16 report_size;
> +	int error;
> +
> +	/*
> +	 * First, read buffer with space for header and coordinate package:
> +	 * - event header = 3 bytes
> +	 * - coordinate event = GOODIX_HID_COOR_PKG_LEN bytes
> +	 *
> +	 * If the data size info in the event header exceeds
> +	 * GOODIX_HID_COOR_PKG_LEN, it means that there are other packages
> +	 * besides the coordinate package.
> +	 */
> +	error = goodix_spi_read(ts, GOODIX_HID_REPORT_ADDR, (u8 *)&event,
> +				sizeof(event));
> +	if (error) {
> +		dev_err(ts->dev, "failed get coordinate data, %d", error);
> +		return IRQ_HANDLED;
> +	}
> +
> +	/* Check coordinate data valid falg */
> +	if (event.hdr.flag != GOODIX_HID_REPORT_READY_FLAG) {
> +		dev_err(ts->dev, "invalid event flag 0x%x", event.hdr.flag);
> +		return IRQ_HANDLED;
> +	}
> +
> +	pkg = (struct goodix_hid_report_package *)event.data;
> +	hid_input_report(ts->hid, HID_INPUT_REPORT, pkg->data,
> +			 le16_to_cpu(pkg->size) - GOODIX_HID_PKG_LEN_SIZE, 1);
> +
> +	report_size = le16_to_cpu(event.hdr.size);
> +	/* Check if there are other packages */
> +	if (report_size <= GOODIX_HID_COOR_PKG_LEN)
> +		return IRQ_HANDLED;
> +
> +	if (report_size - GOODIX_HID_COOR_PKG_LEN > sizeof(ts->xfer_buf)) {
> +		dev_err(ts->dev, "invalid package size, %d", report_size);
> +		return IRQ_HANDLED;
> +	}
> +
> +	/* Read the package behind the coordinate data */
> +	error = goodix_spi_read(ts, GOODIX_HID_REPORT_ADDR + sizeof(event),
> +				ts->xfer_buf,
> +				report_size - GOODIX_HID_COOR_PKG_LEN);
> +	if (error) {
> +		dev_err(ts->dev, "failed read data, %d", error);
> +		return IRQ_HANDLED;
> +	}
> +
> +	pkg = (struct goodix_hid_report_package *)ts->xfer_buf;
> +	hid_input_report(ts->hid, HID_INPUT_REPORT, pkg->data,
> +			 le16_to_cpu(pkg->size) - GOODIX_HID_PKG_LEN_SIZE, 1);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int goodix_hid_init(struct goodix_ts_data *ts)
> +{
> +	struct hid_device *hid;
> +	int error;
> +
> +	/* Get hid descriptor */
> +	error = goodix_spi_read(ts, GOODIX_HID_DESC_ADDR, (u8 *)&ts->hid_desc,
> +				sizeof(ts->hid_desc));
> +	if (error) {
> +		dev_err(ts->dev, "failed get hid desc, %d", error);
> +		return error;
> +	}
> +
> +	hid = hid_allocate_device();
> +	if (IS_ERR(hid))
> +		return PTR_ERR(hid);
> +
> +	hid->driver_data = ts;
> +	hid->ll_driver = &goodix_hid_ll_driver;
> +	hid->bus = BUS_SPI;
> +	hid->dev.parent = &ts->spi->dev;
> +
> +	hid->version = le16_to_cpu(ts->hid_desc.bcd_version);
> +	hid->vendor = le16_to_cpu(ts->hid_desc.vendor_id);
> +	hid->product = le16_to_cpu(ts->hid_desc.product_id);
> +	snprintf(hid->name, sizeof(hid->name), "%s %04X:%04X", "hid-gdix",
> +		 hid->vendor, hid->product);
> +
> +	error = hid_add_device(hid);
> +	if (error) {
> +		dev_err(ts->dev, "failed add hid device, %d", error);
> +		hid_destroy_device(hid);
> +		return error;
> +	}
> +
> +	ts->hid = hid;
> +	return 0;
> +}
> +
> +static int goodix_spi_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct goodix_ts_data *ts;
> +	int error;
> +
> +	/* init spi_device */
> +	spi->mode            = SPI_MODE_0;
> +	spi->bits_per_word   = 8;
> +	error = spi_setup(spi);
> +	if (error)
> +		return error;
> +
> +	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
> +	if (!ts)
> +		return -ENOMEM;
> +
> +	spi_set_drvdata(spi, ts);
> +	ts->spi = spi;
> +	ts->dev = dev;
> +	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ts->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ts->reset_gpio),
> +				     "Failed to request reset gpio\n");
> +
> +	error = goodix_dev_confirm(ts);
> +	if (error)
> +		return error;
> +
> +	/* Waits 150ms for firmware to fully boot */
> +	msleep(GOODIX_NORMAL_RESET_DELAY_MS);
> +
> +	error = devm_request_threaded_irq(&ts->spi->dev, ts->spi->irq,
> +					  NULL, goodix_hid_irq,
> +					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +					  "goodix_spi_hid", ts);
> +	if (error < 0) {
> +		dev_err(ts->dev, "could not register interrupt, irq = %d, %d",
> +			ts->spi->irq, error);
> +		return error;
> +	}

I do not think it is safe. Your interrupt is hot here, but you are
allocating and registering HID device instance in goodix_hid_init(). If
interrupt arrives right away you will likely crash.

> +
> +	error = goodix_hid_init(ts);
> +	if (error) {
> +		dev_err(dev, "failed init hid device");
> +		return error;
> +	}
> +
> +	return 0;
> +}
> +
> +static void goodix_spi_remove(struct spi_device *spi)
> +{
> +	struct goodix_ts_data *ts = spi_get_drvdata(spi);
> +
> +	hid_destroy_device(ts->hid);

This is not safe either, you destroy the device, but interrupts are
enabled and nothing stops them from coming...

> +}
> +
> +static void goodix_spi_shutdown(struct spi_device *spi)
> +{
> +	struct goodix_ts_data *ts = spi_get_drvdata(spi);
> +
> +	disable_irq_nosync(spi->irq);

Why nosync? Seems dangerous. Please add a comment why nosync is needed
and why it is safe.

> +	hid_destroy_device(ts->hid);
> +}
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id goodix_spi_acpi_match[] = {
> +	{ "GXTS7986" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, goodix_spi_acpi_match);
> +#endif
> +
> +static struct spi_driver goodix_spi_driver = {
> +	.driver = {
> +		.name = "goodix-spi-hid",
> +		.acpi_match_table = ACPI_PTR(goodix_spi_acpi_match),
> +	},
> +	.probe =	goodix_spi_probe,
> +	.remove =	goodix_spi_remove,
> +	.shutdown =	goodix_spi_shutdown,
> +};
> +module_spi_driver(goodix_spi_driver);
> +
> +MODULE_DESCRIPTION("Goodix SPI driver for HID touchscreen");
> +MODULE_AUTHOR("Goodix, Inc.");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 
> 

Thanks.

-- 
Dmitry

