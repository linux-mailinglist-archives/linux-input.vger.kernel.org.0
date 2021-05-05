Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3420373C61
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 15:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhEEN3O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 09:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58162 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233659AbhEEN3N (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 09:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620221296;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MUmZrpGT6OxCV5nAhpibrhOp+RbEkcdwQ+thqkA6VLU=;
        b=D3LCYFRMTEplVQxx+uodTHoPWhiMv7N8WDaDSOHeOiSbTlMw9rNw2kuRopxraynYQOHanJ
        DWWDroXJuxUUYzYymc4Gj4MTeQGDUT8M+qTfx6e4Coh/gHAlz2i4CXSxJsaskLAoIuRRs7
        rz6YfqM5vGKctayBHyqk/Fi1jxdJxak=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-JD1AhgRpPniCryCffatexQ-1; Wed, 05 May 2021 09:28:15 -0400
X-MC-Unique: JD1AhgRpPniCryCffatexQ-1
Received: by mail-pg1-f197.google.com with SMTP id m7-20020a6545c70000b029020f6af21c77so1341329pgr.6
        for <linux-input@vger.kernel.org>; Wed, 05 May 2021 06:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MUmZrpGT6OxCV5nAhpibrhOp+RbEkcdwQ+thqkA6VLU=;
        b=f/QkNL2J7K/cRhumYt9amC5ELxFIV9rr/jHT8WF2v7uMf636vnC22uqvLcVmP8Nteh
         TOsaU/9IxxFgfyb1kQW0z4swVDRJsvhT0Kpc2+H2ylSKhUFC1aI7ucAaojvaXJC/tqsa
         TWMFNAFWDO7MDog+JAElSHgDUQd4u07AhVIWY7zkeOKc7S4SYYgdp89kHa+UX/k32Y5h
         8Qjj3b8qsLQm2v44eNx931MhvxD8SJk4TLsgnpZyctZx5AwfnJxAFwwJvCH14FtjNitI
         9iIq78cMtufD85kml/zauTV+pWemaC6NZG8WT/BUzbprWcIchZxy/vg+0lMYgJbcZ4pk
         dkFQ==
X-Gm-Message-State: AOAM531gvbrXkcdHA7sEr2a1VQdDL17UzaaYBjcoWe7MBuB9ICuM9HEl
        dcDJs4BJN5HmF8XmXW2MzcTZQfiglMa1LNWjF4ZSbTo38l5D/71uCeiAYttxye5kzAEeceVyGSD
        cf0VYggDLiaYAtq59cIgvnuBz6dKNuf24VOPcuN8=
X-Received: by 2002:a62:bd13:0:b029:25c:5ec4:c2f3 with SMTP id a19-20020a62bd130000b029025c5ec4c2f3mr28257267pff.35.1620221294312;
        Wed, 05 May 2021 06:28:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmaTszpJd+BjoubicAkSbsiwpgvFJHCmYcIq2p+UjwLzcdCaRjQQ1vUD6i4gSX9XshlboW+HAC8aeOsYA+wIE=
X-Received: by 2002:a62:bd13:0:b029:25c:5ec4:c2f3 with SMTP id
 a19-20020a62bd130000b029025c5ec4c2f3mr28257243pff.35.1620221294078; Wed, 05
 May 2021 06:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210415185232.2617398-1-srinivas.pandruvada@linux.intel.com>
 <20210415185232.2617398-2-srinivas.pandruvada@linux.intel.com> <nycvar.YFH.7.76.2105051437420.28378@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2105051437420.28378@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 5 May 2021 15:28:03 +0200
Message-ID: <CAO-hwJJM5F-1PAh62JSW+GAivMRpgjBiPT2Jvf7+vNcL=HRhGw@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: hid-sensor-custom: Process failure of sensor_hub_set_feature()
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jonathan Cameron <jic23@kernel.org>,
        jiapeng.chong@linux.alibaba.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 5, 2021 at 2:38 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 15 Apr 2021, Srinivas Pandruvada wrote:
>
> > When user modifies a custom feature value and sensor_hub_set_feature()
> > fails, return error.
> >
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > ---
> > Replaces patch: HID: hid-sensor-custom: remove useless variable
> > by Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> >
> >  drivers/hid/hid-sensor-custom.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/hid/hid-sensor-custom.c b/drivers/hid/hid-sensor-custom.c
> > index 2628bc53ed80..58b54b127cdf 100644
> > --- a/drivers/hid/hid-sensor-custom.c
> > +++ b/drivers/hid/hid-sensor-custom.c
> > @@ -406,6 +406,8 @@ static ssize_t store_value(struct device *dev, struct device_attribute *attr,
> >                                                               report_id;
> >               ret = sensor_hub_set_feature(sensor_inst->hsdev, report_id,
> >                                            index, sizeof(value), &value);
> > +             if (ret)
> > +                     return ret;
>
> What tree is this patch against? In my tree, we're not even assigning
> sensor_hub_set_feature() return value to anything.
>

I guess there was a "collision". At roughly the same time I merged
https://patchwork.kernel.org/project/linux-input/list/?series=456269
people were starting to send various patches for the same thing.

Srinivas, either the change in for-next (and probably Linus' master
now) is fine, or could you rebase on top of hid.git?

Cheers,
Benjamin

