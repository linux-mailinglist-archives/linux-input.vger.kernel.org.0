Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2214FA87
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2019 08:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfFWGdr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jun 2019 02:33:47 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37228 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbfFWGdr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jun 2019 02:33:47 -0400
Received: by mail-pf1-f195.google.com with SMTP id 19so5693315pfa.4;
        Sat, 22 Jun 2019 23:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=duV2gGRpG7Sfz3Xz6bsBDAsSh4wHw21/yrIs8n58Lkg=;
        b=K4u7e5AJiq9qXTPStYbGkuPY434Njkt8INW9cHoUhSshqypr1h8ZGCUpAxvYjrGUd9
         8s+n+mcPWq4Mi5KCTpyPDG8pJHpjf52EnrCIbSVRA00slOZIJO1gtb3cAt01vmAyVixw
         45Hgond6xH42ao4Hl/onxo3sBnFJUk3zY/HUDzS/zYQqaxU9pfr0KwQcct0zBW1IEeCp
         SEh8RdBmw0rx1PUwzFy3HUvSpEvYOzqsddQEs4yUQA63ZpiPBLvyaRuxb1AcV1turSZ+
         nkznKWJO/WmAOGUIAMXd8141swchNG/HDfOd/utPvwbE/8Q7PPAmi3e44I1DfjTzO3vv
         NHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=duV2gGRpG7Sfz3Xz6bsBDAsSh4wHw21/yrIs8n58Lkg=;
        b=oiWUttk64LMvw0tyCElhPW5WZUEW/pa+sN9ICB3Yvs58zkNRAA/lihhiZRLIOWzk5m
         uTbs1AhfyrBFSFiRAC+4g87RDilwTlWjxT+T8rUYO0+qhvSPHADSOAdUtfePeAYTR2hU
         +Li4YcpzrsX5H5ZaljVIVZJBDtr4zjzYe61KRQz9EJa5WG3twA91raPiFF+g07lS+Fao
         A6p+1c+NxdYC7T8m6vrDLwdXgz0VkKUVxdAPrQhdMECg2Qd10A3wzFy1LjfIbVHbvxmQ
         lCOyO9Q0UjGgHONgaCHGqRkWk4cJCj0cHoeqb+DrLOqmsODw5Wim37+pFQj0xlL87L7N
         9u0A==
X-Gm-Message-State: APjAAAVX/RbMyNaezR3bxA4AxCJEiHjzLi7ChfKTJgPpDKmVeZ8Px5Uq
        tNcqb2nAqUYyBnILT3S+kqRmKxFx
X-Google-Smtp-Source: APXvYqyVAtfNqEFrIME97U4h1ZxPAXMyhjl9lrMUBjPWoY+u1arunnJU/JRPzgd1/ORvtPmWhnmZJg==
X-Received: by 2002:a17:90a:fa18:: with SMTP id cm24mr8872439pjb.120.1561271626493;
        Sat, 22 Jun 2019 23:33:46 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x3sm8316528pja.7.2019.06.22.23.33.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 22 Jun 2019 23:33:45 -0700 (PDT)
Date:   Sat, 22 Jun 2019 23:33:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: gpio_keys_polled - use struct_size() in
 devm_kzalloc()
Message-ID: <20190623063344.GC204275@dtor-ws>
References: <20190619142655.GA20218@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619142655.GA20218@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 19, 2019 at 09:26:55AM -0500, Gustavo A. R. Silva wrote:
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
> 
> struct gpio_keys_polled_dev {
> 	...
>         struct gpio_keys_button_data data[0];
> };
> 
> size = sizeof(struct gpio_keys_polled_dev) + count * sizeof(struct gpio_keys_button_data);
> instance = devm_kzalloc(dev, size, GFP_KERNEL);
> 
> Instead of leaving these open-coded and prone to type mistakes, we can
> now use the new struct_size() helper:
> 
> instance = devm_kzalloc(dev, struct_size(instance, data, count), GFP_KERNEL);
> 
> Notice that, in this case, variable size is not necessary, hence it
> is removed.
> 
> This code was detected with the help of Coccinelle.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/gpio_keys_polled.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
> index edc7262103b9..c4087be0c2e0 100644
> --- a/drivers/input/keyboard/gpio_keys_polled.c
> +++ b/drivers/input/keyboard/gpio_keys_polled.c
> @@ -235,7 +235,6 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>  	struct gpio_keys_polled_dev *bdev;
>  	struct input_polled_dev *poll_dev;
>  	struct input_dev *input;
> -	size_t size;
>  	int error;
>  	int i;
>  
> @@ -250,9 +249,8 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	size = sizeof(struct gpio_keys_polled_dev) +
> -			pdata->nbuttons * sizeof(struct gpio_keys_button_data);
> -	bdev = devm_kzalloc(dev, size, GFP_KERNEL);
> +	bdev = devm_kzalloc(dev, struct_size(bdev, data, pdata->nbuttons),
> +			    GFP_KERNEL);
>  	if (!bdev) {
>  		dev_err(dev, "no memory for private data\n");
>  		return -ENOMEM;
> -- 
> 2.21.0
> 

-- 
Dmitry
