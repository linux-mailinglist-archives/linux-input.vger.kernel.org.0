Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED080443D7B
	for <lists+linux-input@lfdr.de>; Wed,  3 Nov 2021 08:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbhKCHDA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Nov 2021 03:03:00 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:60140 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhKCHC7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Nov 2021 03:02:59 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 156A6218F6;
        Wed,  3 Nov 2021 07:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635922823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=d+fdD7BzxpJt/MDsDMtEzmuvT1pdmL6lJFda6+PaI34=;
        b=D6U6dMzB6sggFpx1wShB/A0dkswqW+4oxPJB5jAppdfipqPcZmlA8TR4DTyRYFbDIZNqnP
        EaoXmqUT3HOO3vqYOYk7yX1o9fPTbvsV4sNUBzPqMCn49fq/GvcPvzzUjvWY2ixLNT1jNM
        qH//k9msDW+IpqipdCcsTrrBxUS+jDI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635922823;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=d+fdD7BzxpJt/MDsDMtEzmuvT1pdmL6lJFda6+PaI34=;
        b=pl5rND+T4kMiMDpQlHxbF/kPMblSd190ondbd02RO4Kps8CjWMsMVzs7WysYvf9v+/zz9p
        kqDGtKxLhPYWWWDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id 0E7F92C154;
        Wed,  3 Nov 2021 07:00:23 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neal Gompa <ngompa13@gmail.com>
Subject: [PATCH] Input: i8042 - Add quirk for Fujitsu Lifebook T725
Date:   Wed,  3 Nov 2021 08:00:19 +0100
Message-Id: <20211103070019.13374-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fujitsu Lifebook T725 laptop requires, like a few other similar
models, the nomux and notimeout options to probe the touchpad
properly.  This patch adds the corresponding quirk entries.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1191980
Tested-by: Neal Gompa <ngompa13@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/input/serio/i8042-x86ia64io.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index a5a003553646..aedd05541044 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -272,6 +272,13 @@ static const struct dmi_system_id __initconst i8042_dmi_nomux_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "LifeBook S6230"),
 		},
 	},
+	{
+		/* Fujitsu Lifebook T725 laptop */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK T725"),
+		},
+	},
 	{
 		/* Fujitsu Lifebook U745 */
 		.matches = {
@@ -840,6 +847,13 @@ static const struct dmi_system_id __initconst i8042_dmi_notimeout_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK AH544"),
 		},
 	},
+	{
+		/* Fujitsu Lifebook T725 laptop */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK T725"),
+		},
+	},
 	{
 		/* Fujitsu U574 laptop */
 		/* https://bugzilla.kernel.org/show_bug.cgi?id=69731 */
-- 
2.26.2

