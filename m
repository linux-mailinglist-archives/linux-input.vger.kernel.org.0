Return-Path: <linux-input+bounces-15146-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B497FBA7A15
	for <lists+linux-input@lfdr.de>; Mon, 29 Sep 2025 02:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70D8B3B0B66
	for <lists+linux-input@lfdr.de>; Mon, 29 Sep 2025 00:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D97157487;
	Mon, 29 Sep 2025 00:42:57 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosmicgizmosystems.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B731A239A;
	Mon, 29 Sep 2025 00:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759106577; cv=none; b=P1fTRYG/frybYzvNDXZVUlVj/X/uxKy3t4au6aBphkdNM5IvFscAHTseCoY6/H0sgTXJPFxMg0hwMq1lPJiqtN/U0ZMZco4szoCscD5RCPGoqZ1ewY2CDn3pn33E74HhZKC6SxkVjgpuALc31cnwUHYYP6qStikqGlq9YSXy4vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759106577; c=relaxed/simple;
	bh=Q0aTNUl9QWfi6VHFGUrjypxH1/y4Zs8osRxB9hSzNAo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MyAUPp8+cmLQzTkyZh6bvVl6VkahIeyi6l4B5qkld63tsWJuzNRamdSNJVnthW3yc9fKAndOkO209aYuJjtt5i+IoZEgWxfDJOL/l0SuvQQmGWi4EwdZR5Occ3exiuxvngs0lmlYikYXluuTsieMr6OYvoHiXAyd0EuiUUukfUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 8BD211D45E70;
	Sun, 28 Sep 2025 17:42:52 -0700 (PDT)
Message-ID: <e0dde746-3761-414e-8df1-eb8557cadbf8@cosmicgizmosystems.com>
Date: Sun, 28 Sep 2025 17:42:51 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Linux Hid <linuxhid@cosmicgizmosystems.com>
Subject: Re: [PATCH v2] HID: quirks: Add device descriptor for 4c4a:4155
To: Zhang Heng <zhangheng@kylinos.cn>, jikos@kernel.org, bentiss@kernel.org,
 staffan.melin@oscillator.se
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250923022445.3276026-1-zhangheng@kylinos.cn>
Content-Language: en-US
In-Reply-To: <20250923022445.3276026-1-zhangheng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Zhang,

The subject doesn't reflect what the patch is doing. You are not adding 
a device descriptor, you are fixing a regression.

On 9/22/2025 7:24 PM, Zhang Heng wrote:
> Multiple USB devices have the same ID;
> add device descriptors to distinguish them.
> 
> Fixes: 1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY")

Should have a Fixes: tag referencing the regression bug.
Also a CC: tag for 1114557@bugs.debian.org
Possibly a CC: tag for stable@vger.kernel.org as well?

> Tested-by: staffan.melin@oscillator.se
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
> ---
>   drivers/hid/hid-quirks.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index ffd034566e2e..d28b180abd72 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -913,7 +913,6 @@ static const struct hid_device_id hid_ignore_list[] = {
>   #endif
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_YEALINK, USB_DEVICE_ID_YEALINK_P1K_P4K_B2K) },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_QUANTA, USB_DEVICE_ID_QUANTA_HP_5MP_CAMERA_5473) },
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_SMARTLINKTECHNOLOGY, USB_DEVICE_ID_SMARTLINKTECHNOLOGY_4155) },
>   	{ }
>   };

Smartlink Technology does not own the 0x4c4a VID or the 0x4155 PID. They 
are an artifact of the Jieli SDK they used in development so the 
#defines should not imply ownership by Smartlink. VID 0x4c4a is 
currently unassigned by the USBIF and is therefore 'reserved'.

Maybe change
USB_VENDOR_ID_SMARTLINKTECHNOLOGY to USB_VENDOR_ID_JIELI_SDK_DEFAULT
and
USB_DEVICE_ID_SMARTLINKTRCHNOLOGY_4155 to USB_DEVICE_ID_JIELI_SDK_4155?

>   
> @@ -1062,6 +1061,17 @@ bool hid_ignore(struct hid_device *hdev)
>   					     strlen(elan_acpi_id[i].id)))
>   					return true;
>   		break;
> +	case USB_VENDOR_ID_SMARTLINKTECHNOLOGY:
> +		/* Multiple USB devices with identical IDs (mic & touchscreen).
> +		 * The touch screen requires hid core processing, but the
> +		 * microphone does not. They can be distinguished by manufacturer
> +		 * and serial number.
> +		 */
> +		if (hdev->product == USB_DEVICE_ID_SMARTLINKTECHNOLOGY_4155 &&
> +		    strncmp(hdev->name, "SmartlinkTechnology", 19) == 0 &&
> +		    strncmp(hdev->uniq, "20201111000001", 14) == 0)

Using the serial number as a device identifier is somewhat risky. The 
serial number is optional for a USB device but if it is used then it's 
supposed to be unique for each device. Given how horrible the 
configuration and HID descriptors are for this device it's unlikely that 
they went to the trouble to give each unit a unique serial number. But 
you should check a few of the devices (if you have more than one) to 
verify they all have the same 20201111000001 serial number.

It's too bad the bcdHID version test for 0x0201 didn't work. The 
hid->version field is filled by usbhid_probe with bcdDevice before both 
hid_lookup_quirk and hid_ignore are called and then updated with bcdHID 
by usbhid_parse after they have been called.

> +			return true;
> +		break;
>   	}
>   
>   	if (hdev->type == HID_TYPE_USBMOUSE &&

Thanks
Terry

