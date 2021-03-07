Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E452E3304E3
	for <lists+linux-input@lfdr.de>; Sun,  7 Mar 2021 22:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhCGVs2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Mar 2021 16:48:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhCGVrL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Mar 2021 16:47:11 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA94BC06174A;
        Sun,  7 Mar 2021 13:47:10 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id h4so5149228pgf.13;
        Sun, 07 Mar 2021 13:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3B6siShC2ayMTKco0+z1NtZdv0XwsxfaVD6JNO12DmU=;
        b=JdNdGw/wZ+9sNlvZGgZE8k3YImQ3vFF2joCMrpDwCyvYCiGn/PKncm/HpXF8uRH7Si
         WB6m/Sjo++MKoX5/8j2gzlwiRbXj2gzCe4W8KSoCpG+Im0KUGpJZaNk+k+frkqKJBFKC
         Yo3ptRCSacg0GhUE6Pilr39BEK1e9ZLOMz56ne054+OAhU2QzGP4RTzw0XQQvxfi9cFI
         GH6bZiVcxrjyqfgZmy3J8nYIgXSdAZp01GGNFu9tgoUQoCf29Bki2KBXRy9bxTrMasXN
         1LspEEIJYJszP3zX+AFowaFaNdF+G+dqI1MeiKylIWngdq9YaQEElJ0KXQFlLzcliyep
         wwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3B6siShC2ayMTKco0+z1NtZdv0XwsxfaVD6JNO12DmU=;
        b=SQ/o8srpU0a2cz/N1PRdlyW0lCsqj9v3dsKLPEhxuHRbnjupSdvc6bK/25LsjrqHoh
         v064jTVxlFDeQRIximgwqSQfZ+EbbdyBwaXdJroGEUIXVxEuCqHy3/UTG/vBPmYzDO6E
         0QtsNsaqUZNc/CU5CeLCtUe/llPMaOewDfpOMBgUG8Pbf/kUnbpFy2/S76dEPRS9o4RR
         XnKTA3OpnArDUn07xqgOpMwCKZRV4nXWYfnubUyFrRpjcwkMDW6WhnlA22AjRfZLVIwl
         PdYQwxdQGvW9GxAcwtzeOU4pGAVDJ1ESZZimn4/cBlJqO8DraMGfoTdF++MTBLMvw9JO
         Uvcg==
X-Gm-Message-State: AOAM53156M6n03phxvTt5pVqSzZ2ZJ3t/k+Iy5lfGEp+wh4nRtcfCZBk
        nQnCa2K/BA6SHR3ksZjbYAM=
X-Google-Smtp-Source: ABdhPJw31pTckJKQMyWNpB9meF02ZSL4sNDBn6oqml+CLSMDkJ39dGORr4JcwM1Iqb0XnpSPMTKRKg==
X-Received: by 2002:a63:5549:: with SMTP id f9mr18659232pgm.28.1615153629968;
        Sun, 07 Mar 2021 13:47:09 -0800 (PST)
Received: from google.com ([2620:15c:202:201:bc9b:5ab2:d763:15bc])
        by smtp.gmail.com with ESMTPSA id k11sm7864307pfc.22.2021.03.07.13.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 13:47:08 -0800 (PST)
Date:   Sun, 7 Mar 2021 13:47:06 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] input: gpio-keys: Use hrtimer for software debounce
Message-ID: <YEVJ2l7zGhX3AryQ@google.com>
References: <20210305170111.214782-1-paul@crapouillou.net>
 <20210305170111.214782-3-paul@crapouillou.net>
 <YEJ57PuEyYknR3MF@google.com>
 <79IIPQ.DQ7JNXZ0OI5Q2@crapouillou.net>
 <YEU1irDqZJCdCS0o@google.com>
 <UUAMPQ.MF37I5G7AY0J2@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <UUAMPQ.MF37I5G7AY0J2@crapouillou.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 07, 2021 at 09:11:18PM +0000, Paul Cercueil wrote:
> Hi Dmitry,
> 
> Le dim. 7 mars 2021 à 12:20, Dmitry Torokhov <dmitry.torokhov@gmail.com> a
> écrit :
> > On Fri, Mar 05, 2021 at 08:00:43PM +0000, Paul Cercueil wrote:
> > >  Hi Dmitry,
> > > 
> > >  Le ven. 5 mars 2021 à 10:35, Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> a
> > >  écrit :
> > >  > Hi Paul,
> > >  >
> > >  > On Fri, Mar 05, 2021 at 05:01:11PM +0000, Paul Cercueil wrote:
> > >  > >  -static void gpio_keys_gpio_work_func(struct work_struct *work)
> > >  > >  +static enum hrtimer_restart gpio_keys_debounce_timer(struct
> > >  > > hrtimer *t)
> > >  > >   {
> > >  > >  -	struct gpio_button_data *bdata =
> > >  > >  -		container_of(work, struct gpio_button_data, work.work);
> > >  > >  +	struct gpio_button_data *bdata = container_of(t,
> > >  > >  +						      struct gpio_button_data,
> > >  > >  +						      debounce_timer);
> > >  > >
> > >  > >   	gpio_keys_gpio_report_event(bdata);
> > >  >
> > >  > I am not sure how this works. As far as I know, even
> > >  > HRTIMER_MODE_REL_SOFT do not allow sleeping in the timer
> > > handlers, and
> > >  > gpio_keys_gpio_report_event() use sleeping variant of GPIOD API
> > > (and
> > >  > that is not going to change).
> > > 
> > >  Quoting <linux/hrtimers.h>, the "timer callback will be executed in
> > > soft irq
> > >  context", so sleeping should be possible.
> > 
> > I am afraid you misunderstand what soft irq context is, as softirqs and
> > tasklets still run in interrupt context and therefore can not sleep,
> > only code running in process context may sleep.
> 
> I probably do. My understanding of "softirq" is that the callback runs in a
> threaded interrupt handler.

No, you are thinking about threaded interrupts, which are separate
beasts. Softirqs are traditional bottom halfs that run after exit of
hard interrupt, but still are non-preemptible so sleeping is not
allowed.

> 
> > You can test it yourself by sticking "msleep(1)" in
> > gpio_keys_debounce_timer() and see if you will get "scheduling while
> > atomic" in logs.
> 
> I tested it, it locks up.
> 
> > > 
> > >  But I guess in this case I can use HRTIMER_MODE_REL.
> > 
> > This changes selected clock source, but has no effect on whether timer
> > handler can sleep or not.
> > 
> > > 
> > >  > It seems to me that if you want to use software debounce in gpio
> > > keys
> > >  > driver you need to set up sufficiently high HZ for your system.
> > > Maybe we
> > >  > could thrown a warning when we see low debounce delay and low HZ
> > > to
> > >  > alert system developer.
> > > 
> > >  This is exactly what we should not do. I certainly don't want to
> > > have 250+
> > >  timer interrupts per second just so that input events aren't lost,
> > > to work
> > >  around a sucky debounce implementation. Besides, if you consider the
> > >  hrtimers doc (Documentation/timers/hrtimers.rst), hrtimers really
> > > are what
> > >  should be used here.
> > 
> > I explained why they can't. They could be if you restrict gpio_keys to
> > only be used with GPIOs that do not require sleep to read their state,
> > but I am not willing to accept such restriction. You either need to have
> > longer debounce, higher HZ, or see if you can use GPIO controller that
> > supports debounce handling. See also if you can enable dynamic
> > ticks/NO_HZ to limit number of timer interrupts on idle system.
> 
> We can also use the hrtimer approach if the GPIO doesn't require sleep, and
> fall back to the standard timer if it does. It's possible to detect that
> with gpiod_cansleep(). The diff would be pretty slim. Would you accept
> something like that?
> 
> Switching from HZ=250 to HZ=24 leads to a 3% overall performance increase
> across all apps on our system, so a pretty big optimization, and this is the
> only blocker.

Let me take a look at the updated patch and we will see.

Thanks.

-- 
Dmitry
