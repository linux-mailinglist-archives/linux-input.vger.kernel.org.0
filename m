Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 957961792CC
	for <lists+linux-input@lfdr.de>; Wed,  4 Mar 2020 15:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgCDOzx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Mar 2020 09:55:53 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31119 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726579AbgCDOzw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Mar 2020 09:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583333751;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oKVK8TwDwaGEB6ayUlSBTUyLsbqiCprj+fuuCbfWt8c=;
        b=gHl3rcNgWwA3KjKsNBCe7n9GQe80hL/HsmKsmpjEk/Cx+wQb1nOBmYADuhHtitTBuTLyU1
        B1KyJN7ZEdT1ogL/m3Y+jvDb/kzXK6wNuH5Cnb3l7IneQ+HQrdM0i76eJIqgOQbPiDWCYI
        gT5IAwjtE0/PhLbQ4P78IVGWs/XNw9U=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-O-DZZIsNNda6lv9GItsHdg-1; Wed, 04 Mar 2020 09:55:46 -0500
X-MC-Unique: O-DZZIsNNda6lv9GItsHdg-1
Received: by mail-qk1-f198.google.com with SMTP id x21so1446818qkn.18
        for <linux-input@vger.kernel.org>; Wed, 04 Mar 2020 06:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oKVK8TwDwaGEB6ayUlSBTUyLsbqiCprj+fuuCbfWt8c=;
        b=nQ9NbflkgSn8LZG56re41t9SovugLaqxKUN9ZFuu4J8EkhlSqlaL2V7nQs3dQ9mxXM
         3FOl0zItSyYpaR/1m91lumizSozwJCHkrkhwgXJEjBAkGGVcBTiC6M8JMGjAuAtI9Zic
         tsfAPi5uY9/7wPMUmcnoefYsdJONKbIgtUZ+46Gw86GgzP+B/nHuk7pZf8OlGmD0lB+O
         OJkIarny9PZ5YocuXrghiL7FJR3bYca+iwlPtmAz4xqLiqElNkt5tsvg8aPVVC6AqqEr
         Hxup3WB8/YCzbXJYCjjJV+f5ZhjO1+o/viXogVuBG6JFWF+JStHxBGyteyPTm0/9dMjJ
         CEPQ==
X-Gm-Message-State: ANhLgQ2Iu8VpaGsu4UryjmdKeS80VpTNNayt/WiouWFTup4E2sa4wOcO
        8XyH6PRmbsVA66VxWSJFtNhI2OIfIbB4z/dDxfToWZlSci+6RT/agys1HaqvC2BIgTFwNl0AKTb
        sYfZLbG2L1zBrohx0kNQF5vg32MSm3IZVyFQgSu4=
X-Received: by 2002:a05:620a:1517:: with SMTP id i23mr3121562qkk.459.1583333746201;
        Wed, 04 Mar 2020 06:55:46 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsCAa2/9q1HqrDGCRKmEqLJ4HJoEC8U/Z96fo7d9Ti23/A7BUH/Rq0FcHkVHybbcOgLpahxaE1ZwaDldnelFJ8=
X-Received: by 2002:a05:620a:1517:: with SMTP id i23mr3121533qkk.459.1583333745910;
 Wed, 04 Mar 2020 06:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20200229173007.61838-1-tanure@linux.com> <CAO-hwJJDv=LnOQDbgWwg2sOccM9Tt-h=082Coi0aYdwG-CG-Kg@mail.gmail.com>
 <20200302120951.fhdafzl5xtnmjrls@debian> <20200304144858.xc6ekcvbzrhbggsc@debian>
In-Reply-To: <20200304144858.xc6ekcvbzrhbggsc@debian>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 4 Mar 2020 15:55:34 +0100
Message-ID: <CAO-hwJ+-xZgiNhOcRo1k3hGQxxkPd2RVrAbA3Gq1P28h7M1gdA@mail.gmail.com>
Subject: Re: [PATCH] HID: hyperv: NULL check before some freeing functions is
 not needed.
To:     Wei Liu <wei.liu@kernel.org>
Cc:     Lucas Tanure <tanure@linux.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Sasha Levin <sashal@kernel.org>,
        Jiri Kosina <jikos@kernel.org>, linux-hyperv@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 4, 2020 at 3:49 PM Wei Liu <wei.liu@kernel.org> wrote:
>
> On Mon, Mar 02, 2020 at 12:09:51PM +0000, Wei Liu wrote:
> > Hi Benjamin
> >
> > On Mon, Mar 02, 2020 at 11:16:30AM +0100, Benjamin Tissoires wrote:
> > > On Sat, Feb 29, 2020 at 6:30 PM Lucas Tanure <tanure@linux.com> wrote:
> > > >
> > > > Fix below warnings reported by coccicheck:
> > > > drivers/hid/hid-hyperv.c:197:2-7: WARNING: NULL check before some freeing functions is not needed.
> > > > drivers/hid/hid-hyperv.c:211:2-7: WARNING: NULL check before some freeing functions is not needed.
> > > >
> > > > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > > > ---
> > >
> > > Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > >
> > > Sasha, do you prefer taking this through your tree or through the HID
> > > one. I don't think we have much scheduled for hyperv, so it's up to
> > > you.
> >
> > Sasha stepped down as a hyperv maintainer a few days back. I will be
> > taking over maintenance of the hyperv tree.
> >
> > The problem is at the moment I haven't got write access to the
> > repository hosted on git.kernel.org. That's something I will need to
> > sort out as soon as possible.
> >
> > In the meantime, it would be great if you can pick up this patch so that
> > it doesn't get lost while I sort out access on my side.
>
> Hi Benjamin
>
> I got access to the Hyper-V tree. I will be picking this patch up since
> I haven't got a confirmation from your side.
>

Great, thanks.

Sorry, I am pulled in freedesktop tasks right now that are a little bit urgent.

Glad you quickly set up the access rights.

Cheers,
Benjamin

