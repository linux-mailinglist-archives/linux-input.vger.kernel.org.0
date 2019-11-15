Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF5B5FD477
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2019 06:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfKOFgt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Nov 2019 00:36:49 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38609 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfKOFgt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Nov 2019 00:36:49 -0500
Received: by mail-pg1-f193.google.com with SMTP id 15so5277840pgh.5;
        Thu, 14 Nov 2019 21:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jq+NcdnyD4uXSFNngY13nScnZ6L+zxq0uI02vlWPylI=;
        b=VqkyIVqvJrPZDtdXGg0Hmpxp/EO/bgquARkROY8lDUY0G+aww7QAf6j3YtSMq4NfS/
         UlXJNwtdVyXJzEHEAx6QcCJd4CtQai/8PZ27DyWR5ZZ76Y85u+aFXeq9o9rZsMtSFyhm
         eZxAM3PuKkJ3/jlVO6QKkvbRyLgVVuJqg5jFhT3lKEDpEJt6lDD4jjuA2Lx+hKjrMQJK
         k6dXZSThiaQJoM11ayiNc/v0Nyud6bTinMTxX2ptBmQrejjvIA8ZWY8qUSt+E3Z6j32O
         xIqlNCNpQzI0aCHEOtpOT6PZOiRDGBfsYwixp70FrahCJX3aTIonrsEuq5J4866i5BaK
         +f8Q==
X-Gm-Message-State: APjAAAUmlBJKxXgKXPhWtl7MvPqX9ZosvetMU98ybYtBihLquNawU634
        G93fAbzKu6phIpZSiHIT640=
X-Google-Smtp-Source: APXvYqz+sH25cah2cIgJnfrsEaJ696abhQoJpa8A12rE4BupCaP9ujWJrC1dpt0jpHCVHTkMk4KTvg==
X-Received: by 2002:a63:f48:: with SMTP id 8mr14575436pgp.329.1573796208771;
        Thu, 14 Nov 2019 21:36:48 -0800 (PST)
Received: from localhost (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
        by smtp.gmail.com with ESMTPSA id d6sm8513192pfn.32.2019.11.14.21.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 21:36:47 -0800 (PST)
From:   You-Sheng Yang <vicamo.yang@canonical.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Hui Wang <hui.wang@canonical.com>
Cc:     You-Sheng Yang <vicamo.yang@canonical.com>,
        HungNien Chen <hn.chen@weidahitech.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: i2c-hid: remove orphaned member sleep_delay
Date:   Fri, 15 Nov 2019 13:36:46 +0800
Message-Id: <20191115053646.3107290-1-vicamo.yang@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This was introduced in commit 00b790ea545b ("HID: i2c-hid: Add a small
delay after sleep command for Raydium touchpanel") which has been
effectively reverted by commit 67b18dfb8cfc ("HID: i2c-hid: Remove
runtime power management").

Signed-off-by: You-Sheng Yang <vicamo.yang@canonical.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 04c088131e04..adfe344bc786 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -157,8 +157,6 @@ struct i2c_hid {
 
 	bool			irq_wake_enabled;
 	struct mutex		reset_lock;
-
-	unsigned long		sleep_delay;
 };
 
 static const struct i2c_hid_quirks {
-- 
2.24.0

