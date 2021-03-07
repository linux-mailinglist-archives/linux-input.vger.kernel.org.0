Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F58D330474
	for <lists+linux-input@lfdr.de>; Sun,  7 Mar 2021 21:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbhCGUUr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Mar 2021 15:20:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231934AbhCGUUd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Mar 2021 15:20:33 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84F2C06174A;
        Sun,  7 Mar 2021 12:20:32 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id n10so5055809pgl.10;
        Sun, 07 Mar 2021 12:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4DYXlEm3VC9OD5Mq2psxGqHwZT4VIzX/ZOuTMfQE0ok=;
        b=p3FcD1v6uR2Dct7P8PRM4yV1hYUQL7hquVxcZPOljAQV1eSOpnW6EneUEhVGATkgYw
         VqJJRGKxTJB+Tgy8+/VUCCQtnCESaOHVLnbUzTriyr0ucCdPCfkJ2ZWcTkdYCaCV1IVH
         ZNF5dXhzzK+AjXfQYorTDErOvY1jc5/MSIWNEAucYbYonlCosCNjFYa79EgaX6iiMqC8
         q8lEjYKWuQiYqqOJTe8Z9VEADm70RQPkYrA1Kbysyt/9Kl00RXQaN8goc7MoW1WsLeCh
         xAPo7OzY5bhklC7AGTbB27hcxeIAXCKKOZu/E9no9KNBFMhZfzGHY7Um0293z03SxiRf
         CHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4DYXlEm3VC9OD5Mq2psxGqHwZT4VIzX/ZOuTMfQE0ok=;
        b=N4MWAMp2OGAd6XDcHP9MkoINhR8p4Rw2gid7fmlvZ9udiqPxWb72aUQYYNSpqiG4qg
         ZkyX423fPsYcP4Z5H1XKHmzrpfR0GyrfNn2jsEWFut+ZeJX22jgFwnjG92ZKNnrr8EnH
         ZOBUwUkEFhE8Iz7tyC9frU36aK7ruYq7Dua8pPQz1OflRA9Tw9ZYRwSGDultS/vEZcFq
         K/CowAdsDGUT3cQ1cCmhoXCZnIvuCP7HK3Kj6hyrmfrawumepK1QnIP6FNKmiXNxnEZQ
         fmYNWAhwo+LFaVx0ypkYgwwuV2CVzCcOo+T6Gv81A5JVmT5dN5GXU9ON7SLNNHlEzJB7
         eCLg==
X-Gm-Message-State: AOAM531PGFCcCLV1Q8AuCoClTtyXKi9yc6PNI9047z5Ow+b/+t1wCR79
        dlv2TxNMsulHpFHFeWjjtFKbYZyI1vI=
X-Google-Smtp-Source: ABdhPJwrfMSXItslW7yrNpii5+Db5tmgoT40w7+ahllusF9Gu8E9pXWodLZTFff8Vw0neR/sub1heQ==
X-Received: by 2002:a65:6441:: with SMTP id s1mr17700035pgv.368.1615148432197;
        Sun, 07 Mar 2021 12:20:32 -0800 (PST)
Received: from google.com ([2620:15c:202:201:bc9b:5ab2:d763:15bc])
        by smtp.gmail.com with ESMTPSA id co20sm4102671pjb.32.2021.03.07.12.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 12:20:30 -0800 (PST)
Date:   Sun, 7 Mar 2021 12:20:26 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] input: gpio-keys: Use hrtimer for software debounce
Message-ID: <YEU1irDqZJCdCS0o@google.com>
References: <20210305170111.214782-1-paul@crapouillou.net>
 <20210305170111.214782-3-paul@crapouillou.net>
 <YEJ57PuEyYknR3MF@google.com>
 <79IIPQ.DQ7JNXZ0OI5Q2@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79IIPQ.DQ7JNXZ0OI5Q2@crapouillou.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 05, 2021 at 08:00:43PM +0000, Paul Cercueil wrote:
> Hi Dmitry,
> 
> Le ven. 5 mars 2021 à 10:35, Dmitry Torokhov <dmitry.torokhov@gmail.com> a
> écrit :
> > Hi Paul,
> > 
> > On Fri, Mar 05, 2021 at 05:01:11PM +0000, Paul Cercueil wrote:
> > >  -static void gpio_keys_gpio_work_func(struct work_struct *work)
> > >  +static enum hrtimer_restart gpio_keys_debounce_timer(struct
> > > hrtimer *t)
> > >   {
> > >  -	struct gpio_button_data *bdata =
> > >  -		container_of(work, struct gpio_button_data, work.work);
> > >  +	struct gpio_button_data *bdata = container_of(t,
> > >  +						      struct gpio_button_data,
> > >  +						      debounce_timer);
> > > 
> > >   	gpio_keys_gpio_report_event(bdata);
> > 
> > I am not sure how this works. As far as I know, even
> > HRTIMER_MODE_REL_SOFT do not allow sleeping in the timer handlers, and
> > gpio_keys_gpio_report_event() use sleeping variant of GPIOD API (and
> > that is not going to change).
> 
> Quoting <linux/hrtimers.h>, the "timer callback will be executed in soft irq
> context", so sleeping should be possible.

I am afraid you misunderstand what soft irq context is, as softirqs and
tasklets still run in interrupt context and therefore can not sleep,
only code running in process context may sleep.

You can test it yourself by sticking "msleep(1)" in
gpio_keys_debounce_timer() and see if you will get "scheduling while
atomic" in logs.

> 
> But I guess in this case I can use HRTIMER_MODE_REL.

This changes selected clock source, but has no effect on whether timer
handler can sleep or not.

> 
> > It seems to me that if you want to use software debounce in gpio keys
> > driver you need to set up sufficiently high HZ for your system. Maybe we
> > could thrown a warning when we see low debounce delay and low HZ to
> > alert system developer.
> 
> This is exactly what we should not do. I certainly don't want to have 250+
> timer interrupts per second just so that input events aren't lost, to work
> around a sucky debounce implementation. Besides, if you consider the
> hrtimers doc (Documentation/timers/hrtimers.rst), hrtimers really are what
> should be used here.

I explained why they can't. They could be if you restrict gpio_keys to
only be used with GPIOs that do not require sleep to read their state,
but I am not willing to accept such restriction. You either need to have
longer debounce, higher HZ, or see if you can use GPIO controller that
supports debounce handling. See also if you can enable dynamic
ticks/NO_HZ to limit number of timer interrupts on idle system.

Thanks.

-- 
Dmitry
