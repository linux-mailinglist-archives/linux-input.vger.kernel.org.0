Return-Path: <linux-input+bounces-5565-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B3F9512A5
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 04:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87CBF282B55
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 02:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776CC20DE8;
	Wed, 14 Aug 2024 02:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyjMl7zK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A238469;
	Wed, 14 Aug 2024 02:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723603531; cv=none; b=kP9a5FPxAv5ElV9XoN4/6IIm1diFFgfSpO4DqFylMNWNVIRO52SN7dU3RSOyEI0cBreKn/c376OTDSNtUKXWx5VGNLNIpOIsyeOpoiVWeBUMPsh3YjPiC918l1aF7ze4zfQiaEOaccnSv7tCLDBw9NarofAUgfYxTxlm/YSK5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723603531; c=relaxed/simple;
	bh=5btJa2qtG8mucQwxP9oiUiw3VienC++mP5DQjJ56hy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VylrQe1Iqlw+uHFXVtMG/ZpBoqw2vexuk3QaVYU2gJOdxm/C1G+uNxvJjz8RZVJdlHYw51ndccznEjF+kR2620InIB7pd819sNZoahfAJixNeBdtDJkGxRdvVhWH/NtjW5/ER2abhcJMyw9+0NbIId3aDEzakO1AUqF1PoNalTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyjMl7zK; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-710dc3015bfso358254b3a.0;
        Tue, 13 Aug 2024 19:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723603529; x=1724208329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cbdoB2tSYTyQIy3sTAaSbFB3BByD7nfA0IrET3xj8gk=;
        b=lyjMl7zK04TJ4iFzpE3If52T0HzVYgdwWTASh8I5NG60JbSPY/2NW6ITORz1yy8+Eb
         zSAFmXhhnsfRGLf7ZRQ4i/CNNBoMJaqUBBkbb/8G7yQORKyiZi2iH7XJ4alwK8eqJ0sC
         wUtcUKhR+AwjF1IXbhfJWfgtBuen96u5F9Ktt7Mh28SJ95i1K+ktHasWqd+KV7HV1qa8
         rygNceDQjppwCXLU35klS9ajDIurUdIeWHseEsKpz7Es+yVlNcO+TuiQV1xYIFre/YJi
         avN/JSWz1NoyYQHQyaVVBw7NBI1dBxiqCuktkAL6oswSgUeKOlQgyOs9KySiokHyQk+W
         zOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723603529; x=1724208329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbdoB2tSYTyQIy3sTAaSbFB3BByD7nfA0IrET3xj8gk=;
        b=Ua+nEXpIRhmuxK/OoDphLbYWZEYPJFkv4FWTIJOAsjI8nOqhaUS6heanOZLmJ1l2fe
         6zbDnhGhGpo0H+o3xYFEfj/VznlbmEvv+lspaafOljbwuuF4z0An0hHSyN3ri6nJK9rR
         nhC+EBemu8h8rt/lAO14IwDwqz8lxI566qpbrviMY1LXY5xMfDksGqoFpQwQzJ3rMTlV
         FnoyoMhNv/OUrWwjakeK2M6+dcKPIhfBK6MZXsQPChZZjh+KmHdAzwYiUF1f0x8p0c5Q
         7psNk3zu1o7ujptkz2H/WP82viB+L2evIMBfrz7opaAKboJDdomfkh+IvexB/Cz8wVIP
         leXg==
X-Forwarded-Encrypted: i=1; AJvYcCVYuQBTkJDktt5KcoEOzJgrH4rLvLOQTNA8boi3SnQ+tgiJeih8hTG7t0X1ki+vwQIlTOcyNZWxtZATwuWg9kjKhTL6ia/vPLApRT6nH1UA3cg9Am/WJmqTrmgiGmfth/sNDTA6U3x+/Ey+mmDNRF9gdSJsF9Q4WSlWqEkRMKDzwCmzt4L0
X-Gm-Message-State: AOJu0YyfF6gHjlBqse6Bgp2YnTFCC6fSmFgFcDn9tBfu5oLMxk8anPnr
	syaJNkk0cdnz1gDNAXvk178F1m0zip8LW4zmrAKFH7/y7/HjosQA
X-Google-Smtp-Source: AGHT+IGM9lRc+eARyOCdqoWU64vyRzJvFIne+ehfr/fsdjSMuLl69vwVNVasZP9iVDtsmxN5sg2/QQ==
X-Received: by 2002:a05:6a00:1395:b0:706:aa39:d5c1 with SMTP id d2e1a72fcca58-7126a464af2mr1164775b3a.8.1723603528996;
        Tue, 13 Aug 2024 19:45:28 -0700 (PDT)
Received: from ux-UP-WHL01.. (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5aa38a2sm6353329b3a.183.2024.08.13.19.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 19:45:28 -0700 (PDT)
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
Subject: [PATCH v7 0/2] HID: add initial support for Goodix HID-over-SPI touchscreen
Date: Wed, 14 Aug 2024 10:45:11 +0800
Message-ID: <20240814024513.164199-1-charles.goodix@gmail.com>
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


