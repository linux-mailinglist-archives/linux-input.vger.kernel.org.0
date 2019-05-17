Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6D7F218B2
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2019 14:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbfEQM6Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 May 2019 08:58:24 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36322 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728374AbfEQM6Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 May 2019 08:58:24 -0400
Received: by mail-qt1-f193.google.com with SMTP id a17so7850635qth.3
        for <linux-input@vger.kernel.org>; Fri, 17 May 2019 05:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wFB88TOQMGJp2WIN+ruuveeSeWfQWFvzvAIz0Bs7oC4=;
        b=sS9h+g8xH7W3gCuI8woq1U83WPe2HAtyanVkm9O6e3+3RKD+GTIIZEoB5FEprOZpwD
         Wg73T/UH0rqOzr4TTFVkKPXjCmokS8Z7FJTEGZo0enIp/D7MzHndGpZ30GAVa6CE5fpC
         vlBph2asBVvSSYP9Pp+DmhEUr6o0S2JlF4fKCroKX56AzyAQgjLOdDpmjuEnuysCYOMC
         RyFX33iPo0Iz/KVQuZ2Kad49Spm1r+XQ4QBfWfRo9KUOgcIgb2zPcc0RX6uFMnFZJHj1
         sV/wjJlVeHkKWwCTJGV5wobHbDAOOMam9bOdXVUK/r6YZiCGNrJBN5jZO7PuvG4Xng40
         LIZQ==
X-Gm-Message-State: APjAAAUhCgJMTRme3ESDNzSGs6r8QZSDHYLP/s/Pl4YAHB+pLLvhXbJK
        uyVy30mUzwe1QhUfaDpaX1ONl+4oWHJYFQDX9Q7WDA==
X-Google-Smtp-Source: APXvYqzsDn7EqFbyCA0DGOQ7YFLBu8/7WPXz+AgmU1G4bD73WSX8dsVkwFD0nYuop9Cygoy2O5YCAhUQb+Nz6D9tP1A=
X-Received: by 2002:ac8:31e2:: with SMTP id i31mr47884960qte.294.1558097903768;
 Fri, 17 May 2019 05:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <1557527479-9242-1-git-send-email-aaron.skomra@wacom.com>
 <nycvar.YFH.7.76.1905171358160.1962@cbobk.fhfr.pm> <CAO-hwJKB-64px0vZc9b5SCxoGWbe+_2uaa=9N6_HXowa2yLv6w@mail.gmail.com>
 <nycvar.YFH.7.76.1905171456440.1962@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.1905171456440.1962@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 17 May 2019 14:58:12 +0200
Message-ID: <CAO-hwJLfKEVnrAARy44sULkdxQ4snXGbE9+3pE=pb6M=uXRSpQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Intuos Pro 2nd Gen Small
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Aaron Armstrong Skomra <skomra@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 17, 2019 at 2:57 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Fri, 17 May 2019, Benjamin Tissoires wrote:
>
> > On Fri, May 17, 2019 at 1:58 PM Jiri Kosina <jikos@kernel.org> wrote:
> > >
> > > On Fri, 10 May 2019, Aaron Armstrong Skomra wrote:
> > >
> > > > Add support for the Inutos Pro 2nd Generation Small.
> > > >
> > > > This patch set is based on top of Jason's two existing patch
> > > > sets sent Apr 24th and May 7th.
> > >
> > > I don't think I've seen those two sets ... ?
> >
> > I have them in my inbox at least. And it seemed you were not Cc-ed on them.
> > https://patchwork.kernel.org/project/linux-input/list/?series=110743
> > https://patchwork.kernel.org/project/linux-input/list/?series=114835
> >
> > Sorry, I am catching up with fires everywhere, so didn't have much
> > time to apply patches.
> >
> > The first series looks good and can go in for-5.1/upstream-fixes I
> > guess. I *think* the second series is fine too but I didn't have much
> > dedicated brainpower to process it yet.
> >
> > Jiri, do you have time today to take care of those or should I try to
> > get a little bit of time later today?
>
> If you have looked at them already and even have them in your inbox, it'd
> be nice if you could process it.
>

K, I will.

Cheers,
Benjamin
