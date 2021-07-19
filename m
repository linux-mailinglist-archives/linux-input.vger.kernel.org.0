Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 996043CF028
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 01:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242799AbhGSW6V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Jul 2021 18:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346834AbhGSUPS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Jul 2021 16:15:18 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53EEC0613DD
        for <linux-input@vger.kernel.org>; Mon, 19 Jul 2021 13:54:22 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 37so20472616pgq.0
        for <linux-input@vger.kernel.org>; Mon, 19 Jul 2021 13:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gJu/GAnviYn3d7aO05yfXl9ZcEPV7S5uHS4BiGszN/k=;
        b=mzhPHFt3uwMtCvNFhbVfw4e2/KCVOMecAptKAsHsFdbKhmif8lcIDwsrtesvoX2QfS
         /OjdWXyCr+VPv+udKjGDViVPjBK/7RHqE5N9SwBTUHLt1K91MD6b/qAHhz2ILB2JqfLN
         pJuOL1XQgsIo1pCsoedB2XpIG6EsJVJxeHdWDX7gLZARV/OH0dM7+4i04ylRcpxyTFsZ
         gWU4oRuir1bk/OiZe69znOdOn+eNjLZ4aJwpwBBk8HNsLj/yvjxgNCYfVC28yU55WAtJ
         iv0xHpkvPCEKI7i9cBCWgtCwr2yLcu7pLaAw+Uj5OrSR9Zjc8odu2jFIUFl53AqQb1rR
         Fgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gJu/GAnviYn3d7aO05yfXl9ZcEPV7S5uHS4BiGszN/k=;
        b=bZUFdoo9xxZ9m2VPtBbGW1QBaJPuJDLxTMHw+Ty0B9kBlAgwmGIGAwUljJpGLor31z
         D+2uNLvB8P03Vq4zAl2/7d+FogRyCcuAXq3onvylm4ax+6/taQO12rm7mWtkWZiOC3Fh
         ZR+WsmMkDO5iXHPXBsutovYhEFs8gxYicin/kaKXb6etpi6+hrbqP2Mto7FlT7h80S7U
         ioQIfDj1Fl2WGm5XfkyeXPxJuxj7wPhFAdsis5hamOar/SMqAkEvQe4I9ISYsNctZiy7
         +W9cNdvfSi64nyW8+PesOt6Y3fkkz8GadmkH5CrPQobyPh2QuM+UTlfdgZd7pR4+9Dxm
         /UcQ==
X-Gm-Message-State: AOAM530QRutFUsRF2Y60M2llTKV0ohOLhRYb8ItssWl6LllZXlU3eqhP
        m6mf78vO7F6OWxhu2209+naE56wAp69dNg==
X-Google-Smtp-Source: ABdhPJxGhV+hnorFKnG01wS2frQWXBnJUFAkj/zXIPHjnAJ8fWMIP0MOSJahb0li9JbVJDK3vrifWQ==
X-Received: by 2002:a62:7c16:0:b029:329:8d4c:d12d with SMTP id x22-20020a627c160000b02903298d4cd12dmr27929794pfc.47.1626728147499;
        Mon, 19 Jul 2021 13:55:47 -0700 (PDT)
Received: from horus.lan (71-34-86-28.ptld.qwest.net. [71.34.86.28])
        by smtp.gmail.com with ESMTPSA id y82sm21451233pfb.121.2021.07.19.13.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 13:55:47 -0700 (PDT)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH 5/6] HID: wacom: Avoid sending empty sync events
Date:   Mon, 19 Jul 2021 13:55:32 -0700
Message-Id: <20210719205533.2189804-5-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719205533.2189804-1-jason.gerecke@wacom.com>
References: <20210719205533.2189804-1-jason.gerecke@wacom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Empty sync events clutter up logs and are a waste of CPU cycles. We can
avoid sending mt_sync events if touch is disabled or a specific slot is
unused. We can avoid sending full sync events if no events were generated.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index ce9e8e9b48b6..3f992c9dca4d 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2551,8 +2551,17 @@ static void wacom_wac_finger_slot(struct wacom_wac *wacom_wac,
 		int slot;
 
 		slot = input_mt_get_slot_by_key(input, hid_data->id);
-		if (slot < 0)
+		if (slot < 0) {
 			return;
+		} else {
+			struct input_mt_slot *ps = &input->mt->slots[slot];
+			int mt_id = input_mt_get_value(ps, ABS_MT_TRACKING_ID);
+
+			if (!prox && mt_id < 0) {
+				// No data to send for this slot; short-circuit
+				return;
+			}
+		}
 
 		input_mt_slot(input, slot);
 		input_mt_report_slot_state(input, MT_TOOL_FINGER, prox);
@@ -2696,6 +2705,10 @@ static void wacom_wac_finger_report(struct hid_device *hdev,
 	struct input_dev *input = wacom_wac->touch_input;
 	unsigned touch_max = wacom_wac->features.touch_max;
 
+	/* if there was nothing to process, don't send an empty sync */
+	if (wacom_wac->hid_data.num_expected == 0)
+		return;
+
 	/* If more packets of data are expected, give us a chance to
 	 * process them rather than immediately syncing a partial
 	 * update.
-- 
2.32.0

