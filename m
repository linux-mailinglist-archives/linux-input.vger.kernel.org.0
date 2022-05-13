Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A30FC525F13
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379069AbiEMJj4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379096AbiEMJjt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:49 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AF0291CDE
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:48 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id e29so1015748wrc.11
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O9z/PqC89pqgqEOOhqgahLZjJuV2bITnseB+HB7kVRI=;
        b=sPP2EEFfPQVwNd5Bz8A34V6S2F1cUmjnVdrr3ms/ynkfYRWWdcK+2zsvfPpFZda6LX
         Ys/A4T9v+n/MeWpDtkt4ngiyHXWwt/qlSjAhvG7MR1LWzg9pOL8Z8sfqW2LvSUws1zTX
         J8+6pez8CTlmQBhXOQn6Plz2eG3Hs4UxH3RxGvS6XGrEM2oergHuTmy5+j3qao7A7a7E
         Lz891sdScFjtfKFQbm+QkCZw3bggkj8B6/67/VSlTEmgBu1F4c9rAo84s9hyybl3YjoU
         yWIvfC73tu2rzehwLy9LJ6DAjjcql3o2Aib9WFB9sin6MB3C76Io2XAQJtb3i48zJmYu
         2hpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O9z/PqC89pqgqEOOhqgahLZjJuV2bITnseB+HB7kVRI=;
        b=JI0gfiAiUXsLvoHK/S/r7wEofhOOsJOjJCRfHghVCDH6d3z+yT50RIlMANKykipEYN
         6oR+OfMegYCKqN4CvbW7HsJVTUPeQZGUbNX3kbbKeeiEEmVGRrGhuWZD48V0cmZm8rGP
         jMcK7jNZ2HXl/sbzbQRkUCkD6KIzVXLQB5+tbXFvZfDIdqHyNFiLePVuWTL8VFR6zVW5
         do85UuGdhKqU2Jxshy3NbOcYO08qeYLCh9r22q9WKDXhHfiSCUC2oYASwT82RHQqblz+
         L1pfxDBHqdD1sUcAQd30q8M1vKvb7NkeZx+rGHzZLEg25WfKMzYjNCFy++EobjEi+Q7L
         Gc4Q==
X-Gm-Message-State: AOAM530jH4ie1eQnA4H6Ehh1qCHJ1zqeFIofxvdjec3rWazQS4Bc9rfB
        0emoXdyufcgGXjDsqaamlAUtd0W/tK14McUBego=
X-Google-Smtp-Source: ABdhPJyH2z6wSh62B31TWZ6OvH2dGuYUOroqh/7QLIQ3OVfvhfVdaj0J2pDdy4M9jkTfmkeiaCKnCg==
X-Received: by 2002:a5d:524f:0:b0:20a:cff1:1cef with SMTP id k15-20020a5d524f000000b0020acff11cefmr3145351wrc.157.1652434787033;
        Fri, 13 May 2022 02:39:47 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:46 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 04/17] HID: input: allow mapping of haptic output
Date:   Fri, 13 May 2022 09:39:14 +0000
Message-Id: <20220513093927.1632262-5-acz@semihalf.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513093927.1632262-1-acz@semihalf.com>
References: <20220513093927.1632262-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index c6b27aab9041..77f2930f78f5 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -649,9 +649,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
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
2.36.0.550.gb090851708-goog

