Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1BAB173F
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2019 04:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfIMCkk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Sep 2019 22:40:40 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38687 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727025AbfIMCkj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Sep 2019 22:40:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id h195so17154370pfe.5;
        Thu, 12 Sep 2019 19:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AY4bUcVWchtwG9esP1UGAyX2b8Gfs7RqsAhuxCHMkLI=;
        b=E/JYAGpXMeY+5IsnZRCtIe1ec7FVy2T35Xmy0oeufUHQWJVU/z3rJZVEv/wfmFpVbc
         qxFpGR9nfwesUfT4hVvZO862Fmvw0wHKercdu3RLLFpd0+ynYvfCxIk3rGhHsnA3yMZj
         l5JCZAHin060vBWS1Z293LHCwsZ75XcSOnnsDzAQbynG2CKO1CQD8fmj1J1CushMUL9q
         XWmIzNcLgtEx2/3Xa/G0HrapHG2yZZUVNSs7a2v1HZwoy8kZW5f9XmwSuX3ZhmelkWNw
         HRI/Oamd8mAEBEawVvrwuLFq2gNDVm2HDM2NkKIXyHyirPq2SIlvp1wMLvZvp6KRbXBQ
         579g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AY4bUcVWchtwG9esP1UGAyX2b8Gfs7RqsAhuxCHMkLI=;
        b=qB+wCi5/4guy/+3rgBymxs1hKalLd/2wgu4BJAbOGC7DU5hVTM09OKaesRQOEaKqJw
         KNRrecr0+54aCfOEjEBvRmv7yBwFm1c3tZtTY6N/APa1MsYsmk/uNeIypjzuqX2zyIqa
         MxJ3/LCAb+u5xTp2SfAK0jB8tfweYwiI4OwSiSMgsj6UuewrtveLVNW0NwRSy1rQSRWI
         qD7qE3p6qQh6D2JqYrZWJ/nHR4g5dRrhfdNK02YCYMYGCOTENxdZU/fUwfHaEmZyqyPm
         8CuP3UqBJaoM1XLsvVeogWO+GMN77IMnsitJFN14pRNPgFnu/lRgmWhQh6LhDU7XIDyX
         9q/w==
X-Gm-Message-State: APjAAAUGqeUjO56oQ/OdSyyyeg0T7W+Np7dDrT9+9jRCqygwJrjiPyDK
        tg6UngTkRK8+3YfceNiSUAE=
X-Google-Smtp-Source: APXvYqzFTUjtZnyoFyuOvHU2ogKHd28KSq9Q4uVfrRzz2l8QkL1nTHhbcUlKl7WnOH/vYlL1Ifk/kQ==
X-Received: by 2002:aa7:8b09:: with SMTP id f9mr48451551pfd.23.1568342437077;
        Thu, 12 Sep 2019 19:40:37 -0700 (PDT)
Received: from localhost (c-73-158-250-148.hsd1.ca.comcast.net. [73.158.250.148])
        by smtp.gmail.com with ESMTPSA id i74sm40223070pfe.28.2019.09.12.19.40.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 19:40:36 -0700 (PDT)
Date:   Thu, 12 Sep 2019 21:31:19 +0100
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rishi Gupta <gupt21@gmail.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hidraw: replace printk() with corresponding pr_xx()
 variant
Message-ID: <20190912203119.GC636@penguin>
References: <1566492232-13590-1-git-send-email-gupt21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566492232-13590-1-git-send-email-gupt21@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rishi,

On Thu, Aug 22, 2019 at 10:13:52PM +0530, Rishi Gupta wrote:
> This commit replaces direct invocations of printk with
> their appropriate pr_info/warn() variant.
> 
> Signed-off-by: Rishi Gupta <gupt21@gmail.com>
> ---
>  drivers/hid/hidraw.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
> index 006bd6f..67b652b 100644
> --- a/drivers/hid/hidraw.c
> +++ b/drivers/hid/hidraw.c
> @@ -197,14 +197,14 @@ static ssize_t hidraw_get_report(struct file *file, char __user *buffer, size_t
>  	}
>  
>  	if (count > HID_MAX_BUFFER_SIZE) {
> -		printk(KERN_WARNING "hidraw: pid %d passed too large report\n",
> +		pr_warn("hidraw: pid %d passed too large report\n",
>  				task_pid_nr(current));

If you are doing this, you should also look into pr_fmt() so that we do
not need to manually add "hidraw: " prefix to the messages.

>  		ret = -EINVAL;
>  		goto out;
>  	}
>  
>  	if (count < 2) {
> -		printk(KERN_WARNING "hidraw: pid %d passed too short report\n",
> +		pr_warn("hidraw: pid %d passed too short report\n",
>  				task_pid_nr(current));
>  		ret = -EINVAL;
>  		goto out;
> @@ -597,7 +597,7 @@ int __init hidraw_init(void)
>  	if (result < 0)
>  		goto error_class;
>  
> -	printk(KERN_INFO "hidraw: raw HID events driver (C) Jiri Kosina\n");
> +	pr_info("hidraw: raw HID events driver (C) Jiri Kosina\n");
>  out:
>  	return result;
>  
> -- 
> 2.7.4
> 

Thanks.

-- 
Dmitry
