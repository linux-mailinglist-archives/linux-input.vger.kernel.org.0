Return-Path: <linux-input+bounces-6029-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532E1966A00
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 21:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8432B1C2148B
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 19:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6F31BCA1E;
	Fri, 30 Aug 2024 19:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTI/tKDL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E99233CD1;
	Fri, 30 Aug 2024 19:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725047025; cv=none; b=Z3VA/MQ8vuZynLnPk0psl2TkRJjHbq3eQqduFnQ3ZSqREtGal7i057i6AFtiIKeHZT1n8faRaIboReZX8eaCFx9cqX1e8GwpvEj1jxA3/hUGpM8BIxtODAz7Q127HL4haRya5M+uR5lFSVNZ44A2cY+zNYMOW+QVNB5F4DNtXGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725047025; c=relaxed/simple;
	bh=YMdDHMzh1eilmRncn6uRrHYQQ0dxZhvUHERYroWFXlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rJGpWQw/Uto5fv8slfDmn8fc/KDedA6GfZWggpUhRHbkyAkAYaz5NzqY45TLWE5eV6Wk7ivihax/ztdaYkGRmQ2A7O0tZt+dIEL11EIzersGfSvPKI3aa7ymXjxnOR7TOYPa9V4CZ1Q7iqbTIsy18rxK9KI+u8A8tElJ4EWjNhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTI/tKDL; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-716609a0e2bso1064772b3a.0;
        Fri, 30 Aug 2024 12:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725047023; x=1725651823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+VkW3u97zkF3Zr7o+exMtL4ZUdBNqBx4SuBjN4XsZx0=;
        b=OTI/tKDLcobSHUjVlqUcZu1PJv+ocP4Hw5qvwDg9mcxchKKLPX1Tmowu8fYudEunBI
         InmS4yRCdbOiPKwlOioiBxRVR9pMlf7/evSey0s9fz59q8/+aMRrQ8Ll+VAV447Lv5ls
         hQCvuTY6naQqp7orxJY1xsPzsz2iGYkChsZhq4CxuGhRJeAMImDlCfb9Kft8CDf1WRJC
         x4cw6i/WOJEL31k4AXxR6rWnDaIwJlTde3/0DkfVqSdzLJ3T3KF6yRMS8sqSs2+f/p23
         GHHYbnVLFlcNYyRnv2ZlyqjyCt7EwbvQtHWFxrorLeIxbytOjsEl6cQxNAW+gMaonkBB
         Jchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725047023; x=1725651823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VkW3u97zkF3Zr7o+exMtL4ZUdBNqBx4SuBjN4XsZx0=;
        b=k0mjN987VRUdEgGnasIUSZg7XGKtCVtdWXNC1mB65GuVuDcnPqzlRzbr4awhxO08t9
         P+qHRYY3EJexGRaGFrL1Wce013ooiM3zLFMsFYbo6vgSVPnAXgvB43eKVQZ1tY4BRvic
         HQa0Z0qmODsq+QuK+CjYfUYsUgjcZTdt/Cgxy+SAJyCkIuS7JhYiq9V9b03ZW/7ccllr
         pN0c3fWezUdc5YYZGDat625RKfSRNkpUkvXPBwVb+S5ftO1AHG0ekr6DR610exMsn/Bl
         SiC4LvPVuF3K3GeBb1GD77Sv5vvvXpbxutjQWEHIzG+15TG7Oa4R/IB3zV6KvM5VvRK2
         si1g==
X-Forwarded-Encrypted: i=1; AJvYcCU0HyiEgpwmckuamAGTSZgWBZzKinCss3Rk4LZO+Ij1CM+EwHTQSQkEDTikEvvu6AaZp7Q4T0fO+nS8w3o=@vger.kernel.org, AJvYcCUAs+W1NMRSkTAXbFyBvvN6lPPA1OcxpiZnXKJ7wP5d/DB15yw/x/8UG7izu/t3RapJHJmFLi3oVOMp@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi/d0xTvRzE75G03CRqiHnR/iIiUVr7rB5t8GVWoD01pPxnojA
	NDxsdGrXF58hypjQxRX6FTd8bliO4peoF/wCVH0ej8H8qvZ8nGu9
X-Google-Smtp-Source: AGHT+IEthLATbMCftKpOrMtJ9/0aEtBtHhs1qfQG6V3F6IPCnW/uoQbZv65X3PT85S54xWUUzcDSYQ==
X-Received: by 2002:a05:6a00:4fc9:b0:706:6408:7917 with SMTP id d2e1a72fcca58-715dfc7629dmr8905855b3a.26.1725047023387;
        Fri, 30 Aug 2024 12:43:43 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:79a1:1962:99bd:89d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e56d8827sm3117288b3a.161.2024.08.30.12.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 12:43:42 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] dt-bindings: input: touchscreen: Use generic node name
Date: Fri, 30 Aug 2024 16:43:31 -0300
Message-Id: <20240830194331.3774408-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Node names should be generic.

Improve the binding example by using 'touchscreen' as the node name.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v1:
- Squash the patches. (Rob)

 .../devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml | 4 ++--
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml     | 2 +-
 .../devicetree/bindings/input/touchscreen/goodix.yaml         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml b/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
index 8cf371b99f19..e4dbbafb3779 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
@@ -666,7 +666,7 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            touch@56 {
+            touchscreen@56 {
                     compatible = "azoteq,iqs7210a";
                     reg = <0x56>;
                     irq-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
@@ -704,7 +704,7 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            touch@56 {
+            touchscreen@56 {
                     compatible = "azoteq,iqs7211e";
                     reg = <0x56>;
                     irq-gpios = <&gpio 4 (GPIO_ACTIVE_LOW |
diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 51d48d4130d3..70a922e213f2 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -126,7 +126,7 @@ examples:
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;
-      edt-ft5x06@38 {
+      touchscreen@38 {
         compatible = "edt,edt-ft5406";
         reg = <0x38>;
         interrupt-parent = <&gpio2>;
diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
index 2a2d86cfd104..eb4992f708b7 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -69,7 +69,7 @@ examples:
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;
-      gt928@5d {
+      touchscreen@5d {
         compatible = "goodix,gt928";
         reg = <0x5d>;
         interrupt-parent = <&gpio>;
-- 
2.34.1


