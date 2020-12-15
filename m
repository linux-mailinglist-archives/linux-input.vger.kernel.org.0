Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1D02DA6B8
	for <lists+linux-input@lfdr.de>; Tue, 15 Dec 2020 04:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbgLODWC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Dec 2020 22:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgLODVy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Dec 2020 22:21:54 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C25EC061793
        for <linux-input@vger.kernel.org>; Mon, 14 Dec 2020 19:21:14 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id j1so10209601pld.3
        for <linux-input@vger.kernel.org>; Mon, 14 Dec 2020 19:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raydium-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=z3HadxZMMXHx5HALdRJ2q0xWXavqTdJ5JWmtMfG9Cpo=;
        b=oq/LojT2JKKS6Edaakm/tIyMXaB785z3aBnJuiP2VDWxTAF6Fq4SZZSMPYvyw0nezy
         I2kc5xLwpWnd4tDA+84E/AR4KPQURF1GS1E3TNw+5jT3y5RuN32CJHJlDBiEIl5ENVKo
         tnsP5M/y0HXhtkWE1vwrEc1GuzuDQ0+D1Ybutq+8NaD2a5dOXgcNKDcbEptN5QNPbr9U
         3MWtc4ia9fi9AMLYPJgJkiXG+PdmrRWSZZFRIET1vME3oVJtW2xPvsKwi56iLJANfDkX
         tVPZ7peT/uVirCmtgHoyhJInOjl2uEgiWIX0FI99CSLkgYddRDJ3XzU4HJyDdSFR93A8
         Bbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=z3HadxZMMXHx5HALdRJ2q0xWXavqTdJ5JWmtMfG9Cpo=;
        b=byx37TIKX2u+fYCPH+JMj9S0NMkRnpo41c/BCCXAN8/LuwlFDW7/wz4wIEi3oBOMXG
         lYB+S1+WF26ijxiG+1SRqLFj8GHbY4yb4wxH9PanSgluAMqUEb6IJ0srxcDX52SFkjOA
         gHJAl5a4M+B080S8LdpB3fxQr262AHMtzgUoU0eg4KmPnD2cyt/gVkxPEJL2ZHHWo0HK
         5WqOjTaxbNonjX9SVKt66/7n7lM8InGVD4zF4lUbPwszgY2yMlupaBfmHAS1AYzWhhUO
         4w1Wzllsj+j8PbVs1SttBmvpM9ttmkQKyUZiy4KUEobbEw+OkM6sx4f/8QU34t6CMphE
         NB/Q==
X-Gm-Message-State: AOAM532vU2HawldWQg3STdm8KE+fIXRTO5SYcGUfmfsK9MENpyEHFaur
        UlZ6r2djH3X8iTXeg86/ONmLLQ==
X-Google-Smtp-Source: ABdhPJwgyVuT3xAmaj+S8U/UcaSwI21pR5mHBW+ILJzbipzSqAtEqOgLtCCdLtwCYa5FkbUt/6btMQ==
X-Received: by 2002:a17:902:7b84:b029:da:60e0:9d38 with SMTP id w4-20020a1709027b84b02900da60e09d38mr25750106pll.55.1608002473520;
        Mon, 14 Dec 2020 19:21:13 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e3d9-619c-a02e-47f2-1ebf-215e.emome-ip6.hinet.net. [2001:b400:e3d9:619c:a02e:47f2:1ebf:215e])
        by smtp.gmail.com with ESMTPSA id h17sm20445579pfo.220.2020.12.14.19.21.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Dec 2020 19:21:12 -0800 (PST)
From:   "jeffrey.lin" <jeffrey.lin@raydium.corp-partner.google.com>
To:     dmitry.torokhov@gmail.com, furquan@google.com,
        seanpaul@chromium.org, rrangel@chromium.org,
        dan.carpenter@oracle.com
Cc:     jeffrey.lin@rad-ic.com, KP.li@rad-ic.com,
        jeffrey.lin@raydium.corp-partner.google.com,
        calvin.tseng@rad-ic.com, simba.hsu@rad-ic.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH] Input: raydium_ts_i2c: Do not send zero length 
Date:   Tue, 15 Dec 2020 11:21:06 +0800
Message-Id: <1608002466-9263-1-git-send-email-jeffrey.lin@raydium.corp-partner.google.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add default write command package to prevent i2c quirk error of zero
data length as Raydium touch firmware update is executed.

Signed-off-by: jeffrey.lin <jeffrey.lin@rad-ic.com>
BUG=b:174207906
TEST=Successfully tested update Raydium touch firmware over 100 times
Change-Id: I311b0d26d7642bb800547cd0e87013be17cb7e1b
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

