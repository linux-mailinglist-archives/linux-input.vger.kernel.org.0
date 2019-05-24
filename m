Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C191C29FFE
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 22:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403950AbfEXUks (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 May 2019 16:40:48 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35502 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403762AbfEXUks (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 16:40:48 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C6A876087D; Fri, 24 May 2019 20:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558730447;
        bh=1rtby5Hx7aX1Icw+wA2MpY4vbTBzn0e374yLIU7OMpg=;
        h=From:To:Cc:Subject:Date:From;
        b=mh/9qzt/26cXBEofGssSWv/79VvhupT3LszhElN+0EenKfgXT/mWQ0YQbHawNWaUQ
         O9IUp4NvIV26Mt5GZBFskL5W/mBZJaAbXTw0rX/8mPfRICsRaicKUs0bMsX2zfuYA/
         P3SsLYKLXRBanAfCwQA7jlmDGbupCMWfcBVRFizM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgoswami@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 479B960AA8;
        Fri, 24 May 2019 20:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558730442;
        bh=1rtby5Hx7aX1Icw+wA2MpY4vbTBzn0e374yLIU7OMpg=;
        h=From:To:Cc:Subject:Date:From;
        b=DhF739hAn6m7eSqjcXHAGXzVGIxk5XcV/1Vasucrdv0Ef+7i4r3h/hzpNThXzkkCz
         sVmaKvYktcJ+DDidWlA+Igw6VLyJfQhiN5D0Sb5INHsb+0yqW0X4tiw8ziBLcUq/v5
         yNDUl1PJ7oTfof0BNGF+xKfd+NNcjz3Frr2Yn1k0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 479B960AA8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=bgoswami@codeaurora.org
From:   bgoswami@codeaurora.org
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, alsa-devel@alsa-project.org,
        perex@perex.cz, tiwai@suse.com, broonie@kernel.org,
        srinivas.kandagatla@linaro.org, plai@codeaurora.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Gopikrishnaiah Anandan <agopik@codeaurora.org>
Subject: [PATCH 2/3] input: Add SW_UNSUPPORT_INSERT define
Date:   Fri, 24 May 2019 13:40:38 -0700
Message-Id: <1558730438-16524-1-git-send-email-bgoswami@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Banajit Goswami <bgoswami@codeaurora.org>

Some devices may not support specific type of input devices. For example,
when a headset or extension cable with GND/MIC swap is plugged into a
headset jack that does not support the headset/cable, it needs to be
reported with a corresponding input event. Also, increase the max values
for INPUT_DEVICE_ID_SW_MAX and SW_MAX, to accommodate future extension of
the number of event.

Signed-off-by: Gopikrishnaiah Anandan <agopik@codeaurora.org>
Signed-off-by: Banajit Goswami <bgoswami@codeaurora.org>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/uapi/linux/input-event-codes.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 448621c..7586099 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -299,7 +299,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
-#define INPUT_DEVICE_ID_SW_MAX		0x0f
+#define INPUT_DEVICE_ID_SW_MAX		0x1f
 #define INPUT_DEVICE_ID_PROP_MAX	0x1f
 
 #define INPUT_DEVICE_ID_MATCH_BUS	1
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 85387c7..960fa86 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -808,7 +808,8 @@
 #define SW_LINEIN_INSERT	0x0d  /* set = inserted */
 #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
-#define SW_MAX			0x0f
+#define SW_UNSUPPORT_INSERT	0x10  /* set = unsupported device inserted */
+#define SW_MAX			0x1f
 #define SW_CNT			(SW_MAX+1)
 
 /*
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

