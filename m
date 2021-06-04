Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204D039B3FB
	for <lists+linux-input@lfdr.de>; Fri,  4 Jun 2021 09:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbhFDHgO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Jun 2021 03:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbhFDHgO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Jun 2021 03:36:14 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541E0C06174A
        for <linux-input@vger.kernel.org>; Fri,  4 Jun 2021 00:34:28 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i10so12678918lfj.2
        for <linux-input@vger.kernel.org>; Fri, 04 Jun 2021 00:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=umDeUiRVN0OEBZyLxYLwMK7e3EBnPfwA6cB0Abj39Is=;
        b=HtQeGTdvlM7K8TpGaKxws+wTG0byUsEvl7X7mV/Ent6JD38hQ6hr1Ow8+s8RQTQyAv
         mZRBVf1t+L9Gt7P5+i2Ds6Q5Vmsb6FubV4ey5saNk8ea/WG1gACzg+zZY2baZ0V6mCnv
         LwKKvxc0jHZLv8AtA0EvzdCvw9rLqqVD7+gm+YrWaz3NstqzfKci5Sr5BWwXz7Ad8Ixa
         1Z6YShoGWui2bWT5LdRCzlTBWSnp6n7X5UClZD8OXW33kFAZc47fvzxTWS5Bb5q2Q/Qf
         UfdMc9kolAopoVgWDyEQf1BwKcCK4JPCTl8+OAbMgKJZJ7v4fGInnMKkYyVOQNqQBqKA
         XFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=umDeUiRVN0OEBZyLxYLwMK7e3EBnPfwA6cB0Abj39Is=;
        b=DJnOWP0MIzCJMQ3jHsyY+5kHDfjd9CsGJU0CIY13vub7w8hivWHMIJCUrxZwZdn17j
         pzBI/vxcLw3FzFSzxwk7dZZpFDT3CZAkdcKQ/sQtkcLmooCF/0ykC9/JP63KiDeUYv/y
         cdWR2J3pKL8RSXiipHiZwr6DivYAIixmaiipeTozk+zgl7dEpEPJmotwYHUkmesPbmj6
         VL7sHzZb5HhPUVXgaG31Z5bOH3Yn0WivF1JfqU+NRi8HsQizpruJ1pANvpJuyExAI25V
         QoJ3xW7dZ5sVQkLGiaROe/Z7Yr5xIb4637gpFPWnaBzWwWNXN3EfXdDlwrfjL3pxjYnA
         sxoA==
X-Gm-Message-State: AOAM532scG6SVBqfvGofbS9ffggVloSPvRXX7iCnqnVuQtWPqc/DJLu1
        NFkHfYeo0HHiCciwIdSUMche/drwR5qm3FsLAqVvshfZXM8=
X-Google-Smtp-Source: ABdhPJxD0ztdk8wFbqKvZzUD7t4KGTxqBs+lbAKF4+RFbKc5CQNE3BKtLyCFrDacGaYf4K7IZC0LsM+HDEEi33Qd0GI=
X-Received: by 2002:a19:8157:: with SMTP id c84mr1916614lfd.529.1622792066722;
 Fri, 04 Jun 2021 00:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210603043726.3793876-1-dmitry.torokhov@gmail.com> <20210603043726.3793876-5-dmitry.torokhov@gmail.com>
In-Reply-To: <20210603043726.3793876-5-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Jun 2021 09:34:15 +0200
Message-ID: <CACRpkdbgavGEn22psjd3+kXO4j0YVV7CCX7=ks7G6KvpS5wyoQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] Input: cy8ctmg110_ts - use endian helpers when
 converting data on wire
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 3, 2021 at 6:37 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Switch to using be16_to_cpup() instead of shifting and combining data by
> hand.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
