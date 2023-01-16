Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB29466BC85
	for <lists+linux-input@lfdr.de>; Mon, 16 Jan 2023 12:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbjAPLMI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Jan 2023 06:12:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjAPLME (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Jan 2023 06:12:04 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2908AB747
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 03:12:03 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id v10so39032000edi.8
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 03:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=diag.uniroma1.it; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8iSePi43/1oa+PXasTdV2oiRmbbh0AS7xFey01UdB8=;
        b=t8hg+KGoh84kOMTcYtqVrn1jGjAAjFWqVQBvdYr/1UStUvSAZ6BXvorlTMxYWjNhhb
         sAIFjy5UUMwTnsKwwySnFEbhRHN56bE951JfTuKyNKQO1toWG++AOhk6CmIhqWJ7r9Hj
         IZjZO581rCqEOLCtqw5TSP9gm40EgzxbmMnzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8iSePi43/1oa+PXasTdV2oiRmbbh0AS7xFey01UdB8=;
        b=noHGbVamAaERuePQyBr6bsuaktP2pELXkOOIfI7rFmE2KQJI+czz0/3gKA5pya+Rxt
         pq1c8/pKnICOceMErT2woOcQtdXm8pJaur/EEYQpeE557suZlp0nK5rHmNlLmGE7TiE0
         cH8FYB+Zy5Fm0S3hCGl540eYKGqDFZQ8Z4DNL/X7R1PCn+xKTaydPAgSBk+lpnNyhwgT
         0mdky885fTi0RD4QLbqXo0QKShPOclapeBQ/vzYfnlpqPMGseHIwwPB3Nd8WN1D45sGx
         9P8AzbcY95rW59gmMtewKpjImv8WWL7Cw6c8qcEiZU4olTD7Cgr98gpEjpE+UJAubzc1
         yZdw==
X-Gm-Message-State: AFqh2kq4+sO+YvHWkvK2xI9HlSb9stpc2SWJ/e0/b9fBTNzFuugMs9yR
        efw/t/GBBWX2Fha4TUY97iQWMg==
X-Google-Smtp-Source: AMrXdXv6TFEdiWntsO1tjHxNabDcEcoLUwHotCmNHH/iJGi1E2185mgAXI+YWrRTMFa7kC5MiZeVUQ==
X-Received: by 2002:a05:6402:e0f:b0:468:58d4:a0f2 with SMTP id h15-20020a0564020e0f00b0046858d4a0f2mr87788527edh.23.1673867521686;
        Mon, 16 Jan 2023 03:12:01 -0800 (PST)
Received: from [192.168.17.2] (wolkje-127.labs.vu.nl. [130.37.198.127])
        by smtp.gmail.com with ESMTPSA id dk1-20020a0564021d8100b0049be07c9ff5sm4116903edb.4.2023.01.16.03.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 03:12:01 -0800 (PST)
From:   Pietro Borrello <borrello@diag.uniroma1.it>
Date:   Mon, 16 Jan 2023 11:11:25 +0000
Subject: [PATCH 2/2] HID: check empty report_list in bigben_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230114-hid-fix-emmpty-report-list-v1-2-e4d02fad3ba5@diag.uniroma1.it>
References: <20230114-hid-fix-emmpty-report-list-v1-0-e4d02fad3ba5@diag.uniroma1.it>
In-Reply-To: <20230114-hid-fix-emmpty-report-list-v1-0-e4d02fad3ba5@diag.uniroma1.it>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Kees Cook <keescook@chromium.org>, Hanno Zulla <abos@hanno.de>
Cc:     Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>, Jakob Koschel <jkl820.git@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pietro Borrello <borrello@diag.uniroma1.it>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673867519; l=1136;
 i=borrello@diag.uniroma1.it; s=20221223; h=from:subject:message-id;
 bh=XYXrgNLtkM9f60Vo/ecJS9HAYWzb6NUELifPUuIruDU=;
 b=vLu1y0BiQa9KA1E8lDi8s2talWDgpEgLlLaAXA2rWuFanZp7a0Pv/AQhZQdS8easf6PqMc60XpAV
 FBCnpj0dAM2Ll3mOUTLNfobbFBjv/3U6c/IVbN7nxAuj+ACK81Uy
X-Developer-Key: i=borrello@diag.uniroma1.it; a=ed25519;
 pk=4xRQbiJKehl7dFvrG33o2HpveMrwQiUPKtIlObzKmdY=
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a check for empty report_list in bigben_probe().
The missing check causes a type confusion when issuing a list_entry()
on an empty report_list.
The problem is caused by the assumption that the device must
have valid report_list. While this will be true for all normal HID
devices, a suitably malicious device can violate the assumption.

Fixes: 256a90ed9e46 ("HID: hid-bigbenff: driver for BigBen Interactive PS3OFMINIPAD gamepad")
Signed-off-by: Pietro Borrello <borrello@diag.uniroma1.it>
---
 drivers/hid/hid-bigbenff.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-bigbenff.c b/drivers/hid/hid-bigbenff.c
index e8c5e3ac9fff..e8b16665860d 100644
--- a/drivers/hid/hid-bigbenff.c
+++ b/drivers/hid/hid-bigbenff.c
@@ -344,6 +344,11 @@ static int bigben_probe(struct hid_device *hid,
 	}
 
 	report_list = &hid->report_enum[HID_OUTPUT_REPORT].report_list;
+	if (list_empty(report_list)) {
+		hid_err(hid, "no output report found\n");
+		error = -ENODEV;
+		goto error_hw_stop;
+	}
 	bigben->report = list_entry(report_list->next,
 		struct hid_report, list);
 

-- 
2.25.1
