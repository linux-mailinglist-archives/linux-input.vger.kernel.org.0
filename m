Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCAA32F576D
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 04:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbhANB7p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 20:59:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729517AbhAMXj5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 18:39:57 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6273FC0617BB
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 15:14:34 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id b3so2215907pft.3
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 15:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=NvBiJFcB3c1Z05rJ6s58rHK9D8+ehV1QfPGaoVUSqIg=;
        b=Q/+zjcNNiBhKNcxNG1FrfBtD/IxXzKjmPfL4upE8rFYsbxyt2Z5h1vuaznbO8LQfoY
         XvsfPpPUfpuSHmDYzjIjLW4l2o/IbOErbB/s4tlZxjtG15/etKKMBDCj8/Dv59634S4N
         yntyU+3OwZIKlx1iq7nTi+VOi/4KAK0Qq7duc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=NvBiJFcB3c1Z05rJ6s58rHK9D8+ehV1QfPGaoVUSqIg=;
        b=uMD4BsTzAk+OqyIl7sYR6D+4nqdmuOKskQPF8x34bE3+0ZEwc4pIW7SN6eauv42m65
         ldnV5/Bd2h4rKmaR0NJDHW4i4PEXYAJK90K+e2Y2tKUt7+Fw2NTltTKFyw2Va/Btdfcc
         rBkAUBYcAg495szX2/fVsO1xGonlzRT9nSvxpDedKfyoDwS5RK+xsb7wrLGgryZNyMeQ
         CAW5C9bvPFouqbW+A8i9voB7OEmVqaydUtOJfgresq/AQCS6DeEjpxcGrWZl7cDJYYfv
         MuK6an1nnpLM4gn5Xm1CpHPd3OdwiyL1qj6uABriMb8w7/DlY92vI/8GVYGuVQRi/UQz
         IoJQ==
X-Gm-Message-State: AOAM532wtGc2kS6sbwP5JrFjttmEgpKtcWqaB/KC0suhpcZUvoEmsCMB
        EdGcjUkHV8BokCmtBDfU0X7kpw==
X-Google-Smtp-Source: ABdhPJxR1NhYtBAehhaNqYLZvXWMk1Yotx25rPYN6QbUeAzm7mQRCo1Op8oeo3mJOsXkVed+v2dJ4w==
X-Received: by 2002:a65:648c:: with SMTP id e12mr4360630pgv.123.1610579673984;
        Wed, 13 Jan 2021 15:14:33 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id s5sm3450758pfh.5.2021.01.13.15.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 15:14:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CA+cxXhmZd0eeLjUwcTevZRNovbZWXNKQH5qOX_YFCKowxHNVfQ@mail.gmail.com>
References: <20210107154200.v4.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid> <20210107154200.v4.2.Ibe7d7d53c5b4fe72c60de90111ff763b53f38dbb@changeid> <161041827643.3661239.17919996906733477213@swboyd.mtv.corp.google.com> <CA+cxXhm45emyg-9j99U=UWY8QuhzWifh+VvsFBaTOTWs81tvUQ@mail.gmail.com> <161052058590.3661239.5654596152411573148@swboyd.mtv.corp.google.com> <CA+cxXhmZd0eeLjUwcTevZRNovbZWXNKQH5qOX_YFCKowxHNVfQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] Input: cros-ec-keyb - Expose function row physical map to userspace
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org
To:     Philip Chen <philipchen@chromium.org>
Date:   Wed, 13 Jan 2021 15:14:31 -0800
Message-ID: <161057967168.3661239.10329365279391431594@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Philip Chen (2021-01-13 14:47:18)
> On Tue, Jan 12, 2021 at 10:49 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Philip Chen (2021-01-12 15:55:28)
> > > On Mon, Jan 11, 2021 at 6:24 PM Stephen Boyd <swboyd@chromium.org> wr=
ote:
> > > >
> > > > Quoting Philip Chen (2021-01-07 15:42:09)
> > > > > The top-row keys in a keyboard usually have dual functionalities.
> > > > > E.g. A function key "F1" is also an action key "Browser back".
> > > > >
> > > > > Therefore, when an application receives an action key code from
> > > > > a top-row key press, the application needs to know how to correla=
te
> > > > > the action key code with the function key code and do the convers=
ion
> > > > > whenever necessary.
> > > > >
> > > > > Since the userpace already knows the key scanlines (row/column)
> > > > > associated with a received key code. Essentially, the userspace o=
nly
> > > > > needs a mapping between the key row/column and the matching physi=
cal
> > > > > location in the top row.
> > > > >
> > > > > This patch enhances the cros-ec-keyb driver to create such a mapp=
ing
> > > > > and expose it to userspace in the form of a function-row-physmap
> > > > > attribute. The attribute would be a space separated ordered list =
of
> > > > > row/column codes, for the keys in the function row, in a left-to-=
right
> > > > > order.
> > > > >
> > > > > The attribute will only be present when the device has a custom d=
esign
> > > > > for the top-row keys.
> > > >
> > > > Is it documented in Documentation/ABI/?
> > > Not yet.
> > > Is it proper to add the documentation to `testing/sysfs-driver-input-=
keyboard`?
> >
> > Somewhere in testing is fine. I'm not sure if it is a generic proprty
> > for all keyboards though? What's the path in sysfs?
> I wouldn't say it's generic.
> It is available in the keyboard device node only when the board has a
> custom top-row keyboard design.
> The path in sysfs is something like:
> /sys/class/input/input0/device/function_row_physmap, where input0 is
> cros_ec.

I see that atkbd already has this so at least it would be common to some
sort of keyboard device. I'm not sure where to document it though. I see
that atkbd has a handful of undocumented sysfs attributes so adding all
of those may lead to a common path. At the least it sounds OK to have a
sysfs-driver-input-keyboard file if input folks are OK with it.
