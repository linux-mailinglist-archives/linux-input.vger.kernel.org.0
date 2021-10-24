Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014244389A7
	for <lists+linux-input@lfdr.de>; Sun, 24 Oct 2021 17:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbhJXPKb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Oct 2021 11:10:31 -0400
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:37177 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230379AbhJXPK3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Oct 2021 11:10:29 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([213.45.67.127])
        by smtp-32.iol.local with ESMTPA
        id eeyWmj6mkdfuoeeybmWXwc; Sun, 24 Oct 2021 16:59:57 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1635087597; bh=/t4afwvWKwIcozWo7+JhPaKv7o+8VqLY8nNdi3B2CXc=;
        h=From;
        b=nvmgNjhHVcMZCjwOMQVgBf/kV5251Kf3tlfspeKBfaCp7vnm2kLnwA16x0WUk45Hh
         aMVNN76G/QpXKNrbbHxuADZNbp8Ulw6kKQps+RBDxSKGkbeYvUpwduqsJlepQDKhGk
         xxnZOj50vfpALRXxGmu1XFnU3391JPn1+317wBvwNd7EKpy6pB21TRTYRLIZjTd2T0
         8/N+zj5xvRyzLfNDZsqXSdaVZjfQUr9Y+I/M9rHSN0wQXICq3cZN2uAm2V3wz3MUKi
         Xgzp4ZaciUHNlv3ZoxMy0unniCGGbAJ4yzKd7gPd0MgNoa7sWtP5/WYXUBWHQMi7ps
         VCT7mvDGh/Gmg==
X-CNFS-Analysis: v=2.4 cv=IrzbzJzg c=1 sm=1 tr=0 ts=617574ed cx=a_exe
 a=Vk63IOK+/LoQucGDvce7tA==:117 a=Vk63IOK+/LoQucGDvce7tA==:17
 a=Us_wMsjpGDddDCpAM8cA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-input@vger.kernel.org
Subject: [PATCH 2/6] input: ti_am335x_tsc: fix STEPCONFIG setup for Z2
Date:   Sun, 24 Oct 2021 16:59:26 +0200
Message-Id: <20211024145931.1916-3-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211024145931.1916-1-dariobin@libero.it>
References: <20211024145931.1916-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfJVeqVN0AJ9sz/vFjjQaGJ37dfpFQCvJnhuDEu4E4nuGWWR6zPKD47ndH1qfSsrLKgzfV0wY9nDG7jJQuJmyaywDuhc9j+41/KyjXI0rVAYQWCNhrjAK
 rCh+8NWps6g2wM6od2LNZIB0uI0SVXbOlTZbsxshkIWKH7xKX9qA37PInpJhEmVElm5ZontQKPR2eKl1Ayq/uCBtbXhxbxRI49YpXpX2UKuw05ao0GLvj5Dt
 QEfhw28+xj7eM72QR9m67QfbcdeYitSwSc34AAXu9lFILJD62PIxZn/hijdL3NqIC962NuIw2r2rLRp6CtSiswoBSK9QPMJel4YwOIFwg6tr385tOegbytJZ
 j3HBTs70x4z9TsqqJRwy6vS9XSB65A==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Z2 step configuration doesn't erase the SEL_INP_SWC_3_0 bit-field
before setting the ADC channel. This way its value could be corrupted by
the ADC channel selected for the Z1 coordinate.

Fixes: 8c896308fea ("input: ti_am335x_adc: use only FIFO0 and clean up a little")
Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 drivers/input/touchscreen/ti_am335x_tsc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index fd3ffdd23470..cfc943423241 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -196,7 +196,10 @@ static void titsc_step_config(struct titsc *ts_dev)
 			STEPCONFIG_OPENDLY);
 
 	end_step++;
-	config |= STEPCONFIG_INP(ts_dev->inp_yn);
+	config = STEPCONFIG_MODE_HWSYNC |
+			STEPCONFIG_AVG_16 | ts_dev->bit_yp |
+			ts_dev->bit_xn | STEPCONFIG_INM_ADCREFM |
+			STEPCONFIG_INP(ts_dev->inp_yn);
 	titsc_writel(ts_dev, REG_STEPCONFIG(end_step), config);
 	titsc_writel(ts_dev, REG_STEPDELAY(end_step),
 			STEPCONFIG_OPENDLY);
-- 
2.17.1

