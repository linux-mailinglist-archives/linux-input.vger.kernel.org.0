Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1FEEF1A4
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 01:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387399AbfKEAED (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 19:04:03 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44497 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387394AbfKEAED (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 19:04:03 -0500
Received: by mail-pf1-f194.google.com with SMTP id q26so13731832pfn.11
        for <linux-input@vger.kernel.org>; Mon, 04 Nov 2019 16:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4FyWZlNrN/bH7vbFCEcNs2L9LUdfh+Hb2mhp1uWjlF0=;
        b=Pc4ujORQRso5MmSAMfxJLK6PFG0lo/U2t1Cf+XvEvoNpi5/FpP0drn9KY+zIjuRZlh
         D/BOarBUHcItyDjMqKulXsAoQ2EIkeVE0IE87PVxGcSYVaYfMv5QCi7t8KJ7QLFGotd0
         4oZNSf41dUEvTf6+X/dM1wRaswgNMfjOPqQTkK8KpVW0YNFCpL+wVbtHGSCIoBeQONmq
         h5NMM5s3Qo8BNPZcszmwo8qkYKDyNRSZ8Ec7SslOm2Aj5ttDMg/4d97SgcZDUQVsS+Ze
         TD2sZ8Cr7/2da79dyT2Ftit2kKqUgKVQFnusfwpyFImQEvb8trCEphUeann7OKuBR6+a
         0iUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4FyWZlNrN/bH7vbFCEcNs2L9LUdfh+Hb2mhp1uWjlF0=;
        b=RzTC20tOVX2Alkva7qcmzOYsHgrg2VUXehVWM483xMX0p+2QkdT4US1ra6k/Mt2HkM
         a8NLx6oSlw5HSqw5ggJb60krS8lzZW3opys5BSNab4bU+HOuQg0Kc+viHCNwfsyJwel/
         Hn5UmAtLEcTRXql3m9TSFSIbJ0DhCqoPYoff+lw6eauo+IZKEdyKURElflujhwk9C1Oy
         aA2yoKMVTrjgHXTwNxB0rHLjfP1r6tyT+WP1Os80lYFGGRixKmkQn8c6kkq1TZTbMNlB
         FwFQMHUW34pTUkQ+x9Z6hMzBP0WvKmA9cabaXWGhTDvsc8qff/2CwzHLyemQnhzOKAB5
         pSOw==
X-Gm-Message-State: APjAAAXTclWl0rWmAcHv/dJDY3MMKwl4SHzSEM90JtrK/F1HRbiqVM7k
        5LshMLc81DfpeM+tQ//D6NY=
X-Google-Smtp-Source: APXvYqy13jqWgdpwBClkykKDJ3WE72r3g8SU1Q0TSikRSeOjcy7umJOuxPyO7EdCf5adfd4u9GT60g==
X-Received: by 2002:a62:ce85:: with SMTP id y127mr842422pfg.197.1572912242520;
        Mon, 04 Nov 2019 16:04:02 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id e198sm19385040pfh.83.2019.11.04.16.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 16:04:01 -0800 (PST)
Date:   Mon, 4 Nov 2019 16:03:59 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de
Subject: Re: [PATCH resend 2/3] Input: synaptics-rmi4 - add dummy F54
 attention handler
Message-ID: <20191105000359.GS57214@dtor-ws>
References: <20191104114454.10500-1-l.stach@pengutronix.de>
 <20191104114454.10500-2-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104114454.10500-2-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 04, 2019 at 12:44:53PM +0100, Lucas Stach wrote:
> F54 is IRQ capable, even if it is not used in the current driver
> implementation. The common driver code in rmi_create_function_irq always
> installs a irq handler for functions that are IRQ capable. Without a
> assigned attention handler, this means a NULL pointer being passed as
> the nested IRQ handler. This seems to work with some architecture
> implementations, but crashes on others like ARM64.
> 
> Don't rely on implementation defined behavior and actually install
> a proper attention handler.

Instead of supplying dummy IRQ handler, can't we simply disable relevant
interrupts bits?

> 
> Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution
>                       to irq_domain")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/input/rmi4/rmi_f54.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
> index 4841354af0d7..22390e89c680 100644
> --- a/drivers/input/rmi4/rmi_f54.c
> +++ b/drivers/input/rmi4/rmi_f54.c
> @@ -732,6 +732,11 @@ static void rmi_f54_remove(struct rmi_function *fn)
>  	v4l2_device_unregister(&f54->v4l2);
>  }
>  
> +static irqreturn_t rmi_f54_attention(int irq, void *ctx)
> +{
> +	return IRQ_HANDLED;
> +}
> +
>  struct rmi_function_handler rmi_f54_handler = {
>  	.driver = {
>  		.name = F54_NAME,
> @@ -740,4 +745,5 @@ struct rmi_function_handler rmi_f54_handler = {
>  	.probe = rmi_f54_probe,
>  	.config = rmi_f54_config,
>  	.remove = rmi_f54_remove,
> +	.attention = rmi_f54_attention,
>  };
> -- 
> 2.20.1
> 

Thanks.

-- 
Dmitry
