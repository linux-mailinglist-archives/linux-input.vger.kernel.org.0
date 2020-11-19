Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7252B96DD
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 16:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728798AbgKSPw3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 10:52:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21399 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727937AbgKSPw3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 10:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605801147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=801BWSq+eM9KMyX8U9aKHe+8y5BlbyWzRszhgIOgWkk=;
        b=P8oF1t/IdfjiEwF/z79fW18EGX+tcBRYrZR7q5rJHNIVPPVTl+Tf8kTB9ZbF45nWue9A7i
        B99MlAmYEiTIW8spGY1taTBH8RadvQ9/VoWcjwhHJPsLCBqQbyrIcYY7qZ8afQNxkurtfx
        COjx0IWtyk/bcxj04bF3rv1SA8acVfw=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-pi-W_THtOGmmcKAqm_5F1w-1; Thu, 19 Nov 2020 10:52:25 -0500
X-MC-Unique: pi-W_THtOGmmcKAqm_5F1w-1
Received: by mail-pl1-f199.google.com with SMTP id g20so4101458plj.10
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 07:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=801BWSq+eM9KMyX8U9aKHe+8y5BlbyWzRszhgIOgWkk=;
        b=E+N64kx3RO1B96zcBpBrGeHIzrocaMQaRrYOnWNmKqCPZr6pBUah4SHmTD0CFN+2cJ
         uVjP/yhcujH6n/bY/66+zLc8nBLT1U9ys29fHc9Xe50MpSrl2gTyhDRWxZCDO1I1CuuP
         Gx/puPcFC42Eb4H/nu8HsDDB/aKWK6h1KllIPz7rjEAN11c4I44H/fQOTtdLg7a7hLiN
         B/lUfWBrYUeTi068KjuUrK52OevA8it9Xi/mxClBnSGwdbE56x5w9ZastMc6vvO4STue
         e3v8uBhNN8u6Gy7szUf/kBSwrZ3iUoLIpyx59cH1mDfPhVqHe1HYTSi1bKbAUv8hriRH
         Viiw==
X-Gm-Message-State: AOAM53345aWVws8NCEHGRzcVCOkLMofpLy+XSvEuALMfaM03p1GeMYHr
        3bECnrw1LqREjJZrWl1Ef7J2piWuZepcFxcvToXvyYjNkpufpIcGuvNBDIM7bn1MCQAn+zlgtSH
        eRdDljlqj+SpnnSYSflFwHQCBcbuqRqDxzlW1FSo=
X-Received: by 2002:a62:75c6:0:b029:18a:d510:ff60 with SMTP id q189-20020a6275c60000b029018ad510ff60mr9795642pfc.35.1605801143836;
        Thu, 19 Nov 2020 07:52:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwInX6LJ1iS3i+R1GgUXvenSw0uWzI5lt4MCtUhFEs7C2x7yfVUkQrVzgo3McqIlZTPhnxEqPjGyeB0HFSdZxA=
X-Received: by 2002:a62:75c6:0:b029:18a:d510:ff60 with SMTP id
 q189-20020a6275c60000b029018ad510ff60mr9795623pfc.35.1605801143570; Thu, 19
 Nov 2020 07:52:23 -0800 (PST)
MIME-Version: 1.0
References: <20201114212058.19590-1-hdegoede@redhat.com> <CAO-hwJJN-1P3XW4i-8R=JBjyFvvyiHK89tN4B7r783LQL1r=sw@mail.gmail.com>
 <ae994b5e-ae09-601b-0a61-19988210c072@redhat.com>
In-Reply-To: <ae994b5e-ae09-601b-0a61-19988210c072@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 19 Nov 2020 16:52:12 +0100
Message-ID: <CAO-hwJ+CtAKiH7da7TAFOkTELp4aNsJz4nNSQ2DV+pFKqx9GvQ@mail.gmail.com>
Subject: Re: [RFC 0/3] HID: logitech-dj: Dinovo keyboard fixes and improvements
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 19, 2020 at 4:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/19/20 4:25 PM, Benjamin Tissoires wrote:
> > Hi Hans,
> >
> > On Sat, Nov 14, 2020 at 10:21 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi Benjamin,
> >>
> >> Here is my patch series for the discussed Dinovo keyboard (receiver)
> >> support improvements.
> >>
> >> I've marked this as a RFC since it has not been tested with a Dinovo Mini
> >> (nor a Dinovo Mini receiver) yet.
> >>
> >> I have tested it extensively with a Dinovo Edge, a MX5000 and a MX5500
> >> keyboard. In case of the Dinovo Edge and MX5000 I've not only tested
> >> them against their own receiver but also against each-others receiver.
> >>
> >> Once you have tested this series on your Dinovo Mini, it is ready to
> >> go upstream.
> >
> > That part is now done, so I guess we can push it upstream :)
>
> Great thank you.
>
> > FTR, the dinovo mini still works fine with this series. I have a weird
> > issue where the secondary button gives me a left click, but according
> > to the raw logs, this is emitted from the hardware itself and is the
> > same whether I am on hid-logitech-dj or not.
>
> A bit offtopic for this thread, but if it is a HID++ 1.0 device, then
> you could try setting the HIDPP_QUIRK_HIDPP_EXTRA_MOUSE_BTNS quirk on
> it and see if that helps. I've seen several cases with HID++ 1.0 devices
> where some keyboard-keys / buttons would not report (or report wrongly)
> unless the reporting of them was switched over from the regular HID
> input report to the HID++ version of the report.

I'll have to test this, yes. Thanks.

>
> >> The first patch should probably go to 5.10 as a fix in
> >> case someone pairs the Dinovo Mini with a MX5x00 receiver like the
> >> reporter of this bug did with his Dinovo Edge:
> >> https://bugzilla.redhat.com/show_bug.cgi?id=1811424
> >
> > OK, then I can apply it on top of the previous fix. I guess we don't
> > need stable@vger.k.o for this one?
>
> Actually this is intended for stable, to avoid getting a repeat of:
> https://bugzilla.redhat.com/show_bug.cgi?id=1811424
> with a Dinovo Mini. So if you can add a Cc: stable that would be
> great.
>

Oops, I have already pushed it without the tag. I guess we can always
request it later...

> >> The other 2 are 5.11 material.
> >
> > If I have to break the series, I will have to wait for Linus to first
> > merge the 5.10 material, then I'll be able to apply the others on
> > top...
>
> Ack, that works for me there is no rush to get the other 2 merged.

Great, thanks!

Cheers,
Benjamin

>
> Regards,
>
> Hans
>

