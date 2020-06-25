Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F38720A01C
	for <lists+linux-input@lfdr.de>; Thu, 25 Jun 2020 15:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404895AbgFYNiN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jun 2020 09:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404890AbgFYNiM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jun 2020 09:38:12 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E6CC08C5C1
        for <linux-input@vger.kernel.org>; Thu, 25 Jun 2020 06:38:11 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id dp18so5968574ejc.8
        for <linux-input@vger.kernel.org>; Thu, 25 Jun 2020 06:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=toeZr3f3cXXiy5O4xqdJNfWKL25HayKXBFowpIGVPzo=;
        b=AA+65QOKZych2gRtEZiE9DhNPdr1pD9r+CZLbWZAK50+1VBYpF2KGIRtiOG78leUbL
         SQ2jvc8H1Rj/xZqt2ryepnMFahyR5xVLGwpcGBybeRav3mWHZBB/aPWG4BJY9pPNCqcF
         aBmIYDWd2jw8GBXghJoFc0XnYAtCvU34TBfi8+o/oNMSY7vSzbkr16BQNBYXgY68aS1b
         I1MAfZhCtpz/YAnWminXJ5Ej3P3HmdcwMVybmvq4NxY2aNQraPj8cPkDyRUUONfIiWve
         Azkrapo77/87ywmss+Rdnj5X0vcYV03+dLlWeZshAAp18PC47qHmWpfRx+NfAkYiiQXo
         D74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=toeZr3f3cXXiy5O4xqdJNfWKL25HayKXBFowpIGVPzo=;
        b=le2IpSvIpGp45LX9+LQogDOY8sgrL+KA/dslA8ZlkAMosboA5qikR5kqPa3TqEUKU1
         34BduXDFB16k55GdeAi7SeNxJMJbSBQTQqHTt2KUv0e9AP7HeoBiWK91jrD/dV7sGCx6
         C+qX6uKZVoZjvDEpMgUBp12QvxFXUGhYKuk8/vZHO60gMKNRC188tlFP6LoPFtKraRUy
         vYZ+JrBtwYJROLyBOcV+BkD7yBph4TIQtwWZwuZnX8IHlcMLby3vFAg2DccoBYblCJo6
         WoKlk3Vk1SnhsBXd199g+e8qq9tHmR7sZmi6yC1OmewCtXFAg4mQV6H3w9hEM6kZ20D+
         sR+Q==
X-Gm-Message-State: AOAM53163e7fUsPlRho2rID6A/G40WTExuMHBm12jSLfuJSWHpP2CjUn
        9NAQlVpGM4kjcB1awSQzHYQ=
X-Google-Smtp-Source: ABdhPJwWgSUFMRv3j2pEbi3vhlfCtpIBsbviwT+TAtJUuAlZsLhWd/eOa6mdrFxhLKP5eQmiO28d1g==
X-Received: by 2002:a17:906:35ce:: with SMTP id p14mr21008544ejb.514.1593092290339;
        Thu, 25 Jun 2020 06:38:10 -0700 (PDT)
Received: from arch.lan (c-2f28235c.013-97-62726f1.bbcust.telenor.se. [92.35.40.47])
        by smtp.gmail.com with ESMTPSA id lo20sm11044907ejb.62.2020.06.25.06.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 06:38:09 -0700 (PDT)
From:   David Pedersen <limero1337@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, David Pedersen <limero1337@gmail.com>
Subject: [PATCH] Input: i8042 - add Lenovo XiaoXin Air 12 to i8042 nomux list
Date:   Thu, 25 Jun 2020 15:37:54 +0200
Message-Id: <20200625133754.291325-1-limero1337@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This fixes two finger trackpad scroll on the Lenovo XiaoXin Air 12.
Without nomux, the trackpad behaves as if only one finger is present and
moves the cursor when trying to scroll.

Signed-off-by: David Pedersen <limero1337@gmail.com>
---
 drivers/input/serio/i8042-x86ia64io.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index 7e048b557462..858a26302198 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -425,6 +425,13 @@ static const struct dmi_system_id __initconst i8042_dmi_nomux_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "076804U"),
 		},
 	},
+	{
+		/* Lenovo XiaoXin Air 12 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "80UN"),
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
--
2.27.0
