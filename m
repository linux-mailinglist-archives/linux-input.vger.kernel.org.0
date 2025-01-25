Return-Path: <linux-input+bounces-9536-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 160F2A1C55E
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86F0B3A4BA2
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCFB2066DD;
	Sat, 25 Jan 2025 22:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1qMu/fu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF82D2066CB;
	Sat, 25 Jan 2025 22:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843936; cv=none; b=fco7kE9PO2AjEgf40XOBBmgkFziKIud091T05H1ZVE4vC1BV21WEj06iozB2mUYJeqDo4vsUnfC5kM7wXyHPKvss3ee4j/Bg6Sxs35pyVBpgOd+lJ820nUI6LjmZboKnpuy7UO0H8U2o03PoGDEzin+lf6oYKd0vhXm3cbLrEHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843936; c=relaxed/simple;
	bh=5lnvSFBg35sfrTA0C4fkdtDSO8MOQYOW2wltm2LHHuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZpSm4D/VYg3o4PMhfJLzrdUUSZ996ZqIQZVB3/BaDtpqqoME0D7rUGx7u/5+Syda8YgYXon+tszswPglcUYxyGYXkym40TFfjuBAhuVfm4ruyF4TXwwfaPuPGD2R+fZYaAqwtedTQvhA/aBUDuu9FiKNE45MN5JTdWfnjZe6Wlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1qMu/fu; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa6954ec439so40267666b.1;
        Sat, 25 Jan 2025 14:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843933; x=1738448733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vY0oVKB6yAH9tUkZo54CZlLcrpvGzpLLZ8OFL0MqFzY=;
        b=P1qMu/fuLxl/SHvxT65Pt1LqRrZr81WQ8le8+ndo7SR8o3i5YsKE8FD2KEPsFi9JhR
         9HrmHI9KZN3AmoH/ZBnDgAghMQkMfk/4/BmtgztUxGCf77Eg1R4m5LBOkEXKnIuefJzb
         faGjVNqjTewzvrGUaH1eXgFiCZ0jSMucyAOzILYtfECaLRdKPM/UUtL1hZ1qW4OKwEJJ
         rft6N8Q0sExpz7WYmRyX6t3qcgN7FQqG7ia7X/zOt8YZNK0XGtwKAVrbwjyF5sRiB4gG
         CyJP7d2Ipb3leiPJ7F29ODzjXRWlxcbASG3V0WvhKRh5Pz4rz8WnhICA4aW/2tbVPKU5
         /liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843933; x=1738448733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vY0oVKB6yAH9tUkZo54CZlLcrpvGzpLLZ8OFL0MqFzY=;
        b=oLXWHHRGbjSMM/i4ncFjs6LYc1trViVCaQHygjNF5fvDsaxu8VudNUwUvHaORDcqEW
         yS/G4Rg3sDJ5dzcZ8OniKOmaVSbZ8SulkH1G7VDJK46vHdosVbEy7zi7CcjCps2g1LHP
         4JYLnbNnL5/nCe2hjVtPl6A0qUD3CcaKp92WYWJu/1XycPwsDIRvHv64/d2v8RMfkHyg
         3PBxX7uGHsQX6+ump7zdYEMMoTUjPLpZPTD2cQvsco1AI0EukmqmL6qzRT5wJsWvvBCY
         Bg0ZlZJ8pVYum6ivJZvUXdLBGdsdEssxShKuHGk27usZXnhl4Crp4bEdJl0SzXNMKr4k
         HpAg==
X-Forwarded-Encrypted: i=1; AJvYcCU/IqeizrpJDvm/Xia/ZwIpvwKxK0LaZu7/0MSi2hARmPPINXSUTurdqlIfeJQy1KKRZMRwH4aAVzx6Ig==@vger.kernel.org, AJvYcCVTjZIbWBu0FOuc2dabyNiuYCgyVcnUNKJoxPd2L9Dd+M9+uu3ajNIkVrwA/gtUVo7cSpdW887lNqK2@vger.kernel.org
X-Gm-Message-State: AOJu0YyUx2siT54CWkirDihXrGaUL+mNzfggoo2CppoJ+/lD3brmP5Vg
	uQnn+2e03Nj9Yqk8cZCCR9u8wB8BWFSu0CkT9H08axXqjWkMb88z
X-Gm-Gg: ASbGncux/ftZos8yVy/EEKx/RvqUGaUemc01Quigd8e10M6oqStEGx8thySjejKp/Mo
	OeAkdwET+dNwtqHYN0LtZS+NDZ/NBmNVRmvgLLyzv2CbtGqNojZEDsToPxVzho3SQcyuYJsKcEX
	G+xXPEH8MrpsePYCRL24wQNo8fGs8GkLZCkU1mR8BMDlCMQAM1bm5iSjDMGb06Kd8wfBBqpxRkB
	V9WEEQnHYKg6J1qnvJ+bh7FJiU0YNy6/8eOhK1IQ7oY4Cpa9J0Ht1nTPj4C6mau4wr5IZmWCqNU
	ApIPoDgGsdUXPH7sd+GFwdR3txpu4t/nFw+WL6+mu6lWPTqKk8M=
X-Google-Smtp-Source: AGHT+IGruOb8AD9jdMEssaTcwAuIon3zscA99c/V8/2W3vBpN/eDKExGfKxJ6eP2ga5tlt6VkMbOBg==
X-Received: by 2002:a17:907:9803:b0:aa5:163c:69cb with SMTP id a640c23a62f3a-ab38b49a5cbmr1113109466b.12.1737843932751;
        Sat, 25 Jan 2025 14:25:32 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:32 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 00/17] HID: Upgrade the generic pidff driver and add hid-universal-pidff
Date: Sat, 25 Jan 2025 23:25:13 +0100
Message-ID: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
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

I'm not married to the name. It's what we used previously, but if "universal" is
confusing (pidff is already the generic driver), we can come up with something
better like "hid-quirky-pidff" :)

Question about the header management. Maybe I should create a separate
hid-pidff.h file and move all the HID_PID related definitions there?

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>

---
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
- Support "split" devices with a separate "input device" for buttons
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
- Fixed a missed incompatible pointer type while assigning hid_pidff_init_with_quirks
  to init_function pointer (void -> int)
- Improved Kconfig entry name to adhere to the alphabetical order of special
  HID drivers
- Extended cover letter
- Link to v2: https://lore.kernel.org/all/20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com

Changes in v2:
- Fix typo in a comment
- Fix a possible null pointer dereference when calling hid_pidff_init_with_quirks
  especially when compiling with HID_PID=n
- Fix axis identifier when updating fuzz/flat for FFBeast Joystick
- Link to v1: https://lore.kernel.org/all/20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com

---
Tomasz Pakuła (17):
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
  HID: pidff: Rescale period value to match device units
  HID: pidff: Improve ff gain handling

 MAINTAINERS                       |   7 +
 drivers/hid/Kconfig               |  14 +
 drivers/hid/Makefile              |   1 +
 drivers/hid/hid-ids.h             |  31 +++
 drivers/hid/hid-universal-pidff.c | 197 +++++++++++++
 drivers/hid/usbhid/hid-pidff.c    | 442 ++++++++++++++++++++----------
 include/linux/hid.h               |   9 +
 7 files changed, 552 insertions(+), 149 deletions(-)
 create mode 100644 drivers/hid/hid-universal-pidff.c


base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
-- 
2.48.1


