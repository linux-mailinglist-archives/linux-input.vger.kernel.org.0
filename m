Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D67CAF9E96
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 00:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfKLXwv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 18:52:51 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42053 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfKLXwv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 18:52:51 -0500
Received: by mail-pg1-f195.google.com with SMTP id q17so57027pgt.9;
        Tue, 12 Nov 2019 15:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xM5V1ZxV1Eh1wQKdKVK02pXc3Jh+t/8Dlot7MCR+8So=;
        b=Ee03qbKFdXM5zKPZN+UH8jtWOE99Sb6yIkJB7vn7F85FP+XtbqmRAfQKDTBtagZ+uX
         J0XpfXpEphoBMwReua/yPdMEhR34gHkcoXNLSTAC9i9oPgdEEavmh6ccKEyqb6FljY1U
         2ETBopNQYX1m+4aZ0n1OoJN50HuX1vhpMq3ImpxNvXaeOG590u5N3DhgklDH/JzGwxYg
         FCnxO6asH54mZZHbcUsCl7CLcyIWD6LqBNHnb5qvByp5nBivFtkisNsWqJMq8r+8u+yy
         Xnxp/yV5tPp8c4koyPHeCsOZJ/NN0bv0WmrOJxpIwa10GEWLVyrCOlTZN3ZQux2YRZQJ
         F5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xM5V1ZxV1Eh1wQKdKVK02pXc3Jh+t/8Dlot7MCR+8So=;
        b=sbGBwEwuUnodwFvtZB7eE0zN9yIqntnCKuB/ai8XZ4qa00cnkKeDpKwvFnyt298M8P
         GcTSZYw+bRpyDnFsVlurDt1s6Rq1Rd1xTJeftLcfh5KBaQUlG2DRjxCqNld4FcL9EHI3
         E3ilg1H33OnWu50VvmjrbXmmB/3Kdkpc69Ok5+duy3K4QTp7rnBXUSCVKqKEwhTKZ2ey
         ibr3A8C9B5Zare+FqHhvMHVUl4WX9v0S/BS4TbYc4JApHK/YrwwVzCKw17Q1FCASaQhT
         zZ9+O7fCClrmJ8aTpAdggSXWh2ESByF2dM1MuQok/Rxdrjj1V55f1HA0t4HNwW/ca/hQ
         k54g==
X-Gm-Message-State: APjAAAVVrNLO9Ygm+It0bcLmUvOdfb267mUo1jPNA00Hgjlwu/w7WJXE
        R5dvtwYHGhDDu/iXeVKzqvk=
X-Google-Smtp-Source: APXvYqyTJOVntNDCrbnKBm0FhidX97uYxLYnXx21PvR8lnshHSGM/NfTDmVbq8h7WLe9+RvzkfyYxw==
X-Received: by 2002:a63:1812:: with SMTP id y18mr192623pgl.302.1573602770221;
        Tue, 12 Nov 2019 15:52:50 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 21sm76056pfa.170.2019.11.12.15.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 15:52:49 -0800 (PST)
Date:   Tue, 12 Nov 2019 15:52:47 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Input: ili210x - optionally show calibrate sysfs
 attribute
Message-ID: <20191112235247.GF13374@dtor-ws>
References: <20191112210148.3535-1-TheSven73@gmail.com>
 <20191112210148.3535-2-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112210148.3535-2-TheSven73@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 12, 2019 at 04:01:48PM -0500, Sven Van Asbroeck wrote:
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

Applied, thank you.

> ---
>  drivers/input/touchscreen/ili210x.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 3b8e24815a1f..b0454cdacf38 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -32,6 +32,7 @@ struct ili2xxx_chip {
>  	bool (*continue_polling)(const u8 *data, bool touch);
>  	unsigned int max_touches;
>  	unsigned int resolution;
> +	bool has_calibrate_reg;
>  };
>  
>  struct ili210x {
> @@ -102,6 +103,7 @@ static const struct ili2xxx_chip ili210x_chip = {
>  	.parse_touch_data	= ili210x_touchdata_to_coords,
>  	.continue_polling	= ili210x_check_continue_polling,
>  	.max_touches		= 2,
> +	.has_calibrate_reg	= true,
>  };
>  
>  static int ili211x_read_touch_data(struct i2c_client *client, u8 *data)
> @@ -227,6 +229,7 @@ static const struct ili2xxx_chip ili251x_chip = {
>  	.parse_touch_data	= ili251x_touchdata_to_coords,
>  	.continue_polling	= ili251x_check_continue_polling,
>  	.max_touches		= 10,
> +	.has_calibrate_reg	= true,
>  };
>  
>  static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
> @@ -310,8 +313,19 @@ static struct attribute *ili210x_attributes[] = {
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
> +	return priv->chip->has_calibrate_reg;
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
