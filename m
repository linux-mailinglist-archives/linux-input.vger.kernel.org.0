Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42682EE72D
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 21:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727214AbhAGUt1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 15:49:27 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:39119 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbhAGUt1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 15:49:27 -0500
Date:   Thu, 07 Jan 2021 20:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610052525;
        bh=RMHkcHyaeFtGTXW0tykZgL+J84Ua66GbA+UJU9FeKsI=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=b7Ki0l+lJiMVJmfi8j05mkbIqUVcKSLBmI8lkrdUTmekAYGR07ZMy7qAQ9qZyycta
         hTQFY6UW8PvZ7Rx1LcQkuw5qNSs4jrQtV2Tbd/e7uklRXHPYj1475mL+lJQ1ROtS1o
         PWmBu4RZL5+fdt2PklMaBOICDWoe9XLt2vnPIFdM=
To:     =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 08/13] HID: playstation: add DualSense classic rumble support.
Message-ID: <wg9B9MJ230zi6ZK4NRdS6-T8wDvN5Kk9MSgMWnzTLfJSgTwbRCNRfm67HQRWWtSxg8AAfXvAFdinx7WitwTY7IXVGOf1X7zeJsV7IQmoEg0=@protonmail.com>
In-Reply-To: <kRzBWmooFAQ_eFPgUsxxgSR1NkdOsH3sH-ucu6OrxCuPoA7_mMP4enx4EhNNq-Rnl1jYzoPzk1P8UJY-r_W2w84B1rSJa1Nwd_aKL9SLjg8=@protonmail.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-9-roderick@gaikai.com> <kRzBWmooFAQ_eFPgUsxxgSR1NkdOsH3sH-ucu6OrxCuPoA7_mMP4enx4EhNNq-Rnl1jYzoPzk1P8UJY-r_W2w84B1rSJa1Nwd_aKL9SLjg8=@protonmail.com>
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

2021. janu=C3=A1r 7., cs=C3=BCt=C3=B6rt=C3=B6k 21:41 keltez=C3=A9ssel, Barn=
ab=C3=A1s P=C5=91cze =C3=ADrta:

> [...]
> > +struct dualsense_output_report {
> > +=09uint8_t *data; /* Start of data */
> > +=09uint8_t len; /* Size of output report */
> > +
> > +=09/* Points to Bluetooth data payload in case for a Bluetooth report =
else NULL. */
> > +=09struct dualsense_output_report_bt *bt;
> > +=09/* Points to USB data payload in case for a USB report else NULL. *=
/
> > +=09struct dualsense_output_report_usb *usb;
> > +=09/* Points to common section of report, so past any headers */
> > +=09struct dualsense_output_report_common *common;
> > +};
> > [...]
> > +static void dualsense_init_output_report(struct dualsense *ds, struct =
dualsense_output_report *rp,
> > +=09=09void *buf)
>
> If the dualsense struct is already passed in, couldn't this function use
> `ds->output_report_dmabuf` directly?
> [...]

Never mind, sorry, the next patch answered this question.


