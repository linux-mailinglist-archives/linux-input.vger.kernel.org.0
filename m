Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1F0334C5B
	for <lists+linux-input@lfdr.de>; Thu, 11 Mar 2021 00:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbhCJXSg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Mar 2021 18:18:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233624AbhCJXS0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Mar 2021 18:18:26 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48168C061761
        for <linux-input@vger.kernel.org>; Wed, 10 Mar 2021 15:18:26 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id p21so36434265lfu.11
        for <linux-input@vger.kernel.org>; Wed, 10 Mar 2021 15:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ETYOYkWWuwEOmh8g1BpUkeMpw9R/2k0WlMIbJjFgbe0=;
        b=mywdMmMNJWXNOvpzRYKiSkJnDeJYqEEFyJbe/D/1vTty0KMngDXw1kVVCfQiNgixNp
         XjR6pFSE91kpGFqSKsZ04/LU40yddLUSHofebFzU0prJ4DMhiSHnUo+tqLTLqbSaWGwa
         XGcnB3+gHEtr8Z/o/Dygi76jE3pgQdew6mAhbclLOcxWeBa7qw+3Os8OeaHDhAYJALFd
         aNERZfBzwon883KcCGibf2Xa1cRLUKXI/SVbL3O/aANTfhh7ZlIHP1VMSnFGOTeaU/kk
         MjLDyqPf9nkDvQdELIJGpZpGTB5lQk4kWH0b1uG98uvoply2zwp59obknZGLFl9wPP2P
         shvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ETYOYkWWuwEOmh8g1BpUkeMpw9R/2k0WlMIbJjFgbe0=;
        b=Baylwj/E0PKc9vO7+ClDFcyWzaGli2H04Fb33JE5JespUyskW3uu4nhUP2c2qCfndX
         iyJLsA1p7YL1tP5LsvxCCN/TnMUP5o/m+6ApfqDlWtr0xSJ5ndO4n7s/LU/lVoSZMLI5
         Muh2IKAJ9c/ukRcBw1Gh/BmRN+SPsyhEBV7bVEqvXyCTxc4g7qf3Y5Ikz6AiGDpMWu4T
         us/W0LGyZJv0+qfEY4pJVY9A44HM87fu/AU4GvuZNi/HCMrG/nakjl2C3NCX1LOIk+Ge
         heD2bY3SAXL6zdBssr1+EUW1rspoA0NYJ1kl0aLftSy3b7YFw0hVIc7v30A4Xjp94Gi6
         kkrw==
X-Gm-Message-State: AOAM533QBaOZ2bWq2TVoOikIC03UBDjv45zopFNco71y92yW0oWo0JjQ
        MvsTISZsDblO/Pbv14Z7PoBPo8Cft75AW0G7A/Y3uQ==
X-Google-Smtp-Source: ABdhPJwmNWGQITUCTc5qmeWRhSOQqyfgdyu7l7/Uv7dVvTj6QBJ8VXjebkqy9nB3G5/ztId3MDTZN+9ZZg9bIijjy98=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr498944lfo.529.1615418304736;
 Wed, 10 Mar 2021 15:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20210305153815.126937-1-vincent.knecht@mailoo.org> <20210305153815.126937-2-vincent.knecht@mailoo.org>
In-Reply-To: <20210305153815.126937-2-vincent.knecht@mailoo.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 00:18:13 +0100
Message-ID: <CACRpkdbtwjVjgv-sXG9_-j7+wSiqP_K_=4dS80JhN-F5SDV_Qw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] Input: add MStar MSG2638 touchscreen driver
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linux Input <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 5, 2021 at 4:38 PM Vincent Knecht <vincent.knecht@mailoo.org> wrote:

> Add support for the msg2638 touchscreen IC from MStar.
> Firmware handling, wakeup gestures and other specialties are not supported.
> This driver reuses zinitix.c structure, while the checksum and irq handler
> functions are based on out-of-tree driver for Alcatel Idol 3 (4.7").
>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> Changed in v6:

Looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
