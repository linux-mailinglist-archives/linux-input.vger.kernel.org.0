Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF0443AAE6
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2019 19:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729090AbfFIR1z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Jun 2019 13:27:55 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33111 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729086AbfFIR1z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Jun 2019 13:27:55 -0400
Received: by mail-pg1-f193.google.com with SMTP id k187so3268502pga.0
        for <linux-input@vger.kernel.org>; Sun, 09 Jun 2019 10:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7cyQI/JEy1KeBy14m8Z7+rDdiSNFMHoYVTeDABqD5XQ=;
        b=WRtnSoP2EjewceYCMVcyW5LzrrEGVxN29phX6h2skWjtJSh5Daoq8XpONo2kbER986
         IvjWjCv3fk05E+F18LE27nn/XDFioM2K/LPjXFDxZAMXhmtism92HsF7nGWxZm/CBuFt
         wbMBbufjIy0BKLansuEEWhHUjdxg0DAi0ngqS7aGQNBXGGhb/L0oQMEo9wwmb8T5+PPl
         M3PPgmXakI2Yy8Qk0v3n0o81crxaVrRsi2CTHv0RzGfRbpVTwlaNv0+jch3LF1xSLBGG
         NJ69wO+pmW7w7PicWeOEPMOSJGRTxm7uSXgB5SAJOgN2gGKLG2BroY+A9jdOe2oWEkBH
         uW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7cyQI/JEy1KeBy14m8Z7+rDdiSNFMHoYVTeDABqD5XQ=;
        b=pOfZH+VSgWHdHged44VO2PGBC0baFvOlNafbpBZVaMdv9xsiucQQh01U4Bo3ZYLrDi
         1ujJZRMmzRvaYZQqmmu6Ra2cN5hEJkxx+tjcuemrG6y9RiJzqHOO9J4GqjgX3pRafT/p
         TbAPSrcMwfNPmtdTRRmf2OkugKUXVpR3F+YFTn0jzIPuHsakiWt4nDyg22ge9Shc31JN
         1HCEzHDIJdVSc3DrAUFOyHeVDXmAt5kB5zdY80SlG4NYnv3N9FidCFFrt2JMeLriCqcJ
         OGosnSZ4wSOVzUk5ozOW8e00BRLMa8h9BBk0QUjvpI1EVS5/0cMPLpkfHoN5SkDcjoAU
         0TNA==
X-Gm-Message-State: APjAAAWdpj6ZiajUwMT3yFxtgot0LhkPX3JwLIhrz3Pi4Wqki/DuCRVM
        I7BVZ4mDIlUZpIcpv3oGUXK1kTdb
X-Google-Smtp-Source: APXvYqyicD2bVAmYzlrSWTLjOBUFrmcAyvm1vH4hiJCY7cAd0nK7NUrPzZucUUWRXp1kWnExLycLew==
X-Received: by 2002:a65:430a:: with SMTP id j10mr12119228pgq.133.1560101274710;
        Sun, 09 Jun 2019 10:27:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b17sm9017061pfb.18.2019.06.09.10.27.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 09 Jun 2019 10:27:53 -0700 (PDT)
Date:   Sun, 9 Jun 2019 10:27:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org, rydberg@bitmath.org
Subject: Re: [PATCH v2] Input: iqs5xx - get axis info before calling
 input_mt_init_slots()
Message-ID: <20190609172752.GC90002@dtor-ws>
References: <1559875085-21880-1-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559875085-21880-1-git-send-email-jeff@labundy.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 06, 2019 at 09:38:05PM -0500, Jeff LaBundy wrote:
> Calling input_mt_init_slots() copies ABS_MT_POSITION_X to ABS_X and
> so on, but doing so before calling touchscreen_parse_properties()
> leaves ABS_X min = max = 0 which may prompt an X server to ignore
> the device.
> 
> To solve this problem, wait to call input_mt_init_slots() until all
> absolute axis information has been resolved (whether that's through
> device tree via touchscreen_parse_properties() or from reading from
> the device directly).
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

> ---
> Changes in v2:
>   - Moved the call to input_mt_init_slots to the very end of iqs5xx_axis_init
>     to keep operations on max_x and max_y close to each other for readability
> 
>  drivers/input/touchscreen/iqs5xx.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
> index 1587078..5875bb1 100644
> --- a/drivers/input/touchscreen/iqs5xx.c
> +++ b/drivers/input/touchscreen/iqs5xx.c
> @@ -502,14 +502,6 @@ static int iqs5xx_axis_init(struct i2c_client *client)
>  		input_set_capability(input, EV_ABS, ABS_MT_POSITION_Y);
>  		input_set_capability(input, EV_ABS, ABS_MT_PRESSURE);
> 
> -		error = input_mt_init_slots(input,
> -				IQS5XX_NUM_CONTACTS, INPUT_MT_DIRECT);
> -		if (error) {
> -			dev_err(&client->dev,
> -				"Failed to initialize slots: %d\n", error);
> -			return error;
> -		}
> -
>  		input_set_drvdata(input, iqs5xx);
>  		iqs5xx->input = input;
>  	}
> @@ -591,9 +583,19 @@ static int iqs5xx_axis_init(struct i2c_client *client)
>  	if (error)
>  		return error;
> 
> -	return iqs5xx_write_word(client,
> -				 prop.swap_x_y ? IQS5XX_X_RES : IQS5XX_Y_RES,
> -				 max_y);
> +	error = iqs5xx_write_word(client,
> +				  prop.swap_x_y ? IQS5XX_X_RES : IQS5XX_Y_RES,
> +				  max_y);
> +	if (error)
> +		return error;
> +
> +	error = input_mt_init_slots(iqs5xx->input, IQS5XX_NUM_CONTACTS,
> +				    INPUT_MT_DIRECT);
> +	if (error)
> +		dev_err(&client->dev, "Failed to initialize slots: %d\n",
> +			error);
> +
> +	return error;
>  }
> 
>  static int iqs5xx_dev_init(struct i2c_client *client)
> --
> 2.7.4
> 

-- 
Dmitry
