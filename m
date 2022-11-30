Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B77C63CCCC
	for <lists+linux-input@lfdr.de>; Wed, 30 Nov 2022 02:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbiK3BYC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Nov 2022 20:24:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiK3BYC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Nov 2022 20:24:02 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F60558BCE
        for <linux-input@vger.kernel.org>; Tue, 29 Nov 2022 17:24:01 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id b11so14359404pjp.2
        for <linux-input@vger.kernel.org>; Tue, 29 Nov 2022 17:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ClqlfUXcWPdxl+xR5etf5KMGHhaa/lM94Cf/4M9H3w=;
        b=KzajmF77W4IA2ra38Ad0F9GhkWaFAvLyqx1B7IOJzzeJ3hNe7VzanDKUkY5AmcSOyO
         jZSC/twEPQe7Ckekvqafo1zvvv10iGmDvJgRDQS2le1daBG5VbBNuY/FJFIrqOFPg3vI
         HcdPUzFc4m4hr3emlqQ31n5YRGYu2G4OlJ4N8PjXYbpKSKhNfVnEFoKxd+KajuYknW8k
         h4/Xmjmdv07quJaCKkPLTpGY3GjP1JZt772FsUPwsciFidSccjq24a5Jkq0oeg2vwcZZ
         uOfzlFMHnU9Fk6HQuoY7dun0YITEPpA9g2i7IUDkOOBPh3/KGTFIdrZb2NJWf7/IcNBJ
         NK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ClqlfUXcWPdxl+xR5etf5KMGHhaa/lM94Cf/4M9H3w=;
        b=fRSQXwIM9tbOJ8FaiYvrwcEsnE4mLCcsWQJU1MdP2aiH+X3VSo3tK9caN4krl0pc8V
         wYU45g3Gb/QDR/DIbhgYpU/Adp+370tEWv8FpJNlJqOZsacjuAQ1Ok3N4DOCHroJOmVq
         b2kREEYD/g7r1U10GN9NsWvltnQF9OtbObaiMBWQdXwe2oIikse2MVOPvL+4crpqqmrw
         sEr2q39TOl/mcwHLijJ9PsTUSwonpS8fgSRZeskU+dcLkRCH6c3pvouhFe8IE2DoLQ0B
         WrU21gstcTB37/oIDJjiZaaQOXeLhTYADAInwaQ+kPzVh3wlLtuQ1w6VprJOptMRj5B+
         j8hw==
X-Gm-Message-State: ANoB5pk8wTmEXWwMVFr/ydg/NvmAk17j/bqRjx0sCDzGTpAbyP6/gIZh
        xbOwxoqBcWO/+PQ7pWs1E70=
X-Google-Smtp-Source: AA0mqf7vUUodg+XxaC3qAh4vCRluotNg8BIyUStXpdd8bmks8AZWqlSCIozHPXRIzAr8pDn/KCH+Rg==
X-Received: by 2002:a17:902:c184:b0:189:680e:c2e4 with SMTP id d4-20020a170902c18400b00189680ec2e4mr24091682pld.84.1669771440191;
        Tue, 29 Nov 2022 17:24:00 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:fd81:84b:81d2:4b81])
        by smtp.gmail.com with ESMTPSA id q11-20020a17090a430b00b00212e5068e17sm60550pjg.40.2022.11.29.17.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 17:23:59 -0800 (PST)
Date:   Tue, 29 Nov 2022 17:23:56 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-input@vger.kernel.org,
        Daniel Mack <daniel@zonque.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Tomohiro Yoshidomi <sylph23k@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Lauri Kasanen <cand@gmx.com>,
        Daniel Hung-yu Wu <hywu@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 0/9] Input: Fix insufficent DMA alignment.
Message-ID: <Y4awrNpT00v6TItm@google.com>
References: <20221127144116.1418083-1-jic23@kernel.org>
 <Y4T6/5968KFxJAhP@google.com>
 <20221129091828.0000530d@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129091828.0000530d@Huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 29, 2022 at 09:18:28AM +0000, Jonathan Cameron wrote:
> On Mon, 28 Nov 2022 10:16:31 -0800
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
> > Hi Jonathan,
> > 
> > On Sun, Nov 27, 2022 at 02:41:07PM +0000, Jonathan Cameron wrote:
> > > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > 
> > > This problem was discovered in IIO as a side effect of the discussions about
> > > relaxing kmalloc alignment on arm64 and resulted in a series of large
> > > patch sets.
> > > 
> > > https://lore.kernel.org/linux-iio/20220508175712.647246-1-jic23@kernel.org/
> > > 
> > > Unsurprisingly there are cases of it in other subsystems.
> > > 
> > > The short version of this is that there are a few known arm64 chips where
> > > ___cacheline_aligned enforces 64 byte alignment which is what we typically
> > > want for performance optimization as the size of the L1 cache lines.
> > > However, further out in the cache hierarchy we have caches with 128 byte
> > > lines.  Those are the ones that matter for DMA safety.
> > > So we need the larger alignment guarantees of ARCH_KMALLOC_MINALIGN which
> > > in this case is 128 bytes.  
> > 
> > I wonder if we could have something like ____dmasafe_aligned instead of
> > sprinkling ARCH_KMALLOC_MINALIGN around?
> 
> I agree in principle and eventually that will be ARCH_DMA_MINALIGN.
> But it isn't useable yet for backports.

Sorry, I do not follow. Are talking about backports because the code is
broken in the mainline right now, or it will become broken when
Catalin's changes land? And even if it is broken right now why can't we
add

#define ____dmasafe_aligned __attribute__((__aligned__(ARCH_KMALLOC_MINALIGN)))

somewhere in include/linux/cache.h? Then you can tweak it as needed
independently of kmalloc alignment and without need to touch drivers
again and it should be easy to backport still.

Thanks.

-- 
Dmitry
