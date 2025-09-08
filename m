Return-Path: <linux-input+bounces-14541-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E05B4888E
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 11:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AC841695C1
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 09:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5AC211A28;
	Mon,  8 Sep 2025 09:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b="SKMRfEgq"
X-Original-To: linux-input@vger.kernel.org
Received: from sv9.manufrog.com (sv9.manufrog.com [46.246.119.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182A628371;
	Mon,  8 Sep 2025 09:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.246.119.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757323960; cv=none; b=ZG7L+/65wv6AzZ0BA71ChiWFs3H3N1n3FRXoADjnEBz7kaAdb3y5BrXavSBh2TnC9QgQ/ZsdbQoD0EclcmH8gTz8U8BDkSPImys61ZzcSNCuF20rzReJyOCY82zf+Qsncnki5i3ar8bUJQEd3ppgrE2VKC8SPaferWTBJLP+I0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757323960; c=relaxed/simple;
	bh=Xv2WtFx5M5Q0O07BJ1lWyvOu7FXP0hW+7U7ldmm3q+I=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=GwEldtzKkel8CtfAkvmDN3WILqH4D2vkzc2OLqPDYPGoQFfrDT0s9pphbPctbVw7YQ9cGw1QAnlGNkF81eAAUKA79t5+SfoT9IdyNj+AVMr4pSLO3rUsoaDgXm7u5O+e3sJhuxla1/QjeMJBrl0Lo4IykagAdScSK+cd2ytSrVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se; spf=pass smtp.mailfrom=oscillator.se; dkim=pass (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b=SKMRfEgq; arc=none smtp.client-ip=46.246.119.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oscillator.se
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oscillator.se; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2sfTPS3cy86gbOrA4i8wktc/s+JczGbwkiao2CD9JN0=; b=SKMRfEgqv07L07li6YgRMeWfTF
	ZqhZ2OUi286BthCnwbyphCaBqztY0rnwqo0rw7Tf2meENITrqmZHr779OB0r1tPH5iUknEQ9YHljV
	/TwiUDO7eKnkGH/7UkVUoLm3ezAtm9POGTj+ZjtTWX7URYpdAVpfOHYM2BdBO156RxAVTANs3tSjD
	mDSZI4CJLu7zGhV5Kp+h5soElIgrjcVdYDLETt9qLiyzCLyWZergaraCvSe3KNdE2asDDncsRnaG1
	MdDHpr1AJaf9fOsS2cFFsX3QIuggHQcWPgb4PvufmFDL1LH08aqDQkESbrF8C+fc1IUoee3Q5Sk8o
	GGqRuDTQ==;
Received: from [::1] (port=34890 helo=sv9.manufrog.com)
	by sv9.manufrog.com with esmtpa (Exim 4.98.2)
	(envelope-from <staffan.melin@oscillator.se>)
	id 1uvXjk-00000004UvZ-0kAn;
	Mon, 08 Sep 2025 11:00:32 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 08 Sep 2025 11:00:29 +0200
From: Staffan Melin <staffan.melin@oscillator.se>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: Salvatore Bonaccorso <carnil@debian.org>, Zhang Heng
 <zhangheng@kylinos.cn>, Jiri Kosina <jkosina@suse.com>, Benjamin Tissoires
 <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, 1114557@bugs.debian.org
Subject: Re: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
In-Reply-To: <36f58d1b-8afe-4895-bef6-59edc791ef0d@cosmicgizmosystems.com>
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
 <36f58d1b-8afe-4895-bef6-59edc791ef0d@cosmicgizmosystems.com>
User-Agent: Roundcube Webmail/1.6.11
Message-ID: <a96b110b6b6d9a74506f1cc27cd44b49@oscillator.se>
X-Sender: staffan.melin@oscillator.se
Organization: Oscillator
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - sv9.manufrog.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oscillator.se
X-Get-Message-Sender-Via: sv9.manufrog.com: authenticated_id: staffan.melin@oscillator.se
X-Authenticated-Sender: sv9.manufrog.com: staffan.melin@oscillator.se
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Terry,

I am the one with the Jieli touchscreen.

On 2025-09-08 06:10, Terry Junge wrote:
> 
> The root of the issue here is that two devices have bootlegged the same 
> VID:PID.
> 
> 0x4c4a is not a valid VID that has been assigned according to the 
> latest list from USBIF (vendor_ids072325_1.pdf) so conflicts like this 
> could surface at any time.
> 
> [   10.188336] usb 3-3: device descriptor read/64, error -71
> [   10.439533] usb 3-3: config 1 interface 0 altsetting 0 has 2 
> endpoint descriptors, different from the interface descriptor's value: 
> 1
> [   10.451534] usb 3-3: New USB device found, idVendor=4c4a, 
> idProduct=4155, bcdDevice= 1.00
> [   10.451540] usb 3-3: New USB device strings: Mfr=1, Product=2, 
> SerialNumber=3
> [   10.451543] usb 3-3: Product: USB Composite Device
> [   10.451545] usb 3-3: Manufacturer: Jieli Technology
> [   10.451546] usb 3-3: SerialNumber: FFFFFFFFFFFFFFFF
> 
> Can anyone supply the Jieli descriptors, including the Report 
> Descriptor? It clearly has problems but not bad enough to fail 
> enumeration.
> 
> The commit 1a8953f4f774 should be reverted and SMARTLINKTECHNOLOGY 
> should either bootleg a different PID, get a valid VID, or fix their 
> device so a quirk is never required.
> 
> Thanks,
> Terry

In /sys/bus/hid/devices/0003:4C4A:4155.0003 i have the report_descriptor 
file:

00000000  05 0d 09 04 a1 01 85 aa  09 22 a1 00 09 42 15 00  
|........."...B..|
00000010  25 01 75 01 95 01 81 02  75 03 81 03 09 51 75 04  
|%.u.....u....Qu.|
00000020  25 0a 81 02 75 08 95 01  81 03 05 01 75 10 55 00  
|%...u.......u.U.|
00000030  65 00 09 30 35 00 26 00  10 46 00 10 81 02 09 31  
|e..05.&..F.....1|
00000040  26 00 10 46 00 10 81 02  c0 a1 00 05 0d 09 42 15  
|&..F..........B.|
00000050  00 25 01 75 01 95 01 81  02 75 03 81 03 09 51 75  
|.%.u.....u....Qu|
00000060  04 25 0a 81 02 75 08 95  01 81 03 05 01 75 10 55  
|.%...u.......u.U|
00000070  00 65 00 09 30 35 00 26  00 10 46 00 10 81 02 09  
|.e..05.&..F.....|
00000080  31 26 00 10 46 00 10 81  02 c0 a1 00 05 0d 09 42  
|1&..F..........B|
00000090  15 00 25 01 75 01 95 01  81 02 75 03 81 03 09 51  
|..%.u.....u....Q|
000000a0  75 04 25 0a 81 02 75 08  95 01 81 03 05 01 75 10  
|u.%...u.......u.|
000000b0  55 00 65 00 09 30 35 00  26 00 10 46 00 10 81 02  
|U.e..05.&..F....|
000000c0  09 31 26 00 10 46 00 10  81 02 c0 a1 00 05 0d 09  
|.1&..F..........|
000000d0  42 15 00 25 01 75 01 95  01 81 02 75 03 81 03 09  
|B..%.u.....u....|
000000e0  51 75 04 25 0a 81 02 75  08 95 01 81 03 05 01 75  
|Qu.%...u.......u|
000000f0  10 55 00 65 00 09 30 35  00 26 00 10 46 00 10 81  
|.U.e..05.&..F...|
00000100  02 09 31 26 00 10 46 00  10 81 02 c0 a1 00 05 0d  
|..1&..F.........|
00000110  09 42 15 00 25 01 75 01  95 01 81 02 75 03 81 03  
|.B..%.u.....u...|
00000120  09 51 75 04 25 0a 81 02  75 08 95 01 81 03 05 01  
|.Qu.%...u.......|
00000130  75 10 55 00 65 00 09 30  35 00 26 00 10 46 00 10  
|u.U.e..05.&..F..|
00000140  81 02 09 31 26 00 10 46  00 10 81 02 c0 05 0d 09  
|...1&..F........|
00000150  54 95 01 75 08 15 00 25  0a 81 02 09 55 b1 02 95  
|T..u...%....U...|
00000160  3e b1 03 c0 05 0d 09 02  a1 01 85 cc 09 20 a1 00  
|>............ ..|
00000170  09 42 09 44 09 3c 09 45  15 00 25 01 75 01 95 04  
|.B.D.<.E..%.u...|
00000180  81 02 95 01 09 32 81 02  95 03 81 03 05 01 09 30  
|.....2.........0|
00000190  75 10 95 01 a4 55 0d 65  13 35 00 26 00 10 46 00  
|u....U.e.5.&..F.|
000001a0  10 81 02 09 31 26 00 10  46 00 10 81 02 b4 05 0d  
|....1&..F.......|
000001b0  09 30 26 ff 00 81 02 75  08 09 3d 15 81 25 7f 81  
|.0&....u..=..%..|
000001c0  02 09 3e 15 81 25 7f 81  02 c0 c0 05 01 09 02 a1  
|..>..%..........|
000001d0  01 85 58 09 01 a1 00 05  09 19 01 29 02 15 00 25  
|..X........)...%|
000001e0  01 75 01 95 02 81 02 95  06 81 03 05 01 09 30 15  
|.u............0.|
000001f0  00 26 00 10 09 31 26 00  10 75 10 95 02 55 0e 65  
|.&...1&..u...U.e|
00000200  11 35 00 46 00 10 81 02  09 38 15 81 25 7f 75 08  
|.5.F.....8..%.u.|
00000210  95 01 81 06 c0 c0                                 |......|

And here is the output from lsusb -c:

Bus 003 Device 003: ID 4c4a:4155 Jieli Technology USB Composite Device
Couldn't open device, some information will be missing
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               1.10
   bDeviceClass            0 [unknown]
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x4c4a Jieli Technology
   idProduct          0x4155 USB Composite Device
   bcdDevice            1.00
   iManufacturer           1 Jieli Technology
   iProduct                2 USB Composite Device
   iSerial                 3 FFFFFFFFFFFFFFFF
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0029
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup
     MaxPower              100mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         3 Human Interface Device
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0
       iInterface              0
         HID Device Descriptor:
           bLength                 9
           bDescriptorType        33
           bcdHID               1.10
           bCountryCode           33 Unknown
           bNumDescriptors         1
           bDescriptorType        34 (null)
           wDescriptorLength     534
           Report Descriptors:
             ** UNAVAILABLE **
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0020  1x 32 bytes
         bInterval               1

Best regards,

Staffan



> 
>> The issue is not specific to the 6.12.y series and confirmed in 6.16.3
>> as well.
>> 
>> Staffan Melin did bisect the kernels between 6.12.38 (which was still
>> working) and 6.1.41 (which was not), confirming by bisection that the
>> offending commit is
>> 
>> 1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY")
>> 
>> #regzbot introduced: 1a8953f4f774
>> #regzbot monitor: https://bugs.debian.org/1114557
>> 
>> So it looks that the quirk applied is unfortunately affecting
>> negatively as well Staffan Melin case.
>> 
>> Can you have a look?
>> 
>> Regards,
>> Salvatore
>> 

