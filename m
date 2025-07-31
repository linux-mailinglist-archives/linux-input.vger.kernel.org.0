Return-Path: <linux-input+bounces-13745-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C931FB177C4
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 23:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EC2F7B2449
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 21:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A04265CBE;
	Thu, 31 Jul 2025 21:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elgbP5jM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ED125DB1D;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753996034; cv=none; b=RqVe1jnEkdylB6hyL66AEaXWBXHhvuxMaGf2h1lEZLHB5UBlOcl8V4l8vtQ3ek7aZabV1XRaxnWhxX0JtFaWWkavI6FXyMoFInxWx7h2u+hakxtRxJPtwBmZIB/O0mTpX3KTeDNCsPOVsGZHTwdGq97cR2fvoPvx3X7zCYc1WBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753996034; c=relaxed/simple;
	bh=htFTGLky3TEgi9HsVZOj+L4Uzq4ebrKWnhK5GMMQFs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FUzFUMwCbB3iwYU2t6W4UVIjjimNz+dvabHJQqkV4r5/V8OQmxqAvPElGdZuDIlVU1rZrSQQ7sq3okjMTCXlPnEKkE8KgbErDdzAVeP4WmiWzg5GcnyDmi/iQdSdbDSGvoB/H4sn2cEXJd1L6zeQoP/kbhUC06kskT+tEi2CzYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elgbP5jM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 568CFC4CEFC;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753996034;
	bh=htFTGLky3TEgi9HsVZOj+L4Uzq4ebrKWnhK5GMMQFs4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=elgbP5jMJM5GvMQ0rbcrgHPDUzZSni6sEDOCEkcnuh2n8hWGcKsJlh00u/YQ2NOQk
	 Bly+azUeN69h0Rz2uEZs0RjOreExfHFmmm9GRNOxhgJq3H/ZtDQDcXF2wgJ1gRkXGu
	 Eb/SWyUUurMBY1jc0Amigb0HzoBNCuspdnGr1fLtWze0p3BmLH0Z9An8K6XCHUeUoK
	 JXLzlmglaKFc4n0BXOkBsrDECmPSbOSlHdPmn1xmc/ewxqUydI8UBbsoE/tQOpjj5q
	 mFhk5ki11FXA6/05woxxPpTG/G79rv6kiqiSAoIO/5IE5qJQLHu97J5gBAwZtJOZLz
	 0lzmebyXHEckw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EFDC87FCA;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 31 Jul 2025 23:06:54 +0200
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
Message-Id: <20250731-synaptics-rmi4-v5-4-cd0d87d34afa@ixit.cz>
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
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=wuBeXWxX9IEl8wN119G//hfgPIbwZX/r8TMKzYa1UEA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoi9r/6DrNHPt89NnVK8ZIxo7ctM/6RdpRqIImN
 XWRRt0/8jCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaIva/wAKCRBgAj/E00kg
 cuOcEACH/xHd/nYf9XC5knzgiadJ67qYgQDNUH803fmUoeMuf/5t09OGxrhKVmrWCoF3eltUW9o
 Dsuhcs3tVRUoKmzT717DyXFMFbWR1h+LbtUiwNWn1Au8RcKq8SmnySAbnBzezrQdpxzvBqYBy83
 ww9QwUB1ks1twXrRn79JGNiYJkreh4gpnBRkCo1RWnLhWYJPCj6z/NTGSr8X4onYWqrcnBnumeO
 wXEdX55G3E0eiCFL89dSN/Olca01z5HYOR1klb4Tt8tsAsyngD6olnOvunEAYpFWLl2CiAHDO8n
 0EMwkbBpnLCYptyXIu8YvvfvIqLGs05oq/X97K1DYMCaKJgogKIc1TedHYbVnQmM6OkovQNY672
 MVcYj/c5hlGu7IYjz3qH1lNJBILE/514qtSku0D2VdjMpoBOBjCoZefDIoSV0vOk1tmAweKP7Qt
 4QWqFekVEWdh2XIBC2PU5iLr8W/xEXQ4AlAIcgUD40GGvZzzR1IBAZLg02FSmh1mdsO680D8bJj
 pVfTzQFCyurVTxDMdHmlIzsp/C3dhA55K9/oHKFoQ4DNmY39MUOHTQkSK9L6LVU8ZBRFfUS9G3A
 hbsw0uICFop6SqR1NehX06B2U3ETn7P/+xRsYwBP1SsbdLdMQP4w1YsTaa0w1getER2cNf5SQ3t
 ANt1w+V6hnJNYoQ==
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
2.50.1



