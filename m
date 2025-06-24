Return-Path: <linux-input+bounces-13016-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC915AE71CC
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 23:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFD5A189FEB0
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 21:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1DB25A65B;
	Tue, 24 Jun 2025 21:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mxK/4yrp"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20C72561C2;
	Tue, 24 Jun 2025 21:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750802227; cv=none; b=Ua2u+FSR2LE21okGt+2mJFJh8qZ79oTJt5mBMo1FTJ4kB3hpVZh5rRVpgY38T1JE9Feqm004iR1k+ZIvnADm/ioaQxVISFSCj2xgazgf0Eoj7Nj4X0tl0dAr5+JjhrZ7iXWg4n6u39ZQcEXTYyE+1vWEmJ816jThApgmsaFqm2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750802227; c=relaxed/simple;
	bh=sCTGMmLGBvUI9ZIqxY+A5QfbiMSuuC4+1AdSiwd7Ukw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/hzZZ0jSrV1UASiRWBrgK6omkQ30kWndoFfyaKMKYiy/mlrbTh94K5MuDY+/T0v8NlacYIpGqMYB239NHRf2+dtsQWVRDRKqAfQOaYoL4AfyV2g7TLfbSp3Mcr7IjfhTWlVGqslbuSbWhv1vAbKH2JvLQytlgwO0cuyDgnAAc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mxK/4yrp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750802222;
	bh=sCTGMmLGBvUI9ZIqxY+A5QfbiMSuuC4+1AdSiwd7Ukw=;
	h=From:Subject:Date:To:Cc:From;
	b=mxK/4yrpsc02C2aBPHWJp+5BQq0B2VV4I51nldN7NtTYfZaSdHoSlYSpLWRNUNzam
	 RHzG8maKG4QfDvQdOaqgR0j2czsGOLrynnEt8oYdbpPb5rZbK7Wtw0LsiSN1o24ELY
	 hPrW+y1J+eBOg0kAmNkY9H2AuJHKJqU+4D+3TLvyNz7Mo/eJbBlF7w95KZ8K2akUMy
	 yiANd+l5NKJlP/O6wNGAFlUHhli7KsnNpHIv3j/EqHUoq4nAyWHDNXKnlM4rluyaHl
	 pcAAEd0IOF88Kh1SO7wHuTQ1Uq8wktwUCJVPpSYuq7TTn+cQU5/Y6CYNXCkGjMlVM0
	 jlIzHfdSSIh/w==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 91D7B17E0E8F;
	Tue, 24 Jun 2025 23:57:02 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
Date: Wed, 25 Jun 2025 00:56:44 +0300
Message-Id: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwfW2gC/22NQQrCMBBFryKzdiSNJoIr7yFdTCdTO1obSbQop
 Xc3Fty5fA/++xNkSSoZDqsJkoyaNQ4F7HoF3NFwFtRQGKyxzjhrMTypzzJkwU4DXoivGLbceNf
 sXaAKyvCepNXXEj3VhTvNj5jey8dYfe0v5//lxgoNknetyI68YT5y7HtqYqINxxvU8zx/AFT8b
 1m4AAAA
X-Change-ID: 20250522-dualsense-hid-jack-d3cb65b75da1
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

The Sony DualSense wireless controller (PS5) provides an internal mono
speaker, in addition to the 3.5mm jack socket for headphone output and
headset microphone input.  However, the default audio output path is set
to headphones, regardless of whether they are actually inserted or not.

This patch series aims to improve the audio support when operating in
USB mode, by implementing the following changes:

* Detect when the plugged state of the audio jack changes and toggle
  audio output between headphones and internal speaker, as required.
  The latter is achieved by essentially routing the right channel of the
  audio source to the mono speaker.

* Adjust the speaker volume since its default level is too low and,
  therefore, cannot generate any audible sound.

* Register a dedicated input device for the audio jack and use it to
  report all headphone and headset mic insert events.

It's worth noting the latter is necessary since the controller complies
with v1.0 of the USB Audio Class spec (UAC1) and, therefore, cannot
advertise any jack detection capability.

However, this feature can be implemented in the generic USB audio driver
via quirks, i.e. by configuring an input handler to receive hotplug
events from the HID driver.  That's exactly what has been accomplished
via the "ALSA: usb-audio: Support jack detection on Sony DualSense"
patchset [1], which has been already merged and should be available in
v6.17.

Unrelated to the above, also provide a few driver cleanup patches, e.g.
make use of bitfields macros, simplify locking, fix coding style.

[1] https://lore.kernel.org/all/20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Updated cover letter including a reference to the usb-audio patch series
- Updated 'HID: playstation: Make use of bitfield macros' patch to drop
  DS_STATUS_CHARGING_SHIFT and use FIELD_GET() for battery status ops
- Replaced 'HID: playstation: Rename DualSense input report status
  field' with 'HID: playstation: Redefine DualSense input report status
  field' changing data type to a 3-byte array instead of renaming the
  struct member (Roderick)
- Updated 'HID: playstation: Support DualSense audio jack hotplug
  detection' according to Roderick's feedback:
 * Used DS_STATUS1_ prefixes for the plugged status register and rename
   its bits to match the datasheet
 * Defined MIC_VOLUME_ENABLE bit of DS_OUTPUT_VALID_FLAG0 register
 * Renamed the newly introduced audio controls members in struct
   dualsense_output_report_common: headphone_volume, speaker_volume,
   mic_volume, audio_control, audio_control2
- Restricted audio jack hotplug detection and event reporting to USB
  operation mode only, since Bluetooth audio is currently not supported
  and it might have a negative impact on the battery life (Roderick)
- Rebased series onto next-20250624
- Link to v1: https://lore.kernel.org/r/20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com

---
Cristian Ciocaltea (11):
      HID: playstation: Make use of bitfield macros
      HID: playstation: Add spaces around arithmetic operators
      HID: playstation: Simplify locking with guard() and scoped_guard()
      HID: playstation: Replace uint{32,16,8}_t with u{32,16,8}
      HID: playstation: Correct spelling in comment sections
      HID: playstation: Fix all alignment and line length issues
      HID: playstation: Document spinlock_t usage
      HID: playstation: Prefer kzalloc(sizeof(*buf)...)
      HID: playstation: Redefine DualSense input report status field
      HID: playstation: Support DualSense audio jack hotplug detection
      HID: playstation: Support DualSense audio jack event reporting

 drivers/hid/hid-playstation.c | 891 ++++++++++++++++++++++++------------------
 1 file changed, 506 insertions(+), 385 deletions(-)
---
base-commit: 2ae2aaafb21454f4781c30734959cf223ab486ef
change-id: 20250522-dualsense-hid-jack-d3cb65b75da1


