Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0EFFF9E98
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 00:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfKLXxF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 18:53:05 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39026 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbfKLXxF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 18:53:05 -0500
Received: by mail-pg1-f194.google.com with SMTP id 29so67957pgm.6;
        Tue, 12 Nov 2019 15:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p2LxUnAGqeI9JkzPQsKtAeZ7u8WEu8+XUm7FluM6WT0=;
        b=FbsebpwZZi+8TV9bme08nwJrSIyzRPVOepCUju1MwPRBNhm8zdaj/YA5NNtzZlUGvO
         2Vy9wAkE1BZLktFSD98/7kVbrNuk/N3NN1NUWcEs2KPw3epq+krFCi3vmrunYP7HJPAN
         aifbk6BBnD0LnhFFN0qAcxKlsgg4uIGuGSkRuG94bPG5nBE4XNPyiw1s5dTOlqLiDcNe
         9p/eqHKMxIF9OIYDHxT55j9x+j9MHfBXzrzYk6Fiu5X0oRrtYV7v8scOp6si5H9mOXu5
         r6jb/cu0SCBTQhQnGw8RwvXhkUCkwfPwJVuyANZOq/n/HThu1AALcAJUqq23MY6DNOTx
         6AhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p2LxUnAGqeI9JkzPQsKtAeZ7u8WEu8+XUm7FluM6WT0=;
        b=WPHhjgNcNc9REQp0FhDQLV8gh/hrVeBEbCxs1xPOS+cAYFsUK7o2Ue7FysDiPia58i
         gn9BmY+7rYqctfshZjQ9GFQu5ZAwqvnTQzSg+AoVFaNKsPnrsY0ZEoFeJ3yXCfgkzddo
         22PCxNJVlwN2+1jL8m3vZp531aF/tjuVZ95nu8xGaelcD5HqQfBAnpxH6bz35E+Fzp99
         U5e5HS9unIHiwWNP7jeiW3eWmo/b2sUpvcpddubtNVDIRZw3IdhjqiItN0PBIaXNUb3Q
         vfzpWxfEMezRbQ87a7bEdvm3JsTSc39UcJHah9VRdeIrkSs3hT+1nIwLLGLFFW1ERErm
         atng==
X-Gm-Message-State: APjAAAUVAfpokXx/w8gMjuZkS+E+cVEAAwzg7SjKTnvZtoEjRQjhvAbi
        J25IZaThvfrlCBZmRkeDbbs=
X-Google-Smtp-Source: APXvYqzMh6NMbQCYQH7yPsr9BBQCcb+/VQKC3BjHcZvB0dDmkzXhcAhIvaerzs8KWqKMmsG8VkYECg==
X-Received: by 2002:a17:90b:d85:: with SMTP id bg5mr643676pjb.5.1573602784653;
        Tue, 12 Nov 2019 15:53:04 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v10sm97216pfg.11.2019.11.12.15.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 15:53:04 -0800 (PST)
Date:   Tue, 12 Nov 2019 15:53:02 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v1 1/3] Input: ili210x - do not retrieve/print chip
 firmware version
Message-ID: <20191112235302.GG13374@dtor-ws>
References: <20191112164429.11225-1-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112164429.11225-1-TheSven73@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 12, 2019 at 11:44:27AM -0500, Sven Van Asbroeck wrote:
> The driver's method to retrieve the firmware version on ili2117/
> ili2118 chip flavours is incorrect. The firmware version register
> address and layout are wrong.
> 
> The firmware version is not actually used anywhere inside or
> outside this driver. There is a dev_dbg() print, but that is
> only visible when the developer explicitly compiles in debug
> support.
> 
> Don't make the code more complicated to preserve a feature that
> no-one is using. Remove all code associated with chip firmware
> version.
> 
> Link: https://lore.kernel.org/lkml/20191111181657.GA57214@dtor-ws/
> Cc: Marek Vasut <marex@denx.de>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: <linux-kernel@vger.kernel.org>
> Cc: linux-input@vger.kernel.org
> Tree: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=next
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/ili210x.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 0ed6014af6d7..a6feae5ce887 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -21,15 +21,8 @@
>  /* Touchscreen commands */
>  #define REG_TOUCHDATA		0x10
>  #define REG_PANEL_INFO		0x20
> -#define REG_FIRMWARE_VERSION	0x40
>  #define REG_CALIBRATE		0xcc
>  
> -struct firmware_version {
> -	u8 id;
> -	u8 major;
> -	u8 minor;
> -} __packed;
> -
>  struct ili2xxx_chip {
>  	int (*read_reg)(struct i2c_client *client, u8 reg,
>  			void *buf, size_t len);
> @@ -342,7 +335,6 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>  	struct ili210x *priv;
>  	struct gpio_desc *reset_gpio;
>  	struct input_dev *input;
> -	struct firmware_version firmware;
>  	int error;
>  
>  	dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
> @@ -389,15 +381,6 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>  	priv->chip = chip;
>  	i2c_set_clientdata(client, priv);
>  
> -	/* Get firmware version */
> -	error = chip->read_reg(client, REG_FIRMWARE_VERSION,
> -			       &firmware, sizeof(firmware));
> -	if (error) {
> -		dev_err(dev, "Failed to get firmware version, err: %d\n",
> -			error);
> -		return error;
> -	}
> -
>  	/* Setup input device */
>  	input->name = "ILI210x Touchscreen";
>  	input->id.bustype = BUS_I2C;
> @@ -439,10 +422,6 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>  		return error;
>  	}
>  
> -	dev_dbg(dev,
> -		"ILI210x initialized (IRQ: %d), firmware version %d.%d.%d",
> -		client->irq, firmware.id, firmware.major, firmware.minor);
> -
>  	return 0;
>  }
>  
> -- 
> 2.17.1
> 

-- 
Dmitry
