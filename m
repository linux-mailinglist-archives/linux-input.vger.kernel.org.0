Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4475A628F
	for <lists+linux-input@lfdr.de>; Tue, 30 Aug 2022 13:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiH3L4e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Aug 2022 07:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbiH3L4d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Aug 2022 07:56:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C36FBFC46
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661860591;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=I8GvlrYVvupK3hOQqvOdht2sIf2McSZ1h3wdQgKQ4L8=;
        b=APCi0o954C0tVuOoV3OoQQ8QbuOb+v4yge3UM9UjZQQWRWpzL+YYaEMC15NXT3JmmQMuH0
        gTGWUlbyU5e/rIz38QDgFaFrCRwXRQBYOxdJX25qsG711zgB+LXVmNDKyz0dHLm+SqQp7z
        6lbi7KkF8AQgmweaFEcNtwXzJgR/9Ok=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-CLkIjDmGPYG8DfIIfZCDOg-1; Tue, 30 Aug 2022 07:56:29 -0400
X-MC-Unique: CLkIjDmGPYG8DfIIfZCDOg-1
Received: by mail-pf1-f197.google.com with SMTP id i74-20020a62874d000000b005381588912bso2738794pfe.0
        for <linux-input@vger.kernel.org>; Tue, 30 Aug 2022 04:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=I8GvlrYVvupK3hOQqvOdht2sIf2McSZ1h3wdQgKQ4L8=;
        b=BnAPMABk7lk9icTk3qeq5XBLl9g9L0++LauH8DXcOPl9P87eUa+fpnPmAFwngpkvpk
         pnlHWr52EdpYifgrIV/tREoi5kwddCGfpqBrpZtu5+GpRbDRXO+MN2jllE0RMjwr1E02
         sA/6y7+9uLWy7/sdp3enxlQI7LbANbP5pdyNGGHRTNKy+khDnyyjX2zK6eFUDJDMb2bQ
         S6lId4jpDaTT0qUdirqSlsvjOVTxqVafNsPLbGHj+Hj7pISRFWkSYjtPbY6Z0cd9jhg9
         G12bxgUzvuq07cm1NnhsvhFfB2i55U+YF5l1jyhT9tCamc2tgcocJbTfCk1ydHlt217l
         Nu+w==
X-Gm-Message-State: ACgBeo3kxFHbx0gXdl76OiIWqy0RCHaddQwJM6Ra+fZJW13bUfJj1t3g
        +wDFMFGeH7DaInY2lfbZFRZEVStMJ+ZUzZSqyv6GWZS+y2Q/W/4Yl0KcFPqxPulTciwBAhmQ9NM
        e+dlNRcUrvuojH6jRYb4r9G40YLDvKviyUPptoLQ=
X-Received: by 2002:a05:6a00:1705:b0:52f:6028:5c33 with SMTP id h5-20020a056a00170500b0052f60285c33mr21026172pfc.29.1661860588549;
        Tue, 30 Aug 2022 04:56:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4qxUtpfFGljzWpROmYcOz2AJMFuKYBbL8Bx+4lKutjj90XsMterYYEJc9IMWzrnSPxCXHO1ShLAHjJfLxSqH4=
X-Received: by 2002:a05:6a00:1705:b0:52f:6028:5c33 with SMTP id
 h5-20020a056a00170500b0052f60285c33mr21026154pfc.29.1661860588305; Tue, 30
 Aug 2022 04:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <6ee2132c415db2fc90e7fa2106db427a914cc566.1655563907.git.christophe.jaillet@wanadoo.fr>
 <nycvar.YFH.7.76.2208251126010.19850@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2208251126010.19850@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 30 Aug 2022 13:56:17 +0200
Message-ID: <CAO-hwJJfncQ3jgtS=HO0atbzrTNOT_rzU66oG2yRTWTSY-L8KA@mail.gmail.com>
Subject: Re: [PATCH] HID: cp2112: Remove some dead code
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        lkml <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 25, 2022 at 11:26 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Sat, 18 Jun 2022, Christophe JAILLET wrote:
>
> > Commit 13de9cca514e ("HID: cp2112: add IRQ chip handling") has introduced
> > cp2112_allocate_irq() that seems to be unused since 2016.
> >
> > Remove it, remove the associated resources and part of the remove()
> > function that frees the resources allocated in cp2112_allocate_irq().
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > Compile tested only.
> >
> > Maybe the issue is completely elsewhere and the probe() should call
> > cp2112_allocate_irq() in some cases.
>
> Benjamin, could you please take a look? Apparently you were aware of the
> code being dead due to the __maybe_unused annotation ... :) What was the
> point?
>

Looks like I kept that code around for the CI I am running on HID patches.

IIRC, I left the code in the tree because it might have been useful to
others when they need to declare IRQs on the board. So yes, it is
entirely dead code upstream :/

I am applying the following 3 patches on the current master tree to be
able to declare hid-cp2112 as an i2c-hid transport:
https://gitlab.freedesktop.org/bentiss/gitlab-kernel-ci/-/tree/master/VM

Those 3 patches can not be upstreamed because platform drivers are a
dead thing, but I have no other ideas on how I can declare an i2c-hid
device on top of hid-cp2112.  Given that we don't have DT on x86_64
vm, I can not rely on that to have my custom sensor (or maybe I can
but I am not aware of it).

So unless anybody has a better idea, I won't fight against removing
that code, but it's more convenient for me to have it.

Cheers,
Benjamin

