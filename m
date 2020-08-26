Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB072536A8
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 20:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgHZSSC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 14:18:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:40936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726442AbgHZSR5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 14:17:57 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2DD1B2083B;
        Wed, 26 Aug 2020 18:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598465876;
        bh=DPQF77aMjkh7Faa6F4bZ0KOUmZpaZ+wObfMV6Kit2jo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PbBpUBLm5MDXI2Ck3SvUjsj1zYVbR0BAcdelKMYhlfODxf3q+tLb5Lp6ORHN95uST
         XoajrjKgJuamZ601iFTHooRBYfL7QFtDoyYRl41TVhWmst6/hN8VLpzIUu31pCu6OE
         lubuHAw0LDBp6o/cIj+gn/wkmptlkKGWqDFyN/VQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 08/24] Input: elan_i2c - Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 20:16:50 +0200
Message-Id: <20200826181706.11098-8-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826181706.11098-1-krzk@kernel.org>
References: <20200826181706.11098-1-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/input/mouse/elan_i2c_core.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index c599e21a8478..d703b0d5a3bd 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1229,13 +1229,8 @@ static int elan_probe(struct i2c_client *client,
 	mutex_init(&data->sysfs_mutex);
 
 	data->vcc = devm_regulator_get(dev, "vcc");
-	if (IS_ERR(data->vcc)) {
-		error = PTR_ERR(data->vcc);
-		if (error != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'vcc' regulator: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(data->vcc))
+		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
 	error = regulator_enable(data->vcc);
 	if (error) {
-- 
2.17.1

