Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8143280D0
	for <lists+linux-input@lfdr.de>; Mon,  1 Mar 2021 15:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236335AbhCAO3J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Mar 2021 09:29:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37736 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236231AbhCAO3G (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Mar 2021 09:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614608858;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IXCBRh2c+qBG4FYkxXs4egkrr88I5IuLhf4mFWnbMs4=;
        b=BhlhCVqhHQuIqEyP80O8jwEnmQaj4tcbZK1E4qE+CPaJvL3R/2E/FM7oujqJS8DKFKI0ie
        08zZ0902glUK3ynvmT9eAapgYk32xaLFZ/KhXtVDRZKoS6tkT1Dn/9a+J3tjC8yqrBGr5U
        +jeOBzJQq1N9Ws7D/pecpDxaZPEi3Zk=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-BRtSFPkGNGyI-6MCIva3ww-1; Mon, 01 Mar 2021 09:27:34 -0500
X-MC-Unique: BRtSFPkGNGyI-6MCIva3ww-1
Received: by mail-pg1-f198.google.com with SMTP id n2so9936208pgj.12
        for <linux-input@vger.kernel.org>; Mon, 01 Mar 2021 06:27:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IXCBRh2c+qBG4FYkxXs4egkrr88I5IuLhf4mFWnbMs4=;
        b=jUyoKkj2XHwCga7SkiUoF0ljg5yK2aqOJb8RXOLJ06tqom2TITEvrmu9JIp85xyj0j
         wFTAoqKeu44VvtePpRYQT6PQusUzFIQ/p3c0kaG46qSUtsviJtAqxCC7HEPiPEzWcPVE
         uiC6U88s5+iCbsrSP2ZbItX+Bb000hYpaemu8gt4UWvXYExi8ZHeTtmoE8kQkgqdgoRg
         ujZ4RHdGkHciezmhHDxVi2RGSNH+uf2w6Rx3UlTFr2d01JGkwAN8Vl0SJYaWQvzJtoHS
         4vSHpFEGNz6381zt06U9xXhs6DbFM+64qIg52aqWq6CsWTQWjOpgAl1uSIL41xs0sNLW
         25+w==
X-Gm-Message-State: AOAM532IVXT4JeUPJsjZpUHJ3oVXVJCaLemcVyhQNwzFcglAHFKegNKc
        gieKnsUCMOnDbM2pxJ5K1s7NGBSbplwtpptxY1fowu4KBlOFiz3uNToi2dVoxivPK0SQQHpZJb+
        /+hS5z4U5ozWQ6BFewTwGZ7AIAUGHCsdrICTy16E=
X-Received: by 2002:a17:902:9b91:b029:e2:898c:d721 with SMTP id y17-20020a1709029b91b02900e2898cd721mr15893422plp.32.1614608853363;
        Mon, 01 Mar 2021 06:27:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1RhN7M5F9TIKLkoUngTtVB6Hn2M7hQyWdTc6rjiMIGVlZ9uKlnDsBGo49gjLo70zIi6BUT0oKxAcpEbauCeg=
X-Received: by 2002:a17:902:9b91:b029:e2:898c:d721 with SMTP id
 y17-20020a1709029b91b02900e2898cd721mr15893396plp.32.1614608853104; Mon, 01
 Mar 2021 06:27:33 -0800 (PST)
MIME-Version: 1.0
References: <20210228012643.69944-1-ronald@innovation.ch> <20210228012643.69944-4-ronald@innovation.ch>
 <CAHp75Vfd6wZwg9HWJoEwvzAAZR=8K2zDWbz4FZfbbrJBvZS4yQ@mail.gmail.com>
In-Reply-To: <CAHp75Vfd6wZwg9HWJoEwvzAAZR=8K2zDWbz4FZfbbrJBvZS4yQ@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 1 Mar 2021 15:27:22 +0100
Message-ID: <CAO-hwJLXAHvjYKxu8pyqMPCNgMrN-H8bGWudVqCaRFnWODHPVQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] HID: core: Export some report item parsing functions.
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>,
        Jiri Kosina <jikos@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 1, 2021 at 3:18 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Feb 28, 2021 at 3:30 AM Ronald Tschal=C3=A4r <ronald@innovation.c=
h> wrote:
> >
> > These are useful to drivers that need to scan or parse reports
> > themselves.
>
> ...
>
> > -       while ((start =3D fetch_item(start, end, &item)) !=3D NULL)
> > +       while ((start =3D hid_fetch_item(start, end, &item)) !=3D NULL)
> >                 dispatch_type[item.type](parser, &item);
>
> > -       while ((next =3D fetch_item(start, end, &item)) !=3D NULL) {
> > +       while ((next =3D hid_fetch_item(start, end, &item)) !=3D NULL) =
{
> >                 start =3D next;
>
> I don't see the full picture, but perhaps you may also introduce
> for_each_hid_item() or so.

Same here, I don't see the full picture, but I would suggest to not
export those functions at all.

From 4/5, I can see that you are using them in
appleib_find_collection(), which is only called by
appleib_add_device(), which in turn is always called with a parsed and
started HID device. Why can you not rely on the core parsing and
iterate over the already parsed hid_field?

Cheers,
Benjamin

