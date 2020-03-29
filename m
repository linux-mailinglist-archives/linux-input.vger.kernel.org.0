Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C35E196EA7
	for <lists+linux-input@lfdr.de>; Sun, 29 Mar 2020 19:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgC2R0y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Mar 2020 13:26:54 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45499 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbgC2R0y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Mar 2020 13:26:54 -0400
Received: by mail-qt1-f194.google.com with SMTP id t17so13128070qtn.12;
        Sun, 29 Mar 2020 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=s2iN9tdQplNw0NFuuzYK7adJNl5ToyvPC/6CZtWwoQQ=;
        b=IXCpujYHm07q8pOLq/RYBqi/Ks9wXvqRBvsgMO/W5UZFR6VpVPPDvh/QtdjbXVSlBK
         yMyjEly3VCH3BETGX3aZ05WAn8phK455iZ2EQDtFbTkOH/+eV/nNG7G2gt81p+liZkMo
         6dU4i6ertDBSbhhYXA3d/kZ2Whl8yA8/mdx/BxsCkSY1b9MGKSiLZWebLFOYBM9DcNNn
         dYMhyXhi4ckxITSgoOcwslL1iZQ1A/g3ZtDNQE0fMM75Mdd/1noILASN1dfJLg4ex49B
         ECzDPxgCt5DkWm1hkS8r8fihIVHg+TKpmFIcLflDsyYwBmLAgMRc1YzpR5QozkxZSlXP
         FNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=s2iN9tdQplNw0NFuuzYK7adJNl5ToyvPC/6CZtWwoQQ=;
        b=UR8ca+0JhLkI6LVhGa/KYNSpsBT2XQA12YALRdl+gQVYb60v35xguGWiTp/vwA0R8x
         wTPi1gLbDb0GGn/Z8qqDcWZ+7nw4yDMl7pBiX2qQM/ulpKJR4Qi/0VMJ+urxqirRiZYJ
         H1LL+wmInp8ACApTSxzx7/flESl94sHrByBTjMqzm76YdY1zXWuLqOLGZekBHP6Y4P3Q
         FSv4F1R0bK24H+VhrTQGP1nctEnOJs90nz6GJbzsLZBDm1SGYzkH+vlxLfgC/MKK0LWP
         gmsLQGFs7C+kaw/NnJ5syRFYIwoYVkmGokxdGuaC0Sp0I9Qn5+Cy3EKey3x1rOEaFcsT
         e5cA==
X-Gm-Message-State: ANhLgQ3RK7jyqWLIr1Q/dCJOk1lor5CZQu4MXbwKAUKJxYYrY7iC8E7T
        +J/XCwymCkmWc79o9PnkFs8dG3oiYoj+SooJtU/t9pKItJcHZQ==
X-Google-Smtp-Source: ADFU+vsh9+9ScBuosBEUYBQFHZuwsdI6sZzKepb86QJ+4ntpNZOJk9obCZKR3ijArHAYWMCmUg/KV7R23RO456cox6Y=
X-Received: by 2002:aed:2314:: with SMTP id h20mr8497316qtc.184.1585502812997;
 Sun, 29 Mar 2020 10:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200328004832.107247-1-rajatja@google.com> <20200328072031.GA3651219@kroah.com>
 <CAKdAkRQMnR1oKPnmwmj0OYg_DWBZyVbPE8McacwCeQFO2NzpRQ@mail.gmail.com> <20200329072432.GB3909421@kroah.com>
In-Reply-To: <20200329072432.GB3909421@kroah.com>
Reply-To: rajatxjain@gmail.com
From:   Rajat Jain <rajatxjain@gmail.com>
Date:   Sun, 29 Mar 2020 10:26:41 -0700
Message-ID: <CAA93t1pt=qh+ppG5btbA4AvRCiMCS+LqMB-a6mSiYktmT1C+xA@mail.gmail.com>
Subject: Re: [PATCH] Input: input-event-codes.h: Update the deprecated license
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rajat Jain <rajatja@google.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 29, 2020 at 12:24 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Mar 28, 2020 at 01:42:09PM -0700, Dmitry Torokhov wrote:
> > Hi Greg,
> >
> > On Sat, Mar 28, 2020 at 12:20 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Mar 27, 2020 at 05:48:32PM -0700, Rajat Jain wrote:
> > > > >From https://spdx.org/licenses/
> > > >
> > > > "Release 3.0 replaced previous Identifiers for GNU licenses with more
> > > > explicit Identifiers to reflect the "this version only" or "any later
> > > > version" option specific to those licenses. As such, the previously used
> > > > Identifiers for those licenses are deprecated as of v3.0."
> > > >
> > > > Replace the
> > > > /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > > > with
> > > > /* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > > >
> > > > Signed-off-by: Rajat Jain <rajatja@google.com>
> > >
> > > If you like reading documentation for stuff like this, how about reading
> > > LICENSES/preferred/GPL-2.0 which shows that both examples are just fine
> > > and we are going to stick with that for now as we don't want to do a
> > > wholesale change at this point in time.
> > >
> > > In other words, we do not follow the 3.0 version of the SPDX spec as we
> > > think it's pretty silly :)
> >
> > coreboot however does follow SPDX 3.0 and would like to be able to
> > consume this file without relaxing their license checks. I do not
> > think we need wholesale update, but is there reason to not update this
> > particular file? I am not following SPDX development, so that's why
> > you got pulled in ;)
>
> If you want to take this change because of sharing with other projects,
> that's fine, but do not say that the reason you are making this change
> is because it is somehow required by our use of SPDX and the updated
> version.  Just say that you want to share it with other projects :)

Thank you. Updated patch is here:

https://patchwork.kernel.org/patch/11464109/

Best Regards,

Rajat

>
> thanks,
>
> greg k-h
