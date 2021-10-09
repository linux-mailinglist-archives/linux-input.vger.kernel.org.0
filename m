Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A50CB427752
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 06:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhJIEdI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Oct 2021 00:33:08 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:33882 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbhJIEdI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 Oct 2021 00:33:08 -0400
Date:   Sat, 09 Oct 2021 04:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1633753868;
        bh=kLaxi6Ci/FzMKBJ3vTvmQCRwJAHmsCFtR5XCJFFH6Tc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Uiqf1SaQMmTjG/P4h420WCQaq6wVF8En7O21/rUl+BfpZTbeypIndThEAIf1bxXRs
         oj5buVb4TpS6fNpf8nk5h33aATfii+jUj4oRPvaCp1oBM77lGOVGCjztNAABQaaJ6u
         6sRX5x7jQX4pyEJsQXchG2REbBjl08WAYqt+tCn8=
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
From:   Ryan McClue <re.mcclue@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Reply-To: Ryan McClue <re.mcclue@protonmail.com>
Subject: Re: PROBLEM: Evdev epoll_wait Lag
Message-ID: <KQGwDRe-r2Kg0tjf28_CwayJFLwQYB8PAH7bhNvfG0ngHPyJe2Wu59MZqMiWfLr1B6qrM5LUeR5JmtZrlpiyB6_CLgnRhtK65aZ5Qntw9dQ=@protonmail.com>
In-Reply-To: <YWEKLNg3ZzGZLpfn@google.com>
References: <99GfWMtkpJutp6wuEhYJ3aIfNVfE_fr3TVPeQWsr9QSvNMgTk23Aml6WYEucd6D3qkmeIFbunUu6a6g0VNppEKIYrz7w43fzGyl3BUXVkDQ=@protonmail.com> <YWEKLNg3ZzGZLpfn@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I want the epoll_wait to return immediately if no data, so I believe the ti=
meout of 0 is correct.
I'm using an adapted version of this loop for a hobby program. However, eve=
ry time I open it up in a debugger (or just normally) htop shows CPU usage =
for the process is ~97% and the CPU fan becomes very loud.
Like I said, I'm experiencing stalls from a fresh install of Ubuntu in all =
native applications like gnome-terminal, firefox, gedit, vi etc.
I don't understand what is going on or how to go about debugging it.

--
Ryan McClue, Sydney

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90

On Saturday, October 9th, 2021 at 2:19 PM, dmitry.torokhov@gmail.com <dmitr=
y.torokhov@gmail.com> wrote:

> Hi,
>
> On Fri, Oct 08, 2021 at 11:29:51PM +0000, Ryan McClue wrote:
>
> > Hi there,
> >
> > PROBLEM:
> >
> > I'm on a laptop, with 2 connected keyboards (built-in and USB).
> >
> > When I hit keys on each keyboard simultaneously in a program like firef=
ox,
> >
> > gnome-terminal etc. stalling/lag occurs.
> >
> > It only happens for keyboards it seems as moving an external mouse and =
trackpad
> >
> > together causes no issues.
> >
> > TO REPRODUCE:
> >
> > To investigate the problem I wrote a simple C file
> >
> > (see attached 'evdev-lag.c', compile with $(gcc evdev-lag.c -o evdev-la=
g))
> >
> > The program finds keyboard devices under /dev/input/event and uses epol=
l to
> >
> > poll them for input via the evdev interface.
> >
> > If I start entering keys on one keyboard and then switch to the other, =
the
> >
> > program stalls briefly.
> >
> > If I simultaneously enter keys on each keyboard the program stalls inde=
finitely
> >
> > until I stop entering keys.
>
> I do not observe stalls but did you mean to essentially busy-loop in
>
> your program? epoll_wait with 0 timeout causes it return immediately,
>
> you want to use -1 if you want to wait indefinitely or give it a real
>
> timeout.
>
> Thanks.
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------
>
> Dmitry
