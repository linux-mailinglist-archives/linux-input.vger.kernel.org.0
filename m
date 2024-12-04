Return-Path: <linux-input+bounces-8379-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7171E9E3338
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 06:45:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FA3316467A
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 05:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0410D186294;
	Wed,  4 Dec 2024 05:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="I7Aqu+3Z"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0733C17BB0F;
	Wed,  4 Dec 2024 05:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733291107; cv=none; b=UdDHhAzV118xLekV+HSm8LqAzAHk4awMKFC2cU8U7KGe8ScVm64BVBCiRHHtYuzvZxKuL9da63TGNXALLi89ZPtTp3xRyBE/ygbOIZtWykcWYxcTB+SsyfsebFH9kBSHhEWH+ksNy/d5LJ7jVoyzey+WUNUKY1gJ0bISrk3y50o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733291107; c=relaxed/simple;
	bh=p9q3JAQeYdR9uJuTBPtJyypMIyidIbMEp0yGROCoa+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJjhMgICll8X/fOu6E2H8u99RDQmIaGThTtdlIKfCzbCNu7QErmYY3O8N+qfoob8S6uemERlVLmr+p6bbKaN9t3uATOTFJ8ArshIjwCaug1mNJpO8xf2cCNBc/e5dEb15UauGl4vYfsiaB6viQRxfkUAjklIR30xw6/ABwmU56Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=I7Aqu+3Z; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from [192.168.1.148] (unknown [222.129.38.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id A91373F77A;
	Wed,  4 Dec 2024 05:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1733290654;
	bh=AcZpPC6Nlfnpnb0Y5Rr+FjN5IBxgm66Ds44BXA74h1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=I7Aqu+3Zw828gSK0S9uXRDmN1+YWiBO7QDqiAuboGlK34lP6hcOb3vcwJW+wOEPwo
	 +S3l1Yj1B3ecMuvA3rhp+BByAEgRtxSzUbCW85M3um68bCpfhAqqJEQR18DOohkAJA
	 pcBZYp3tqUk7i/Qiadj8dBTPF6oGLrGp3KFNoIX9thOGG90GN+Kl8gyprbQkZ09Xlo
	 3KzVzj9LkJ22KSPFFiahv7XlVWV+fFKvzcUflRGRDLWBJj5iEgX5h4LZh3qxfwcLgi
	 xD1W4iWbs+B8bXqp5wBFIo81h0/0feMCgHO2fM+bYzgZNOqadEaspprXhHTbii7P4Z
	 xfUTEC5/G6sEQ==
Message-ID: <157e94a2-bc03-42c1-8c4f-d6042032a500@canonical.com>
Date: Wed, 4 Dec 2024 13:37:25 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 04/22] HID: intel-thc-hid: intel-thc: Add THC PIO
 operation APIs
To: Even Xu <even.xu@intel.com>, jikos@kernel.org, bentiss@kernel.org,
 corbet@lwn.net, bagasdotme@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Xinpeng Sun <xinpeng.sun@intel.com>,
 Rui Zhang <rui1.zhang@intel.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
References: <20241114053416.4085715-1-even.xu@intel.com>
 <20241114053416.4085715-5-even.xu@intel.com>
Content-Language: en-US
From: Aaron Ma <aaron.ma@canonical.com>
Autocrypt: addr=aaron.ma@canonical.com; keydata=
 xsBNBFffeLkBCACi4eE4dPsgWN6B9UDOVcAvb5QgU/hRG6yS0I1lGKQv4KA+bke0c5g8clbO
 9gIlIl2bityfA9NzBsDik4Iei3AxMbFyxv9keMwcOFQBIOZF0P3f05qjxftF8P+yp9QTV4hp
 BkFzsXzWRgXN3r8hU8wqZybepF4B1C83sm2kQ5A5N0AUGbZli9i2G+/VscG9sWfLy8T7f4YW
 MjmlijCjoV6k29vsmTWQPZ7EApNpvR5BnZQPmQWzkkr0lNXlsKcyLgefQtlwg6drK4fe4wz0
 ouBIHJEiXE1LWK1hUzkCUASra4WRwKk1Mv/NLLE/aJRqEvF2ukt3uVuM77RWfl7/H/v5ABEB
 AAHNIUFhcm9uIE1hIDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPsLAdwQTAQgAIQUCV994uQIb
 AwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDNxCzQfVU6ntJ9B/9aVy0+RkLqF9QpLmw+
 LAf1m3Fd+4ZarPTerqDqkLla3ekYhbrEtlI1mYuB5f+gtrIjmcW27gacHdslKB9YwaL8B4ZB
 GJKhcrntLg4YPzYUnXZkHHTv1hMw7fBYw82cBT+EbG0Djh6Po6Ihqyr3auHhfFcp1PZH4Mtq
 6hN5KaDZzF/go+tRF5e4bn61Nhdue7mrhFSlfkzLG2ehHWmRV+S91ksH81YDFnazK0sRINBx
 V1S8ts3WJ2f1AbgmnDlbK3c/AfI5YxnIHn/x2ZdXj1P/wn7DgZHmpMy5DMuk0gN34NLUPLA/
 cHeKoBAF8emugljiKecKBpMTLe8FrVOxbkrazsBNBFffeLkBCACweKP3Wx+gK81+rOUpuQ00
 sCyKzdtMuXXJ7oL4GzYHbLfJq+F+UHpQbytVGTn3R5+Y61v41g2zTYZooaC+Hs1+ixf+buG2
 +2LZjPSELWPNzH9lsKNlCcEvu1XhyyHkBDbnFFHWlUlql3nSXMo//dOTG/XGKaEaZUxjCLUC
 8ehLc16DJDvdXsPwWhHrCH/4k92F6qQ14QigBMsl75jDTDJMEYgRYEBT1D/bwxdIeoN1BfIG
 mYgf059RrWax4SMiJtVDSUuDOpdwoEcZ0FWesRfbFrM+k/XKiIbjMZSvLunA4FIsOdWYOob4
 Hh0rsm1G+fBLYtT+bE26OWpQ/lSn4TdhABEBAAHCwF8EGAEIAAkFAlffeLkCGwwACgkQzcQs
 0H1VOp6p5Af/ap5EVuP1AhFdPD3pXLNrUUt72W3cuAOjXyss43qFC2YRjGfktrizsDjQU46g
 VKoD6EW9XUPgvYM+k8BJEoXDLhHWnCnMKlbHP3OImxzLRhF4kdlnLicz1zKRcessQatRpJgG
 NIiD+eFyh0CZcWBO1BB5rWikjO/idicHao2stFdaBmIeXvhT9Xp6XNFEmzOmfHps+kKpWshY
 9LDAU0ERBNsW4bekOCa/QxfqcbZYRjrVQvya0EhrPhq0bBpzkIL/7QSBMcdv6IajTlHnLARF
 nAIofCEKeEl7+ksiRapL5Nykcbt4dldE3sQWxIybC94SZ4inENKw6I8RNpigWm0R5w==
In-Reply-To: <20241114053416.4085715-5-even.xu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/14/24 1:33 PM, Even Xu wrote:
> From: Xinpeng Sun <xinpeng.sun@intel.com>
> 
> THC PIO (programmed I/O) operations are very similar with general
> SPI/I2C read/write operation to access external slave device on the bus
> through internal FIFO.
> 
> THC PIO operations are split into 4 steps:
> 1. prepare: configure hardware with correct opcode, slave address, and
>              fill the PIO FIFO
> 2. start: set start bit to issue a bus send/receive
> 3. wait: wait for bus sending/receiving completion
> 4. complete: check send/receive data in FIFO and return
> 
> Co-developed-by: Even Xu <even.xu@intel.com>
> Signed-off-by: Even Xu <even.xu@intel.com>
> Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
> Tested-by: Rui Zhang <rui1.zhang@intel.com>
> Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>   .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 245 ++++++++++++++++++
>   .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  24 ++
>   .../intel-thc-hid/intel-thc/intel-thc-hw.h    |  23 ++
>   3 files changed, 292 insertions(+)
> 
> diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
> index d77603e4c01e..0571b8270716 100644
> --- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
> +++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
> @@ -1,9 +1,11 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /* Copyright (c) 2024 Intel Corporation */
>   
> +#include <linux/bitfield.h>
>   #include <linux/regmap.h>
>   
>   #include "intel-thc-dev.h"
> +#include "intel-thc-hw.h"
>   
>   static int thc_regmap_read(void *context, unsigned int reg,
>   			   unsigned int *val)
> @@ -76,10 +78,253 @@ struct thc_device *thc_dev_init(struct device *device, void __iomem *mem_addr)
>   		return ERR_PTR(ret);
>   	}
>   
> +	mutex_init(&thc_dev->thc_bus_lock);
> +
>   	return thc_dev;
>   }
>   EXPORT_SYMBOL_NS_GPL(thc_dev_init, INTEL_THC);



Since the commit in 6.13-rc1+ change the symbol namespace:
cdd30ebb1b9f ("module: Convert symbol namespace to string literal")

This should be changed to
EXPORT_SYMBOL_NS_GPL(thc_dev_init, "INTEL_THC");

There are many of them in this driver, better to define a helper macro in header file.
And group them consistently.

Aaron


>   
> +static int prepare_pio(const struct thc_device *dev, const u8 pio_op,
> +		       const u32 address, const u32 size)
> +{
> +	u32 sts, ctrl, addr, mask;
> +
> +	regmap_read(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, &sts);
> +
> +	/* Check if THC previous PIO still in progress */
> +	if (sts & THC_M_PRT_SW_SEQ_STS_THC_SS_CIP) {
> +		dev_err_once(dev->dev, "THC PIO is still busy!\n");
> +		return -EBUSY;
> +	}
> +
> +	/* Clear error bit and complete bit in state register */
> +	sts |= THC_M_PRT_SW_SEQ_STS_THC_SS_ERR |
> +	       THC_M_PRT_SW_SEQ_STS_TSSDONE;
> +	regmap_write(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, sts);
> +
> +	/* Set PIO data size, opcode and interrupt capability */
> +	ctrl = FIELD_PREP(THC_M_PRT_SW_SEQ_CNTRL_THC_SS_BC, size) |
> +	       FIELD_PREP(THC_M_PRT_SW_SEQ_CNTRL_THC_SS_CMD, pio_op);
> +	if (dev->pio_int_supported)
> +		ctrl |= THC_M_PRT_SW_SEQ_CNTRL_THC_SS_CD_IE;
> +
> +	mask = THC_M_PRT_SW_SEQ_CNTRL_THC_SS_BC |
> +	       THC_M_PRT_SW_SEQ_CNTRL_THC_SS_CMD |
> +	       THC_M_PRT_SW_SEQ_CNTRL_THC_SS_CD_IE;
> +	regmap_write_bits(dev->thc_regmap,
> +			  THC_M_PRT_SW_SEQ_CNTRL_OFFSET, mask, ctrl);
> +
> +	/* Set PIO target address */
> +	addr = FIELD_PREP(THC_M_PRT_SW_SEQ_DATA0_ADDR_THC_SW_SEQ_DATA0_ADDR, address);
> +	mask = THC_M_PRT_SW_SEQ_DATA0_ADDR_THC_SW_SEQ_DATA0_ADDR;
> +	regmap_write_bits(dev->thc_regmap,
> +			  THC_M_PRT_SW_SEQ_DATA0_ADDR_OFFSET, mask, addr);
> +	return 0;
> +}
> +
> +static void pio_start(const struct thc_device *dev,
> +		      u32 size_in_bytes, const u32 *buffer)
> +{
> +	if (size_in_bytes && buffer)
> +		regmap_bulk_write(dev->thc_regmap, THC_M_PRT_SW_SEQ_DATA1_OFFSET,
> +				  buffer, size_in_bytes / sizeof(u32));
> +
> +	/* Enable Start bit */
> +	regmap_write_bits(dev->thc_regmap,
> +			  THC_M_PRT_SW_SEQ_CNTRL_OFFSET,
> +			  THC_M_PRT_SW_SEQ_CNTRL_TSSGO,
> +			  THC_M_PRT_SW_SEQ_CNTRL_TSSGO);
> +}
> +
> +static int pio_complete(const struct thc_device *dev,
> +			u32 *buffer, u32 *size)
> +{
> +	u32 sts, ctrl;
> +
> +	regmap_read(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, &sts);
> +	if (sts & THC_M_PRT_SW_SEQ_STS_THC_SS_ERR) {
> +		dev_err_once(dev->dev, "PIO operation error\n");
> +		return -EBUSY;
> +	}
> +
> +	if (buffer && size) {
> +		regmap_read(dev->thc_regmap, THC_M_PRT_SW_SEQ_CNTRL_OFFSET, &ctrl);
> +		*size = FIELD_GET(THC_M_PRT_SW_SEQ_CNTRL_THC_SS_BC, ctrl);
> +
> +		regmap_bulk_read(dev->thc_regmap, THC_M_PRT_SW_SEQ_DATA1_OFFSET,
> +				 buffer, *size / sizeof(u32));
> +	}
> +
> +	sts |= THC_M_PRT_SW_SEQ_STS_THC_SS_ERR | THC_M_PRT_SW_SEQ_STS_TSSDONE;
> +	regmap_write(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, sts);
> +	return 0;
> +}
> +
> +static int pio_wait(const struct thc_device *dev)
> +{
> +	u32 sts = 0;
> +	int ret;
> +
> +	ret = regmap_read_poll_timeout(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, sts,
> +				       !(sts & THC_M_PRT_SW_SEQ_STS_THC_SS_CIP ||
> +				       !(sts & THC_M_PRT_SW_SEQ_STS_TSSDONE)),
> +				       THC_REGMAP_POLLING_INTERVAL_US, THC_PIO_DONE_TIMEOUT_US);
> +	if (ret)
> +		dev_err_once(dev->dev, "Timeout while polling PIO operation done\n");
> +
> +	return ret;
> +}
> +
> +/**
> + * thc_tic_pio_read - Read data from touch device by PIO
> + *
> + * @dev: The pointer of THC private device context
> + * @address: Slave address for the PIO operation
> + * @size: Expected read data size
> + * @actual_size: The pointer of the actual data size read from touch device
> + * @buffer: The pointer of data buffer to store the data read from touch device
> + *
> + * Return: 0 on success, other error codes on failed.
> + */
> +int thc_tic_pio_read(struct thc_device *dev, const u32 address,
> +		     const u32 size, u32 *actual_size, u32 *buffer)
> +{
> +	u8 opcode;
> +	int ret;
> +
> +	if (size <= 0 || !actual_size || !buffer) {
> +		dev_err(dev->dev, "Invalid input parameters, size %u, actual_size %p, buffer %p\n",
> +			size, actual_size, buffer);
> +		return -EINVAL;
> +	}
> +
> +	if (mutex_lock_interruptible(&dev->thc_bus_lock))
> +		return -EINTR;
> +
> +	opcode = (dev->port_type == THC_PORT_TYPE_SPI) ?
> +		 THC_PIO_OP_SPI_TIC_READ : THC_PIO_OP_I2C_TIC_READ;
> +
> +	ret = prepare_pio(dev, opcode, address, size);
> +	if (ret < 0)
> +		goto end;
> +
> +	pio_start(dev, 0, NULL);
> +
> +	ret = pio_wait(dev);
> +	if (ret < 0)
> +		goto end;
> +
> +	ret = pio_complete(dev, buffer, actual_size);
> +
> +end:
> +	mutex_unlock(&dev->thc_bus_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(thc_tic_pio_read, INTEL_THC);
> +
> +/**
> + * thc_tic_pio_write - Write data to touch device by PIO
> + *
> + * @dev: The pointer of THC private device context
> + * @address: Slave address for the PIO operation
> + * @size: PIO write data size
> + * @buffer: The pointer of the write data buffer
> + *
> + * Return: 0 on success, other error codes on failed.
> + */
> +int thc_tic_pio_write(struct thc_device *dev, const u32 address,
> +		      const u32 size, const u32 *buffer)
> +{
> +	u8 opcode;
> +	int ret;
> +
> +	if (size <= 0 || !buffer) {
> +		dev_err(dev->dev, "Invalid input parameters, size %u, buffer %p\n",
> +			size, buffer);
> +		return -EINVAL;
> +	}
> +
> +	if (mutex_lock_interruptible(&dev->thc_bus_lock))
> +		return -EINTR;
> +
> +	opcode = (dev->port_type == THC_PORT_TYPE_SPI) ?
> +		 THC_PIO_OP_SPI_TIC_WRITE : THC_PIO_OP_I2C_TIC_WRITE;
> +
> +	ret = prepare_pio(dev, opcode, address, size);
> +	if (ret < 0)
> +		goto end;
> +
> +	pio_start(dev, size, buffer);
> +
> +	ret = pio_wait(dev);
> +	if (ret < 0)
> +		goto end;
> +
> +	ret = pio_complete(dev, NULL, NULL);
> +
> +end:
> +	mutex_unlock(&dev->thc_bus_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(thc_tic_pio_write, INTEL_THC);
> +
> +/**
> + * thc_tic_pio_write_and_read - Write data followed by read data by PIO
> + *
> + * @dev: The pointer of THC private device context
> + * @address: Slave address for the PIO operation
> + * @write_size: PIO write data size
> + * @write_buffer: The pointer of the write data buffer
> + * @read_size: Expected PIO read data size
> + * @actual_size: The pointer of the actual read data size
> + * @read_buffer: The pointer of PIO read data buffer
> + *
> + * Return: 0 on success, other error codes on failed.
> + */
> +int thc_tic_pio_write_and_read(struct thc_device *dev, const u32 address,
> +			       const u32 write_size, const u32 *write_buffer,
> +			       const u32 read_size, u32 *actual_size, u32 *read_buffer)
> +{
> +	u32 i2c_ctrl, mask;
> +	int ret;
> +
> +	if (dev->port_type == THC_PORT_TYPE_SPI) {
> +		dev_err(dev->dev, "SPI port type doesn't support pio write and read!");
> +		return -EINVAL;
> +	}
> +
> +	if (mutex_lock_interruptible(&dev->thc_bus_lock))
> +		return -EINTR;
> +
> +	/* Config i2c PIO write and read sequence */
> +	i2c_ctrl = FIELD_PREP(THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_THC_PIO_I2C_WBC, write_size);
> +	mask = THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_THC_PIO_I2C_WBC;
> +
> +	regmap_write_bits(dev->thc_regmap, THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_OFFSET,
> +			  mask, i2c_ctrl);
> +
> +	regmap_write_bits(dev->thc_regmap, THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_OFFSET,
> +			  THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_THC_I2C_RW_PIO_EN,
> +			  THC_M_PRT_SW_SEQ_I2C_WR_CNTRL_THC_I2C_RW_PIO_EN);
> +
> +	ret = prepare_pio(dev, THC_PIO_OP_I2C_TIC_WRITE_AND_READ, address, read_size);
> +	if (ret < 0)
> +		goto end;
> +
> +	pio_start(dev, write_size, write_buffer);
> +
> +	ret = pio_wait(dev);
> +	if (ret < 0)
> +		goto end;
> +
> +	ret = pio_complete(dev, read_buffer, actual_size);
> +
> +end:
> +	mutex_unlock(&dev->thc_bus_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(thc_tic_pio_write_and_read, INTEL_THC);
> +
>   MODULE_AUTHOR("Xinpeng Sun <xinpeng.sun@intel.com>");
>   MODULE_AUTHOR("Even Xu <even.xu@intel.com>");
>   
> diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
> index 7060f0a36cbd..88a9f606a6a9 100644
> --- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
> +++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
> @@ -5,21 +5,45 @@
>   #define _INTEL_THC_DEV_H_
>   
>   #include <linux/cdev.h>
> +#include <linux/mutex.h>
>   
>   #define THC_REGMAP_COMMON_OFFSET  0x10
>   #define THC_REGMAP_MMIO_OFFSET    0x1000
>   
> +/*
> + * THC Port type
> + * @THC_PORT_TYPE_SPI: This port is used for HIDSPI
> + * @THC_PORT_TYPE_I2C: This port is used for HIDI2C
> + */
> +enum thc_port_type {
> +	THC_PORT_TYPE_SPI = 0,
> +	THC_PORT_TYPE_I2C = 1,
> +};
> +
>   /**
>    * struct thc_device - THC private device struct
>    * @thc_regmap: MMIO regmap structure for accessing THC registers
>    * @mmio_addr: MMIO registers address
> + * @thc_bus_lock: mutex locker for THC config
> + * @port_type: port type of THC port instance
> + * @pio_int_supported: PIO interrupt supported flag
>    */
>   struct thc_device {
>   	struct device *dev;
>   	struct regmap *thc_regmap;
>   	void __iomem *mmio_addr;
> +	struct mutex thc_bus_lock;
> +	enum thc_port_type port_type;
> +	bool pio_int_supported;
>   };
>   
>   struct thc_device *thc_dev_init(struct device *device, void __iomem *mem_addr);
> +int thc_tic_pio_read(struct thc_device *dev, const u32 address,
> +		     const u32 size, u32 *actual_size, u32 *buffer);
> +int thc_tic_pio_write(struct thc_device *dev, const u32 address,
> +		      const u32 size, const u32 *buffer);
> +int thc_tic_pio_write_and_read(struct thc_device *dev, const u32 address,
> +			       const u32 write_size, const u32 *write_buffer,
> +			       const u32 read_size, u32 *actual_size, u32 *read_buffer);
>   
>   #endif /* _INTEL_THC_DEV_H_ */
> diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
> index 77b275a400d5..9f5f39dcedcd 100644
> --- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
> +++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
> @@ -633,4 +633,27 @@
>   
>   #define THC_M_PRT_SW_DMA_PRD_TABLE_LEN_THC_M_PRT_SW_DMA_PRD_TABLE_LEN	GENMASK(23, 0)
>   
> +#define THC_REGMAP_POLLING_INTERVAL_US		10 /* 10us */
> +#define THC_PIO_DONE_TIMEOUT_US			USEC_PER_SEC /* 1s */
> +
> +/*
> + * THC PIO opcode default value
> + * @THC_PIO_OP_SPI_TIC_READ: THC opcode for SPI PIO read
> + * @THC_PIO_OP_SPI_TIC_WRITE: THC opcode for SPI PIO write
> + * @THC_PIO_OP_I2C_SUBSYSTEM_READ: THC opcode for read I2C subsystem registers
> + * @THC_PIO_OP_I2C_SUBSYSTEM_WRITE: THC opcode for write I2C subsystem registers
> + * @THC_PIO_OP_I2C_TIC_READ: THC opcode for read I2C device
> + * @THC_PIO_OP_I2C_TIC_WRITE: THC opcode for write I2C device
> + * @THC_PIO_OP_I2C_TIC_WRITE_AND_READ: THC opcode for write followed by read I2C device
> + */
> +enum thc_pio_opcode {
> +	THC_PIO_OP_SPI_TIC_READ = 0x4,
> +	THC_PIO_OP_SPI_TIC_WRITE = 0x6,
> +	THC_PIO_OP_I2C_SUBSYSTEM_READ = 0x12,
> +	THC_PIO_OP_I2C_SUBSYSTEM_WRITE = 0x13,
> +	THC_PIO_OP_I2C_TIC_READ = 0x14,
> +	THC_PIO_OP_I2C_TIC_WRITE = 0x18,
> +	THC_PIO_OP_I2C_TIC_WRITE_AND_READ = 0x1C,
> +};
> +
>   #endif /* _INTEL_THC_HW_H_  */


