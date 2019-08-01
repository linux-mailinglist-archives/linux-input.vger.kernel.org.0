Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAF67E06F
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2019 18:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733109AbfHAQpJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Aug 2019 12:45:09 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40222 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733108AbfHAQpJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Aug 2019 12:45:09 -0400
Received: by mail-pf1-f195.google.com with SMTP id p184so34385484pfp.7
        for <linux-input@vger.kernel.org>; Thu, 01 Aug 2019 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Cn53LljSjBmT+JLDKVZmkSQzgOjSAc3cfVEdqTCPLd4=;
        b=DUaOOoinWqxXdw60mjq8cPLyR1qjJKBHz5izn9pahtp2Zq/EuZ94WtWlIMvfa5lf+K
         q1Vubyz3IGx3kzaKu3j79elDFa5QfdOXstiInTwpsOUUJvoOM0Y49ZEDfTzTlVHpMUBh
         jobGF7kG89fNTNmqs7gOsJTx6k4O+ANq4nr9Jrl0kzjvULOg8ZPBhKguImAn+BbpFSLP
         H9uVoapESRN4ESWyDy5GyfmFuU9DaFJnw+5PzivplWtV2kSI9VsuwrT3hPt7QxqYQ6ZT
         9rlYqdpqDo1rRmXivdm6AqDDn+FQ1i/UZATFzA871x+ppvF/xJpzoAkz22QpK+Q3ejse
         rqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Cn53LljSjBmT+JLDKVZmkSQzgOjSAc3cfVEdqTCPLd4=;
        b=XWxGwetlDGzd55jIRcYXeHNZCxObGlCuiIwyh9zW1Pzb0uEIbOL8hyNB4vkhYyuDNh
         bhA5jrsb+2qhkBZ5POUrvu9VEzn8CabpLD5yMRqyDRrlS4dPYf6hY9P0U2AvdD2r0BmR
         g35lEu/pgwWeP/qNqpn6jk8wIrYojgq1Xk6FTPWyqBOL50fA9IsoS/UytTqfjLr0iXXA
         Q2sjxTQ1T+NQ1yjN+uE40UqoM4P9LRZvdjTrLwMwAxSYbqE0eC/N9JkiRNRAK2G+PdYJ
         mvNQlx3Lso6tBqX4hn4ecqxvFLYMugriDc7qn7ToTC2xbl+oPsJMVClJ1gAqLTzHq/Zn
         DN/g==
X-Gm-Message-State: APjAAAV3bVRslWvPfn38aC4hGKywqnlS7updCQrQx3P21g4exBUHaM0s
        V9KpHT9w8vUDRpRxivqSuU4=
X-Google-Smtp-Source: APXvYqwezSprAnHlX2zgyT9GcWaS3+xq7z0Q23IbWPSOSrVZn68UXNFwiwTKQVl4MZ0lzYdKFBbqlA==
X-Received: by 2002:aa7:90d8:: with SMTP id k24mr54187559pfk.115.1564677908377;
        Thu, 01 Aug 2019 09:45:08 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h6sm69456871pfb.20.2019.08.01.09.45.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 09:45:07 -0700 (PDT)
Date:   Thu, 1 Aug 2019 09:45:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     josh@joshisanerd.com, linux-input@vger.kernel.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH] kbtab: sanity check for endpoint type
Message-ID: <20190801164505.GB212042@dtor-ws>
References: <20190725095158.7420-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725095158.7420-1-oneukum@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 25, 2019 at 11:51:58AM +0200, Oliver Neukum wrote:
> The driver should check whether the endpoint it uses has the correct
> type.
> 
> Reported-by: syzbot+c7df50363aaff50aa363@syzkaller.appspotmail.com
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Applied, thank you.

> ---
>  drivers/input/tablet/kbtab.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/tablet/kbtab.c b/drivers/input/tablet/kbtab.c
> index 04b85571f41e..6f3b59ea2cd4 100644
> --- a/drivers/input/tablet/kbtab.c
> +++ b/drivers/input/tablet/kbtab.c
> @@ -116,6 +116,9 @@ static int kbtab_probe(struct usb_interface *intf, const struct usb_device_id *i
>  
>  	if (intf->cur_altsetting->desc.bNumEndpoints < 1)
>  		return -ENODEV;
> +	endpoint = &intf->cur_altsetting->endpoint[0].desc;
> +	if (!usb_endpoint_is_int_in(endpoint))
> +		return -ENODEV;
>  
>  	kbtab = kzalloc(sizeof(struct kbtab), GFP_KERNEL);
>  	input_dev = input_allocate_device();
> @@ -155,8 +158,6 @@ static int kbtab_probe(struct usb_interface *intf, const struct usb_device_id *i
>  	input_set_abs_params(input_dev, ABS_Y, 0, 0x1750, 4, 0);
>  	input_set_abs_params(input_dev, ABS_PRESSURE, 0, 0xff, 0, 0);
>  
> -	endpoint = &intf->cur_altsetting->endpoint[0].desc;
> -
>  	usb_fill_int_urb(kbtab->irq, dev,
>  			 usb_rcvintpipe(dev, endpoint->bEndpointAddress),
>  			 kbtab->data, 8,
> -- 
> 2.16.4
> 

-- 
Dmitry
