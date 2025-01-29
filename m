Return-Path: <linux-input+bounces-9605-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7711A225AB
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 22:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 635257A0F6D
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 21:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF761E25EC;
	Wed, 29 Jan 2025 21:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaXhthrQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840E51E2843;
	Wed, 29 Jan 2025 21:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738186184; cv=none; b=SF+vaIfyPw723Mtze13ABKzrMqtyLM0GTfRotv7Iem8v/97J5RpmwM/xYCLzOaIXjMbjWs0Er3NmNZGu5zm0dSje4JVQ2HV7iLm8uFSdfmMvbB4zoZwQuaGM32scBrFCVQpt7BJGWkTnM9mbFqN0ctDz2qsxMiQ3QJot2H3CNzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738186184; c=relaxed/simple;
	bh=sbHJ0uIpLku5KYs03BS+ssj2TdgoIhLPm0Eq0UPvhv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GsXyGKS+eW42vTrthQHziqP/xYXw4ishD523d/znkX40iMwaIfAiMkB2GVVZnN1eV+nePG0nCq1FN+sc1GYbVW4d0gA5HUNISSbqw/1EHZFptuL3BO9I03VUcq6dZIyxEpZGVSm8Wqhxn1T4HP2iMpvJebzLVTLOidmuzXIV5Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaXhthrQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5426f715afeso16797e87.3;
        Wed, 29 Jan 2025 13:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186180; x=1738790980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6vP6XOeNtIpR3j4Jzf7uNXfoB57kT2cnSUlZqmTaCuQ=;
        b=SaXhthrQmsocUVwKmyf5pGifC7vRgA5rl4ThWPoqqPDas+WqXgqIyqqkelbmwe609G
         fRgPg4b8pJ1L/4nNhFgjaFCtA5KOxiZj+H8COwxYQcTQRPSLq1DnyNmGr8lgQ95lNjsI
         Kl1FoNG8Urd4Ak38jULiMdQtw9cVH95J7cMIpNw8saBj3B/cJdorbFLzzrdb7jk8ZaFN
         w8vpg2tMQnayDL83xauiGttj6/0sR3Q+fImjN4gZi6oR22hgifxw+oA6b5dA6MyVNYPS
         Uhjwt30DlN1QiLq5AMWkneuAxcGyAw0WWk7yzB+XJbXTfMZaNPuWM6dFZsxIG5UZJCbu
         yBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186180; x=1738790980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vP6XOeNtIpR3j4Jzf7uNXfoB57kT2cnSUlZqmTaCuQ=;
        b=Zv0L1Uu1D1tyjn+ApM28uZPhVTsvtArn6QfD59w0F4sKClZFOOLbscGeKcI9ShK5FW
         Oiv2tmryMdD3uhodGcsbBYm90bRy+fRDwedLoKooEB6CbahryYckm+G0ZdVljRVVFOyM
         jfO9EmiH1vu6f/gdOsQ7/NtD7pKHZfHFC3iGHoFCeIMVJaWt+jYPBQNO4oGGHKZvEqd/
         WtQpRd6SCGj620bvzckJSLrPO9g11TlSeQAvtJAHHVy7q1NsCwbsyiB4cB8+It2AcpHx
         sj9+f4EJ4i5CM8v1tQd5nZSh5G9yIm4Zhx+nOSSbdAsvmdSc4c+Ot1Kj8XQaPdfKqtcy
         6rew==
X-Forwarded-Encrypted: i=1; AJvYcCWXEmawQNwfopH3GKHxrUmdFs5VbD6x+zTNm4RFdioXiWEzf5IicUDmxxmfefVHToaGtB1OX54Ll+4XwA==@vger.kernel.org, AJvYcCXQoCXj8CaXOMMyP5vDm39yNGo8uY1qN6a+reyzn30YFCaVTk34tlGU3BavxL50XKisP4Zduvhqf/OK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb7uV/VbwPNL49RLY3pdkjF1wdJ17YHepoj3UfVQ9bc8fFChTJ
	nqN5kqlYzhd4PT3I7uEvbxvPNXqT9YQXlYk73DCUII9AuIjcfIQf8NFhwo8H
X-Gm-Gg: ASbGncsGC4L6Np9mC/zsVS3KvU0HyCrwAHLu8GQ5F4iVmumymW9k6KTX04t9PkTOo+c
	ducyF/Hwl9axNDtq/30u4aBzVJznwte7Go3K1bnk9xK0uZDu91dOc61kkTvf0Po92m7N/YRnkKo
	dsUIqvyMGE5X5BkUpBJ0OD9K/kGasdKoDa/Tkmk6onchYomHdxzw2/psdqIIkwmfDMJKjVOKav/
	WNov7s9v8pJK1qDXLgnpHujK0HZq6Wb9tE7L7oOlUTksCKFD8gJ684ImMVUdzHTSk4WWyQ1bNs+
	z3GRf9iNj2qyZLtk1OMSVOXPSe4q6u2fmSqQc3pNRrPlOHg9PqzzaraGBMtPqA==
X-Google-Smtp-Source: AGHT+IF4bbDSR6y8a18fIinxl3HFr6bkAbzwzUlqvW3q9xeH7mdix0VRLso6KVvaPDbVoaA7zBPkRg==
X-Received: by 2002:a05:6512:1084:b0:540:3579:e4ed with SMTP id 2adb3069b0e04-543e4c3c099mr599297e87.11.1738186180223;
        Wed, 29 Jan 2025 13:29:40 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83799c0sm2100778e87.190.2025.01.29.13.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:29:39 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v8 00/21] HID: Upgrade the generic pidff driver and add hid-universal-pidff
Date: Wed, 29 Jan 2025 22:29:14 +0100
Message-ID: <20250129212935.780998-1-tomasz.pakula.oficjalny@gmail.com>
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

With v8, all the outstanding issues were resolved, additional pidff issues were
fixed and hid-pidff defines moved to a dedicated header file. This patch series
could be considered done bar any comments and requests from input maintainers.

I could save more then a dozen lines of code by changing simple if statements
to only occupy on line instead of two in there's a need for that.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>

---
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
Tomasz Pakuła (21):
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

 MAINTAINERS                       |   7 +
 drivers/hid/Kconfig               |  14 +
 drivers/hid/Makefile              |   1 +
 drivers/hid/hid-ids.h             |  31 ++
 drivers/hid/hid-universal-pidff.c | 198 ++++++++++++
 drivers/hid/usbhid/hid-core.c     |   1 +
 drivers/hid/usbhid/hid-pidff.c    | 494 ++++++++++++++++++++----------
 drivers/hid/usbhid/hid-pidff.h    |  33 ++
 include/linux/hid.h               |   6 -
 9 files changed, 616 insertions(+), 169 deletions(-)
 create mode 100644 drivers/hid/hid-universal-pidff.c
 create mode 100644 drivers/hid/usbhid/hid-pidff.h


base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
-- 
2.48.1


