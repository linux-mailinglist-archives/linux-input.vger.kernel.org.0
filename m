Return-Path: <linux-input+bounces-13858-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239DBB1E144
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 06:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CB55163458
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 04:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73415198851;
	Fri,  8 Aug 2025 04:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="bFIVDCEQ"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB3178F4A
	for <linux-input@vger.kernel.org>; Fri,  8 Aug 2025 04:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754627535; cv=none; b=QvKnMPAfKTn7daio2sK4UKm+4C5nAnwR1BebayYA/gMUIzxHEKT1Bpo30k6GnffvTFn97LKGm9zhgV5bNtOgQVWM3XboUU75C1Xo8k6dIxSgzSHOSkkylt1lFsWY7bTUpN/HQIrCmiCpPq+lNYlCBwjlo0GN4rmy/6m2TyVedWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754627535; c=relaxed/simple;
	bh=HyJxetMSxcLvXRC/GDmuEq4B3fTf6WVthRNoXFyhT8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ob4Y2upYRA77e5hwgYud+xtH5cGKixNTPMWj842jjOv0o9xnSnuL18+aMkqqSRVieIF/g2wi6SkM+Qv0GRtuUfJscG4dqtFJxHNCycVRd4/ZTpXWFXhXmai2/BjZ4N9CUwBRxRQldTNAnMbULM6ghCuvZy8CKRpmaHfP4pll570=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=bFIVDCEQ; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1754627527; bh=HyJxetMSxcLvXRC/GDmuEq4B3fTf6WVthRNoXFyhT8w=;
	h=From:To:Cc:Subject:Date:From;
	b=bFIVDCEQUUhvaVspWRYLCy9xOjgWVpNKobjsZtJSpJsR3nrrfhzhrC8tpEKulHM63
	 KXbzkLnjchRppEiO+47jUS2rOoserRH0gohUkTgvRhnCgVM3S7F41Mkq4U5NV62j28
	 dA6Oxs8BsqSqfLVVUftoKvM+cwBlMgI/07lA5CSfFjnCChsJ3D68o8u2LDFumSC6vI
	 K5UwYv/XIkC57DRVlykIhjoAIPVtfsgus4BIxmMLRDAMrGovTPp08XLCVcCetm/WOT
	 o9GIKFeFdkX2bZRccV8i1mQpfjPvUOc/1NpqotloE8U5H/C+e6vN6xY1/yGm9kyTCY
	 Yg4noOu4LNxOg==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id D763CA03E;
	Thu,  7 Aug 2025 21:32:06 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 0/6] Input: xbox_gip - Add new driver for Xbox GIP
Date: Thu,  7 Aug 2025 21:30:07 -0700
Message-ID: <20250808043017.1953101-1-vi@endrift.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This introduces a new driver for the Xbox One/Series controller protocol,
officially known as the Gaming Input Protocol, or GIP for short.

Microsoft released documentation on (some of) GIP in late 2024, upon which
this driver is based. Though the documentation was incomplete, it still
provided enough information to warrant a clean start over the previous,
incomplete implementation.

This driver is already at feature parity with the GIP support in xpad,
along with several more enhancements:

- Proper support for parsing message length and fragmented messages
- Metadata parsing, allowing for auto-detection on various parameters,
  including the presence and location in the message of the share button,
  as well as detection of specific device types
- Controllable LED support
- HID passthrough for the Chatpad
- Preliminary support for racing wheels and flight sticks

The framework set out in this driver also allows future expansion for
specialized device types and additional features more cleanly than xpad.

Future plans include:

- Improved support for racing wheels and flight sticks, including force
  feedback and LED support.
- Support for the security handshake, which is required for devices that use
  wireless dongles.
- Exposing a raw character device to enable sending vendor-specific commands
  from userspace.
- Event logging to either sysfs or dmesg.
- Support for the headphone jack.

Also included in this series is the addition of three new ABS input types, with
the two relevant ones to HID added to the mappings

Vicki Pfau (6):
  Input: xbox_gip - Add new driver for Xbox GIP
  Input: xpad - Remove Xbox One support
  Input: Add ABS_CLUTCH, HANDBRAKE, and SHIFTER
  HID: Map more automobile simulation inputs
  Input: xbox_gip - Add wheel support
  Input: xbox_gip - Add flight stick support

 Documentation/input/devices/xpad.rst   |   17 +-
 MAINTAINERS                            |    6 +
 drivers/hid/hid-debug.c                |   16 +-
 drivers/hid/hid-input.c                |    2 +
 drivers/input/joystick/Kconfig         |   26 +
 drivers/input/joystick/Makefile        |    1 +
 drivers/input/joystick/xbox_gip.c      | 3434 ++++++++++++++++++++++++
 drivers/input/joystick/xpad.c          |  634 +----
 include/uapi/linux/input-event-codes.h |    3 +
 9 files changed, 3492 insertions(+), 647 deletions(-)
 create mode 100644 drivers/input/joystick/xbox_gip.c

-- 
2.50.1


