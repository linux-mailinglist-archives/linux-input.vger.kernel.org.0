Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 418B8F9F2E
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 01:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbfKMATp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 19:19:45 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42042 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbfKMATp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 19:19:45 -0500
Received: by mail-pf1-f194.google.com with SMTP id s5so280048pfh.9;
        Tue, 12 Nov 2019 16:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MnoH0yzMdM3B1Boge9Dk2A1EX9wggxBgjkrKyhhxeno=;
        b=cztA81SitzLi/rQDtBTLOFkfdLfK8xaqZOwyChVi4XJDHEAz5KzE1pvrklxs9g+Wlz
         kPSxCVGoB/LDh9hmCtcFlbhGqaxqYjotuCM/O06pmR3p9mJX9wADB2ucVFII/6f5U1og
         8FCImQeiewEBvzFEYOpHDQhgIiLozk5x2McEnt9HlPmjUajQSS1BlvBL3fiAxKDdbGq9
         HFzh/GChx5CUPIi8xM8XuYCK+mk4CUuHozFiiTHchaftRH8j/D/s9rKMrI7B2BbH8XzV
         huZr+cRNE1qvNFn8rpdgATj7jWrR5J+3cFy+7G32YlGdeRGtoXaKKQ0yvgOsZd9RqmB6
         IRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MnoH0yzMdM3B1Boge9Dk2A1EX9wggxBgjkrKyhhxeno=;
        b=oNn1uqv8MQNmmNteSZR3+/FHujETORzIODW8aWcvXbh/yRnUYbIASHpAQF6oyVuI57
         4n6kohnNmdJikfY7A2RQUcDazPJhjiw2Px3sO1JuBsDDvvtPsTJbt7JAIp9VhuDu7YVu
         S9FybubNhcZhvmppIJyAfwOYckzFFfUruabhuzzuZ7vdQ2L/tI3EtPjt1of17QgB4iSx
         Vyx991M6aW51eyurE0sRJMRIhZVGdspWjgxrfCANOwK0svz0pFFwU3lWvVuiIRIvZEPh
         YFTYDPbYfaPWCTWhUhWFUVJG5/YseZMDDoOawFKsfN554+53MN7tA2jOiaDPY8M8rn5f
         VRAQ==
X-Gm-Message-State: APjAAAV6SFh9f+SB93Gzuvcy/CxQmkmZmrzY6s8CqebFaItcps8xz+8S
        MeuGmo+8XUBKhPGdG23EfGg=
X-Google-Smtp-Source: APXvYqy6t8KCmMH0fD0OTmWjniphP8XjXlExN0zKOSjQcOYkvvJC+GvDc2H0oc2siqpPzKaKB3dsSA==
X-Received: by 2002:a63:5c4a:: with SMTP id n10mr365471pgm.120.1573604383707;
        Tue, 12 Nov 2019 16:19:43 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b17sm137335pfr.17.2019.11.12.16.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 16:19:43 -0800 (PST)
Date:   Tue, 12 Nov 2019 16:19:41 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Ahmet Inan <inan@distec.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv1 1/2] Input: EXC3000: add EXC80Hxx support
Message-ID: <20191113001941.GI13374@dtor-ws>
References: <20191107181010.17211-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191107181010.17211-1-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 07, 2019 at 07:10:09PM +0100, Sebastian Reichel wrote:
> This adds support for EXC80Hxx controllers, which uses
> a different event type id and has two extra bits for the
> resolution (so the maximum is 16384 instead of 4096).
> 
> The patch has been tested with EXC80H60 and EXC80H84.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/input/touchscreen/exc3000.txt    |  6 ++--
>  drivers/input/touchscreen/exc3000.c           | 34 ++++++++++++++-----
>  2 files changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt b/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
> index 68291b94fec2..057b680f0420 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
> @@ -1,7 +1,9 @@
> -* EETI EXC3000 Multiple Touch Controller
> +* EETI EXC3000 and EXC80Hxx Multiple Touch Controller
>  
>  Required properties:
> -- compatible: must be "eeti,exc3000"
> +- compatible: must be one of
> + * "eeti,exc3000"
> + * "eeti,exc80hxx"

Rob is saying "no wildcard compatibles"... If both chips are the same
from software POV we should use "eeti,exc80h60".

>  - reg: i2c slave address
>  - interrupts: touch controller interrupt
>  - touchscreen-size-x: See touchscreen.txt
> diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> index e007e2e8f626..7d695022082c 100644
> --- a/drivers/input/touchscreen/exc3000.c
> +++ b/drivers/input/touchscreen/exc3000.c
> @@ -23,11 +23,20 @@
>  #define EXC3000_SLOTS_PER_FRAME		5
>  #define EXC3000_LEN_FRAME		66
>  #define EXC3000_LEN_POINT		10
> -#define EXC3000_MT_EVENT		6
> +
> +#define EXC3000_MT1_EVENT		0x06
> +#define EXC3000_MT2_EVENT		0x18
> +
>  #define EXC3000_TIMEOUT_MS		100
>  
> +enum exc3000_device_type {
> +	EETI_EXC3000,
> +	EETI_EXC80Hxx
> +};
> +
>  struct exc3000_data {
>  	struct i2c_client *client;
> +	enum exc3000_device_type type;
>  	struct input_dev *input;
>  	struct touchscreen_properties prop;
>  	struct timer_list timer;
> @@ -76,8 +85,10 @@ static int exc3000_read_frame(struct i2c_client *client, u8 *buf)
>  	if (ret != EXC3000_LEN_FRAME)
>  		return -EIO;
>  
> -	if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME ||
> -			buf[2] != EXC3000_MT_EVENT)
> +	if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME)
> +		return -EINVAL;
> +
> +	if (buf[2] != EXC3000_MT1_EVENT && buf[2] != EXC3000_MT2_EVENT)
>  		return -EINVAL;
>  
>  	return 0;
> @@ -157,6 +168,7 @@ static int exc3000_probe(struct i2c_client *client,
>  		return -ENOMEM;
>  
>  	data->client = client;
> +	data->type = id->driver_data;
>  	timer_setup(&data->timer, exc3000_timer, 0);
>  
>  	input = devm_input_allocate_device(&client->dev);
> @@ -168,8 +180,13 @@ static int exc3000_probe(struct i2c_client *client,
>  	input->name = "EETI EXC3000 Touch Screen";
>  	input->id.bustype = BUS_I2C;
>  
> -	input_set_abs_params(input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
> -	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
> +	if (data->type == EETI_EXC80Hxx) {

I'd say

	max_xy = (data->type == EETI_EXC80Hxx ? SZ_16K : SZ_4K) - 1;

> +		input_set_abs_params(input, ABS_MT_POSITION_X, 0, 16383, 0, 0);
> +		input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 16383, 0, 0);
> +	} else {
> +		input_set_abs_params(input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
> +		input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
> +	}
>  	touchscreen_parse_properties(input, true, &data->prop);
>  
>  	error = input_mt_init_slots(input, EXC3000_NUM_SLOTS,
> @@ -191,14 +208,15 @@ static int exc3000_probe(struct i2c_client *client,
>  }
>  
>  static const struct i2c_device_id exc3000_id[] = {
> -	{ "exc3000", 0 },
> -	{ }
> +	{ "exc3000", EETI_EXC3000 },
> +	{ "exc80hxx", EETI_EXC80Hxx }
>  };
>  MODULE_DEVICE_TABLE(i2c, exc3000_id);
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id exc3000_of_match[] = {
> -	{ .compatible = "eeti,exc3000" },
> +	{ .compatible = "eeti,exc3000", .data = (const void*) EETI_EXC3000 },
> +	{ .compatible = "eeti,exc80hxx", .data = (const void*) EETI_EXC80Hxx },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, exc3000_of_match);
> -- 
> 2.24.0.rc1
> 

Thanks.

-- 
Dmitry
