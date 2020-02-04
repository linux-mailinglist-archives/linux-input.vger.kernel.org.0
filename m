Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1F3151A94
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 13:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgBDMfC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 07:35:02 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37453 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbgBDMfB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Feb 2020 07:35:01 -0500
Received: by mail-lf1-f65.google.com with SMTP id b15so12077019lfc.4;
        Tue, 04 Feb 2020 04:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+AqRP565UXcsr02axiLaYk2OF60ZFVZjnu/3XsMBGhI=;
        b=BMmYcVwFjlJSkj47g7qtF5zBtfu8lhRMlSnftddRwMEK9NAKSZEW4KPOaz9OH1GS4T
         QVvQOz60Ql4kN8L1bt6YMm6tHLLYZzTFGKm4MLjJwn8ZKMtkTSgHcZKOWEq0KUwdMy1S
         xNVYmCj2vutnQgZMkoFSl7pfyDKrW+6fpBOPAikmPbESHADNE+XSPuKKPNI9gJOJdc8N
         fUK+sKU+ACv9Zs7DDi8xrFD2k7idEeGD893+vhmpzkpf9X8x+YBAFKKYjcRWa1UkPFgm
         ElRN+6KuAOEaOb2JfeuYf3EnCnEhR4YKdFSCZy3KNFyDk2Y8VkmCGbbWUhRjjJrim9dP
         hVtw==
X-Gm-Message-State: APjAAAXqO31VAjRotwSLihM7RRd4kwyhcTNicQoZ16ILRvg93f+rCkvH
        Stqw2dS/vWVOqYAHJd2J0j4=
X-Google-Smtp-Source: APXvYqznv6zA9jdLpXFbgIuMmf/GTHqlZVMXaCWKAMo/e/GbmQUvtAIKM4dCwVKhKn18U2hg44MmyQ==
X-Received: by 2002:ac2:5499:: with SMTP id t25mr14585118lfk.194.1580819699908;
        Tue, 04 Feb 2020 04:34:59 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id m15sm11919682ljg.4.2020.02.04.04.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 04:34:59 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iyxQ4-00041d-Qa; Tue, 04 Feb 2020 13:35:08 +0100
Date:   Tue, 4 Feb 2020 13:35:08 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Lauri Jakku <lja@iki.fi>
Cc:     oneukum@suse.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: HID: random timeout failures tackle try.
Message-ID: <20200204123508.GJ26725@localhost>
References: <20200204110658.32454-1-lja@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200204110658.32454-1-lja@iki.fi>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 04, 2020 at 01:06:59PM +0200, Lauri Jakku wrote:
> There is multiple reports of random behaviour of USB HID devices.
> 
> I have mouse that acts sometimes quite randomly, I debugged with
> logs others have published: that there is HW timeouts that leave
> device in state that it is errorneus.
> 
> To fix this, I introduce retry mechanism in root of USB HID drivers.
> 
> Fix does not slow down operations at all if there is no -ETIMEDOUT
> got from control message sending. 
> 
> If there is one, then sleep 20ms and try again. Retry count is 20
> witch translates maximium of 400ms before giving up. If the 400ms
> boundary is reached the HW is really bad.

That's not even true. The caller passes in a timeout, in many cases 5
seconds, which you allow to expire up to 20 times on top of your
arbitrary 400 ms delay. So that's 100.4 seconds...

> JUST to be clear:
>     This does not make USB HID devices to sleep anymore than
>     before, if all is golden.
> 
> Why modify usb-hid-core: No need to modify driver by driver.

Because you cannot decide how every use should handle timeouts.

Just fix up the driver that needs this.

> Signed-off-by: Lauri Jakku <lja@iki.fi>
> ---
>  drivers/usb/core/message.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 5adf489428aa..b375e376ea22 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -20,6 +20,7 @@
>  #include <linux/usb/hcd.h>	/* for usbcore internals */
>  #include <linux/usb/of.h>
>  #include <asm/byteorder.h>
> +#include <linux/errno.h>
>  
>  #include "usb.h"
>  
> @@ -137,7 +138,10 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
>  		    __u16 size, int timeout)
>  {
>  	struct usb_ctrlrequest *dr;
> -	int ret;
> +	int ret = -ETIMEDOUT;
> +
> +	/* retry_cnt * 20ms, max retry time set to 400ms */
> +	int retry_cnt = 20;
>  
>  	dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_NOIO);
>  	if (!dr)
> @@ -149,11 +153,27 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
>  	dr->wIndex = cpu_to_le16(index);
>  	dr->wLength = cpu_to_le16(size);
>  
> -	ret = usb_internal_control_msg(dev, pipe, dr, data, size, timeout);
> +	do {
> +		ret = usb_internal_control_msg(dev,
> +					pipe,
> +					dr,
> +					data,
> +					size,
> +					timeout);
> +
> +		/*
> +		 * Linger a bit, prior to the next control message
> +		 * or if return value is timeout, but do try few
> +		 * times (max 400ms) before quitting.
> +		 */
> +		if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
> +			msleep(200);
> +		else if (ret == -ETIMEDOUT)
> +			msleep(20);
> +
> +		/* Loop while timeout, max loops: retry_cnt times. */
> +	} while ((retry_cnt-- > 0) && (ret == -ETIMEDOUT));
>  
> -	/* Linger a bit, prior to the next control message. */
> -	if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
> -		msleep(200);
>  
>  	kfree(dr);

Johan
