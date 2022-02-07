Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF614ACB77
	for <lists+linux-input@lfdr.de>; Mon,  7 Feb 2022 22:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241520AbiBGVmO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Feb 2022 16:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241483AbiBGVmN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Feb 2022 16:42:13 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C489C0612A4
        for <linux-input@vger.kernel.org>; Mon,  7 Feb 2022 13:42:13 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id z5so12167013plg.8
        for <linux-input@vger.kernel.org>; Mon, 07 Feb 2022 13:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ue8QPi/NxIX+XwjTFDBLsJTr3FjLwob22M4ctmUnrR4=;
        b=LV2RIaevhTGJaAB2yuv0gnq6xeoKNSu73CeOcAYIVh3hp849FmGZlZtJRd3k3PArTp
         eMu2cdnTkOKjmnD+rs4SZnWGToC5hLZZXa3ofOIegbZ/PuHbaxcheiXmSTZviVhYWyvh
         MGAznJiLAhF4+JLED6K5pXqbDP6Yk9NzcNZLyH1FrmHh2vy7ZpXos4hOArIdOCARfnZX
         lFk2NDWiQBZloSHSjLfLeio307PxPyiAak3ZHrTO5klsA4kykuMCk1jzQaGxI5nGC4J+
         WFH3kTPlfwIcb6Bqm/SU5ZasdeBi7iQPwMS01hL/qwUzh4BjmvPkIvkx77ZFrvRpv4ov
         qzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ue8QPi/NxIX+XwjTFDBLsJTr3FjLwob22M4ctmUnrR4=;
        b=NzJWKpyOdRIb3pu8CerCFcy9eScPJRrXc9FrwDxCoUu+qYxGf1b35zEv1uD1wmNrRV
         VIZW3im8ppued43DAKjQNJ78DvRSUDR8nD6ytTqsQWucK33S6n5VmVW3PscXu76JpV1G
         HLji5YRcSCIfmf6K5Z7xMfT7dNpsp1hqRE47h/gvnFQXkQyczCZzWWHzpPeFE2+NWzAs
         XiO8GCXanVmchvutyH2+/U0rKmXw1xup5bs1SvZYbUR0uJlDaJLJeCoD4sl+Y2LwYIpE
         Z12Ot4F9ipDoRukGXBNqJ+pkunzSjDP8tkQ2U24krh36e9rjZ83VHs/4Md4eIw25BUiI
         a6jw==
X-Gm-Message-State: AOAM532YTQdrsgANCkT7yElyoB5a2IpvBey3e8Rw68spR3oPwzjX8YN4
        n9BlB5VcF6lvjIYBO+hab37NIxE8DRGuPC8GZvKXcA==
X-Google-Smtp-Source: ABdhPJynmSC+eH1Rc/LMtMTGYYFzuJoeRv2tRZelbMGBI3InPfpklZDaqWp87SGtTe0tTlBvUiGrc5S+5gM28jEv9CA=
X-Received: by 2002:a17:90a:f485:: with SMTP id bx5mr1012434pjb.46.1644270132376;
 Mon, 07 Feb 2022 13:42:12 -0800 (PST)
MIME-Version: 1.0
References: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com>
 <YgF/0QGFN4SppLKg@shikoro> <CACK8Z6Etj-gq1VKpkUBstiXEETekPWG9p9gKBtuFaZF05pQEvQ@mail.gmail.com>
In-Reply-To: <CACK8Z6Etj-gq1VKpkUBstiXEETekPWG9p9gKBtuFaZF05pQEvQ@mail.gmail.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Mon, 7 Feb 2022 13:41:36 -0800
Message-ID: <CACK8Z6FUsceYgBoaAtN8o4m9HpZaBZMt0Nqtvw0a1Z3EuD_nWg@mail.gmail.com>
Subject: Re: 5.17-rc regression: rmi4 clients cannot deal with asynchronous
 suspend? (was: X1 Carbon touchpad not resumed)
To:     Wolfram Sang <wsa@kernel.org>, Hugh Dickins <hughd@google.com>,
        Derek Basehore <dbasehore@chromium.org>,
        Rajat Jain <rajatja@google.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Cc:     "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        vincent.huang@tw.synaptics.com, cheiny@synaptics.com,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

+linux-input@vger.kernel.org

On Mon, Feb 7, 2022 at 1:09 PM Rajat Jain <rajatja@google.com> wrote:
>
> +Rafael (for any inputs on asynchronous suspend / resume)
> +Dmitry Torokhov (since no other maintainer of rmi4 in MAINTAINERS file)
> +loic.poulain@linaro.org (who fixed RMI device hierarchy recently)
> + Some Synaptics folks (from recent commits - Vincent Huang, Andrew
> Duggan, Cheiny)
>
> On Mon, Feb 7, 2022 at 12:23 PM Wolfram Sang <wsa@kernel.org> wrote:
> >
> > Hello Hugh,
> >
> > > Bisection led to 172d931910e1db800f4e71e8ed92281b6f8c6ee2
> > > ("i2c: enable async suspend/resume on i2c client devices")
> > > and reverting that fixes it for me.
> >
> > Thank you for the report plus bisection and sorry for the regression!
>
> +1, Thanks for the bisection, and apologies for the inconveniences.
>
> The problem here seems to be that for some reason, some devices (all
> connected to rmi4 adapter) failed to resume, but only when
> asynchronous suspend is enabled (by 172d931910e1):
>
> [   79.221064] rmi4_smbus 6-002c: failed to get SMBus version number!
> [   79.265074] rmi4_physical rmi4-00: rmi_driver_reset_handler: Failed
> to read current IRQ mask.
> [   79.308330] rmi4_f01 rmi4-00.fn01: Failed to restore normal operation: -6.
> [   79.308335] rmi4_f01 rmi4-00.fn01: Resume failed with code -6.
> [   79.308339] rmi4_physical rmi4-00: Failed to suspend functions: -6
> [   79.308342] rmi4_smbus 6-002c: Failed to resume device: -6
> [   79.351967] rmi4_physical rmi4-00: Failed to read irqs, code=-6
>
> A resume failure that only shows up during asynchronous resume,
> typically means that the device is dependent on some other device to
> resume first, but this dependency is NOT established in a parent child
> relationship (which is wrong and needs to be fixed, perhaps using
> device_add_link()). Thus the kernel may be resuming these devices
> without first resuming some other device that these devices need to
> depend on.
>
> TBH, I'm not sure how to fix this. The only hint I see is that all of
> these devices seem to be attached to rmi4 device so perhaps something
> there? I see 6e4860410b828f recently fixed device hierarchy for rmi4,
> and so seemingly should have fixed this very issue (as also seen in
> commit message)?
>
> >
> > I will wait a few days if people come up with a fix. If not, I will
> > revert the offending commit.
>
> While I'll be sad because this means no i2c-client can now resume in
> parallel and increases resume latency by a *LOT* (hundreds of ms on
> all Linux systems), I understand that this needs to be done unless
> someone comes up with a fix.
>
> I wanted to confirm that the following patches shall continue to stay?
>
> d320ec7acc83 i2c: enable async suspend/resume for i2c adapters
> 7c5b3c158b38 i2c: designware: Enable async suspend / resume of
> designware devices
>
> Thanks & Best Regards,
>
> Rajat
>
>
> >
> > All the best,
> >
> >    Wolfram
> >
