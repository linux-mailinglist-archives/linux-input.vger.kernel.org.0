Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B28A2DABE6
	for <lists+linux-input@lfdr.de>; Tue, 15 Dec 2020 12:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728822AbgLOLVX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Dec 2020 06:21:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728813AbgLOLVH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Dec 2020 06:21:07 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7236BC0617A6
        for <linux-input@vger.kernel.org>; Tue, 15 Dec 2020 03:20:27 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id i7so3338121pgc.8
        for <linux-input@vger.kernel.org>; Tue, 15 Dec 2020 03:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raydium-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=KDZfAWhL7geC34mCQgWIQj/onDO2eDN30FnzkR+Q6bc=;
        b=O4b2knP7K/egh01xp4fqwR+sJ/EO41cfefyFMIe/IQx4HYw0cG27crJKB/zj6D4E1a
         JWeoTCQW3B6a4sF4zGZEPLzq5LTwfR6i5KOYKOfuJPQuxNMDvMH0YKLrAUWNrOS7asbC
         Axl4bQPVmCPRXhzFDUOK7roHxg0lM0VIf/aBeSEejbXJloibJsSkYQGxltX5RPCooKTO
         bjzq17o7MA055ytS9wXcSi3Fm86Aa7yEDwIdk5Tmmwox0Ib2YBRgBenRluBpmmEct5cA
         L505ktLqAnfG1GY9tNuZvR3LF/dLYxDI0U/wKgMZS5vZXjhzIwG26QWn9eRy+olBP0DK
         4S/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KDZfAWhL7geC34mCQgWIQj/onDO2eDN30FnzkR+Q6bc=;
        b=FZP1thxFWf75JvxPq6ynqGB1qsZP2Jd0gMKUUr/Zm2Xc4DPFtwTp4RqS/4x63H2NWK
         aRvjkZQs80rpfI5fFZV+BZJu+3+Hftkvpd3/5t1DqMP3tLKjdPl2uS5rj54EmEPx73sS
         jXlGFkwW1wmLJhO2TDcwK88BHeBQ89jCeml5M2W61yibX/fz23L2w+kjr2QU4+OOo1Ew
         7HMQDmYdIoxxcnZvDs08LpUEMQnNYA7yxT1V7lSrz+EwUU7njGvH0bDXGRSZvxi8Iwg7
         lHRMCq4qW+Ast0uUn0u+0o3pN1yy2aVQITD4jrcMa4m4YUVGICLhp53N8jAZx+sYL28B
         /JgA==
X-Gm-Message-State: AOAM533/WwMWzJLGt4YlCy92OfzkkszqdX90WNcRRWfYD8YwohYHN3mE
        9q5RM50nzdFajCsfg1SgS+jAhw==
X-Google-Smtp-Source: ABdhPJyfTJX2ErQFQxFsZ2dXXpe3NpYKKXcM7xEBfup4cFAXfAWfHDoBlyNy91SM3W7S17aip26voQ==
X-Received: by 2002:a65:6145:: with SMTP id o5mr28765400pgv.186.1608031226856;
        Tue, 15 Dec 2020 03:20:26 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e3d9-619c-a02e-47f2-1ebf-215e.emome-ip6.hinet.net. [2001:b400:e3d9:619c:a02e:47f2:1ebf:215e])
        by smtp.gmail.com with ESMTPSA id p15sm23195094pgl.19.2020.12.15.03.20.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Dec 2020 03:20:26 -0800 (PST)
From:   "jeffrey.lin" <jeffrey.lin@raydium.corp-partner.google.com>
To:     dmitry.torokhov@gmail.com, furquan@google.com,
        seanpaul@chromium.org, rrangel@chromium.org,
        dan.carpenter@oracle.com
Cc:     jeffrey.lin@rad-ic.com, KP.li@rad-ic.com,
        jeffrey.lin@raydium.corp-partner.google.com,
        calvin.tseng@rad-ic.com, simba.hsu@rad-ic.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH] Input: raydium_ts_i2c: Do not send zero length 
Date:   Tue, 15 Dec 2020 19:20:17 +0800
Message-Id: <1608031217-7247-1-git-send-email-jeffrey.lin@raydium.corp-partner.google.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add default write command package to prevent i2c quirk error of zero
data length as Raydium touch firmware update is executed.

Signed-off-by: jeffrey.lin <jeffrey.lin@rad-ic.com>
---
 drivers/input/touchscreen/raydium_i2c_ts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 603a948460d64..4d2d22a869773 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -445,6 +445,7 @@ static int raydium_i2c_write_object(struct i2c_client *client,
 				    enum raydium_bl_ack state)
 {
 	int error;
+	static const u8 cmd[] = { 0xFF, 0x39 };
 
 	error = raydium_i2c_send(client, RM_CMD_BOOT_WRT, data, len);
 	if (error) {
@@ -453,7 +454,7 @@ static int raydium_i2c_write_object(struct i2c_client *client,
 		return error;
 	}
 
-	error = raydium_i2c_send(client, RM_CMD_BOOT_ACK, NULL, 0);
+	error = raydium_i2c_send(client, RM_CMD_BOOT_ACK, cmd, sizeof(cmd));
 	if (error) {
 		dev_err(&client->dev, "Ack obj command failed: %d\n", error);
 		return error;
-- 
2.26.2

