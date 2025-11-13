Return-Path: <linux-input+bounces-16101-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 823A4C58FA7
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 18:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6AAB835ACE2
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 16:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0A03624CC;
	Thu, 13 Nov 2025 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDr4XgcL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F03342C9E;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051467; cv=none; b=Nfk6EmNA1jf+qpYjSNDIevGt09rlVo463hbBH4YsBvH1vY8zyuiAsjbkiHPK0iw3LXFuoxSNn8qDoFY+EVP158d3oz6tzgT6FilTss/iCNwxzhGsPOtM1ZsBag2Nuap6Equxb306tu/aqJbSr8xZ1/KyoA/wy/haw/krNHI7+dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051467; c=relaxed/simple;
	bh=hB+qqidyBXGuG7uEfU72EhcR3BlCA5Fqu/3ObAy7Go4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lH4Sy6eA5xSvyUXm+oQ8baecxFOZQMVXswBeoQuVLoRXopEnEGH0bx7Bod5DmkoQmft4TmFxTGpac1DQbelpkmAMOrtzS4l7PGwbSmAxZUUJOzJL0hR9LtI528hB2rW3hHZ0k9UgNaWrBKivbqXVROdKJHxdN7LAGIWPrMl2i4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDr4XgcL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58CD2C2BCB2;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763051467;
	bh=hB+qqidyBXGuG7uEfU72EhcR3BlCA5Fqu/3ObAy7Go4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NDr4XgcLGPsK290SYdIGqob/9YyZZtygmgV9OY1sGDBxPZWfgmB7PAUPASgOsJccS
	 ikrZV45VrVyu9xWXNL2eft+og2m3r14fNYIodPVxIoIbSfdMWYu8Uf04iT9fi0s7t5
	 vG112mEOcIogziv10GemVOBVTtHFia3J8VCp9gIeFYqCsz64PocBaQzRebQ+lnkeL2
	 iFDbjXkQv8g77rLOkQu+suWrfpO/u3X7j1sUh7kGipICgtS78653RYUSSmpRaHB0Yk
	 rQ28Q8OsR66Z/jGkYnAr8pMxbt/bGb42rXlr0qTGyE+PReyVts3c4bH3HpoB7ARQkj
	 du6/XHa3vsfAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D60CD8CA6;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 17:31:01 +0100
Subject: [PATCH v6 5/7] Input: synaptics-rmi4 - don't do unaligned reads in
 IRQ context
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-synaptics-rmi4-v6-5-d9836afab801@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=2jfYK2Qe0hjHg1A0n2fWZE+x/SealRrGZEErY3nogW8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFgfJyed9yL+cvKvJ4fbUVF5fvUPdCG7sJJw9Q
 tRujzGr7WWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYHyQAKCRBgAj/E00kg
 cnJUEACjvg+R+3IThtsWYfsSlU44fwORQvlngD7TBE+p1lFPZakN2DZTgkPv/2v22gb2BIzTUsd
 kpoPmjnNmqiE/lS+PXpUdNGe3uyMGQseb1KMKxQxrXYKaaQ49Hcl8Ps9SBI+koGDlHPXSM0jIRC
 0t1Aozmxm28FgCnNXbZymwJhOH5Dny4G5NjBOFx1zmF/tyFeoD3Hm1/xADwRR7KUSYh5PGOx2Lf
 p9Stis5wcPw2HafrfmJioR/X9AFD8OG5Xwc2uOVCr2YWJkK7c0SXdHkCTFackw9NByMtAuYz+Qk
 AO3ygrdPt349yc3gJRRxsXYgA3xoleIurxoIfk/t8BL2XpVbOj8kY5yNG7zbz/n9WhGjP6xnTJB
 w6CZHVv11mvoyvHJU5+W2s85zh/HnsXwLiAQISmRlDwsuuXksmA8IDuoh6fOurUVk9j/1y4GTNI
 Vv9FrnIxm6LEkcG9Xz/D1xJ+3w37D0KJsuzOl6tXBg/UhN6bPo37XE09VZDjTh5ecLrcBO4RRdd
 7O4dtOvElE55k+lOIH9Uxeio4hIlnTyLQGR+4UOBovVJRv94h60hTpckcoccnWzRClozSP8sWO5
 1PT5HtQGpb5MXcmcuCmIXgmOVy+EG25RLVqVTvHOZcyJiTJUNqHA75KXl+p5QWVPV+w72gc98eA
 5a/UUakkugicMgg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Kaustabh Chakraborty <kauschluss@disroot.org>

Some replacement displays include third-party touch ICs which incur a
significant penalty (1-2 seconds) when doing certain unaligned reads.
This is enough to break functionality when it happens in the hot path,
so adjust the interrupt handler to not read from an unaligned address.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/rmi4/rmi_driver.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index c7d2f68e65487..93a190e333c66 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -137,9 +137,14 @@ static int rmi_process_interrupt_requests(struct rmi_device *rmi_dev)
 		return 0;
 
 	if (!data->attn_data.data) {
+		/*
+		 * Read the device status register as well and ignore it.
+		 * Some aftermarket ICs have issues with interrupt requests
+		 * otherwise.
+		 */
 		error = rmi_read_block(rmi_dev,
-				data->f01_container->fd.data_base_addr + 1,
-				data->irq_status, data->num_of_irq_regs);
+				data->f01_container->fd.data_base_addr,
+				(u8 *)data->irq_status - 1, data->num_of_irq_regs + 1);
 		if (error < 0) {
 			dev_err(dev, "Failed to read irqs, code=%d\n", error);
 			return error;
@@ -1079,16 +1084,17 @@ int rmi_probe_interrupts(struct rmi_driver_data *data)
 	data->num_of_irq_regs = (data->irq_count + 7) / 8;
 
 	size = BITS_TO_LONGS(data->irq_count) * sizeof(unsigned long);
-	data->irq_memory = devm_kcalloc(dev, size, 4, GFP_KERNEL);
+	data->irq_memory = devm_kzalloc(dev, size * 4 + 1, GFP_KERNEL);
 	if (!data->irq_memory) {
 		dev_err(dev, "Failed to allocate memory for irq masks.\n");
 		return -ENOMEM;
 	}
 
-	data->irq_status	= data->irq_memory + size * 0;
-	data->fn_irq_bits	= data->irq_memory + size * 1;
-	data->current_irq_mask	= data->irq_memory + size * 2;
-	data->new_irq_mask	= data->irq_memory + size * 3;
+	/* The first byte is reserved for the device status register */
+	data->irq_status	= data->irq_memory + size * 0 + 1;
+	data->fn_irq_bits	= data->irq_memory + size * 1 + 1;
+	data->current_irq_mask	= data->irq_memory + size * 2 + 1;
+	data->new_irq_mask	= data->irq_memory + size * 3 + 1;
 
 	return retval;
 }

-- 
2.51.0



