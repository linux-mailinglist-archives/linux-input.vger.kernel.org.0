Return-Path: <linux-input+bounces-8894-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EB1A01B7D
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47DD43A2F72
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EF21547C5;
	Sun,  5 Jan 2025 19:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANWF9kLs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD4213D619;
	Sun,  5 Jan 2025 19:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105796; cv=none; b=TiroCqsfLvl2cKaydwsbEoGroSmLQCmXT83kTqqxjCL8lBePGCb3tGrfgQqToZfX+fsTDjgyDN79URCQES9aKHZqXJllpWhHMHTD1ec6MbpCkjIYqFAbUSlF6mEYrhw45e9FQrOy9a5bolk0KprXWIT8waylAES7M9+8PDHL88U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105796; c=relaxed/simple;
	bh=o4LZxf5QJ7f6OU17QnRN9CiHF02u//pu6koLCUegnBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MwCIkgw6WKphc9Y/nN4oB6khoiMp2tOEk3VClqFFMy6g1hQ9667cT15+IV6c/1lqKwLOzarpJZjppUAYk3vw127ZOxgP2fYuAN5nDxI1iGTsevgDvg/4bfN6f5BQgGCX517bilCauQOvSUuqiXmSgHN96h9GT5mB+5hFKG9K1+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANWF9kLs; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-542678284e3so422950e87.1;
        Sun, 05 Jan 2025 11:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105792; x=1736710592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ay2hYPVI/ow0ElOxPQU9GfkNOsvlEFYCdzLOZA8l6xo=;
        b=ANWF9kLsLrNs44LzNdL9vBw6QBfmbKIzT+w5czEyT+v/t8c5zYebTrpnW1/SolMNDZ
         AztOmpErkGGWnWu2K5eBU4HwkiJ9hEx3qA52kxsKLEl7bdWDFs586lST1LnumDmBg7V3
         2YNh6IMxZfXKJ21R374JQB2kMcXXLPyFjW+azt7pTDt9eZv1X+VYJ9YJGod813B9KrWu
         /0ogk/oEEGKOHD7ZlMHpKjbTKSDD/iYvaKqkIeVfVdMBKNE/frc9P6NsImW5xTShAHfM
         SDznxXw+yV8f8PxAtldtKIPGsJ9RYXeYLJtLdNOr7Nh9cC0kppRWFGMyDOGEAM2vFFAx
         5JcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105792; x=1736710592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ay2hYPVI/ow0ElOxPQU9GfkNOsvlEFYCdzLOZA8l6xo=;
        b=KERu7m+bOpk9cOHQgSqPa/t1nTplH6vLrip6j0CzlLBDAAdTBv/uTAVYgyecDV69CO
         5bZmNxXqsiJoVitgyIF9yuPFS6Hia6KAb3SC6n6XmDTzYrDi1QakEbqJ01S2qcuiOtcU
         hPQkCtxeZi+q6JMi04gp1TrDs8Y4MUEHMrAxYCnOn4f0zoFlARjOUvLQMFsO/R+P6LRY
         OkqfvFxuAblpZtgMLPpeHdzFnBo5M8aZhpgLiNkxtB7v8qthqBfLjLX5F9HqnvH/24Hq
         owA0ZUMwLrTDu0J9hE7zDgSJXUdFq63hYdkVFot1DtLAl7VaKUa5bsCpmkGU4Trl3k6l
         HBOA==
X-Forwarded-Encrypted: i=1; AJvYcCWuv1zHZcQfJvrUo3f6ZtCfVrKtJAAGIea9Ysvqm/PgMeGTrNep6rfO73wNJQjuQ70/mQbCFEyD1C0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAxVUh6Cw3/YrQr98LujfuutglbToh4c4v2omui0uX/taxzPdx
	+k5gy+SLjcwvDTefO26B4SnyEzoGbDZ6nTp1cZWqIWVLMttBbnifjNZqjHbj
X-Gm-Gg: ASbGncvX9CmKFmNDPlXAqVqXruaBw3B3cFyhX/QZRR2FMEoPXHWFtwm4BPHBbkiOMtK
	LccxDl/qpLBo/UGxdCbkgWUSfnuD8zsKnhRyOSwA4se3YitAkpVYSiTsYmShC340jM31b3H7Ax/
	Swkil4ge8Y3h+PLOPCrYPpXd92OZ/+hHYcTgm4QxpEakYHuzC1cYuexL99gs+AvSQN4M5q6ovhb
	9o7q+JonFl8/QHc5/4/uuWWeXzyWT6j9BlOwve1P+jABmx+18MlrZUXb7vT8XS9CTIOXFV2whXN
	YXhromCIb1lrjgTLQxRqdm+4Wto=
X-Google-Smtp-Source: AGHT+IFDNU+Jv/3GPmaLXZwCITCOL+WfV1JTLeiPm0ip/XGyM/gLaU5SrKd4XmWCwwuoA3ALYJcv+A==
X-Received: by 2002:a05:651c:1545:b0:302:3356:54e2 with SMTP id 38308e7fff4ca-304685cce59mr61642001fa.10.1736105792113;
        Sun, 05 Jan 2025 11:36:32 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c586sm53297321fa.11.2025.01.05.11.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:36:31 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 00/10] HID: Upgrade the generic pidff driver and add hid-universal-pidff
Date: Sun,  5 Jan 2025 20:36:18 +0100
Message-ID: <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
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
---
Changes in v2:
- Fix typo in a comment
- Fix a possible null pointer dereference when calling hid_pidff_init_with_quirks
  especially when compiling with HID_PID=n
- Fix axis identifier when updating fuzz/flat for FFBeast Joystick

Tomasz Pakuła (10):
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

 drivers/hid/Kconfig               |  14 +++
 drivers/hid/Makefile              |   1 +
 drivers/hid/hid-ids.h             |  24 ++++
 drivers/hid/hid-universal-pidff.c | 185 +++++++++++++++++++++++++++
 drivers/hid/usbhid/hid-pidff.c    | 200 ++++++++++++++++++++++--------
 include/linux/hid.h               |   8 ++
 6 files changed, 383 insertions(+), 49 deletions(-)
 create mode 100644 drivers/hid/hid-universal-pidff.c

-- 
2.47.1


