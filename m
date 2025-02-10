Return-Path: <linux-input+bounces-9900-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61822A2EB67
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 12:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8DB2168FD4
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 11:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74211E47BA;
	Mon, 10 Feb 2025 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MsxdavJF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950801E1C36
	for <linux-input@vger.kernel.org>; Mon, 10 Feb 2025 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187391; cv=none; b=LPSO7r/YUMW8B7exYn7IeL2Mya4b5PcSajGj8vs+hFSDeZqGjcORSFRaKxoxyAvautFzrPS0gpvptfMtKsHk02Q/Q5s48aKrJF/muQFb8tFWKrfxzi94UOmoGslpe0eXgLDPaQustGQhD1zj3H5LDVFtDieK5zf89xQKU5NrjUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187391; c=relaxed/simple;
	bh=odmp1oDLZulB0D8tTpCIL0DR4oKUvAKvMur9OJWqB0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AkkXPrbgRHTNybeEP1vYOFQvgkMhllfQcE9z3qxzdUXAou0X6ZFxOy+wC9kF9GFaB+tzb0OAkUHICrF0X33PzUF/z+Z56z3hc5u59kYRttoQQX8C2rosP8wpcFTvUDxcqlAc87ZrGEwammlf5OK1xX2S4JPmOUji2UFPDXdeM5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MsxdavJF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=hqpXnqINHQcDKB
	KXI9V709vZ+X4vx/JtQ1HvqWf/c78=; b=MsxdavJFXS5TYvEa4PuXyYA66LX+xW
	Nu1U2guzEnkhI11X+pkwOt6Ut6U0ujVx7A1utzUyAxU3tTD5AE6YEQpjThrvuvM6
	hTVxtE31+j2cdKHrC/Kym8O2BuiL2QbELgOSzpfGBrY9/guu8ilASORjv2rjfhmz
	NibLG6C+HRN2mK8AqyBErPiYQAYdETNqEM9cJohMHzX12BS+zDN/sLeowKFmlb23
	+pWZcZqSFxao26E9RCahO7+eQhiFCZLbuRKoOjNnLaBVbhATBdiE21OX409QtglB
	4EmDENQl8W0sXDTW4f7Zq9W2AGh+rm/GQGwcwV7AgOpaotCq5vUdwzdA==
Received: (qmail 802212 invoked from network); 10 Feb 2025 12:36:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2025 12:36:27 +0100
X-UD-Smtp-Session: l3s3148p1@U6pqHsgt3Ntehh99
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jiri Kosina <jkosina@suse.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH RESEND] HID: google: don't include '<linux/pm_wakeup.h>' directly
Date: Mon, 10 Feb 2025 12:36:13 +0100
Message-ID: <20250210113612.51883-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header clearly states that it does not want to be included directly,
only via '<linux/(platform_)?device.h>'. Which is already present, so
delete the superfluous include.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Jiri Kosina <jkosina@suse.com>
---
 drivers/hid/hid-google-hammer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 0f292b5d3e26..adb4f48804e5 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -22,7 +22,6 @@
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
 #include <linux/platform_device.h>
-#include <linux/pm_wakeup.h>
 #include <linux/unaligned.h>
 
 #include "hid-ids.h"
-- 
2.45.2


