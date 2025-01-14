Return-Path: <linux-input+bounces-9216-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDE4A0FD6C
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 01:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B9FC3A6CD9
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 00:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EF719BBC;
	Tue, 14 Jan 2025 00:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHgIlq34"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ACFF9D9;
	Tue, 14 Jan 2025 00:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736815064; cv=none; b=rfUCqsTB8yw5FY7fEDsMysV3SQSWsHMNow31ZhnrJYv42ilyDPkHovTAUs5DrOxwFplr2lfvT/Bos8Zs35kyuBm4z/PoSxzdfXlJqQOKGE/YBfktpjMLiielM31w9IfpjMB7qz1sZvZ5RNogGLKZCm8YLng7A5RyZfT9A3CvXTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736815064; c=relaxed/simple;
	bh=vqHl61BMXTY35L6N1UJqkSppHxSO24CKpYmeEAvIwmE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j+vvhvmmdoPY2ivDK/d8txG3rpSMmGYzSA2Uh28niA1UGGlfXu0NbH/hMx53oZQ4QJ1fTP7PHbH7dCfCylMorb3O4hdXIH4BBbnvVXNT6HDPx/oAiUV0M2RaKGPuiHvEKtqm3KKSqoP6hxRz2fLcoikmeGdoHgkHyXR72hLbbK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHgIlq34; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736815063; x=1768351063;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vqHl61BMXTY35L6N1UJqkSppHxSO24CKpYmeEAvIwmE=;
  b=RHgIlq34Dv5mY0VsSTotv6zRpkzPJilJSmIPQB9Tbzm4jjJutIV4BjLA
   Nikyh4bHeNEzWSNz3qGKl7uUd7J9OeQh5V8krncxcavY2j7aMfyDu6jMd
   Ksyt3ac7cblGNgmjR5Wtzhgl2TXvlGOQ7awUc5+v11FKMY4nU281+vE3V
   +yFu6RrJp02NlIgakk5VhMPB8SIoZjnRYs7eZig7UdsT4QIzR/OVRJ9kS
   USEhbyLOd1wJY3h7cf20EtPM/czwFciVGf2GG0TnCix3oFs93boY2esIH
   o6YzsygNJ88D+jlYDyeuQvRA+EaRIgOL7gX46W4vGnmb7KPv9b0Zi8eqm
   w==;
X-CSE-ConnectionGUID: G622Qfu5SFK/XXhMkMQRXw==
X-CSE-MsgGUID: cSP+wqagSkKdNS5g+zEP3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="59583198"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="59583198"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 16:37:42 -0800
X-CSE-ConnectionGUID: W8IPe+yRSsG78bCPMRZusw==
X-CSE-MsgGUID: nLT5V2FxSJKQGwQ+NvF1hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105142819"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa007.jf.intel.com with ESMTP; 13 Jan 2025 16:37:41 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	even.xu@intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH next] HID: intel-thc-hid: fix build errors in um mode
Date: Tue, 14 Jan 2025 08:37:12 +0800
Message-Id: <20250114003712.3042688-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dependency to ACPI to avoid acpi APIs missing in um mode.

Signed-off-by: Even Xu <even.xu@intel.com>
Suggested-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501131826.sX2DubPG-lkp@intel.com
---
 drivers/hid/intel-thc-hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconfig
index 84c2db881bf4..91ec84902db8 100644
--- a/drivers/hid/intel-thc-hid/Kconfig
+++ b/drivers/hid/intel-thc-hid/Kconfig
@@ -6,6 +6,7 @@ menu "Intel THC HID Support"
 
 config INTEL_THC_HID
 	tristate "Intel Touch Host Controller"
+	depends on ACPI
 	select HID
 	help
 	  THC (Touch Host Controller) is the name of the IP block in PCH that
-- 
2.40.1


