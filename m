Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9A732670B
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 19:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhBZSpt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 13:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbhBZSpt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 13:45:49 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D92C061786;
        Fri, 26 Feb 2021 10:45:08 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id n10so6725923pgl.10;
        Fri, 26 Feb 2021 10:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SsQxjRo6o2sXEjT0Bdd62IcugWVcc6riscm785kq/Fw=;
        b=hEZHnq5+GNkj4oYFjqunlmC30yydTOpuuSXpjmTqAxdvN2NmsQJc52Ue++SNVUy6i+
         FqjjrhEU+idNKt35ySfjk8JPuvyN/i0SrhniN/fH9CNpSL8ErdpC3OsaPk6srzdFJI7r
         cd+gQ1Fp4LUrp3VIMXGA8mFgonWQwnY8p7rDlzljKLvCTxnPqxAa5jnWIxwRvt66cYQu
         bU5VQ/JwM8Ba4+iKeE/LIP787rDsgjAlrHVht5r5OGvavowVI6FDqbmTu05/kWh79BSm
         hjelDnq1wVDCAcQ+EgL4EpR+4mihrHo7LMlf3KGn42Qu6M8V0N36KS2FLatBTY4goizR
         NjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SsQxjRo6o2sXEjT0Bdd62IcugWVcc6riscm785kq/Fw=;
        b=N69A2Hi1hXzwiXZF6eGwrYnSm7SK74glVkZgsLRvAm2D1egyvZV6MN80Fjq/b1+ov8
         vTJXPCXg0L6qmIWVnjZ/FhquDmXmaLMkfrRDZ1G+ZOEJYE6Ud+k6bgeG3g6z7iOLo2wc
         cl4MYQHku038kz1xZGP2Vplr7yTzEDK3hujJ1ntuJ+aawT/cM4Ci5xkz2j+OZSKgh5jU
         7y/L1zUTUBxjbtVrdqr4O7M9d/bkZzTMfppBpuSWMl10K6s3Un9mO7o35z5nvKT8sXGK
         hSTGBYFo9pTc4TLJsJcEIDnKcCGMxw/9l8d9h647fAf29Ba2Rqjop55MSeCgU31OmTt/
         clqQ==
X-Gm-Message-State: AOAM5328SGcEWCLt8PG19l8xAqjWqFBc37/s+AgJLgs23VibxZFE7z3Z
        Ff2pkfVJdt8z/p8wVe/85Kd7Ug81fDgGQxiC9Po=
X-Google-Smtp-Source: ABdhPJwfnBv3uI3rJsNrKbMYPBH/gfi7sKlh7iSB9/h0tXl2DHRSzqK1wfhFzY96jkjq7k7zacQ5RXRLWi5X4g5FA7k=
X-Received: by 2002:a65:4c08:: with SMTP id u8mr4030882pgq.203.1614365108299;
 Fri, 26 Feb 2021 10:45:08 -0800 (PST)
MIME-Version: 1.0
References: <20210226183854.11608-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210226183854.11608-1-andriy.shevchenko@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Feb 2021 20:44:52 +0200
Message-ID: <CAHp75VfgUH60a75w+PVmUZAagiFtndVbcgH4SOAJ=4S7zm6guQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] HID: i2c-hid: acpi: Get ACPI companion only once
 and reuse it
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 26, 2021 at 8:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Currently the ACPI companion and handle are retrieved and checked
> a few times in different functions. Instead get ACPI companion only
> once and reuse it everywhere.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>
> It depends on previously sent patch that moves GUID out of the function.
> If needed I can resend all of them as a series.

Oh, I see more improvements can be done, so, I will send this and the
rest as v2 altogether.


-- 
With Best Regards,
Andy Shevchenko
