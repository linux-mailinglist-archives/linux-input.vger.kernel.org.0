Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4681748EFD5
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbiANSYj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:24:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236376AbiANSYi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:24:38 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01075C061574
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:24:37 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id p5so26040527ybd.13
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K0Ls6EmQfUBfgWIrYu8G5hiaYNtKVEI616CTXkr5HNU=;
        b=h8aRs22iRvv0RiLb4mVeyRZ1kyxmY7W1330hN9/ANrO5gknQ7rE78OYTQqEAQ/QiG2
         Z7Q7P4hHMz6OQ9NqcxiQtVmxeqcUh+0FxuWffeqqKbHnAcVn2FpoffFhw2hni9qdhIpw
         aRdVUwyf7KTMhn7N+AQpGspEChDuEHLqVOriYZyWU4xYu/q7QX6L5k8aWerNSHv1jlX5
         2by1TuM49vnW5NqjM7CYdKJx/VCyc+DymxxWIU7AW7buaYYFVK/obYw+BFmy+m1a0yFZ
         nqmvxq5j97YBEmsWI9HocmMD8+caTMdRMAJkFP7G6qxRBjAt693sSKovkn1wm8SNcP+F
         hhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K0Ls6EmQfUBfgWIrYu8G5hiaYNtKVEI616CTXkr5HNU=;
        b=vJriQZghxZN8iCjUHZ31h1IGS8H2vj+x9X8esP7TOG48LDUj3o4nIYGU345SRT75ZN
         txTP4+7zbaDXmBDd3E5OvOJXBiJk10Ew1UDldxvNvgu5+3Brzf3b2U1qwYJJzbO1yd4n
         uOqfDalShVd/TqzgRVHkSjDu0UuEflxNy4YayuvVdY3foAvuYDD/CvUK7WJGoW4FvRuq
         lwtHhcocPKHvIwiPKpN0Fk4DoNFSbergwMh/JAH0oadRSb8aanM3C/uALm/7WE821LAv
         lk6yBd+DwOSJSOVCegStU7F2kK/xupY8ghri4g9/K5LSIn5iBFdy56565HRxCVIiWAMA
         ew8Q==
X-Gm-Message-State: AOAM53339LJIJwgjONuLi7mQVZ9nNjzNlFd53wHGNJ/Y8/LiIl06ttuL
        hjpsZeJS/LnO91Wp+rix0s3b7ABtt/Xbn0QrZ1bwWw==
X-Google-Smtp-Source: ABdhPJy7niLYiz0P5NVBGvl/Iqx8i80j0zdNqY7mrl9LjOFFoFl9yMDNsYidiuYdBFbPkLgi3IvHbjfr/Z1QvEV+aU8=
X-Received: by 2002:a25:198a:: with SMTP id 132mr14148010ybz.273.1642184676202;
 Fri, 14 Jan 2022 10:24:36 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-6-acz@semihalf.com>
 <Ydi4HRZs079kA/OU@google.com> <CAB4aORWUh1cVujyDBHfOqK9rcgixf8c8M47r8RaV_X=1hR6QhA@mail.gmail.com>
 <92b7b0ec-6764-64d2-2ded-01bff7cc2193@redhat.com> <CAB4aORWWLWzWCmvx_EvmG6zuiO-5GfmT_73+eZR3sMw7RP52gw@mail.gmail.com>
 <CAO-hwJLtqNTqiWVeER0ZvtpVw7g86OobZ-T90Uww9HBc-77TXg@mail.gmail.com>
In-Reply-To: <CAO-hwJLtqNTqiWVeER0ZvtpVw7g86OobZ-T90Uww9HBc-77TXg@mail.gmail.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Fri, 14 Jan 2022 19:24:24 +0100
Message-ID: <CAB4aORUirqsDHu17RUeoPRjMEixY3PJt++1e7hjiN38m1PAUvw@mail.gmail.com>
Subject: Re: [PATCH 05/18] HID: introduce hid_get_feature
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On Thu, Jan 13, 2022 at 10:54 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Wed, Jan 12, 2022 at 12:26 PM Angela Czubak <acz@semihalf.com> wrote:
> >
> > On Wed, Jan 12, 2022 at 10:43 AM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > On 1/10/22 20:43, Angela Czubak wrote:
> > > > On Fri, Jan 7, 2022 at 11:01 PM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > >>
> > > >> On Tue, Dec 21, 2021 at 07:17:30PM +0000, Angela Czubak wrote:
> > > >>> Move mt_get_feature from hid-multitouch to hid-core as it is a generic
> > > >>> function that can be used by other drivers as well.
> > > >>>
> > > >>> Signed-off-by: Angela Czubak <acz@semihalf.com>
> > > >>> ---
> > > >>>   drivers/hid/hid-core.c       | 39 ++++++++++++++++++++++++++++++++++++
> > > >>>   drivers/hid/hid-multitouch.c | 38 +++--------------------------------
> > > >>>   include/linux/hid.h          |  1 +
> > > >>>   3 files changed, 43 insertions(+), 35 deletions(-)
> > > >>>
> > > >>> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > > >>> index dbed2524fd47..c11cb7324157 100644
> > > >>> --- a/drivers/hid/hid-core.c
> > > >>> +++ b/drivers/hid/hid-core.c
> > > >>> @@ -1796,6 +1796,45 @@ int hid_report_raw_event(struct hid_device *hid, int type, u8 *data, u32 size,
> > > >>>   }
> > > >>>   EXPORT_SYMBOL_GPL(hid_report_raw_event);
> > > >>>
> > > >>> +/**
> > > >>> + * hid_get_feature - retrieve feature report from device
> > > >>> + *
> > > >>> + * @hdev: hid device
> > > >>> + * @report: hid report to retrieve
> > > >>> + */
> > > >>> +void hid_get_feature(struct hid_device *hdev, struct hid_report *report)
> > > >>
> > > >> If this is a generic API I believe it should return success/error code
> > > >> so that users can decide what to do.
> > > >>
> > > > Does it mean I should also modify hid-multitouch.c so that the return
> > > > value is actually checked? Currently it seems to ignore any failures.
> > > >> Thanks.
> > >
> > > Honestly that function is a hack in hid-multitouch. You can replace it by:
> > >
> > > ```
> > > hid_device_io_start(hid);
> > > hid_hw_request(hid, report, HID_REQ_GET_REPORT);
> > > hid_hw_wait(hid);
> > > hid_device_io_stop(hid);
> > > ```
> > >
> > > The hack allows to not have to use hid_device_io_{start|stop}(), which
> > > is probably not clean.
> > >
> > > As for the return value, hid_hw_request() can be used as asynchronous,
> > > which is why it returns void. However, returning an actual int would
> > > definitively be better because some cases are failing silently (like if
> > > the device is not io started).
> > >
> > I am slightly confused; it is hid_hw_raw_request() that is used and it does
> > not seem asynchronous to me; is there no guarantee that the response
> > has already been received?
>
> In the case of usbhid, hid_hw_request() calls directly
> __usbhid_submit_report() which is asynchronous.
> So no, we have no guarantees that the answer is there.
>
> >  It seemed to me that the main purpose of
> > this function is to retrieve information an have it correctly parsed.
> > I literally issue it once to learn if auto trigger has been set by default and
> > to know the durations of waveforms, learn ordinals etc.
> > I could introduce a new function for the purpose of haptic API, it just
> > seemed redundant as the one in hid-multitouch.c does what I need.
>
> Again, the one in hid-multitouch is a hack against
> hid_device_io_{start|stop}(). So if you need to change something, it's
> the hid-multitouch code, not reuse that hack :)
>

ACK, I will use hid_hw_request() and hid_hw_wait() instead as suggested.
BTW is hid_device_io_{start|stop} required to do anything meaningful?
It just seems to me that it currently sets some variable which is not really
useful anywhere else.

> Cheers,
> Benjamin
>
