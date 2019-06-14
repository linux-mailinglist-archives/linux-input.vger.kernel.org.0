Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB0C445E53
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 15:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfFNNgQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 09:36:16 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33061 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727827AbfFNNgQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 09:36:16 -0400
Received: by mail-qk1-f196.google.com with SMTP id r6so1681850qkc.0
        for <linux-input@vger.kernel.org>; Fri, 14 Jun 2019 06:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9LlmkYnjQ09lYvGpUcAqj3kA1O47a4djevWb989ZA1w=;
        b=uYTb9+JqkvRlFk5agUlxQlR9uq6USomvtQ+3zDIWjvFg2FL1Ne84kmNYYcd8KwlqU2
         Z7BS5he/vooE7jggcvl8LBMtniKhU+dz31DwZMRlL+m3ZPGjub8QwRgNPxdVkDko9tHd
         65SFezM1wnekaXut0SrRl+VZbuk5hYkjwhRgW/+5Udw+DoUlnYVhZiyUDjoAdFfFPOmA
         ULNS0EYQjgBbSZL/i15nkimb7qcxOeZxMyT6UBE+TMnGSahN8xy8F0Ws1sdab6KxgZzr
         cIx5Q53670l5Hy6Pj8q9kxsTxf/dU/9DNEB8Cg9gzHJptPC7nyhPB92c93AQ1nliGYe/
         hQuw==
X-Gm-Message-State: APjAAAX/fL+yo+zKxd8pivfAMeIu3oBjt9mOimSOv5rdiQNnHbAZSlpt
        q0wIcr+AdMR94Uv5gCxGe4G6btJMjIiNRZI6TWdNQA==
X-Google-Smtp-Source: APXvYqxiuI0SUUQnJRSwm7z5cWkb4lnXy0zELVp/wWllW/D+t1xRaQpRqi09nRRT6VR/fXxGrSPtZB8M1COZHqcgneE=
X-Received: by 2002:a37:8e03:: with SMTP id q3mr78142534qkd.234.1560519375030;
 Fri, 14 Jun 2019 06:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190611121320.30267-1-nsaenzjulienne@suse.de>
 <CAO-hwJLAiC1o-kZ5epZHtO2GK+zc5x28pYbZH-XsY4yAuBmHWw@mail.gmail.com> <5346893.KeHrH3GHoD@linux-lf90.site>
In-Reply-To: <5346893.KeHrH3GHoD@linux-lf90.site>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 14 Jun 2019 15:36:03 +0200
Message-ID: <CAO-hwJ+Nm+i+ehGurAxD3EQBX8-TFQ7p4J-1rV55fVA=NazgAw@mail.gmail.com>
Subject: Re: [PATCH v2] HID: input: fix a4tech horizontal wheel custom usage
To:     wbauer1@a1.net
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Wolfgang,

On Thu, Jun 13, 2019 at 1:49 PM Wolfgang Bauer <wbauer@tmo.at> wrote:
>
> On Tuesday, 11. Juni 2019, 16:42:37 Benjamin Tissoires wrote:
> > On Tue, Jun 11, 2019 at 2:13 PM Nicolas Saenz Julienne
> >
> > <nsaenzjulienne@suse.de> wrote:
> > > NOTE: I CC'd Wolfgang as he's the one who can test this.
> >
> > I'll wait for Wolfram to confirm that the patch works before pushing then.
>
> My name is Wolfgang, not Wolfram... ;-)

ouch, sorry for that (I am more used to talk to the I2C maintainer apparently)

> But never mind.
>
> I tested the patch meanwhile on top of kernel 5.2.rc4, where the mouse wheel
> actually worked.

Actually, I am a little bit lost here.

The patch mentions a fix of c01908a14bf73, which is in 5.1 final.
So if your mouse works in 5.2.rc4, I am not sure how
HID-a4tech-fix-horizontal-scrolling.patch could break it.

Could you be slightly more specific in what "works" and what doesn't?

Do we have the report descriptors available somewhere?
And if not, could you run hid-recorder from
https://gitlab.freedesktop.org/libevdev/hid-tools and attach the logs
when you move the horizontal wheel?

Cheers,
Benjamin

> As the patch didn't apply cleanly (it's obviously based upon
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=abf82e8f7e9af40a49e3d905187c662a43c96c8f , called "HID-
> a4tech-fix-horizontal-scrolling.patch" below), I added that patch as well.
>
> My results:
> kernel 5.2.rc4 works
> kernel 5.2.rc4 + HID-a4tech-fix-horizontal-scrolling.patch is broken
> kernel 5.2.rc4 + HID-a4tech-fix-horizontal-scrolling.patch +
> HID-input-fix-a4tech-horizontal-wheel-custom-usage.patch (i.e. this patch)
> works again
>
> kernel 5.2.rc4 + HID-input-fix-a4tech-horizontal-wheel-custom-usage.patch
> works as well.
>
> So AFAICT this patch seems to be fine.
>
> For completeness, this is my mouse as listed by lsusb:
> Bus 003 Device 002: ID 09da:000a A4Tech Co., Ltd. Optical Mouse Opto 510D /
> OP-620D
>
> Kind Regards,
> Wolfgang
>
