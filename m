Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 295B7137A4C
	for <lists+linux-input@lfdr.de>; Sat, 11 Jan 2020 00:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727542AbgAJXjt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 18:39:49 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40065 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727541AbgAJXjt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 18:39:49 -0500
Received: by mail-pf1-f194.google.com with SMTP id q8so1869470pfh.7;
        Fri, 10 Jan 2020 15:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=44y917WLdq58ocmQ2Lws4t8TAPMUMEf06qKa/NEI0S4=;
        b=faNHqQwGwynn/dgmKt3WYHFpm6uiw2H5QNzf8Mf78NiN4X6Erwrt44chrkNW3PTr/M
         69ZgnGTonbH/87YLyazDRFzosRf7QL84cJ+RhP7ZQBXOmEJRqmtV0M3yOjyiNrrusd9d
         J1YF8xOrAr4dqlG02RNErpMVBB+xLlRwWhtOtvICMFuE4+gtrUK07iiUEE3RsuHhke57
         SbLRnFzYUpTA7BJ+U7StG3VRzJb9Z6i/6NpQTwlnXHIprlv6EENxuHDT9Dw+sOYr6i+4
         uH0ej6nMkyWQ1oCkoWSXHktPENXAGQ1BZyMhoUPXLfImH2c+4PJAS4i+a5rplD3U84D3
         mtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=44y917WLdq58ocmQ2Lws4t8TAPMUMEf06qKa/NEI0S4=;
        b=PqR2ExDOMTnWqT7E0y0IYIOeJp5gHUAPnQAkBP0MG2dHUqVhnPCmIa+fY1jwQAsQWA
         mGN2V3mbpt1Aa/krbGjRCzKTM29QlQhu/9cjy3BFOPnfYY+Q+ujtEGm/UoP+i6n4PDTX
         g3sJPamky9FlNP72woxxQFdIYbvUe34cbFiQxgv6pimF1CdPuAsz60HUurpaxN/bk7nQ
         /2P6qhEdHfdYG6F+cuS0/cmReZMnQdw3pwI+WISvoNTJIQaPzrPuQ2ZLQmw8rzmZyMkw
         H43GfYBVWzSg/Skox2HXPtJoFepP+iHTuTtGXwE1xgOgsxvI8dA1JPfjHFJu6vqI/rMP
         aV5Q==
X-Gm-Message-State: APjAAAUz7Bkx2m4gvLz3WG9nc6k90TkQMNcWy0aIL19wqxYqBHkCC/y6
        TGQsl3VOVhguoHBdCvz1S4s=
X-Google-Smtp-Source: APXvYqzUqPssZI88/RttkJE4mzGnBEeajQSjv67oTTh/hplvPmWaIJqnu7TNCsoM6c7MDq0JSy69AQ==
X-Received: by 2002:a62:cdcb:: with SMTP id o194mr6850034pfg.117.1578699587626;
        Fri, 10 Jan 2020 15:39:47 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v13sm4349910pgc.54.2020.01.10.15.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 15:39:46 -0800 (PST)
Date:   Fri, 10 Jan 2020 15:39:44 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        info@metux.net, tglx@linutronix.de, m.felsch@pengutronix.de
Subject: Re: [PATCH] Input: ads7846: use new `delay` structure for SPI
 transfer delays
Message-ID: <20200110233944.GW8314@dtor-ws>
References: <20191210141103.15910-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210141103.15910-1-alexandru.ardelean@analog.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 10, 2019 at 04:11:03PM +0200, Alexandru Ardelean wrote:
> In a recent change to the SPI subsystem [1], a new `delay` struct was added
> to replace the `delay_usecs`. This change replaces the current `delay_usecs`
> with `delay` for this driver.
> 
> The `spi_transfer_delay_exec()` function [in the SPI framework] makes sure
> that both `delay_usecs` & `delay` are used (in this order to preserve
> backwards compatibility).
> 
> [1] commit bebcfd272df6485 ("spi: introduce `delay` field for
> `spi_transfer` + spi_transfer_delay_exec()")
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/ads7846.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
> index 51ddb204ca1b..8fd7fc39c4fd 100644
> --- a/drivers/input/touchscreen/ads7846.c
> +++ b/drivers/input/touchscreen/ads7846.c
> @@ -333,7 +333,8 @@ static int ads7846_read12_ser(struct device *dev, unsigned command)
>  		req->xfer[1].len = 2;
>  
>  		/* for 1uF, settle for 800 usec; no cap, 100 usec.  */
> -		req->xfer[1].delay_usecs = ts->vref_delay_usecs;
> +		req->xfer[1].delay.value = ts->vref_delay_usecs;
> +		req->xfer[1].delay.unit = SPI_DELAY_UNIT_USECS;
>  		spi_message_add_tail(&req->xfer[1], &req->msg);
>  
>  		/* Enable reference voltage */
> @@ -1018,7 +1019,8 @@ static void ads7846_setup_spi_msg(struct ads7846 *ts,
>  	 * have had enough time to stabilize.
>  	 */
>  	if (pdata->settle_delay_usecs) {
> -		x->delay_usecs = pdata->settle_delay_usecs;
> +		x->delay.value = pdata->settle_delay_usecs;
> +		x->delay.unit = SPI_DELAY_UNIT_USECS;
>  
>  		x++;
>  		x->tx_buf = &packet->read_y;
> @@ -1061,7 +1063,8 @@ static void ads7846_setup_spi_msg(struct ads7846 *ts,
>  
>  	/* ... maybe discard first sample ... */
>  	if (pdata->settle_delay_usecs) {
> -		x->delay_usecs = pdata->settle_delay_usecs;
> +		x->delay.value = pdata->settle_delay_usecs;
> +		x->delay.unit = SPI_DELAY_UNIT_USECS;
>  
>  		x++;
>  		x->tx_buf = &packet->read_x;
> @@ -1094,7 +1097,8 @@ static void ads7846_setup_spi_msg(struct ads7846 *ts,
>  
>  		/* ... maybe discard first sample ... */
>  		if (pdata->settle_delay_usecs) {
> -			x->delay_usecs = pdata->settle_delay_usecs;
> +			x->delay.value = pdata->settle_delay_usecs;
> +			x->delay.unit = SPI_DELAY_UNIT_USECS;
>  
>  			x++;
>  			x->tx_buf = &packet->read_z1;
> @@ -1125,7 +1129,8 @@ static void ads7846_setup_spi_msg(struct ads7846 *ts,
>  
>  		/* ... maybe discard first sample ... */
>  		if (pdata->settle_delay_usecs) {
> -			x->delay_usecs = pdata->settle_delay_usecs;
> +			x->delay.value = pdata->settle_delay_usecs;
> +			x->delay.unit = SPI_DELAY_UNIT_USECS;
>  
>  			x++;
>  			x->tx_buf = &packet->read_z2;
> -- 
> 2.20.1
> 

-- 
Dmitry
