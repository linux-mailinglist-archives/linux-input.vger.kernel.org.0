Return-Path: <linux-input+bounces-14397-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C916EB3C982
	for <lists+linux-input@lfdr.de>; Sat, 30 Aug 2025 10:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D0F2585B52
	for <lists+linux-input@lfdr.de>; Sat, 30 Aug 2025 08:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A90253F3A;
	Sat, 30 Aug 2025 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/8i1RAL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548671EF36C;
	Sat, 30 Aug 2025 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756544015; cv=none; b=t+OcyO3ZFctuRhqoA00VvnjGa7usaNh1rIp8DTxguwFuR2WPSL11hPuVc5LNUXVScJBfxwQaAD55g/RZlBifhZCBZrny+l0cB13kcs2MejMFZFpnbTzKxJ7RHQNXxE2vvjUDt6/nz3AKyd1TLTiV4lhqDbSPbW6OoE7GSW4Zh5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756544015; c=relaxed/simple;
	bh=FyChQ5SGHhr7mu5Ju5mek1d/MHydKeR6/5dYJQzVG0Y=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=W8JCCPGOiM0Z/uK1woCYQZ8kpeI4Kb7D/jdD4VTCqq2cK0yMaodp/ZBXoQdIsWMHpL7fCj7PkL7vScl77EUZEse+pO/10wVDol9gSEjjOCKrssAQKol+fKD0Mlwe5e53hDROmQwy66Ubj1Xzk5Ik5/FMHQAHQXa++lA8hlR3aW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/8i1RAL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4341C4CEEB;
	Sat, 30 Aug 2025 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756544014;
	bh=FyChQ5SGHhr7mu5Ju5mek1d/MHydKeR6/5dYJQzVG0Y=;
	h=From:To:Subject:Date:From;
	b=Q/8i1RALYTYpsw3a5m+OV/80YFaLg/XYn3fhHmQOHMdcUdcoF9M+pIepgyAX1oZrc
	 LzCTSsLdV/MecopaUGpq98Q4kD92sGF7eJr+zy0MyzeBlg7VBDe1tNasdEnNgA5Ibv
	 BcE4mNedhzQOdhBJETnbfVWKcVUSFpi2Eyp/Uq2zX229wQNdJZcwnvNEKKi/4EKpBH
	 iYOMSsoEOy5ar/jWGScFYz0gyS0yxMyRq71VVpnWGFuPTHye5jFR1aUxC4bj+Jx9Z7
	 2nlIJuEgYswQSZcmltxx7VoA01X2S842+rvlh2u5nRJyeiKPpKA9oCVatgDH+PPTr9
	 rgzvahr6ba9lw==
From: akemnade@kernel.org
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	andreas@kemnade.info,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: input: tsc2007: use comma in filename
Date: Sat, 30 Aug 2025 10:53:26 +0200
Message-Id: <20250830085326.36120-1-akemnade@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Kemnade <andreas@kemnade.info>

Use comma between vendor-prefix and chip name as it is common.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../input/touchscreen/{ti.tsc2007.yaml => ti,tsc2007.yaml}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/input/touchscreen/{ti.tsc2007.yaml => ti,tsc2007.yaml} (96%)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti.tsc2007.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2007.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/input/touchscreen/ti.tsc2007.yaml
rename to Documentation/devicetree/bindings/input/touchscreen/ti,tsc2007.yaml
index 8bb4bc7df4fa..a73d110272fa 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti.tsc2007.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2007.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
+$id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2007.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Texas Instruments tsc2007 touchscreen controller
-- 
2.39.5


