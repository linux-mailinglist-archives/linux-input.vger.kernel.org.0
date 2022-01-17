Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3A04905B5
	for <lists+linux-input@lfdr.de>; Mon, 17 Jan 2022 11:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236048AbiAQKIz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jan 2022 05:08:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29528 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236065AbiAQKIz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jan 2022 05:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642414134;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lQegOaKj8N2I/+2708hpv/MWXLzUVUIuYEdoqnxrpCA=;
        b=iZvl5TMY2n3GCzJoImnejYNm2bHA5nh02C/CjimZ0xDchqgRQ/+j9eSE2afEdylMsxzFVE
        HcvLxapZ751g9hW5Nw68LSX78Qnm41ivaD9VpaHxtauGHIebK6Sg1MC4rOBmjDTJGhmy9+
        Xly1gMb4meHXiFWllO9ynTOOMI0zlk0=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-LaDSaC9DOj-s4YYXMTb-rg-1; Mon, 17 Jan 2022 05:08:51 -0500
X-MC-Unique: LaDSaC9DOj-s4YYXMTb-rg-1
Received: by mail-pf1-f198.google.com with SMTP id i6-20020a626d06000000b004c0abfd53b3so5958761pfc.12
        for <linux-input@vger.kernel.org>; Mon, 17 Jan 2022 02:08:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lQegOaKj8N2I/+2708hpv/MWXLzUVUIuYEdoqnxrpCA=;
        b=csxgoMGKV9d4hLgHTywiuUJpjI4DbCkRWRvbhRzurZ6MChDkgUaTg5ywlDYXJcK8I8
         StFs326fwz4uzEcwwfOahy+srtigkIfX4mdvI6s0UjqaEbtPLIp7j4w85wrbe2fyBc3K
         Ys4Cf/jEinVs1JU+7+A6wKwGZ7Mgap2mlfNuC9YUJGp9wGmXXZ58a2Jv4nUeMowjJiOO
         ZB32iKg5togrl2LfCp6eAYE3D4P5Rak02Ej63tKuXyuMwcA5RkOg07C7jgdP2RJQWpQz
         V4JxDFWTlbmu910UNDqR+PPwDge2Gu/GT+Yc8i45/1lGQDgibeVY3zZ9UfRmxu2OWcHH
         uOlQ==
X-Gm-Message-State: AOAM532Ot7S5ErteExpwiK3q0cDkFiz3THlH1FAt0XfCGXaZNoA3LRCK
        TxvqUWXme2j6zbVTShEnOjMjV6Qw8Y3cbSYDSli4tdZIZMfm6nERPbWLtlToOu6j+vFMbla0ApP
        uf7qKgE0+LdrqCXASfhJVv52SGtnDLKms8YMOkFg=
X-Received: by 2002:a17:902:860c:b0:149:1017:25f0 with SMTP id f12-20020a170902860c00b00149101725f0mr21340828plo.116.1642414130134;
        Mon, 17 Jan 2022 02:08:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzV0nfL4xzUWWQVWNKBhEHJ1LEMdEODG/nveV3Sfs3UjM3oZSHSl9YC6/anQYSGxxu67VbRWWrN+oxQauJpNc0=
X-Received: by 2002:a17:902:860c:b0:149:1017:25f0 with SMTP id
 f12-20020a170902860c00b00149101725f0mr21340802plo.116.1642414129838; Mon, 17
 Jan 2022 02:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-6-acz@semihalf.com>
 <Ydi4HRZs079kA/OU@google.com> <CAB4aORWUh1cVujyDBHfOqK9rcgixf8c8M47r8RaV_X=1hR6QhA@mail.gmail.com>
 <92b7b0ec-6764-64d2-2ded-01bff7cc2193@redhat.com> <CAB4aORWWLWzWCmvx_EvmG6zuiO-5GfmT_73+eZR3sMw7RP52gw@mail.gmail.com>
 <CAO-hwJLtqNTqiWVeER0ZvtpVw7g86OobZ-T90Uww9HBc-77TXg@mail.gmail.com> <CAB4aORUirqsDHu17RUeoPRjMEixY3PJt++1e7hjiN38m1PAUvw@mail.gmail.com>
In-Reply-To: <CAB4aORUirqsDHu17RUeoPRjMEixY3PJt++1e7hjiN38m1PAUvw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 17 Jan 2022 11:08:38 +0100
Message-ID: <CAO-hwJKhTGO7Ki1s43=V_L6z9B9xcq9No4WrSDHe6=gf+a3_Sw@mail.gmail.com>
Subject: Re: [PATCH 05/18] HID: introduce hid_get_feature
To:     Angela Czubak <acz@semihalf.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 14, 2022 at 7:24 PM Angela Czubak <acz@semihalf.com> wrote:
>
> Hi Benjamin,
>
> On Thu, Jan 13, 2022 at 10:54 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > On Wed, Jan 12, 2022 at 12:26 PM Angela Czubak <acz@semihalf.com> wrote:
> > >
> > > On Wed, Jan 12, 2022 at 10:43 AM Benjamin Tissoires
> > > <benjamin.tissoires@redhat.com> wrote:
> > > >
> > > > On 1/10/22 20:43, Angela Czubak wrote:
> > > > > On Fri, Jan 7, 2022 at 11:01 PM Dmitry Torokhov
> > > > > <dmitry.torokhov@gmail.com> wrote:
> > > > >>
> > > > >> On Tue, Dec 21, 2021 at 07:17:30PM +0000, Angela Czubak wrote:
> > > > >>> Move mt_get_feature from hid-multitouch to hid-core as it is a generic
> > > > >>> function that can be used by other drivers as well.
> > > > >>>
> > > > >>> Signed-off-by: Angela Czubak <acz@semihalf.com>
> > > > >>> ---
> > > > >>>   drivers/hid/hid-core.c       | 39 ++++++++++++++++++++++++++++++++++++
> > > > >>>   drivers/hid/hid-multitouch.c | 38 +++--------------------------------
> > > > >>>   include/linux/hid.h          |  1 +
> > > > >>>   3 files changed, 43 insertions(+), 35 deletions(-)
> > > > >>>
> > > > >>> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > > > >>> index dbed2524fd47..c11cb7324157 100644
> > > > >>> --- a/drivers/hid/hid-core.c
> > > > >>> +++ b/drivers/hid/hid-core.c
> > > > >>> @@ -1796,6 +1796,45 @@ int hid_report_raw_event(struct hid_device *hid, int type, u8 *data, u32 size,
> > > > >>>   }
> > > > >>>   EXPORT_SYMBOL_GPL(hid_report_raw_event);
> > > > >>>
> > > > >>> +/**
> > > > >>> + * hid_get_feature - retrieve feature report from device
> > > > >>> + *
> > > > >>> + * @hdev: hid device
> > > > >>> + * @report: hid report to retrieve
> > > > >>> + */
> > > > >>> +void hid_get_feature(struct hid_device *hdev, struct hid_report *report)
> > > > >>
> > > > >> If this is a generic API I believe it should return success/error code
> > > > >> so that users can decide what to do.
> > > > >>
> > > > > Does it mean I should also modify hid-multitouch.c so that the return
> > > > > value is actually checked? Currently it seems to ignore any failures.
> > > > >> Thanks.
> > > >
> > > > Honestly that function is a hack in hid-multitouch. You can replace it by:
> > > >
> > > > ```
> > > > hid_device_io_start(hid);
> > > > hid_hw_request(hid, report, HID_REQ_GET_REPORT);
> > > > hid_hw_wait(hid);
> > > > hid_device_io_stop(hid);
> > > > ```
> > > >
> > > > The hack allows to not have to use hid_device_io_{start|stop}(), which
> > > > is probably not clean.
> > > >
> > > > As for the return value, hid_hw_request() can be used as asynchronous,
> > > > which is why it returns void. However, returning an actual int would
> > > > definitively be better because some cases are failing silently (like if
> > > > the device is not io started).
> > > >
> > > I am slightly confused; it is hid_hw_raw_request() that is used and it does
> > > not seem asynchronous to me; is there no guarantee that the response
> > > has already been received?
> >
> > In the case of usbhid, hid_hw_request() calls directly
> > __usbhid_submit_report() which is asynchronous.
> > So no, we have no guarantees that the answer is there.
> >
> > >  It seemed to me that the main purpose of
> > > this function is to retrieve information an have it correctly parsed.
> > > I literally issue it once to learn if auto trigger has been set by default and
> > > to know the durations of waveforms, learn ordinals etc.
> > > I could introduce a new function for the purpose of haptic API, it just
> > > seemed redundant as the one in hid-multitouch.c does what I need.
> >
> > Again, the one in hid-multitouch is a hack against
> > hid_device_io_{start|stop}(). So if you need to change something, it's
> > the hid-multitouch code, not reuse that hack :)
> >
>
> ACK, I will use hid_hw_request() and hid_hw_wait() instead as suggested.
> BTW is hid_device_io_{start|stop} required to do anything meaningful?
> It just seems to me that it currently sets some variable which is not really
> useful anywhere else.
>

The thing it does is to release the semaphore
hid->driver_input_lock(), which is then in turn used in hid-core.c, in
hid_input_report(). Without this, hid_input_report() aborts earlier
and the field->values[] are not populated because HID considers it
should ignore the incoming reports.

So without this, you can not access the new values apart from doing
what hid-multitouch does: trick the system and force inject an event
in the processing pipeline.

Cheers,
Benjamin

