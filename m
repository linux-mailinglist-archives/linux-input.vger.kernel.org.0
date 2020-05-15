Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A731D503B
	for <lists+linux-input@lfdr.de>; Fri, 15 May 2020 16:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgEOOSX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 May 2020 10:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726140AbgEOOSX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 May 2020 10:18:23 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A2AC061A0C;
        Fri, 15 May 2020 07:18:22 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id m7so936227plt.5;
        Fri, 15 May 2020 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4XXkbZJb0W8CP7Lg+be2a0F3GhBQ7+qsR6HQdEwv8y8=;
        b=rS0ZcSw0dC2H0Yxsp0LaGoGev6AxzL4/6qr3SNtVUIHEtF9ET3KtK9GWnY6bbeko5i
         qrtu6zbFuFnYa+H52wNA7z7GFUeUaiqApey3cdAurqpB73mZVz/9yjpuUY2mh0XQ4gKH
         GwhBqSUlLFVsmRy6h/edUT/iLex3CPCXL0nDaLTE/30DIgcNg+jgoVV4j9376HbavSTF
         4ibaZWVzJ/mUncIvxsZzqwHfKHm36gLy1PaDrKjlO1aKntFKlgRwvPMRVyVo9b28Z+Y9
         xV3eKPI6hpgALxvkY22SrNPGTH8+NxkJX6YQluglFvjgMgDWHjxH1hFP1NViEHEkV+v0
         HSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4XXkbZJb0W8CP7Lg+be2a0F3GhBQ7+qsR6HQdEwv8y8=;
        b=QDhoI63Rq8G5PMKt4dMIIA2y3XH1qp8OFxdrwQ3KMVfrFDs7z0SOv9GcMCrUj5/r4Q
         9wJGxLDWW2+5U7Ty6WgtCdfH0YaodksyvAUynvjWzbxcYCY1jcsApIuJfxUjU53rx6LJ
         Cv3dM6mU91/YdwgU6h/4qn44wNjedW4KkIr4Pp+aaDhZtF2MJoCQP0Gl4QR4U1hkdOuM
         U6FtwBPIA/a6nHin0+wPDiZUl7ilgsUVtCuj2WEhi7umu6kLSIPu6Q8UyGNfQCmDnRIO
         x406zg5v7etG2ezVGhpLzsVT+Um6JX57Ifpv6KnSOXbNZB4lLzM26Rl2dDsjodkGoTzs
         hp0w==
X-Gm-Message-State: AOAM531TB4513B12aPeQuOHd1K4mBmwtCQtnzNDuiachchqVLn7lQ//W
        FeiAcdb2NVJEWE0Uv1P6QlEKkPbnfTWd5EoIE5c=
X-Google-Smtp-Source: ABdhPJwVG2t0IjBDgnQi/UcrLLlYIdFlGzj1+tols8vw2NgjaKGD2LS09KMaEQvEcmheZL66S1lhbUvoOvDkc5mpl7I=
X-Received: by 2002:a17:90b:3717:: with SMTP id mg23mr3885831pjb.129.1589552302315;
 Fri, 15 May 2020 07:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200512204009.4751-1-bernhardu@mailbox.org> <2656984b-3eec-c6d0-f992-8f1f8973fe3e@redhat.com>
 <CAHp75VejzaZL26ztQMFGjAAMC3B8mkSnXSvGhyFeiHUbUUpp=w@mail.gmail.com> <4787d347-b761-6283-7f9d-34c1a11b909f@mailbox.org>
In-Reply-To: <4787d347-b761-6283-7f9d-34c1a11b909f@mailbox.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 15 May 2020 17:18:15 +0300
Message-ID: <CAHp75VfAeyMnwoJi8P0d4Gs5dziUQYhPGzS2fmev00UiRZ6vaQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Trekstor
 Yourbook C11B
To:     =?UTF-8?Q?Bernhard_=C3=9Cbelacker?= <bernhardu@mailbox.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Otmar Meier <otmarjun.meier@nexgo.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 15, 2020 at 5:08 PM Bernhard =C3=9Cbelacker
<bernhardu@mailbox.org> wrote:
> Am 13.05.20 um 19:17 schrieb Andy Shevchenko:
> > On Tue, May 12, 2020 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wr=
ote:
> >> Hi,
> >> On 5/12/20 10:40 PM, Bernhard =C3=9Cbelacker wrote:
> >>> Add touchscreen info for the Trekstor Yourbook C11B. It seems to
> >>> use the same touchscreen as the Primebook C11, so we only add a new D=
MI
> >>> match.
> >>>
> >>> Cc: Otmar Meier <otmarjun.meier@nexgo.de>
> >>> Reported-and-tested-by: Otmar Meier <otmarjun.meier@nexgo.de>
> >>> Signed-off-by: Bernhard =C3=9Cbelacker <bernhardu@mailbox.org>
> >>
> >> Thank you, patch looks good to me:
> >>
> >> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >
> > This doesn't apply to our for-next.
> > Please, rebase, add Hans' tag and resend, thanks!

> I am not sure against which git tree I should rebase?

Ah, sorry, this one [1] you should use for PDx86.

[1]: http://git.infradead.org/linux-platform-drivers-x86.git

--=20
With Best Regards,
Andy Shevchenko
