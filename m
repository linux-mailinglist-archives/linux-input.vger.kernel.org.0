Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2141E8F15
	for <lists+linux-input@lfdr.de>; Sat, 30 May 2020 09:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgE3Hjr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 May 2020 03:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728841AbgE3Hjq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 May 2020 03:39:46 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B70BFC03E969;
        Sat, 30 May 2020 00:39:46 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id w68so191369pfb.3;
        Sat, 30 May 2020 00:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FmATF7VIMFcPZn4icXB5YGmrCi8/Ak2vFV6cTnZtZnM=;
        b=ZPSecb7+SPWbFMoFKyMVT/Buw0b5UsDBBNYMdw9++irJpVdQOLok9yQsh1IBhYiimK
         0TmWrB2BrKmPjuN0J3ok+G2NHQGEypfnOnp/MSqqOSBts5OQP32QMro3xPe0PYlQVvoX
         5ezWkVsKG9ZIZuLMdnoHSVJUuWd7vMWvT8c1j38g5+aPIT/ftXlOuxljskbQdkyLdC5x
         J3NwObdbE5TD8etrwwz3IYXvPdh+6i5UtFrS2jmpESHu3uSqovHvRzWirnWpjZ24DOCl
         +bSQp4PHatjBWC66Y0pNF0Orpzw0NF6SQHO1lVpUaej7u0X6TYYR4ZL56DYiZiZXpAoQ
         uwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FmATF7VIMFcPZn4icXB5YGmrCi8/Ak2vFV6cTnZtZnM=;
        b=Z/I0yONgStMhdVw+vlQDGWxuavRql+Og/qj5IDpMQzD4shQ+SvqXf0HnWtQygKwEtX
         nrJvB7bIW1PiSscGf/Ppbf21/iaFA0rlQK/CRELCRdYyi5lFqSntwZTGLiZr1P2vxasI
         ctNJ3OLZSJpyWMw8LitbHlKLrAvX4ArGalj76IYM4Kx6iHPRsWizxnvvD4IGt8A/qGPB
         LkyMrZFYE7Hksrmt3fy5Rw60oXc9Q3V9TTKyDS9aTnz8G0wcgVYGa15prp5OdyNCrxpn
         GPQULGxlv8En4wNZvi1aDwgkcGb9r3uVSeFFIuZvXOb9G+Sv1NayC77UNY/YnwBzI1DR
         7lYw==
X-Gm-Message-State: AOAM53052BFuMk1r3GikURuo+cCF3Irgav4PM0pGMSEG5BCMoLvW0YcO
        BTt3p9Ja6kUzRU/TEsseuxlEP43L
X-Google-Smtp-Source: ABdhPJyeWgsiG2xhhyfIygcXKBHc67sqd+XPQwXWqz4r6JSfnXCFuLJYGGqTne4QVW33wXmITGfDDw==
X-Received: by 2002:a62:80cc:: with SMTP id j195mr5898006pfd.138.1590824386326;
        Sat, 30 May 2020 00:39:46 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([166.111.139.172])
        by smtp.gmail.com with ESMTPSA id b16sm6140536pfd.111.2020.05.30.00.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 00:39:45 -0700 (PDT)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     dmitry.torokhov@gmail.com, johan@kernel.org, vdronov@redhat.com,
        tglx@linutronix.de, gregkh@linuxfoundation.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] input: tablet: aiptek: fix possible buffer overflow caused by bad DMA value in aiptek_irq()
Date:   Sat, 30 May 2020 15:39:35 +0800
Message-Id: <20200530073935.17874-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The value aiptek->data is stored in DMA memory, and it is assigned to
data. Thus in the code:
  macro = get_unaligned_le16(data + 1);
The value of marco can be modified by malicious hardware.
In this case, buffer overflow may occur when the code
"macroKeyEvents[macro - 1]" and "macroKeyEvents[macro]" is executed.

To fix these possible bugs, macro is checked before being used.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/input/tablet/aiptek.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index e08b0ef078e8..e353e538fb51 100644
--- a/drivers/input/tablet/aiptek.c
+++ b/drivers/input/tablet/aiptek.c
@@ -737,11 +737,11 @@ static void aiptek_irq(struct urb *urb)
 	 */
 	else if (data[0] == 6) {
 		macro = get_unaligned_le16(data + 1);
-		if (macro > 0) {
+		if (macro > 0 && macro < 34) {
 			input_report_key(inputdev, macroKeyEvents[macro - 1],
 					 0);
 		}
-		if (macro < 25) {
+		if (marco > 0 && macro < 25) {
 			input_report_key(inputdev, macroKeyEvents[macro + 1],
 					 0);
 		}
@@ -760,7 +760,8 @@ static void aiptek_irq(struct urb *urb)
 				aiptek->curSetting.toolMode;
 		}
 
-		input_report_key(inputdev, macroKeyEvents[macro], 1);
+		if (macro > 0 && macro < 33)
+			input_report_key(inputdev, macroKeyEvents[macro], 1);
 		input_report_abs(inputdev, ABS_MISC,
 				 1 | AIPTEK_REPORT_TOOL_UNKNOWN);
 		input_sync(inputdev);
-- 
2.17.1

