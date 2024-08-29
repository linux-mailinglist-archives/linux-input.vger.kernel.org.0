Return-Path: <linux-input+bounces-5945-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 013EF964717
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 15:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0FAB1F21F8D
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 13:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E3E19FA93;
	Thu, 29 Aug 2024 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEusvmxQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2300197A99;
	Thu, 29 Aug 2024 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724939100; cv=none; b=VzLBgIKx8crkDMmpXn+kpVQBlnDYY6Rkwsw1hIIiB9bNEKTFgaK+AJt/TmbcOmCJoLlV9xRau1whugDKYrxdhukMTlrOEHB8o+cxtcVpYsrPXlecjSFrnX5mxIP7IvPaJSD6DROEjnI4sTOna8XbzZqdvk2DRLII5ZweaTRtEeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724939100; c=relaxed/simple;
	bh=bF27xFeV0+twmQMvmY/FDj/meChd84h21UG3lXSJwtY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LbDyt5WQCqAdrcKbBtizz+rBQPxl8Smnpq8UtpKOcpJ8glOnR08rg2vzJOX2wc0lubwad/V4ZsRkg6KS318vutf9MvYbKUlCYJffuZS/Hg0dUng9gdmZIwv4aD9on05ErDqWC3UI54Y5d5UYIM872HfLq3yUrHeC6N7t4643rqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEusvmxQ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d3da054f7cso484529a91.1;
        Thu, 29 Aug 2024 06:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724939098; x=1725543898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WOaSQEKKrU5OyPKF5Gs6HDIxnlDFFVnwUzpo8mn71QE=;
        b=JEusvmxQnS7sHmwnp4YxSlECCz+J0UT18M+y8M/RVk1APU634XVzUJEtXUaGkrvvCX
         UU6HGbzRPP1hMjbtor0kR6kW7wBoHYhMxXmljtvSZf+GLtL8P2JVmAMwqOLYu58QOA8W
         7DIqBjhO5lFwpvbkqsXuQxDJ9wNywYhVeu5dnTHrHLW4AhURS9MASlMdYCAFFgCRxcCv
         vNPO6VaJ/QV9cdVqEdcELO+owR+YtlJrMPc2p7lZVKlfrRrD2ho0bGiQ6X0yiNGTf1j3
         xa0BaSXO7XalHe68MBxCHWalOFZjSHxgdq80cq65CHHAoFUYtbndUZu4yJaLrx7vHFwG
         wgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724939098; x=1725543898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOaSQEKKrU5OyPKF5Gs6HDIxnlDFFVnwUzpo8mn71QE=;
        b=amoGDapc7smyM54YfRBDOHA6rX7bkC7fRsl2tlFRwavWyTyEq8nXf11bBLc7DiBGhm
         8T8AYIsidlhFqoDShVAaPL7IIU6++v/e7Tpqe56HemaQCO3v7oMCfYP9hELiHwLVlzeL
         0gQV3gAxf4IUtSBk9uaHh8181eL7oQvlDZq00QQx4ydnosyb9d8D5I3nU9wMAmHPCfyY
         Rc9JnongjEL9/5eUUhvE+Hvv9qlZCnVnRTUlSjgb2qvs6IdFOnYMSbBBQ8M/Q3223UgQ
         TJqwYR+FeXXbtpVhQKWq1GgzUJiURi8DPTAD3LWc9+qLvhe0i8JnwdP0flAAeRbRVMfn
         6RnA==
X-Forwarded-Encrypted: i=1; AJvYcCVumhb6hbA3lDy/XxaRo9OwYA73aC6fOd22VokNAXiNVe/DS3iJkb6bzU6ZcALbR6Us9lMZLP4o/3KwWKs=@vger.kernel.org, AJvYcCWZ+NF3hmaJcNhW0UCBXaEseL3m0O30hi2WZeHDF0mQ9ilovjWUgLbcgXvjsNo8OozwNyTeHt8sc+l/@vger.kernel.org
X-Gm-Message-State: AOJu0YxfrG3HlnpxESU3+4UTlkZpVMHQqbk3pptX89QusJEFoSxXkNXd
	fOdbeAY/0n5AlgHHJPqkzl+xdkm8lLCllpWa2QXiF6Ey7I8VtAsv
X-Google-Smtp-Source: AGHT+IF5ijy2v66Yd+1pnqkxvSU5MZZZ1pmr7Au2YyFsQfwCg2R1FM24YPoxjxRF25tjCILkfTodYA==
X-Received: by 2002:a17:90a:8d15:b0:2c9:9658:d704 with SMTP id 98e67ed59e1d1-2d8564b3683mr2426460a91.40.1724939097787;
        Thu, 29 Aug 2024 06:44:57 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:adb0:3b7e:78c6:e307])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205155658dfsm11381935ad.297.2024.08.29.06.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:44:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: input: touchscreen: edt-ft5x06: Use generic node name
Date: Thu, 29 Aug 2024 10:44:28 -0300
Message-Id: <20240829134428.3347075-1-festevam@gmail.com>
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
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.34.1


