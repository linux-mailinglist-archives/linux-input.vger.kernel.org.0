Return-Path: <linux-input+bounces-16098-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0ADC59037
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 18:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC1364F2D5F
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 16:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E43346FB9;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaQmXL91"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A381340D9D;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051467; cv=none; b=aYenA+GnjsabZWvc5NploskrwGjiBKc2QVQ8viUl4Z3hkWFHHU8ab+SFXt13UkbJ5rVsyHwiQobpl2EaSG4J2wUFgjCshYpRtecUzrQcA5+FI6MsGEKvJsVRmKl+lnID+5aJgHBtiQr90b/0sb6GkdZown0T+ALdehhQ477xuEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051467; c=relaxed/simple;
	bh=2edXeF3pBE0VCrUWK6n2lu8ilUcOdB96yNFMEaBy8iA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gpOqAVDOax5WW60XYyTY21EdK/Z2bK6YyvYdq1LdI91dwXiIfh73yA5e8Sz5HY3CXNw3R867VOHLQdRS7HqwJS98Ni846+2Cok4qTI8FLxf6aUSw6ThUAKa2YkGPo7tQQTzUrSZ9lNaUk28XORS5giOZQWw5yELlh1OnuojMmk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaQmXL91; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E9BDC4AF10;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763051467;
	bh=2edXeF3pBE0VCrUWK6n2lu8ilUcOdB96yNFMEaBy8iA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jaQmXL913Z/duPpaVmRwALL6UReweG9+PH/KlAzqoVZbmv4NKCBoSABPP8KOhoi5K
	 x+XD8+TbN46ggq+Rv4V/XVgZkDQ2gTydx+CJoIMumaCzLh2MB7oh7kUQaC23ltVIh/
	 oqX2amIPjRXPdPBhc9OP1v0Y8nb2EWD06kTKE0V7yiMxOv7pHS+fFm8d7sHEEzwdia
	 2TrPBVZ/yPG/ahhyaHLmUphyXxqZ/RUXPo6eN5FuRVowxja/LbAuMd42xUgMpvNKQu
	 DXG+9SHC1Hn10yuaHdmlpyqV/K5SL9EsJNrPiDIXsRVDTazLMFe87ELnGC8Z39BcFQ
	 xPpZEBc03mABQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA56CD8C9F;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 17:30:58 +0100
Subject: [PATCH v6 2/7] Input: synaptics-rmi4 - handle duplicate/unknown
 PDT entries
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-synaptics-rmi4-v6-2-d9836afab801@ixit.cz>
References: <20251113-synaptics-rmi4-v6-0-d9836afab801@ixit.cz>
In-Reply-To: <20251113-synaptics-rmi4-v6-0-d9836afab801@ixit.cz>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3801; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=rliu2o1Qi+yRFW5F3I2c3wcFpPklta5P0+6DRK0ldac=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFgfJeOSYhfUMq7mVpPYA/XeG6xgS96jdaH7ob
 tHPsyq0arOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYHyQAKCRBgAj/E00kg
 cvezD/4zIuF6unpnrHSqNqBDOIVW6CO+asX7mkH/lY8huLjzsELND77BstAH92ucV09TDRR2wHD
 J8WfpxDv3od8m3WTd2uGSuZkqRmHUWQl5CqIHoKBk/pXbvX8ueeI14/RV8YTAvMyexjEZEEPSLJ
 VKWjrEbN5r07XL82CvWbvYqRj4pLkkujF9JuG69YUP5mLUsBHfNvS2aax0bXnhoUgTjswxw/QqQ
 dnZYgIe254VDLAkhV1JxkM3mgCDmDB7FCMYa35TT//DBh0XWtdQrn4nySRUB8nB0ozxohUXrlLm
 lHQ3oYhKbwNBOc0LjHp1E30h1NzY6jHW5kzjp89zjmqv86zl2GkpsaKZCes4ueyZ34abgSfPqs5
 lX4NCxtpOg4/H8q/Z/f0eiElo7KE4T84ddNQvOORZBBC5Cg1cRgA6xV1By/SHRFrVwWlvsuir5j
 TBU2Cvy0rdPAHj9ddcVgjr83XUAx/yiEoiGMlm/zoBFIVK9FdL+KYZvr0fiYq6brlIcGIEE8lB9
 1stVRzP2kGqkOGRtYuEzmB2fVqVKDRkaBHS0VOiCWfMqUbTRA1IFrdDcucIT2CYUSLdFeABlWs4
 Dnvcy8PSaKTe+jenPrGawRIJ+hUGCoihD7BFLc/EmJ1U3haV/Ll1uVozfQGUDniA4G5SLMHeSzH
 rwdmJta/wB5COUA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

Some third party rmi4-compatible ICs don't expose their PDT entries
very well. Add a few checks to skip duplicate entries as well as entries
for unsupported functions.

This is required to support some phones with third party displays.

Validated on a stock OnePlus 6T (original parts):
manufacturer: Synaptics, product: S3706B, fw id: 2852315

Co-developed-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/rmi4/rmi_driver.c | 42 +++++++++++++++++++++++++++++++++++------
 drivers/input/rmi4/rmi_driver.h |  8 ++++++++
 2 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index ccd9338a44dbe..c7d2f68e65487 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -494,12 +494,39 @@ static void rmi_driver_copy_pdt_to_fd(const struct pdt_entry *pdt,
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
@@ -522,6 +549,9 @@ static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
 		if (RMI4_END_OF_PDT(pdt_entry.function_number))
 			break;
 
+		if (!rmi_pdt_entry_is_valid(rmi_dev, state, pdt_entry.function_number))
+			continue;
+
 		retval = callback(rmi_dev, ctx, &pdt_entry);
 		if (retval != RMI_SCAN_CONTINUE)
 			return retval;
@@ -532,11 +562,11 @@ static int rmi_scan_pdt_page(struct rmi_device *rmi_dev,
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
 
@@ -545,11 +575,11 @@ int rmi_scan_pdt(struct rmi_device *rmi_dev, void *ctx,
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
index e84495caab151..a4ae2af93ce3a 100644
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
2.51.0



