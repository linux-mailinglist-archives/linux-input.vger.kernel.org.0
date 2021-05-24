Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4EC38F1D6
	for <lists+linux-input@lfdr.de>; Mon, 24 May 2021 18:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233061AbhEXQ45 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 May 2021 12:56:57 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:61933 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232543AbhEXQ45 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 May 2021 12:56:57 -0400
Date:   Mon, 24 May 2021 16:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1621875327;
        bh=R/HnY0Pr//e5PojjMU+l3WbnJaq3YYPJH53T7IGLlsc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=at23XtW+U+iO3edH+uv7gSo0KjmaNgS1HXN68XhakIfQPuTdiR57AnY1RY4PKfJ8x
         BtgjQ0232mM6+wZ3UBfMm6rfcSU9jADq+i/ERiKmEWPd9MZ+Xlb5whuUJO8V2GFGXn
         WaB+2Gphpxk9LjIMHc5uXqDlY9ivDnsr1s9Deo20=
To:     Lee Jones <lee.jones@linaro.org>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "thunderbird2k@gmail.com" <thunderbird2k@gmail.com>,
        "blaws05@gmail.com" <blaws05@gmail.com>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "Roderick.Colenbrander@sony.com" <Roderick.Colenbrander@sony.com>,
        "svv@google.com" <svv@google.com>,
        "s.jegen@gmail.com" <s.jegen@gmail.com>,
        "carmueller@gmail.com" <carmueller@gmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v10 01/12] HID: nintendo: add nintendo switch controller driver
Message-ID: <eF7CvQHKEyGDzBvAJm0hMIW1gaSQ5kjvgl4Q3Q2JXHliOfu1qhJi8RTwzp-CM6bdoBEHHdwyhe73VpXp4yViUvSpepRcAIfQ35X2C9N9qnw=@protonmail.com>
In-Reply-To: <20210524163449.GA4153557@dell>
References: <20191230012720.2368987-1-djogorchock@gmail.com> <20191230012720.2368987-2-djogorchock@gmail.com> <20210524163449.GA4153557@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO
        shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi


2021. m=C3=A1jus 24., h=C3=A9tf=C5=91 18:34 keltez=C3=A9ssel, Lee Jones =
=C3=ADrta:

> On Sun, 29 Dec 2019, Daniel J. Ogorchock wrote:
>
> > The hid-nintendo driver supports the Nintendo Switch Pro Controllers an=
d
> > the Joy-Cons. The Pro Controllers can be used over USB or Bluetooth.
> > The Joy-Cons each create their own, independent input devices, so it is
> > up to userspace to combine them if desired.
> >
> > Signed-off-by: Daniel J. Ogorchock djogorchock@gmail.com
> > ---
> > MAINTAINERS | 6 +
> > drivers/hid/Kconfig | 11 +
> > drivers/hid/Makefile | 1 +
> > drivers/hid/hid-ids.h | 3 +
> > drivers/hid/hid-nintendo.c | 822 +++++++++++++++++++++++++++++++++++++
> > 5 files changed, 843 insertions(+)
> > create mode 100644 drivers/hid/hid-nintendo.c
>
> Looks like a lot of effort was put into this.
>
> What is the current status? Are you still pursuing?

The thirteenth version was submitted just four days ago:
https://lore.kernel.org/linux-input/20210520224715.680919-1-djogorchock@gma=
il.com/


Regards,
Barnab=C3=A1s P=C5=91cze


