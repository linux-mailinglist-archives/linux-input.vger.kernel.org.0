Return-Path: <linux-input+bounces-5547-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA77A95069E
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 15:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 736D3289243
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 13:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF7019B589;
	Tue, 13 Aug 2024 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AREknOXI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37E7192B91;
	Tue, 13 Aug 2024 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723556194; cv=none; b=An3IoRLwbUbXoe4lagNm5cAm8XSkVMzibbnQ/kukffTxJbg6dYp5hM5byRb9kllzul2qqKB3bQvgBG3klZ8UPDeSXpochlJSmIf6jryNE6xOUc3Y5HSa3wk0eFSm5jHsxWkhQ+Hqd0tNpoF5wrI/svauyHAcZAhMUmHXuoNl9oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723556194; c=relaxed/simple;
	bh=ZC1L3DnEJk0xzbYjGg2olwSFbPIfCLHc4621R0rNsEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cA4zw93C+gfEvWptrZtDFlfsJrzNL3JVjlPI6Jc4NRVkm2N7VbZf9Z0I3ABW0gTK/Qv3NpsIXGZZzdYXiQitZoTQG/DG+6GT/EFspVJvKF/oBZex7kQ1j9ixym1GloGnNJYoXsgX9Gwj1WPogQBKVuQQemxpkKOsldKCiWRE0WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AREknOXI; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-710d1de6e79so3756377b3a.0;
        Tue, 13 Aug 2024 06:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723556192; x=1724160992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k8OLzgk9926PiG0rcAPGIGaOxY+06EBsAJHlth9iX5g=;
        b=AREknOXI8eJ3z4P9Pm/nCrFqHgcA90m3+XV1XqDjdzKaxhBS4JtmT5qeU3SeABkp2X
         WGevDcCJLOsN1ua6Uk1195WgZ7TPFv1rHuOJucnxNYCgcX1mH8kHhbcNZPi7S3W5tCJb
         5MOLZoIx8Cgcodqp4SoopFNEDTWuMP5JNa9jueVsHId6mYyyQktKKaMysz3Io2LiNV/3
         BRirS+8j7FOAJBIb5VORsbkU8Cp3Wis3N/dX38LIdFFjZ862R0APw0cE/29WFLesqmgp
         4O+LNwZe0smkVEanacqSobyJgDqSt7k5UOp6p4Bt/acDBpv5WTva2bEOw9v2VWxN8X7K
         X1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723556192; x=1724160992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8OLzgk9926PiG0rcAPGIGaOxY+06EBsAJHlth9iX5g=;
        b=Q8I8/IIsgmp6GUZHfzTyTYX9YQZXYHK0yygaxp/PR8gBhC4SJH5XLRHrmaYglB+536
         /HdW2KrJfaOcM3+iaOZk5B2Kfe+FVBTieue5qMr5xBaSVeVI6eiHHC8IVuzdIIgSiq6N
         yr05dbQXNCWm3PAd+9Q0OIb1B5gb728LnmDOLIhKXVW1ReAnZLST+KDcsZW0DqfnUy/6
         lKwaQj44Jq+UZmwR4Du789ETUj9QKi+HqtHxtL1irpcRdhlfcy6TKFKlr3RtBzOB4Cru
         SsrQUqM3QvIhtIOsWqF0Fv7M7X04jbk3eWRMIWUxk7C9rxN6A0wF3Fq/jXBqT/Tpa+FG
         07CA==
X-Forwarded-Encrypted: i=1; AJvYcCVsD9s4rzqP4FmSjnES1q+R3CI0XumVXs7Dw224qWpWgogeUSP6HjcxGppYzaVhaqGfCQ16/RsvoxpFreCZWrivsSwXMU96vzEBVi3ujrYX8SM8cVbj8o/GCr7fgQKIwfrYVFaOMsV8E0djBK+NRZdJ73wP3+jgVBkW9oFhbxKv2t4MOocD
X-Gm-Message-State: AOJu0YzKayTuIOiF5an4wzyHBmoAqVj7oiT80WuI2OOm5qMUBnRf634f
	WhgKax3QjxL1fMs6NRf0DaaEA81TjuD2Z1dFFaUCPrUiAHfc9gmE
X-Google-Smtp-Source: AGHT+IH5cm2Umz1iVrJsKCq0tYC8Jsihi76XmfBb43fTN4pZeGsryEdERaYWKM5fVJZAbFF/AdKYQg==
X-Received: by 2002:a05:6a20:cf90:b0:1c0:e9dd:1197 with SMTP id adf61e73a8af0-1c8d74af032mr3869300637.22.1723556191688;
        Tue, 13 Aug 2024 06:36:31 -0700 (PDT)
Received: from ux-UP-WHL01.. ([240e:47e:2ef8:4fc3:dde8:ca2c:7f06:eeca])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201d3e23a56sm2529545ad.48.2024.08.13.06.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:36:31 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: dmitry.torokhov@gmail.com,
	dianders@chromium.org,
	dan.carpenter@linaro.org,
	conor@kernel.org,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	hbarnor@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v6 0/2] HID: add initial support for Goodix HID-over-SPI touchscreen
Date: Tue, 13 Aug 2024 21:36:10 +0800
Message-ID: <20240813133612.49095-1-charles.goodix@gmail.com>
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
Changes in v6:
- Remove spi_shutdown() method.
- Use devm_kmalloc to alloc event_buf.

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

 .../bindings/input/goodix,gt7986u.yaml        |  71 ++
 drivers/hid/Kconfig                           |   6 +
 drivers/hid/Makefile                          |   1 +
 drivers/hid/hid-goodix-spi.c                  | 810 ++++++++++++++++++
 4 files changed, 888 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
 create mode 100644 drivers/hid/hid-goodix-spi.c

-- 
2.43.0


