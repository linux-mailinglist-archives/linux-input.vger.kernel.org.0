Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1E75B9579
	for <lists+linux-input@lfdr.de>; Thu, 15 Sep 2022 09:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiIOHfn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Sep 2022 03:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiIOHfn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Sep 2022 03:35:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C98178BC2
        for <linux-input@vger.kernel.org>; Thu, 15 Sep 2022 00:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663227338;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=soVYuMAxayh+2brnGzLjNkGMPYifBwRHy6hrOc9fKJ8=;
        b=OyPlY/1tpSkuNIuHGkNy3q3T709HeKFVaGyFkAZ/MG+FxFjU1t5zdpibDN/MOu0ymX9v9B
        T9wUieo+qIcOczD4RB3igJJLWm4DgJetZhGQdmvU0IOGYwm/Ut5Zt1GtlxzlU6BykYWFQu
        J+jWu6BVH4o3O2u0QzDLjnLBIdD4ih8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-4weoDi-MPxex2ouSCKcnsA-1; Thu, 15 Sep 2022 03:35:37 -0400
X-MC-Unique: 4weoDi-MPxex2ouSCKcnsA-1
Received: by mail-pl1-f197.google.com with SMTP id o1-20020a170902d4c100b00177f59a9889so12114936plg.13
        for <linux-input@vger.kernel.org>; Thu, 15 Sep 2022 00:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=soVYuMAxayh+2brnGzLjNkGMPYifBwRHy6hrOc9fKJ8=;
        b=HvJdyptQLn4gX2H+jNv9Lj6s5zDoVm0gRroLPTcujRtBmvI0F/m62u1LKYUZHAq7P2
         cwc/4w6oMkwYb/fB9vvlCKpNrDKQ7vCfq681KTrUHe1mQtjXHu9zvZ2iUdaGSPNmDSdn
         /3CsQPk3iKw5v0qXRP/WoXBk7y/f3ebfLjONYjzM/AsVQA9vP99zSWvcf4cgH3xVrc99
         U788fEYvEIULjdQP7tY6mdJfPv+m7Bp9LvBzu3QxxeHOstTuGxcRwRGcJG2QCwGCT4pH
         T7NTMW4h4V3IPPCqtOOzhx7nvNPybr54UJcr/OWhyukLdtURt9qE5m3hKmN894xbQM1T
         4gHA==
X-Gm-Message-State: ACrzQf1KHutmZ+ZfDLDOdpMqEovyIwXW9Ji+GPk+pepTxflRkT3PRv0c
        j0h0eH9roxcF6yai3ZNjwGhCjjjAMt/caI3DzkDKh9WblAJfcs9n6e27cClOJgBUoMVMyvaIOzs
        zaY2GkEs8k3ka6vUhPaI3ufUIDyy/OKztSUI+asw=
X-Received: by 2002:a17:903:3014:b0:176:e498:2340 with SMTP id o20-20020a170903301400b00176e4982340mr3078635pla.119.1663227336198;
        Thu, 15 Sep 2022 00:35:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM66EOQRG+uyyFv9IE6MmpghdMEhIjmEVFEbL27fE57qiUN+hTdC4XHDd0YfNOVJy61ajzo/dhfEWZYTZs15d48=
X-Received: by 2002:a17:903:3014:b0:176:e498:2340 with SMTP id
 o20-20020a170903301400b00176e4982340mr3078616pla.119.1663227335929; Thu, 15
 Sep 2022 00:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220822060936.769855-1-marcus.folkesson@gmail.com>
 <CAO-hwJ+3Yrr--cr=r5+jvs4A=A-cmDtrKQETo=YOYDC3nXTMBg@mail.gmail.com>
 <YwTvrNuulKx0SB6H@gmail.com> <CAO-hwJKiq50fWwXNUGcXeWtWcUXb65ZmJMsADfrsUTac_Xj2dw@mail.gmail.com>
 <YwcbVJswrL1Doi4s@gmail.com> <CAO-hwJJ86oAuaFD+uX7Rwv7cASO=4mchRJ1UBTxz9gYs6M1rUg@mail.gmail.com>
 <YyLVblZkIPCvNd/2@gmail.com>
In-Reply-To: <YyLVblZkIPCvNd/2@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 15 Sep 2022 08:35:25 +0100
Message-ID: <CAO-hwJJ5dRrgxrae-RasYXuu7C9xjw6RmPaPfmO=YU3StMaQ3A@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/2] HID: Add driver for RC Simulator Controllers
To:     Marcus Folkesson <marcus.folkesson@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 15, 2022 at 8:28 AM Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
>
> Hi Benjamin,
>
> On Tue, Aug 30, 2022 at 02:45:11PM +0200, Benjamin Tissoires wrote:
> > On Thu, Aug 25, 2022 at 8:44 AM Marcus Folkesson
> > <marcus.folkesson@gmail.com> wrote:
> > >
>
>
> [...]
> > >
> > >
> > > Is the fact that more than one button share the same
> > > byte hard to describe in the report?
> >
> > No, this is actually easy to describe. You say that there is one usage
> > of "something" which has a report size of 1 bit, and then you have
> > another usage of "something else" with the same report size.
> >
> > But usually you have to add padding after to make up to 8 bits (so 6
> > bits in that case).
> >
> > I was referring to the case  where you are parsing the same bit on the
> > wire, and give a different usage based if you have received an odd or
> > an even number of reports. In that case, we probably need to use move
> > this bit to a const field in the original report descriptor and say
> > that the data is now not const:
> >
> > - initial report (completely random example):
> >   X (2 bytes) | Y (2 bytes) | button this_or_that (1 bit, depending of
> > odd or even received reports) | 7 bits of padding
> > - we can declare it as:
> >   X (2 bytes) | Y (2 bytes) | button this (1 bit) | button that (1
> > bit) | 6 bits of padding
>
> How about if there is no unused bytes?
>
> The XTRG2FMS has 8 10-bit channels and use every byte in the report.
> Should I specify 8 8-bit channels instead and fix that in raw_event?
> If so, should I only use 8bit values then?

If I am not wrong, you should be able to add another byte in the
report descriptor, as long as your raw_event function always adds it.
Though now that I am typing it, I am actually wondering if this will
work. You can always try, there is a chance it'll work, but I can't
remember if it'll result in a timeout on the USB front because it'll
expect one more byte that will never arrive.

>
> (Are you at the ELCE conference btw?)

I was at Plumbers this week, but got an extra day today. But yeah, I'm
in Dublin today.

Cheers,
Benjamin

>
> Best regards
> Marcus Folkesson

