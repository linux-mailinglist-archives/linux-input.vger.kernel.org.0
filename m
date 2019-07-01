Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 090AD5B5BF
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 09:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727757AbfGAHch (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 03:32:37 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40086 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727563AbfGAHch (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 03:32:37 -0400
Received: by mail-pg1-f195.google.com with SMTP id w10so5588310pgj.7;
        Mon, 01 Jul 2019 00:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=r3krFnlpSUteqfAN88gmmDAUtY8UDQsbB6kSfcYI9w0=;
        b=vFtq0xbtvkh8R+O72XBTmT6LeIqiqq3m0B2bIkfFrOiyP7fcsGcoBbKL645QEc/CrG
         LIemUwXcdYl9EMTVoDVCXFmLg/aG4l68vUOD348PZePBpbCSJjEUbAG+fQNndPAwYaWg
         muAiCUP9g5CJN4g7NlsuJqhEohkC8lGLGbWE8Pz3h3UYAPzGwIQSNzd3P2zO1Fb495aI
         4bXN5ec02F240StV1PZ56k/ciotXlkoSjN7gwZHapngONexJ/Imy44qfOhnHnC/lmSN9
         ZhSvWGk2P04ZT6elXqNm8Jd2L9GngjEAEe7zfWCaN+4FMB+XWBQ+07UZN8oRJ2NaweMw
         1WSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r3krFnlpSUteqfAN88gmmDAUtY8UDQsbB6kSfcYI9w0=;
        b=p+kMLDDtkSpTqysaZXUL/IhJM6TajUcAj0dXCFN9CwNermelEOYnQlPz2If7ZrbXtl
         kLSQiI7T9fy1CZNQw44rcq8gvZ9AsDmjRN9FHEC1UfF7FQyg5l2jo13dwaXs+Kvqol69
         23Ef+8FRYQSHWypbmPoGzjs6DOdVY4wz7fWp0uhnATf3oaJe8H9mHC+jugcJBY1oRiz0
         v4T30c0UrcJ0KySFEXv74dfWymIR2RLHwtxTsJerrH3jYCrCNJ9uaWauK1BCrfC1Bz6y
         P4CVyzYrmtoYMGsnk8uF9I788YFOAhIladrFZHYI9NQihIA5TllAB0O+nEvAEPGTGU69
         EDEA==
X-Gm-Message-State: APjAAAU/lJUEJx9zssc2CDA3m/RKhJ6Rk1SztubRuKi/b8jpf+P/2+Q5
        HYRtjmVwpFPwDYKiMBlM+y8=
X-Google-Smtp-Source: APXvYqyeTFln8z3Oa/D5uivCoSODZsncehIPi5ijNdI05rEAJngObBziiboeEm4QSVvgPVV72pOdPg==
X-Received: by 2002:a17:90a:374f:: with SMTP id u73mr29428549pjb.4.1561966356397;
        Mon, 01 Jul 2019 00:32:36 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q13sm10181255pgq.90.2019.07.01.00.32.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 00:32:35 -0700 (PDT)
Date:   Mon, 1 Jul 2019 00:32:33 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 1/1] Input: edt-ft5x06 - disable irq handling during
 suspend
Message-ID: <20190701073233.GA172968@dtor-ws>
References: <20190621185124.28966-1-bparrot@ti.com>
 <CAHp75VdcAfmn8u0du-Y95SjMcmuJa2402tdXCNHMcme1Y925xg@mail.gmail.com>
 <20190623055940.GA204275@dtor-ws>
 <20190624122457.seiezk4cla2gjh5u@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624122457.seiezk4cla2gjh5u@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 24, 2019 at 07:24:57AM -0500, Benoit Parrot wrote:
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote on Sat [2019-Jun-22 22:59:40 -0700]:
> > On Sat, Jun 22, 2019 at 01:37:10PM +0300, Andy Shevchenko wrote:
> > > On Fri, Jun 21, 2019 at 9:53 PM Benoit Parrot <bparrot@ti.com> wrote:
> > > >
> > > > As a wakeup source when the system is in suspend there is little point
> > > > trying to access a register across the i2c bus as it is probably still
> > > > inactive. We need to prevent the irq handler from being called during
> > > > suspend.
> > > >
> > > 
> > > Hmm... But how OS will know what the event to handle afterwards?
> > > I mean shouldn't we guarantee somehow the delivery of the event to the
> > > input, in this case, subsystem followed by corresponding user space?
> > 
> > If we are using level interrupts then it will work OK, however it is
> > really easy to lose edge here, as replaying disabled edge triggered
> > interrupts is not really reliable.
> > 
> > Benoit, what kind of interrupt do you use in your system?
> 
> Dmitry,
> 
> On our systems we currently used edge trigger. One example is available in
> mainline: arch/arm/boot/dts/am437x-sk-evm.dts
> 632:              interrupts = <31 IRQ_TYPE_EDGE_FALLING>;

Does your device still work if you switch to level-triggered interrupt?

Regarding your patch I am uncomfortable with disabling interrupts if
interrupt is edge-triggered, as replaying edge interrupts after enabling
is not very reliable. So we should either only disable interrupt if it
is level-triggered, or make sure we read and process data from the
device after re-enabling interrupt to rearm it. We'll need to make sure
suspend does not race with interrupt handler than and also make sure we
handle case when device does not actually has data to report.

Thanks.

-- 
Dmitry
