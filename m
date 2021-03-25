Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49EE7349951
	for <lists+linux-input@lfdr.de>; Thu, 25 Mar 2021 19:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhCYSQT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 14:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhCYSP6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 14:15:58 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94581C06174A;
        Thu, 25 Mar 2021 11:15:58 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id j25so2910935pfe.2;
        Thu, 25 Mar 2021 11:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fFkDrhnvgiRe+loeaLRgeNukDq8LEqELpmrdaCkopMk=;
        b=HznVWzNJ1uepmVFF9ibp2m0G4d+aUeOI9jzVNUXtjwhubrus/JeqYekm0Lw8o2BFas
         IUMOJ1r173SjyJLkPug3QBVlY/z2L9zJ+z5NJKsyFfSYC7Nfhr7ldZO1AWt21OkKRmGn
         M6RGbv7fV86asTQEhuROVut2nwiIR9XEs8Wt7A4QtWQjn25SrlVtbzvKFjeblhusWXBA
         ucHR46nw/BgE0ZFr71nbNROo0jAWfgqC1K4TlEf86ZfPlChJ2+hVSnwgCbIIFa3zft6R
         AZjBY1msCu3CY+depDV/ShzBmRMk+2q5yzY3rWoKBaxrjmH2x0oWWWvYiRDU8erpjLsK
         dLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fFkDrhnvgiRe+loeaLRgeNukDq8LEqELpmrdaCkopMk=;
        b=ce1Fe5P/FHD5zkmMOGyugvVBo/9pPysJRe4YHcrIUKcXz4P4sbSKahLwD2VJ4vEtQk
         o/ixJiaciROrM3HB0axRyVkOiyBo01JRRZYGpbEym/IoELGijrxcbwN2d5b27uJnjDQX
         h8uuADvbW6NNsYPWbhQZmZc50rrbVWYdHX4hLNCBzVpXG/LL4aqNbD2SKY/nzh5fgJuG
         3v/ClXcHhwXB+IQdVV7z4IFxM5bD+GRv5Ng8+I/S/jg5gZwnyzJqiKObPRMq8LymzSyf
         q7f+ax/w8BQSwni1PQ03y26tAD7SVQnhOD1/1YztjJom/4OtZWrnjogalGwODP1Vj6WF
         vlXw==
X-Gm-Message-State: AOAM530zdHcdIWYBrkCwwWKydbI2q8ZC/Szf1XNqtE2ijTL2dwUmm0eF
        8fAj/2eF3ZTzFRQdY/LGr2c=
X-Google-Smtp-Source: ABdhPJzj9ne5PO3D+01uzhXw6K+GiAchPv6g8QNXVVUSEghBRxDYpUWhXoVje64VW97iM8PFp5/xUw==
X-Received: by 2002:aa7:881a:0:b029:1f1:6148:15c3 with SMTP id c26-20020aa7881a0000b02901f1614815c3mr9273155pfo.30.1616696158022;
        Thu, 25 Mar 2021 11:15:58 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:3991:e59d:d2d4:59dd])
        by smtp.gmail.com with ESMTPSA id a21sm6618880pfk.83.2021.03.25.11.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 11:15:56 -0700 (PDT)
Date:   Thu, 25 Mar 2021 11:15:54 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, Nick Dyer <nick@shmanahar.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] ARM: tegra: acer-a500: Add atmel,wakeup-method
 property
Message-ID: <YFzTWuUZbdXvnpHC@google.com>
References: <20210302102158.10533-1-digetx@gmail.com>
 <20210302102158.10533-4-digetx@gmail.com>
 <YFfLXLDIuRdj2bWs@google.com>
 <YFyZ0ejrSxWc3JZT@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFyZ0ejrSxWc3JZT@orome.fritz.box>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 25, 2021 at 03:10:25PM +0100, Thierry Reding wrote:
> On Sun, Mar 21, 2021 at 03:40:28PM -0700, Dmitry Torokhov wrote:
> > On Tue, Mar 02, 2021 at 01:21:58PM +0300, Dmitry Osipenko wrote:
> > > Acer A500 uses Atmel Maxtouch 1386 touchscreen controller. This controller
> > > has WAKE line which could be connected to I2C clock lane, dedicated GPIO
> > > or fixed to HIGH level. Controller wakes up from a deep sleep when WAKE
> > > line is asserted low. Acer A500 has WAKE line connected to I2C clock and
> > > Linux device driver doesn't work property without knowing what wakeup
> > > method is used by h/w.
> > > 
> > > Add atmel,wakeup-method property to the touchscreen node.
> > > 
> > > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > 
> > Applied, thank you.
> 
> I noticed that you had applied this as I was applying a different patch
> that touches the same area and it causes a conflict. In general I prefer
> to pick up all device tree changes into the Tegra tree, specifically to
> avoid such conflicts.
> 
> That said, I didn't see an email from Stephen about this causing a
> conflict in linux-next, so perhaps it's fine. If this pops up again it
> might be worth considering to drop this from your tree so that I can
> resolve the conflict in the Tegra tree.

Sorry about that, I went ahead and dropped the patch from my branch.

Thanks.

-- 
Dmitry
