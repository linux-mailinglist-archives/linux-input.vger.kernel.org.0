Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C95437B7605
	for <lists+linux-input@lfdr.de>; Wed,  4 Oct 2023 02:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238883AbjJDA6I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Oct 2023 20:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238962AbjJDA6H (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Oct 2023 20:58:07 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46157B7
        for <linux-input@vger.kernel.org>; Tue,  3 Oct 2023 17:58:03 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d81d85aae7cso367840276.0
        for <linux-input@vger.kernel.org>; Tue, 03 Oct 2023 17:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696381082; x=1696985882; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uThSy4yEdZygz3nx9AdT/+Ka5ZDArvLjVeK3y4dcvFg=;
        b=WcIa0QSlaApCsdXeQUUsE4MkFxt49fgzs+mlRdsqiRPMmuoyFgluspgbGzYFgMmtlM
         Kkm+P7HDgNfZOonNCu7mOi4W2PNZVw+/lhiUzFG9cCIKDQK+i4XGjmpj5byQ6b+d2Pm6
         xLGjSesmmQ1EsoHtsITqgK7uuhQxS2inGwBUyHbFrLvX67awXgs+tInu14Lfdao48IrN
         fwWUJx/sgvfEPwJvOCGxXf0f4g/vEufHBOMwRDsr6MHChVwYuI9PvdIyZJ+iTSbyO3+j
         M/nWdsyYCgVXm4yi6/BLIxhufZOz5VSi6cYXpeaP3KCtnsfxtCMg/LOGJCVQ5GQtDVR6
         loAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696381082; x=1696985882;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uThSy4yEdZygz3nx9AdT/+Ka5ZDArvLjVeK3y4dcvFg=;
        b=HRCLecZF+6Ve+TfHQPaj6svGFoD1Gj6ECk4xUlGF4GTtuv2CNDqAKKIE4PjS8C/YbQ
         cUZl3/i26ueTdYr7DsPe9qP050LoqPqWa41onLoZAManurtZLReXV5dzgFjjQIT4o3Oj
         5gr+9KNnE5fOhqwqDgFwn99GUHP8oAz5OBE8/xPt3Tsads5rD5lDUUoOD78bgBjS16S7
         k6ZtVEOK7zCkv8q5wtU23gnmmZS/YU+ZqivCoarCaxoKQ1uXLtcmuWo/mLwTK/1reZeB
         hQ3vEZPbaUGNzwNnNkmBvvbW48IOFGb936qxxdwAFi5FBsVg8fSHjPvAV5UhbqD+JJmP
         XFuA==
X-Gm-Message-State: AOJu0YwB7F0xdYSnlL8gD/uqR2C3eNSUkH5lp+iuLdqCjgv7wbBUfJKw
        yJm3wUkCkIX6M/HUqZJZMuCAGlGLTgZ2DSzXZsxf
X-Google-Smtp-Source: AGHT+IGMPS6riiI0T9ofgPM70mrTKqdYfgP6uvgJ51Ftij4XuTNLRixV8U6nH5DOAQqNufqzPO4Xi4IrIJQsw+E9dJwJ
X-Received: from horchata.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:5b3])
 (user=jefferymiller job=sendgmr) by 2002:a25:b8d:0:b0:d89:42d7:e72d with SMTP
 id 135-20020a250b8d000000b00d8942d7e72dmr82813ybl.3.1696381082437; Tue, 03
 Oct 2023 17:58:02 -0700 (PDT)
Date:   Tue,  3 Oct 2023 19:57:24 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20231004005729.3943515-1-jefferymiller@google.com>
Subject: [PATCH] Input: elantech - fix fast_reconnect callback in ps2 mode
From:   Jeffery Miller <jefferymiller@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     regressions@lists.linux.dev, benjamin.tissoires@redhat.com,
        linux@leemhuis.info, Andrew Duggan <aduggan@synaptics.com>,
        Andrew Duggan <andrew@duggan.us>, loic.poulain@linaro.org,
        Jeffery Miller <jefferymiller@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make `elantech_setup_ps2` set a compatible fast_reconnect pointer
when its ps2 mode is used.

When an SMBus connection is attempted and fails `psmouse_smbus_init`
sets fast_reconnect to `psmouse_smbus_reconnect`.
`psmouse_smbus_reconnect` expects `psmouse->private` to be
`struct psmouse_smbus_dev` but `elantech_setup_ps2` replaces
it with its private data. This was causing an issue on resume
since psmouse_smbus_reconnect was being called while in ps2, not SMBus
mode.

This was uncovered by commit 92e24e0e57f7 ("Input: psmouse - add delay when
deactivating for SMBus mode")

Closes:
Link:https://lore.kernel.org/all/ca0109fa-c64b-43c1-a651-75b294d750a1@leemhuis.info/
Reported-by: Thorsten Leemhuis <linux@leemhuis.info>

Signed-off-by: Jeffery Miller <jefferymiller@google.com>
---

The other callbacks set in psmouse_smbus_init are already replaced.
Should fast_reconnect be set to `elantech_reconnect` instead?


 drivers/input/mouse/elantech.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2118b2075f43..4e38229404b4 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -2114,6 +2114,7 @@ static int elantech_setup_ps2(struct psmouse *psmouse,
 	psmouse->protocol_handler = elantech_process_byte;
 	psmouse->disconnect = elantech_disconnect;
 	psmouse->reconnect = elantech_reconnect;
+	psmouse->fast_reconnect = NULL;
 	psmouse->pktsize = info->hw_version > 1 ? 6 : 4;
 
 	return 0;
-- 
2.42.0.582.g8ccd20d70d-goog

