Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61E43FE9D1
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 09:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242126AbhIBHOZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Sep 2021 03:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233363AbhIBHOY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Sep 2021 03:14:24 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245A5C061575
        for <linux-input@vger.kernel.org>; Thu,  2 Sep 2021 00:13:27 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id ay33so1034097qkb.10
        for <linux-input@vger.kernel.org>; Thu, 02 Sep 2021 00:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5R4bY9XsB5NS5lJ7wOWmrb5ovHpBSTLNXWuHu+TtAgA=;
        b=D3lCAqc/IAMH0Wco+cC+fbFHCdyJcKm4lbGbAziDPBY4m8n21LarFIuj9aaUL17fq6
         HNWVAbyc18rKruwmLsMSd0k85LIv1o6YPijy9nMNBWqsuR7xbiXNHAQbz8WwT0GMWbJQ
         elGd+hjP7GmsnpjvGoQPU/SZjLJSlv+Sqi1QO1vkjNRI6QAx6tv7e6I8E9/moEFhBvTh
         BcXdkzRLOhhH68yqw7mtd+u201Tkc8IADpkCt47lpUcpLfUcfNBq42unM2PwFx0H2B44
         x7hAj4KyfACaGX6BiPzNIhNiebvMnglhNSVvvnVlakjf0kWyQIRSOKRzAUsdRxqZQAkF
         eQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5R4bY9XsB5NS5lJ7wOWmrb5ovHpBSTLNXWuHu+TtAgA=;
        b=D6CaGQhZkr5pZE3o9Pv3g/42WYXzdMKGUfCOqxZ0SXeVDLzAxZstt3n7ahbcvXGSsH
         czEoBJ6rRYo9kaOutyhi9pNj57XTGoXyApqUBFfagF30LIYc7N2eiu+o068p5BAdBp5f
         qAwF5tiJ89072Zd1rv8JGJQy5RFgHU6X/7cpjUj9GSv3nsfPBtmtkq30xjhY0iczToz6
         ZhcF4dSH6eYnNlHSkdLAYerctxk8g0XppKGuXnvoYxZKy1J8teJk4lylfks/nj6dAU+4
         E7eBjLuvnvzbD4aV1n/3oDfXCXVaaXdcdSY2z79CqEG/bhRkC9QxBKDkJ7f7Wmokn1ts
         c3Bw==
X-Gm-Message-State: AOAM531H05oPc1+2/5XjHf0JLNxm8eNnR1FiBI9i5J84wJAtMRkh+3Ph
        GZ9PJQFGnHgkzAo6s5cNGASrdzyOgbnWZdaIwzIXXeQA
X-Google-Smtp-Source: ABdhPJzkOAtmdHy0JGlT7qG+FRHdoi5FFxHRIplqDvXP/K3HGfxgkOshTVciz5TLQaXZnRec6hKxXcLs/Ys+Jsv6Vyc=
X-Received: by 2002:a05:620a:6b3:: with SMTP id i19mr1927194qkh.74.1630566806336;
 Thu, 02 Sep 2021 00:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210818152743.163929-1-tobias.junghans@inhub.de>
 <3382390.V25eIC5XRa@306e6e011c15> <CALUj-gvwPJW6qND7_8eBPLjdXe9OienMeSNu7zAgq6Q-YEitiQ@mail.gmail.com>
 <1931977.PIDvDuAF1L@306e6e011c15>
In-Reply-To: <1931977.PIDvDuAF1L@306e6e011c15>
From:   rishi gupta <gupt21@gmail.com>
Date:   Thu, 2 Sep 2021 12:43:14 +0530
Message-ID: <CALUj-gt2dsj=4_EZO26_ufQezaSUr004H81TDS=YjLc5ydiGFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: mcp2221: configure GP pins for GPIO function
To:     Linus Walleij <linus.walleij@linaro.org>,
        Tobias Junghans <tobias.junghans@inhub.de>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I am unconvinced but would leave the final decision to Linus and other
maintainers. If they approve I will start code review.

-Rishi

On Mon, Aug 30, 2021 at 7:00 PM Tobias Junghans
<tobias.junghans@inhub.de> wrote:
>
> Hi Rishi,
>
> Sure, this can always happen =E2=80=93 like with any other kinds of (e.g.=
 SoC) GPIOs
> where you have to take care and/or keep track of your system's permission=
s
> (which should prevent non-root applications from doing bad things such as
> playing with GPIO settings or wiping your storage). As written, the code
> changes do no harm unless you enforce it.
>
> Best regards
>
> Tobias
>
> > By mistake during development it may happen or a rogue application can
> > knowingly play with our hardware (commercial product may be
> > vulnerable). What are your thoughts?
> >
> > -Rishi
> >
>
>
>
