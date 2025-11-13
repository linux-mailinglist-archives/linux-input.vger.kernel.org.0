Return-Path: <linux-input+bounces-16102-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C61DFC58D6A
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CA3D3B8E39
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 16:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A82435B13D;
	Thu, 13 Nov 2025 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGvEy4hd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B4E34677F;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051467; cv=none; b=JJnt0SqO4Z3oxUk/oT38RV0bxzd58TxOldtGihY6z1ITla3CrXYP8F/3QuyoPor9rtrTuK1GGXZ3Xpyi7TeuoeEsUNXeuVUOagVIZ/fNofMAiPr/Bt9bpBxLYDmC75cBYdrXgU6lLGZrJa3SofShUC5f7/OH07JUd7g7FmJHECk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051467; c=relaxed/simple;
	bh=2UCSydAiM1loDg7uxsyGXgKfm4vSd18iycXMBv+hpi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VeQpy4cvJO3EYKfGUuT6gmZIIxh3Tqlv7kN88YAipTTcHhU7g4wbnrP9HgA10cEfMl89MVFbQ+gQ+YGCu/+iK6tuXwekDMCakEI4hirtZ3/hFZ8BXoY5W+GRZ29nD7BaKj/v2xO+aeFETepc1hVjs2RTr6OX2HGgRGgu2QUBtps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGvEy4hd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4614CC19423;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763051467;
	bh=2UCSydAiM1loDg7uxsyGXgKfm4vSd18iycXMBv+hpi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IGvEy4hdL2q6Jks+L/ngbRe8IO8uBnGApKb2n1FLdjDwuG0azvbkjZF9TnKgFT1OE
	 hJY+Cvp7mhCN7TQplbD8DVu3CjtqpB1OngQrVC2aX/NQc3OpkmeqAocWj0nT5ZetMJ
	 fTYbk87NlNiaPo/7AbCBfBFN0upK73kbWEyvrdGj205AW7DW4OL/vuebku2if0xTys
	 oNTLf8iwshElLP4vKYup9wm/dCqa9qW+Je76yISjvqJiw5Ozs8MI+pmSZv7S56T4Zn
	 Mbx/VxY/rgKXFpcKnOY2FcsIGDAIy7JzDTaqiUFCyF6o7slhzyQmKGMai3Qa0pXEgM
	 TzNC8HpzUlCtA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B627CD8CA4;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 17:31:00 +0100
Subject: [PATCH v6 4/7] Input: synaptics-rmi4 - f55: handle zero electrode
 count
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-synaptics-rmi4-v6-4-d9836afab801@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=3c7m3oCwzt57bdfzOwx4uaTuzzkZpYNYe5psNsQXnvw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFgfJcR4qe0+5DRKXSWW3W6rklEUP8UkSMOjdN
 Bapf6/wdZ6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYHyQAKCRBgAj/E00kg
 cj79D/44yfCfEMxwOetB0IicsaWLthhNakP/wZaYrQtcOolPO+r+i6lLr+AgBowBgGim8HFT8da
 qPwLkNQvfvZLiTTenYTNGJ7p7aGhvEUtByPBO+L26Vym/GLYSIm/+6YXeRsyTCVXybn6kD278x/
 Otr6n+ri0Ft652mo/6HNVhwA1z0Oi0yaDOCdwoC1QSHlnY2xHeUMDbqf6TS42AblRGFiMVI854D
 5L0BjDvNlj4nPd7/a0YBOj1rOKeqS3VrCFfCYWH6KlWS51G9Y3drU19J8QdTGcVb1F4ZDgQsR0V
 RnYBEkjj2sGxGYnkv4aXJxv+hSxL/pZ0CiyAa4LS9Ymodmi4RAk1Ua9pCWLJNbzmXyioCZ/0gk7
 l/SJnB6ZrUgz2X1GSMsVUSDFdhFnDMuNRLMAEZMzEGi4gbeah9pFqkWZR4eWTcblR1TUR+tOqd4
 s7RTeUeaphrWbHbBK2itEQMuB5JkfsHblkiy9Sy3mO35zIWDtYPF9ZJNM7dL2BmDF79YDy5ddPn
 JAJTGbyU0o6sAyVvWY6MkX9G2jct925vKyU7RpVaBuCE3XBcPKiP6QU41h7VPygmPk3gg/P1XnF
 EO2jsew9yXrWKrxzucs9IvKLMLyrw3AXbJQwJteEZgz2p0wNTeH+WeJBwaOChrRPy4YH56CQxH+
 xgeugKgDnjLseAg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Kaustabh Chakraborty <kauschluss@disroot.org>

Some third party ICs claim to support f55 but report an electrode count
of 0. Catch this and bail out early so that we don't confuse the i2c bus
with 0 sized reads.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
[simplify code, adjust wording]
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/rmi4/rmi_f55.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/rmi4/rmi_f55.c b/drivers/input/rmi4/rmi_f55.c
index 488adaca4dd00..776c915b82e72 100644
--- a/drivers/input/rmi4/rmi_f55.c
+++ b/drivers/input/rmi4/rmi_f55.c
@@ -52,6 +52,11 @@ static int rmi_f55_detect(struct rmi_function *fn)
 
 	f55->num_rx_electrodes = f55->qry[F55_NUM_RX_OFFSET];
 	f55->num_tx_electrodes = f55->qry[F55_NUM_TX_OFFSET];
+	if (!f55->num_rx_electrodes || !f55->num_tx_electrodes) {
+		dev_err(&fn->dev, "%s: F55 query returned no electrodes, giving up\n",
+			__func__);
+		return -EINVAL;
+	}
 
 	f55->cfg_num_rx_electrodes = f55->num_rx_electrodes;
 	f55->cfg_num_tx_electrodes = f55->num_rx_electrodes;

-- 
2.51.0



