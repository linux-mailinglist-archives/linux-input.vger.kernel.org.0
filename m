Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCF98F99E1
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2019 20:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbfKLTiP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 14:38:15 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45501 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbfKLTiP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 14:38:15 -0500
Received: by mail-pg1-f193.google.com with SMTP id w11so12488068pga.12;
        Tue, 12 Nov 2019 11:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0La2CwEbsU0iGpHRN+E6CgdPEQt/LTHDnbCunj4lTb8=;
        b=VL+s3q4JE6h3dgJv7/N9uNIKe2mR2SJGxXYbo+a1AB3kkBkuDmf9fbBhr3tDyAVwnT
         OYORuGVOakJjTDiwQxel/n3/wsKYXljpRVC+j3B12ryXEwiu5/JrFQ+jqcxiVEo0olBG
         MI25O+WLxcwdoLjicMSqAFH4wtKmDsxUiU+hD7lSOLcb7IZzbryzbaMOyRm5hP8lk1gd
         zyk+zQNSHx/J4GOZZ5ZGeiYsX4WpFxg+Cc50JZu/LUT8sbXnwX72++euhDkVcTc8+hKK
         AiW2Lv0hXclDEtlSUVI9NW8d8svDe2rAvVkYCWtTGKhR3Kr6zL2PdqTR8pNeya4T2ITg
         zP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0La2CwEbsU0iGpHRN+E6CgdPEQt/LTHDnbCunj4lTb8=;
        b=np0P+iVsivdgJc5gtgMtsb9lyI6YkJxtztz/rakdRl8MeKa+p6RxZFTvQheoUWh7Mu
         WZ8lQFtK1/jwxlNO/A6HMuFUCRlmkVGEWWt5TslbPYht8YkrWqckCCfLthUoWUwE7jTt
         vyX4TOzEJIc0iTI9vCaRClTaHfdLUdTuL6j+rI4Daa3IeLXszSJHn0x+5ds5Ec8pY0Ek
         NTj9CHNPXjvl61ntz8qxj+MaryFteOdhQ1krHaw2u87lYqdN9uPlJeOgVU0T9OJX1MG8
         CBOpaE2bODOvvgaloIlzSjPt4FiHQNy8m9R3r6sYKxQhmFpw/DCVfU7QTgZgZXRZviP8
         AQDA==
X-Gm-Message-State: APjAAAV2mJZWfeqnaghrRT9nWcra2W8tPyEm1XmRaE0S8XTdcRrsiLvK
        Ww8UvUkdayN1LGgojcX6RE8=
X-Google-Smtp-Source: APXvYqxxR8hyTH24EqC9K4ZhJ2LqaamzTWY4SFMUk/Bz4VfqPPdNGTeLpZuYAcnL2e2qm2YDnWO7AQ==
X-Received: by 2002:a17:90a:280e:: with SMTP id e14mr8720772pjd.135.1573587494177;
        Tue, 12 Nov 2019 11:38:14 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 81sm23692014pfx.142.2019.11.12.11.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 11:38:13 -0800 (PST)
Date:   Tue, 12 Nov 2019 11:38:11 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v1 3/3] Input: ili210x - optionally hide calibrate sysfs
 attribute
Message-ID: <20191112193811.GC13374@dtor-ws>
References: <20191112164429.11225-1-TheSven73@gmail.com>
 <20191112164429.11225-3-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112164429.11225-3-TheSven73@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 12, 2019 at 11:44:29AM -0500, Sven Van Asbroeck wrote:
> Only show the 'calibrate' sysfs attribute on chip flavours
> which support calibration by writing to a calibration register.
> 
> Do this by adding a flag to the chip operations structure.
> 
> Link: https://lore.kernel.org/lkml/20191111181657.GA57214@dtor-ws/
> Cc: Marek Vasut <marex@denx.de>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: <linux-kernel@vger.kernel.org>
> Cc: linux-input@vger.kernel.org
> Tree: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=next
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---
>  drivers/input/touchscreen/ili210x.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 4321f0d676cc..810770ad02e2 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -32,6 +32,7 @@ struct ili2xxx_chip {
>  	bool (*continue_polling)(const u8 *data, bool touch);
>  	unsigned int max_touches;
>  	unsigned int resolution;
> +	bool no_calibrate_reg;

Please use positive logic and have chips opt-in into the calibration.

>  };
>  
>  struct ili210x {
> @@ -162,6 +163,7 @@ static const struct ili2xxx_chip ili211x_chip = {
>  	.continue_polling	= ili211x_decline_polling,
>  	.max_touches		= 10,
>  	.resolution		= 2048,
> +	.no_calibrate_reg	= true,
>  };
>  
>  static int ili251x_read_reg(struct i2c_client *client,
> @@ -310,8 +312,19 @@ static struct attribute *ili210x_attributes[] = {
>  	NULL,
>  };
>  
> +static umode_t ili210x_calibrate_visible(struct kobject *kobj,
> +					  struct attribute *attr, int index)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ili210x *priv = i2c_get_clientdata(client);
> +
> +	return !priv->chip->no_calibrate_reg;
> +}
> +
>  static const struct attribute_group ili210x_attr_group = {
>  	.attrs = ili210x_attributes,
> +	.is_visible = ili210x_calibrate_visible,
>  };
>  
>  static void ili210x_power_down(void *data)
> -- 
> 2.17.1
> 

-- 
Dmitry
