Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C298D3A4896
	for <lists+linux-input@lfdr.de>; Fri, 11 Jun 2021 20:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbhFKSZg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Jun 2021 14:25:36 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:40575 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbhFKSZf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Jun 2021 14:25:35 -0400
Received: by mail-vs1-f49.google.com with SMTP id b1so4261172vsh.7;
        Fri, 11 Jun 2021 11:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/QyKO2sWDPRuH+xh/7ic5xA0q4lXz7dWRKEZ89NMiBc=;
        b=s3vIxum2BL2xN+cTiHzvZzFCguayWxjbWpyFChiofj4QTNiStqXSMOx2y3ictR/qaX
         ay6QOxKU94H2ATS8hnkBBt8i8iK7sl+ObtgdiRZAF6ijEQEjkIH2F2c67Q59eAnh8FpH
         1LdW3VOC9LTePnatXADlIFrgbzc3QkT/PtGyItbtFM0aeXJXIdo8tsmHb45Jk3zQIglU
         sep2aBwYfegT95kS5FsqZv+ba7XVVoli9MGEZbd2R6m7Dw/EJ5enzuZ7oAeEajF72cpb
         zkIX9VdTul6c1rZxkCXQKuS2JYaoBcHMmpBtTog9tSyfMKMSr017BHRXqmAClDC7IFuH
         0ISw==
X-Gm-Message-State: AOAM530a/pjdUhdJgG+gq58KuzN/AnhLPPpgLzGUlHyhawEkL2MTXNk5
        PW+bhDDnw68yVOsZ344TceRhzQgNRHf4jtSh6dAUL/sr4UUWgw==
X-Google-Smtp-Source: ABdhPJxKpLIukv3+hXCAEtgy5XgKF+PqMiSYY3kcEcOkNqeN7r/uF4Q0MaxqvPfExI0gyVzU4ZW2v8c/1jmbKuNVq2k=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr11191098vss.18.1623435801977;
 Fri, 11 Jun 2021 11:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <c381ee2526074e02b6058c489f85cfdaee582713.1623419587.git.geert+renesas@glider.be>
 <9b1b2a44-348e-5453-d767-d5c69a0869a7@denx.de>
In-Reply-To: <9b1b2a44-348e-5453-d767-d5c69a0869a7@denx.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Jun 2021 20:23:10 +0200
Message-ID: <CAMuHMdXE0kipUm6wqHsrFurFkviU_nRJJB7cg6z1XwEvpEewGQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: touchscreen: ilitek_ts_i2c: Absorb
 ili2xxx bindings
To:     Marek Vasut <marex@denx.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joe Hung <joe_hung@ilitek.com>,
        linux-input <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marek,

On Fri, Jun 11, 2021 at 4:20 PM Marek Vasut <marex@denx.de> wrote:
> On 6/11/21 3:54 PM, Geert Uytterhoeven wrote:
> > While Linux uses a different driver, the Ilitek
> > ILI210x/ILI2117/ILI2120/ILI251x touchscreen controller Device Tree
> > binding documentation is very similar.
> >
> >    - Drop the fixed reg value, as some controllers use a different
> >      address,
> >    - Make reset-gpios optional, as it is not always wired.
>
> It looks like there are now two drivers for the same hardware,
> drivers/input/touchscreen/ili210x.c
> drivers/input/touchscreen/ilitek_ts_i2c.c
> The ilitek_ts_i2c (newer) seems to be derived from the ilitek example
> code / driver, while the ili210x was written from scratch as far as I
> can tell.

I'm not so sure they're for the same hardware, but you may know better?
https://www.displayvisions.us/fileadmin/html-seiten/eng/pdf/zubehoer/ILITek_TP_Programming_Guide_V1.50.pdf
lists only Ilitek parts handled by ilitek_ts_i2c.c.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
