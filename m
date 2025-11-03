Return-Path: <linux-input+bounces-15872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAC0C2DAA4
	for <lists+linux-input@lfdr.de>; Mon, 03 Nov 2025 19:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F2424E7B38
	for <lists+linux-input@lfdr.de>; Mon,  3 Nov 2025 18:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34A1288C13;
	Mon,  3 Nov 2025 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLaFQgOH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7BB28D83D
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 18:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762194361; cv=none; b=R40TJCmhCOzpRXAWvPeZ0Hs5xJYK8yl/jibQjspjegBiEpYWTHtQ3uxUiY/AyKAOXsfzAhv84VlGJyaZfU42CTIio3ptetijXaXRHH7yNwpcyRyM00OYKSMlvqhKgwgVBaGBsNphncCg3BRX8PIqVcvIR+NSp+IbKPDoC3Emb5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762194361; c=relaxed/simple;
	bh=m6030Z4iV9Dtls4TJA5XNKTsLfZkDJds3EJDAH+jgdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L6z9DWbbk5bSu/icute+UbapgdtZ+Cr1ea61RE+h8n9IKTdLjWYY38pl8Vi1CjICI8yy3oVzWLyvKytgkR0+zVNgX2O1NaDme2FYnGGAZayJqAVAGvZ8/8vViw2zyVY1/YqwJx9vIcTihFkyX9gmhUsqz84YLfTPZTry5H4Fbk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLaFQgOH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso1252389b3a.2
        for <linux-input@vger.kernel.org>; Mon, 03 Nov 2025 10:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762194360; x=1762799160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bku0j/4uZiPLjuMlogDephhpXZLra5eLiNfB221gaUg=;
        b=JLaFQgOHLQ7VZGjRb2MfLlM7UZxTxhNjBhA8yasw6VX8UenicCT6s1rISsBN/rdiqe
         s9zuP02c/wGhrjlIzn411ysdG03Knxlt7HVHzoeZOYM2A4vgQLBE4ocSYeE8y+GrWKyd
         MqKtAgl5Di2XKWOF2lQb7C0Hqma28QPGtFPacv695gO4G2UpBxaJRzPqM5QAxYxmcvku
         LzPsb0J6Pitjem8jT61mkdxiAtOa4dVc9FwklMCadRFbHCVKjjDvN5BZa07c4ZZlsgfg
         +XPBL4606lKV46ixgAOr1Iypx6X7DevrVrG+JBYHaIgKG2de7qpPonAeLswjYEVcUK90
         DmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762194360; x=1762799160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bku0j/4uZiPLjuMlogDephhpXZLra5eLiNfB221gaUg=;
        b=KL+Xpwf6xjWjHmjdtnOt/yqEH50T89eC2BZh+8eFwAKaPHcB4xH6kK7UhXdmRzQeD3
         P6QvEGf7jHFL961B3TZv9sN1n8ql5v5NZIbRR1S1G3NPpUPl8xEa5gpCboMFFAgbpr1C
         30tQmrxAqdLbY2KKEq+ufwzr4QNqsP94eHHK5PImbCFFkEjBuxb8wryKifbGvSidILi3
         yeKrucJ0RLdaeG8CErKC1pzKmWevwMd/vQKKVNsVfaDPHJbYq4LOLxmWcjgw8NPoHjM5
         tAUpBMdplJxLn5+iDEpOhmRNpF9w7AsGAWtV+d7WXl7gh9ESXUuS3haJCya/Qg2f7uzA
         5Tdg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ3bXOXJbbo0tpVuH8qUr4Y1EADFPort+gvANyce47XTb0HhYjqkHPziNbrkmrJ/m3eh8fpVIi3hfZ6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFsxq+efpBccpnbD+la1v9feoTApVCjUjyKQtSxLQULARSphu9
	23MIxCiQoRlbge812Tmv3GmG/UU60LoJ9V7q90mXPWWRrUB+5kYG5JjJ
X-Gm-Gg: ASbGncupTyLb9jHA9jVB/ATqh4XqPl3n7aHEMp1eAbmr+XsdBZuk5UypyOOBPzUcDd4
	ByDp4TCzj8gPUruU+w9vMwdQ6Nn8RflCWD30i8Nel6u1NyfN3Cb2vI/EIEAKu9t0mvito+SmT30
	4VYFJdmQGjuftMWRcmzN/PL10PhO/0FNGAeAACIC6UIEAV6YeJ6YkioZKlDSuBaMTn7OWzTK7ay
	S6hRVlw2ipCS3PcblvHmtR7jQyGLCqD5MJ4RVeiQjUun2P+lZZGH8StgKW+omqkGfw/mcTBhdpP
	hKLaBX7mDAFUtZUtLiGW8dD4gzYAemPealrDLoZmRk7rGerLQOATf3huhZK8Qmu6BFzSlnEfaHo
	ozeew34OClN2YOypcVMWpkLfh65ynOzCA8EEiccqq1rpcR6NDjr8KWFWSs1w7qAfdeIYp6lKHC8
	0fJCuK35SCu2SXuXsSuFyeklYfKrsASn4BS0+zcHAB9usp98QuEpob4y4Pj/TOHuJpYZ5v8z8R
X-Google-Smtp-Source: AGHT+IG6wo2PxPEUOSmTABG7eXQzl7e3Do7qYLNg+C+fm5dc/1Vxej4dPh7daaYf/VP+OE99bzrkkQ==
X-Received: by 2002:a05:6a21:99a8:b0:33b:5a3f:3cbe with SMTP id adf61e73a8af0-348ccdfc7efmr20830416637.54.1762194359453;
        Mon, 03 Nov 2025 10:25:59 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx.. ([43.224.129.80])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bf44dc8esm11042975a12.35.2025.11.03.10.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 10:25:59 -0800 (PST)
From: Atharv Dubey <atharvd440@gmail.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atharv Dubey <atharvd440@gmail.com>,
	syzbot+1018672fe70298606e5f@syzkaller.appspotmail.com
Subject: [PATCH] HID: mcp2221: fix slab out-of-bounds in mcp2221_raw_event
Date: Mon,  3 Nov 2025 23:55:44 +0530
Message-ID: <20251103182543.42451-2-atharvd440@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes an out-of-bounds read triggered by malformed HID input reports.

Fixes: 3a8660878839 ("HID: mcp2221: add support for MCP2221 HID adapter")
Reported-by: syzbot+1018672fe70298606e5f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1018672fe70298606e5f
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/hid/hid-mcp2221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index a9fd7648515d..c97f0acbac8b 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -945,7 +945,7 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 		switch (data[1]) {
 		case MCP2221_SUCCESS:
 			if ((data[mcp->gp_idx] == MCP2221_ALT_F_NOT_GPIOV) ||
-				(mcp->gp_idx > 0 &&data[mcp->gp_idx - 1] == MCP2221_ALT_F_NOT_GPIOV)) {
+				(mcp->gp_idx > 0 && data[mcp->gp_idx - 1] == MCP2221_ALT_F_NOT_GPIOV)) {
 				mcp->status = -ENOENT;
 			} else {
 				mcp->status = 0;
-- 
2.43.0


