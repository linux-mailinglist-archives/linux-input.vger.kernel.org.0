Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0321E3D7E
	for <lists+linux-input@lfdr.de>; Wed, 27 May 2020 11:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgE0JY2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 May 2020 05:24:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59891 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728195AbgE0JY1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 May 2020 05:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590571466;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Mx37E6cNniRjSjP/fMQljNdSeCdaYjfQmEy+4bUkLEc=;
        b=WW7Gn6NQlRP5ShsxE0z7JkWVXRLdaj1KQ8DaAMH0BIUruwSak4P0rhdcHqwMRbIOOU16eO
        6sBlJoBiTrR0Tjwnz4Stb9nnXtMNG5sZBs/XrEmiYhmxNyQuUVXlKvzWed66BITabhjk1h
        y8c54Y4VL4XrlNwjw1wlYIy5EayAYao=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-8mw_5xrePEOmGrJHOqdWTQ-1; Wed, 27 May 2020 05:24:24 -0400
X-MC-Unique: 8mw_5xrePEOmGrJHOqdWTQ-1
Received: by mail-qk1-f200.google.com with SMTP id 205so18426591qkh.5
        for <linux-input@vger.kernel.org>; Wed, 27 May 2020 02:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mx37E6cNniRjSjP/fMQljNdSeCdaYjfQmEy+4bUkLEc=;
        b=cahd38f3wXcc0GJVRWL10/owGbjM5pWmJO0Jtj+tP6Vn/FWtntTdZU08KQpmnUMLLo
         4Ph6QTf3/O086Uha+HQA1XqwPtqQfTY8BW8emRLikCTqi+bIRREHCnsmWFXOD8FXXU8m
         TcOysMtvssi0L72BACGigLUiArLLSljcasR5i+eksRXC0orTyw2t95Bf2L0YqK8zF+1/
         +kYmE7WFkyNXa2o/lhy4nT9LjZCGABUjj9GMXejEV/3wm26w76RZ8sXxwTcrkvrEm4zf
         0GvO8rBCh/LvMz+BwfGyIiLjJ5QhZARaSDAx6DnCLFOpJxM2LeD3HpBfrMs2kOpq88W2
         p8Lg==
X-Gm-Message-State: AOAM533Zc45vCV1mQjCMcmTlGohokC+aZDnW7BQ6DQO/kcZ8PSG+QnaH
        ZoXoZu2w7Q/iJAXXrWlJHyi3/cZ3K839PxaXxWWRWoiugIWAqEuHSUb+4X8EkIKY2ysTnblTon5
        pwQlvW6ulX4ta5Afwz2UkGvYMGIxhbuKYr9qq/Kg=
X-Received: by 2002:a05:6214:1491:: with SMTP id bn17mr24839211qvb.138.1590571464482;
        Wed, 27 May 2020 02:24:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwspK0yE2v775AvHox0HoWyQ9DqUxjbJQZXQO/pyZNzgQTRrP1XaACU4Wj5RcV2L/HBvSuWKdH+D8mI4iqS4W8=
X-Received: by 2002:a05:6214:1491:: with SMTP id bn17mr24839193qvb.138.1590571464243;
 Wed, 27 May 2020 02:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200414091842.25972-1-kai.heng.feng@canonical.com>
 <nycvar.YFH.7.76.2005261023250.25812@cbobk.fhfr.pm> <CAO-hwJ+mTjVpBiY9vHXA2Y6D+cXYemixFJ++i+KwZZ25Z6LHHA@mail.gmail.com>
 <A51B9D28-88BF-42EB-9161-8E3081B128D2@canonical.com>
In-Reply-To: <A51B9D28-88BF-42EB-9161-8E3081B128D2@canonical.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 27 May 2020 11:24:13 +0200
Message-ID: <CAO-hwJJ=_2bn1BEshZ6URT813UAA6KRLaiEHt6bNPUcd9esskg@mail.gmail.com>
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

On Wed, May 27, 2020 at 8:19 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
>
>
> > On May 26, 2020, at 16:43, Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> >
> > On Tue, May 26, 2020 at 10:24 AM Jiri Kosina <jikos@kernel.org> wrote:
> >>
> >> On Tue, 14 Apr 2020, Kai-Heng Feng wrote:
> >>
> >>> After commit c23e2043d5f7 ("HID: multitouch: do not filter mice nodes"),
> >>> MT_CLS_WIN_8 also supports mouse nodes, hence make MT_CLS_WIN_8_DUAL
> >>> redundant.
> >>>
> >>> Remove MT_CLS_WIN_8_DUAL accordingly.
> >>
> >> Benjamin, can I get your Ack on this one please?
> >
> > Heh, funny enough I was trying to fix
> > https://bugzilla.kernel.org/show_bug.cgi?id=207235 and was pondering
> > this one too.
> >
> > To fix #207235, I'll likely need to add a new class and quirk in
> > hid-multitouch. I can't really find a generic solution for now, and we
> > better have a local quirk for the 2 devices we currently have and
> > backport those to stable. However, this patch will likely conflict
> > (trivially), with the new quirks, so I was thinking:
> > - submitting my quick and dirty quirk and mark it to stable
> > - apply this one on top of it (this one really doesn't need to go to stable)
> >
> > How does that sound?
>
> Sounds good. I'll resend this patch once your patch lands in the tree.

Great, thanks. Though I should be able to rebase it and push it
directly. I'll notify you if I can't get to it today.

Cheers,
Benjamin

>
> Kai-Heng
>
> >
> > Cheers,
> > Benjamin
> >
> >>
> >> Thanks,
> >>
> >> --
> >> Jiri Kosina
> >> SUSE Labs
> >>
> >
>

