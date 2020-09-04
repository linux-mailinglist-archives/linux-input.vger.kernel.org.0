Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CAA25D355
	for <lists+linux-input@lfdr.de>; Fri,  4 Sep 2020 10:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgIDIRH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Sep 2020 04:17:07 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22753 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726811AbgIDIRG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Sep 2020 04:17:06 -0400
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-O3Lo5IiGN6eUvf7BVTU4LA-1; Fri, 04 Sep 2020 04:17:03 -0400
X-MC-Unique: O3Lo5IiGN6eUvf7BVTU4LA-1
Received: by mail-pl1-f199.google.com with SMTP id x11so770421pll.0
        for <linux-input@vger.kernel.org>; Fri, 04 Sep 2020 01:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A7PJpPwsMtzBefMR1CLruzb/xgu5bpsDYQYJhcYPypU=;
        b=HsfuhqLjNsOoZS0Oajg5LGNSQFrbhNJshaLdWFVw+71+LNytKvWekJT4BNT1SugE+c
         UIlRwaVXwyV9AVIpEcjACD3gV3XBTjwT/1VscZ1bBK+FhjjC6jxG1GnfXFUJIcXrUsbj
         0Jxnyb8/AkItVTDp1TnyY/ema0ryNIC6ugP49xhy3Ros11hUo11IuM8aX/dymyIEF03I
         KaAYPib1Ea6z0DXqdFr5F4KdKOmwRdUUd7PrZ52ACMCz+2iuYuXFzcOvAuXY1IQhvck7
         1h8B1cGNXw0/hV7zt1iw1dlXyFWv48Nv6neZ7VQardHWiABU/G0jk7Gclrzvi2hCrz3n
         5THQ==
X-Gm-Message-State: AOAM530NVzi+6OViO41PwSHThQbwq7jjR88blitmyHAef6+fVL9Y9Qmk
        1ZxFzLQZZw5jIdiial4zYM8rdPAEGfI2xhgQHaozbZaxRqf6uvjpQgidWMAmDt9UWMeh6bQ5klB
        V6xyGRiZzXtZU0VUn7HV79Tva45Exj4WMBJVJdgw=
X-Received: by 2002:a62:d456:0:b029:13c:1611:66c2 with SMTP id u22-20020a62d4560000b029013c161166c2mr5630513pfl.13.1599207422483;
        Fri, 04 Sep 2020 01:17:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPSOGzY4hDYW8kAPmNPd3DYQ6NQ29GYTwuJV+5YB+XTVEKct/9nkHpz7EwlAGV00TYhYyFXjmr21j/frdgRcY=
X-Received: by 2002:a62:d456:0:b029:13c:1611:66c2 with SMTP id
 u22-20020a62d4560000b029013c161166c2mr5630491pfl.13.1599207422196; Fri, 04
 Sep 2020 01:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200811091445.erp2b23xmx3ceyzp@Rk>
In-Reply-To: <20200811091445.erp2b23xmx3ceyzp@Rk>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 4 Sep 2020 10:16:51 +0200
Message-ID: <CAO-hwJ+3LTUviWxDGQoXaBO-USwP4n6LRscJEzHJShqBEJ3oBg@mail.gmail.com>
Subject: Re: Advice on fixing the bug of MSFT0001:00 04F3:Touchpad being
 handled by hid_multitouch by mistake
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Aug 11, 2020 at 11:15 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> Hi,
>
> I'm working on a touchpad device issue as reported on
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190.
>
> This touchpad device MSFT0001:00 04F3:Touchpad should be handled by
> hid_rmi. But currently hid-core.c chooses hid_multitouch by mistake,
>
>      1. When scanning this device's report descriptor, HID_DG_CONTACTID
>         usage is found. Thus group HID_GROUP_MULTITOUCH is assigned to
>         the device.
>      2. The flag HID_SCAN_FLAG_MT_WIN_8 is also found. Thus group
>         HID_GROUP_MULTITOUCH_WIN_8 is assigned to the device.
>      3. hid-multitouch.c claims handling devices with the group of
>         HID_GROUP_MULTITOUCH_WIN_8
>
>          static const struct hid_device_id mt_devices[] = {
>                 /* Generic MT device */
>                 { HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
>
>                 /* Generic Win 8 certified MT device */
>                 {  .driver_data = MT_CLS_WIN_8,
>                         HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
>                                 HID_ANY_ID, HID_ANY_ID) },
>                 { }
>          };
>
> There are several potential solutions,
>      - Let the device vendor fix this problem since this device's report
>        descriptor shouldn't have the HID_DG_CONTACTID usage.
>      - Make it a special case by setting the device's group to
>        HID_GROUP_RMI in hid_scan_report when vendor id and product ID
>        are matched.
>      - hid-quirks.c seems to be designed to handle special cases, is it
>        suitable for this case?

AFAIU, the touchpad doesn't work at all with hid-multitouch. So I
guess the best is to add the VID/PID to hid-quirks.c in
hid_have_special_driver[], and add it to the hid-rmi driver too.
This way, you will ensure hid-rmi will pick up the device all the time.

Cheers,
Benjamin

>
> Can anyone give an advice on which direction I should take? Thank you!
>
> --
> Best regards,
> Coiby
>

