Return-Path: <linux-input+bounces-12571-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 898C4AC3F8E
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B360E18991B2
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 12:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676A1207A16;
	Mon, 26 May 2025 12:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jLsFpv9W"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33184205AA1;
	Mon, 26 May 2025 12:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263916; cv=none; b=hS8LQ02q+WvY3cpw+inV9BeWH4e5TOHDWhQIq3DThAC2oVrpsH8NMg6PtgR6esUCdIM4/ghsiTe8sXeDIp/qFRiiBLvtt09ayqsdDqK4bRMHn8FQWrvTPcdMbvC3J5sNYjUsfGdMG4couv/qOfVxxDeaXkxe6kv3soyH0tVECfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263916; c=relaxed/simple;
	bh=OH5QZrG1//Rt5FE9pTjHrkbMC3obpY+CaHTjj3/IIIY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WAMhHvhIImZKh2evV/LITeifvi5gKI4gVOFfzkLvUepVUomUc0y4VjUp1LVgN/zAZzVzQbOvLNVdsGE8Y0U25o3olDU4cHUk+1+HdKdqM/nRdkGTfgfO52MLnE9E/AKYceuwJ6ewokA2/7mrABE2MrO9h1XmsfiUkvsZew80Zv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jLsFpv9W; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748263912;
	bh=OH5QZrG1//Rt5FE9pTjHrkbMC3obpY+CaHTjj3/IIIY=;
	h=From:Subject:Date:To:Cc:From;
	b=jLsFpv9WhqWAUal5OJ98YY8lQBKD2Y13sQQvPuV2pNK2AHs4IolFbETu2qczbgboT
	 9rh+8VrsHu16WHcC5q51HuV319PVMg75edtyNugaBu9yrW3kqOyYx02JLrz91+CG8J
	 kQpvq2VRlH6sbmA4fTc0bTlIE3zf5UU+BAsdx9L0dxAhCerAxVR1nqQOFDx4ExnqkK
	 DqlrG6ewhG17H9m2ZekPI2fgWDUTeRpP6+l1N8wiNhxxqzZogTQ8l1xV8XFvP8w8im
	 Jlvw/bvRR8NsOwlRlz4g+Hw0Ya7GaL6SW57EwUOhnbiU0mx40yFYvQ/l992qvcyhLL
	 DjspK3jTOwuZA==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id E0C9617E0FD3;
	Mon, 26 May 2025 14:51:51 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
Date: Mon, 26 May 2025 15:51:23 +0300
Message-Id: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxjNGgC/x3MwQpAQBCA4VfRnE2xWsqryGHtDAYt7URK3t3m+
 B3+/wHlKKzQZg9EvkRlDwllnoGfXZgYhZLBFMYW1hik023KQRlnIVycX5EqP9R2aCy5ElJ4RB7
 l/qdd/74f6CbKDGQAAAA=
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

This patch series aims to improve the audio support by implementing the
following changes:

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
advertise any jack detection capability.  However, this feature can be
implemented in the generic USB audio driver via quirks, i.e. by
configuring an input handler to receive hotplug events from the HID
driver.

Unrelated to the above, also provide a few driver cleanup patches, e.g.
make use of bitfields macros, simplify locking, fix coding style.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
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
      HID: playstation: Rename DualSense input report status field
      HID: playstation: Support DualSense audio jack hotplug detection
      HID: playstation: Support DualSense audio jack event reporting

 drivers/hid/hid-playstation.c | 885 ++++++++++++++++++++++++------------------
 1 file changed, 500 insertions(+), 385 deletions(-)
---
base-commit: 7bac2c97af4078d7a627500c9bcdd5b033f97718
change-id: 20250522-dualsense-hid-jack-d3cb65b75da1


