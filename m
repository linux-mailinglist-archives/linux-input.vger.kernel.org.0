Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C4847C759
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 20:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241742AbhLUTRx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 14:17:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241744AbhLUTRx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 14:17:53 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0149C06173F
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:52 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id v7so21605738wrv.12
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 11:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lMBsWcSJgb9i8qVTJYXW8mi34u0001qEof9Eg4CN2wo=;
        b=GU/0Uh223BuhV47IeS7prq9ccAttcAf8W0xnzcDu8EzdbfaAV7SeMOUbI5z2E1pP9e
         8TJy7mls6RD/8H+dWBy77IrCYZvNF1HKcZhGk30DKmEuv9ZmREci95rekuzoGV6yhc3k
         F/yoIbfNmhteBDaOD+gCRGORW7L6hgs8irwCzz8BCaQCPRDUaKkYFBggiCC8Pfm++Pam
         W2lBbRVZqjzZdpgYVXEquiYz8USTCb7UnAlEH5uVazrvqZo5taW+6BKAAPPwKbrSGng1
         J/3bMZMkgVpr2ObUoXLlLNZo1PYzbSp9Cxsyk8nMPPI8C0mSNbZz3WrLiciKQ47Cl5lc
         CuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lMBsWcSJgb9i8qVTJYXW8mi34u0001qEof9Eg4CN2wo=;
        b=fN/ENoIsr9hpYvuhXTJyIRLjmKo+9LCJQ4UjRzXa2L5JQ+d8hwiPe1rRsf+RIM3uVV
         /EMdIja2Tj2YVlGc3P/tBVfGb/gjiPd2rnclTU/Hhz32U6zFOVd3fegD5aBlRny0SAcw
         NInHV+ZgmQTCZ8gC8A8jy+UMSNx9Ev2KTEaI6FcyBWN+XN0vV0liFJkLlDvH0sFpR2cZ
         jmhknvQ1AcWqoZjTgS0by2v/9W+ASujT9CE+pNRI4Y6/DUsc9RZ+Tm3ol1rwbIE9z4CR
         I1YqFKRph3wMXgyfKSnj+5T96pkeTXTuZZ95Oxk9R6V6IoMhjvUqmXdBWp+sfsWMj0k8
         XKJQ==
X-Gm-Message-State: AOAM532vdaW2ItQ16Oz5t4NIlzobj1kYulnX5PYDsRqbm7eIOvSAEv14
        qJewU1N48GyGJOpnYBZ4L5x/j2fw/wChSeux6/o=
X-Google-Smtp-Source: ABdhPJzWAJvxrBBIhlt/mDRRTm/ZiXJ6WWfJh/CoYy9ntU7rm06IakF4I0fxRYre5bc6sBOSzIJu8Q==
X-Received: by 2002:a5d:51d2:: with SMTP id n18mr3699215wrv.83.1640114271241;
        Tue, 21 Dec 2021 11:17:51 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id t8sm3994846wmq.32.2021.12.21.11.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:17:50 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH 07/18] HID: input: allow mapping of haptic output
Date:   Tue, 21 Dec 2021 19:17:32 +0000
Message-Id: <20211221191743.1893185-8-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211221191743.1893185-1-acz@semihalf.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This change makes it possible to parse output reports by input mapping
functions by HID drivers.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-input.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 03f994541981..81eb277dee91 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -599,9 +599,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	if (field->report_count < 1)
 		goto ignore;
 
-	/* only LED usages are supported in output fields */
+	/* only LED and HAPTIC usages are supported in output fields */
 	if (field->report_type == HID_OUTPUT_REPORT &&
-			(usage->hid & HID_USAGE_PAGE) != HID_UP_LED) {
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_LED &&
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_HAPTIC) {
 		goto ignore;
 	}
 
-- 
2.34.1.307.g9b7440fafd-goog

