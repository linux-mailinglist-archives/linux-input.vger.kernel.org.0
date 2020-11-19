Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF2A2B8C05
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 08:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgKSHJj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 02:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgKSHJj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 02:09:39 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866D0C0613CF;
        Wed, 18 Nov 2020 23:09:39 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id t8so3564003pfg.8;
        Wed, 18 Nov 2020 23:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GtcxaV35zaQRZNQwGx10xNryN/Ejb+d7UdwUR5iPs18=;
        b=K6SO9RsFPuZC+Tj+izd9dpW/f/vlQkhBuvouEkRBh+QE2DeXCPClLURlm3i0ZKeXex
         jDSNEdiUZlHTWp2YkU9yTRbdQg/jpyFV9w82fu+xmpVV6OxGG/7iLCsXMfI8+/9KffEs
         C5PdcjK2D9rbQ/h2uM6+ThMepQeSRw1uzdRPIcoj843TsACdquJe1XJxO9O7DQ+RGOxR
         HILi1ExOU9plux9vFBmsOl8jMSk53Sl7HrV+bUaHrfx15Q50xqXEI0ShJOflreaI/4I5
         iDkfzaJ7iBxDBkfu62fG4sxBUeHKFQHN9tNRpxkZENstoCWYSCcDNZC2mKWe2WEB79xg
         /Qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GtcxaV35zaQRZNQwGx10xNryN/Ejb+d7UdwUR5iPs18=;
        b=JR1xyBUljqIKU5j48vavBQi+gFa9ncJf3e3bviALz+n63O7lHghqqy52OzWft6h+g6
         cyr6zeG513i9rPx9Y7ZxlEo/j+C72TNJ6C5xVkZku0TVGT0xV4lT8ktlYzdURyv96WO+
         k1MeknqHk1OT9H4NMEQ8z/sR1mLNuSYR4kNqGM9M+gMXiuJmilbab8QiKkNKy2O0zt/L
         vWcA3/DyGWf7nO1J0mnANKZEpzUQpljLCKvZmsRJ6CjejVrfdz9tpdw6zCXblS8U44rb
         4n9XW5RPZ/naai3VynGupyXutMIjPMgtevihBmcn1zM06tpj+VXxicI5qMnbi0sDssGL
         ujCA==
X-Gm-Message-State: AOAM533B7W/PJiKKD1RltMFqAqTUd1NN0N6vtu8F94JmEFzLDbjNVEBk
        fEVe5ND/d3pC7c7iirSz4lXbyfWrGwc=
X-Google-Smtp-Source: ABdhPJyvqmVycfgWtJwqOKCjaApSD0hNAIYa79+6eYppN3ENgUbSvFhYx6jqBWkA5tGOOHvBMzgGzg==
X-Received: by 2002:a17:90b:3583:: with SMTP id mm3mr3107556pjb.118.1605769779030;
        Wed, 18 Nov 2020 23:09:39 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id t10sm10361630pfq.110.2020.11.18.23.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:09:38 -0800 (PST)
Date:   Wed, 18 Nov 2020 23:09:35 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] Input: adp5589: use device-managed function in
 adp5589_keypad_add()
Message-ID: <20201119070935.GD2034289@dtor-ws>
References: <20201112074308.71351-1-alexandru.ardelean@analog.com>
 <20201112074308.71351-3-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112074308.71351-3-alexandru.ardelean@analog.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alexandru,

On Thu, Nov 12, 2020 at 09:43:05AM +0200, Alexandru Ardelean wrote:
> This change makes use of the devm_input_allocate_device() function, which
> gets rid of the input_free_device() and input_unregister_device() calls.
> 
> When a device is allocated via input_allocate_device(), the
> input_register_device() call will also be device-managed, so there is no
> longer need to manually call unregister.
> 
> Also, the irq is allocated with the devm_request_threaded_irq(), so with
> these two changes, the adp5589_keypad_remove() function is no longer
> needed.
> 
> This cleans up the error & exit paths.
> It also looks like the input_free_device() should have been called on the
> remove() hook, but doesn't look like it is.

Actually it should not be called once input_unregister_device() is
called. If you check, you will see that in probe() we set the pointer to
input device to NULL after calling unregister, which makes subsequent
call to input_free_device() a noop. We did that so that we have single
error handling flow.

I dropped this paragraph.

> 
> This change may also also fix some potential leaks that were probably
> omitted earlier.

This one too.

> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
> ---
>  drivers/input/keyboard/adp5589-keys.c | 47 +++++++--------------------
>  1 file changed, 11 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
> index 922497b65ab0..e96ffd5ed69e 100644
> --- a/drivers/input/keyboard/adp5589-keys.c
> +++ b/drivers/input/keyboard/adp5589-keys.c
> @@ -909,7 +909,7 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
>  		return -EINVAL;
>  	}
>  
> -	input = input_allocate_device();
> +	input = devm_input_allocate_device(&client->dev);
>  	if (!input)
>  		return -ENOMEM;
>  
> @@ -953,38 +953,19 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
>  		__set_bit(kpad->gpimap[i].sw_evt, input->swbit);
>  
>  	error = input_register_device(input);
> -	if (error) {
> -		dev_err(&client->dev, "unable to register input device\n");

If you want to drop error messages, please send a separate patch with
justification.

I restored error messgaes, and applied.

Thank you.

-- 
Dmitry
