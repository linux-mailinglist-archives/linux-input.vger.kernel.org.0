Return-Path: <linux-input+bounces-12922-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67545ADC186
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 07:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B25981891137
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 05:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF8523B63D;
	Tue, 17 Jun 2025 05:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="b9BC7uGd"
X-Original-To: linux-input@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D1023B614
	for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 05:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750137647; cv=none; b=GlBEX7PCpCjWr4zXa7UwQn1rsVdzQ9ilSHc6DpdPHV9oFAN7U2RlcAbu2v32JDO28Be08XXI3NsRPKVHvIKZ/eJDFICOB7zVgyJnuNnE3QCTkwextC04fWLEAuxirz6WUxpsjLLTMwgXIGtEGsboKdTcPACSNVPtq3Lm2gyRPSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750137647; c=relaxed/simple;
	bh=mrGo0BcyHuPoyfNxUkOXPEoPr5srbAtdP96o3EhWhOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lshSqZR2r4Xvt6rBAskx7T/7YyNXDf+gdQMeACaQ+2CG3hIk7x/RpN9a7PAnRL75ERuJdCOWZT9SeemLQiZmiy3/6B0/4vcD11gYdgFEVtLAbWa2wV2KZzx1QDPI+04BkySEMU1azbN9FM/7guq5WYu1GMGTsKBzx6H2d2971NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=b9BC7uGd; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750137644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=26Uo2/R6fJOZdLlswb8cEMxHzB7gPbjqKnTJui1PC8s=;
	b=b9BC7uGdK9mr0Zocwiy9gkc7Ca32Er38Kne1Gwc/MDYZaHb7XuL8zGbEiUrrJdDJ2kzuW7
	IpSGx1fAUW3yotHggOHZxMuI1QLMkH0s2NmxjXvLHw0f38h2321vVVnjhvvTQGZxSKRc1j
	seY5WZLXFgfpfGt2Nqe7SBwrq0iAXrc=
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH 2/2] Input: i8042 - Disable keyboard wakeup from s2idle on MSI Claw devices
Date: Mon, 16 Jun 2025 22:19:30 -0700
Message-ID: <20250617051930.3376981-3-matthew.schwartz@linux.dev>
In-Reply-To: <20250617051930.3376981-1-matthew.schwartz@linux.dev>
References: <20250617051930.3376981-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On MSI Claw handheld gaming PCs, the volume buttons are considered a part
of an i8042 keyboard device and can wake the system from s2idle. This is
not expected behavior on a handheld gaming device, as the volume buttons
can easily be pressed while handling the device in its s2idle state.

To avoid this behavior, enable the SERIO_QUIRK_NOKBDWAKEUP quirk for all 
current MSI Claw models to disallow wakeup via the i8042 keyboard device
while maintaining volume button functionality.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 drivers/input/serio/i8042-acpipnpio.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 6dbe9d8523f49..c1874a309c69b 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -897,6 +897,30 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		},
 		.driver_data = (void *)(SERIO_QUIRK_RESET_ALWAYS)
 	},
+	{
+		/* MSI Claw A1M */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Claw A1M"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_NOKBDWAKEUP)
+	},
+	{
+		/* MSI Claw 7 AI+ A2VM */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Claw 7 AI+ A2VM"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_NOKBDWAKEUP)
+	},
+	{
+		/* MSI Claw 8 AI+ A2VM */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Claw 8 AI+ A2VM"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_NOKBDWAKEUP)
+	},
 	{
 		/* MSI Wind U-100 */
 		.matches = {
-- 
2.49.0


