Return-Path: <linux-input+bounces-15296-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF62BC2CB8
	for <lists+linux-input@lfdr.de>; Tue, 07 Oct 2025 23:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4B3F634F612
	for <lists+linux-input@lfdr.de>; Tue,  7 Oct 2025 21:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FC2248891;
	Tue,  7 Oct 2025 21:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7M0g4DI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB28246BB7
	for <linux-input@vger.kernel.org>; Tue,  7 Oct 2025 21:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759873919; cv=none; b=ehXJZuexuBy1NGLN888ZXDqJ0dToXNkLsQBz+UpH+nSE48iENTnO7KlLEMIWDI/Dk0CQ4CseRp2dot8jN8g0InOTmz14HT/QElyL880IyZhp5RavkBwN96ZoJDSYqsqMMvwfqxhkGd5+hVpU7ogUY8/yK/yDMAOkkuBebqOeKuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759873919; c=relaxed/simple;
	bh=QDGRau9hUTIw0LmGZxQbGkUnm+lvJ+Sc5cUwuswn8gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WFtBk47Ak7SyGf10q7utNRiQHa8mKip+DBlEKMW8YkMw/2iEJPt5RXrkUG4pZuf/1O2G5l+Z7kSpBHU7H2Vs+yTBG6ZrDFzmMtrmqeWK6qaIVFI3ToHHHj59yFgJ6Pj0ETWnboqmgc+7+UhIznJV5iaMpjSRYDxWlPCeAnuEKM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7M0g4DI; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-856cbf74c4aso837823785a.2
        for <linux-input@vger.kernel.org>; Tue, 07 Oct 2025 14:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759873916; x=1760478716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zspedv/g7MbmKhSduq0BNA8/CtYiYE9VtM2LqWSPvok=;
        b=k7M0g4DIQmPLKKBSH2K+BRrIRpBxar64hq/OqbP+UATzE/JJfPvQS4t1Ze2Hah7poU
         0cH4ptnxaLZj++AWaZI/V/K0zFZbcR9Ft/afHqqi6lOOuScrevHhwOu4go9DhgiaNkbK
         vvVGQ1PZBBqR1HQIFzIDqKRZ5V4KYjZHQgy1oFd/YIwcWH0P2tBOCs2cWf7h1MAB1O6Q
         b7LOPbf87PkTxujCPEb/iu4caC/aHieOGlOlFplYETEtzSFZNzxMW9Zh+RiClbrUCUDu
         wVPbGgbhCXtA+FAtRg2Oab7o82VyizOw+tjNur1+6MX+oAhSHGwWQCSqiCgbTlr4aY0r
         ATQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759873916; x=1760478716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zspedv/g7MbmKhSduq0BNA8/CtYiYE9VtM2LqWSPvok=;
        b=BcJhZT5i9hThNHPkEQDGn6GxAxUUkuu1U0Ixk/DamjCAyW+boNm3rgu6MsrZPeGulT
         2YaBa+gUyy/NmmCGySzDvU/lUCnxPTQVgio2bWS5zQ7hBhURilxCuR4yp2jV0cEp6KOj
         pgclitSlIuPTtsweCAbzdfbB2ET2xzGFlIekh12AUDoVDY7Qobc12xe2Qcggx88OXvLd
         NBy5JhaM5abcTG2myzj9eWB0fKCzcfelmm19mUrhwBF8Vz0cqX0yYrqkzgjgFNqSP1fx
         fV1lNTUBiDR77ANGo0Xg1PFWxWsFMlboaQvi8b6brc24cGBmWeBAwXPJVAOlnxJ430Ad
         PWgw==
X-Forwarded-Encrypted: i=1; AJvYcCXjhj4ySIdv5OHE+ssyvJ6775bknzuQCk2lTiHqB8AEEcMNs95S5h03nsrIpq/wT6kqCfibd0CROMAmrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH9dHZb1wnqX/39p0sX/QgmEtUDOuXmOpSoPSzZYtwpOoFBnEt
	DkF01YbvFllARgp9oDbKlE2tTtkXWrAVFjsA8TTnHaJrwRRZ0Je+7ABp
X-Gm-Gg: ASbGnct73oreyX3asb+Na+t+Y0V1ZqObDN1gcY77a4a7G8TB+88dTNVYPnpUiKhM3a7
	ejjlffnk1LIo0uNgo0g1TYFzxj2FrYkyvpALR6MLTWqruwsCmbBuTZmAyn8F/dAL1TI20si3TGF
	bK74u6sIHDzSQ0iqhNbmu7oH+sllirdGCnZ3LUbxNUAHdrAi2eXwdToH5/SkK80zpY4A9o2Ls9C
	MowHDMHBHoxSFRKGcs+nZuuDhKt7g4zie/Xl/57Zbpj8TVFMIEOQlRka1/LD+l2u1LbuePwMMy7
	vXIJd70mDSg1AuPP9arUgYYMPov04TNYVSiVtjpYziR1E2zcO0shrTmcVq1zT9SDhZCtbxtzO9u
	bR4zkRbHujJzzQe0WlUWxGOKQCKD+r0+Ynbb2qXJmC4dskBW3t2IXq9fiW7YmQhuDbyY/KIG/Hu
	6YysWIFBOKJ1oYZ3L21fpuz4LA9urT7S8=
X-Google-Smtp-Source: AGHT+IGOq5pYG58K8mMoqQOeJGCTbi6ZyRgh8XgbbYFkzRFf5ylz+GiLTUem9QZ+rZgBYEWJ1sLt5w==
X-Received: by 2002:a05:620a:4807:b0:84a:568:b7d3 with SMTP id af79cd13be357-883546e1a86mr163438385a.74.1759873916127;
        Tue, 07 Oct 2025 14:51:56 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.197.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-87771129fdasm1618199585a.6.2025.10.07.14.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 14:51:54 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] Input: pegasus-notetaker - fix out-of-bounds access vulnerability in pegasus_parse_packet() function of the pegasus driver
Date: Tue,  7 Oct 2025 17:41:32 -0400
Message-ID: <20251007214131.3737115-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

In the pegasus_notetaker driver, the pegasus_probe() function allocates
the URB transfer buffer using the wMaxPacketSize value from
the endpoint descriptor. An attacker can use a malicious USB descriptor
to force the allocation of a very small buffer.

Subsequently, if the device sends an interrupt packet with a specific
pattern (e.g., where the first byte is 0x80 or 0x42),
the pegasus_parse_packet() function parses the packet without checking
the allocated buffer size. This leads to an out-of-bounds memory access,
which could result in a system panic.

Fixes: 948bf18 ("Input: remove third argument of usb_maxpacket()")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 drivers/input/tablet/pegasus_notetaker.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
index 8d6b71d59793..6c4199712a4e 100644
--- a/drivers/input/tablet/pegasus_notetaker.c
+++ b/drivers/input/tablet/pegasus_notetaker.c
@@ -311,6 +311,11 @@ static int pegasus_probe(struct usb_interface *intf,
 	}
 
 	pegasus->data_len = usb_maxpacket(dev, pipe);
+    if (pegasus->data_len < 5) {
+		dev_err(&intf->dev, "Invalid number of wMaxPacketSize\n");
+		error = -EINVAL;
+		goto err_free_mem;
+	}
 
 	pegasus->data = usb_alloc_coherent(dev, pegasus->data_len, GFP_KERNEL,
 					   &pegasus->data_dma);
-- 
2.43.0


