Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21F12227E4
	for <lists+linux-input@lfdr.de>; Sun, 19 May 2019 19:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbfESRjY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 May 2019 13:39:24 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34676 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbfESRjY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 May 2019 13:39:24 -0400
Received: by mail-pg1-f193.google.com with SMTP id c13so5641494pgt.1
        for <linux-input@vger.kernel.org>; Sun, 19 May 2019 10:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ingics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZUqUblKIDwkS/ncuZZOIGl2hEidUp/Yqzoky4sCljKw=;
        b=PM7fq6XQyawcH3htRS930Uj1yrdzYdaR/eyxDPHOvDGodle32qd/9G6BHFirb7bCfF
         cHPsuWP/67DZpSbbz/dQV8xy3lri0jD/sMBODCJptWcILF7G299vI1l7ke2NvBmlmJHZ
         4aK9aBDaGc0v3rBUu61Ku1hVvUGczZprS+bRSuBerr8eSNI66ORopZIG6L92gb4iOoZX
         Kb8xf/laV6iNJdp16ryUCIVw4BAuwBT2TKuDZHcP9DScpj76Xgqssvh52kiRR0t8CYXr
         sA9eG6sWoJPpi06AMCh1kTSWZ6+E4lmAyO4QJTOS7rA9/wtJRbmSrqoz6jZzlZoFR91A
         hCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZUqUblKIDwkS/ncuZZOIGl2hEidUp/Yqzoky4sCljKw=;
        b=qEu2vUgDbhR+mIKwkoVBytKVqhOD5aMJw18XwqyrYJBwy5UpCwVIEecCKMwJH5Ic1/
         rF4oSjrwW3qfsKqgEgsMaVfMWfPcTdRBuXch9Pp0BYXmPFOl/apiEKGcJxfoVedyTc14
         Hhh3E7ikTf1vPLJtX/yfG0v4ok8yWu4vOG6DJ/tmpVAr0tDCe3MXrne7z0A1Ko674i0M
         y0yAkXyjRgZu5JN0I5LXCytn7IOQbvqxtWPl1CmL18zdFy7v1KG2qTAhkR4o/Jmw1LIA
         e1DVimPmlnk7a+CE+qCsM0hifZ7PK7o2pOpWYB0ab86gM+yEAK4RRHH5eetgNRqHeaXg
         LoUg==
X-Gm-Message-State: APjAAAWCQ+/T0CSDURUmLHE0AE+/OHNamKIpcAl5ThKR0iG/Kuf8SC+j
        dH7MERYOPTcME2Faeg7xROPwrJZnQXA=
X-Google-Smtp-Source: APXvYqw9ql8jTqigRqduMQYl6rbK/xDkZ0C5/jYDYm/g/fqy3r4jyW5hkSxjiHrhFULfUvL1BiGapw==
X-Received: by 2002:a63:5fcc:: with SMTP id t195mr6363266pgb.120.1558239122327;
        Sat, 18 May 2019 21:12:02 -0700 (PDT)
Received: from localhost.localdomain (36-239-215-232.dynamic-ip.hinet.net. [36.239.215.232])
        by smtp.gmail.com with ESMTPSA id k7sm15407243pfk.93.2019.05.18.21.11.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 May 2019 21:12:00 -0700 (PDT)
From:   Axel Lin <axel.lin@ingics.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
        Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] Input: iqs5xx - Remove redundant dev_set_drvdata call
Date:   Sun, 19 May 2019 12:11:48 +0800
Message-Id: <20190519041148.32146-1-axel.lin@ingics.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Calling i2c_set_clientdata() is enough.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/input/touchscreen/iqs5xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index b832fe062645..158707897c2d 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -1054,8 +1054,6 @@ static int iqs5xx_probe(struct i2c_client *client,
 	if (!iqs5xx)
 		return -ENOMEM;
 
-	dev_set_drvdata(&client->dev, iqs5xx);
-
 	i2c_set_clientdata(client, iqs5xx);
 	iqs5xx->client = client;
 
-- 
2.20.1

