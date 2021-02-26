Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3803A326714
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 19:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhBZSrF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 13:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbhBZSqv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 13:46:51 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E853BC061574;
        Fri, 26 Feb 2021 10:46:10 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id a4so6718950pgc.11;
        Fri, 26 Feb 2021 10:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bik67bC+VPEr6B3Lz4hcr2FlqWcrtYvfjWzVEu5+/Nw=;
        b=RRgU2nuiLfS+5EWr0605E4KXM04hiGztj9hSXr9ReQZ7LjpaQKlwQIyadPmVaAl0L3
         yA7/Co4kpLhin1gHnRJvlYgUDpNHuNQKBWErADUBGsqpp1qZDRm0YfhjSKdZcgbRbYke
         e1p1eq5pawBXRadzo9te2UiFrQGT28wH+39BfWjQYD/R7Ld6CgRq9sMWwnl1ErhpObWV
         C06AlCa8hNavzuMyxI0J1YRQaH1srwC5IMYx/Z2wGwaym8hI5CyO6KfJHLznB2k8OPws
         pGdZ89w6fTFVMvDs6yGSsv/F3LloB2OtdDu0wYhuhXA5Oc8XRlgtVsUIipD71SZBvDU/
         7HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bik67bC+VPEr6B3Lz4hcr2FlqWcrtYvfjWzVEu5+/Nw=;
        b=B9EMrpz2523PrR+dtROJGYyKmIykielzO2okmmcs1gyaNuxkSYW58RoUW8ow8Lwh1a
         GG/t+uW6v00DHxmpbrfNOZ94T+tTnP7VNTMZJP7R12yEAzgEGqrVKKkvAgViJHX0UYnU
         OSMAz/tTJbZbp3RW10L/8XRrd0TNEwgmPC3niQVTkDoIKT8X6ImFHz+oWe1ijM5R9xnQ
         dG3/IBLLAhzmGxGtbRWJWj2dqm7B8nDCLLJKAZcRHPOPzPWZis1xvycRHJdEK8yDNoAN
         ybJXPItWLW8d/YCvIZC/Qf03VUifmDzkrCNfjnAwpdFALU8ijYthgdVqNDC/jXi9vC8Z
         ATxg==
X-Gm-Message-State: AOAM531paduaiqZh7XyAtTfYSqtaqKQoHrkYBvNvSSNi44r2OL2eOJDb
        khT1vFvdWPE4kAKMz8t+HSyuaKe77Nhav7G+ARI=
X-Google-Smtp-Source: ABdhPJy5KjrJ8QwJDGcR3M92i1JQs86bXqTFq4tgHhepHJSswwHhOyTl0Bl3YSMvL7wGSwkosyau8v1t6Yz8eJQKDSE=
X-Received: by 2002:a63:ce15:: with SMTP id y21mr2973540pgf.4.1614365170446;
 Fri, 26 Feb 2021 10:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20210226182825.11394-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210226182825.11394-1-andriy.shevchenko@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 Feb 2021 20:45:54 +0200
Message-ID: <CAHp75VfwaxOHA3hUDCXVSiOrNfrT4jNxd6+d6DmL+mZDyy_68w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] HID: i2c-hid: acpi: Drop redundant ACPI_PTR()
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

On Fri, Feb 26, 2021 at 8:35 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The driver depends on ACPI, ACPI_PTR() resolution is always the same.
> Otherwise a compiler may produce a warning.
>
> That said, the rule of thumb either ugly ifdeffery with ACPI_PTR or
> none should be used in a driver.

Oh, I see more improvements can be done, so, I will send this and the
rest as v2 altogether.

--
With Best Regards,
Andy Shevchenko
