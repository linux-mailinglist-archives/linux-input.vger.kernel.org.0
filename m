Return-Path: <linux-input+bounces-11711-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E43A84660
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 16:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EFE43B1D1C
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 14:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D458528D82A;
	Thu, 10 Apr 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImpoqnmQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807FB28CF5C;
	Thu, 10 Apr 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295304; cv=none; b=JVT1tZTcxBvrtfFf+DA5LQ5Bll5grL3pYpmxO7xiKLguQ4qrMOgZ60hxP00B+oHD0C6HsGAsmaZX/p0wF4+Dska8EuqpnThj4VXhWI9BBrxe+ILK8DK8uU3zMK7xAUffwRhoGzX9NPiVLbl1R5QRio030Z0jJk8VRDTPSVaH3tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295304; c=relaxed/simple;
	bh=HeOIUhogeLDXtT5wIduDA0u/HH6Hvijhg5yr5b3aZqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RHYNaZQjbIBNk5VIGeyesrsbIMS+TyJFrdVtRvGixOZTHtGNoDvAlC/I6ZTEz1u+pDnkZpZO22BFoqNiRwBfsSBNh0setkp7LbtCV8piMa3RN3V1ZGJEZ743toWklUkdORyywSng/zzNZUZ3Su2gWxgoCB5uOESHRJFDkhd9rpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImpoqnmQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF303C4CEF3;
	Thu, 10 Apr 2025 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744295304;
	bh=HeOIUhogeLDXtT5wIduDA0u/HH6Hvijhg5yr5b3aZqg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ImpoqnmQ1G6dbIF/QBSKKLFOHEskswXMsoaW3aUcp81VdN/8+0OwIkmjCGWlTJ785
	 K2ZUuvKKDQWJwA6Etbn3pYgnUBdHPjPqgrw7zZM2y2YNq+WPpDXQ1ID8Irx/V+fm3q
	 XOXLlEClzRww8YYWis/Q112AcmP6aETYkBpgqLlsAQrT0cVHxDc91gINGmmx8DL1le
	 K8DOW5Ur6frPHLwbMn+FafeVdjZm9Uo00W/ECCpKfHAnDWsKw3P0n146emx1iWJH/6
	 Bp8tBkHcTZ3FfmtcSuQ1cpCKx2V1VMkCWpQibdGjX7q2l61hBjix59QM/l7cIXFvKk
	 q5SrUJjY02KxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2177C369A5;
	Thu, 10 Apr 2025 14:28:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 10 Apr 2025 16:28:24 +0200
Subject: [PATCH v5 6/7] Input: synaptics-rmi4 - read product ID on
 aftermarket touch ICs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-synaptics-rmi4-v5-6-b41bb90f78b9@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=fMXBJWuwOFgydtCp3BkAhLq4KC36XWjDlNvLR8bR7vw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn99WFUqNTBVM/GY6vug1erJlsA3VIrAOgx4LSe
 gpvRBBp0l6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ/fVhQAKCRBgAj/E00kg
 cmYFD/sHqXVSPzp5jgWDXUwWxLaJdqhRo0zKA3Sz6LdcdCxfR/4HcpVHNhlRhqXUjjTaHFGkbAp
 AeVlpjCcq3kCrmJ2KOgME18orqIHtWHnSo1EcBy3bF3egVyhSiAEwyGP3xCtjsX88bXO/zcMD7J
 IsZDqcvL5UwgkOD2Gih0cU5UPXPgBNpmp3njS2j8WNEzjnozt06FfyT7bLFWD7hcCOB6f+L5tBS
 0wq+ANzjcvdumIC0Qw0ZNhqkYftRoNYy5M3JJ7GbRS3GvltUwFBFsksTp9W+hxx2hcBg+2+jbnt
 L1KyQd9WHNtvj6df+863IzkoUAO3aGajAWlkkDQu3IELOwPNesJLykQFt9aMoPTDEyOxqCveyk9
 OfbzOTE/dIjEeDxHKwS6OIUsODYpfcUtVMVjxlcjPWE0qXajDOQqxX66eIdQGlvjueqfEgk/yyu
 /lluzNpQt8QvfxtrvXXG00KX9nzbmyJr/k5DWMK/4dybkayWIXVLX+oRykudBLgHFQkj3PGmU16
 rs7JXjRevKZ/i0YWvUdjCy/+RDf2wgdwZ9rc7U53MtVHtENPuQHXzSTd46ffMN1GY9JB25mLH8K
 u4lXpVNWlXjU6HNi3VF7JbxVDxVyIfO/aV1DJLxCsG6j0BlCJ7G6pXnbRcGjQs84qSIypw2CSgF
 FJMtcbYGOgfOSBg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Kaustabh Chakraborty <kauschluss@disroot.org>

Some replacement displays include third-party touch ICs which do not
report the product ID correctly unless we read directly from the
product ID register. Add a check and a fallback read to handle this.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/rmi4/rmi_f01.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/rmi4/rmi_f01.c b/drivers/input/rmi4/rmi_f01.c
index 47be64284b25ede8103ada86d6b58fd3a26976bb..2278e9b6a920774b07ec9dd3e452cedc69469be8 100644
--- a/drivers/input/rmi4/rmi_f01.c
+++ b/drivers/input/rmi4/rmi_f01.c
@@ -250,6 +250,20 @@ static int rmi_f01_read_properties(struct rmi_device *rmi_dev,
 		}
 	}
 
+	/*
+	 * Some aftermarket ICs put garbage into the product id field unless
+	 * we read directly from the product id register.
+	 */
+	if (props->product_id[0] < 0x20) {
+		ret = rmi_read_block(rmi_dev, query_base_addr + 11,
+				       props->product_id, RMI_PRODUCT_ID_LENGTH);
+		if (ret) {
+			dev_err(&rmi_dev->dev,
+				"Failed to read product id: %d\n", ret);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 

-- 
2.49.0



