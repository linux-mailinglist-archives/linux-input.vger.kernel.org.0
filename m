Return-Path: <linux-input+bounces-7538-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 361CC9A3EE4
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 14:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B15951F2784B
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 12:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90F01F947;
	Fri, 18 Oct 2024 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f23ZtOr7"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EC71684A5;
	Fri, 18 Oct 2024 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729255985; cv=none; b=j+c53D78Sj1tcqorzU+m+fHwnc4JVB5C8FgA+f7q20eDLnyXGbOlB3dqWpDY9jeGZU9F6+zS1TUTQ+ddvXdL1xdqc6JGKVfw5FrRvxKxzM/pY6pWLGojN0tE7BipO5U4BWWwpKJAp6T4+Et8R6dB28VFI4ihXVSEyTNf9bjOtAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729255985; c=relaxed/simple;
	bh=b9gUE/jzWBC5t5K2aMiR9zLyjAPDbhQuIteHBVt79pI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=YBDZrTGGAw/vihYZvYnt9V2NZef777F7Bcne9y1kYx+F+LqB/Mhfks29qEqJn8pKtgc2eUUMWFJGAmuyAPpYwEppgZLdbNpX4h52j/GoZydPTnPT4p6tSY5E50nBEq0XRQu0zEycnVFz7J5Q5OdUlchG9unsUfT1HrVtcihk/RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f23ZtOr7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I9Fgqm027127;
	Fri, 18 Oct 2024 12:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zUpM5w7c9M0XLVSJKLDnk4
	zozs5nGrMe9DlAGxkEIts=; b=f23ZtOr73pXrNnnLVGM/tjA9KVIPX7xW3TkWXH
	RJJeeq4UKGp3/7zEj0sXAcO+RtyIeIgCa6Xy1WXOll5sXlCVmfdifgvoaOEZ+Jw2
	e4SK/ZCZPQIqUZOf618xUbky4FTGdlpMzXVruBVMUTjsw904wSw87qbRrQVZcWpc
	Q38S+g1C1BagOXIxoFWB4JKCpblG4ICfLwjFioYn2hk/r3QyMHwnLt0tRimbZgE2
	BLFh5wYm7ZEV8aSqz2swmx1yy10ZleTThwesP9V7V3dAjNQltm3GgI4h2UK8tu2I
	sKCoGYZZM0TY09L30+OVakrnJCYOPRUnRphRVjuVAvI4NxjQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ay8jcb57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 12:53:02 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ICr1u3013480
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 12:53:01 GMT
Received: from hu-kamalw-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 18 Oct 2024 05:52:58 -0700
From: Kamal Wadhwa <quic_kamalw@quicinc.com>
Date: Fri, 18 Oct 2024 18:22:35 +0530
Subject: [PATCH] Input: gpio-keys - fix un-responsive keys issue on
 hibernate exit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241018-unresponsive-gpio-keys-hibernate-v1-1-12f5e9962054@quicinc.com>
X-B4-Tracking: v=1; b=H4sIABJaEmcC/x3NQQrCMBBG4auUWTuQtC6qVxEXrfnTDsIkzGhRS
 u9ucPlt3tvJYQKna7eTYROXog3x1NFjnXQBS2qmPvTnGOLIbzV4LeqygZcqhZ/4Oq8yw3R6gYe
 YcgrDnMN4oZaphiyf/+J2P44fe6eTT3IAAAA=
X-Change-ID: 20241018-unresponsive-gpio-keys-hibernate-31dfd03bf089
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Jishnu
 Prakash" <quic_jprakash@quicinc.com>,
        Rakesh Kota
	<quic_kotarake@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        Kamal Wadhwa
	<quic_kamalw@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729255978; l=3576;
 i=quic_kamalw@quicinc.com; s=20241018; h=from:subject:message-id;
 bh=b9gUE/jzWBC5t5K2aMiR9zLyjAPDbhQuIteHBVt79pI=;
 b=MC2oAUzpujzBz9Qf+je0slAFaSksuo9xN2ZPvlCpFqR9IMn2dOGAiQHbgWOFmzJYUIiiFPnrb
 dNJrSwX4DQZCRh9wNOv0Lo2kelCAqyC9ZmWBrb3rpY31ARf2B8egHWu
X-Developer-Key: i=quic_kamalw@quicinc.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iJx31FgaZ4WvmRHvVME1Hj6igzFDbh2W
X-Proofpoint-ORIG-GUID: iJx31FgaZ4WvmRHvVME1Hj6igzFDbh2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180081

GPIO IRQ setting may get reset during hibernate mode, as device
is completely powered off. This can cause the GPIO keys to become
un-responsive after hibernate-exit.

To fix this problem, re-request IRQs in restore() callback, in the
hibernate exit flow.

Also, to keep the software in-sync with actual IRQ state in hardware,
disable and free the IRQs before entering hibernate(in freeze()
callback). Note that without this extra step, the IRQ re-request in
restore() may not work properly.

Besides this issue scenario, another usecase where this change
may be useful is - where these IRQs need to be handled by a low-power
co-processor during hibernate state. In this case too, these IRQs
need to be freed/re-requested during entry/exit transitions for
hibernate mode. so that co-processer can handle them, while main
processor is in hibernate.

Signed-off-by: Kamal Wadhwa <quic_kamalw@quicinc.com>
---
 drivers/input/keyboard/gpio_keys.c | 67 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 380fe8dab3b06379f9744e8190a4afcc0aee20b4..8c123e1b14ae34d3d15380eeb96b4a522732573c 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -1041,6 +1041,66 @@ gpio_keys_disable_wakeup(struct gpio_keys_drvdata *ddata)
 	}
 }
 
+static int gpio_keys_freeze(struct device *dev)
+{
+	struct gpio_keys_drvdata *ddata = dev_get_drvdata(dev);
+	struct gpio_button_data *bdata;
+	int i;
+
+	for (i = 0; i < ddata->pdata->nbuttons; i++) {
+		bdata = &ddata->data[i];
+
+		if (!bdata->irq)
+			continue;
+
+		mutex_lock(&ddata->disable_lock);
+		gpio_keys_disable_button(bdata);
+		mutex_unlock(&ddata->disable_lock);
+
+		devm_free_irq(dev, bdata->irq, bdata);
+	}
+
+	return 0;
+}
+
+static int gpio_keys_restore(struct device *dev)
+{
+	struct gpio_keys_drvdata *ddata = dev_get_drvdata(dev);
+	struct gpio_button_data *bdata;
+	int error = 0, i;
+	irq_handler_t isr;
+	unsigned long irqflags;
+	const char *desc;
+
+	for (i = 0; i < ddata->pdata->nbuttons; i++) {
+		bdata = &ddata->data[i];
+		desc = bdata->button->desc ? bdata->button->desc : "gpio_keys";
+		if (!bdata->irq)
+			continue;
+
+		if (bdata->gpiod) {
+			isr = gpio_keys_gpio_isr;
+			irqflags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
+		} else {
+			isr = gpio_keys_irq_isr;
+			irqflags = 0;
+		}
+
+		if (!bdata->button->can_disable)
+			irqflags = IRQF_SHARED;
+
+		error = devm_request_any_context_irq(dev, bdata->irq,
+						     isr, irqflags, desc, bdata);
+		if (error < 0) {
+			dev_err(dev, "Unable to claim irq %d; error %d\n",
+				bdata->irq, error);
+			return error;
+		}
+	}
+
+	return 0;
+}
+
 static int gpio_keys_suspend(struct device *dev)
 {
 	struct gpio_keys_drvdata *ddata = dev_get_drvdata(dev);
@@ -1083,7 +1143,12 @@ static int gpio_keys_resume(struct device *dev)
 	return 0;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(gpio_keys_pm_ops, gpio_keys_suspend, gpio_keys_resume);
+static const struct dev_pm_ops gpio_keys_pm_ops = {
+	.freeze = gpio_keys_freeze,
+	.restore = gpio_keys_restore,
+	.suspend = gpio_keys_suspend,
+	.resume = gpio_keys_resume,
+};
 
 static void gpio_keys_shutdown(struct platform_device *pdev)
 {

---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241018-unresponsive-gpio-keys-hibernate-31dfd03bf089

Best regards,
-- 
Kamal Wadhwa <quic_kamalw@quicinc.com>


