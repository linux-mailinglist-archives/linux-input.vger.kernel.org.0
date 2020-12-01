Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B961E2CA2BC
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 13:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgLAMcQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 07:32:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgLAMcQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 07:32:16 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4C4DC0613CF
        for <linux-input@vger.kernel.org>; Tue,  1 Dec 2020 04:31:35 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id s30so3782386lfc.4
        for <linux-input@vger.kernel.org>; Tue, 01 Dec 2020 04:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tZ8dq0P9F9p+pZ/PZ+MEmBm121E6hUC+WWvZxPa4gDs=;
        b=bYvtKeXEKAhPJ7wrErUnqw7c+yDN7cgurPRuLZqusqZjtzQTQQ5enGeVh2lmNeog7F
         gwwrNnzKR9xVQL0eluTVHmAiIjSeZBEv5NY7qf1giUK9uEKJL09xysAyKcmtyKUDWkXI
         A/s7UbwvfVPzDuxrOyYXNZC5FzUBjK97aGJHp/lG2cX8RoODJQE8v2M5pO7fHVktprI1
         lg4M3S17FmWqHObarPpuZvL/+EE8mzeI8vsalnmFNvxXFgBkbnfJIyzQhlYmyjuSTa+Y
         m9G8XOxJ/McuoqrmwKBWjAAvMlXSJOwbtAQ03NgoQ43Z9hF3+hAU9eDx1IZ76b/LJSb1
         4blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tZ8dq0P9F9p+pZ/PZ+MEmBm121E6hUC+WWvZxPa4gDs=;
        b=DuhrqShPKkFcLnPcZ3vhTl40d40wPGlKj9ow/sYXkpkOI3vTrHPBz/M8nGzajefzGv
         ytqmKoIKS89TLVEk2k0ZU1qgYSw6pzc5i8quGHIz4sG67Yw0qoAs20xtRP6NkoQ9IXCV
         NTkxpvdid32CpymwB7DBnllWpAXJyjBhRosQ7eaHrpuVxTDPpsbDD4S/4hgz0i32NiNz
         epETY7IrVL29BwxhNhe2KB1pWBvOsEByOvWjETh47Iw9ZDWN0AjXIS54eGGvZtgEG1M3
         C0L4JtcGa1A77HQ8mnhvOhJBASKnukhCdlVQ5tJNzwr8pFtkZbD/pD3BMRUH6PWvqPOJ
         KnlA==
X-Gm-Message-State: AOAM532/iz+mxXpca+pXGZ0AlsveYpCJRJodCsRTLty0HB0apGqHK0DC
        OpO3mULQi/Ku/8VRfsrrel0HepHQziHOsAQWUDfSFg==
X-Google-Smtp-Source: ABdhPJwkfGwQZqc9lugJDb5y4PrDFaQkWEnl6A83JQbwC+Bd46g/cTjSx+ZiAafj+dHchHRvSVwxpUYhv7HdDQkAywI=
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr1016880lfq.585.1606825894176;
 Tue, 01 Dec 2020 04:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20201128123720.929948-1-linus.walleij@linaro.org>
 <20201129025328.GH2034289@dtor-ws> <CACRpkdY8r5_EYAtWLL2vZQ8ULf6rG-VfgDe=7oveJQwiRXxTNg@mail.gmail.com>
 <20201130080108.GN2034289@dtor-ws> <49253725-7c3d-fce9-7000-6061ebe736bc@web.de>
 <20201201063150.GP2034289@dtor-ws>
In-Reply-To: <20201201063150.GP2034289@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 1 Dec 2020 13:31:23 +0100
Message-ID: <CACRpkdYjxOCWJroj8L5xQ=qiPoys+kT7pTKigu0kNYiahF0-ag@mail.gmail.com>
Subject: Re: [PATCH] Input: atmel_mxt_ts - Fix lost interrupts
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andre Muller <andre.muller@web.de>,
        Linux Input <linux-input@vger.kernel.org>,
        Nick Dyer <nick.dyer@itdev.co.uk>,
        Jiada Wang <jiada_wang@mentor.com>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 1, 2020 at 7:31 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Linus, I think I prefer swapping around calls as that makes the logic on
> mxt_check_retrigen() simpler. Could you please update your patch to swap
> the calls as I would like to credit you for the fix.

Sure I sent a new version like this! It's certainly more elegant and
it works fine for me too.

Yours,
Linus Walleij
