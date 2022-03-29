Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B27E64EAF55
	for <lists+linux-input@lfdr.de>; Tue, 29 Mar 2022 16:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238065AbiC2OiO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Mar 2022 10:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238041AbiC2OiK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Mar 2022 10:38:10 -0400
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60216A94F1;
        Tue, 29 Mar 2022 07:36:27 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by srv6.fidu.org (Postfix) with ESMTP id 17FD3C800AA;
        Tue, 29 Mar 2022 16:36:26 +0200 (CEST)
Authentication-Results: srv6.fidu.org (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=tuxedocomputers.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        tuxedocomputers.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:date:subject
        :subject:from:from; s=default; t=1648564585; x=1650378986; bh=Yd
        zkCH/IfftWDw/EefeEhB8z6gwO6rbW7JVuSoKtZLk=; b=EPYQwhZnrbK1T+4iTL
        tgZEKxJQ61fMS03L6F0UxcZwklz/cetFqQE/33vc7ugttDDXEqn4Anr/4ryd8+b3
        nEnUyUCzZWHSZJIajovp1j7vJ/1J+KKsX96O819z5qv/ZtjI16Xe5+loslfjIvR3
        4nyQGIlmP8ljxYaVSAy7QoDpw=
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
        by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
        with LMTP id mJw6s2Qw0kHi; Tue, 29 Mar 2022 16:36:25 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box (host-212-18-30-247.customer.m-online.net [212.18.30.247])
        (Authenticated sender: wse@tuxedocomputers.com)
        by srv6.fidu.org (Postfix) with ESMTPA id 9A959C800A4;
        Tue, 29 Mar 2022 16:36:25 +0200 (CEST)
From:   Werner Sembach <wse@tuxedocomputers.com>
To:     dmitry.torokhov@gmail.com, tiwai@suse.de, mpdesouza@suse.com,
        arnd@arndb.de, hdegoede@redhat.com, samuel@cavoj.net,
        wse@tuxedocomputers.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] input/i8042: Add debug output for quirks
Date:   Tue, 29 Mar 2022 16:36:21 +0200
Message-Id: <20220329143622.31394-4-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329143622.31394-1-wse@tuxedocomputers.com>
References: <20220329143622.31394-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make new quirk table easily debugable with some debug output.

With no functional change, evaluation of i8042_reset_quirk and
i8042_reset_never_quirk had to be moved for this.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: stable@vger.kernel.org
---
 drivers/input/serio/i8042-x86ia64io.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index 1d2b34aac0c7..5c0eb5594fb1 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -1421,6 +1421,31 @@ static int __init i8042_platform_init(void)
 
 	i8042_check_quirks();
 
+	pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
+		i8042_nokbd ? " nokbd" : "",
+		i8042_noaux ? " noaux" : "",
+		i8042_nomux ? " nomux" : "",
+		i8042_unlock ? " unlock" : "",
+		i8042_probe_defer ? "probe_defer" : "",
+		i8042_reset == I8042_RESET_DEFAULT ?
+			"" : i8042_reset == I8042_RESET_ALWAYS ?
+				" reset_always" : " reset_never",
+		i8042_direct ? " direct" : "",
+		i8042_dumbkbd ? " dumbkbd" : "",
+		i8042_noloop ? " noloop" : "",
+		i8042_notimeout ? " notimeout" : "",
+		i8042_kbdreset ? " kbdreset" : "",
+#ifdef CONFIG_X86
+		i8042_dritek ? " dritek" : "",
+#else
+		"",
+#endif
+#ifdef CONFIG_PNP
+		i8042_nopnp ? " nopnp" : "");
+#else
+		"");
+#endif
+
 	retval = i8042_pnp_init();
 	if (retval)
 		return retval;
-- 
2.25.1

