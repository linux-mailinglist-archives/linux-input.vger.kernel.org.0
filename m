Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E29F52EE70C
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 21:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbhAGUky convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 7 Jan 2021 15:40:54 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:4133 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbhAGUky (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 15:40:54 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4DBdPh5FMhzXw6h;
        Fri,  8 Jan 2021 04:39:20 +0800 (CST)
Received: from dggemi711-chm.china.huawei.com (10.3.20.110) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Fri, 8 Jan 2021 04:40:11 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi711-chm.china.huawei.com (10.3.20.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 8 Jan 2021 04:40:00 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.002;
 Fri, 8 Jan 2021 04:40:00 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "tglx@linutronix.de" <tglx@linutronix.de>,
        "maz@kernel.org" <maz@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: RE: [PATCH v2] genirq: add IRQF_NO_AUTOEN for request_irq
Thread-Topic: [PATCH v2] genirq: add IRQF_NO_AUTOEN for request_irq
Thread-Index: AQHW4wkv7PNQNOckmUyDuj2KsKbhpaocAeyAgACg1NA=
Date:   Thu, 7 Jan 2021 20:40:00 +0000
Message-ID: <541eeb3387224fdabc3dcbe6e0ce0db4@hisilicon.com>
References: <20210105021411.34020-1-song.bao.hua@hisilicon.com>
 <X/dZxzz5PA37Ie3B@kroah.com>
In-Reply-To: <X/dZxzz5PA37Ie3B@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.32]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Friday, January 8, 2021 7:58 AM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
> Cc: tglx@linutronix.de; maz@kernel.org; linux-input@vger.kernel.org;
> linux-kernel@vger.kernel.org; linuxarm@openeuler.org; Dmitry Torokhov
> <dmitry.torokhov@gmail.com>
> Subject: Re: [PATCH v2] genirq: add IRQF_NO_AUTOEN for request_irq
> 
> On Tue, Jan 05, 2021 at 03:14:11PM +1300, Barry Song wrote:
> > Many drivers don't want interrupts enabled automatically due to
> > request_irq(). So they are handling this issue by either way of
> > the below two:
> > (1)
> > irq_set_status_flags(irq, IRQ_NOAUTOEN);
> > request_irq(dev, irq...);
> > (2)
> > request_irq(dev, irq...);
> > disable_irq(irq);
> >
> > The code in the second way is silly and unsafe. In the small time
> > gap between request_irq() and disable_irq(), interrupts can still
> > come.
> > The code in the first way is safe though we might be able to do it
> > in the generic irq code.
> >
> > With this patch, drivers can request_irq with IRQF_NO_AUTOEN flag.
> > They will need neither irq_set_status_flags() nor disable_irq().
> > Hundreds of drivers with this problem will be handled afterwards.
> >
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> 
> Can you also convert some in-kernel drivers to this new api so that we
> can see how this works?

Sure. As the discussion got started from input, so I'll take some
input drivers as examples before moving to other folders.

> 
> thanks,
> 
> greg k-h

Thanks
Barry

