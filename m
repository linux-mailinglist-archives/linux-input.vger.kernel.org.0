Return-Path: <linux-input+bounces-8576-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517E29F27D0
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 02:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59585164E72
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 01:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F72125D5;
	Mon, 16 Dec 2024 01:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBLCR+fr"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE8FBA49;
	Mon, 16 Dec 2024 01:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734313308; cv=none; b=WCzvISbZmwYyeJTobK8t8o+YGwiveu7MQC4RapDuwAmjJJhJw7YqhEWD58sxi2l4MF8UFbIhlwcFHn1TIvywNLPUVFNfVVob3oW4U6jsweYba4BtNCkt4dsteCAzb2tDTnpYh4EVcFLmRi0hDiPB7erhhK2c8zM0xpnFtowUG3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734313308; c=relaxed/simple;
	bh=7+ZO7KacD7fwd8q6dGpc7wwE3PQYPL8x2KS95fdgsMo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F7bbM6XQ5civNf8Xp1ZMO3D1J3DJ27re6IxqQWR8l3ejtWAsYPEaPbFKXkqvhQeQe/xBmWNKv9Lylr1+sDJNUlmoJavFAPBLS6Zo8N4xRxdC61eiPOyFjNwo6kgNZfpxcMbksSQ1UtES0PQNAuzVaNUrrjoXCIB4LZMz/rrE6qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBLCR+fr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734313306; x=1765849306;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7+ZO7KacD7fwd8q6dGpc7wwE3PQYPL8x2KS95fdgsMo=;
  b=lBLCR+fr7pp6GfYR/Vqy1OhaAlrTR069d8rvU7/R3L10dHxws0w7zcdd
   ivjlEBokbQzd5wpxldMiak5r00whlz0mfvbu24eMvIgRqXI+SIB+vTeNx
   pMZgNhjrxfMzdPxXo+O7Fjqnw5KiQonqtRNro+sH3AJhCmkfolyAPh273
   eQMWVcn12nBQZLE1vwiBQeEFX3/EIA2wGBoSOKvN2/+ZQjeKNCnACw6vf
   13xt4pR9u5tysaAAQibo8RPMwSOowY28F8GcOiLPjOp2dZwAS5TNR/kdx
   SBjyH9Y5dJ5PrT68y3OxYMtWuiXX2KLRXY2tJaofGD6JdGrmvFkN4+LbD
   g==;
X-CSE-ConnectionGUID: 2i14K//iTVabDa9S9WPuaQ==
X-CSE-MsgGUID: BriKQZM/QOOt19JyarvisA==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34012937"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="34012937"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 17:41:46 -0800
X-CSE-ConnectionGUID: nkE812xOT+mFA0TElqqETA==
X-CSE-MsgGUID: IDZPU0MeTRimhM56zrzskQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102084144"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 17:41:43 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	bagasdotme@gmail.com,
	aaron.ma@canonical.com,
	rdunlap@infradead.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v3 00/22] Add Intel Touch Host Controller drivers
Date: Mon, 16 Dec 2024 09:41:05 +0800
Message-Id: <20241216014127.3722172-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Touch Host Controller (THC) is a new high performance input IP
which can benefit HID device's data transaction, such as touch screen,
touch pad, stylus.

THC IP now evoluates to V4, it can support 3 different modes: IPTS,
HIDSPI and HIDI2C. Here are upgrade history:
- THC v1, for TGL/LKF, supports intel private IPTS (Intel Precise Touch
  and Stylus) protocol ( IPTS mode)
- THC v2, for ADL, add industrial standard HID over SPI protocol support
  (HIDSPI mode)
- THC v3, for MTL, enhance HID over SPI mode
- THC v4, for LNL, add inudstrial standard HID over I2C protocol support
  (HIDI2C mode) 

Linux Surface community (https://github.com/linux-surface) already
implemented IPTS mode. These patch series provides THC HIDSPI mode and
THC HIDI2C mode support on Linux.

These patch series includes:
1. Document for THC hardware and software introduction.
2. Intel THC Hardware layer driver which provides control interfaces
   for protocol layer.
3. Intel QuickSPI (R) driver working as a HIDSPI device driver which
   implements HID over SPI protocol and flow.
4. Intel QuickI2C (R) driver working as a HIDI2C device driver which
   implements HID over I2C protocol and flow.

Change logs:
v3:
- Change tables in documents from literal block to table format
- Change symbol namespace to string literal according to patch:
  cdd30ebb1b9f ("module: Convert symbol namespace to string literal")
- Refine Kconfig description
- Enhance Quickspi and Quicki2c driver by clearing THC hardware interal
  state before doing initialization to avoid BIOS impacts.
- A fix in Quicki2c driver when does set_report

v2:
- Fix document format issues
- Add THC device IDs for Intel Panther Lake (PTL) platform


Even Xu (13):
  HID: THC: Add documentation
  HID: intel-thc-hid: intel-thc: Add THC DMA interfaces
  HID: intel-thc-hid: intel-thc: Add THC I2C config interfaces
  HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver hid layer
  HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI ACPI interfaces
  HID: intel-thc-hid: intel-quickspi: Add HIDSPI protocol implementation
  HID: intel-thc-hid: intel-quickspi: Add PM implementation
  HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver skeleton
  HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver hid layer
  HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C ACPI interfaces
  HID: intel-thc-hid: intel-quicki2c: Add HIDI2C protocol implementation
  HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver
  HID: intel-thc-hid: intel-quicki2c: Add PM implementation

Xinpeng Sun (9):
  HID: intel-thc-hid: Add basic THC driver skeleton
  HID: intel-thc-hid: intel-thc: Add THC registers definition
  HID: intel-thc-hid: intel-thc: Add THC PIO operation APIs
  HID: intel-thc-hid: intel-thc: Add APIs for interrupt
  HID: intel-thc-hid: intel-thc: Add THC LTR interfaces
  HID: intel-thc-hid: intel-thc: Add THC interrupt handler
  HID: intel-thc-hid: intel-thc: Add THC SPI config interfaces
  HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver skeleton
  HID: intel-thc-hid: intel-quickspi: Complete THC QuickSPI driver

 Documentation/hid/index.rst                   |    1 +
 Documentation/hid/intel-thc-hid.rst           |  568 ++++++
 MAINTAINERS                                   |    6 +
 drivers/hid/Kconfig                           |    2 +
 drivers/hid/Makefile                          |    2 +
 drivers/hid/intel-thc-hid/Kconfig             |   42 +
 drivers/hid/intel-thc-hid/Makefile            |   22 +
 .../intel-quicki2c/pci-quicki2c.c             |  966 ++++++++++
 .../intel-quicki2c/quicki2c-dev.h             |  186 ++
 .../intel-quicki2c/quicki2c-hid.c             |  166 ++
 .../intel-quicki2c/quicki2c-hid.h             |   14 +
 .../intel-quicki2c/quicki2c-protocol.c        |  224 +++
 .../intel-quicki2c/quicki2c-protocol.h        |   20 +
 .../intel-quickspi/pci-quickspi.c             |  987 +++++++++++
 .../intel-quickspi/quickspi-dev.h             |  172 ++
 .../intel-quickspi/quickspi-hid.c             |  165 ++
 .../intel-quickspi/quickspi-hid.h             |   14 +
 .../intel-quickspi/quickspi-protocol.c        |  409 +++++
 .../intel-quickspi/quickspi-protocol.h        |   25 +
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 1578 +++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  116 ++
 .../intel-thc-hid/intel-thc/intel-thc-dma.c   |  969 ++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dma.h   |  146 ++
 .../intel-thc-hid/intel-thc/intel-thc-hw.h    |  881 +++++++++
 include/linux/hid-over-i2c.h                  |  117 ++
 include/linux/hid-over-spi.h                  |  155 ++
 26 files changed, 7953 insertions(+)
 create mode 100644 Documentation/hid/intel-thc-hid.rst
 create mode 100644 drivers/hid/intel-thc-hid/Kconfig
 create mode 100644 drivers/hid/intel-thc-hid/Makefile
 create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
 create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.h
 create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.h
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.h
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
 create mode 100644 include/linux/hid-over-i2c.h
 create mode 100644 include/linux/hid-over-spi.h

-- 
2.40.1


