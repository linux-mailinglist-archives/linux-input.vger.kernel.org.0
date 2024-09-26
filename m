Return-Path: <linux-input+bounces-6729-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC74986BCB
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 06:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D79B71C20C4B
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 04:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDAF481B7;
	Thu, 26 Sep 2024 04:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3OjdGMC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E112F5B;
	Thu, 26 Sep 2024 04:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727325761; cv=none; b=OWmQKWkU/uTvZU8bjdx7hhA04NrxIf8EX/ICAALbJUy9QhqO62lzXQh7nJrjjbbxJhK+orWS1xqnzojvgDVbcZ2WQ608t2NpeuxDSDdKO6M3Gy3DOAw60WgiCj2OdsQbxphk62PQ+7qkx+evkIrmyb2g+s/OZpVW2gv7Vpo6F8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727325761; c=relaxed/simple;
	bh=ZnhPMczjXiHl0E5MQG7DRJzlIYUZhNuk7QUfNnH1hjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nbYWjU4fiMYejWkH9xTuEKA6e+vPNw/Wqlof/mKCCmRzInSwj7X3SjkJ1LnRFk6NzciOxKLZwrO/yIkfb+t8NSjG/bCM3RDqVHDKuYCYAVFq0dS+OthmWRJhkYq3AYqb8eAUAq4W/mkqeGmzIb/6kpGMWBfbUnNVHeKvHHyu70k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3OjdGMC; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7191f58054aso432376b3a.0;
        Wed, 25 Sep 2024 21:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727325759; x=1727930559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n2za+eUaEjUTCLkULJOUZ7j4CqEFUn5mFwV/Nz1Rys0=;
        b=J3OjdGMCXL+pvBwtlJgHH8f161sC5IqSfQtui5V2sJvwIAemcdyc8+3SlvAmj8k2dd
         JAbjhA2NTR453GaJKipbOjUMHpsiA2/ngCvtts6gxCSYFnTgXkYEko133370bmAHdj9y
         EFu4TSIouFCqpJSBqKBWXbvd3glLo6D/J68V8bHFf4p7YwnPZwtxLuc/3A4v/z4MnBsV
         onEa2GYVFUkrX17t22bzt1EHbkqKckycN3hr2hXIYlYiWnnLV/EX7rQs58+cbdT6DS+e
         VP3V+UgOBmk+sKUEvk8h/+fChbbD5n1znSbQtIobZ1ds2IKo8Xzrg59cxmwXkg3tYKfe
         Zfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727325759; x=1727930559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2za+eUaEjUTCLkULJOUZ7j4CqEFUn5mFwV/Nz1Rys0=;
        b=wnjrJ71mbxoD/KZl+lA+WhC8nb7JDmiwkyk2QjIHu4czcCWMIi+e+h2BsAdfUEG0w3
         7o2YD1jLgPBeRRyHD4BSGY1k+DGwt4azj993KpyubPiekWSpiSDRtf8j622C/6v0hnqz
         nBwJF+MJpdVgGBX5LRsxpMootes+fsvxhNWH4Tjcfh3ro3HaBiou5zXkFTtjngi87IY6
         3BZfSbYNn7TR7sKScUwkMeA+me4sbhmy2hVgE9as3QwdErDRRNVJwL9aD0rDA/wddfvi
         cBRbtDU5FQ/3G3Iy3RH55yMA7WgGw9WuNT4ip1bOduyQISDCMC6PIAasViZRgbG4Lw0j
         Cs5w==
X-Forwarded-Encrypted: i=1; AJvYcCVpm0cdCUf5iwqD/L/+z26pEM1Qme9liDBKoNkw0RrWGhKsBFaXSYOTevmYDRIX59oYkpv274wxRfFISjwH@vger.kernel.org, AJvYcCW7lu2VVAT/zoxJuLskvg698z4pJkXkYJ/3g+6Ii0M+qV5EqTqyEh5t2K7UxCbJFJAxCPQg7izxjxcjaCc=@vger.kernel.org, AJvYcCXYEIv0w4q7SFNDHJqIcIMC+WFxnyBDhT21LKyqJNVXReNRYIReKmGEe3+1Fk3vdnSa6drrpxVzb9bd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3z+kss2CPpb0k2F5wXXLfIU1LdIo3zNfnZWTHLVEoLsPvEDcc
	KBNEYl5P0hGez7IEuQy4vIxXCD5EBiQVk/H1KIpfaROz82+I/evv
X-Google-Smtp-Source: AGHT+IGo31YcdLhqwsoA3i2B8KHR5wJpjf0Mw6LSbUHX9GAgDqKmgGffTL4M2mpiFoW+A9HstY27AQ==
X-Received: by 2002:a05:6a21:2d07:b0:1d3:e39:f69c with SMTP id adf61e73a8af0-1d4d4ab0dfamr5782105637.15.1727325759431;
        Wed, 25 Sep 2024 21:42:39 -0700 (PDT)
Received: from ux-UP-WHL01.. ([120.237.109.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc8347fesm3474279b3a.35.2024.09.25.21.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 21:42:38 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: dmitry.torokhov@gmail.com,
	dianders@chromium.org,
	dan.carpenter@linaro.org,
	conor@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	hbarnor@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v8 0/2] HID: add initial support for Goodix HID-over-SPI touchscreen
Date: Thu, 26 Sep 2024 12:42:15 +0800
Message-ID: <20240926044217.9285-1-charles.goodix@gmail.com>
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
Changes in v8:
- Fix devicetree compatible conflict problem.

Changes in v7:
- Add Reviewed-by info.

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


