Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3DD5139EC8
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 02:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbgANBLw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 20:11:52 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29551 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729088AbgANBLv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 20:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578964310;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yJS3SQDuyFcfsfzdSLUzj3J9c/FI6Hl/bpVZVrZ98a8=;
        b=FVpF3BDaEYWQ7X990OCJslqrK7wILUgBxAdxoRjmqiAImRLXI2jcWpEYFVvrKw+g0uE/v9
        ujZexW2CB8vO4ROk+oExIMcqEoortze4hVT6TNsrHQAZtXXaky0jUtx4k+iR2r2NQOmwmV
        rCtginBoQPNoArqPnbJXzN38rmF8WGc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-Qo_xLr4dOcyI-JXllAWJiw-1; Mon, 13 Jan 2020 20:11:49 -0500
X-MC-Unique: Qo_xLr4dOcyI-JXllAWJiw-1
Received: by mail-qt1-f199.google.com with SMTP id m8so7854778qta.20
        for <linux-input@vger.kernel.org>; Mon, 13 Jan 2020 17:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yJS3SQDuyFcfsfzdSLUzj3J9c/FI6Hl/bpVZVrZ98a8=;
        b=RE0GGEWABWptNfFxhryVdkuLTeGwD5Mb+xIC3vPhlOXOgDoRq3Gifykb7DhStHX1em
         qMip/j6ehs3Ia86r5XhJAJN5QSJTv8CpscE6qHwZE3XCYRLHiZyUIW7Tirjm0m/nvdJ0
         jDCsIuvK551nSCGDCrTJeUwvOaLVXbMdDOCaKqMogIGLBYBrncpkcDhSAU8timBrzSXE
         B2yXvYfZdmnhwz9djt/g7Z951+4l6L2zuj4SlwLECwP5s07kKgxeSTf4VUHEWxpGvFL7
         ua+a/UhQPhktcT1VBM4VuvkjHsUenKEnznpf8M77HIx9SFY7ToA+UTFXmROu3qIrJ5ZZ
         uQAg==
X-Gm-Message-State: APjAAAUACW2lemSYQ3Xq6E/T5rOUftErGgWlQQDLi9H9EUzKwCytXn/i
        kldokouRDYxx3hRWdZLmO00S6T9uPBz9cEpjvlE+BYJrtYI1k7ElQH9xtFTQPxo9lA89j54vNSB
        /sJFKjLfjrJkHeLv+bYK64f98nBpgvzsyJ1IFixU=
X-Received: by 2002:ac8:6b98:: with SMTP id z24mr749419qts.294.1578964308732;
        Mon, 13 Jan 2020 17:11:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxcj0IG1yTGPYw+rvBGa//EjfsrQIdxtjKY9m8WnLqY6tnFhjxIf3+hwKS2Q5MxcKSkwOtS19rpkAkklAKKXnI=
X-Received: by 2002:ac8:6b98:: with SMTP id z24mr749412qts.294.1578964308564;
 Mon, 13 Jan 2020 17:11:48 -0800 (PST)
MIME-Version: 1.0
References: <20200112205021.3004703-1-lains@archlinux.org> <7d49a8444ea1740444d1e9133104530731bfb30a.camel@archlinux.org>
 <CAO-hwJ+56qUTr8HQOLyx9tgbJMuTTPbb6K40cwWnO=PzMcO+tQ@mail.gmail.com> <1e4143394f773df60a2ba329c940b339e4563bee.camel@archlinux.org>
In-Reply-To: <1e4143394f773df60a2ba329c940b339e4563bee.camel@archlinux.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 14 Jan 2020 21:08:42 +1000
Message-ID: <CAO-hwJJ00Vy5Hv=gsbopr=8e8xJfmt7wvZf+CSVrSZZ=S0uO9Q@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: add support for the Powerplay mat/receiver
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 14, 2020 at 10:55 AM Filipe La=C3=ADns <lains@archlinux.org> wr=
ote:
>
> On Tue, 2020-01-14 at 20:48 +1000, Benjamin Tissoires wrote:
> > On Tue, Jan 14, 2020 at 1:31 AM Filipe La=C3=ADns <lains@archlinux.org>
> > wrote:
> > > On Sun, 2020-01-12 at 20:50 +0000, Filipe La=C3=ADns wrote:
> > > > I also marked all lightspeed devices as HID++ compatible. As the
> > > > internal powerplay device does not have REPORT_TYPE_KEYBOARD or
> > > > REPORT_TYPE_KEYBOARD it was not being marked as HID++ compatible
> > > > in
> > > > logi_hidpp_dev_conn_notif_equad.
> > >
> > > Actually I had another look at the code and I don't understand why
> > > we
> > > are manually setting |=3D HIDPP in
> > > logi_hidpp_dev_conn_notif_equad/logi_hidpp_dev_conn_notif_27mhz. We
> > > should set it in logi_dj_hidpp_event as it is triggered by
> > > receiving a
> > > HID++ packet.
> >
> > long story short: nope :)
> >
> > The whole purpose of setting the workitem->reports_supported is to be
> > able to create the matching report descriptor in the new virtual
> > device. So having this set in a callback will add an operation for
> > nothing every time we get an event, and will also not ensure a proper
> > separation of concerns.
> >
> > Cheers,
> > Benjamin
> >
> > > What do you think Benjamin?
> > >
> > > --
> > > Filipe La=C3=ADns
>
> Okay, then is maybe better if I add HIDPP to reports_supported based on
> the device ID (7). This is the only product to my knowledge that
> exports a device with ID 7. It's a better solution than setting HIDPP
> on all lightspeed devices.

Yep, looks better.

>
> I will send a new patch if you agree with this approach.

thanks.

Cheers,
Benjamin

>
> --
> Filipe La=C3=ADns

