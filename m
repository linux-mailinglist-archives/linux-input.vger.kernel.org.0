Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E56548C311
	for <lists+linux-input@lfdr.de>; Wed, 12 Jan 2022 12:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352852AbiALL0S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jan 2022 06:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238954AbiALL0R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jan 2022 06:26:17 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9CFC061748
        for <linux-input@vger.kernel.org>; Wed, 12 Jan 2022 03:26:17 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id c6so5442907ybk.3
        for <linux-input@vger.kernel.org>; Wed, 12 Jan 2022 03:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EOVtvAG3jiVM1uqMjRCJ69WgZs1pBSw0+4Cf6BaQIKU=;
        b=b2RIcNKiKjFgFCUD7bQL53jkCuy2cxmY33FbpWzwZNWg45cQa4LG++F12Y5DwZUS3j
         smTfaD1WUjrjCpTFQt63IHLuJ/NR8bHTtSwpp9COWOt6jR25OXyAATfEQZ0B9sYjLynE
         BiusCB5SEOPoZ3HKEZ2romspNWsXcGQ4e7Jy6+jwpCy5iGs6cq05eh+ph3AVsFzgUW49
         V3A3Ph5p02eg75XWevGeJ+Ht+BCtU/hAXinTbNA3NeJW0PfVJ9Rdwr5IxvuyrD8dQSAb
         ODPjFhHWeQ9meaxRAdGcqN4N7QhfJyShAfyFKSoQaUJz2HTb8QmANmQHyHj437tlDdVe
         EbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EOVtvAG3jiVM1uqMjRCJ69WgZs1pBSw0+4Cf6BaQIKU=;
        b=dmYp2V81NB462EmOj/4TzZAX/9ewX2De0l+7PqJhzuEM3bi8qh1JllTqQKfvGovryp
         mX6i3HEZ0x6NU3LZ5ytdfQEoARMBl4vwuMip7f7JUNMHmzO2T79BHCwYTGIIqPg4Rx11
         9GC7rFrhaMuTzbhNaK1nkxk3zZEUNS2jVrPVT7msZ7PI0rNYpzBqf207NLFjqVOlO/As
         bImRjsvO8uYaGtk78g2du6JoPlDP693a11OXPhQTqKpoVgKy5teNfP+AE7nkkV/2Hr27
         /tQyPuQEa2sScd9YWnwnw2x3hGoKYImml6EUHhAaW/J/w2OwZcSuw6VjUQiBY7GY7ohd
         slXQ==
X-Gm-Message-State: AOAM531pIF+hxoMTcjNNJkg+GpUVswVxNegILDVJDnt7bzb0QXmgxkWe
        THO6vU5TFQyfFX+dDTTs2KFoEcWViVHImT1beC7GSg==
X-Google-Smtp-Source: ABdhPJzzO+yHRCqqpZMdGnSY3eY5pZ3e2cCqYrpkQA3KBkpLVQukD0/T6Aq2S4MJ82hwcmEG8EKNsTDOX7RYragybfM=
X-Received: by 2002:a25:198a:: with SMTP id 132mr11712651ybz.273.1641986776542;
 Wed, 12 Jan 2022 03:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-6-acz@semihalf.com>
 <Ydi4HRZs079kA/OU@google.com> <CAB4aORWUh1cVujyDBHfOqK9rcgixf8c8M47r8RaV_X=1hR6QhA@mail.gmail.com>
 <92b7b0ec-6764-64d2-2ded-01bff7cc2193@redhat.com>
In-Reply-To: <92b7b0ec-6764-64d2-2ded-01bff7cc2193@redhat.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Wed, 12 Jan 2022 12:26:04 +0100
Message-ID: <CAB4aORWWLWzWCmvx_EvmG6zuiO-5GfmT_73+eZR3sMw7RP52gw@mail.gmail.com>
Subject: Re: [PATCH 05/18] HID: introduce hid_get_feature
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 12, 2022 at 10:43 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On 1/10/22 20:43, Angela Czubak wrote:
> > On Fri, Jan 7, 2022 at 11:01 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> >>
> >> On Tue, Dec 21, 2021 at 07:17:30PM +0000, Angela Czubak wrote:
> >>> Move mt_get_feature from hid-multitouch to hid-core as it is a generic
> >>> function that can be used by other drivers as well.
> >>>
> >>> Signed-off-by: Angela Czubak <acz@semihalf.com>
> >>> ---
> >>>   drivers/hid/hid-core.c       | 39 ++++++++++++++++++++++++++++++++++++
> >>>   drivers/hid/hid-multitouch.c | 38 +++--------------------------------
> >>>   include/linux/hid.h          |  1 +
> >>>   3 files changed, 43 insertions(+), 35 deletions(-)
> >>>
> >>> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> >>> index dbed2524fd47..c11cb7324157 100644
> >>> --- a/drivers/hid/hid-core.c
> >>> +++ b/drivers/hid/hid-core.c
> >>> @@ -1796,6 +1796,45 @@ int hid_report_raw_event(struct hid_device *hid, int type, u8 *data, u32 size,
> >>>   }
> >>>   EXPORT_SYMBOL_GPL(hid_report_raw_event);
> >>>
> >>> +/**
> >>> + * hid_get_feature - retrieve feature report from device
> >>> + *
> >>> + * @hdev: hid device
> >>> + * @report: hid report to retrieve
> >>> + */
> >>> +void hid_get_feature(struct hid_device *hdev, struct hid_report *report)
> >>
> >> If this is a generic API I believe it should return success/error code
> >> so that users can decide what to do.
> >>
> > Does it mean I should also modify hid-multitouch.c so that the return
> > value is actually checked? Currently it seems to ignore any failures.
> >> Thanks.
>
> Honestly that function is a hack in hid-multitouch. You can replace it by:
>
> ```
> hid_device_io_start(hid);
> hid_hw_request(hid, report, HID_REQ_GET_REPORT);
> hid_hw_wait(hid);
> hid_device_io_stop(hid);
> ```
>
> The hack allows to not have to use hid_device_io_{start|stop}(), which
> is probably not clean.
>
> As for the return value, hid_hw_request() can be used as asynchronous,
> which is why it returns void. However, returning an actual int would
> definitively be better because some cases are failing silently (like if
> the device is not io started).
>
I am slightly confused; it is hid_hw_raw_request() that is used and it does
not seem asynchronous to me; is there no guarantee that the response
has already been received? It seemed to me that the main purpose of
this function is to retrieve information an have it correctly parsed.
I literally issue it once to learn if auto trigger has been set by default and
to know the durations of waveforms, learn ordinals etc.
I could introduce a new function for the purpose of haptic API, it just
seemed redundant as the one in hid-multitouch.c does what I need.

> Cheers,
> Benjamin
>
> >
> >>
> >> --
> >> Dmitry
>
