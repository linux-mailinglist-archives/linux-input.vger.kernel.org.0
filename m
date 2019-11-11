Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04BA4F7C23
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2019 19:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728782AbfKKSng (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Nov 2019 13:43:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:34894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728229AbfKKSnc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Nov 2019 13:43:32 -0500
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4C1B214E0;
        Mon, 11 Nov 2019 18:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573497811;
        bh=93uHfnNutgEilBVJIHVlpC/Kf/LkFBDLYXUemZhTj0s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ubAmmBDinRl5NGqinEY+dr5aM29YlNmPVCE45ZDGv6KcSWalFgyi3EDutEp5ENqG+
         cGWyVrsYzgmp70eOfCxSKKlJNIafRzt9b5Kc8JGVkv71RW97Bdf4UDUnL5ClVa+gDx
         uxk1sGDobpaIwuiIfuJhxZH9NOQJjXndsRvyxYAY=
Received: by mail-qk1-f171.google.com with SMTP id 15so12072448qkh.6;
        Mon, 11 Nov 2019 10:43:31 -0800 (PST)
X-Gm-Message-State: APjAAAX8BXL5LkjiI1DGlIvQ4dAFssNsa/tut//nZayppXapvwtgsSUY
        7jizeUhNunqNDmK+GBEWCSOOFHJO7QzIOAwKyQ==
X-Google-Smtp-Source: APXvYqy1cZUz+/KY/qM9trYtoI87h+hdwAwyrKM3PiBoGE0vBz8iWLoHwg4r+OzvbS/+2aMlRC6kl5Pgalcr+n0qzsU=
X-Received: by 2002:a37:30b:: with SMTP id 11mr2097687qkd.254.1573497810827;
 Mon, 11 Nov 2019 10:43:30 -0800 (PST)
MIME-Version: 1.0
References: <20191104070116.GM57214@dtor-ws> <20191104183702.8894-1-TheSven73@gmail.com>
 <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com>
 <CAGngYiXp52g7X=KLVqxTAhK0AJ9mpgGyaptbkYvhwWfRkQCaXQ@mail.gmail.com>
 <CAHCN7xLhqHzcHro7HYUdNAi8K3ToeruOtLw=0SZNAgNqUpxvHQ@mail.gmail.com>
 <20191104233621.GP57214@dtor-ws> <CAGngYiW0+QkLNmjp4yre2upqsvgEL4Or8rm09k5o7=9WHryyhg@mail.gmail.com>
 <20191111181657.GA57214@dtor-ws>
In-Reply-To: <20191111181657.GA57214@dtor-ws>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 11 Nov 2019 12:43:19 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+MgveQX+9sZ4Q2zqtYZWxEpMBXaDJRxjQ4B7em00VnRA@mail.gmail.com>
Message-ID: <CAL_Jsq+MgveQX+9sZ4Q2zqtYZWxEpMBXaDJRxjQ4B7em00VnRA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Sven Van Asbroeck <thesven73@gmail.com>,
        Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 11, 2019 at 12:17 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Nov 05, 2019 at 10:29:53AM -0500, Sven Van Asbroeck wrote:
> > On Mon, Nov 4, 2019 at 6:36 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > OK, I refreshed the branch with fixes and a couple of new patches. It is
> > > on top of 5.3 now. If this works for you guys I will be merging it for
> > > 5.5.
> > >
> >
> > According to the ili2117a/2118a datasheet I have, there are still a
> > few loose ends.
> > Some of these might be too inconsequential to worry about.
> > Dmitry, tell me which ones you think are important, if any,
> > and I will spin a patch if you like. Or you can do it, just let me know.
> >
> > >       { "ili210x", (long)&ili210x_chip },
> > >       { "ili2117", (long)&ili211x_chip },
> > >       { "ili251x", (long)&ili251x_chip },
> > >
> > >       { .compatible = "ilitek,ili210x", .data = &ili210x_chip },
> > >       { .compatible = "ilitek,ili2117", .data = &ili211x_chip },
> > >       { .compatible = "ilitek,ili251x", .data = &ili251x_chip },
> >
> > My datasheet says ILI2117A/ILI2118A, so maybe the compatible string should
> > really be "ilitek,ili211x", just like the other variants ?
>
> We have not landed the DT for 2117, so we can either rename it as
> "ilitek,ili211x" or have 2 separate compatibles.
>
> Rob, do you have preference?

The rule is we don't do wildcards for compatible strings. However, if
there's not a visible difference to s/w or you can determine which is
which by ID registers, then it is fine to have a single compatible. I
couldn't find a datasheet, so can't give better answer.

Rob
