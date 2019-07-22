Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9909270BDC
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 23:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730789AbfGVVnV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 17:43:21 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36011 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728233AbfGVVnV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 17:43:21 -0400
Received: by mail-io1-f66.google.com with SMTP id o9so77420924iom.3;
        Mon, 22 Jul 2019 14:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DKEAhS/uikfS3tuGBnrF3tOxR8a7NEWxciPtJNbuB4I=;
        b=JfSAj9ugdtVl6OEkoUzepQEmicJQK8GpWKG2s+vG6iUdIXeSUt1rihBWoVTdYDTyUQ
         3so7w+AxkdPrP/fETsa81ulrPPw0RwnjE13OzNfsXEhRRP071lUPgA7SHxDBoLq/kANS
         tftYZDKrRA6/aw3s3FkxcGpMQckhREwhdPqB8GoqKR8SBFYVgnIQkAZ1plu4h2cXCd5X
         PA426bL5v9lzDyec4oOJ/nd1ICXJKZWrgY2fqdf+g4WbtS6eXWm1sYrMoqLhMOf274xu
         e8bKpV1Zt+DlcCnqSRLce8RoWRN5DcM5hh3c2bvwct1PtWIlMmZTgPrRNdWXUf13eYLt
         fz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DKEAhS/uikfS3tuGBnrF3tOxR8a7NEWxciPtJNbuB4I=;
        b=ZDsyZQzyVxupikSwGKn6adsOkqLvo5LdFwLRBaQ2BqMXspwun6NNvulg/DhKakL5jh
         Q4XT2UNTT7govgOc7DQT5OJKJ2JCpBotNJFqnJb8C3MBKi3/0/OOq8SeEROTbK9uAsU3
         oketIVxdgJGVts+raokX+gL8kI29k4ibqoRLhiSr6DprrUDlct3/K9OVn3Pwz21lRyEp
         UpLwpdgqeK5COxy0MAv8Iiz+riQAu5YhskhBUuH1PBN4Xwlx8XgYn1A+OXLsUiSg9LWe
         NKW1mhbMMPEgEJJxpXqfyf9zFJHz3ilLDHCZnyVPeuW6o+CGrUfAhl58R1NWKg6pay9Y
         tbkA==
X-Gm-Message-State: APjAAAU6wFnq3X5Sx7/U+wuSsDEwH8/fnQaebz0nKW6Gw0x4m6560bKI
        r2yiB6EVJizhinGPeHfKJyJDahiKXUAKGBR3KgU=
X-Google-Smtp-Source: APXvYqzMRFruPTzm7SCJ42fgQ8+hSvHfXUmR8p3mTQFlBHgAD/rOyC9xpNN1igJ05SIYmGvclJebxHI6BwGirxMzVhE=
X-Received: by 2002:a02:cc50:: with SMTP id i16mr43428363jaq.50.1563831800346;
 Mon, 22 Jul 2019 14:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190722163642.10417-2-stillcompiling@gmail.com>
 <20190722212613.24906-1-stillcompiling@gmail.com> <20190722212613.24906-3-stillcompiling@gmail.com>
 <f686e93180d2f91c78801be124e8aac36145d9b0.camel@perches.com>
In-Reply-To: <f686e93180d2f91c78801be124e8aac36145d9b0.camel@perches.com>
From:   Joshua Clayton <stillcompiling@gmail.com>
Date:   Mon, 22 Jul 2019 15:43:08 -0600
Message-ID: <CAMB+bfJ27UGD+-aYR5EPWyY3O=FJDw7r2D6VO_tce-Z9ziYP0g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] HID: core: only warn once of oversize hid report
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

On Mon, Jul 22, 2019 at 3:30 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2019-07-22 at 15:26 -0600, stillcompiling@gmail.com wrote:
> > From: Joshua Clayton <stillcompiling@gmail.com>
>
> Thanks Joshua
>
> > On HP spectre x360 convertible the message:
> > hid-sensor-hub 001F:8087:0AC2.0002: hid_field_extract() called with n (192) > 32! (kworker/1:2)
> > is continually printed many times per second, crowding out all else
> > Protect dmesg by printing the warning only one time.
> []
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> []
> > @@ -1311,8 +1311,8 @@ u32 hid_field_extract(const struct hid_device *hid, u8 *report,
> >                       unsigned offset, unsigned n)
> >  {
> >       if (n > 32) {
> > -             hid_warn(hid, "hid_field_extract() called with n (%d) > 32! (%s)\n",
> > -                      n, current->comm);
> > +             hid_warn_once(hid, "%s() called with n (%d) > 32! (%s)\n",
> > +                           __func__ ,n , current->comm);
>
> All the other bits are fine, but this line is oddly written
> with unusual spacing around 'n'.
>
> Normally it'd be something like:
>
>                 hid_warn_once(hid, "%s: called with n (%d) > 32! (%s)\n",
>                               __func__, n, current->comm);
Gah!
Not only that but I missed a semicolon in patch 1. Will fix, (compile)
and send v3 pdq.
Sorry about the extra noise.
>
>
