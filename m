Return-Path: <linux-input+bounces-10437-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7187AA498D6
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 13:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00ACA3A2BF1
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 12:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BD226B0A9;
	Fri, 28 Feb 2025 12:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoOdut9x"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD9826AA8C;
	Fri, 28 Feb 2025 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740744715; cv=none; b=GoUD5IYzpqRbxTkbHKlSPhD7ClWBX7PK97Cjtqh58xPrPD5b8JVjjhGb6mInxtdkmqRhqNLebhxEjfQy6/mJnsIl49NcD6NcmP5HBallAS++YQ83k/5T9EPslmv8WkiasyZgVL8gzljQ+NCDeUckIY3nz6/NErLzBWM0MFQUElo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740744715; c=relaxed/simple;
	bh=CLFBxsr69As2ZgbigsO7Hmp0XbIPxom3MMFTr70R99o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s5gF6BuayZJQgoo0dp0TbOzk2kXvTjhJ3ZBdJEwecC9jYe6FlFAfVEYvxtfS8KWgx1329bxVF+fPcaPg0hjIkdmPbs3BSAy+75zlwnvVjWCcWgyjkvWSOvAcBdcrgNMEYyMtWl8JXyhsr8n3Hak5jDJK38Yxg2IemmuRmeKGUD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoOdut9x; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740744714; x=1772280714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CLFBxsr69As2ZgbigsO7Hmp0XbIPxom3MMFTr70R99o=;
  b=HoOdut9xdWQCblRiGYHFWdYemNMv1ushrRNTlOrEHs7u6S3OEfHRwi3+
   xgn35eI15eRKbT1Ygg2bLR/eh4poWPNc/AhI3llOlNucsKAxF1RQERMHc
   oLgso2em3f1C3Xt68nyI2QnxWgJkn/jGclKULVPKde2/6WnVJMLO5WPJd
   oobaz73FDqTxmV9sCSQux30XLdku7cQVrb/hBzLvTBWijAGxd4iLgdM8l
   t1YwMAEhfICUeGY0ud3hCDcH3UT8FfdOua0XR5D8aak54w2INEbIArNpg
   m/kSOvw5PUVn6ibGB7pUlqf5/9xti4PBPcXA/x4UwK+GtkDChg+9MyrLS
   Q==;
X-CSE-ConnectionGUID: Y1tA1EezTZGcLaIvHfPOGg==
X-CSE-MsgGUID: mmmCrPAwQUOiDEdsAsXSjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40846705"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="40846705"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:11:52 -0800
X-CSE-ConnectionGUID: KEkkcrigS0ioy0DvUjm+pA==
X-CSE-MsgGUID: L2A+yJ+KSWqY38dCBM/v5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117081033"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 28 Feb 2025 04:11:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E653B5F5; Fri, 28 Feb 2025 14:11:48 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v1 2/4] Input: atkbd - increase size of phys
Date: Fri, 28 Feb 2025 14:07:45 +0200
Message-ID: <20250228121147.242115-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250228121147.242115-1-andriy.shevchenko@linux.intel.com>
References: <20250228121147.242115-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When creating a physical device name in the driver the snprintf() takes
an up to 32 characters argument along with the additional 8 characters
and tries to pack this into 32 bytes array. GCC complains about that
when build with `make W=1`:

drivers/input/keyboard/atkbd.c:1194:9: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
 1194 |         snprintf(atkbd->phys, sizeof(atkbd->phys),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1195 |                  "%s/input0", atkbd->ps2dev.serio->phys);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Increase the size to cover all possible cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/keyboard/atkbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index adf0f311996c..3bf76dc768be 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -206,7 +206,7 @@ struct atkbd {
 
 	/* Written only during init */
 	char name[64];
-	char phys[32];
+	char phys[40];
 
 	unsigned short id;
 	unsigned short keycode[ATKBD_KEYMAP_SIZE];
-- 
2.47.2


