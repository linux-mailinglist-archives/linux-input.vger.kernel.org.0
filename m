Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3751E2E0166
	for <lists+linux-input@lfdr.de>; Mon, 21 Dec 2020 21:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgLUUEo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Dec 2020 15:04:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbgLUUEn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Dec 2020 15:04:43 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E5DC0613D3;
        Mon, 21 Dec 2020 12:04:03 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id c12so7039666pfo.10;
        Mon, 21 Dec 2020 12:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=5Fd2eijpdQRkFE2sGj615F3PuU4mIBkImg2P02LxeX0=;
        b=cWfeOcDVmv5mO9mw69NORFWv32u2KRueVZW99Ewtlygo/nN1Xk6IzkQ2ePlqHKIgE5
         0uE8qiuXUQlLUFu2fjKyogvJbJKu/WjLsjH3s1koY0EiSh2tPT2k3U2ASs9bQeExb1Im
         eiL9xGhxa6dmMOn67c10LMczyZbDkIf07U7N1pQ4t8CoOaZMerryGqnV3aVtEC8ygqCi
         msPxBii4eEIwHl6v10FOhWyS1mSfNqBOhGeqaeUTwbnxztcYN1Sig2rE+X2l7AtfTYcM
         D9s9LaqlMOxHFtxFkIkOppWXXOPQImaR6tC1mZpH+wbho9FUKaYnie6L46hyYTLRcEi6
         pInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5Fd2eijpdQRkFE2sGj615F3PuU4mIBkImg2P02LxeX0=;
        b=FG20AE8CJAhFO621u2n8La4Xlq78+qxRkGJUO/2cA+7bf92svRzLBGXo+EJsGz+9J7
         Eh6N3EKL2mroq727DOAQTMw9gLSp/hITdHYO44bv0ilZXKxsezAh6XzS1DewnfSvfQr+
         B5zdYITFZMX5zjf4zD4vTn+gn6REfFzV1Smy5BslO/SD4LphsGZp3YpaAGKPwAGmHwEj
         BrjT/yakYgczv2YfzujWTg0LNd/8ggsUFX3X10F0jN24YYgeJLkcw/uauWVxIjsRuVTc
         kwUPAo/t/ox0itaF0+K4MKfMd/MLkzd9ODDeguMoYRfH2UHRoHOk9rFO9A7l4lYLwIiD
         yZ7g==
X-Gm-Message-State: AOAM5339MYZHSR7HSRMM39ul57Ig/QJ2Fbsz5lZzobwMBAFrJtoiKIJH
        s1A8E284LxiSB06zARynobs=
X-Google-Smtp-Source: ABdhPJx8EPH+C5M51gA+cjNxPr16HA7zf2nD1lBmvgNxMgHbgfi7SFnW4+9F0mtegwU6XAwdKq8ogw==
X-Received: by 2002:a62:84ca:0:b029:19e:6f95:11b1 with SMTP id k193-20020a6284ca0000b029019e6f9511b1mr16480115pfd.68.1608581042967;
        Mon, 21 Dec 2020 12:04:02 -0800 (PST)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.179.58.4])
        by smtp.gmail.com with ESMTPSA id h4sm16200428pfc.185.2020.12.21.12.04.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 12:04:02 -0800 (PST)
From:   Souptick Joarder <jrdr.linux@gmail.com>
To:     dmitry.torokhov@gmail.com, lkundrak@v3.sk
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH] input: ariel-pwrbutton.c: Remove unused variable ariel_pwrbutton_id_table[]
Date:   Tue, 22 Dec 2020 01:34:01 +0530
Message-Id: <1608581041-4354-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Kernel test robot throws below warning ->

>> drivers/input/misc/ariel-pwrbutton.c:152:35: warning: unused variable
>> 'ariel_pwrbutton_id_table' [-Wunused-const-variable]
   static const struct spi_device_id ariel_pwrbutton_id_table[] = {
                                     ^
   1 warning generated.

Remove unused variable ariel_pwrbutton_id_table[] if no plan to use
it further.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/input/misc/ariel-pwrbutton.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/input/misc/ariel-pwrbutton.c b/drivers/input/misc/ariel-pwrbutton.c
index eda86ab..17bbaac 100644
--- a/drivers/input/misc/ariel-pwrbutton.c
+++ b/drivers/input/misc/ariel-pwrbutton.c
@@ -149,12 +149,6 @@ static int ariel_pwrbutton_probe(struct spi_device *spi)
 };
 MODULE_DEVICE_TABLE(of, ariel_pwrbutton_of_match);
 
-static const struct spi_device_id ariel_pwrbutton_id_table[] = {
-	{ "wyse-ariel-ec-input", 0 },
-	{}
-};
-MODULE_DEVICE_TABLE(spi, ariel_pwrbutton_id_table);
-
 static struct spi_driver ariel_pwrbutton_driver = {
 	.driver = {
 		.name = "dell-wyse-ariel-ec-input",
-- 
1.9.1

