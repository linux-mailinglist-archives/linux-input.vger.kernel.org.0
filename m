Return-Path: <linux-input+bounces-6300-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9933970864
	for <lists+linux-input@lfdr.de>; Sun,  8 Sep 2024 17:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F384B20DF6
	for <lists+linux-input@lfdr.de>; Sun,  8 Sep 2024 15:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04C5173345;
	Sun,  8 Sep 2024 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHotEJL4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD5AEAF9;
	Sun,  8 Sep 2024 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725808695; cv=none; b=OJxqSMqexe+Q41/5QXO4uhtxA6TwZzrSwtQjRZKH1Pse5k83HDm9HbTgpnIY95CzG1V4O5w4wKqG2eSRA/6f++nIML0P19IvCdwfneJA215ovbPpWo2npjPWdzX6lTGJTS33HfagNNBpE+e16B1p/b5a/W4med0XBwuJ+8toPtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725808695; c=relaxed/simple;
	bh=HetVwA2icroIjaoAACllYQdENIflDpr1iRlBdiqUea0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lyFxNiWXn3lpWEXf2fiXEyczJQjIF6B8LNhKwmwy5879KX79ExAEioFN0DWRi4H4p850U2b3OHd3YJWBbdKcf+BVuAIjGn8qv6TALyGFm9iFC2bnU27KOB33dPIqPa3fUXapHzRQO+ECVzVaQF5hU+Wed78eyfqNmR9RthdD6VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHotEJL4; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-718d985b6bbso1868312b3a.2;
        Sun, 08 Sep 2024 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725808693; x=1726413493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cZpkFOIc5/0NZVjzEtOpjFbI0AWB4oMd9gmLouDFEeg=;
        b=IHotEJL4HY3rnpW+jFKEmP3sKEUwYRLD1jHHa31qL1Zg+4Bwq136XzQ5dHHe3Lq0jo
         uViq3dIBD15XHfPVI+tYPEYDDNi/Ugo6UPorpDK9R4Mul/xcsBd4/UlCyifO3J6Yurih
         2szgK8ImvpXbVv0Q7LPMjbA2j+/VbAG5IjTyQViStAm/N1kl44n96VaUKoy7Pe3uZmZN
         ss9iP+oKrEmZjRD1vo/8nNKhgPozCB7RAvjchKnScQSl12jmTBbZb6IewLYxIk4yTHKQ
         5a36S2Asf/DetF3hqverrKyogzHAEZzoPGYjxafJ68Y/dSgnuflkCvXXoInM3HRb9/OQ
         I5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725808693; x=1726413493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZpkFOIc5/0NZVjzEtOpjFbI0AWB4oMd9gmLouDFEeg=;
        b=cYZlK37pFpiKGudf7vlNDpbj6UroJVn5Znb4wN2CnsdtZKAmuIgfTejva20lMOS4AP
         h0zP7rrOmY5NIZD6bFiG0ssL5P1AaGaQoYBVIhZcf7odgLOISPsNq0w3CAcTZVsJO/Ff
         noJ/NyDMfmbnv1a+PErjsbCR50fNK4Flsh1ree9s9I9yguzSF4W6cBDnP/Um75ixsnHo
         6td9mb0VN+JZ2cHo45QIcU5xUSGno5Q0kHchvZvYLjRMnFX5x1QawWExoYDkkp3Nq8Fw
         GOExdcjaasnlw7fIDwoHeOdj7F6oS+K4lT25hzvJQhPn1kW+KhR6RU3hr/AY0/AQTmQu
         eDGA==
X-Forwarded-Encrypted: i=1; AJvYcCVv7Wj4OSS0HZX4wb02vHq4IMWEm18cdNkkwgcEbiLIm/v0hnI43BNW88+VjGqFOTeIEfxq0LwTq8+nKg==@vger.kernel.org, AJvYcCVvwfKdO3x6gpXpxj1Jm+EUsdBmmCwqjTk0unC+1JAZq7A6hT+MbH3Gpm7HeTL5dk+FWeKBgnc2VMyx9nCz@vger.kernel.org
X-Gm-Message-State: AOJu0YzsV/s7BJpnTojqeZve9DWwF9dQwB7NHyTDqEHF8TbIYLOLcRs8
	QxxSY4fEOSiLaeLg9d37VGTZ02Ag9fDJu3UyGXsjKyp7u8gBLFtBjcqBGURHvXU=
X-Google-Smtp-Source: AGHT+IGR61g7iCGyQpL5P0HJuPGkQYU5vhjGLDzD63FYU3Ri0vLjIEuowo2Fdledz7GNOA4i7PVtYA==
X-Received: by 2002:a05:6a00:816:b0:717:8cef:4053 with SMTP id d2e1a72fcca58-718d5e9028cmr11064320b3a.14.1725808693173;
        Sun, 08 Sep 2024 08:18:13 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.172.39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e5982ed0sm2231777b3a.148.2024.09.08.08.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 08:18:12 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: devicetree@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Michael Welling <mwelling@ieee.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sayyad.abid16@gmail.com
Subject: [PATCH] dt-binding: touchscreen: fix x-plat-ohm missing type definition
Date: Sun,  8 Sep 2024 20:47:43 +0530
Message-Id: <20240908151742.2453402-1-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the issue with x-plat-ohm missing a type definition.
The patch adds the fix for this issue by adding value of this property
should be a 32-bit unsigned integer.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>

---
 .../devicetree/bindings/input/touchscreen/ti,tsc2005.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
index 7187c390b2f5..98ff65cf9f9f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
@@ -38,6 +38,8 @@ properties:
 
   ti,x-plate-ohms:
     description: resistance of the touchscreen's X plates in ohm (defaults to 280)
+    $ref: /schemas/types.yaml#/definitions/uint32
+
 
   ti,esd-recovery-timeout-ms:
     description: |
-- 
2.39.2


