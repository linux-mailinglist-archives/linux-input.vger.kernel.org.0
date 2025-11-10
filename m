Return-Path: <linux-input+bounces-15974-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DE1C4573B
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 09:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27D073B4166
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 08:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDCC2F25F1;
	Mon, 10 Nov 2025 08:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mosJZ7ze"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F762F6937;
	Mon, 10 Nov 2025 08:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762764742; cv=none; b=TEO0fujZ+RU8MInzNgiPv8/1fvyaFJB67rYU/Vp2OlsXX5hnoLPORray7mrUiIoA3lKu917n6+GR6tqN+2fx9zDTHKDSzY3v42JSq7AzGGUUlZPUCPR1Q3Xm4y5oXMdyBNFwWa+zzwLrqAPPBlcFwIDZGfoQ0YMaY2Bgus0SZ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762764742; c=relaxed/simple;
	bh=dDOq3UaFkFzKOUAwy6Vt2xf7bR4f29gMNu4AHKX58gI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jm+RZ9BwlW8vPWiY/tDwbsmGJjukie3gG260hvuqB3lp+U9RC3aDKb54Htqnch5OzCR/wBfpgJEpiRNjY/JkPMFBskpsjug83yiKIQUQqt8+5hoy0v/KdAVKddb/bcZAjo/fTr7Awmr2i5ko6Xj27596TSj3n7n83gSnaKQazBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mosJZ7ze; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86ED5C4CEFB;
	Mon, 10 Nov 2025 08:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1762764741; bh=dDOq3UaFkFzKOUAwy6Vt2xf7bR4f29gMNu4AHKX58gI=;
	h=From:Date:Subject:To:Cc:From;
	b=mosJZ7zeL1PN1fLCl9W4+/CEOEG5xeDJ5LOkk0UcEyW8odVw0B2QoQtKaCo0L1N9D
	 GBMGQRBC49ez0uRtbXOeB3bkWIo3E2rKS2uokqEYPtKrmVfzVclw6NdL1d6ziL0hfC
	 vQLscGiAHPA6zAVYtEiKZvkFx12T992MFbUYpoT4=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7980BCCFA1A;
	Mon, 10 Nov 2025 08:52:21 +0000 (UTC)
From: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>
Date: Mon, 10 Nov 2025 16:52:16 +0800
Subject: [PATCH RESEND] Input: atkbd - skip deactivate for HONOR FMB-P's
 internal keyboard
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-honor-v1-1-c6fa244d2a8b@linux.dev>
X-B4-Tracking: v=1; b=H4sIAL+nEWkC/12MsQrCMBRFf6W82UhfUNo4OdjVQUfp0DQv5kFJJ
 NFQKf13Q0fHc+/hLJAoMiU4VQtEypw4+AK4q2B0g3+SYFMYZC2PWEspXPAhilaPSpNtSQ8NFPc
 VyfK8dR5w6+7d9QJ92R2nd4jfLZ9xe/9KGQUKa1t1ICMbHNR5Yv+Z94Yy9Ou6/gDVxd9WogAAA
 A==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762764740; l=1781;
 i=cryolitia.pukngae@linux.dev; s=20250730; h=from:subject:message-id;
 bh=dDOq3UaFkFzKOUAwy6Vt2xf7bR4f29gMNu4AHKX58gI=;
 b=/NMHIn/AzlcBr/Uqra5zyQEmXRzq9r45qdvhasb8cZwMBmkJnWR+wg9Wrt8/JaB3yMr0rW1LZ
 PJaxqqNRoCdCtrdpXCQw5OXAKKgF83tOtVSwRPCCFFQrGeV+Wt3nqAA
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
Reviewed-by: Hans de Goede <hansg@kernel.org>
---
Previous: https://lore.kernel.org/all/20251022-honor-v1-1-ff894ed271a9@linux.dev/
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



