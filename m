Return-Path: <linux-input+bounces-10651-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4371A57AED
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 15:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B49947A70CD
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 14:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3543D1D9A48;
	Sat,  8 Mar 2025 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u642Hf4O"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAE51CAA6A;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741442925; cv=none; b=MRnJaoYR95rPQLoweLoMdafv4AzHEQZ4YmfIcejRGhlPAgcmWDmU7d9bidUaa1XIUIfjHvCRVjKVh24OOTc089YMe+R7Be3m9FFEhAr7pvJRjmn6u93K0Ej0evakruEoiW53TzIXoM+l3DXkQgM//nXpC4Mq9Ae5XNw0ds6X+f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741442925; c=relaxed/simple;
	bh=zIl4vKpzJSVDz/qrzXmoaU6OOU5h8or2T3/8DW4sLaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JpN/tYAVbA1wKoTlKGLWRfiAHEhzC1LfuU/32SJv4Lw8YTfpitoj2189OQqIhDz0EilhVOQJFcXn6M751oT8bYcGS0Q8gCwWQ9iIAekTwZad4gdAgHq5lmvjIlO2QVwoyRxwVv9bowzZ7TTe0IPLNf2zrL5tQfumUFUmGsOUZKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u642Hf4O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57755C4CEEE;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741442924;
	bh=zIl4vKpzJSVDz/qrzXmoaU6OOU5h8or2T3/8DW4sLaI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u642Hf4OGayulNKXfn47g8AS9Zl9BIUKab3Hqy8W15Ti/DcPafzJBww20r7VPhELG
	 pDTdZmzFuIt0wZA99Ya73G1ZJfredw6PeGNAW5zBFUBMTjPx1VBCO6FPU/z/trjEBs
	 WfL1dcPmrBdUY/AVNRENHiOiRc/yoDSVkz7E07RQ/Q74eVpx7Wiw5ij42QVU2SXHm0
	 4eFyR6ZKA5HoLri0rwKeqYKiryGNiRi8/6U/frVLTs4bFZt/l3endHRTytJipM+pr2
	 BKFKzZOeH9u8Y4EC3kUkkciVtO9BbUqID+llgawP6soIT//UJcdH77YiJMQE2QutmI
	 hgy75C41xGZgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509D1C28B25;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 08 Mar 2025 15:08:41 +0100
Subject: [PATCH v3 5/7] Input: synaptics-rmi4 - don't do unaligned reads in
 IRQ context
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-synaptics-rmi4-v3-5-215d3e7289a2@ixit.cz>
References: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
In-Reply-To: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, methanal <baclofen@tuta.io>, 
 Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2407; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=4xh1t3yxGMB/ipkF4g5QnA5ESuxz5T9pK1Z5a5i51vs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBnzE9qc6aq2MLr6q7eHQudH8iSzTBRNGFR0p/O2
 E7LBZU0/nqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ8xPagAKCRBgAj/E00kg
 cmGkEACL+Evc2t0oCoayy0DQ3ERGsg6j4XjsxJxnpp7FjiFuk9mVt2iOJNbH0xS/EnV92ywc9u8
 Q440LT+tFgtRezhViMsflCWQHF9lembSFsLMTsNZllrjZTakMY6Vf8r8XPBc/yqFZI3VVSUMm5q
 FCquL/Rc7DsvhkHUZaSWrB3WPZ+gnmayjA4V1t/O/UJa/0WagRgSl4BcpyqVxEMwadjQfz3YQiR
 dGnn2o9PxgdNIdVTpQYaYJhEFs5CbiqDsKe8vCrxO08xEqOQu0ds3XoRGXZib+fqaC8uigV8wQy
 j7rTbzfdQiJkIG4DJm4VUWeyKo+R1xmSLAmZqCjj75oLVyrp2ZUruz259MOYtNsS/l7/Liq/YsW
 gXDcxSu1uHueVLmSf2Y7x3F31Z8ZS9rXblpn0XQ8eSF50bEH8gzG9z2WlIzN6dnQS881drD8Jab
 vd4TON0GdHqjDgxzWVCjOT5xg5dN/Jchy/B319JfYxuiUhtWzXlPSP/4jf/iQuzV+9Wb+WUmdNp
 IVbsBgQ7IrBHzIF6k/WLSEQ5KatA5ARRbLqSaxK73ZXCq6yIZ56s3d0mSZCLrlKFkdOrgRI9Ueq
 acghTfesBUGXBQ1oRe5V0eSpinBs/Sg99Pbs5VaLJ+xYQXOhHEUtrYnya3j1+0EFXyQ/zNwG1/Q
 fxLsru3jTyOnz/w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: methanal <baclofen@tuta.io>

Some replacement displays include third-party touch ICs which incur a
significant penalty (1-2 seconds) when doing certain unaligned reads.
This is enough to break functionality when it happens in the hot path,
so adjust the interrupt handler to not read from an unaligned address.

Signed-off-by: methanal <baclofen@tuta.io>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/input/rmi4/rmi_driver.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 51c23a407b2731d5b6eaefe9cae6288f97316e34..2790f00a58bc66c04656d0cd1b4afe9f843ee093 100644
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
@@ -1083,16 +1088,17 @@ int rmi_probe_interrupts(struct rmi_driver_data *data)
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
2.47.2



