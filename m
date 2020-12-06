Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C3E2D0594
	for <lists+linux-input@lfdr.de>; Sun,  6 Dec 2020 16:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgLFPL3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Dec 2020 10:11:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbgLFPL3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Dec 2020 10:11:29 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C242AC0613D1
        for <linux-input@vger.kernel.org>; Sun,  6 Dec 2020 07:10:48 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id 23so1349520lfg.10
        for <linux-input@vger.kernel.org>; Sun, 06 Dec 2020 07:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+kqirm9K0MEr3yFdBpwzTjT54V81bqRttzYS3cfgP6Q=;
        b=S//yT18at+GueB/VS+gOQXdYQwbob+wGz5e49M7fmUGlPYASGbNCeArGjqzHBdkobW
         ap46Ns6Ean+lBCQHt8v3FcPRDdSDQ8R8nYtY5DAEVKiB+1okzs429sXDKnCuVCWSHOIU
         Ju/j39yrmaZ0q6x1J/AAxkf2M0XgzK28jZpErPeCAojw4A7xGXTFXBHR9S2ABlNmsZAO
         okLPWP1rIAc1sih4ljWolKbfSltVma/mv1/SrGdvyTZz33lrAc/zENRUftMQxfAVU33Q
         nZhWWLZ0h/jwDc5DesQDykZMmJbB7fkQg8oTGTrF4zhV9vk1XYwp8vXGV/OMbcNluIyF
         u87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+kqirm9K0MEr3yFdBpwzTjT54V81bqRttzYS3cfgP6Q=;
        b=FWQE9GNUNF+xlJx1gGA8KBtJZxxTklcwqxUE4+SzVPqdPfG0y/thBNFLsSZg31Wlbe
         Ev+Xzlggt/iJAqxJ60Xnfc3Cip3nsmG4DWv9o2jfMF71sb2QrG93bM5yUVhe4vmxDKT9
         4g83omh6fJjiYnr45qkUHTYxVf8DGaFdfO1BgFspPPd3ZPtY1Et8z5YVD6+nyqwKdb8b
         4oBae36OKmIk80Tf3ViVE7gcLg1O6XYtPiRhcKMoXzLJoj/HCkw1zVQ3B4pRDjBRSytF
         EUNrnUclUZiv4pgxVnzuzpZHeGxJZSXcDuwh5DuPLzwdS+dtdJZvKC75xNnr26twG+34
         FQUw==
X-Gm-Message-State: AOAM533v3RLbPAMcs833DmPJMcddjU9kPLmRbF/ZD9rbhG0i+zhJz4l2
        BF4wh0zEInqIUxakMy9eB/e0ECoZZpQ6PjfyDKfq6Q==
X-Google-Smtp-Source: ABdhPJykQzWJfnZ14AtasRjARtDWDmsirWXDlKu/iI7igC0Ukl/KASZxncmC3Hr0eQxQ4x2RwTGmnGpTyWGCCNwHnss=
X-Received: by 2002:a19:5f11:: with SMTP id t17mr6296440lfb.572.1607267447148;
 Sun, 06 Dec 2020 07:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20201203131242.44397-1-stephan@gerhold.net> <20201203131242.44397-2-stephan@gerhold.net>
 <CACRpkdadiyYK5i8+TaLqxjmp4mUJ8eTiyZkgPXp-Qa2+CD8DrA@mail.gmail.com> <X8zOXpJ7fjIlgtnP@gerhold.net>
In-Reply-To: <X8zOXpJ7fjIlgtnP@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 6 Dec 2020 16:10:35 +0100
Message-ID: <CACRpkdakVk42kXqSXoCsxpW3-PvFn7ZRd5DbSj5Ck_QZEb0P3w@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: Input: tm2-touchkey - document vddio-supply
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

On Sun, Dec 6, 2020 at 1:32 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> Actually, the pipe | effectively means that new lines \n will be
> preserved in the parsed output, i.e.
>
>   something:
>     Hello
>     World
>
> means "Hello World", while
>
>   something: |
>     Hello
>     World
>
> means "Hello\nWorld\n".

Oh that's nice, I learned something new today :D

Combined with fixed-width font it will indeed preserve ASCII gfx too.
But I don't know of a way to guarantee fixed-width :/

https://yaml-multiline.info/ explained even more. Nice!

Yours,
Linus Walleij
