Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5B121B4A
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2019 18:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729456AbfEQQP0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 May 2019 12:15:26 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33370 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729455AbfEQQPZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 May 2019 12:15:25 -0400
Received: by mail-lf1-f68.google.com with SMTP id x132so5763472lfd.0
        for <linux-input@vger.kernel.org>; Fri, 17 May 2019 09:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LNVag5Iv24z2pZ50RPmC1mZYfJAoFEKyA1X+3/tzgvE=;
        b=ciN2y1l5XZ6tnkoAY7Ags+EIg42lC9+ALQE1tJewfYdWJO1zjehCB0Bx6E+ogYoHNg
         EQlT5BLQn5/g39uHsGsXf/fj+NIp5JzahAo7qYaW7qK3H9L7fmAcvioUu3IJD32UDRQ+
         ORqF5VJPO6M7yiP4DI6XV9G74lqdbz7kDzMuozJampZiW5QXshR/2Dg5yBBxp77X7Rhq
         TwYSs3KLA349upTgVjEdCVS0pqr4bd/1/i7OLvdM4HtSaq65ex1C1QoZh9bdTyrb9CEk
         b3CUMDQG6I5/x/PiO2ptkMb03VthO9YPBqYN/hgItXec5uGU7hRDsCAsfoKImVs+ZY+2
         6kSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LNVag5Iv24z2pZ50RPmC1mZYfJAoFEKyA1X+3/tzgvE=;
        b=FEDcbWw1CO4jG7xOqoWpSCUSky2+EO8XKeRJ+seuH9JRkdtgaFIjTBe6mNr+IQ4yGp
         4ykQXEsrc/tljf293Pw7YDvaA/CfFA7N5c7SHT2uk3zcXIrGENVDY+gCaKUJlVCsbnyv
         4SGLb4sMNa+r6vwEVHSXXjD8KXirRHcqIys/b6pBwU+HaiDc0zCHQOft3dIAwkel/++6
         yGGZLunjB3Pp1TuRKqiKkp3GUlidEBCXrT9UxdtqBel5oXTgbUI++7Z2PLva1+fBfQ8V
         LfbPdFvPPpmbQOjCDN24CKxvJYFHlFDMuoxJD8//bP6CsbLLLGxya6rsChbHSjyHcpRm
         2k7w==
X-Gm-Message-State: APjAAAXhNM/ifJm5Ahhjwqs24OLbZcXaQqpPXjEd2wIlczfwtg5QeAbY
        6ysgT1Wo7Bw2Yu0Iwy0a22hzx80sROfFLWk/20M=
X-Google-Smtp-Source: APXvYqxr1HaUQEyE6mHjeI4QLsqY/7H9EBdKrpu7JXVC1J+Ou6FqVJ9tWKyExuaXz8g7XnuE8Yfi2VBBMN3UXQJYVEI=
X-Received: by 2002:ac2:59c7:: with SMTP id x7mr24193082lfn.75.1558109723404;
 Fri, 17 May 2019 09:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <1557527479-9242-1-git-send-email-aaron.skomra@wacom.com>
 <nycvar.YFH.7.76.1905171358160.1962@cbobk.fhfr.pm> <CAO-hwJKB-64px0vZc9b5SCxoGWbe+_2uaa=9N6_HXowa2yLv6w@mail.gmail.com>
 <nycvar.YFH.7.76.1905171456440.1962@cbobk.fhfr.pm> <CAO-hwJLfKEVnrAARy44sULkdxQ4snXGbE9+3pE=pb6M=uXRSpQ@mail.gmail.com>
In-Reply-To: <CAO-hwJLfKEVnrAARy44sULkdxQ4snXGbE9+3pE=pb6M=uXRSpQ@mail.gmail.com>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Fri, 17 May 2019 09:15:11 -0700
Message-ID: <CANRwn3TF9q2ENq-ARFpOsC0ZP-J6vRCy3bQB30XXqQyxz_ro1A@mail.gmail.com>
Subject: Re: [PATCH 0/4] Intuos Pro 2nd Gen Small
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Aaron Armstrong Skomra <skomra@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 17, 2019 at 6:13 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Fri, May 17, 2019 at 2:57 PM Jiri Kosina <jikos@kernel.org> wrote:
> >
> > On Fri, 17 May 2019, Benjamin Tissoires wrote:
> >
> > > On Fri, May 17, 2019 at 1:58 PM Jiri Kosina <jikos@kernel.org> wrote:
> > > >
> > > > On Fri, 10 May 2019, Aaron Armstrong Skomra wrote:
> > > >
> > > > > Add support for the Inutos Pro 2nd Generation Small.
> > > > >
> > > > > This patch set is based on top of Jason's two existing patch
> > > > > sets sent Apr 24th and May 7th.
> > > >
> > > > I don't think I've seen those two sets ... ?
> > >
> > > I have them in my inbox at least. And it seemed you were not Cc-ed on=
 them.
> > > https://patchwork.kernel.org/project/linux-input/list/?series=3D11074=
3
> > > https://patchwork.kernel.org/project/linux-input/list/?series=3D11483=
5
> > >
> > > Sorry, I am catching up with fires everywhere, so didn't have much
> > > time to apply patches.
> > >
> > > The first series looks good and can go in for-5.1/upstream-fixes I
> > > guess. I *think* the second series is fine too but I didn't have much
> > > dedicated brainpower to process it yet.
> > >
> > > Jiri, do you have time today to take care of those or should I try to
> > > get a little bit of time later today?
> >
> > If you have looked at them already and even have them in your inbox, it=
'd
> > be nice if you could process it.
> >
>
> K, I will.
>
> Cheers,
> Benjamin

My apologies, Jiri. I've recently replaced my development workstation
and was apparently missing you on the mailrc alias I use for kernel
patches.

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....
