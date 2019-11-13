Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3EAFAD28
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 10:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfKMJkw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 04:40:52 -0500
Received: from mail-yb1-f195.google.com ([209.85.219.195]:33269 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbfKMJkv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 04:40:51 -0500
Received: by mail-yb1-f195.google.com with SMTP id i15so712218ybq.0;
        Wed, 13 Nov 2019 01:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M5EwNKVDW3H/UnosA9Wocs2SlYmcAoC45TwJkTVdRCI=;
        b=GDHZvz0iGzoFDe8bm3NLwx84Y+5vg+Kai9lFar9Sm0GJjaEnnvKVffBl+To2hKn4n0
         d08qUbibTSBNajgzzntQL2ywXmlkH41DPh7qHI5loyJ94r/A6VoWjZ0hD7jH+/oLD0Ce
         lIMcgNDWTXZGZmf+C/XHQc1uA9otXMQpQtNoU5qrL9nxWEDsKHNyYT8IGYv2ip8BCmuc
         pS/fX2i7asSBSE5ElM6pQNgvZDu1xskKnLinBaTsc115CyKE1sO7Neuqs/M8thW70+bZ
         6eeVZK+Q7tZUopksntTWBC1Skjpj6ec2axCRuKxenPK9Xhhhl0vo2JyzSnyiK+8JY4s1
         6dFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M5EwNKVDW3H/UnosA9Wocs2SlYmcAoC45TwJkTVdRCI=;
        b=JRHu+Gn8tu49VLUs5+gNSuakdFOple0nYJxzEt4yeLjDDV8QxsOGlRUvBGkKJ81AtE
         RhRIxxO3h2LDWsz3+rL0Em8q8wKtH2Lh0ZrYhXfy6Ou410SIit5/Gb/wyDjyHGYRdYQJ
         ZhW3XuEQgrL6QYX4BVlA1jLQXtr4eGJ7wOrnLldPex5aY+dx49jNp5Z0CfQzKbRTXEuB
         sjSQXywr0nTMVcTusaZCEXKsnf/+yhj4J3ZoukJDXPKP+brisBQk7KCj9PEyP2PwqDh0
         zje4Q+tYuet7gy/KMqiZNQlT4lhhwZR0wYWoOS1Lhu01Bw9U/CEEd1JiqwjhkoPR5XLv
         5Q0w==
X-Gm-Message-State: APjAAAX+sRtzuiqCXaKYVcHTXDTx9tnfa2fusSvLWDMu0dB00CRflR3X
        tyAYwBq1C6OEI/jLlDNmlZ5ngQGTq03mR3ao1Ko=
X-Google-Smtp-Source: APXvYqxr3mF1WbT34gUXRE1ns4ftUNsdOFARw3gsiN5wVjAjgFHnNG9XARu+9b5ZsrXeI/r0jqkEQ+LhP/rzp2ZIPKU=
X-Received: by 2002:a25:a087:: with SMTP id y7mr1807141ybh.91.1573638050715;
 Wed, 13 Nov 2019 01:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20191022142139.16789-1-candlesea@gmail.com> <nycvar.YFH.7.76.1911121457050.1799@cbobk.fhfr.pm>
 <CAO-hwJKO5u6xUrBe_ne0OqFAHM9dpwtTOWtYW+3z-LxSFT6VWQ@mail.gmail.com> <CAPnx3XPLkrsxDwWujd5Yi3qwwVzhBAp7Kh9sGNPxfFpXmmovhw@mail.gmail.com>
In-Reply-To: <CAPnx3XPLkrsxDwWujd5Yi3qwwVzhBAp7Kh9sGNPxfFpXmmovhw@mail.gmail.com>
From:   Candle Sun <candlesea@gmail.com>
Date:   Wed, 13 Nov 2019 17:40:39 +0800
Message-ID: <CAPnx3XOzPRtoQjG9L8zSc_-qP-V8Pd155-GPnTBSuyqNg+F53Q@mail.gmail.com>
Subject: Re: [PATCH v4] HID: core: check whether Usage Page item is after
 Usage ID items
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        =?UTF-8?B?57+f5LqsIChPcnNvbiBaaGFpKQ==?= <orson.zhai@unisoc.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 13, 2019 at 9:08 AM Candle Sun <candlesea@gmail.com> wrote:
>
> On Tue, Nov 12, 2019 at 11:18 PM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > Hi all,
> >
> > On Tue, Nov 12, 2019 at 2:57 PM Jiri Kosina <jikos@kernel.org> wrote:
> > >
> > > On Tue, 22 Oct 2019, Candle Sun wrote:
> > >
> > > > From: Candle Sun <candle.sun@unisoc.com>
> > > >
> > > > Upstream commit 58e75155009c ("HID: core: move Usage Page concatenation
> > > > to Main item") adds support for Usage Page item after Usage ID items
> > > > (such as keyboards manufactured by Primax).
> > > [ ... snip ... ]
> > >
> > > Benjamin,
> > >
> > > are you planning to run this through your testsuite against regressions?
> > >
> > > I believe that's the last missing step, otherwise I'd be fine merging
> > > this.
> >
> > Sorry I had to deal with family issues 2 weeks ago, and now RHEL is
> > coming back at me and eating all my time.
> >
> > The kernel patch is now OK, so we can grab it now (either you take it
> > Jiri, and add my acked-by or I'll push it later...)
> >
> > Candle, can you rework
> > https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/58 so
> > that it mirrors the kernel code (and get rid of the
> > self.local.usage_page_last logic)?
> >
> > Cheers,
> > Benjamin
> >
>
> Thanks Jiri and Benjamin.
> I will rework the hid-tools patch ASAP.
>
> Regards,
> Candle
>

Hi Benjamin,
The MR for hid-tools is updated:
https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/62

Thanks,
Candle

> > >
> > > Thanks,
> > >
> > > --
> > > Jiri Kosina
> > > SUSE Labs
> > >
> >
