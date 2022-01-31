Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 553E94A496B
	for <lists+linux-input@lfdr.de>; Mon, 31 Jan 2022 15:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236840AbiAaOfz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Jan 2022 09:35:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43277 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237249AbiAaOfz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Jan 2022 09:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643639754;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=0fWrmbLp/C7F1V8aRNnqkMIqRJI5t3d6bvJc7n+m0x4=;
        b=DmFPaJHh0P/QYUNT+4H+KSRWnSTWsSRe0WodsSuyKn/lzySI16GYu38+8WSWQ+e51uGWvl
        psHwN77iSiyv/J+xxXHjjNLGTNumNXiV10veDuk1Q538UfV1DjpGcVa2fPT1txuC2tGIpi
        wEqkZOf9WfT+U1jTKtRBLA1kEg7v/nE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-yMh2yt-eNe2-oGyqK9pcQg-1; Mon, 31 Jan 2022 09:35:53 -0500
X-MC-Unique: yMh2yt-eNe2-oGyqK9pcQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3496383DD22;
        Mon, 31 Jan 2022 14:35:52 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3BF962376A;
        Mon, 31 Jan 2022 14:35:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH v2 1/5] Input: Set EV_ABS in dev->evbit even if input_alloc_absinfo() fails
Date:   Mon, 31 Jan 2022 15:35:35 +0100
Message-Id: <20220131143539.109142-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The input core's error handling for input_alloc_absinfo() failures
is based on ignoring the error until input_register_device() runs
and then checks for the failure like this:

        if (test_bit(EV_ABS, dev->evbit) && !dev->absinfo) {
                dev_err(&dev->dev, ...);
                return -EINVAL;
        }

This relies on EV_ABS actually getting set in dev->evbit even
if input_alloc_absinfo() fails, change input_set_abs_params() and
input_set_capability() to actually adhere to this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- New patch in v2 of this patch-set
---
 drivers/input/input.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index ccaeb2426385..3a5156012fb8 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -511,6 +511,9 @@ void input_set_abs_params(struct input_dev *dev, unsigned int axis,
 {
 	struct input_absinfo *absinfo;
 
+	__set_bit(EV_ABS, dev->evbit);
+	__set_bit(axis, dev->absbit);
+
 	input_alloc_absinfo(dev);
 	if (!dev->absinfo)
 		return;
@@ -520,9 +523,6 @@ void input_set_abs_params(struct input_dev *dev, unsigned int axis,
 	absinfo->maximum = max;
 	absinfo->fuzz = fuzz;
 	absinfo->flat = flat;
-
-	__set_bit(EV_ABS, dev->evbit);
-	__set_bit(axis, dev->absbit);
 }
 EXPORT_SYMBOL(input_set_abs_params);
 
@@ -2085,9 +2085,6 @@ void input_set_capability(struct input_dev *dev, unsigned int type, unsigned int
 
 	case EV_ABS:
 		input_alloc_absinfo(dev);
-		if (!dev->absinfo)
-			return;
-
 		__set_bit(code, dev->absbit);
 		break;
 
-- 
2.33.1

