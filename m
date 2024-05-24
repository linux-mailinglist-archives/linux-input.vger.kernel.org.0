Return-Path: <linux-input+bounces-3819-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0778CE5B0
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 15:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 787771F21ECD
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 13:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B6086640;
	Fri, 24 May 2024 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdjqiMk7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7F886263;
	Fri, 24 May 2024 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716555967; cv=none; b=rpBF6IH5Bx8uR+dCxWhoqWuYyWFAzH522ouncyBSVfDBkvALuI5uHf1ZeYNtV/Eeh7M7yEObQi6rzYSE3u9hywvMhT5y05GogqZf+G0vr2B+YitbT7bwMcHcSwkkDECD0vj3foODRzBoWrWaXYyaOcj7NL+JLvgW+6hM0wjFTeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716555967; c=relaxed/simple;
	bh=DoWs5BPUI9cxJ0X+dQ+0JUONSFZr+7WHS2zegtsXtpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tlv76QYbo+/0St8SB6X8cXN5lMXqqAKksFu1GAl4qhwFwNXmKdT8V/eZgY1+wcdipfeFsvsNHpc0GiVsTLR8vKPgZzsntzHBy6r/aVTPKtcloIvWEMWg2S2Zmq1O7yE4lfYbwU5o/k7n1mGkh8feeFiBXJTBcv8HZUmkcpJCBBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdjqiMk7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-354e0cc9c5cso2654095f8f.0;
        Fri, 24 May 2024 06:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716555964; x=1717160764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=afPh9P2vN9D4alg4S+/YGRy8MrT0d+ItioNuY/3leJk=;
        b=PdjqiMk75wUcHYpJtysTt2CmehJMC2JZVkkqyBUYsPdvCNLhRW0sO6lFfjS60RNMNw
         q2nNlRseL/U8s9xeGNyzmsVYLRg5oKWSruhcOzTQZ0+FKjCr+B3cM0qMwQ7XFT9YeS16
         B/EKjGflkrr+pfzZ3Ze8W4u/992ySF/ODGbMoP0ZUiO0Hqa6D6eVfTPnFl+NDKELe4f6
         eo+jOOXaHKIKVMyH+7XEQw9w5o3ni59dZkOpw4TXWu64eZ76Mq2QKdBz7Vxyr0KTJ6vG
         jRSEx/vbFprkKIrjU1+Qpm7ZikVPW5aJ0aVInHR1kX/uURcUS0+Say9I2rDEqhOxhD2y
         ALzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716555964; x=1717160764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=afPh9P2vN9D4alg4S+/YGRy8MrT0d+ItioNuY/3leJk=;
        b=ds5uLIvu5KOl77vQm1eMDskE6wVEnd/WlTQZpiVcDoPR2PMn+Bh74Oiu4wUbxAnlpF
         /w7JgCed39rwuClz+4CJ6w649kRtZXv8uICNrxsxGRihvc83rasDzQQWJD+K/DJHeW7p
         AGVquew8TByjF5lSqiZL0YShkL9a3PtuZcRy17Mjj7XT8o04xoB04qGOWikJkOpF/SbQ
         A5GTU7b9yDL9lL6sYCoi1M3PBYByMeJ4OxAAEx/9gluGm7/ObWuBZ7n936lksJboe28i
         A8lGaION8tOj2Ekd1MolyorLLjWZSdge0c6d+DwdPApPgaKqxtpQ/No27znSrB7plBgI
         gGaw==
X-Forwarded-Encrypted: i=1; AJvYcCUsH/y0Edax3r8uKcMp1WlLqHARgVz9SBPrQ+bVlUK9DQCyZvzm/Jt3DO3c/pC6oWXJil1A7Ia3elXATLmH5E5+7Iujl4i+LseksMocPU7F80cLoXU2MhNK18CQ/FAp9FU9k1gogMTrLVc=
X-Gm-Message-State: AOJu0YwGwTU6nYmY9TdoPn29uCFwkPbtQWmQatZk5ea6gVYt/DuKCt/E
	6p+6ft9qcbZQ2qZTNTZ4nO2MmDNEQaUqZULwFkmqFUrq2AQiBv8V
X-Google-Smtp-Source: AGHT+IGPXI9JqXB12zg9HUB94hfAt4AWZBgnbpkF/gJYhJZtb1fO/ujOTpFiS0fhn/EduG7W2NCjEw==
X-Received: by 2002:adf:e546:0:b0:354:e0c9:f620 with SMTP id ffacd0b85a97d-35526c38c7bmr1344527f8f.24.1716555964301;
        Fri, 24 May 2024 06:06:04 -0700 (PDT)
Received: from fedora.. ([213.94.26.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7db6bsm1595633f8f.2.2024.05.24.06.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 06:06:03 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	lains@riseup.net,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] HID: logitech-dj: Fix memory leak in logi_dj_recv_switch_to_dj_mode()
Date: Fri, 24 May 2024 15:05:39 +0200
Message-ID: <20240524130600.275577-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a memory leak on logi_dj_recv_send_report() error path.

Fixes: 6f20d3261265 ("HID: logitech-dj: Fix error handling in logi_dj_recv_switch_to_dj_mode()")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-logitech-dj.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 3c3c497b6b91..37958edec55f 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1284,8 +1284,10 @@ static int logi_dj_recv_switch_to_dj_mode(struct dj_receiver_dev *djrcv_dev,
 		 */
 		msleep(50);
 
-		if (retval)
+		if (retval) {
+			kfree(dj_report);
 			return retval;
+		}
 	}
 
 	/*
-- 
2.45.1


