Return-Path: <linux-input+bounces-16713-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6648CE5D0E
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 04:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CEE303000DC4
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 03:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8817B24C06A;
	Mon, 29 Dec 2025 03:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGc3vwWG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6D923AB88
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 03:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978280; cv=none; b=DQoqud8J/vU5fCmn6jJgXVNEYsvt7STuiGVatJk1/nIGVbbi3fBkfRGLbspZsVKXWSZsv1PbiSeFDA/ORg5wKhmJ1HSoO//ErZt0pVAPXpVgQ5LSw9CaegqrbCt49FjwCuoIXuWMK+6MrlZD+qewG8BFiyuEUeajZ6xH4NS8FLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978280; c=relaxed/simple;
	bh=Fi1/c+5lSJRCZBIiUrBN1mpzajLsCL9UqBkvUPkS5b4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5C7AyU9VuPaSxnhJIJNMvd+jS5bdNSJ/5+PBXDyML8EK8okYJK6YcTu8LpAJ1uh3QnnLoMtF5Jm9UyC+O6D8aRNjUBg7lavx20jMBUF7/oxdvhJIIaGvYpKngYnnLCRY0W18H0eAsgRhwzjkQNzGR40QrVlbY6/wJfwZlyCgDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGc3vwWG; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c0bccb8037eso8182183a12.1
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 19:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978278; x=1767583078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4njMGO/PyNpyvXlYB1fabh5xuHzurbGIcIZcVdujAA=;
        b=gGc3vwWGyOW9A3w6reEt1atG7BI2z1WaoluRTxtG/z+VMfb5AiqdnGaZtG3G8L66G+
         3S1C9JRwpSs1EzLSEq9MQVRA7EJF4PoQdbz1ryyR5u6rip/lZodYZY6YjGCEEssEmVBr
         q4inaSx2HN5SLB5NP/bJd4hDcabBCpKbee11cistCXPVBSEOG9UXiR3BjMZmKLWodKyy
         OEKMNzzCvhGQGmoVmn3ZWUl1L2ZENFxPFO8X/IE+tMbGU/pjHP/+xezrM+dBZtGRjZm3
         avgcfmk7iOKdrIM/yJyzoOCIYUoaLy46kmsG9UdS5HRqC6uDoBnwpUODBBhHEYoaLIc9
         WZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978278; x=1767583078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4njMGO/PyNpyvXlYB1fabh5xuHzurbGIcIZcVdujAA=;
        b=f6almYPsWN8soNPCD7XRCxU/ncJk+E6hV6WoNO4ndCALKidFavEAgZ4I+mjxC97bvb
         Q1B0fWJpCu/+Tnr5SxVsC9xFIdDnuqNdLjl0/yorXjRKnHL3p7EEqyCukSalylktvlj/
         IMK4N343COGTaJZQ1jk8JsMXBtIPFCAgq6tauQhz+qAXUwQCfTgniJhppW469bBJ49+P
         PzTxuu++4cslSczop6Czc/Fq/WWlrw8s/VbnW7rzC7Z3KeahXinCPCqboLrojEZDA8dq
         rmia2sjuh/OYZv32NzSCCj2JB9Pzik6sXPMDptkH+FsZYPx029AK2NGkmMul5OnN8xQ5
         guHA==
X-Forwarded-Encrypted: i=1; AJvYcCV/frIH4G73AAItQXGzsNM6vR2wCYE5LmWwasvoJYbRIy2AeWbpDuxxVpXFperPd65QkRbNTS9s6c88ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4dQ0ldxU9SlUKMmmF+CnhvOZspaviBWBH7fUi5V7bJuNEvp1t
	aDV/7ou1muTwsnf019/0+X1DlJvI1wal8QKUgFDFowixyCCxvC9MUY1R
X-Gm-Gg: AY/fxX7tsJgPOMV97Vr8A1LsKKsU5rcFRE1H9PSG6vD+UjTQ5DzGB8cfwIv4n7IjQ9U
	Fohc6CzN4VVb/o78ihnHibpm0a8hGg78jYBgbyK0itLWDX8LFxqGFQJyDUeU6jHtul1JjsctYNC
	zOkaC+R2M2RFyKbutaxtWvaDmj8PeIoVO3iPgFz4XOpd2u8iEQh8kRqjLEJFqbVjYFlgcuTwrYq
	WEMl4/7zg7tptK/ivsNP2nS+x3ZSV8mdAQrRzhK6Ou+StQxlHhZa4+1Q8iiFKo9dIX7KYXpCZUF
	BWRC2gEaHggvSeigKP7nZTc89McUcHCyOZ5K6BFIXVZDQWcXzYNSMK5f+CKMLFZYNg6JBXLqD15
	MM1PK9eh8leRuKiF8sTHTTySEEWAMWrFlQHs33qK8csYicoJFxnIKLyTjtIMDlBG1M4z2Pm18Mh
	fiKKXkmDDgB7GUhBdzfPO8mgjkBhElnSL0ijsBLc0HKitZ6Pg7otVXnnf9EdsuRbM=
X-Google-Smtp-Source: AGHT+IEebuW+IoiqvysUUZpmQxpgODLTsT/ms2sf/R2csAsWQCDmJTAj3MxHtbH/H+wZXUKnXjdEGQ==
X-Received: by 2002:a05:7022:2481:b0:11e:3e9:3e8a with SMTP id a92af1059eb24-12172312a5amr39517734c88.49.1766978277912;
        Sun, 28 Dec 2025 19:17:57 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:17:57 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/16] HID: Add Legion Go and Go S Drivers
Date: Mon, 29 Dec 2025 03:17:37 +0000
Message-ID: <20251229031753.581664-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds configuration driver support for the Legion Go S,
Legion Go, and Legion Go 2 built-in controller HID interfaces. This
allows for configuring hardware specific attributes such as the auso
sleep timeout, rumble intensity, etc. non-configuration reports are
forwarded to the HID subsystem to ensure no loss of functionality in
userspace. Basic gamepad functionality is provided through xpad, while
advanced features are currently only implemented in userspace daemons
such as InputPlumber[1]. I plan to move this functionality into the
kernel in a later patch series.

Three new device.h macros are added that solve a fairly specific
problem. Many of the attributes need to have the same name as other
attributes when they are in separate attribute subdirectories. The
previous version of this series, along with the upcoming his-asus-ally
driver[2] use this macro to simplify the sysfs by removing redundancy.
An upcoming out of tree driver for the Zotac Zone [3] also found this
macro to be useful. This greatly reduces the path length and term
redundancy of file paths in the sysfs, while also allowing for cleaner
subdirectories that are grouped by functionality. Rather than carry the
same macro in four drivers, it seems beneficial to me that we include the
macro with the other device macros.

A new HID uevent property is also added, HID_FIRMWARE_VERSION, so as to
permit fwupd to read the firmware version of the Go S HID interface without
detaching the kernel driver.

Finally, there are some checkpatch warnings that will need to be surpressed:
WARNING: ENOSYS means 'invalid syscall nr' and nothing else
1292: FILE: drivers/hid/lenovo-legos-hid/lenovo-legos-hid-config.c:1085:
+       case -ENOSYS: /* during rmmod -ENOSYS is expected */

This error handling case was added as it is experienced in the real world
when the driver is rmmod. The LED subsystem produces this error code in
its legacy code and this is not a new novel use of -ENOSYS, we are simply
catching the case to avoid spurious errors in dmesg when the drivers are
removed.

[1]: https://github.com/ShadowBlip/InputPlumber/tree/main/src/drivers/lego
[2]: https://lore.kernel.org/all/20240806081212.56860-1-luke@ljones.dev/
[3]: https://github.com/flukejones/linux/tree/wip/zotac-zone-6.15/drivers/hid/zotac-zone-hid
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
Change Log
V2:
  - Break up adding the Go S driver into feature specific patches
  - Drop the arbitrary uevent properties patch
  - Add Go serires driver
  - Move DEVICE_ATTR_NAMED macros to device.h
V1:

Derek J. Clark (15):
  include: device.h: Add named device attributes
  HID: hid-lenovo-go: Add Lenovo Legion Go Series HID Driver
  HID: hid-lenovo-go: Add Feature Status Attributes
  HID: hid-lenovo-go: Add Rumble and Haptic Settings
  HID: hid-lenovo-go: Add FPS Mode DPI settings
  HID: hid-lenovo-go: Add RGB LED control interface
  HID: hid-lenovo-go: Add Calibration Settings
  HID: hid-lenovo-go: Add OS Mode Toggle
  HID: hid-lenovo-go-s: Add Lenovo Legion Go S Series HID Driver
  HID: hid-lenovo-go-s: Add MCU ID Attribute
  HID: hid-lenovo-go-s: Add Feature Status Attributes
  HID: hid-lenovo-go-s: Add Touchpad Mode Attributes
  HID: hid-lenovo-go-s: Add RGB LED control interface
  HID: hid-lenovo-go-s: Add IMU and Touchpad RO Attributes
  HID: Add documentation for Lenovo Legion Go drivers

Mario Limonciello (1):
  HID: Include firmware version in the uevent

 .../ABI/testing/sysfs-driver-hid-lenovo-go    |  724 +++++
 .../ABI/testing/sysfs-driver-hid-lenovo-go-s  |  304 +++
 MAINTAINERS                                   |    9 +
 drivers/hid/Kconfig                           |   24 +
 drivers/hid/Makefile                          |    2 +
 drivers/hid/hid-core.c                        |    5 +
 drivers/hid/hid-ids.h                         |    7 +
 drivers/hid/hid-lenovo-go-s.c                 | 1577 +++++++++++
 drivers/hid/hid-lenovo-go.c                   | 2399 +++++++++++++++++
 include/linux/device.h                        |   46 +
 include/linux/hid.h                           |    1 +
 11 files changed, 5098 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
 create mode 100644 drivers/hid/hid-lenovo-go-s.c
 create mode 100644 drivers/hid/hid-lenovo-go.c

-- 
2.51.2


