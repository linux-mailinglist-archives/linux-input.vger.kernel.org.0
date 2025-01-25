Return-Path: <linux-input+bounces-9514-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 631C6A1C35E
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B90818896AD
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 491AE207E03;
	Sat, 25 Jan 2025 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eC+RFP+G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655201E505;
	Sat, 25 Jan 2025 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809688; cv=none; b=jizRXQocZdWQ/kZ6TndqUNLYIGMHDovOve2U0TF43Jc/F9NZnfPje3hcI7yoXXFF8M3QuipATzaCGCD7cALOGcmXs/Q1uEN3m+LKsux65QX5EZHRHH/7+2f48zKyoV9e0h/RsCeYxe++wy2SPQUeeFjVJdXYF697ExQHCB6S5gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809688; c=relaxed/simple;
	bh=qvIcpSZCK/7kTs9gbjWD5vxgsgpXt1L2qZhiBydqcNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AS08rh2cnb+JAyniZfHrBZQ+zT63do4mpFg7tOT2i8AyCu3Tic3mM3vBkJO5SiZzR0wTGGWGOi1n1hO/WquP7tPAuES57yOinALpf/mjU4sKU6pXWPSJlJZofUd8sI/j3VtIXVPHJ4fe33j9bnLN1qf+Mfgc8fbGum3eR27jXkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eC+RFP+G; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-542678284e3so514732e87.1;
        Sat, 25 Jan 2025 04:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809684; x=1738414484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G20vl3c8SETzUmqacrHaTUIm6L6uW5BVaQx3USOqY4A=;
        b=eC+RFP+G2ROiqo7eOCmUaGUF1ajxPDKAnWE+3HKrGAXlG7fGoYQgrTOEi11X/rSgOW
         E+IG/ZVRFWFkPFBB1IE1WETBrkGamL1SUXdwn6piygY+hSlazItqm9u6jywGtSSIIDbj
         NSpc82NOONr6B8gU4DQr5oyl4eNOrx6gSZbvSIHRqWGj6bblJs74+Q1NjR0Ez6S/Vbo0
         2daXy21WHquXuK2owsG+DD4Gz+D7qWPPXmuvZeTXLjs9gp01JmKsJTfuxypttC8lAFyP
         tzhTdh724qc3PwE0AaglRNlcu+r5thbM3qvDkKiD2uwnASJNsyZsegSKDDVqeY4zojmZ
         bV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809684; x=1738414484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G20vl3c8SETzUmqacrHaTUIm6L6uW5BVaQx3USOqY4A=;
        b=uY9QRKDf/2txZvdOQIx2Bbn7oWswAIBHSP5QEZh9ZMeF5U3/pPO5nd5r8nVPOdzShF
         2xdRXHE6xLmsXqXkMNjv7byANn/kgnn7svKpo/d4J2Ife5a+xFgrQ0nx8sLVhV7VbVVY
         S1ePR/ErGF9Q32nGu/6MEICUw1QUELX1E/WmzpaYxe8toccBnAjdlIOLBihbCTlQI0Jg
         KtWlcpfOU4xe2hlAgcX7p3+R6qKYe1qiw7ykdlRNLZR0c8MsU8gEHBAQVpxOii0g2Gg9
         If940mt4uESaFq0lyFDvcegCvIOwffOj5+6DI74iaC01iFlCy/Y+Ctji/xsxclYZRREK
         2Lzw==
X-Forwarded-Encrypted: i=1; AJvYcCUEsfer4R6KWOpdISh75XPzhs3iuCxS02lPSbp+j2KmoZV2rbSQApYxqkhbKvxIGLAJu0H9jbSPGeH8iA==@vger.kernel.org, AJvYcCUNFw7Fx4UKwBLidMfWYFyWJ6FVMVQvu2IdlHil3kezn/OdgboprookoqllU66hkEi5dJ0By+Xkkn8v@vger.kernel.org
X-Gm-Message-State: AOJu0YyCFvvJ5s5R8SoAJ100m42dz9TcKWeNfJRrlMNOAtnOoxJJO82v
	FzoOmbxGY7eLkuM0tgWmmGAuy75sFiuu75mFkTUEYGfC7tU3qBVb
X-Gm-Gg: ASbGncvdZMFNg3zh+WwnlhojHGaNyBGnbloteJHRjjCN0qBIZj7I0aTfD9sK8v3D9x3
	8R5dD7aXffsK2eWw/ngL/q2JxYifzEzbsXN9XAckq9gH4FtV4VdEF+sAkYT0mp+jrq+wwfewewk
	19aKJKs5Q2XjWTO4fXJwHkiwNBpBoy0seO/ZmgCjOL9reD7Txk6N2c1d+UuI7xUrB2qavQvo8H7
	qOv+w3suPYaG7v6tPZb1XPr/kN9rqwA9nHnSFecZVBHfK3TOP8/yTEXLykyFlv1vQRqE5O1HOuM
	/84aKn54cHH7RJzDBMm1ohPGHJAkioxQUxTDJo7nJlsZrbwdPhA=
X-Google-Smtp-Source: AGHT+IGPz6B3d/WcJ6r8vZmuxppLOITSUYuQCFKuKbmMM9aq1eoWoGk10edEacwOrd2TO59eEnEcVA==
X-Received: by 2002:a2e:be1b:0:b0:300:956:ccc9 with SMTP id 38308e7fff4ca-307587aa099mr20277711fa.6.1737809684175;
        Sat, 25 Jan 2025 04:54:44 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:54:43 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 00/17] HID: Upgrade the generic pidff driver and add hid-universal-pidff
Date: Sat, 25 Jan 2025 13:54:22 +0100
Message-ID: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
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
 drivers/hid/hid-universal-pidff.c | 197 ++++++++++++++
 drivers/hid/usbhid/hid-pidff.c    | 439 ++++++++++++++++++++----------
 include/linux/hid.h               |   9 +
 7 files changed, 549 insertions(+), 149 deletions(-)
 create mode 100644 drivers/hid/hid-universal-pidff.c

-- 
2.48.1


