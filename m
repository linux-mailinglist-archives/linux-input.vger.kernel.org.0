Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776802B1427
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 03:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgKMCHU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 21:07:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgKMCHU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 21:07:20 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2DDC0613D1;
        Thu, 12 Nov 2020 18:07:20 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id b63so2681088pfg.12;
        Thu, 12 Nov 2020 18:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K+5lP+6SdA7Q0aRYAahOsD3pd2nwR+KnPMnUnFXiiTg=;
        b=YOGIygaB8cxLgsBg7uXYvDplxqDNrLO6pY34KJRQ32bJ6Qi9hdqvw4Q/G8OA5pWHsh
         nfc7ThN5p4rt6MBaDT5bGUgS1DsgYaWXFGm7KloJsxf8+m0JLRrFzG7MdRHhecFZrOVC
         AULady90bP24Zn2V14n1LnJIOkbsHMnM1lKCeyWUGhYdp4zGZMGLriQou8/OyIkS/tzo
         tWKxDHO/mOrTqO1F+2zv9O0KFFNvDCV9pUR3zLfvCyDSaPHaVCe+Djj9lbtJQuiMAIPS
         0UyWTqsVFDOdGrwbueLQHiT0yESe0htR5/H1UeWK7OiGy819HqpQg2wpHO+5ZIwR2jmq
         Bdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K+5lP+6SdA7Q0aRYAahOsD3pd2nwR+KnPMnUnFXiiTg=;
        b=qFx5Uczam16Q/93eVNsCiINHWI2U7LaAz2GwDKJ3+5ouuLPzdga+TCMRH2IAoQPlSF
         Lw9/c6YQLoIqPcZhh0wzuJsrCTCi6tzbvwBa3agxmPXaVT/JrzNYdoR/vW8jISRCkXF0
         0R0W41Xuyy9fdrlzI5iIRKL451JKy6vrSPKmo3UWqV0ajRIn5zIWEfXS7P2W7nPOT9vA
         L+t5zWJqRcL58PxzcqEZPd1c6HLHn+e0zKMBfrSBuT4I8oPO6YmSnT6I4fqpMo49yo33
         QaYqgDDe9Sb4iUm9tEzwk2pvUWODHw7CXURtcAN4YsajgeQ+qObTPM3KSlkYHW03PU1j
         OujA==
X-Gm-Message-State: AOAM532wikT655HBbkuykbbq9jWMpMZyAzKq52aWsn9ZAvsMbGP8InbQ
        xi7Gn2DCcTGtm7CFjsofsAw=
X-Google-Smtp-Source: ABdhPJwsqeWGTTbq2/khGDhkf7n6zBmZicaUyCEeVbYB/uAbuqBXJzEvjBhs90xem+tu1hxV4yj+hQ==
X-Received: by 2002:a62:5406:0:b029:18c:8dac:4a99 with SMTP id i6-20020a6254060000b029018c8dac4a99mr2076475pfb.19.1605233239540;
        Thu, 12 Nov 2020 18:07:19 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a18sm990641pfa.151.2020.11.12.18.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 18:07:18 -0800 (PST)
Date:   Thu, 12 Nov 2020 18:07:16 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     KwangDeok Son <kdson@zinitix.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: add new touchpad driver for Zinitix IC
Message-ID: <20201113020716.GC356503@dtor-ws>
References: <20201112204037.502fbae0@zinitix-H370AORUSGAMING3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112204037.502fbae0@zinitix-H370AORUSGAMING3>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi KwangDeok,

On Thu, Nov 12, 2020 at 08:40:37PM +0900, KwangDeok Son wrote:
> Add new touchpad driver for Zinitix IC
> Supports five fingers multi-touch and firmware updates.
> It communicates with the device via an I2C bus.
> 
> Signed-off-by : KwangDeok Son <kdson@zinitix.com>

Please run the patch through ./scripts/checkpatch.pl and fix warnings
from the tool.

> @@ -0,0 +1,1524 @@
> +/*
> + * Zinitics I2C Touchpad driver
> + *
> + * Copyright (c) 2020 ZINITIX Co.,Ltd
> + *
> + * Author: KwangDeok Son <kdson@zinitix.com>
> + *
> + * Based on elan driver:
> + * Copyright (c) 2011-2013 ELAN Microelectronics Corp.
> + * copyright (c) 2011-2012 Cypress Semiconductor, Inc.
> + * copyright (c) 2011-2012 Google, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published
> + * by the Free Software Foundation.

Please drop GPL notice, use SPDX tag instead.

> + *
> + * Trademarks are the property of their respective owners.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/kernel.h>
> +#include <linux/sched.h>

Please double-check that all includes are actually needed.

> +#include <linux/input.h>
> +#include <linux/uaccess.h>
> +#include <linux/jiffies.h>
> +#include <linux/completion.h>
> +#include <linux/of.h>
> +#include <asm/unaligned.h>

asm includes should go after linux ones.

> +
> +#include <linux/delay.h>
> +#include <linux/firmware.h>
> +#include <linux/i2c.h>
> +#include <linux/input/mt.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/regulator/consumer.h>
> +#include "zinitix_i2c.h"

We are not going to share any definitions with other modules, so put all
the constants in this file and drop the .h one.

> +int zinitix_i2c_write_reg(struct i2c_client *client, u16 reg, u16 value)
> +{
> +        int errno = 0;
> +        u8 buf[22] = {0x80, 0x01, 0x14, 0x00, 0x06, 0x00, };

Please add a #define for 22 constant.

> +
> +	buf[6] = reg & 0xFF;
> +	buf[7] = (reg>>8)&0xFF;
> +	buf[8] = value & 0xFF;;
> +	buf[9] = (value>>8)&0xFF;;
> +		

We have cpu_to_le16 and put_unaligned_le16 for this.

> +	errno = zinitix_i2c_write_buf(client, buf, 22);

sizeof(buf) instead of 22

> +
> +	return errno;
> +}
> +
> +int zinitix_i2c_write_data(struct i2c_client *client, u16 reg, 
> +                                const u8* value, u16 size)
> +{
> +        int errno = 0;
> +        u8 buf[22] = {0x80, 0x01, 0x14, 0x00, 0x06, 0x00, };
> +	buf[5] = size & 0xFF;
> +	buf[6] = reg & 0xFF;
> +	buf[7] = (reg>>8)&0xFF;
> +	memcpy(&buf[8], value, size);

Need to make sure we are not overwriting the buffer.

> +	errno = zinitix_i2c_write_buf(client, buf, 22);	
> +
> +	return errno;
> +}
> +
> +int zinitix_i2c_write_fwdata(struct i2c_client *client, u16 reg, 
> +                                const u8* value, u16 size)
> +{
> +        int errno = 0;
> +        u8 buf[22] = {0x80, 0x01, 0x14, 0x00, 0x06, 0x00, };
> +	buf[5] = size & 0xFF;
> +	
> +	memcpy(&buf[6], value, size);

Need to make sure we are not overwriting the buffer.

> +	
> +	errno = zinitix_i2c_write_buf(client, buf, 22);	
> +	
> +	return errno;
> +}
> +
> +u16 zinitix_i2c_read_reg(struct i2c_client *client, u16 reg, u16* value)
> +{
> +	u16 retval = 0;
> +	u8 outBuf[26] = {0x94, 0x1, 0x26, 0x3, 0x96, 0x1, 0x14, 0, 0x6, 0x1, };
> +	u8 inBuf[8] = {0, };
> +	
> +	//Sample

I prefer C-style comments.

> +	outBuf[10] = reg & 0xFF;
> +	outBuf[11] = (reg>>8)&0xFF;
> +	//Send
> +	retval = (u16)zinitix_i2c_write_buf(client, outBuf, 26);

Error handling?

> +	//Recv
> +	outBuf[2] = 0x16;
> +	outBuf[3] = 0x02;
> +	retval = (u16)zinitix_i2c_read_buf(client, outBuf,6, inBuf, 8);
> +	if (retval < 0) {

?? You are casing to u16 and then checking for negative value?

> +		dev_err(&client->dev, "reading cmd (0x%04x) fail.\n", reg);
> +		return retval;
> +	}
> +
> +	*value = (inBuf[6]&0xFF) | ((inBuf[7]<<8)&0xFF00);

le16_to_cpup(). Elsewhere too.

> +
> +static int get_descriptor(struct i2c_client *client, u8* val)
> +{
> +        struct touchpad_data *data = i2c_get_clientdata(client);
> +        int error;
> +        //Get HID Descriptor
> +        error = zinitix_i2c_read(client, ZINITIX_GET_DESC, 
> +                                val, ZINITIX_DESC_LENGTH);

Is this truly HID descriptor? Is device compatible with I2C HID
spec/Microsoft Precision point protocol? If so this driver is not needed
at all and we can use i2c-hid + hid-multitouch to handle the device.

> +
> +const struct zinitix_transport_ops zinitix_i2c_ops = {
> +	.initialize		= zinitix_i2c_initialize,
> +	.sleep_control		= zinitix_sleep_control,
> +	.reset		        = zinitix_reset,
> +	.get_max		= zinitix_i2c_get_max,
> +	.get_num_channel        = zinitix_i2c_get_num_channel,
> +	.prepare_fw_update	= zinitix_i2c_prepare_fw_update,
> +	.write_fw_block		= zinitix_i2c_write_fw_block,
> +	.read_fw_block		= zinitix_i2c_read_fw_block,
> +	.finish_fw_update	= zinitix_i2c_finish_fw_update,
> +	.get_report		= zinitix_i2c_get_report,
> +};

Are you planning on adding additional transports (such as SMB)? If not,
then this indirection is not needed.

Thanks.

-- 
Dmitry
