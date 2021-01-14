Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8602F5A84
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 06:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbhANFtd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 00:49:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbhANFt2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 00:49:28 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D963C061786
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 21:48:43 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id n142so5895606qkn.2
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 21:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1pFvcY/01Vb26lhzrF1qqgGg9XJ5TwDsKsXCnLt4nXA=;
        b=eNCWGP68cLYu4IBKEBWjnVrW1Y+ZVIDjO4QnwFXrNFBIceA+CrXqj6EZ2hEy+xEAKX
         M5BKUuHI3oVZ8lZct8p6e1THXxPSjM4i9TILKA+5Fdy1R0FXSyw+cZv+dy35ej84jcm/
         IOKqwmLByfQHvZzmEYHkY2xSdpHs7kEJVXnzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1pFvcY/01Vb26lhzrF1qqgGg9XJ5TwDsKsXCnLt4nXA=;
        b=jmID0bUBKORSPrezZ8r22HTVhFxTDtbQr0S49mtz6u+Qeb6kMgKbq4ioVe5VPY6jF6
         GoI1HoOlLCswAFj/7YQjKKo6bHHUimlloVf7JSL/1B6oGDSh87ARfMztGBcDobAogmNL
         pxfICra3ruOuVBD7sns6uhIE3KG5I5vxUp44LvP5Zz8CqQvjvq9BIxQVLCqfppHGDzX9
         NZHQrPLGxooAeweYU2IopYyG6luRV43bj6e75+Xn4fbgNTcpZ2cTfc3dZOijxN2othqx
         YnAaFXaZKSqs73rrXvqOwBNufTx+XyEBlMP/3AU75Qf6h4G8IRU+aSZMHwDTB7arFqLR
         ZXFw==
X-Gm-Message-State: AOAM530fKwTyZQcVAML3UTr0iB63lr4jsvJK4QYJKkkYysMDjF5AkgOU
        b6KVF6Vg3xldK1+AkE6s4A8xLqTuEAt2pt/7KEdClg==
X-Google-Smtp-Source: ABdhPJwHiRt8Q5J2GMSGVDT/uNZiH5z5B1QUE3HiG3o3jto9s2W4vhAxWWIaHXpXuhcxVFgk2sNuRIJAxihFA+FuBq4=
X-Received: by 2002:a25:3a04:: with SMTP id h4mr8181759yba.285.1610603322431;
 Wed, 13 Jan 2021 21:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20210107154200.v4.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
 <20210107154200.v4.2.Ibe7d7d53c5b4fe72c60de90111ff763b53f38dbb@changeid>
 <161041827643.3661239.17919996906733477213@swboyd.mtv.corp.google.com>
 <CA+cxXhm45emyg-9j99U=UWY8QuhzWifh+VvsFBaTOTWs81tvUQ@mail.gmail.com>
 <161052058590.3661239.5654596152411573148@swboyd.mtv.corp.google.com>
 <CA+cxXhmZd0eeLjUwcTevZRNovbZWXNKQH5qOX_YFCKowxHNVfQ@mail.gmail.com>
 <161057967168.3661239.10329365279391431594@swboyd.mtv.corp.google.com>
 <CA+cxXhmV_RxLupD18aOxLwaGGKSxihTY8ZZvQKzdd-dsYYf5dQ@mail.gmail.com> <161058839125.3661239.15252566946929589144@swboyd.mtv.corp.google.com>
In-Reply-To: <161058839125.3661239.15252566946929589144@swboyd.mtv.corp.google.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Wed, 13 Jan 2021 21:48:31 -0800
Message-ID: <CA+cxXhnzKG8G9+gdAp32VC-aWBgdteUFVq2YknrowuMMtP6BfQ@mail.gmail.com>
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

On Wed, Jan 13, 2021 at 5:39 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-01-13 17:29:05)
> > On Wed, Jan 13, 2021 at 3:14 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Philip Chen (2021-01-13 14:47:18)
> > > > On Tue, Jan 12, 2021 at 10:49 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > > >
> > > > > Quoting Philip Chen (2021-01-12 15:55:28)
> > > > > > On Mon, Jan 11, 2021 at 6:24 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > > > > >
> > > > > > > Is it documented in Documentation/ABI/?
> > > > > > Not yet.
> > > > > > Is it proper to add the documentation to `testing/sysfs-driver-input-keyboard`?
> > > > >
> > > > > Somewhere in testing is fine. I'm not sure if it is a generic proprty
> > > > > for all keyboards though? What's the path in sysfs?
> > > > I wouldn't say it's generic.
> > > > It is available in the keyboard device node only when the board has a
> > > > custom top-row keyboard design.
> > > > The path in sysfs is something like:
> > > > /sys/class/input/input0/device/function_row_physmap, where input0 is
> > > > cros_ec.
> > >
> > > I see that atkbd already has this so at least it would be common to some
> > > sort of keyboard device. I'm not sure where to document it though. I see
> > > that atkbd has a handful of undocumented sysfs attributes so adding all
> > > of those may lead to a common path. At the least it sounds OK to have a
> > > sysfs-driver-input-keyboard file if input folks are OK with it.
> > Since there are other undocumented sysfs attributes for input/keyboard
> > anyway, we should probably leave the documentation to another patch?
> > For now, let's move to patch v5, where I've addressed all of the
> > comments so far.
>
> Please document this one that's being introduced. We should document all
> the sysfs attributes but we don't always do a good job at it.
OK, will do!
