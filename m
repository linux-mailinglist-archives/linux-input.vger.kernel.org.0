Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 571F147C764
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241746AbhLUTR6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241759AbhLUTR6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:58 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10ABC061401
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:57 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id j18so86368wrd.2
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RRmjQmiLAYg0+TIS09+L7wuhdmQE94HxtricNmWM20Y=;
        b=qUXEflL0pGsis0SgzOIkdiGfquAN4cjAWlrMbqNFM/jxFqRX5hR0vPh3ZAtbemaa/H
         +sxFE0OO0uqky+MJwNMxCVeAYDu1mD+9zHZ3DqCRQ2Kkmc+Ztmggyv/IE7DNdteEydjw
         KUjcovr1idpGLqk1r71nh63rF7NkNPYK7UjdpZd5zWoB9LTjBBx3UvgdWHv+LGJE5zi+
         BPZbT2SfwB6NOTpyguYJUNX0HI+2MMee6EDcQMm6vJSk5G7v+qvCJ1nCBxCpiBWP+bTB
         tBQFI2tQHNohi4emqna88DkAeFrt9v21r9XEoO2h7UypnmJd/j3YYEuQiLf0uJC78UJr
         zMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RRmjQmiLAYg0+TIS09+L7wuhdmQE94HxtricNmWM20Y=;
        b=Ko3qDwO2+LMrBjdaHNRgBIu/z7I8eNLx13X0m4ws2jhqpjz6Jd5EQ7g0i2lhzN1RvH
         fSkGD7SlVsOCzpDmPa5ALy7uqe/19+Xrk3mcWVdSdfhzGSOfD5mMzpOsFANgTQQg62nw
         1TAUIbZ6P/AKbep2rboD0niBeMPDxqA2dtR4HOE5B5uMIfco+XjwtzoZV5MDMEun80+Y
         o3LwSuklYcKOZOH88YcoVdk0gfYbmFuv3b0mc2FzpOvlBH1l4pb14ouQL7UZHeSmq/bK
         h3HvsRj2O8lwDYReXbWGQpL3MbfNeg9taHID3UywizBxR01fyBa0eYjavg6A4k8K3KHt
         VN5Q==
X-Gm-Message-State: AOAM530IQ7I7YT3A22sznLZiCRyrCkufa+JaSv15mtNRxFfg/HwvdXEy
        sjwARre04smS+ivWd4jJudKMbCdkRgJ1Oz/uaHw=
X-Google-Smtp-Source: ABdhPJzy37qnyMbz2zI3O6yonFi+vxGqXiABw4jir47okWfKb0oAtuIoM+bmqISlYl0qTA6JyqZCVw==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr4052468wri.158.1640114276242;
        Tue, 21 Dec 2021 11:17:56 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:55 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 18/18] HID: i2c-hid: fix i2c_hid_set_or_send_report
Date:   Tue, 21 Dec 2021 19:17:43 +0000
Message-Id: <20211221191743.1893185-19-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If command & data registers are to be used and report ID >= 0xF
use the sentinel value for report ID in the command.
Do not alter the report ID itself as it needs to be inserted into the args
buffer. If output register is to be used there is no need to insert
report IDs >= 0xF.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 517141138b00..8cb925c86bbf 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -341,6 +341,7 @@ static int i2c_hid_set_or_send_report(struct i2c_client *client, u8 reportType,
 	u16 size;
 	int args_len;
 	int index = 0;
+	u8 cmdReportID = reportID;
 
 	i2c_hid_dbg(ihid, "%s\n", __func__);
 
@@ -357,16 +358,15 @@ static int i2c_hid_set_or_send_report(struct i2c_client *client, u8 reportType,
 	if (!use_data && maxOutputLength == 0)
 		return -ENOSYS;
 
-	if (reportID >= 0x0F) {
-		args[index++] = reportID;
-		reportID = 0x0F;
-	}
-
 	/*
 	 * use the data register for feature reports or if the device does not
 	 * support the output register
 	 */
 	if (use_data) {
+		if (reportID >= 0x0F) {
+			args[index++] = reportID;
+			cmdReportID = 0x0F;
+		}
 		args[index++] = dataRegister & 0xFF;
 		args[index++] = dataRegister >> 8;
 		hidcmd = &hid_set_report_cmd;
@@ -384,7 +384,7 @@ static int i2c_hid_set_or_send_report(struct i2c_client *client, u8 reportType,
 
 	memcpy(&args[index], buf, data_len);
 
-	ret = __i2c_hid_command(client, hidcmd, reportID,
+	ret = __i2c_hid_command(client, hidcmd, cmdReportID,
 		reportType, args, args_len, NULL, 0);
 	if (ret) {
 		dev_err(&client->dev, "failed to set a report to device.\n");
-- 
2.34.1.307.g9b7440fafd-goog

