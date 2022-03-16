Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 085B24DB26B
	for <lists+linux-input@lfdr.de>; Wed, 16 Mar 2022 15:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356535AbiCPORM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Mar 2022 10:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348790AbiCPOQz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Mar 2022 10:16:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3652A68F9A;
        Wed, 16 Mar 2022 07:15:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF8466121D;
        Wed, 16 Mar 2022 14:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28C4C340F1;
        Wed, 16 Mar 2022 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647440140;
        bh=06CzfFreRm9dpfVdjhehEwrUJE4C9J41VTJAo+SAPec=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XSS+Iyyhe4BvpkdNxR+Mb7C4MNyVIK+B5sQuaEuzYbeNsPJ1urQJxyXrDaVjSniZJ
         5p00fsZQJ7qi8E4Q/Bx91bum5VLyH4HhZ+xNvZxoVlobh0s+9EHkmheYH1XbbLT4Zs
         rzawl1c8yaP0/edyatVB3PyQhET1T0cmN8TlfZ82RGi3LCMNPCwmy08FPDB3+ZXO9I
         jVPC/x8SC4FirGaABxCmNrjRA4tlCKqOL2SyIknVVk0oEa/LiNvqVW5NN6bfrUOXlJ
         fL3EXRjQywGc/FyylQn7qu6/wwXrdkVEUxBF5ZwhV6OutB7tZrcvgiZw/0W6FOWicZ
         KfwS2E/k9TS+w==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Michael=20H=C3=BCbner?= <michaelh.95@t-online.de>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 03/13] HID: Add support for open wheel and no attachment to T300
Date:   Wed, 16 Mar 2022 10:15:03 -0400
Message-Id: <20220316141513.247965-3-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316141513.247965-1-sashal@kernel.org>
References: <20220316141513.247965-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Michael Hübner <michaelh.95@t-online.de>

[ Upstream commit 0a5a587501b54e8c6d86960b047d4491fd40dcf2 ]

Different add ons to the wheel base report different models. Having
no wheel mounted to the base and using the open wheel attachment is
added here.

Signed-off-by: Michael Hübner <michaelh.95@t-online.de>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-thrustmaster.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index 0c92b7f9b8b8..805816be8224 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -64,7 +64,9 @@ struct tm_wheel_info {
  */
 static const struct tm_wheel_info tm_wheels_infos[] = {
 	{0x0306, 0x0006, "Thrustmaster T150RS"},
+	{0x0200, 0x0005, "Thrustmaster T300RS (Missing Attachment)"},
 	{0x0206, 0x0005, "Thrustmaster T300RS"},
+	{0x0209, 0x0005, "Thrustmaster T300RS (Open Wheel Attachment)"},
 	{0x0204, 0x0005, "Thrustmaster T300 Ferrari Alcantara Edition"},
 	{0x0002, 0x0002, "Thrustmaster T500RS"}
 	//{0x0407, 0x0001, "Thrustmaster TMX"}
-- 
2.34.1

