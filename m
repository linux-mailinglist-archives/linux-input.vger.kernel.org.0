Return-Path: <linux-input+bounces-7140-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C4994111
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 10:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDAB91F29448
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 08:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CB11DF258;
	Tue,  8 Oct 2024 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QFoxrTOW"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A657DA76;
	Tue,  8 Oct 2024 07:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728373304; cv=none; b=AVbvYJZnJSaqDwjmjeu4lRJjqrVr7g/QXXFRrX+LGyaOWSuqHO5PDz8B02leB3qeCbPa3MQdUvWpU6N28fPnja20O7PBi0/RVD7ef/G9h9VcI4gRdV+yOHtgB0PXEi36GQyYh3OZM8IVx/dK0Yl/o3BAUPrc0v/vfKruXYY8fNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728373304; c=relaxed/simple;
	bh=35lBvv2CjlMGxk3oBL24soVgpmlLJ5Mwe/JfBWF/hcI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ImXqdGEXvr2S3SUUaAdiso7s+5Rz0bE8xvtnoqYp9W9a498oVxweYnjW6XSED3mKRfdW2LXfU8jJ8WZNE3khBDpWkaDLB3YfbJGp58ILd6MiFUr8AjNHe8zoKjWRMsZgv8j4R9j3sumBDeeB9W8Q4ybAcQmw3WXvW7hqvcbJwDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QFoxrTOW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728373299;
	bh=35lBvv2CjlMGxk3oBL24soVgpmlLJ5Mwe/JfBWF/hcI=;
	h=From:To:Cc:Subject:Date:From;
	b=QFoxrTOW486KUimq4VCS/qdNu49Grm6OwUq17dgMSgs2Cpk9oCTO2KsGEQtZjaeeP
	 4AR5QPJ7JAJDlIyqrairIs7gY4UFqayzgAMFs/pFCElkrsjD3sxqR5UoIZsvRZFYvd
	 JqHq72pXv6vBc6A6nhRb7FVkV0xNORnSMT+pHxd/mH/7ysmSTjfJsVlPYQArMic/Dk
	 tNA6us5bR9fPX+vAZB3GpFGDtiD2y35QrbZbpLBMlhA9F0uipaD4g1QJQeyg1Vl5mV
	 WsmG9WDZy8ye1FDLwot9zMTwGwcwgfn7x+9JLO1dqa5uhk7pW0ZjK38XVZJF1ddbEL
	 QHkRIb8JCQawA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 50A1C17E107A;
	Tue,  8 Oct 2024 09:41:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmitry.torokhov@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chen.zhong@mediatek.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	macpaul.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH] dt-bindings: input: mediatek,pmic-keys: Add compatible for MT6359 keys
Date: Tue,  8 Oct 2024 09:41:37 +0200
Message-ID: <20241008074137.20269-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the keys found on the MT6359 PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 70567d92c746..bba55a81e6cc 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -28,6 +28,7 @@ properties:
       - mediatek,mt6331-keys
       - mediatek,mt6357-keys
       - mediatek,mt6358-keys
+      - mediatek,mt6359-keys
       - mediatek,mt6397-keys
 
   power-off-time-sec: true
-- 
2.46.1


