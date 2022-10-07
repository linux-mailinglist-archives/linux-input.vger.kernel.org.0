Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E72965F7D5A
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiJGSaZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiJGSaV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:21 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D3FA3F77
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:16 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b4so8501693wrs.1
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmRNqBI0gFXizyEQOegkkhDKDDOx721TmYyEvWtSMlk=;
        b=awDm5bCjYoyV0SgM0kmYHxalh3xodyD+6ORkktAtd1zgeFB/+XAy+k4tGTrjaaWzU5
         rDXAa6QlkjlHpVx+giz+8zD3nzPq/VqP+VV0wxrBICTewTjBDTfc3z/JsBLgI9UDQW1M
         hPkiNZ0AqhnbuN6jYNX3wROkfO7WbczRKM+ADe0+0t34s6LEK6qzDiDo0FD9eCpbbRQj
         UOEYKha27PkqQ3/Ng6SFzw8PAo6QTRnjN2bs3tOuJSLD1mjODC+XMPWARmRiXYKe+YwI
         uYaSal21ilYM14M4Q4na24/PiHgYefuguwuBkyzQANAQ/kdkQveooIaNPs2cgd0HPllt
         pRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmRNqBI0gFXizyEQOegkkhDKDDOx721TmYyEvWtSMlk=;
        b=YPAQ4sTR6zzmzYVbmTrmACYB+E66Quxt2BOm3Qw3OAoklRAvF7nD8CFEfp6alTxHgM
         pgmZ393bwM9+LfA5pPxTUPWuCAz5gjjJobsGjTXWyxrdqvFpfTbGdL4eh+1pqg/FSuLl
         CxVOHyZFpYX76/4HhzK/DMlToddGpAfpNxmigu3l0J7uaJguKB12N4xb24rsNdsXkbhL
         TFn3H4mn/6mYtjf2Bk/eVVGroRC4BxQPJYtwwP0RIgMJC3hYTmSGrSdOHLShsDwuToPd
         IaPPf9nk5x4zWQ/xXoGrqxuuDAfBKO9SxSkAGhS2I2G9H4AirPyTlbzB0NCMdfUykFwg
         iFAg==
X-Gm-Message-State: ACrzQf0Z8qdCyF4Llnm6vDra404qfk5a9VjN9VWXMTKyL/5RYz4McXPP
        ZHA7k3y7xkLfoVY1i6bhYrhqsTDYY5F7yF1E
X-Google-Smtp-Source: AMsMyM5EpCcZjuY6zXzdLBjT0bhOoyu5Z1tzZ/FSw3mt2oDw6nTFd/oljtvoaUN+J/UAxT9bMTlj8Q==
X-Received: by 2002:a5d:6dad:0:b0:22e:734f:31b1 with SMTP id u13-20020a5d6dad000000b0022e734f31b1mr4294521wrs.11.1665167414663;
        Fri, 07 Oct 2022 11:30:14 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:14 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 04/17] HID: input: allow mapping of haptic output
Date:   Fri,  7 Oct 2022 18:29:32 +0000
Message-Id: <20221007182945.1654046-5-acz@semihalf.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221007182945.1654046-1-acz@semihalf.com>
References: <20221007182945.1654046-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
index 859aeb07542e3..c60cee4bb6aa6 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -653,9 +653,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
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
2.38.0.rc1.362.ged0d419d3c-goog

