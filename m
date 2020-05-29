Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765AC1E88B0
	for <lists+linux-input@lfdr.de>; Fri, 29 May 2020 22:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726966AbgE2UO2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 May 2020 16:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbgE2UO2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 May 2020 16:14:28 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50ECEC03E969;
        Fri, 29 May 2020 13:14:27 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t16so1666793plo.7;
        Fri, 29 May 2020 13:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gwodJBChdGKyL7PUJtWDxlkfoJo0J3RohjY3HTDpfe4=;
        b=fMeh6Hpu602J6Dz1PU9I7r79dwI9opLkbAMtwq3yxDr4a5/ezphEUvepwwZKGz0Gt7
         i6g2DpWYycF2/YiM1/zn9beKx34MTb8DIwwLp2kNFZcdRpEsi/sMaReSHLsumiLdwSvV
         7tK6GxdKzjGYbVvzlSRS7u4sA8IRzmUbIxh4AaFfEsrpZ8ljhit17LUyefNTdZzJ76r0
         qcSu2Rq+OVtfnh/uyqKnFv2PLQWFE+ObcH58pxMTF8W8B+ceJOfBhnNzg5ONmXwHN66n
         +T/UjmHBxNgfGaWJnH1HxygkCPJqP4p1DZztO0L/o+lcRrle9mSfPs9ysMXmOmEqkX0x
         eM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=gwodJBChdGKyL7PUJtWDxlkfoJo0J3RohjY3HTDpfe4=;
        b=dN3RC89ySHLRym9EPKmCYaKWMwgsSSrDY5wD0hVKXo/xa2p//3V5VKrTqzL5gKitq1
         LeQypW0HAfjaHBzScVN2oTthwuDP9EILqrkRog8CqEwJA1fg5BFzGqSeST6nA/9dP41k
         0ZTXK1HDl7jaG4tQ30LoEiK05Nw5nh6Jwmug20ZQCAAhgeTUqbM1pprxqupxuy9t+e8S
         s/EB2W5KeGqinchHBptML1OC7mr+7D8jomvOqcq46YqNihhOGkn/AS/VxDiXvLFvpsn+
         X+6h3k0ZMP1eDBeoxfKwkmj6pCqAKi0H6PnCPPR+79zA73lXgEyw8j11NYfIn5N0sa3e
         jCNw==
X-Gm-Message-State: AOAM530bgLMQAzenkOFwuB6SpJgPalX+E/N7KKQEm+zbqMJeW3lEIShq
        x2vhChQKJ2mPtXVQvolB/OY=
X-Google-Smtp-Source: ABdhPJz8FeU+qcN2XMjIm/YgSWs93WWo4kswOQ3IYLZeYyLqGWmNakujHQwW9U2PZk9lt6iF1970yA==
X-Received: by 2002:a17:902:9689:: with SMTP id n9mr4957643plp.41.1590783266576;
        Fri, 29 May 2020 13:14:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o14sm8065689pfp.89.2020.05.29.13.14.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 13:14:26 -0700 (PDT)
Date:   Fri, 29 May 2020 13:14:24 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        groeck@chromium.org, Nicolas Boichat <drinkcat@chromium.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: do not sleep when opening device
Message-ID: <20200529201424.GA180211@roeck-us.net>
References: <20200529195951.GA3767@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529195951.GA3767@dtor-ws>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 29, 2020 at 12:59:51PM -0700, Dmitry Torokhov wrote:
> usbhid tries to give the device 50 milliseconds to drain its queues
> when opening the device, but does it naively by simply sleeping in open
> handler, which slows down device probing (and thus may affect overall
> boot time).
> 
> However we do not need to sleep as we can instead mark a point of time
> in the future when we should start processing the events.
> 
> Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/hid/usbhid/hid-core.c | 27 +++++++++++++++------------
>  drivers/hid/usbhid/usbhid.h   |  1 +
>  2 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index c7bc9db5b192..e69992e945b2 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -95,6 +95,19 @@ static int hid_start_in(struct hid_device *hid)
>  				set_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
>  		} else {
>  			clear_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> +
> +			if (test_and_clear_bit(HID_RESUME_RUNNING,
> +					       &usbhid->iofl)) {
> +				/*
> +				 * In case events are generated while nobody was
> +				 * listening, some are released when the device
> +				 * is re-opened. Wait 50 msec for the queue to
> +				 * empty before allowing events to go through
> +				 * hid.
> +				 */
> +				usbhid->input_start_time = jiffies +
> +							   msecs_to_jiffies(50);
> +			}
>  		}
>  	}
>  	spin_unlock_irqrestore(&usbhid->lock, flags);
> @@ -280,7 +293,8 @@ static void hid_irq_in(struct urb *urb)
>  		if (!test_bit(HID_OPENED, &usbhid->iofl))
>  			break;
>  		usbhid_mark_busy(usbhid);
> -		if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> +		if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl) &&
> +		    time_after(jiffies, usbhid->input_start_time)) {
>  			hid_input_report(urb->context, HID_INPUT_REPORT,
>  					 urb->transfer_buffer,
>  					 urb->actual_length, 1);
> @@ -714,17 +728,6 @@ static int usbhid_open(struct hid_device *hid)
>  	}
>  
>  	usb_autopm_put_interface(usbhid->intf);
> -
> -	/*
> -	 * In case events are generated while nobody was listening,
> -	 * some are released when the device is re-opened.
> -	 * Wait 50 msec for the queue to empty before allowing events
> -	 * to go through hid.
> -	 */
> -	if (res == 0)
> -		msleep(50);
> -
Can you just set usbhid->input_start_time here ?
	if (res == 0)
		usbhid->input_start_time = jiffies + msecs_to_jiffies(50);
	clear_bit(HID_RESUME_RUNNING, &usbhid->iofl);

Then you might not need the added code in hid_start_in().

Thanks,
Guenter

> -	clear_bit(HID_RESUME_RUNNING, &usbhid->iofl);
>  	return res;
>  }
>  
> diff --git a/drivers/hid/usbhid/usbhid.h b/drivers/hid/usbhid/usbhid.h
> index 8620408bd7af..805949671b96 100644
> --- a/drivers/hid/usbhid/usbhid.h
> +++ b/drivers/hid/usbhid/usbhid.h
> @@ -82,6 +82,7 @@ struct usbhid_device {
>  
>  	spinlock_t lock;						/* fifo spinlock */
>  	unsigned long iofl;                                             /* I/O flags (CTRL_RUNNING, OUT_RUNNING) */
> +	unsigned long input_start_time;					/* When to start handling input, in jiffies */
>  	struct timer_list io_retry;                                     /* Retry timer */
>  	unsigned long stop_retry;                                       /* Time to give up, in jiffies */
>  	unsigned int retry_delay;                                       /* Delay length in ms */
> -- 
> 2.27.0.rc0.183.gde8f92d652-goog
> 
> 
> -- 
> Dmitry
