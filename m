Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0924DDCDD
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2019 09:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbfD2Ha2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Apr 2019 03:30:28 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39460 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfD2Ha1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Apr 2019 03:30:27 -0400
Received: by mail-pf1-f193.google.com with SMTP id z26so1003073pfg.6
        for <linux-input@vger.kernel.org>; Mon, 29 Apr 2019 00:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hhmBm88IsvzT9nkkhX01PcmRDe+YXyWbLbLMXLoJuZM=;
        b=KWpdSVeqpYZ4uUWbPm7mHFBhdSZ7vH8S4MqYvRAUDyOJYfX1S0r/ou0wcuUI5jGwTH
         P15Q9OZNe9nOCsr7sY5tc8ys4Ieu9JO2FMFD1Zk3cTqpLevNEsykAtWpscPHnK7a7rll
         svMYpsWiDia5YYHWhjdVFCEh9awu8cXtNfJ7iHHQPeHIpFcIplYgW9o+/patwaL5ovga
         dU9GTNcEJM8z4KOKRWp9rii0tOT9AYd5qYUrpHTLCZEQP1fvD5wPfykF9JwglVanP7t+
         4CbcBtaXazyfm3AJ8/Tc1vDclRFgBTXdPjvbp2VvdX4Esb13EWgcw43pNQPYoxxVrEtj
         7s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hhmBm88IsvzT9nkkhX01PcmRDe+YXyWbLbLMXLoJuZM=;
        b=BK5e9mYmz2YC7FGfgOUZRP5wAn/1bqW0YQzSk78TVRmaaoNRtnUxlleqxrIKvT/Wxa
         obEvc7nqT8BM/ztCxWyqsPq0DC1n/zzrHWqCAj49lD1N7oc5wE20uZNTYhYHCSz/TvMh
         bEN62y2tzUek04jmJgxQyy+7TP3IVVD7QJiQNnYN64KkgVjzg39poBjbXjYVjjYKma4t
         oFaTciV2N8sVSQokNiRIioghKh98Jpue+N3dLL2tW/12p5jEIpolY7UDdjQOVLEx9IPd
         uKwb8qL/40dQqyT7TDuZ9yFsOnM8o0oDFPYczIDQw+0y8bC7mClERfIWosKg6UMzpzpK
         UAZA==
X-Gm-Message-State: APjAAAWDZJ5spsdJ4JpSRUWDjP3jrklMu8cH6vgPC1keq4Uw8QdnWWIT
        D0rghv2w3o8In8TEZ4F+rL8=
X-Google-Smtp-Source: APXvYqweRDTxxydKiJHtO/YCBHLJ4SccowYRMMg9iqbb8X2gPqzmno7c68/PrleDQIqX6T0MNtAM0A==
X-Received: by 2002:a65:5289:: with SMTP id y9mr31491390pgp.52.1556523026391;
        Mon, 29 Apr 2019 00:30:26 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id m2sm12745210pfi.24.2019.04.29.00.30.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 00:30:25 -0700 (PDT)
Date:   Mon, 29 Apr 2019 00:30:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/2] input: touch: eeti: move ISR code to own function
Message-ID: <20190429073023.GA191900@dtor-ws>
References: <20190429063038.17773-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429063038.17773-1-daniel@zonque.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 29, 2019 at 08:30:37AM +0200, Daniel Mack wrote:
> Move the ISR handling code to its own function and change the logic to bail
> immediately in case of .running is false or if the attn_gpio is available
> but unasserted.
> 
> This allows us to call the function at any time to check for the state of
> attn_gpio.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
> v3: break out at the end of the loop for setups with !eeti->attn_gpio
> 
>  drivers/input/touchscreen/eeti_ts.c | 33 ++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
> index 7fe41965c5d1..67c54413ad2b 100644
> --- a/drivers/input/touchscreen/eeti_ts.c
> +++ b/drivers/input/touchscreen/eeti_ts.c
> @@ -75,14 +75,19 @@ static void eeti_ts_report_event(struct eeti_ts *eeti, u8 *buf)
>  	input_sync(eeti->input);
>  }
>  
> -static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
> +static void eeti_ts_read(struct eeti_ts *eeti)
>  {
> -	struct eeti_ts *eeti = dev_id;
> -	int len;
> -	int error;
> +	int len, error;
>  	char buf[6];
>  
> -	do {
> +	for (;;) {
> +		if (!eeti->running)
> +			break;
> +
> +		if (eeti->attn_gpio &&
> +		    gpiod_get_value_cansleep(eeti->attn_gpio) == 0)
> +			break;
> +

This became a bit messy IMO. Maybe we should define eeti_ts_read as only
the code below (up to while) and from resume do:

	if (!eeti->attn_gpio || gpiod_get_value_cansleep(eeti->attn_gpio))
		eeti_ts_read(eeti);

>  		len = i2c_master_recv(eeti->client, buf, sizeof(buf));
>  		if (len != sizeof(buf)) {
>  			error = len < 0 ? len : -EIO;
> @@ -92,12 +97,20 @@ static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
>  			break;
>  		}
>  
> -		if (buf[0] & 0x80) {
> -			/* Motion packet */
> +		/* Motion packet */
> +		if (buf[0] & 0x80)
>  			eeti_ts_report_event(eeti, buf);
> -		}
> -	} while (eeti->running &&
> -		 eeti->attn_gpio && gpiod_get_value_cansleep(eeti->attn_gpio));
> +
> +		if (!eeti->attn_gpio)
> +			break;
> +	}
> +}
> +
> +static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
> +{
> +	struct eeti_ts *eeti = dev_id;
> +
> +	eeti_ts_read(eeti);
>  
>  	return IRQ_HANDLED;
>  }
> -- 
> 2.20.1
> 

Thanks.

-- 
Dmitry
