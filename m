Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF74F196952
	for <lists+linux-input@lfdr.de>; Sat, 28 Mar 2020 21:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgC1UmV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Mar 2020 16:42:21 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35806 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbgC1UmV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Mar 2020 16:42:21 -0400
Received: by mail-io1-f65.google.com with SMTP id o3so7988249ioh.2;
        Sat, 28 Mar 2020 13:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N7xvG9iTpdQWEMJEWsqkRaeS9QN43jRl3wXFjwLF1I8=;
        b=T7sMI+rG93ULTWcph4qWnyZ8XJcyGW83lZe/0rGPnfEnoQBezUBwj27KpS6qDQU6yr
         JRYvlW1m6LsQaUWYwnjrNrdUsqttvjAvtmTvRxOeaUJLa7RYHtV8kFt76qDzJN/mJL/A
         8H1WB2kMWS1ku0xzflUoZQkWBdNgsMm1P2fvpCNTcVbd+0zMHXV/8P2AQM7zTNEwMXCy
         GRVYV1Qg14lGCpPmdbifFcLwY0eH1U5a11oGfC/K6ynlrw64OZ7Po5CMpKq7SNT+ZQO6
         CToCKfuRntFaT3TSG4fb9YGxV0S2gf6M7Kl7UFIjwMibBASE4J5WX2O7OtheGLnVD/jH
         Flsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N7xvG9iTpdQWEMJEWsqkRaeS9QN43jRl3wXFjwLF1I8=;
        b=Pk/PFCqAx9w6u8H6Yg2UC4DwS8VIHymaoszhIlnNPk2uHyRSNEX0QDsK7ZLiR6p605
         /EI6KqsufadqpGYBeCgfMHTrWpLa5RRQPrxeQeUFmu/wWXtiU5h3pR/bN/Q/S27p9/SN
         2aTyAWhCWCBlPR8+KEDJjhfDmjEPCS8pjwuIzXxCnBoMZ1QuXl7iiWjaI327O3C98mkJ
         Jd31EfTM3qbOrgJxnI4VoQGwVz3Kqce2ewXrHFNC34psDKX98JTLBtoJdDsL4oTZzLXL
         L7HUFSFC9qFgTCrwa+3RX4I0cVotXaWU0NfAFS9UolVTPzql7TB6iLc9hS7sz8ForAIf
         JNKA==
X-Gm-Message-State: ANhLgQ1PMdUzAWy4kKi5fGfHyQTwKYxuztbOcxp7KGyTd2BiKeG5PKrP
        EJ2tIxZ73iQ7+c1y5Dh20GLznWKtDp092AiTmV0=
X-Google-Smtp-Source: ADFU+vszlq5SQzNxc+Gr3yhgGp+D2TKHHbj30mtwSxk9P6r9+wr6Ba2BOwn5OhfvVI7k6SqTs1FWDLs6ieaCxP7awNk=
X-Received: by 2002:a02:4e82:: with SMTP id r124mr4788458jaa.7.1585428140355;
 Sat, 28 Mar 2020 13:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200328004832.107247-1-rajatja@google.com> <20200328072031.GA3651219@kroah.com>
In-Reply-To: <20200328072031.GA3651219@kroah.com>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Sat, 28 Mar 2020 13:42:09 -0700
Message-ID: <CAKdAkRQMnR1oKPnmwmj0OYg_DWBZyVbPE8McacwCeQFO2NzpRQ@mail.gmail.com>
Subject: Re: [PATCH] Input: input-event-codes.h: Update the deprecated license
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rajat Jain <rajatja@google.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rajat Jain <rajatxjain@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Greg,

On Sat, Mar 28, 2020 at 12:20 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 27, 2020 at 05:48:32PM -0700, Rajat Jain wrote:
> > >From https://spdx.org/licenses/
> >
> > "Release 3.0 replaced previous Identifiers for GNU licenses with more
> > explicit Identifiers to reflect the "this version only" or "any later
> > version" option specific to those licenses. As such, the previously used
> > Identifiers for those licenses are deprecated as of v3.0."
> >
> > Replace the
> > /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > with
> > /* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
>
> If you like reading documentation for stuff like this, how about reading
> LICENSES/preferred/GPL-2.0 which shows that both examples are just fine
> and we are going to stick with that for now as we don't want to do a
> wholesale change at this point in time.
>
> In other words, we do not follow the 3.0 version of the SPDX spec as we
> think it's pretty silly :)

coreboot however does follow SPDX 3.0 and would like to be able to
consume this file without relaxing their license checks. I do not
think we need wholesale update, but is there reason to not update this
particular file? I am not following SPDX development, so that's why
you got pulled in ;)

Thanks.

-- 
Dmitry
