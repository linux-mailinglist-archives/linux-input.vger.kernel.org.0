Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B59521B8A
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2019 18:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfEQQYK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 17 May 2019 12:24:10 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35375 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbfEQQYK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 May 2019 12:24:10 -0400
Received: by mail-qt1-f193.google.com with SMTP id a39so8685024qtk.2
        for <linux-input@vger.kernel.org>; Fri, 17 May 2019 09:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m5FkuTUKA9zwQpM5/PWr0lGVwn06f2dlzug/Dpcz4yA=;
        b=hwaSdkGoNXVhOfPiMC5L5lzRaYS27Dc7zGeYyLKDEkykVBjx7CS0Zho0gqvtyooboJ
         6La0zM32Kk5Y79gykUD7nvXwp8lNzHHtPmLihHB/34RWT88HWR3VJh8ZWQPRBbKpDzZu
         U6F3QdHoNzt2iPixH8YrW6La/0yFJzmIjWYqVByQrJMGNqkUQqx4fE0OCe1wdsT66Wi6
         ONSAqx16v6f/xlWqHrfQgIzTJC8h6OqZZWPIQsNEFF2qxatVs2lbhHoYcGgKuFGJqLAT
         6jUhvB5WzJs2aFQdzfrOP4ZSKeZQFZokY+eDW8/DG4cqFj98MLTe2j8x4Iu2/vJeYMHZ
         EHDg==
X-Gm-Message-State: APjAAAUAC+ouTy0kx9GcgpFxYUb2QqDGE+l4OIBSjTAxcCnj419TSv0g
        mqPLSblSlHKUlEJCl9gAoV4nsdimHkwdDsWCOdoKttYD
X-Google-Smtp-Source: APXvYqzSBp9uMyABGrXsgksUQorelGivPs3eUDfcMja2mXTLWvc13b0p6NyGLuIpD6Ycq4TCPF/XYzlAegd/QrfxwSQ=
X-Received: by 2002:a0c:d92e:: with SMTP id p43mr7288252qvj.29.1558110249018;
 Fri, 17 May 2019 09:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <1557527479-9242-1-git-send-email-aaron.skomra@wacom.com>
 <nycvar.YFH.7.76.1905171358160.1962@cbobk.fhfr.pm> <CAO-hwJKB-64px0vZc9b5SCxoGWbe+_2uaa=9N6_HXowa2yLv6w@mail.gmail.com>
 <nycvar.YFH.7.76.1905171456440.1962@cbobk.fhfr.pm> <CAO-hwJLfKEVnrAARy44sULkdxQ4snXGbE9+3pE=pb6M=uXRSpQ@mail.gmail.com>
 <CANRwn3TF9q2ENq-ARFpOsC0ZP-J6vRCy3bQB30XXqQyxz_ro1A@mail.gmail.com>
In-Reply-To: <CANRwn3TF9q2ENq-ARFpOsC0ZP-J6vRCy3bQB30XXqQyxz_ro1A@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 17 May 2019 18:23:57 +0200
Message-ID: <CAO-hwJJ3Hv7mWRagap7tG76orv37dKMPZteBPzWqu4NEaR9C_Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] Intuos Pro 2nd Gen Small
To:     Jason Gerecke <killertofu@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 17, 2019 at 6:15 PM Jason Gerecke <killertofu@gmail.com> wrote:
>
> On Fri, May 17, 2019 at 6:13 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > On Fri, May 17, 2019 at 2:57 PM Jiri Kosina <jikos@kernel.org> wrote:
> > >
> > > On Fri, 17 May 2019, Benjamin Tissoires wrote:
> > >
> > > > On Fri, May 17, 2019 at 1:58 PM Jiri Kosina <jikos@kernel.org> wrote:
> > > > >
> > > > > On Fri, 10 May 2019, Aaron Armstrong Skomra wrote:
> > > > >
> > > > > > Add support for the Inutos Pro 2nd Generation Small.
> > > > > >
> > > > > > This patch set is based on top of Jason's two existing patch
> > > > > > sets sent Apr 24th and May 7th.
> > > > >
> > > > > I don't think I've seen those two sets ... ?
> > > >
> > > > I have them in my inbox at least. And it seemed you were not Cc-ed on them.
> > > > https://patchwork.kernel.org/project/linux-input/list/?series=110743
> > > > https://patchwork.kernel.org/project/linux-input/list/?series=114835
> > > >
> > > > Sorry, I am catching up with fires everywhere, so didn't have much
> > > > time to apply patches.
> > > >
> > > > The first series looks good and can go in for-5.1/upstream-fixes I
> > > > guess. I *think* the second series is fine too but I didn't have much
> > > > dedicated brainpower to process it yet.
> > > >
> > > > Jiri, do you have time today to take care of those or should I try to
> > > > get a little bit of time later today?
> > >
> > > If you have looked at them already and even have them in your inbox, it'd
> > > be nice if you could process it.
> > >
> >
> > K, I will.
> >
> > Cheers,
> > Benjamin
>
> My apologies, Jiri. I've recently replaced my development workstation
> and was apparently missing you on the mailrc alias I use for kernel
> patches.
>

Ok, both series from Jason are now pushed to for-5.2/fixes.
I don't think Iĺl have the time to work on Aaron's series tonight.

Cheers,
Benjamin
