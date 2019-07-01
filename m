Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAA05C427
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 22:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfGAUHa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 16:07:30 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35738 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfGAUH3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 16:07:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61K7H0Y074025;
        Mon, 1 Jul 2019 15:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562011637;
        bh=fJIWwF2iBk1KVn8FBnxqLr7dJbFzUQEFbPrDqwnSdu0=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=QX1tlDzgGAd/FnkHA/lGkkBuca58P8ETbOq8KYUhCe8zr1J1hOTnRAcqJyc2PLDpC
         7tL5HZY5hUAnBhPu5qcCjqd3X1NoYYeJUrGehc9dnTazeocJCRwx6F+oR3+w+fa2IN
         DX8Ar4GjIGlDvZJfOoejEzoHL40OvGpmsWKhOv/U=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61K7HYF106428
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Jul 2019 15:07:17 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 15:07:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 15:07:16 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with SMTP id x61K7H9Z065259;
        Mon, 1 Jul 2019 15:07:17 -0500
Date:   Mon, 1 Jul 2019 15:08:38 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 1/1] Input: edt-ft5x06 - disable irq handling during
 suspend
Message-ID: <20190701200838.lnp2dmujqmeh55dh@ti.com>
References: <20190621185124.28966-1-bparrot@ti.com>
 <CAHp75VdcAfmn8u0du-Y95SjMcmuJa2402tdXCNHMcme1Y925xg@mail.gmail.com>
 <20190623055940.GA204275@dtor-ws>
 <20190624122457.seiezk4cla2gjh5u@ti.com>
 <20190701073233.GA172968@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190701073233.GA172968@dtor-ws>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote on Mon [2019-Jul-01 00:32:33 -0700]:
> On Mon, Jun 24, 2019 at 07:24:57AM -0500, Benoit Parrot wrote:
> > Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote on Sat [2019-Jun-22 22:59:40 -0700]:
> > > On Sat, Jun 22, 2019 at 01:37:10PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Jun 21, 2019 at 9:53 PM Benoit Parrot <bparrot@ti.com> wrote:
> > > > >
> > > > > As a wakeup source when the system is in suspend there is little point
> > > > > trying to access a register across the i2c bus as it is probably still
> > > > > inactive. We need to prevent the irq handler from being called during
> > > > > suspend.
> > > > >
> > > > 
> > > > Hmm... But how OS will know what the event to handle afterwards?
> > > > I mean shouldn't we guarantee somehow the delivery of the event to the
> > > > input, in this case, subsystem followed by corresponding user space?
> > > 
> > > If we are using level interrupts then it will work OK, however it is
> > > really easy to lose edge here, as replaying disabled edge triggered
> > > interrupts is not really reliable.
> > > 
> > > Benoit, what kind of interrupt do you use in your system?
> > 
> > Dmitry,
> > 
> > On our systems we currently used edge trigger. One example is available in
> > mainline: arch/arm/boot/dts/am437x-sk-evm.dts
> > 632:              interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
> 
> Does your device still work if you switch to level-triggered interrupt?

That would depend on the device. But for instance on am437x, in order for
GPIO IRQ to be detected as a wake up event they need to be edge triggered.

> 
> Regarding your patch I am uncomfortable with disabling interrupts if
> interrupt is edge-triggered, as replaying edge interrupts after enabling
> is not very reliable. So we should either only disable interrupt if it
> is level-triggered, or make sure we read and process data from the
> device after re-enabling interrupt to rearm it. We'll need to make sure
> suspend does not race with interrupt handler than and also make sure we
> handle case when device does not actually has data to report.

I am still not sure who would consume these events. Upon waking up from
suspend it would take a while for user-space to be ready to consume these
events, and by that time there may have been quite a few of them.

We are currently missing those events anyways, no?
I mean the i2c read operation during suspend is failing anyways, which
means that particular event is already missed.

Regards,
Benoit

> 
> Thanks.
> 
> -- 
> Dmitry
