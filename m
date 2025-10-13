Return-Path: <linux-input+bounces-15377-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97135BD2129
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 10:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50FD23C22CC
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 08:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFE42F8BC4;
	Mon, 13 Oct 2025 08:34:48 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F2A2EAB6F;
	Mon, 13 Oct 2025 08:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760344488; cv=none; b=B4Q6UeMceluxEJFxyqpIyPovPvzr21sjTorOJbkWMhFLJEH8PMeSNRhXeAr7yjQbT3CjIiFAIz9+UDl58Jo+U/S+RMAfV3csUVptWdLTs/nDyI8hYmMof80hAfM7IPrFDbl6WrQ/VU5nXM72N0rxSm7Wlfn+7m76WW8oYw8R5R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760344488; c=relaxed/simple;
	bh=QmEFVS7Hv6pLb4fO82Ajm5OiHQ/RmlBkkNOcuK4WPQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dpZ7LB2luV6xBLGgvMLXFUUp+hoV4kDvmmraqKNYaCENPoIcIQgyk4FAbQmKRboJ+IJ86Gfwgs02E4+6RedsVMUlAUuIvs+tPMs/HtcPbIZRHRUmhzyPkX8geiKP6YrgQaXlPZFLYEsuWzbUv7TsMY5IOesVCSb0OeTvhrP4Fjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 70ce0c38a80f11f0a38c85956e01ac42-20251013
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:4e112ce7-8a8a-4d1e-a5da-9abdcda61172,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:8fcde9bbe8bbbe37887e6eb908f4d07b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 70ce0c38a80f11f0a38c85956e01ac42-20251013
X-User: zhangheng@kylinos.cn
Received: from [172.25.120.76] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1661699061; Mon, 13 Oct 2025 16:34:31 +0800
Message-ID: <e605f642-c967-4d41-8145-a10e8f48fb1b@kylinos.cn>
Date: Mon, 13 Oct 2025 16:32:39 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: quirks: Add device descriptor for 4c4a:4155
To: Linux Hid <linuxhid@cosmicgizmosystems.com>, jikos@kernel.org,
 bentiss@kernel.org, staffan.melin@oscillator.se
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 1114557@bugs.debian.org
References: <20250923022445.3276026-1-zhangheng@kylinos.cn>
 <e0dde746-3761-414e-8df1-eb8557cadbf8@cosmicgizmosystems.com>
From: zhangheng <zhangheng@kylinos.cn>
In-Reply-To: <e0dde746-3761-414e-8df1-eb8557cadbf8@cosmicgizmosystems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

It happened to be the holiday, so communication was a bit troublesome.

However, after a brief discussion with the microphone manufacturer,

it was found that the serial number was still 20201111000001 on another

microphone device. So, should we add it?

在 2025/9/29 8:42, Linux Hid 写道:
> Hi Zhang,
>
> The subject doesn't reflect what the patch is doing. You are not adding
> a device descriptor, you are fixing a regression.
>
> On 9/22/2025 7:24 PM, Zhang Heng wrote:
>> Multiple USB devices have the same ID;
>> add device descriptors to distinguish them.
>>
>> Fixes: 1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY")
> Should have a Fixes: tag referencing the regression bug.
> Also a CC: tag for 1114557@bugs.debian.org
> Possibly a CC: tag for stable@vger.kernel.org as well?
>
>> Tested-by: staffan.melin@oscillator.se
>> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
>> ---
>>    drivers/hid/hid-quirks.c | 12 +++++++++++-
>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
>> index ffd034566e2e..d28b180abd72 100644
>> --- a/drivers/hid/hid-quirks.c
>> +++ b/drivers/hid/hid-quirks.c
>> @@ -913,7 +913,6 @@ static const struct hid_device_id hid_ignore_list[] = {
>>    #endif
>>    	{ HID_USB_DEVICE(USB_VENDOR_ID_YEALINK, USB_DEVICE_ID_YEALINK_P1K_P4K_B2K) },
>>    	{ HID_USB_DEVICE(USB_VENDOR_ID_QUANTA, USB_DEVICE_ID_QUANTA_HP_5MP_CAMERA_5473) },
>> -	{ HID_USB_DEVICE(USB_VENDOR_ID_SMARTLINKTECHNOLOGY, USB_DEVICE_ID_SMARTLINKTECHNOLOGY_4155) },
>>    	{ }
>>    };
> Smartlink Technology does not own the 0x4c4a VID or the 0x4155 PID. They
> are an artifact of the Jieli SDK they used in development so the
> #defines should not imply ownership by Smartlink. VID 0x4c4a is
> currently unassigned by the USBIF and is therefore 'reserved'.
>
> Maybe change
> USB_VENDOR_ID_SMARTLINKTECHNOLOGY to USB_VENDOR_ID_JIELI_SDK_DEFAULT
> and
> USB_DEVICE_ID_SMARTLINKTRCHNOLOGY_4155 to USB_DEVICE_ID_JIELI_SDK_4155?
>
>>    
>> @@ -1062,6 +1061,17 @@ bool hid_ignore(struct hid_device *hdev)
>>    					     strlen(elan_acpi_id[i].id)))
>>    					return true;
>>    		break;
>> +	case USB_VENDOR_ID_SMARTLINKTECHNOLOGY:
>> +		/* Multiple USB devices with identical IDs (mic & touchscreen).
>> +		 * The touch screen requires hid core processing, but the
>> +		 * microphone does not. They can be distinguished by manufacturer
>> +		 * and serial number.
>> +		 */
>> +		if (hdev->product == USB_DEVICE_ID_SMARTLINKTECHNOLOGY_4155 &&
>> +		    strncmp(hdev->name, "SmartlinkTechnology", 19) == 0 &&
>> +		    strncmp(hdev->uniq, "20201111000001", 14) == 0)
> Using the serial number as a device identifier is somewhat risky. The
> serial number is optional for a USB device but if it is used then it's
> supposed to be unique for each device. Given how horrible the
> configuration and HID descriptors are for this device it's unlikely that
> they went to the trouble to give each unit a unique serial number. But
> you should check a few of the devices (if you have more than one) to
> verify they all have the same 20201111000001 serial number.
>
> It's too bad the bcdHID version test for 0x0201 didn't work. The
> hid->version field is filled by usbhid_probe with bcdDevice before both
> hid_lookup_quirk and hid_ignore are called and then updated with bcdHID
> by usbhid_parse after they have been called.
>
>> +			return true;
>> +		break;
>>    	}
>>    
>>    	if (hdev->type == HID_TYPE_USBMOUSE &&
> Thanks
> Terry

