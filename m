Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A51887834B
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 04:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbfG2CVd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Jul 2019 22:21:33 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:37475 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfG2CVd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Jul 2019 22:21:33 -0400
Received: by mail-ot1-f41.google.com with SMTP id s20so61001989otp.4
        for <linux-input@vger.kernel.org>; Sun, 28 Jul 2019 19:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=7mLfKFhvc9c/KEusoSgYSamQFLo8lml+kPhS8c5Hy7A=;
        b=emGRK6CrlSg5k1kqi1v1CaYvYkl91y761Rcy5yd4BPCCL9QqYB1cXBs1wwF790ipGF
         C+/ut5dq1m8UQOhlmYLj+8H6flBG05q0ACbD6RbtohZGJnswOh+OmQM0TW8DEx98lgJA
         bfFFf0zkWwU59JAoyRYExhoDU7+tXJC5pjAEMDyqsvY9SOyXHQStkfsZV41Y1gtP5zMi
         fpWQvXGMPjravEJxLf5iUU+5nsMqfmViSj/2DiuOjpWnQ8ghPesvwMnhmPtmo/V2sdFE
         rtJxVVi5J4Pdi1rt8jzJQbhHg6cxtPgTzSXKxIqy45sDCwg4f6avQg48RybTR6puMQy9
         YveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=7mLfKFhvc9c/KEusoSgYSamQFLo8lml+kPhS8c5Hy7A=;
        b=a0ObVZ/WkeCQ1TKAiDNdIQPo8Plak45t3pVFAYqLL+3ovXrnltSokWB42lZqTGBNsF
         G6PG/G8Fn8mv7oJltFcGPpnJCt4El5TuMCthbvyGN6NheJFWZKKCQI+MNX3S6AgvFy2W
         EJcBC83OVwxTsOXhuzCgtHS2tOoeFa2D36GxXk1GIc4FaT+KGmJVHIyOBt2y4WKmB1uy
         1idTSRqLjBEQyAtJH2DWV1GupLzQKBn2t/jd4uwLxN7KfJ0xWgUYYdO/BnV5sXBZvdeR
         ceWB50Qpaqz6TMeUUeL5GCC/jGvYFqWxqzCJxLxDcNuc/1aV+qkh5jYvHThwHqeCbmHP
         If1Q==
X-Gm-Message-State: APjAAAVznG8kzioyJBpAI3trsQFKWaS/bgTKF+t1y1FAWVgfitmaI6Ob
        WUJYWFwJoTLc/W7QOw6sWOk4X+4o9rW1STN2sT38suy6
X-Google-Smtp-Source: APXvYqxGIKc7PV60eBsyGuUHY0lsTqvsDbN7CW0e/3KJ9A15z1fSqIOaYV2s6WmaaAu1Z0S7g5exCI9eH+l9V08al7I=
X-Received: by 2002:a05:6830:211a:: with SMTP id i26mr43975099otc.15.1564366892333;
 Sun, 28 Jul 2019 19:21:32 -0700 (PDT)
MIME-Version: 1.0
From:   Peter Smith <peter.a.smith.75@gmail.com>
Date:   Sun, 28 Jul 2019 22:21:21 -0400
Message-ID: <CAFeT-8FDD4B+tFXH2Z1CE2YxDcig+zLqW+Vpgt3Ze3W_rPm2iw@mail.gmail.com>
Subject: As of kernel 5.2, Logitech G920 steering wheel not recognized as
 HID++ device
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi, I was trying out newer kernels to see if updates to the logitech
hidpp drivers would fix a problem I was seeing with the force feedback
command queue filling up and causing delays.  I found that my G920 was
no longer recognized as an HID++ device at all with kernel 5.2 or
5.2.1, resulting in a complete lack of force feedback functionality.
I've run across two other reports of a similar issue on the steam
community forums.

I'm running the gentoo patched kernels nominally, but see the same
behavior between gentoo's 5.2 and vanilla 5.2.

after the usb_modeswitch command which results in a flip of the
product id from c261 to c262, the 5.1.17 kernel (most recent working
I've tested) shows me this in my kernel log:
Jul 20 10:23:02 frisco kernel: usb 1-12: USB disconnect, device number 6
Jul 20 10:23:03 frisco kernel: usb 1-12: new full-speed USB device
number 7 using xhci_hcd
Jul 20 10:23:03 frisco kernel: usb 1-12: New USB device found,
idVendor=046d, idProduct=c262, bcdDevice=96.01
Jul 20 10:23:03 frisco kernel: usb 1-12: New USB device strings:
Mfr=1, Product=2, SerialNumber=3
Jul 20 10:23:03 frisco kernel: usb 1-12: Product: G920 Driving Force
Racing Wheel for Xbox One
Jul 20 10:23:03 frisco kernel: usb 1-12: Manufacturer: Logitech
Jul 20 10:23:03 frisco kernel: usb 1-12: SerialNumber: 000010a4ade826d3
Jul 20 10:23:03 frisco kernel: input: Logitech G920 Driving Force
Racing Wheel for Xbox One as
/devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.0/0003:046D:C262.0004/input/input16
Jul 20 10:23:03 frisco kernel: logitech-hidpp-device
0003:046D:C262.0004: input,hiddev97,hidraw3: USB HID v1.11 Joystick
[Logitech G920 Driving Force Racing Wheel for Xbox One] on
usb-0000:00:14.0-12/input0
Jul 20 10:23:03 frisco kernel: logitech-hidpp-device
0003:046D:C262.0004: HID++ 4.2 device connected.
Jul 20 10:23:03 frisco kernel: logitech-hidpp-device
0003:046D:C262.0004: Force feedback support loaded (firmware release
1).

with 5.2: I get this (I believe this was after a few replugs, which is
why the device numbers are so much higher, same end result every time
though):
Jul 20 09:45:34 frisco kernel: usb 1-12: USB disconnect, device number 12
Jul 20 09:45:34 frisco kernel: usb 1-12: new full-speed USB device
number 13 using xhci_hcd
Jul 20 09:45:35 frisco kernel: usb 1-12: New USB device found,
idVendor=046d, idProduct=c262, bcdDevice=96.01
Jul 20 09:45:35 frisco kernel: usb 1-12: New USB device strings:
Mfr=1, Product=2, SerialNumber=3
Jul 20 09:45:35 frisco kernel: usb 1-12: Product: G920 Driving Force
Racing Wheel for Xbox One
Jul 20 09:45:35 frisco kernel: usb 1-12: Manufacturer: Logitech
Jul 20 09:45:35 frisco kernel: usb 1-12: SerialNumber: 000010a4ade826d3
Jul 20 09:45:35 frisco kernel: input: Logitech G920 Driving Force
Racing Wheel for Xbox One as
/devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.0/0003:046D:C262.0007/input/input19
Jul 20 09:45:35 frisco kernel: logitech-hidpp-device
0003:046D:C262.0007: input,hiddev97,hidraw3: USB HID v1.11 Joystick
[Logitech G920 Driving Force Racing Wheel for Xbox One] on
usb-0000:00:14.0-12/input0

with 5.2 I don't get those last two lines.  and evtest doesn't show
the "Event type 21 (EV_FF)" which 5.1.17 and earlier do.
I configured each kernel I tested using olddefconfig on the .config
from my original 4.19.57 kernel, with nothing else changed.

I added some additional hid_warn's to try to track down where it was
failing, and it looks like the hidpp_validate_report function is
getting a 0 when testing REPORT_ID_HIDPP_SHORT.
REPORT_ID_HIDPP_LONG does get the expected length though.
Not really sure what I'm looking at here.  Happy to provide any
further details/testing.

Regards,
Peter
