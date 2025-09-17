Return-Path: <linux-input+bounces-14794-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BE4B7F589
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 15:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 246703BADA8
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 09:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241AC2BEC5A;
	Wed, 17 Sep 2025 09:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDYbIHRm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E897E225390;
	Wed, 17 Sep 2025 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758101676; cv=none; b=BSlav8FUKuNCnYF+hO14VQL/mqjZtp9wkNP31UbhD/6tTajsTmF68Wnrto1wnJ+QZAH9tjzBdhwKMp87WV+uxCGWq06A8I8Bb5gtY/v+z2z1DZODC9cWhr4FABxURL7mw1L/wU83EC6ZvJjKjEwVj+5Jm8WWpzZLxx9xsMZMQ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758101676; c=relaxed/simple;
	bh=0/Q/xtVmvxED0SF1PpOJ5CnswZ2sjSk7MFTqCaY8FN0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o+o5qx0SWgU1uCI1PTfBg0iec3QUGurP4eEwaiWNH9XrkC8HoA6bDKLBXngH6t+5El2J6m7FpNYSr9YV0sPAWt/nC8i+/n7fo3fwBgJVMrJt2SEnNj+QC0oDEAY3qLo7MlWrYKMN6cUwiZf6rF6TQqLzW0gNEQv+MVkVy/gZU3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDYbIHRm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D458C4CEF0;
	Wed, 17 Sep 2025 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758101675;
	bh=0/Q/xtVmvxED0SF1PpOJ5CnswZ2sjSk7MFTqCaY8FN0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PDYbIHRmFJ+saF4hnW9ehbIv++SuIQfzNyHCQytIY+JFiFI3EobwRCrCguC+lED+e
	 3qEK4zuqTE7XzTSpynU5Ljr5YdoS9jz+2kaxi8NlN22r1MiFCWs0lVvdkIHBNb5tBH
	 /eUAlSs2k/1jWhWMyHt8OPZ/ClVwSRC1bSUH4lJ5e1bkqqXfjIVoDA0su9T/KFkPOG
	 ulgzjDSYgU9dn+AUyNaRzpfMvrttvIQR8b0S4ie5uYE+wrbqo/V+ak1z4jLcxIe+lY
	 oQ1xQSFxIH2VRVtBZa90anR9GMZPdu8/a7ulJ2L4LczsLihahK7u8xOjuIlMMoREC0
	 PQ3iQoIRJFgaw==
Date: Wed, 17 Sep 2025 11:34:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
In-Reply-To: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
Message-ID: <rs2s0181-65s8-2710-029s-79qq90257p48@xreary.bet>
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Jun 2025, Cristian Ciocaltea wrote:

> The Sony DualSense wireless controller (PS5) provides an internal mono
> speaker, in addition to the 3.5mm jack socket for headphone output and
> headset microphone input.  However, the default audio output path is set
> to headphones, regardless of whether they are actually inserted or not.
> 
> This patch series aims to improve the audio support when operating in
> USB mode, by implementing the following changes:
> 
> * Detect when the plugged state of the audio jack changes and toggle
>   audio output between headphones and internal speaker, as required.
>   The latter is achieved by essentially routing the right channel of the
>   audio source to the mono speaker.
> 
> * Adjust the speaker volume since its default level is too low and,
>   therefore, cannot generate any audible sound.
> 
> * Register a dedicated input device for the audio jack and use it to
>   report all headphone and headset mic insert events.
> 
> It's worth noting the latter is necessary since the controller complies
> with v1.0 of the USB Audio Class spec (UAC1) and, therefore, cannot
> advertise any jack detection capability.
> 
> However, this feature can be implemented in the generic USB audio driver
> via quirks, i.e. by configuring an input handler to receive hotplug
> events from the HID driver.  That's exactly what has been accomplished
> via the "ALSA: usb-audio: Support jack detection on Sony DualSense"
> patchset [1], which has been already merged and should be available in
> v6.17.
> 
> Unrelated to the above, also provide a few driver cleanup patches, e.g.
> make use of bitfields macros, simplify locking, fix coding style.
> 
> [1] https://lore.kernel.org/all/20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com/
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v2:
> - Updated cover letter including a reference to the usb-audio patch series
> - Updated 'HID: playstation: Make use of bitfield macros' patch to drop
>   DS_STATUS_CHARGING_SHIFT and use FIELD_GET() for battery status ops
> - Replaced 'HID: playstation: Rename DualSense input report status
>   field' with 'HID: playstation: Redefine DualSense input report status
>   field' changing data type to a 3-byte array instead of renaming the
>   struct member (Roderick)
> - Updated 'HID: playstation: Support DualSense audio jack hotplug
>   detection' according to Roderick's feedback:
>  * Used DS_STATUS1_ prefixes for the plugged status register and rename
>    its bits to match the datasheet
>  * Defined MIC_VOLUME_ENABLE bit of DS_OUTPUT_VALID_FLAG0 register
>  * Renamed the newly introduced audio controls members in struct
>    dualsense_output_report_common: headphone_volume, speaker_volume,
>    mic_volume, audio_control, audio_control2
> - Restricted audio jack hotplug detection and event reporting to USB
>   operation mode only, since Bluetooth audio is currently not supported
>   and it might have a negative impact on the battery life (Roderick)
> - Rebased series onto next-20250624
> - Link to v1: https://lore.kernel.org/r/20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com

This is now queued in hid.git#for-6.18/playstation. Thanks,

-- 
Jiri Kosina
SUSE Labs


