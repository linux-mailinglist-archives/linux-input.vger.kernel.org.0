Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A50FDA4F
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2019 03:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfD2BSE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Apr 2019 21:18:04 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37325 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfD2BSE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Apr 2019 21:18:04 -0400
Received: by mail-pf1-f193.google.com with SMTP id g3so4495831pfi.4;
        Sun, 28 Apr 2019 18:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O9+YoFlOlT4x1j03m/pEeGVMfcriNk75OcRVANV3ZhI=;
        b=Ci7Rq0AwsqcA4jHsGnErpvo5qhA61OjKfzhcWKBtnNSVmfQYIb8Z4QMfD8+2FtyOVM
         BFerruYs7XN5f3OD8U4qu0v1e4rFXCneoWAwewysaAP0/OGxoHwEQ9Ms3DDinl4M1JXA
         4yo7T2ddloZ+DPJL1JkREADDiwojiPYM6Kg8lrFRoDKb4/8yg5M0QAqsaKa7bwA7LsNg
         x7M7+4hbSSq8wkLHO5tuDGllggHYjEipA75w1I/n/1fFrDL4utnAF5VsAqK3jLhejdLy
         uZSf624hgkAboHONsKgt9jZuWhRkv6JHaJzcNIb2k2gr8qUslZrq1xtIP8AOc4pEwbS4
         vXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O9+YoFlOlT4x1j03m/pEeGVMfcriNk75OcRVANV3ZhI=;
        b=dJOBKZ94K0lKFVuvxHsCHM/72l9cIcCJbF19xIBczTS3P3OaQUxCtDl6FzECDfyYvr
         CZYgBkQM4xPZ9I73xOwWt2EPuKHm1tQ+YvQLl3Xaiq1XLTqAvpuaNbDOUPIAKrOu733+
         Polu0+hrkmeQEIX/AYQxtIDMUwAq3cvJZOaGqylZcv0d8mLlB4KdrxDXwl1iuvZNtuyg
         FSHuwyvVpI7PAQil1nrro2FHtbM4QP7LvfJ00v43Ik29UUNcoMitI0HNs1Y7jYWRuigT
         OYwn5b6vqW9DVvwqonkkt9Yqs+mkNGf2r03WQrEt2f4VtONNZnRl/OLoe4Msc0nN8qmW
         yLNw==
X-Gm-Message-State: APjAAAWXMPsEjWpmvccQHXplGsb+9SIeq+MLZPYVdEKWyraEqGW7oILC
        ka2fUmhIDkFHF1u92a6j0jM=
X-Google-Smtp-Source: APXvYqzVjX1eyZ5hLC//t66g9uLpwBdvEkoRBgXIZCDiRjXKHT1wJStuwglYftNlmqIfl+XUkcT5vw==
X-Received: by 2002:a63:fd0c:: with SMTP id d12mr33365833pgh.172.1556500682581;
        Sun, 28 Apr 2019 18:18:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 18sm47964917pfp.18.2019.04.28.18.18.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 18:18:01 -0700 (PDT)
Date:   Sun, 28 Apr 2019 18:17:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Daniel Mack <daniel@zonque.org>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, Sven Neumann <Sven.Neumann@teufel.de>
Subject: Re: [PATCH 2/2] input: touch: eeti: read hardware state once after
 wakeup
Message-ID: <20190429011759.GA125935@dtor-ws>
References: <20190422083540.8380-1-daniel@zonque.org>
 <20190422083540.8380-2-daniel@zonque.org>
 <20190423031705.gllzrreptvphdrc3@penguin>
 <6b550519-4550-0872-f3de-9eba1fc0279f@zonque.org>
 <20190423084111.hqco2xgl2lfe35la@penguin>
 <f5c26867-235d-0c6e-3e44-885b54664cfe@zonque.org>
 <20190428173604.GB44908@dtor-ws>
 <256962f1-7a75-b5f7-7104-d6e70f66b23d@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <256962f1-7a75-b5f7-7104-d6e70f66b23d@zonque.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 28, 2019 at 09:50:35PM +0200, Daniel Mack wrote:
> On 28/4/2019 7:36 PM, Dmitry Torokhov wrote:
> > On Sun, Apr 28, 2019 at 09:18:46AM +0200, Daniel Mack wrote:
> >> On 23/4/2019 10:41 AM, Dmitry Torokhov wrote:
> >>> On Tue, Apr 23, 2019 at 06:51:32AM +0200, Daniel Mack wrote:
> >>>> Hi Dmitry,
> >>>>
> >>>> On 23/4/2019 5:17 AM, Dmitry Torokhov wrote:
> >>>>> On Mon, Apr 22, 2019 at 10:35:40AM +0200, Daniel Mack wrote:
> >>>>>> For systems in which the touch IRQ is acting as wakeup source, the interrupt
> >>>>>> controller might not latch the GPIO IRQ during sleep. In such cases, the
> >>>>>> interrupt will never occur again after resume, hence the touch screen
> >>>>>> appears dead.
> >>>>>>
> >>>>>> To fix this, call into eeti_ts_read() once to read the hardware status and
> >>>>>> to arm the IRQ again.
> >>>>>
> >>>>> Can you instead make the interrupt level-triggered?
> >>>>
> >>>> The hardware I'm working on doesn't support that unfortunately.
> >>>>
> >>>> In fact, the whole attn-gpio dance is there because of that, and the
> >>>> GPIO descriptor maps to the same pin that also causes the IRQ in my case.
> >>>
> >>> OK, if the interrupt controller is incapable of dealing with level
> >>> interrupts then we have to do what you propose.
> >>
> >> So you consider these patches for inclusion then? I'm just asking
> >> because I can't see them in your tree yet.
> > 
> > I was about to, but now I wonder if we need a mutex in the isr code now,
> > otherwise there is a chance it will be running concurrently when we are
> > resuming if interrupt does latch.
> 
> Actually, to address that, all we need to do is call into eeti_ts_read()
> before enable_irq(). See my v2.

This is still a bit racy as interrupt may come after you attempted to
read but before enable_irq() and then we need interrupt replaying code
to work reliably, which, as far as I understand, is not always the case.
I suppose we need at least add a comment that we rely on replays.

What kind of hardware is that? Is there no chance of making interrupt
controller handle level interrupts?

Thanks.

-- 
Dmitry
