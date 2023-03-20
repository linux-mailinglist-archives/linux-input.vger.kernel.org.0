Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC586C0813
	for <lists+linux-input@lfdr.de>; Mon, 20 Mar 2023 02:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbjCTBGB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Mar 2023 21:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231705AbjCTBFZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Mar 2023 21:05:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091BDD30F;
        Sun, 19 Mar 2023 17:58:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 62AC961203;
        Mon, 20 Mar 2023 00:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B8BC433EF;
        Mon, 20 Mar 2023 00:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679273829;
        bh=TuAJZ+k8hTbDsjg6vfN3jftPCZL8GO6/3bwa3bV2Irc=;
        h=From:To:Cc:Subject:Date:From;
        b=boXgG+PXabs6fXNQvN+e+ww68zB4dtZGtL/fO/uDum6oo/QvZdE7yjI7pc0E68pqb
         Sv5hz2UPyL86GAnGYX42Cx9mRNctZx/Lum9+kXvK8orO3d0tpxxZjFar9amouNW8Od
         q/pv6xi9aGa9uRHCckhhv+Wec8HarcqmkBwoAuNnXntYBz5neN33OkN9JtdzoeuqD6
         R20Th1V1Q8sMBFKZBMK8YxVmsu6cIncuCCaR90FMmiX9Ho/Fs7AdoxhfQ6zcE5uwFy
         tI+19lVw0UfAectA7+qm7SY3whuBWJx16GEFuVvW1VoAU1PrN9P7vLVKg8key1jPN/
         7HX+SiPI79CvQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Lee Jones <lee@kernel.org>, Jiri Kosina <jkosina@suse.cz>,
        Sasha Levin <sashal@kernel.org>, david.rheinsberg@gmail.com,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 1/9] HID: uhid: Over-ride the default maximum data buffer value with our own
Date:   Sun, 19 Mar 2023 20:56:59 -0400
Message-Id: <20230320005707.1429405-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Lee Jones <lee@kernel.org>

[ Upstream commit 1c5d4221240a233df2440fe75c881465cdf8da07 ]

The default maximum data buffer size for this interface is UHID_DATA_MAX
(4k).  When data buffers are being processed, ensure this value is used
when ensuring the sanity, rather than a value between the user provided
value and HID_MAX_BUFFER_SIZE (16k).

Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/uhid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/uhid.c b/drivers/hid/uhid.c
index e128b9ce156df..44df81d56d9ca 100644
--- a/drivers/hid/uhid.c
+++ b/drivers/hid/uhid.c
@@ -398,6 +398,7 @@ struct hid_ll_driver uhid_hid_driver = {
 	.parse = uhid_hid_parse,
 	.raw_request = uhid_hid_raw_request,
 	.output_report = uhid_hid_output_report,
+	.max_buffer_size = UHID_DATA_MAX,
 };
 EXPORT_SYMBOL_GPL(uhid_hid_driver);
 
-- 
2.39.2

