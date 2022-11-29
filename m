Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BAC163BCC6
	for <lists+linux-input@lfdr.de>; Tue, 29 Nov 2022 10:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiK2JSo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Nov 2022 04:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbiK2JSn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Nov 2022 04:18:43 -0500
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB242FFF9
        for <linux-input@vger.kernel.org>; Tue, 29 Nov 2022 01:18:36 -0800 (PST)
Received: from frapeml500002.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NLxX724hrz6H74g;
        Tue, 29 Nov 2022 17:15:51 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 frapeml500002.china.huawei.com (7.182.85.205) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 29 Nov 2022 10:18:34 +0100
Received: from localhost (10.45.149.100) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 29 Nov
 2022 09:18:33 +0000
Date:   Tue, 29 Nov 2022 09:18:28 +0000
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Jonathan Cameron <jic23@kernel.org>, <linux-input@vger.kernel.org>,
        Daniel Mack <daniel@zonque.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Tomohiro Yoshidomi <sylph23k@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Lauri Kasanen <cand@gmx.com>,
        "Daniel Hung-yu Wu" <hywu@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 0/9] Input: Fix insufficent DMA alignment.
Message-ID: <20221129091828.0000530d@Huawei.com>
In-Reply-To: <Y4T6/5968KFxJAhP@google.com>
References: <20221127144116.1418083-1-jic23@kernel.org>
        <Y4T6/5968KFxJAhP@google.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.45.149.100]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 28 Nov 2022 10:16:31 -0800
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> Hi Jonathan,
> 
> On Sun, Nov 27, 2022 at 02:41:07PM +0000, Jonathan Cameron wrote:
> > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > 
> > This problem was discovered in IIO as a side effect of the discussions about
> > relaxing kmalloc alignment on arm64 and resulted in a series of large
> > patch sets.
> > 
> > https://lore.kernel.org/linux-iio/20220508175712.647246-1-jic23@kernel.org/
> > 
> > Unsurprisingly there are cases of it in other subsystems.
> > 
> > The short version of this is that there are a few known arm64 chips where
> > ___cacheline_aligned enforces 64 byte alignment which is what we typically
> > want for performance optimization as the size of the L1 cache lines.
> > However, further out in the cache hierarchy we have caches with 128 byte
> > lines.  Those are the ones that matter for DMA safety.
> > So we need the larger alignment guarantees of ARCH_KMALLOC_MINALIGN which
> > in this case is 128 bytes.  
> 
> I wonder if we could have something like ____dmasafe_aligned instead of
> sprinkling ARCH_KMALLOC_MINALIGN around?

I agree in principle and eventually that will be ARCH_DMA_MINALIGN.
But it isn't useable yet for backports.
Catalin has worked on several approaches to reducing the alignment of kmalloc.
I may well be lagging on the current plan...
https://lore.kernel.org/linux-arm-kernel/20221106220143.2129263-1-catalin.marinas@arm.com/#r

The way crypto and IIO handled this was to add a local define
IIO_DMA_MINALIGN, CRYPTO_MINALIGN

Catalin, if you do forwards with making ARCH_DMA_MINALIGN global available, make sure
to include IIO_DMA_MINALIGN.  I'm fine with the approach you used for crypto of changing
the local define.  Note that in IIO this typically only bloats a single structure
per device instance, so it's not worth the complexity of dynamic alignment.
As we are marking structure elements with it, in all cases they are multiples of
IIO_DMA_MINALIGN in size, so everything is easy.

On the other side of things, we might be able to relax most of these alignment tricks
in IIO (and input) if swiotlb is the approach eventually used.  I'm personally not that
keen on that transition but meh, this stuff usually involves a serial bus, so the extra
bounce isnt' too painful. Note that we regularly do fun things like setting tx
buffer to be ARCH_KMALLOC_MINALIGN and the rx buffer to be that +n bytes on the basis
that a given serial bus master won't trash itself and hence this is safe. I think your
approach will bounce all of those which is somewhat unfortunate.  Other fun things
include DMA mapping a series of small buffers in one allocation for a series of serial
messages.  Again, that is guaranteed to be safe.

Jonathan






> 
> > 
> > There is one other use of ____cacheline_aligned in input:
> > joystick/iforce/iforce-usb.c
> > 
> > Whilst suspicious I'm not sure enough of the requirements of USB to
> > know if they are there for DMA safety or some other constraint.  
> 
> Yes, USB has requirements similar to SPI.
> 
> Thanks.
> 

