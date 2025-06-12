Return-Path: <linux-input+bounces-12828-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A46AD6A58
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 10:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B36F87AC33D
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 08:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610702222AF;
	Thu, 12 Jun 2025 08:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iDvV7c23"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1CF221710;
	Thu, 12 Jun 2025 08:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716436; cv=none; b=BM16TjvKIMye5cEBIs9E+/XIIk/JaTSDGYzX1IzzSz+zmegp6XFx3jGP/cw2SwH3cjd/GE6LoPWpzL5Lrew+HkmoBmq3E3+kLCS5ROks7NgEJuPuNQdoVPpxKNF+ZyA0wiqZfRX56OzV0GFB90yvIVa0/+QaAdHz+sr455I5kI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716436; c=relaxed/simple;
	bh=RS+upILC1WIEDP/qN69yWKf/6fEfZxwdMOccv2bkOYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoxbygBFNtbOi16e2PXQI/xaJEZudhCYNxIbAQGAeqyUeYcx56j8AebAq5fuwyk0o60NiCt94HTpFb2U6eLhNIeF65tK7WEZGJxCdH33WmmcEKWq5jukTJutaQo+JDFwIgQUpKOVLXUjYEse4H27a1ejc0D+HYucZY9s08uSETo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iDvV7c23; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749716432;
	bh=RS+upILC1WIEDP/qN69yWKf/6fEfZxwdMOccv2bkOYQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iDvV7c23cJIBHz0BopV6owPlUYC18ZwICA0/JCoqFdBQIfjIYDtX6xeprk7qkAbf0
	 o8pslap598KCoFnOCMeFQ6zKqweZDcam/B4ZL2ok/4L7I03Y3YuAFoRwNnOZzdAixI
	 EwvQO8RI1upC2eR6NlilB0jS0aEoNaIWvQJJtosqBcbehDBw5g3vOL7mjYaU3nHybE
	 SYxFVzCsne2fiHWeewz4q5dUJ02ywJhjIBZ0Wh1Ks+5ktEet2mKlgeJYH9DJyo1WcU
	 eagwwawdURj90P1uS/Eir6ZwV7IQAOAYmpvV+RteKI5iPOCCj3uiHg/54SelkSiW5X
	 sEpJyx25XWP3g==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C069B17E00A3;
	Thu, 12 Jun 2025 10:20:31 +0200 (CEST)
Message-ID: <797aab41-fe81-4fdd-9399-b67818898f31@collabora.com>
Date: Thu, 12 Jun 2025 11:20:20 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] HID: playstation: Make use of bitfield macros
To: Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
 <20250526-dualsense-hid-jack-v1-1-a65fee4a60cc@collabora.com>
 <CAEc3jaAjUHgv7U59u7RSZ7TK9ycXmYs22b6MsHvSjt-_Do7cjg@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAEc3jaAjUHgv7U59u7RSZ7TK9ycXmYs22b6MsHvSjt-_Do7cjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Roderick,

On 6/10/25 7:07 AM, Roderick Colenbrander wrote:
> Hi Christian,
> 
> Thanks for the effort into this patch. Personally this is a patch I
> would rather drop. There is the trade-off between magical numbers and
> code readability. I think this patch makes things much less readable.
> Having to introduce more macros and FIELD_PREP vs a single bitshift
> here and there.

I think the usage of bitfield macros is a general recommendation of 
making code more robust, and this should also help improve overall 
readability - e.g. this reduced code duplication by replacing the open 
coded bit operations for computing touch point coordinates.

Sorry for the noise generated by the alignment correction!

Thanks,
Cristian

> 
> Thanks,
> Roderick
> 
> On Mon, May 26, 2025 at 5:52 AM Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>
>> Improve code readability by replacing open coded bit operations with the
>> equivalent bitfield macros.
>>
>> While at it, vertically align all DS_OUTPUT_* bit constants.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/hid/hid-playstation.c | 68 ++++++++++++++++++++++++++-----------------
>>  1 file changed, 41 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
>> index 1468fb11e39dffc883181663a4ad44252e0a7ebb..538194ce8902fe1383b57ac59743f32838dcb0df 100644
>> --- a/drivers/hid/hid-playstation.c
>> +++ b/drivers/hid/hid-playstation.c
>> @@ -5,6 +5,7 @@
>>   *  Copyright (c) 2020-2022 Sony Interactive Entertainment
>>   */
>>
>> +#include <linux/bitfield.h>
>>  #include <linux/bits.h>
>>  #include <linux/crc32.h>
>>  #include <linux/device.h>
>> @@ -116,29 +117,41 @@ struct ps_led_info {
>>  #define DS_STATUS_CHARGING_SHIFT       4
>>
>>  /* Feature version from DualSense Firmware Info report. */
>> -#define DS_FEATURE_VERSION(major, minor) ((major & 0xff) << 8 | (minor & 0xff))
>> -
>> +#define DS_FEATURE_VERSION_MINOR               GENMASK(7, 0)
>> +#define DS_FEATURE_VERSION_MAJOR               GENMASK(15, 8)
>> +#define DS_FEATURE_VERSION(major, minor)       (FIELD_PREP(DS_FEATURE_VERSION_MAJOR, major) | \
>> +                                                FIELD_PREP(DS_FEATURE_VERSION_MINOR, minor))
>>  /*
>>   * Status of a DualSense touch point contact.
>>   * Contact IDs, with highest bit set are 'inactive'
>>   * and any associated data is then invalid.
>>   */
>> -#define DS_TOUCH_POINT_INACTIVE BIT(7)
>> +#define DS_TOUCH_POINT_INACTIVE                        BIT(7)
>> +#define DS_TOUCH_POINT_X_LO                    GENMASK(7, 0)
>> +#define DS_TOUCH_POINT_X_HI                    GENMASK(11, 8)
>> +#define DS_TOUCH_POINT_X(hi, lo)               (FIELD_PREP(DS_TOUCH_POINT_X_HI, hi) | \
>> +                                                FIELD_PREP(DS_TOUCH_POINT_X_LO, lo))
>> +#define DS_TOUCH_POINT_Y_LO                    GENMASK(3, 0)
>> +#define DS_TOUCH_POINT_Y_HI                    GENMASK(11, 4)
>> +#define DS_TOUCH_POINT_Y(hi, lo)               (FIELD_PREP(DS_TOUCH_POINT_Y_HI, hi) | \
>> +                                                FIELD_PREP(DS_TOUCH_POINT_Y_LO, lo))
>>
>>   /* Magic value required in tag field of Bluetooth output report. */
>> -#define DS_OUTPUT_TAG 0x10
>> +#define DS_OUTPUT_TAG                          0x10
>> +#define DS_OUTPUT_SEQ_TAG                      GENMASK(3, 0)
>> +#define DS_OUTPUT_SEQ_NO                       GENMASK(7, 4)
>>  /* Flags for DualSense output report. */
>> -#define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION BIT(0)
>> -#define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT BIT(1)
>> -#define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE BIT(0)
>> -#define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE BIT(1)
>> -#define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE BIT(2)
>> -#define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
>> -#define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE BIT(4)
>> -#define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
>> -#define DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2 BIT(2)
>> -#define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
>> -#define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
>> +#define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION             BIT(0)
>> +#define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT                   BIT(1)
>> +#define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE      BIT(0)
>> +#define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE                BIT(1)
>> +#define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE          BIT(2)
>> +#define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS                     BIT(3)
>> +#define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE  BIT(4)
>> +#define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE    BIT(1)
>> +#define DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2            BIT(2)
>> +#define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE                  BIT(4)
>> +#define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT                     BIT(1)
>>
>>  /* DualSense hardware limits */
>>  #define DS_ACC_RES_PER_G       8192
>> @@ -315,7 +328,9 @@ struct dualsense_output_report {
>>   * Contact IDs, with highest bit set are 'inactive'
>>   * and any associated data is then invalid.
>>   */
>> -#define DS4_TOUCH_POINT_INACTIVE BIT(7)
>> +#define DS4_TOUCH_POINT_INACTIVE       BIT(7)
>> +#define DS4_TOUCH_POINT_X(hi, lo)      DS_TOUCH_POINT_X(hi, lo)
>> +#define DS4_TOUCH_POINT_Y(hi, lo)      DS_TOUCH_POINT_Y(hi, lo)
>>
>>  /* Status field of DualShock4 input report. */
>>  #define DS4_STATUS0_BATTERY_CAPACITY   GENMASK(3, 0)
>> @@ -1194,7 +1209,8 @@ static void dualsense_init_output_report(struct dualsense *ds, struct dualsense_
>>                  * Highest 4-bit is a sequence number, which needs to be increased
>>                  * every report. Lowest 4-bit is tag and can be zero for now.
>>                  */
>> -               bt->seq_tag = (ds->output_seq << 4) | 0x0;
>> +               bt->seq_tag = FIELD_PREP(DS_OUTPUT_SEQ_NO, ds->output_seq) |
>> +                             FIELD_PREP(DS_OUTPUT_SEQ_TAG, 0x0);
>>                 if (++ds->output_seq == 16)
>>                         ds->output_seq = 0;
>>
>> @@ -1439,11 +1455,10 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
>>                 input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, active);
>>
>>                 if (active) {
>> -                       int x = (point->x_hi << 8) | point->x_lo;
>> -                       int y = (point->y_hi << 4) | point->y_lo;
>> -
>> -                       input_report_abs(ds->touchpad, ABS_MT_POSITION_X, x);
>> -                       input_report_abs(ds->touchpad, ABS_MT_POSITION_Y, y);
>> +                       input_report_abs(ds->touchpad, ABS_MT_POSITION_X,
>> +                                        DS_TOUCH_POINT_X(point->x_hi, point->x_lo));
>> +                       input_report_abs(ds->touchpad, ABS_MT_POSITION_Y,
>> +                                        DS_TOUCH_POINT_Y(point->y_hi, point->y_lo));
>>                 }
>>         }
>>         input_mt_sync_frame(ds->touchpad);
>> @@ -2351,11 +2366,10 @@ static int dualshock4_parse_report(struct ps_device *ps_dev, struct hid_report *
>>                         input_mt_report_slot_state(ds4->touchpad, MT_TOOL_FINGER, active);
>>
>>                         if (active) {
>> -                               int x = (point->x_hi << 8) | point->x_lo;
>> -                               int y = (point->y_hi << 4) | point->y_lo;
>> -
>> -                               input_report_abs(ds4->touchpad, ABS_MT_POSITION_X, x);
>> -                               input_report_abs(ds4->touchpad, ABS_MT_POSITION_Y, y);
>> +                               input_report_abs(ds4->touchpad, ABS_MT_POSITION_X,
>> +                                                DS4_TOUCH_POINT_X(point->x_hi, point->x_lo));
>> +                               input_report_abs(ds4->touchpad, ABS_MT_POSITION_Y,
>> +                                                DS4_TOUCH_POINT_Y(point->y_hi, point->y_lo));
>>                         }
>>                 }
>>                 input_mt_sync_frame(ds4->touchpad);
>>
>> --
>> 2.49.0
>>
>>


