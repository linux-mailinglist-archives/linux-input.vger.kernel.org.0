Return-Path: <linux-input+bounces-16103-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8041EC58D55
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01D4D3BAE97
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 16:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D188363C4A;
	Thu, 13 Nov 2025 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQ4NzblF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060F5351FAC;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051468; cv=none; b=rbcpJa/LuAtB6xso5s10jHzVGYANEHp6OLlxWjm2tzMUU1xrBpfZmP0G8FBAOVgn5Wn4bpe0Br07Jnut0ddhPOSq7KKDkgs1OxhE0+hq9hSUtgFRBbpGHJMnolC7bXWm+nMbibEhARh7ywlXkOvY4r+YzQTW4sOGGyxqbP+UMGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051468; c=relaxed/simple;
	bh=0WO/jZHmjEuOWBwtHgbc9wuEqlLbCiO8pWpnq7ErWxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nczkxbkueaJJA88OR1/mpsMNwAv9WzHBZPespXkjrF3uPF6+Hy8Xh/sf/Q2uSrslD+R9c9K5IXzs/tJgXUTNmGn9wiI1PG0NinIKWh8z3tTUxaLGtDFr+k7FoPGrDap2KCAPQ5G3tqbZ6Q8TE23rtjG+6CbE3W1s1I3bEcsq+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQ4NzblF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64E29C2BCB7;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763051467;
	bh=0WO/jZHmjEuOWBwtHgbc9wuEqlLbCiO8pWpnq7ErWxY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LQ4NzblFPh/c5yI1lHr7LHNuAIuEuKwnQxYXyN6vCUlF6AXO6whHC2tclTFIs9iMv
	 cfiCwFduKz6uIe1fBgWwB6doW0mBcbtdHF5p1m0i1/e+OzYxSM0snb1cY1aEaC4fuz
	 EuoV39KnI65UJA1f0c6ztcCPUK+XbQsClrwlFCmPhiM6+kdDN2ydKOR/yQR7GmycRa
	 rl0WbnT9z+6AGIcQm8BWMGw0y7Mdj2iu/54Mry9z7tw8X4Jleh/3moE4DIcNMgofzJ
	 b5iavnXJj0A9IsxpChiL+YFGaM+Qn2+SebpnA0Fkep16Rlg9TFqLIbIw41E7fBkfrd
	 vnI1d5xP8wQEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A73CD8CA8;
	Thu, 13 Nov 2025 16:31:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 17:31:02 +0100
Subject: [PATCH v6 6/7] Input: synaptics-rmi4 - read product ID on
 aftermarket touch ICs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-synaptics-rmi4-v6-6-d9836afab801@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=fdg+12tEzxS7iHUQg0vbJynpAJ6kRapCVogkHxp+sbM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFgfJJSUY09P6h/jPNxdHSCu3ss2AzYgdLsAQf
 40kLo686jaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYHyQAKCRBgAj/E00kg
 cqsOD/9THOF3+00OTbZkhaH5F7LZR7lng7MGQ59Ew3D+EuiaZ7sTjIWBF/om2rwFDqOS7ZsFzf7
 mKWEI68HbXO5R5M38cOzsyolTb6Q+xdfp7MCUNKHNaCGn7tfrlSWFOYjb66PwZxUD4wTlpDFXL6
 DAuhi73YTgp+Du2n9QiwRojTH0cZFicStU4l5aFS/efxUkAeKOYZEpa/FZMRUrLWPiUhGnuswee
 pdVizwYMloQKq+3+ziueGRPNSkySNFm9uuCY++zTIzyLbJWD0/bJzhUBF/ypvCMe3LlnHcGtq3J
 TU0IBXUi46h8y6GR9ocBlC30p1yreB2yXHTioYQSPOqSSDan6EIo0Gl1HBA5gEvVY0Nbl1y2udR
 bU0OWwuTdTQACXbL3XUZwmmOTGBXPMimsQkrflx3EtyctOPXdGIleMBr9EnNRW5MNXNIq8nPYIm
 qKdBqx78dHSqJAjEIxkHEK5jG/0DNsHBQkPWwIH37L5ANGUXA2NWyvEA7hsy8JVwwUjZPjHPiW4
 dX+vBsXgUEdTFuMih5JJK0nZiYwys7rM9W3sg3/JbtFH93jkM9BkPX2jBN6YnWyGEzO2V3AyY9k
 2Onxkmot4F3riXdRmIhIUdyWjTEMwyz4MvsqECpHEp3X2B1vGVMxuLyAck+5Bawiz+EX9mz3GtV
 nt3lTNcrD3oXYpQ==
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
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/rmi4/rmi_f01.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/rmi4/rmi_f01.c b/drivers/input/rmi4/rmi_f01.c
index 47be64284b25e..2278e9b6a9207 100644
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
2.51.0



