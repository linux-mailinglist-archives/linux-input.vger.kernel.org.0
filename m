Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C01874BAF78
	for <lists+linux-input@lfdr.de>; Fri, 18 Feb 2022 03:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbiBRCQ0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Feb 2022 21:16:26 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:34450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbiBRCQZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Feb 2022 21:16:25 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2F620B385
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 18:16:10 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 75so6604118pgb.4
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 18:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kUV6YppsZ3UG2CdtFBHXsvqMZiblZaRSNB/72uNfm3Y=;
        b=nggKEVz4f2QZldXOYAmoCF/pfMUoWO/BVQbfFMGjNRjY3E6jVx/SGOadU+VUPNPfLI
         pIedQHrmBJS3pDPSlP66KflV4SjvwEft5tdCDncSTRp07XpiH6X4wgdQVFyQ57M2lFQy
         wr8+WcWZSplFvgAZ87DVEDNZotO8Qe/hDF8k8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kUV6YppsZ3UG2CdtFBHXsvqMZiblZaRSNB/72uNfm3Y=;
        b=Dn8SkhXsEAGpOHZk9t7ldUnsD2fnr5aZcLaAglQPdakS53FD4BJPrjkLzSCiBjofPt
         iu8uYVnnJ5WCI72x/oePV7QnaTjoEHt9p3rnNt7IdhLTGBN+VVZS5Nkroe7mIX7rm9It
         plHiBp/MAc05dmEp4P9Yr0Y6sDM4y9bNmaQtQY9/GMpIxbBMQSliUEMpbJ03fBJOqzOu
         Vuh4D3BeoMlFFwpFkIaAtgcRM61ooOD3qfDkwpqyf+zjO+RdVyBqWpTUtDDHWHplg9AH
         1QfVh4W7Gc4r6rQoZxdykjTHoqhaqvw5+dT77iPFk36+B1erusLgaPcOzJFPt/vhxDdO
         6/kw==
X-Gm-Message-State: AOAM531p3AE5XdSa/wxybrEzXSYd0+QMbOduX2U3zqYiBP/jKd0p0NCu
        yacGsDZP9H+eXeDI5emzvbn3bJ3GhhLzR+Ed
X-Google-Smtp-Source: ABdhPJwFCSWZ7KADL/XXi7lfDGdGn1CpVJjNe20jA5ilHiybFnBf9dWUn6e+J34Zh+fIZK1Fr4pWZw==
X-Received: by 2002:aa7:88d0:0:b0:4c2:6f06:8c70 with SMTP id k16-20020aa788d0000000b004c26f068c70mr5683242pff.48.1645150569720;
        Thu, 17 Feb 2022 18:16:09 -0800 (PST)
Received: from wmahon.c.googlers.com.com (218.180.124.34.bc.googleusercontent.com. [34.124.180.218])
        by smtp.gmail.com with ESMTPSA id c9sm903342pfv.70.2022.02.17.18.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 18:16:09 -0800 (PST)
From:   William Mahon <wmahon@chromium.org>
X-Google-Original-From: William Mahon <wmahon@google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     William Mahon <wmahon@google.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH] HID: Add KEY_DASHBOARD usage code
Date:   Fri, 18 Feb 2022 02:16:00 +0000
Message-Id: <20220218021551.1.I3a7746ad05d270161a18334ae06e3b6db1a1d339@changeid>
X-Mailer: git-send-email 2.35.1.473.g83b2b277ed-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch maps the 0x0c/0x2a2 usage code to KEY_DASHBOARD.

Signed-off-by: William Mahon <wmahon@google.com>
---

 drivers/hid/hid-input.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index eccd89b5ea9f..de738927565c 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1162,6 +1162,8 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 
 		case 0x29d: map_key_clear(KEY_KBD_LAYOUT_NEXT);	break;
 
+		case 0x2a2: map_key_clear(KEY_DASHBOARD);	break;
+
 		case 0x2c7: map_key_clear(KEY_KBDINPUTASSIST_PREV);		break;
 		case 0x2c8: map_key_clear(KEY_KBDINPUTASSIST_NEXT);		break;
 		case 0x2c9: map_key_clear(KEY_KBDINPUTASSIST_PREVGROUP);		break;
-- 
2.35.1.473.g83b2b277ed-goog

