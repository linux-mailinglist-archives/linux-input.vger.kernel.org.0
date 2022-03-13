Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D91B4D76DB
	for <lists+linux-input@lfdr.de>; Sun, 13 Mar 2022 17:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235038AbiCMQgf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Mar 2022 12:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235060AbiCMQgb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Mar 2022 12:36:31 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E0E2CCBA
        for <linux-input@vger.kernel.org>; Sun, 13 Mar 2022 09:35:23 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id y22so16780351eds.2
        for <linux-input@vger.kernel.org>; Sun, 13 Mar 2022 09:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V78a4T+XxMalGYKe1sIzEqFdtRWisjMfkHNLxFh+Xuk=;
        b=XTkK6z7vxOzseSGbtAQvG5go5+ktP97qsgjdzPt3HpokUKpRyk2g0xa9zIsCMcwuXs
         dqsw14h6D5eZwx/aiB1bfqlnragIxAYov71V02IIakcN8UnF5Tv1AWveH3njpAQY82mw
         8YUeao8pSO1MjGMcBU2p2uZWRiLOgIy31HnOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V78a4T+XxMalGYKe1sIzEqFdtRWisjMfkHNLxFh+Xuk=;
        b=Jt8DMcNZSnhdgt8CZNN24Xyxp3kfFoqwogwIUg3awpwQ+uMa2Nm/B/yhZz0lRrw3jK
         PQF20pp9QWKgDgBWANsuAw34/nL8XJyqbi2KVuAJDO7wlO17icgB97NRVdSGPoer0WHv
         +ERBlVeM5QAYev15vBuQphmI72mJXPHKPEzy6fjyNERkC98d3F8aWwnqkFkJQjDzC3L2
         Xb8Ic1ow3DlzFCEXQMoPfXeTnRW20MFgCE9cf8mL7Rv9AinMKeVXHbNXb5d+2BtA4Ry3
         LaFPx/xYH7wDfyVW6xmhXarQaiJcI9bRRHUVpsfjizQaI0vrMz4S24tLb5gceDmJmeRY
         3mMQ==
X-Gm-Message-State: AOAM530J/adkA47VVsVRKfmQCEGd/Q+y7TcC+5rvdO/7gdH3BBvGHxDy
        NsA/uZm3bpXirhZEqnQzX7/t1Q==
X-Google-Smtp-Source: ABdhPJyQgPTdB9CpPHlE1MAz0LMJdqoavN90TU1RV/koboT0UKMO4YMHJa2j6gSbUgDSS/hUSF/DDQ==
X-Received: by 2002:a05:6402:1d4d:b0:416:c489:b784 with SMTP id dz13-20020a0564021d4d00b00416c489b784mr13581374edb.304.1647189321604;
        Sun, 13 Mar 2022 09:35:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id qt22-20020a170906ecf600b006da6ef9b820sm5725028ejb.112.2022.03.13.09.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 09:35:21 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org
Subject: [PATCH v3 6/6] Input: edt-ft5x06 - show crc and header errors by sysfs
Date:   Sun, 13 Mar 2022 17:35:03 +0100
Message-Id: <20220313163503.5183-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220313163503.5183-1-dario.binacchi@amarulasolutions.com>
References: <20220313163503.5183-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

M06 sends packets with header and crc for data verification. Now you can
check at runtime how many packets have been dropped.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Add Oliver Graute's 'Acked-by' tag to:
  * Input: edt-ft5x06 - show model name by sysfs
  * Input: edt-ft5x06 - show firmware version by sysfs
- Fix yaml file. Tested with `make DT_CHECKER_FLAGS=-m dt_binding_check'.

 drivers/input/touchscreen/edt-ft5x06.c | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index bab92344b2ea..3deb66d67469 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -133,6 +133,8 @@ struct edt_ft5x06_ts_data {
 
 	struct edt_reg_addr reg_addr;
 	enum edt_ver version;
+	unsigned int crc_errors;
+	unsigned int header_errors;
 };
 
 struct edt_i2c_chip_data {
@@ -181,6 +183,7 @@ static bool edt_ft5x06_ts_check_crc(struct edt_ft5x06_ts_data *tsdata,
 		crc ^= buf[i];
 
 	if (crc != buf[buflen-1]) {
+		tsdata->crc_errors++;
 		dev_err_ratelimited(&tsdata->client->dev,
 				    "crc error: 0x%02x expected, got 0x%02x\n",
 				    crc, buf[buflen-1]);
@@ -238,6 +241,7 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
 	if (tsdata->version == EDT_M06) {
 		if (rdbuf[0] != 0xaa || rdbuf[1] != 0xaa ||
 			rdbuf[2] != datalen) {
+			tsdata->header_errors++;
 			dev_err_ratelimited(dev,
 					"Unexpected header: %02x%02x%02x!\n",
 					rdbuf[0], rdbuf[1], rdbuf[2]);
@@ -552,6 +556,30 @@ static ssize_t fw_version_show(struct device *dev,
 
 static DEVICE_ATTR_RO(fw_version);
 
+/* m06 only */
+static ssize_t header_errors_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", tsdata->header_errors);
+}
+
+static DEVICE_ATTR_RO(header_errors);
+
+/* m06 only */
+static ssize_t crc_errors_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", tsdata->crc_errors);
+}
+
+static DEVICE_ATTR_RO(crc_errors);
+
 static struct attribute *edt_ft5x06_attrs[] = {
 	&edt_ft5x06_attr_gain.dattr.attr,
 	&edt_ft5x06_attr_offset.dattr.attr,
@@ -561,6 +589,8 @@ static struct attribute *edt_ft5x06_attrs[] = {
 	&edt_ft5x06_attr_report_rate.dattr.attr,
 	&dev_attr_model.attr,
 	&dev_attr_fw_version.attr,
+	&dev_attr_header_errors.attr,
+	&dev_attr_crc_errors.attr,
 	NULL
 };
 
-- 
2.32.0

