Return-Path: <linux-input+bounces-12375-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF974AB7D81
	for <lists+linux-input@lfdr.de>; Thu, 15 May 2025 08:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9D6A7A4096
	for <lists+linux-input@lfdr.de>; Thu, 15 May 2025 06:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00AF1AA795;
	Thu, 15 May 2025 06:04:08 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BF3DDC5
	for <linux-input@vger.kernel.org>; Thu, 15 May 2025 06:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747289048; cv=none; b=lrqBUMHVcUPRfp33gJ2Kpuzw7k2yh+U1KBpGZ7iYUSOV9RmfXyD616krNE9p6U7dQUEzh3SGW4kwlBiIt54q7v1FXzY2eHsi9XOum/tSbHE9hLSReuO3eHeE+6Douzp5OPXv2PttVaoKjKmv3hyn9JN4OaFQ0gsh7xUrhvML4yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747289048; c=relaxed/simple;
	bh=6gMR316jA1yAeo7zaam5h82wphrxuod8maDjTLO4fI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6IAVUr7gqsd3oB0bj6oqheEqEDvL52y92c9NtC6VQTyV8u2XvwZMfxLfyMp6AVLjf8M71Lv3ZocdxuiR/PcM9Kb87PAwD/yXIsCWT+oaIorj5VFDc9GOMoadiQ7f5BA7Eonh/IkMSJFl1akTpPWUkcdRT1wexXkiIyKnfBfusw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 638B21CDCDB6;
	Wed, 14 May 2025 22:57:16 -0700 (PDT)
Message-ID: <cd721e5b-6306-49ca-8575-5845af78f05b@cosmicgizmosystems.com>
Date: Wed, 14 May 2025 22:57:13 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_Rakk_Dasig_X_mouse_=28248a=3A8266=29_=E2=80=93_side?=
 =?UTF-8?Q?_buttons_not_exposed_via_evdev?=
To: Keenplify <keenplify@gmail.com>, linux-input@vger.kernel.org
Cc: jikos@kernel.org
References: <CANTHs-61C+S01crRDHYvS8Sa-mxtG1TeAszc+_PjN9aV4s6-GA@mail.gmail.com>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <CANTHs-61C+S01crRDHYvS8Sa-mxtG1TeAszc+_PjN9aV4s6-GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/14/25 2:10 PM, Keenplify wrote:
> Hi all,
> 
> I'm reporting an issue with the Rakk Dasig X mouse (VID:PID 248a:8266), where the side buttons (forward/back) are not generating any evdev input events under Linux (tested on Fedora 42, kernel 6.14.5).
> 
> The buttons appear to be sending HID events, which I confirmed using `hid-recorder` from `hid-tools`, but they do not show up in `evtest` or produce mappable input events.
> 

The problem is in the report descriptor, here is the chunk that declares the button usages that are sent in report ID 1 (the report that is being sent when you press the buttons that are not being mapped).

# 0x85, 0x01,  //  Report ID (1)
# 0x09, 0x01,  //  Usage (Pointer)
# 0xa1, 0x00,  //  Collection (Physical)
# 0x05, 0x09,  //   Usage Page (Button)
# 0x19, 0x01,  //   Usage Minimum (1)     - usages from Button1 through Button3
# 0x29, 0x03,  //   Usage Maximum (3)     - if this was a 5 instead of a 3 the other 2 buttons would map
# 0x15, 0x00,  //   Logical Minimum (0)
# 0x25, 0x01,  //   Logical Maximum (1)
# 0x75, 0x01,  //   Report Size (1)
# 0x95, 0x05,  //   Report Count (5)      - 5 buttons but only 3 have usages associated
# 0x81, 0x02,  //   Input (Data,Var,Abs)
# 0x75, 0x03,  //   Report Size (3)       - 
# 0x95, 0x01,  //   Report Count (1)
# 0x81, 0x01,  //   Input (Cnst,Arr,Abs)

> I have attached the output of my HID recorder. The output shows that the mouse is sending usage values 0x08 and 0x10 in the second byte of the report, but the kernel does not seem to map them into usable buttons (BTN_EXTRA / BTN_SIDE, etc.).

So the usages map to the bits in that second byte as follows

0x00 - no button pressed
0x01 - Button Page : Button 1 pressed
0x02 - Button Page : Button 2 pressed
0x04 - Button Page : Button 3 pressed
0x08 - no Usage associated with this bit
0x10 - no Usage associated with this bit

> 
> Relevant device info:
> 
> - Mouse: Rakk Dasig X
> - Vendor/Product ID: 248a:8266 (Bluetooth), 248a:fa02 (USB wireless)
> - Driver: hid-generic
> - Kernel: 6.14.5-300.fc42.x86_64 (Fedora 42)
> - dmesg (Bluetooth):
>     hid-generic 0005:248A:8266.000B: input,hidraw0: BLUETOOTH HID v0.01 Mouse [RAKK Dasig X] on 14:ac:60:c9:09:54
> 
> I’ve filed an upstream bug here with more details:
> https://bugzilla.kernel.org/show_bug.cgi?id=220126 <https://bugzilla.kernel.org/show_bug.cgi?id=220126>
> 
> Happy to provide a `lsusb -v`, full `hid-recorder` output, or test patches if needed. Is a HID quirk appropriate in this case?

I don't think there is any simple generic quirk that can fix this. There are methods available that allow fixing defective report descriptors before they are parsed by the core but it's not as simple as flipping a quirk bit.

Regards,
Terry

> 
> Thanks a lot,  
> keenplify
> 


