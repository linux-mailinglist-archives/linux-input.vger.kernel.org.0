Return-Path: <linux-input+bounces-8071-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E509C8267
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 06:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73E5E1F241CD
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 05:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9AE17C9E8;
	Thu, 14 Nov 2024 05:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGBlY+R3"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB1213A3EC;
	Thu, 14 Nov 2024 05:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731562464; cv=none; b=Kd/cKwj5Mi5AqFo+a4Zip1H5oVZsqbTXEMwbIEzeponf4K5HM2+nW2DeHQZhTYc+bfR9lq6H8CGTACvT/o5j9nUfpFWa3lAY2x/S3Xi28tPqPw+lHrpITvFdqbpUNgACw9h+EXboblPbXIPBmuWp4uoGsL/RAcL1ZjSJ0Ek4mEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731562464; c=relaxed/simple;
	bh=ATA5TqGrWrOmTJlvmUh8k5bjwheLXxXZbkpEB6AG9TQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d81wod4ygzyqi1DkQieIWcbbxxBOqxps5SNfhR0f/coEzbUiYGLLRQ4PxbCF6Wt/IkYp1j/Stf0dwmZ+GzHBVcIORXGRf8jqSOLCEBYS0lDbAAaoGLJdHQ1cCHQbdoORxDLYooczS/2mectaDH7BcrEv47DZHxkKqG3sDomuIMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGBlY+R3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731562462; x=1763098462;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ATA5TqGrWrOmTJlvmUh8k5bjwheLXxXZbkpEB6AG9TQ=;
  b=JGBlY+R3MI46XBY4rWT6G06s0qZXBf7jNtzDubM/qQt3GnCZv5QsKLXB
   zLDs6IIenSiEZIi24tFzsGDEBZDNnVzfWsbWHgkIBAAfTF3xhSOjjzG3i
   iZpjT5uBJbZ641bfAn4NbCunPtotbu/ZTWNTj7LNbWeKXYvownuslLOLq
   RjeM0o4N4nzAGt/iEhj4aKlc3IPqmVdJQtZMdhXKQnB4c0QyzjqEEzn22
   F2h75lq015tvvydyyIgRRabPcdNvamUfZ8KIUPRU4Ms3WCr0HrZjijx/Y
   e5zLezK6G1iUDRxljrEW602HmO9UQP8oPnbOwf8Me1DEvDueAvZ4cf6sg
   A==;
X-CSE-ConnectionGUID: BkxIdQxWStyvQWhwJ/yAvA==
X-CSE-MsgGUID: Kr7OU5kzSESDe6q+mw93Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30868991"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="30868991"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 21:34:21 -0800
X-CSE-ConnectionGUID: hA/XLbxRRmmx43b3byWfFA==
X-CSE-MsgGUID: ec+16f4mRsyi+C7mX+SJ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="92891409"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa004.fm.intel.com with ESMTP; 13 Nov 2024 21:34:19 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	corbet@lwn.net,
	bagasdotme@gmail.com,
	aaron.ma@canonical.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v2 00/22] Add Intel Touch Host Controller drivers
Date: Thu, 14 Nov 2024 13:33:54 +0800
Message-Id: <20241114053416.4085715-1-even.xu@intel.com>
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
v2:
- Fix document format issues
- Add THC device IDs for Intel Panther Lake (PTL) platform

Apologize:
I wrote a wrong maillist name for linux-input by mistake when sent out
v1 patch series, which caused linux-input maillist missed v1 version.
When I recognized, I already got some review comments from other
maillist, then v1 patch series was resent, so this is first version to
linux-input maillist, sorry for that. 

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
 Documentation/hid/intel-thc-hid.rst           |  584 +++++++
 MAINTAINERS                                   |    6 +
 drivers/hid/Kconfig                           |    2 +
 drivers/hid/Makefile                          |    2 +
 drivers/hid/intel-thc-hid/Kconfig             |   42 +
 drivers/hid/intel-thc-hid/Makefile            |   22 +
 .../intel-quicki2c/pci-quicki2c.c             |  966 +++++++++++
 .../intel-quicki2c/quicki2c-dev.h             |  186 +++
 .../intel-quicki2c/quicki2c-hid.c             |  166 ++
 .../intel-quicki2c/quicki2c-hid.h             |   14 +
 .../intel-quicki2c/quicki2c-protocol.c        |  219 +++
 .../intel-quicki2c/quicki2c-protocol.h        |   20 +
 .../intel-quickspi/pci-quickspi.c             |  985 +++++++++++
 .../intel-quickspi/quickspi-dev.h             |  172 ++
 .../intel-quickspi/quickspi-hid.c             |  165 ++
 .../intel-quickspi/quickspi-hid.h             |   14 +
 .../intel-quickspi/quickspi-protocol.c        |  413 +++++
 .../intel-quickspi/quickspi-protocol.h        |   25 +
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 1446 +++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  116 ++
 .../intel-thc-hid/intel-thc/intel-thc-dma.c   |  969 +++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dma.h   |  146 ++
 .../intel-thc-hid/intel-thc/intel-thc-hw.h    |  878 ++++++++++
 include/linux/hid-over-i2c.h                  |  117 ++
 include/linux/hid-over-spi.h                  |  155 ++
 26 files changed, 7831 insertions(+)
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


