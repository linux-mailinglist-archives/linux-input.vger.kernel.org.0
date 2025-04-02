Return-Path: <linux-input+bounces-11476-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A5BA79552
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 20:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55C1E3B0CC7
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 18:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196DD1DE3AD;
	Wed,  2 Apr 2025 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gY9hDhoF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D500F1DD9AC;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619497; cv=none; b=og3n4t36t1+ZEm5ehSd5qfzBkF0UpRIeDkYOp9RwGLtxLV8VbJUzAIt1zCCpOi8Ly5xAaoUXBS992Tl3fkL7Z6ORJ9zYAW7vzKRT/KDQPdQaoOSsm3lQtypoSrmiTkWNbnVrC835Y9NRDWRYbwEc9ppldh3qGmnaqneVv8wZ354=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619497; c=relaxed/simple;
	bh=q6YqJI+AWlDUFmDegEVniY4d+tNOgVnSi2YYjBl+5n0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7mtZP9SH32wznRJK3pHYycPdFwpH2nofhpXsD9atLtTkTpGFN2IrtXgGWSJAkulu51xeIsiBW9z+eWovNUIgOxRppQvG8nrFWAcmDDOcuwP1IUSeMheaAgCKqqLAiMLUoT7wJlYjb0uacrzUyMGTnZqoa0jolxAx0z+LyLNDwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gY9hDhoF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 696F8C4CEE5;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743619497;
	bh=q6YqJI+AWlDUFmDegEVniY4d+tNOgVnSi2YYjBl+5n0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gY9hDhoF4cdox44fscQ4Bu4S9x2qc+iHmyg7UZaEd2f05Ifqh4D4DfZpp4JfTf5h+
	 B9Kf3jexJLKz+dnzZntZ/Sbl4/rLw6+64SDf8rM66nj29YZ9GO2rFMhFzrnVkDznyP
	 tybrIoWwLzfVe5pUFqrli20ijQg5fH1IqQ9rlGomIqjMtFSN3/QzC8vytI/CbHyO+P
	 0pEMnGHl9KrwTcWG51vNYMOsDeNzzI8DRY00J+AY2cjsC+74kSyCqJN9eXH0gPWz7s
	 3ThPA68ZhgvMrmvc0npmw8VqAHUzvKF8tsBb1XOkEt4m+5VzY0XfVpBEVYrDPrjP4q
	 DW3q7zSXnkOlQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5815AC36018;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 02 Apr 2025 20:44:53 +0200
Subject: [PATCH v4 2/7] Input: synaptics-rmi4 - handle duplicate/unknown
 PDT entries
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-synaptics-rmi4-v4-2-1bb95959e564@ixit.cz>
References: <20250402-synaptics-rmi4-v4-0-1bb95959e564@ixit.cz>
In-Reply-To: <20250402-synaptics-rmi4-v4-0-1bb95959e564@ixit.cz>
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
 bh=UsHStuHcTC7EY8d7D+PJ8GiyG0tV5bXzwAzuKYQFCvE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn7YWmO4Hc0PE+CZJjHL+YhQvpWIIajYBURZxRc
 hDO3F+3J+SJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ+2FpgAKCRBgAj/E00kg
 csAWD/97CTdx8Q7cyYLSmGq1+4OjOSWi6WRr4jQbYa63oFEJBTNxZBmwdTfs75ftAFW0vT+SzSm
 6CERhk3XmtRwuTjwNWLUvHVEgzFLfnZosNO7IqDR7UE6pToaoXiyPMS5mB1Xi7LJhAVr9gt7IL4
 nddKHRU9DLq530D9otpUeIK7xDSwvLXEiCKNWbN/mkotkL3rhbdAQR1cmunDpTxawI6zoz+iz95
 uzklp6/qNSDdIapkoa3cyk/PjGeoz/LiEjcjXRKFgvmTCxycYeSXUltnhK+rlSoDjWpwwVKeB+5
 WqMPx1xOvrWTzLYrgAjriCg3tJ/69hgcHD07n8akgRxOqnEdvnfP+rQyyr0EhyeJ89qXXdpZ8ab
 gBR5RZCVzgK7xU/L9FG2+A9Ciw3Ot29uY09/d+Pwm2g/rctv5ePyX7VFEZ4oRYzFVFxqHpmuftu
 ftep17eGcy+MwXyb8AQONur9MOBYiaQGEBbV4HHkre95MYEGbXvz4sHBG1Q3e3szrGx4TJ50xfx
 VVshu9T9fG+MIt2zDfKCRClMBFxB0VuotLcQpJG2dVtsSlQm4CCKWAby29/XEf4ID4LWC6SxK98
 UEl2MLqWamAxm6Hy79Cc0Q4QP0a29Q5gclmDwzOL5yWdT5yztTIzlmN5TEqTJouCIbkexCza6Sv
 bTF9GMP+89NfKXQ==
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
2.49.0



