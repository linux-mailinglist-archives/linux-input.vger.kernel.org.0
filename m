Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCD3E1FA1FE
	for <lists+linux-input@lfdr.de>; Mon, 15 Jun 2020 22:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731179AbgFOUud (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jun 2020 16:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731104AbgFOUud (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jun 2020 16:50:33 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3CCC061A0E;
        Mon, 15 Jun 2020 13:50:32 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id dr13so18904103ejc.3;
        Mon, 15 Jun 2020 13:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pq10EsF9ol16Ob8nLiU7XvO5q7sS1m52YcoGKQtf67Q=;
        b=P6G/UUeBICwnSuIWd/pluNT30dbZXW7yFJLxp2llftYoOSmqqXBs8M/4mi6rMA0hdU
         cDgHR8tZ2sJ1Smo8oVLkgIgtjKmcC1xIolgrw9DDPlyX23QpirIule48mVDATjqFCTE2
         HxvHGvBQ1gK2k0SdxOcbi2D0w4OOAPy2e1ZsiZ9NTglSCpQQ8Ftrp1HPqRWxVY+ZnD7+
         KcER8HsVAAUNyMYbaj7/FttZ0p1U1yY+GdeXH0qXAB8J8NRU1PtEkSbGPVWxnRIH4Xqq
         wkHlMezhW/AX07mpPaphBWhYP8aFsclccEOEraIWjacp8FKlwh9CXjSZKcs6zgAsReNi
         WtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pq10EsF9ol16Ob8nLiU7XvO5q7sS1m52YcoGKQtf67Q=;
        b=CPsVZMfB83m6lahiDZg9NqnUGdyS26qAGqPwX3H2wE92qZY6WU+NX9CEQpNL6lcwpp
         jiVIE2FyLxv6V4ozU0yoG4DivwxpDI6FAEnCk/kCme3VeGSy7k+3RGsnavLe/uisWxxa
         K5btAVXGrJhn7jx6fPQzMN+7oXjeViquuKS0Dx7KSgwBXeCv60Yof2UxLqVnM6HL7ZJz
         Vxa/oj+63WcbqCAjvDhxtbSU2s/dowtFpCV4Gk9PKoP1lRu+TVOc8LSJ3UtFrh7cJdw1
         CUepVkzfaANnPsjOL8KxULsLWRKHUnq5/S/A8PDzyLff6CAcfnFzNvnABTQSBmpQDIhx
         Ew0w==
X-Gm-Message-State: AOAM531cPLdGoxoFs2uKOTytLFsYqQGPIFktZ6WgAvh54KDhCzVL4YFx
        bfyL8EMAsaZy12GQH2N3e6g=
X-Google-Smtp-Source: ABdhPJzbRyigEVX2RV4GNRa6In+aFjP2Tc9CR955VZnQB1YfKum3NDCekajoD0lXqFi++hB4zMBeQg==
X-Received: by 2002:a17:906:1e92:: with SMTP id e18mr28515224ejj.254.1592254230936;
        Mon, 15 Jun 2020 13:50:30 -0700 (PDT)
Received: from flexbook-edge-13-m-fbe-13.lan ([2001:b07:2ee:c602:b951:df66:41b5:4c85])
        by smtp.gmail.com with ESMTPSA id q3sm9028515eds.0.2020.06.15.13.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 13:50:30 -0700 (PDT)
From:   Federico Ricchiuto <fed.ricchiuto@gmail.com>
To:     jikos@kernal.org
Cc:     Federico Ricchiuto <fed.ricchiuto@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: i2c-hid: add Trekstor Surfbook E11B to descriptor override
Date:   Mon, 15 Jun 2020 22:49:11 +0200
Message-Id: <20200615204914.15549-1-fed.ricchiuto@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Mediacom FlexBook edge13 uses the SIPODEV SP1064 touchpad, which does
not supply descriptors, so it has to be added to the override list.

Signed-off-by: Federico Ricchiuto <fed.ricchiuto@gmail.com>
---
 drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
index a66f08041a1a..bb3f802935cc 100644
--- a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
+++ b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
@@ -373,6 +373,14 @@ static const struct dmi_system_id i2c_hid_dmi_desc_override_table[] = {
 		},
 		.driver_data = (void *)&sipodev_desc
 	},
+	{
+		.ident = "Mediacom FlexBook edge 13",
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MEDIACOM"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "FlexBook_edge13-M-FBE13"),
+		},
+		.driver_data = (void *)&sipodev_desc
+	},
 	{
 		.ident = "Odys Winbook 13",
 		.matches = {
-- 
2.25.1

