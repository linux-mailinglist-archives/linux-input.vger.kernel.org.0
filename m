Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A583766BC83
	for <lists+linux-input@lfdr.de>; Mon, 16 Jan 2023 12:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjAPLMG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Jan 2023 06:12:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjAPLME (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Jan 2023 06:12:04 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D1386A7
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 03:12:02 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id z11so40271107ede.1
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=diag.uniroma1.it; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTrwWvqf/cRj16lBWCPzPOJDd8vRArGRQ3nxDRY36BM=;
        b=FeV4C76oPMHwPkqAKitzAGRxcwdsIdeIsI30Tuv05Q4IgMwrOK6YPHgoT2xX2JA43g
         N1RRB2mTfRN8LFTHj7JwlLHR250+ARiKjprLGBiXP0CvlEXCwlSFiYlv0Z74OzS/WE1t
         +0pu4a4gd7Qrmfr/Rp0UHdWaTGHXGWT7VoGvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTrwWvqf/cRj16lBWCPzPOJDd8vRArGRQ3nxDRY36BM=;
        b=GdF738wt4J33sJTKT0nj2hkX4/cGVZoSv1byUO/uLZWHchG6SWYVBFUKPYJ1bpy6e/
         Al2lGYzTompoS34B6Z57vMhJb1Qfo4MjGJMKmigTz+igvwSerGxtT6tpvTudBYmRbMi6
         28Zf2vhHAUtOggchlHMyU7uc6Hvy6ogHi8e6dJEuxii++I+LXwigBfeRH/7gpbtNbvLn
         HCjrLnnClVRqQSLAj1A0eUfEFo4OGrgfYonolREfprFow43SaBR6Sf5MicGpBgbkN66r
         N0O21CjRpWSym7oxp+BC+C5u61nikCTtfTCdhSlbyw45fe815TiZBPuzzEFnUFNOe4Pt
         B+/g==
X-Gm-Message-State: AFqh2ko7NMovKAM+X7YVS+a5yCYQmI90d1rmEFNMgdT2mOUIutu4UxfE
        HawsgXiJSkQPnZg3JVARnYWSug==
X-Google-Smtp-Source: AMrXdXtrB2AvCCe5ljQEIoSQlRC1Hoi6lqHsGHrUDSpKjSdJUD4tpHCC9jx42+tVPCQ+9iIMEwwS/g==
X-Received: by 2002:aa7:cb42:0:b0:496:f517:d30d with SMTP id w2-20020aa7cb42000000b00496f517d30dmr32959917edt.38.1673867520946;
        Mon, 16 Jan 2023 03:12:00 -0800 (PST)
Received: from [192.168.17.2] (wolkje-127.labs.vu.nl. [130.37.198.127])
        by smtp.gmail.com with ESMTPSA id dk1-20020a0564021d8100b0049be07c9ff5sm4116903edb.4.2023.01.16.03.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 03:12:00 -0800 (PST)
From:   Pietro Borrello <borrello@diag.uniroma1.it>
Date:   Mon, 16 Jan 2023 11:11:24 +0000
Subject: [PATCH 1/2] HID: check empty report_list in hid_validate_values()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230114-hid-fix-emmpty-report-list-v1-1-e4d02fad3ba5@diag.uniroma1.it>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673867519; l=1184;
 i=borrello@diag.uniroma1.it; s=20221223; h=from:subject:message-id;
 bh=lt3do0cht6iOkduDwABvx2MxZ4GcPzw6T54suUgL54M=;
 b=D3EiqPP7uMKKmpKLJr7Zf6V5hG96SLdJWn+3FwR3uTqwjfK+hlIpfSI6dO3BZ3Io7YVXWw37E29d
 ssVUXB95AYjJfF27QCNsq7yJw/LVCZ4AnhgNYkTRjBbn286Z1Pxv
X-Developer-Key: i=borrello@diag.uniroma1.it; a=ed25519;
 pk=4xRQbiJKehl7dFvrG33o2HpveMrwQiUPKtIlObzKmdY=
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a check for empty report_list in hid_validate_values().
The missing check causes a type confusion when issuing a list_entry()
on an empty report_list.
The problem is caused by the assumption that the device must
have valid report_list. While this will be true for all normal HID
devices, a suitably malicious device can violate the assumption.

Fixes: 1b15d2e5b807 ("HID: core: fix validation of report id 0")
Signed-off-by: Pietro Borrello <borrello@diag.uniroma1.it>
---
 drivers/hid/hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index bd47628da6be..3e1803592bd4 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -993,8 +993,8 @@ struct hid_report *hid_validate_values(struct hid_device *hid,
 		 * Validating on id 0 means we should examine the first
 		 * report in the list.
 		 */
-		report = list_entry(
-				hid->report_enum[type].report_list.next,
+		report = list_first_entry_or_null(
+				&hid->report_enum[type].report_list,
 				struct hid_report, list);
 	} else {
 		report = hid->report_enum[type].report_id_hash[id];

-- 
2.25.1
