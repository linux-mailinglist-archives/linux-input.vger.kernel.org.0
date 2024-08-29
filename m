Return-Path: <linux-input+bounces-5951-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A400964DAB
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 20:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E89371F21D3B
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 18:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B991B5ECB;
	Thu, 29 Aug 2024 18:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHepyKfL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7521B611E;
	Thu, 29 Aug 2024 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724956263; cv=none; b=L5PscVO7i1RtPh6Xhv3g10M9Z+G7Ek00gHyI5b1mrZzutg8XqcQygoe7CMZUFKwSy4Smt1MIAII0AAlsM23j6Yvt4/GgR9xbVR978fkAAAdO1W4KjaMkc8/PQQC65XoXEt4wAtyUejWQYl7fwF86HATps2PBFkW/mnUUOu6EzFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724956263; c=relaxed/simple;
	bh=0gxLRetappXTwMSlk1SRtYrSBfLHMdfH/oAdEg2A1yA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o3nAmmvtHf4U++HdpbHlXREQPTWZpYdLYbuW6bFRbfcI2aKURWcyCroG9IvojF8OUsbTWoaWq+kQX0wIOtlPVPJQPsmTZJj4xcJ4Az/v+ZFbLE+Kbxij+eyYhbBbbreYIfV36tvjC3Frce8GgG9RynA6BtefvYgs+m1WvtnfLfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHepyKfL; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71423704ef3so733598b3a.3;
        Thu, 29 Aug 2024 11:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724956262; x=1725561062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02oWoS8tqd0BjIjDJRiYHICEVrb1YkAWK6xvaM/1RPo=;
        b=dHepyKfLhwsSHJC/QBdoRRzlKsjnhoR3q+h/TPmeOkzZSOhs5vAjutpiHxJyQSB7YS
         5MwItL5xlpsraXyVqklq1Eb9KVk+ELefTy+TchJnxhZvecZjfIQZe5nqZcCXAXmmLj3G
         M9IyQoK2BaWD55ZTYJuS5RT4SL2fCxq6qdYvMKiByFpeZ5V5Z1jojDH6cSiEpXwonMq6
         UJj+6EbDdXP9QPgZYzdqeCEFDwY7E4adGDaY6tv7j9u+5h8XWgTL0orUGRerAhX6dZi9
         CwALuArWsSU6yOHO4CzTTRLNBXrQD7Q7PrTKZihRduzpbbZdOMiwdsLbVxWGeZ05iPaj
         EOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724956262; x=1725561062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02oWoS8tqd0BjIjDJRiYHICEVrb1YkAWK6xvaM/1RPo=;
        b=ihFQVILVPcfd8hB50UfoM1/9M/xQ4VHdgT038usYfnzBAmi75kbEzbXjZ9Lnebdrth
         2CDl/EqVHM2YfS6YVorPOwt9RzA4pid643j1LO52DxeaQFqE1mIJO9pAbUUArU8Jt8fv
         4ar95tprdmAsESaBkLW+eNLkm5/dvyq+kdg9I6DkNrtYSIY2tFZprOySe4IDXwpMlT5F
         XR4ZVYMu9xSdFyEBXhAfWDOanY7sQnai/6ofYSDMz9GkPOEI2ZqyC6koShx/Hsvx9UHR
         pjzHkhDgYGtbBBqjvjN/mcYaakTg4Eh0reIcbIgIwp5ZGkdxocUF3U0V3mzmb6UVzEZr
         0uvw==
X-Forwarded-Encrypted: i=1; AJvYcCUR8S2MqY72Dcc1tnQoxK1KEXaEYoD983Cq8B9nSrzSSfLb2867IqGFmBdwii4CpvtIk+wXtQGnxH3F@vger.kernel.org, AJvYcCUbN8KhuKRyXIFIa8bF6M+UVSVDLd/MGJOUCgqE1Revv46Yea45WCj8FBuhfyXaS+35nrh+3ptBd8B6gRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH9f6R1fMQDG+I6HFRxY2/kJFzWP6vjH9+wx6IEsLtruLemguH
	2P2yT5NPgIJe+yfW7PAsA7y8jK7rBcIayqxe86lMO8Q40/bST4oYk7vvwQ==
X-Google-Smtp-Source: AGHT+IFCi+TM+TdEIBg/OXGo+8PjjtmZ/MDuA01Si2k8dnWXXTqKwJnVtZjIwZhaLxAqZ/n0SMJ/kA==
X-Received: by 2002:a05:6a20:d707:b0:1c9:1608:ae97 with SMTP id adf61e73a8af0-1cce0efae07mr2947968637.0.1724956261484;
        Thu, 29 Aug 2024 11:31:01 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:adb0:3b7e:78c6:e307])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e56d78e4sm1431515b3a.163.2024.08.29.11.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 11:31:01 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: iqs7211: Use 'touchscreen' as node name
Date: Thu, 29 Aug 2024 15:30:50 -0300
Message-Id: <20240829183051.3392443-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

'touchscreen' is the recommended node name, not 'touch'.

Fix it accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
2.34.1


