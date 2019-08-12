Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A03F89786
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 09:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbfHLHIi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 03:08:38 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45937 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfHLHIi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 03:08:38 -0400
Received: by mail-pl1-f193.google.com with SMTP id y8so5412084plr.12
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2019 00:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=kQ4PwkyzEMQFF8PsFiRRICWroSTf4FglYuM5NsGmpcw=;
        b=ee7qOi+Ei+rF1sMNyIcAChlmx92JZwzIjZ7dCTSe8YRMkzhSY7kMXtH5Kc5jkeMGvn
         b5nSJUrlR4aDXix/rF1Ov+e+SWx6ccFDCWLZVkO6HMxJQL5y5kyd2QoRtvvC3/XKEh5H
         XZr/CuD8BMD23HB2B4HfyCibpNpqQp24Q0vlYDbv3CCZLxDBuMYrLYAeuZ/QXy3Hzget
         HarBfps1+yZCVc+mdKM3Hv8MyCx4BDPl8gwDpZhQnwWF3/PFtoN6hjRtTda4UYuFGh4y
         CAqBLNmOPvLpqD+sbJr2uCNC3x9EHXSSWYrO/N2maS4qRJ+ws8+tUFBxwOZTVzx45+/G
         NZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kQ4PwkyzEMQFF8PsFiRRICWroSTf4FglYuM5NsGmpcw=;
        b=jX784xq1k3uG9pWA7sfh5U4cAPANFDw8/vo7RBBGpGbb6Knzsb8mNCwCrJZY7ABgm4
         m0OYp7AllPuC0Cx+Hjru5WC7GAOik9K7avO8f8zq57v4FqKA6Ou2c4BqCcjc/oJyuKOA
         gXQ7JwRcp3yte7YPGIrbXQHxumodYYV3YHQN+/yc01sA4nqw0Rav3Aq0OTKUF4A5r07I
         vqzGmCS29HoPk6A/SS2b7jA+NhnDa+b5X9amxxtlePvQ7iV1aTQ4NsImb3AHwFfjHixT
         x8cpaydclknIwmzaP+cDqmlD0XzfbOw3h5O5Z+m8f1PongunpryLG2W6ujoFKb/nXKeu
         zXHQ==
X-Gm-Message-State: APjAAAW7JgyeSgvIAbxOT1qFOmNw0TzAQGadN2rxtrboZnoTdiMhQjHC
        Sx9B2cjRR42cpSzrn+TI8co=
X-Google-Smtp-Source: APXvYqyCahdJ47Ak2EBoERz7yCOzVf7sdVkt+B47PpxNSKaSYeB7Lo+SwjiPDzciCfS6WVlDffuogQ==
X-Received: by 2002:a17:902:8d8d:: with SMTP id v13mr11802711plo.137.1565593717280;
        Mon, 12 Aug 2019 00:08:37 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s11sm111162284pgv.13.2019.08.12.00.08.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 00:08:36 -0700 (PDT)
Date:   Mon, 12 Aug 2019 00:08:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mao Wenan <maowenan@huawei.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: applespi: no need to check return value of
 debugfs_create functions
Message-ID: <20190812070834.GZ178933@dtor-ws>
References: <20190810105734.GA27563@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190810105734.GA27563@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Aug 10, 2019 at 12:57:34PM +0200, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: "Ronald Tschalär" <ronald@innovation.ch>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mao Wenan <maowenan@huawei.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied, thank you.

> ---
>  drivers/input/keyboard/applespi.c | 30 ++++++------------------------
>  1 file changed, 6 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
> index 548737e7aeda..c822a5d2a85d 100644
> --- a/drivers/input/keyboard/applespi.c
> +++ b/drivers/input/keyboard/applespi.c
> @@ -1794,30 +1794,12 @@ static int applespi_probe(struct spi_device *spi)
>  
>  	/* set up debugfs entries for touchpad dimensions logging */
>  	applespi->debugfs_root = debugfs_create_dir("applespi", NULL);
> -	if (IS_ERR(applespi->debugfs_root)) {
> -		if (PTR_ERR(applespi->debugfs_root) != -ENODEV)
> -			dev_warn(&applespi->spi->dev,
> -				 "Error creating debugfs root entry (%ld)\n",
> -				 PTR_ERR(applespi->debugfs_root));
> -	} else {
> -		struct dentry *ret;
> -
> -		ret = debugfs_create_bool("enable_tp_dim", 0600,
> -					  applespi->debugfs_root,
> -					  &applespi->debug_tp_dim);
> -		if (IS_ERR(ret))
> -			dev_dbg(&applespi->spi->dev,
> -				"Error creating debugfs entry enable_tp_dim (%ld)\n",
> -				PTR_ERR(ret));
> -
> -		ret = debugfs_create_file("tp_dim", 0400,
> -					  applespi->debugfs_root, applespi,
> -					  &applespi_tp_dim_fops);
> -		if (IS_ERR(ret))
> -			dev_dbg(&applespi->spi->dev,
> -				"Error creating debugfs entry tp_dim (%ld)\n",
> -				PTR_ERR(ret));
> -	}
> +
> +	debugfs_create_bool("enable_tp_dim", 0600, applespi->debugfs_root,
> +			    &applespi->debug_tp_dim);
> +
> +	debugfs_create_file("tp_dim", 0400, applespi->debugfs_root, applespi,
> +			    &applespi_tp_dim_fops);
>  
>  	return 0;
>  }
> -- 
> 2.22.0
> 

-- 
Dmitry
