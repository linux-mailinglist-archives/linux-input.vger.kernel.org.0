Return-Path: <linux-input+bounces-8920-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC35BA01D6C
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 03:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DE041884BD7
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 02:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE3315A84E;
	Mon,  6 Jan 2025 02:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTplzhzd"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FE7156C5E;
	Mon,  6 Jan 2025 02:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736130729; cv=none; b=obhm+wHFf0hESnlRaUMesqCXJ7gZ/wB2cTy+syKGfA7TGZ3kc0Il3EqZBw5l3qQxDqUdmuXYzjTGL4aTBESakGWNpwRObAzfr3/uBsFc11+S0bwnauQYhyUN0YsAU3XggsfofWMmPmJbJOEvzYcdfOX/TMjtS4Eewua955GswCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736130729; c=relaxed/simple;
	bh=XrXMH/z+0R22w8CGfT7D9VQK1akBXXi0E6icghOn9jg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i4zv2OsAIYBt1yxz6QrY3D1TJEMP0PRgsOzSR8rep+7AtzIc0sDKpO3mUjnLt0kwCieL1Qp63qaOn5uROKkjxz6CjPS0IKFWQ2z4fECE0+BFheo3iwPQl+3NX26dK7rt/jXzcCwg+fm50BeLty2LrTLGR/zMVOzcaLofZSSpFZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTplzhzd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736130726; x=1767666726;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XrXMH/z+0R22w8CGfT7D9VQK1akBXXi0E6icghOn9jg=;
  b=HTplzhzd/0BbJ2j67qeF+kwfnGjHDOByY0Tfo8jPkbKg7JPJX4B9j7y1
   lapU+ldMMigWZ9hEWwKBF7khMUcr9vu7yt8mu7BvYqc4d1JEv/tG0CDwi
   0yjCOx4d05f9VZRB0ppNWtf60xPqcc2scEiPjyVS9sw4uRxLJw8mCIVm9
   oWDqQhJRFxHkulJu7+X4JPuiCiKWhVmjQJ+PM/UPVcR0Xqo6VrwByqw98
   52ongs8Sdr7eSt4UXcpbD1Hkgmtw4cPKu58Ijlx+VNaExgLTCZklHljZB
   q/U/obFWgxYm2q4moQhzUiMuiPPg/f7pnphFZt2PJ3Ytc8BS+R5+FAM0W
   A==;
X-CSE-ConnectionGUID: ptXR5mz8QPKLDe8GdxOK2w==
X-CSE-MsgGUID: XARXtXbyQoeASlo+aeQQAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36171394"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36171394"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:32:05 -0800
X-CSE-ConnectionGUID: o3OqeH3hTMyOEfNKezE9Xg==
X-CSE-MsgGUID: qdvMReWQSQuVsy1lyTuuZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125595878"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 18:32:03 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	bagasdotme@gmail.com,
	aaron.ma@canonical.com,
	rdunlap@infradead.org,
	mpearson-lenovo@squebb.ca
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v4 00/22] Add Intel Touch Host Controller drivers
Date: Mon,  6 Jan 2025 10:31:29 +0800
Message-Id: <20250106023151.3011329-1-even.xu@intel.com>
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
- THC v2, for ADL, adds industrial standard HID over SPI protocol
  support (HIDSPI mode)
- THC v3, for MTL, enhances HID over SPI mode
- THC v4, for LNL, adds inudstrial standard HID over I2C protocol
  support (HIDI2C mode) 

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
v4:
- Minor fix in documents
- Typo fixes in patch 6 & patch 7 commit descriptions

v3:
- Change tables in documents from literal block to table format
- Change symbol namespace to string literal according to patch:
  commit cdd30ebb1b9f ("module: Convert symbol namespace to string literal")
- Refine Kconfig description
- Enhance Quickspi and Quicki2c driver by clearing THC hardware internal
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
 .../intel-quickspi/quickspi-protocol.c        |  414 +++++
 .../intel-quickspi/quickspi-protocol.h        |   25 +
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 1578 +++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  116 ++
 .../intel-thc-hid/intel-thc/intel-thc-dma.c   |  969 ++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dma.h   |  146 ++
 .../intel-thc-hid/intel-thc/intel-thc-hw.h    |  881 +++++++++
 include/linux/hid-over-i2c.h                  |  117 ++
 include/linux/hid-over-spi.h                  |  155 ++
 26 files changed, 7958 insertions(+)
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


