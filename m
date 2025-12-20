Return-Path: <linux-input+bounces-16648-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 300FACD2433
	for <lists+linux-input@lfdr.de>; Sat, 20 Dec 2025 01:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFB453019896
	for <lists+linux-input@lfdr.de>; Sat, 20 Dec 2025 00:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5531DE8A4;
	Sat, 20 Dec 2025 00:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMqd3EUS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA89A1D9A5F
	for <linux-input@vger.kernel.org>; Sat, 20 Dec 2025 00:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766190469; cv=none; b=UOuzhSrLmJl19qh9lLErw4YqusQbeNoQzI25nLobcpwe+Grrd7IasmJSpD2S/xpI9miFfCXeXVfMZf49WOHw7IHvLOgT8TYgdsij/FgPTWNyihGFv+A/zhVn2ju3YVTqOi5CESSS+IoFsMLt3aHW7+AfnN0pqMlNhxPZl8rDfY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766190469; c=relaxed/simple;
	bh=lwzVY2cnFM1PAApqOOveZhkpTAE9aDh9DnkFErVtPvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mlfHEmY4lQBGKkpHytIg+GZA/ODZaVsKsY1fTjz4qxejSpzPvChuGKxMTMyni1MvTOZMZsIkTM89VSfOfCXiy10IFki8P+HI98mJpX+flEd/vHY6axR5YDk7npzPJge0/KylIu2J1odplydG46hCEBneHHQoUNnvaa8isNZ/X24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMqd3EUS; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88a37cb5afdso40438126d6.0
        for <linux-input@vger.kernel.org>; Fri, 19 Dec 2025 16:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766190466; x=1766795266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbY5vEoYtQrMPHWgFdyvVbg+PpcYg8w5v5NETAuJ6hQ=;
        b=GMqd3EUSmU2xD3hOii3hgzvs/RHYvCiTrGYN/EJiULSIQ1YH01LdkMzL9nh6ylqCG7
         EHugRWTsDvYCPjGJERysyfw4KSMi9UUJiSPoTuP1MOM230i8uVr6XiMuWHRban235kkW
         K4fzQJ/sFAbdNoxMYE0LJ5/x4RRyp1DJf/7yghTE2vLXciFFFYA8uRfVCOSK0AW26+qA
         clPmYb0dNCjKdwPhD70ieBIhp16Fnx1hI5a719QuBexTrKoY4i9iZvlYwZTPvxiLjLdm
         tEhozhTeDDgexPd3yWuISAMQEMOzlMXRA2ZxETJ8LI0dZ3xd3XcJlSDwJf2TQlmec7B1
         a2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766190466; x=1766795266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IbY5vEoYtQrMPHWgFdyvVbg+PpcYg8w5v5NETAuJ6hQ=;
        b=uL7i0bJ2VPDQXL41ekqV/N5jAYE/Vjdb/+cXtklby3guC6MjuV3TNfioWOLDn3vpKi
         r5hRqfO3uL6zd+mYpCkEqIPoizeX8MEL3xTliSyJhaNAZ5EVUoQNQet8IOm8LTYlVKWH
         Qe7gdLpOEJHe7YsNd/zhsaAg4Q6x+bitTMx7UldmnqyAYYns9CUAxjw3gwERiJqeFhJE
         iZuMc/occj7DjR6kp6vUH6vpfTOBEKxkdau2GJZOVGofUulE6Ams4PW+Zt/M32hwVgBq
         W60jIGn11RnPLsClNF3hVizyHcH8o36WRTgJnGBwbQfzK6XRADy/ixeqXRKQBbljH/bE
         QTPA==
X-Forwarded-Encrypted: i=1; AJvYcCVsWtLG/a49fa3DOKZhG4mFPQdsICf4Scer6wsLcoP5uYnM6DWPX+VNsjV5NKusqiwX/NLWo1rxINIBVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwchyWsLubaQnelqvjkuAcoH+5Lwz9Z1R/ORGra90H950XJpdhS
	sg1R2z13R9AIaFDPdUSsdmzJkThOOEND3wIyWavW1OTnbjYSJAzjj/CX
X-Gm-Gg: AY/fxX6xYIIgXzCTPby95q4ppadPpKvCQGQx9oe7O7ImQUFFj7Gm/BijpHVJPR0eOq8
	RiggkV29MtOZfRKdgza99Qx21W47PkeR9HALNRXOVfEcvsx6USAM3hV4pbOnKuLOHbGVL3jM22I
	tSVJpwY3fff2EKAht5UUNwRH2MkGdf+sN+t4uhcDelUtbfkCJQ5z2PuMfUyzTN/7XXVCYZTYgxd
	chZgiwfIhvxhWc22cQo7sVunDaGsX1tE5Aww0/4fyj82Fh4TFcOY9J+EbGnCkTNKtyizACvZC3Z
	up2YXM5M/OmWCRGP4ImYgIK2JEmpeekO5oQnv6yvSKWmtJM3pcRRlpMM14y+sB6yYiJW31VNXk+
	AjKuG/cnNBwuZR5qpsx1c90/QFlD1CpEgILGKFEEsl9FnMgOgENVUVulbREkq9q+q0XEHt+NUt4
	IAxtM2gZEe+pBlGyGRlVJ0Dd0MMznDi/BbbeELyTCRSNnddXkeJvv4LUGX8F/4kvftDBHe3hPQR
	bIkwM2Fw1wDflHzMECovK+LzAUVOWOr6BK2pe5KEQ==
X-Google-Smtp-Source: AGHT+IFDW7pRBGodzyLXGOJhutGjPfsRbeaZDuFM64LhrDnGGKHHeiRhrkY9X6I2+cAznbBDp2hvhg==
X-Received: by 2002:a05:6214:3bc2:b0:87f:fffb:b7af with SMTP id 6a1803df08f44-88d81465ebdmr77561826d6.1.1766190466569;
        Fri, 19 Dec 2025 16:27:46 -0800 (PST)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096891558sm294631985a.15.2025.12.19.16.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 16:27:46 -0800 (PST)
From: pip-izony <eeodqql09@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Sanghoon Choi <csh0052@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Input: ims-pcu - fix heap-buffer-overflow in ims_pcu_process_data()
Date: Fri, 19 Dec 2025 19:24:50 -0500
Message-ID: <20251220002447.392843-4-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <hr5f6diryl6xrmszastqyyfnsfsve4uxqzee4ct7ihj6agzkmo@dm3wm2mwhg2w>
References: <hr5f6diryl6xrmszastqyyfnsfsve4uxqzee4ct7ihj6agzkmo@dm3wm2mwhg2w>
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
`read_buf`. If the packet is too long, discard it, log a warining,
and reset the parser state.

Fixes: 628329d524743 ("Input: add IMS Passenger Control Unit driver")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v1 -> v2: Add warning and reset the state of the parser for bad packet

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


