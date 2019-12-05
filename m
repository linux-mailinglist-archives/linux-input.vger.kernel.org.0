Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3543111394F
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 02:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbfLEB1i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 20:27:38 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42244 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbfLEB1i (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Dec 2019 20:27:38 -0500
Received: by mail-pg1-f195.google.com with SMTP id i5so749091pgj.9;
        Wed, 04 Dec 2019 17:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ls4HkFhX2h80eqGSuPuzUOPsWugj2HuR4XVBnDP5plY=;
        b=cwgv4vwIfplk8LOQDvsgoB+PPW0iDjPUxgFwuAoyjTE4vHxpySFtw3doZta1QmRO75
         N+hDhrNEUfBcL4nqul9jOHwzw3B0QsDCbY1WgK21WynMq37a7KMiiLjk80rkTkFY2dC9
         OQlkfLFgtl4ckVP5Ltn961/Yb/SdnMKpXmID11/y1WQdQQt51xb7GftzOx6xnn+SVIDb
         pl1+73/ptxbeI8jLxl2aTpWtc/mWIjTJUbUJozAGuNwv95FN8RRvorg4jKJxygZFprgq
         NWRaMTsLeooL0vuDDzq930v4i8kETNUSXZoec2mm8w8YNCjwOo8cOqVr041RQfo2Evyc
         2ByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ls4HkFhX2h80eqGSuPuzUOPsWugj2HuR4XVBnDP5plY=;
        b=JfUbFL6u/rKfZReI0H8AoAwkHxO88iMnKvmoymjkvvt18i1lVmrvh38N/e/kt3OyF+
         8OD3ZJlAM9NwDS+WGGSHsTAQ3vNSqKaAgaUUV8T/bYGLubyFvonE+faxFylVti1FXEHk
         vgr4HW7R2Ep6UCZ0lASOg3zST5sbBNOK29I3lFA7OCeCaRdkmy4MqYhxdyvNp5LzDKvA
         bklpX/TgyfN4V3uADm0ZqpNOwTjwt7xA/eK3jTHunvUwsTnUBAzEi7jXil4C5o/7h6Xt
         RGJWNMG9xqlZWR1r53FCbToy2TVCch3UDd4OSpfROOUPtPG3P97rDkQ7gXHCqxZlVE+z
         IKDA==
X-Gm-Message-State: APjAAAV1HY8IRMZPOP6e2UX8Sl/Agvrv/aW8nv0R7gLU0/bSBqprde+G
        X2GeBCOLyuLQC1g3/9PMkeY=
X-Google-Smtp-Source: APXvYqxiBsibY2wRusyXh/RIIOZxHbaToMbpWjoK9AzGNd7YlOXoTUw26aXeik11k5FIOpcmY9ZH2A==
X-Received: by 2002:a62:1687:: with SMTP id 129mr6619796pfw.44.1575509257106;
        Wed, 04 Dec 2019 17:27:37 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 81sm10379014pfx.73.2019.12.04.17.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 17:27:36 -0800 (PST)
Date:   Wed, 4 Dec 2019 17:27:34 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: uinput - Fix returning EPOLLOUT from uinput_poll
Message-ID: <20191205012734.GN50317@dtor-ws>
References: <20191204025014.5189-1-marcel@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204025014.5189-1-marcel@holtmann.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 04, 2019 at 03:50:14AM +0100, Marcel Holtmann wrote:
> Always return EPOLLOUT from uinput_poll to allow polling /dev/uinput
> for writable state.
> 
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> Cc: stable@vger.kernel.org

Applied, thank you.

> ---
>  drivers/input/misc/uinput.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
> index 84051f20b18a..fd253781be71 100644
> --- a/drivers/input/misc/uinput.c
> +++ b/drivers/input/misc/uinput.c
> @@ -695,7 +695,7 @@ static __poll_t uinput_poll(struct file *file, poll_table *wait)
>  	if (udev->head != udev->tail)
>  		return EPOLLIN | EPOLLRDNORM;
>  
> -	return 0;
> +	return EPOLLOUT | EPOLLWRNORM;
>  }
>  
>  static int uinput_release(struct inode *inode, struct file *file)
> -- 
> 2.23.0
> 

-- 
Dmitry
