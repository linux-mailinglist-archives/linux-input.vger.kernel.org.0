Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9020F24861
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 08:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfEUGtU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 02:49:20 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43597 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfEUGtU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 02:49:20 -0400
Received: by mail-qt1-f195.google.com with SMTP id i26so19209153qtr.10
        for <linux-input@vger.kernel.org>; Mon, 20 May 2019 23:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EX+RbZ2QuclOpIncZJaA9lb0b+yqy0TQx8yZ2oQxaGo=;
        b=azqOst7GtQK58W1qiZq9GJED8PkSw3x/SDwTRL/TciZRdqMR5EcbYtATIEhSkl3vHV
         6vfwZ/CoB9ZFXSf/c6ENBVb2oJdWL2c7StDlkIhHgvrk2AwJ70cAAy1DICoXIyOrxz76
         Sx54KU8yJmb13J9YulIA+8oCpB22ximQ24RS40gQc1cGFdy5fDqbO2C3Rk1xNdkUAyUy
         a5zjm6ZgltqvWXQlAHE1fNPsAIQSbzpLv7H7QvYiqYquWRZjvZNZVtM7OHUzdGsezMEH
         2f3OpO3cdQFRfN1f3AOzx+ftYFd11MDk/mXn6FQFTNLqGsn4U0i7kLSdKdits95GOpSR
         xWKw==
X-Gm-Message-State: APjAAAXPhsoaIpz1dMHYSFV74n1mACIQc4trcWZ+ertftNsIBbtDC8SR
        7R4DaNUTejB7qxqOkr9Xdk9zzRvIcOiR1OKoMkAjWw==
X-Google-Smtp-Source: APXvYqyD1l2cT5B/5llVtcVwpmWYQWV+ifAU8LYZS74s9QsQIt96L5e8QfeClbxaEnEp5eYzrP3zcOzgimj1lhpL+9o=
X-Received: by 2002:ac8:1a59:: with SMTP id q25mr67748115qtk.154.1558421359749;
 Mon, 20 May 2019 23:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190519072711.2592-1-aaron.ma@canonical.com> <20190519072711.2592-2-aaron.ma@canonical.com>
 <20190521050850.GC183429@dtor-ws>
In-Reply-To: <20190521050850.GC183429@dtor-ws>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 21 May 2019 08:49:08 +0200
Message-ID: <CAO-hwJLXB8Qec9Yhz0y6WgvEpE6KHk_53g4VtPGj9mfvMzk4dg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: synaptics - remove X240 from the topbuttonpad list
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Aaron Ma <aaron.ma@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 21, 2019 at 7:09 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Aaron,
>
> On Sun, May 19, 2019 at 03:27:11PM +0800, Aaron Ma wrote:
> > Lenovo ThinkPad X240 does not have the top software button.
> > When this wrong ID in top button list, smbus mode will fail to probe,
> > so keep it working at PS2 mode.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > ---
> >  drivers/input/mouse/synaptics.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> > index b6da0c1267e3..6ae7bc92476b 100644
> > --- a/drivers/input/mouse/synaptics.c
> > +++ b/drivers/input/mouse/synaptics.c
> > @@ -140,7 +140,6 @@ static const char * const topbuttonpad_pnp_ids[] = {
> >       "LEN002E",
> >       "LEN0033", /* Helix */
> >       "LEN0034", /* T431s, L440, L540, T540, W540, X1 Carbon 2nd */
> > -     "LEN0035", /* X240 */
>
> According to the history this came from Synaptics through Hans, so I'd
> like to make sure there are no several X240 versions floating around...

A quick google image search showed that the X240 had 2 versions: one
with the top software buttons, one without.

And this definitively rings a bell. I am sure we asked Lenovo and
Synaptics to change the PnPID when they would do such a change, but
they "forgot" during the *40 series refresh.
We have code in place to fix the reported ranges of the coordinates,
and we had to check against the board id (see min_max_pnpid_table[] in
synaptics.c).
Unfortunately, X240 (LEN0035) is not part of this table, so I don't
know which refresh of the board ID has implemented the non top
software buttons.

Cheers,
Benjamin


>
> >       "LEN0036", /* T440 */
> >       "LEN0037", /* X1 Carbon 2nd */
> >       "LEN0038",
> > --
> > 2.17.1
> >
>
> Thanks.
>
> --
> Dmitry
