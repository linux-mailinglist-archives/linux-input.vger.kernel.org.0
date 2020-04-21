Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCEB1B27DD
	for <lists+linux-input@lfdr.de>; Tue, 21 Apr 2020 15:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbgDUN2f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Apr 2020 09:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726018AbgDUN2e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Apr 2020 09:28:34 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBF0C061A10;
        Tue, 21 Apr 2020 06:28:33 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 198so11110315lfo.7;
        Tue, 21 Apr 2020 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m5IiTDdrbkE9OR5+DqrufYZRnxfemrBHiYAfzecnoI4=;
        b=ek4p947VDqjQtX8mFIF7M+1uEsSchF/XhSZKGaPGycVv83n5C6k7cD9woxhjF8EWZo
         F8EnmjXVysB9JQcjD+yfQy8qvwLtl9nxg2pAHFW6l2BXFJkmtY+wE94OQCuEctDI7Lbb
         Mht3uqgCqV4alfhhxLU+BYdI9dN8g16WFlTfDKgTyUpcyZvDnt3vfz/LZ6Tw7gZvV6MW
         74g2jNgMuzS2lnE+v+zx3+Fp5Ys0dWIPfVlFh60rMEoutZIwDZu1JBuYw35NhtjOVwFz
         4cwjqamBoRLCpyU9oGOxd2rgla4bho3tSZwvW+aoxsmAmu8c+vHymAdqeALXxO1u885S
         +Udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m5IiTDdrbkE9OR5+DqrufYZRnxfemrBHiYAfzecnoI4=;
        b=BawimcRV+qLN2HOJRu9704tXRZCVDL+TgtSP2t9vQfQAcvNOvFFn975GqWPbmNnQqO
         oVZlk8il3FHMXfaIZgOv08gGvQlpBtASeset+D2vOoUueVZx2UfuYk7cwwXLY/gYp4/0
         /1o9nGokBsTT51aT+2N3VC8+KruGIl9OCJVIv6/3EjLFLRasJ9NXiryUKuWVP6chDd02
         1FpwOtIQqnSdJTKC0hFGgApH2EZz4GZdSVj2ADCsLdb5ABUfMoLkf/dzoiEbeOvU+vEe
         55S84aQGlti/AahS6OlY7+px13vmRQhbxdLFK/xGGWM4a7cEAmGvfAgnL1jRWz2ZIXKz
         MwaQ==
X-Gm-Message-State: AGi0PubbPVRU+PReT9KjmTvtXS4okzf3OLv8QvlNWSOQVmLSonFrCKl9
        85C2RrGpbkJ3p5UcAUmv7WQ=
X-Google-Smtp-Source: APiQypJjeiEmuhW67Qp70lMvNMTgUlCDBIWS6hcZYvFqMWc/jML3f+FEtJR6/uijXU3lp8U9obme9A==
X-Received: by 2002:a19:e04a:: with SMTP id g10mr13628554lfj.164.1587475712511;
        Tue, 21 Apr 2020 06:28:32 -0700 (PDT)
Received: from localhost.localdomain ([77.239.252.167])
        by smtp.googlemail.com with ESMTPSA id i20sm2297150lfe.15.2020.04.21.06.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 06:28:31 -0700 (PDT)
From:   Maksim Karasev <karasevm98@gmail.com>
Cc:     hdegoede@redhat.com, dvhart@infradead.org, andy@infradead.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maksim Karasev <karasevm98@gmail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the ONDA V891 v5 tablet
Date:   Tue, 21 Apr 2020 16:25:48 +0300
Message-Id: <20200421132548.5627-1-karasevm98@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add touchscreen info for the ONDA V891 v5 tablet.

Signed-off-by: Maksim Karasev <karasevm98@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 6ec8923dec1a..cc2a2e0a0585 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -448,6 +448,24 @@ static const struct ts_dmi_data onda_v820w_32g_data = {
 	.properties	= onda_v820w_32g_props,
 };
 
+static const struct property_entry onda_v891_v5_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name",
+			      "gsl3676-onda-v891-v5.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data onda_v891_v5_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= onda_v891_v5_props,
+};
+
 static const struct property_entry onda_v891w_v1_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 46),
 	PROPERTY_ENTRY_U32("touchscreen-min-y",  8),
@@ -940,6 +958,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "V820w DualOS")
 		},
 	},
+	{
+		/* ONDA V891 v5 */
+		.driver_data = (void *)&onda_v891_v5_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ONDA"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ONDA Tablet"),
+			DMI_MATCH(DMI_BIOS_VERSION, "ONDA.D869CJABNRBA06"),
+		},
+	},
 	{
 		/* ONDA V891w revision P891WBEBV1B00 aka v1 */
 		.driver_data = (void *)&onda_v891w_v1_data,
-- 
2.26.1

