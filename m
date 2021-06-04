Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3566C39B3FC
	for <lists+linux-input@lfdr.de>; Fri,  4 Jun 2021 09:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbhFDHhB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Jun 2021 03:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbhFDHhA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Jun 2021 03:37:00 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAAB7C06174A
        for <linux-input@vger.kernel.org>; Fri,  4 Jun 2021 00:35:14 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u22so10360888ljh.7
        for <linux-input@vger.kernel.org>; Fri, 04 Jun 2021 00:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZB1T1DHkPVP0r0L6hBz3Sq0kBplbr3nbiSFeWfKqI70=;
        b=AOSJjKiWgGGV00GAc/KAD9lNn2F5uoOBaX25dhBw15InFr4yDN4p5mTLrwQJ5hT5JH
         fZFu1rqXl++MmWpOcAIE6O9lMD8XCjVdqtaIv7cbs5G1MGJ9dLhiBzsqef6oCFtGHGR3
         k2eCgNzw7dNaNqy1zyIdxL9nhPUsJP/NafXPt4F6AMMUyE9AxyHzbqThM5dlD6lLWFke
         4s/1Ku9XCmnbjfELdzOkJaMWZ4cI7JzlX21PMC9K/0/IZt9tflDfMSh8RD0ijefqt+DP
         /nkClkZDUsESt/39vXm1xx3witek6T1cLWt/VHB1SVdDWrdVxWLZgII/HOEqAOZpw+aa
         EBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZB1T1DHkPVP0r0L6hBz3Sq0kBplbr3nbiSFeWfKqI70=;
        b=qUQYsozUNnUeznH2gyVK6blDRfe6ndKHz9NkabGw2xvmBhI7hNX0xjwcN7SPzLkGRQ
         HzcnIvMSKY8c9/vYMYyvJfTUPQrhdrlLS4DfBUGwEThF+QG01R9scsqzmKIj1WGyv9jO
         zdYvRZ9scjZ8Yfr2Pj/ZL6qOcRW/i+K6WsRtym4oxMygWmE2N6klt51cHtvCe/8M3jwX
         v1VmDTS/bqkKKPilO/97rp1DZTyL6Vxgazq8Dy8yUIbEJYclN4QYJe9TERUfjF4sInJ3
         KAVWqGCpqd8hxeOkTqHWLun+PKiqpdZEXYbmAY5XLBiQJG9L3Mm2/j1aRZAeghCSdDSw
         vSUg==
X-Gm-Message-State: AOAM5314R8nSclKWcaiENrPEmQcB/ZKsG872YHVkjQE9fq8/SLiMWhZK
        TBxW9q2gYu0jLqbKVsOKc49jKWtDEdV6A8yl95mH7Q==
X-Google-Smtp-Source: ABdhPJwUxtt2x8T477r5UmZgH3fEMx7PRoCzilCfGWsx3C+cO6kkau6PqFl4wCZqJd+qVW6qf1vBpXQbA7SzdQwRl00=
X-Received: by 2002:a05:651c:1501:: with SMTP id e1mr2629528ljf.74.1622792111611;
 Fri, 04 Jun 2021 00:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210603043726.3793876-1-dmitry.torokhov@gmail.com> <20210603043726.3793876-6-dmitry.torokhov@gmail.com>
In-Reply-To: <20210603043726.3793876-6-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Jun 2021 09:35:00 +0200
Message-ID: <CACRpkdb1AMk6Dtbj2i6uQpL_YOd5V+-PSZ48kX1z2-xrwa--HQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] Input: cy8ctmg110_ts - switch to using managed resources
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 3, 2021 at 6:37 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This simplifies error handling paths and allows to get rid of
> cy8ctmg110_remove() method.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Neat!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
