Return-Path: <linux-input+bounces-10649-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3C0A57AE7
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 15:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC2116DD57
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 14:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AC91D31B8;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWf20P1h"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9767D192B77;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741442924; cv=none; b=Cr/8svsVNJq4OAJaCMHeI8+oIURmRRlAAVN80xNiC+OeH1U0iaBcGbWi+tymDfG4V17hwaRT3e5v9SfiZYPWDiWPo4CUROETv4p4qsGzN3srlVgfj+3+VVK4NS2WAhg4Fh0cb5iZg0neT574RAoulyAbhOnmHGTsBtfDA1B0DiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741442924; c=relaxed/simple;
	bh=FessAHfp8llK1MUhLRPld2VGAhXefezsrHZkyVH8U3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n7V0EMIRiebIO3TfnyFBA55uYsPaRCQ33MJvIoLI+QuL/p2yNBXdpvA0bjWd3P7k9syZVSj6X/CZOY6ZDa+U/K1GRGqz28Ct72KOaYomc/ZWpEUXi19eJFQHbRZuKhg4IQ0W7BUI0igYZecQtU13Mar6yDBEyf6dHCKQaPZlU8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWf20P1h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2767BC4CEE5;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741442924;
	bh=FessAHfp8llK1MUhLRPld2VGAhXefezsrHZkyVH8U3g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WWf20P1hdOrPQQXPHAtjIQAYE5RE/1vDaMAtk+Cz53dne0yFMmxkhCeMRFC/YNsNc
	 +nWqueARH7tjMH+R3cIQzF3MSL3F3MY8K4fHu7QDzY/jh6ocjbwuBcS660G9kkxAVP
	 DRyuVePETqkG86OyksvFOM+0D4I8GY0Xho0+a4qCs2W/8Kmiuox0Tvzs0NRGzz987A
	 Z3yrYzY/LzQUQclr4m+tIff/T+xxx0Ye1+zpkezCovqUZvsbHnqizq5rFl30+J0Eix
	 loWJTqpLVgm0byG8vxNyWJ5PjsyCLBZwyvMCwHpe0ufXhGQzET2bRZRXSasBdwq7qu
	 6O2MNT1xcPiag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E526C28B30;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 08 Mar 2025 15:08:38 +0100
Subject: [PATCH v3 2/7] Input: synaptics-rmi4 - handle duplicate/unknown
 PDT entries
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-synaptics-rmi4-v3-2-215d3e7289a2@ixit.cz>
References: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
In-Reply-To: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Caleb Connolly <caleb.connolly@linaro.org>, methanal <baclofen@tuta.io>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3845; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=P5bWS9YpBhh6rej3eJlRz9nJ3YiSKMRmC41cjG3uBXo=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBnzE9pYdwMDbjsem/LjTKlRfPTrGJ+w1wdgdQx/
 4J56ibrqMqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ8xPaQAKCRBgAj/E00kg
 cuzuD/9On3Sjrc+4jUD+JVvOK63+3yiMiXrs7x/BujlnPCN7btowJWUbtqicsLqxBQBdoSqoz70
 EiLiLyz4w7MDXXFXtdl0ALqwJ0PrWed7U1AxciUJ1xNHLLp7MYzYfHHbNsLR26ucH1FQvG9PTy3
 YGNZ3vT+JouNkeiUy8EMwpB/TKwR+H0eqVGRGV/eqgRE6d5plfcOC27oXOUTae/emEGXa1TRDTs
 Qh/M/799lvHZrggbNqfzjsOB0NKdSgFI9eSdxqBc6F36i8WOEHNDb0+R3MezPq7t03ENXlalrMC
 Dv1VPezflsiRKpH2aMGKLeq3AGB6fggNI9BcsJ6xrVoNwIOrcLV2oK6dp1VdiZcwQSDt7rn1uJ5
 BdPaZalFX7v2drM/qm/QwB5F/ji29HipO0MU8sbHxLKjW3gaySkkcdLdxhGRQ7L4u9iTH5VoASU
 34XVD1KFB5MZVBgMxl4mwMTFxrrel1Cq01N8YXoXJ+mpX14b3PWeMxbGN7YbbP3IJ7Rs4esRIlo
 WeKp5IZIYzf+PRR2opmza15TRgBeyfTCIU6dj+U/+4jSPNgEgNxHOp8cpp6A98ZklsbE1ymUrCd
 hLjbV+Y28JntJrhhoBVNmrMOAc6uMYlvTuLTmInKl0YsnO2UP2pIYBr56Y60RyhNqHWz7hM62+x
 Og8sDg+0sLb3UNQ==
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

Co-developed-by: methanal <baclofen@tuta.io>
Signed-off-by: methanal <baclofen@tuta.io>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/rmi4/rmi_driver.c | 47 +++++++++++++++++++++++++++++++++++------
 drivers/input/rmi4/rmi_driver.h |  6 ++++++
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 2168b6cd7167334d44553c9c566f870a4e034179..51c23a407b2731d5b6eaefe9cae6288f97316e34 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -493,12 +493,44 @@ static void rmi_driver_copy_pdt_to_fd(const struct pdt_entry *pdt,
 	fd->function_version = pdt->function_version;
 }
 
+static bool rmi_pdt_entry_is_valid(struct rmi_device *rmi_dev,
+				   struct pdt_scan_state *state, u8 fn)
+{
+	unsigned int i;
+
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
+		break;
+
+	default:
+		rmi_dbg(RMI_DEBUG_CORE, &rmi_dev->dev,
+			"PDT has unknown function number %#02x\n", fn);
+		return false;
+	}
+
+	for (i = 0; i < state->pdt_count; i++) {
+		if (state->pdts[i] == fn)
+			return false;
+	}
+
+	state->pdts[state->pdt_count++] = fn;
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
@@ -521,6 +553,9 @@ static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
 		if (RMI4_END_OF_PDT(pdt_entry.function_number))
 			break;
 
+		if (!rmi_pdt_entry_is_valid(rmi_dev, state, pdt_entry.function_number))
+			continue;
+
 		retval = callback(rmi_dev, ctx, &pdt_entry);
 		if (retval != RMI_SCAN_CONTINUE)
 			return retval;
@@ -531,11 +566,11 @@ static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
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
 
@@ -544,11 +579,11 @@ int rmi_scan_pdt(struct rmi_device *rmi_dev, void *ctx,
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
index 3bfe9013043ef3dff46249095a5b3116c8f7d9a6..0ecbd19cefffe00ce7c8001db6479a2e213ac466 100644
--- a/drivers/input/rmi4/rmi_driver.h
+++ b/drivers/input/rmi4/rmi_driver.h
@@ -46,6 +46,12 @@ struct pdt_entry {
 	u8 function_number;
 };
 
+struct pdt_scan_state {
+	u8 empty_pages;
+	u8 pdt_count;
+	u8 pdts[254];
+};
+
 #define RMI_REG_DESC_PRESENSE_BITS	(32 * BITS_PER_BYTE)
 #define RMI_REG_DESC_SUBPACKET_BITS	(37 * BITS_PER_BYTE)
 

-- 
2.47.2



