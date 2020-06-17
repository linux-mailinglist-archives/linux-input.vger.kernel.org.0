Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1571FC292
	for <lists+linux-input@lfdr.de>; Wed, 17 Jun 2020 02:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgFQAD6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 20:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgFQAD6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 20:03:58 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE849C061573
        for <linux-input@vger.kernel.org>; Tue, 16 Jun 2020 17:03:57 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id l17so415464qki.9
        for <linux-input@vger.kernel.org>; Tue, 16 Jun 2020 17:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=sn+IMN456fOU+ix185XRX4tWH9/jZKOUApb97Y+9koc=;
        b=XaD5sFDNaqlscrjDeXmKpxS9MtzYFyIaJHozIdZYkI2+nPI7pjVJx19fWMi2pFiJ1h
         fBy3QfBbcOdzZMUJGtUdVqYm25/A3nTwRNPqQUSlCmgosPeYUSIv/Us78DXPk+VOPMAi
         l10EGFfQKSgguULf8SYvRs4zPeLjxgf9nHy0ByZgrnrDPLxRpVPmw6hnnfAf/1mwQYJJ
         tyiXxUn0KYSzLgtOHF9gejZuENJw5wzicwLORVumdALr/YIJM5q2eGNcei/3nEJa7Rne
         et+Bd+ZsTlKStJRZ71o7Ep9KmdHWqxzePzv7PUYk28b4GdOvqn1FoSy60lKc6JD8SHG8
         VVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=sn+IMN456fOU+ix185XRX4tWH9/jZKOUApb97Y+9koc=;
        b=HKHb4SnU3TiAqcOExlJh37QmOOT+K83HL5skkCCAKNN5O6HCoJKeCkYCrRHXVGVxBn
         Ryeqz5OxdeBu95J0EzR1Dbegb0ORABuo921Egtjd4z2EWNdi0EqFK1KoLm8rSjGi0rbH
         4604MpC/lK5lSMPcO036fgcFTwKH6vPWU54NflubrkhLyzOhtEF2TQqf6q9OuSQTmhlY
         ZcaTJdMJ8ZbNvyqzCat1sU9pQ14UTf2PLEiCZ51W6VvCxgrcwsazGbMuLVvCmxcWfKjZ
         XFWNoZEj1DfEcSvjynuQmHR5LkUKyT7P7snTT5khJpNEuP6SRi8tre3kHiJcLUdHyFQJ
         +sNQ==
X-Gm-Message-State: AOAM533YWexsBuQZxOZSCK0zMX556USHpqs2kJjcAMUYo8Lrm/SHWvgw
        5eA6apwUrOE1dHrrPgfAMq3xrxmaoh4=
X-Google-Smtp-Source: ABdhPJyRDx7Pg/YcCwU/30GANNA3L4yUtec61+1kaM5nq/C4Qcy1EJwMNsziyatfRVE8f9BKpGMYZg==
X-Received: by 2002:a37:d04:: with SMTP id 4mr3686228qkn.377.1592352237003;
        Tue, 16 Jun 2020 17:03:57 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:500e:ef8a:2965:9682])
        by smtp.gmail.com with ESMTPSA id r195sm16273413qka.12.2020.06.16.17.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 17:03:56 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, marex@denx.de,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] Input: mxs-lradc-ts - execute mxs_lradc_ts_stop() only once
Date:   Tue, 16 Jun 2020 21:03:49 -0300
Message-Id: <20200617000349.7429-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently mxs_lradc_ts_stop() is unnecessarily executed several times
as it is placed inside a for loop.

Executing it only once is enough, so move it outside the for loop.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/input/touchscreen/mxs-lradc-ts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/mxs-lradc-ts.c b/drivers/input/touchscreen/mxs-lradc-ts.c
index 9e36fee38d61..d42203b14335 100644
--- a/drivers/input/touchscreen/mxs-lradc-ts.c
+++ b/drivers/input/touchscreen/mxs-lradc-ts.c
@@ -669,6 +669,7 @@ static int mxs_lradc_ts_probe(struct platform_device *pdev)
 		return ret;
 
 	mxs_lradc_ts_hw_init(ts);
+	mxs_lradc_ts_stop(ts);
 
 	for (i = 0; i < 3; i++) {
 		irq = platform_get_irq_byname(pdev, mxs_lradc_ts_irq_names[i]);
@@ -677,8 +678,6 @@ static int mxs_lradc_ts_probe(struct platform_device *pdev)
 
 		virq = irq_of_parse_and_map(node, irq);
 
-		mxs_lradc_ts_stop(ts);
-
 		ret = devm_request_irq(dev, virq,
 				       mxs_lradc_ts_handle_irq,
 				       0, mxs_lradc_ts_irq_names[i], ts);
-- 
2.17.1

