Return-Path: <linux-input+bounces-10107-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A26A39373
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 07:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F1213B2888
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 06:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158A41B0F17;
	Tue, 18 Feb 2025 06:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miQy+Ut/"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8A17482;
	Tue, 18 Feb 2025 06:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739860586; cv=none; b=BSVJ9XahbRaSbYke30BW/vwhJqnbwIJlLgpktv22eDDPx4BqJrw2yjEN6MD9dfmYw/6O9gzlbQvF8s3lwFj/i0nD6jDXQZ80o8QygGSNqD3fovMTav+VzBi6Q1W0pwglll62fpSLpsgh+EKwZBB+LzFGlLIBFeVh/azCCXYxaAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739860586; c=relaxed/simple;
	bh=SvM9Ww1PrErzuFij6yhvCOZeVe5lXMm5u7MZvGzdvYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NGf+gIhVFHZZtc19v/lo07iuJmWBeZLA/gQrDvmYkxTp/iIohh9+9g3tuV8k8BQWaERJjYFM774eU8XQMdUhmBxbvv+oJA5lj52zmjwSUyUIsPR6I9O/VYYitmOCa7Q8ovEswe+Jr3SEkKm0n3mZwYZzKVRCpSKl8Z2yUaH9U3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miQy+Ut/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739860584; x=1771396584;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SvM9Ww1PrErzuFij6yhvCOZeVe5lXMm5u7MZvGzdvYA=;
  b=miQy+Ut/zr+zPOWV8I1SuToKJ45uqALD6jfb2pVwgig03jqrTYfyTZxy
   mwbrFleIcpZBfn3u1xX6DVp70fpnDNtPTUUyqhJJx8rs96e281zzqfe2h
   8QmZTDLOlHtbpj9Wj1M0EuRusj4eZUFPfkYPfEYqIEW/QNg838Kh2Tlar
   IomlrZu/ssxrHy6sllYEr68N7mq0SRaBxNkzh783MF4gImLEcc2CaGe8t
   cdUe5e5F5z/SrxHC/pn8cKFUFnlfVWNPaVfsuEctdj1wD9K/G8SZAul8D
   IITNI99Uo9FyM2kb6CU+0KOhhe6LOmS1uehE09UNfn/pYlEw/LPAvZFVH
   g==;
X-CSE-ConnectionGUID: GXkor33FS1CyJ4ad8WE1Ow==
X-CSE-MsgGUID: ASwL5Qc+QSyuPd1p4O7v3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40248493"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="40248493"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 22:36:24 -0800
X-CSE-ConnectionGUID: kGoKVfBDRveOpefsN+qkpQ==
X-CSE-MsgGUID: 20276PDTQ1O7LNbWyw40sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="151500917"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa001.jf.intel.com with ESMTP; 17 Feb 2025 22:36:22 -0800
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	stable@vger.kernel.org
Subject: [PATCH 0/2] HID: intel-ish-hid: Fix use-after-free issues in driver removal process
Date: Tue, 18 Feb 2025 14:37:28 +0800
Message-ID: <20250218063730.1211542-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address use-after-free issues in the `intel_ishtp_hid` driver
during the removal process.

Zhang Lixu (2):
  HID: intel-ish-hid: Fix use-after-free issue in hid_ishtp_cl_remove()
  HID: intel-ish-hid: Fix use-after-free issue in ishtp_hid_remove()

 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 2 +-
 drivers/hid/intel-ish-hid/ishtp-hid.c        | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)


base-commit: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
-- 
2.43.0


