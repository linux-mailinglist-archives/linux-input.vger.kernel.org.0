Return-Path: <linux-input+bounces-11708-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95459A84659
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 16:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D1DE3ABC6D
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 14:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735A628CF4E;
	Thu, 10 Apr 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYRKlUfW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB58204697;
	Thu, 10 Apr 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295304; cv=none; b=fEvKJUNTWD5D/H17D5yiRQRXOcIdmNZVQeT4sbWN3OPligF9rruxgEUOxCrSi+2OFckBsQclWSbFEcwjkMIADZPAl/0rcbXsNWJ4UkZyyXokN2vIEMJRJmCDXXEjr4tD5L7PWmsQteg5g/EFBuCzDqFOzntiSEhtO/1Dj6tV0JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295304; c=relaxed/simple;
	bh=K6/VEo1yc3K+YbVulpek7YWtEuSKS3IBBhc0oUdWlo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=azvsDUe2YoTGt8ND/yxgpT/owwrAbg4OUYjoQF5ARWLu6gW3Vbrz18BOaw14P1/n3MKUFklAQDPXL6isnI9Re+pXUIoXO4WbVaR1dOFdPgHUbhk+BpaIO9WjbWps4vETXPeWdyUAkv2hMPWKo+8OydhAzSEEae54uZMKhLNe9cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYRKlUfW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB59EC4CEE9;
	Thu, 10 Apr 2025 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744295303;
	bh=K6/VEo1yc3K+YbVulpek7YWtEuSKS3IBBhc0oUdWlo8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qYRKlUfW6z3P+0mCv3cQOBXLwdHzsZbu6mcE6kKnQ0hta1+dFcfgzEuGbYudBaNxW
	 0fg+0Zcagy34IW5QKiPtpZ/J61NED+U9XoUbkVliZDZWpRtYu6zVigNPXPBtxVIwbX
	 nRqC1LsHzCisQYnIOlcnd2hQuL6Q4gsvv2BsCq2rVWu55Jfracp3JBCEz0Cxot/zIa
	 qGBoGMJgkhRO9NLA4M33doMZxyiiOklGisYye8VyqcEIWLBh+/j/IRX/SPb6GnwUgA
	 zOaKL3+v44cAl4AefBlL+DldO3mUBY6ssosvEctTBOiSV1Yzgw9WSxILDu+fzAZixg
	 BDOSZEk8FA+Rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0474C369AA;
	Thu, 10 Apr 2025 14:28:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 10 Apr 2025 16:28:22 +0200
Subject: [PATCH v5 4/7] Input: synaptics-rmi4 - f55: handle zero electrode
 count
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-synaptics-rmi4-v5-4-b41bb90f78b9@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=H6bOmSExs0ZAgCP3cU3lwTLmd7Kss/M3Mr3SFnE+ZgM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn99WFwKp6ff+vZ6GDhp91Ltzu1lYjveQ2qOzR/
 eeY8Bl74OCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ/fVhQAKCRBgAj/E00kg
 cvXPD/4hbZ/koHOjQ27g0Ou3R7xnOaHpxzzWNvKT3Wa7du3vbvEhcVl9GjDqe50anwUV/LTvdxY
 oNd62daVeCNwhZj8xZnDY//w/EVqtdjfzkY9Qi3W/deu2I1TaRPzY6tqFxCAeMG4l47EZg2kQGZ
 VhkSQUYzI3d3h0GqbiwqyhOBzOmWRT3D4XMjg7TdaiSf57TPSz0WrkCNrl4C7xwH/rdh7BJrQkv
 XUd3RXj+GG53G8ydBdBDUcLCnzp8MUzd2zHvsOHVTcW5/E9OaVy5K9NAiG0Z8USpjf6EjA6KJky
 8NoYsb8axPLAo8SmbbJESM3Qq+3RA0vqUo7sT/+q6RYhmtmBN6Ay3P668aJ4zMz+hdOemN1kx6Y
 6C0PIgERil/MMWscwugJMIsA7Ot5Whz7WQShmp9wS8+aA2PoL2GoLJGXx+vr0aeGdzBF5Trk4x7
 rzm+eezJAUUza/X4ubQQEVqhVZETwojbQ4To191GS6APXcADth8hsivDHe28e2kn1ZW1fsliWxe
 biK4h/AH4Tx0tcZPv8uSVYNCJXxw99XXiu/bTPZF/BUb3CyiRG7VgME5Uz89wJbzLUHpsnbi1n/
 eK7ltffCwhAlU9S7bFA34sgSQno2hqUDSFxLENdDNdBn//dfKqGZC/rfux3sfvbfYM7F5W2kOB9
 96rsvC00T8U9eJg==
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



