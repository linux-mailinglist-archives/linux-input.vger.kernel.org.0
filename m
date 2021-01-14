Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008962F560A
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 02:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbhANBaS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 20:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727561AbhANB35 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 20:29:57 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B23C0617A4
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 17:29:16 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id 143so5057215qke.10
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 17:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9CU5hC/wv1WyG3qcAaf75yGzuAfWHeashTxgX7KjjpI=;
        b=K6Hq+G0LhXjQqO4H96lSva7ZtrmqncVNCsrUw1x3GpPYKTOu96SYHCMIGHB+UXhLT7
         bnDVV7Da8nb5UKCBo98+d2ekTCz0M3i2QaCCdzfXsq43wqghTawUFI6qEMSurf+eEHDJ
         OTchATUo7k+/FaLZUw+1el0dBgnmhcosnM4NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9CU5hC/wv1WyG3qcAaf75yGzuAfWHeashTxgX7KjjpI=;
        b=kyjg1O9Y+q51MFkIM8ZDc+I+WAHd0el7JtsILubKFMTdblPH7uVvXc/urV9KgHtYoM
         dHEGnZk0XFIONuv762+ZzWgVVu2iylBPtMQVk8Sx0k/YPTGk4lgFvbrcD9dsFptScQ9S
         ZGcwp8HgvqHuhxD71/sRPeqIOfmX+rt24jftaZkMgh4nLepER5q2qx3CEpQssPZQ4ikw
         cvW+sOy7/I+pMW1dI0OMMlpfhYjpFsWOh1637AAjmpxs2+6BOx0WZMllW/gXWx9PqR1C
         uBKbbQ6Wyg4h9qXIQ6ZPVpef7Uoa6p6jAxGy+Q8hZO3i5BtYKz7+KC1dcqEYxtpWfUN+
         Zhag==
X-Gm-Message-State: AOAM532pm12If03LLTQ6HEhZvhQgTFzIVgjmnefAhMfVa9jtYrQczi2g
        eziGQKe8AgVGq4H+gHSdN3tWIFzTiGVtsgx95Hog2Q==
X-Google-Smtp-Source: ABdhPJxWNm4eqecBXA5G0Ky7souL+BlfLXiDVYwNNhK8YLResag3hUy0NhhbANooMsLe/qYCoji4ZUpqlDe71lm1eT0=
X-Received: by 2002:a25:adc2:: with SMTP id d2mr6962640ybe.75.1610587756217;
 Wed, 13 Jan 2021 17:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20210107154200.v4.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
 <20210107154200.v4.2.Ibe7d7d53c5b4fe72c60de90111ff763b53f38dbb@changeid>
 <161041827643.3661239.17919996906733477213@swboyd.mtv.corp.google.com>
 <CA+cxXhm45emyg-9j99U=UWY8QuhzWifh+VvsFBaTOTWs81tvUQ@mail.gmail.com>
 <161052058590.3661239.5654596152411573148@swboyd.mtv.corp.google.com>
 <CA+cxXhmZd0eeLjUwcTevZRNovbZWXNKQH5qOX_YFCKowxHNVfQ@mail.gmail.com> <161057967168.3661239.10329365279391431594@swboyd.mtv.corp.google.com>
In-Reply-To: <161057967168.3661239.10329365279391431594@swboyd.mtv.corp.google.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Wed, 13 Jan 2021 17:29:05 -0800
Message-ID: <CA+cxXhmV_RxLupD18aOxLwaGGKSxihTY8ZZvQKzdd-dsYYf5dQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] Input: cros-ec-keyb - Expose function row physical
 map to userspace
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 13, 2021 at 3:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-01-13 14:47:18)
> > On Tue, Jan 12, 2021 at 10:49 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Philip Chen (2021-01-12 15:55:28)
> > > > On Mon, Jan 11, 2021 at 6:24 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > > >
> > > > > Quoting Philip Chen (2021-01-07 15:42:09)
> > > > > > The top-row keys in a keyboard usually have dual functionalities.
> > > > > > E.g. A function key "F1" is also an action key "Browser back".
> > > > > >
> > > > > > Therefore, when an application receives an action key code from
> > > > > > a top-row key press, the application needs to know how to correlate
> > > > > > the action key code with the function key code and do the conversion
> > > > > > whenever necessary.
> > > > > >
> > > > > > Since the userpace already knows the key scanlines (row/column)
> > > > > > associated with a received key code. Essentially, the userspace only
> > > > > > needs a mapping between the key row/column and the matching physical
> > > > > > location in the top row.
> > > > > >
> > > > > > This patch enhances the cros-ec-keyb driver to create such a mapping
> > > > > > and expose it to userspace in the form of a function-row-physmap
> > > > > > attribute. The attribute would be a space separated ordered list of
> > > > > > row/column codes, for the keys in the function row, in a left-to-right
> > > > > > order.
> > > > > >
> > > > > > The attribute will only be present when the device has a custom design
> > > > > > for the top-row keys.
> > > > >
> > > > > Is it documented in Documentation/ABI/?
> > > > Not yet.
> > > > Is it proper to add the documentation to `testing/sysfs-driver-input-keyboard`?
> > >
> > > Somewhere in testing is fine. I'm not sure if it is a generic proprty
> > > for all keyboards though? What's the path in sysfs?
> > I wouldn't say it's generic.
> > It is available in the keyboard device node only when the board has a
> > custom top-row keyboard design.
> > The path in sysfs is something like:
> > /sys/class/input/input0/device/function_row_physmap, where input0 is
> > cros_ec.
>
> I see that atkbd already has this so at least it would be common to some
> sort of keyboard device. I'm not sure where to document it though. I see
> that atkbd has a handful of undocumented sysfs attributes so adding all
> of those may lead to a common path. At the least it sounds OK to have a
> sysfs-driver-input-keyboard file if input folks are OK with it.
Since there are other undocumented sysfs attributes for input/keyboard
anyway, we should probably leave the documentation to another patch?
For now, let's move to patch v5, where I've addressed all of the
comments so far.
Thanks.
