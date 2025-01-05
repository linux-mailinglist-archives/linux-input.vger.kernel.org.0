Return-Path: <linux-input+bounces-8889-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03669A018FE
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 11:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DE58188339A
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 10:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13F335947;
	Sun,  5 Jan 2025 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b="J7vntjOQ"
X-Original-To: linux-input@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B39C36C;
	Sun,  5 Jan 2025 10:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736072604; cv=none; b=D1v4x45ZZ3Mnt1Z5t+5tqhhjE4XDQsOYxjh/y/FP3DGHHB803g/XGeVNw5vrFhckSkqrAoP7SYwfK10RFXCqMl7GRQ8dk4Od0LZabDHi3u8EFtFGxfL1Q0T8LGKqqAMNIODKY9iOY2XeoOyksDsC058yZI4gWWA50BlY8WT3Xdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736072604; c=relaxed/simple;
	bh=ehxmGnRn8DaVJ8E/7ZJgc0YaSVDM8b99ycjterdxf6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yi8iMSaEO/CFWJoYajd9KKqAo/iXLiePrYd7nZ3PUQvz6Rnh5VF69CF/L+uVD2jcu3/XJvG0r+f7BM3/boIQU33Ulf+f6lC5QVDfH9o0/vSDtw8vk5N9IOw8pbtEK80XeVMC0cIWlRzYfF7LD9La06bBpsKWai7Wir2CIltHV1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de; spf=pass smtp.mailfrom=mayer-bgk.de; dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b=J7vntjOQ; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mayer-bgk.de
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4YQtWV5snSz91DT;
	Sun,  5 Jan 2025 11:16:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mayer-bgk.de; s=key2;
	t=1736072182; bh=ehxmGnRn8DaVJ8E/7ZJgc0YaSVDM8b99ycjterdxf6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J7vntjOQzd9DVNxunM7rIILzZ6IAy/GbRFundPdPOIyy5+aBTKGRLJy+hUVcydFfG
	 EPBrQGCYJmfXSN0x9PTUSoGuNKLxNphkxPyx1CqYOGXDlzdYhvjDMQ4GCDKYayiacQ
	 hJwypxN2DENn4gTOnl6Tv1Pa5UtfqfQyQMNyjM8THggaTyLIjWRb5aYwlQABFbIcXo
	 0A5MrT7lfeHTFPtY4TjEacYJHOHG/1+K6Xdlm5+qKuEBwGmOdjLtV2YdLQXRLInKOf
	 dSFOD6o5Dri965l+8nx3i8GW8yTsAk9FRKnpwL+rxsSO/R7Ere7ggA+VS5bZ29DbVl
	 pC8NnoshhzNeA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4YQtWV5C24z7wCF;
	Sun,  5 Jan 2025 11:16:22 +0100 (CET)
Received: from mxe85d.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4YQtWV3Kqpz8scM;
	Sun,  5 Jan 2025 11:16:22 +0100 (CET)
Received: from [192.168.1.212] (ipbcc1eb64.dynamic.kabel-deutschland.de [188.193.235.100])
	by mxe85d.netcup.net (Postfix) with ESMTPSA id C4E871C0273;
	Sun,  5 Jan 2025 11:16:17 +0100 (CET)
Authentication-Results: mxe85d;
        spf=pass (sender IP is 188.193.235.100) smtp.mailfrom=christian@mayer-bgk.de smtp.helo=[192.168.1.212]
Received-SPF: pass (mxe85d: connection is authenticated)
Message-ID: <baad8f90-e9cb-4c1d-bbbc-fa556c1c2e1a@mayer-bgk.de>
Date: Sun, 5 Jan 2025 11:16:16 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] HID: steelseries: add SteelSeries Arctis 9 support
To: Bastien Nocera <hadess@hadess.net>, Christian Mayer <git@mayer-bgk.de>,
 linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20250101151209.100072-1-git@mayer-bgk.de>
 <20250101151209.100072-2-git@mayer-bgk.de>
 <1a966d05a55e7d7252f8aa03857c390e3518f76d.camel@hadess.net>
Content-Language: en-US
From: Christian Mayer <christian@mayer-bgk.de>
In-Reply-To: <1a966d05a55e7d7252f8aa03857c390e3518f76d.camel@hadess.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173607217812.5108.10586965024941744713@mxe85d.netcup.net>
X-Rspamd-Queue-Id: C4E871C0273
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: auMN9i8jI5Mx4uFtY/R0IcoSBS2YZ2rYlWPufAJAohAjtvnMQU0=


> On Wed, 2025-01-01 at 15:11 +0000, Christian Mayer wrote:
>> Add support for the SteelSeries Arctis 9 headset. This driver
>> will export the battery information like it already does for
>> the Arcits 1 headset.
>>
>> Signed-off-by: Christian Mayer <git@mayer-bgk.de>
> 
> 
> Please remove all the whitespace changes, and split off the
> steelseries_headset_request_battery() refactoring into its own commit.
> 
> Detailed review comments below.
Thank you for your feedback Bastien.
I will repost my patches with the fixes within the next days.

Please see one follow-up question about hid_hw_open below.
> 
>> ---
>>   drivers/hid/hid-steelseries.c | 105 +++++++++++++++++++++++++++++-----
>>   1 file changed, 90 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
>> index f9ff5be94309..f102045a9b6b 100644
>> --- a/drivers/hid/hid-steelseries.c
>> +++ b/drivers/hid/hid-steelseries.c
>> @@ -18,7 +18,8 @@
>>   #include "hid-ids.h"
>>   
>>   #define STEELSERIES_SRWS1		BIT(0)
>> -#define STEELSERIES_ARCTIS_1		BIT(1)
>> +#define STEELSERIES_ARCTIS_1	BIT(1)
> 
> Whitespace change
> 
>> +#define STEELSERIES_ARCTIS_9	BIT(2)
>>   
>>   struct steelseries_device {
>>   	struct hid_device *hdev;
>> @@ -35,7 +36,7 @@ struct steelseries_device {
>>   };
>>   
>>   #if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
>> -    (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
>> +	(IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
> 
> Whitespace change
> 
>>   #define SRWS1_NUMBER_LEDS 15
>>   struct steelseries_srws1_data {
>>   	__u16 led_state;
>> @@ -95,7 +96,7 @@ static const __u8 steelseries_srws1_rdesc_fixed[] = {
>>   0x29, 0x11,         /*          Usage Maximum (11h),        */
>>   0x95, 0x11,         /*          Report Count (17),          */
>>   0x81, 0x02,         /*          Input (Variable),           */
>> -                    /*   ---- Dial patch starts here ----   */
>> +					/*   ---- Dial patch starts here ----   */
> 
> Whitespace change
> 
>>   0x05, 0x01,         /*          Usage Page (Desktop),       */
>>   0x09, 0x33,         /*          Usage (RX),                 */
>>   0x75, 0x04,         /*          Report Size (4),            */
>> @@ -108,7 +109,7 @@ static const __u8 steelseries_srws1_rdesc_fixed[] = {
>>   0x95, 0x01,         /*          Report Count (1),           */
>>   0x25, 0x03,         /*          Logical Maximum (3),        */
>>   0x81, 0x02,         /*          Input (Variable),           */
>> -                    /*    ---- Dial patch ends here ----    */
>> +					/*    ---- Dial patch ends here ----    */
> 
> Whitespace change
> 
>>   0x06, 0x00, 0xFF,   /*          Usage Page (FF00h),         */
>>   0x09, 0x01,         /*          Usage (01h),                */
>>   0x75, 0x04,         /* Changed  Report Size (4),            */
>> @@ -125,7 +126,7 @@ static const __u8 steelseries_srws1_rdesc_fixed[] = {
>>   };
>>   
>>   #if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
>> -    (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
>> +	(IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
> 
> Whitespace change
> 
>>   static void steelseries_srws1_set_leds(struct hid_device *hdev, __u16 leds)
>>   {
>>   	struct list_head *report_list = &hdev->report_enum[HID_OUTPUT_REPORT].report_list;
>> @@ -368,32 +369,36 @@ static void steelseries_srws1_remove(struct hid_device *hdev)
>>   
>>   	hid_hw_stop(hdev);
>>   	kfree(drv_data);
>> -	return;
> 
> Should be a separate commit.
> 
>>   }
>>   #endif
>>   
>>   #define STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS	3000
>>   
>>   #define ARCTIS_1_BATTERY_RESPONSE_LEN		8
>> +#define ARCTIS_9_BATTERY_RESPONSE_LEN		64
>>   static const char arctis_1_battery_request[] = { 0x06, 0x12 };
>> +static const char arctis_9_battery_request[] = { 0x00, 0x20 };
>>   
>> -static int steelseries_headset_arctis_1_fetch_battery(struct hid_device *hdev)
>> +static int steelseries_headset_request_battery(struct hid_device *hdev,
>> +	const char *request, size_t len)
> 
> This change should be a two-step process (so two separate commits),
> first factor out the battery request function so it take the request
> and len as you've done, then add support for that new device.
> 
>>   {
>>   	u8 *write_buf;
>>   	int ret;
>>   
>>   	/* Request battery information */
>> -	write_buf = kmemdup(arctis_1_battery_request, sizeof(arctis_1_battery_request), GFP_KERNEL);
>> +	write_buf = kmemdup(request, len, GFP_KERNEL);
>>   	if (!write_buf)
>>   		return -ENOMEM;
>>   
>> -	ret = hid_hw_raw_request(hdev, arctis_1_battery_request[0],
>> -				 write_buf, sizeof(arctis_1_battery_request),
>> +	hid_dbg(hdev, "Sending battery request report");
>> +	ret = hid_hw_raw_request(hdev, request[0],
>> +				 write_buf, len,
>>   				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
>> -	if (ret < (int)sizeof(arctis_1_battery_request)) {
>> +	if (ret < (int)len) {
>>   		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
>>   		ret = -ENODATA;
>>   	}
>> +
>>   	kfree(write_buf);
>>   	return ret;
>>   }
>> @@ -404,7 +409,11 @@ static void steelseries_headset_fetch_battery(struct hid_device *hdev)
>>   	int ret = 0;
>>   
>>   	if (sd->quirks & STEELSERIES_ARCTIS_1)
>> -		ret = steelseries_headset_arctis_1_fetch_battery(hdev);
>> +		ret = steelseries_headset_request_battery(hdev,
>> +				arctis_1_battery_request, sizeof(arctis_1_battery_request));
>> +	else if (sd->quirks & STEELSERIES_ARCTIS_9)
>> +		ret = steelseries_headset_request_battery(hdev,
>> +				arctis_9_battery_request, sizeof(arctis_9_battery_request));
>>   
>>   	if (ret < 0)
>>   		hid_dbg(hdev,
>> @@ -520,9 +529,22 @@ static int steelseries_headset_battery_register(struct steelseries_device *sd)
>>   	INIT_DELAYED_WORK(&sd->battery_work, steelseries_headset_battery_timer_tick);
>>   	steelseries_headset_fetch_battery(sd->hdev);
>>   
>> +	if (sd->quirks & STEELSERIES_ARCTIS_9) {
>> +		// The first fetch_battery request can remain unanswered in some cases
> 
> No C++-style comments.
> 
>> +		schedule_delayed_work(&sd->battery_work,
>> +				msecs_to_jiffies(STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS));
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>> +static bool steelseries_is_vendor_usage_page(struct hid_device *hdev, uint8_t usagePage)
>> +{
>> +	return hdev->rdesc[0] == 0x06 &&
>> +		hdev->rdesc[1] == usagePage &&
>> +		hdev->rdesc[2] == 0xff;
>> +}
> 
> Should probably be usage_page.
> 
>> +
>>   static int steelseries_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>   {
>>   	struct steelseries_device *sd;
>> @@ -537,7 +559,7 @@ static int steelseries_probe(struct hid_device *hdev, const struct hid_device_id
>>   
>>   	if (sd->quirks & STEELSERIES_SRWS1) {
>>   #if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
>> -    (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
>> +	(IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
>>   		return steelseries_srws1_probe(hdev, id);
>>   #else
>>   		return -ENODEV;
>> @@ -548,12 +570,22 @@ static int steelseries_probe(struct hid_device *hdev, const struct hid_device_id
>>   	if (ret)
>>   		return ret;
>>   
>> +	if (sd->quirks & STEELSERIES_ARCTIS_9 &&
>> +			!steelseries_is_vendor_usage_page(hdev, 0xc0))
>> +		return -ENODEV;
>> +
>>   	spin_lock_init(&sd->lock);
>>   
>>   	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
>>   	if (ret)
>>   		return ret;
>>   
>> +	if (sd->quirks & STEELSERIES_ARCTIS_9) {
>> +		ret = hid_hw_open(hdev);
> 
> Is this needed? If so, this probably needs to be added as a separate
> commit, for all headsets rather than just this one.
Yes that's mandatory to get raw_events from the device.
I thought about adding this to all headsets, but i was not sure if this 
breaks anything for the Arctis 1 headset.

But i can add this for all headsets, that's fine with me.
Would you like me to create a completely separate patch for this or 
should i submit this with the preparation patch which refactors 
steelseries_headset_fetch_battery?
> 
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	if (steelseries_headset_battery_register(sd) < 0)
>>   		hid_err(sd->hdev,
>>   			"Failed to register battery for headset\n");
>> @@ -568,7 +600,7 @@ static void steelseries_remove(struct hid_device *hdev)
>>   
>>   	if (sd->quirks & STEELSERIES_SRWS1) {
>>   #if IS_BUILTIN(CONFIG_LEDS_CLASS) || \
>> -    (IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
>> +	(IS_MODULE(CONFIG_LEDS_CLASS) && IS_MODULE(CONFIG_HID_STEELSERIES))
>>   		steelseries_srws1_remove(hdev);
>>   #endif
>>   		return;
>> @@ -580,6 +612,9 @@ static void steelseries_remove(struct hid_device *hdev)
>>   
>>   	cancel_delayed_work_sync(&sd->battery_work);
>>   
>> +	if (sd->quirks & STEELSERIES_ARCTIS_9)
>> +		hid_hw_close(hdev);
>> +
>>   	hid_hw_stop(hdev);
>>   }
>>   
>> @@ -599,6 +634,15 @@ static const __u8 *steelseries_srws1_report_fixup(struct hid_device *hdev,
>>   	return rdesc;
>>   }
>>   
>> +static uint8_t steelseries_headset_map_capacity(uint8_t capacity, uint8_t min_in, uint8_t max_in)
>> +{
>> +	if (capacity > max_in)
>> +		return 100;
>> +	if (capacity < min_in)
>> +		return 0;
>> +	return (capacity - min_in) * 100 / (max_in - min_in);
>> +}
>> +
>>   static int steelseries_headset_raw_event(struct hid_device *hdev,
>>   					struct hid_report *report, u8 *read_buf,
>>   					int size)
>> @@ -630,6 +674,32 @@ static int steelseries_headset_raw_event(struct hid_device *hdev,
>>   		}
>>   	}
>>   
>> +	if (sd->quirks & STEELSERIES_ARCTIS_9) {
>> +		hid_dbg(sd->hdev,
>> +			"Parsing raw event for Arctis 9 headset (%*ph)\n", size, read_buf);
>> +		if (size < ARCTIS_9_BATTERY_RESPONSE_LEN) {
>> +			if (!delayed_work_pending(&sd->battery_work))
>> +				goto request_battery;
>> +			return 0;
>> +		}
>> +
>> +		if (read_buf[0] == 0xaa && read_buf[1] == 0x01) {
>> +			connected = true;
>> +
>> +			/*
>> +			 * Found no official documentation about min and max.
>> +			 * Values defined by testing.
>> +			 */
>> +			capacity = steelseries_headset_map_capacity(read_buf[3], 0x68, 0x9d);
>> +		} else {
>> +			/*
>> +			 * Device is off and sends the last known status read_buf[1] == 0x03 or
>> +			 * there is no known status of the device read_buf[0] == 0x55
>> +			 */
>> +			connected = false;
>> +		}
>> +	}
>> +
>>   	if (connected != sd->headset_connected) {
>>   		hid_dbg(sd->hdev,
>>   			"Connected status changed from %sconnected to %sconnected\n",
>> @@ -663,7 +733,11 @@ static const struct hid_device_id steelseries_devices[] = {
>>   
>>   	{ /* SteelSeries Arctis 1 Wireless for XBox */
>>   	  HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, 0x12b6),
>> -	.driver_data = STEELSERIES_ARCTIS_1 },
>> +	  .driver_data = STEELSERIES_ARCTIS_1 },
> 
> Whitespace change.
> 
>> +
>> +	{ /* SteelSeries Arctis 9 Wireless for XBox */
>> +	  HID_USB_DEVICE(USB_VENDOR_ID_STEELSERIES, 0x12c2),
>> +	  .driver_data = STEELSERIES_ARCTIS_9 },
>>   
>>   	{ }
>>   };
>> @@ -683,3 +757,4 @@ MODULE_DESCRIPTION("HID driver for Steelseries devices");
>>   MODULE_LICENSE("GPL");
>>   MODULE_AUTHOR("Bastien Nocera <hadess@hadess.net>");
>>   MODULE_AUTHOR("Simon Wood <simon@mungewell.org>");
>> +MODULE_AUTHOR("Christian Mayer <git@mayer-bgk.de>");
> 


