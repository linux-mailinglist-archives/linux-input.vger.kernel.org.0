Return-Path: <linux-input+bounces-14262-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE36CB324A2
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 23:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B2F86237AB
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 21:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E10C221F09;
	Fri, 22 Aug 2025 21:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjP6CzhD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A1418E025;
	Fri, 22 Aug 2025 21:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755898385; cv=none; b=piTV2wxbzEApeNm2M33OoYwEIAcPyRY6iPBFbmD8WJIuTUW34Pbffd7roHZ3tNbWwglT6kZsVOf8C+nQzjlmIG4pKcg9fD5yLhRK8KkrdqbUbXkdRTImtwcN5tuCcfNejxDFP/YQygIw8irQEFbT+x4GWYfVYEMjZM8rKOgYKLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755898385; c=relaxed/simple;
	bh=qc4VtCzC5iA9jJFQPDwUr258FyQvh0265IhdsBWV9nc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tTLXorpLYOLUTagEgmwWrz2Z3KuEPH64f+49Sx0Z+P/KwDlGId8xOVfUK+zNvR1qsqzGlhcDKd7Etg6HK3YmeRHtb2TtlXIFVioDSxTMEbrJOaIlXRJdrdtkQ62AgMveWzJljsTo6Hvm6uIQ5tEuODSPcH6Kz6KFfVjVJ/xsJxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjP6CzhD; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76e92b3ded3so1323234b3a.2;
        Fri, 22 Aug 2025 14:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755898383; x=1756503183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cbxUDYSkcfSyuOmhdt6DxCZGSkJMa92pasDj2sJtI7M=;
        b=JjP6CzhD7mwovwFR16isniz7pu7GNbcOCBte+ZNtRvCKDJ3DscwlpafghCBBxVscFj
         OPm8IOphniTdPOGCSmUfWAksBktDgrUhObh2EkBwFqXI9jhkC5C50Ij1qaChgR9Ve6+V
         OJXLgAWaRT6MbUSbqaEpVby82m4/gPGgtM4WlxVXS1VFZEQGApKH+oSGuxQ2JeNkXpVw
         ZG4P0GD7/ccwftfm3zVxFCc1uBPsA4rmByp5eDK23zHNm8syH5awAmj24rzWkZyJWqSD
         PZ6OKIbN64XxjmDxdRFyZgJj4InE/Btsga66ysT8R7a0kEeENcTxhbgnsDBXIi/CSv6B
         82Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755898383; x=1756503183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbxUDYSkcfSyuOmhdt6DxCZGSkJMa92pasDj2sJtI7M=;
        b=XyUeKoVHtWK4NqGbEqqUEzGDNI/5JGZ2XmM0jM5EKXrr9PwP//m1wh8YUlpUCTo3+e
         UfOwCkgUgxlxwt1tFD13jx2GebTO/s9eEdRCnoaxFHpj0KkKa4aIHlVCObGVIJtIqT/5
         o3ZTGqh05ojIR6EEgcliHrBUM1LfFvSec4CGOmZDqmVw1rNzujes1Q6rI24IOrcPXuek
         5nHIrKWqRgfS/2A/1DG0BANstzyfL4PU/GDS2ri1pM1h2N/wdATFqUUJ7pXPhz6RUrDN
         7GtxRUblf/EeZQJweC5QWSG+8HMb8fIcaGEQ9ia+RfiEtsgyWaNu/rvpnKBBgfISSqFC
         kG8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyJypAzF/vqLCA43e/hip0IZzyGZy/F1rOV7soN3PobHr+PmGXp9/dc8MoOw6+dG3Dhxsvtc9HlTHHzVQ=@vger.kernel.org, AJvYcCXb6UjFIYeZ9DXA8w7E4IpIVXNg5SnYazNUrO3F6gdzqi0zm8jBQXIg7dLBzEAy+8L4EhVvjZijLrtJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs5ORHD5XsMvppbJhKtldT+6C8TsyJVNpXXqFIxGiAITHJJfyr
	6AUk/ueoDCRenSWNM/8sGKlvRHT01bby09Bpi4qN1VLjJemSZvcvD9xV
X-Gm-Gg: ASbGncvHkshGybn/iE+oo0flgMGVAFnqwMr8DGm9knO2lqiWp5JDKv7ma9IyznMQWoK
	PTw8hW5I7eZI7Y1/jx8PMz9pi0iQ7W0qIQc++6F+AyUtbtlSRdbDPSH5kZyxxKuSyXeWziTnR3h
	YdoPYqzUUaOihDbFzOJSzi0njfW+CIwaKtgiwe8wuBiKv/KtYfCOaTVjHLaLLOhOUC5GEj2L8Mr
	Hn0gwWLyzA10jRnlEwUVBYKluCMvIGyRcN2t3RiwxA/I+HfqRUqA0lEyN1IgN4tqdDfoe3IYU4e
	K11ljoCZRhP5rYHUH3SXDQBL4B1dhcnTIp3GnzLuffKx/EKs2taXbdZCjiCqk/jWAYhRjrUb0Rh
	Q7TdL8f+7z5zoPY+VbF0VdcdDmC0uPz1HBu4mcDK+zCZDE9w=
X-Google-Smtp-Source: AGHT+IHIKKRnxk8kUwQx22V5fjRik2AjaNox9iWdfVwvg6WufzdjdyyHOO3jB3+yIyBtgLXaolbrqQ==
X-Received: by 2002:a17:903:19ce:b0:235:eb8d:7fff with SMTP id d9443c01a7336-2462ef1f70amr57820005ad.28.1755898382592;
        Fri, 22 Aug 2025 14:33:02 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5ae1:41a6:4f22:1c64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466889a088sm5111305ad.134.2025.08.22.14.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 14:33:02 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: input: touchscreen: tsc2007: Document 'wakeup-source'
Date: Fri, 22 Aug 2025 18:32:45 -0300
Message-Id: <20250822213245.125901-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'wakeup-source' property is used by many devicetree files and is
also supported by the tsc2007_core driver.

Document it to avoid the following dt-schema warning:

'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/input/touchscreen/ti.tsc2007.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti.tsc2007.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti.tsc2007.yaml
index 8bb4bc7df4fa..2a225baeb1a9 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti.tsc2007.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti.tsc2007.yaml
@@ -26,6 +26,8 @@ properties:
 
   pendown-gpio: true
 
+  wakeup-source: true
+
   ti,max-rt:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: maximum pressure.
-- 
2.34.1


