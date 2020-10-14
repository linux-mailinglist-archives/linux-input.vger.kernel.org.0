Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 221DA28DD85
	for <lists+linux-input@lfdr.de>; Wed, 14 Oct 2020 11:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730964AbgJNJZH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Oct 2020 05:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730545AbgJNJTn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Oct 2020 05:19:43 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29153C00458A
        for <linux-input@vger.kernel.org>; Tue, 13 Oct 2020 18:31:15 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id e18so1706861wrw.9
        for <linux-input@vger.kernel.org>; Tue, 13 Oct 2020 18:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aFD8o8OQBdMNdPujLo3Tl6f0aLZhoS5VCllcOsEMav4=;
        b=vNoCrhZb2y4racQYRmQJf7yrhmKlLv9H+ik7leKJw0gSHYfpiNVhkaGkd1nMzHFu8P
         BtbYa+F92LVq8VWG8Rl7zBuFUO/rjhMIb8mTVUQAgI7TWHRVYnWLgvDIPRpUf/ityIQv
         BbMoJR6JpoBoQmQ2aCZ2obSK5BYkbHnqLRTDA/u6zvBlzf0fNh/XOMu/McsNX0UJVdLn
         veEzkyGmxyoGOIZzvJaNswWcWqMwksnsdk425qtm4fkooi2zH+pdOxbCvHqLqBCCR2wz
         lpllTrVsBwExFjuR3tIuKXjIKHH7z0ryV3r43AQ6Lb73+JBhC5eI4JoNqEEX4j27p0/w
         Vh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aFD8o8OQBdMNdPujLo3Tl6f0aLZhoS5VCllcOsEMav4=;
        b=ufrDaBYvqwnn0JmLhfpQxP2nU/Vnhq3K+ErzXj1t+6msjfpp8Uvpv1Xg/Qia34x7PD
         CpCHNmUFLM6yS1E+5M+4ultIkSjKFBYP//hav99MWfeo7ZRNnkkG6wrUrEOgK7GVy6Jb
         OIoBq4MmgeywSqQwS+3uUMhRcg1VYf9EXJEVacitOdLkUT4EA25U+nffOsGdtOXnoJD9
         +VeCuGRzAJIe2/oTy0rYbewtr2wuOkmYnZE9inF4icPLV6ElVcJQb8ob0cDeOD+kaYXq
         Ux2aLT5O3a8tYijggcWXCs5VOA+DfXMiMI2PCe1tc1Er9EUavV4PlEoMouq020qI+tpS
         GZrQ==
X-Gm-Message-State: AOAM532jIc3PERZm+1AA2nLupnPhchtz8qtGu17Xv0tR6YnpjAgf09mb
        14et+IfiDTQwHcxpib6E+0wc+yw/W+s+LmyF
X-Google-Smtp-Source: ABdhPJx6uWwncKcpv2+lEZqoAbXo+TNyCDj4G4gXUqiekIWysvh3AwKapHhAIDJZL76RCFVlNOgEQA==
X-Received: by 2002:adf:e806:: with SMTP id o6mr2504942wrm.42.1602639073776;
        Tue, 13 Oct 2020 18:31:13 -0700 (PDT)
Received: from localhost (242.19.86.79.rev.sfr.net. [79.86.19.242])
        by smtp.gmail.com with ESMTPSA id p13sm1143765wmb.5.2020.10.13.18.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 18:31:13 -0700 (PDT)
From:   =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>,
        Ethan Lee <flibitijibibo@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v3 4/4] HID: gamecube-adapter: restore input after suspend
Date:   Wed, 14 Oct 2020 03:30:23 +0200
Message-Id: <20201014013023.23078-5-fx.carton91@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014013023.23078-1-fx.carton91@gmail.com>
References: <20201014013023.23078-1-fx.carton91@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Send the init command after suspend, so that we get input reports again.

Signed-off-by: François-Xavier Carton <fx.carton91@gmail.com>
---
 drivers/hid/hid-gamecube-adapter.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hid/hid-gamecube-adapter.c b/drivers/hid/hid-gamecube-adapter.c
index 53d372a24277..0951a25b048b 100644
--- a/drivers/hid/hid-gamecube-adapter.c
+++ b/drivers/hid/hid-gamecube-adapter.c
@@ -452,6 +452,14 @@ static int gamecube_hid_probe(struct hid_device *hdev,
 	return ret;
 }
 
+#ifdef CONFIG_PM
+static int gamecube_resume(struct hid_device *hdev)
+{
+	gamecube_send_cmd_init(hdev);
+	return 0;
+}
+#endif
+
 static void gamecube_hid_remove(struct hid_device *hdev)
 {
 	struct gamecube_adpt *adpt = hid_get_drvdata(hdev);
@@ -473,6 +481,9 @@ static struct hid_driver gamecube_hid_driver = {
 	.probe		= gamecube_hid_probe,
 	.remove		= gamecube_hid_remove,
 	.raw_event	= gamecube_hid_event,
+#ifdef CONFIG_PM
+	.reset_resume	= gamecube_resume,
+#endif
 };
 module_hid_driver(gamecube_hid_driver);
 
-- 
2.26.2

