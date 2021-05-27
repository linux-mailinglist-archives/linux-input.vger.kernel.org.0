Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1783923C7
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 02:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbhE0AcG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 20:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232903AbhE0AcF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 20:32:05 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A11BC06175F
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 17:30:33 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id g7so3662923edm.4
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 17:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nqOWBc5Vkt6mpmIWMkw8cPEAfhoVE6+CoM7HYKuIu8s=;
        b=EvwEfGyy11UbI7Zt9geDpmBcBvjnn1gjkUIy0CJzh2zn7cGGE+dvpdGmHwR97ANyi2
         GytSNhMhOtQ4atdLvHTnqclw5oC+auYRQHQUtLdLdJSQjxKN1wAc2OEwZD5E3nN9Zx8A
         wO3Rgz397hcVDNye2OHNRSqN6HHQv/Ba3oOQCbTpnqOPEypaVlzhY81f7ojpdxWJfiEX
         uNEGXCE9RgBkHaxcI5HJcx9R39jArPgSkeTgJqh3uqelrhXMDfiwzNOwYCkS0I0yNtWa
         svXnVfnxzCtQ1N16WFGj9iWXDv/h3236GX5f7wG3Ab2pnroAs6NU5BrFLXwBWZXAD3wB
         gjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nqOWBc5Vkt6mpmIWMkw8cPEAfhoVE6+CoM7HYKuIu8s=;
        b=TCnTSkzaWAQqIMmGuHaMzbv4SyTIFPLPdN0dc14COj8vmpd+A3w9ganZPJJnedaVWn
         SgQF5PfUzvtTfVcOhkzKESosPDU0iEP+egSFRQEcFgtBh6L/U7rJ7k62oo+QaRzwq6po
         fLRa+vhlfrDxn1EXl82nHPHKUi0s8zAUgKvHGiNBwXk7KLwiX8gwKiJO/JbiEKOmFqSx
         5WFVyI2RRZVCUfSNFP5Gg1Ak0LZh6pB2A+Nj3wI94DBkCEjoGhQGXbt6DJVz8N4H7DT2
         OOD2xvF0sifzjJ2OKT8lt2iVCtQYzvjeGYqhUAo+cSUKX2yR3cflEkBgZz0B1h//2kjZ
         OLYg==
X-Gm-Message-State: AOAM5303U7OLGWdkpc5JrdHMzPEmhyEtN9RnMDrat958K22sbcv/xv8O
        Txs3NJPZtgNYktdmbK5hgJ3ubzLbTuyI1/C744CbYQ==
X-Google-Smtp-Source: ABdhPJyY/2stx8PhpsQFWpDFP4m6A0jn6atr7DNeD7UEb/Hdiezsr7390YIlJdKM7opXTdkG3ceWEMM4xgWZSnqGB2M=
X-Received: by 2002:aa7:d4ca:: with SMTP id t10mr1003169edr.42.1622075432187;
 Wed, 26 May 2021 17:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <YK7iO96g+7yIC0l1@google.com>
In-Reply-To: <YK7iO96g+7yIC0l1@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 May 2021 02:30:21 +0200
Message-ID: <CACRpkdbBGAbZXsFiekoQUH2MRh4V0e6gR78+cLh+CM2NzXP-dA@mail.gmail.com>
Subject: Re: [PATCH] Input: cyttsp - do not force interrupt trigger
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 27, 2021 at 2:05 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Instead of forcing interrupt trigger to be "falling edge" let's rely on the
> platform to set it up according to how it is set up on a given board based
> on data in device tree or ACPI tables.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> Linus, Ferruh's email has been bouncing for ages, it looks like you have
> the hardware and you are already looking over another Cypress touch
> controller, mind if I put you down as a maintainer for this one as well?

That's fine, just list me if you want, one more or less.

Yours,
Linus Walleij
