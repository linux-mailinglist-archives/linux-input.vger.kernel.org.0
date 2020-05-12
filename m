Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782E51CEF5E
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 10:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729152AbgELIoe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 04:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729081AbgELIod (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 04:44:33 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEF4C061A0C
        for <linux-input@vger.kernel.org>; Tue, 12 May 2020 01:44:33 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id c24so3939603qtw.7
        for <linux-input@vger.kernel.org>; Tue, 12 May 2020 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1knqQDXtEJ5kXrNk6aN/d00f8DxBySu2hc2sGXn/2SA=;
        b=eezuuE0g938wCvoqLUZSfnoEqlWoVorMH2TtHBb7hYUrff3WAZ+nBIS0ePKKpAhD0s
         uLwxVXvfh+5qAC49bJG2HgViR0e14H1LxYy+hyqtNXhb2SnUl9dQ1bmkNZA8f5NF3QS9
         CYRiLW/923xntNOAOA5fP4MI8cekAJiiLRG3iZJluURJ1eyJhKAntJ/L3YRu3s2iPx1j
         5i974Z0+frRTCz1qrPWleCZgQrerDvWwrUCL7hPYz1WgmIucO2CHu1yN8fi2fuMbCBIi
         FvB7ppzw3cCiH5sqFef+cRoFPthOabxFP7sl92Z0FoISefAfeoSM2AeY8FKCZ6VXLSZa
         uAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1knqQDXtEJ5kXrNk6aN/d00f8DxBySu2hc2sGXn/2SA=;
        b=I8iCn4I72oGgWWtf7iAuYc47eIc6K4OJUz+BW2Co8kmpsXpsstcxYmJTtHjYGJdVBa
         RVoiXm2YMOidwvBLz21qQV8kU+w6RYPIQrddEgmLtTurdhlZy4XpzP4MxJILKNCdArM7
         mBx5Os4vs4Zq4TB4Wr4hWRiLkPU0DV6o19cSsjx6DELXR7u8KnuoJrfgfcZ27R4tBd+K
         5yJvy730eyRfEbs/pDU4+BFi86TdKm9TrVD4kuxXta9jeL9ITCadQGZRf2RIeccfYzu7
         6CJRN5RUNT2MniugqfluFFY6BG/D9mkP8n2ImwrcKPIqj4Vf/fGGDL0FuvVP+Hco5zSZ
         LBkw==
X-Gm-Message-State: AOAM5314cBfu3myhRz1LSIAwAk/Wg4UqbqQyFG1Xac8q2Q6/ZeHPYFjr
        e7CELwtCcnpoWET9KSsQHqUkezgocak=
X-Google-Smtp-Source: ABdhPJz3FVHsquEYOUWNUnpXu3kkuuk9Rr42S9sEXwhY/QeBNPtXS1mkr2zuaEZQ9ZPk9CMmMyQpkQ==
X-Received: by 2002:ac8:1967:: with SMTP id g36mr2069744qtk.332.1589273072493;
        Tue, 12 May 2020 01:44:32 -0700 (PDT)
Received: from localhost ([2601:483:4200:9113:fdae:121b:56a3:4870])
        by smtp.gmail.com with ESMTPSA id a124sm10766311qkf.93.2020.05.12.01.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 01:44:32 -0700 (PDT)
From:   =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Ethan Lee <flibitijibibo@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 4/4] HID: gamecube-adapter: restore input after suspend
Date:   Tue, 12 May 2020 10:46:16 +0200
Message-Id: <20200512084616.32158-4-fx.carton91@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512084616.32158-1-fx.carton91@gmail.com>
References: <20200512084616.32158-1-fx.carton91@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Send the init command after suspend, so that we get input reports again.

Signed-off-by: François-Xavier Carton <fx.carton91@gmail.com>
---
 drivers/hid/hid-gamecube-adapter.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hid/hid-gamecube-adapter.c b/drivers/hid/hid-gamecube-adapter.c
index efcbd8f27b67..11d3e483f0c1 100644
--- a/drivers/hid/hid-gamecube-adapter.c
+++ b/drivers/hid/hid-gamecube-adapter.c
@@ -441,6 +441,14 @@ static int gamecube_hid_probe(struct hid_device *hdev,
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
 	struct gamecube_adapter *adpt = hid_get_drvdata(hdev);
@@ -462,6 +470,9 @@ static struct hid_driver gamecube_hid_driver = {
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

