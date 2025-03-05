Return-Path: <linux-input+bounces-10549-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE90A4F56F
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 04:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4B3B3AAEA5
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 03:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBABD18A6D2;
	Wed,  5 Mar 2025 03:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZn+OFyJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B0115D5C4;
	Wed,  5 Mar 2025 03:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741145660; cv=none; b=eZ4RwPyVC4Y66hEiYMFfEWz/GwfAbFaa05tL39NvTXTXQNdxwZcOFF2hhld3allH4K0OGq8m2tDtlWmex/ur4lKaH2gnd8GQB/BstzDEY8P9IDnlR2INc4Dhxyw1T4ZG3mASEXLh1bEnV2eETI20y0Vmf+v7q1RVRs/IuIjA2iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741145660; c=relaxed/simple;
	bh=v9xdEXzdevwEwRpz0Pd8yR6OBiqo1aPlHapSV5BX8xw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hZ92cm4Kn8zIYucgqjcnGPN7TFooiLHSUxn4Og5pZGIna/0tiOM9xtUjzIs3R3HRmr9xsXsvjsWttAJRCu9dRp5UrwyUT3SNEp513CDfrHxsZcr5ILwOW2LCYUASQl12tb8V8mhVW573ALvUXIxh/PyAEiz4LnXikw/n0DZHHPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZn+OFyJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741145659; x=1772681659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v9xdEXzdevwEwRpz0Pd8yR6OBiqo1aPlHapSV5BX8xw=;
  b=KZn+OFyJ+SrxseDYl4u6dow3STtu8KCURSnvf63nRroYntuXkXGya5tN
   VYQFRUw1HHiPo2uAlfYOzSygOTlFSv1L5NC+VQNVTPRXBwZql4a+ni987
   tE/yI23+qvxyOxEYCPw7xww8e6xT/PUw2LqVt7NuIBAOyL8ZJ91Wa1wkW
   eJCpBXwCClEdl2iKlXMmf+2wwKCBc9GEolrBN4W42zw/1YswnYxLGCs7i
   1BcFXsj5v4vP/5vxkTkPiuMozeWkPxaAKtMwpD7cVq9MSCUyOSRfLNZ+j
   BoFZr378qNmPm1MtgkswMDu2Ig3PiULRu2kG8V53eed+tIWEfRkGqrbsn
   A==;
X-CSE-ConnectionGUID: rJuWUfBdStCQzvPH4eKafg==
X-CSE-MsgGUID: WJzRqF6BRcupwmbIPFO3pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45864380"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="45864380"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 19:34:19 -0800
X-CSE-ConnectionGUID: Rwe9SuZ2TIy2dkwY1xTiww==
X-CSE-MsgGUID: Jlcrxd5jTlqQdCNS3Tu6Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="118284027"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 19:34:17 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v2 2/2] HID: Intel-thc-hid: Intel-quickspi: Change device state correctly after S4
Date: Wed,  5 Mar 2025 11:33:31 +0800
Message-Id: <20250305033331.2544941-3-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250305033331.2544941-1-even.xu@intel.com>
References: <20250305033331.2544941-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During S4 retore flow, quickspi device was reset by driver and state
was changed to QUICKSPI_RESET. It is needed to be change to
QUICKSPI_ENABLED state after S4 re-initialization finished, otherwise,
device will run in wrong state and HID input data will be dropped.

Signed-off-by: Even Xu <even.xu@intel.com>
Fixes: 6912aaf3fd24 ("HID: intel-thc-hid: intel-quickspi: Add PM implementation")
---
 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
index 59d0b71e6e4f..9170af9be777 100644
--- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
+++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
@@ -909,6 +909,8 @@ static int quickspi_restore(struct device *device)
 
 	thc_change_ltr_mode(qsdev->thc_hw, THC_LTR_MODE_ACTIVE);
 
+	qsdev->state = QUICKSPI_ENABLED;
+
 	return 0;
 }
 
-- 
2.40.1


