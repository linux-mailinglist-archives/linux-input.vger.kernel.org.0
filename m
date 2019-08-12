Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6AB18977F
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 09:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfHLHFm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 03:05:42 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42196 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbfHLHFm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 03:05:42 -0400
Received: by mail-pf1-f193.google.com with SMTP id i30so531760pfk.9
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2019 00:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qEXXAg+vk3mXPOEHmbbp5wbgI4Iu+uwov8/PAOldqXE=;
        b=H+ecu/uQzqufu1nnWbo5ebPVAFWvaHjp/506Fkug+uKCqycZR5XplpBclkm0DJOkX1
         2nM9Tfr9Nq9ek445RpJ5GrNAKfuRZ7jkj6JuK/I2GPcM0oxBlwQkshCvrF+MrvteOL7q
         mQtwxddmzcSwiz0eBgR/6A3NEbeAE+nGoyIQtGKaSjb1luENKux/uMiFmvSP+9u9rBWT
         jhcDro5jh1oH5BGxK1FsG8GKZhR88uliibVIZnWqE9N0U4df37Pc6E5abcgQaNKJx99r
         5fr3vAWmcBnwh9qSd0L/t/yTrMfDbq0HEC88z18jp218IeCmswXPDdTmecoJ3s06UMVH
         7YvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qEXXAg+vk3mXPOEHmbbp5wbgI4Iu+uwov8/PAOldqXE=;
        b=C/ss3nmRkunJGW1TRoMkVEFHca3IwRSwXeuComN+e3Y2pQHxZXNNSXeoedCEMIErX/
         7TjTvDzA1sMaNXoGtOpab0qisKyoSPCzZ4x1pvgQ8ZLF2GCn5cEyf8gV+DsIEJLlAT2k
         AqVnGyu54IbN8fGLdMPHFRZE9FW2TP5997NmxLl8MP07qA7bDlkOkgcDV9OrtMPeer2q
         mDo9WVWSIZcNG/pNz3bRP7I29a/7KYx50hNVJ5Gmq5uXcH65m5gm/Pex7mack177G6KD
         zqXSqzHOI/w/MRD9MtEP6VBPn6JE2OqBcNtIjD05kbEjjkIqoMA9M1/2zoZT1C9r2d5D
         6TTQ==
X-Gm-Message-State: APjAAAWXQb3z0bdj6Dh9A0XI/v+FUBnoFCq3+H5QRQIBGRVMceDcqj8U
        c5ZV3yU8AKsboic8KNY00Fi+9SvS
X-Google-Smtp-Source: APXvYqzCOj9wXsRjiEwjTCqm3uqsS9G3tACTugkviYH5eM250qOXNNnwGHaSWRByORcApB4YGxx1gg==
X-Received: by 2002:a65:638c:: with SMTP id h12mr28651971pgv.436.1565593541698;
        Mon, 12 Aug 2019 00:05:41 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id l189sm126392441pfl.7.2019.08.12.00.05.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 00:05:41 -0700 (PDT)
Date:   Mon, 12 Aug 2019 00:05:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh@kernel.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: edt-ft5x06: no need to check return value of
 debugfs_create functions
Message-ID: <20190812070538.GX178933@dtor-ws>
References: <20190810105557.GA27295@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190810105557.GA27295@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Aug 10, 2019 at 12:55:57PM +0200, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied, thank you.

> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> index 3cc4341bbdff..5525f1fb1526 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -764,8 +764,6 @@ edt_ft5x06_ts_prepare_debugfs(struct edt_ft5x06_ts_data *tsdata,
>  			      const char *debugfs_name)
>  {
>  	tsdata->debug_dir = debugfs_create_dir(debugfs_name, NULL);
> -	if (!tsdata->debug_dir)
> -		return;
>  
>  	debugfs_create_u16("num_x", S_IRUSR, tsdata->debug_dir, &tsdata->num_x);
>  	debugfs_create_u16("num_y", S_IRUSR, tsdata->debug_dir, &tsdata->num_y);
> -- 
> 2.22.0
> 

-- 
Dmitry
