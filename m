Return-Path: <linux-input+bounces-10507-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8954A4CE6E
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 23:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FE6B189014F
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 22:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8967D238168;
	Mon,  3 Mar 2025 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6hspLTo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A50B230BE0;
	Mon,  3 Mar 2025 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741041424; cv=none; b=HOCB5qd3eDw6Q3iAn9tXNpjkrjwswzAUNiY1tvOsU53EK7syX5yXWqW2RFC8vtmyZijcKQ+deqDbeqxZ3bkY0+sTb1r0DP7N8NXCSFo4pYJKVIZ5PFJPqHEYKRSODlrkMGjnQznewB4J40UAzlIa4rTXUHW4C4F7KrkFGaNd9Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741041424; c=relaxed/simple;
	bh=7OPm1T+mkJXZEwm3WT8eNfWAGOcFF+eZAf14BzqSoJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tPr8xBZX3hL5+Uc6vFtkrTuMG9h1nRxylEyRJ7ZzUavIIYWM5aCo+sNcoHdxhMk90SEiG1nWxhAfKWHGK5jLFxV4KMqNq6cR57BbNPW/RbR9l+l/PcnkVQGvavBXhjRd8z4PKI34ZScflsUwBoOqWeNLoLFOOubCs6CPUb3eN2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6hspLTo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7FE0C4CEE8;
	Mon,  3 Mar 2025 22:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741041423;
	bh=7OPm1T+mkJXZEwm3WT8eNfWAGOcFF+eZAf14BzqSoJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=f6hspLToRkDW2OLki7LBjQJQJjMFqMi9/0q9ZD9gNSktC/oOcfD/xDyA1teqvEphi
	 sY1Sr96GG5p3SGxhIMT/WOZiGXQdGUXJH8UCENpMVIybnzU8FYAxcVln2nQ1gQgkjC
	 UGVcKjcpQ7LOzt1wLqwqSpyyLz8icVJfkAvMTyHUrmAKB95zPS1jCd0K3vBjaXDAbb
	 LVRta+DquNFdas20Ec9xfgNOKIlfQeQbr9K7ubIFmZSp2uEkHR9gCxrEXj0+AqYm5g
	 0ts5eCxtIReoDAOk7xnkv9IDaK3u4zohLFBiDQLbZcVqFTCF2npjhHiQ1kSNVMHvXA
	 rEvcH95Ezu9hg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1961C282D2;
	Mon,  3 Mar 2025 22:37:03 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Mon, 03 Mar 2025 16:36:55 -0600
Subject: [PATCH v4 1/4] dt-bindings: input: touchscreen: edt-ft5x06: use
 unevaluatedProperties
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-pocof1-touchscreen-support-v4-1-cdc3bebc3942@joelselvaraj.com>
References: <20250303-pocof1-touchscreen-support-v4-0-cdc3bebc3942@joelselvaraj.com>
In-Reply-To: <20250303-pocof1-touchscreen-support-v4-0-cdc3bebc3942@joelselvaraj.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741041422; l=1521;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=TG/Ca436vhsLjDnOfrSST3z+haEV+Vb6Rvx1ieR+dUA=;
 b=Tww6wJt3vgET/vIXsfOZ79qTNK8WhJCi3452QHsaWvFXiFLus/BzOoewgGs0il3hWQWIGUToW
 2nlTZOyO6QYD2M4cdrra6qX4EWkU3UYQg2tfhGVZZnMNEgwgPIfHZa7
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20241007 with
 auth_id=238
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

From: Joel Selvaraj <foss@joelselvaraj.com>

In Xiaomi Poco F1 (qcom/sdm845-xiaomi-beryllium-ebbg.dts), the FocalTech
FT8719 touchscreen is integrally connected to the display panel
(EBBG FT8719) and thus should be power sequenced together with display
panel using the panel property. Since the edt-ft5x06 touchscreen binding
uses almost all the properties present in touchscreen.yaml, let's remove
additionalProperties: false and use unevaluatedProperties to include all
the properties, including the needed panel property.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml        | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 70a922e213f2..ab821490284a 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -103,16 +103,9 @@ properties:
     minimum: 0
     maximum: 255
 
-  touchscreen-size-x: true
-  touchscreen-size-y: true
-  touchscreen-fuzz-x: true
-  touchscreen-fuzz-y: true
-  touchscreen-inverted-x: true
-  touchscreen-inverted-y: true
-  touchscreen-swapped-x-y: true
   interrupt-controller: true
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible

-- 
2.48.1



