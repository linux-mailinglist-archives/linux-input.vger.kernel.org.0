Return-Path: <linux-input+bounces-10337-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D252A43814
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 09:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45E01173D72
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 08:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA1325D55D;
	Tue, 25 Feb 2025 08:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qt5F1TdT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B2E153803;
	Tue, 25 Feb 2025 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473415; cv=none; b=SWpHYjpzIZYYTeIwcL3NOizonCnq1v3J5S21HVfsNAHAWIedFfZXkGp+zqrKh4gbvv8qC5Isf0fK+9UwdzLxLN2UOCFBuKZ02cTxPW8BvCKjt2kxnvcxRG8iXNgsUQ+hxV9Uu0nwr9/pMCLq2605rq36m1dso62NH2BiHTuHjkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473415; c=relaxed/simple;
	bh=PO7I6vIhrfdARQrbL/nWwiztXZlIwf45LmsyWQUdf9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qopwAkfdlkYdbc0vRgJUBuiN2Wt0jc5cGbOp7BwzgG55Sct20EiqCW3RI6nXBNoA7tLiawCF441fjSVWxvsZb5XuQisoELo2mA2pHua8gan2DfxNJDXNAzLNWRQDnk+wr4jnf4M30mBf0pQupq9jsjNZcN7id0YUEInlpT1NUcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qt5F1TdT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so34698325e9.0;
        Tue, 25 Feb 2025 00:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740473412; x=1741078212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsd/cgXtCGv2pR8kczPb4Pv0GKROKEDl93Shuf17Dtw=;
        b=Qt5F1TdT95YR3Faohkv47/3hsC0hNt6yXv5i/ub1NrEhOwRj5rkOu4MFAAo4oWz9Jq
         7ygIZXCczpoDls2j/TjbwABYuKvMohdTN3WA18XTsbML1XUzEFYyzakGHQsqvP9OL9FM
         YaWVznsei9JvvoV+CrVzr3TgHZMa3XFMYGylZ96MzqOeoAItKm/801cbJeyCZWzI6+NX
         4S2W8BdSoTpoEv2Vv2Cxyp7bSxsS8VBKoxEtmfRAUa5uf+EAN7IHitZRu49NY7W9HfwC
         C+Z8AvyyPkC6uje9LILVa7YYl2NaqeJx+/22ffdbzRE/t7HQTek80M2j8xiU4b7lreBd
         ZUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740473412; x=1741078212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsd/cgXtCGv2pR8kczPb4Pv0GKROKEDl93Shuf17Dtw=;
        b=tTobqtKiMgPC5uu534BXej5IGJ11FCWZXcDPUFpZ1Vc6xHd0xPY2sxMrVu/k9MmyM5
         bp+k7AEOc6uxjoXSjFsoZuAJG1oH7pKHMUXsHtN8QHJz474jzoLMHbPNRkyZEjUue7yK
         8OZAksA1PKco8EJ++y7X2pVVtw6Zw0/xcb5M0usPXZ4hhlt17WHA9Fl5/8wl7d+cT27t
         F6MD3U5d2YQxcfntKLBsttEKx7gLmEnzMgSiIjuTJTRt0jhPdu3tOF7Hd5025+nKIQHd
         3RBupYRabeGa/z1LqswqNEq8UCY3IzrbnVUmJ6XEIDMMhPUK44P1PIm5FdXAkH3rs9tB
         cosw==
X-Forwarded-Encrypted: i=1; AJvYcCUni6lMMXecQR4d4uPsFP7KI7gGZ8kQLBOa7C8bj8LSotL7NKonCUl/2l8BXpQ8GFAV0JMhL/DXwoVmziE=@vger.kernel.org, AJvYcCWh26i+B+pQD+0TpnQYUF69/A+OHSKz+Fc9dQuFL+O+O9p7YOzxLFHvaSpMOC9GSsIFfLB+D0JRvtKC@vger.kernel.org, AJvYcCWt7Wq6T00+JmduSyUjrE1899aO8Jy6Qj3s8q+idsWn01Z1MzATelGe/+/A4wYwraPGbW7Hb6yy/R4qUlix@vger.kernel.org
X-Gm-Message-State: AOJu0YwJmC5+15WGeyM8quZkV+rTM12d1qTJvxMTd/csxwNHo5JMCaDh
	JUP9b3FRb+HFoFiljKuS/IOpFiqtFnzyznlbjjM9WlzjJHJWgu7xPE0eZV2cQR0=
X-Gm-Gg: ASbGnctF9C8/nS5WOlgpe3u7NfsZEfEDG00B9moFcFFVtxPnZuPCCORywX51jRcPcm5
	jsuNIYibSpKIljBlmhGKox4rSqPpA9mgBKo0h1kOGT+n0F/EaRqbBOFtL6jeapq8nmfWvyNx2jI
	xcinpqoN0ImNRwPk/PR6imOnlK0t/XUz7hmG7qJ9/LgLtY8WEXBgrhSUS1YjQP3P8KXclOAp+SE
	HM/COexQvZzRABpB+pFXXCrdYLZimghNZ+YxpOeEgUrlDaID1KtzX2lhweci1nqJPSJgmeZGCj4
	aAzQoR1oGCjV5AT0yVSwg1mu06+0YtskAHT1kJXNX7CC5K4JWvumupblliEtXQ==
X-Google-Smtp-Source: AGHT+IHYc31eiu/SCD3UJprh4BS0DeKV9J/IJVzVv2JzeNJeugWejzImURodWD6IJ4cbjffXkkvJPQ==
X-Received: by 2002:a5d:59a7:0:b0:38d:e304:7478 with SMTP id ffacd0b85a97d-38f7082b185mr17425774f8f.38.1740473412129;
        Tue, 25 Feb 2025 00:50:12 -0800 (PST)
Received: from fedora.. (84-236-81-135.pool.digikabel.hu. [84.236.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fbcabsm1503582f8f.86.2025.02.25.00.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 00:50:11 -0800 (PST)
From: Andras Sebok <sebokandris2009@gmail.com>
To: markuss.broks@gmail.com,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	krzk+dt@kernel.org
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Andras Sebok <sebokandris2009@gmail.com>
Subject: [PATCH v2 2/2] Input: imagis - add support for imagis IST3038H
Date: Tue, 25 Feb 2025 09:47:01 +0100
Message-ID: <20250225084914.81715-2-sebokandris2009@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225084914.81715-1-sebokandris2009@gmail.com>
References: <20250225084914.81715-1-sebokandris2009@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for imagis IST3038H, which seems mostly compatible with
IST3038C except that it reports a different chip ID value.

Tested on samsung,j5y17lte.

Signed-off-by: Andras Sebok <sebokandris2009@gmail.com>
Link: https://lore.kernel.org/r/20250224090354.102903-2-sebokandris2009@gmail.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This is the fixed version of the patch, which is already applied to 
Dmitry Torokhov's input tree.
Sorry for not CC-ing the devicetree list and maintainers before.

 drivers/input/touchscreen/imagis.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/input/touchscreen/imagis.c b/drivers/input/touchscreen/imagis.c
index abeae9102323..3c8bbe284b73 100644
--- a/drivers/input/touchscreen/imagis.c
+++ b/drivers/input/touchscreen/imagis.c
@@ -22,6 +22,7 @@
 
 #define IST3032C_WHOAMI			0x32c
 #define IST3038C_WHOAMI			0x38c
+#define IST3038H_WHOAMI			0x38d
 
 #define IST3038B_REG_CHIPID		0x30
 #define IST3038B_WHOAMI			0x30380b
@@ -428,11 +429,19 @@ static const struct imagis_properties imagis_3038c_data = {
 	.protocol_b = true,
 };
 
+static const struct imagis_properties imagis_3038h_data = {
+	.interrupt_msg_cmd = IST3038C_REG_INTR_MESSAGE,
+	.touch_coord_cmd = IST3038C_REG_TOUCH_COORD,
+	.whoami_cmd = IST3038C_REG_CHIPID,
+	.whoami_val = IST3038H_WHOAMI,
+};
+
 static const struct of_device_id imagis_of_match[] = {
 	{ .compatible = "imagis,ist3032c", .data = &imagis_3032c_data },
 	{ .compatible = "imagis,ist3038", .data = &imagis_3038_data },
 	{ .compatible = "imagis,ist3038b", .data = &imagis_3038b_data },
 	{ .compatible = "imagis,ist3038c", .data = &imagis_3038c_data },
+	{ .compatible = "imagis,ist3038h", .data = &imagis_3038h_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, imagis_of_match);
-- 
2.48.1


