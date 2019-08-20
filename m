Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F057595D0C
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 13:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728414AbfHTLQq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Aug 2019 07:16:46 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:50069 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHTLQp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Aug 2019 07:16:45 -0400
Received: from orion.localdomain ([95.117.23.32]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Ma1kC-1hnsXH3aGS-00VvHO; Tue, 20 Aug 2019 13:16:43 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Subject: [PATCH v2] input: misc: soc_button_array: use platform_device_register_resndata()
Date:   Tue, 20 Aug 2019 13:16:43 +0200
Message-Id: <1566299803-19243-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:ykp0uwNUrMJ37Zjv0MwjWaNXs119iqbYMBVNilf0A12tg/NS60I
 B7murAtFTgN66HyoqxmsLrljma/rsHjVppuLfMd+YAsuQgAfO6sJzxPY4cHEQHwasSJFxxo
 HP8edHNSk1krsKs+HNuOJWEZhfrPKKu/TsWz9gGSq1efoGcEjVe4A92r//4HQKWNO5alxZ3
 QxRdB/l+ak6mR5Eu16z2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:koxA6XU8Wi4=:d005a/oMI6DbyRdcMlBl3R
 Zfp2PIJ1K+LzgZ4MHayMtS1m29IwwRre1U4X/ar7Fc/C3Qh43Ndd2NT9rncv/4whXwMUbS21a
 D61TMiqn4pY3BkPDrt79FkKUIhghAEEb6C9rPe1BddZZl664IXrZr27d4b7JQikObLKosyfKD
 O618o+WNHh0TJL+rkpAerA5BpkpdKCg1qroaJw0BETExz6wcuRnZJkOECYKqTBXhCHFC8vH3N
 hWNxJ+yK+p2+oi9cUAsdIuqkrclbL8cOfmHciVdL7pBo6ocNrR6j+FfqWk+Ux2D2s261lby+y
 sJD0q5FFOOBWVDHEYhh1xmD8PuLXx+5YA6lYUedXovG6C1YnsUBM4XKQOV8vc9EK68CoD3qLP
 AHS7IxNzcIsNvVipzBoOoxiMV0pDYTpyZy+boLW7rV8JbdvAOvEXUQ3npt9THg5f78Lr/WVKv
 mCinzKyV+iiVe1JiPCbcps5iwCM1ZOHHOGGOJHzAUVlBpvQF4Ry7zOdt0au6l1476sbgb2Po2
 NZZeWpYcneDR7+5+HcX2bo5ra4nglhXKUiVcFqiLU+KHe0x09CXemHqSlE1yMFkWJYUCCy7F6
 hU0RajL5tPnBhYqwD/wWy3r4rdKLhEWXeP6NdZYwVrzlJX6SZlyTc1Hf/T+lnAdyCVUDun+em
 A3U7odzPQwKO0CH2ELSNFXRaD2TeZYmC/MPRjINQ/numf4MtW4ZKyNLjLzvEOptauzPmISLnN
 kZMjPnX7H1WZ8x0nBtuZlrbBJqcDK8NDaecDQA==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

The registration of gpio-keys device can be written much shorter
by using the platform_device_register_resndata() helper.

v2:
    * pass &pdev->dev to platform_device_register_resndata()
    * fixed errval on failed platform_device_register_resndata()

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/input/misc/soc_button_array.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 5e59f8e5..27550f9 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -110,25 +110,24 @@ static int soc_button_lookup_gpio(struct device *dev, int acpi_index)
 	gpio_keys_pdata->nbuttons = n_buttons;
 	gpio_keys_pdata->rep = autorepeat;
 
-	pd = platform_device_alloc("gpio-keys", PLATFORM_DEVID_AUTO);
-	if (!pd) {
-		error = -ENOMEM;
+	pd = platform_device_register_resndata(
+		&pdev->dev,
+		"gpio-keys",
+		PLATFORM_DEVID_AUTO,
+		NULL,
+		0,
+		gpio_keys_pdata,
+		sizeof(*gpio_keys_pdata));
+
+	error = PTR_ERR_OR_ZERO(pd);
+
+	if (IS_ERR(pd)) {
+		dev_err(&pdev->dev, "failed registering gpio-keys: %ld\n", PTR_ERR(pd));
 		goto err_free_mem;
 	}
 
-	error = platform_device_add_data(pd, gpio_keys_pdata,
-					 sizeof(*gpio_keys_pdata));
-	if (error)
-		goto err_free_pdev;
-
-	error = platform_device_add(pd);
-	if (error)
-		goto err_free_pdev;
-
 	return pd;
 
-err_free_pdev:
-	platform_device_put(pd);
 err_free_mem:
 	devm_kfree(&pdev->dev, gpio_keys_pdata);
 	return ERR_PTR(error);
-- 
1.9.1

