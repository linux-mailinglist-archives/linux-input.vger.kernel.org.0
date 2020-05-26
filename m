Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB60B1E1D8E
	for <lists+linux-input@lfdr.de>; Tue, 26 May 2020 10:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730078AbgEZIng (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 May 2020 04:43:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20490 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728380AbgEZIng (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 May 2020 04:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590482615;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/o8L9PpT2tPsfwELAAEZex10xy71nNXmIgMtBI4kKNA=;
        b=RlEeO+C8vTVcSd/SMVw348v/uN1O+AiRKy40JOHbemFSPJDMPvAa2VhhVckG9XHaqWV5zw
        iJ++leKMlMcWVZM66tLMkHsCnFyizPd8VTsEeMGZ/AWFzf86tP3hoG1zjTpyRv2SLAELJp
        QsYQFeYxxzxhX3MOt2FbwXht6upTN0k=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-l5l31s4APJKMT23L9mXUlQ-1; Tue, 26 May 2020 04:43:33 -0400
X-MC-Unique: l5l31s4APJKMT23L9mXUlQ-1
Received: by mail-qv1-f70.google.com with SMTP id dh11so1254726qvb.22
        for <linux-input@vger.kernel.org>; Tue, 26 May 2020 01:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/o8L9PpT2tPsfwELAAEZex10xy71nNXmIgMtBI4kKNA=;
        b=WXQplJS1C/tFtyw0gSPakzhPGQ1rzEjaAoMSjdsu5S1NN6/mMR9KnzlSuKrHCA4fhW
         fBMAfSWGDADKND9I3Eus9LYcHGHdUD0+psfx3tXd+5OrFvHAFxQoh2b8PtVcoew1uHJx
         JYzTEyCowFuWfrRsd/JzrjAeCSjT7S3R/YqZJ6zVMPgzfj2Sed0k26T5F+8pfX3+guok
         VmPehWLfi991XzwISblO4lGNQuFUVDehNsEWo7XA7CU+xzIUjdJYp7bl9RtJUzm+msEF
         5piMtginwSPLczul/Y3pQuBCqcVBha2bKBW47DwFLbHx6/4XXOjKL4HPTkh2ZqYZEBuv
         mPOw==
X-Gm-Message-State: AOAM531gn/+NbtYP8z6ooet6YEAwg91I1v7tm3yvh6l3MjYb+RP8CklA
        0//iQVQUXYPW5BY1bk42lcR/kcHUO4bzbhgKzipyuFOIqT0bNvAaIxGX+Yvn0yHE8KOpGR3Y/ll
        U8wsHwNBcDsjs+8SvkaYPh5Xl+byPvFz22Kplc+0=
X-Received: by 2002:aed:3b56:: with SMTP id q22mr205469qte.345.1590482613008;
        Tue, 26 May 2020 01:43:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyCwcKrOs606XZeMhMjzfd+m/IeRZLNp6DGq58cyir74B5vkJgKPvaaN7ku7p/ZD35bdvAPWfqpM86aYcOPdo=
X-Received: by 2002:aed:3b56:: with SMTP id q22mr205453qte.345.1590482612797;
 Tue, 26 May 2020 01:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200414091842.25972-1-kai.heng.feng@canonical.com> <nycvar.YFH.7.76.2005261023250.25812@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2005261023250.25812@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 26 May 2020 10:43:21 +0200
Message-ID: <CAO-hwJ+mTjVpBiY9vHXA2Y6D+cXYemixFJ++i+KwZZ25Z6LHHA@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: Remove MT_CLS_WIN_8_DUAL
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 26, 2020 at 10:24 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Tue, 14 Apr 2020, Kai-Heng Feng wrote:
>
> > After commit c23e2043d5f7 ("HID: multitouch: do not filter mice nodes"),
> > MT_CLS_WIN_8 also supports mouse nodes, hence make MT_CLS_WIN_8_DUAL
> > redundant.
> >
> > Remove MT_CLS_WIN_8_DUAL accordingly.
>
> Benjamin, can I get your Ack on this one please?

Heh, funny enough I was trying to fix
https://bugzilla.kernel.org/show_bug.cgi?id=207235 and was pondering
this one too.

To fix #207235, I'll likely need to add a new class and quirk in
hid-multitouch. I can't really find a generic solution for now, and we
better have a local quirk for the 2 devices we currently have and
backport those to stable. However, this patch will likely conflict
(trivially), with the new quirks, so I was thinking:
- submitting my quick and dirty quirk and mark it to stable
- apply this one on top of it (this one really doesn't need to go to stable)

How does that sound?

Cheers,
Benjamin

>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

