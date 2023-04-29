Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92AF96F25EF
	for <lists+linux-input@lfdr.de>; Sat, 29 Apr 2023 21:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjD2TGw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Apr 2023 15:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjD2TGw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Apr 2023 15:06:52 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC6CE47
        for <linux-input@vger.kernel.org>; Sat, 29 Apr 2023 12:06:51 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Q7zVK448rzDB;
        Sat, 29 Apr 2023 21:06:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1682795209; bh=iRGnEJtpUCqGa3oZzXpw+u18nY+Sjws2ilAMhOtUtDA=;
        h=Date:From:Subject:Cc:To:From;
        b=KcuIPlx6rk1X9ehnNngteWuFPM8SWq4eR2iHX2FbFfFM5D5shJ1gWVdZi4UjJ2mr0
         pZ7t/TYObcNM4NO9q7nOdizeQzAqbyiSgfetGrS3g3yfqnRTGkVLr4KHEDsXokbNea
         b1dW30ogD+z0SlfBA+TzDhS5kKCjWQBEm0Spnt8HNqSO4LJoc1KHlwzrarEOnR6/Ka
         yyDY1+7X122KeEqRff/herWDV+S1KZbDIH+8hhel0oDMMEQ019BMoSsTP+YKZQBu3y
         FLrvFSKvsN8rVbhm398eAiwrqA8rMAH9xVl4rarGam3W+Ev9JGxa+jVU8F9U50Wibk
         HsZ3k7yYi12hg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Sat, 29 Apr 2023 21:06:49 +0200
Message-Id: <49fd4d400d1ab62095e5ed75a6637f883c0d071b.1682795105.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] i8042: add missing include
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc:     linux-input@vger.kernel.org
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

<linux/i8042.h> include uses ENODEV when included with
!IS_ENABLED(CONFIG_SERIO_I8042) and so need to include it.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 include/linux/i8042.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/i8042.h b/include/linux/i8042.h
index 0261e2fb3636..95b07f8b77fe 100644
--- a/include/linux/i8042.h
+++ b/include/linux/i8042.h
@@ -3,6 +3,7 @@
 #define _LINUX_I8042_H
 
 
+#include <linux/errno.h>
 #include <linux/types.h>
 
 /*
-- 
2.30.2

