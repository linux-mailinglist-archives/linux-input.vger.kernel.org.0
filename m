Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD591B4E8E
	for <lists+linux-input@lfdr.de>; Wed, 22 Apr 2020 22:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgDVUs2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Apr 2020 16:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbgDVUs0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Apr 2020 16:48:26 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 488D1C03C1A9
        for <linux-input@vger.kernel.org>; Wed, 22 Apr 2020 13:48:25 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t16so1412587plo.7
        for <linux-input@vger.kernel.org>; Wed, 22 Apr 2020 13:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IpppoVw162nah0Ye373G60yUi+Gqn6dHPdSfHxoU2so=;
        b=i0hTwYHD28nYXo9itWKhTTZugGHzmDZvGWThW2xlDLY/0EH6+XCmovfL4SLNQYXKF3
         ayVwnxsFjcvl66KxbjXv4YvVTIOhF1CfvqUGvPFuonAsm7qG9/rQHkcVszULhAYUWxId
         8sm0gcOy0xfMZVYwY+tjNAlz9f5FqoBvpNWRDwYq2CQlgm8W/5dSSttpc2G10tK7vmGw
         YudhOUpN/w/qgY+suQcpphS8l2H9gogTUoWxiHEoCH4VsDUAE48YIl4AIfIOdVeVxC5W
         m0/6/U9Jo5WOey6WrfJAGMJGWcF/dfjvG1ZR6FF9XltbNDFSsCvH50RYxLbknmFLYyTE
         Hc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IpppoVw162nah0Ye373G60yUi+Gqn6dHPdSfHxoU2so=;
        b=MrsLmOzPcbOEdnvM5G31BNMEaC243e/Zsg14vcDUZ0I18msqnqg2fRjqlp5aeuSKJP
         bCc0UGb+Pqn9Wu94WW2mFon+ehoiXHJh/qB+Dg/If/QMAPADt2EZbFlFljJDcqxQ0+Xn
         da/Q6h/2MHyQuX64OSFxg/YmcdjprurF4H8Q/iPxXOWnmifIu4GhCzJVTPypFVn7YzQd
         7UxrX1W+6ntJAe+wc10LMegeb4JfclVuFPOW5tVRhya8rdv6AgLuFDJaIzLAGqFJFpFQ
         LMImCnimlXw7ginG408t2aPEEvMehinGr/HlY3fc53NCgMtxe7KUdAWDhXZXXpMUWgXU
         ZgsQ==
X-Gm-Message-State: AGi0PuZL2Xjv87F5mAor6smbtqpy4lOOdZBiP9Do6Laa+A7oV+uW6aFu
        i+tHJyj9J5Ln0olDkg/0yaQ=
X-Google-Smtp-Source: APiQypLlvYiEVYN4P1UsbLhoZgdixLm/ji4KFdW/xoaMfvDsu2sy5Os2sOvYPKKphrGngjzkFk/+mg==
X-Received: by 2002:a17:90a:8a06:: with SMTP id w6mr615970pjn.191.1587588504640;
        Wed, 22 Apr 2020 13:48:24 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id l24sm113137pgk.24.2020.04.22.13.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 13:48:24 -0700 (PDT)
Date:   Wed, 22 Apr 2020 13:48:22 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Brendan Shanks <bshanks@codeweavers.com>
Cc:     linux-input@vger.kernel.org, mathieu.maret@gmail.com
Subject: Re: [PATCH] Input: evdev - Call input_flush_device() on release(),
 not flush()
Message-ID: <20200422204822.GD125362@dtor-ws>
References: <20200421231003.7935-1-bshanks@codeweavers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421231003.7935-1-bshanks@codeweavers.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 21, 2020 at 04:10:03PM -0700, Brendan Shanks wrote:
> input_flush_device() should only be called once the struct file is being
> released and no open descriptors remain, but evdev_flush() was calling
> it whenever a file descriptor was closed.
> 
> This caused uploaded force-feedback effects to be erased when a process
> did a dup()/close() on the event FD, called system(), etc.
> 
> Call input_flush_device() from evdev_release() instead.
> 
> Reported-by: Mathieu Maret <mathieu.maret@gmail.com>
> Signed-off-by: Brendan Shanks <bshanks@codeweavers.com>

Applied, thank you.

> ---
>  drivers/input/evdev.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
> index cb6e3a5f509c..3c006b265729 100644
> --- a/drivers/input/evdev.c
> +++ b/drivers/input/evdev.c
> @@ -326,20 +326,6 @@ static int evdev_fasync(int fd, struct file *file, int on)
>  	return fasync_helper(fd, file, on, &client->fasync);
>  }
>  
> -static int evdev_flush(struct file *file, fl_owner_t id)
> -{
> -	struct evdev_client *client = file->private_data;
> -	struct evdev *evdev = client->evdev;
> -
> -	mutex_lock(&evdev->mutex);
> -
> -	if (evdev->exist && !client->revoked)
> -		input_flush_device(&evdev->handle, file);
> -
> -	mutex_unlock(&evdev->mutex);
> -	return 0;
> -}
> -
>  static void evdev_free(struct device *dev)
>  {
>  	struct evdev *evdev = container_of(dev, struct evdev, dev);
> @@ -453,6 +439,9 @@ static int evdev_release(struct inode *inode, struct file *file)
>  	unsigned int i;
>  
>  	mutex_lock(&evdev->mutex);
> +	if (evdev->exist && !client->revoked)
> +		input_flush_device(&evdev->handle, file);
> +
>  	evdev_ungrab(evdev, client);
>  	mutex_unlock(&evdev->mutex);
>  
> @@ -1310,7 +1299,6 @@ static const struct file_operations evdev_fops = {
>  	.compat_ioctl	= evdev_ioctl_compat,
>  #endif
>  	.fasync		= evdev_fasync,
> -	.flush		= evdev_flush,
>  	.llseek		= no_llseek,
>  };
>  
> -- 
> 2.25.3
> 

-- 
Dmitry
