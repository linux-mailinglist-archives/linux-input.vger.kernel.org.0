Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB957E06A
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2019 18:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731665AbfHAQnm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Aug 2019 12:43:42 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40034 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732041AbfHAQnm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Aug 2019 12:43:42 -0400
Received: by mail-pf1-f195.google.com with SMTP id p184so34383155pfp.7
        for <linux-input@vger.kernel.org>; Thu, 01 Aug 2019 09:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Lg4dPkvU1zA5drmQ9zyJC87xVZ4zj4TjH/DkmTgZ2SM=;
        b=iQhtrM5hOTkYP7BoYyA+gqAlM01IOzPtAP8BdDxuikAAPmsrSdwNJg+BL6jo1SOJIB
         YK97pntFuo4j3gAru31HVqAcmCoXL4+T/xuJ9+TnV/MtBxZTHImw4tXV8znZQFEd5f9p
         xcNcqDwMjYYVmFbM8dsN9H4x4SUMWLQyeZPO69V7+BLJWUmKdQDHKisL6yJb8cmFVa7Z
         Rr+bOLeoc7gPertncVWjtlcu/WSMGHJPL618CAPr5R+eU+bf1+/1v1oDBwXWqJmyjsDI
         NLch6ywT4nePM4EVmQ+uZgjNbwRlti4xdGfvUJiPwQ+8Xz+1GBfoJXArKCGpmWYYA3JG
         wBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Lg4dPkvU1zA5drmQ9zyJC87xVZ4zj4TjH/DkmTgZ2SM=;
        b=Z4FIF0DIvZmDElJbbABjQQ1VFZQYcWQBai87Jx5Jt5mDRja6pUpfjsEgf8lfyMnBMK
         aBQop0tjxSY2DDoi6DM774ZmeEB+a7fcNGZfdFATK79LvRUr0GEcYHOW55QqlLItaU+p
         PJh5fl5lI/4tMOFLxxISYHAzirqUKVbkGILAkiecP4GIoaVe+32DMDovzmWDtP8qgqVj
         uomiUZeQ1eG3OrQASVicXCeEdHCPATjE3LqCXDEWvMIHBHQbm7seZaSMeoR2460iYv5I
         7c8RrHH5g+RSws6GE/crbdBjrQEVfAMunbxVfG1ynfJepyQySLbFVbqZg6NJ6J1xUHGj
         ub4w==
X-Gm-Message-State: APjAAAV7Gcda6BK7m8zD0iS7f6NvGaGrryx81g3VrZVXL2ovT+jU9Tw+
        DYlJGGyVrMliRJFRyFqdqNs=
X-Google-Smtp-Source: APXvYqyiFiojrXHnMVWyBn2Z5ZJkmIQJR+0w9CJ8luH1E8d/FZRkt0qSpNTy2XJsbnQFy2gWP/v1XA==
X-Received: by 2002:a65:6709:: with SMTP id u9mr92063726pgf.58.1564677821111;
        Thu, 01 Aug 2019 09:43:41 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h13sm40684776pfn.13.2019.08.01.09.43.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 09:43:40 -0700 (PDT)
Date:   Thu, 1 Aug 2019 09:43:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH] usbtouchscreen: add proper initialization
Message-ID: <20190801164338.GA212042@dtor-ws>
References: <20190730104717.31831-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730104717.31831-1-oneukum@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 30, 2019 at 12:47:17PM +0200, Oliver Neukum wrote:
> Mutexes shall be initialized before they are used.
> 
> Fixes: 12e510dbc57b2 ("Input: usbtouchscreen - fix deadlock in autosuspend")
> Reported-by: syzbot+199ea16c7f26418b4365@syzkaller.appspotmail.com
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/usbtouchscreen.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
> index a2cec6cacf57..caacf211f51b 100644
> --- a/drivers/input/touchscreen/usbtouchscreen.c
> +++ b/drivers/input/touchscreen/usbtouchscreen.c
> @@ -1658,6 +1658,7 @@ static int usbtouch_probe(struct usb_interface *intf,
>  	input_dev = input_allocate_device();
>  	if (!usbtouch || !input_dev)
>  		goto out_free;
> +	mutex_init(&usbtouch->pm_mutex);
>  
>  	type = &usbtouch_dev_info[id->driver_info];
>  	usbtouch->type = type;
> -- 
> 2.16.4
> 

-- 
Dmitry
