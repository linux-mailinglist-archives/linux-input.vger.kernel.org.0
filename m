Return-Path: <linux-input+bounces-4120-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1748FCDBC
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 14:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3AADB2B9F3
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 12:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BACE1C7D91;
	Wed,  5 Jun 2024 12:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dm+ur4TV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6101C7D8B;
	Wed,  5 Jun 2024 12:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717589065; cv=none; b=aemZfyP/0FHJDST8rPPuu8ME5L1S7gjuEHSSo3TbkNJv5wTLaQH/nTnOEiqq1Bpu0ZrYstKvM3iONF7zjKey9Po7Z3amx7urYCBkxh/Eg8OIBAliZujja0MLdpJd9/qA0B5L1xdHdDi5wVXAQD8gh2o3SHUYispuvDoQPA+9g3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717589065; c=relaxed/simple;
	bh=gvhWtGj+vgnOr80rlbZcsFxpJgJ278XzhCa/K2Jkf4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCTOt/z6nIvv503xjERlAFsquWRiTnNN/5vLeeb9BpnuCwU9V3LzKLppq6w5Zf+rqNlxt50y9MEMY8vJZt5Ls8olXhdEWLHkr07SHcCgOp1s3R4i+1BQFsVJHLxCk+hkzV8pCyCU+wf06j9yoFSJdApz4YytQ2OkygV1RdN7OZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dm+ur4TV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67B0C3277B;
	Wed,  5 Jun 2024 12:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717589064;
	bh=gvhWtGj+vgnOr80rlbZcsFxpJgJ278XzhCa/K2Jkf4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dm+ur4TV03AgVsui+Yg2+isbxtsKU768bMDpVvOB4PizGlWkp0YNow5jDdGqpVltN
	 y09NKjdPZJR8c1FEWEbSjlZLN1xR5rwOTmW/1gvreWkIhAR4hx+nexf3AtPYXhXs2l
	 2jGbOOWh1qOE7jhTDmGnimnExqdO/5Ge9mS5FPF/UzkVgyojoAkrTXhLtXTJiahBM1
	 hh6vT7WOzdN2PNFRHFEtFAGjeyg1gGcXB7jG4QRJJ7j/QYenlAiszfMR3ml0Jdj0O6
	 zpRnnFSayIuxJ81FWyle3wHbO6fJxBVy7B0FFsUIF4G49tHRsOk1gJBN6NGYO1qnxd
	 uWrV9RaxKJjgA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: hmtheboy154 <buingoc67@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	ilpo.jarvinen@linux.intel.com,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 09/18] platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro
Date: Wed,  5 Jun 2024 08:03:48 -0400
Message-ID: <20240605120409.2967044-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120409.2967044-1-sashal@kernel.org>
References: <20240605120409.2967044-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.32
Content-Transfer-Encoding: 8bit

From: hmtheboy154 <buingoc67@gmail.com>

[ Upstream commit 3050052613790e75b5e4a8536930426b0a8b0774 ]

The "EZpad 6s Pro" uses the same touchscreen as the "EZpad 6 Pro B",
unlike the "Ezpad 6 Pro" which has its own touchscreen.

Signed-off-by: hmtheboy154 <buingoc67@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20240527091447.248849-3-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/touchscreen_dmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 86e8d78ae7c1b..ce00fa6427b3e 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -1409,6 +1409,17 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_DATE, "04/24/2018"),
 		},
 	},
+	{
+		/* Jumper EZpad 6s Pro */
+		.driver_data = (void *)&jumper_ezpad_6_pro_b_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Jumper"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Ezpad"),
+			/* Above matches are too generic, add bios match */
+			DMI_MATCH(DMI_BIOS_VERSION, "E.WSA116_8.E1.042.bin"),
+			DMI_MATCH(DMI_BIOS_DATE, "01/08/2020"),
+		},
+	},
 	{
 		/* Jumper EZpad 6 m4 */
 		.driver_data = (void *)&jumper_ezpad_6_m4_data,
-- 
2.43.0


