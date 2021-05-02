Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22BA370B06
	for <lists+linux-input@lfdr.de>; Sun,  2 May 2021 12:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbhEBKKt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 May 2021 06:10:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39167 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230322AbhEBKKt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 2 May 2021 06:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619950197;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xicTBBaiLX8DksrTnLP613S8NbYu5Y59w8N/B9BRpg8=;
        b=S8TlgOZdSpSYHE4YaGDH5fz1UxTT+WUogXf2MeygubtLazAznVOhS/OVFsOuyR+aHTOmtT
        YV96xfmnjO38Q5qvLeb7Ocx2SmNH2m0S/Dx73py3A48qk6GkHFGj1MuUlQV6XyJScP1C2u
        gLcvgM22mSqBHB5jlfV6vAlDrFsHLMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-Eg4CG26fMyyivHQwgk0xKA-1; Sun, 02 May 2021 06:09:55 -0400
X-MC-Unique: Eg4CG26fMyyivHQwgk0xKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 478FA79EC1;
        Sun,  2 May 2021 10:09:54 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-34.ams2.redhat.com [10.36.112.34])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6E27F19D7C;
        Sun,  2 May 2021 10:09:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Arkadiy <arkan49@yandex.ru>,
        "Sergei A . Trusov" <sergei.a.trusov@ya.ru>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [RFC 1/4] platform/x86: touchscreen_dmi: Match on ACPI HID instead of ACPI companion-dev-name
Date:   Sun,  2 May 2021 12:09:46 +0200
Message-Id: <20210502100949.5371-2-hdegoede@redhat.com>
In-Reply-To: <20210502100949.5371-1-hdegoede@redhat.com>
References: <20210502100949.5371-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ACPI-companion device's dev_name() (which gets used as
i2c_client->name for I2C-devices) consists of the ACPI HID to a ":##"
suffix, which typically is ":00" but if there is more then one ACPI
fwnode with the same HID it may be ":01" etc.

On some tablets there are multiple ACPI fwnode-s describing the
touchscreen, one for each I2C bus the device may be connected to.
In this case we get ACPI-companion devices with e.g. "GDIX1001:00"
and "GDIX1001:01" as dev_name(). This makes matching on the dev_name()
as we have been doing inconvinient if we want to share a ts_dmi_data
struct between device's which need the same set of device-properties,
bit have their touchscreen on different busses leading to different
":##" suffixes.

Since there always is only one touchscreen, there is no reason to
include the suffix in the matching.

Change the code to match on ACPI HID instead of ACPI-companion device's
dev_name() so that it is more flexible.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 106 ++++++++++++-------------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index d95f04b61111..4f64a77e1ae8 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -20,7 +20,7 @@
 struct ts_dmi_data {
 	/* The EFI embedded-fw code expects this to be the first member! */
 	struct efi_embedded_fw_desc embedded_fw;
-	const char *acpi_name;
+	const char *acpi_hid;
 	const struct property_entry *properties;
 };
 
@@ -36,7 +36,7 @@ static const struct property_entry chuwi_hi8_props[] = {
 };
 
 static const struct ts_dmi_data chuwi_hi8_data = {
-	.acpi_name      = "MSSL0001:00",
+	.acpi_hid      = "MSSL0001",
 	.properties     = chuwi_hi8_props,
 };
 
@@ -50,7 +50,7 @@ static const struct property_entry chuwi_hi8_air_props[] = {
 };
 
 static const struct ts_dmi_data chuwi_hi8_air_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= chuwi_hi8_air_props,
 };
 
@@ -76,7 +76,7 @@ static const struct ts_dmi_data chuwi_hi8_pro_data = {
 			    0x32, 0xd9, 0x03, 0x28, 0x0d, 0x48, 0x9f, 0x92,
 			    0x35, 0x37, 0xf6, 0x8b, 0x2a, 0xe4, 0x73, 0xff },
 	},
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= chuwi_hi8_pro_props,
 };
 
@@ -95,7 +95,7 @@ static const struct property_entry chuwi_hi10_air_props[] = {
 };
 
 static const struct ts_dmi_data chuwi_hi10_air_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= chuwi_hi10_air_props,
 };
 
@@ -111,7 +111,7 @@ static const struct property_entry chuwi_hi10_plus_props[] = {
 };
 
 static const struct ts_dmi_data chuwi_hi10_plus_data = {
-	.acpi_name      = "MSSL0017:00",
+	.acpi_hid      = "MSSL0017",
 	.properties     = chuwi_hi10_plus_props,
 };
 
@@ -128,7 +128,7 @@ static const struct property_entry chuwi_vi8_props[] = {
 };
 
 static const struct ts_dmi_data chuwi_vi8_data = {
-	.acpi_name      = "MSSL1680:00",
+	.acpi_hid      = "MSSL1680",
 	.properties     = chuwi_vi8_props,
 };
 
@@ -156,7 +156,7 @@ static const struct property_entry chuwi_vi10_props[] = {
 };
 
 static const struct ts_dmi_data chuwi_vi10_data = {
-	.acpi_name      = "MSSL0002:00",
+	.acpi_hid      = "MSSL0002",
 	.properties     = chuwi_vi10_props,
 };
 
@@ -172,7 +172,7 @@ static const struct property_entry chuwi_surbook_mini_props[] = {
 };
 
 static const struct ts_dmi_data chuwi_surbook_mini_data = {
-	.acpi_name      = "MSSL1680:00",
+	.acpi_hid      = "MSSL1680",
 	.properties     = chuwi_surbook_mini_props,
 };
 
@@ -189,7 +189,7 @@ static const struct property_entry connect_tablet9_props[] = {
 };
 
 static const struct ts_dmi_data connect_tablet9_data = {
-	.acpi_name      = "MSSL1680:00",
+	.acpi_hid      = "MSSL1680",
 	.properties     = connect_tablet9_props,
 };
 
@@ -214,7 +214,7 @@ static const struct ts_dmi_data cube_iwork8_air_data = {
 			    0x96, 0xd4, 0x9f, 0x04, 0xe1, 0x47, 0x25, 0x25,
 			    0x60, 0x77, 0x41, 0x33, 0xeb, 0x12, 0x82, 0xfc },
 	},
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= cube_iwork8_air_props,
 };
 
@@ -230,7 +230,7 @@ static const struct property_entry cube_knote_i1101_props[] = {
 };
 
 static const struct ts_dmi_data cube_knote_i1101_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= cube_knote_i1101_props,
 };
 
@@ -244,7 +244,7 @@ static const struct property_entry dexp_ursus_7w_props[] = {
 };
 
 static const struct ts_dmi_data dexp_ursus_7w_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= dexp_ursus_7w_props,
 };
 
@@ -259,7 +259,7 @@ static const struct property_entry digma_citi_e200_props[] = {
 };
 
 static const struct ts_dmi_data digma_citi_e200_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= digma_citi_e200_props,
 };
 
@@ -269,7 +269,7 @@ static const struct property_entry estar_beauty_hd_props[] = {
 };
 
 static const struct ts_dmi_data estar_beauty_hd_data = {
-	.acpi_name	= "GDIX1001:00",
+	.acpi_hid	= "GDIX1001",
 	.properties	= estar_beauty_hd_props,
 };
 
@@ -281,7 +281,7 @@ static const struct property_entry glavey_tm800a550l_props[] = {
 };
 
 static const struct ts_dmi_data glavey_tm800a550l_data = {
-	.acpi_name	= "GDIX1001:00",
+	.acpi_hid	= "GDIX1001",
 	.properties	= glavey_tm800a550l_props,
 };
 
@@ -295,7 +295,7 @@ static const struct property_entry gp_electronic_t701_props[] = {
 };
 
 static const struct ts_dmi_data gp_electronic_t701_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= gp_electronic_t701_props,
 };
 
@@ -313,7 +313,7 @@ static const struct property_entry irbis_tw90_props[] = {
 };
 
 static const struct ts_dmi_data irbis_tw90_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= irbis_tw90_props,
 };
 
@@ -328,7 +328,7 @@ static const struct property_entry irbis_tw118_props[] = {
 };
 
 static const struct ts_dmi_data irbis_tw118_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= irbis_tw118_props,
 };
 
@@ -345,7 +345,7 @@ static const struct property_entry itworks_tw891_props[] = {
 };
 
 static const struct ts_dmi_data itworks_tw891_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= itworks_tw891_props,
 };
 
@@ -359,7 +359,7 @@ static const struct property_entry jumper_ezpad_6_pro_props[] = {
 };
 
 static const struct ts_dmi_data jumper_ezpad_6_pro_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= jumper_ezpad_6_pro_props,
 };
 
@@ -374,7 +374,7 @@ static const struct property_entry jumper_ezpad_6_pro_b_props[] = {
 };
 
 static const struct ts_dmi_data jumper_ezpad_6_pro_b_data = {
-	.acpi_name      = "MSSL1680:00",
+	.acpi_hid      = "MSSL1680",
 	.properties     = jumper_ezpad_6_pro_b_props,
 };
 
@@ -390,7 +390,7 @@ static const struct property_entry jumper_ezpad_6_m4_props[] = {
 };
 
 static const struct ts_dmi_data jumper_ezpad_6_m4_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= jumper_ezpad_6_m4_props,
 };
 
@@ -407,7 +407,7 @@ static const struct property_entry jumper_ezpad_7_props[] = {
 };
 
 static const struct ts_dmi_data jumper_ezpad_7_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= jumper_ezpad_7_props,
 };
 
@@ -423,7 +423,7 @@ static const struct property_entry jumper_ezpad_mini3_props[] = {
 };
 
 static const struct ts_dmi_data jumper_ezpad_mini3_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= jumper_ezpad_mini3_props,
 };
 
@@ -440,7 +440,7 @@ static const struct property_entry mpman_converter9_props[] = {
 };
 
 static const struct ts_dmi_data mpman_converter9_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= mpman_converter9_props,
 };
 
@@ -457,7 +457,7 @@ static const struct property_entry mpman_mpwin895cl_props[] = {
 };
 
 static const struct ts_dmi_data mpman_mpwin895cl_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= mpman_mpwin895cl_props,
 };
 
@@ -474,7 +474,7 @@ static const struct property_entry myria_my8307_props[] = {
 };
 
 static const struct ts_dmi_data myria_my8307_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= myria_my8307_props,
 };
 
@@ -491,7 +491,7 @@ static const struct property_entry onda_obook_20_plus_props[] = {
 };
 
 static const struct ts_dmi_data onda_obook_20_plus_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= onda_obook_20_plus_props,
 };
 
@@ -517,7 +517,7 @@ static const struct ts_dmi_data onda_v80_plus_v3_data = {
 			    0xcc, 0xe4, 0x70, 0xd6, 0x46, 0x9c, 0xd7, 0xa7,
 			    0x4b, 0x82, 0x3f, 0xab, 0xc7, 0x90, 0xea, 0x23 },
 	},
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= onda_v80_plus_v3_props,
 };
 
@@ -532,7 +532,7 @@ static const struct property_entry onda_v820w_32g_props[] = {
 };
 
 static const struct ts_dmi_data onda_v820w_32g_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= onda_v820w_32g_props,
 };
 
@@ -550,7 +550,7 @@ static const struct property_entry onda_v891_v5_props[] = {
 };
 
 static const struct ts_dmi_data onda_v891_v5_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= onda_v891_v5_props,
 };
 
@@ -566,7 +566,7 @@ static const struct property_entry onda_v891w_v1_props[] = {
 };
 
 static const struct ts_dmi_data onda_v891w_v1_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= onda_v891w_v1_props,
 };
 
@@ -583,7 +583,7 @@ static const struct property_entry onda_v891w_v3_props[] = {
 };
 
 static const struct ts_dmi_data onda_v891w_v3_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= onda_v891w_v3_props,
 };
 
@@ -606,7 +606,7 @@ static const struct ts_dmi_data pipo_w2s_data = {
 			    0xbb, 0x45, 0x8c, 0x52, 0x27, 0xb7, 0x18, 0xf4,
 			    0x31, 0x00, 0x6a, 0x49, 0x76, 0xd8, 0x7c, 0xd3 },
 	},
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= pipo_w2s_props,
 };
 
@@ -622,7 +622,7 @@ static const struct property_entry pipo_w11_props[] = {
 };
 
 static const struct ts_dmi_data pipo_w11_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= pipo_w11_props,
 };
 
@@ -639,7 +639,7 @@ static const struct property_entry pov_mobii_wintab_p800w_v20_props[] = {
 };
 
 static const struct ts_dmi_data pov_mobii_wintab_p800w_v20_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= pov_mobii_wintab_p800w_v20_props,
 };
 
@@ -656,7 +656,7 @@ static const struct property_entry pov_mobii_wintab_p800w_v21_props[] = {
 };
 
 static const struct ts_dmi_data pov_mobii_wintab_p800w_v21_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= pov_mobii_wintab_p800w_v21_props,
 };
 
@@ -673,7 +673,7 @@ static const struct property_entry pov_mobii_wintab_p1006w_v10_props[] = {
 };
 
 static const struct ts_dmi_data pov_mobii_wintab_p1006w_v10_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= pov_mobii_wintab_p1006w_v10_props,
 };
 
@@ -690,7 +690,7 @@ static const struct property_entry predia_basic_props[] = {
 };
 
 static const struct ts_dmi_data predia_basic_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= predia_basic_props,
 };
 
@@ -707,7 +707,7 @@ static const struct property_entry schneider_sct101ctm_props[] = {
 };
 
 static const struct ts_dmi_data schneider_sct101ctm_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= schneider_sct101ctm_props,
 };
 
@@ -723,7 +723,7 @@ static const struct property_entry techbite_arc_11_6_props[] = {
 };
 
 static const struct ts_dmi_data techbite_arc_11_6_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= techbite_arc_11_6_props,
 };
 
@@ -749,7 +749,7 @@ static const struct ts_dmi_data teclast_tbook11_data = {
 			    0xd1, 0x27, 0xb1, 0x65, 0x3c, 0xba, 0xa5, 0x0f,
 			    0xcd, 0xb4, 0xbe, 0x00, 0xbb, 0xf6, 0x43, 0x29 },
 	},
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= teclast_tbook11_props,
 };
 
@@ -763,7 +763,7 @@ static const struct property_entry teclast_x3_plus_props[] = {
 };
 
 static const struct ts_dmi_data teclast_x3_plus_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= teclast_x3_plus_props,
 };
 
@@ -778,7 +778,7 @@ static const struct property_entry teclast_x98plus2_props[] = {
 };
 
 static const struct ts_dmi_data teclast_x98plus2_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= teclast_x98plus2_props,
 };
 
@@ -793,7 +793,7 @@ static const struct property_entry trekstor_primebook_c11_props[] = {
 };
 
 static const struct ts_dmi_data trekstor_primebook_c11_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= trekstor_primebook_c11_props,
 };
 
@@ -807,7 +807,7 @@ static const struct property_entry trekstor_primebook_c13_props[] = {
 };
 
 static const struct ts_dmi_data trekstor_primebook_c13_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= trekstor_primebook_c13_props,
 };
 
@@ -822,7 +822,7 @@ static const struct property_entry trekstor_primetab_t13b_props[] = {
 };
 
 static const struct ts_dmi_data trekstor_primetab_t13b_data = {
-	.acpi_name  = "MSSL1680:00",
+	.acpi_hid  = "MSSL1680",
 	.properties = trekstor_primetab_t13b_props,
 };
 
@@ -839,7 +839,7 @@ static const struct property_entry trekstor_surftab_twin_10_1_props[] = {
 };
 
 static const struct ts_dmi_data trekstor_surftab_twin_10_1_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= trekstor_surftab_twin_10_1_props,
 };
 
@@ -855,7 +855,7 @@ static const struct property_entry trekstor_surftab_wintron70_props[] = {
 };
 
 static const struct ts_dmi_data trekstor_surftab_wintron70_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= trekstor_surftab_wintron70_props,
 };
 
@@ -869,7 +869,7 @@ static const struct property_entry vinga_twizzle_j116_props[] = {
 };
 
 static const struct ts_dmi_data vinga_twizzle_j116_data = {
-	.acpi_name	= "MSSL1680:00",
+	.acpi_hid	= "MSSL1680",
 	.properties	= vinga_twizzle_j116_props,
 };
 
@@ -1407,10 +1407,10 @@ static const struct ts_dmi_data *ts_data;
 static void ts_dmi_add_props(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	struct acpi_device *adev = ACPI_COMPANION(dev);
 	int error;
 
-	if (has_acpi_companion(dev) &&
-	    !strncmp(ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
+	if (adev && !strcmp(acpi_device_hid(adev), ts_data->acpi_hid)) {
 		error = device_create_managed_software_node(dev, ts_data->properties, NULL);
 		if (error)
 			dev_err(dev, "failed to add properties: %d\n", error);
-- 
2.31.1

