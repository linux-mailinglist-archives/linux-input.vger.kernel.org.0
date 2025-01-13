Return-Path: <linux-input+bounces-9182-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A6A0B763
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1379164135
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 12:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D3222A4DE;
	Mon, 13 Jan 2025 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qe7MnYUS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C51821ADB9;
	Mon, 13 Jan 2025 12:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772570; cv=none; b=AWWbLpcwOIqwzjXrGxjySP8gq6xUI5m9a85QjhW5rRMGJd74IlBLAxpEacqv1i77sz/jKqROfOlV4wsBW4w5mFHGFGvrfl06XY5lBv0cVKwdgrscG7Q8PM6SxsmG07mvixit3+TD0L10CZkXMbfGBm3kH1M5CbGKGkaAcfVoqfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772570; c=relaxed/simple;
	bh=fHn2LhVmX0+ZrZxC3bjtAHNvfRuGj9g7p6P18GVzpX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t+Tye6P/kZwPyEW9OSaz6E0RdkQzZIvwGAXTbuy+L9i+z6TzZYJQh7sgTiTgo7lvsE/hZe6/7jUmPGHL/UxOcaY1AFVQ7c5+9HuzK0+A28sIlqT51hXwKnqy26UMbEkLJhQVxFRHdg9b+oglSHPi+lZwoyIbMvbaTh6RSwVpu58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qe7MnYUS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30223aa0b9bso3534601fa.0;
        Mon, 13 Jan 2025 04:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736772566; x=1737377366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bzjd3nrErfGDWBHQTTCvpL47t5erWwaUZmkHvh+BKws=;
        b=Qe7MnYUSTmC6KZN8t4tDTV3mjKDJJJaakafvVKWaN2kBXh8WINjWRwXAilY2MSwU9H
         SJnszhNzjcnLcoYJnAfLHBKjDNfWW4dIWuzDAEMzyXD9A25CfMm7VcHrK8xhbCJZY4AP
         YZxA4IXhh4wvR+KlLogg1YIOXuvAoQZqIJNVzVsedsl3LcRnL5uBEWGefJKolYaHcOz9
         kAl989OrpDZJxAuTPLZpRWlJo0K7P1YUg9291I97qu0Fd3V9wjo0UFN/k86Xfx8I50fq
         qFhv98kG42CuHjTB4/HFZDRuV7ebdboa/boE1Dpr6rCyLBXDZWTLYGst/1SR7EtU81UG
         yMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772566; x=1737377366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzjd3nrErfGDWBHQTTCvpL47t5erWwaUZmkHvh+BKws=;
        b=jvH1Ij9m4DYiDUxLL6EbejRkjKDL3RdQEtKHsdmq7GOrrAet71PAvPsmyehrFukcCj
         MyOkN4OuPlW8KnWv4jg+POsEFVj+b09BXb9DAC3N8fiovNeDrmyFXvzS9k8ILuQG7Sik
         I40Vl9KbKVaUP4UO6EC5xa9PJRXAiGZGZ/W/3Gbs0nH1sicgnUjs85hG0j66GjbOwEjO
         MEyx5w8bECPh9CEfg5Fo17R0rCAJ4cnUU4O9+MGkb9VKw0SjjcSHOChUV4QSBWj3bqaT
         Zu73XWfnF+aqU1FZdRhEbwxHFOYY66Sj5EMuUHFDei2djNBPPCVOyrF7O3AbIHcD+fxi
         XBBg==
X-Forwarded-Encrypted: i=1; AJvYcCVF4yEowbCqFVF59r2OmGcbN++gs8108Esvjhg39amFD8UvqQWHBdYxrc0Kvl6yL3WpsHLsrIllHe5yBA==@vger.kernel.org, AJvYcCVqXQO+J25JhAGpIgwgm65stpjmC9BMJTHfgLYpRhx34IIQcNnooPUvUgrFEIzYDNmyNsHyaffS/L+g@vger.kernel.org
X-Gm-Message-State: AOJu0YxOQBpwoxEUStjdwGa7Dw/epqb0Og6UHtZpAF9kH9eW6DzL/uAw
	labmyTRQJ49VBUcjX8FJx4JiXZZIF9BLBeTjfhObjozEiau2Di4B7MLx/o5y
X-Gm-Gg: ASbGnctGIEP6M+lu74vyBWgVLI2Pqol0+WnvomtXNgTD7be2o7rDWU7cC//TQF2/pJb
	rYkqSHpQCejY/PJR+J7vVZZhEbAUX+vxPvHH6ikKy7TiwQum6IDwtuAwdZLxOTcZvT+u0/sMuny
	JRrLTM5WTko8SHcRsUco+GjNpPJdDyRcKWuUN4TeOhrXrWiO+qXussOv1ovpf4pubCAIahbGBts
	NuBC0uQO/Yi5ZkZXRkqiJ6l6cD7O+t07/Sd05obOVwZOf9xgere7FgNMcwflO0NjnpKu2b/fPmz
	hmggKZUfPUZ73BvWztkEuDJOcSM=
X-Google-Smtp-Source: AGHT+IHWEB+mzNJ1SDWTRkqzhURzwrh32HN/f3ZHHvu6Ij5lrJbbLX2lgAPStDdtx7mgS3u/KfhQTQ==
X-Received: by 2002:a2e:b8c9:0:b0:302:1cdd:738d with SMTP id 38308e7fff4ca-305f45dc45emr28591521fa.7.1736772565939;
        Mon, 13 Jan 2025 04:49:25 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec162sm14256181fa.101.2025.01.13.04.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:49:25 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 00/11] HID: Upgrade the generic pidff driver and add hid-universal-pidff
Date: Mon, 13 Jan 2025 13:49:12 +0100
Message-ID: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.0
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

I'd love to hear some input on the name, as that's just what we've been using
previously. Maybe something like hid-quirky-pidff or hid-special-pidff would
be better? hid-pidff is already a generic "universal" driver so I don't want to
create any kind of confusion there.

---
Changes in v2:
- Fix typo in a comment
- Fix a possible null pointer dereference when calling hid_pidff_init_with_quirks
  especially when compiling with HID_PID=n
- Fix axis identifier when updating fuzz/flat for FFBeast Joystick
---
Changes in v3:
- Fixed a missed incompatible pointer type while assigning hid_pidff_init_with_quirks
  to init_function pointer (void -> int)
- Improved Kconfig entry name to adhere to the alphabetical order of special
  HID drivers
- Extended cover letter
---
Changes in v4:
- Added PXN devices and their hid ids
- Added hid-universal-pidff entry in the MAINTAINERS file

Tomasz Pakuła (11):
  HID: pidff: Convert infinite length from Linux API to PID standard
  HID: pidff: Do not send effect envelope if it's empty
  HID: pidff: Clamp PERIODIC effect period to device's logical range
  HID: pidff: Add MISSING_DELAY quirk and its detection
  HID: pidff: Add MISSING_PBO quirk and its detection
  HID: pidff: Add MISSING_DEVICE_CONTROL quirk
  HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
  HID: pidff: Add FIX_WHEEL_DIRECTION quirk
  HID: pidff: Stop all effects before enabling actuators
  HID: Add hid-universal-pidff driver and supported device ids
  MAINTAINERS: add Tomasz Pakuła as hid-universal-pidff maintainer

 MAINTAINERS                       |   6 +
 drivers/hid/Kconfig               |  14 +++
 drivers/hid/Makefile              |   1 +
 drivers/hid/hid-ids.h             |  29 +++++
 drivers/hid/hid-universal-pidff.c | 188 ++++++++++++++++++++++++++++
 drivers/hid/usbhid/hid-pidff.c    | 200 ++++++++++++++++++++++--------
 include/linux/hid.h               |   8 ++
 7 files changed, 397 insertions(+), 49 deletions(-)
 create mode 100644 drivers/hid/hid-universal-pidff.c

-- 
2.48.0


