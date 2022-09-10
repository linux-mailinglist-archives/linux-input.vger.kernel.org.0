Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 275645B4A3E
	for <lists+linux-input@lfdr.de>; Sat, 10 Sep 2022 23:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbiIJVcW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Sep 2022 17:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbiIJVcF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Sep 2022 17:32:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5EF52838;
        Sat, 10 Sep 2022 14:26:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7037B60EDF;
        Sat, 10 Sep 2022 21:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0526CC4347C;
        Sat, 10 Sep 2022 21:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662844791;
        bh=jaexKV/ISln6aKv9PrpU0ZKA7HGBT+BGvGa+IiQ2i6g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zk66uFrSoY5jQFLWFBepMhNHEnMJcFvdon0UUhhe+jWGlnnh2kW2G68VK/YCWxxzk
         nVQjSOsGz1OYA+88nhqf5RbFX3tAqPKVBvJZI+iBCYaMoYPzAxh4KK/olptaQilJQh
         h0pUlUi55l5hc3a2E7LNOVw06+f3pmEEC/1zl5VKjxGpEmVyI8PL0FhX11Bx9DPgaf
         k2qXi+Gc5mYaX+Nf5TPPJsJaCkOHT3T45te+rWVHEveryRw205b5NUZuA6QawZDSEH
         bIfze9bfPI2o5xEFlxeb/M5TTqBWJasDLlDDVZKT7MDIXDiAJsTc9ve8O5R2aWzXa5
         IoyQU9KmXUVXQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jason Wang <wangborong@cdjrlc.com>, Jiri Kosina <jkosina@suse.cz>,
        Sasha Levin <sashal@kernel.org>,
        srinivas.pandruvada@linux.intel.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 2/5] HID: ishtp-hid-clientHID: ishtp-hid-client: Fix comment typo
Date:   Sat, 10 Sep 2022 17:19:44 -0400
Message-Id: <20220910211947.71066-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220910211947.71066-1-sashal@kernel.org>
References: <20220910211947.71066-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jason Wang <wangborong@cdjrlc.com>

[ Upstream commit 94553f8a218540d676efbf3f7827ed493d1057cf ]

The double `like' is duplicated in the comment, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/intel-ish-hid/ishtp-hid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid.h b/drivers/hid/intel-ish-hid/ishtp-hid.h
index f5c7eb79b7b53..fa16983007f60 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid.h
+++ b/drivers/hid/intel-ish-hid/ishtp-hid.h
@@ -118,7 +118,7 @@ struct report_list {
  * @multi_packet_cnt:	Count of fragmented packet count
  *
  * This structure is used to store completion flags and per client data like
- * like report description, number of HID devices etc.
+ * report description, number of HID devices etc.
  */
 struct ishtp_cl_data {
 	/* completion flags */
-- 
2.35.1

