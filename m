Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A48321B94A
	for <lists+linux-input@lfdr.de>; Fri, 10 Jul 2020 17:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbgGJPUL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jul 2020 11:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727097AbgGJPTv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jul 2020 11:19:51 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4D4C08C5DD
        for <linux-input@vger.kernel.org>; Fri, 10 Jul 2020 08:19:51 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l17so6572412wmj.0
        for <linux-input@vger.kernel.org>; Fri, 10 Jul 2020 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab.ca; s=google;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kxnyGnMwxTRwHtpgKXQFv4Sp6EsduZoxQF9xvlfrbr8=;
        b=ZRVe/ibOcbNKEM/ckw2d45EAviU8Pdos52byPUPcHAF0KcH9B9qASluESjw4KaH4Yg
         gBkMUVeA1w+53smdKc/n0mMXp8ja0j3tKCB99dT5ELfcmTBVz/0PIEcqwf9AD2yrL8er
         PY1kyYvl0PYqsDEk51ZVOmlJCnfONwb34Yym1ASVdaVRgYExPRp2Y3zXG/wT4X8+Nosi
         WXeFcMTadVk1AeJs7OmMT/m29gdv4Ev/PzKgJYP1/nA0q7mFScCBEyass+jmBB4cgKJE
         iMAW7Rj1l5WQ57KkxmxPz2NC3QjhP/w9B1s0khMrEXmosFgOecRkp0W0udq1Wt4sttst
         fihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=kxnyGnMwxTRwHtpgKXQFv4Sp6EsduZoxQF9xvlfrbr8=;
        b=XSZLgcCMEXQAwYEOIlsFxqLyzwcpjUwQgffiOtbfLf1yJQd4OfmgpjULogtuLJIBkl
         FRCnyUXJx1U3iNg6ffJB+CCZ0C4+jfS2obs4Um0ixszt/VmxULTromZdF//wfFGNIMSM
         Ln5iqSDfOqIeyb1xX7jzE3O8Qf1xcaZu8BbfVcBPpzpIUv/s41YAo74fa9KRDb8dTfCg
         B0f1VqUadmprzo/oQ1nSogNPEv6ukGgQEv56Ypn8XNZ0/B7Z3DJsf9gj+D+JXT4PagEj
         Oa05qj/f6ofBi14jq3BrPT+S5aBDWGF7sjpLdEgk/6/zg5eK5h2Cti21Cl9pRa3Dd5aT
         wEcQ==
X-Gm-Message-State: AOAM533r9nNNUWnaKcAxddY9i8kMfCbtUk8WjSQtgv0kxxPVFVflEx+n
        N8sYen3GaTYQAQTsPGPJ0EhOAQ==
X-Google-Smtp-Source: ABdhPJzXzqIMMMApQjKWDU1z5QkbzF8CAES3zC4qQ+Oqh5yRVV9kfEvVTZWzmZDin+QTicbt2ad4Cw==
X-Received: by 2002:a1c:790e:: with SMTP id l14mr5587090wme.65.1594394389624;
        Fri, 10 Jul 2020 08:19:49 -0700 (PDT)
Received: from moist.secretlab.ca (188.28.146.46.threembb.co.uk. [188.28.146.46])
        by smtp.gmail.com with ESMTPSA id d13sm10400297wrn.61.2020.07.10.08.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 08:19:49 -0700 (PDT)
From:   Grant Likely <grant.likely@secretlab.ca>
X-Google-Original-From: Grant Likely <grant.likely@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Grant Likely <grant.likely@arm.com>,
        Grant Likely <grant.likely@secretlab.ca>,
        Darren Hart <darren@dvhart.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        stable@vger.kernel.org
Subject: [PATCH] hid-input: Fix devices that return multiple bytes in battery report
Date:   Fri, 10 Jul 2020 16:19:39 +0100
Message-Id: <20200710151939.4894-1-grant.likely@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some devices, particularly the 3DConnexion Spacemouse wireless 3D
controllers, return more than just the battery capacity in the battery
report. The Spacemouse devices return an additional byte with a device
specific field. However, hidinput_query_battery_capacity() only
requests a 2 byte transfer.

When a spacemouse is connected via USB (direct wire, no wireless dongle)
and it returns a 3 byte report instead of the assumed 2 byte battery
report the larger transfer confuses and frightens the USB subsystem
which chooses to ignore the transfer. Then after 2 seconds assume the
device has stopped responding and reset it. This can be reproduced
easily by using a wired connection with a wireless spacemouse. The
Spacemouse will enter a loop of resetting every 2 seconds which can be
observed in dmesg.

This patch solves the problem by increasing the transfer request to 4
bytes instead of 2. The fix isn't particularly elegant, but it is simple
and safe to backport to stable kernels. A further patch will follow to
more elegantly handle battery reports that contain additional data.

Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
Cc: Darren Hart <darren@dvhart.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/hid/hid-input.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index dea9cc65bf80..e8641ce677e4 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -350,13 +350,13 @@ static int hidinput_query_battery_capacity(struct hid_device *dev)
 	u8 *buf;
 	int ret;
 
-	buf = kmalloc(2, GFP_KERNEL);
+	buf = kmalloc(4, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-	ret = hid_hw_raw_request(dev, dev->battery_report_id, buf, 2,
+	ret = hid_hw_raw_request(dev, dev->battery_report_id, buf, 4,
 				 dev->battery_report_type, HID_REQ_GET_REPORT);
-	if (ret != 2) {
+	if (ret < 2) {
 		kfree(buf);
 		return -ENODATA;
 	}
-- 
2.20.1

