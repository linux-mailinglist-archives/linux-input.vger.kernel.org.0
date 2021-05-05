Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE40373C56
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 15:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbhEEN0q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 09:26:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25503 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231774AbhEEN0m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 09:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620221145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/bpFsXMdn5eaqmMBwGxqc2rlRW2ISNHWpOEm7J8RdOs=;
        b=R9QuNh33pRaO/0CH2men87qLhv7y7rzpXyjRD4t02d3Lnkmie1iwwbFZCpubY8oiAwhgvi
        YRUY6KRLwo9hjWgooPcDZr661OWZTO6teMfmF6n+no/5N8TalpCvRQywAk/FWlJArHn48y
        vSixTjDu1iBcu0/rOYkHBrJvnz9dJt4=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-ssUAlSChPsmvblrpFeKH8g-1; Wed, 05 May 2021 09:25:44 -0400
X-MC-Unique: ssUAlSChPsmvblrpFeKH8g-1
Received: by mail-pg1-f200.google.com with SMTP id q64-20020a632a430000b0290209af2eea25so1300362pgq.18
        for <linux-input@vger.kernel.org>; Wed, 05 May 2021 06:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/bpFsXMdn5eaqmMBwGxqc2rlRW2ISNHWpOEm7J8RdOs=;
        b=GQxKQc9BDTjRlBUMgVlVhFJWatFwNNyopZFRggKngWClQgUaXHWO9CgYYwti6w69Vz
         rQjWzN7rbGj2Kl/EVNzUAcilScuxU9BF2suVoh2CSn2wdbPlN/mjiy4vQb3Ihb9owA7u
         aqLDfzFABInGaN8v8fyccQIDKPX3XVAjQJbPY/aRJFlHzv/KP6klecttPxNFPsQgH1KQ
         n85in3Wdgp8OCRwX7VgrBx5wNs8QJY0MsPPOd47HIf2z8wWUxxo5LbXINhuj397zhb3u
         YKWEHN6HTag54eBKMVZRMNB5RkB3r9oo9YwWovdUXbyCyP3Fv9x6P6u2orGgQoXPxeMd
         hGjA==
X-Gm-Message-State: AOAM53112NK6pJbbTqiPKDmAAlFDIGyd8z1N3wm/iD1YuGrb3d3giZW3
        0C+loe5xiSeMdRmeNbes5BqL0C3KeceYOLQJV5v2mWwG0VTWLjIdLG2Gg3vySRnEg2MlbXCXoGV
        gveMlsoOZw+gticvCQSMvz5FxjKsN6dO+uoQKfX8=
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr34741901pjr.234.1620221141868;
        Wed, 05 May 2021 06:25:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynLc8AHCVwjV7sToQg82XsVT77jGKQjpRW3gOLa+Ib3v9yJLpRKhvj1Cf0JJj43ujAwhVuVWLzaINnDBAk/eU=
X-Received: by 2002:a17:90a:bb0c:: with SMTP id u12mr34741885pjr.234.1620221141608;
 Wed, 05 May 2021 06:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210425173353.10231-1-mail@anirudhrb.com> <nycvar.YFH.7.76.2105051442120.28378@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2105051442120.28378@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 5 May 2021 15:25:30 +0200
Message-ID: <CAO-hwJJ4u5NZ-81Tq3PGu-F9r3iUSCiKp=JUsTfuVsyd-Sxsew@mail.gmail.com>
Subject: Re: [PATCH] usbhid: fix info leak in hid_submit_ctrl
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Anirudh Rayabharam <mail@anirudhrb.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 5, 2021 at 2:42 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Sun, 25 Apr 2021, Anirudh Rayabharam wrote:
>
> > In hid_submit_ctrl(), the way of calculating the report length doesn't
> > take into account that report->size can be zero. When running the
> > syzkaller reproducer, a report of size 0 causes hid_submit_ctrl) to
> > calculate transfer_buffer_length as 16384. When this urb is passed to
> > the usb core layer, KMSAN reports an info leak of 16384 bytes.
> >
> > To fix this, first modify hid_report_len() to account for the zero
> > report size case by using DIV_ROUND_UP for the division. Then, call it
> > from hid_submit_ctrl().
> >
> > Reported-by: syzbot+7c2bb71996f95a82524c@syzkaller.appspotmail.com
> > Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
>
> Benjamin, could you please run this one through your regression testing
> machinery before we send it upstream?
>

I don't have a reproducer like syzbot has for the exact bug here, as I
am relying on one real USB device to check if usbhid is not too
broken.
However, the test suite should catch if there is an error implied by
the hid_report_len() change.

Anyway, I manually started the job and will report when it is done.

Cheers,
Benjamin

