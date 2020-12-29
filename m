Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE532E7315
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 19:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgL2Suv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 13:50:51 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:19234 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbgL2Suv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 13:50:51 -0500
Date:   Tue, 29 Dec 2020 18:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609267808;
        bh=Dxzz1Onh+CnJaur9pe276Ea+HxqDE9zAQNF/CmtHFYQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=plYy2CTZwYFjmq3fPQU3GaTr5wtHwqkIMSaxb6D2K6SlJ1a9a+hj5y4VRh03GjKgB
         Pmkw0ZA8Lsy6qwK3Uvsm8Fs1DMEtMOIHP7AEC4cv6fGnHL2EDDWwLaXBcLmYC2sGAd
         nyBolH4QeKqgjQdXQ+Ix2cbT1HVzOp1f5gk5fa70=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 11/13] HID: playstation: add DualSense player LEDs support.
Message-ID: <Ee06NX3a3IlP-SwuhM_nbxoV4mALNgJcvoAlILMpBo0kiW1PTpawk7n7Fy08PzWbyY7NAGprXifN6peWr8ilHYbYKKDd2u0YkWLJMtdymcs=@protonmail.com>
In-Reply-To: <CANndSKkjhEDU0eB=J_F0CCZn2F=Jy3UMzBKOgJaNvecqRtAfnQ@mail.gmail.com>
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-12-roderick@gaikai.com> <8ROOgrBVvXav7SOnZgBVtvZ4QKubyktYJ2WsauoAH22lewKj2-Rp9a-uEZyxhItvF3Q7pp8hKZ4etl0jgiD-G3XkbL1aM9z8cRNsHHmGN9A=@protonmail.com> <CANndSKkjhEDU0eB=J_F0CCZn2F=Jy3UMzBKOgJaNvecqRtAfnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

2020. december 28., h=C3=A9tf=C5=91 23:02 keltez=C3=A9ssel, Roderick Colenb=
rander =C3=ADrta:

> [...]
> > Furthermore, I don't quite see the purpose of this function. The LED co=
re
> > can handle if no brightness_get() callback is provided. And since this
> > function returns just a cached value, I fail to see how it is different=
 from
> > the default behaviour of the LED core, which is returning the last brig=
htness
> > value. Am I missing something?
>
> Not all values may get set through sysfs. For example in the next
> patch (12/13) the driver sets a default player LED mask value directly
> and may set e.g. 0x1f or so. This could use the LED APIs, but the LED
> framework doesn't have any group LED support (besides the new
> multicolor class) and as such would get scheduled across multiple
> output reports.
> [...]

You're right, I've missed that.
