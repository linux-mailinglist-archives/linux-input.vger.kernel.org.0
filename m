Return-Path: <linux-input+bounces-6845-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB384988E62
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 10:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9CD91C2074F
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 08:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD48619DF7D;
	Sat, 28 Sep 2024 08:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="GLYbueiX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E762E12E75;
	Sat, 28 Sep 2024 08:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727511002; cv=none; b=NZZo687MEHDU16EvWu6xQ0/ojq2fE/ZckNwAwv/dwNiAz+Bt4q3AzUW7ywxXRww7LARlcFlE9itz2OEfIQgqsZ4AE/G8CGnuspl5cLyxxpdJqRB/dGRs7uV6i8P3RpmlAdh9hXz5Ydt2EsfzCz1tqma69R5sL7YY1fEYlDrAlL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727511002; c=relaxed/simple;
	bh=iu6I1pEER18gkYltqpNmLsWnvKL2Oh7Df3buac0pxBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODvYzqqgp0pE01Uzn0dvsl1tZql8ZbHXQNNCIFpk4/AczChK+LQ34R+WdZQ7XWdvnz4cDUMZKB9yBGlcjaVPpmd0P/WK4y5Xt3ogYMhokSHBUSlnw5/jyMdib9gkeuKR+9llppy5174Mo8/2SC/kr/mEH5tgAHEBYGwYR3x5Pl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=GLYbueiX; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.27] (pd9e59da1.dip0.t-ipconnect.de [217.229.157.161])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 7C6572FC004A;
	Sat, 28 Sep 2024 10:09:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1727510995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXF2Rfp/D7Y5U1chszwVn/x/l7zhfhqH71bZZweCGWM=;
	b=GLYbueiX1VemSKa45O7Xs1u/U+9sZDLsn6kWrDPDLDff9JQ8vZJ4hM+Mi4BiSVuP8U9o4K
	HnWifm4sWYTGbzvU4F4FtxpoXxPQLiVAHQdwiisUV0CGI4g1OuPkmboP3sx4M3WPkan9vw
	gGs1ycW265zZBXHehblQZEm9fFAsR/c=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <140536e2-28bd-429f-a439-04e6a7ae3e58@tuxedocomputers.com>
Date: Sat, 28 Sep 2024 10:09:55 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Armin Wolf <W_Armin@gmx.de>, Pavel Machek <pavel@ucw.cz>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 bentiss@kernel.org, dri-devel@lists.freedesktop.org, jelle@vdwaa.nl,
 jikos@kernel.org, lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 platform-driver-x86@vger.kernel.org
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <20240926174405.110748-2-wse@tuxedocomputers.com>
 <ZvcdNXQJmc8cjifw@amd.ucw.cz> <bea39077-6104-4b59-8757-9cbe0e703e5c@gmx.de>
Content-Language: de-DE
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <bea39077-6104-4b59-8757-9cbe0e703e5c@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 28.09.24 um 00:21 schrieb Armin Wolf:
> Am 27.09.24 um 23:01 schrieb Pavel Machek:
>
>> Hi!
>>
>>> The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a 
>>> per-key
>>> controllable RGB keyboard backlight. The firmware API for it is 
>>> implemented
>>> via WMI.
>> Ok.
>>
>>> To make the backlight userspace configurable this driver emulates a
>>> LampArray HID device and translates the input from hidraw to the
>>> corresponding WMI calls. This is a new approach as the leds 
>>> subsystem lacks
>>> a suitable UAPI for per-key keyboard backlights, and like this no 
>>> new UAPI
>>> needs to be established.
>> Please don't.
>>
>> a) I don't believe emulating crazy HID interface si right thing to
>> do. (Ton of magic constants. IIRC it stores key positions with
>> micrometer accuracy or something that crazy. How is userland going to
>> use this? Will we update micrometers for every single machine?)
>>
>> Even if it is,
>>
>> b) The emulation should go to generic layer, it is not specific to
>> your hardware.
>>
> Maybe introducing a misc-device which provides an ioctl-based API similar
> to the HID LampArray would be a solution?
>
> Basically we would need:
> - ioctl for querying the supported LEDs and their properties
> - ioctl for enabling/disabling autonomous mode
> - ioctl for updating a range of LEDs
> - ioctl for updating multiple LEDs at once
>
> If we implement this as a separate subsystem ("illumination 
> subsystem"), then different
> drivers could use this. This would also allow us to add additional 
> ioctl calls later
> for more features.

We went over this in the past discussion, the conclusion was iirc that 
we are just wraping hidraw ioctls in other ioctls with no added benefit.

For reference 
https://lore.kernel.org/all/20231011190017.1230898-1-wse@tuxedocomputers.com/

I don't know the exact message anymore, but if relevant I can dig for it 
(it's a over 5 month long e-mail thread).

And we would need to write code to apply this wrapper to devices 
implementing LampArray in firmware.

Regards,

Werner

>
> Thanks,
> Armin Wolf
>
>>> +
>>> +// We don't know if the WMI API is stable and how unique the GUID 
>>> is for this ODM. To be on the safe
>>> +// side we therefore only run this driver on tested devices defined 
>>> by this list.
>> 80 columns, /* */ is usual comment style.
>>
>> To illustrate my point... this is crazy:
>>
>> (and would require equally crazy par in openrgb to parse).
>>
>> Best regards,
>>                                 Pavel
>>
>>> +
>>> +static const uint8_t sirius_16_ansii_kbl_mapping[] = {
>>> +    0x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42,
>>> +    0x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,   0x4a, 0x4d, 0x4b, 0x4e,
>>> +    0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
>>> +    0x27, 0x2d, 0x2e, 0x2a,               0x53, 0x55, 0x54, 0x56,
>>> +    0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12,
>>> +    0x13, 0x2f, 0x30, 0x31,               0x5f, 0x60, 0x61,
>>> +    0x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f,
>>> +    0x33, 0x34, 0x28,                     0x5c, 0x5d, 0x5e, 0x57,
>>> +    0xe1, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36, 0x37,
>>> +    0x38, 0xe5, 0x52,                     0x59, 0x5a, 0x5b,
>>> +    0xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x51,
>>> +    0x4f,                                 0x62, 0x63, 0x58
>>> +};
>>> +
>>> +static const uint32_t sirius_16_ansii_kbl_mapping_pos_x[] = {
>>> +     25000,  41700,  58400,  75100,  91800, 108500, 125200, 141900, 
>>> 158600, 175300,
>>> +    192000, 208700, 225400, 242100, 258800, 275500,   294500, 
>>> 311200, 327900, 344600,
>>> +     24500,  42500,  61000,  79500,  98000, 116500, 135000, 153500, 
>>> 172000, 190500,
>>> +    209000, 227500, 246000, 269500,                   294500, 
>>> 311200, 327900, 344600,
>>> +     31000,  51500,  70000,  88500, 107000, 125500, 144000, 162500, 
>>> 181000, 199500,
>>> +    218000, 236500, 255000, 273500,                   294500, 
>>> 311200, 327900,
>>> +     33000,  57000,  75500,  94000, 112500, 131000, 149500, 168000, 
>>> 186500, 205000,
>>> +    223500, 242000, 267500,                           294500, 
>>> 311200, 327900, 344600,
>>> +     37000,  66000,  84500, 103000, 121500, 140000, 158500, 177000, 
>>> 195500, 214000,
>>> +    232500, 251500, 273500,                           294500, 
>>> 311200, 327900,
>>> +     28000,  47500,  66000,  84500, 140000, 195500, 214000, 234000, 
>>> 255000, 273500,
>>> +    292000,                                           311200, 
>>> 327900, 344600
>>> +};
>>> +
>>> +static const uint32_t sirius_16_ansii_kbl_mapping_pos_y[] = {
>>> +     53000,  53000,  53000,  53000,  53000,  53000,  53000, 53000,  
>>> 53000,  53000,
>>> +     53000,  53000,  53000,  53000,  53000,  53000, 53000,  53000,  
>>> 53000,  53000,
>>> +     67500,  67500,  67500,  67500,  67500,  67500,  67500, 67500,  
>>> 67500,  67500,
>>> +     67500,  67500,  67500,  67500, 67500,  67500,  67500,  67500,
>>> +     85500,  85500,  85500,  85500,  85500,  85500,  85500, 85500,  
>>> 85500,  85500,
>>> +     85500,  85500,  85500,  85500, 85500,  85500,  85500,
>>> +    103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 
>>> 103500, 103500,
>>> +    103500, 103500, 103500,                           103500, 
>>> 103500, 103500,  94500,
>>> +    121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 
>>> 121500, 121500,
>>> +    121500, 121500, 129000,                           121500, 
>>> 121500, 121500,
>>> +    139500, 139500, 139500, 139500, 139500, 139500, 139500, 139500, 
>>> 147000, 147000,
>>> +    147000,                                           139500, 
>>> 139500, 130500
>>> +};
>>> +
>>> +static const uint32_t sirius_16_ansii_kbl_mapping_pos_z[] = {
>>> +      5000,   5000,   5000,   5000,   5000,   5000,   5000, 5000,   
>>> 5000,   5000,
>>> +      5000,   5000,   5000,   5000,   5000,   5000, 5000,   5000,   
>>> 5000,   5000,
>>> +      5250,   5250,   5250,   5250,   5250,   5250,   5250, 5250,   
>>> 5250,   5250,
>>> +      5250,   5250,   5250,   5250, 5250,   5250,   5250,   5250,
>>> +      5500,   5500,   5500,   5500,   5500,   5500,   5500, 5500,   
>>> 5500,   5500,
>>> +      5500,   5500,   5500,   5500, 5500,   5500,   5500,
>>> +      5750,   5750,   5750,   5750,   5750,   5750,   5750, 5750,   
>>> 5750,   5750,
>>> +      5750,   5750,   5750, 5750,   5750,   5750,   5625,
>>> +      6000,   6000,   6000,   6000,   6000,   6000,   6000, 6000,   
>>> 6000,   6000,
>>> +      6000,   6000,   6125, 6000,   6000,   6000,
>>> +      6250,   6250,   6250,   6250,   6250,   6250,   6250, 6250,   
>>> 6375,   6375,
>>> +      6375, 6250,   6250,   6125
>>> +};
>>> +
>>> +static const uint8_t sirius_16_iso_kbl_mapping[] = {
>>> +    0x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42,
>>> +    0x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,   0x4a, 0x4d, 0x4b, 0x4e,
>>> +    0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
>>> +    0x27, 0x2d, 0x2e, 0x2a,               0x53, 0x55, 0x54, 0x56,
>>> +    0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12,
>>> +    0x13, 0x2f, 0x30,                     0x5f, 0x60, 0x61,
>>> +    0x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f,
>>> +    0x33, 0x34, 0x32, 0x28,               0x5c, 0x5d, 0x5e, 0x57,
>>> +    0xe1, 0x64, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36,
>>> +    0x37, 0x38, 0xe5, 0x52,               0x59, 0x5a, 0x5b,
>>> +    0xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x51,
>>> +    0x4f,                                 0x62, 0x63, 0x58
>>> +};
>>> +
>>> +static const uint32_t sirius_16_iso_kbl_mapping_pos_x[] = {
>>> +     25000,  41700,  58400,  75100,  91800, 108500, 125200, 141900, 
>>> 158600, 175300,
>>> +    192000, 208700, 225400, 242100, 258800, 275500,   294500, 
>>> 311200, 327900, 344600,
>>> +     24500,  42500,  61000,  79500,  98000, 116500, 135000, 153500, 
>>> 172000, 190500,
>>> +    209000, 227500, 246000, 269500,                   294500, 
>>> 311200, 327900, 344600,
>>> +     31000,  51500,  70000,  88500, 107000, 125500, 144000, 162500, 
>>> 181000, 199500,
>>> +    218000, 234500, 251000,                           294500, 
>>> 311200, 327900,
>>> +     33000,  57000,  75500,  94000, 112500, 131000, 149500, 168000, 
>>> 186500, 205000,
>>> +    223500, 240000, 256500, 271500,                   294500, 
>>> 311200, 327900, 344600,
>>> +     28000,  47500,  66000,  84500, 103000, 121500, 140000, 158500, 
>>> 177000, 195500,
>>> +    214000, 232500, 251500, 273500,                   294500, 
>>> 311200, 327900,
>>> +     28000,  47500,  66000,  84500, 140000, 195500, 214000, 234000, 
>>> 255000, 273500,
>>> +    292000,                                           311200, 
>>> 327900, 344600
>>> +};
>>> +
>>> +static const uint32_t sirius_16_iso_kbl_mapping_pos_y[] = {
>>> +     53000,  53000,  53000,  53000,  53000,  53000,  53000, 53000,  
>>> 53000,  53000,
>>> +     53000,  53000,  53000,  53000,  53000,  53000, 53000,  53000,  
>>> 53000,  53000,
>>> +     67500,  67500,  67500,  67500,  67500,  67500,  67500, 67500,  
>>> 67500,  67500,
>>> +     67500,  67500,  67500,  67500, 67500,  67500,  67500,  67500,
>>> +     85500,  85500,  85500,  85500,  85500,  85500,  85500, 85500,  
>>> 85500,  85500,
>>> +     85500,  85500,  85500, 85500,  85500,  85500,
>>> +    103500, 103500, 103500, 103500, 103500, 103500, 103500, 103500, 
>>> 103500, 103500,
>>> +    103500, 103500, 103500,  94500,                   103500, 
>>> 103500, 103500,  94500,
>>> +    121500, 121500, 121500, 121500, 121500, 121500, 121500, 121500, 
>>> 121500, 121500,
>>> +    121500, 121500, 121500, 129000,                   121500, 
>>> 121500, 121500,
>>> +    139500, 139500, 139500, 139500, 139500, 139500, 139500, 139500, 
>>> 147000, 147000,
>>> +    147000,                                           139500, 
>>> 139500, 130500
>>> +};
>>> +
>>> +static const uint32_t sirius_16_iso_kbl_mapping_pos_z[] = {
>>> +      5000,   5000,   5000,   5000,   5000,   5000,   5000, 5000,   
>>> 5000,   5000,
>>> +      5000,   5000,   5000,   5000, 5000, 5000, 5000,   5000,   
>>> 5000,   5000,
>>> +      5250,   5250,   5250,   5250,   5250,   5250,   5250, 5250,   
>>> 5250,   5250,
>>> +      5250,   5250,   5250,   5250, 5250,   5250,   5250,   5250,
>>> +      5500,   5500,   5500,   5500,   5500,   5500,   5500, 5500,   
>>> 5500,   5500,
>>> +      5500,   5500,   5500, 5500,   5500,   5500,
>>> +      5750,   5750,   5750,   5750,   5750,   5750,   5750, 5750,   
>>> 5750,   5750,
>>> +      5750,   5750,   5750,   5750, 5750,   5750,   5750,   5625,
>>> +      6000,   6000,   6000,   6000,   6000,   6000,   6000, 6000,   
>>> 6000,   6000,
>>> +      6000,   6000,   6000,   6125, 6000,   6000,   6000,
>>> +      6250,   6250,   6250,   6250,   6250,   6250,   6250, 6250,   
>>> 6375,   6375,
>>> +      6375, 6250,   6250,   6125
>>> +};
>> ...
>>> +
>>> +static uint8_t report_descriptor[327] = {
>>> +    0x05, 0x59,            // Usage Page (Lighting and Illumination)
>>> +    0x09, 0x01,            // Usage (Lamp Array)
>>> +    0xa1, 0x01,            // Collection (Application)
>>> +    0x85, LAMP_ARRAY_ATTRIBUTES_REPORT_ID, //  Report ID (1)
>>> +    0x09, 0x02,            //  Usage (Lamp Array Attributes Report)
>>> +    0xa1, 0x02,            //  Collection (Logical)
>>> +    0x09, 0x03,            //   Usage (Lamp Count)
>>> +    0x15, 0x00,            //   Logical Minimum (0)
>>> +    0x27, 0xff, 0xff, 0x00, 0x00,    //   Logical Maximum (65535)
>>> +    0x75, 0x10,            //   Report Size (16)
>>> +    0x95, 0x01,            //   Report Count (1)
>>> +    0xb1, 0x03,            //   Feature (Cnst,Var,Abs)
>>> +    0x09, 0x04,            //   Usage (Bounding Box Width In 
>>> Micrometers)
>>> +    0x09, 0x05,            //   Usage (Bounding Box Height In 
>>> Micrometers)
>>> +    0x09, 0x06,            //   Usage (Bounding Box Depth In 
>>> Micrometers)
>>> +    0x09, 0x07,            //   Usage (Lamp Array Kind)
>>> +    0x09, 0x08,            //   Usage (Min Update Interval In 
>>> Microseconds)
>>> +    0x15, 0x00,            //   Logical Minimum (0)
>>> +    0x27, 0xff, 0xff, 0xff, 0x7f,    //   Logical Maximum (2147483647)
>>> +    0x75, 0x20,            //   Report Size (32)
>>> +    0x95, 0x05,            //   Report Count (5)
>>> +    0xb1, 0x03,            //   Feature (Cnst,Var,Abs)
>>> +    0xc0,                //  End Collection
>>> +    0x85, LAMP_ATTRIBUTES_REQUEST_REPORT_ID, //  Report ID (2)
>>> +    0x09, 0x20,            //  Usage (Lamp Attributes Request Report)
>>> +    0xa1, 0x02,            //  Collection (Logical)
>>> +    0x09, 0x21,            //   Usage (Lamp Id)
>>> +    0x15, 0x00,            //   Logical Minimum (0)
>>> +    0x27, 0xff, 0xff, 0x00, 0x00,    //   Logical Maximum (65535)
>>> +    0x75, 0x10,            //   Report Size (16)
>>> +    0x95, 0x01,            //   Report Count (1)
>>> +    0xb1, 0x02,            //   Feature (Data,Var,Abs)
>>> +    0xc0,                //  End Collection
>>> +    0x85, LAMP_ATTRIBUTES_RESPONSE_REPORT_ID, //  Report ID (3)
>>> +    0x09, 0x22,            //  Usage (Lamp Attributes Response Report)
>>> +    0xa1, 0x02,            //  Collection (Logical)
>>> +    0x09, 0x21,            //   Usage (Lamp Id)
>>> +    0x15, 0x00,            //   Logical Minimum (0)
>>> +    0x27, 0xff, 0xff, 0x00, 0x00,    //   Logical Maximum (65535)
>>> +    0x75, 0x10,            //   Report Size (16)
>>> +    0x95, 0x01,            //   Report Count (1)
>>> +    0xb1, 0x02,            //   Feature (Data,Var,Abs)
>>> +    0x09, 0x23,            //   Usage (Position X In Micrometers)
>>> +    0x09, 0x24,            //   Usage (Position Y In Micrometers)
>>> +    0x09, 0x25,            //   Usage (Position Z In Micrometers)
>>> +    0x09, 0x27,            //   Usage (Update Latency In Microseconds)
>>> +    0x09, 0x26,            //   Usage (Lamp Purposes)
>>> +    0x15, 0x00,            //   Logical Minimum (0)
>>> +    0x27, 0xff, 0xff, 0xff, 0x7f,    //   Logical Maximum (2147483647)
>>> +    0x75, 0x20,            //   Report Size (32)
>>> +    0x95, 0x05,            //   Report Count (5)
>>> +    0xb1, 0x02,            //   Feature (Data,Var,Abs)
>>> +    0x09, 0x28,            //   Usage (Red Level Count)
>>> +    0x09, 0x29,            //   Usage (Green Level Count)
>>> +    0x09, 0x2a,            //   Usage (Blue Level Count)
>>> +    0x09, 0x2b,            //   Usage (Intensity Level Count)
>>> +    0x09, 0x2c,            //   Usage (Is Programmable)
>>> +    0x09, 0x2d,            //   Usage (Input Binding)
>>> +    0x15, 0x00,            //   Logical Minimum (0)
>>> +    0x26, 0xff, 0x00,        //   Logical Maximum (255)
>>> +    0x75, 0x08,            //   Report Size (8)
>>> +    0x95, 0x06,            //   Report Count (6)
>>> +    0xb1, 0x02,            //   Feature (Data,Var,Abs)
>>> +    0xc0,                //  End Collection
>>> +    0x85, LAMP_MULTI_UPDATE_REPORT_ID, //  Report ID (4)
>>> +    0x09, 0x50,            //  Usage (Lamp Multi Update Report)
>>> +    0xa1, 0x02,            //  Collection (Logical)
>>> +    0x09, 0x03,            //   Usage (Lamp Count)
>>> +    0x09, 0x55,            //   Usage (Lamp Update Flags)
>>> +    0x15, 0x00,            //   Logical Minimum (0)
>>> +    0x25, 0x08,            //   Logical Maximum (8)
>>> +    0x75, 0x08,            //   Report Size (8)
>>> +    0x95, 0x02,            //   Report Count (2)
>>> +    0xb1, 0x02,            //   Feature (Data,Var,Abs)
>>> +    0x09, 0x21,            //   Usage (Lamp Id)
>>> +    0x15, 0x00,            //   Logical Minimum (0)
>>> +    0x27, 0xff, 0xff, 0x00, 0x00,    //   Logical Maximum (65535)
>>> +    0x75, 0x10,            //   Report Size (16)
>>> +    0x95, 0x08,            //   Report Count (8)
>>> +    0xb1, 0x02,            //   Feature (Data,Var,Abs)
>>> +    0x09, 0x51,            //   Usage (Red Update Channel)
>>> +    0x09, 0x52,            //   Usage (Green Update Channel)
>>> +    0x09, 0x53,            //   Usage (Blue Update Channel)
>>> +    0x09, 0x54,            //   Usage (Intensity Update Channel)
>>> +    0x09, 0x51,            //   Usage (Red Update Channel)
>>> +    0x09, 0x52,            //   Usage (Green Update Channel)
>>> +    0x09, 0x53,            //   Usage (Blue Update Channel)
>>> +    0x09, 0x54,            //   Usage (Intensity Update Channel)
>>> +    0x09, 0x51,            //   Usage (Red Update Channel)
>>> +    0x09, 0x52,            //   Usage (Green Update Channel)
>>> +    0x09, 0x53,            //   Usage (Blue Update Channel)
>>> +    0x09, 0x54,            //   Usage (Intensity Update Channel)
>>> +    0x09, 0x51,            //   Usage (Red Update Channel)
>>> +    0x09, 0x52,            //   Usage (Green Update Channel)
>>> +    0x09, 0x53,            //   Usage (Blue Update Channel)
>>> +    0x09, 0x54,            //   Usage (Intensity Update Channel)
>>> +    0x09, 0x51,            //   Usage (Red Update Channel)
>>> +    0x09, 0x52,            //   Usage (Green Update Channel)
>>> +    0x09, 0x53,            //   Usage (Blue Update Channel)
>>> +    0x09, 0x54,            //   Usage (Intensity Update Channel)
>>> +    0x09, 0x51,            //   Usage (Red Update Channel)
>>> +    0x09, 0x52,            //   Usage (Green Update Channel)
>>> +    0x09, 0x53,            //   Usage (Blue Update Channel)
>>> +    0x09, 0x54,            //   Usage (Intensity Update Channel)
>>> +    0x09, 0x51,            //   Usage (Red Update Channel)
>>> +    0x09, 0x52,            //   Usage (Green Update Channel)
>>> +    0x09, 0x53,            //   Usage (Blue Update Channel)
>>> +    0x09, 0x54,            //   Usage (Intensity Update Channel)
>>> +    0x09, 0x51,            //   Usage (Red Update Channel)
>>> +    0x09, 0x52,            //   Usage (Green Update Channel)
>>> +    0x09, 0x53,            //   Usage (Blue Update Channel)
>>> +    0x09, 0x54,            //   Usage (Intensity Update Channel)
>>> +    0x15, 0x00,            //   Logical Minimum (0)
>>> +    0x26, 0xff, 0x00,        //   Logical Maximum (255)
>>> +    0x75, 0x08,            //   Report Size (8)
>>> +    0x95, 0x20,            //   Report Count (32)
>>> +    0xb1, 0x02,            //   Feature (Data,Var,Abs)
>>> +    0xc0,                //  End Collection
>>> +    0x85, LAMP_RANGE_UPDATE_REPORT_ID, //  Report ID (5)
>>> +    0x09, 0x60,            //  Usage (Lamp Range Update Report)
>>> +    0xa1, 0x02,            //  Collection (Logical)
>>> +    0x09, 0x55,            //   Usage (Lamp Update Flags)
>>> +    0x15, 0x00,            //   Logical Minimum (0)
>>> +    0x25, 0x08,            //   Logical Maximum (8)
>>> +    0x75, 0x08,            //   Report Size (8)
>>> +    0x95, 0x01,            //   Report Count (1)
>>> +    0xb1, 0x02,            //   Feature (Data,Var,Abs)
>>> +    0x09, 0x61,            //   Usage (Lamp Id Start)
>>> +    0x09, 0x62,            //   Usage (Lamp Id End)
>>> +    0x15, 0x00,            //   Logical Minimum (0)
>>> +    0x27, 0xff, 0xff, 0x00, 0x00,    //   Logical Maximum (65535)
>>> +    0x75, 0x10,            //   Report Size (16)
>>> +    0x95, 0x02,            //   Report Count (2)
>>> +    0xb1, 0x02,            //   Feature (Data,Var,Abs)
>>> +    0x09, 0x51,            //   Usage (Red Update Channel)
>>> +    0x09, 0x52,            //   Usage (Green Update Channel)
>>> +    0x09, 0x53,            //   Usage (Blue Update Channel)
>>> +    0x09, 0x54,            //   Usage (Intensity Update Channel)
>>> +    0x15, 0x00,            //   Logical Minimum (0)
>>> +    0x26, 0xff, 0x00,        //   Logical Maximum (255)
>>> +    0x75, 0x08,            //   Report Size (8)
>>> +    0x95, 0x04,            //   Report Count (4)
>>> +    0xb1, 0x02,            //   Feature (Data,Var,Abs)
>>> +    0xc0,                //  End Collection
>>> +    0x85, LAMP_ARRAY_CONTROL_REPORT_ID, //  Report ID (6)
>>> +    0x09, 0x70,            //  Usage (Lamp Array Control Report)
>>> +    0xa1, 0x02,            //  Collection (Logical)
>>> +    0x09, 0x71,            //   Usage (Autonomous Mode)
>>> +    0x15, 0x00,            //   Logical Minimum (0)
>>> +    0x25, 0x01,            //   Logical Maximum (1)
>>> +    0x75, 0x08,            //   Report Size (8)
>>> +    0x95, 0x01,            //   Report Count (1)
>>> +    0xb1, 0x02,            //   Feature (Data,Var,Abs)
>>> +    0xc0,                //  End Collection
>>> +    0xc0                // End Collection
>>> +};
>>> +

