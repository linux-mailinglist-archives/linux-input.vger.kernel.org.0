Return-Path: <linux-input+bounces-10652-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9EBA57AEE
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 15:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F99C3B1F1E
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 14:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3808E1DA100;
	Sat,  8 Mar 2025 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkbtfH6s"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB651CB9EA;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741442925; cv=none; b=o4TiG2F0CRk03XrZF4MK55r/PzliS0AxknjoTkUk6M1PGtiYCU70aVpshdSSBxKn49Y6K7/HAu8G2LX8GS+1s5NOHhW/aOgkIuggMqNEXQ2kLPaGd7Rs1aw+Hkl+pbkcz9lqJreToRdKejMwW6ymXy5ykKUkxD81wP5yLC0hRis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741442925; c=relaxed/simple;
	bh=Yas5xai1IOwpaMITIAgtkXkJZjEndYzw4juhIMuYg7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=STMjpmDv9OhxKgad0BHHG1NIU2/ITVGR46gCuMtv1frNNU1qlNB/Gi0Mak1zZkRHBLYB+pfrbmtveHieZwnGV0MpchNWY63qicDxWtf1WT9s6Ovx4Q3j7q3dSzC9Y0v/RiIU38NnIwVi0vYTBFiBA45H+yOxxAtjQwKAUmeAJkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkbtfH6s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73D87C4CEF6;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741442924;
	bh=Yas5xai1IOwpaMITIAgtkXkJZjEndYzw4juhIMuYg7s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dkbtfH6s9QvO/pBSGS3nAP0IxJk/jviyfMvDu5+qjNTXcgQvptv4FcNZfKrCv5nxN
	 tfNBrGMK7BbG1r/SLBzH9bNRkZuLDiGjdoDDtgD+1gGF/5Dc35Mh2nFjLbiFAF/reQ
	 c3BqlGSB4HOwozLwExWqTT+PDluFh1A06BpNyMihRhIG3tMKlz6yWhMDKPwnNvk7/8
	 3a+vE+kwzM36E+GiGgATAXmYxd+WHmIdsW7UjSWeRWtcxhd+Q4ftrpf3aE9S5zFXsP
	 fphvM1Jenff1mpKGnMj0UV4yiiMreP/MvfD4LAqgKfcFQ5bW1mWVBM4piQGkCOy3sA
	 Xfr9TwF7axRjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6397AC28B2E;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 08 Mar 2025 15:08:42 +0100
Subject: [PATCH v3 6/7] Input: synaptics-rmi4 - read product ID on
 aftermarket touch ICs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-synaptics-rmi4-v3-6-215d3e7289a2@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=fxuJtva2e8FaBzb+bW/oVy+YglxJV7q23OaA59oxqwY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBnzE9qpBbGcPsA3x2ZHJwwDVetMUitjwHkwxdpL
 GRZC7qAiN+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ8xPagAKCRBgAj/E00kg
 cqHJD/4yp/pHJI9xAQ7N2X0bGa8rE4STA/jHtd8IwnR8jCZHsN8u+2GmrD0D5wLeerPvvwQKKOc
 0l4qeOBKGKQ0TOpzf2LVNqxf+ml4J70rugkcTySRgjrY/XWAOpnr314xirqucDzWgdme16hDY44
 8c7cm/17fEUk0xw+qbFrFJJ70dGCr3U1vZEFJA3C45hMzPfwvQMQtf7mCdG5uEdqpUBcLcBQ6cS
 HhXcj9Is5e6Df/bc8sSY6fCyRiqdtYQYeHm3h/FzJk8Zr1zx2H7l9bdsYuunWuHIePY64A0nsCv
 E8YAZVn7uWQH/Ci3BlH1jgCA8jmifzk+eB4XIyLxzxItjcFmW32s4TO/bl5bMV6tciBxINW+FcP
 g38oR1dByV2Yjaqd8pPhUxsi242e9RgN8SVweq9IAtMIUzv2BAH4H9++kyLfMZoXf6FE1bXPrsc
 I/Q8JzJuknCwc3pY3dctxoJlGzbMQTUp+TQUMZD9vSXQmWpffTFrEc2jRXe+V6Vaw0aHQ4dqlW0
 8VnWCO4NmAtNfBmyBxJKp5+qNmiT17TQOUcBm9kJxx5CDCE/ZvJjxspOsnKFOsSCjE9lMWsq/hj
 Qn3JNN4N0Uj8g4nH4RrOXslwDPzx2Ftl07N9bwgxvd8Jqag+hAQD89OBYuibWuI6C/TEDrPNohL
 leiyOtthaX97seQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: methanal <baclofen@tuta.io>

Some replacement displays include third-party touch ICs which do not
report the product ID correctly unless we read directly from the
product ID register. Add a check and a fallback read to handle this.

Signed-off-by: methanal <baclofen@tuta.io>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
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
2.47.2



