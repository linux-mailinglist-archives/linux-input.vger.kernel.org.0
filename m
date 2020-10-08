Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF61287649
	for <lists+linux-input@lfdr.de>; Thu,  8 Oct 2020 16:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730511AbgJHOmY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Oct 2020 10:42:24 -0400
Received: from netrider.rowland.org ([192.131.102.5]:37659 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729992AbgJHOmY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Oct 2020 10:42:24 -0400
X-Greylist: delayed 402 seconds by postgrey-1.27 at vger.kernel.org; Thu, 08 Oct 2020 10:42:24 EDT
Received: (qmail 497089 invoked by uid 1000); 8 Oct 2020 10:35:42 -0400
Date:   Thu, 8 Oct 2020 10:35:42 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [Bug 209137] USB is not working since update from 5.0 to
 5.3.0-26. And with 5.4 still not working.
Message-ID: <20201008143542.GC495091@rowland.harvard.edu>
References: <bug-209137-208809@https.bugzilla.kernel.org/>
 <bug-209137-208809-GmYB1n8NUL@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-209137-208809-GmYB1n8NUL@https.bugzilla.kernel.org/>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Jiri and Benjamin:

Please look at Bugzilla # 209137:

	https://bugzilla.kernel.org/show_bug.cgi?id=209137

Somewhere between 5.0 and 5.4, the logitech-djreceiver driver stopped 
binding to the user's Logitech wireless device.  Here are relevant parts 
of the kernel logs.  From 5.0 (working):

[    2.857770] logitech-djreceiver 0003:046D:C52B.0003: hiddev0,hidraw0: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:00:14.0-4/input2
[    2.985339] input: Logitech Unifying Device. Wireless PID:1024 Mouse as /devices/pci0000:00/0000:00:14.0/usb3/3-4/3-4:1.2/0003:046D:C52B.0003/0003:046D:1024.0004/input/input13
[    2.985410] hid-generic 0003:046D:1024.0004: input,hidraw1: USB HID v1.11 Mouse [Logitech Unifying Device. Wireless PID:1024] on usb-0000:00:14.0-4:1
[    2.995266] input: Logitech K520 as /devices/pci0000:00/0000:00:14.0/usb3/3-4/3-4:1.2/0003:046D:C52B.0003/0003:046D:2011.0005/input/input17
[    3.026985] logitech-hidpp-device 0003:046D:2011.0005: input,hidraw1: USB HID v1.11 Keyboard [Logitech K520] on usb-0000:00:14.0-4:2
[    3.033173] input: Logitech M310 as /devices/pci0000:00/0000:00:14.0/usb3/3-4/3-4:1.2/0003:046D:C52B.0003/0003:046D:1024.0004/input/input18
[    3.033358] logitech-hidpp-device 0003:046D:1024.0004: input,hidraw2: USB HID v1.11 Mouse [Logitech M310] on usb-0000:00:14.0-4:1

From 5.4 (non-working):

[    2.908901] hid-generic 0003:046D:C52B.0001: input,hidraw0: USB HID v1.11 Keyboard [Logitech USB Receiver] on usb-0000:00:14.0-4/input0
[    2.909003] hid-generic 0003:046D:C52B.0002: unknown main item tag 0x0
[    2.909016] hid-generic 0003:046D:C52B.0002: unknown main item tag 0x0
[    2.909019] hid-generic 0003:046D:C52B.0002: unknown main item tag 0x0
[    2.909023] hid-generic 0003:046D:C52B.0002: unknown main item tag 0x0
[    2.909030] hid-generic 0003:046D:C52B.0002: unexpected long global item
[    2.909038] hid-generic: probe of 0003:046D:C52B.0002 failed with error -22
[    2.909196] hid-generic 0003:046D:C52B.0003: hiddev0,hidraw1: USB HID v1.11 Device [Logitech USB Receiver] on usb-0000:00:14.0-4/input2
[    2.910586] logitech-djreceiver 0003:046D:C52B.0002: unknown main item tag 0x0
[    2.910601] logitech-djreceiver 0003:046D:C52B.0002: unknown main item tag 0x0
[    2.910605] logitech-djreceiver 0003:046D:C52B.0002: unknown main item tag 0x0
[    2.910609] logitech-djreceiver 0003:046D:C52B.0002: unknown main item tag 0x0
[    2.910616] logitech-djreceiver 0003:046D:C52B.0002: unexpected long global item
[    2.910620] logitech-djreceiver 0003:046D:C52B.0002: logi_dj_probe: parse failed
[    2.910623] logitech-djreceiver: probe of 0003:046D:C52B.0002 failed with error -22

FYI, intf 0 is a boot-interface keyboard, intf 1 is a boot-interface 
mouse, and intf 2 is the wireless HID interface.

It's not immediately obvious to me where the problem lies.

Thanks,

Alan Stern
