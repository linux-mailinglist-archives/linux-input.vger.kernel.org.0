Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3EFE716751
	for <lists+linux-input@lfdr.de>; Tue, 30 May 2023 17:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbjE3PmH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 May 2023 11:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbjE3PmG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 May 2023 11:42:06 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FCBC7
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1685461313; i=friedrich.vock@gmx.de;
        bh=IhV4N9lsx25XF3E/kfLqTSXqPDnLBl1H3bINH5pPSKQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=prt8L3ib9v2oRTeaek4q7hAsSVCV+P7VgYMRljYobU/37pKhN8nUPTUYV5xsOKTr9
         uQaIqJAjnWZ80zBoFFamTFkCMrvFH5pxNsWaj119jOXax7EGnVH+p59Ju/1XzaRdNh
         etyKxGMmf/o2SyFsLrboaroPQIVvMmAkpUrkkkbqps5qVNGJhhzpw8I4I4NjORv1U2
         SEKObI36kKkD+iSo6U7kloOFHCRxfw/JOp6Fy3cMIvgLlf9ztCzWhCyKyyqjqQXwI5
         gbyde1NBahNQHcozTCZ+7TykN44dkfj86Gn4vbYtjVGCfg0GgT0a0E3K6gso8LuAyI
         sJUBpaTMcuZnw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from sus.fritz.box ([213.152.115.159]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRR0-1pep6T0tR6-00Tixs; Tue, 30
 May 2023 17:41:53 +0200
From:   Friedrich Vock <friedrich.vock@gmx.de>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Friedrich Vock <friedrich.vock@gmx.de>
Subject: [PATCH] HID: i2c-hid: Block a rogue device on ASUS TUF A16
Date:   Tue, 30 May 2023 17:40:58 +0200
Message-Id: <20230530154058.17594-1-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K36yzEM1ZzT0BllAYp56E21h4wjsnCRCei9SAQpNIi2eb4YuVy7
 SdcUH7xqcmUxg6rNhv7FZDHPCyYr/GhbKShO4GJI7Re23FuP3iNNjRLIlAxbhlfN8EkH4Nj
 yUhf9Yw6GOC7U6bqMbyPrUmM6FPKz3zYuXR6Y5Mv0QPTVyKtCb9KvlS04I2hwXEfncQsSfB
 BHu2BneOj1AvZPrzjF/pg==
UI-OutboundReport: notjunk:1;M01:P0:zLdICH7aeb8=;E/G1l3LD9LqupSdtSYMS6wZtIkJ
 153M6MnikCl5zoY7/J1gLNizJtEpjhddVYOAt15lvIkQ/poZE0p3n7ad+Z7s9CSZVTpGQDkEe
 I1dzckIOG6hdhzsaAQQ+7mTiLXdtimZ4aNDm8lsla75cEX35DzRJLYolqXsUx/wysc8A9SEjY
 zWflfQ8QVgzC6+7kvpWNJ7PLOZCbnQaK7IYRUcFOTKmR+/rAuGeZp0K4WHvvK39kl2tfEU7wf
 Rf9TtpXA0/Pw6AC9CF396N4+CPm4fBYKiWtIF75I9f0yyJiylUG1C6gyUuOxbx6eCWBG3ivtg
 d72pYaz3FpsS5ZbNByGm1gAyoG2uzypY2gq1gvWTHHhWzbZvOJvXjPX/qkNeQaQc8HFC8xzFl
 huf6uHctste1Td1PV9Tm0+XrrB5Pj3MSHSXlcfvkQMELDNS4uDK3N6fU/YLcI+O/7CYwzbEW4
 K6+FIdoni8T5zE6cElqadgccRaxFIlPnkGACVdLl4YANS52QLjS1sY9Bv9K14efg30EFVUCns
 EJdYPCVz0zib6xH/hwwPbkFgOkGHUU0GYW4KgwDRSIlH6VJPw2ebqwUS2cZAFsA6El65PUh8p
 fEPZy33HrTiu2C86yt6m+tIokK+3NyP0x0/dICAJZySKuY0jOmbaShL2cJQIDeu19r3AMtTx6
 G807kMgNSJpmprz3sourJYmCgFmZyKMnHelNJdMdEvO98V91PT0QVP6kx3OhiP3aGrsaGiHLN
 o/otzf+6eE6RDnCdZsC7WZ5YCsvFnU+J74by6aZP9N/x4WXN9yrHDwZWVSl7r0vi100arYQAm
 /MB0FDnfBc6FrSgSR9fSGlDDwfAmwUzovZUl64hvN8S8k+OnwfLjDyRwvlu2x6czaeC/3zya1
 7+zBSIT1/BfSKGYyRBSqr5KAAJ7Cth9DBuLZEqRNKNgpt/AP66IFaLwhuK7J5lvZY6RzjRHfh
 wOdQ6Q==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On these laptops, there seems to be a device that, when probed by
i2c-hid, constantly sends bogus interrupts and interferes with the
keyboard controller. When the device is enabled, it takes the keyboard
around 8 seconds to register that keys are being pressed or released.

Nothing I tried seemed to make the device work, and preventing the
device from being probed doesn't seem to break any functionality of
the laptop.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/hid/i2c-hid/i2c-hid-core.c       |  5 +++
 drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c | 48 ++++++++++++++++++++++++
 drivers/hid/i2c-hid/i2c-hid.h            |  3 ++
 3 files changed, 56 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-=
hid-core.c
index efbba0465eef..5f0686d058df 100644
=2D-- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1035,6 +1035,11 @@ int i2c_hid_core_probe(struct i2c_client *client, s=
truct i2chid_ops *ops,

 	ihid->quirks =3D i2c_hid_lookup_quirk(hid->vendor, hid->product);

+	if (i2c_hid_device_blocked(hid->vendor, hid->product)) {
+		ret =3D -ENODEV;
+		goto err_irq;
+	}
+
 	ret =3D hid_add_device(hid);
 	if (ret) {
 		if (ret !=3D -ENODEV)
diff --git a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c b/drivers/hid/i2c-hi=
d/i2c-hid-dmi-quirks.c
index 210f17c3a0be..d2c2806b64b4 100644
=2D-- a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
+++ b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
@@ -440,6 +440,38 @@ static const struct dmi_system_id i2c_hid_dmi_quirk_t=
able[] =3D {
 	{ }	/* Terminate list */
 };

+static const struct hid_device_id i2c_hid_blocked_ite_device =3D {
+	HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC, USB_VENDOR_ID_ITE, 0x8051)
+};
+
+/*
+ * This list contains devices that can't be activated at all, for example
+ * because activating them breaks other important parts of the system.
+ */
+static const struct dmi_system_id i2c_hid_dmi_block_table[] =3D {
+	/*
+	 * On ASUS TUF Gaming A16 laptops, there is a device that will make the
+	 * keyboard controller stop working correctly and flood the CPU with bog=
us
+	 * interrupts.
+	 */
+	{
+		.ident =3D "ASUS TUF Gaming A16 (Ryzen 7 7735HS)",
+		.matches =3D {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "FA617NS"),
+		},
+		.driver_data =3D (void *)&i2c_hid_blocked_ite_device,
+	},
+	{
+		.ident =3D "ASUS TUF Gaming A16 (Ryzen 9 7940HS)",
+		.matches =3D {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "FA617XS"),
+		},
+		.driver_data =3D (void *)&i2c_hid_blocked_ite_device,
+	},
+	{ }	/* Terminate list */
+};

 struct i2c_hid_desc *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_n=
ame)
 {
@@ -492,3 +524,19 @@ u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u1=
6 product)

 	return quirks;
 }
+
+bool i2c_hid_device_blocked(const u16 vendor, const u16 product)
+{
+	const struct dmi_system_id *system_id =3D
+			dmi_first_match(i2c_hid_dmi_block_table);
+
+	if (system_id) {
+		const struct hid_device_id *device_id =3D
+				(struct hid_device_id *)(system_id->driver_data);
+
+		if (device_id && device_id->vendor =3D=3D vendor &&
+		    device_id->product =3D=3D product)
+			return true;
+	}
+	return false;
+}
diff --git a/drivers/hid/i2c-hid/i2c-hid.h b/drivers/hid/i2c-hid/i2c-hid.h
index 2c7b66d5caa0..e17bdd758f39 100644
=2D-- a/drivers/hid/i2c-hid/i2c-hid.h
+++ b/drivers/hid/i2c-hid/i2c-hid.h
@@ -10,6 +10,7 @@ struct i2c_hid_desc *i2c_hid_get_dmi_i2c_hid_desc_overri=
de(uint8_t *i2c_name);
 char *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
 					       unsigned int *size);
 u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u16 product);
+bool i2c_hid_device_blocked(const u16 vendor, const u16 product);
 #else
 static inline struct i2c_hid_desc
 		   *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name)
@@ -19,6 +20,8 @@ static inline char *i2c_hid_get_dmi_hid_report_desc_over=
ride(uint8_t *i2c_name,
 { return NULL; }
 static inline u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u16 prod=
uct)
 { return 0; }
+static inline bool i2c_hid_device_blocked(const u16 vendor, const u16 pro=
duct)
+{ return false; }
 #endif

 /**
=2D-
2.40.1

