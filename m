Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28756330B04
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 11:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhCHKWX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 05:22:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21133 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231293AbhCHKWN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 05:22:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615198933;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+kdbU7D0Cs1nqJnhH9OV4K0Ddqhr5xVnkk7eSjOjWfo=;
        b=Yt5+ZokzS7FkYiK9SOFGQtP5JmXrg/l8PUvPLp43TysJSAR2AEPPhAoSacxLqmcN62L03f
        L6QbNHsechPNKbFL4kq6vNw3/kWIeoC+YmhxGbr8MuqvpQPYUJ3Y4pWqtvoiM7SIPJboWl
        g+47mLKQRZpFUXFQiAwz3sbpjLOVJu0=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-QY7_C6B-PpqeqmDbhT_YNQ-1; Mon, 08 Mar 2021 05:22:08 -0500
X-MC-Unique: QY7_C6B-PpqeqmDbhT_YNQ-1
Received: by mail-pl1-f197.google.com with SMTP id t18so4307852plr.15
        for <linux-input@vger.kernel.org>; Mon, 08 Mar 2021 02:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+kdbU7D0Cs1nqJnhH9OV4K0Ddqhr5xVnkk7eSjOjWfo=;
        b=BsFbebKZ9sK3rWnNgMIlaNAVKEYKi2VHDU37GMRp8ohgAhuKFz1Vwfwsnrl9YjBPvw
         4gGVHdzIsDtE9eKmhnePqucBtF9zYfm5lYiCSQCY6p4ILv6gZEIAjmLOKpvyEEIH4636
         J5YRJghWejqTS/mivOV/JOeA6lIwbDSfUqhJLKDWxRlkTj4P7Jt3BUFMPWrZe8NYkheP
         du3bvDzhISqhgg3hFgd9QmO/+Mgn6g2AXpbViKTprxB+J5oFY+l54xn7tF4DnGen/5aF
         RlJC/XFIz1jsJoIspyy9Bg4/rrZO6dSHTCtavIDcbIjgaqwgGDmQ5JaLRN7wc15BzEeh
         Tq+g==
X-Gm-Message-State: AOAM531cIt0OCqkgELy/xmTK9yIEVcrMqh54Y6t7sWtDewSjqsvbiSkW
        Iy/tcHb/Kud+gcUGaXofCdB0HlngJ+v2PiI4ut7kiXcxQMru1lkNFA1CxXfEsv951tqNlrFTUBj
        zbVDlLLaEM1nh1Xh4uDbl9nDRmz4knYsp9BhdH2A=
X-Received: by 2002:a17:902:7006:b029:e3:dd4d:85ac with SMTP id y6-20020a1709027006b02900e3dd4d85acmr20267959plk.41.1615198927347;
        Mon, 08 Mar 2021 02:22:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq49tQ7a54VntS9SC7qB4EcD5e9RLI11vUrjuafOhf+clmiNfTExsZvf5goIHxqniIWvr47LYYg8jQ0aa4Bn4=
X-Received: by 2002:a17:902:7006:b029:e3:dd4d:85ac with SMTP id
 y6-20020a1709027006b02900e3dd4d85acmr20267932plk.41.1615198927109; Mon, 08
 Mar 2021 02:22:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1613582014.git.nabijaczleweli@nabijaczleweli.xyz> <nycvar.YFH.7.76.2103081114580.12405@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2103081114580.12405@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 8 Mar 2021 11:21:56 +0100
Message-ID: <CAO-hwJJj0KRCOYPmpNEmU1oVD+SNNYn9+BoGxnPbSthFuCxK9w@mail.gmail.com>
Subject: Re: [PATCH 0/4] Stylus-on-touchscreen device support
To:     Jiri Kosina <jikos@kernel.org>
Cc:     =?UTF-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

On Mon, Mar 8, 2021 at 11:15 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Wed, 17 Feb 2021, =D0=BD=D0=B0=D0=B1 wrote:
>
> > This patchset adds support for stylus-on-touchscreen devices as found o=
n
> > the OneMix 3 Pro and Dell Inspiron 15 7000 2-in-1 (7591), among others;
> > with it, they properly behave like a drawing tablet.
> >
> > Patches 2 and 4 funxionally depend on patch 1.
> > Patch 4 needs patch 3 to apply.
> >
> > The output of this patchset and the need for a kernel, rather than
> > userspace, patch was previously discussed here:
> >   https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/558=
#note_792834
> >
> > Ahelenia Ziemia=C5=84ska (4):
> >   HID: multitouch: require Finger field to mark Win8 reports as MT
> >   HID: multitouch: set Stylus suffix for Stylus-application devices, to=
o
> >   HID: input: replace outdated HID numbers+comments with macros
> >   HID: input: work around Win8 stylus-on-touchscreen reporting
> >
> >  drivers/hid/hid-input.c      | 47 +++++++++++++++++++++++++++++++++---
> >  drivers/hid/hid-multitouch.c | 18 ++++++++------
> >  2 files changed, 55 insertions(+), 10 deletions(-)
>
> Benjamin, this patchset looks good to me; do you have any objections on
> queuing it for 5.13?
>

Please hold on this one. I am pretty sure this should break the test
suite but couldn't have the chance to get to it. Will pop this one up
in TODO list.

Cheers,
Benjamin

