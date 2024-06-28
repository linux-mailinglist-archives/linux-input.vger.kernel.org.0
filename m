Return-Path: <linux-input+bounces-4715-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81991C941
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2024 00:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E2FB1C22284
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 22:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0052F81725;
	Fri, 28 Jun 2024 22:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOeHdQBi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95678374F6;
	Fri, 28 Jun 2024 22:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719614859; cv=none; b=lQ6nejEofnEJJzLtanJStlN/n1uBiASGz3X03PmrSL66DrXqNpgqb4ZAxCp/w3fT2G1c/u4Uyo0B7kOeMeybQr0oq74HxOxKbybfe4wWRQuHPBebIWvrcaWt2QYXd4e/cuW++KHiH4YcdZUvH52Z6k9OIKU4m9Ph0WOLKjJ3uaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719614859; c=relaxed/simple;
	bh=VjjujlCVFcHz2nze48uuOYdNp99HkR1aJ2t0p77G3vo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ifVewnjoagr7peBl+ckAThNzgWhQYKxjC/bJyUTQ7uOn/8OzAqpWKUepB+j4Obmq9f8SsOCIE+BKI7W4KSgdXwNJthxOH0qGleoZwwMAVMPaQIG2RegkdMNaeSuU88FDSK4U7p3sXH5o/Equm6h4h95YvDZIsOEz9HUEaoPo0zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOeHdQBi; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2c70c372755so858680a91.1;
        Fri, 28 Jun 2024 15:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719614857; x=1720219657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C65iYCiYAPW1ZdKuKBfIjw9waLCg7LXK5ZuuXcqO96E=;
        b=HOeHdQBiPlFUtYwThxvqFZ7CNuzVcdg5WxThHQRpWS7irTO54a8GP3/f0PWGfdCxri
         KtK4ckVnSmpDndroXQD1tGkw7WTxrbQsfS71tel3sGsqcxeKDUEWW6RYsLmN1jI95h54
         2SFhrTcPZgwLeXVMmKzZVr1+JTVPbyPlbdvKQFon0esCCyipUY+5LELlCX2AsOMsSZa2
         zIhMSDhfcn+JVm6eYqtb0XYYACu4+Jdb1qEmyMqLU4p3Dkjor9MPRYrg8ESoYrWU/zRS
         lmvfLtuHPbk+48tita2Zaejclj/HNStDaqYU4h1dECuYJ2VJo4jddyXelMZI+j995Jpj
         Nf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719614857; x=1720219657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C65iYCiYAPW1ZdKuKBfIjw9waLCg7LXK5ZuuXcqO96E=;
        b=UoUQxNZJZWHM1eN3/qo/e07Wsw6cxeMbp8PzD+2Sg4/1OIK5djBTTTgp/RGaH8/AyM
         sbCNZ13wWvYd6l7QDzl5sTd0KYRI2F9cu5BLrSgTK4Zr4SVEAqP4AA5KswIaNXGlRzvs
         oMLKsjQ6Sd7EhVix+NshTr49AWIw9ZxblsE0FPocJA8Vi3LVoVbY8avcO//Q6tPYsC3T
         al7FvrrLrFmAX1VSE+lISsW2UZg3OPdYFQ+qWMI5Gat3D1I0a7dbnQVct12Y8MROqeyD
         2zCZmjeKQJXGe2fsuufxnNyRbkmtERb5q+U2c2zA1kMmgOa055q8M8KK/ZxnnZ+IFEwu
         fXIQ==
X-Gm-Message-State: AOJu0YyxmRXvhbO/sMTVNOKU8Ze02GgEg1F21ANbwNZk7mGwP5kvFJYF
	EMokmbekM6dzCKzV0FGRpTSrdv53cZBKT13M7u8RIlSgTRLIr3EAoukCPw==
X-Google-Smtp-Source: AGHT+IG2ibJMUsuW/RAww0S7aXD48nptuMYJbS/NsA8uub/9qUsG1O75gWKKCAQVT7+TU0itlTurDQ==
X-Received: by 2002:a17:90a:77c4:b0:2c7:cfdb:7789 with SMTP id 98e67ed59e1d1-2c8612a60demr14319885a91.16.1719614856419;
        Fri, 28 Jun 2024 15:47:36 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:9c98:1988:ce15:c0ac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce58877sm2187163a91.24.2024.06.28.15.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 15:47:36 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] Input: cypress_ps2 - clean up setting reporting rate
Date: Fri, 28 Jun 2024 15:47:23 -0700
Message-ID: <20240628224728.2180126-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Casting an integer field containing desired rate to a pointer to bytes
works on little endian architectures where the driver is used, but not
a good practice. Use a temporary of proper type instead.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/cypress_ps2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/cypress_ps2.c b/drivers/input/mouse/cypress_ps2.c
index c693130bef41..32b55b2b9b76 100644
--- a/drivers/input/mouse/cypress_ps2.c
+++ b/drivers/input/mouse/cypress_ps2.c
@@ -612,6 +612,7 @@ static psmouse_ret_t cypress_protocol_handler(struct psmouse *psmouse)
 static void cypress_set_rate(struct psmouse *psmouse, unsigned int rate)
 {
 	struct cytp_data *cytp = psmouse->private;
+	u8 rate_param;
 
 	if (rate >= 80) {
 		psmouse->rate = 80;
@@ -621,8 +622,8 @@ static void cypress_set_rate(struct psmouse *psmouse, unsigned int rate)
 		cytp->mode &= ~CYTP_BIT_HIGH_RATE;
 	}
 
-	ps2_command(&psmouse->ps2dev, (unsigned char *)&psmouse->rate,
-		    PSMOUSE_CMD_SETRATE);
+	rate_param = (u8)rate;
+	ps2_command(&psmouse->ps2dev, &rate_param, PSMOUSE_CMD_SETRATE);
 }
 
 static void cypress_disconnect(struct psmouse *psmouse)
-- 
2.45.2.803.g4e1b14247a-goog


