Return-Path: <linux-input+bounces-9642-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 085F8A24891
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 793801884BA1
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C63158862;
	Sat,  1 Feb 2025 11:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHPwLjql"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B7EBA34;
	Sat,  1 Feb 2025 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409952; cv=none; b=dxh+cr9Jyu0n7Efuflmz2McTeCAsQy3pQHrMilDrOq879cKK45iovrYsuJTM8FHUF5fB3gV8i4jBzCwaH+qUx921LLMYKM1ekS+XgvBPPQG6DyrJbhl77xdi+/tKtG+b6aeM9AEmpJ7ITNTW9CXNKOyv3+DLP27jz8SZZnZQTbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409952; c=relaxed/simple;
	bh=xqubo7WkGt+08x3RQNNtSAioif+QZDVy5kpujPRiZVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ULHA3ptLPzwS2kDHCcdaDIiER7VZ/8CXWQeyuD2IFA17VSMx0DBMvzsQ/UEEJNtoxWqvxDKUbgCy4BehuGVqBG25Q7L8fJdLe2GsHI0tlR2FAvzyHr6ZSLH6b732lZ1CqQDQihhUcBDWay3RkExwI+idpikcS0J9bNPaXKil1g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHPwLjql; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3e5c225aaso572945a12.3;
        Sat, 01 Feb 2025 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409949; x=1739014749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZ/ZjSt0ABcfCQGwm2pY6u63/eAtmWzCx6fQWtzxRa4=;
        b=IHPwLjqlsk+wIsp2TBe0BTNSphVo3gQOlwCMgwlcFWPligIxyL0cNwXfv6e/0dOMnd
         JxA3JFDZTuS0m9BqYO2xj0gJ3tCL3jxhyOd4/Pk+wcKRiTcjq3tHy4MHd17+bBg6rOtY
         guxxPczrz/VM03QUR9O7IE7ZcL8P0wxKmWTa0fV7J5bv1iZnc8esp6BKeB0kC5Ef+JNQ
         c5MCzkb41WbhPKFoJlQ6I2O7szOYxMw4k+wBaN2XnP2jcJovQSTH9k9hzYliu4blaSt6
         fMeF1ZTtkXlLXsEMdizpzEGrYv+BZV44FXAsHKNi521Dn6ahpA2cxUYgk1BqVdqyLRW1
         RAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409949; x=1739014749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ/ZjSt0ABcfCQGwm2pY6u63/eAtmWzCx6fQWtzxRa4=;
        b=bhT4Vo0RGFyFNsy5EkE8ukUHjFjcKS9ku8FIsL7lKFyoCCfZY5Nmn5uAhDXc4FrcWc
         dXmHuNJj82KGszPvMkzYcJNdlF+al9L/Ukdq3KRr7VPwF36RrIuSwJ5l364fZlvpmN0P
         PnNOZcnVnhOeyn9NlYuIBTk4ajP/Qe9fO1St0zXOjbvEaxqoOOKtx4RxouS7y0eGBC5H
         hCb0oDMimvVQDAUEbAj1wWich2C5RMatmJwfBd3sGjc1/EmkOI7DawBNv1krzu4WmKoR
         a/lL5eaz48YJvE/x7lwXrHT4WQhNDcgMcND4EUdGpNk9Yq+RNbMdZqbd4PHbo2I3ivg6
         O5yA==
X-Forwarded-Encrypted: i=1; AJvYcCXIjF5FT+ANQHdhIbNTyCebyigyOPg6aRpRAQ7wZr9PGEBpA5a23tSjf/Xi/WEgZKWPLw3kw1JIMW9u@vger.kernel.org, AJvYcCXzGhP2KwYfjSEvek2SyPTxz0YY80TT7JXn2LB0/DMNVPdbvzj1Y1WaV5NejzqmUGW0vzj9bVkKjo31uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu4eyrLr/kYwyZ1PuR2TVok8W4RRyMSLmX353yYnA2UDMV18i/
	6J2jHN67oYniRSiwiyfLyng1uosKzeo74/wOOos3Dh7T44ClgMOaXB4Shg==
X-Gm-Gg: ASbGnctKqVnkqqlbdLbI4ZSR8RvqKTR7t/J6jv+xF+eRu8qyZJdlTqbzMNdtsHzFISp
	lvZ/N1qlOIguilCZtRN//FIFT20FPavHorzecY/3Lix3y64g+ZUuQUZ9Naqe3MzhFqHzq0OR1xp
	AOyjbx877oHA0gitLceG2Pbkv3jCUv8mVWEovxCm1gChOQxtlxej6MwJke4FSWuy4NrQWYqDCle
	wFon535CO82sT+DRN1EVTsDIgHBK+TGJOVpVPZ1VRE0U1uLgjJI4Scm+Q5/ze47jztwgbCEcyvd
	jgX1FU/Hr65NsCL6DrUmNQKKgro/u2asCFb1nSm6lJdaJ4ovkbuhlhO0mcwQ7A==
X-Google-Smtp-Source: AGHT+IFPBHJepqH+M6+j77pLWrrs5/vfgBam1iVqhknM/+kFwv8Rlh83kGq5AM9KvcEbbLDQzyShDw==
X-Received: by 2002:aa7:c7c6:0:b0:5dc:71f6:9720 with SMTP id 4fb4d7f45d1cf-5dc71f69871mr3341141a12.3.1738409948428;
        Sat, 01 Feb 2025 03:39:08 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:08 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 00/22] HID: Upgrade the generic pidff driver and add hid-universal-pidff
Date: Sat,  1 Feb 2025 12:38:44 +0100
Message-ID: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series is focused on improving the compatibility and usability of the
hid-pidff force feedback driver. Last patch introduces a new, universal driver
for PID devices that need some special handling like report fixups, remapping the
button range, managing new pidff quirks and setting desirable fuzz/flat values.

This work has been done in the span of the past months with the help of the great
Linux simracing community, with a little input from sim flight fans from FFBeast.

No changes interfere with compliant and currently working PID devices.
"Generic" codepath was tested as well with Moza and Simxperience AccuForce v2.

I'm not married to the name. It's what we used previously, but if "universal" is
confusing (pidff is already the generic driver), we can come up with something
better like "hid-quirky-pidff" :)

With v8 and  tiny finx in v9, all the outstanding issues were resolved,
additional pidff issues were fixed and hid-pidff defines moved to a dedicated
header file. This patch series could be considered done bar any comments and
requests from input maintainers.

I could save more then a dozen lines of code by changing simple if statements
to only occupy on line instead of two in there's a need for that.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>

---
Changes in v9:
- Properly assign fade_length to FADE_TIME in pidff_set_envelope_report
- Update review and test signatures
- Extract pool report fetch from pidff_reset to a separate function
  and call it during init
- Link to v8: https://lore.kernel.org/all/20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com

Changes in v8:
- Enabled rescaling for all the time fields instead of just periodic
  effect period.
- Fixed null pointer dereference in pidff_find_special_field and
  pidff_init_fields when optional reports were missing. Reported
  previously by Nolan Nicholson on LKML.
- All hid-pidff defines were moved into a dedicated header instead
  of residing in includes/linux/hid.h. They are not needed outside
  of the kernel.
- Fixed bitmask clearing in pidff_send_device_control
- Greatly simplified pidff_rescale_signed
- Macros in place of hardcoded u16,s16 min/max values
- Added review signatures
- Added testing signatures
- Link to v7: https://lore.kernel.org/all/20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com

Changes in v7:
- Check if device gain field exists before setting device gain. Fixes
  possible null pointer dereference.
- Indentation fixes
- Fixed typos and language style in commit messages
- Link to v6: https://lore.kernel.org/all/20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com

Changes in v6:
- Rebased on v6.13
- Added missing SOBs
- Reworked and fixed pidff_reset function
- Simplified pidff_upload_effect function
- Moved magic values into defines
- Added PERIODIC effect period rescaling
- Support "split" devices with a separate "input device" for buttons.
- Fixed comment styling
- Improved set_gain handling
- Fixed MISSING_PBO quirk
- Fix possible null pointer dereference while calling
  pidff_needs_set_envelope
- Link to v5: https://lore.kernel.org/all/20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com

Changes in v5:
- Added PERIODIC_SINE_ONLY quirk
- Link to v4: https://lore.kernel.org/all/20250113124923.234060-7-tomasz.pakula.oficjalny@gmail.com

Changes in v4:
- Added PXN devices and their hid ids
- Added hid-universal-pidff entry in the MAINTAINERS file
- Link to v3: https://lore.kernel.org/all/20250106213539.77709-2-tomasz.pakula.oficjalny@gmail.com

Changes in v3:
- Fixed a missed incompatible pointer type while assigning
  hid_pidff_init_with_quirks to init_function pointer (void -> int)
- Improved Kconfig entry name to adhere to the alphabetical order of
  special HID drivers
- Extended cover letter
- Link to v2: https://lore.kernel.org/all/20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com

Changes in v2:
- Fix typo in a comment
- Fix a possible null pointer dereference when calling
  hid_pidff_init_with_quirks especially when compiling with HID_PID=n
- Fix axis identifier when updating fuzz/flat for FFBeast Joystick
- Link to v1: https://lore.kernel.org/all/20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com

---
Tomasz Pakuła (22):
  HID: pidff: Convert infinite length from Linux API to PID standard
  HID: pidff: Do not send effect envelope if it's empty
  HID: pidff: Clamp PERIODIC effect period to device's logical range
  HID: pidff: Add MISSING_DELAY quirk and its detection
  HID: pidff: Add MISSING_PBO quirk and its detection
  HID: pidff: Add PERMISSIVE_CONTROL quirk
  HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
  HID: pidff: Add FIX_WHEEL_DIRECTION quirk
  HID: pidff: Stop all effects before enabling actuators
  HID: Add hid-universal-pidff driver and supported device ids
  MAINTAINERS: Add entry for hid-universal-pidff driver
  HID: pidff: Add PERIODIC_SINE_ONLY quirk
  HID: pidff: Completely rework and fix pidff_reset function
  HID: pidff: Simplify pidff_upload_effect function
  HID: pidff: Define values used in pidff_find_special_fields
  HID: pidff: Rescale time values to match field units
  HID: pidff: Factor out code for setting gain
  HID: pidff: Fix null pointer dereference in pidff_find_fields
  HID: pidff: Move all hid-pidff definitions to a dedicated header
  HID: pidff: Simplify pidff_rescale_signed
  HID: pidff: Use macros instead of hardcoded min/max values for shorts
  HID: pidff: Factor out pool report fetch and remove excess declaration

 MAINTAINERS                       |   7 +
 drivers/hid/Kconfig               |  14 +
 drivers/hid/Makefile              |   1 +
 drivers/hid/hid-ids.h             |  31 ++
 drivers/hid/hid-universal-pidff.c | 198 ++++++++++++
 drivers/hid/usbhid/hid-core.c     |   1 +
 drivers/hid/usbhid/hid-pidff.c    | 503 ++++++++++++++++++++----------
 drivers/hid/usbhid/hid-pidff.h    |  33 ++
 include/linux/hid.h               |   6 -
 9 files changed, 622 insertions(+), 172 deletions(-)
 create mode 100644 drivers/hid/hid-universal-pidff.c
 create mode 100644 drivers/hid/usbhid/hid-pidff.h


base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
-- 
2.48.1


