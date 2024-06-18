Return-Path: <linux-input+bounces-4404-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A229F90C752
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 12:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FC9A1C220FF
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 10:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CD715E5A4;
	Tue, 18 Jun 2024 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wao62wT0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A23841C71;
	Tue, 18 Jun 2024 08:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718700321; cv=none; b=BPzA5d/icyVLvlN460EBFs5Sa7m7U95I2t6nJk7GxPIPUxrESaUIm1Zg/glzu/nexebv+hJ0sJp3jKR9XVSMzolw3hjzRvslT6s18YFfp9+7+7eYE0ziWnQ3rP1J0xBWKwRs2qT2d8yJED2i96YKL2pAfR41IwBfarFSavXG0Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718700321; c=relaxed/simple;
	bh=kpiQvaQ2ZnnLK5Xsby0sRe0KylNedZz1Emu3YYp3ZQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O0dHtgfyFOWtlK4NWjhNp3MC3HVwWVutQpBa4WN0nDq8te8urIhApSEihakEzYG6emQWINAsclE3sH2jk4JGrucsTH1MPFOWM/rgDM3XzKUPK3DN+a4qAG/pq8QJCRJUbkNknRFRwF45NKKVMpw0rvxnZm537zNgjmGjrgRtuUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wao62wT0; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-24c0dbd2866so2714897fac.0;
        Tue, 18 Jun 2024 01:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718700319; x=1719305119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yPYUtELosA8xnl39GhJPcApPe0HIs0EBkpVaQuScTEU=;
        b=Wao62wT0SaznPme4jDiiMwuV37ekYfclE92SNQzRpt+c7biY8792E9rsQBnPnFHCX+
         Pm0/IEv/Osb2ke4pba31mCZt1dEkaLl9BJ09frhbfomc8fm+iuXlVfU//OBv2nr/8da5
         T0GOsBgQFs+AeT20j2R/u5RWWZIAd0LBWp2RCP7j0Rf2/oa77gx6fKwcbeoLlni8a1Vb
         8o13e4SwT8Ch5l2/19D7lnNSpogZ9eorf+dygWPpsHz7G6sW7BSG/Qxu6GsWNVIZSQM1
         77nNMcwhxN0s8bdybSEcnUpFxHUqFh2EOM9TFvAD+ccDQ/WhTpJVr74P26qpC85ymNGu
         1rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718700319; x=1719305119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPYUtELosA8xnl39GhJPcApPe0HIs0EBkpVaQuScTEU=;
        b=J/+BGl9NmGYBM8MW9CsJV37fP6H4aqp+SgMV+nCqMFmb3RS6oxAWJ9bQy+MBDAIyFN
         bEHo1T/X7uwcO+hgt0GPcm6Vd8OnMisc3/sKCoMw3r5gMCoc+XvLbDPJmNt6wwZMfcap
         lPdMxT5TVGqnDYMxkr5ZaAv/pylHEb5tZARgkh6slpxEcdXxD2Ei9ImHrQtDLd6fwPSV
         W+TLFVmFfiElyUZTWuuckOkuiRroFNYRbnuPDnhpUuUlZoEASIbW/PC3CnknkXLW0BpN
         qZnoWY9DC+rU3/pPtN2ybcRvdsAXiOHFKbXflIZ8pAuWBJU21moJnlooXKGXvMShD3Vi
         lvkg==
X-Forwarded-Encrypted: i=1; AJvYcCVGNK2ghZ6uaCg08ij21HyM7GNxNcfTkpZEpITJ5DmhPDILpX+SAWDq1bGlLA586RKH77rsqEZ5m5eQNrRFt0GFLUlCRjnCL5snPJx6erqt+9ZHC2XYluOeRlKySFuLf++DoI2plamBV/ux7opjJGnhsOXgslpV7Myt8df8IJoSUrPq8wor
X-Gm-Message-State: AOJu0Yy07hRHFPChzicyRhv5+YSHl76DAP6uoD6Q7COb0KNdN4oVgdEB
	HWqqZqI55ATV7xyubxYMz8NlrVsEZmo8ezeziArhtSQNTXAW4O+l
X-Google-Smtp-Source: AGHT+IF3uENCwWKypgIUCO9FrGgaFoeFk9JoeBqoSGbpjuPy6usbJUCO3x1MbLPHVs4AfJyYCLQK/g==
X-Received: by 2002:a05:6870:440e:b0:24f:c715:a4d4 with SMTP id 586e51a60fabf-25842ba206fmr13076694fac.40.1718700319126;
        Tue, 18 Jun 2024 01:45:19 -0700 (PDT)
Received: from ux-UP-WHL01.. (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b4efsm8512152b3a.151.2024.06.18.01.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 01:45:18 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: dmitry.torokhov@gmail.com,
	dan.carpenter@linaro.org,
	conor@kernel.org,
	robh@kernel.org
Cc: dianders@chromium.org,
	krzk+dt@kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	hbarnor@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v5 0/2] HID: add initial support for Goodix HID-over-SPI touchscreen
Date: Tue, 18 Jun 2024 16:44:52 +0800
Message-ID: <20240618084455.1451461-1-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces a new driver to support the Goodix GT7986U
touch controller. This device is not compatible with Microsoft's
HID-over-SPI protocol and therefore needs to implement its own
flavor. The data reported is packaged according to the HID
protocol but uses SPI for communication to improve speed. This
enables the device to transmit not only coordinate data but also
corresponding raw data that can be accessed by user-space programs
through the hidraw interface. The raw data can be utilized for
functions like palm rejection, thereby improving the touch experience.

Key features:
- Device connection confirmation and initialization
- IRQ-based event reporting to the input subsystem
- Support for HIDRAW operations (GET_REPORT and SET_REPORT)

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
Changes in v5:
- Add additional descriptive information to the dt-binding file.
- Fixed build warnings reported by kernel test robot.

Changes in v4:
- Allocate memory based on the report information.
- Added a new function goodix_get_event_report() to retrieve report data,
  reducing memory copy operations and avoiding the use of reg_rw_lock.
- Add low power control operations.
- Implemented power management operations.
- Introduced GOODIX_HID_STARTED to record the current device operating state.
- Add OF match table.

Changes in v3:
- Renamed the driver file to hid-goodix-spi.c.
- Mentioned in the commit message that this implementation is not compatible with
  Microsoft's HID-over-SPI protocol.
- Modified the driver to fetch the GOODIX_HID_REPORT_ADDR from device properties.
- Add a lock to prevent concurrent hid feature request operations.
- Optimized the SPI read/write functions by reducing the number of malloc calls.

Changes in v2:
- Fixed build warnings reported by kernel test robot

---
Charles Wang (2):
  HID: hid-goodix: Add Goodix HID-over-SPI driver
  dt-bindings: input: Goodix SPI HID Touchscreen

 .../bindings/input/goodix,gt7986u.yaml        |  72 ++
 drivers/hid/Kconfig                           |   6 +
 drivers/hid/Makefile                          |   1 +
 drivers/hid/hid-goodix-spi.c                  | 811 ++++++++++++++++++
 4 files changed, 890 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
 create mode 100644 drivers/hid/hid-goodix-spi.c

-- 
2.43.0


