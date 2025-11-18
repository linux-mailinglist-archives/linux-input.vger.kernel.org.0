Return-Path: <linux-input+bounces-16183-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC20DC6AE64
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 18:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 6D8CD2A50D
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 17:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FC833C19D;
	Tue, 18 Nov 2025 17:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UhJ09+9U"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5EC273D9A;
	Tue, 18 Nov 2025 17:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486197; cv=none; b=WQBw3JzgeKetbVVfBHweM66k3m+IthFWeTC0aUADVe+VIax5VT06qFP3v/uNuu17ZV0aFswjt/Wecv+M5/B69g3gnYb7wvOOLmGQUI417KNSjDBvu66clXc3zDABDZhDTNmVXf+tMT8uEtpBuHt4RDyXtSwCSCnMPwIcVtavoV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486197; c=relaxed/simple;
	bh=gijQqYDq0o+b4traA8RJlFQVBbxuHFfygcz+HwEKmtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oy/E02OG2HCk7m9kZoXKRcqBVsLW2XqCgNxRau9Nus5hw1vLstlfSwQb4S3bfahlJmNTnwfBdxh/uSjdIKvUvci2+J9Up4LCmQdILirGtYNrJYRz14EiCwiIQWoxWNQrElkE0Me9bFKqvFFPdFJ18qu3LsN+foNMfFp8sgTXnrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UhJ09+9U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E44C2BCB3;
	Tue, 18 Nov 2025 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763486196;
	bh=gijQqYDq0o+b4traA8RJlFQVBbxuHFfygcz+HwEKmtU=;
	h=From:Subject:Date:To:Cc:From;
	b=UhJ09+9UJMG97QcwoPAER/FAfyjB5MUs156g0RNPbuq5EwR/hs5BlDiG1qiIxXTPV
	 G/8D7M6otnIXz+6Z5ik1t+LR8qT24qrhj1up72cx8cBcEYA6ffNk/gXQcXXCPe7Ep1
	 rA8xBwCs+nKtxccRmIVrcKMfpXRxblgSKJUxNuBx39QtuzXzvrJ/oJpDfY915NYkua
	 T6WPJi6eFD8H2L3ZRu6JSOtMW+Cjod7cq/BvvHd5cGK5P0oTRDdz9dEH9fmp+q937f
	 Mm0GilQeJgxosczrGI5HU37PNjVYTJRnZDL5MRFOP9hxjU65M6qOhbqCxXILF1PUhD
	 d4ir/34Lihl3A==
From: Benjamin Tissoires <bentiss@kernel.org>
Subject: [PATCH 00/10] HID: bpf: sync up with current udev-hid-bpf programs
Date: Tue, 18 Nov 2025 18:16:21 +0100
Message-Id: <20251118-wip-sync-udev-hid-bpf-v1-0-0f8105c54835@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOWpHGkC/x3MTQ5AMBBA4avIrE1i/HMVsaAdzKaaNoqIu2ssv
 8V7D3h2wh765AHHQbzsJoLSBNQ2mZVRdDTkWV4RUYunWPS3UXhoDriJxtkumBVzo6isO80dxNY
 6XuT6v8P4vh9vPxqzZwAAAA==
X-Change-ID: 20251118-wip-sync-udev-hid-bpf-03b7c1469de9
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>, 
 Nicholas LaPointe <nicholaslapointe8@gmail.com>, 
 Higgins Dragon <higgins@higginsdragon.com>, 
 Curran Muhlberger <curran@cs.cornell.edu>, 
 Jan Felix Langenbach <JanFelix.Langenbach@protonmail.com>, 
 Hannah Pittman <dev@hannahl.co.uk>, Colin Ian King <colin.i.king@gmail.com>, 
 Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763486192; l=1926;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=gijQqYDq0o+b4traA8RJlFQVBbxuHFfygcz+HwEKmtU=;
 b=4n5uj6FZwzGey2HOV5Vk5mJoWBzIlEZ7/i1CgFLyEbMmKztQhB/1DpF1ELCj5YeaMz5KRKD+n
 3BNXp/P/7inCOcrJ/qQqtR6chD5jmDx8YUjy96crxcpzfxfnOfQxjQY
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

As I need to get a new release of udev-hid-bpf, it would be good to
mark the currently "testing" HID-BPF programs into stable.

So I've taken all of them, formatted them to the LKML format and sent
here.

Again, no need to backport any of those into stable, we are putting them
here mostly for code archiving purpose and have a public central point
for them.

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
Benjamin Tissoires (10):
      HID: bpf: Add support for the Inspiroy 2M
      HID: bpf: add support for Huion Kamvas 13 (Gen 3) (model GS1333)
      HID: bpf: support for Huion Kamvas 16 Gen 3
      HID: bpf: Add fixup for Logitech SpaceNavigator variants
      HID: bpf: Add support for the Waltop Batteryless Tablet
      HID: bpf: Add support for the XP-Pen Deco 01 V3
      HID: bpf: Add support for XP-Pen Deco02
      HID: bpf: add heuristics to the Huion Inspiroy 2S eraser button
      HID: bpf: add the Huion Kamvas 27 Pro
      HID: bpf: fix typo in HID usage table

 drivers/hid/bpf/progs/Huion__Inspiroy-2-M.bpf.c    |  563 ++++++++
 drivers/hid/bpf/progs/Huion__Inspiroy-2-S.bpf.c    |   29 +-
 drivers/hid/bpf/progs/Huion__Kamvas-Pro-19.bpf.c   |    6 +-
 drivers/hid/bpf/progs/Huion__Kamvas13Gen3.bpf.c    | 1395 ++++++++++++++++++++
 drivers/hid/bpf/progs/Huion__Kamvas16Gen3.bpf.c    |  724 ++++++++++
 .../hid/bpf/progs/Logitech__SpaceNavigator.bpf.c   |   86 ++
 .../hid/bpf/progs/WALTOP__Batteryless-Tablet.bpf.c |  321 +++++
 drivers/hid/bpf/progs/XPPen__Deco01V3.bpf.c        |  305 +++++
 drivers/hid/bpf/progs/XPPen__Deco02.bpf.c          |  359 +++++
 drivers/hid/bpf/progs/hid_report_helpers.h         |   10 +-
 10 files changed, 3792 insertions(+), 6 deletions(-)
---
base-commit: 2953fb65481b262514ac13f24ffbc70eeace68c6
change-id: 20251118-wip-sync-udev-hid-bpf-03b7c1469de9

Best regards,
-- 
Benjamin Tissoires <bentiss@kernel.org>


