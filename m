Return-Path: <linux-input+bounces-15334-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A532BC74C5
	for <lists+linux-input@lfdr.de>; Thu, 09 Oct 2025 05:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 282B74E34B3
	for <lists+linux-input@lfdr.de>; Thu,  9 Oct 2025 03:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8041C84CB;
	Thu,  9 Oct 2025 03:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOsxmi+H"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C6B1C695;
	Thu,  9 Oct 2025 03:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759980649; cv=none; b=TPJOEop+NrEExjrAM8suKYSkGGgAEAYOeX10Bb+qCZtseiyGVA6+uhyQmDLvW4KId3MdfZC9clEA/d7wBBc6N0U8MVM1TrV0kKPyb/G6l3nLqwy/0sne0Br+qlFg+KTZvZjC5tKff+nYPh479r35UxWoAGrh+zAvyFPc4ERgqKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759980649; c=relaxed/simple;
	bh=on4vcJMy2FHGK/MwHkTFNVk8eEC0mXqM3LPtdxUwcEo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WQtXM3XnIJTaOSr1+pyY420bO/karHFTta4g5uLfUQrd5JWKw4fVg+fuok8h3Xj3i937i4v51NwqNxpQJRaptsgKUIibt7KzG2H02PGpbH2jZ+8rdQlJeVlLzO/UFu0Qja5llTejlTwcGSYBepRckev3Nyd46KED+CesQLRohlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOsxmi+H; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759980648; x=1791516648;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=on4vcJMy2FHGK/MwHkTFNVk8eEC0mXqM3LPtdxUwcEo=;
  b=kOsxmi+HhHMc4gmBydmyfRfjDetsOU7PPW2pMJxZgjB4FLeTwV1l32mr
   ASr3w3Wu32DaCAoU8JIWwHeXDzI76JjzrdrDmWcYwSROB/8AFGHqSlPgE
   +DVyzSy9Ls1bAgu3/CtlJ/EERNRbNojewwq0bFoNrRT0EPoUffaVW4o0q
   3IbUaqGHK0bQE0i+TOKAiIP8MynQzZeCRLRw3ncA7aq1CF48AZSzFeVOO
   y4vFBtj+dp65FGIzXqBi1wj7lpA4GBkaaDetLEsW1zwv51SALkesYGC5m
   r2bkeeCl1LrElpv6IjoyNAKTmoNc3F8zBUXx/JXD6R+oJJSjKP45+mJIN
   Q==;
X-CSE-ConnectionGUID: TYP+pAuCRX+rKuL6oDwbNA==
X-CSE-MsgGUID: ZMFZnW8NQ8C2f7q5qY3MXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61391125"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="61391125"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 20:30:47 -0700
X-CSE-ConnectionGUID: mJIUNcckTC6aBJPyEKU98g==
X-CSE-MsgGUID: gmGX7X+tT1upz0hGgutCAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="180194491"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by orviesa009.jf.intel.com with ESMTP; 08 Oct 2025 20:30:45 -0700
From: Xinpeng Sun <xinpeng.sun@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	even.xu@intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] HID: intel-thc-hid: intel-quicki2c: Fix wrong type casting
Date: Thu,  9 Oct 2025 11:31:08 +0800
Message-Id: <20251009033108.1212471-1-xinpeng.sun@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The type definition of qcdev->i2c_max_frame_size is already
u32, so remove the unnecessary type casting le16_to_cpu.

Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509280841.pxmgBzKW-lkp@intel.com/
---
 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 8433a991e7f4..0156ab391778 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -466,7 +466,7 @@ static void quicki2c_dma_adv_enable(struct quicki2c_device *qcdev)
 			dev_warn(qcdev->dev,
 				 "Max frame size is smaller than hid max input length!");
 			thc_i2c_set_rx_max_size(qcdev->thc_hw,
-						le16_to_cpu(qcdev->i2c_max_frame_size));
+						qcdev->i2c_max_frame_size);
 		}
 		thc_i2c_rx_max_size_enable(qcdev->thc_hw, true);
 	}
-- 
2.40.1


