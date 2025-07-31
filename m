Return-Path: <linux-input+bounces-13738-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D484CB177B7
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 23:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F7511AA52D9
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 21:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B438824DD0E;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQ9HW67n"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DAC1C7013;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753996034; cv=none; b=h4aCUZ5jIr6MsLfHMMJ7ck73KnhS0i0NLVGiJkR+uImdkyIAR9dk4sX3ltn3wo0Kw2r5FrPlCijHaBP6FcdzwcMdjGZRlxg2EDGuqyUfXa76oGBiqD8wb+LPwDd7n+aRHCTalBEXN8PLP9WHjP7SWQYUFE56P2qLHdGszon1kgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753996034; c=relaxed/simple;
	bh=8Wy6v2zEQbv4sE727EkXinUIUXS+RivX/F8LgeXpAlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JtU8hgfqjFyIKXiF6CufG6AgbAHqvXYILD+95ckZ0D57XKU9lrltjBCuKIa5wmZG26KV2ti+BFprV/jZIP7vPxVjt3F4+DBjU7I24n3hrJYgsFK43CiOwsWDhqopCB6ylXFVGQpY+xYcSVLb/gI5dzRXTqsySXcdQ9f7tup+48k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQ9HW67n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3571CC4AF0B;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753996034;
	bh=8Wy6v2zEQbv4sE727EkXinUIUXS+RivX/F8LgeXpAlI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iQ9HW67n5LezlAL5uB8bjV8oaT3OfPg/1OQJYGdq4On1A9zd4NuK0iWKr6oykKtnS
	 6BVggUdR7YxJubu71RFRlHbgR0d6nTXHNFOZX2PnLol1yGQIjXXzqbSJ7oLwaPZeAM
	 EpYAC7hDk2q4fZyI1AXTKpuXhoS76khA3V9UPMRvwUYtIk0lP5bZoa1otACmKOd2tK
	 jppqJRUtw+WoVHXJeryqzFkM17xZ8zItQovAZUQVYDk35MzhCL2ipxEDyWD8MTn5N/
	 Set0/q3+3cwORzFNrbjCWkyHT1IfxuPBlq+Berw1isEwqUS0RK3EjFrZJD9S0EJZnt
	 zL1g9czl5TlCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BF2C87FD3;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 31 Jul 2025 23:06:52 +0200
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
Message-Id: <20250731-synaptics-rmi4-v5-2-cd0d87d34afa@ixit.cz>
References: <20250731-synaptics-rmi4-v5-0-cd0d87d34afa@ixit.cz>
In-Reply-To: <20250731-synaptics-rmi4-v5-0-cd0d87d34afa@ixit.cz>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3909; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=F9hWc6iEWSUhrphcXba0Kd7/xUCyyQbMphuPjYrJ+MU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoi9r/01ZjoHUNzKf1pAOvuFd4lomDhPPoItJBK
 N2y/6kuuv6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaIva/wAKCRBgAj/E00kg
 cixZEACkkm2d9FC8rr7Yw7k+JZ7wJwukDpiDuS1GpOt7qfUuU8H8oa440noemFd0MZIljnb3MeC
 MuSvDH/rqKR4BSQTQ2okEEQjm/2OdpNIZkv9NzgfMHt78lUK+6MF8gwXGPjD0s/8C8rZHiyqnRD
 RkG3QIlx0DV5Qn+tCqooXFdTvo6yManiBoU8e6N+mHpPvQk3iIxLTg40UnJ2aRMKJMxu847cs1g
 dmG7/BljXVdhdT7bhf8Qkv07eZ2IbavHcs8GddWEsm4CuBEnFBk1KqBOIg8nHsUlTxe1OdFjPOx
 34Ji/iDIrK0sRmXp50yi9nS+mUX4eD/RQRk1JY9nZ/OdvllJ9/qfVOxl9jw9yNbFapboX2VbMuT
 mlHPbECoTj54lqJv06EVveBFT3robZPBJ63XasTE3Uv16UlEZ1AilgXl2UzQ387H9mZxN3YMFIx
 cVMKIzfwJtu3EDKZkQ11w1Sa2cSlPH+kVAkdB6YTt7pfz2/V9cv6yMHLSN0a1d4uPnKkRlacRzw
 kJEMs8bhx7udi4NkVDl1bwYviW9M2Kg1j2QbpjIrrT72cu5jT2f07y07R/fwkTHZDNAjC2OFidB
 +r+Bl8+UY3eNWmV703KIDpDmYx3o7SUYZjgNgGVYtX7qAktGNb0vahDdec9zMDi+7n1zCjsZ3qW
 epD8BJjAiH8bqbg==
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
2.50.1



