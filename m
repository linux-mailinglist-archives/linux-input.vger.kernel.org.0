Return-Path: <linux-input+bounces-6693-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADA4985181
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 05:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 519AD1C22E1F
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 03:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAEC148849;
	Wed, 25 Sep 2024 03:39:13 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC01B126F0A;
	Wed, 25 Sep 2024 03:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727235553; cv=none; b=VZQ6l9yqlkz2dyKr1JP5NzBn4ugi1/yjINTzGj16wvj9tHv/eXJCFfF7x5le63QU7J1MJXbcG5Mzxi3bCMvuaQOJz3/Rd2qfhBXTMbgQfU1Ql/d7m2vzRgxug+gu0P96iY5RtOgTFlfBXK6kow88Bkz+RzdUYqrhLLyC+ll1Gf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727235553; c=relaxed/simple;
	bh=O8dcmWK12jDj45THMNSloukaqsnGeoFrg8LqafZuYZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDRZn/rwswENrsjypT++9nRi+YPB0qPiol6C7zn6D75ETOgZrgwPaM17pdfxb8CFrjchOqiJe0hGdiAhvRiWOd8KvvjsMfTCYsGPcBj3CLjdKF8BiPOQIKLB7T1YpxpLKB6LTF7JsC927c5bnXPHyGHQJyTBgBC6Aq8ucMlYhEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.101] (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id 15B012240453;
	Tue, 24 Sep 2024 20:32:05 -0700 (PDT)
Message-ID: <bc92e409-cebe-4da1-a225-c48915c5dcba@cosmicgizmosystems.com>
Date: Tue, 24 Sep 2024 20:31:58 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: plantronics: Update to map micmute controls
To: "Wang, Wade" <wade.wang@hp.com>, Benjamin Tissoires <bentiss@kernel.org>
Cc: "jikos@kernel.org" <jikos@kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20240913060800.1325954-1-wade.wang@hp.com>
 <s36bnt7ptdarrxpejm6n62gf3rvvwfagmmpyq4unpv3hn7v2jf@up2vjv7shl2q>
 <EA2PR84MB378051BB14F857BA84E662818B602@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
 <EA2PR84MB378082C6FA58AA25258DC74B8B682@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <EA2PR84MB378082C6FA58AA25258DC74B8B682@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wade,

I retired from Plantronics in 2020. The original driver did not allow 
mute button to be mapped as there were mute synchronization issues.

The headset needs to receive some type of feedback from the host when it 
sends the mute event in order to synchronize with the host, ideally the 
host setting or clearing the mute control in the audio control interface 
but setting/clearing the mute LED would also work.

At the time Ubuntu and Chromebooks did not feedback mute state and it 
was possible to mute from the headset and then unmute from the mixer or 
keyboard and the headset would stay muted. The only way to unmute was 
with the headset button. This was an unacceptable user experience so we 
blocked mapping.

If you want to try mapping mute event then you also need to allow 
mapping the mute LED for possible host feedback.

(HID_UP_TELEPHONY | 0x2f) is telephony page mute button
(HID_UP_LED | 0x09) is LED page mute LED

Then you need to test more than just the event getting to user space. 
You need to check mute synchronization with the host mixer under all 
mute/unmute use cases.

Regards,
Terry Junge


On 9/24/24 2:00 AM, Wang, Wade wrote:
> Hi Benjamin and Greg,
> 
> May I know the review progress and anything I need to change? Thanks
> 
> Regards
> Wade
> 
> -----Original Message-----
> From: Wang, Wade
> Sent: Monday, September 16, 2024 4:13 PM
> To: Benjamin Tissoires <bentiss@kernel.org>
> Cc: jikos@kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; stable@vger.kernel.org
> Subject: RE: [PATCH] HID: plantronics: Update to map micmute controls
> 
> Hi Benjamin,
> 
> This patch is for all Poly HS devices, and it does not depends on other patches, it can apply directly by " git am -3".
> 
> With this patch, MicMute button key event will be send to user space, I have tested on the below Poly devices:
>          Plantronics EncorePro 500 Series
>          Plantronics Blackwire_3325 Series
>          Poly Voyager 4320 HS + BT700 Dongle
> 
> Regards
> Wade
> 
> -----Original Message-----
> From: Benjamin Tissoires <bentiss@kernel.org>
> Sent: Friday, September 13, 2024 10:04 PM
> To: Wang, Wade <wade.wang@hp.com>
> Cc: jikos@kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; stable@vger.kernel.org
> Subject: Re: [PATCH] HID: plantronics: Update to map micmute controls
> 
> CAUTION: External Email
> 
> On Sep 13 2024, Wade Wang wrote:
>> telephony page of Plantronics headset is ignored currently, it caused
>> micmute button no function, Now follow native HID key mapping for
>> telephony page map, telephony micmute key is enabled by default
> 
> For which devices this patch is required? Is it related to the other patch you sent today? If so please make a mention of the concerned devices and make sure both patches are sent in a single v3 series.
> 
> Also, have you tested this change with other Plantronics headsets? Where there any changes in behavior from them?
> 
> Cheers,
> Benjamin
> 
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Wade Wang <wade.wang@hp.com>
>> ---
>>   drivers/hid/hid-plantronics.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hid/hid-plantronics.c
>> b/drivers/hid/hid-plantronics.c index 2a19f3646ecb..2d17534fce61
>> 100644
>> --- a/drivers/hid/hid-plantronics.c
>> +++ b/drivers/hid/hid-plantronics.c
>> @@ -77,10 +77,10 @@ static int plantronics_input_mapping(struct hid_device *hdev,
>>                }
>>        }
>>        /* handle standard types - plt_type is 0xffa0uuuu or 0xffa2uuuu */
>> -     /* 'basic telephony compliant' - allow default consumer page map */
>> +     /* 'basic telephony compliant' - allow default consumer &
>> + telephony page map */
>>        else if ((plt_type & HID_USAGE) >= PLT_BASIC_TELEPHONY &&
>>                 (plt_type & HID_USAGE) != PLT_BASIC_EXCEPTION) {
>> -             if (PLT_ALLOW_CONSUMER)
>> +             if (PLT_ALLOW_CONSUMER || (usage->hid & HID_USAGE_PAGE)
>> + == HID_UP_TELEPHONY)
>>                        goto defaulted;
>>        }
>>        /* not 'basic telephony' - apply legacy mapping */
>> --
>> 2.34.1
>>
> 
> 

