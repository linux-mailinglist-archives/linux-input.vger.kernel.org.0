Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F4C1AF6CC
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 06:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgDSE1T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 00:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725769AbgDSE1S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 00:27:18 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A40C061A0C
        for <linux-input@vger.kernel.org>; Sat, 18 Apr 2020 21:27:18 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id v2so2642776plp.9
        for <linux-input@vger.kernel.org>; Sat, 18 Apr 2020 21:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aMN/Mmpl9k+/c8u5EsexE3O9l4ldGpoNd7y5C1/YdCE=;
        b=rniJL7p0FIW1Uu0CojdIticfRujlijV8jrUbcnXfZt+1f8j7rnG6Wcr+mvDyrO6/hA
         HG/0vLyHd4kr+KkNofAomfsO6F3Ktvgo1l/9bgQIS0n12IqyGosWCClf2CXuWPVvJc7V
         5RSbVoabrY/nOC+rHi/a90ZKAlouzU4aOVSr1MK3ILag9ltJ3YP9/EhVYcRAQ3hzCypH
         QexDVzkcFmsUV13qp2IE0esC32dc3Azv0W072+StSGe+JcLhIGzdK4r0gDmiNc/DW8Ee
         p77WSXPkpXgOAAcdJn3MlAaqgtIGBfBnfRpcgBlO6kOXb9oY6YyFEsdKfW1jCGJm77Yz
         +pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aMN/Mmpl9k+/c8u5EsexE3O9l4ldGpoNd7y5C1/YdCE=;
        b=bZ4ygdWSZ7fMmMmD4RaMm64RTdv8cnkdu3/6z0S6imONvPLXbnabsVPs9YF3dc/9yK
         FKASdMys90tTABVJEVY7TshrsALgbWWWGbJ430MHAhGQtuMw29vBewApxBhOIEuIYJcp
         g3eOpTiTEkwCMwGss/qe9/QyA910YmlYXosB6pt3Fv16YppJrTgR/oouPeih/+ZFj8Fc
         tNhrxy2oUifk4mefVR23WjO2sBQ3jcYHj64cYI02xvs7FePMQSKR060tyUmoaAeRM9wJ
         ZUe4QZ6zDQ2yWruUaS691AygyTqsCVxaokxPbWsaAHhS+gTyPbCWQ1yJ85uXyOR55Nau
         9clg==
X-Gm-Message-State: AGi0PuYdQmZ2AL1+RjX2sS0GxWJnWnoOHKcbClm3nfW3pXoGd1m492ax
        FLcN3PMz7R43LY+PCPNhpNg=
X-Google-Smtp-Source: APiQypLr7Wk2t6iito5h4JTq9FihgbLaR1nnckPNpKB+Ruv0HPXAnLq+kv72oUXH3lT3YROkHIDcRg==
X-Received: by 2002:a17:90a:c401:: with SMTP id i1mr13491488pjt.131.1587270437861;
        Sat, 18 Apr 2020 21:27:17 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 71sm12949072pfw.111.2020.04.18.21.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 21:27:17 -0700 (PDT)
Date:   Sat, 18 Apr 2020 21:27:15 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Kenny Levinsen <kl@kl.wtf>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] input/evdev: make evdev use keyed wakeups
Message-ID: <20200419042715.GH166864@dtor-ws>
References: <20200410233557.3892-1-kl@kl.wtf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410233557.3892-1-kl@kl.wtf>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 11, 2020 at 01:35:57AM +0200, Kenny Levinsen wrote:
> Some processes, such as systemd, are only polling for EPOLLERR|EPOLLHUP.
> As evdev uses unkeyed wakeups, such a poll receives many spurious
> wakeups from uninteresting events.
> 
> Use keyed wakeups to allow the wakeup target to more efficiently discard
> these uninteresting events.
> 
> Signed-off-by: Kenny Levinsen <kl@kl.wtf>

Applied, thank you.

> ---
>  drivers/input/evdev.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
> index d7dd6fcf2db0..f54d3d31f61d 100644
> --- a/drivers/input/evdev.c
> +++ b/drivers/input/evdev.c
> @@ -282,7 +282,8 @@ static void evdev_pass_values(struct evdev_client *client,
>  	spin_unlock(&client->buffer_lock);
>  
>  	if (wakeup)
> -		wake_up_interruptible(&evdev->wait);
> +		wake_up_interruptible_poll(&evdev->wait,
> +			EPOLLIN | EPOLLOUT | EPOLLRDNORM | EPOLLWRNORM);
>  }
>  
>  /*
> @@ -443,7 +444,7 @@ static void evdev_hangup(struct evdev *evdev)
>  		kill_fasync(&client->fasync, SIGIO, POLL_HUP);
>  	spin_unlock(&evdev->client_lock);
>  
> -	wake_up_interruptible(&evdev->wait);
> +	wake_up_interruptible_poll(&evdev->wait, EPOLLHUP | EPOLLERR);
>  }
>  
>  static int evdev_release(struct inode *inode, struct file *file)
> @@ -958,7 +959,7 @@ static int evdev_revoke(struct evdev *evdev, struct evdev_client *client,
>  	client->revoked = true;
>  	evdev_ungrab(evdev, client);
>  	input_flush_device(&evdev->handle, file);
> -	wake_up_interruptible(&evdev->wait);
> +	wake_up_interruptible_poll(&evdev->wait, EPOLLHUP | EPOLLERR);
>  
>  	return 0;
>  }
> -- 
> 2.26.0
> 

-- 
Dmitry
