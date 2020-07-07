Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10869216D04
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 14:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgGGMlj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jul 2020 08:41:39 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38440 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728190AbgGGMlj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jul 2020 08:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594125697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xciiD80zP1orEDkuFQaVx94y/jH2lWnyaNnhRi7uAHU=;
        b=Yx8P1eaSU4Ao1B9FTbwq0yH6RhDbse6n4Kx2hBI5hcdcbQ+ujYlzhTc72Db51D54UqT6fi
        yctk6xqNV3C6np95flX74TTlp/J14a+CSxTSmKsUsxPFES8IoWwS8+fj98C7slfFL+qBSe
        WQ9Ei3M9ALzMB65nNJ6I5G28f2G6D+M=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-u-68bXy6MAKFYcNztdiLug-1; Tue, 07 Jul 2020 08:41:33 -0400
X-MC-Unique: u-68bXy6MAKFYcNztdiLug-1
Received: by mail-qt1-f200.google.com with SMTP id g6so30636778qtr.0
        for <linux-input@vger.kernel.org>; Tue, 07 Jul 2020 05:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xciiD80zP1orEDkuFQaVx94y/jH2lWnyaNnhRi7uAHU=;
        b=RpIX4K1b+28UEN3H33V4apOa1hSzjpIKBLgNyVktakEFHGK7zCj75W46W+v5KMrkNl
         NkcTBI9nEDnaBqNKkorNGo2THLgNfVrSCD5cVCenYYYXBrsCN9J9CTMZYzHBemsw0Zmv
         PUYm1ysvn6et1WKvPlr5cKvArkNwhWojwdK01U+fjUwvPTqg7pI8MhOTUf+xOJY3AYvx
         UtJSrod0DqH2/0U5PUk5tHoS4VdpoR2baTU5fAOyIF3dl0pA0r/ksheQQ7X5PnBU6Es8
         DcuflA5kXAPRLN1Kt7Q4c9nbWBEwYF0P3KsJ51lJgsQBFAZjxBy4Pyn8xNN+h7qsLf60
         pwpA==
X-Gm-Message-State: AOAM5330NJKFkOljBhvBn4g9LcIwygfXvAN3VAfk1IufYF31TEwNUlT9
        rcFFsHm+5DDWDdmjvqyRknfJlhqhjayz4VuEzRF5ON5kx6+FHntHnOrNzRZnzZbqWL592j/AOB9
        e377jVWCCqVEly+GBxosjwde3aLlxglnqgUnYWbM=
X-Received: by 2002:a05:620a:22cc:: with SMTP id o12mr37883662qki.230.1594125693359;
        Tue, 07 Jul 2020 05:41:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyP6smbupZKAwsH82c9IuyMHurFxxfFL3lg3HgS+Yna+vRveJg4MbajXPTdHz1BfmCS75o3pP1vmieESGrBAqY=
X-Received: by 2002:a05:620a:22cc:: with SMTP id o12mr37883645qki.230.1594125693077;
 Tue, 07 Jul 2020 05:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200626055936.4441-1-mail@mariuszachmann.de> <20200630021642.GA155878@roeck-us.net>
 <nycvar.YFH.7.76.2007071220210.15962@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2007071220210.15962@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 7 Jul 2020 14:41:22 +0200
Message-ID: <CAO-hwJJmPNiFm=e82J3Q577n7phm8R32mHe5gu+uHNcgJH6cYw@mail.gmail.com>
Subject: Re: [PATCH v7] hwmon: add Corsair Commander Pro driver
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Marius Zachmann <mail@mariuszachmann.de>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 7, 2020 at 12:20 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Mon, 29 Jun 2020, Guenter Roeck wrote:
>
> > On Fri, Jun 26, 2020 at 07:59:36AM +0200, Marius Zachmann wrote:
> > > This is v7 of a driver for the Corsair Commander Pro.
> > > It provides sysfs attributes for:
> > > - Reading fan speed
> > > - Reading temp sensors
> > > - Reading voltage values
> > > - Writing pwm and reading last written pwm
> > > - Reading fan and temp connection status
> > >
> > > It is an usb driver, so it needs to be ignored by usbhid.
> > > The Corsair Commander Pro is a fan controller and provides
> > > no means for user interaction.
> > > The two device numbers are there, because there is a slightly
> > > different version of the same device. (Only difference
> > > seem to be in some presets.)
> > >
> > > This is based on the staging/hwmon tree.
> > >
> > > Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
> >
> > For my reference:
> >
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Waiting for Ack from HID maintainer.
>
> Acked-by: Jiri Kosina <jkosina@suse.cz>

Sorry I missed this too:

Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

for the HID hunk too.

Cheers,
Benjamin

>
> for the drivers/hid/hid-quirks.c hunk. Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

