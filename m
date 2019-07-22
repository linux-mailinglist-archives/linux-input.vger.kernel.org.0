Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA8627083E
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 20:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbfGVSQj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 14:16:39 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:43305 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfGVSQi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 14:16:38 -0400
Received: by mail-io1-f67.google.com with SMTP id k20so76002509ios.10;
        Mon, 22 Jul 2019 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DiLnzYLxVxNlR4X0FDTGEx7Tdx3UEKGH5o6qiAjVh8Q=;
        b=W/t9Zea5qieGnHP8RQZ4lfk7JCGOJps+WDcC5zHsisq4ZFIF2vbM0gAY/CHLo2sseh
         2znLyJrbRfG7pgmboAEYGZ5JtpKB2z4bytV8muaUKaej93YqbQ2ZudHLPPRvls4lJ9s3
         re/+p8WeVXyzfJyRcIA8wdGIzFbcXsr0Z6IQcEA1rZiSoOS5nKFfnIc7zuZzJlPb04jW
         gKdHjXD+RXRcJ78xbDi7K0RFUMVUS8wXy2g1J8y/zSpI4D/A4vL/sIyUvp2+4c/iJLoL
         dZtTsYZFjYztVy4Pc2hEtW/2Aa2Bupk8IzJPgnCwHaUiHESK5v8rOEgtdQ6WrUjwlUwR
         fx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DiLnzYLxVxNlR4X0FDTGEx7Tdx3UEKGH5o6qiAjVh8Q=;
        b=qM8LR7qeo36x3AyjkxTHM7Xl4ixQl8QCpt+m0CDAo7XOq98qB1gpHtRY9tTRYa0/P4
         sL6mDIN+zNE5tZOXb2+aEvRIUWzgzZlbFnhqy2sEhrPLSKB7rRPJNrjpPEJfFW03G/mw
         ZvlgGTIi6KRnaIFaOYduXSVDyrhITos+4k+DDDC82jJNINpQmRuFii+nJ+LN3aHDVP7W
         kpHrqM17WoYGom2cBZIin1S4TNxqghy5EqFdOFGwUnf7ggE6Yi+l5wB/JoGvoX+/qSPy
         6fIkD73ZEA41Mbj+mCqvNwAE9hXUQvk8YHiW32cvWpmx/qDYWyiFJalCq+yEll/o/d18
         mYCg==
X-Gm-Message-State: APjAAAXMJJEY07RrOGUbvEWTQoJtM8XeFzDeZuuYwOrYBgMnHGJ918YQ
        fuX4bV4WBD3P+S+z2McwyzZEXcho99X1n6p2FhA=
X-Google-Smtp-Source: APXvYqy+0HcN4O5EemMWuGcOG+ri4bk1CWylZ2/tRd8pdP5QepGuhemkj4T6KWURMzwqMgCh1BVyHhzhI7qRX255ILs=
X-Received: by 2002:a05:6638:517:: with SMTP id i23mr109879jar.71.1563819397741;
 Mon, 22 Jul 2019 11:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190722163642.10417-1-stillcompiling@gmail.com>
 <20190722163642.10417-2-stillcompiling@gmail.com> <f7b1a46569a7208eb2be3b5cc3432b0aa97fc3ee.camel@perches.com>
In-Reply-To: <f7b1a46569a7208eb2be3b5cc3432b0aa97fc3ee.camel@perches.com>
From:   Joshua Clayton <stillcompiling@gmail.com>
Date:   Mon, 22 Jul 2019 12:16:26 -0600
Message-ID: <CAMB+bfJanOMD6TvF1QkMSUx=0FyJ9Cke7vMzuzvL2gTWUYD+wQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: core: only warn once of oversize hid report
To:     Joe Perches <joe@perches.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 22, 2019 at 11:23 AM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2019-07-22 at 10:36 -0600, stillcompiling@gmail.com wrote:
> > On HP spectre x360 convertible the message:
> > hid-sensor-hub 001F:8087:0AC2.0002: hid_field_extract() called with n (192) > 32! (kworker/1:2)
> > is continually printed many times per second, crowding out all other kernel logs
> > Protect dmesg by printing the warning only one time.
> []
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> []
> > @@ -1311,7 +1311,7 @@ u32 hid_field_extract(const struct hid_device *hid, u8 *report,
> >                       unsigned offset, unsigned n)
> >  {
> >       if (n > 32) {
> > -             hid_warn(hid, "hid_field_extract() called with n (%d) > 32! (%s)\n",
> > +             hid_warn_once(hid, "hid_field_extract() called with n (%d) > 32! (%s)\n",
> >                        n, current->comm);
> >               n = 32;
> >       }
>
> Is this papering over an actual defect somewhere else?

Sort of.
It doesn't correct the underlying issue, but I think this should go in
even along with the real fix.
The dmesg spamming has become a more serious problem for me than the
underlying issue.
Someone had a patch rejected that completely suppressed the message.

From my limited understanding, the hid spec allows an unlimited size
for an hid report , but the kernel only allocated 32 bits, which was
more than anything used at that time. The 32 bit version is doing some
bit shifting and possibly endian correction with the 32 bit field, so
I was not comfortable just extending it to 192 or 256 bits without a
little more understanding.

> Trivially, this could use "%s: ...", __func__, ...
True. I can make that change.
>
