Return-Path: <linux-input+bounces-13545-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAAAB05929
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 13:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D29704E3C35
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 11:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A87F2DEA6A;
	Tue, 15 Jul 2025 11:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9ZAJEBR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75C72DCF5F;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752580152; cv=none; b=gKpobzCqJe1PR7mUdAVoUD9DnIIUfYNWy8XdhGP2dkAudqtvsgJBubMb0WDgfj7oQLHBJUbWoZjZeWGKMrdoWqyU0DkwFkK4P0sfY8qxv0onlKHxSFSD5kJp78jCxlY1LNXyALU+zDLE01wxJmzibp0LdofzOLjHclYgEDk2a2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752580152; c=relaxed/simple;
	bh=iwkJxWCzdw/DqxSg2p7SwDIf6pxYkQ2qU47CMRtmIv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RdIu0ZJsub1EiCeWoo29YZzrX5K8YmM1UKT05AmnLzSm+k2SuMfFvblxR9Tcx1FtyOvrqQM92buRdFkawn5u0m6j9f9b6FEmYt5tbUcPriZ4iRvUc51I6BGg9aoH3nLAoUtEXglzCGcGAdbQ10XrGlvplW1gxu3C+1R4vsEooN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9ZAJEBR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54242C113CF;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752580152;
	bh=iwkJxWCzdw/DqxSg2p7SwDIf6pxYkQ2qU47CMRtmIv0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=V9ZAJEBRPWJR3QIN2ftNRAWt9S/AZ3FLjTOq43zBFkSIT+k+wECQfy5PBhWCDYAXt
	 /jNrAGeRV8wizwuKhuvoNgJOpb1tYwm3BDmFIAXF7ZznPW4HIdhYBKbzbf37nvizs0
	 Ras8Yv3ANHRQ1lrcjTEJD06qwSKdG+olE6YXnO/HHMGDmafSlX0zPqaF8a173lOiF9
	 uC/wdZzeQAzg35jdvRlOc/ZOPFQ76NqhwaJCdOJxyRyYTFySZoqwgrLwWdT3I3/Ddp
	 smbH8sITeiGMmM9TUq7rtr7+VgQzQ4ncdrbWacc3CRj7aOHSIJWl4Io7ZQ3ZLD0G8q
	 RLHapjdxIcTuw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410BCC83F2E;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 15 Jul 2025 13:49:03 +0200
Subject: [PATCH RESEND v5 4/7] Input: synaptics-rmi4 - f55: handle zero
 electrode count
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-synaptics-rmi4-v5-4-ca255962c122@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=A7OEIYExnthRZy4ymNUZNgZK4sBdBKSSdlBwvDvnG2E=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBodkA0QZAibncQ1s/mo8VQvjALZfHDgWvMVr1nt
 tYHJcP7LY+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaHZANAAKCRBgAj/E00kg
 cuDcD/46CbHny1DxeQA6WAL0HoJPZz4HDmuIqAd6q6Bn3jt1oXvkQAHjr5ldRee7pyCJ+EN2Hq0
 HeHpOUlvszPWcBboJqjtJ5kzuTncCDx+JsgY6ZeG31fu5VvBnoR77IDkDfoXhStq1G89GFFHTYS
 ngZFqWQ/MV2PpVLbGV5XGgrrFD3vNcbslGYulHyNGOHkKwk6O1nUf3gVvO6r6pgwZIY7ULxzckl
 GcOQU4Mz3ntJUiyaY09ZW3hI8FF7WmtDK/YIS/uk7rQoGCDhRO5dqNqRRE9jP6p/HiFn8IUpsFw
 fQaWi0ZS5mHkIYfs7NSXBr78tlaT8KyKAxZX66h6vOhbjtPr2bFLpassZJBH9RJWN/jQ4On7Qhn
 uonHZCs4Yq7YZqeCELf69MZ3p2inpXCd1noFedz/FGdDXeT7xaWCcSaNsRk3HGBUvKQR12Dllyi
 rOU/5hRM747Nf8pKrvE8D57QAS/d0ljnVl39Gx5ccF7tuRqQrj0Bv6zl71YjcToOncYPNokSbC6
 BRNkW6sztjLfLxtgimLJp3WjJk43EL3OkVVKOZ2vDpHFjjhxZqY22F43/2IOvogMhl2EEvaKFn6
 4RLmFPlLW2BxaRQXn779d9wqp+j5k6r3Fbse2Y+rkkRadm3unj7ogrPnvPmeMxvlm+hgervyDOD
 EGRLstT/93Up2pQ==
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
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/rmi4/rmi_f55.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/rmi4/rmi_f55.c b/drivers/input/rmi4/rmi_f55.c
index 488adaca4dd00482cd1106d813b32871092c83a0..776c915b82e72b8a6eb5ec701cce9059c87089c4 100644
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
2.50.0



