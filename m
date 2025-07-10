Return-Path: <linux-input+bounces-13449-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E5DAFF864
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 07:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C19A41C42E28
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 05:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A6027EFE9;
	Thu, 10 Jul 2025 05:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OgIN9G6+"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F8C12CDA5;
	Thu, 10 Jul 2025 05:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752125066; cv=none; b=PtBIEToeLpDRd/hQU6i8vDzrtaMcUtEpEqDb6yimfFu+manEzhGGVnYEVVBJjJPSdgzXX/qqvqE4Y81SSr0oA2/oDt3/jaGA0gK5BjLwCKrHP6idyjcvnkPueSVNpcItEBGsdyq3WnzgZnFw52fZqa1LD1xTGIqWFKenUbN6I24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752125066; c=relaxed/simple;
	bh=N0RUvwyU8hPIEOG0LjzDAehsLvHGTJMkF+Ts+JXf43I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rusE5Mwbv/dGM2E8UZEveAsRcKhJCGlwscPPdkBYQc0puLLnlg1gSIsKAO2QWX6ZH92qjabcLKPB/3TJn0ODidMDaNbdVZPIN8P0s9o+s09r2E21HuLNc6/w8soLADp/waqfaMxYGH0LFVCtXsbx2VxEvoO35y7MiQlg5hqzFM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OgIN9G6+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752125061;
	bh=N0RUvwyU8hPIEOG0LjzDAehsLvHGTJMkF+Ts+JXf43I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OgIN9G6+uUeiDk03PpqUtFMHPdrbRET+JKtCNcphv019bnjxV7HTlGRT1BHZ1PRyV
	 naZdcgHrT8BVXfC1YlgSOkt62tncKHEXabLjTSM3oeJ3IuxEHSofgntToH770A4mtZ
	 DuAMj7MG7NwoVmpJgZRfhc6lEGE0I3xDP9F1GGtSCmNdXUdQZ9h/Lw47p+mgju5l+7
	 DfbQn+cMMT/3lSB1Bs6iFypE5FEc2c3rQkwE9II11BHK3JklW621fbWpgioTh9CBo3
	 87Ua78wCNM8DHC2im7xF3oIZJiiGogQ+4S+XSZlikh25t6fnTtNMjK/CjqfjVo3Ao/
	 v7iSQkyq1ZcaA==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0219E17E07FF;
	Thu, 10 Jul 2025 07:24:20 +0200 (CEST)
Message-ID: <74d4675d-d6f5-41ed-b715-f62fb569df5d@collabora.com>
Date: Thu, 10 Jul 2025 08:24:15 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
To: Roderick Colenbrander <thunderbird2k@gmail.com>,
 Roderick Colenbrander <roderick.colenbrander@sony.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
 <s4596421-sr43-893r-o90r-86nr588sp32q@xreary.bet>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <s4596421-sr43-893r-o90r-86nr588sp32q@xreary.bet>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Roderick,

On 7/3/25 10:48 AM, Jiri Kosina wrote:
> On Wed, 25 Jun 2025, Cristian Ciocaltea wrote:
> 
>> The Sony DualSense wireless controller (PS5) provides an internal mono
>> speaker, in addition to the 3.5mm jack socket for headphone output and
>> headset microphone input.  However, the default audio output path is set
>> to headphones, regardless of whether they are actually inserted or not.
>>
>> This patch series aims to improve the audio support when operating in
>> USB mode, by implementing the following changes:
>>
>> * Detect when the plugged state of the audio jack changes and toggle
>>   audio output between headphones and internal speaker, as required.
>>   The latter is achieved by essentially routing the right channel of the
>>   audio source to the mono speaker.
>>
>> * Adjust the speaker volume since its default level is too low and,
>>   therefore, cannot generate any audible sound.
>>
>> * Register a dedicated input device for the audio jack and use it to
>>   report all headphone and headset mic insert events.
>>
>> It's worth noting the latter is necessary since the controller complies
>> with v1.0 of the USB Audio Class spec (UAC1) and, therefore, cannot
>> advertise any jack detection capability.
>>
>> However, this feature can be implemented in the generic USB audio driver
>> via quirks, i.e. by configuring an input handler to receive hotplug
>> events from the HID driver.  That's exactly what has been accomplished
>> via the "ALSA: usb-audio: Support jack detection on Sony DualSense"
>> patchset [1], which has been already merged and should be available in
>> v6.17.
>>
>> Unrelated to the above, also provide a few driver cleanup patches, e.g.
>> make use of bitfields macros, simplify locking, fix coding style.
>>
>> [1] https://lore.kernel.org/all/20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com/
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> Changes in v2:
>> - Updated cover letter including a reference to the usb-audio patch series
>> - Updated 'HID: playstation: Make use of bitfield macros' patch to drop
>>   DS_STATUS_CHARGING_SHIFT and use FIELD_GET() for battery status ops
>> - Replaced 'HID: playstation: Rename DualSense input report status
>>   field' with 'HID: playstation: Redefine DualSense input report status
>>   field' changing data type to a 3-byte array instead of renaming the
>>   struct member (Roderick)
>> - Updated 'HID: playstation: Support DualSense audio jack hotplug
>>   detection' according to Roderick's feedback:
>>  * Used DS_STATUS1_ prefixes for the plugged status register and rename
>>    its bits to match the datasheet
>>  * Defined MIC_VOLUME_ENABLE bit of DS_OUTPUT_VALID_FLAG0 register
>>  * Renamed the newly introduced audio controls members in struct
>>    dualsense_output_report_common: headphone_volume, speaker_volume,
>>    mic_volume, audio_control, audio_control2
>> - Restricted audio jack hotplug detection and event reporting to USB
>>   operation mode only, since Bluetooth audio is currently not supported
>>   and it might have a negative impact on the battery life (Roderick)
>> - Rebased series onto next-20250624
>> - Link to v1: https://lore.kernel.org/r/20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com
> 
> Just for the record -- I like the v2, and am inclined to merge it, but 
> would prefer doing that with Roderick's Ack, so I am waiting for a bit 
> here.

Could you please confirm you are fine with the latest changes so that Jiri
is able to merge the series?

If you cannot find the time to look into every detail right now, we can
still take care of any non-essential matters afterwards.

Thanks,
Cristian

