Return-Path: <linux-input+bounces-11383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8073A7650F
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 13:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6ACA9168C30
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 11:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206C71D86DC;
	Mon, 31 Mar 2025 11:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2SY7TaY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB7C1D7E5B;
	Mon, 31 Mar 2025 11:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743421062; cv=none; b=nhMplA7QZicLKgGqJyqbg6UEu0CVGIocnRoFy9yPcsa6/NlrZv5q+K40cTIXlKGqU02LUCYX03UYnoo13TL4Tutl781kURIOF8dVl0AhcEHge8Mtuayb343YgVGrXvzM6rfPw0faNGjXrL/ww2SWlU3bub/DWXXUptPgYWnjuzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743421062; c=relaxed/simple;
	bh=zGtNUXqAQQW9cH2PjdXTsqRsui5IoWGLxVdUJrY1rFA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bHNixXJ18rUQpkYlYIoI3lQuPo9zwEUGbgCkV2L8ZbmzckfgaVuDDHi5BQej3Pjv4ph6y+WysnqCFaFRSn7wXXeBopp4ymgAFgjnl2zS9jUOwOuG4SNgHWroIUpxoCpr14aztGfcIVuq2SwFr8RUbiky4lcUV1yTsPjZ2qYg2fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2SY7TaY; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-301e05b90caso7596399a91.2;
        Mon, 31 Mar 2025 04:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743421060; x=1744025860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAZERK3TWTrI50uxBupeJ5lJIuhLMzB6184AqIPg9T8=;
        b=B2SY7TaYTVXCpd6zsu8ZEcqje7uYVpg9hONqLGvyd8Iv+WadVYRAhLlys168ziOH0y
         yemrdOdx8p3f/HjtRQqTSpzEUI8RY/n2hipy8gxKufj6ucuXwhbzTdFh8In0JbwipcIg
         xqqPzqk28QgSpP6hFPCAULYy7pWlX7vSvJylYah80/kwhyieiCQ/PeAvEQVGdwnzUy7P
         Iuhxo6ysIPgWrnn8nQ7KfmWF1sPwIa2aGKphPUUhpQ1IIxELpDth/WECXnDW3f1cka8H
         KCP/ougDEku3jZXMsvT72K6wJUCRGf9gVKcWktVoUbIlOSN/DCvy7nCCKQNBXDFlX7eC
         VHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743421060; x=1744025860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAZERK3TWTrI50uxBupeJ5lJIuhLMzB6184AqIPg9T8=;
        b=LqTa5FFCt/NXSXj0lEYmpq7ndAkJPKpn8JaAKuRvNMA1iKZd0XFxiGEjAa/YieXs2p
         PKp3frYH5fYAcrW7iNvXWeI3QRYFOglvnwGizqJSVVqy4lxinFlYCmULF0eNKgraL4B4
         l3r4muyfxThssfsiJJG+JilaveLLuHIcAjl1vUTtu5YF/CBruJGUjOA7Mgo6GcjXvN/E
         JnzRoX9oZsfVEuZ+RWq16ph0vh6ENZWtNKLg6ZnsmuPtkUCKt1MD9Fgg8D4B2jIkkGf9
         zL5FWY520c4iXTvLCfhQ5o6nwL3azpMSYcZkAgAOmJaTvF2Wg21IlLDaT4WY41JKAOK1
         7npg==
X-Forwarded-Encrypted: i=1; AJvYcCWi/9lObHWNPXjFTc4Nwzq6t2rgi3toJCboyuinTNMpVoodT+lsSogRx9l5w79I6DekmFhqSKIrubAPAfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcFQKXwTTaM+nSN1E81OGeQ1Xvg05kZF3eQnyfsDUGMke4fWm1
	THxZRyXOaef2BPi7jXCs+M/RxxlNbr/C6F8ipE26itOnNXqi3NsJPovSMnKxdBVKhQ==
X-Gm-Gg: ASbGnctJo+vRJCKk8ZfzuPaBstqvvpgyxBXic8SCkP8glBmeP6K8QtYU9jUvoHy8ZAl
	/BC6u8//BPWzIaz7MEQaEVc7sZ3eQLZAqSWQaAD+06+USnLPFkr+eFP97UC9sk21WwTZUlZPu7D
	e8Gj3VSKosTEkVKjmp/VjxGbQHczwSIQ43VrDGxQSP4BT6BV6VimF5MtxsjouV/Y/q9/L7sJ7s4
	ERenmRUiheWWoBrbKrL1Cph2nKhJpqyWA43aXIApOHE70+xDPsEoe/mjDYnLByiah3txY7siDWr
	QpcW9jFSZ+WuFQSW8OiI0gbESAyU05sDsUcbadEIY0qaDVL7I9Ex1HlP5aI0zOThqTVczMNITpI
	nnjCHUQ==
X-Google-Smtp-Source: AGHT+IGsatLibM086u8+LkY4mlbeaehvenUN3fIYGbHsW5uzoklPvG41UxpitqHcehvR+B8WOelEuQ==
X-Received: by 2002:a17:90b:2e88:b0:2ff:6a5f:9b39 with SMTP id 98e67ed59e1d1-305320af145mr14739300a91.18.1743421059841;
        Mon, 31 Mar 2025 04:37:39 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d55fbasm7028733a91.15.2025.03.31.04.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 04:37:39 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] HID: uclogic: Add NULL check in uclogic_input_configured
Date: Mon, 31 Mar 2025 19:37:32 +0800
Message-Id: <20250331113732.10722-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() can return a NULL pointer on failure, but this
returned value in uclogic_input_configured is not checked.

Add NULL check in uclogic_input_configured, to handle kernel NULL
pointer dereference error.

Fixes: dd613a4e45f8d("HID: uclogic: Correct devm device reference for hidinput input_dev name")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/hid/hid-uclogic-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index d8008933c052..f8708a1ec7cc 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -144,9 +144,12 @@ static int uclogic_input_configured(struct hid_device *hdev,
 		}
 	}
 
-	if (suffix)
+	if (suffix) {
 		hi->input->name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
 						 "%s %s", hdev->name, suffix);
+		if (!hi->input->name)
+			return -ENOMEM;
+	}
 
 	return 0;
 }
-- 
2.34.1


