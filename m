Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF46D7BDD9C
	for <lists+linux-input@lfdr.de>; Mon,  9 Oct 2023 15:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376898AbjJINLN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Oct 2023 09:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376893AbjJINKz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Oct 2023 09:10:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7EE812A;
        Mon,  9 Oct 2023 06:10:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A62C433D9;
        Mon,  9 Oct 2023 13:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1696857025;
        bh=jkvDx5+K2+lo0MKcZcWTC3ju5DS25KUe+EoX2cGlxqs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bLW5cSqete2/vtrTJGUJcnxgPokb825xOFhuL/F67+CUh4zpw1PxkvLTtJyjbsTHX
         jpSo0Og8w/DzLfGHhkXMKSoC2l+vnsVobNRGZp1qCj2vYB+8JFmFPtrmHSHtOJzBI+
         OFqDhszMzuR5VJoy/FoNrcjOu5Piej6gL6J4Ci3M=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patches@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.5 071/163] HID: nvidia-shield: add LEDS_CLASS dependency
Date:   Mon,  9 Oct 2023 15:00:35 +0200
Message-ID: <20231009130126.010931258@linuxfoundation.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009130124.021290599@linuxfoundation.org>
References: <20231009130124.021290599@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

6.5-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 058574879853260a22bbec1f94221dfc5149d85c ]

The hid-nvidia-shield driver uses functions that are built
only when LEDS_CLASS is set, so make the driver depend on that
symbol to prevent build errors.

riscv32-linux-ld: drivers/hid/hid-nvidia-shield.o: in function `.L11':
hid-nvidia-shield.c:(.text+0x192): undefined reference to `led_classdev_unregister'
riscv32-linux-ld: drivers/hid/hid-nvidia-shield.o: in function `.L113':
hid-nvidia-shield.c:(.text+0xfa4): undefined reference to `led_classdev_register_ext'

Fixes: 09308562d4af ("HID: nvidia-shield: Initial driver implementation with Thunderstrike support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Rahul Rameshbabu <rrameshbabu@nvidia.com>
Cc: Jiri Kosina <jkosina@suse.cz>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Reviewed-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index e11c1c8036769..dc456c86e9569 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -792,6 +792,7 @@ config HID_NVIDIA_SHIELD
 	tristate "NVIDIA SHIELD devices"
 	depends on USB_HID
 	depends on BT_HIDP
+	depends on LEDS_CLASS
 	help
 	  Support for NVIDIA SHIELD accessories.
 
-- 
2.40.1



