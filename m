Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738B530A0C6
	for <lists+linux-input@lfdr.de>; Mon,  1 Feb 2021 05:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbhBAEJe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Sun, 31 Jan 2021 23:09:34 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3000 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhBAEJ3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 31 Jan 2021 23:09:29 -0500
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DTZCk5wzRzR90Y;
        Mon,  1 Feb 2021 12:07:30 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 1 Feb 2021 12:08:40 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi761-chm.china.huawei.com (10.1.198.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 1 Feb 2021 12:08:40 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.006;
 Mon, 1 Feb 2021 12:08:40 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "maz@kernel.org" <maz@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: RE: [PATCH v3 01/12] genirq: add IRQF_NO_AUTOEN for request_irq
Thread-Topic: [PATCH v3 01/12] genirq: add IRQF_NO_AUTOEN for request_irq
Thread-Index: AQHW9a9uNArtZHW+oUqboLRFBHDNC6pCsLjg
Date:   Mon, 1 Feb 2021 04:08:39 +0000
Message-ID: <235c6c79dc4a4aa29f21f0dd331cf58f@hisilicon.com>
References: <20210107223926.35284-2-song.bao.hua@hisilicon.com>
 <87k0rwdegz.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87k0rwdegz.fsf@nanos.tec.linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.203.222]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Thomas Gleixner [mailto:tglx@linutronix.de]
> Sent: Friday, January 29, 2021 8:55 AM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>;
> dmitry.torokhov@gmail.com; maz@kernel.org; gregkh@linuxfoundation.org;
> linux-input@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: linuxarm@openeuler.org; Song Bao Hua (Barry Song)
> <song.bao.hua@hisilicon.com>
> Subject: Re: [PATCH v3 01/12] genirq: add IRQF_NO_AUTOEN for request_irq
> 
> Barry,
> 
> On Fri, Jan 08 2021 at 11:39, Barry Song wrote:
> > diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> > index ab8567f32501..2b28314e2572 100644
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
> If we move this to request time flags, then setting the noautoen bit on
> the irq descriptor is pretty pointless. See below.
> 
> I rather get rid of the irq_settings magic for NOAUTOEN completely.

Thanks for your comment, Thomas.

Got this issue fixed in v4:
https://lore.kernel.org/lkml/20210128223538.20272-1-song.bao.hua@hisilicon.com/

btw, for those drivers which are using the first pattern:
irq_set_status_flags(irq, IRQ_NOAUTOEN);
request_irq(dev, irq...);

Simply running "git grep IRQ_NOAUTOEN"  will help figure where to fix.

For those drivers which are using the second pattern:
request_irq(dev, irq...);
disable_irq(irq);

I wrote a script as below:

#!/bin/bash
if [ $# != 1 -o ! -d $1 ] ; then
        echo "USAGE: $0 dir"
        exit 1;
fi

find $1 -iname "*.c" | while read i
do
        if [ -d "$i" ]; then
                break
        fi

        irq=`grep -n -A 10 -E "request_irq|request_threaded_irq|request_any_context_irq" $i | grep disable_irq` 
        if [ "$irq" != "" ]; then
                echo "$i":"$irq"
        fi
done

The script says there are more than 70 cases in 5.11-rc6.
We are going to fix all of them after this one settles down.

Thanks
Barry

> 
> Thanks,
> 
>         tglx
> ---
> --- a/include/linux/interrupt.h
> +++ b/include/linux/interrupt.h
> @@ -61,6 +61,8 @@
>   *                interrupt handler after suspending interrupts. For system
>   *                wakeup devices users need to implement wakeup detection in
>   *                their interrupt handlers.
> + * IRQF_NO_AUTOEN - Don't enable IRQ automatically when users request it. Users
> + *                will enable it explicitly by enable_irq() later.
>   */
>  #define IRQF_SHARED		0x00000080
>  #define IRQF_PROBE_SHARED	0x00000100
> @@ -74,6 +76,7 @@
>  #define IRQF_NO_THREAD		0x00010000
>  #define IRQF_EARLY_RESUME	0x00020000
>  #define IRQF_COND_SUSPEND	0x00040000
> +#define IRQF_NO_AUTOEN		0x00080000
> 
>  #define IRQF_TIMER		(__IRQF_TIMER | IRQF_NO_SUSPEND | IRQF_NO_THREAD)
> 
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -1693,7 +1693,8 @@ static int
>  			irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
>  		}
> 
> -		if (irq_settings_can_autoenable(desc)) {
> +		if (!(new->flags & IRQF_NO_AUTOEN) &&
> +		    irq_settings_can_autoenable(desc)) {
>  			irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
>  		} else {
>  			/*
> @@ -2086,10 +2087,15 @@ int request_threaded_irq(unsigned int ir
>  	 * which interrupt is which (messes up the interrupt freeing
>  	 * logic etc).
>  	 *
> +	 * Also shared interrupts do not go well with disabling auto enable.
> +	 * The sharing interrupt might request it while it's still disabled
> +	 * and then wait for interrupts forever.
> +	 *
>  	 * Also IRQF_COND_SUSPEND only makes sense for shared interrupts and
>  	 * it cannot be set along with IRQF_NO_SUSPEND.
>  	 */
>  	if (((irqflags & IRQF_SHARED) && !dev_id) ||
> +	    ((irqflags & IRQF_SHARED) && (irqflags & IRQF_NO_AUTOEN)) ||
>  	    (!(irqflags & IRQF_SHARED) && (irqflags & IRQF_COND_SUSPEND)) ||
>  	    ((irqflags & IRQF_NO_SUSPEND) && (irqflags & IRQF_COND_SUSPEND)))
>  		return -EINVAL;

