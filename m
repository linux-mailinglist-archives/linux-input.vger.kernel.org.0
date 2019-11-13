Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4F70F9FDF
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 02:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfKMBIV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 20:08:21 -0500
Received: from mail-yb1-f193.google.com ([209.85.219.193]:36869 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbfKMBIV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 20:08:21 -0500
Received: by mail-yb1-f193.google.com with SMTP id q7so305260ybk.4;
        Tue, 12 Nov 2019 17:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yCcpUR5xkua6Y67E1na1yBqKbBskN49m1re7QSulc+c=;
        b=CUDBGayJwfrXnS81uXoV6axLx6w9zRBvGZj0bs3n3k8g5md33a3NxNZKjf/lZQ2Lgc
         isEk0dD6bAR4+RgG/mrAf11xWuiCXXHeX39W7QOTCS8PoUTO4r3Yx/n5aptWhBfTGlBX
         Uvd0/0amO0IJkLarJc1o2KBEZPIbfspvtrfcda4kekqVOy2JciyuuyY4A55Toquc7cWd
         HNhe7u+bQrVv2GEo8N2mchTUdAgnRCq8VaI4eQ6r6RebDcuiVS5Bf88dIwcAXIyL7Jzr
         hne8OOb2qeW0y1V/kmUYNFkrccfQQ051QvihxZ3DX74kZ56E3MRuyW91sTeqII+C2jDr
         z6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yCcpUR5xkua6Y67E1na1yBqKbBskN49m1re7QSulc+c=;
        b=c8kfpqrGB1q+sYDtPOZWYEuVlqiPfL02h4IrYo5dKk72rW+vMmJo1u23svBZt61nT0
         ICl96bE196e06iMNh4U7tKqhb3b4GX6H5k59NXyfL4jNrHTKNG/vhuq+nn450fMJcsbJ
         lMLvzNrvrwEt5d7kC1wQXH2qVl/Q2HyfAfabHSDtBbeBogxjBj4O0G43osIb9iWnacyL
         Tdoegu9KFqUFyQE3FhDmfqdcjDHEi8CgMVr5vS9akfmtM3A/BAK8wNRhPOwxXE8yIJs0
         3JmtbMcoT+byckn+tbKCuZ25+nlPwvW2ahT6laU3jp513JTUgijVng7bSHYf7ljymA71
         hB4w==
X-Gm-Message-State: APjAAAUoUdLRl8esF/F1L/+JiUAl9OOvKguF6fpuTyJjzGvlEJuUujn7
        jQVynbKtsk98l1o/C5Mkb4BDhz1+AMhWUhUbayNXf6Hx
X-Google-Smtp-Source: APXvYqzyro2dGGTOyuvh5jyYXnhBqcnTkQTANa4z2q7vE0p41H0RGhhtbgv9AjTm9xWSWnitwREQkvbnm84KuSXSb7w=
X-Received: by 2002:a25:d8c5:: with SMTP id p188mr724930ybg.414.1573607300682;
 Tue, 12 Nov 2019 17:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20191022142139.16789-1-candlesea@gmail.com> <nycvar.YFH.7.76.1911121457050.1799@cbobk.fhfr.pm>
 <CAO-hwJKO5u6xUrBe_ne0OqFAHM9dpwtTOWtYW+3z-LxSFT6VWQ@mail.gmail.com>
In-Reply-To: <CAO-hwJKO5u6xUrBe_ne0OqFAHM9dpwtTOWtYW+3z-LxSFT6VWQ@mail.gmail.com>
From:   Candle Sun <candlesea@gmail.com>
Date:   Wed, 13 Nov 2019 09:08:09 +0800
Message-ID: <CAPnx3XPLkrsxDwWujd5Yi3qwwVzhBAp7Kh9sGNPxfFpXmmovhw@mail.gmail.com>
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

On Tue, Nov 12, 2019 at 11:18 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi all,
>
> On Tue, Nov 12, 2019 at 2:57 PM Jiri Kosina <jikos@kernel.org> wrote:
> >
> > On Tue, 22 Oct 2019, Candle Sun wrote:
> >
> > > From: Candle Sun <candle.sun@unisoc.com>
> > >
> > > Upstream commit 58e75155009c ("HID: core: move Usage Page concatenation
> > > to Main item") adds support for Usage Page item after Usage ID items
> > > (such as keyboards manufactured by Primax).
> > [ ... snip ... ]
> >
> > Benjamin,
> >
> > are you planning to run this through your testsuite against regressions?
> >
> > I believe that's the last missing step, otherwise I'd be fine merging
> > this.
>
> Sorry I had to deal with family issues 2 weeks ago, and now RHEL is
> coming back at me and eating all my time.
>
> The kernel patch is now OK, so we can grab it now (either you take it
> Jiri, and add my acked-by or I'll push it later...)
>
> Candle, can you rework
> https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/58 so
> that it mirrors the kernel code (and get rid of the
> self.local.usage_page_last logic)?
>
> Cheers,
> Benjamin
>

Thanks Jiri and Benjamin.
I will rework the hid-tools patch ASAP.

Regards,
Candle

> >
> > Thanks,
> >
> > --
> > Jiri Kosina
> > SUSE Labs
> >
>
