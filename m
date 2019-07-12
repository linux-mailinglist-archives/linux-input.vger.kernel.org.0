Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16BB96673A
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 08:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfGLGuN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Jul 2019 02:50:13 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42548 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbfGLGuM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jul 2019 02:50:12 -0400
Received: by mail-pg1-f194.google.com with SMTP id t132so4084981pgb.9
        for <linux-input@vger.kernel.org>; Thu, 11 Jul 2019 23:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CfCP6AM+q26Tk6D03k1iE3+elCvT4lB1HPpCLmqktB0=;
        b=uIglaz3JhPuRKxPH+jBqVn6oInErsfOz7ggSmmU9JE0y/0mbUj9Xo+hq1SWo9mplfU
         k/yTkbNxLpSTYYjGxxhwcq8PVC5CAJsqITVvzsR4uHKfe4XGxDMNlhd+zQLkkU01cNur
         vd9k9AQLM84lJLuoQF2D9SWc7ZjaJ5ryEC1rg7foUH8rpuW/sFJbd/V+CTo+AAHIABbX
         ukOj2Ls3scyFYPiuRGmYRbCAlszJ0iIDZfkhEizxvd2q405n73cYeS5vOVYk8DmT7HpF
         lt38mbuLCFz9f+FL213Dop9lhhCL5/l99rU9+v7KMqnvzWYz0bpTJJEuTRkCUwCyw+u/
         7mhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CfCP6AM+q26Tk6D03k1iE3+elCvT4lB1HPpCLmqktB0=;
        b=B/a4kzhnSp6aWZH9U+IXa5Vo+k2/WKlTl6q4/y8gMFdlV4cwlBQIH3+V3ARVJ6JUIu
         roZR6xa/wAaUJTUMWmF2qSequO2JYm0XzmxJJvr/r06M3yKZ5Fg9npf9P7z8eOfRGsZb
         0t1caLfG70HPAuDV6+tHRO5OOj9eVcy0zIkZrP9jst+z1DMp16svpaBRf/yrrpicSU9D
         tiU2O2qnyneICfyKW/G44xGJgO3Ae4CVaye9eKfwYWpx3ENwpY/rCHRQi9fKV76lR+Cp
         Q/4lVv1XDOavUpVEiIG4tzzw1rrPmuddbQ9C0q3qGjVosGdQRzukTWpd6HpVF0q3OMNU
         k7Jg==
X-Gm-Message-State: APjAAAVIBkaS3DdGOdiUqn2bp4GYRns43sRn0+bXVcG7w6MJggJ21w4g
        3XW9O105MLjury6yljnWS6CqjSNVeGU=
X-Google-Smtp-Source: APXvYqz/Ozc/pWGLJdSYhomnv0SNHeqaJCrHX5Twx6PhMiDoGboYFAkwhRjAtONTxzxoldIegoP/aA==
X-Received: by 2002:a17:90a:1b48:: with SMTP id q66mr9313016pjq.83.1562914211991;
        Thu, 11 Jul 2019 23:50:11 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 25sm7372302pfp.76.2019.07.11.23.50.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 23:50:11 -0700 (PDT)
Date:   Thu, 11 Jul 2019 23:50:09 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     hdegoede@redhat.com, maxime.ripard@bootlin.com, wens@csie.org,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] input: keyboard: sun4i-lradc-keys: Add of_node_put()
 before return
Message-ID: <20190712065009.GE150689@dtor-ws>
References: <20190709175707.14278-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709175707.14278-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 09, 2019 at 11:27:07PM +0530, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous
> node, but in the case of a return from the middle of the loop, there is
> no put, thus causing a memory leak. Hence add an of_node_put before the
> return in three places.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/sun4i-lradc-keys.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
> index 6ffdc26b9c89..4a796bed48ac 100644
> --- a/drivers/input/keyboard/sun4i-lradc-keys.c
> +++ b/drivers/input/keyboard/sun4i-lradc-keys.c
> @@ -198,18 +198,21 @@ static int sun4i_lradc_load_dt_keymap(struct device *dev,
>  		error = of_property_read_u32(pp, "channel", &channel);
>  		if (error || channel != 0) {
>  			dev_err(dev, "%pOFn: Inval channel prop\n", pp);
> +			of_node_put(pp);
>  			return -EINVAL;
>  		}
>  
>  		error = of_property_read_u32(pp, "voltage", &map->voltage);
>  		if (error) {
>  			dev_err(dev, "%pOFn: Inval voltage prop\n", pp);
> +			of_node_put(pp);
>  			return -EINVAL;
>  		}
>  
>  		error = of_property_read_u32(pp, "linux,code", &map->keycode);
>  		if (error) {
>  			dev_err(dev, "%pOFn: Inval linux,code prop\n", pp);
> +			of_node_put(pp);
>  			return -EINVAL;
>  		}
>  
> -- 
> 2.19.1
> 

-- 
Dmitry
