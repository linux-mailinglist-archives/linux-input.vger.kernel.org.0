Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18BAB48134
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2019 13:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfFQLqv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jun 2019 07:46:51 -0400
Received: from outbound2.flatbooster.com ([84.200.223.10]:35722 "EHLO
        outbound2.flatbooster.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbfFQLqv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jun 2019 07:46:51 -0400
Received: from localhost (outbound2.flatbooster.com [127.0.0.1])
        by outbound2.flatbooster.com (Postfix) with ESMTP id F10DA228079;
        Mon, 17 Jun 2019 13:46:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outbound2.flatbooster.com
Received: from outbound2.flatbooster.com ([127.0.0.1])
        by localhost (outbound2.flatbooster.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id IbUzvdsGv0uC; Mon, 17 Jun 2019 13:46:46 +0200 (CEST)
Received: from rex11.flatbooster.com (rex11.flatbooster.com [84.200.223.40])
        by outbound2.flatbooster.com (Postfix) with ESMTPS id C8301228024;
        Mon, 17 Jun 2019 13:46:46 +0200 (CEST)
Received: from [10.0.1.16] (unknown [5.10.63.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: web110614p1)
        by rex11.flatbooster.com (Postfix) with ESMTPSA id 98CA414E0A06;
        Mon, 17 Jun 2019 13:46:46 +0200 (CEST)
From:   Bernd Steinhauser <linux-ml@bernd-steinhauser.de>
Subject: Force Feedback support not recognized on Granite Devices Simucube
Reply-To: linux-ml@bernd-steinhauser.de
To:     linux-input@vger.kernel.org
Cc:     linux-usb@vger.kernel.org
Message-ID: <b4e9f460-ee34-fe8b-4502-e14701f9f03b@bernd-steinhauser.de>
Date:   Mon, 17 Jun 2019 13:46:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------6511CA17743B51AFCC229752"
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.
--------------6511CA17743B51AFCC229752
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Resending this message to linux input as suggested.

Hi,

I own a Granite Devices Simucube force feedback wheel which I'd like to get 
working under Linux.
The current status is that if I use a tool to check/test the FFB, it tells me 
that the device does not support FFB.
I'm also using the device under Windows 7 and there it works without any special 
driver, so it should work with USB HID FFB.
In principle, it supports the following effects (see link below):
- constant force
- friction
- damping
- spring
- sine wave
- square wave
- sawtooth
- triangle

The device advertises as MCS, Granite Devices SimuCUBE with id 16d0:0d5a, I'll 
attach lsusb output.
Upon connection, the device is recognized and the output is:

[ 3271.812807] usb 1-2.4.2: new full-speed USB device number 10 using xhci_hcd
[ 3271.921182] usb 1-2.4.2: New USB device found, idVendor=16d0, idProduct=0d5a, 
bcdDevice= 2.00
[ 3271.921184] usb 1-2.4.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 3271.921185] usb 1-2.4.2: Product: SimuCUBE
[ 3271.921186] usb 1-2.4.2: Manufacturer: Granite Devices
[ 3271.921187] usb 1-2.4.2: SerialNumber: 0123456789
[ 3281.943990] input: Granite Devices SimuCUBE as 
/devices/pci0000:00/0000:00:09.0/0000:04:00.0/usb1/1-2/1-2.4/1-2.4.2/1-2.4.2:1.0/0003:16D0:0D5A.0016/input/input48
[ 3281.944223] hid-generic 0003:16D0:0D5A.0016: unknown set_effect report layout
[ 3281.944228] hid-generic 0003:16D0:0D5A.0016: input,hiddev2,hidraw15: USB HID 
v1.11 Joystick [Granite Devices SimuCUBE] on usb-0000:04:00.0-2.4.2/input0

I spent some time looking at the code and also other ffb code in usbhid, but 
since I'm not really familiar with C I have a hard time figuring out why it 
doesn't work out of the box and how to fix this, but I'd be happy to help 
implementing/debugging it.
For a start, it would be really nice to find out what is reported, what the 
report should look like and why it doesn't match.

Kind Regards,
Bernd

Links that might or might not be useful for general information:
https://granitedevices.com/wiki/SimuCUBE_technical_specifications
https://granitedevices.com/wiki/SimuCUBE_Firmware_User_Guide#DirectInput_Effect_Settings_and_Descriptions





--------------6511CA17743B51AFCC229752
Content-Type: text/plain; charset=UTF-8;
 name="lsusb-v.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="lsusb-v.txt"

QnVzIDAwMSBEZXZpY2UgMDEwOiBJRCAxNmQwOjBkNWEgTUNTIApEZXZpY2UgRGVzY3JpcHRv
cjoKICBiTGVuZ3RoICAgICAgICAgICAgICAgIDE4CiAgYkRlc2NyaXB0b3JUeXBlICAgICAg
ICAgMQogIGJjZFVTQiAgICAgICAgICAgICAgIDIuMDAKICBiRGV2aWNlQ2xhc3MgICAgICAg
ICAgICAwIAogIGJEZXZpY2VTdWJDbGFzcyAgICAgICAgIDAgCiAgYkRldmljZVByb3RvY29s
ICAgICAgICAgMCAKICBiTWF4UGFja2V0U2l6ZTAgICAgICAgIDY0CiAgaWRWZW5kb3IgICAg
ICAgICAgIDB4MTZkMCBNQ1MKICBpZFByb2R1Y3QgICAgICAgICAgMHgwZDVhIAogIGJjZERl
dmljZSAgICAgICAgICAgIDIuMDAKICBpTWFudWZhY3R1cmVyICAgICAgICAgICAxIEdyYW5p
dGUgRGV2aWNlcwogIGlQcm9kdWN0ICAgICAgICAgICAgICAgIDIgU2ltdUNVQkUKICBpU2Vy
aWFsICAgICAgICAgICAgICAgICAzIDAxMjM0NTY3ODkKICBiTnVtQ29uZmlndXJhdGlvbnMg
ICAgICAxCiAgQ29uZmlndXJhdGlvbiBEZXNjcmlwdG9yOgogICAgYkxlbmd0aCAgICAgICAg
ICAgICAgICAgOQogICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgMgogICAgd1RvdGFsTGVu
Z3RoICAgICAgIDB4MDAyOQogICAgYk51bUludGVyZmFjZXMgICAgICAgICAgMQogICAgYkNv
bmZpZ3VyYXRpb25WYWx1ZSAgICAgMQogICAgaUNvbmZpZ3VyYXRpb24gICAgICAgICAgMCAK
ICAgIGJtQXR0cmlidXRlcyAgICAgICAgIDB4YzAKICAgICAgU2VsZiBQb3dlcmVkCiAgICBN
YXhQb3dlciAgICAgICAgICAgICAgMTAwbUEKICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgog
ICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAg
ICAgICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAgICAgICAgMAogICAgICBiQWx0ZXJu
YXRlU2V0dGluZyAgICAgICAwCiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDIKICAg
ICAgYkludGVyZmFjZUNsYXNzICAgICAgICAgMyBIdW1hbiBJbnRlcmZhY2UgRGV2aWNlCiAg
ICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDAgCiAgICAgIGJJbnRlcmZhY2VQcm90b2Nv
bCAgICAgIDAgCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAgICAgICAgSElE
IERldmljZSBEZXNjcmlwdG9yOgogICAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAg
OQogICAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAzMwogICAgICAgICAgYmNkSElE
ICAgICAgICAgICAgICAgMS4xMQogICAgICAgICAgYkNvdW50cnlDb2RlICAgICAgICAgICAg
MCBOb3Qgc3VwcG9ydGVkCiAgICAgICAgICBiTnVtRGVzY3JpcHRvcnMgICAgICAgICAxCiAg
ICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDM0IFJlcG9ydAogICAgICAgICAgd0Rl
c2NyaXB0b3JMZW5ndGggICAgMTQ2NQogICAgICAgICBSZXBvcnQgRGVzY3JpcHRvcnM6IAog
ICAgICAgICAgICoqIFVOQVZBSUxBQkxFICoqCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6
CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9y
VHlwZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDgxICBFUCAx
IElOCiAgICAgICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAgMwogICAgICAgICAgVHJhbnNm
ZXIgVHlwZSAgICAgICAgICAgIEludGVycnVwdAogICAgICAgICAgU3luY2ggVHlwZSAgICAg
ICAgICAgICAgIE5vbmUKICAgICAgICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBEYXRh
CiAgICAgICAgd01heFBhY2tldFNpemUgICAgIDB4MDA0MCAgMXggNjQgYnl0ZXMKICAgICAg
ICBiSW50ZXJ2YWwgICAgICAgICAgICAgICAxCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6
CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9y
VHlwZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDAxICBFUCAx
IE9VVAogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDMKICAgICAgICAgIFRyYW5z
ZmVyIFR5cGUgICAgICAgICAgICBJbnRlcnJ1cHQKICAgICAgICAgIFN5bmNoIFR5cGUgICAg
ICAgICAgICAgICBOb25lCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0
YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAwNDAgIDF4IDY0IGJ5dGVzCiAgICAg
ICAgYkludGVydmFsICAgICAgICAgICAgICAgMQpjYW4ndCBnZXQgZGV2aWNlIHF1YWxpZmll
cjogUmVzb3VyY2UgdGVtcG9yYXJpbHkgdW5hdmFpbGFibGUKY2FuJ3QgZ2V0IGRlYnVnIGRl
c2NyaXB0b3I6IFJlc291cmNlIHRlbXBvcmFyaWx5IHVuYXZhaWxhYmxlCkRldmljZSBTdGF0
dXM6ICAgICAweDAwMDEKICBTZWxmIFBvd2VyZWQK
--------------6511CA17743B51AFCC229752--
