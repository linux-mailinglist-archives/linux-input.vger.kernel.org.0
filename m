Return-Path: <linux-input+bounces-2258-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ABB872BE8
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 01:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 673A6287B9E
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 00:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739BB2CA7;
	Wed,  6 Mar 2024 00:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLG1Ow4f"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B8319E
	for <linux-input@vger.kernel.org>; Wed,  6 Mar 2024 00:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709686598; cv=none; b=GfUQMOlDxnaN71PR6fAUaqZsc12N07RwG2Lu7p5FIExB3/0dcjk/1692qT9jSVgDIBUST+4RUvD5NcyxINe6xjEDjlQRci5W+yjR5MUkMiLOzTaNm3w8GDqjCBXS6yMNvvsXhTtelyy0y3pP4xqssY1sF7OSz3FUoaNV7XIfNwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709686598; c=relaxed/simple;
	bh=CwaumKdG8oB1fnICMiVK2g5HYDMX9N7LDD+9MV6nR4w=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=NLWpwGEKbzGUDEDHPIY7ZcbVhnJjF0fgEqqcurRN/symxss8wPXW2lJfrV17/RG/VKe3fPOh8BkPNbXqK7OcWb+J/+YEmqvpqTDQxPauz+LG7vc5f9ZJlks4OfeKI9yilS+iJRmeo0TYH6KVYIrTKl/MUxHPpKSARfu2kR9P4Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLG1Ow4f; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709686597; x=1741222597;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CwaumKdG8oB1fnICMiVK2g5HYDMX9N7LDD+9MV6nR4w=;
  b=YLG1Ow4fNtqzrsS5h8A/eQDEe7IGv7iEt+iDIv275/DAXczjzex4xE7B
   P41pkqrpMuTCyeCSH+BhG0AzulbIIC/GUY05l7qL5BS++agB26vYGJLkR
   tfEfonWGDL4GYb2+CyH4On883ItOhwioVGMlhpOgWTmHhbhqBhgwSi+1Y
   IBCiv9HpX8QJ30Zx9epvYJy2MvX1sFq+LikV+3ukaPeqHWPYvorLb+JDH
   n+yzQzNf3SiVLd7I75Wxx9GVRAKKyTAhAOyo79+2SmvaiDNXTRFljv1mW
   RQYZ+86wSxnEt9jMIXNcPUmsfKEv1N1OephP+IU2NW4ralLN0MR/TKQTL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8094858"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="8094858"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 16:56:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9983822"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.198])
  by orviesa007.jf.intel.com with ESMTP; 05 Mar 2024 16:56:35 -0800
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Subject: [PATCH 0/2] HID: intel-ish-hid: ipc: Use PCI_VDEVICE() and add Lunar Lake-M PCI device ID
Date: Wed,  6 Mar 2024 00:56:36 +0000
Message-Id: <20240306005638.2781839-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series consists of two patches. The first patch simplifies
the device table by using the PCI_VDEVICE() macro and renames the device
ID macros to follow the pattern PCI_DEVICE_ID_INTEL_*. The second patch
adds the device ID of Lunar Lake-M to the ISHTP support list.

Zhang Lixu (1):
  HID: intel-ish-hid: ipc: Add Lunar Lake-M PCI device ID

Zhang, Lixu (1):
  HID: intel-ish-hid: Use PCI_VDEVICE() and rename device ID macros

 drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 45 ++++++++++---------
 drivers/hid/intel-ish-hid/ipc/ipc.c     | 14 +++---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 59 +++++++++++++------------
 3 files changed, 60 insertions(+), 58 deletions(-)

-- 
2.40.1


