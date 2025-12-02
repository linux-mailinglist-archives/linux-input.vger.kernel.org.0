Return-Path: <linux-input+bounces-16437-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 981D0C99F77
	for <lists+linux-input@lfdr.de>; Tue, 02 Dec 2025 04:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ADDA3A3799
	for <lists+linux-input@lfdr.de>; Tue,  2 Dec 2025 03:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39417242D84;
	Tue,  2 Dec 2025 03:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtWNhSEB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B888418A6DB
	for <linux-input@vger.kernel.org>; Tue,  2 Dec 2025 03:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764646285; cv=none; b=EZ1J8kjsB0Op+l/Y69M3Ks5VY7U3jFmXyrGfsgkX6PUk4mKOJUKTcIRsVeDonKV6QBv0sSnliaAVp7T3ls3/m5jwVr0EEB12V1XJrrG5rzQLscadkb2qTBbXBuaALEwLEnio0mxMxQLtxQLHGa3Rv/473HZkQDMF5NxygQS/29E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764646285; c=relaxed/simple;
	bh=sWid0yU4ux/46ObdM3lA67pKQtj4Epv3dh0AAxKTkQE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CqUzEDh/vUNABBFrwzp8oIFr4jBaPFmbSHkG1Gln446auzDh2FmL2XW04cJDDkAbULhp4412iOwK1Q11DDFtpUWfEJlPxuT1DKmcP+TgN4m7LnSHJ9FKP1oCBGPMFV+kYVnU5nKOMLCVL1RkPgkV2J2YTR4w3ABUzhzx9wgmlOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtWNhSEB; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7c701097a75so2338841a34.3
        for <linux-input@vger.kernel.org>; Mon, 01 Dec 2025 19:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764646282; x=1765251082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yhVHX2JwjsGi/mN+KMBqdyAPiJzpUlbgYPqFkqH+WLw=;
        b=CtWNhSEBWCiQ/xmsIMiZth9a2X6iffKzfKCQ87ToWTShrdK/Xuc5tmEZEwUJ1dR8jV
         1doGuhryow5nyif8eJdqj9ZU2TppIuFw4uOjgpFChwaoQjnscPFHzJzuhclTRFvQKVtD
         76v0+r6+RJSmPwveN9tTMSk7sAjqwff0EgfpQv69PKNFD18cddKAmBsz/Y5yDNx2f40X
         LmaYBzRotN/zfu9ND7ELhS5G7F7Q4w9kgceiDTgQPJamQPS+eoRf4BOiQIiwQv6tvXww
         hd2jAHz7ZGQnQCqA/tJQJusrv3D4Mt50SeBum+7eavv9sm30o5eQ71yBHcihCHz4whgM
         tGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764646282; x=1765251082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhVHX2JwjsGi/mN+KMBqdyAPiJzpUlbgYPqFkqH+WLw=;
        b=Wa0evJoNk6xcP3iU8FB+0vv2q9XHix8Ym8B6qNtNH0kGk1+ub7APtXVAtoQW/8VQPn
         9qGDVqkrLPrpzItm2NRpgBxqmOzo2rp9JQXEk6WBIVL0/IKBO4irRcrofyqxJvl0C/WM
         BPZpftrNsYpOlixKP9DwTpqhB/ZaTNMKPfEZH7OayqpR1F9K96VSEuKltWtX1oxV+jtT
         aIL+9W18L2QEJIYoQO2iqzskjW7iHvvsQPC/56AcFYmdl2huv4dXjeIgBrM50T7u0622
         sQDafJ/cQ1nYHn8HkBuRf6KZISQrir7qz0vyY3udJ5ZSf0fhakCL8uwJUTTI82HcF0hW
         XC0Q==
X-Gm-Message-State: AOJu0YwwZzDQoo/duZWpQMZLPGabhawWGA16cmfudunk3ea4fxS8cMsR
	mP26M9gvx8YAl8KmjAVgoXYHon1PYyU8emyn6eAR8DE6sr7t3r5217f1
X-Gm-Gg: ASbGncvbKRHtwryZHlANegIeFzGSLVpuPwNyMUB93kRqKIvWwkHCryIGijmARMVaujQ
	fUo6KdVN31PgqC/BVBIrtMuB8vmS8avBg5ld/qhSacKE7FjdKXnhNpkTHUp8coNT1Xv/KYsUxgK
	KIQzLYK5yCXayLLfEixhL37rSdxs0RhIpW2/ubVyz+8IhcsnIc2x/g6dBSdvWF5AY9r7ZswWw9N
	1AFrc0KYcK+Z6IvY9uxvPWeqFAFTFIVQrU/LGg+/dwKDEbowobmX5CnvDdP8wgNCepJ6RY9jerO
	EHb3ssOwn/9UWtc3WomPi31o3OHfaP6qiWbJ3XECZJSajukn94kCxLEsGVv+B/8WnMObIDzrIuq
	qjBJsQCrcoP17ajCNBtmtcebrsx8uDNr0LAv0z8TGG8vfCYhxOEX+mQBiRJPJuMZEq7aZVpzcaa
	K2eIUCkYjHX491Qqm6jBeQPU6WUoQQtn7Yd/NT7+u5ObY=
X-Google-Smtp-Source: AGHT+IGEE+pA9ert5r3QhhzdE5JNQYujZ7/bNBw1cjEDrGT/Fvc/IVxYE67qcjoOkPHSm1i4Z41rFw==
X-Received: by 2002:a05:6830:71a4:b0:771:5ae2:fce0 with SMTP id 46e09a7af769-7c798ccd7ddmr22675428a34.20.1764646282416;
        Mon, 01 Dec 2025 19:31:22 -0800 (PST)
Received: from kernel-internship-machine.. ([143.110.209.46])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90f5fafc7sm5842998a34.7.2025.12.01.19.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 19:31:22 -0800 (PST)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Vivek Balachandhar TN <vivek.balachandhar@gmail.com>
Subject: [PATCH] input: byd: use %*ph for Z packet dump
Date: Tue,  2 Dec 2025 03:31:20 +0000
Message-Id: <20251202033120.2264474-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the hand-rolled %02x formatting of the Z packet warning in the
BYD driver with the %*ph format specifier. %*ph is the preferred helper
for printing a buffer in hexadecimal and makes the logging clearer and
more consistent.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/input/mouse/byd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/byd.c b/drivers/input/mouse/byd.c
index 71aa23dd7d8d..a1420f03f3b3 100644
--- a/drivers/input/mouse/byd.c
+++ b/drivers/input/mouse/byd.c
@@ -315,9 +315,8 @@ static psmouse_ret_t byd_process_byte(struct psmouse *psmouse)
 	}
 	default:
 		psmouse_warn(psmouse,
-			     "Unrecognized Z: pkt = %02x %02x %02x %02x\n",
-			     psmouse->packet[0], psmouse->packet[1],
-			     psmouse->packet[2], psmouse->packet[3]);
+			     "Unrecognized Z: pkt = %*ph\n",
+			     4, psmouse->packet);
 		return PSMOUSE_BAD_DATA;
 	}
 
-- 
2.34.1


