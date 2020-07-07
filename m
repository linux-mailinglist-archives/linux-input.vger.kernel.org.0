Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E39216370
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 03:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgGGBoS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Jul 2020 21:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbgGGBoR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Jul 2020 21:44:17 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752AFC061755;
        Mon,  6 Jul 2020 18:44:17 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id z3so8440240pfn.12;
        Mon, 06 Jul 2020 18:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L+rdNDnR/yisowI2/I1Qyzplqy4nEqEaikQt72oc8qw=;
        b=eGUBMe5NQ4BLCc/IRoa97aJOzcNiKTCujYheWJ/oUKseiMzzqlX0lWzVmrZLNFUhzY
         VaZLIJD4Q/KDowwqZNijKO9o5MpBn2AFf+4ts5B0220WnNjzfdhpRdXF0/KMF8lxt/LO
         Rf5vDBwiTfmtAMP6X4onqNjvL4gmPqOF+1OZ1Ba2AXh0/e5MWnrj0+Zo0W4dDFuYv8gs
         s3BXikcHlDkzPukg75c6btlj/ffP5n9EwLBcdwy+XIQB4XXYWHALMuedF2yNN22meYH7
         CX091KddU7epj9ITreNsQyt2JBk9TyG0Nh3hRp+2mt7i2sbScCPccqkKLgnHiGc6UlQl
         AVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L+rdNDnR/yisowI2/I1Qyzplqy4nEqEaikQt72oc8qw=;
        b=O7bZq5Sr1POWLJUCWXUWjVOzbaZkouux7wAoshK69manHLYGFPLRB5VWpuFCD+zLrW
         iBHbmFd6Nzu7WnDXwncZiB+VxeYwbpVYT6AX5YCRPSRPhjyI9f+88OK1GJl1gY5+YzFF
         jZT6yDecGbrJR9B3GWa4+lBhCvO7cVzXpsYVKuqyULsiUaihDRphq25bpMOfabBnN7hi
         9m/JZNIVCsmq8XbfiSIbRtJtmq+ojpMGR8nNrSg4a/L3HE4oMKnRaV/+NwlPdEiNu0vz
         M06jVyr3WXE/CFKp7MshHTJPiKB1xnEY39JX/giJhyzBTYEc31OSeCzc1ghch/6NZ/ya
         v5qw==
X-Gm-Message-State: AOAM533h3d0QcC64C8vK+JHPG4odpvZoIisxZegPbWrdlKT9+wbUKnH0
        S2VMvK0nqwXUskq6nGwZE0Y=
X-Google-Smtp-Source: ABdhPJwsKHIfpFNyD/VfSYDn5QNyHKQw8RZMS12cZdtebDdl55hJFyF/yUDP4U3YTTybKuAp8GrJ6Q==
X-Received: by 2002:a63:7453:: with SMTP id e19mr42958401pgn.450.1594086256757;
        Mon, 06 Jul 2020 18:44:16 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id k92sm642027pje.30.2020.07.06.18.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 18:44:16 -0700 (PDT)
Date:   Mon, 6 Jul 2020 18:44:14 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chen Ni <vulab@iscas.ac.cn>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: misc: remove needless check before
 usb_free_coherent()
Message-ID: <20200707014414.GD3273837@dtor-ws>
References: <20200630063616.8060-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630063616.8060-1-vulab@iscas.ac.cn>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Jun 30, 2020 at 06:36:16AM +0000, Chen Ni wrote:
> From: Xu Wang <vulab@iscas.ac.cn>
> 
> usb_free_coherent() is safe with NULL addr and this check is
> not required.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Even if you are passing on a patch created by someone else you still
need to add your "signed-off-by" to it. Please resubmit with both your
and Xu Wang's sign-offs.

> ---
>  drivers/input/misc/cm109.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
> index c09b9628ad34..e413801f0491 100644
> --- a/drivers/input/misc/cm109.c
> +++ b/drivers/input/misc/cm109.c
> @@ -663,12 +663,8 @@ static const struct usb_device_id cm109_usb_table[] = {
>  static void cm109_usb_cleanup(struct cm109_dev *dev)
>  {
>  	kfree(dev->ctl_req);
> -	if (dev->ctl_data)
> -		usb_free_coherent(dev->udev, USB_PKT_LEN,
> -				  dev->ctl_data, dev->ctl_dma);
> -	if (dev->irq_data)
> -		usb_free_coherent(dev->udev, USB_PKT_LEN,
> -				  dev->irq_data, dev->irq_dma);
> +	usb_free_coherent(dev->udev, USB_PKT_LEN, dev->ctl_data, dev->ctl_dma);
> +	usb_free_coherent(dev->udev, USB_PKT_LEN, dev->irq_data, dev->irq_dma);
>  
>  	usb_free_urb(dev->urb_irq);	/* parameter validation in core/urb */
>  	usb_free_urb(dev->urb_ctl);	/* parameter validation in core/urb */
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry
