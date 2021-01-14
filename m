Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6976B2F6474
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 16:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbhANPYg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 10:24:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbhANPYf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 10:24:35 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF1FC0613D6
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 07:23:36 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id y17so6158561wrr.10
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 07:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=emmStX9qhOYOd+dblyHI68RIhRy+T5Rtfe1f4/LeDqU=;
        b=tx/SQRmaSa7vWznaqpwEIsGMlMwxLts4yZ5xZOOW2lVDXeap7iWwpatlHL0aBdMQya
         YwxqYpz7MjszELUgKs5R1s8nz5EKnpCRFeOZI2hbNgaUHUzJI8WLeT8ffMgzvo8adAJr
         Fd1F0uyyoHpqeO3Zasr0n4VYlzCC5CE/XSn/4vRJZ0NhdjlKQYyQFjyza/7aemVOojPE
         6A8eymDVqsNeO7ciCAFI7HTH4Qqha0ciywS/Ox0fTqi4Qbr/CaOeQRDHDWwVxnO/eURw
         h5ZLUSz06kPsAXlw3rPdZIoBlIWpbZf7bqRcV4K9J40OGRjcvTYWtg6Q93qv9iGeTyXh
         wvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=emmStX9qhOYOd+dblyHI68RIhRy+T5Rtfe1f4/LeDqU=;
        b=C2ArxaEANZb3i8aeBRubKBU+XsLZKnV/sruktU2o4LutnsyV+aY7eN8Q2mvZrgIXKO
         EIpYdZqxHVO26kY6LFXOrdBX9aDhpPV8bcNofk0Fokv2aG95oXd8NuGjYySmDQOlfhgn
         iu3ir/QTHERexBAxTNanAbfCvfu4vPmy2PoWBQBs/HappFv0cLz66q85VycVpfG7XwPE
         JKFrCOYY+o+wWdVFooSZKRjKtj2Zj7HQbzyAzfbjP0S/wN0WhmOKIWOWPPaqpzefaLpP
         WdKU33a/uYlGsIfG0kOesxb5K/fOCRJR7b+NM9aN887kfY0WlSUXQCA4qexthWUTAW1z
         j1LA==
X-Gm-Message-State: AOAM530p5s58T66pkGYkXygxJnoiIKRs3DSdk9P/KoYd1tBcanGAktXv
        q03VgKItC3iaQOZKCXanj5wG4w==
X-Google-Smtp-Source: ABdhPJygzGegSOhqoPC1wqYCq4XYpIX5A7Wq7t9xprCcdvYgsoV0FcfL9IL3RDbPH7iC4s6K4MT6VA==
X-Received: by 2002:adf:8b15:: with SMTP id n21mr8321366wra.426.1610637815098;
        Thu, 14 Jan 2021 07:23:35 -0800 (PST)
Received: from dell.default ([91.110.221.178])
        by smtp.gmail.com with ESMTPSA id e15sm10777713wrx.86.2021.01.14.07.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 07:23:34 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Sangwon Jee <jeesw@melfas.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: [PATCH 2/5] input: touchscreen: melfas_mip4: Mark a bunch of variables as __always_unused
Date:   Thu, 14 Jan 2021 15:23:20 +0000
Message-Id: <20210114152323.2382283-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114152323.2382283-1-lee.jones@linaro.org>
References: <20210114152323.2382283-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dmitry requested to keep these around for the purposes of documentation.

Fixes the following W=1 kernel build warning(s):

 drivers/input/touchscreen/melfas_mip4.c: In function ‘mip4_report_touch’:
 drivers/input/touchscreen/melfas_mip4.c:474:5: warning: variable ‘size’ set but not used [-Wunused-but-set-variable]
 drivers/input/touchscreen/melfas_mip4.c:472:5: warning: variable ‘pressure_stage’ set but not used [-Wunused-but-set-variable]
 drivers/input/touchscreen/melfas_mip4.c:469:7: warning: variable ‘palm’ set but not used [-Wunused-but-set-variable]
 drivers/input/touchscreen/melfas_mip4.c:468:7: warning: variable ‘hover’ set but not used [-Wunused-but-set-variable]

Cc: Sangwon Jee <jeesw@melfas.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/touchscreen/melfas_mip4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index c0050044a5a9e..225796a3f5460 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -465,13 +465,13 @@ static void mip4_report_keys(struct mip4_ts *ts, u8 *packet)
 static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
 {
 	int id;
-	bool hover;
-	bool palm;
+	bool __always_unused hover;
+	bool __always_unused palm;
 	bool state;
 	u16 x, y;
-	u8 pressure_stage = 0;
+	u8 __always_unused pressure_stage = 0;
 	u8 pressure;
-	u8 size;
+	u8 __always_unused size;
 	u8 touch_major;
 	u8 touch_minor;
 
-- 
2.25.1

