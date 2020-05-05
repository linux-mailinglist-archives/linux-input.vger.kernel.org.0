Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E690D1C53C4
	for <lists+linux-input@lfdr.de>; Tue,  5 May 2020 12:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728789AbgEEKzs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 06:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728180AbgEEKzr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 5 May 2020 06:55:47 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A9BC061A0F;
        Tue,  5 May 2020 03:55:47 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x10so684861plr.4;
        Tue, 05 May 2020 03:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l552h3OpGSpu9bHCOSxuHOrFd7pmj/Ri4f827xY1Ld8=;
        b=GlIkMwWtO67a2x6+favOYVuU8Y0cXZu+b3zBeoPRzePS+PTGOXm+OYd5wGC/ZJ5GAz
         MVbf1d5XRhFbYR4iGSgL9Ni/jkPAnrP8u15t+I3x5WBzgkThdxGLScIMH2MxkyA+cKZQ
         Fv0iC9MPNCGcZf55OwxQBzewWFYQwTy1T3ujXfw5PUHshEq8GuP/+OQgX8m9CQpxFqHe
         drFvhKZzMWT2ZF7OIVKzPYVayrols4MnMbUMflgfDMWZ33VkwyKxn90F8h4BQulOiSqG
         H3R5XKthIAgu/T4U92V3XYLBrnjHbacRGlMt7GCLcOrVQrQc7HIN6M9Pf1SLq3uIdMe1
         3EgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l552h3OpGSpu9bHCOSxuHOrFd7pmj/Ri4f827xY1Ld8=;
        b=cNNrtNn9Aprile1+FNfMACDDUxHNyhD6cUqpJ+dzq9Evv4MtcVI263wqBd0E0qcRah
         wbbbB4A9heqSKuak60nFUIQAmleJrPanWvZ6PazROPsVgP5/2YZyg28Dr5wN1uyYhtEV
         OHBdveyUGaHqG0DyMMd+fzRLDh8g6Ch0Ls5jMv+LeahPYmskpF6osnkPxf33uopyKI9z
         Gg3lFnbrHah9aPSL3FI4D8BWs9WdJpv4tpNSIU8R/zohG557PZDMSiO7ujTy+XvwluVP
         YpzzG0OFMvfrJ5NTLcElWAJdLYFIiUL32lTKl1xDAvVFEfIXdZHwWPyrX2WbmwfWHPfi
         2AKw==
X-Gm-Message-State: AGi0PuZNfBXKuJfXhwlUarvtzs9oKqGvcWbuUTTznmVX+SmJVa71hE/a
        1sWLEvmRXxQnyZHNTwLSou0SPmeKKsdTvpvHkOk=
X-Google-Smtp-Source: APiQypIdsG38zs1UHBnUOGTnHKZdpthGi5pt073UEizssUOHztCH1HgnvSbeT0x3ZSRTEaUrPGE/AznIkmNAz9PhwIY=
X-Received: by 2002:a17:90a:364c:: with SMTP id s70mr2229270pjb.143.1588676147102;
 Tue, 05 May 2020 03:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200504164514.18641-1-a@dun.ai> <72bd44ab-98a8-0cdc-b7e6-104a69ca3643@infradead.org>
 <f4aeeb2c-32c4-e2a8-193e-2b4d892da4db@redhat.com>
In-Reply-To: <f4aeeb2c-32c4-e2a8-193e-2b4d892da4db@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 May 2020 13:55:40 +0300
Message-ID: <CAHp75VfUUwGyM97Fzh+u1hAFmjdyYinrYE=a+eAwuCNjchq4Qw@mail.gmail.com>
Subject: Re: [PATCH] Add support for Vinga Twizzle J116 Silead touchscreen
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, Andrew Dunai <a@dun.ai>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 5, 2020 at 12:02 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 5/4/20 8:20 PM, Randy Dunlap wrote:

> > Usually you need to send patches to a maintainer who could then
> > merge/apply them.
>
>  From a code point-of-view this looks good to me.
>
> Andrew, if you can resend this to the proper folks (including me)
> with a proper Signed-off-by (*), then this should be ready for merging.
>
> Regards,
>
> Hans
>
>
> *) that might have already been there, but it wasn't present in
> the part quoted by Randy

Luckily I see the original message. There is neither Sob nor commit
message. They must to be present.

-- 
With Best Regards,
Andy Shevchenko
