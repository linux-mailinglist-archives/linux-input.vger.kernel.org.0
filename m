Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A552CFFA8
	for <lists+linux-input@lfdr.de>; Sun,  6 Dec 2020 00:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgLEXLf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 18:11:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgLEXLe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Dec 2020 18:11:34 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C20FC0613D1
        for <linux-input@vger.kernel.org>; Sat,  5 Dec 2020 15:10:48 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id d20so12742187lfe.11
        for <linux-input@vger.kernel.org>; Sat, 05 Dec 2020 15:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m1UEZz6HGFFmSdASHfwbCskijV7GUrzT+a+Yt9fsFZU=;
        b=QxPctIMns7UAHl7Ywu+Oy9o2xkI2GRvggQ/tyMeKeOu6xKfFq3kz1Vqes/lt7DLO28
         75DJL3qYF1l2spY1c3NOw/DE4aeCnzH0tF/TsWY0m+9DGHVoCxtmgrWqbrfyvQvoA0Cp
         nICq/9VFHmU3pbgV77Rbikto/FeaOy3238t8+ECriapWRS5d5oVNEBuPdmVaxuSUq0QG
         UpA5BoAn6ZNsfyd6H0gPIUei4a8Aq0K4DZ1XTtF2AP7BN/1OZL10qZE3hUWTTDHvwnuz
         2ISh7oLE/arJe3ZMldQB5CoUP1RcziZs1QMRzZR2NMmFjNDo2h4cp2T5e4TgkmrIbhCf
         pHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m1UEZz6HGFFmSdASHfwbCskijV7GUrzT+a+Yt9fsFZU=;
        b=C8x4ipX0xQWzJEtxTS6o7CPjjeldUXD99SHBoICZIwLMSONMIxwz/NZnavDw0nWn8V
         rvaPKgQbugDYTNNvCsIYtsSQ6tb+pMiuQMU7g10XKP+RYitJSTEdR+PpMNB8WCaZVKvl
         FeLLpk7AbRtucH6DEnRbCvh175uDFFN5Hh29RWMaXKcTFNvcu9vswRj4m8o6/mfGQN+z
         kOqEhQVjRC/4Dl+eBacWb8PiWovplbBdelz+2HbVQFKpjuAwaje7ta3bhtCtKP+wpjvo
         S1k9hvFbvAyfhXeIxSP3dFXQzgsxlWq1T6vw0IQlY+J4QlxjHSkVX+ZDKxJ3U7cGf+o6
         Rk+A==
X-Gm-Message-State: AOAM530In/TtY3+p/kWYXZJ0oXA3wYNMdacBn4ITVLQUdHB8d5AkrRrb
        fzfVQVP9Jv3AIel0oS1/bCeI1SnistJ04kvGcYv7kQ==
X-Google-Smtp-Source: ABdhPJx6u5+LNHuD3eb5jh0scGEPapSyihps7xV7WYYMjWESuWf1iWHgbe3YuYsMsR1Wy+M4DYrGQC2NB28GRB/Sbf4=
X-Received: by 2002:a19:8d8:: with SMTP id 207mr5324591lfi.441.1607209846988;
 Sat, 05 Dec 2020 15:10:46 -0800 (PST)
MIME-Version: 1.0
References: <20201203131242.44397-1-stephan@gerhold.net> <20201203131242.44397-3-stephan@gerhold.net>
In-Reply-To: <20201203131242.44397-3-stephan@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 6 Dec 2020 00:10:36 +0100
Message-ID: <CACRpkdb9ZMJCPF9nGSX2jzkuj4g-3rCb4m0nHuBfrSFT-rPF_Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] Input: tm2-touchkey - add vddio regulator
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 3, 2020 at 2:13 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> The Samsung touchkey controllers are often used with external pull-up
> for the interrupt line and the I2C lines, so we might need to enable
> a regulator to bring the lines into usable state. Otherwise, this might
> cause spurious interrupts and reading from I2C will fail.
>
> Implement support for a "vddio-supply" that is enabled by the
> tm2-touchkey driver so that the regulator gets enabled when needed.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
