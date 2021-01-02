Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510B12E86B8
	for <lists+linux-input@lfdr.de>; Sat,  2 Jan 2021 09:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbhABH65 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Sat, 2 Jan 2021 02:58:57 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2417 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbhABH65 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jan 2021 02:58:57 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4D7DkX4l3Pz5BrR;
        Sat,  2 Jan 2021 15:57:08 +0800 (CST)
Received: from dggemi760-chm.china.huawei.com (10.1.198.146) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Sat, 2 Jan 2021 15:58:14 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi760-chm.china.huawei.com (10.1.198.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Sat, 2 Jan 2021 15:58:13 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.002;
 Sat, 2 Jan 2021 15:58:13 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] Input: ar1021 - use IRQ_NOAUTOEN flags to replace
 disable_irq
Thread-Topic: [PATCH] Input: ar1021 - use IRQ_NOAUTOEN flags to replace
 disable_irq
Thread-Index: AQHW4MCESBb+gWALl0W0Bb/giVN9RqoTUAkAgACi5wA=
Date:   Sat, 2 Jan 2021 07:58:13 +0000
Message-ID: <0404c78f6be5434fbe9eab9539a2443d@hisilicon.com>
References: <20210102042902.41664-1-song.bao.hua@hisilicon.com>
 <X/AKvA8Wt0F6DjcU@google.com>
In-Reply-To: <X/AKvA8Wt0F6DjcU@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.27]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com]
> Sent: Saturday, January 2, 2021 6:55 PM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
> Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] Input: ar1021 - use IRQ_NOAUTOEN flags to replace
> disable_irq
> 
> Hi Barry,

Hi Dmitry,
Thanks for your quick reply.

> 
> On Sat, Jan 02, 2021 at 05:29:02PM +1300, Barry Song wrote:
> > disable_irq() after request_irq is unsafe as it gives a time gap which
> > irq can come before disable_irq(). IRQ_NOAUTOEN is the common way to
> > avoid enabling IRQ due to requesting IRQ.
> 
> Actually it is OK for the ISR to fire before the input device is
> registered, input core allows that.
> 

Yep. probably the only issue left is that the code looks silly.
It enables the interrupt in request_irq() automatically and
disables it immediately. So a better way would be avoiding enabling
the IRQ during request_irq().

> What I would like to see is to allow passing something like
> IRQF_DISABLED to request_irq() so that we would not need neither
> irq_set_status_flags() nor disable_irq().
> 

IRQF_DISABLED has been deleted for many years since Linux kernel
doesn't support interrupts enter while an irq handler is running
any more. That flag used to work for forbidding all interrupts
while  kernel was running in one hardIRQ to avoid IRQ races for
kernel older than 2.6.32.

Maybe we can invent a new flag like IRQF_NOAUTOEN for request_irq()?
but right now all other drivers are using irq_set_status_flags
(IRQ_NOAUTOEN) since this request flag doesn't exist.

Do you think it is worth to add a new flag to replace many
irq_set_status_flags(irq, IRQ_NOAUTOEN);
request_irq();
in drivers/gpu, i2c, input, media, net, perf, tc, spi, tty,
usb, vfio?

and +Thomas to get his comments as well :-)

> Thanks.
> 
> --
> Dmitry

Thanks
Barry
