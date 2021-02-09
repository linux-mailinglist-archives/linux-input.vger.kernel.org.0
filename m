Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616FE3159B4
	for <lists+linux-input@lfdr.de>; Tue,  9 Feb 2021 23:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234358AbhBIWuh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 9 Feb 2021 17:50:37 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:4623 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233928AbhBIWY2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Feb 2021 17:24:28 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4DZx085XJxzY6QP;
        Wed, 10 Feb 2021 05:31:04 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 10 Feb 2021 05:32:20 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi761-chm.china.huawei.com (10.1.198.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 10 Feb 2021 05:32:20 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.006;
 Wed, 10 Feb 2021 05:32:20 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     "tglx@linutronix.de" <tglx@linutronix.de>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "maz@kernel.org" <maz@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: RE: [PATCH v4 01/12] genirq: add IRQF_NO_AUTOEN for request_irq
Thread-Topic: [PATCH v4 01/12] genirq: add IRQF_NO_AUTOEN for request_irq
Thread-Index: AQHW9ca1FgeumsKZqUqCQOHUN+N34qpQaAZQ
Date:   Tue, 9 Feb 2021 21:32:20 +0000
Message-ID: <aefbe49321b845c98e505518314a93cc@hisilicon.com>
References: <20210128223538.20272-1-song.bao.hua@hisilicon.com>
 <20210128223538.20272-2-song.bao.hua@hisilicon.com>
In-Reply-To: <20210128223538.20272-2-song.bao.hua@hisilicon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.77]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Song Bao Hua (Barry Song)
> Sent: Friday, January 29, 2021 11:35 AM
> To: tglx@linutronix.de; dmitry.torokhov@gmail.com; maz@kernel.org;
> gregkh@linuxfoundation.org; linux-input@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Cc: linuxarm@openeuler.org; Song Bao Hua (Barry Song)
> <song.bao.hua@hisilicon.com>
> Subject: [PATCH v4 01/12] genirq: add IRQF_NO_AUTOEN for request_irq
> 
> Many drivers don't want interrupts enabled automatically due to
> request_irq(). So they are handling this issue by either way of
> the below two:
> (1)
> irq_set_status_flags(irq, IRQ_NOAUTOEN);
> request_irq(dev, irq...);
> (2)
> request_irq(dev, irq...);
> disable_irq(irq);
> 
> The code in the second way is silly and unsafe. In the small time
> gap between request_irq() and disable_irq(), interrupts can still
> come.
> The code in the first way is safe though we might be able to do it
> in the generic irq code.
> 
> With this patch, drivers can request_irq with IRQF_NO_AUTOEN flag.
> They will need neither irq_set_status_flags() nor disable_irq().
> Hundreds of drivers with this problem will be handled afterwards.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  -v4: remove the irq_settings magic for NOAUTOEN

Hi Thomas,
Any further comment on this? Does it get any opportunity to hit
5.12 so that we can begin to handle those drivers in 5.12?

Thanks
Barry

> 
>  include/linux/interrupt.h | 3 +++
>  kernel/irq/manage.c       | 8 +++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
> index bb8ff9083e7d..0f22d277078c 100644
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
> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
> index dec3f73e8db9..95014073bd2e 100644
> --- a/kernel/irq/manage.c
> +++ b/kernel/irq/manage.c
> @@ -1693,7 +1693,8 @@ __setup_irq(unsigned int irq, struct irq_desc *desc,
> struct irqaction *new)
>  			irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
>  		}
> 
> -		if (irq_settings_can_autoenable(desc)) {
> +		if (!(new->flags & IRQF_NO_AUTOEN) &&
> +		    irq_settings_can_autoenable(desc)) {
>  			irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
>  		} else {
>  			/*
> @@ -2086,10 +2087,15 @@ int request_threaded_irq(unsigned int irq,
> irq_handler_t handler,
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
> --
> 2.25.1

