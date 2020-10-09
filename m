Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B3028854F
	for <lists+linux-input@lfdr.de>; Fri,  9 Oct 2020 10:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732613AbgJIIbW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Oct 2020 04:31:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45869 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732438AbgJIIbV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 9 Oct 2020 04:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602232279;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=w88CjEh5DGPG+OvvFpYPp9Ob3qQjnkFqi0cSeZc/Stc=;
        b=YZ1TXijB9pa+bWI7RjdEHFe9k0C3S2sI2Kx7Q+o7XGBQwKuA8Ht+FA/DBkO5gLx63QYCHx
        gHnshUAQUUjFeODygG6y/3m0tPGyVFnXUTpKfmXzLybd9CiL1hNyQxNvJgX+cXpTiMCg0w
        FzZQXC58FKsfWNWGtHGXj3D+e2JPNGU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-vxxdOJRKOFKZbhS0MDebwQ-1; Fri, 09 Oct 2020 04:31:16 -0400
X-MC-Unique: vxxdOJRKOFKZbhS0MDebwQ-1
Received: by mail-pl1-f200.google.com with SMTP id g10so5713538plq.16
        for <linux-input@vger.kernel.org>; Fri, 09 Oct 2020 01:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w88CjEh5DGPG+OvvFpYPp9Ob3qQjnkFqi0cSeZc/Stc=;
        b=C+BlCcqTrycSsF4TDc4Jl3TbfFtNplFpkyxvmPNWhnnNkZ7qOeSrbKWzTBmKljuxsH
         CIggJooHZ6KN91mxDtGF2mgqsO610Q1pyTXPXVZRLL5rDNnhR+q1ah+W5xEZNgk1Nj1u
         rCBnVnIS5nemQx9PKb9BJha93+PXv5GDfp0fVcKCjwcU26h0iarFJZYwaq01gbk4ubj/
         0jcpzdZKdJQ5aXA1oCiM33+d3bKr9hNQLXpibEFL2rSZG14F1hYysnRan4lOPa7DahmT
         abvtWS8Nusaz2hxyCOOTdyXZf/sKUEdertfLNrVCHcwysMNVjAlcJl2FNNl4HiVdsBZR
         RggA==
X-Gm-Message-State: AOAM531q/WXPKZ0Je4OB7F8KQR/PKW37X1KttIT66TYrIEOoF7pLpbtX
        d/TFyS2DtiZCLXpMSpQrbbaCHhSR4MO9L5QFF8NKD/ubb7Xfdq2ERksRJdW827u9lEC2lXLJZ9o
        YL4yRaLWXFw6t26EgrzIvPbpbsQdmdYcJbH6dcJg=
X-Received: by 2002:a63:490e:: with SMTP id w14mr2553455pga.275.1602232275587;
        Fri, 09 Oct 2020 01:31:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN6PrgTEVSDz0+cEbBmurVWkmBYakoT6dmDghlIIii5XZOYY7qjAD5Gmb5Kkd3av8aMxliKX9dSHmoBL3lLQY=
X-Received: by 2002:a63:490e:: with SMTP id w14mr2553438pga.275.1602232275242;
 Fri, 09 Oct 2020 01:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <bug-209137-208809@https.bugzilla.kernel.org/> <bug-209137-208809-GmYB1n8NUL@https.bugzilla.kernel.org/>
 <20201008143542.GC495091@rowland.harvard.edu>
In-Reply-To: <20201008143542.GC495091@rowland.harvard.edu>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 9 Oct 2020 10:31:03 +0200
Message-ID: <CAO-hwJL1gMscTkzaiuKBcmftuG8TGmUXqNDrkA3wqQxyuKxZUg@mail.gmail.com>
Subject: Re: [Bug 209137] USB is not working since update from 5.0 to
 5.3.0-26. And with 5.4 still not working.
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alan,

On Thu, Oct 8, 2020 at 4:42 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> Jiri and Benjamin:
>
> Please look at Bugzilla # 209137:
>
>         https://bugzilla.kernel.org/show_bug.cgi?id=209137
>
> Somewhere between 5.0 and 5.4, the logitech-djreceiver driver stopped
> binding to the user's Logitech wireless device.  Here are relevant parts
> of the kernel logs.  From 5.0 (working):
>
> [    2.857770] logitech-djreceiver 0003:046D:C52B.0003: hiddev0,hidraw0: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:00:14.0-4/input2
> [    2.985339] input: Logitech Unifying Device. Wireless PID:1024 Mouse as /devices/pci0000:00/0000:00:14.0/usb3/3-4/3-4:1.2/0003:046D:C52B.0003/0003:046D:1024.0004/input/input13
> [    2.985410] hid-generic 0003:046D:1024.0004: input,hidraw1: USB HID v1.11 Mouse [Logitech Unifying Device. Wireless PID:1024] on usb-0000:00:14.0-4:1
> [    2.995266] input: Logitech K520 as /devices/pci0000:00/0000:00:14.0/usb3/3-4/3-4:1.2/0003:046D:C52B.0003/0003:046D:2011.0005/input/input17
> [    3.026985] logitech-hidpp-device 0003:046D:2011.0005: input,hidraw1: USB HID v1.11 Keyboard [Logitech K520] on usb-0000:00:14.0-4:2
> [    3.033173] input: Logitech M310 as /devices/pci0000:00/0000:00:14.0/usb3/3-4/3-4:1.2/0003:046D:C52B.0003/0003:046D:1024.0004/input/input18
> [    3.033358] logitech-hidpp-device 0003:046D:1024.0004: input,hidraw2: USB HID v1.11 Mouse [Logitech M310] on usb-0000:00:14.0-4:1
>
> From 5.4 (non-working):
>
> [    2.908901] hid-generic 0003:046D:C52B.0001: input,hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:00:14.0-4/input0
> [    2.909003] hid-generic 0003:046D:C52B.0002: unknown main item tag 0x0
> [    2.909016] hid-generic 0003:046D:C52B.0002: unknown main item tag 0x0
> [    2.909019] hid-generic 0003:046D:C52B.0002: unknown main item tag 0x0
> [    2.909023] hid-generic 0003:046D:C52B.0002: unknown main item tag 0x0
> [    2.909030] hid-generic 0003:046D:C52B.0002: unexpected long global item
> [    2.909038] hid-generic: probe of 0003:046D:C52B.0002 failed with error -22
> [    2.909196] hid-generic 0003:046D:C52B.0003: hiddev0,hidraw1: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:00:14.0-4/input2
> [    2.910586] logitech-djreceiver 0003:046D:C52B.0002: unknown main item tag 0x0
> [    2.910601] logitech-djreceiver 0003:046D:C52B.0002: unknown main item tag 0x0
> [    2.910605] logitech-djreceiver 0003:046D:C52B.0002: unknown main item tag 0x0
> [    2.910609] logitech-djreceiver 0003:046D:C52B.0002: unknown main item tag 0x0
> [    2.910616] logitech-djreceiver 0003:046D:C52B.0002: unexpected long global item
> [    2.910620] logitech-djreceiver 0003:046D:C52B.0002: logi_dj_probe: parse failed
> [    2.910623] logitech-djreceiver: probe of 0003:046D:C52B.0002 failed with error -22
>
> FYI, intf 0 is a boot-interface keyboard, intf 1 is a boot-interface
> mouse, and intf 2 is the wireless HID interface.

That is weird. I also have (several) C52B devices here, and I don't
see the problem (though arguably there are several firmware versions
out in the open).

The first part of failures show that even hid-generic can not parse
the report descriptor. This means that the provided report descriptor
is incorrect, which is weird because the one I just tested works fine.
The second part (with logitech-dj) is showing the same errors, so
that's expected given the previous problem.

To actually get the report descriptors, `lsub -v` works fine if the
HID subsystem is not bounded. So there we need to ask the reporter to
run the command with the HID subsystem not handling the device, or
simply in the working case use hid-recorder from
https://gitlab.freedesktop.org/libevdev/hid-tools/.

Another solution if the report descriptor is identical to what I have
here (in the working case), would be to write a BPF kprobe to dump
what hid_parse sees. It should be straightforward to write one, I got
everything in place for i2c-hid at
https://gitlab.freedesktop.org/bentiss/hid-bpf (though for using the
CO-RE BPF program, I am not sure 5.4 is recent enough).

>
> It's not immediately obvious to me where the problem lies.

Not obvious to me either...

Cheers,
Benjamin

>
> Thanks,
>
> Alan Stern
>

