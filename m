Return-Path: <linux-input+bounces-13356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97455AF6BEF
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 09:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D30B3B95C3
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 07:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB362980D3;
	Thu,  3 Jul 2025 07:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsJah6se"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66161C07F6;
	Thu,  3 Jul 2025 07:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528894; cv=none; b=XTXyvuQKcphBjDhMFJwjkMjATIESLPgjcWJEArE29F5+/fTIsU49PwQ4u++6yhS+ux3BXpBFd/CaY5mpVUxlle3An0BVkvUaoTMdZOD4jTi9XchUGwS1lhAnM5eZ2GKUBkMA+22Ky9QuQxpIGPgEgRceINvB1ejkzfCgQ0HjIt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528894; c=relaxed/simple;
	bh=R1JZXLhzsP6GKBgRmVdhQ1yr4uSjM3A3hQpAb2vJpb8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YXSjhUriGIrJG+MW5JuaEwL9hSqHz+WH09JZ3qZkhINfh6pSuenE/4c2XKL/E0xqySSLCU4TdxTcRvxqWkUCbZzikP0UXjU6553DLrPGntHmIzJb2fKgB2eZ8lnKe7EfB0u7MGdiF8TI5oJnJIhcy0QHcAs6Hsf3pYBZH3xqfQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsJah6se; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48C9C4CEE3;
	Thu,  3 Jul 2025 07:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751528894;
	bh=R1JZXLhzsP6GKBgRmVdhQ1yr4uSjM3A3hQpAb2vJpb8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WsJah6se5ilQMs3YtWzOTr3q+vhJVzzWlySN6om95oUNMzaKkTrP9MFQmcjFTo2tC
	 6jcgKfyZ7KrOh3Jq73LLYxWAbE53ir7rrhCoe7rXCwLHsskl5MkmrxANW7xrkT5NOx
	 7ydbVu+0xEJgGiga3x//wBHLksaACXpklGMcLBVc6qeBnIWdtYmgmcBljKSBC+iVrq
	 VDnqHEIDWnojq69CxxRFKVPc2iaJMWHnSc3W0bd5Uyu5KBUGFjDshgT1cP6Mqhl7Ts
	 Hb3Dcp4LXH9XWstvqA27vIHu1o9vFLgYE6jxPooTeHcb65jplqZz9ABGU91/glv7Bk
	 FQQpOfexOcvAg==
Date: Thu, 3 Jul 2025 09:48:11 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
In-Reply-To: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
Message-ID: <s4596421-sr43-893r-o90r-86nr588sp32q@xreary.bet>
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

Just for the record -- I like the v2, and am inclined to merge it, but 
would prefer doing that with Roderick's Ack, so I am waiting for a bit 
here.

Thanks,

-- 
Jiri Kosina
SUSE Labs


