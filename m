Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 659601E41D0
	for <lists+linux-input@lfdr.de>; Wed, 27 May 2020 14:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgE0MPm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 May 2020 08:15:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55120 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725826AbgE0MPm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 May 2020 08:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590581740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pLaVnDwpTclVIWI/rgksOsILd2LuGC5m7xWEfTbOfv0=;
        b=NIRb6dp5jFFGAY1/wKKtauuxGjsL81PNuNAEPAF0/o9pY3ntyuV8w5tYXJ5W9D37Ga2d/L
        j7R2kwK2bojbHrzZHLdYJ5U0XnC8Py2cOFTT8m2c+H1QNwayUjpEnxVFQ3WtSArGI3uJD6
        brxkMqqBfQR7xMxmw4eH0ION56D1bLE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-3LWi883QPIuvOq_L8RbSXw-1; Wed, 27 May 2020 08:15:38 -0400
X-MC-Unique: 3LWi883QPIuvOq_L8RbSXw-1
Received: by mail-qv1-f72.google.com with SMTP id g16so22573130qvq.14
        for <linux-input@vger.kernel.org>; Wed, 27 May 2020 05:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pLaVnDwpTclVIWI/rgksOsILd2LuGC5m7xWEfTbOfv0=;
        b=jv0M3n1HGUObMUtuRf538XfPKyYp+GbRrWdr/6LcHAoPnm1V8KjZxSycIBmDjkNP4F
         B7cYlxxyGD60cxl4aB03L91lhO3g2AB7VYqsfqIuTa2cOMcG+jFu7ijSLDdoV3cOwBb9
         LftnfI/iNjK36vArY975mc7Iyb2BO0xnZZ52GM/N5PfB9wjJjaxIr1gGrgf7MumTaIRD
         bMK2H8Pl4L0QgHzQ0LALNen5pB2bL3lMr774wRiDjOZ7hmSwiJ23gLM87Wnot9C5pNgC
         yO9L/qOvv4rlCkugEVKcaKSrHkrp4gqBVy+Py9MGu6f0htg+vJx1XCPwhs0LkglRR0C+
         QWCg==
X-Gm-Message-State: AOAM5305qxPTgHZO7c82C7JNvItpf40oxKYLmzutovi8EfZQM1RmtOAz
        NHHkIBGjiq5lw+aw0cB5okALEvD9qfpJqRUVsOcDywF8cY1V8b4CMgy4EX3TxsSLM5NGoJtpGIc
        QVrVnGOS2iirWszSAAxkhfmbFyFqhaRZUw596CLk=
X-Received: by 2002:a37:dc6:: with SMTP id 189mr3364749qkn.170.1590581738418;
        Wed, 27 May 2020 05:15:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+Ji08UDQyFXWdNpXtC/ZkjAzg125KVXNODa+psxX/r+DgVOPG5+j7SrMwt1aWWPoduOX3HOFR+lsLLBOmAUs=
X-Received: by 2002:a37:dc6:: with SMTP id 189mr3364722qkn.170.1590581738123;
 Wed, 27 May 2020 05:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200414091842.25972-1-kai.heng.feng@canonical.com>
 <nycvar.YFH.7.76.2005261023250.25812@cbobk.fhfr.pm> <CAO-hwJ+mTjVpBiY9vHXA2Y6D+cXYemixFJ++i+KwZZ25Z6LHHA@mail.gmail.com>
 <A51B9D28-88BF-42EB-9161-8E3081B128D2@canonical.com> <CAO-hwJJ=_2bn1BEshZ6URT813UAA6KRLaiEHt6bNPUcd9esskg@mail.gmail.com>
In-Reply-To: <CAO-hwJJ=_2bn1BEshZ6URT813UAA6KRLaiEHt6bNPUcd9esskg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 27 May 2020 14:15:27 +0200
Message-ID: <CAO-hwJJCQbGV3cYjHNmiEi7rgoC5U9uq2ugkNJtRv=Z0wHsuag@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: Remove MT_CLS_WIN_8_DUAL
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 27, 2020 at 11:24 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Wed, May 27, 2020 at 8:19 AM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
> >
> >
> >
> > > On May 26, 2020, at 16:43, Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> > >
> > > On Tue, May 26, 2020 at 10:24 AM Jiri Kosina <jikos@kernel.org> wrote:
> > >>
> > >> On Tue, 14 Apr 2020, Kai-Heng Feng wrote:
> > >>
> > >>> After commit c23e2043d5f7 ("HID: multitouch: do not filter mice nodes"),
> > >>> MT_CLS_WIN_8 also supports mouse nodes, hence make MT_CLS_WIN_8_DUAL
> > >>> redundant.
> > >>>
> > >>> Remove MT_CLS_WIN_8_DUAL accordingly.
> > >>
> > >> Benjamin, can I get your Ack on this one please?
> > >
> > > Heh, funny enough I was trying to fix
> > > https://bugzilla.kernel.org/show_bug.cgi?id=207235 and was pondering
> > > this one too.
> > >
> > > To fix #207235, I'll likely need to add a new class and quirk in
> > > hid-multitouch. I can't really find a generic solution for now, and we
> > > better have a local quirk for the 2 devices we currently have and
> > > backport those to stable. However, this patch will likely conflict
> > > (trivially), with the new quirks, so I was thinking:
> > > - submitting my quick and dirty quirk and mark it to stable
> > > - apply this one on top of it (this one really doesn't need to go to stable)
> > >
> > > How does that sound?
> >
> > Sounds good. I'll resend this patch once your patch lands in the tree.
>
> Great, thanks. Though I should be able to rebase it and push it
> directly. I'll notify you if I can't get to it today.

Alright, rebased and pushed to for-5.8/multitouch.

Thanks a lot.

Cheers,
Benjamin

>
> Cheers,
> Benjamin
>
> >
> > Kai-Heng
> >
> > >
> > > Cheers,
> > > Benjamin
> > >
> > >>
> > >> Thanks,
> > >>
> > >> --
> > >> Jiri Kosina
> > >> SUSE Labs
> > >>
> > >
> >

