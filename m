Return-Path: <linux-input+bounces-13543-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C06B05926
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 13:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86D744E2331
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 11:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BFA2DE202;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5EJ9iyw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6EF2DCC1F;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752580152; cv=none; b=oaduw8G6bq+4N2YKpfAAqdjcs2j+Yk6Fp+5ju6ruvaZNp8yeL4UGb4hT5PxS+Lg1BstsMy1fbLpvz17mevcV56TGc+AQEmpJpHUQNU9KdrFu8Pjkyw1aUwQiqPftd895DuDvPhe370toLr8dFhzu/aY15BnVt6wTmJU0sUVleyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752580152; c=relaxed/simple;
	bh=K3YyvrVUo9TJ+BoNxaTwXhbXTnbVRUtjpc3gKo2u96g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JoLfu+53OTPnJLRmJ1QGuhHGwiU1c2YnP+ZseqlYZwIZKOHEFiPPG5FjOFVRGFbiK4lmbKsZyss/cEPk7Ra5qzd2ycyDryjMXZS/+OCB87+hRSVhe0fnx/URTHSDdy1ajuB3PHxIFtiIABZDuVtMBGB/4w7523ei1nZYbn3voZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5EJ9iyw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35965C4CEF9;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752580152;
	bh=K3YyvrVUo9TJ+BoNxaTwXhbXTnbVRUtjpc3gKo2u96g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j5EJ9iywUgxi5tUx0U3szIAM/W+7FlxmyfQNoMoa+PQNLHSJvwDw6XcR2svW7zjHc
	 0xoS7q8Lm+Lgi3oDBmOQxlgSL29o0yFGykUQIyqZrAXCEKyQjRF7XsRuHQ74ULuQgq
	 WJEMgX8R4Ipp2YbZ7MCmrAE8I06s+PZhoc/dayt9vayCJIRrfZCtwSSUZdMy5I2SEf
	 FLrGatBL7dvo3WRgzptEWhBBJTNR3R5QNo4rp4pkpHeRaWv8NrpxIE6ryUrcI1n9rq
	 dJix3tjLL5EdXxucJ2vTiM2uXa52w1DCRK99CjCEm++ds4qg4hM0rpgGiF7ci53BHk
	 4s0P8JnuPlXWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DD2C83F27;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 15 Jul 2025 13:49:01 +0200
Subject: [PATCH RESEND v5 2/7] Input: synaptics-rmi4 - handle
 duplicate/unknown PDT entries
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-synaptics-rmi4-v5-2-ca255962c122@ixit.cz>
References: <20250715-synaptics-rmi4-v5-0-ca255962c122@ixit.cz>
In-Reply-To: <20250715-synaptics-rmi4-v5-0-ca255962c122@ixit.cz>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3909; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DMyfmGUjTKWkjf5dJQfenW4XErBynGEc7q5TZ856CIQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBodkA0uoNTZ5PIKCSrNjx/8FWKCpvGOHd1NLk8/
 a5zI8/WhnyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaHZANAAKCRBgAj/E00kg
 cuhFD/9KrJPjQxFYJXITh9nq4LzZhLCkJyy0RMyk438mS+17jD3iAoYVpVgJnSNoyLeY9gqSUb7
 nhR4+LsVLmyQICgGw6ykGjFxc16Q4NUQJzvln2IkRgmcz8U7ZFg3cDDXJ6Tmxnb1GuyGo7xyT9p
 kvFjw1YoxA1AYkw8wxMXMAr5AnrF7KbxnKvFyCQlpdHo3MbqDu7CFsdWUCjHX/dSHbiN7BcaiQG
 7Bd26T0f9nYxV68VpFiWunYRojavSWk0lmv8qnkXXTkHXTDKu/kw3Lwqs3a2I7EEn06mKOt4fST
 7LlrzBW9PO5pws5cKWtFTk+b/ZFtVrN9xOWlOKQFq43zNNZ4znnbyKKc2VJ/KJQeCGMCHqHpZnK
 TQIlWIYxE77AOl7IOonCCLTKsKJhlhJ1CRbkDJlRyBh8np4m1fSJa1TTLzdurfyyIersQ29yx/H
 ZjdZ6dfRH8MKq6QicfmcIDOGi+iWQmkXJGrJSuDqWJuWjAuwg3Ek9OlWVHjZInaL957ZW7aSxoc
 rTnxDh0PQwKJOfRtu8FNF46Gx8atfE70pFxLZ2zlbOi46InUzKSqnUnbwXPA0HR2BHV+PAKOWdH
 mAQZZYyxLRtGcK9wJ68+wLhABEyUN4ksyYeM/uDwy0zE8TawI0SwwHDPW08TjoScDKqX5oCUyTx
 eSBRgv0blvUY6xg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Caleb Connolly <caleb.connolly@linaro.org>

Some third party rmi4-compatible ICs don't expose their PDT entries
very well. Add a few checks to skip duplicate entries as well as entries
for unsupported functions.

This is required to support some phones with third party displays.

Validated on a stock OnePlus 6T (original parts):
manufacturer: Synaptics, product: S3706B, fw id: 2852315

Co-developed-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/rmi4/rmi_driver.c | 42 +++++++++++++++++++++++++++++++++++------
 drivers/input/rmi4/rmi_driver.h |  8 ++++++++
 2 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 2168b6cd7167334d44553c9c566f870a4e034179..0f6dbe586c652d641178f43ec27df3613126ca66 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -493,12 +493,39 @@ static void rmi_driver_copy_pdt_to_fd(const struct pdt_entry *pdt,
 	fd->function_version = pdt->function_version;
 }
 
+static bool rmi_pdt_entry_is_valid(struct rmi_device *rmi_dev,
+				   struct pdt_scan_state *state, u8 fn)
+{
+	switch (fn) {
+	case 0x01:
+	case 0x03:
+	case 0x11:
+	case 0x12:
+	case 0x30:
+	case 0x34:
+	case 0x3a:
+	case 0x54:
+	case 0x55:
+		if (state->pdts[fn] == true)
+			return false;
+		break;
+	default:
+		rmi_dbg(RMI_DEBUG_CORE, &rmi_dev->dev,
+			"PDT has unknown function number %#02x\n", fn);
+		return false;
+	}
+
+	state->pdts[fn] = true;
+	state->pdt_count++;
+	return true;
+}
+
 #define RMI_SCAN_CONTINUE	0
 #define RMI_SCAN_DONE		1
 
 static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
 			     int page,
-			     int *empty_pages,
+			     struct pdt_scan_state *state,
 			     void *ctx,
 			     int (*callback)(struct rmi_device *rmi_dev,
 					     void *ctx,
@@ -521,6 +548,9 @@ static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
 		if (RMI4_END_OF_PDT(pdt_entry.function_number))
 			break;
 
+		if (!rmi_pdt_entry_is_valid(rmi_dev, state, pdt_entry.function_number))
+			continue;
+
 		retval = callback(rmi_dev, ctx, &pdt_entry);
 		if (retval != RMI_SCAN_CONTINUE)
 			return retval;
@@ -531,11 +561,11 @@ static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
 	 * or more is found, stop scanning.
 	 */
 	if (addr == pdt_start)
-		++*empty_pages;
+		++state->empty_pages;
 	else
-		*empty_pages = 0;
+		state->empty_pages = 0;
 
-	return (data->bootloader_mode || *empty_pages >= 2) ?
+	return (data->bootloader_mode || state->empty_pages >= 2) ?
 					RMI_SCAN_DONE : RMI_SCAN_CONTINUE;
 }
 
@@ -544,11 +574,11 @@ int rmi_scan_pdt(struct rmi_device *rmi_dev, void *ctx,
 		 void *ctx, const struct pdt_entry *entry))
 {
 	int page;
-	int empty_pages = 0;
+	struct pdt_scan_state state = {0, 0, {0}};
 	int retval = RMI_SCAN_DONE;
 
 	for (page = 0; page <= RMI4_MAX_PAGE; page++) {
-		retval = rmi_scan_pdt_page(rmi_dev, page, &empty_pages,
+		retval = rmi_scan_pdt_page(rmi_dev, page, &state,
 					   ctx, callback);
 		if (retval != RMI_SCAN_CONTINUE)
 			break;
diff --git a/drivers/input/rmi4/rmi_driver.h b/drivers/input/rmi4/rmi_driver.h
index 3bfe9013043ef3dff46249095a5b3116c8f7d9a6..cb1cacd013a3f39db96935f705f18018bf15adff 100644
--- a/drivers/input/rmi4/rmi_driver.h
+++ b/drivers/input/rmi4/rmi_driver.h
@@ -46,6 +46,14 @@ struct pdt_entry {
 	u8 function_number;
 };
 
+#define RMI_PDT_MAX 0x55
+
+struct pdt_scan_state {
+	u8 empty_pages;
+	u8 pdt_count;
+	bool pdts[RMI_PDT_MAX];
+};
+
 #define RMI_REG_DESC_PRESENSE_BITS	(32 * BITS_PER_BYTE)
 #define RMI_REG_DESC_SUBPACKET_BITS	(37 * BITS_PER_BYTE)
 

-- 
2.50.0



