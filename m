Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0D9B907E5
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 20:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbfHPSta (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 14:49:30 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35661 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfHPSta (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 14:49:30 -0400
Received: by mail-pf1-f194.google.com with SMTP id d85so3565421pfd.2
        for <linux-input@vger.kernel.org>; Fri, 16 Aug 2019 11:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b/WcelaoGr/NNDEERBcLYe+oid89ukM4Ae+l9dY401g=;
        b=iHACLq8icSwd5+8QHZDMd4ChFiyvD93KI/2ZstmV7AvVFeGJ7XE6Hzla9quTsCYFut
         Mze8fOdy+j1GiFvweoAYrzNGyHNE094daJpCtG7Mq+BuEty65Vi10aXh5qqpdW713Dsd
         E/EtNRSbmjDRaKoA9ljL6MXwf3s6n68c/M15YDRmweFbtes7eSV3g3yFlta2tp2Ynlw1
         +jjfyQn2IMV1FW6uspPvarnNKY9xJ/kn0pFLjRHEJD3F+oByxdxnsLDFH3noGNdp596s
         uEMgLWmjgfvtvzfVVXSQj83KAOaz2OVo2NBx8xEpTy4MPfBapaMaAkk63ZKjpocgNlNY
         D6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b/WcelaoGr/NNDEERBcLYe+oid89ukM4Ae+l9dY401g=;
        b=SDj7HeaJxkWyMvKo8+EkekHeolemMv44wwVxvg7EOrUzyh8eGeTfZBW5mcu+H7Aqhd
         31+eqtlEbWs8a0At/x2gse1Uty7dyWoGQRMJsr7IK3LIaE68xTLhOIBP7J/IO6ibuu3r
         LNajDpI0eW87i/gHTgEhJXpIc+fS0RBf3NkaRd9fRawFNHWlcOGOSy+G/4v6swVyDLIp
         mLbF1CBP5KyhJVRFZJl2UBddEe4MD1rXYyhkZGSEVJG5n/OAI6qgqnwiFiCTWJi53xyj
         1OjAjtYxhBaA0/5tCjbOZkp6C/Sr4g9b9PgUrEamwOHvJhXNEMNX9IOLW6VQh+uCEaBa
         2FAA==
X-Gm-Message-State: APjAAAVFULSI5T+GeLr0vW4meX8BC4dOCWniPyOTfrJI5oHQBqNireVP
        fwr/QlVfgtV33ozfunxGjF1ZDtjf
X-Google-Smtp-Source: APXvYqxIrpO8kSu0zklPJFFj7c6LjA/HBIQeQzJVGf09brE5eMOM9Xjm/BSshAj74nIZMgLGM6t7gg==
X-Received: by 2002:a17:90a:bf0e:: with SMTP id c14mr7643601pjs.140.1565981369735;
        Fri, 16 Aug 2019 11:49:29 -0700 (PDT)
Received: from horus.lan (75-164-171-222.ptld.qwest.net. [75.164.171.222])
        by smtp.gmail.com with ESMTPSA id g8sm5462550pgk.1.2019.08.16.11.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 11:49:29 -0700 (PDT)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH] Input: wacom_w8001 - Allocate additional space for 'phys'
Date:   Fri, 16 Aug 2019 11:49:27 -0700
Message-Id: <20190816184927.24525-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

GCC warns that the output of our call to 'snprintf' in 'w8001_connect'
may be truncated since both 'serio->phys' and 'w8001->phys' are 32 bytes
in length. Increase the amount of space allocated for the latter to
compensate.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/input/touchscreen/wacom_w8001.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/wacom_w8001.c b/drivers/input/touchscreen/wacom_w8001.c
index 3715d1eace92..691285ace228 100644
--- a/drivers/input/touchscreen/wacom_w8001.c
+++ b/drivers/input/touchscreen/wacom_w8001.c
@@ -27,6 +27,8 @@ MODULE_AUTHOR("Jaya Kumar <jayakumar.lkml@gmail.com>");
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL");
 
+#define W8001_MAX_PHYS		42
+
 #define W8001_MAX_LENGTH	13
 #define W8001_LEAD_MASK		0x80
 #define W8001_LEAD_BYTE		0x80
@@ -89,7 +91,7 @@ struct w8001 {
 	unsigned char response_type;
 	unsigned char response[W8001_MAX_LENGTH];
 	unsigned char data[W8001_MAX_LENGTH];
-	char phys[32];
+	char phys[W8001_MAX_PHYS];
 	int type;
 	unsigned int pktlen;
 	u16 max_touch_x;
-- 
2.22.1

