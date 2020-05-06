Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC811C64D4
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 02:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgEFAFn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 20:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728717AbgEFAFm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 May 2020 20:05:42 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FAC6C061A0F
        for <linux-input@vger.kernel.org>; Tue,  5 May 2020 17:05:42 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y25so101362pfn.5
        for <linux-input@vger.kernel.org>; Tue, 05 May 2020 17:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SfxkLVXg5ma5bOxreXlqDcfREq3JZjSJDIA5OtJan24=;
        b=BiZP6GhrSTiGfUQvw8n2b2tDfUmMM8D0frZ5dJ0nbMjHywzKELXKHUyMMPK77n7d2s
         0NZq1RggFlhzNV6RLBjJb/wo7AEw5NC36Inb5NWxtBFJ6au0N4xKWkDtvnPrydBpkTE2
         JfO/pYsZPM1N19MBApOFa6IubIxjE1lwrJ8CEDndQOy0KG8wt0yL/ofC1uWmIqVdLbok
         VQltYtR3ui8PuzLwzKsYf9c++rphKaZmTwnXQPgzWeQtsf/zslvGJbKYf/zTLZcEN8no
         82BKAJBXfq8SIU6J4hm0CIycl9EPTXhwvPXHdLBetNkLDQ0zt2PQRKSQBQvLFcd6VoJh
         Di9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SfxkLVXg5ma5bOxreXlqDcfREq3JZjSJDIA5OtJan24=;
        b=MYAYDZbRKW7Pm78SLPaIg5qpj9woHjVAZyEwymwB6A917LC8gXf9G+rLmJpMzuAsdh
         w4d77qGltNtVO9EivUjJXWI8RZcOp7ADU+wgIDvT6OrtUssAzPY0ni+gZzrEJUnUcgf2
         jymucxf4w7k1wWTjzA/6XegXhUdsKPfrWlvYImuSmdGxzglaftARLItsPZ7r6ZKWu4bs
         VO7ialKQOwdOjmUbzSZFnPFOHFo49bVwEHYvN7LhJtTRcC8OcpfS4W/IVJPyZtUCsl7w
         ONYZPzAzoK96tLo6zAKWOk1i8zdD64jsh6nvHb8hEOMemX9sn5zveeU/lM2DhjXdnhrc
         mRHQ==
X-Gm-Message-State: AGi0PuYtlvp96pIHbv2R/oatKQFPlOPxmnt7IOHw8A+iDceQbZECJZOO
        FPQfQtl7IB2yKZvCGPX/DzY=
X-Google-Smtp-Source: APiQypKAJb7CBAWYaLOrEF8w+BaX9p0NsNXlENYDWmi8arLF367IEI7v+UUa9GoNtAmnSg0YgzkpgQ==
X-Received: by 2002:aa7:82c9:: with SMTP id f9mr5621888pfn.258.1588723541780;
        Tue, 05 May 2020 17:05:41 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id w69sm132783pff.168.2020.05.05.17.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 17:05:41 -0700 (PDT)
Date:   Tue, 5 May 2020 17:05:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Daniel Mack <daniel@zonque.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/3] input: touch: ads7846: switch to devm
 initialization
Message-ID: <20200506000539.GA70193@dtor-ws>
References: <20200504173745.1246505-1-daniel@zonque.org>
 <20200504173745.1246505-2-daniel@zonque.org>
 <20200505083701.GB18755@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505083701.GB18755@pengutronix.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 05, 2020 at 10:37:01AM +0200, Marco Felsch wrote:
> On 20-05-04 19:37, Daniel Mack wrote:
> > @@ -1488,30 +1472,11 @@ static int ads7846_remove(struct spi_device *spi)
> >  	struct ads7846 *ts = spi_get_drvdata(spi);
> >  
> >  	sysfs_remove_group(&spi->dev.kobj, &ads784x_attr_group);
> > -
> >  	ads7846_disable(ts);
> > -	free_irq(ts->spi->irq, ts);
> > -
> > -	input_unregister_device(ts->input);
> > -
> > -	ads784x_hwmon_unregister(spi, ts);
> > -
> > -	regulator_put(ts->reg);
> > -
> > -	if (!ts->get_pendown_state) {
> > -		/*
> > -		 * If we are not using specialized pendown method we must
> > -		 * have been relying on gpio we set up ourselves.
> > -		 */
> > -		gpio_free(ts->gpio_pendown);
> > -	}
> >  
> >  	if (ts->filter_cleanup)
> >  		ts->filter_cleanup(ts->filter_data);

This makes filter_cleanup() be called much earlier now, before we free
interrupt, unregister input device, etc.

I am very concerned with mixing manual unwinding and devm and would
very much prefer if everything would be converted to devm.

> >  
> > -	kfree(ts->packet);
> > -	kfree(ts);
> > -
> >  	dev_dbg(&spi->dev, "unregistered touchscreen\n");
> >  
> >  	return 0;
> > -- 
> > 2.26.2
> > 

Thanks.

-- 
Dmitry
