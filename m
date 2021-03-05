Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42AB032F086
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 18:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhCERB4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 12:01:56 -0500
Received: from aposti.net ([89.234.176.197]:60846 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229573AbhCERBe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Mar 2021 12:01:34 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/3] input: gpio-keys: Remove extra call to input_sync
Date:   Fri,  5 Mar 2021 17:01:09 +0000
Message-Id: <20210305170111.214782-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The input_sync() function will already be called within
gpio_keys_gpio_report_event(), so there's no need to call it again after
the loop in gpio_keys_report_state().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/input/keyboard/gpio_keys.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 77bac4ddf324..0be204693ab0 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -641,7 +641,6 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 
 static void gpio_keys_report_state(struct gpio_keys_drvdata *ddata)
 {
-	struct input_dev *input = ddata->input;
 	int i;
 
 	for (i = 0; i < ddata->pdata->nbuttons; i++) {
@@ -649,7 +648,6 @@ static void gpio_keys_report_state(struct gpio_keys_drvdata *ddata)
 		if (bdata->gpiod)
 			gpio_keys_gpio_report_event(bdata);
 	}
-	input_sync(input);
 }
 
 static int gpio_keys_open(struct input_dev *input)
-- 
2.30.1

