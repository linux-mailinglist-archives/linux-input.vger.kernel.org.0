Return-Path: <linux-input+bounces-15651-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5792FBFB6EB
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 12:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C928C462E53
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 10:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD0530F7FA;
	Wed, 22 Oct 2025 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="yy93WlZr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F0B2F7ACA;
	Wed, 22 Oct 2025 10:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761129673; cv=none; b=Sgweo+Ol4JMQq1WjdTOx2UZD4mHESiYSA70X0iG8zVTKIPkaR7y7UQNvO5SaN8BsJo7neIUFRByY+fTtLqh6/aBQCn5TDAUMSA610Bewhjfgj7sRfvlu17706l4Qc1VmKYwsazg4xz/pWvec/vWDDN1B+eCSgnGfXgGbWUXUv1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761129673; c=relaxed/simple;
	bh=Y4XRWqk30UFx8XFg5iSytvbhCXlPHqHCtntZ18Rvdek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TGr3OQuw86nqUB++HoTYgn0NDeZ3T9slpgCOFfNPPQs9EEQB4BCJXjU7t2vkQFC1fL+wNAeYbKVvjzodlO77BUa9Z1APJ7PbQ5I8odxMp5LZpey7DuFLoSnb8w/R2byDlSKB2LaYoL7vRoCc1yZoLfn55VijPO4Wg8DplHaw4io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=yy93WlZr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03F0BC4CEE7;
	Wed, 22 Oct 2025 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1761129672; bh=Y4XRWqk30UFx8XFg5iSytvbhCXlPHqHCtntZ18Rvdek=;
	h=From:Date:Subject:To:Cc:From;
	b=yy93WlZr1p5xL5ci3wYC3sR54UXjcZacSCPyrVrMLHLCFeBatu1pU3PayApjmhIWv
	 y0+zlA2QEYsjaVp/Xwam7iFsSs7ZRFC/YrvLtOduMHi7hOpYhGHYlUMxyYPLob+pL0
	 TQYeB4L0lbjhIN1CnMTMZknrFyMKICidzsoQJml4=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED31CCCD1BB;
	Wed, 22 Oct 2025 10:41:11 +0000 (UTC)
From: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>
Date: Wed, 22 Oct 2025 18:40:42 +0800
Subject: [PATCH] Input: atkbd - skip deactivate for HONOR FMB-P's internal
 keyboard
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-honor-v1-1-ff894ed271a9@linux.dev>
X-B4-Tracking: v=1; b=H4sIAKq0+GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMj3Yz8vPwiXYukZMuk1DSL1KREcyWg2oKi1LTMCrA50bG1tQCjEZU
 DVwAAAA==
X-Change-ID: 20251022-honor-8bc9bef8eba7
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Hans de Goede <hansg@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@kernel.org, zhanjun@uniontech.com, niecheng1@uniontech.com, 
 cryolitia@uniontech.com, Mingcong Bai <jeffbai@aosc.io>, 
 Kexy Biscuit <kexybiscuit@aosc.io>, Hans de Goede <hansg@kernel.org>, 
 Mikura Kyouka <mikurakyouka@aosc.io>, 
 "foad.elkhattabi" <foad.elkhattabi@gmail.com>, 
 Cryolitia PukNgae <cryolitia.pukngae@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761129670; l=1646;
 i=cryolitia.pukngae@linux.dev; s=20250730; h=from:subject:message-id;
 bh=Y4XRWqk30UFx8XFg5iSytvbhCXlPHqHCtntZ18Rvdek=;
 b=fb54gBCoYQovO+qnMoj2w8LSCLTtg/nOUcNHVdOCnOqERcMLdLRUH+co3MkgsyKtoUWgWVa5r
 Nergjot7GtUCDD2oH+CFBMJ7oHtvHi3UgY6/xrvaqA0sn2oxIUzJ0Zv
X-Developer-Key: i=cryolitia.pukngae@linux.dev; a=ed25519;
 pk=tZ+U+kQkT45GRGewbMSB4VPmvpD+KkHC/Wv3rMOn/PU=
X-Endpoint-Received: by B4 Relay for cryolitia.pukngae@linux.dev/20250730
 with auth_id=540

After commit 9cf6e24c9fbf17e52de9fff07f12be7565ea6d61 ("Input: atkbd -
do not skip atkbd_deactivate() when skipping ATKBD_CMD_GETID"), HONOR
FMB-P, aka HONOR MagicBook Pro 14 2025's internal keyboard stops
working. Adding the atkbd_deactivate_fixup quirk fixes it.

DMI: HONOR FMB-P/FMB-P-PCB, BIOS 1.13 05/08/2025

Fixes: 9cf6e24c9fbf17e52de9fff07f12be7565ea6d61 ("Input: atkbd - do not skip atkbd_deactivate() when skipping ATKBD_CMD_GETID")
Reported-by: Mikura Kyouka <mikurakyouka@aosc.io>
Link: https://www.xiaohongshu.com/explore/68738d0a0000000012015a79
Link: https://club.honor.com/cn/thread-29463529-1-1.html
Link: https://club.honor.com/cn/thread-29490444-1-1.html
Reported-by: foad.elkhattabi <foad.elkhattabi@gmail.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=220384
Signed-off-by: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>
---
 drivers/input/keyboard/atkbd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 6c999d89ee4b..422e28ad1e8e 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -1937,6 +1937,13 @@ static const struct dmi_system_id atkbd_dmi_quirk_table[] __initconst = {
 		},
 		.callback = atkbd_deactivate_fixup,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HONOR"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "FMB-P"),
+		},
+		.callback = atkbd_deactivate_fixup,
+	},
 	{ }
 };
 

---
base-commit: 552c50713f273b494ac6c77052032a49bc9255e2
change-id: 20251022-honor-8bc9bef8eba7

Best regards,
-- 
Cryolitia PukNgae <cryolitia.pukngae@linux.dev>



