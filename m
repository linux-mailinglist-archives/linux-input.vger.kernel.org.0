Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF843168FB
	for <lists+linux-input@lfdr.de>; Wed, 10 Feb 2021 15:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbhBJOUC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Feb 2021 09:20:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbhBJOT7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Feb 2021 09:19:59 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6964C061574
        for <linux-input@vger.kernel.org>; Wed, 10 Feb 2021 06:19:18 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id y9so4478259ejp.10
        for <linux-input@vger.kernel.org>; Wed, 10 Feb 2021 06:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k809xF8FXmZ6wwSm0rj+ToOTD0vad1IBaWz+nCju/SM=;
        b=WVP9pSCYHbD2RJQveMx/bUVvqybPiB7beuqcnI1/7yWuHZjN7EQn3QK0Q7nk3OgpL8
         x03nD93GvswAQDtaZgTFCllE/D+0ClCNOL5hQu1PEQREcd2oSfCqQ0WV18Bjrt7/qJ0a
         GzJBxA2i/i5oWCChOlkArFCMyEK31npAWc/DETIIfNWqdTxJWGb+zhkGq36sSBhjZmUB
         0VCLYZgkX7bMUsvJLwGMvu3nAw6VqoDwbKbWJI42Er/L+yougYgceaZSvAxKKo/+gFwo
         zecZF0K8lneHlUvHhBAR14l7+WBwpjYSP1WFGjQSPxj+HNOtQv0WDas5QS8C9v3Na6Wh
         /Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k809xF8FXmZ6wwSm0rj+ToOTD0vad1IBaWz+nCju/SM=;
        b=ez3h5KQ0jtHVk3QUmF2qm5rxEQi1i7QbB7gad1DGhvpFm+fR+vqs4xdQ5gYLh+FZ+C
         Qxe3Uvxn6/bg11oqtrWCPFXzBI8bYIPwR6EWXZKssKodyfB8D5UYCzzLw0G6XXcM4pfr
         jlToEgvwV6OkiQuluWehnYG2ZWb5PHBSGP9uhs/Dub9/VN7BqeJWzUtF5H/r3EsGtSgK
         owWlC3WuRBwpnIxX6GGJuv2tnIyDYJ7E7jOOS9ywwxZwZlGgW8FvSBQkniZUa8kGU1a4
         d4IKYFajG804AAx8/w2Pn3M5Y83aQ/xfWQ8bxRykqRItJU8TSZvV/r3B85q16v5OoX8a
         Jh0g==
X-Gm-Message-State: AOAM533fhyw3Nt5Qpim47haninqUUChF0r4U0+8z2mQ7Hx35hPeUDl1Y
        EykbOt+swGAktqe4h7OQXmpHOdn8b4+88gRL
X-Google-Smtp-Source: ABdhPJwK4HUNG8nXHhbbkm95Kn4SGv0IzlMhU6ub0Ta+00U9FzGAu5JlrQsECvKrSHDz10wOlEEhgA==
X-Received: by 2002:a17:907:78d5:: with SMTP id kv21mr3108672ejc.461.1612966757327;
        Wed, 10 Feb 2021 06:19:17 -0800 (PST)
Received: from dell-xps159570.domain_not_set.invalid (129-228-158-163.dynamic.caiway.nl. [163.158.228.129])
        by smtp.gmail.com with ESMTPSA id h25sm1308340ejy.7.2021.02.10.06.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 06:19:16 -0800 (PST)
From:   Yorick de Wid <ydewid@gmail.com>
To:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Yorick de Wid <ydewid@gmail.com>
Subject: [PATCH 1/1] HID: Fix typo in HID-core
Date:   Wed, 10 Feb 2021 15:18:02 +0100
Message-Id: <20210210141801.22033-1-ydewid@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Yorick de Wid <ydewid@gmail.com>
---
 drivers/hid/hid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 56172fe6995..6a90fb795f9 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2038,7 +2038,7 @@ EXPORT_SYMBOL_GPL(hid_disconnect);
  * @connect_mask: which outputs to connect, see HID_CONNECT_*
  *
  * Call this in probe function *after* hid_parse. This will setup HW
- * buffers and start the device (if not defeirred to device open).
+ * buffers and start the device (if not deferred to device open).
  * hid_hw_stop must be called if this was successful.
  */
 int hid_hw_start(struct hid_device *hdev, unsigned int connect_mask)
-- 
2.30.0

