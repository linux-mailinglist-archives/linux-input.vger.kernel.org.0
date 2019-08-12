Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5DD889781
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 09:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbfHLHHL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 03:07:11 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:32841 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfHLHHL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 03:07:11 -0400
Received: by mail-pg1-f195.google.com with SMTP id n190so8204405pgn.0
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2019 00:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=kQ4PwkyzEMQFF8PsFiRRICWroSTf4FglYuM5NsGmpcw=;
        b=r22qfj9yjGD8TXNiPWVxizb3Md8s0Vh7Ne/bWkXI6rlhkB7YWCRIyCSexbxG3kYlmw
         sceJ99GKc0VyBzb9YBTX3XXZPVuf5lNcYdPv0VuOFlcYsQoQmPJRZcbe+U4imwLcE58h
         joxIWj5B5015YdKwYA2c5y1STNxmVLE6EEZNwrAGy8vEM9YYc/RsOUBypP98xctRVwsv
         ByNeJgd3Muu9KB1L+KOuNXTp/3OxOid1tyo1QL+qhyuzBqtDhMGyGQ9N9OEMkVxL+xkK
         GX2WZZVSRpcXrEmMgyNoTWYuKZPloX85ux2aw15OifRaqDu67OWDAj4Juc4xFT+K9iEQ
         w3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kQ4PwkyzEMQFF8PsFiRRICWroSTf4FglYuM5NsGmpcw=;
        b=PEHyzcZPOAgLzKh9sfpRjyx8+nMaT+YUgB/CTMlkdBR38J06n4KSq5kgyG2gv7gOXP
         ChG4SY+C2saOGVSYF7NW0TPAidPn+Ou5RWFiA6umyly2a+x5W6wqEAgwK9nYlxopYwZ4
         gd++dJEG97O3INRrUW2PWOK1THzekKzkBx6VLEJ1BqjEgfSVzOkPYpds0npMNz63aVfR
         jA0hM5vYTcvSF9ZVrfEp4sJbLoLz2JgB2tjKnO9lk8qh1IAIDReN2ISMnUr7+AoPxXDN
         ThbnoBRYiyfR9rPd1l2KljxmXp19Tb3jPjsrY3HGfmu8/Bf1VBtAUTVe9OST+G+jDRDr
         vWcA==
X-Gm-Message-State: APjAAAXI/hiMkTITZubQ8f3zf1zLzq9HcPx8Ws+hZ+65YmukYT9xW65H
        BT6nWmQIiVGLjMhRax/U8VI=
X-Google-Smtp-Source: APXvYqzS+FJblxQJfNtrL3Jy0Mfg8Vonfw4scfObUYFq1zBEGCJwiWi5c2Z73bhapALnP+AOOboRzA==
X-Received: by 2002:a65:4808:: with SMTP id h8mr11948742pgs.22.1565593630085;
        Mon, 12 Aug 2019 00:07:10 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p2sm147232652pfb.118.2019.08.12.00.07.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 00:07:09 -0700 (PDT)
Date:   Mon, 12 Aug 2019 00:07:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mao Wenan <maowenan@huawei.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: applespi: no need to check return value of
 debugfs_create functions
Message-ID: <20190812070707.GY178933@dtor-ws>
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
