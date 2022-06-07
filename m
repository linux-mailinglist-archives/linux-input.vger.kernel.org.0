Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA94253FA8A
	for <lists+linux-input@lfdr.de>; Tue,  7 Jun 2022 11:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240366AbiFGJ4b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jun 2022 05:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240363AbiFGJ4R (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jun 2022 05:56:17 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CFB7E64F6
        for <linux-input@vger.kernel.org>; Tue,  7 Jun 2022 02:56:16 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id u8so19039026wrm.13
        for <linux-input@vger.kernel.org>; Tue, 07 Jun 2022 02:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V78a4T+XxMalGYKe1sIzEqFdtRWisjMfkHNLxFh+Xuk=;
        b=UeqdQBIqsmTGRwOHQ4Jr2DMdLBVll20hUXUFdLGxWG8ra3rbSiXdwhwfvcxi6jxztV
         i6aqJsZzUxEreUYZeNgxdd9YOhQoRteN02H7LBm6qjZ6BQjJwadXjKxxOaxnaraVVy7a
         ZFizSjhfoJIV63U9vkDwaZqYwzOR5lOMPm4KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V78a4T+XxMalGYKe1sIzEqFdtRWisjMfkHNLxFh+Xuk=;
        b=tXNgau8l4l/RbWj83EyYmweIITbah8jKBIrtrTDdEUU1PSCKQgK5ebDK+Ib7Wi3CSl
         CjQ3WmDCh308O9sltEPhuRPDMgSf1U/u/mGkID5XEjgVnUu04m2NBEDvCagMt6np9xDJ
         42zAncY6Zb9b0yUxcvEVwVHmaw7RLe7zLy+TjWcryfJlnx9k8z+l3vf1xhEEAzpm1Rnu
         qPc5bTD1DGbWxDasHYyxrT9z7ZFWYVqmB9ugUrniAmRbpFuxK1YpghCNzf0EtDPsXrPD
         v1RG9z8mLIYP0DYzvwr2upSmssO0mkhS0NF6XmVr3XHgn9x+3L2eq7YQYp8Z+TikLse/
         yd3g==
X-Gm-Message-State: AOAM532UGlSrLrmEr1sebJd2c/YMnIrODYVV/29ND0ZmYlNBBg0EUoll
        6qtXyb7f75pMU2g8H3rehf6fsw==
X-Google-Smtp-Source: ABdhPJwO+kWU+IzHL+lVRnPc+GnslQ5Ytmdq6j80L4b6d7DcHQa4us1UTPukfkGA9lvUlLytgMQwgg==
X-Received: by 2002:adf:ecc9:0:b0:210:28d4:96a0 with SMTP id s9-20020adfecc9000000b0021028d496a0mr26093257wro.380.1654595774560;
        Tue, 07 Jun 2022 02:56:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch (mob-5-90-137-51.net.vodafone.it. [5.90.137.51])
        by smtp.gmail.com with ESMTPSA id b12-20020a5d4b8c000000b0020feb9c44c2sm17693546wrt.20.2022.06.07.02.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:56:14 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        linux-input@vger.kernel.org
Subject: [RESEND PATCH v4 6/6] Input: edt-ft5x06 - show crc and header errors by sysfs
Date:   Tue,  7 Jun 2022 11:55:56 +0200
Message-Id: <20220607095556.1034338-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220607095556.1034338-1-dario.binacchi@amarulasolutions.com>
References: <20220607095556.1034338-1-dario.binacchi@amarulasolutions.com>
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

