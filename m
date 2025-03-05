Return-Path: <linux-input+bounces-10547-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D56A4F56C
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 04:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A784116D727
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 03:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172F1131E2D;
	Wed,  5 Mar 2025 03:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hi4hp1am"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888EC2E336F;
	Wed,  5 Mar 2025 03:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741145659; cv=none; b=jLmnRVle707CNX3gQWlgKv29rdXoah4uRKMjlvpT7Kj/CGmQvSWU6lV3g+yq/AQcH5gf4tttHvOg+FmlWnlpm6osBnm1AspcWEhqvUw3Qf7Yxby3Qs1lIVRW5HqVVS5frt69xbOdIckop/7OEyt829mWNucwGOAc8sgcRtSf/fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741145659; c=relaxed/simple;
	bh=8ji2zPGYnl51n0j1Lvkv204EtH+HAALaf+eMI2/9+tc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qAa04Uo1pUq27UKoDAASeOdLPcAsAfCFcr2dOzFVHu3DV3KuybW0tXu0RNj4tKikYdCeJVrGWAU7iWHtVXl9dSnW1g33gUJH7FpwqP+02hcBZGG2B8+dWiJCzgKScj895a2ZPv5atzoflqgXeZPGIDDfmhXF80YV9TR2nFFatA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hi4hp1am; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741145658; x=1772681658;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8ji2zPGYnl51n0j1Lvkv204EtH+HAALaf+eMI2/9+tc=;
  b=Hi4hp1am0sz/qbExFkcGOBhhzBik4mzzwd2KfAFg/eNysy+cWdYE3AqF
   Je+Exh3yXj0KoOVFzgKYEdCCCPumaAC245wxTjMTcnnSgmO65kx7va3KM
   jfnA9Nvo/CdwMIMx7jTO08/4PVz2r/Ybw0DX2On9AQYLBSveKdUaoW6au
   VePOysBfI5TAvgmxfTVyUeLI6FeR7nt41As3NuUBSPA3nIeKqHjg+fUis
   HTNpVkM3mhcr1dyKHxTxfY9PYcPgQfKF3g6dIiOolZCkILg9bTjROCMzK
   3xxkUkrgI2UvtulZuW1Iz/nKFVFY8GVKnggcf1x4L/jk8B8GCcfaOU44W
   w==;
X-CSE-ConnectionGUID: 60UyCSfWQqmd2B/65sFZsg==
X-CSE-MsgGUID: FN/AinpuQKGhRkFssrIxUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45864369"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="45864369"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 19:34:15 -0800
X-CSE-ConnectionGUID: GFUZFcMlRfqdf/i2eVUOHg==
X-CSE-MsgGUID: Q28HyaUrQauL2pC8CVZGAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="118284003"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 19:34:13 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v2 0/2] Fix "QuickSPI touch function lost after S4" issue
Date: Wed,  5 Mar 2025 11:33:29 +0800
Message-Id: <20250305033331.2544941-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set corrects the grammatical errors in the QuickSPI device
state names and fixes the issue where the touch doesn't work after
resuming from S4.

Change log:

v2:
- Add patch to correct state name grammatical issue

Even Xu (2):
  HID: Intel-thc-hid: Intel-quickspi: Correct device state names
    gramatically
  HID: Intel-thc-hid: Intel-quickspi: Change device state correctly
    after S4

 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c      | 4 +++-
 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h      | 4 ++--
 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.40.1


