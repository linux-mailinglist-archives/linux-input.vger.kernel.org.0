Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86ED42EA2E5
	for <lists+linux-input@lfdr.de>; Tue,  5 Jan 2021 02:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbhAEBd5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 4 Jan 2021 20:33:57 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2349 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727094AbhAEBd4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Jan 2021 20:33:56 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4D8w2S1Z5nz13cpH;
        Tue,  5 Jan 2021 09:31:44 +0800 (CST)
Received: from dggemi711-chm.china.huawei.com (10.3.20.110) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Tue, 5 Jan 2021 09:33:12 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi711-chm.china.huawei.com (10.3.20.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 5 Jan 2021 09:33:12 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.002;
 Tue, 5 Jan 2021 09:33:12 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "tglx@linutronix.de" <tglx@linutronix.de>,
        "maz@kernel.org" <maz@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: RE: [PATCH] genirq: add IRQF_NO_AUTOEN for request_irq
Thread-Topic: [PATCH] genirq: add IRQF_NO_AUTOEN for request_irq
Thread-Index: AQHW4ulWZlFLRa4THk6hib5h7axwo6oXjxeAgACtIHA=
Date:   Tue, 5 Jan 2021 01:33:12 +0000
Message-ID: <fa39c2f9dba4421095d846e87f755407@hisilicon.com>
References: <20210104222612.2708-1-song.bao.hua@hisilicon.com>
 <X/OePw97VgXtRBxj@google.com>
In-Reply-To: <X/OePw97VgXtRBxj@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.200.162]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com]
> Sent: Tuesday, January 5, 2021 12:01 PM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
> Cc: tglx@linutronix.de; maz@kernel.org; gregkh@linuxfoundation.org;
> linux-input@vger.kernel.org; linux-kernel@vger.kernel.org;
> linuxarm@openeuler.org
> Subject: Re: [PATCH] genirq: add IRQF_NO_AUTOEN for request_irq
> 
> On Tue, Jan 05, 2021 at 11:26:12AM +1300, Barry Song wrote:
> > This patch originated from the discussion with Dmitry in the below thread:
> >
> https://lore.kernel.org/linux-input/20210102042902.41664-1-song.bao.hua@hi
> silicon.com/
> > there are many drivers which don't want interrupts enabled automatically
> > due to request_irq().
> > So they are handling this issue by either way of the below two:
> > (1)
> > irq_set_status_flags(irq, IRQ_NOAUTOEN);
> > request_irq(dev, irq...);
> > (2)
> > request_irq(dev, irq...);
> > disable_irq(irq);
> >
> > The code in the second way is silly and unsafe. In the small time gap
> > between request_irq and disable_irq, interrupts can still come.
> > The code in the first way is safe though we might be able to do it in
> > the generic irq code.
> >
> > I guess Dmitry also prefers genirq handles this as he said
> > "What I would like to see is to allow passing something like IRQF_DISABLED
> > to request_irq() so that we would not need neither irq_set_status_flags()
> > nor disable_irq()" in the original email thread.
> 
> One of the reasons I dislike irq_set_status_flags() is that we have to
> call it before we actually granted our IRQ request...
> 
> >
> > If this one is accepted, hundreds of drivers with this problem will be
> > handled afterwards.
> >
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> > ---
> >  include/linux/interrupt.h |  3 +++
> >  kernel/irq/manage.c       |  3 +++
> >  kernel/irq/settings.h     | 10 ++++++++++
> >  3 files changed, 16 insertions(+)
> >
> > diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
> > index bb8ff9083e7d..0f22d277078c 100644
> > --- a/include/linux/interrupt.h
> > +++ b/include/linux/interrupt.h
> > @@ -61,6 +61,8 @@
> >   *                interrupt handler after suspending interrupts. For system
> >   *                wakeup devices users need to implement wakeup detection in
> >   *                their interrupt handlers.
> > + * IRQF_NO_AUTOEN - Don't enable IRQ automatically when users request it.
> Users
> > + *                will enable it explicitly by enable_irq() later.
> >   */
> >  #define IRQF_SHARED		0x00000080
> >  #define IRQF_PROBE_SHARED	0x00000100
> > @@ -74,6 +76,7 @@
> >  #define IRQF_NO_THREAD		0x00010000
> >  #define IRQF_EARLY_RESUME	0x00020000
> >  #define IRQF_COND_SUSPEND	0x00040000
> > +#define IRQF_NO_AUTOEN		0x00080000
> >
> >  #define IRQF_TIMER		(__IRQF_TIMER | IRQF_NO_SUSPEND | IRQF_NO_THREAD)
> >
> > diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> > index ab8567f32501..364e8b47d9ba 100644
> > --- a/kernel/irq/manage.c
> > +++ b/kernel/irq/manage.c
> > @@ -1693,6 +1693,9 @@ __setup_irq(unsigned int irq, struct irq_desc *desc,
> struct irqaction *new)
> >  			irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
> >  		}
> >
> > +		if (new->flags & IRQF_NO_AUTOEN)
> > +			irq_settings_set_noautoen(desc);
> 
> Can we make sure we refuse this request if the caller also specified
> IRQF_SHARED?

Right now, there is a warning for IRQF_SHARED + NOAUTOEN:

		if (irq_settings_can_autoenable(desc)) {
			irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
		} else {
			/*
			 * Shared interrupts do not go well with disabling
			 * auto enable. The sharing interrupt might request
			 * it while it's still disabled and then wait for
			 * interrupts forever.
			 */
			WARN_ON_ONCE(new->flags & IRQF_SHARED);
			/* Undo nested disables: */
			desc->depth = 1;
		}

Of course, this could also be clearly rejected in the sanity-check
of request_threaded_irq() if we want to totally prohibit this
behavior:

int request_threaded_irq(unsigned int irq, irq_handler_t handler,
			 irq_handler_t thread_fn, unsigned long irqflags,
			 const char *devname, void *dev_id)
{
	struct irqaction *action;
	struct irq_desc *desc;
	int retval;

	if (irq == IRQ_NOTCONNECTED)
		return -ENOTCONN;

	/*
	 * Sanity-check: shared interrupts must pass in a real dev-ID,
	 * otherwise we'll have trouble later trying to figure out
	 * which interrupt is which (messes up the interrupt freeing
	 * logic etc).
	 *
	 * Also IRQF_COND_SUSPEND only makes sense for shared interrupts and
	 * it cannot be set along with IRQF_NO_SUSPEND.
	 */
	if (((irqflags & IRQF_SHARED) && !dev_id) ||
	    (!(irqflags & IRQF_SHARED) && (irqflags & IRQF_COND_SUSPEND)) ||
	    ((irqflags & IRQF_NO_SUSPEND) && (irqflags & IRQF_COND_SUSPEND)))
		return -EINVAL;


> 
> Thanks.

Thanks
Barry

