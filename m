Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7485F9E92
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 00:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfKLXwn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 18:52:43 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33688 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfKLXwn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 18:52:43 -0500
Received: by mail-pl1-f193.google.com with SMTP id ay6so232140plb.0;
        Tue, 12 Nov 2019 15:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tw91lst0dNde7dimiqIf8EtBl/EXAQ1HLGmuLyxMvds=;
        b=TwQfrM41lZiZHLZb/qu7NsuUBShPPqwMoTbrjeRet1KfqGkoxSJ7nrrp2y5GTT5qi1
         NPUJ7+KFPGhFJoviLKCtyVsE5Q4+A1rvqmHXO9foeBHnHkCRqOm+CzSwh2lVMPLlmyuz
         yUvbDgNljUXlGAtYOLYosFdOTJsUlKPQKYCv8uoc7q7UWV/+AynJpbx13ZZ/cHtNlhip
         scXCSUm6YZsGsaX2uJDZfNXmP/OmNki5/rQq8wAMCO8KxVMbbiM9oWCOgTloyMh8U+1p
         hbRwiJ3CygN3XauzLUEdl5qh2niHtJLM67ABFRrERNmn1lQXekSPhagF6DUbbS9wu6XH
         uQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tw91lst0dNde7dimiqIf8EtBl/EXAQ1HLGmuLyxMvds=;
        b=rMWVLo7sXInoaEc8F0L/ST3QZHWVFmFlv32lR34RKADYmLfVMWQXEuNstJiE6u9zUe
         Chf5hVvp3FdOSco4eSb0ktpWRWNk4wNDKFuQQwtv2oP2A8p70yjdaBIDBFeVB6GKADwQ
         8a6RKB57vVOUKDZg2o6EE/RRLC8a2N0ndANJoEme37EkO56d4wpt4w2az8HVmM7HVwWe
         KhcxuWL9tZWiLUMg1jF2LMZLoeZRUUgXKjtx+ejAicZ0/IakhbEyPFxBblQm/4o30hwY
         cKshhXMUxnEaawnMTt+83Lw/bIaVoaBh8jdSz/58lQ0uj879z62nIn0d3E6dtw0MsWga
         41sg==
X-Gm-Message-State: APjAAAVVs0I46rDUywH4HkfUfBo4UUx2d5DTy2e4cRc8e68RuP4rDz3u
        cjEQj7+SdeE3tScbuYvGDSY=
X-Google-Smtp-Source: APXvYqzTyHk7x9efOOdmCLESQZEO9lqisWDr1jViWTdzFHuFT5qZpaYOLEwdN+vqqmSTc/Km2iAsmg==
X-Received: by 2002:a17:902:1:: with SMTP id 1mr490950pla.338.1573602761713;
        Tue, 12 Nov 2019 15:52:41 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v3sm98110pfi.26.2019.11.12.15.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 15:52:40 -0800 (PST)
Date:   Tue, 12 Nov 2019 15:52:38 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: ili210x - add resolution to chip
 operations structure
Message-ID: <20191112235238.GE13374@dtor-ws>
References: <20191112210148.3535-1-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112210148.3535-1-TheSven73@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 12, 2019 at 04:01:47PM -0500, Sven Van Asbroeck wrote:
> Optionally allow the touch screen resolution to be set by adding
> it to the chip operations structure. If it is omitted (left zero),
> the resolution defaults to 64K. Which is the previously hard-coded
> value.
> 
> Set the ili2117 resolution to 2048, as indicated in its datasheet.
> 
> Link: https://lore.kernel.org/lkml/20191111181657.GA57214@dtor-ws/
> Cc: Marek Vasut <marex@denx.de>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: <linux-kernel@vger.kernel.org>
> Cc: linux-input@vger.kernel.org
> Tree: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=next
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---
>  drivers/input/touchscreen/ili210x.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index a6feae5ce887..3b8e24815a1f 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -31,6 +31,7 @@ struct ili2xxx_chip {
>  				 unsigned int *x, unsigned int *y);
>  	bool (*continue_polling)(const u8 *data, bool touch);
>  	unsigned int max_touches;
> +	unsigned int resolution;
>  };
>  
>  struct ili210x {
> @@ -160,6 +161,7 @@ static const struct ili2xxx_chip ili211x_chip = {
>  	.parse_touch_data	= ili211x_touchdata_to_coords,
>  	.continue_polling	= ili211x_decline_polling,
>  	.max_touches		= 10,
> +	.resolution		= 2048,
>  };
>  
>  static int ili251x_read_reg(struct i2c_client *client,
> @@ -336,6 +338,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>  	struct gpio_desc *reset_gpio;
>  	struct input_dev *input;
>  	int error;
> +	unsigned int max_xy;
>  
>  	dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
>  
> @@ -386,8 +389,9 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>  	input->id.bustype = BUS_I2C;
>  
>  	/* Multi touch */
> -	input_set_abs_params(input, ABS_MT_POSITION_X, 0, 0xffff, 0, 0);
> -	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 0xffff, 0, 0);
> +	max_xy = (chip->resolution ?: SZ_64K) - 1;

I had to add linux/sizes.h for this.

Applied, thank you.

-- 
Dmitry
