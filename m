Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2CD3FBA34
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 18:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237734AbhH3Qcd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 12:32:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24338 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233637AbhH3Qcd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 12:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630341098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QX9GU0hH1TRwqyfkU4USdjocCp7nMp76pC0eH/XEt0A=;
        b=QWqLVlnnvCntN3+uI0ykkfKLhm305y8xuxi/90s1sCBZftKSekyY3qE5DGI60ga+ZasgoY
        oFKMjvrFHkeb1GYn0W72kspi3i83j6oadoCsQHeT0w+JHx93zehYS+DMHopBfcw6vjjAtL
        sITJmK1FGch0xX2Vbedln8eeuit8coI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-OkPfNLkFOtSQGlV6dtvItA-1; Mon, 30 Aug 2021 12:31:35 -0400
X-MC-Unique: OkPfNLkFOtSQGlV6dtvItA-1
Received: by mail-pf1-f199.google.com with SMTP id h10-20020a056a00170a00b003e31c4d9992so3377075pfc.23
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 09:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QX9GU0hH1TRwqyfkU4USdjocCp7nMp76pC0eH/XEt0A=;
        b=jh4EtM3ujGQBrmd0EFAktFJjstr/kuaF8wKSNN0zLPZAeg62e7d9yk8Uny5t+cqs/P
         FpiEQXE9RaOoFf8oI+mUjyERFo0MIDbojaV+aRaZ6cqmXFIB5w6/J2d6udkzP+BYDu3/
         JsFQKd6WUWe2SsrxjqS+fLwxCUQXQcs1NkJzRGgzYMu/HAxOfXGHmKyMnRP7C1MrARdK
         PmeXQgpn2IGR7GV2jAtrCRrmge7NnzEzKi1Ta5W94R8UXAdRnyRK+PA9UIwU95EMe0Zw
         24rt1/RnQIMxh/wn5Af8xYfMfsfCbtvz1MrpCuofmoBacfb+kPYs3wTpb3Db4mdeVLKm
         Y0AA==
X-Gm-Message-State: AOAM533W6i3aOFxbUlb/wSoWpuOKAWo9VRAESiRNcc7gvMU9QqShphbo
        BHoc46xVmq2BzwbmypI6Uj1q9hKC527ef5d9PCFRGD4huA0+a861+asisC/MvTFLD8xGTDMRQ7P
        ib5TWHtfbGfxm6X/ulrxPvqoSXkjqHrZbOLaqixM=
X-Received: by 2002:a17:902:da8d:b0:135:d4a1:bc25 with SMTP id j13-20020a170902da8d00b00135d4a1bc25mr446070plx.41.1630341094433;
        Mon, 30 Aug 2021 09:31:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsfUc0NrQJSBO5s1PQvVJbSaXwuj8CLgAUF3cdiQwV74fkRhpEV4xYpMdYLQmn5JWjkbapCd2JNKKwqwLYZWI=
X-Received: by 2002:a17:902:da8d:b0:135:d4a1:bc25 with SMTP id
 j13-20020a170902da8d00b00135d4a1bc25mr446052plx.41.1630341094159; Mon, 30 Aug
 2021 09:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210816130059.3yxtdvu2r7wo4uu3@lion.mk-sys.cz>
 <20210816143856.GA121345@rowland.harvard.edu> <20210816191249.7g2mk5thwpio7cfc@lion.mk-sys.cz>
 <1954573.0n35tlyJVE@natalenko.name> <20210830160743.GB332514@rowland.harvard.edu>
In-Reply-To: <20210830160743.GB332514@rowland.harvard.edu>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 30 Aug 2021 18:31:23 +0200
Message-ID: <CAO-hwJ+QL9O_m8NFXeAWhJ5B7ipYeNC=9RjU1HamMisdVhXEwA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] flood of "hid-generic ... control queue
 full" since v5.14-rc1
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Oleksandr Natalenko <oleksandr@natalenko.name>,
        Michal Kubecek <mkubecek@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 30, 2021 at 6:14 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Aug 30, 2021 at 05:48:09PM +0200, Oleksandr Natalenko wrote:
> > Hello.
> ...
> > Any luck with moving this forward please? I've got a similar issue with APC
> > UPS and v5.14 kernel, and this patch also solves the connectivity issue for
> > me.
>
> I've been waiting to hear back from Benjamin to see if testing revealed
> any problems with the latest version of the patch.
>

Sorry, things have been complex last week while I was on vacation.
Nothing scary, the usual "not enough hours in a day to be able to sit
in front of a computer".
I'm back at work today, but got a lot of urgent things to do. I should
be able to do the testing tomorrow.

Cheers,
Benjamin

