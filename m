Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F89A34E5E4
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 12:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhC3K5C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 06:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbhC3K4p (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 06:56:45 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910EDC061574
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 03:56:45 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id x17so15968174iog.2
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 03:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+TRdqaiWDtO6fwtyYxfcLMc7kcDTf2tdDN10R86Hrmc=;
        b=tpbsrD6s69adDrak/skfH+MJWP8D/y73YyFMHXXsWy+fFUCInzhmq4L6//CFFBEsdw
         7Cg91O2JcPUgJyXXZYWaUfC1QSl5k6p6OnCbH01XTfjsC6jSAISobwackD3qUlJOO7EV
         HFH8ks9UFmKIJ29Gf2988A3BP2iF+0PouK4hp8x6tOmq8hXLNAppc5mMI7BvfCvneZ6I
         lEAXCepxvfNQw+irxhdc/DHeTLI/t0awrZBa88mcGuFKySYwAbsLlUE0erNq7iplxBP7
         HGeUzSKNIRqLs60pglWlP1fpG8cxsId6nfnMuyKrwqq8jtp25B11nl2nsNiOEXx0Ah3I
         e/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+TRdqaiWDtO6fwtyYxfcLMc7kcDTf2tdDN10R86Hrmc=;
        b=emOdXEkp7uRff8wEkkGpkkvGaP9n2YFHyhLxeACVkfn96MNYFr0DLkMgDZu6Ys6wlP
         0S7SX/6IUcEInCdBd7jJ9WvKIyyyvShXqcYb6+1gGysLaIJACYwXgsskkuqUYStlwDIQ
         nQqMycZMYFkYCG0s7A3Yndb1cM1J1tpGTZ8M1AbUJCNthhm8d/k15SRHG/nyVb2Hq3I0
         bEL4xW8liIasJiAEz4h13SvC19dSdPAKpYCQMpxilmLM9akUCqxqFWPkN3O07Kk8MYF9
         QN6dxRGxKhnzDW/GKM/d2xT+UepgZhr86C0cFHq+JJm47EkrJcNxspIEQ4UaKjIobfNl
         w9Lw==
X-Gm-Message-State: AOAM531j40QjiftHMZdGoI3ubChwD6ThkR3CGMxv30qDVdA1LcQffyFH
        ky9crpcumFyLfO/g7lE7bmI9l3CPDr4TjjfkSYwLPQ==
X-Google-Smtp-Source: ABdhPJxOqdJp+P3WorJrENMDlGi+p8VNpHsU8ts78sRq2uv+zezGYeD+IxBKqgoQ0oJs6Ujy5bSvCaAHoh4FPRj+uFA=
X-Received: by 2002:a6b:e312:: with SMTP id u18mr24132259ioc.58.1617101805103;
 Tue, 30 Mar 2021 03:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210330085424.2244653-1-linus.walleij@linaro.org> <20210330085424.2244653-4-linus.walleij@linaro.org>
In-Reply-To: <20210330085424.2244653-4-linus.walleij@linaro.org>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Tue, 30 Mar 2021 12:56:34 +0200
Message-ID: <CABxcv=kwy5jvMnWPSVVRsnZ2T3pobR73sCwUbnjrRUHz5_nzFA@mail.gmail.com>
Subject: Re: [PATCH 3/7] Input: cyttsp - Error message on boot mode exit error
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 30, 2021 at 10:54 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Provide a proper error message when attempting to exit
> boot loader mode and failing, which is something that
> happened to me.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
