Return-Path: <linux-input+bounces-11480-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B79C8A7955A
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 20:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0BC13ADEF6
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 18:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D64B1E8339;
	Wed,  2 Apr 2025 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="myPVDqak"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1460C1DED49;
	Wed,  2 Apr 2025 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619498; cv=none; b=CMmJRxRFW1AnyikTtz/Ngi+09Y9IHF1V2Y1t+p4krjL4EiWiNoKl+43y2us+B0ok5BICwK9nPFR0ZeLgMFkiV+5Rynp/G8sjiOzk/NDkKKXzhulxDwi4qPvFOitUaVQqSxnbG0YH+6J6Ni2mWrpBECLuvh9D7yN11SesXsqJZYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619498; c=relaxed/simple;
	bh=HeOIUhogeLDXtT5wIduDA0u/HH6Hvijhg5yr5b3aZqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WwNQ8glB0ZJCw/ySOW6u5Ibm+XkvHvRUXbh11se2hI8wjACBqVnkgNyuu7KxrmYhqVzRg6wVt0gNjWFl0EYnvCRy7TQxpjiQaEA5oUdRcZyD0C2P2LDEt8kUnkhKQu3q4k/Ki50pcreNbRNhSVywg9NrXyPp+52Mjq8VJYOAtbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=myPVDqak; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F3CBC4CEF4;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743619497;
	bh=HeOIUhogeLDXtT5wIduDA0u/HH6Hvijhg5yr5b3aZqg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=myPVDqakZ0IcQEnFVJurgfa4Ml4AoEpZ2+Tg+6GO/yoByjUwnUdbgOuaziFXIC7kP
	 ERc45NuZTCxRsFnG0UCGvE8jnlT9uW8mkkvBXMzJSNr9WZTSOf9ONYumPnlJZzkuXz
	 Y2Tly/5IV5iTpMrUuZh3l+anm5ykdZD4gURe7hp9/lvU9eX6AmZ/5mDikKkpBZ+yF2
	 dUzTjzFC3gsnjrXiVPPM9tYxWYSy0qqU6Fp/1FhuVt/LPS8HAelYmzIHTuXNpKBcR5
	 ZL8EAYhJX9P6E44ihlM0tGMSo8wACsXNyKHzfBtSeUH5AXDtq4yLSstGS66Z+ybA/8
	 H17ivPodrsTZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971C3C28B20;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 02 Apr 2025 20:44:57 +0200
Subject: [PATCH v4 6/7] Input: synaptics-rmi4 - read product ID on
 aftermarket touch ICs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-synaptics-rmi4-v4-6-1bb95959e564@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=fMXBJWuwOFgydtCp3BkAhLq4KC36XWjDlNvLR8bR7vw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn7YWnijG6OkcpTVIBmk0cKl9KKtjytMDZK+55T
 r2VjtipXtuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ+2FpwAKCRBgAj/E00kg
 ck9nD/4tAdYAHLj2PTxpZT0SmmwgTSLss693LlWw6pZ/DiJx6dMyfIbrMOGqOsV7upY/YQGCrIQ
 PCBRh9JESfzUeB9uiNAUO0adcoDtLTktyRocx2usFlfQBN7PbTaavx00E1T9CFhnjGMdn7lRr2B
 +akyv8lP+arIBOF3MddHwVLWUHRJ5h46iOruN+pctMWWq6Orhg327GOyeheIlaUDhukszd5cZZ9
 r18qYhBVzHStD2mrLzx75tiFB08pPxscYp9HqgGgXCHGT3kw7swVV8sBFypanbKu/s1HGih+F0C
 WAnWUlZAoVPgTc0bsRWUET6It/xxQjLfKp4eyBsW68EOZ5khnKnd8XyIzx+W9wOdXbMcC1vCOeh
 2W+ptlfcyoMXfe5P2vuftNG+AamXz4dgksgxDkQ7Rt7ny32wjg0L+LJUeSOSovveH2jJLqsW25w
 4JpmBeVoijv8tjhF2GSppJY+7Awzgi4inLtG6e4/zgi4ugICEwek0T9pN/BMxlfmI+uHRyH/uu3
 PnQT5u68+MUwQccZ61wluLNjprqfON+lQAkJ0sXnDeR7i02KGGF9afEs8JwYIe87NTg0AtavEbz
 yDbRubuG1fJnoz3LZQQPDgNq33MluebvGmmwV6pKcByBhdLK3xgEGgspoRce5bq3UIBbDu4+Uot
 /Atyu/eJSZ+wduQ==
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



