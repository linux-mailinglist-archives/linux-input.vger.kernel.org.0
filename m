Return-Path: <linux-input+bounces-15965-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFB1C4496F
	for <lists+linux-input@lfdr.de>; Sun, 09 Nov 2025 23:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A5863AE5DA
	for <lists+linux-input@lfdr.de>; Sun,  9 Nov 2025 22:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE6C20B80B;
	Sun,  9 Nov 2025 22:49:35 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B1F1D5141;
	Sun,  9 Nov 2025 22:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762728575; cv=none; b=sZHnIW0F2Lg411C8gSkYkhwnm9yB1FQXgn1o5UqD7DFXbxy2oNHEd+UB8S928Yr9qxYqZCSoPAr5KhlVYsHPzKnfP107tvBc3kTtc8J9Fj1sj1alcuatZbVLhELIuF0nxkmAxW6XwL+ufVwzL75mW30ng7E5Uk25uRV4zOdnY6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762728575; c=relaxed/simple;
	bh=uwBL/ckh54wPFSJoDhOQcB6Za82EXbOHlgWBVV3KuMI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gS5a/Ns6qV5NADiBcXWv0yjMsr8Dw4SzFEKqX/j2cgMlra3RoKt/zi/J9u9qOhYAWb04RvZUbOE+8OUInl2GzJXdPt0Oh1xEk0Q7tEdOsuKi+Dcr64y5smHj76BWxjuaVlP0X4sH2kZE4rbE9keKVPAdtPaFOqefyOfyCQ/nXYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 531121D861DE;
	Sun,  9 Nov 2025 14:49:25 -0800 (PST)
Message-ID: <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
Date: Sun, 9 Nov 2025 14:49:23 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: The-Luga <lugathe2@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>,
 Terry Junge <linuxsound@cosmicgizmosystems.com>,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org
References: <3eb2564d-5008-434e-9698-99b0cbe4d1cc@cosmicgizmosystems.com>
 <CALvgqECkMdntW2He8C7EcvOtCL-PpiXM9xNXWHzGtgimDxezHA@mail.gmail.com>
 <d7e888a6-6a65-40c1-84af-058b97ca0178@rowland.harvard.edu>
 <CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>
 <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
 <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
 <20251109092450.693bcbe5.michal.pecio@gmail.com>
 <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>
 <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/2025 2:17 PM, The-Luga wrote:
>> But never mind that.  Try using the usbhid-dump program instead of
>> lsusb.  usbhid-dump does not require you to unbind anything or change
>> bConfigurationValue, so it's easier to use anyway.
> 
>> sudo usbhid-dump -d 2d99:a101
> 003:002:003:DESCRIPTOR         1762723663.045959
> 06 13 FF 09 01 A1 01 15 00 26 FF 00 85 06 09 00
> 75 08 95 3D 91 02 85 07 09 00 75 08 95 3D 81 02
> C0 06 14 FF 09 01 A1 01 15 00 26 FF 00 85 2E 09
> 00 75 08 95 3F 91 02 85 2F 09 00 75 08 95 3F 81
> 02 C0

Second HID Interface (Interface 3)

06 13 ff Vendor Page ff13
09 01    Usage 1
a1 01    Application Collection
15 00    Logical Min 0
26 ff 00 Logical Max 255
85 06    Report ID 6
09 00    Usage 0
75 08    Report Size 8
95 3d    Report Count 61
91 02    Output
85 07    Report ID 7
09 00    Usage 0
75 08    Report Size 8
95 3d    Report Count 61
81 02    Input
c0       End Collection
06 14 ff Vendor Page ff14
09 01    Usage 1
a1 01    Application Collection
15 00    Logical Min 0
26 ff 00 Logical Max 255
85 2e    Report Id 2E
09 00    Usage 0
75 08    Report Size 8
95 3f    Report Count 63
91 02    Output
85 2f    Report Id 2F
09 00    Usage 0
75 08    Report Size 8
95 3f    Report Count 63
81 02    Input
c0       End Collection

Two collections, both vendor unique.
Basically HID 'pipes' to transport vendor unique data.
We have only seen traces with input report ID 2F so far.
If we could get traces of output report ID 2E from Windows running the 
vendor's software (TempoHub) it might help.

I wonder if suspend/resume would be a problem. Maybe the device crashes 
when it attempts to resume?
Windows will not suspend this device because it has a Consumer Control
application collection.

Is there a USB quirk to stop the kernel from suspending the device?

> 
> 003:002:002:DESCRIPTOR         1762723663.048968
> 05 0C 09 01 A1 01 15 00 25 01 09 E9 09 EA 09 E2
> 09 CD 09 B5 09 B6 09 B3 09 B7 75 01 95 08 81 42
> C0
> 

First HID Interface (Interface 2)

05 0c Consumer Page
09 01 Consumer Control
a1 01 Application Collection
15 00 Logical Min 0
25 01 Logical Max 1
09 e9 Volume Up
09 ea Volume Down
09 e2 Mute
09 cd Play/Pause
09 b5 Scan Next Track
09 b6 Scan Previous Track
09 b3 Fast Forward
09 b7 Stop
75 01 Report Size 1
95 08 Report Count 8
81 42 Input
c0    End Collection

1 = up
2 = down
4 = mute
8 = play/pause
16 = scan next
32 = scan prev
64 = fast forward
128 = stop

One byte, no report ID


