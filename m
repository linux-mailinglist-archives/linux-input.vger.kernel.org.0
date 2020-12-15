Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507872DA7D9
	for <lists+linux-input@lfdr.de>; Tue, 15 Dec 2020 06:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgLOFtY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Dec 2020 00:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgLOFtW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Dec 2020 00:49:22 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D55C06179C;
        Mon, 14 Dec 2020 21:48:42 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id d2so13811129pfq.5;
        Mon, 14 Dec 2020 21:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9LGlKHoc1lvi4eB0aROEFbz2iet1AHLtHaa59F1Z3rs=;
        b=C3x5KcQQOFVcl5qmpnBjnYuLYPYEaL6GgmmlTVKjN6PKjW+Nw4cwYxeYJLGnc/4Oj8
         lR26J3Uoh9AYAwOD65wn73rwdBUNb3UzvC2RIUDJoQRdcShBNXgZ0X91tC5MJrPPQWWa
         6DbBvMzikXh7FwpdDooliir1Bc3Nc4VfBelJptBeL88JFaqL4Qt63psXL0iwnnXhSeGG
         a2iC8LMI2fYTq23DlUWNRi8KWCKImzkGaHnEgULhVzWrWVw0PUoo9Ku0nJnjN9YdiR8+
         FH1m9BPBxhquuiLF35wLyZgD8vE+uWr/YU6/Th6Y3edZTmoiRse6VWFWjOfkq5fQ0yKH
         U4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9LGlKHoc1lvi4eB0aROEFbz2iet1AHLtHaa59F1Z3rs=;
        b=ospgcAFlbuAsHLohIS9Aic2K+WNOQH09N7wXowX2ZWNrX59AP0Z33Uzxu+hv2qIC7+
         teOg7r8+ZLHC4TiG1GnFwjikbky/2/CuOsNzT3uTxwUDpYQu3MlW7lnLDXNG+DB7YxMz
         gzy97CLPXQK/eut4fvTZadh8djWg8xfWqqdAzrfJCYyFfobMIMJfgt0cz+G5aMqn6l+n
         FhqDiExmqLRAGRaR9pN1XW/nvSqanM7uZdxvHNhBTKsBgctehWY2qAr7HWjmaFH+75HZ
         OeF1lze2ul6kRT9zxZl0032yrGg5dJOUPhVunuSAlLVk5Fcy7mDuxJyrJKl6pqAX7F3q
         yIng==
X-Gm-Message-State: AOAM5310o/iv4MwP0wpiK4TRJYMFpWrBms9OFvoWUNY9XeWG9euOdKAA
        khWxsftmUQ3/mHf6iYoJOAI=
X-Google-Smtp-Source: ABdhPJzg6uto03v+KNvRZ7SSVdMR/CW/rV8ggOzWpS7xNEr8snla0Ie8R7SrT6cybdMOkFFOLT3nUg==
X-Received: by 2002:a63:42c2:: with SMTP id p185mr20698984pga.33.1608011321814;
        Mon, 14 Dec 2020 21:48:41 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id t15sm18716929pfc.12.2020.12.14.21.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 21:48:40 -0800 (PST)
Date:   Mon, 14 Dec 2020 21:48:38 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "jeffrey.lin" <jeffrey.lin@raydium.corp-partner.google.com>
Cc:     furquan@google.com, seanpaul@chromium.org, rrangel@chromium.org,
        dan.carpenter@oracle.com, jeffrey.lin@rad-ic.com, KP.li@rad-ic.com,
        calvin.tseng@rad-ic.com, simba.hsu@rad-ic.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: raydium_ts_i2c: Do not send zero length
Message-ID: <X9hONuOdn3cTZ6vH@google.com>
References: <1608002466-9263-1-git-send-email-jeffrey.lin@raydium.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608002466-9263-1-git-send-email-jeffrey.lin@raydium.corp-partner.google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeffrey,

On Tue, Dec 15, 2020 at 11:21:06AM +0800, jeffrey.lin wrote:
> Add default write command package to prevent i2c quirk error of zero
> data length as Raydium touch firmware update is executed.
> 
> Signed-off-by: jeffrey.lin <jeffrey.lin@rad-ic.com>
> BUG=b:174207906
> TEST=Successfully tested update Raydium touch firmware over 100 times
> Change-Id: I311b0d26d7642bb800547cd0e87013be17cb7e1b
> ---
>  drivers/input/touchscreen/raydium_i2c_ts.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
> index 603a948460d64..4d2d22a869773 100644
> --- a/drivers/input/touchscreen/raydium_i2c_ts.c
> +++ b/drivers/input/touchscreen/raydium_i2c_ts.c
> @@ -445,6 +445,7 @@ static int raydium_i2c_write_object(struct i2c_client *client,
>  				    enum raydium_bl_ack state)
>  {
>  	int error;
> +	static const u8 cmd[] = { 0xFF, 0x39 };
>  
>  	error = raydium_i2c_send(client, RM_CMD_BOOT_WRT, data, len);
>  	if (error) {
> @@ -453,7 +454,7 @@ static int raydium_i2c_write_object(struct i2c_client *client,
>  		return error;
>  	}
>  
> -	error = raydium_i2c_send(client, RM_CMD_BOOT_ACK, NULL, 0);
> +	error = raydium_i2c_send(client, RM_CMD_BOOT_ACK, cmd, sizeof(cmd));

Is this supported by all firmwares?

>  	if (error) {
>  		dev_err(&client->dev, "Ack obj command failed: %d\n", error);
>  		return error;
> -- 
> 2.26.2
> 

Thanks.

-- 
Dmitry
