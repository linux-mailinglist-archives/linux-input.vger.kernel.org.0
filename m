Return-Path: <linux-input+bounces-10435-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C442FA498CF
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 13:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A116E3B71B8
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 12:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35ACE26AA89;
	Fri, 28 Feb 2025 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXTlSn2X"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2B725DAE8;
	Fri, 28 Feb 2025 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740744714; cv=none; b=lawRZwkjzPJsBq+CbTgmRj1hinfEhhtv82drzSNRB4etRmoPpepf0yA044QkhXpNrmWBwLCnS3+ACdZoygAM11wbOO/BlmTxNeWsC+oy2zNc9QuREudFuBNVSVzv9wKH0JJxfDRUXYxS57qp4og21R2+fe7yXU7hbpZOIqlMBGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740744714; c=relaxed/simple;
	bh=0PdA9HL00IPz/s5qEMFJ4RuZgDBEC0yAT22RRk/McrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ka8z/Qxxv18C417BfiNGvtw3zGOJqdaTF0uojRGwRTADQDnpWMzrwW7UPuTulolRGqvBaOzRpehAxL95fhMd0WcR4UGGKY3iHRoFR7Yz1wEWAJbfkDmOk5a+68gX4t4ImL+g/9LvdhyNl3FKHxX4m9Y3oOL9IzuBQg+bXjWtUnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXTlSn2X; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740744713; x=1772280713;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0PdA9HL00IPz/s5qEMFJ4RuZgDBEC0yAT22RRk/McrM=;
  b=gXTlSn2XDE760CFYmeYOioFNCznZk4dTgRZ9zYjzQ8bK3130vMtMmihz
   ynszNIyI19ODl3SEm2wpNeNR3ZdGd6ilVC0cw7wFyOFpI59+BRQ3Nlhea
   5qEoUAhb6O+Z2xcFIgpoj/CLPHLLisZtmWVwBSCbxmXWQNzMwTNcAyvXa
   Zs1nWkzgEP52cdw88HI1i7JnT+mIkEexmgCIZimZI4cuFYLIC7rBCXDNu
   t6ohwiVuL/T4Nc8tzx8RIvJYitMwg8bEIA+v//v8s+YDVgyL2PocMQlko
   TXHE+ULMxJczH79tztceLGnwf9vkoX1nEVfRzzpqcgIgNq55ElS3LtrhT
   Q==;
X-CSE-ConnectionGUID: +SJ3AYgIQ7a6157UyGaMlA==
X-CSE-MsgGUID: 3pre9Fd6Rmu9cj/Nhvqn2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40846702"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="40846702"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:11:51 -0800
X-CSE-ConnectionGUID: BRRdTvzFRWmmi0SvRuU9lQ==
X-CSE-MsgGUID: D3GFMBoBS4e+stXdHG5s5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117081032"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 28 Feb 2025 04:11:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C7EDC5E0; Fri, 28 Feb 2025 14:11:48 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v1 0/4] Input: Increase size of phys in the drivers
Date: Fri, 28 Feb 2025 14:07:43 +0200
Message-ID: <20250228121147.242115-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The drivers are using local member of 32 bytes to hold up to 40 (one-byte)
characters. GCC complains on that. This series fixes the issue in the affected
input drivers. Note, this is currently the biggest part of the warnings that
are being treated as errors with the default configurations on x86. With this
being applied we become quite close to enable CONFIG_WERROR=y (which is default
and basically reverted) in CIs. Clang, OTOH, has currently no issues with that.

Andy Shevchenko (4):
  Input: ALPS - increase size of phys2 and phys3
  Input: atkbd - increase size of phys
  Input: lifebook - increase size of phys
  Input: psmouse - increase size of phys

 drivers/input/keyboard/atkbd.c | 2 +-
 drivers/input/mouse/alps.h     | 4 ++--
 drivers/input/mouse/lifebook.c | 2 +-
 drivers/input/mouse/psmouse.h  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.47.2


