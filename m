Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237AB1AC503
	for <lists+linux-input@lfdr.de>; Thu, 16 Apr 2020 16:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393229AbgDPOJm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Apr 2020 10:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2393138AbgDPOJW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Apr 2020 10:09:22 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76560C061A0F
        for <linux-input@vger.kernel.org>; Thu, 16 Apr 2020 07:09:21 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id r7so7916798ljg.13
        for <linux-input@vger.kernel.org>; Thu, 16 Apr 2020 07:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EcwerKQQEP8j7nclGhrMgaoQqJ2z0i0teVUv4cSWNXE=;
        b=GN52HuCOuJ1SswJKMaB3uMoT9Eb7waHxo5fPIzcXanb+uCFUuFV9TkhM4PjXVBZGM4
         X9GP/WnyyF12vzcnEFCYv7gJiciOItxiplPtQ813fPjhHClqYVqTvgWqTEjiVLTU1bms
         Og8XEEhsp2X6ua24ARy8T8XZfkqUsljn7IRGAqPB2qSXuTLw19sluh/ley6xJnCCtHMa
         5n+QFWr4zT6kwQ63EfIZqBR2gzX30JHDRng2AYTzLQ4DWUxX1hK3yE+MV4XlG4P+ZGIY
         Etp9hrQ43oR1+uOnq0nhUh/Sh5WqYlC1+h1IeKX4VIbxG9eqaoREpo81upE/SDpDDH+l
         DiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EcwerKQQEP8j7nclGhrMgaoQqJ2z0i0teVUv4cSWNXE=;
        b=EYslI2x/KRuXzZNU1jfmhhui+GnZc7hQYvw9ccOplijFThRcPnt196Bo5gkwPvOKpX
         gjLiXEIvMTraE+1uEYy+oMLWIbqvo9kVb1oWIuUnTfb9DyveiHGIDRuPG/0bRw2b2p6S
         zjTFRWj1EvZVexRR2JPYKc+9K3dPrBLscm7QARPaebjTW+k/S4GH0TR6WGaXxkeb1Ihe
         MzgFfDaM1auoPzkQ11J5JiUg6vL3yAh+xWKmJKjsHurpbTMNUBScwUsA8I5f7TjfzXbd
         oNDyyp6zwYWAGEFUZnIkClDrR1SzZ9N9Rcl5HHE2xLsryv5FogGoqLk4XoVODN9UOQwH
         YKhw==
X-Gm-Message-State: AGi0PuYdOOInWwnpMdZV5LB+YYBbSak2+FejrFIBc97T/l8XfuBYEBGX
        6yzcMLumL5LCmjh3plVcC0uWyQ==
X-Google-Smtp-Source: APiQypJcSV0LCNGO0pS1gyWwCMCoYh6wY2j+JWPGs+yObCYqdjzVp901POV40kM+hMkZGLw4VxCyCQ==
X-Received: by 2002:a05:651c:39b:: with SMTP id e27mr6962616ljp.45.1587046159829;
        Thu, 16 Apr 2020 07:09:19 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id v12sm9744045ljd.85.2020.04.16.07.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 07:09:19 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org
Cc:     Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Reitemeyer <nick.reitemeyer@web.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 1/2 v2] iio: magnetometer: ak8974: Break out measurement
Date:   Thu, 16 Apr 2020 16:09:16 +0200
Message-Id: <20200416140917.8087-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This breaks out the measurement code to its own function
so we can handle this without swirling it up with the
bis switch() statement inside ak8974_read_raw().

Use an intermediary s16* variable since we read s16 but
the external API required an int* so this way we get
explicit casting.

Cc: Nick Reitemeyer <nick.reitemeyer@web.de>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Break out as a separate patch.
---
 drivers/iio/magnetometer/ak8974.c | 51 +++++++++++++++++++------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/magnetometer/ak8974.c b/drivers/iio/magnetometer/ak8974.c
index ade4ed8f67d2..5361647b9054 100644
--- a/drivers/iio/magnetometer/ak8974.c
+++ b/drivers/iio/magnetometer/ak8974.c
@@ -554,46 +554,57 @@ static int ak8974_detect(struct ak8974 *ak8974)
 	return 0;
 }
 
+static int ak8974_measure(struct ak8974 *ak8974, unsigned long address, s16 *val)
+{
+	__le16 hw_values[3];
+	int ret;
+
+	pm_runtime_get_sync(&ak8974->i2c->dev);
+	mutex_lock(&ak8974->lock);
+
+	ret = ak8974_trigmeas(ak8974);
+	if (ret)
+		goto out_unlock;
+	ret = ak8974_getresult(ak8974, hw_values);
+	if (ret)
+		goto out_unlock;
+	*val = (s16)le16_to_cpu(hw_values[address]);
+out_unlock:
+	mutex_unlock(&ak8974->lock);
+	pm_runtime_mark_last_busy(&ak8974->i2c->dev);
+	pm_runtime_put_autosuspend(&ak8974->i2c->dev);
+
+	return ret;
+}
+
 static int ak8974_read_raw(struct iio_dev *indio_dev,
 			   struct iio_chan_spec const *chan,
 			   int *val, int *val2,
 			   long mask)
 {
 	struct ak8974 *ak8974 = iio_priv(indio_dev);
-	__le16 hw_values[3];
 	int ret = -EINVAL;
-
-	pm_runtime_get_sync(&ak8974->i2c->dev);
-	mutex_lock(&ak8974->lock);
+	s16 outval;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
 		if (chan->address > 2) {
 			dev_err(&ak8974->i2c->dev, "faulty channel address\n");
 			ret = -EIO;
-			goto out_unlock;
+			goto out_err_read;
 		}
-		ret = ak8974_trigmeas(ak8974);
-		if (ret)
-			goto out_unlock;
-		ret = ak8974_getresult(ak8974, hw_values);
-		if (ret)
-			goto out_unlock;
-
 		/*
 		 * We read all axes and discard all but one, for optimized
 		 * reading, use the triggered buffer.
 		 */
-		*val = (s16)le16_to_cpu(hw_values[chan->address]);
-
+		ret = ak8974_measure(ak8974, chan->address, &outval);
+		if (ret)
+			goto out_err_read;
+		*val = outval;
 		ret = IIO_VAL_INT;
+		break;
 	}
-
- out_unlock:
-	mutex_unlock(&ak8974->lock);
-	pm_runtime_mark_last_busy(&ak8974->i2c->dev);
-	pm_runtime_put_autosuspend(&ak8974->i2c->dev);
-
+out_err_read:
 	return ret;
 }
 
-- 
2.21.1

