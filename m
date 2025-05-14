Return-Path: <linux-input+bounces-12362-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88219AB6344
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 08:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22EA14A2A87
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 06:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B081FBC8C;
	Wed, 14 May 2025 06:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjGYJo81"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991BD13E41A;
	Wed, 14 May 2025 06:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747204693; cv=none; b=vBIHLZ734ETzTdohTzDcVsEAkndP6C/Pn/DP3mPBvFhkYUVXGg8d1BkmOG5yzM5gpfarDcPd/yDv69vrTqWaHJx0wTKWFwc/7JVBm4HMiFIP83DmvyNDUBcAht+l4+5qYSS/EpAjUCmzHYU2YFfpnLpqwr8jZVBJvK7LMZ8aonA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747204693; c=relaxed/simple;
	bh=vUClYoEgt7JZggTAWpB0T55w1F8uqzuxiG/BG/v2ccI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NU7WbCpGkx3xrF/fA3ke5xezOUAWkH0Yg08sMjnHusXYs8TY1q2WA/OB4Sfe175D2ZoRNtsTM+P+GsoextU56Mq4ovyo3dJPmwQ82CSYAlNOta8mS6Dj2O9CzWXLn921dVE+7d5nGGyKipjvGeYhoT6eZmpinrqe9BcwARYJ+X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjGYJo81; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747204692; x=1778740692;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vUClYoEgt7JZggTAWpB0T55w1F8uqzuxiG/BG/v2ccI=;
  b=NjGYJo81aK36ueOOJvAluW2a3PChICgjylBd/RitpFynkj21FqyqynLd
   wtK3Lq0jm87+W4JXwGxjllySV3T4oP85sDYrye2OHT2fLjj9DMAaAvCue
   DE2oTJnnHl2QVKNu5MaLQuKM4TqupG/D2+nddy16qT5q9IagxqXVrni0J
   0eRa/kNA1jJmEihlSFTRWBEEOXPnwsDzFNAmoflMKOxINxI3sRzE4SDkM
   nld0LyY0++guho0w2lg5m3thZkPHAJ2plZf+GhhxOPXALm4Q+lCXGdtg3
   wZq8c3TOfVeGIxtiiM6p/6TRXX+SOiU1octJC3pbQ5FETYt3Ue6tRP5VS
   w==;
X-CSE-ConnectionGUID: BfxiFtYxRIGqnk5FousQRA==
X-CSE-MsgGUID: XNkbY0+ESLSMOmnpcDo2Kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49247407"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="49247407"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:38:11 -0700
X-CSE-ConnectionGUID: U8JJtUlrSeaovGNAFhBfGw==
X-CSE-MsgGUID: oJjAdpq5SHynwzjdEFyOCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138933949"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2025 23:38:09 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v1 0/3] Add wake-on-touch feature support for THC
Date: Wed, 14 May 2025 14:37:32 +0800
Message-Id: <20250514063735.141950-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wake-on-Touch (WoT) feature gives system the capability to wake from sleep
state by user touch event, it depends on platform providing Wake GPIO
through ACPI resource.

This patch set adds wake-on-touch feature support for QuickSPI driver
and QuickI2C driver.

Even Xu (3):
  HID: Intel-thc-hid: Intel-thc: Add Wake-on-Touch support
  HID: Intel-thc-hid: Intel-quickspi: Enable Wake-on-Touch feature
  HID: Intel-thc-hid: Intel-quicki2c: Enable Wake-on-Touch feature

 drivers/hid/intel-thc-hid/Makefile            |  1 +
 .../intel-quicki2c/pci-quicki2c.c             | 14 +++
 .../intel-quickspi/pci-quickspi.c             | 15 +++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  4 +
 .../intel-thc-hid/intel-thc/intel-thc-wot.c   | 94 +++++++++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-wot.h   | 26 +++++
 6 files changed, 154 insertions(+)
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-wot.c
 create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-wot.h

-- 
2.40.1


