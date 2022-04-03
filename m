Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9D64F0B21
	for <lists+linux-input@lfdr.de>; Sun,  3 Apr 2022 18:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359358AbiDCQMP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Apr 2022 12:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359368AbiDCQMN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Apr 2022 12:12:13 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD5C26ACE
        for <linux-input@vger.kernel.org>; Sun,  3 Apr 2022 09:10:18 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id d10so3558589edj.0
        for <linux-input@vger.kernel.org>; Sun, 03 Apr 2022 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V78a4T+XxMalGYKe1sIzEqFdtRWisjMfkHNLxFh+Xuk=;
        b=j5pKyZu382YZsQQ6JTv1XVN4SkGe5+p7wzzOR+TXmcRQpvxtsHPqQdpp59CO0+Wpkw
         O1FdVC1BKOY2PjwWu4PiG6PPybVN3xozelYqaj1+JvmN+zxDYRiZGgaffIKQM8pIwNh8
         NSYX12DWCHMngFixEj8hlfdkTmvdhUWp/o270=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V78a4T+XxMalGYKe1sIzEqFdtRWisjMfkHNLxFh+Xuk=;
        b=X27/tfhTNp21mpoMHE6MXzChXA0T/Cy/KM4WoiwryWWBB9cNWsM3Q7Wdv4VZ0PPVYG
         Rgw3kJVGfVtceNqiHSB0icCs80dcVpxOM3Jc5aAOeGmgzgLkewQVDyG4cdEsnH/JW7B/
         dcMD4VsWZcWBMLCMJFfIasHo60ufN/gY2o0sn5rnUDVpTD+r8Psg84qp8H92iJFB/v07
         6xXZ2h91Nz0idLT0JbnN3lxkolg4/d77KGtsGkPguMKa5TY4udxjQpJ9KgLz+wEyZM54
         XhRQE1bJpftTDrU0FkkZLVQvvYgZzhi/LIP/GYMt5XqHx5Rs5ZZ1h4Qnc0/FYI7gYAO2
         j6pA==
X-Gm-Message-State: AOAM531cxGjpkF76AI3ZlhV9nhDMG15JRA3IxvSzZOgSX22TxFedKE8J
        lsPNS+fCS2hk8U8J54HfoXY6EA==
X-Google-Smtp-Source: ABdhPJycUUBIC0Nq2ppBparTGefe6HldISjHe1t+Ctkdpq43uiW4rw85OhOjn6Zr3IYUU4N7T2m2qQ==
X-Received: by 2002:aa7:d857:0:b0:41c:d08e:3c94 with SMTP id f23-20020aa7d857000000b0041cd08e3c94mr1340900eds.10.1649002216982;
        Sun, 03 Apr 2022 09:10:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-0-15-73.retail.telecomitalia.it. [87.0.15.73])
        by smtp.gmail.com with ESMTPSA id do8-20020a170906c10800b006dfe2af50d8sm3350119ejc.121.2022.04.03.09.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 09:10:16 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org
Subject: [PATCH v4 6/6] Input: edt-ft5x06 - show crc and header errors by sysfs
Date:   Sun,  3 Apr 2022 18:09:39 +0200
Message-Id: <20220403160939.541621-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220403160939.541621-1-dario.binacchi@amarulasolutions.com>
References: <20220403160939.541621-1-dario.binacchi@amarulasolutions.com>
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

