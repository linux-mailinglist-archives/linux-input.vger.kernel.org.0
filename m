Return-Path: <linux-input+bounces-13435-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F93AFEC9E
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 16:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 624DF189F25F
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 14:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541E32E62B5;
	Wed,  9 Jul 2025 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7T7qeHJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258722E613B;
	Wed,  9 Jul 2025 14:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752072735; cv=none; b=VPG8Qu0IBJKpK7m/XBddMwRF9GrFiDLMx+Nfu/wU8OCv60EUsBbe4tYtYur4SL7j1VaylDTV0SC5/BijgeGgSd6EVCveHqiRQvwbsaLMppmSNJoeL4wNG0W0QjLA5V6NW/yI/RZ5Z+Q+wQgK66vle5KGkx2NHwGQMia+g7Ow7vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752072735; c=relaxed/simple;
	bh=Co8as0JEy3sYgEqTMquGxvLRQOzjREC6NPEM+EJDGaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMzgBXUdo44ftRERwx43yMdvMMLXqhkdN5udsh23ofb5RE/OJsVGCWxyhfCwzJrc4AjVnFZKFN39trx1w+XasfbFthlw9R6Zabdih3MJn3RqKjZvnrsVCyokYY/ZWW/Aa3WDaifOHqxKdNODlHm+dDKF806gNvUUH51Fshy59sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7T7qeHJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F32C4CEF1;
	Wed,  9 Jul 2025 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752072734;
	bh=Co8as0JEy3sYgEqTMquGxvLRQOzjREC6NPEM+EJDGaA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u7T7qeHJtm6VWzh+p8yGDGcajVSx5tcDnYvaGlmVLWad65v3KnoY9GPLcxFP7X0fX
	 vFnECyZ3JQ7UGULyuwv6cAIsjHf1Z6T9zJRFQDrgx3KwQjishOFI9O19YiiXJ9AWIL
	 JuRaKgUepYDWanPtSJ66uSaJojEMzuJswxKQqp63vxj1V1kSm6+33SCOdQwFgK0OPD
	 YdmQQ1WABAKgYE9V0HrXLw42knmEcaqyQUDfxYJVafrAdLYadoSj8ZOX7sPt7n8v1o
	 Y2DvEMFwojWcbhSbqinSd1Bw6EDdJNwNPDv2yzPbYGtwjD2ozkuuOQeQdlP4VcKjOP
	 fzACJ06xaDW4w==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Wed, 09 Jul 2025 16:51:46 +0200
Subject: [PATCH 1/3] HID: core: ensure the allocated report buffer can
 contain the reserved report ID
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-report-size-null-v1-1-194912215cbc@kernel.org>
References: <20250709-report-size-null-v1-0-194912215cbc@kernel.org>
In-Reply-To: <20250709-report-size-null-v1-0-194912215cbc@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752072731; l=1423;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=Co8as0JEy3sYgEqTMquGxvLRQOzjREC6NPEM+EJDGaA=;
 b=Nk5/yIxxw6yiM6a65iHvoutmTvlBIDC86BFeY/LcUl0qr0/5MO9AqI0xl9PLLrYtBiZuk4Rp5
 vovKumZBHSMChQjbCR4N81Os3V93hKkFSSjIzsC0xQWyGEzuwY8xUrG
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

When the report ID is not used, the low level transport drivers expect
the first byte to be 0. However, currently the allocated buffer not
account for that extra byte, meaning that instead of having 8 guaranteed
bytes for implement to be working, we only have 7.

Reported-by: Alan Stern <stern@rowland.harvard.edu>
Closes: https://lore.kernel.org/linux-input/c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu/
Cc: stable@vger.kernel.org
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/hid-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index b348d0464314ca331da073128f0ec4e0a6a91ed1..1a231dd9e4bc83202f2cbcd8b3a21e8c82b9deec 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1883,9 +1883,12 @@ u8 *hid_alloc_report_buf(struct hid_report *report, gfp_t flags)
 	/*
 	 * 7 extra bytes are necessary to achieve proper functionality
 	 * of implement() working on 8 byte chunks
+	 * 1 extra byte for the report ID if it is null (not used) so
+	 * we can reserve that extra byte in the first position of the buffer
+	 * when sending it to .raw_request()
 	 */
 
-	u32 len = hid_report_len(report) + 7;
+	u32 len = hid_report_len(report) + 7 + (report->id == 0);
 
 	return kzalloc(len, flags);
 }

-- 
2.49.0


