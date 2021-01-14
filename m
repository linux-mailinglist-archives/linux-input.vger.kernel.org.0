Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B37E2F695D
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 19:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbhANSUM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 13:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729850AbhANSUK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 13:20:10 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE428C0613CF
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 10:19:19 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id o19so9401238lfo.1
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 10:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p5+Iu0D3KKU369AvPLEzIT1mfTbZwWzsPxK8gu9Bl3U=;
        b=Ff91w5SC7YAdLa8ezSNsw+RRCTfNQ4d2QEDtkSQDt2N+aVX3kEEH9+QV8TvQbzyAw0
         lo6eDRNx7M1CUkCJY1BoDLgFhbRbnBNflbmUtW7SIVVl1BgpQMHCyDx0S+0jSc08fv4B
         xXMMVGOMFGPPkUd/cNyLT+dOK11t00qbH2pfvCjleUI9ysgzNWUaJyUeJxba8ZwxRYwS
         sL8bytGGMSOkulopX6KYd8sWJ1qLtuqzPyXXcBMMvguvk3QIrQEHl5uzYmgkMW8s7FkO
         d4Ok9fhbZzlBJjWiXb1bpjJhBUJCqta6/DplSW4khyjdpQmysDW3phBuOM2MOxbCI7zb
         7KxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p5+Iu0D3KKU369AvPLEzIT1mfTbZwWzsPxK8gu9Bl3U=;
        b=r9QNwF2IZvQXYTabt0pklzprEQiQKQYzrCRkrFVpPsrvd5uJw+pa9MDYPAId555ows
         /huRqbwS6LfBoxP4QpmWYXR9fCLyeDC8l1UaEnJ9QGYNN8B34mWEa3OxJr5kC5j+V3ki
         HwDi0Q990BfFlEwdSX3ygyNSOKe/9DPwg23730QQxRQuRE0tpMhFVvKgWVrRW1weF4/R
         2Dg5iwBYdo+vioGYGhBdzYVRsvz05RTzPkIxFxiTB/uyXrYIncfibdK9J4bm1+i9+HDx
         Am30nZ7MUKJIRBTHduLGiBb8UHNnmGFz/m32HMyfVrZzbOy3EzH9ac+jl4n6k7FkhLFL
         dayw==
X-Gm-Message-State: AOAM532chN1GBXyueLddKbWF7dYaUcgfVlhrsud2VHHgM7BIIYmtZEt3
        TKWmUMKXcbiMKt0Gi2Mv1Ewr0ISHwvnFwaYRNF8ysQ==
X-Google-Smtp-Source: ABdhPJzagQddRmcMWNu+seuYyLPsdgSvq2dS/tzP2KDnHeukIR+aZq3lJLfF2tN/SgIJ1wou0vbbHdP4d7Y8xqUjtDQ=
X-Received: by 2002:a19:ecb:: with SMTP id 194mr3631354lfo.70.1610648357986;
 Thu, 14 Jan 2021 10:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20201205004848.2541215-1-willmcvicker@google.com>
 <X9e5vl+nw4GQNYEw@google.com> <nycvar.YFH.7.76.2012171119240.25826@cbobk.fhfr.pm>
 <CABYd82Z-HJfn1Ts=k7RYrvWCHj=1578--9Y7A0giFn2=RRWcVA@mail.gmail.com>
In-Reply-To: <CABYd82Z-HJfn1Ts=k7RYrvWCHj=1578--9Y7A0giFn2=RRWcVA@mail.gmail.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Thu, 14 Jan 2021 10:19:01 -0800
Message-ID: <CABYd82bdoNDpHd3kH47eEyAV7JrxHPFRGd4eCO6Y55ZwzKz_JQ@mail.gmail.com>
Subject: Re: [PATCH v1] HID: make arrays usage and value to be the same
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        security@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        Will Coster <willcoster@google.com>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

I noticed this hasn't merged yet. So just sending a friendly reminder.

Thanks,
Will

On Thu, Dec 17, 2020 at 10:42 AM Will McVicker <willmcvicker@google.com> wrote:
>
> Great! Thanks for the reply.
>
> --Will
>
> On Thu, Dec 17, 2020 at 2:19 AM Jiri Kosina <jikos@kernel.org> wrote:
> >
> > On Mon, 14 Dec 2020, Will McVicker wrote:
> >
> > > > The HID subsystem allows an "HID report field" to have a different
> > > > number of "values" and "usages" when it is allocated. When a field
> > > > struct is created, the size of the usage array is guaranteed to be at
> > > > least as large as the values array, but it may be larger. This leads to
> > > > a potential out-of-bounds write in
> > > > __hidinput_change_resolution_multipliers() and an out-of-bounds read in
> > > > hidinput_count_leds().
> > > >
> > > > To fix this, let's make sure that both the usage and value arrays are
> > > > the same size.
> > > >
> > > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > > ---
> > > >  drivers/hid/hid-core.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > > > index 56172fe6995c..8a8b2b982f83 100644
> > > > --- a/drivers/hid/hid-core.c
> > > > +++ b/drivers/hid/hid-core.c
> > > > @@ -90,7 +90,7 @@ EXPORT_SYMBOL_GPL(hid_register_report);
> > > >   * Register a new field for this report.
> > > >   */
> > > >
> > > > -static struct hid_field *hid_register_field(struct hid_report *report, unsigned usages, unsigned values)
> > > > +static struct hid_field *hid_register_field(struct hid_report *report, unsigned usages)
> > > >  {
> > > >     struct hid_field *field;
> > > >
> > > > @@ -101,7 +101,7 @@ static struct hid_field *hid_register_field(struct hid_report *report, unsigned
> > > >
> > > >     field = kzalloc((sizeof(struct hid_field) +
> > > >                      usages * sizeof(struct hid_usage) +
> > > > -                    values * sizeof(unsigned)), GFP_KERNEL);
> > > > +                    usages * sizeof(unsigned)), GFP_KERNEL);
> > > >     if (!field)
> > > >             return NULL;
> > > >
> > > > @@ -300,7 +300,7 @@ static int hid_add_field(struct hid_parser *parser, unsigned report_type, unsign
> > > >     usages = max_t(unsigned, parser->local.usage_index,
> > > >                              parser->global.report_count);
> > > >
> > > > -   field = hid_register_field(report, usages, parser->global.report_count);
> > > > +   field = hid_register_field(report, usages);
> > > >     if (!field)
> > > >             return 0;
> > > >
> > > > --
> > > > 2.29.2.576.ga3fc446d84-goog
> > > >
> > >
> > > Hi Jiri and Benjamin,
> > >
> > > This is a friendly reminder in case this got lost in your inbox.
> >
> > Hi Will,
> >
> > I am planning to merge it once the merge window is over.
> >
> > --
> > Jiri Kosina
> > SUSE Labs
> >
