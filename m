Return-Path: <linux-input+bounces-12353-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A43AB62DF
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 08:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 261CD862301
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 06:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B96B1FAC4A;
	Wed, 14 May 2025 06:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4L20iy8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27001E5B7E;
	Wed, 14 May 2025 06:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747203639; cv=none; b=o5T89W1AYt+ofrSQ5fkXHubIuxW2/Eh/ARVSJvY//SmanXfNmMOG7HJJyFeKzijOlFNfBmlK/2ovxXwVnaMmMoe5O82CHmq28G4GUNey2FaNQw5F6hrfao3qymdD8btXgVdhlMSI6serzN9iATj1bLOQXMa1MIiQCVokJF79bY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747203639; c=relaxed/simple;
	bh=88nezXdYGNGQB9lTU7R3VQCwT/9EyWgD9gKupfZ20zQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sieCjDsyj8mdkSFEo8wJXJ+nIB3mfKKWpBbrPL+rPz4nm0CEZ3t+T/WzEBUc/ltHsI2HQYs4umRkLFE6lsS6P1QTCCtDBfhEnjqNVIiFKwZc3eybmJOg8NEuithQi9hLqwwQFkHmmTvAKOeNVEifnmMv4SpjmX517e/HPvN9O/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4L20iy8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747203637; x=1778739637;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=88nezXdYGNGQB9lTU7R3VQCwT/9EyWgD9gKupfZ20zQ=;
  b=L4L20iy8E4iNEpDFazKjs6oc1qMeDCmaoAWPSYfaAmL/nVr5a2/5aR82
   AxbhL82Jji9xwDtrpQ6NmrfS/aTXfGIr3YfuqS0QP96FYpsrHEKuYzKFo
   Z/pvlMlJRgG7LnfV8TwgSK0c46Q/XErfwBUNmkNJxOG0dl0MND42/5qw/
   y9JHRzAXB8zkGF5imNcm3edzoeVgEesZoPcxxR/oppVmaQBQjZwmhkYYh
   JREAE4AwNbKprVNPhBOdvRZrBpDQdcpKPqwyA+l7kPt6Y2/lBBcbWC0S6
   InpoeysPkTaOCPbpqLyh7b+OwKMtNrqXBHfrma83y90fsytMrMBpGwAZp
   Q==;
X-CSE-ConnectionGUID: IB64I9kIRpistIyTn6yW7g==
X-CSE-MsgGUID: 9zIV6tnLR0OqE6rIQFEmXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48192356"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48192356"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:20:37 -0700
X-CSE-ConnectionGUID: vc8AOPCRRiuqJC3SOXoJTA==
X-CSE-MsgGUID: hQ+sP/jIS2OPowGLfyDujQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138866960"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2025 23:20:36 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH v1 0/7] Add two new features for QuickI2C
Date: Wed, 14 May 2025 14:19:37 +0800
Message-Id: <20250514061944.125857-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to improve THC compatibility with lagacy HIDI2C touch device,
on Panther lake (PTL) platform, THC hardware introduces two new features
for I2C subsystem:
- Input max input size control
- Input interrupt delay

This patch set adds APIs for above two features' setting and enabling
in THC hardware layer driver, and enable them in QuickI2C driver.

Even Xu (7):
  HID: Intel-thc-hid: Intel-thc: Add thc_dma_content into kernel doc
  HID: Intel-thc-hid: Intel-thc: Refine code comments
  HID: Intel-thc-hid: Intel-thc: Introduce max input size control
  HID: Intel-thc-hid: Intel-thc: Introduce interrupt delay control
  HID: Intel-thc-hid: Intel-quicki2c: Refine code comments
  HID: Intel-thc-hid: Intel-quicki2c: Add driver data support
  HID: Intel-thc-hid: Intel-quicki2c: Add two new features to PTL

 Documentation/hid/intel-thc-hid.rst           |  27 +++
 .../intel-quicki2c/pci-quicki2c.c             | 204 +++++++++++-------
 .../intel-quicki2c/quicki2c-dev.h             |  55 +++--
 .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 140 ++++++++++++
 .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  29 ++-
 .../intel-thc-hid/intel-thc/intel-thc-dma.c   |  40 ++++
 .../intel-thc-hid/intel-thc/intel-thc-dma.h   |  38 ++--
 .../intel-thc-hid/intel-thc/intel-thc-hw.h    |   5 +
 8 files changed, 417 insertions(+), 121 deletions(-)

-- 
2.40.1


