Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B14744A5D5
	for <lists+linux-input@lfdr.de>; Tue,  9 Nov 2021 05:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242685AbhKIEm1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Nov 2021 23:42:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239534AbhKIEm0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Nov 2021 23:42:26 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9428FC061766
        for <linux-input@vger.kernel.org>; Mon,  8 Nov 2021 20:39:41 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id n66so7957258oia.9
        for <linux-input@vger.kernel.org>; Mon, 08 Nov 2021 20:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Pz92NevhlQIIHyCP8oFIg+pYIGx0bc+HYq2+R7qC0s=;
        b=VXV3qFd6feUoGA0Dj9phwKZpS6bnzrgOGgkh4jB6zxhBHGrJWiE6ZPWQgiOL0hf+4y
         qPFNTS07kLxXPEKjgkJZzla9vgUarIHavmn1Ebk5vhwk+FFIBNaaOlm6pzP9GD2NL2Ao
         C0CyaC3M/FdxyahUSp/7HVE4/xD8h5YPBFjhow+/rSFRhtkFwEb84oV98XeX7HDzDfJU
         dxozTPS9XosCvtTuDh4cAldDz0QIS5FIGEnB1k0U2Hj1fzrgwxhka4ppO18Pujf+CBPR
         yZzAQaLyzeGmKVuwpo731edvn++wOhyMWouW06nGXaBFbnfau+FdLMn5PFgKordxB1wv
         0eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Pz92NevhlQIIHyCP8oFIg+pYIGx0bc+HYq2+R7qC0s=;
        b=VkuSe9T2Ka9l+VtIq23L4Ik6vmPAe32dGhAVgpIU9GolAbIXc5Uo3pYlmvBuEJnphr
         /UGrmZjLbZu93i/pA2LhHqjDYZK/y2QXLNjUK8Zo4MynxHRlqDcgJKugWW2/nAxyii1y
         zsomFzzEOPtjIumBC54GTmGe9d5O1lbGNCxKtOzv2+pWsXo9ZYL7TtoMVISLIQYW0LId
         FVsn2qDGGBp/Mq2wvdHTbGsC2y1RszbZHzSkTKNia4UEhM8T5dCrnkv097UAMgDEj471
         5/N/4eGIspZWkAEEarM0COcMqD75wQgu9u9LrgfgkR3edguC83oM7ZT9QphwiapunoLX
         pUKg==
X-Gm-Message-State: AOAM533/rg9lfJykQra+Ih16/kp2TStkkGsiyiyIuW7kr0TYXYshwG3c
        bJnwqQaU3nzkoKeWKcO8jWhYlElsg3n8hlBOElxLag==
X-Google-Smtp-Source: ABdhPJx4wXgHEOdy5PVg8KK2lc3tL/e4WuUSdMvP/hxe2OguXf8K6B7xBS6H6P73oUEw7ixFmlMFF5XtvO0seM32+74=
X-Received: by 2002:aca:120f:: with SMTP id 15mr3108464ois.132.1636432780940;
 Mon, 08 Nov 2021 20:39:40 -0800 (PST)
MIME-Version: 1.0
References: <20211027181350.91630-1-nikita@trvn.ru> <20211027181350.91630-3-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-3-nikita@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:39:29 +0100
Message-ID: <CACRpkdb1LJkKd8L6XtbDbvenV7=nSLPBqKYkfiVH4UNO64c=Hw@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: input/ts/zinitix: Convert to YAML, fix
 and extend
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

> This patch was previously submited here:
> https://lore.kernel.org/linux-input/20210625113435.2539282-1-linus.walleij@linaro.org/
>
> Changes since the original patch:
>  - Use enum for compatible list instead of oneOf + const

Thanks for picking this up. I was meaning to get back to fixing up the
Zinitix driver but haven't had time.

Yours,
Linus Walleij
