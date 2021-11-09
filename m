Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A8844A5D2
	for <lists+linux-input@lfdr.de>; Tue,  9 Nov 2021 05:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242644AbhKIEka (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Nov 2021 23:40:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238701AbhKIEka (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Nov 2021 23:40:30 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D47C061764
        for <linux-input@vger.kernel.org>; Mon,  8 Nov 2021 20:37:44 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id t19so1270129oij.1
        for <linux-input@vger.kernel.org>; Mon, 08 Nov 2021 20:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dodHiJ/i5+yBi7D79YaFpKUD7A0B39/NZgj04F7HTkw=;
        b=bxdem1QFzTvWY5Y2FugMEGhusz7KtT+Tg2/aELkYspP8+jbBn9eqwHlvusv7pgcd7j
         6D6ZszdZelH0gPfDb3eOZuBteKvIglrJWvz1URYC/chQn/SbHArSOzzGEUv45u38bq87
         axSySjtpwqup5cMdp2z/PHbwGW6nfLqXAfIInnVA9xfDZyNcTM87yBLQPTNLICf6I6w8
         436T6zDADKFoCAUS/d9Xb2gAVNaWuT2h8+isOxYbofYxlpSq5W8X4fzh64opGShFwOh+
         +ApkXe/izP+lvWMHLDQpkKS6tlaI8ZVQcySl57rluNzK8LPb0LQJ7M7eKRoCzmUV7Rev
         XjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dodHiJ/i5+yBi7D79YaFpKUD7A0B39/NZgj04F7HTkw=;
        b=6dktOtBJqeLAmTNDPQwo1WoJlXXDl53FInpkwKFEKgDmGaQMizoCf6GV30cI+mMIJu
         iRzUcUf9VW7Hhm/PFxCNFVzeZJenE5/EAyNrTZv1mm502eKDyRUIpYX/Hb1d6p6vMrkF
         O5n6A1TBgzwMbKpz4ccPMUbCkU59X0Qcay8O5GWV5bcoKOoB7OIsbjBRPhHgydFKGgwJ
         XxGYJmXyrKhEyAHRR3d41TMTC8XIRX7B66YuxGzFcg94gXy7OVYtEFjmaWaMq0BIJ0l0
         cqSjjnVnaD2rbAGeZ6T4T3o87jSelN9deu3C8U8lK04xoGjq17y4PGUNxEFgz6MmIEmO
         ugbw==
X-Gm-Message-State: AOAM533CxWsJhh5L25kajMtNLzzyFIKfEc+IP856FzskgJ/nJmWGv+x9
        lNkXd5DbnaC3+7kP2srY1lVP/VHdaOXDlBt/P3p7+g==
X-Google-Smtp-Source: ABdhPJxMjFn9a+4GNqOWAH4EuafH57IWoIk8A7VGoJ9dRj8lPdTloVwkWYgqhbGYsB8vzyZye8wrz2mz+XEZdAbysWE=
X-Received: by 2002:a54:4791:: with SMTP id o17mr3362653oic.114.1636432664361;
 Mon, 08 Nov 2021 20:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20211027181350.91630-1-nikita@trvn.ru> <20211027181350.91630-2-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-2-nikita@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:37:33 +0100
Message-ID: <CACRpkdbnZ+U4GgaWyM7v62Ex6SNBMs-j6-pc7k1Wkan18=O+uw@mail.gmail.com>
Subject: Re: [PATCH 1/6] input: touchscreen: zinitix: Make sure the IRQ is
 allocated before it gets enabled
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Michael.Srba@seznam.cz, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 27, 2021 at 8:15 PM Nikita Travkin <nikita@trvn.ru> wrote:

> Since irq request is the last thing in the driver probe, it happens
> later than the input device registration. This means that there is a
> small time window where if the open method is called the driver will
> attempt to enable not yet available irq.
>
> Fix that by moving the irq request before the input device registration.
>
> Fixes: 26822652c85e ("Input: add zinitix touchscreen driver")
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

Good catch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
