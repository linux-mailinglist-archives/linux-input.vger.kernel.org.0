Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 991184FA6F
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2019 07:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbfFWF7n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jun 2019 01:59:43 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45284 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFWF7n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jun 2019 01:59:43 -0400
Received: by mail-pg1-f195.google.com with SMTP id z19so2392956pgl.12;
        Sat, 22 Jun 2019 22:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TRsJBJ+b2h9hoTlcKSaQA1RdNR6UyuxgQKyZTUz5YGQ=;
        b=MOcnQlgZGf4ZwRfZdThPoCPlQVxzwKy8P8t0OcjBi6zjFuzSHFQIRRgoAmZ0WzAmYw
         4d5NEiL79jl5+RlESbcPcrERWpa9+navxhBGEFFNf7uC3rRHnY3MtrxGV38s2FSoXnrf
         oGoOYM0TAIuWoKg2fQxPYWfMArw8/DPmhe0551DPOeV7UndZUSqXSCWY/1wMyTWzvR7u
         thu9PltoVwTVcW+hmftT6tE+Lo16V0bT9x19w2SdtgdY30RQQhlklnxqW6VT1WkbqBKB
         UOofQxAkpnbJ6qKCuC0r494cs32IxqN+2r4T8JmigjltAbjutxELJIZsatZa5I788nS7
         s/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TRsJBJ+b2h9hoTlcKSaQA1RdNR6UyuxgQKyZTUz5YGQ=;
        b=UljDe7JjffcoEnDBpNq5NjJw5j19QA39hX9UMBjCOTJXKOKdSq9PYSSjcAFGYbY4XL
         3cIUBpUMPVC8Rcts+w1sJGSMw0N85ZpB6ZSO9c+U6K56cVcRC2xAjndui58krUlWq0x5
         lYB7et4ku/0mCWT2uBcnhM+SVafR0e57M16H7jitevWp8QPY8da60OiDxSL5d7+Ee+If
         PA7PwlN7kfHFMy9elnyD17ieojSZyaU1AwECl7Zlj7mIRzAE9T5ZVPKquvUKQcR7T6KT
         ik6sIaroY+y/txkL/svxm7jNChbXZmpFrAn/8rvHJWL0Xrfet9qzJryAnfpmN/3IkDYq
         JHWQ==
X-Gm-Message-State: APjAAAWyFUZUVqb79dhIN2U0kbnplAtvxkFiH4+NygOTC/F8F/YaycOo
        ooWcqrMwaFmDi8ykozPqCE0xwwuO
X-Google-Smtp-Source: APXvYqyLCpof1dXxOQI9ZYS2M6tKS5ViBR+XRg4MnTxljhYsnsLJchv0vMrNAqNj1etSR+kgnES9ew==
X-Received: by 2002:a63:a61:: with SMTP id z33mr8552388pgk.154.1561269582678;
        Sat, 22 Jun 2019 22:59:42 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id m31sm10264274pjb.6.2019.06.22.22.59.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 22 Jun 2019 22:59:41 -0700 (PDT)
Date:   Sat, 22 Jun 2019 22:59:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Benoit Parrot <bparrot@ti.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 1/1] Input: edt-ft5x06 - disable irq handling during
 suspend
Message-ID: <20190623055940.GA204275@dtor-ws>
References: <20190621185124.28966-1-bparrot@ti.com>
 <CAHp75VdcAfmn8u0du-Y95SjMcmuJa2402tdXCNHMcme1Y925xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdcAfmn8u0du-Y95SjMcmuJa2402tdXCNHMcme1Y925xg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jun 22, 2019 at 01:37:10PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 21, 2019 at 9:53 PM Benoit Parrot <bparrot@ti.com> wrote:
> >
> > As a wakeup source when the system is in suspend there is little point
> > trying to access a register across the i2c bus as it is probably still
> > inactive. We need to prevent the irq handler from being called during
> > suspend.
> >
> 
> Hmm... But how OS will know what the event to handle afterwards?
> I mean shouldn't we guarantee somehow the delivery of the event to the
> input, in this case, subsystem followed by corresponding user space?

If we are using level interrupts then it will work OK, however it is
really easy to lose edge here, as replaying disabled edge triggered
interrupts is not really reliable.

Benoit, what kind of interrupt do you use in your system?

Thanks.

-- 
Dmitry
