Return-Path: <linux-input+bounces-12833-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A164AD6BE9
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 11:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57C40170D9D
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 09:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F092248BE;
	Thu, 12 Jun 2025 09:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZtnlZrqe"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06604223DCC;
	Thu, 12 Jun 2025 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719687; cv=none; b=VjvcIVRHSnLckSWdTdBSAKs0YsHX6xnTvkijUX/fTuvqQvtsOLl+jfU0JK27OLReAyHQ9sTIyLAOqmJ59Ad37oOfy1CpgdnNUHsX0WgqsPSpPcyRkc9/niRdaRLgY7lbb649EMa/4tEEQFkfUAjUzAq0xmBySWvAKPxh3x/40vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719687; c=relaxed/simple;
	bh=uUCybDb0c5jUDwXhxE3nFEv0iQlgMZnj2SO5UQNqwbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVC4kmbR036ZHpsgCOEwGxctzAi6oV7a3vBrU4IFHCh57ZE4N6kYCf9HWec3sPe9rswGP3R2B9QM/E5hwHDQ4GCogiMKbZiSHQTgKPjHT1Jn7YeGfA/io03AHoANOW/R5texTlRXU5BfNTKKiYC/LAfwdm1+B0cnc5k9MlIRKBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZtnlZrqe; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749719683;
	bh=uUCybDb0c5jUDwXhxE3nFEv0iQlgMZnj2SO5UQNqwbY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZtnlZrqeEE6YqDwVJub+DYpF2Da3bPvsjC/PTjGgPMUQJEoU6XubLkKlnZRiVdOuE
	 ZaWyWR3pJahTAa5bi64+uc4W+7T0kQzuweUV3liYhandh8Yp3rhii4T/4jIDsTMFQJ
	 N9/OjNSxV34BjXrUEqtRZzyp9I6PQ0+skQAiW9YlS3caOx4EFp/KDYMBTlHbk1vhBA
	 tdnIWiPhRsC/nn7EJzC6XhGTqUMLRRKnssU3jUKiZmbY5ytDk3RtG06xw8v3jA/TXQ
	 cu1O2NPsn7MBO6880y0i4yDpqYnahE7kFsqyWtE/5eav3ddKvII+AR/+zEnqDRm7yu
	 APxa0N8hu44nw==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CC7C217E0FDB;
	Thu, 12 Jun 2025 11:14:42 +0200 (CEST)
Message-ID: <8ad71a05-db44-4d84-bb07-317bf6b31855@collabora.com>
Date: Thu, 12 Jun 2025 12:14:14 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] HID: playstation: Support DualSense audio jack
 hotplug detection
To: Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
 <20250526-dualsense-hid-jack-v1-10-a65fee4a60cc@collabora.com>
 <CAEc3jaAm4gws8drVKvQGYHoAT4fb5i7sSPJ0LFiSGHaVAzKZnA@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAEc3jaAm4gws8drVKvQGYHoAT4fb5i7sSPJ0LFiSGHaVAzKZnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Roderick,

On 6/10/25 8:04 AM, Roderick Colenbrander wrote:
> Hi Christian,
> 
> Thanks for sharing I need to have a closer look to see what we do on
> the console as well (we want to keep behavior where possible in sync
> also due to official PlayStation use cases on embedded devices).
> 
> At least use this logic only for USB, we should not register these
> nodes or apply such settings for Bluetooth. Just setting these on
> bluetooth without audio I could see affecting battery life a bit. But
> in addition, I honestly don't really see a path to supporting
> Bluetooth audio for the DualSense. It would add confusion for users.
> The reason, I don't think there is a good way for adding audio is that
> the DualSense is very, very complex. In Bluetooth mode we have our own
> ways of doing audio (non-standard), which is already tricky. Above all
> else the audio is compressed and not PCM. The only way to do it is
> probably in userspace in something PulseAudio like. So before rushing
> adding this also for Bluetooth, I want to limit this to USB.

Thanks for shedding some light on the Bluetooth side of things - I'll
make sure the introduced changes will be further restricted to USB only.

> I'm sharing some other feedback in line. It is small stuff, but in
> particular I like to keep datasheets and code in sync, so of it is
> around naming. It allows us internally for easier review as well.

Yes, please highlight any DS inconsistencies you noticed and we'll
get them fixed in the next revision.

> There are some areas I need to study some more and get internal
> documentation, so I don't have thorough feedback on the audio code
> itself yet.

No worries, please let me know when I can start preparing v2.

> Thanks,
> Roderick
> 
> On Mon, May 26, 2025 at 6:04 AM Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>
>> The default audio output path on DualSense controller hardware is set to
>> headphones, regardless of whether they are actually inserted or not.
>>
>> Detect when the plugged state of the 3.5mm audio jack changes and toggle
>> audio output between headphones and internal speaker, as required.  The
>> latter is achieved by essentially routing the right channel of the audio
>> source to the mono speaker.
>>
>> Additionally, adjust the speaker volume since its default level is too
>> low and, therefore, cannot generate any audible sound.
>>
>> It's worth noting the audio functionality is currently not supported for
>> Bluetooth, hence it's limited to USB connectivity.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/hid/hid-playstation.c | 86 +++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 83 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
>> index b7777d3230b2fe277a4a2217ef6b1eff9cfad182..ed8e67c5bf5d3a9e9721da31a6bd84f0b6802b14 100644
>> --- a/drivers/hid/hid-playstation.c
>> +++ b/drivers/hid/hid-playstation.c
>> @@ -117,6 +117,12 @@ struct ps_led_info {
>>  #define DS_STATUS_BATTERY_CHARGING             GENMASK(7, 4)
>>  #define DS_STATUS_BATTERY_CHARGING_SHIFT       4
>>
>> +/* Plugged status field of DualSense input report. */
>> +#define DS_STATUS_PLUGGED_HEADPHONES           BIT(0)
>> +#define DS_STATUS_PLUGGED_MIC                  BIT(1)
>> +#define DS_STATUS_PLUGGED_JACK                 (DS_STATUS_PLUGGED_HEADPHONES | \
>> +                                                DS_STATUS_PLUGGED_MIC)
> 
> Like I mentioned in patch 10, there are 3 status bytes. So let's call
> this DS_STATUS1_. The other 5 bits in this one are unrelated to audio.
> 
> Official datasheets call these 'HP_DETECT', 'MIC_DETECT' and
> 'MIC_MUTE'. I guess we should use those names.

Yep, will do.

>> +
>>  /* Feature version from DualSense Firmware Info report. */
>>  #define DS_FEATURE_VERSION_MINOR               GENMASK(7, 0)
>>  #define DS_FEATURE_VERSION_MAJOR               GENMASK(15, 8)
>> @@ -144,13 +150,18 @@ struct ps_led_info {
>>  /* Flags for DualSense output report. */
>>  #define DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION             BIT(0)
>>  #define DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT                   BIT(1)
>> +#define DS_OUTPUT_VALID_FLAG0_SPEAKER_VOLUME_ENABLE            BIT(5)
> Just for completeness also add BIT(6) which is MIC_VOLUME_ENABLE
>> +#define DS_OUTPUT_VALID_FLAG0_AUDIO_CONTROL_ENABLE             BIT(7)
>>  #define DS_OUTPUT_VALID_FLAG1_MIC_MUTE_LED_CONTROL_ENABLE      BIT(0)
>>  #define DS_OUTPUT_VALID_FLAG1_POWER_SAVE_CONTROL_ENABLE                BIT(1)
>>  #define DS_OUTPUT_VALID_FLAG1_LIGHTBAR_CONTROL_ENABLE          BIT(2)
>>  #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS                     BIT(3)
>>  #define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE  BIT(4)
>> +#define DS_OUTPUT_VALID_FLAG1_AUDIO_CONTROL2_ENABLE            BIT(7)
>>  #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE    BIT(1)
>>  #define DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2            BIT(2)
>> +#define DS_OUTPUT_AUDIO_FLAGS_OUTPUT_PATH_SEL                  GENMASK(5, 4)
>> +#define DS_OUTPUT_AUDIO_FLAGS2_SP_PREAMP_GAIN                  GENMASK(2, 0)
>>  #define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE                  BIT(4)
>>  #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT                     BIT(1)
>>
>> @@ -193,6 +204,11 @@ struct dualsense {
>>         u8 lightbar_green;
>>         u8 lightbar_blue;
>>
>> +       /* Audio Jack plugged state */
>> +       u8 plugged_state;
>> +       u8 prev_plugged_state;
>> +       bool prev_plugged_state_valid;
>> +
>>         /* Microphone */
>>         bool update_mic_mute;
>>         bool mic_muted;
>> @@ -237,7 +253,8 @@ struct dualsense_input_report {
>>
>>         u8 reserved3[12];
>>         u8 status_battery;
>> -       u8 reserved4[10];
>> +       u8 status_plugged;
>> +       u8 reserved4[9];
>>  } __packed;
>>  /* Common input report size shared equals the size of the USB report minus 1 byte for ReportID. */
>>  static_assert(sizeof(struct dualsense_input_report) == DS_INPUT_REPORT_USB_SIZE - 1);
>> @@ -252,11 +269,15 @@ struct dualsense_output_report_common {
>>         u8 motor_left;
>>
>>         /* Audio controls */
>> -       u8 reserved[4];
>> +       u8 headphone_audio_volume;              /* 0-0x7f */
> Just call this headphone_volume

Ack.

>> +       u8 speaker_audio_volume;                /* 0-0xff */
> Just call this speaker_volume

Ack.

>> +       u8 internal_microphone_volume;  /* 0-0x40 */
> We call this one mic_volume

Ack.

>> +       u8 audio_flags;
> We call this one audio_control.

Ack.

> 
>>         u8 mute_button_led;
>>
>>         u8 power_save_control;
>> -       u8 reserved2[28];
>> +       u8 reserved2[27];
>> +       u8 audio_flags2;
> This one we call audio_control2

Ack.

>>
>>         /* LEDs and lightbar */
>>         u8 valid_flag2;

[...]

Thanks for the review,
Cristian

