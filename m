Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02E9C4A7765
	for <lists+linux-input@lfdr.de>; Wed,  2 Feb 2022 19:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237230AbiBBSAL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Feb 2022 13:00:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54929 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232829AbiBBSAL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 2 Feb 2022 13:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643824810;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=q8XQnZHCXMGpSeHP6hYFSb8NjmQibz0nfsdttbvlCtM=;
        b=L9IlyPNYTlWakLJMoF7jlVKMoXxmCNA2EW8PiIW3EJJuvSUUNYAEogzc0Q8Xfr9LwnHvGj
        InN8aHHN3qCswtYkbLn+lm/PjHTIc8AmUwAywzIMLpxwjcQ+mEBjGC4F7kNKywOBZzlZpM
        7J1cCUH5+CuUE8PSmie3Sse1sLVI95E=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-g0TNvOB-M82YLuG1YSbAyw-1; Wed, 02 Feb 2022 13:00:09 -0500
X-MC-Unique: g0TNvOB-M82YLuG1YSbAyw-1
Received: by mail-pj1-f71.google.com with SMTP id gg18-20020a17090b0a1200b001b82ec570b2so118308pjb.3
        for <linux-input@vger.kernel.org>; Wed, 02 Feb 2022 10:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8XQnZHCXMGpSeHP6hYFSb8NjmQibz0nfsdttbvlCtM=;
        b=Ir+CbKZB1iuGHQk4prIx02kJZn8dHTxY4mf9LGPJv8Cy2xHrsCZxifa48e6MGOF1Uh
         nG+XHlrrRE6fjA58xBJjlGzytQAsy4Ugoo8426VsE+MGw2xm93lV4jnedAYJ7EH+CpeW
         NAEUbYNz2QBsfYaoNKMkdKQcF8Tp+JBgMhSggLsRsxiaTy6mjnTATvRjyk7kOWSJA00e
         LJXTAW9HzKHQ2sAaNUbA6l1fRXAM3/tyXn+dOqyJF9pi0kNXFWuy4y5Db3a9xQE6AOH9
         QS7nVfFLBkOFs/Hx9WmRtYLmS2ixdhxEYFId56pZvZdynrweQsb4X2ZovwGI40p73D+X
         qvzQ==
X-Gm-Message-State: AOAM533oGE+C3HWBOaAe/ZgijED3tcR7975FZMyKtQWj/w6Af7pGvfOi
        EJJCcKG8lh0Mr+bfvwx3khsjQZh+lXlp22M5bsrmq1N4PSO0uO10pyPnv3B1Fpy+lYyktcBCJEz
        5/SoivbBZm1mSuILVNtNk5wPBjKO9muKvkGAnI2g=
X-Received: by 2002:a17:902:d4c5:: with SMTP id o5mr31890666plg.116.1643824808131;
        Wed, 02 Feb 2022 10:00:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVbePOC3ynG8ZgvbD6lpNW6ZmCdGhelPP4uNTVK7J2attRGd/LDIbiWyllIm1jmhbwCxun9lYL0ug9ovRTZ2Q=
X-Received: by 2002:a17:902:d4c5:: with SMTP id o5mr31890613plg.116.1643824807495;
 Wed, 02 Feb 2022 10:00:07 -0800 (PST)
MIME-Version: 1.0
References: <20220118072628.1617172-1-dmitry.torokhov@gmail.com> <nycvar.YFH.7.76.2202021456020.11721@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2202021456020.11721@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 2 Feb 2022 18:59:56 +0100
Message-ID: <CAO-hwJJ08vfMTEhU03VEef8Ejx=Ts+akUwGMKTUGqMWwOK3QoA@mail.gmail.com>
Subject: Re: [PATCH 00/12] i2c-hid: fixes for unnumbered reports and other improvements
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Angela Czubak <acz@semihalf.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Feb 2, 2022 at 2:56 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Mon, 17 Jan 2022, Dmitry Torokhov wrote:
>
> > Hi,
> >
> > This series came about after I reviewed Angela's patch that fixed issues
> > with incorrect handling of high-numbered reports (15 and above) in
> > i2c-hid driver:
> >
> > - it appears to me that the driver did not handle unnumbered reports
> >   correctly as the kernel internally expects unnumbered reports to be
> >   still prepended with report number 0, but i2c_hid_get_raw_report() and
> >   i2c_hid_output_raw_report() only expected report ID to be present for
> >   numbered reports.
> >
> > - the driver tried to consolidate both command handling and sending
> >   output reports in __i2c_hid_command() but the rules for different
> >   commands vary significantly and because of that the logic was hard to
> >   follow and it bled out from __i2c_hid_command() to callers. I decided
> >   to introduce a few simple helpers and have the data encoding for
> >   individual commands done at the call site. I believe this made it
> >   easier to validate the rules and the logic and allowed to remove
> >   special handling for the HID descriptor retrieval, among other things.
> >
> > - the driver does too many copying of data; encoding the data for
> >   commands at the call site allowed to only copy data once into the
> >   transfer buffers.
> >
> > I tested this on a couple of Chromebooks with i2c-hid touchscreens, but
> > it would be great if other folks tried it out as well.
>
> Benjamin,
>
> is this something you could feed into your testing machinery as well? (not
> sure whether it's handling i2c-hid specifics).

Not really. I mean I have a sample touchpad connected on an USB to I2C
bridge that I included in the automated tests (though it may be
failing in the latest release because I need to update the patch that
enables it), but it would probably not catch all the corner cases.

I can add this series to my local tree and test on my XPS with both
and Elan touchpad and a Wacom touchscreen/panel. It will still add a
few more tests :)

I'll try to report that tomorrow now that I think I fixed my tablet series.

Cheers,
Benjamin

>
> Thanks!
>
> --
> Jiri Kosina
> SUSE Labs
>

