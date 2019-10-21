Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D82BDE850
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 11:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfJUJkc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Oct 2019 05:40:32 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:12309 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfJUJkc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Oct 2019 05:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571650829;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=kfIfi2H9s6NC4aQNCXhr9dBZlNXh2glaq5K8IuEoeys=;
        b=eHEJ4JLjIj5R7ftBhG6rgPQJruEvoifx/raTJlzepCrDaraoaO3lnMLpkWLN7PhjZL
        ksXMSFPk0T5pFfzeVvIFLplEn9h/uUdeXJ3rCCcvr7hjTlbNzoJqwbQSlLDTCBmxFMy0
        YAUAOF3+FzU7oFWVSX/96fOp/NmV7rLNhz8ETAaRGNe8aZUqEPx83petADN1A6sXCMKd
        o8nn7LL4IEzxktrKe1IOlS8k2J3VLyX3mG50g45fKHGAWC1DYU+YKhULMntBrtRDFNcw
        vohoMJz8jY1IDbtXULmvA6s8vIV8F5e7McSLWAiZKZ09xQzRhnK+an7ijDeKlHa6CHRk
        5fUQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJDdfTYstM="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.28.1 AUTH)
        with ESMTPSA id 409989v9L9YSN8Q
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 21 Oct 2019 11:34:28 +0200 (CEST)
Date:   Mon, 21 Oct 2019 11:34:23 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andi Shyti <andi@etezian.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 1/2] Input: mms114 - use smbus functions whenever
 possible
Message-ID: <20191021093423.GA1116@gerhold.net>
References: <20191020202856.20287-1-andi@etezian.org>
 <20191020202856.20287-2-andi@etezian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191020202856.20287-2-andi@etezian.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andi,

Thanks for working on these patches!

Not sure if you saw my comment regarding your patch [1],
so I'll just repeat it properly inline here:

[1]: https://patchwork.kernel.org/patch/11178515/#22927311

On Sun, Oct 20, 2019 at 11:28:55PM +0300, Andi Shyti wrote:
> The exchange of data to and from the mms114 touchscreen never
> exceeds 256 bytes. In the worst case it goes up to 80 bytes in
> the interrupt handler while reading the events.
> 

i2c_smbus_read_i2c_block_data() is actually limited to
I2C_SMBUS_BLOCK_MAX = 32.

> Thus it's not needed to make use of custom read/write functions
> for accessing the i2c. Replace, whenever possible, the use of
> custom functions with the more standard smbus ones.
> 
> It's not possible only in one case, in the mms114_set_active()
> function where the 'cache_mode_control' variable is updated
> according to the value in the register 'MMS114_MODE_CONTROL'
> register.
> 
> Signed-off-by: Andi Shyti <andi@etezian.org>
> Tested-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> ---
>  drivers/input/touchscreen/mms114.c | 32 +++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
> index a5ab774da4cc..170dcb5312b9 100644
> --- a/drivers/input/touchscreen/mms114.c
> +++ b/drivers/input/touchscreen/mms114.c
> @@ -204,14 +204,15 @@ static irqreturn_t mms114_interrupt(int irq, void *dev_id)
>  	}
>  	mutex_unlock(&input_dev->mutex);
>  
> -	packet_size = mms114_read_reg(data, MMS114_PACKET_SIZE);
> +	packet_size = i2c_smbus_read_byte_data(data->client,
> +					       MMS114_PACKET_SIZE);
>  	if (packet_size <= 0)
>  		goto out;
>  
>  	touch_size = packet_size / MMS114_PACKET_NUM;
>  
> -	error = __mms114_read_reg(data, MMS114_INFORMATION, packet_size,
> -			(u8 *)touch);
> +	error = i2c_smbus_read_i2c_block_data(data->client, MMS114_INFORMATION,
> +					      packet_size, (u8 *)touch);

... and here we try to read up to 80 bytes, as you mentioned.

i2c_smbus_read_i2c_block_data() will silently fall back to reading only
32 bytes. Therefore, if we try to read more than 32 bytes here we will
later read uninitialized data.

With this change, if you use more than 4 fingers you can easily trigger
a situation where one of the fingers gets "stuck", together with:
  mms114 4-0048: Wrong touch type (0)

So we still need the custom functions here, or maybe avoid the problem
by using regmap instead.

>  	if (error < 0)
>  		goto out;
>  
> @@ -251,7 +252,8 @@ static int mms114_get_version(struct mms114_data *data)
>  
>  	switch (data->type) {
>  	case TYPE_MMS152:
> -		error = __mms114_read_reg(data, MMS152_FW_REV, 3, buf);
> +		error = i2c_smbus_read_i2c_block_data(data->client,
> +						      MMS152_FW_REV, 3, buf);
>  		if (error)

i2c_smbus_read_i2c_block_data() returns the number of read bytes,
therefore this check will always fail.

It should be: if (error < 0)

>  			return error;
>  
> @@ -265,7 +267,8 @@ static int mms114_get_version(struct mms114_data *data)
>  		break;
>  
>  	case TYPE_MMS114:
> -		error = __mms114_read_reg(data, MMS114_TSP_REV, 6, buf);
> +		error = i2c_smbus_read_i2c_block_data(data->client,
> +						      MMS114_TSP_REV, 6, buf);
>  		if (error)

As above.

>  			return error;
>  
> @@ -297,30 +300,35 @@ static int mms114_setup_regs(struct mms114_data *data)
>  
>  	val = (props->max_x >> 8) & 0xf;
>  	val |= ((props->max_y >> 8) & 0xf) << 4;
> -	error = mms114_write_reg(data, MMS114_XY_RESOLUTION_H, val);
> +	error = i2c_smbus_write_byte_data(data->client,
> +					  MMS114_XY_RESOLUTION_H, val);
>  	if (error < 0)
>  		return error;
>  
>  	val = props->max_x & 0xff;
> -	error = mms114_write_reg(data, MMS114_X_RESOLUTION, val);
> +	error = i2c_smbus_write_byte_data(data->client,
> +					  MMS114_X_RESOLUTION, val);
>  	if (error < 0)
>  		return error;
>  
>  	val = props->max_x & 0xff;
> -	error = mms114_write_reg(data, MMS114_Y_RESOLUTION, val);
> +	error = i2c_smbus_write_byte_data(data->client,
> +					  MMS114_Y_RESOLUTION, val);
>  	if (error < 0)
>  		return error;
>  
>  	if (data->contact_threshold) {
> -		error = mms114_write_reg(data, MMS114_CONTACT_THRESHOLD,
> -				data->contact_threshold);
> +		error = i2c_smbus_write_byte_data(data->client,
> +						  MMS114_CONTACT_THRESHOLD,
> +						  data->contact_threshold);
>  		if (error < 0)
>  			return error;
>  	}
>  
>  	if (data->moving_threshold) {
> -		error = mms114_write_reg(data, MMS114_MOVING_THRESHOLD,
> -				data->moving_threshold);
> +		error = i2c_smbus_write_byte_data(data->client,
> +						  MMS114_MOVING_THRESHOLD,
> +						  data->moving_threshold);
>  		if (error < 0)
>  			return error;
>  	}
> -- 
> 2.24.0.rc0
> 
