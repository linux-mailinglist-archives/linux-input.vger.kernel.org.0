Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0ED48122
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2019 13:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbfFQLpF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jun 2019 07:45:05 -0400
Received: from outbound2.flatbooster.com ([84.200.223.10]:35368 "EHLO
        outbound2.flatbooster.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfFQLpE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jun 2019 07:45:04 -0400
X-Greylist: delayed 534 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 Jun 2019 07:45:03 EDT
Received: from localhost (outbound2.flatbooster.com [127.0.0.1])
        by outbound2.flatbooster.com (Postfix) with ESMTP id 483B9227FEB;
        Mon, 17 Jun 2019 13:36:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at outbound2.flatbooster.com
Received: from outbound2.flatbooster.com ([127.0.0.1])
        by localhost (outbound2.flatbooster.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id L9KkLDrrUyZe; Mon, 17 Jun 2019 13:36:08 +0200 (CEST)
Received: from rex11.flatbooster.com (rex11.flatbooster.com [84.200.223.40])
        by outbound2.flatbooster.com (Postfix) with ESMTPS id 6236F227FC0;
        Mon, 17 Jun 2019 13:36:07 +0200 (CEST)
Received: from [10.0.1.16] (unknown [5.10.63.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: web110614p1)
        by rex11.flatbooster.com (Postfix) with ESMTPSA id 3D86A14E0A06;
        Mon, 17 Jun 2019 13:36:06 +0200 (CEST)
Reply-To: linux-ml@bernd-steinhauser.de
Subject: Re: Force Feedback support not recognized on Granite Devices Simucube
To:     Oliver Neukum <oneukum@suse.com>
References: <68cebd85-92ad-8059-a767-a8a4f33c5c9e@bernd-steinhauser.de>
 <1560769038.8567.15.camel@suse.com>
From:   Bernd Steinhauser <linux-ml@bernd-steinhauser.de>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Message-ID: <4db2ce68-b65f-168e-0a30-72592cafb154@bernd-steinhauser.de>
Date:   Mon, 17 Jun 2019 13:36:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1560769038.8567.15.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 17/06/19 12:57, Oliver Neukum wrote:
> Am Montag, den 17.06.2019, 12:35 +0200 schrieb Bernd Steinhauser:
>> The device advertises as MCS, Granite Devices SimuCUBE with id 16d0:0d5a, I'll attach lsusb output.
>> Upon connection, the device is recognized and the output is:
>>
>> [ 3271.812807] usb 1-2.4.2: new full-speed USB device number 10 using xhci_hcd
>> [ 3271.921182] usb 1-2.4.2: New USB device found, idVendor=16d0, idProduct=0d5a, bcdDevice= 2.00
>> [ 3271.921184] usb 1-2.4.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>> [ 3271.921185] usb 1-2.4.2: Product: SimuCUBE
>> [ 3271.921186] usb 1-2.4.2: Manufacturer: Granite Devices
>> [ 3271.921187] usb 1-2.4.2: SerialNumber: 0123456789
>> [ 3281.943990] input: Granite Devices SimuCUBE as /devices/pci0000:00/0000:00:09.0/0000:04:00.0/usb1/1-2/1-2.4/1-2.4.2/1-2.4.2:1.0/0003:16D0:0D5A.0016/input/input48
>> [ 3281.944223] hid-generic 0003:16D0:0D5A.0016: unknown set_effect report layout
>> [ 3281.944228] hid-generic 0003:16D0:0D5A.0016: input,hiddev2,hidraw15: USB HID v1.11 Joystick [Granite Devices SimuCUBE] on usb-0000:04:00.0-2.4.2/input0
>>
>> I spent some time looking at the code and also other ffb code in usbhid, but since I'm not really familiar with C I have a hard time figuring out why it doesn't work out of the box and how to fix this, but I'd be happy to help implementing/debugging it.
>> For a start, it would be really nice to find out what is reported, what the report should look like and why it doesn't match.
> Hi,
>
> 1. this eport is more appropriate for linux-input. You should put it
> into CC
Greg told me to write to this list, but I'll CC them.
> 3. Your lsusb is incomplete (likely you need to run it as root), so
> nobody can say what's wrong with your descriptors.
I ran the command (lsusb -v -s 003:010) again as root, but the output remains 
the same, especially the messages

can't get device qualifier: Resource temporarily unavailable
can't get debug descriptor: Resource temporarily unavailable

remain.

Kind Regards,
Bernd
