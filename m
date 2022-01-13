Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E9948D546
	for <lists+linux-input@lfdr.de>; Thu, 13 Jan 2022 11:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbiAMJyU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jan 2022 04:54:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31948 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232479AbiAMJyT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jan 2022 04:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642067659;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=P21bY9ZJJyCbh5fpqcmjO01rPxsleRX2MzcsIBSijkE=;
        b=K8kVW+F2KPifLysLqk7OOToWL0Tdq0++j11GKC241Ox8ZyO4jIPnCq/vCwi/W5zWsBlm42
        IN2p7D7QKX7FWzEDK4+ifTTBVFu9Fey2dTAiL+TonHpGhWWEMjd6caqKBX7U56YW2SElki
        ID6gMgWHwbML+yRb+5mkgREjN09IJx4=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-jc2dtpSOObGTKQ3BDENOkQ-1; Thu, 13 Jan 2022 04:54:18 -0500
X-MC-Unique: jc2dtpSOObGTKQ3BDENOkQ-1
Received: by mail-pl1-f199.google.com with SMTP id s21-20020a170902989500b00149907dd16bso5594636plp.7
        for <linux-input@vger.kernel.org>; Thu, 13 Jan 2022 01:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P21bY9ZJJyCbh5fpqcmjO01rPxsleRX2MzcsIBSijkE=;
        b=gFTsFVNNeYfM7xz6To0n8rTXUKnpsr81og3zMSHlcRJkufqvLZ/U4hT+azM1D2WCHF
         +xKzooyPLZBD6l49NB9n+pD48Yf2wtRdfdF7rjWiDIO12XXcEOyOE63bB1NUmhSIUkeA
         zroLrIn0/0Ppwx5x3Bas840Rq+26lXmSl+K2rSNRj7DhjzcTxn96vM+XUhdcKfEZRVKP
         7J9qhveReUbYsx32khwJPHW+XrBQlBsesTlyC8Eas8LRPdYYMkMOONXshDiyRKKyVhkI
         qm5n+N5QDKvFdaUUxpX2+rGZFpYT/2PsakJBm5bjZjLi0OwvDr9DSRSFSaYGNm61VFnu
         nN5A==
X-Gm-Message-State: AOAM533r/IklWc/mMCyEenNOhhyrHTaToTJV0vjHmq4NNQimgArNnRty
        5kjT9SzBhpeXk0QYJ/vk/RJs7f7WDAQUVnrgnn58zsZNl2X8rFN5VsHwSG7lNkooR/wdy/hXOmN
        EbWmU1N6+r5Tu6rqesbZu6ZQoTK9H17vl3cl03Q4=
X-Received: by 2002:a17:90b:3510:: with SMTP id ls16mr8017846pjb.173.1642067656824;
        Thu, 13 Jan 2022 01:54:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4YmoLJUV/vksEC8NFVa4YSbAWtRuqtBHbpcxlv82VZrDY9LBlJ03yJN/TaXWEmgEU+PzHYDwVniacVcQ76ng=
X-Received: by 2002:a17:90b:3510:: with SMTP id ls16mr8017823pjb.173.1642067656499;
 Thu, 13 Jan 2022 01:54:16 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-6-acz@semihalf.com>
 <Ydi4HRZs079kA/OU@google.com> <CAB4aORWUh1cVujyDBHfOqK9rcgixf8c8M47r8RaV_X=1hR6QhA@mail.gmail.com>
 <92b7b0ec-6764-64d2-2ded-01bff7cc2193@redhat.com> <CAB4aORWWLWzWCmvx_EvmG6zuiO-5GfmT_73+eZR3sMw7RP52gw@mail.gmail.com>
In-Reply-To: <CAB4aORWWLWzWCmvx_EvmG6zuiO-5GfmT_73+eZR3sMw7RP52gw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 13 Jan 2022 10:54:05 +0100
Message-ID: <CAO-hwJLtqNTqiWVeER0ZvtpVw7g86OobZ-T90Uww9HBc-77TXg@mail.gmail.com>
Subject: Re: [PATCH 05/18] HID: introduce hid_get_feature
To:     Angela Czubak <acz@semihalf.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 12, 2022 at 12:26 PM Angela Czubak <acz@semihalf.com> wrote:
>
> On Wed, Jan 12, 2022 at 10:43 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > On 1/10/22 20:43, Angela Czubak wrote:
> > > On Fri, Jan 7, 2022 at 11:01 PM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > >>
> > >> On Tue, Dec 21, 2021 at 07:17:30PM +0000, Angela Czubak wrote:
> > >>> Move mt_get_feature from hid-multitouch to hid-core as it is a generic
> > >>> function that can be used by other drivers as well.
> > >>>
> > >>> Signed-off-by: Angela Czubak <acz@semihalf.com>
> > >>> ---
> > >>>   drivers/hid/hid-core.c       | 39 ++++++++++++++++++++++++++++++++++++
> > >>>   drivers/hid/hid-multitouch.c | 38 +++--------------------------------
> > >>>   include/linux/hid.h          |  1 +
> > >>>   3 files changed, 43 insertions(+), 35 deletions(-)
> > >>>
> > >>> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > >>> index dbed2524fd47..c11cb7324157 100644
> > >>> --- a/drivers/hid/hid-core.c
> > >>> +++ b/drivers/hid/hid-core.c
> > >>> @@ -1796,6 +1796,45 @@ int hid_report_raw_event(struct hid_device *hid, int type, u8 *data, u32 size,
> > >>>   }
> > >>>   EXPORT_SYMBOL_GPL(hid_report_raw_event);
> > >>>
> > >>> +/**
> > >>> + * hid_get_feature - retrieve feature report from device
> > >>> + *
> > >>> + * @hdev: hid device
> > >>> + * @report: hid report to retrieve
> > >>> + */
> > >>> +void hid_get_feature(struct hid_device *hdev, struct hid_report *report)
> > >>
> > >> If this is a generic API I believe it should return success/error code
> > >> so that users can decide what to do.
> > >>
> > > Does it mean I should also modify hid-multitouch.c so that the return
> > > value is actually checked? Currently it seems to ignore any failures.
> > >> Thanks.
> >
> > Honestly that function is a hack in hid-multitouch. You can replace it by:
> >
> > ```
> > hid_device_io_start(hid);
> > hid_hw_request(hid, report, HID_REQ_GET_REPORT);
> > hid_hw_wait(hid);
> > hid_device_io_stop(hid);
> > ```
> >
> > The hack allows to not have to use hid_device_io_{start|stop}(), which
> > is probably not clean.
> >
> > As for the return value, hid_hw_request() can be used as asynchronous,
> > which is why it returns void. However, returning an actual int would
> > definitively be better because some cases are failing silently (like if
> > the device is not io started).
> >
> I am slightly confused; it is hid_hw_raw_request() that is used and it does
> not seem asynchronous to me; is there no guarantee that the response
> has already been received?

In the case of usbhid, hid_hw_request() calls directly
__usbhid_submit_report() which is asynchronous.
So no, we have no guarantees that the answer is there.

>  It seemed to me that the main purpose of
> this function is to retrieve information an have it correctly parsed.
> I literally issue it once to learn if auto trigger has been set by default and
> to know the durations of waveforms, learn ordinals etc.
> I could introduce a new function for the purpose of haptic API, it just
> seemed redundant as the one in hid-multitouch.c does what I need.

Again, the one in hid-multitouch is a hack against
hid_device_io_{start|stop}(). So if you need to change something, it's
the hid-multitouch code, not reuse that hack :)

Cheers,
Benjamin

