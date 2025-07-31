Return-Path: <linux-input+bounces-13744-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C670B177C3
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 23:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD84C7B04DA
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 21:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24ED0265CAC;
	Thu, 31 Jul 2025 21:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMY2qboP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FEE25A2BF;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753996034; cv=none; b=XwTQe4lslNJRwWDSziUkmWBqHvg/mbNfxTrSFChEkcBHv2QPLgnVU+Wj/ZdHSUrntqyAcTU2D7UTSHVDWHfa4NDEaMlbLmwA6BCPMWlgb4g37XqGa09qqrtEOQ1r9SCpJEQzCodr1KMPwYz3n9Sj1NQVPw2R/exI4sqwJ+IvTJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753996034; c=relaxed/simple;
	bh=2pHNOV+TAIFZZ9Mpk73B9jYNd9FN+OKd7NX70urKO5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u3m+4/BJaWVc2neL2zANLl3UmKe6J//OW9mNKmJVzTlnmVULz6zX5wWPDPtkI5FIZtLRAl5xGVLPd4R26E1Ntp6kxszI7g3wr+qoWQWSvHad7mvVMQGFqraKCP3ooaJz19SyUFP0XWC6DusorRWoa34grBMYwJWkDdpYC40CCTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMY2qboP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75B5DC116C6;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753996034;
	bh=2pHNOV+TAIFZZ9Mpk73B9jYNd9FN+OKd7NX70urKO5s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jMY2qboPJo5k37HrT+7Tta1nK4Lvj04gToF/EU+BgmdzQCawLbKfj3g9WF4gLfXcK
	 WhJIck9Riqrm5NB/9CHUeodxvGe1fkAtursFtlNONcP/r4gw/I+aWpW98UTmT4QjQv
	 WuMuzd0GF2O1ToiQTd/wCsIhULXkTPlwWPK1bdbMVpurwQp8/RinfziRifPJleDXh/
	 dS2sNasjtGwRfoUvrYfgovwyTb6YY5wi1ZAOjWU/aiCSpKz5xucycjzCeIVqftEmHd
	 ZziYGKNSIPP8bga0JmFddOZbfFe0wGuCBJx5+dyZHssK5pq4fjKIm+3ogox0nTSnaF
	 /II7vjHNgVhWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0E7C87FD3;
	Thu, 31 Jul 2025 21:07:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 31 Jul 2025 23:06:56 +0200
Subject: [PATCH RESEND v5 6/7] Input: synaptics-rmi4 - read product ID on
 aftermarket touch ICs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-synaptics-rmi4-v5-6-cd0d87d34afa@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=foQKt41rQkAeUSTCVE7iH9xBlmzERmbzM9YslceBQZg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoi9sAu/mrgfMKeArK4vh6IGkuRovnV9p7Dg8Qd
 izMhSnge8uJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaIvbAAAKCRBgAj/E00kg
 cvO2D/4758jMTi2wt46u0dMYho4JQK93gvpMFXOmSZ4yEd/qAXieqjaq9KhTlCfR7nq2zT7lC88
 y4Du/w1Ia56A/x166kgDBHbpCMAV6hsMQC8s8V9LeEx1QHc7+H8nH1MhWY1rsRXLeiCj6qEP1r5
 aaXLNSg/Xs55Bb4aSePSsStVSoMUkcTTbT6FnYEz6GjkbsUm3iPRwska4ShU+Mgaf3d/eSpld4e
 7YGrUk5jniMsnqaUp4lkm/Kqb1gXwn9Mef0VzXAXySuZPBB3mwG4cbLP1psqQmZVAe3cjwiGQ4g
 rSTy0gPgjYOEveWdf5OBTv5V4bNrtDqaw3+vsJhaiJJfEO9V24vgBZEccBhOSMys4Wpm2HtfYUs
 OhX+rud5tIDle2BbHJzePCabhfsei7fhK+mJBaMbvbETwpOSblK3l7R6Q0aPwSVWXuAIqpGO/8b
 lYMetz6P5DzdtHRU7IXVCwkOI3Dll+0guyPy0R+MjLHUfcMGGP7ntzUewKKZLJ1uQd9FMwofYs6
 ss2ZDXeyXEXGAIQ7S8A8c6xOSovrGKV726iBOhcFyNlvY9iuQ9YhJoVP1aDvTvGXvpFg2o/9uHU
 8tD/wbpmoSi0YSxanOyOPwSlRu+YuIEt9qD3oFYNM+GYxIo1ET3qFhOWTk9gi2jISoY0t9iZkrN
 VXd8ZSXOo62nM4A==
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
2.50.1



