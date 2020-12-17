Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 868BA2DD892
	for <lists+linux-input@lfdr.de>; Thu, 17 Dec 2020 19:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729667AbgLQSnj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Dec 2020 13:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729046AbgLQSnj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Dec 2020 13:43:39 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8389CC0617A7
        for <linux-input@vger.kernel.org>; Thu, 17 Dec 2020 10:42:58 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id x20so40581913lfe.12
        for <linux-input@vger.kernel.org>; Thu, 17 Dec 2020 10:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7NUIuWcc29XAhs44U0unGtez+GUKQ8v4NObLnMMMLsA=;
        b=mx7R8WMlj7qwCo/5oc/okBGcqQbMg1FfOFbeWqXdd0aETnkp+fb001QcUblgJOfj0G
         Nf6avRedgOYRuipQiK6FkBJy6wnWxn5HhBrERPNMJx4VpoUk46dg5AFt7tr7KDKUt4Ga
         D3TU8SIpNauyYKmq/NYUn2LNVFCOIUAui+fnplUHYMIGXJjqI/lzvoFd/yh+s1bfEYgv
         Iumf1Mv3Ex50/NRBxfWSzDL94S+z70QTMcok11LdeMMPlrcz1IZLAcG910Sm8Q1BhJiu
         1LaiZcHvlHuenrCuUqJd1bM1WV/z/lPljY+fcSIzl9FL+MGHLw5iqTXdKgwDb7keqgHA
         1Wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7NUIuWcc29XAhs44U0unGtez+GUKQ8v4NObLnMMMLsA=;
        b=miPNA60CINolg/vqtwam0Xt9y2v2YmPYuq6iJuSUtusJw67HjkovOmxlPA69YysEfe
         Cl92PaCMc2toh+ZKTgJyG53z+kicxkSaxfVIRUREd4v7DCDSf5y+R8gDeA4/mLzdOGAw
         2O3QNFlhgBZxzEY1wtx83bKI5rtkvTk8eJ3B/9ktFPy/TOODMryBny1vLhtqKkjinq5e
         k10T71zSGTKFRyXhCYSqi72gZuyl5XKdfDAfc70fdsJM7ykM+3DQwMIPC8iyLPNvWMMa
         WcPmX93Hav0VvVJRbaI1xUabSHaYO1xjjtI4kVEGKSwLjQjq/CQwopH9W85KBaL/w8xv
         xWSw==
X-Gm-Message-State: AOAM532E0RU5ZkXtJLD62xq27qnOg67vVtNWGGfIEkcKxYFE92GP/9G0
        RYmZ/uWUCIz7Pt2RGT+PdBP2xR2hEji0hvM6hny1Fw==
X-Google-Smtp-Source: ABdhPJxVWi5gqix+VnBa8ML8j5+gKLfpG9o5wdSxpgtfI6wubLZ3enzXSw4dbuUdjDNq58Q8604iIlfBnolwcT4y2rk=
X-Received: by 2002:a2e:2244:: with SMTP id i65mr288265lji.111.1608230576758;
 Thu, 17 Dec 2020 10:42:56 -0800 (PST)
MIME-Version: 1.0
References: <20201205004848.2541215-1-willmcvicker@google.com>
 <X9e5vl+nw4GQNYEw@google.com> <nycvar.YFH.7.76.2012171119240.25826@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2012171119240.25826@cbobk.fhfr.pm>
From:   Will McVicker <willmcvicker@google.com>
Date:   Thu, 17 Dec 2020 10:42:40 -0800
Message-ID: <CABYd82Z-HJfn1Ts=k7RYrvWCHj=1578--9Y7A0giFn2=RRWcVA@mail.gmail.com>
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

Great! Thanks for the reply.

--Will

On Thu, Dec 17, 2020 at 2:19 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Mon, 14 Dec 2020, Will McVicker wrote:
>
> > > The HID subsystem allows an "HID report field" to have a different
> > > number of "values" and "usages" when it is allocated. When a field
> > > struct is created, the size of the usage array is guaranteed to be at
> > > least as large as the values array, but it may be larger. This leads to
> > > a potential out-of-bounds write in
> > > __hidinput_change_resolution_multipliers() and an out-of-bounds read in
> > > hidinput_count_leds().
> > >
> > > To fix this, let's make sure that both the usage and value arrays are
> > > the same size.
> > >
> > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > ---
> > >  drivers/hid/hid-core.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > > index 56172fe6995c..8a8b2b982f83 100644
> > > --- a/drivers/hid/hid-core.c
> > > +++ b/drivers/hid/hid-core.c
> > > @@ -90,7 +90,7 @@ EXPORT_SYMBOL_GPL(hid_register_report);
> > >   * Register a new field for this report.
> > >   */
> > >
> > > -static struct hid_field *hid_register_field(struct hid_report *report, unsigned usages, unsigned values)
> > > +static struct hid_field *hid_register_field(struct hid_report *report, unsigned usages)
> > >  {
> > >     struct hid_field *field;
> > >
> > > @@ -101,7 +101,7 @@ static struct hid_field *hid_register_field(struct hid_report *report, unsigned
> > >
> > >     field = kzalloc((sizeof(struct hid_field) +
> > >                      usages * sizeof(struct hid_usage) +
> > > -                    values * sizeof(unsigned)), GFP_KERNEL);
> > > +                    usages * sizeof(unsigned)), GFP_KERNEL);
> > >     if (!field)
> > >             return NULL;
> > >
> > > @@ -300,7 +300,7 @@ static int hid_add_field(struct hid_parser *parser, unsigned report_type, unsign
> > >     usages = max_t(unsigned, parser->local.usage_index,
> > >                              parser->global.report_count);
> > >
> > > -   field = hid_register_field(report, usages, parser->global.report_count);
> > > +   field = hid_register_field(report, usages);
> > >     if (!field)
> > >             return 0;
> > >
> > > --
> > > 2.29.2.576.ga3fc446d84-goog
> > >
> >
> > Hi Jiri and Benjamin,
> >
> > This is a friendly reminder in case this got lost in your inbox.
>
> Hi Will,
>
> I am planning to merge it once the merge window is over.
>
> --
> Jiri Kosina
> SUSE Labs
>
