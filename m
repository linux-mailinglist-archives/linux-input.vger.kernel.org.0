Return-Path: <linux-input+bounces-11712-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 313A1A84661
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 16:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54407166F6A
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 14:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E8728D827;
	Thu, 10 Apr 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rfa+SSwh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8054728CF5A;
	Thu, 10 Apr 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295304; cv=none; b=nO5B3QJvc1qwvp5St+RFQG2Z2Xji7hKDkUa6zAIsVdeUzBJBXNx1o8n8mFSd4kYOaV9tn/8TAoQE+9J9Zu92fyedN73YWCdNdq30wdGz7zwLAbQHFamRdTtoQ2HVQOyuilKASKW82APTOG+hEC4NcTe3IfAMI3AdKYIv+ZP/adg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295304; c=relaxed/simple;
	bh=uhoOYFv9own1t9GTd9uKLCLoHj0zKUN854bDbom6MDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ifq2ok3HQaqaKz+W23Hu6JKxODXlvRqqCelirMHX2TJ1ztGFTS75GrnH32wc4nekzXICysM+5+LZGHhQG0Lj/ps0eDF4Zi1zx8AnA0TSm2f26hz7rvJqKQVqIoi0iu2gvIGMCvc7l8gQoNBv0RlQ16Q/ykKjo1rhEvBX4wRv9ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rfa+SSwh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9E43C4CEF0;
	Thu, 10 Apr 2025 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744295304;
	bh=uhoOYFv9own1t9GTd9uKLCLoHj0zKUN854bDbom6MDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rfa+SSwhuFPe/HXCWr/Pd7XyEJZsDkCbiA9cgMXyUN4RkX1JGW7Yjn2gmG5DdmBGP
	 20P86jpYSxOQ27iicyO7FJCB6TwSuJzRxXewpFSmuao4zWAZkeP1EanP0e+3yu6z/c
	 NuaobtXa3KpgeoyQ5U9TEI8OF04dlUFAGR/ElUMS9ha0zZoAvgC5B0p4pOKcHIdSyp
	 c9vZGayfsi5UMYDfh8HURk8YlQYSWEEz3Xz5lZn3E/kgpmaxmA873u/jNawZ6nNz4P
	 GW1sUWZWf+EgyUuGk4A5roEVFgGHQuPY5e+SDjmN2paCWWcPX1cE4doVqIoLPDzVOv
	 iPChqcS6pRy9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF0BC369AB;
	Thu, 10 Apr 2025 14:28:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 10 Apr 2025 16:28:23 +0200
Subject: [PATCH v5 5/7] Input: synaptics-rmi4 - don't do unaligned reads in
 IRQ context
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-synaptics-rmi4-v5-5-b41bb90f78b9@ixit.cz>
References: <20250410-synaptics-rmi4-v5-0-b41bb90f78b9@ixit.cz>
In-Reply-To: <20250410-synaptics-rmi4-v5-0-b41bb90f78b9@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=yMLuXgF9v/gFFJ+eFIvXnbQst25n9j3YV0dhX4KqpyU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn99WFmjYsKd4012UJV1sQ5g8dVUQula1pMnNHL
 y9RLMiDF3CJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ/fVhQAKCRBgAj/E00kg
 clExEACdXQa8cCM10O9K6rzfHkTi2+1H7mbGlKjuN39h25Fg9H85ItmRvRSwHK92BkFa6RDUmT9
 DMYuZFcMHCUE5wqxaaUM1LV6PTTGmoaj20AYXi7gd5azOX9DRttSYtSAuAkOl2etCukXpLHDV7R
 ZkukkbTdcBTzrkgCXh+eUvy4lKhd+F3urto4tRart2RkalbYnh53QslRHvIgaVlfvVDKB1MQZKm
 2zARuDWJJcQ3lryEszvuDMgrn1poJa+LLU1H9yUbAPHTlbHq00vIU/m1KuJW07X1/+1miTFLcgJ
 W2geL7JWcQsSAoeDKFBvL9OePyDpDB7wlCXUqneHc+goIoslhfeno+4CXHAOeIyX7I39Lzr2/5Y
 Sx1V7yIkVW4KGkQKlWlr+dA9joYLE1FufhGigPFc/bXfcYUExae9Vm/Lwh2Rz2uU29fCQuha+ut
 bVw2zugBdbfnBvxUyXmt7b8jF/mMGXPLpUrlaYmLZ9IOxZRqUZ3WrwzAAbYMPs3PDVKQdXNBNHh
 +wtrLQk61l/poSUV7mxiiO5O6Rg+/iWHQ69h2ocjx9ozdJRMtfEgiKt0S+iuHLVbQcsWrFEZF9S
 r5sT0PPZzHEasUuf/HkBCZYzQwG27TuJGjzMzzxP2t5aYHL2ph+ZEoMUipuu/BOYdWc228VuiXW
 DQ5SbUT3L0Ap1Bg==
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
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/rmi4/rmi_driver.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 0f6dbe586c652d641178f43ec27df3613126ca66..f977541d8913525d53a59e1d53c33897f1c93901 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -136,9 +136,14 @@ static int rmi_process_interrupt_requests(struct rmi_device *rmi_dev)
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
@@ -1078,16 +1083,17 @@ int rmi_probe_interrupts(struct rmi_driver_data *data)
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
2.49.0



