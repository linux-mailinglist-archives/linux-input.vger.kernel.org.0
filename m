Return-Path: <linux-input+bounces-17186-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C923D39946
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 19:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDD6F3007E56
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 18:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF4F2253EF;
	Sun, 18 Jan 2026 18:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHUBSdX6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B029F1A316E
	for <linux-input@vger.kernel.org>; Sun, 18 Jan 2026 18:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768762702; cv=none; b=b4VfA6MFhWGSEXSLKbIQnxrnahHdNdyhBz0tGHY0FxcTm2kqXczu650JGtxWtGMaLpIXg2Wc/8UdXgq7w4rGzFOMETuI4xvHpFOKBXdGfxI9EnP4EvU4WXlnlWza+5CTXpyC3sYhVDR/fYyhHCDnp1zMtwYEIEyqgeCDax/+55E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768762702; c=relaxed/simple;
	bh=K3g4zXNYPfFa38PaoUP02463HVNNvfnQe92AJlycLi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VwFx76OaDPmuXsbAPCLhBUsQg9PBzL0FqJ2LLnfshuUstvNumlj6n6bzFg7340Kl+V3a0pERs5BDtQFHtXbFN6ZgeXDjfce+6k5v5d4dNAx3bgdlTA+xbJgu5YlxcyXknpGydvdWmuhKDlYzRYyV+VQWW4FD6Xk9W6bxI2IfJFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHUBSdX6; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c531473fdcso506273885a.3
        for <linux-input@vger.kernel.org>; Sun, 18 Jan 2026 10:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768762700; x=1769367500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=01hnEUnZiWfJBYTIMM2/v6sMYUFejHU1r/IOduN3of0=;
        b=LHUBSdX6CiJwf2ZWxHa7fPKSUptlqxT91ZGFRwtmu3LMX8u86+/94uR82mp5fbZs/2
         Db7D0MmVZsBKRGKK0bY/SijsGPTIZXPgrzcZTyM05tbskkU8DF3qN6lSqhJkT0iIr6XQ
         LnLxIt5t0V5uPQhK1NkglR0bsPxoONHPh1L+lHesfDQLVOmHveR8Byv4+sxxjPyHKt3Q
         De3SIUhrEQpnnGE48v9+I+H9PlhffOtPNeDSZGvHZMtoxnR5FdwPBpVg96KtkIBGbl4e
         tVWGa5GEHCWfK4/crcBJrEpZmt0llaBK/TaLgGOxhFHbZWSGOLI+zmVRy+hnHAN9CuY4
         78Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768762700; x=1769367500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01hnEUnZiWfJBYTIMM2/v6sMYUFejHU1r/IOduN3of0=;
        b=wkelflvCDcqpJeNzOUCKXEzpq3bQh6cZ9p7RFOmes8QUkVvohE65K0z3TeiqPLgX71
         0kAnGbeWmRr/Iev/ZUtDT5cfxQ7ohh68tVtUPHn4QTOeOlpPuY1l0dywOGesppFAn4kA
         vIdn1sgDdzixYEdp6l7OaSNRgY7jCarPFxma8wk1ah//vqlSLrLr/63oEPR09qauA/l5
         uI5wv6FJOn93NrGVQoUYbDhM+nqglzr2PaV2bVnL/8KDf5nm8YziOtn9jLaOK2tCjPcc
         bFbv5G+pKXoJSGcg8QTlHkFP0rb0KX42qhJ16kQDz8Xu5cfN1Pjo3L6SsHGl2MAT4VFl
         KjHQ==
X-Gm-Message-State: AOJu0YyUOBebUBac8VZn/Y65LpZudtDBbZm6kOhBgk8mHKH92JlnZaZY
	2eFIY/9tY21nNKFtRa0c4DAi8IT8cqygxYWG9AMJIeDNYm0WVAz8Rjo=
X-Gm-Gg: AY/fxX6G6L+AfiG86GuA0n77cOOrdSf/myQe2EPfx81VmgSbas5yE5LOlZnnf39aYqF
	y7iqSgg6NQs6PdZzP3/EtRzMllK6wvINlfFH2CeuySB2nKMD8lzUuj4ITNqkY0nZ14tK3nO0eix
	ZBgHxDCbVw81+1pnV6x1tazJp5NG27XzedCIHqqEQWKqNVSx2vOCy9jHAC+DbQO8LdHDSqCz4MC
	TeyFh3mpLTvAS1C2YdOSVN3nqT79u7tPwIyyBc7j1EmJp3EG03NT+DYjom7PC0qw1uwgWQhUk4c
	VFHGk2NKsi4vQ0acgvg4c7Syk6hz6YHrWs5sK66OEgg4P9zeLFniWAWub41uXKNDH1CIuQniFeq
	IanObEAt50ObNk3ZhoV96suilh/SZ0JCGaSamcMuBTR0ctvxbPMgQ+vkSpdA4OXfJafTE11Z74Q
	2KNKY=
X-Received: by 2002:a05:620a:2944:b0:8bb:26db:e22f with SMTP id af79cd13be357-8c6a6909543mr1206597085a.30.1768762699666;
        Sun, 18 Jan 2026 10:58:19 -0800 (PST)
Received: from huis ([47.189.94.147])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72602fesm651238885a.41.2026.01.18.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:58:19 -0800 (PST)
From: Owen Giles <owen.a.giles@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Owen Giles <owen.a.giles@gmail.com>
Subject: [PATCH] HID: corsair: fix typos in comment
Date: Sun, 18 Jan 2026 12:58:15 -0600
Message-ID: <20260118185815.14237-1-owen.a.giles@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in report descriptor comment: "obviousy" -> "obviously",
"Magimum" -> "Maximum", "poper" -> "proper", "due Logical" -> "due to
Logical".

Signed-off-by: Owen Giles <owen.a.giles@gmail.com>
---
 drivers/hid/hid-corsair.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-corsair.c b/drivers/hid/hid-corsair.c
index 62b99f5c3cf8..e11184cec551 100644
--- a/drivers/hid/hid-corsair.c
+++ b/drivers/hid/hid-corsair.c
@@ -681,8 +681,8 @@ static int corsair_input_mapping(struct hid_device *dev,
  * The report descriptor of some of the Corsair gaming mice is
  * non parseable as they define two consecutive Logical Minimum for
  * the Usage Page (Consumer) in rdescs bytes 75 and 77 being 77 0x16
- * that should be obviousy 0x26 for Logical Magimum of 16 bits. This
- * prevents poper parsing of the report descriptor due Logical
+ * that should be obviously 0x26 for Logical Maximum of 16 bits. This
+ * prevents proper parsing of the report descriptor due to Logical
  * Minimum being larger than Logical Maximum.
  *
  * This driver fixes the report descriptor for:
-- 
2.52.0


