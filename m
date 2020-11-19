Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00832B9665
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 16:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgKSPkD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 10:40:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33442 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727431AbgKSPkD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 10:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605800401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mQDYTVW/TVEYsCh363ohhbp4BcEn3p6fKAsG6RwkTMo=;
        b=FQnxPZBVLLaqTiHzkk0BMVHPAaBPrC1XpiPvNXiEWjVbfkZQQVMI/M1YbdmBoI1WiXviz9
        AmXaG/Bh1CLZH0GaUCaQR0FNbk867pjWAqmHSWWq1Cpiwx285njMBRwAzz1t7lzc+WR7tN
        J3zQzXWpgehadDB+ioiwwLqQioOy5ak=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-pH0cLeMyPFuNG-k-wNOnAQ-1; Thu, 19 Nov 2020 10:39:59 -0500
X-MC-Unique: pH0cLeMyPFuNG-k-wNOnAQ-1
Received: by mail-pg1-f200.google.com with SMTP id v2so4306523pgv.2
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 07:39:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mQDYTVW/TVEYsCh363ohhbp4BcEn3p6fKAsG6RwkTMo=;
        b=I/YlrZIR2ZUvM+hxkJF9HAJcyKx4bKvOin/fiN0AxJgARihx0dOPrcTySxT8xfbU6f
         q1NRz3hugZqonfqi5/sWM743CIwNaAHIwjfXLWLAa32k4aHBvMyU8IaCS8wTe7anyUKe
         tUAY4uvQDgkhTxyKJeZ5sgxCqklXFBbJEUfwylQ1fVgr/2XgYI3aMa4EuntuCqFPVEBl
         lvbRpqpR6t8P4SMWdNKLsWt2w7PAsZzqTOvUeOpBr3JWn+KAcc6yCsNBRSpP8luHynAF
         m0GTDuipe9zda139IrFkse89ZrnDBVU04MxwRtFzCFsaNgn9bmXFlzReNwH5g/s39Zw4
         sDMA==
X-Gm-Message-State: AOAM5312PM3YFNqYUksr7/iwU7T8UYTXHGpOLAk7MCTV1HEAUThpKfua
        tuYf2uRfLSHyX55/pZsbWvIUOB6EmIjI0px2bf+25AavnBQRGUTq/V330ENTjScGVQrFPGA2/P0
        zBxy0+/IuvVEK50yyNq8kOks34z2X3uNUWg/wG2k=
X-Received: by 2002:a17:90a:c796:: with SMTP id gn22mr5092798pjb.234.1605800398589;
        Thu, 19 Nov 2020 07:39:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqHE2budU5vsKu1Dn/4mU6rJ/9mEKThdb/VMTi0Am3iYlopQF5UgxFZL68xg+okxyFoTJ9Zz7bXAxhwoJhLmI=
X-Received: by 2002:a17:90a:c796:: with SMTP id gn22mr5092781pjb.234.1605800398334;
 Thu, 19 Nov 2020 07:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20201114094531.8285-1-hdegoede@redhat.com> <CAO-hwJKamLL0j8AfcFYbFeRpLxDRswGxJ3=TC=GABoSHOu=Yjw@mail.gmail.com>
 <126285ed-29ef-5791-f289-4fb56a619bd9@redhat.com>
In-Reply-To: <126285ed-29ef-5791-f289-4fb56a619bd9@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 19 Nov 2020 16:39:47 +0100
Message-ID: <CAO-hwJKdq32bwOpn=iE945MhKeQK7F3Nkf5Px1R1YUxCy911bQ@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-dj: Fix an error in mse_bluetooth_descriptor
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 19, 2020 at 4:12 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/19/20 4:10 PM, Benjamin Tissoires wrote:
> > Hi Hans,
> >
> > [sorry for taking long to get to this, I wanted to conduct some tests
> > with the Dinovo Mini with this patch and the series after]
>
> No problem.
>
> > On Sat, Nov 14, 2020 at 10:45 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Fix an error in the mouse / INPUT(2) descriptor used for quad/bt2.0 combo
> >> receivers. Replace INPUT with INPUT (Data,Var,Abs) for the field for the
> >> 4 extra buttons which share their report-byte with the low-res hwheel.
> >>
> >> This is likely a copy and paste error. I've verified that the new
> >> 0x81, 0x02 value matches both the mouse descriptor for the currently
> >> supported MX5000 / MX5500 receivers, as well as the INPUT(2) mouse
> >> descriptors for the Dinovo receivers for which support is being
> >> worked on.
> >>
> >> Fixes: f2113c3020ef ("HID: logitech-dj: add support for Logitech Bluetooth Mini-Receiver")
> >
> > I suppose you also want a cc:stable tag here too?
>
> In my experience the stable maintainers pick up most patches with
> a fixes tag anyways. With that said adding a cc:stable tag is fine.
>
> > I have added the patch to my local tests, and if you are happy with
> > it, I can push it upstream.
>
> Pushing this patch upstream is fine with me.

Alright, this is now done, and with 1/3 of the RFC of the dinovo mini series

Cheers,
Benjamin

>
> Regards,
>
> Hans
>
>
>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/hid/hid-logitech-dj.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> >> index d3471d655ab4..7706454de88f 100644
> >> --- a/drivers/hid/hid-logitech-dj.c
> >> +++ b/drivers/hid/hid-logitech-dj.c
> >> @@ -330,7 +330,7 @@ static const char mse_bluetooth_descriptor[] = {
> >>         0x25, 0x01,             /*      LOGICAL_MAX (1)                 */
> >>         0x75, 0x01,             /*      REPORT_SIZE (1)                 */
> >>         0x95, 0x04,             /*      REPORT_COUNT (4)                */
> >> -       0x81, 0x06,             /*      INPUT                           */
> >> +       0x81, 0x02,             /*      INPUT (Data,Var,Abs)            */
> >>         0xC0,                   /*    END_COLLECTION                    */
> >>         0xC0,                   /*  END_COLLECTION                      */
> >>  };
> >> --
> >> 2.28.0
> >>
> >
>

