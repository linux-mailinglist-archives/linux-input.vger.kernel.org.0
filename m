Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F611FBEBA
	for <lists+linux-input@lfdr.de>; Tue, 16 Jun 2020 21:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730020AbgFPTGt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 15:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729988AbgFPTGt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 15:06:49 -0400
X-Greylist: delayed 340 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 16 Jun 2020 12:06:48 PDT
Received: from mail.halogenos.org (halogenos.org [IPv6:2a02:c207:2037:5246::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC53FC061573
        for <linux-input@vger.kernel.org>; Tue, 16 Jun 2020 12:06:48 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1976B1500CE2;
        Tue, 16 Jun 2020 21:01:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=superboring.dev;
        s=dkim; t=1592334074;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ePTtzVzTZk1JuadsO9tbd8TX4Uadz1o3NB+qLTLvi2g=;
        b=YTn4YjzQ14gM7DOneiK5PWsqbJc92Zv1zRYkmp+ZzpzBjC6BHmtSPF9rDzbOgOmHgCK29C
        gyVLOrKZLqsr/dRQ34lRQ2hkyCBJURUor9yEH2gmI3eRgE0mKHGPMaW3+QVT+JYfeAEy88
        D8QRZ+r3Q0756oDXdVZc58O19ygsp55+arva8hdn4p3xC5ZdYJji9v3YWJCzpxQVQFnAYE
        rwRywQ++RVsroMddWQi4HkTb5WmjDMnvGtdzzQ8fo1wrkkqhXY8DgA/9yoJNdmaUymGrzQ
        Qt+S5LqFsuR3J6JNpG3hvy5djplss1/vvdV8gHCDILZCnXnJhmvNMv8xf8EZXw==
From:   Simao Gomes Viana <devel@superboring.dev>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Simao Gomes Viana <devel@superboring.dev>,
        linux-input@vger.kernel.org
Subject: [PATCH 4/4] drivers: hid: move trailing block comment close to new line
Date:   Tue, 16 Jun 2020 21:00:44 +0200
Message-Id: <20200616190044.126928-4-devel@superboring.dev>
In-Reply-To: <20200616190044.126928-1-devel@superboring.dev>
References: <20200616190044.126928-1-devel@superboring.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Simao Gomes Viana <devel@superboring.dev>
---
 drivers/hid/hid-input.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index ef077da7485d..c0a329fd8067 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -2016,7 +2016,8 @@ void hidinput_disconnect(struct hid_device *hid)
 	/* led_work is spawned by input_dev callbacks, but doesn't access the
 	 * parent input_dev at all. Once all input devices are removed, we
 	 * know that led_work will never get restarted, so we can cancel it
-	 * synchronously and are safe. */
+	 * synchronously and are safe.
+	 */
 	cancel_work_sync(&hid->led_work);
 }
 EXPORT_SYMBOL_GPL(hidinput_disconnect);
-- 
2.27.0

