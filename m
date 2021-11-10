Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E37C44C1C2
	for <lists+linux-input@lfdr.de>; Wed, 10 Nov 2021 14:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbhKJNDF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 08:03:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbhKJNDE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 08:03:04 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47340C061764;
        Wed, 10 Nov 2021 05:00:17 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id w22so2688709ioa.1;
        Wed, 10 Nov 2021 05:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wk14CvCRD5wDRSFmMDX8Rujf1hpEFY6t5q8q0VPuXQw=;
        b=DVuG7DCVMgbdWe8NxKDgqV3bXSD3QekZRG5JCfEoefgBcFcGci2oH8tgKE7jpgETiY
         gltv3sKX9jZ4X6paGeysgRSeJt/wGEuafMpWOxAvZqH9J/szcJh350JZsS5D542DuU/r
         z8Nv49mPMzB3Z76/LJLWfyeBD6nzzPoCsZH5AkgS8WfTWKgejiOnUSIZxww/GtThiqZU
         B63il2ArOCVIYnln7zE7J8qn4gSKgYAaKpZw80SX5EnLSklJ/2vK0qTmEFbbWJahTQ21
         LOJDDNPhEVfZTJ/E8ccZCpHCkpCbGaXa91b6ndP7os0SigPEurQ9O11JjumkupbTbtuq
         D9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wk14CvCRD5wDRSFmMDX8Rujf1hpEFY6t5q8q0VPuXQw=;
        b=gFJIhOH8RKKVbPpYQm5jEw3IKkmqRIWuG8/Sv9Kt3Zz9h/pEQkx/ih/B2k0cvKQXC9
         88lls56Q4CQicHwNT0YEnkV1NvnIq6fW+83GRsS+6jFDd7ar6bj4EgipJo8hztUw75vF
         l7xUidLsDJbbhe8bTLhUDkMGtby+hpkBJ8brq+Ds3peRkIp/MwfEceBPPpmZctVtm8qz
         RQPS7PNKyNxII6AROSNlasMYdtg3weqdtmNas+RoRpkPLLeTTWFxVDMqqFOTsX6UU91Y
         0v3BjhDzrUfMGDbvPa+dulL47sBPzurx3zFqrxIxDBC1HJ7HSMh2WyzJssTxLM0nfriR
         +MKw==
X-Gm-Message-State: AOAM531hhnmAqwvzQMchrdhVFLKqfV5oL1JCY2xVfK0eSmY+eCiGt0uW
        PuomWX24EGU6GNbrvsgrWkjs2xTJsET64Tfv/sU=
X-Google-Smtp-Source: ABdhPJyMOxEKjm1uw8eykt3TpXUp/8kGYf6hb77e011/H12fVsOs1tyBAVpkQHKMJLKvhaZYhh+fbpmlFIksvyNzBMM=
X-Received: by 2002:a05:6638:d16:: with SMTP id q22mr12179378jaj.35.1636549216748;
 Wed, 10 Nov 2021 05:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20211103114830.62711-1-alistair@alistair23.me>
 <20211103114830.62711-3-alistair@alistair23.me> <20211105152154.20f5cbd1@aktux>
In-Reply-To: <20211105152154.20f5cbd1@aktux>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Wed, 10 Nov 2021 22:59:50 +1000
Message-ID: <CAKmqyKNx00ecsAyOjtLk8i6r75WD0uw=nd=fd9z44yBuau+Vdw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Documentation: DT: bindings: input: Add
 documentation for cyttsp5
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Alistair Francis <alistair@alistair23.me>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mylene Josserand <mylene.josserand@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Nov 6, 2021 at 12:22 AM Andreas Kemnade <andreas@kemnade.info> wrote:
>
> Hi,
>
> I finally found time to test this.
>
> On Wed,  3 Nov 2021 21:48:28 +1000
> Alistair Francis <alistair@alistair23.me> wrote:
>
> [...]
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        touchscreen@24 {
> > +            compatible = "cypress,tt2100";
> > +            reg = <0x24>;
> > +            pinctrl-names = "default";
> > +            pinctrl-0 = <&tp_reset_ds203>;
> > +            interrupt-parent = <&pio>;
> > +            interrupts = <1 5 IRQ_TYPE_LEVEL_LOW>;
> hmm, in the code is IRQ_TRIGGER_FALLING but here is LEVEL_LOW, hmm what
> it is really?

The reMarkable uses IRQ_TYPE_EDGE_FALLING, but this example isn't
based on that. It' based on the original documentation from the patch
series.

>
> > +            reset-gpios = <&pio 7 1 GPIO_ACTIVE_HIGH>;
>
> hmm, if the reset gpio at the chip is active low (I guess it is) that
> would indicate an inverter between SoC and gpio. So a nonstandard setup
> as an example, probably not a good idea.

It seems to be common for the cypress,tt2100, as the original
documentation and the rM2 both do this. Does the Kobo not do this?

Alistair

>
> Regards,
> Andreas
