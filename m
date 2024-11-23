Return-Path: <linux-input+bounces-8199-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E73859D68DB
	for <lists+linux-input@lfdr.de>; Sat, 23 Nov 2024 12:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56F20B2176D
	for <lists+linux-input@lfdr.de>; Sat, 23 Nov 2024 11:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AF3176AAF;
	Sat, 23 Nov 2024 11:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tquh4EFJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1522F4FA;
	Sat, 23 Nov 2024 11:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732361359; cv=none; b=qJ09po4XUQhYRC893XAOzOhZlxRpzTVXm+Ma0vyNBPWezMcbi/lj2JPNPUNYUgKhs2DkVtdih/0j+IKO8/aVI6jSFa06eP3MML13f+D2Npv+MmCqXU9wfSB2ADFqeXjA4jpQ4eEhIoB3Cpw+dEvakLzfN0fNVGT57LXxRSe2sP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732361359; c=relaxed/simple;
	bh=Ki20cI8ZyBHp724TPkTVtVHSiOU63Gz+hpGQwyAufi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h81hFcqTAPLlJCTb86zUgjlA8STJq0d3tR7dtSSMAAto5H9G0jGGFB0mtbQtP4C+yT4tfc8UD5ENXu3IsRuzrZRJDf8hsmHo54RVBYrK9be2PPuciiMvdN6ptvPgF/VTprJ7DdhuxO+tZgr7tdCFo6JnIfs2bOHuck7/DnrdKcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tquh4EFJ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ea68cd5780so2526728a91.3;
        Sat, 23 Nov 2024 03:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732361357; x=1732966157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZEWgsPrytcrqYA4bO1VsXzllLQymLr9lNKwtdsQN+w=;
        b=Tquh4EFJYq6A2gtA0ciw4UnQ0uVjz7rYGMvG1o/SSjZY43KjONjlH+/ogMGUAHI/5v
         iCBatthC2JV4jWKEwYQCPOa0C+B3zP1Yc9DIuJdSWMm7dqalq+gQBJRlTgUkTtA+kg+H
         nMJyLzM1XLHH8B4/CySqS8huJjbDZ0YrtjeBvXqF7U/IDqJtSu+aMIvAIO3kQrtxqpS3
         SJP4asKaIignuNySu4I2fcfezfAPc03Luir89FSc6Pg5GpDEm5CAUl3YEgXJgTEOZYLB
         4Lucm0klB8ZUz6eQWkZn1+bSvN9us5+F+F2IyDGF8sVTwi6yJbVbE+mrQki8vvFk68PH
         kxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732361357; x=1732966157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZEWgsPrytcrqYA4bO1VsXzllLQymLr9lNKwtdsQN+w=;
        b=oMiKdK7VHBlzFcIAblgic1wo5fM9dJr99DgqrEVz7kwzO0M8qrGh3WRb/CV76K2d14
         My5zzAnNcI7dM2GddIe3BjUCLSSayjr/k7pUzxKS7OXFVa4Ex3Bd3196EUR1euPxb8Oo
         BlnWKsgKBV/bfzQSQmbGIipQDLfW1ckNjo4/Rzb6WG78PO6mzjiu4FESh9fMO0meJ/XH
         00E11Jxk2/nbJ/m4ARQrOk6TgXZFrwFUQDXPNlMfpjrvl5wj3+PgZJ/XKk3/8YB4Lb54
         3zMm6WF8i+GotO/d3ljCRMmY6bNHQarOvkVcrWHSlasp4ytKe1sBFmkNcOjw//IQQY0g
         gO+g==
X-Forwarded-Encrypted: i=1; AJvYcCURk3aGv99PAvnJZnWEsRXup+h0CHuCskAYGniPWbE/54DFoCnruslKbeXhr5QvsOYpwfqprJRq8/Pdjls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwfoqr77ODao1vPxVb1YYF1+c2h6aGpKHDRgxd0hVe+AL/hiKv
	XyWJRDY47W0vMe+enQlgymtlVwU/kHerwkkNkzrRx8oM7mXOnq4f
X-Gm-Gg: ASbGnctR/pKz9EgroZFdVwnnxRBc0ChtVR8o65t1VVGVhm1a14WM5Py9QjfAvrg+Rh9
	AZcgmoisy0ROo/Jifmit0cDaR5VqUQyHFt39ouNNVGfRM1Ntjgk1/rIGqnn9sfSfVRx34T8dXLT
	Lt7HoCwQRbcNedG6SZ90PraYmrQlzyIEMnKnQ58EeGkII/CjMHaEg7nxcSKak8T7leiSdh2iOar
	RDa07lYwU2P/bDgLAgVNXgzrWGPHvx5nLGPTFdJ8tvuCAyIyyUwY8KBDWmOAmY1iV2aGhAC0qyB
	yVuKQE7aI97mG4zm1t6N78yCIbNP3njk
X-Google-Smtp-Source: AGHT+IFqtFUtjes0k5g0Gjl2qtEijRxNOC/R+dhCwlrAGMyYaof/fqlscmAxyLa4StFTs6HctzgZBA==
X-Received: by 2002:a17:90b:17c9:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-2eb0e234c02mr7354722a91.10.1732361356956;
        Sat, 23 Nov 2024 03:29:16 -0800 (PST)
Received: from localhost.localdomain ([121.241.130.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de558bcbsm3102902b3a.152.2024.11.23.03.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 03:29:16 -0800 (PST)
From: Nishit Rao <nishitrao1011@gmail.com>
To: nishitrao1011@gmail.com,
	lains@riseup.net,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Fix typo in drivers/hid-logitech-dj.c
Date: Sat, 23 Nov 2024 16:59:10 +0530
Message-ID: <20241123112910.87829-1-nishitrao1011@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change spelling of doesn't

Signed-off-by: Nishit Rao <nishitrao1011@gmail.com>
---
 drivers/hid/hid-logitech-dj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 34fa71ceec2b..b7d15859b2ad 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -534,7 +534,7 @@ static const char hidpp_descriptor[] = {
  *
  * Right now, RF report types have the same report types (or report id's)
  * than the hid report created from those RF reports. In the future
- * this doesnt have to be true.
+ * this doesn't have to be true.
  *
  * For instance, RF report type 0x01 which has a size of 8 bytes, corresponds
  * to hid report id 0x01, this is standard keyboard. Same thing applies to mice
-- 
2.41.0


