Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA48FD052B
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 03:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730000AbfJIBWI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Oct 2019 21:22:08 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:40108 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbfJIBWI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Oct 2019 21:22:08 -0400
Received: by mail-vs1-f66.google.com with SMTP id v10so419425vsc.7
        for <linux-input@vger.kernel.org>; Tue, 08 Oct 2019 18:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TqcW2nJa6/sYXNvfpb9MEbnZ1VJq5krUA/XRLhNaEOg=;
        b=VpO5HthVvX6kZhEatkMSNZqwBEahgwHieiF+p1ewly25dce0MtDiYaPbLY4W7CaDfH
         VKZCJaiRq+I3wKNWAgm0Is/tHX5KGs6cgU+fEbfwxwTyYc2wgvCYX2tx8/LDg1bGfVZ+
         i25Q1UisumEO9sfEJimJ0k0h+Y0fP95h5DfwR0+l0Jd7NTFoj+OVfwOlDC9hGUzDJWkf
         CXbU9mUijKDlog4NzbFtRXJuhR7+8os1oUgmhp+9in+b/7swPia3pup9uYkVjt7hBTX4
         fS6ZtGlvXl2UVkdjLAOWehblcryJeoOeZh0PpKIs8wJOnLwFgA5djOPuUJxHZ9u3wsa1
         DtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TqcW2nJa6/sYXNvfpb9MEbnZ1VJq5krUA/XRLhNaEOg=;
        b=aIIoaYJzDd1L2fbkMwotl044Zrldd2foFvRVfPTPAStDyU9t2hl3Hl9ajtqzA5Etv1
         fjP8flr2Ro64v3ryNwIsIMsp2XUXWk28aBtC9kzSt9JRlMtfNBFpTnhEUPd9cU3/BSj5
         T8/HDAxg4K6EOtt4Y5kwV3z8lkkEN6lyvIwXHlT3FJWa7OwCa9yoRpJd+h+xPSbowImA
         upV+RPeKfxY7uVBmatXwqQpE6TR18XKRYckJhfqK/xZ36Zp52AdxE9tXm/Gi74GDpu3D
         lbRUW5Z+IkRM1/c3ek0h4cdX29DoPO2dh2PN3g/TRKvOb35VQ3QIaBqIpniQNuHzLOuR
         n2NA==
X-Gm-Message-State: APjAAAX8K8SGvTOoHkrNBYp8M7Wbsgx3MMTWLlQLjy7RLQiLEVYsj086
        lJSFgJqv4wepaRcpV+qiOokMOaGo8l9Rd+2dK00=
X-Google-Smtp-Source: APXvYqzMks1HFdqpFYdVje7a0VFPDikmgt0R9RNw9NXLAWr+jN1KJPwXGMp0/91vRS+B6VFbWI0V61tHw9nhfxKSC/s=
X-Received: by 2002:a05:6102:827:: with SMTP id k7mr432679vsb.220.1570584127514;
 Tue, 08 Oct 2019 18:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190915233140.244347-1-djogorchock@gmail.com>
 <20190915233140.244347-2-djogorchock@gmail.com> <nycvar.YFH.7.76.1910071711440.13160@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.1910071711440.13160@cbobk.fhfr.pm>
From:   Daniel Ogorchock <djogorchock@gmail.com>
Date:   Tue, 8 Oct 2019 20:21:56 -0500
Message-ID: <CAEVj2tnBW-rYO5mSWa83yx4ZQ4LJ+apNkssiJTLR6g8r6yc-MA@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] HID: joycon: add nintendo switch controller driver
To:     Jiri Kosina <jikos@kernel.org>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        jbrandst@2ds.eu0, Siarhei Vishniakou <svv@google.com>,
        s.jegen@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 7, 2019 at 10:14 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Sun, 15 Sep 2019, Daniel J. Ogorchock wrote:
>
> > The joycon driver supports the Nintendo Switch Pro Controllers and the
> > Joy-Cons. The Pro Controllers can be used over USB or Bluetooth.
> >
> > The Joy-Cons each create their own, independent input devices, so it is
> > up to userspace to combine them if desired.
> >
> > Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> > ---
> >  MAINTAINERS              |   6 +
> >  drivers/hid/Kconfig      |  11 +
> >  drivers/hid/Makefile     |   1 +
> >  drivers/hid/hid-ids.h    |   3 +
> >  drivers/hid/hid-joycon.c | 820 +++++++++++++++++++++++++++++++++++++++
>
> Hi Daniel,
>
> I've finally (sorry for the delay) through reviewing these patches. All
> looks good and ready to be merged, the only last request I'd have -- could
> we please have this called hid-nintendo instead? We've been going on with
> the per-vendor driver naming for quite some time already.
>
> If you agree with that, let's get this queued for 5.5.
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

Hi Jiri,

Yes, I can change the name to hid-nintendo. I'll try to get a new
patchset submitted in the next week with the name change and the code
improvements Silvan mentioned in his review of this patchset.

Thanks,
Daniel Ogorchock
