Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42BCC467301
	for <lists+linux-input@lfdr.de>; Fri,  3 Dec 2021 08:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379085AbhLCIC7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Dec 2021 03:02:59 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:53352 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379091AbhLCIC6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Dec 2021 03:02:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id AF4BCCE2527
        for <linux-input@vger.kernel.org>; Fri,  3 Dec 2021 07:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8F0C53FAD;
        Fri,  3 Dec 2021 07:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638518371;
        bh=4wAMQAZ2kwRnDPUs9Bg4XSSxFom9muhQx1LGoUD2aWs=;
        h=From:To:Cc:Subject:Date:From;
        b=TqrAzBizZODIlAEoNxqPSOZrc920L0ua4nxP/nDZvnLrSUfG5AQIySD/EVn6Nmk29
         1IWXiTZuRYVHWyz+HSofRpU4H9q44mfvR7XnyFa3juIsLNVOsLN0d/PDWNSYaw1fLN
         yBliscONKvSwXMhbEciqGOx4mN0lpFpaxZYNMsMo=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] HID: add USB_HID dependancy to hid-chicony
Date:   Fri,  3 Dec 2021 08:59:27 +0100
Message-Id: <20211203075927.2829218-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; h=from:subject; bh=4wAMQAZ2kwRnDPUs9Bg4XSSxFom9muhQx1LGoUD2aWs=; b=owGbwMvMwCRo6H6F97bub03G02pJDIkrz8XI6c72jBYMfNNjvPzrqZdePz9w3DSbtDX+0WeN1oyt +7Y864hlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJuJ5lmF+Q4PGS75H/9pvd+Z8LHD f5lNVPyWCYp/7C9MX6Gdu0BZJcA2RFnlpe519kCQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The chicony HID driver only controls USB devices, yet did not have a
dependancy on USB_HID.  This causes build errors on some configurations
like sparc when building due to new changes to the chicony driver.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/hid/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 828c2995ec34..e9bc8efed5a1 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -207,7 +207,7 @@ config HID_CHERRY
 
 config HID_CHICONY
 	tristate "Chicony devices"
-	depends on HID
+	depends on USB_HID
 	default !EXPERT
 	help
 	Support for Chicony Tactical pad and special keys on Chicony keyboards.
-- 
2.34.1

