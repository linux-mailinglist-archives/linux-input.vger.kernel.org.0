Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3587A3CFEF9
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 18:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232653AbhGTPcu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jul 2021 11:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235201AbhGTP1j (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jul 2021 11:27:39 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 443BAC061786
        for <linux-input@vger.kernel.org>; Tue, 20 Jul 2021 09:08:14 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id p17so11634630plf.12
        for <linux-input@vger.kernel.org>; Tue, 20 Jul 2021 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YJQlCsE07lUcHWxp+SqEVtxXbwI1qVhseuzBIbE4s9o=;
        b=aah3byr5l7ysi3eRrhX+vLvuZk2/uvwgIc078RaQJqMypWHGyj8JTz+uA403X0sCh4
         TvDY760OfOfvfR69IFlQMu/DW7ttgsrjlrO31GNY82TnoW1QNIQAwjt6L1mk+T6o2puI
         mzCdqi6e9vrOc/9B0DYIquAkMSt0B1RRtSoVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YJQlCsE07lUcHWxp+SqEVtxXbwI1qVhseuzBIbE4s9o=;
        b=cThTqMhPvhqw+Y9QhGNkFh3x7aJDt0o9c1Tb9y+FHcavIS20JSYyaSVjtto+DyrKUt
         Kn8KjOq0bugxP8ZMMCXoBbWNQEBrQb0i168/IpZ0hpCiR4xXDMJnTsja4ofxV+cgWfFn
         FAUIfBbnuMGsqQqrxjoZkPDDpPQ9j6K6w/VN1iDg2Z0QEdVJzTLwViFLRfNykxqG9M7v
         5EkuHm72EAWvGrWungmIiRcmb/WXoSTfvOeEyPllIXOmCsTnaccZIHi7cVl458vX3ufn
         HiyuJ5ba2qYkpyufLvWciJb4KkU7HKYPe2p0WProReo5LCC/BGL3PDHRwZml70QKEfJT
         0JuQ==
X-Gm-Message-State: AOAM532MrKIhzUuxWIsXh0Wc3aIFckS68ifzTmUcW+Z0rKQP4ebP0HZw
        Wf6ITHZPhlvzyFullSwQJLTiqIC6zRqutA1p
X-Google-Smtp-Source: ABdhPJxX0v5I5TjjNBymCDBalC7ggAVi8GV2ei6MQrgctbG/4AETRH7BmSko8YmTRKF7qmfrWGTlKw==
X-Received: by 2002:a17:902:9688:b029:129:183a:2a61 with SMTP id n8-20020a1709029688b0290129183a2a61mr23812097plp.27.1626797293805;
        Tue, 20 Jul 2021 09:08:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:a3c3:c989:fdd2:555f])
        by smtp.gmail.com with ESMTPSA id o3sm3132961pjr.49.2021.07.20.09.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 09:08:13 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: i2c-hid: goodix: Use the devm variant of regulator_register_notifier()
Date:   Tue, 20 Jul 2021 09:07:49 -0700
Message-Id: <20210720090736.1.Idc6db7d0f2c2ecc6e533e5b918a651a66f337b2f@changeid>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In commit 18eeef46d359 ("HID: i2c-hid: goodix: Tie the reset line to
true state of the regulator") I added a call to
regulator_register_notifier() but no call to unregister. That's a
bug. Let's use the devm variant to handle the unregistering.

Fixes: 18eeef46d359 ("HID: i2c-hid: goodix: Tie the reset line to true state of the regulator")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
index 31a4c229fdb7..52674149a275 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
@@ -132,7 +132,7 @@ static int i2c_hid_of_goodix_probe(struct i2c_client *client,
 	 */
 	mutex_lock(&ihid_goodix->regulator_mutex);
 	ihid_goodix->nb.notifier_call = ihid_goodix_vdd_notify;
-	ret = regulator_register_notifier(ihid_goodix->vdd, &ihid_goodix->nb);
+	ret = devm_regulator_register_notifier(ihid_goodix->vdd, &ihid_goodix->nb);
 	if (ret) {
 		mutex_unlock(&ihid_goodix->regulator_mutex);
 		return dev_err_probe(&client->dev, ret,
-- 
2.32.0.402.g57bb445576-goog

