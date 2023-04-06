Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C81B96D9624
	for <lists+linux-input@lfdr.de>; Thu,  6 Apr 2023 13:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238694AbjDFLoL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Apr 2023 07:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238697AbjDFLn4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Apr 2023 07:43:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C311510255;
        Thu,  6 Apr 2023 04:39:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 980FB645A6;
        Thu,  6 Apr 2023 11:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDD0C4339C;
        Thu,  6 Apr 2023 11:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680780824;
        bh=gPGILrrmHxgPoKgXOEw7bWzfSVq5qJ9Trmj7Zy01FW8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gkh7Iwt45irSShRT20hJD7EMQZ+Nmzj/Kgnl/K6oqEekBgMOYl7cFMgvWZgDNXo5O
         IAH66PbzMv2G1WFUOEOLmsqmkh8zAmX6SDciZJWboP8fJ5Cx4aVGO+7+z7OHx6yba6
         MIJrcoUeqRPSPnaTMv9qbc7hZJcN6ghE2TmDWGqdSa86GIMdmA5ZieOn7foEhP8J1n
         Gvtph2sTjt1StjhrdyubY8siM/bxJ1O76BWUcmrjeJe3hdiCCtXNp8diUU06gdQ7n/
         fHqyX/sfhPSx5qNhVgZ9gByRAI96SsDn3yAAZ31Rs2VNs4zmM6ss0oGatBeCfUGsOB
         Oal/TMi2jGoQQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jonathan Denose <jdenose@chromium.org>,
        Jonathan Denose <jdenose@google.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, wse@tuxedocomputers.com,
        mkorpershoek@baylibre.com, chenhuacai@kernel.org,
        wsa+renesas@sang-engineering.com, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 2/9] Input: i8042 - add quirk for Fujitsu Lifebook A574/H
Date:   Thu,  6 Apr 2023 07:33:30 -0400
Message-Id: <20230406113337.648916-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406113337.648916-1-sashal@kernel.org>
References: <20230406113337.648916-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jonathan Denose <jdenose@chromium.org>

[ Upstream commit f5bad62f9107b701a6def7cac1f5f65862219b83 ]

Fujitsu Lifebook A574/H requires the nomux option to properly
probe the touchpad, especially when waking from sleep.

Signed-off-by: Jonathan Denose <jdenose@google.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20230303152623.45859-1-jdenose@google.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/serio/i8042-x86ia64io.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index 6b2e88da30766..92fb2f72511e8 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -601,6 +601,14 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		},
 		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
 	},
+	{
+		/* Fujitsu Lifebook A574/H */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "FMVA0501PZ"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
+	},
 	{
 		/* Gigabyte M912 */
 		.matches = {
-- 
2.39.2

