Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 914293CF017
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 01:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355423AbhGSW5X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Jul 2021 18:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345751AbhGSUPS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Jul 2021 16:15:18 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69569C061768
        for <linux-input@vger.kernel.org>; Mon, 19 Jul 2021 13:54:21 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id g24so12318219pji.4
        for <linux-input@vger.kernel.org>; Mon, 19 Jul 2021 13:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FS7hA8Ssw0OYBVwW6lnnTxfgSQoV+0/cH1NHErOBt6k=;
        b=tG5WFuVoZ4zqsP8QzPAubO0pEp0kx5h+4kMdHhSo1BsB87TzirkXFrvMaDJuFOCTDL
         t1Q/E40U8it+wS5fCBQGzbwlxiiMskzaaRH51GBINcRxGLLvYWOkLNc1GsbXVpOMyqpc
         uoahGLaikqRKAcaUEeal4rjIfIRiQzSXSt2HI2KQQ2I0vophtvUP+KQKzFlgGBEqdKMW
         f2q5jCYk188bMFn+C0GlTOVbaKRl4r2SXYYXIbZznRi/Rm5/kymcBosOcvypNLL+4URR
         oCsENm5QA4ioN8Adv9OjkWbLDQlgtXEYHO8zUlNj+qvwendMGyciSwdkEYcJxbkL6NJv
         XdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FS7hA8Ssw0OYBVwW6lnnTxfgSQoV+0/cH1NHErOBt6k=;
        b=NlgYstHgm1dBvl+/obm+Bh5iRdgX+jv+85UwogHH1CwlR3ojufYjCLoAIYssYZZMym
         Qe5R1aiLlGx7xs5+M8wJFMFgBqSPWI+QeVgl4YBCj7WUcNRjUGcUY/hgF5ptDxOAYGee
         hMJX8vk8cAf2IeTL1ux7gRMqoZ+ixP69fmHkR1EqyMyWjwOSF1yoNKD/rsee5RWfv3oU
         86QaeNPgdJJ+0zp/tbGo//vpaQqJZUmaJo2qgASFJRSP9l1rqc4kS40zwhV/t5JkX5e4
         swQzIJqtqiqFsEe6mlP8KbEwgxrUk9ySCiHoJnMaP1HLCCG3RrVOrJf5KrClH+CZX1ul
         JWeg==
X-Gm-Message-State: AOAM532dfao5rwZSDPCvVxJOJbdYK5GYEhanKlGUaDIL5aQPQ5K0qmtR
        m4sDsyegTaAzO/dbI/Yt4CtDzL0L61xLFw==
X-Google-Smtp-Source: ABdhPJzV+uJcPgBlx2dFr4U1H8XiL5ssDXyu4KWAxZGJCjtS0ZqOVEGE6UsQ73LG9uHHj0wRXuq4ew==
X-Received: by 2002:a17:90a:2f63:: with SMTP id s90mr31671042pjd.168.1626728146339;
        Mon, 19 Jul 2021 13:55:46 -0700 (PDT)
Received: from horus.lan (71-34-86-28.ptld.qwest.net. [71.34.86.28])
        by smtp.gmail.com with ESMTPSA id y82sm21451233pfb.121.2021.07.19.13.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 13:55:46 -0700 (PDT)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH 4/6] HID: wacom: Skip processing of touches with negative slot values
Date:   Mon, 19 Jul 2021 13:55:31 -0700
Message-Id: <20210719205533.2189804-4-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719205533.2189804-1-jason.gerecke@wacom.com>
References: <20210719205533.2189804-1-jason.gerecke@wacom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The `input_mt_get_slot_by_key` function may return a negative value
if an error occurs (e.g. running out of slots). If this occurs we
should really avoid reporting any data for the slot.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 27587070a192..ce9e8e9b48b6 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2551,6 +2551,9 @@ static void wacom_wac_finger_slot(struct wacom_wac *wacom_wac,
 		int slot;
 
 		slot = input_mt_get_slot_by_key(input, hid_data->id);
+		if (slot < 0)
+			return;
+
 		input_mt_slot(input, slot);
 		input_mt_report_slot_state(input, MT_TOOL_FINGER, prox);
 	}
-- 
2.32.0

