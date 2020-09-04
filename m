Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359E325DC9F
	for <lists+linux-input@lfdr.de>; Fri,  4 Sep 2020 16:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730429AbgIDO7d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Sep 2020 10:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730301AbgIDO7a (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Sep 2020 10:59:30 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB77CC061244
        for <linux-input@vger.kernel.org>; Fri,  4 Sep 2020 07:59:27 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 17so4735480pfw.9
        for <linux-input@vger.kernel.org>; Fri, 04 Sep 2020 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RjIGfgFgEk5o0dm5jk0+4T2pVa8S7/xEygznBUhbDHU=;
        b=LZ4QATl8jlIeSBGfvOQM4rPEFu1dKRtj7fqp0B0gjreTsXfqi8TxojfiHBC3PkbYpC
         cya1uHml+IftIE7y5Yxlx2JiPoU6q6/7y4KRgOhHz6YpVqj/iT/uRmgJmPxvFIxr4KFC
         PEP7/lOkOxavFZBXsycatk4nxX99IEdxCfvQ02vpzV4BMd7bOQ6r1C8ICE2sJ0rnfUnu
         j2jbuife7N1vEEJY6QJyq5nVBfhQgkDm6xxOd2Xet25inHZA/MydA+WK+Qrkwx1qQU+F
         YHr5FzfriVDcdrNNv22emBGgoWZYxRaqEINKGs/6aVoaCXL/kgqw4Q5W260jLCcIKxRP
         lIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RjIGfgFgEk5o0dm5jk0+4T2pVa8S7/xEygznBUhbDHU=;
        b=g6AyrBAjCVWzOHPpq3Mg6V0C9HEvIRwrKhAQf6hbdIQfngbOC/xVpMgg7lao97Sbvx
         RNQ7YHIfDFFJX2m2dJcq1Iuuj1IpIBCA/GRzZ80HmTZGdQRISEpwiZloASpkjtKqkKGs
         FF1Y1NLHHqWlcr8fFg39xdqhVvKydo1F79eAI3a0gBWUrBWxBuBECnxdMto6iSzT0WV3
         bDe9XFeNe72OqmSn+ZZ1DLgU6JZ43ogs1Y+K76J8qo6R513b+c+bneSs+w824cppgm1p
         ia2ifYz0klvNQACC5OCPbQhne/HAR4rA11z1/gkqLO+K2WubestsZ0p5euZFvGdLU51N
         n0WA==
X-Gm-Message-State: AOAM533JHFqN+mqhUnGgi+T3EPQbOCHTXfQk0jhnpsgDuxm+DIRrMB8z
        wJ2k7PeYR4jxaaqg10f8nNc=
X-Google-Smtp-Source: ABdhPJygMjk9Mje26xyJbQkEwLTIyLz6vFcz2EG2Pq2j/saxYq3yCV0koAhBvevlw2238+J3zd+jiQ==
X-Received: by 2002:a63:ca4e:: with SMTP id o14mr7694221pgi.213.1599231563780;
        Fri, 04 Sep 2020 07:59:23 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id 72sm6848332pfx.79.2020.09.04.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 07:59:22 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Fri, 4 Sep 2020 22:59:16 +0800
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Advice on fixing the bug of MSFT0001:00 04F3:Touchpad being
 handled by hid_multitouch by mistake
Message-ID: <20200904145916.nighviqyrvbm2ybx@Rk>
References: <20200811091445.erp2b23xmx3ceyzp@Rk>
 <CAO-hwJ+3LTUviWxDGQoXaBO-USwP4n6LRscJEzHJShqBEJ3oBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO-hwJ+3LTUviWxDGQoXaBO-USwP4n6LRscJEzHJShqBEJ3oBg@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 04, 2020 at 10:16:51AM +0200, Benjamin Tissoires wrote:
>Hi,
>
>On Tue, Aug 11, 2020 at 11:15 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> Hi,
>>
>> I'm working on a touchpad device issue as reported on
>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190.
>>
>> This touchpad device MSFT0001:00 04F3:Touchpad should be handled by
>> hid_rmi. But currently hid-core.c chooses hid_multitouch by mistake,
>>
>>      1. When scanning this device's report descriptor, HID_DG_CONTACTID
>>         usage is found. Thus group HID_GROUP_MULTITOUCH is assigned to
>>         the device.
>>      2. The flag HID_SCAN_FLAG_MT_WIN_8 is also found. Thus group
>>         HID_GROUP_MULTITOUCH_WIN_8 is assigned to the device.
>>      3. hid-multitouch.c claims handling devices with the group of
>>         HID_GROUP_MULTITOUCH_WIN_8
>>
>>          static const struct hid_device_id mt_devices[] = {
>>                 /* Generic MT device */
>>                 { HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
>>
>>                 /* Generic Win 8 certified MT device */
>>                 {  .driver_data = MT_CLS_WIN_8,
>>                         HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
>>                                 HID_ANY_ID, HID_ANY_ID) },
>>                 { }
>>          };
>>
>> There are several potential solutions,
>>      - Let the device vendor fix this problem since this device's report
>>        descriptor shouldn't have the HID_DG_CONTACTID usage.
>>      - Make it a special case by setting the device's group to
>>        HID_GROUP_RMI in hid_scan_report when vendor id and product ID
>>        are matched.
>>      - hid-quirks.c seems to be designed to handle special cases, is it
>>        suitable for this case?
>
>AFAIU, the touchpad doesn't work at all with hid-multitouch. So I
>guess the best is to add the VID/PID to hid-quirks.c in
>hid_have_special_driver[], and add it to the hid-rmi driver too.
>This way, you will ensure hid-rmi will pick up the device all the time.
>
>Cheers,
>Benjamin

Thank you for the advice! I have exactly adopted this approach by looking
at commit e9287099ba6539bccb20cd791269186f3ae28b85
("HID: rmi: Add support for the touchpad in the Razer Blade 14 laptop")
as an example.

My previous email is a bit misleading because 0x04F3 is the vendor code
of ELAN while hid-rmi is for the Synaptics touchpad. And actually this
laptop model of Lenovo Legion-5 15ARH05 is shipped with both kinds of
touchpads,

- for the Synaptics touchpad, hid-rmi could almost handle it perfectly
   except the clicking is not sensitive enough. I need to let my finger
   linger on the touchpad for a while. I notice when I click on the touchpad,
   an HID report would be received by hid-recorder. But evtest couldn't receive
   any EV_ event. If hid-multitouch is handling the device, the cursor
   won't move but 2-4 finger touching events could still be received by
   evtest.

- for the ELAN touchpad, only HID reporters can be read and parsed by
   hid-core then two input devices (mouse and touchpad) could created by
   hid-multitouch as seen from /proc/bus/input/devices. But hid-recorder
   could never get any HID report.

AFAIU, isn't hid-multitouch supposed to be the implementation of Windows
Precision Touchpad? And since Precision touchpad is mandatory for
Windows 10 notebooks and this laptop model of Lenovo Legion-5 15ARH05
seem to have been certificated by Windows 10, does it mean by theory
hid-multiouch could handle these two touchpad devices?

Anyway, it seems I need to install Windows Driver Kit to capture&analyze
HID reports to see what's happening. Or do you have any suggestion?

--
Best regards,
Coiby
