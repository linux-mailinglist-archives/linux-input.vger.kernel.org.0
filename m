Return-Path: <linux-input+bounces-11475-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEE8A79550
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 20:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E47E3AE687
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 18:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07ACF1DE2A5;
	Wed,  2 Apr 2025 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sv82GQd0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54B05C96;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619497; cv=none; b=DtDkn/FnNEopL59rXNqwdFIrSz9YI9IITDJmQCNxJ4oe+o99vM3x2Veo7T3iSlvyj5QYnK9qA+w6cJfxPjzF63kOW0rahg9FG+CfDBuQ90oD1c6rDY+jJaeUu60+0GFh4JTPGXmKRaEsH83N6sPNLOgo1yHvSrNEwR5r8lwmVBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619497; c=relaxed/simple;
	bh=K6/VEo1yc3K+YbVulpek7YWtEuSKS3IBBhc0oUdWlo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E61Sa323tyDnHaP0ujvxyRzmGCuqmXG+xq3cobPx/3DOgdqxnOi96hIynAHE41cptNs+/A12u9vsb/CB3LjhB5snnt+cb3DD+JSP1haLWqTiYvWB96Kt0ik8lWiLxtoeOHgH1vv4ioXg2Hoospykebtw/1O+6H72rWVIIR5pVIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sv82GQd0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86639C4CEEC;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743619497;
	bh=K6/VEo1yc3K+YbVulpek7YWtEuSKS3IBBhc0oUdWlo8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sv82GQd0NWtWYQv9eso32IBO8fwiisUdxX4teHgHM323MUtc7qhv5jKpqM35GK6mM
	 GiJ+q/o4KBk3Dwi4r/EgyPniymzstEOxqYkuFJD4nY+5sv6pcAV564hjKjWRyo/Y5v
	 a3de22M3lpKns0gfYKeUXe9TImvGMrSk27BVHTHIzOBI5BSUCVuq869lRE4fcD+N9a
	 vbCIsO0yp5NBAVQAiPpfjWgmhguKvIA71X4+MGj1k6Y3ItjrWdzwriOaQjE4Cfs7no
	 4kIqwFhGPrhxlzXvdwM8g0hF0QSYdHoloQrqXSno0mmdSFTcpSm3GgqXZDecQw/j7f
	 aPd6l2O4Dfg6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77797C3601B;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 02 Apr 2025 20:44:55 +0200
Subject: [PATCH v4 4/7] Input: synaptics-rmi4 - f55: handle zero electrode
 count
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-synaptics-rmi4-v4-4-1bb95959e564@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=H6bOmSExs0ZAgCP3cU3lwTLmd7Kss/M3Mr3SFnE+ZgM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn7YWn4JQyFb7VhDg5lLgW60stVOWrBynm+ok1A
 na4mWl3IM+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ+2FpwAKCRBgAj/E00kg
 clq1D/9DsKFFzs5oylrtmlIOR9XlaQqSEQDBrlgF8OFfTswnh95jneM0QWsJdXt4GCOZ7ydhaWc
 XnRFAFk45zSU9iZHgxYjwWFxFV6mKP/eKacB2f+nEmX01Qj/KcKgeYkPAQybnwUNnoWlnHR9PSn
 R+ZYkVH5YRbkRLSKsnTpWz/UX7/tkRiH5Z4aRD4iaqwpRPUSMZW56wcOFy53Em+cYsiDCQLj9Bd
 nkKlZPzkGBzT3euAHy1+Ut/sIIKl5vfQSNbCZb2rz4UywBtE3yORM2YWjPViFQMFio6gG8NovD7
 aDdZ+BEXMT3rNf/xopKg1hdDvoZAlCuIEAZq9O80LdlFagZnMAeGE+8fCco/AOalFmgeliqEphQ
 XLWL5cIsiXIhkF3Zj9C2srrV/Ez+xF+cHzhoFsPqnySHPI21TCHXCJkNhodmj6hhqWon8wJR2rL
 7Pgg0mCsHzb6R1cPPHyH2xawSH+nrj5dsFjXlDYMwtsVW3axa8fPVzd1bPDkC2P8q7UTy63ioaG
 Zv7IYR3pY0dDgQzbjgfMNe+64QNQKhNt8nMiTaMrJL1S4osbgS0f70EEa8cpg2hpER42XvIw7bS
 pqXa3EhOZlm9bS3wETzyMLeCTGpi0/zPWq36FGDa5V/WqP12TxBzfm57f4Rb9Zl8QKQZ6vKBlv6
 wsdP8Ld+wY56Esg==
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
2.49.0



