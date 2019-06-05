Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA5F367D3
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 01:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfFEXWM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 19:22:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44804 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfFEXWM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Jun 2019 19:22:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id w13so410569wru.11
        for <linux-input@vger.kernel.org>; Wed, 05 Jun 2019 16:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M0ZptCG4SvvgEj1QhElidPi/Eb/kXDoXz9m0JU+Ju+s=;
        b=RTaf+b6f3sfGxP9QqAXncSXh3ZYyA7onG58hGNG8mK6qWklfQkzpRSL1RS+DgM9mmj
         SBQOsWR0tsur1KXarmQLHT5Ao+fOV+bXzMBweln3FcfwPywI/w3nvH215Cy8YiJ+nsk6
         Y//UHRE/nOzu62gxAiCqghke7nv0Ty7IEfliEWC90wlpbRLtofvzbp2q8s0owJk3EUSi
         0zT0UUUbarEqv8/gUtq/HlpsdKSO5AdmLSiO8omrpIHd7mobABDPEn8HBvxcLTYNuEzW
         64aX5Nrn3Fln74/Nx9xOaDeAXYBDY+N5+BAhZOXJy4ImmKWPLg6vqmsVmlHWLGrmmZY9
         LkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M0ZptCG4SvvgEj1QhElidPi/Eb/kXDoXz9m0JU+Ju+s=;
        b=XxLRr/BdzelyXGds9qYc6AmMbR19qmr9ENeeWIs5YklyTQTdTdT0cccy71TjR9e8rq
         TgV3vQSa3dKnAuIknjid682K+89zBp1mftlMB8dVFIetWoZLGON2kbTx1+8ckBqdfBiY
         6BM/OlLeTPcxtfWihe5yyhNjWpldZI9iSweBSrjeGJyKbYPpRsVxtXwwSZYVu0gKFIgv
         FW6UqgXpsaksR4NTsaCtXXzjXEqiQYX+IgFgvj3KcqQ1c0292ZY43aU5SOE8s4lxyFHu
         qdBoDIthOM3SXFo162QMDhemkMVg7F2TBTcETSky3xhp30liorjpGnYNEstNuxB05fr8
         gO4g==
X-Gm-Message-State: APjAAAXYAxhioJDsTqgQhFxOW2VyVkutRrtoHpjh9vSzTZi452x4oqai
        C6F+FfLqNDUg1ocabek3rX0R7jjktlYevA==
X-Google-Smtp-Source: APXvYqzWWzclxY8TlWB5EtM8s8vjVdgPe7h8TNGURnxcibodrd7MuemxGniDFEDG8ejNN0rexChflQ==
X-Received: by 2002:adf:8b83:: with SMTP id o3mr25305725wra.278.1559776930583;
        Wed, 05 Jun 2019 16:22:10 -0700 (PDT)
Received: from phong.localdomain (146.93.117.91.dynamic.reverse-mundo-r.com. [91.117.93.146])
        by smtp.gmail.com with ESMTPSA id v15sm279710wrt.25.2019.06.05.16.22.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 16:22:10 -0700 (PDT)
From:   Daniel Otero <otero.o.daniel@gmail.com>
To:     Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        linux-input@vger.kernel.org,
        Daniel Otero <otero.o.daniel@gmail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for 'Chuwi Hi10 Pro' touchscreen
Date:   Thu,  6 Jun 2019 01:22:04 +0200
Message-Id: <20190605232204.24679-1-otero.o.daniel@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add touchscreen platform data for the 'Chuwi Hi10 Pro' tablet touchscreen.

Signed-off-by: Daniel Otero <otero.o.daniel@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index b662cb2d7cd5..d942082c5b7b 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -87,6 +87,23 @@ static const struct ts_dmi_data chuwi_hi10_air_data = {
 	.properties	= chuwi_hi10_air_props,
 };
 
+static const struct property_entry chuwi_hi10_pro_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1911),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1276),
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 9),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 9),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10-pro.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data chuwi_hi10_pro_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= chuwi_hi10_pro_props,
+};
+
 static const struct property_entry chuwi_vi8_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 6),
@@ -601,6 +618,14 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_SKU, "P1W6_C109D_B"),
 		},
 	},
+	{
+		/* Chuwi Hi10 Pro (CWI529) */
+		.driver_data = (void *)&chuwi_hi10_pro_data,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
+		},
+	},
 	{
 		/* Chuwi Vi8 (CWI506) */
 		.driver_data = (void *)&chuwi_vi8_data,
-- 
2.21.0

