Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDFEB29465
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 11:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389752AbfEXJTP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 24 May 2019 05:19:15 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:44739 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389515AbfEXJTP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 05:19:15 -0400
Received: by mail-qk1-f195.google.com with SMTP id w25so6385091qkj.11
        for <linux-input@vger.kernel.org>; Fri, 24 May 2019 02:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7+56V34UO6f1yOAZuwtgojwUdZjIaQZjLcC9WjhkGCQ=;
        b=UaXwtsp9cGAaVZIO//DYl04m+LVWpXuWkkoJgihSeYgbB5t58HmpnlCV7MaJvrU/aV
         hS8am5cs3wehttIMzjrHfr7mYFZIGzvSSy80ZACYLRoC+naelwsQV8sJDW8ZujQ0JzAn
         Hkdc+0k9iX787kB4H4VviO0qgLnxnu5hchYOB2hFIhrWecb/CsQIqSi2B0zmL/vhLwhk
         Bd//B9wqEcJDSKgiju30S4q30kGv1aMBV9qJZ9/Kvhuc61ERTSzGxhU034yXrFw7iBmb
         y4oEX/yZoLavDsYdmjMql6iXqWLrvW3qRvgv7KTKJhXx7W1XpOvrj1BmoKAHnlAtG00A
         UhtA==
X-Gm-Message-State: APjAAAWQXV1NtLNvrdycrc1iNlsCSzCkWBGUj/17jsM0/B2ZDaBkhN6T
        u94o2lIa1IbjSxpbiIVBu1sx4altYzq2X8t3sSsFiQ==
X-Google-Smtp-Source: APXvYqyqRQ8qrEWXLm6DLEhWSrO4D17JdjftR/wwDYbEaVtlNU2URLnO29TsiKgTY4ax7bO0iBI4+FiH/tbgRbNM1WQ=
X-Received: by 2002:a37:ea16:: with SMTP id t22mr53587620qkj.337.1558689554600;
 Fri, 24 May 2019 02:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
 <20190521132712.2818-10-benjamin.tissoires@redhat.com> <003d01d511de$9da229c0$d8e67d40$@emc.com.tw>
 <CAO-hwJLnjxVxdodqAkKdQpqjAPGV1QYnugM+9t_86xRD92WJ-Q@mail.gmail.com> <011a01d5120f$146265e0$3d2731a0$@emc.com.tw>
In-Reply-To: <011a01d5120f$146265e0$3d2731a0$@emc.com.tw>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 24 May 2019 11:19:03 +0200
Message-ID: <CAO-hwJJMwX0w8wTwC66axCQrn8GemH4AFhRv3=30YZ0er2HkwQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] Input: elan_i2c - correct the width/size base value
To:     =?UTF-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 24, 2019 at 11:00 AM 廖崇榮 <kt.liao@emc.com.tw> wrote:
>
> Hi
>
> -----Original Message-----
> From: Benjamin Tissoires [mailto:benjamin.tissoires@redhat.com]
> Sent: Friday, May 24, 2019 3:06 PM
> To: 廖崇榮
> Cc: Dmitry Torokhov; Rob Herring; Aaron Ma; Hans de Goede; open list:HID CORE LAYER; lkml; devicetree@vger.kernel.org
> Subject: Re: [PATCH v2 09/10] Input: elan_i2c - correct the width/size base value
>
> On Fri, May 24, 2019 at 5:13 AM 廖崇榮 <kt.liao@emc.com.tw> wrote:
> >
> > Hi Benjamin,
> >
> > Thanks so much for all you do for Elan touchpad.
> >
> > For the width_*, I have a question for it.
> > Our antenna sensors fully occupied the whole touchpad PCB.
> >
> > The Gap between 2 sensors are 7.5 mil (0.19mm).
> > That's why we did not minus one trace.
>
> So, with the P52 I have:
> [  +0.000009] max:    (3045,1731) drivers/input/mouse/elan_i2c_core.c:428
> [  +0.000003] traces: (24,14) drivers/input/mouse/elan_i2c_core.c:429
> [  +0.000002] size:   (98,55) drivers/input/mouse/elan_i2c_core.c:430
> [  +0.000001] res:    (31,31) drivers/input/mouse/elan_i2c_core.c:431
>
> calculated size (max/res): 98 x 56 mm
> true size, as measured: 101 x 60 mm
>
> I list layout information of P52 touchpad as below.
> Physical size : 99 x 58 mm
> Active Area size : ~ 97 * 56 mm, (boarding is 1.008mm for each side)
>
> Sensor layout:
> X Pitch : 4.0286 mm
> Y Pitch : 4.0147 mm
>
> Which gives (without the minus 1):
> width_x = max_x / x_traces = 3045 / 24 = 126.875 -> 3.9885 mm width_y = max_y / y_traces = 1731 / 14 = 123.643 -> 4.0927 mm
>
> -> this gives a total size of the touchpad of: 96 x 57 mm (width_x *
> 24, width_y * 14)
>
> With the minus 1:
> width_x = max_x / x_traces = 3045 / 23 = 132.391 -> 4.2707 mm width_y = max_y / y_traces = 1731 / 14 = 133.154 -> 4.2953 mm
>
> -> this gives a total size of the touchpad of: 102 x 60 mm (width_x *
> 24, width_y * 14)
> and considering traces-1: 98 x 56 mm
>
> Removing 1 to the number of traces gave a squarer values in rows and columns, and this is what is done in the PS/2 driver.
> Also, going back to the size of the touchpad gives a better value when removing 1 on the *traces.
> So maybe when forwarding the properties we should remove one there in the PS/2 driver?
>
> Removing 1 trace may be better for some of previous touchpad. (depending on sensor pattern)
> mk_* indicate the number of trace which is touched, and it's not a precise value.
> I think the usability won't change too much whether removing one trace.
> PS/2 have supported plenty of touchpad. It's better to remain the same.
>

OK, so I guess I should just drop this patch from the series then.

Cheers,
Benjamin
