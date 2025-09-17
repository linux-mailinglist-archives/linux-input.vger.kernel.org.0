Return-Path: <linux-input+bounces-14777-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E7B7C58D
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 13:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05B261889DE3
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 01:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1052F219A7E;
	Wed, 17 Sep 2025 01:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="znO7CL+/"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017BA214A79
	for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 01:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758072007; cv=none; b=UR3oapNzyJiNDn+oU+wVkVUXMZ4nux7ejPF4pKgMDmFcQiqiSTogCTpef+H9GvLBsOASiHcVHODStpHD//fPBYiXxrSoK2SCYnE4CI+KqrZY0y4Ao5LNJX93oJJNnpzCFI/4T7eVgRXtziAqP7aSqDuHgi/4Z2icWPss3C3M43g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758072007; c=relaxed/simple;
	bh=yvJEOGmZ6edq8DeCRLAz6lFwwt6RGOsRVFFDtfMm/Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CfKflw7YNeOkUw95ggKZ9wD9oYWa2bQ11dQQwSsK4ON/Kc2cDbzC/dBhou9ZJcbEHeqf/vmgv6d/g5j5EOVbqwzX0Pn3Z18061FoWgDJZEPsNxCPVeYUmsf4tZj9Q+fBhzf0UA0loaiU5PsNURtI/1iusySfpuzijVIdrG8YYZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=znO7CL+/; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1758071998; bh=yvJEOGmZ6edq8DeCRLAz6lFwwt6RGOsRVFFDtfMm/Wk=;
	h=From:To:Cc:Subject:Date:From;
	b=znO7CL+//vuBsMgyrdN+VjawRr7EN3VQmMG29YV57325plbnpZtDy91MK5lyf25Pf
	 bUtrOzKvNV6ICFkhzufLQY5c3YJ1MvzQR/3hHiKwjY+qrdGe0nEwG00QXOspV4gT9V
	 r/VTX5NcxZJAO8bOmJU20+Z0TE1Bf6K2eRaNONQQwORnwlldfIy1wmdtwldb+srRGB
	 YZQyA1fH4XpDanT4rVgrEcS6J5gFgnZbeA7jnY222lxG5oLgBHgRqoTKzoUx3lnB8y
	 1J383GZvSAwQGBFXBP1dDEb2E1sPSnRjaeFSuLksO4OxAQkCIz4lxvPAo9nmTZ8nqj
	 qk6xMMp6GwO6w==
Received: from microtis.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id C68FCA053;
	Tue, 16 Sep 2025 18:19:57 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH v2 0/5] Input: xbox_gip - Add new driver for Xbox GIP
Date: Tue, 16 Sep 2025 18:19:29 -0700
Message-ID: <20250917011937.1649481-1-vi@endrift.com>
X-Mailer: git-send-email 2.51.0
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
- Preliminary support for racing wheels

The framework set out in this driver also allows future expansion for
specialized device types and additional features more cleanly than xpad.

Future plans include:

- Flight stick support
- Improved support for racing wheels, including force feedback support
- Support for the security handshake, which is required for devices that use
  wireless dongles
- Exposing a raw character device to enable sending vendor-specific commands
  from userspace
- Event logging to either sysfs or dmesg
- Support for the headphone jack
- Splitting the driver into separate drivers treating gip as a bus with each
  attachment being able to have its own gip_driver defined by a preferred type
  and/or GUID

Also included in this series is the addition of three new ABS input types, with
the two relevant ones to HID added to the mappings

v2 of this series is mostly the same as v1 rebased onto dtor/master so it
actually applies cleanly, with one major difference: flight stick support has
been omitted, as I was unhappy with how mapping worked and want to discuss it
further before having a patch readied.

Vicki Pfau (5):
  Input: xbox_gip - Add new driver for Xbox GIP
  Input: xpad - Remove Xbox One support
  Input: Add ABS_CLUTCH, HANDBRAKE, and SHIFTER
  HID: Map more automobile simulation inputs
  Input: xbox_gip - Add wheel support

 Documentation/input/devices/xpad.rst   |   17 +-
 MAINTAINERS                            |    6 +
 drivers/hid/hid-debug.c                |   16 +-
 drivers/hid/hid-input.c                |    2 +
 drivers/input/joystick/Kconfig         |   26 +
 drivers/input/joystick/Makefile        |    1 +
 drivers/input/joystick/xbox_gip.c      | 3314 ++++++++++++++++++++++++
 drivers/input/joystick/xpad.c          |  634 +----
 include/uapi/linux/input-event-codes.h |    3 +
 9 files changed, 3372 insertions(+), 647 deletions(-)
 create mode 100644 drivers/input/joystick/xbox_gip.c

-- 
2.51.0


