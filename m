Return-Path: <linux-input+bounces-13187-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3506CAED703
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 10:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D3AC173B11
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 08:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC5A21CA1E;
	Mon, 30 Jun 2025 08:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edM2cem3"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6524F4A01;
	Mon, 30 Jun 2025 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271774; cv=none; b=Yh6DL8m4lp87aFSYLI5LbzrMwTQ+Sx2MtlRMsssZfROd5zkTIo0VzYk92TU5XY52QRuQTMjyLwTgY9L8lhIzwnchUi+hV4VTAlDPYzUN+MIM7qPCOmBtpdIu/lv/qjKU1FWZWM7ANM/ESYHhxgq0uSif6oPfKMqhuseRG+YIcYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271774; c=relaxed/simple;
	bh=0f0Fwy4oB8/0GakgP8GYlJW0kOva5HqGm0wzr6kan4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LrkxxhlzA4+rxKdLPTswfMgqG0JXkf+V/euBmuOL0oe3oqlTgf4Cbf0SC/n1ebZ0aT7ajugG++J3rH/QFsFEp9VafKzmnMs9/cuhfHnHktLcz5PVDbdmpSaM4zf481uDLy9+ehuJrmnykaecn/Rk3Al/ZnD9RnAOexsfW1GsU2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edM2cem3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751271772; x=1782807772;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0f0Fwy4oB8/0GakgP8GYlJW0kOva5HqGm0wzr6kan4U=;
  b=edM2cem3ByW43gUuxd62wwIEqptT0auU9XAatqFmA/a4p1PRaO6KEaYP
   CHnRdt0y29RvqejCThX7Hi2zAayHiauxQUUUWyQ6haKzuzyg9LrF09oR3
   qxJMgySl388ir4ikreYBR9hXc4aHHKpExJOJXco2vofoi6lqJs7HmOQ/U
   9jm52LTPh/TUMfGZnUWhblqatniWefKur6AoAYD30XklCHLgLR/GYgDz9
   wXizmJVphYCKpnuDsv4u7Y5Mvn37MfNBsixRUi+J0SvByzfWDFJqV4QzT
   Sbx/hBn6myYjJtU9zq2M94n04IqbUbtgD+kfG3fyBtIk8rSeiMA2RWmEp
   Q==;
X-CSE-ConnectionGUID: dnr3IvtmSqSeYo8VkUCU+Q==
X-CSE-MsgGUID: 0wgYaPorTbCJ7/La8zu3Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64840994"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64840994"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 01:22:51 -0700
X-CSE-ConnectionGUID: 0F+JVMdMRDSnLQid6qtNWA==
X-CSE-MsgGUID: FSdfDtceTGu13fKCeOTk6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="184414377"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 30 Jun 2025 01:22:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 718321FE; Mon, 30 Jun 2025 11:22:48 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] Input: alps - switch to use scnprintf() to suppress truncation warning
Date: Mon, 30 Jun 2025 11:21:52 +0300
Message-ID: <20250630082245.1416796-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit 76c968e75715 ("Input: alps - switch to use scnprintf() to suppress
truncation warning") converted one place in the driver while the other left
untouched. Convert the other place as well.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Dmitry, thanks for fixing those problems! This one can be folded into mentioned
commit if you are still can / want to rebase.

 drivers/input/mouse/alps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index a1ebc30c11a9..d0cb9fb94821 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -3103,8 +3103,8 @@ int alps_init(struct psmouse *psmouse)
 			goto init_fail;
 		}
 
-		snprintf(priv->phys2, sizeof(priv->phys2), "%s/input1",
-			 psmouse->ps2dev.serio->phys);
+		scnprintf(priv->phys2, sizeof(priv->phys2), "%s/input1",
+			  psmouse->ps2dev.serio->phys);
 		dev2->phys = priv->phys2;
 
 		/*
-- 
2.47.2


