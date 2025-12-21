Return-Path: <linux-input+bounces-16657-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B3ACD45BC
	for <lists+linux-input@lfdr.de>; Sun, 21 Dec 2025 22:15:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79BB530054BB
	for <lists+linux-input@lfdr.de>; Sun, 21 Dec 2025 21:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6EC21CC44;
	Sun, 21 Dec 2025 21:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQPX2nd1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EDA18FC97
	for <linux-input@vger.kernel.org>; Sun, 21 Dec 2025 21:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766351749; cv=none; b=kZ0pP8W/doBMZdTDLghHkynuEQWrdxtcaFNeMm6sT22Dj9M3d3Xupzo1nGO3EdAXx8LUmNoeI04CIRcPmYn/TNAoYXBvNtFN5UpaycqsZc+J1gEBCw7ziLIdj0/+YxgVbszA4iFCA0V8YM0jzeL07zsMXfcgwcYBBNlikFZu5vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766351749; c=relaxed/simple;
	bh=cK9VDthKEP85Yf5cgkjsEpMQtHs5d8sYy+NPhbuVDpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8qyPKHj3zDZ7n8NiFIgcGOdCJ5sDagWgkIgc2+0YDKQxRrnshU3jhb40/qu2PRNjG2V5JtsMO66CUF+2ADxJdjTDeg0zt9noEzfp0e6tbg+uCkaTUKaT6Byhf4KAE04X+fXRnNc8WHqUE8oOVur5bc4cDaF76Uhhql5d4TCiGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQPX2nd1; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ee158187aaso37137231cf.0
        for <linux-input@vger.kernel.org>; Sun, 21 Dec 2025 13:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766351746; x=1766956546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMeyc05Ar0suF7nZCq4FUAPSW++iMC3FHYjYL4WSg3I=;
        b=PQPX2nd1OzGsBlUMeogYBu19ipGbbHavp5miEIs3js1hPuPJS0oYhsYq3Ui+mWOt31
         w2UMNiTPxs/T821MMK7yrHZi2oLNlbQv6SZUd+e0nQxWSytlS6j3C/cUCGGRCwdeNIps
         bIvAY5JTTpWgvHNfguxS9q6kY+36n8y2knrU5KnPGu0/L+HL88DJdVG70fHmdsHKVbGh
         ADx7V5vd4v9gXsDG65kNN7MgIlRRIHYz38rbmQKu4h3Z456Ur9AN6PNAjLKANVDWkDnZ
         E1K6Lst76zqFO48TG7ZIEUcU4TYcsq1P9rI7UPBcu93Bc76i97d/y6mabqMyr2wFaoSy
         ImDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766351746; x=1766956546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cMeyc05Ar0suF7nZCq4FUAPSW++iMC3FHYjYL4WSg3I=;
        b=E7Q4rHcuGB26ntV3o44aJcWOLTvJe2eks+XAbShcviS/kCt+h3cC+J6T5lYj7s5nS1
         6Ra7GLgrN/tjgqSPlaafBrLsyIxE32jR6QIkIJACKiRC35dWOWONFy4oHAxZyanNiaH0
         0J5jvJv1D9r88ezoGTFPIzOpRRwCENEeFXaZog5YJabF2cj4dKCvp3RS3Z0CEyFLSxDQ
         HKhILWr3CUjK0A7GJWOOze1HLRIVmjNECBhJrTje3vZKpaMg4LpLIKB8u/kIcKQqozW5
         Yl7wZfd1TqkcAQ00Ku9Xllk0KlOh6PxJWtwJBHGGrR/Rl8cYXmz/4wJ9HWxaOWrfLHrC
         sUEg==
X-Forwarded-Encrypted: i=1; AJvYcCVz5VJNAYPFbaW73qn2iXdnSoi+U4GcS8zZrjAWIK+mRNeukmh03RxrpkLfLpu3Ou8ZC+OPX66cje+QQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGjezaEV8WE1EKNpsD633qWyn+wGgA8aVrBUzVk4sFJQ65RLZP
	JOjH8afgSfJ+ZZd90Ggr4PAgDq+4QtjAi0uwmUEc8PXebKIqq8o/Zqx8
X-Gm-Gg: AY/fxX5D8Mdo6CRYVX45qPxOU9o8oBrEm62X3Zs/c4vTmwlRvh9B49QPMguX/Tjfok/
	WQoktoUPoR69ERbXSFuM6uanKfjk2PRAJAco8bV6rcqXMENgmEA3/hwW//6kCRBhYZyY+7qKItQ
	OaOGJApiJxWj+31wO5M/oX0QP8RJ40SCuOELlBTKmVzYc3QYCCfboVNdHnQoFpnyCxe5/EJb+Xy
	ChNDZH6LipXJ2xh2DDwPk3st/ZGk7/WVClApS9L9nhhNmd8jsGS5vAAjqgMqSXUCFZxSXv4z/9h
	bqyOiLfaPgyWfnAqMbvpTglAeGqaeBR511gu1oHiuhJbUVXWopUfAo50oyEmMY3g/Z+w6DMhrlT
	VHjVGk+C0G4kQFKUmts79kanKxD7MnDC8dyn0pDt5bXhGcVNl2Vk/RWGgpYQ1Jn6+KJmC5HFR0l
	TSXHqyRGLQ1fWUH6nLtfDRTn945XOZC6iPoqDLPmbqSjtzeSnF2QkkR28BCz5ArIyAdgJ50ibLc
	FR4O3fLS98CmaWNMrU87PCBt5IGEjof/1jUHXnOJQ==
X-Google-Smtp-Source: AGHT+IGcWFUWxZvqD2/2PfGbwStyDPuwe0e8EZKb+bt69Gmb1mZB06E0fLkwJAVqHleaCi6hFoIXhg==
X-Received: by 2002:a05:622a:4013:b0:4e8:aa15:c96d with SMTP id d75a77b69052e-4f4abdb59d6mr145282381cf.55.1766351746326;
        Sun, 21 Dec 2025 13:15:46 -0800 (PST)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.82])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62e1e7sm62970691cf.21.2025.12.21.13.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:15:45 -0800 (PST)
From: pip-izony <eeodqql09@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Sanghoon Choi <csh0052@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] Input: ims-pcu - fix heap-buffer-overflow in ims_pcu_process_data()
Date: Sun, 21 Dec 2025 16:14:42 -0500
Message-ID: <20251221211442.841549-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251220002447.392843-4-eeodqql09@gmail.com>
References: <20251220002447.392843-4-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

The `ims_pcu_process_data()` processes incoming URB data byte by byte.
However, it fails to check if the `read_pos` index exceeds
IMS_PCU_BUF_SIZE.

If a malicious USB device sends a packet larger than IMS_PCU_BUF_SIZE,
`read_pos` will increment indefinitely. Moreover, since `read_pos` is
located immediately after `read_buf`, the attacker can overwrite
`read_pos` itself to arbitrarily control the index.

This manipulated `read_pos` is subsequently used in
`ims_pcu_handle_response()` to copy data into `cmd_buf`, leading to a
heap buffer overflow.

Specifically, an attacker can overwrite the `cmd_done.wait.head` located
at offset 136 relative to `cmd_buf` in the `ims_pcu_handle_response()`.
Consequently, when the driver calls `complete(&pcu->cmd_done)`, it
triggers a control flow hijack by using the manipulated pointer.

Fix this by adding a bounds check for `read_pos` before writing to
`read_buf`. If the packet is too long, discard it, log a warning,
and reset the parser state.

Fixes: 628329d524743 ("Input: add IMS Passenger Control Unit driver")
Co-developed-by: Sanghoon Choi <csh0052@gmail.com>
Signed-off-by: Sanghoon Choi <csh0052@gmail.com>
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v1 -> v2: Add warning and reset the state of the parser for bad packet
 v2 -> v3: Add co-author information

 drivers/input/misc/ims-pcu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index 4581f1c53644..c98ef71c841e 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -450,6 +450,16 @@ static void ims_pcu_process_data(struct ims_pcu *pcu, struct urb *urb)
 			continue;
 
 		if (pcu->have_dle) {
+			if (pcu->read_pos >= IMS_PCU_BUF_SIZE) {
+				dev_warn(pcu->dev,
+					 "Packet too long (%d bytes), discarding\n",
+					 pcu->read_pos);
+				pcu->have_stx = false;
+				pcu->have_dle = false;
+				pcu->read_pos = 0;
+				continue;
+			}
+
 			pcu->have_dle = false;
 			pcu->read_buf[pcu->read_pos++] = data;
 			pcu->check_sum += data;
@@ -491,6 +501,16 @@ static void ims_pcu_process_data(struct ims_pcu *pcu, struct urb *urb)
 			break;
 
 		default:
+			if (pcu->read_pos >= IMS_PCU_BUF_SIZE) {
+				dev_warn(pcu->dev,
+					 "Packet too long (%d bytes), discarding\n",
+					 pcu->read_pos);
+				pcu->have_stx = false;
+				pcu->have_dle = false;
+				pcu->read_pos = 0;
+				continue;
+			}
+
 			pcu->read_buf[pcu->read_pos++] = data;
 			pcu->check_sum += data;
 			break;
-- 
2.43.0


