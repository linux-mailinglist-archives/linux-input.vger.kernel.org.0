Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334063FC532
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 11:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240666AbhHaJwp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Aug 2021 05:52:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45281 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240789AbhHaJwk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Aug 2021 05:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630403505;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=boUrZKhLp0JiMUKIan6Po3HbNkfH+6C/uMe+4QjtHEA=;
        b=KAsbVUmRBDLMl44mp5fcXtjKIxDkG677VO92DtSGxauElYcZCNqwYk3RSEOD+Qciz2vsNh
        2SEVWSUwL6ZPk6WcmXgKnyYyj/UgD+y+rzlWcoPa5yANeOxITt2CrNQYcuIQT+ouhRUdiz
        hQVlU8jYsFjsYhmo4vxBydoRxwoxAns=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-pNQwb51zNse_NInpCwmy3A-1; Tue, 31 Aug 2021 05:51:44 -0400
X-MC-Unique: pNQwb51zNse_NInpCwmy3A-1
Received: by mail-pl1-f199.google.com with SMTP id h13-20020a170902f54d00b00134c35c8d05so5435720plf.4
        for <linux-input@vger.kernel.org>; Tue, 31 Aug 2021 02:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=boUrZKhLp0JiMUKIan6Po3HbNkfH+6C/uMe+4QjtHEA=;
        b=CN0MCG6eZwnmeLJp+SKcbHMOEmOQjYErUh+kVvckCvUCFL+JqFV3LGXYp4KxjTtSbz
         w1JJ1LqizHDhy8xVOuw1+TokEUdkXEDTv11EJUt8GMByVgi72Ii5UqQPMvYrmEaB2pW/
         wYFiaGqOp2QmMnitSADQH9JzGAhIwbqasyopqFmvRgRCc7Ra+7tdqCpoLe6/YgRsM0Nv
         jyCZ9Mdi3dDpEyYY+1mUCeA9+GELyiojmVolMgRoaME2+wz1bbvQGMe9Xfm5FfroUPhJ
         KH82r14Q5BF+5kTjJ+LxYgb+NxGxnI6tRESlP8TuCMeGBQbGeV9+VBVtiR74If8UO6m7
         A4dw==
X-Gm-Message-State: AOAM531HWqDmAZ8LNkDtMaDFzUTmgHvILG1FOhZLTVUg2uokkYir9ob6
        gpsHYYTUvMcAz36tFK4f8BRLcpIkDjMcEj+4PCNo81zTZNRAf8bM9B01f8ZkEgB9SbDSq6rqLNf
        aYnWhYbzv9NdD0vRV76311/ZYpXkMqSFtw3OkbJQ=
X-Received: by 2002:a17:90b:120a:: with SMTP id gl10mr4426084pjb.234.1630403503181;
        Tue, 31 Aug 2021 02:51:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzojti8W56GvxIsdVgucUtiiapsjjuPzxBecCRiM0JFpL3yj4lfl53tJeN7sS3PHQ/XJHKcnklFe+XbA8OBY18=
X-Received: by 2002:a17:90b:120a:: with SMTP id gl10mr4426067pjb.234.1630403502897;
 Tue, 31 Aug 2021 02:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210819195300.GA8613@rowland.harvard.edu> <000000000000c322ab05c9f2e880@google.com>
 <20210820140620.GA35867@rowland.harvard.edu> <nycvar.YFH.7.76.2108241351490.15313@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2108241351490.15313@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 31 Aug 2021 11:51:31 +0200
Message-ID: <CAO-hwJ+i4MqOj0umUW9kFgYSZLt3QMb6hDZHQwb8AKH9pKxSTg@mail.gmail.com>
Subject: Re: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Michal Kubecek <mkubecek@suse.cz>,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 24, 2021 at 1:54 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Fri, 20 Aug 2021, Alan Stern wrote:
>
> > > syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> >
> > That's good to know.  Still, I suspect there's a better way of handling
> > this condition.
> >
> > In particular, does it make sense to accept descriptors for input or
> > feature reports with length zero?  I can't imagine what good such
> > reports would do.
>
> I quickly went through drivers + some hidraw users, and can't spot any use
> case for it.
>
> > On the other hand, I'm not familiar enough with the code to know the
> > right way to reject these descriptors and reports.  It looks like the
> > HID subsystem was not designed with this sort of check in mind.
> >
> > Benjamin and Jiri, what do you think?  Is it okay to allow descriptors
> > for zero-length reports and just pretend they have length 1 (as the
> > patch tested by syzbot did), or should we instead reject them during
> > probing?
>
> I think it's a good band-aid for 5.14 (or 5.14-stable if we don't make
> it), and if it turns out to break something (which I don't expect), than
> we can look into rejecting already during probe.
>
> Benjamin, is there a way to run this quickly through your HID regression
> testing machinery?
>

I have finally been able to test this patch:
- the testsuite is still passing (of course, this is not hid-core related)
- Logitech unify receivers are fine (according to the automated tests)
- Gaming mice with hidraw calls works (with libratbag in userspace)
- Wacom Intuos Pro still works (so the usbhid calls to enable the
tablet mode are still OK)

->
Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Alan, would you mind resending the patch with the various tags with a
commit description? (unless I missed it...)

Cheers,
Benjamin

