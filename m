Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3420689773
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 08:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfHLG7a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 02:59:30 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37120 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfHLG7a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 02:59:30 -0400
Received: by mail-pg1-f195.google.com with SMTP id d1so16187976pgp.4;
        Sun, 11 Aug 2019 23:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yJj1h+nBNMcwjDu8yrCn282Ueh9048B3JnY/94Tygxk=;
        b=PneT44G67xrWM1A1Cr/AeXiE0Mjo8ZQfd+woV+CU0RjJTdYc8dzBa8bSZbvA9LoCuF
         c8ygqmX9WgY3BxpHSHi1/5zldIUnK4Z4243GJJIcbOJuZetCJ7ZUWriONSTRpebJ2InS
         Whk27/rFA89FGR6eSarWuvgd5CdG3YBW/+jPBnVDgwKgCnMXRtqhfYt8GkoAYo+ADwRV
         KRnPhUIgDXGj3a68xEmw5fC0C82lyB/S1y+Tp8Pcq4hG7W6/58q9G15XGqF/UtQo9Ww9
         kUaIhcuJ3k3S2iTuuZlKLEv7rIcB8PjKo8GHF/MtNfIRJTNn5a1k/dWtrMAWOIPJJT6T
         ZeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yJj1h+nBNMcwjDu8yrCn282Ueh9048B3JnY/94Tygxk=;
        b=DIZC0PedEOE5hsmc29nXeXuIOKY8dibYNDignz5p1Ecm5VR1I5LJ/Kxc7SRpzfT11Y
         LGPiJdlQ4zutPAZVQQuC75XjJl8Vn9Wr89s8BuqHm5Jtk/pqFdyJC79CqLanutuFbNKy
         roETYkZKSZluYixKst6uuTTTmv/inbz9iCTVWRdUbDF2y0M3p9vvHuturJmVtpPOhFmL
         ilryz2PIK/Yjtgc5NSh9SD/ekM1g1HkundBVoHKf3ZpzA+PAqAliEp3H4m61XpzF7yUt
         aI/6zGfGvFlGwn+v+Rcgsh9g2o3I9cz5sZKw3md9MERzAJ50oWKJ9zN44rXllHJrmkjA
         RaTA==
X-Gm-Message-State: APjAAAVM3G/Dti+DlEBSGCgMx5uEaaTjAEvwYzVi7p8qisskv7cnEiWj
        jbT81Y8cPZrV4upInzPwM4c=
X-Google-Smtp-Source: APXvYqy8w7ObdQ2U4xqIsN6WfiWhhtBgKI3LdORFVlN2CTwLXRDCzeeK/8TlT+HvH0x6HDm1MeDuVw==
X-Received: by 2002:a17:90a:9905:: with SMTP id b5mr22723900pjp.70.1565593169020;
        Sun, 11 Aug 2019 23:59:29 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id k64sm82599331pge.65.2019.08.11.23.59.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 23:59:28 -0700 (PDT)
Date:   Sun, 11 Aug 2019 23:59:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Richard Gong <richard.gong@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 04/10] input: axp20x-pek: convert platform driver to
 use dev_groups
Message-ID: <20190812065926.GV178933@dtor-ws>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
 <20190731124349.4474-5-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731124349.4474-5-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 31, 2019 at 02:43:43PM +0200, Greg Kroah-Hartman wrote:
> Platform drivers now have the option to have the platform core create
> and remove any needed sysfs attribute files.  So take advantage of that
> and do not register "by hand" a sysfs group of attributes.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied, thank you.

> ---
>  drivers/input/misc/axp20x-pek.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
> index debeeaeb8812..235925b28772 100644
> --- a/drivers/input/misc/axp20x-pek.c
> +++ b/drivers/input/misc/axp20x-pek.c
> @@ -195,15 +195,12 @@ DEVICE_ATTR(startup, 0644, axp20x_show_attr_startup, axp20x_store_attr_startup);
>  DEVICE_ATTR(shutdown, 0644, axp20x_show_attr_shutdown,
>  	    axp20x_store_attr_shutdown);
>  
> -static struct attribute *axp20x_attributes[] = {
> +static struct attribute *axp20x_attrs[] = {
>  	&dev_attr_startup.attr,
>  	&dev_attr_shutdown.attr,
>  	NULL,
>  };
> -
> -static const struct attribute_group axp20x_attribute_group = {
> -	.attrs = axp20x_attributes,
> -};
> +ATTRIBUTE_GROUPS(axp20x);
>  
>  static irqreturn_t axp20x_pek_irq(int irq, void *pwr)
>  {
> @@ -356,13 +353,6 @@ static int axp20x_pek_probe(struct platform_device *pdev)
>  
>  	axp20x_pek->info = (struct axp20x_info *)match->driver_data;
>  
> -	error = devm_device_add_group(&pdev->dev, &axp20x_attribute_group);
> -	if (error) {
> -		dev_err(&pdev->dev, "Failed to create sysfs attributes: %d\n",
> -			error);
> -		return error;
> -	}
> -
>  	platform_set_drvdata(pdev, axp20x_pek);
>  
>  	return 0;
> @@ -411,6 +401,7 @@ static struct platform_driver axp20x_pek_driver = {
>  	.driver		= {
>  		.name		= "axp20x-pek",
>  		.pm		= &axp20x_pek_pm_ops,
> +		.dev_groups	= axp20x_groups,
>  	},
>  };
>  module_platform_driver(axp20x_pek_driver);
> -- 
> 2.22.0
> 

-- 
Dmitry
