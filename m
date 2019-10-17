Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E639BDB570
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 20:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438060AbfJQSEI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 14:04:08 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33088 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437870AbfJQSEH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 14:04:07 -0400
Received: by mail-pl1-f193.google.com with SMTP id d22so1508348pls.0;
        Thu, 17 Oct 2019 11:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PjpeFH0khloduhmb/CpFRelBfRsXgekIyr3a4ZRVvwI=;
        b=sfG14CfFc+iEXFB+dffqcIIdJBvG9ejR+sa5wvX6n47doLtTBBYlE1lBwB98z95IZH
         W1sck/NiiRvctZrD8nrhgIjOWTcKR5EG6mFQSG2fD0wVl/WUKo+GKbSfA4ato6Mdyau5
         UXzpX8B4c2ZjTjfNKHnhzBL+/wMwcP9IHxVOEdfgK3BIkWSA1dCX3A//u5rvrGVcwEEU
         8dDaw26jXODHAlA69ywEA1MnEYHPeeDQQfMsvRaqo5KMmnidYFx9drTZ9zN8na3KCeDf
         rOKOxY3XXaq+9Fh/RPKab3qSQfvHrFVlMwHAEcehqS6gmZsqER+1qROvasKkoLCIIcgM
         lUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PjpeFH0khloduhmb/CpFRelBfRsXgekIyr3a4ZRVvwI=;
        b=H0B9/QCCC/P8K2HGaUHpUNkr/ytGXMFC7gkPDU0MJZxFAtWnWnjPDavfrGKMy4bATp
         76VYFp6igAQDL0YEB4Sgz9eKr2lJBfWs7rMJby3Ls9zA3y9IIuNBoiW3VUv8+dJugRvs
         ectKJoGNRj+/JWZyz3hJhcK6UpkpIqk4vheckmq12QartbcbB/OIufQVCsXAXIbjkKgy
         IvgD5q7m90Bm9vDV6sDtfTDUdv7Y9rj40d2HvnzmfIfNUgkqqKHraca8vIy6O/3m+PJ2
         +np9zeQj4QhJ79g4NnwcVqVTrt8qJIoVIeCM08kcfPxgvds2c0r1jbAi/V/7zr5VS4tb
         ojtw==
X-Gm-Message-State: APjAAAVCIaaxio1/6W8OdyxBYjLZD8sq+WEMXw8JjoM78Wtg+qYR1swx
        y5w12fg1ZXFqrFfxZkY9egmds0pz
X-Google-Smtp-Source: APXvYqy6+Cg3qqta6ZHoEk9LUEbZNx49aKBF1dpCpqdloTKLgpkBNtUtD0CIAsjMUM4mgd4Xzn5ljg==
X-Received: by 2002:a17:902:8d8e:: with SMTP id v14mr5310185plo.287.1571335446860;
        Thu, 17 Oct 2019 11:04:06 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 69sm3549756pgh.47.2019.10.17.11.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 11:04:06 -0700 (PDT)
Date:   Thu, 17 Oct 2019 11:04:03 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrew Duggan <aduggan@synaptics.com>
Cc:     Evan Green <evgreen@chromium.org>, Pan Bian <bianpan2016@163.com>,
        Allison Randal <allison@lohutok.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nick Dyer <nick@shmanahar.org>,
        Christopher Heiny <Cheiny@synaptics.com>
Subject: Re: [PATCH] Input: synaptics-rmi4 - Avoid processing unknown IRQs
Message-ID: <20191017180403.GK35946@dtor-ws>
References: <20191008223657.163366-1-evgreen@chromium.org>
 <a6e517a2-51ca-431a-88f8-8bfa0a867dc6@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6e517a2-51ca-431a-88f8-8bfa0a867dc6@synaptics.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 11, 2019 at 09:46:56PM +0000, Andrew Duggan wrote:
> Hi Evan,
> 
> On 10/8/19 3:36 PM, Evan Green wrote:
> > rmi_process_interrupt_requests() calls handle_nested_irq() for
> > each interrupt status bit it finds. If the irq domain mapping for
> > this bit had not yet been set up, then it ends up calling
> > handle_nested_irq(0), which causes a NULL pointer dereference.
> >
> > There's already code that masks the irq_status bits coming out of the
> > hardware with current_irq_mask, presumably to avoid this situation.
> > However current_irq_mask seems to more reflect the actual mask set
> > in the hardware rather than the IRQs software has set up and registered
> > for. For example, in rmi_driver_reset_handler(), the current_irq_mask
> > is initialized based on what is read from the hardware. If the reset
> > value of this mask enables IRQs that Linux has not set up yet, then
> > we end up in this situation.
> >
> > There appears to be a third unused bitmask that used to serve this
> > purpose, fn_irq_bits. Use that bitmask instead of current_irq_mask
> > to avoid calling handle_nested_irq() on IRQs that have not yet been
> > set up.
> 
> Yes, it looks like the code which ensured that there was a function 
> handler to handle the IRQ was removed when the driver switched to using 
> an irq domain. Setting the fn_irq_bits and using them instead of 
> current_irq_mask in rmi_process_interrupt_requests() makes sense to me.
> 
> Andrew
> 
> > Signed-off-by: Evan Green <evgreen@chromium.org>
> Reviewed-by: Andrew Duggan <aduggan@synaptics.com>

Applied, thank you.

> > ---
> >
> >   drivers/input/rmi4/rmi_driver.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
> > index 772493b1f665..190b9974526b 100644
> > --- a/drivers/input/rmi4/rmi_driver.c
> > +++ b/drivers/input/rmi4/rmi_driver.c
> > @@ -146,7 +146,7 @@ static int rmi_process_interrupt_requests(struct rmi_device *rmi_dev)
> >   	}
> >   
> >   	mutex_lock(&data->irq_mutex);
> > -	bitmap_and(data->irq_status, data->irq_status, data->current_irq_mask,
> > +	bitmap_and(data->irq_status, data->irq_status, data->fn_irq_bits,
> >   	       data->irq_count);
> >   	/*
> >   	 * At this point, irq_status has all bits that are set in the
> > @@ -385,6 +385,8 @@ static int rmi_driver_set_irq_bits(struct rmi_device *rmi_dev,
> >   	bitmap_copy(data->current_irq_mask, data->new_irq_mask,
> >   		    data->num_of_irq_regs);
> >   
> > +	bitmap_or(data->fn_irq_bits, data->fn_irq_bits, mask, data->irq_count);
> > +
> >   error_unlock:
> >   	mutex_unlock(&data->irq_mutex);
> >   	return error;
> > @@ -398,6 +400,8 @@ static int rmi_driver_clear_irq_bits(struct rmi_device *rmi_dev,
> >   	struct device *dev = &rmi_dev->dev;
> >   
> >   	mutex_lock(&data->irq_mutex);
> > +	bitmap_andnot(data->fn_irq_bits,
> > +		      data->fn_irq_bits, mask, data->irq_count);
> >   	bitmap_andnot(data->new_irq_mask,
> >   		  data->current_irq_mask, mask, data->irq_count);
> >   

-- 
Dmitry
