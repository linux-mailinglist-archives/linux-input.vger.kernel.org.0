Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51093FBE00
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 23:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235835AbhH3VPU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 17:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234509AbhH3VPU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 17:15:20 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E37C061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 14:14:25 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id n4so2210299plh.9
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 14:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VDHQHmnRwbsK/7WyoUfnwP/yPQCoJB2DSJ72y2lGzUQ=;
        b=DAGQYY64OC0d2IYoUZvSB8eWNrfRc0mt8b09FcvpBcoSAm9Huqd26xl0rGcgFQY4++
         y7h8XhpMTYFryM1xAYlh+ucb4vGwtOE3DyUWZCp9jrhQIwhHcqEP+auHi3J802zSUTkY
         VVfJk9B2XaQ6r5r7u29XSodH1qsg0sdjihwcMUpHtSCtjKM8iX4++a6y4P4jIs7xbhL/
         tdO+LgKXX7N+OZFVQNNCF9dp3EoA2sbehu9lKfY6lV6FZkgCghzcXSK3REM0QDjKLVWE
         m4bkdnnO0seXVZ/o7o1TzO/9sHINNNsOe4ktcqhoJkHGKm1gmvIbhR680ltqo7cAZrQM
         9x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VDHQHmnRwbsK/7WyoUfnwP/yPQCoJB2DSJ72y2lGzUQ=;
        b=qfIgSJ4GhAu/NC/WP4rrvuWl+h7ruJCdFz2hFBQYSl/dAdQ0IBG8VV4kQ9RfhxmL7J
         NHjL5rnlLqQFXY/CdHg8mLAwwFo0NmSGV30joci3hHgfuLhvYUEIvH732JCPXOxuqFSa
         A3w9CoobVeTDXXL+t+VWRPfIPZmeSP9fyJ00tK/RKvD19esatLN4apM1kfju6P0BuFfs
         DFXbAd4KW9TV/7HFV584dFehHnGbtALiEgoSASfiN7wwyi48hFYA1HMYtP3QJtuTX77c
         GlnIbr/6fBOLUUqe2+jcKAtT0/OUnxNc6vuqoIxLneBDLnUEoH1oHyAn0um1nv8uOqIX
         JG8A==
X-Gm-Message-State: AOAM533qIPkPbsjRc6T0ecVK32fnZGY+YzxXywReKetypep/znl6RpHW
        sDanfsh5NW4IN0sifQrKR2Y=
X-Google-Smtp-Source: ABdhPJygoKqGjnDVBbd4bxT6GyqdI73Sau5McYZzksmPlJCUFcl1pkepXdwUWbMUHi5ieWyPJ2QD6g==
X-Received: by 2002:a17:90a:df17:: with SMTP id gp23mr1218356pjb.12.1630358065206;
        Mon, 30 Aug 2021 14:14:25 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:771a:afc8:2e96:23dd])
        by smtp.gmail.com with ESMTPSA id t9sm14571379pfe.73.2021.08.30.14.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 14:14:24 -0700 (PDT)
Date:   Mon, 30 Aug 2021 14:14:22 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v2 3/3] Input: ili210x - add ili251x firmware update
 support
Message-ID: <YS1KLkCX01tlHBcy@google.com>
References: <20210827211258.318618-1-marex@denx.de>
 <20210827211258.318618-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827211258.318618-3-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 27, 2021 at 11:12:58PM +0200, Marek Vasut wrote:
> The ili251x firmware can be updated, this is used when switching between
> different modes of operation of the touch surface, e.g. glove operation.
> This patch implements the firmware update mechanism triggered by a write
> of firmware name into an sysfs attribute.
> 
> The firmware itself is distributed as an intel hex file with non-standard
> types. The first two lines are of type 0xad, which indicates the start of
> DataFlash payload, that is always at address 0xf000 on the ili251x, so it
> can be dropped, and 0xac which indicates the position of firmware info in
> the Application payload, that is always at address 0x2020 on the ili251x
> and we do not care. The rest of the firmware is data of type 0x00, and we
> care about that. To convert the firmware hex file into something usable
> by the kernel, remove the first two lines and then use ihex2fw:
> 
>  $ tail -n +3 input.hex > temp.hex
>  $ ./tools/firmware/ihex2fw temp.hex firmware/touch.bin
> 
> To trigger the firmware update, place touch.bin or whichever file name
> you pick into /lib/firmware/, write that zero terminated file name into
> firmware_update sysfs attribute, wait about 30-40 seconds. The firmware
> update is slow. Then verify firmware_version and mode sysfs attributes
> to verify whether the firmware got updated and the controller switched
> back to application (AP) mode by reading out firmware_version attribute
> in sysfs.
> 
> Note that the content of firmware_version, e.g. 0600.0005.abcd.aa04 can
> be matched to the content of the firmware hex file. The first four bytes,
> 0x06 0x00 0x00 0x05 can be found at ^:102030 00 05000006, the next four
> bytes 0xab 0xcd 0xaa 0x04 at ^:10F000 00 nnnnnnnn ABCDAA04.
> 
> Note that the protocol differs considerably between the ili2xxx devices,
> this patch therefore implements this functionality only for ili251x that
> I can test.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Joe Hung <joe_hung@ilitek.com>
> Cc: Luca Hsu <luca_hsu@ilitek.com>
> ---
> V2: - Rename REG_IC_MODE to REG_GET_MODE, since it is pair command to REG_SET_MODE
>     - Replace 0xc7 in code with REG_READ_DATA_CRC macro
>     - Handle firmware name with newline at the end
>     - Update X and Y resolution after firmware update, the FW could have
>       changed the resolution
> ---
>  drivers/input/touchscreen/Kconfig   |   1 +
>  drivers/input/touchscreen/ili210x.c | 323 +++++++++++++++++++++++++++-
>  2 files changed, 318 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index ad454cd2855a..4d34043cdf01 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -425,6 +425,7 @@ config TOUCHSCREEN_HYCON_HY46XX
>  config TOUCHSCREEN_ILI210X
>  	tristate "Ilitek ILI210X based touchscreen"
>  	depends on I2C
> +	select CRC_CCITT
>  	help
>  	  Say Y here if you have a ILI210X based touchscreen
>  	  controller. This driver supports models ILI2102,
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 7790ad000dc1..c4a9bd3f67e7 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -1,7 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/crc-ccitt.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> +#include <linux/ihex.h>
>  #include <linux/input.h>
>  #include <linux/input/mt.h>
>  #include <linux/input/touchscreen.h>
> @@ -25,9 +27,14 @@
>  #define REG_FIRMWARE_VERSION	0x40
>  #define REG_PROTOCOL_VERSION	0x42
>  #define REG_KERNEL_VERSION	0x61
> -#define REG_IC_MODE		0xc0
> -#define REG_IC_MODE_AP		0x5a
> -#define REG_IC_MODE_BL		0x55
> +#define REG_GET_MODE		0xc0
> +#define REG_GET_MODE_AP		0x5a
> +#define REG_GET_MODE_BL		0x55
> +#define REG_SET_MODE_AP		0xc1
> +#define REG_SET_MODE_BL		0xc2
> +#define REG_WRITE_DATA		0xc3
> +#define REG_WRITE_ENABLE	0xc4
> +#define REG_READ_DATA_CRC	0xc7
>  #define REG_CALIBRATE		0xcc
>  
>  struct ili2xxx_chip {
> @@ -445,15 +452,15 @@ static ssize_t ili251x_mode_show(struct device *dev,
>  
>  	/* Get mode */
>  	mutex_lock(&priv->lock);
> -	ret = priv->chip->read_reg(client, REG_IC_MODE, &md, sizeof(md));
> +	ret = priv->chip->read_reg(client, REG_GET_MODE, &md, sizeof(md));
>  	mutex_unlock(&priv->lock);
>  
>  	if (ret)
>  		return ret;
>  
> -	if (md[0] == REG_IC_MODE_AP)		/* Application Mode */
> +	if (md[0] == REG_GET_MODE_AP)		/* Application Mode */
>  		mode = "AP";
> -	else if (md[0] == REG_IC_MODE_BL)	/* BootLoader Mode */
> +	else if (md[0] == REG_GET_MODE_BL)	/* BootLoader Mode */
>  		mode = "BL";
>  	else					/* Unknown Mode */
g>  		mode = "??";
> @@ -488,8 +495,312 @@ static ssize_t ili210x_calibrate(struct device *dev,
>  }
>  static DEVICE_ATTR(calibrate, S_IWUSR, NULL, ili210x_calibrate);
>  
> +static int ili251x_firmware_to_buffer(struct device *dev,
> +				      const char *fwname, u8 **buf,
> +				      u16 *ac_end, u16 *df_end)
> +{
> +	const struct firmware *fw = NULL;
> +	const struct ihex_binrec *rec;
> +	u32 fw_addr, fw_last_addr = 0;
> +	u16 fw_len;
> +	u8 *fw_buf;
> +	int ret;
> +
> +	ret = request_ihex_firmware(&fw, fwname, dev);

Let's call variables that carry error code or 0 as success 'error' and
reserve 'ret' for cases when there can be actual data.

> +	if (ret) {
> +		dev_err(dev, "Failed to request firmware %s, ret=%d\n", fwname, ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * The firmware ihex blob can never be bigger than 64 kiB, so make this
> +	 * simple -- allocate a 64 kiB buffer, iterate over the ihex blob records
> +	 * once, copy them all into this buffer at the right locations, and then
> +	 * do all operations on this linear buffer.
> +	 */
> +	fw_buf = kcalloc(1, SZ_64K, GFP_KERNEL);

Why kcalloc and not kzalloc?

> +	if (!fw_buf) {
> +		ret = -ENOMEM;
> +		goto err_alloc;
> +	}
> +
> +	rec = (const struct ihex_binrec *)fw->data;
> +	while (rec) {
> +		fw_addr = be32_to_cpu(rec->addr);
> +		fw_len = be16_to_cpu(rec->len);
> +
> +		if (fw_addr + fw_len > SZ_64K) {
> +			ret = -EFBIG;
> +			goto err_big;
> +		}
> +
> +		/* Find the last address before DF start address, that is AC end */
> +		if (fw_addr == 0xf000)
> +			*ac_end = fw_last_addr;
> +		fw_last_addr = fw_addr + fw_len;
> +
> +		memcpy(fw_buf + fw_addr, rec->data, fw_len);
> +		rec = ihex_next_binrec(rec);
> +	}
> +
> +	/* DF end address is the last address in the firmware blob */
> +	*df_end = fw_addr + fw_len;
> +	*buf = fw_buf;
> +	release_firmware(fw);
> +	return 0;
> +err_big:
> +	kfree(fw_buf);
> +err_alloc:
> +	release_firmware(fw);
> +	return ret;
> +}
> +
> +/* Switch mode between Application and BootLoader */
> +static int ili251x_switch_ic_mode(struct i2c_client *client, u8 cmd_mode)
> +{
> +	struct ili210x *priv = i2c_get_clientdata(client);
> +	u8 cmd_wren[3] = { REG_WRITE_ENABLE, 0x5a, 0xa5 };
> +	u8 md[2];
> +	int ret;
> +
> +	ret = priv->chip->read_reg(client, REG_GET_MODE, md, sizeof(md));
> +	if (ret)
> +		return ret;
> +	/* Mode already set */
> +	if ((cmd_mode == REG_SET_MODE_AP && md[0] == REG_GET_MODE_AP) ||
> +	    (cmd_mode == REG_SET_MODE_BL && md[0] == REG_GET_MODE_BL))
> +		return 0;
> +
> +	/* Unlock writes */
> +	ret = i2c_master_send(client, cmd_wren, sizeof(cmd_wren));
> +	if (ret != sizeof(cmd_wren))
> +		return -EINVAL;
> +
> +	mdelay(20);
> +
> +	/* Select mode (BootLoader or Application) */
> +	ret = i2c_master_send(client, &cmd_mode, 1);
> +	if (ret != 1)
> +		return -EINVAL;
> +
> +	mdelay(200);	/* Reboot into bootloader takes a lot of time ... */
> +
> +	/* Read back mode */
> +	ret = priv->chip->read_reg(client, REG_GET_MODE, md, sizeof(md));
> +	if (ret)
> +		return ret;
> +	/* Check if mode is correct now. */
> +	if ((cmd_mode == REG_SET_MODE_AP && md[0] == REG_GET_MODE_AP) ||
> +	    (cmd_mode == REG_SET_MODE_BL && md[0] == REG_GET_MODE_BL))
> +		return 0;
> +
> +	return -EINVAL;
> +}
> +
> +static int ili251x_firmware_busy(struct i2c_client *client)
> +{
> +	struct ili210x *priv = i2c_get_clientdata(client);
> +	int ret, i = 0;
> +	u8 data;
> +
> +	do {
> +		/* The read_reg already contains suitable delay */
> +		ret = priv->chip->read_reg(client, 0x80, &data, 1);

Can we have symbolic name for this register (and others).

> +		if (ret)
> +			return ret;
> +		if (i++ == 100000)
> +			return -ETIMEDOUT;
> +	} while (data != 0x50);
> +
> +	return 0;
> +}
> +
> +static int ili251x_firmware_write_to_ic(struct device *dev, u8 *fwbuf,
> +					u16 start, u16 end, u8 dataflash)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ili210x *priv = i2c_get_clientdata(client);
> +	u8 cmd_crc = REG_READ_DATA_CRC;
> +	u8 crcrb[4] = { 0 };
> +	u8 fw_data[33];
> +	u16 fw_addr;
> +	int ret;
> +
> +	/*
> +	 * The DF (dataflash) needs 2 bytes offset for unknown reasons,
> +	 * the AC (application) has 2 bytes CRC16-CCITT at the end.
> +	 */
> +	u16 crc = crc_ccitt(0, fwbuf + start + (dataflash ? 2 : 0),
> +			    end - start - 2);
> +
> +	/* Unlock write to either AC (application) or DF (dataflash) area */
> +	u8 cmd_wr[10] = {
> +		REG_WRITE_ENABLE, 0x5a, 0xa5, dataflash,
> +		(end >> 16) & 0xff, (end >> 8) & 0xff, end & 0xff,
> +		(crc >> 16) & 0xff, (crc >> 8) & 0xff, crc & 0xff
> +	};
> +
> +	ret = i2c_master_send(client, cmd_wr, sizeof(cmd_wr));
> +	if (ret != sizeof(cmd_wr))
> +		return -EINVAL;
> +
> +	ret = ili251x_firmware_busy(client);
> +	if (ret)
> +		return ret;
> +
> +	for (fw_addr = start; fw_addr < end; fw_addr += 32) {
> +		fw_data[0] = REG_WRITE_DATA;
> +		memcpy(&(fw_data[1]), fwbuf + fw_addr, 32);

Is it guaranteed that we have enough data (32 bytes) and we will not
reach past the buffer?

> +		ret = i2c_master_send(client, fw_data, 33);
> +		if (ret != sizeof(fw_data))
> +			return ret;
> +		ret = ili251x_firmware_busy(client);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = i2c_master_send(client, &cmd_crc, 1);
> +	if (ret != 1)
> +		return -EINVAL;
> +
> +	ret = ili251x_firmware_busy(client);
> +	if (ret)
> +		return ret;
> +
> +	ret = priv->chip->read_reg(client, REG_READ_DATA_CRC,
> +				   &crcrb, sizeof(crcrb));
> +	if (ret)
> +		return ret;
> +
> +	/* Check CRC readback */
> +	if ((crcrb[0] != (crc & 0xff)) || crcrb[1] != ((crc >> 8) & 0xff))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int ili251x_firmware_reset(struct i2c_client *client)
> +{
> +	u8 cmd_reset[2] = { 0xf2, 0x01 };
> +	int ret;
> +
> +	ret = i2c_master_send(client, cmd_reset, sizeof(cmd_reset));
> +	if (ret != sizeof(cmd_reset))
> +		return -EINVAL;
> +
> +	return ili251x_firmware_busy(client);
> +}
> +
> +static void ili251x_hardware_reset(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ili210x *priv = i2c_get_clientdata(client);
> +
> +	/* Reset the controller */
> +	gpiod_set_value_cansleep(priv->reset_gpio, 1);
> +	usleep_range(10000, 15000);
> +	gpiod_set_value_cansleep(priv->reset_gpio, 0);
> +	msleep(300);
> +}
> +
> +static ssize_t ili210x_firmware_update_store(struct device *dev,
> +					     struct device_attribute *attr,
> +					     const char *buf, size_t count)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ili210x *priv = i2c_get_clientdata(client);
> +	char fwname[NAME_MAX];
> +	u16 ac_end, df_end;
> +	u8 *fwbuf;
> +	int ret;
> +	int i;
> +
> +	if (count >= NAME_MAX) {
> +		dev_err(dev, "File name too long\n");
> +		return -EINVAL;
> +	}
> +
> +	memcpy(fwname, buf, count);
> +	if (fwname[count - 1] == '\n')
> +		fwname[count - 1] = '\0';
> +	else
> +		fwname[count] = '\0';

I believe the practice is to use constant firmware name based on driver
or chip name. If there is desire to allow dynamic firmware name for
given device I think it should be handled at firmware loader core.

> +
> +	ret = ili251x_firmware_to_buffer(dev, fwname, &fwbuf, &ac_end, &df_end);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	dev_info(dev, "Firmware update started, firmware=%s\n", fwname);

dev_dbg() please.

> +
> +	ili251x_hardware_reset(dev);
> +
> +	ret = ili251x_firmware_reset(client);
> +	if (ret)
> +		goto exit;
> +
> +	/* This may not succeed on first try, so re-try a few times. */
> +	for (i = 0; i < 5; i++) {
> +		ret = ili251x_switch_ic_mode(client, REG_SET_MODE_BL);
> +		if (!ret)
> +			break;
> +	}
> +
> +	if (ret)
> +		goto exit;
> +
> +	dev_info(dev, "IC is now in BootLoader mode\n");
> +
> +	msleep(200);	/* The bootloader seems to need some time too. */
> +
> +	ret = ili251x_firmware_write_to_ic(dev, fwbuf, 0xf000, df_end, 1);
> +	if (ret) {
> +		dev_err(dev, "DF firmware update failed, ret=%d\n", ret);
> +		goto exit;
> +	}
> +
> +	dev_info(dev, "DataFlash firmware written\n");
> +
> +	ret = ili251x_firmware_write_to_ic(dev, fwbuf, 0x2000, ac_end, 0);
> +	if (ret) {
> +		dev_err(dev, "AC firmware update failed, ret=%d\n", ret);
> +		goto exit;
> +	}
> +
> +	dev_info(dev, "Application firmware written\n");
> +
> +	/* This may not succeed on first try, so re-try a few times. */
> +	for (i = 0; i < 5; i++) {
> +		ret = ili251x_switch_ic_mode(client, REG_SET_MODE_AP);
> +		if (!ret)
> +			break;
> +	}
> +
> +	if (ret)
> +		goto exit;
> +
> +	dev_info(dev, "IC is now in Application mode\n");
> +
> +	ret = ili251x_firmware_update_resolution(dev);
> +	if (ret)
> +		goto exit;
> +
> +	ret = count;
> +
> +exit:
> +	ili251x_hardware_reset(dev);
> +	dev_info(dev, "Firmware update ended, ret=%i\n", ret);
> +	mutex_unlock(&priv->lock);
> +	kfree(fwbuf);
> +	return ret;
> +}
> +
> +static DEVICE_ATTR(firmware_update, 0200, NULL, ili210x_firmware_update_store);
> +
>  static struct attribute *ili210x_attributes[] = {
>  	&dev_attr_calibrate.attr,
> +	&dev_attr_firmware_update.attr,
>  	&dev_attr_firmware_version.attr,
>  	&dev_attr_kernel_version.attr,
>  	&dev_attr_protocol_version.attr,
> -- 
> 2.32.0
> 

Thanks.

-- 
Dmitry
