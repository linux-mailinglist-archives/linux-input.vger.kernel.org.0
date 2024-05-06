Return-Path: <linux-input+bounces-3474-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 458078BC571
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 03:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3BAB280D8E
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 01:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB213BBE2;
	Mon,  6 May 2024 01:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuIN0a9w"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307012FB6
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 01:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714959045; cv=none; b=M6reQAf6kxq02y4ipeM/USagc2zVJutZuX0fhyF4ROhE8DSMK82fEmb/c2piFWRwwyuI4L7R/SiPZV0HJifMrUMpXkIhvNXGCmsGvKx1EEdLf4rNK75n2mQNELwkrqHtRdF8PVlgCeYZelUofScF8xcCcmuXj6QOxT2HCSVVVTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714959045; c=relaxed/simple;
	bh=HI1uLB99P6IWO+v9vKUpEsxzzm7YBuT7BMK9CHU3oz8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HdVIYQ1A/p0F2k6SnAJo5JRvw6WXHvkKa70uU9NVxCRnR+Aisan5i3A+fOD0jhLSroMuGfwxddz9tXp3Tv6gNDWXXlk//TgLd3P1lFn1e6zaMCFMSB9m2+kRnLZ3LA2vqj8UmttMWZZs++eqvGCc8DPj1ADbz4fZkqxcIJYpqoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuIN0a9w; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714959043; x=1746495043;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HI1uLB99P6IWO+v9vKUpEsxzzm7YBuT7BMK9CHU3oz8=;
  b=NuIN0a9wAHqPXOM8fshm4dvRZ9PYbwzOro/hDgbFrqYkTqpZy8UzRG03
   cGy/hjESKI4J+0yGDGtB4Jiqh999DfIUNUGkslep7WyZtMQfZ1wRtuvCx
   VOIoEJP6c3ooNiF8NVI7ow7hp3mNEr86GxzAgWCx3JPk+tGQjknbgwF80
   AzxeelKvXkCuMKQFnY/t34zLuPDjpLk1anc/Ydl7B2O6XH3N3hG/Wh8Hy
   XnDcXJUhAdHFyc9trFVPFOrLf6roXZgkaGqfVCppIEtT9kk5UrMKMtHXh
   G/dK2nNNoVt4x12/kyZ83FP8+p8NHQTA7L/BAKZ9jlI0DaqAlFi7hBZbi
   A==;
X-CSE-ConnectionGUID: GrfBJvEAS+Ki2JdfWQ8NTg==
X-CSE-MsgGUID: KXq0V8FlQUK4FppNRvgEDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14503848"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="14503848"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 18:30:43 -0700
X-CSE-ConnectionGUID: toRW2ndyQvON52IImx/DTw==
X-CSE-MsgGUID: Fg1m/NnuQ+afA97R3b5SYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28092896"
Received: from unknown (HELO ipg-l-lixuzha.sh.intel.com) ([10.239.153.157])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2024 18:30:41 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH 0/5] HID: intel-ish-hid: Implement loading firmware from host feature
Date: Mon,  6 May 2024 09:30:35 +0800
Message-Id: <20240506013040.10700-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is comprised of 5 patches. The first two patches are to add documentation
for firmware loading. The third and fourth patches introduce support for the 'Load Main
Firmware from Host' feature in the ISHTP driver, applicable to Lunar Lake and subsequent
platforms. The last patch enhances the firmware reset handler in the ISH driver. This
addresses an issue where the driver receives two MNG_RESET_NOTIFY messages upon implementing
the 'Load Main Firmware from Host' feature.

This patch series is based on the following 3 commits, which have already been included in the linux-next/master branch.
- HID: intel-ish-hid: ipc: Fix dev_err usage with uninitialized dev->devc
- HID: intel-ish-hid: Use PCI_VDEVICE() and rename device ID macros
- HID: intel-ish-hid: ipc: Add Lunar Lake-M PCI device ID

Qianru Huang (2):
  Documentation: hid: intel-ish-hid: remove section numbering
  Documentation: hid: intel-ish-hid: add section for firmware loading

Zhang Lixu (3):
  HID: intel-ish-hid: Add driver_data for specifying the firmware
    filename
  HID: intel-ish-hid: Implement loading firmware from host feature
  HID: intel-ish-hid: handler multiple MNG_RESET_NOTIFY messages

 Documentation/hid/intel-ish-hid.rst         | 137 +++++++---
 drivers/hid/intel-ish-hid/Makefile          |   1 +
 drivers/hid/intel-ish-hid/ipc/ipc.c         |   7 +-
 drivers/hid/intel-ish-hid/ipc/pci-ish.c     |  18 +-
 drivers/hid/intel-ish-hid/ishtp/hbm.c       |  21 ++
 drivers/hid/intel-ish-hid/ishtp/init.c      |   8 +
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h |  28 ++
 drivers/hid/intel-ish-hid/ishtp/loader.c    | 275 ++++++++++++++++++++
 drivers/hid/intel-ish-hid/ishtp/loader.h    | 226 ++++++++++++++++
 9 files changed, 681 insertions(+), 40 deletions(-)
 create mode 100644 drivers/hid/intel-ish-hid/ishtp/loader.c
 create mode 100644 drivers/hid/intel-ish-hid/ishtp/loader.h


base-commit: 9221b2819b8a4196eecf5476d66201be60fbcf29
-- 
2.34.1


