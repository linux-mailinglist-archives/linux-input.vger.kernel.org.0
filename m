Return-Path: <linux-input+bounces-4353-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED03A908B6B
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 14:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82844B217A1
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 12:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C0C18F2D2;
	Fri, 14 Jun 2024 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WG4wYHyu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D09F7E574;
	Fri, 14 Jun 2024 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718367375; cv=none; b=Akhok917LSLoYcl0LDh3RijeCeYWjBUWm4mKszbx5+CSCcEN9imc0CxwZxQ17AobhNIYTo0Ur740xbKKDZB9Y/i2u2InlkW/FCZsuPSzHr53mwCcsF1Y89rq0FdiGN9NslJ/bgJ6H9p47qGg6egUxcf+EXt2qERsH+D6794pXwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718367375; c=relaxed/simple;
	bh=Ps4yzlJj46zlYDyUqMItoKQ4FlnhM83zVNa6dGVP1Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fkpz014ROawO5WqGf+eNRvmgzEDY8Hxw2d8Wi2YEDWSv2ucv43sIpjTKBU4vdXcSGYylssRaFkXFDIfDTdwuMz8JBVeUgqUh1FXEt8Z2ySeGUzSbNcLQhqUkW9YwcKsYTctjUosML4ltAtr5Mz5XnmzJc6pnGIjF82FCar1dPuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WG4wYHyu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f6f1677b26so15564595ad.0;
        Fri, 14 Jun 2024 05:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718367373; x=1718972173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGHxgml8hcdcdb7mDnofu27pKzVqx2k7oj3EyGb/EcE=;
        b=WG4wYHyue+z5Pjmc42pQJApXZcYiCFSx4vQ3cRQmLgMSXz3LDGqOe1V8GhBQIT1n7M
         S+3QuQzDxI90GrFspGT7ORD6silsoiysLPtJaKiZuB5VRscytVqkOc/piaHXqO8G5imy
         OeLFGQV6iZ6zgyk5FgiMf8JTg5dK5Iync7BbptjBR6wNcEp7i7ksedOGe9RamYUw/BXN
         zOVdESPsMegBuCTnY6ADJkP6fHftEtruyYgUeavCw/EuSnpT90wOUvST/IpVkXwzDHnF
         uujU7B4mYhj8CatRtWTzVt9H1lwU0oGyoXGhwP31RgIc80RBdxr24HsKoZpZp4kZ/w12
         TxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718367373; x=1718972173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGHxgml8hcdcdb7mDnofu27pKzVqx2k7oj3EyGb/EcE=;
        b=dIEVkx3u5O6dOUeuJBcTI3e/dgNYwLZ7Bgd2mig1OmChY/5MHQwLDhJxXljXc30DmL
         zQCHf3usvCwGS1MPcqmlkLa7kkSL/bmB204fWVPVvYcMl3C6IrDmBlLhDHQequxLp61V
         nlm3Z6k5buAn9NCHfQlVGw1qHdo/9a0YxVkm1849cjDaFR0go3bu4zw0K6o83jOmtAkH
         VEkXyw5Ld8abt/41Tp7eKjvddC+kWfSqpLVh2bz9PTzkPfNqi6UzOORHUnIvUq/wL6cB
         iqIJMRCXw78ATVWRvvV4FaOSWMkFBNKIUap2JlFm2maKgwR+NfWYqAvDuW7NP5AzPvwj
         0izQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyZ3QDqKsbFZQ0nZZ7LgbGiXlTMLtYJqPJTTdl2u0Vlujd1OVmazeWYtNWzRhB9r3QTXP2oZ2EPcjxuEeqVWV/fwpQRXLrEIhEMSRwebrzh7TeLCGtMLUDoWOeVQG2E86IMLRB3NXpNfgT+tsa/vjByLjB1BEIKl2XC0nbAC8CTEOjjtjE
X-Gm-Message-State: AOJu0YzX7SO56R2QrhogNJmlRqlB3aJdviuzg/77WK43UgTwZJR5m0pW
	rTXnGZ7ErfwPdbArGOFLUzIfu9Y+vzIR0ocYYr/Gyv/33nt04sW0
X-Google-Smtp-Source: AGHT+IEcFQIQALjZZYIlLzFNO+0F/teNjM8HvJw8bIuyvtB88qrthPk5Y0en6xbe0ZHm3ml52Z8+Iw==
X-Received: by 2002:a17:902:db07:b0:1f4:6fad:ba59 with SMTP id d9443c01a7336-1f8620c121fmr40778825ad.14.1718367373481;
        Fri, 14 Jun 2024 05:16:13 -0700 (PDT)
Received: from ux-UP-WHL01.. ([120.237.109.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f40947sm30476035ad.276.2024.06.14.05.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 05:16:13 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: dmitry.torokhov@gmail.com,
	dan.carpenter@linaro.org
Cc: dianders@chromium.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	hbarnor@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v4 0/2] HID: add initial support for Goodix HID-over-SPI touchscreen
Date: Fri, 14 Jun 2024 20:15:36 +0800
Message-ID: <20240614121538.236727-1-charles.goodix@gmail.com>
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

 .../bindings/input/goodix,gt7986u.yaml        |  65 ++
 drivers/hid/Kconfig                           |   6 +
 drivers/hid/Makefile                          |   1 +
 drivers/hid/hid-goodix-spi.c                  | 812 ++++++++++++++++++
 4 files changed, 884 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
 create mode 100644 drivers/hid/hid-goodix-spi.c

-- 
2.43.0


