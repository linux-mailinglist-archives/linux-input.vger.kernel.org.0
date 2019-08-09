Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13CB687CC5
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 16:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406562AbfHIOaq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 10:30:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35264 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406558AbfHIOaq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 10:30:46 -0400
Received: by mail-pf1-f195.google.com with SMTP id u14so46179021pfn.2
        for <linux-input@vger.kernel.org>; Fri, 09 Aug 2019 07:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tCI4IXuuv57Kq7B5JB4RvH0uEz3ZcpCZ68ZXObQOWI8=;
        b=ANTdLopocB8YNiPqOOTCzcK5EixMpgUmKq0xTLvn3uraAt5RlLY5dcGJZ9vv4y500l
         19PukLjTQfAopAUljePq1aU/R7ts8yEr/StV3M4PIqvVXb97kC+BDW5lerih69CQSaIa
         05v8aSfrmxI3qaNUQap786xp7Dqv+/cmvTkSEW0SbeaapkBuCIJdhvzwBJejTviXd2SI
         ETKeohVOJTeTszJjb6BGb35qc2eR8BQAN10BwfsPySxt6zHE1FqG4ikTt4YeEjQjJN7W
         abcZhxce3o7xWBNf+JKlJjDAQNzrvsan5UCFHbU4jMpaetUZurOqyBTaFLCxu0X344BI
         QMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tCI4IXuuv57Kq7B5JB4RvH0uEz3ZcpCZ68ZXObQOWI8=;
        b=PKcHYA1yA1QSOuvhrk1xENioPwtyXmDViQ+OzKi3rIN0WlSknj2JXgyKsK3mTirVc5
         jLWTfAMhVRJqX+iIpPCtilYAZvnFMU1l4/VHxls9OsDEtiLw2nE1uYsMaJzgwC+QdsHX
         Djmsm8JxhLNAswVMXs396mPvWeV40Fwe5Y74MINC/SyL1xz6C+Dzn1Rb4QNBXLCBh3FO
         xDS/wQJWcHGrsnYCYbsk8bqCe+BbOoBoMz6ul1zOK6PAOghKbfNBV5YauTaNhgAMA2wy
         Gy8uY7oS2wgjaspbHNs6Ul3r/m+p3VPD2PSa+vw+lnyjkKAc36v5pK5Ms5TxtS+8ayL2
         HrnA==
X-Gm-Message-State: APjAAAWpimefK8VPH1M2gXIw/mDSp8LywhYhxGuOzztp3l5yk23qsHqb
        i3ZOWEmuz2yjGDfk8x94cYs=
X-Google-Smtp-Source: APXvYqxXe9v63kbM0JF1LoLoKOaqeyRVGl2/Oek6j2VMW5X6BOhWDAGKUPXv4GVfQcj578r01pXYkQ==
X-Received: by 2002:a17:90a:7788:: with SMTP id v8mr9983003pjk.132.1565361045266;
        Fri, 09 Aug 2019 07:30:45 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p65sm98620810pfp.58.2019.08.09.07.30.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 07:30:44 -0700 (PDT)
Date:   Fri, 9 Aug 2019 07:30:42 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: bu21013_ts: Convert to use GPIO descriptors
Message-ID: <20190809143042.GI178933@dtor-ws>
References: <20190808144458.1258-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808144458.1258-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Thu, Aug 08, 2019 at 04:44:58PM +0200, Linus Walleij wrote:
> @@ -266,7 +269,7 @@ static irqreturn_t bu21013_gpio_irq(int irq, void *device_data)
>  			return IRQ_NONE;
>  		}
>  
> -		data->intr_pin = gpio_get_value(data->chip->touch_pin);
> +		data->intr_pin = gpiod_get_value(data->int_gpiod);
>  		if (data->intr_pin == PEN_DOWN_INTR)
>  			wait_event_timeout(data->wait, data->touch_stopped,
>  					   msecs_to_jiffies(2));

So the INT pin appears to be active low (PEN_DOWN_INTR is 0), so we'll
need to adjust DTS for the boards as such and change this to "logical
active" here since we are moving to gpiod API.

I'll adjust the code in the version I will be sending you soon(ish).

Thanks.

-- 
Dmitry
