Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6445E62FC7A
	for <lists+linux-input@lfdr.de>; Fri, 18 Nov 2022 19:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241807AbiKRSWR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Nov 2022 13:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242658AbiKRSV7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Nov 2022 13:21:59 -0500
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7638E922D7;
        Fri, 18 Nov 2022 10:21:55 -0800 (PST)
Date:   Fri, 18 Nov 2022 18:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1668795713; x=1669054913;
        bh=pbKTa64ww9zf2YjQDVJFvTEv+LvOGCj/fGrZioGjwnM=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=TwT/sYEOpDbDsX8Nr6x6hyvqKYFrnxnVlSH13Oynr7KYbR6Fg29S2qwhKEUjG5jqV
         QXhyCLx7R2Xg2YF4HaA6HdlND3j9TVGOoAAIj6zSzbd3nG3qPbNwGHxTbuL7y21AXK
         zki3z7GVHiH2kQLsCA2iKqzM5tyw3fhhy1/NBm9thn8nA39J9+pPpcOXB6RyG1Hnj1
         TtA3dNnXQ+xbkw8aE36SRqrWcEUGI1uwBsKtIF3ZYYiqPQHrurqloRvYU/w3Fj3mJU
         mxQV8r3W4QyPTkL3+Sb2hl44CLQb/TVXd5vMVjHzz6gRe8MmRkq56kNSfarUHpPwuv
         p/0pr1DM63NMg==
To:     linux-kernel@vger.kernel.org
From:   "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Cc:     Markuss Broks <markuss.broks@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 3/3] input/touchscreen: imagis: Add supports for Imagis IST3038
Message-ID: <20221118182103.3405-4-linmengbo0689@protonmail.com>
In-Reply-To: <20221118182103.3405-1-linmengbo0689@protonmail.com>
References: <20221118182103.3405-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Markuss Broks <markuss.broks@gmail.com>

Imagis IST3038 is another variant of Imagis IST3038 IC, which has
a different register interface from IST3038C (possibly firmware defined).

This should also work for IST3044B (though untested), however other
variants using this interface/protocol(IST3026, IST3032, IST3026B,
IST3032B) have a different format for coordinates, and they'd need
additional effort to be supported by this driver.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
[Use IST3038C_REG_CHIPID_BASE]
Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
---
 drivers/input/touchscreen/imagis.c | 62 ++++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/imagis.c b/drivers/input/touchscreen=
/imagis.c
index b667914a44f1..eb3b0684817f 100644
--- a/drivers/input/touchscreen/imagis.c
+++ b/drivers/input/touchscreen/imagis.c
@@ -13,7 +13,8 @@
=20
 #define IST3038C_HIB_ACCESS=09=09(0x800B << 16)
 #define IST3038C_DIRECT_ACCESS=09=09BIT(31)
-#define IST3038C_REG_CHIPID=09=090x40001000
+#define IST3038C_REG_CHIPID_BASE=090x40001000
+#define IST3038C_REG_CHIPID(base)=09(base | IST3038C_DIRECT_ACCESS)
 #define IST3038C_REG_HIB_BASE=09=090x30000100
 #define IST3038C_REG_TOUCH_STATUS=09(IST3038C_REG_HIB_BASE | IST3038C_HIB_=
ACCESS)
 #define IST3038C_REG_TOUCH_COORD=09(IST3038C_REG_HIB_BASE | IST3038C_HIB_A=
CCESS | 0x8)
@@ -31,8 +32,24 @@
 #define IST3038C_FINGER_COUNT_SHIFT=0912
 #define IST3038C_FINGER_STATUS_MASK=09GENMASK(9, 0)
=20
+#define IST30XX_REG_STATUS=09=090x20
+#define IST30XXB_REG_CHIPID_BASE=090x40000000
+#define IST30XX_WHOAMI=09=09=090x30003000
+#define IST30XXA_WHOAMI=09=09=090x300a300a
+#define IST30XXB_WHOAMI=09=09=090x300b300b
+#define IST3038_WHOAMI=09=09=090x30383038
+
+struct imagis_properties {
+=09unsigned int interrupt_msg_cmd;
+=09unsigned int touch_coord_cmd;
+=09unsigned int chipid_base;
+=09unsigned int whoami_val;
+=09bool protocol_b;
+};
+
 struct imagis_ts {
 =09struct i2c_client *client;
+=09const struct imagis_properties *tdata;
 =09struct input_dev *input_dev;
 =09struct touchscreen_properties prop;
 =09struct regulator_bulk_data supplies[2];
@@ -84,8 +101,7 @@ static irqreturn_t imagis_interrupt(int irq, void *dev_i=
d)
 =09int i;
 =09int error;
=20
-=09error =3D imagis_i2c_read_reg(ts, IST3038C_REG_INTR_MESSAGE,
-=09=09=09=09    &intr_message);
+=09error =3D imagis_i2c_read_reg(ts, ts->tdata->interrupt_msg_cmd, &intr_m=
essage);
 =09if (error) {
 =09=09dev_err(&ts->client->dev,
 =09=09=09"failed to read the interrupt message: %d\n", error);
@@ -104,9 +120,13 @@ static irqreturn_t imagis_interrupt(int irq, void *dev=
_id)
 =09finger_pressed =3D intr_message & IST3038C_FINGER_STATUS_MASK;
=20
 =09for (i =3D 0; i < finger_count; i++) {
-=09=09error =3D imagis_i2c_read_reg(ts,
-=09=09=09=09=09    IST3038C_REG_TOUCH_COORD + (i * 4),
-=09=09=09=09=09    &finger_status);
+=09=09if (ts->tdata->protocol_b)
+=09=09=09error =3D imagis_i2c_read_reg(ts,
+=09=09=09=09=09=09    ts->tdata->touch_coord_cmd, &finger_status);
+=09=09else
+=09=09=09error =3D imagis_i2c_read_reg(ts,
+=09=09=09=09=09=09    ts->tdata->touch_coord_cmd + (i * 4),
+=09=09=09=09=09=09    &finger_status);
 =09=09if (error) {
 =09=09=09dev_err(&ts->client->dev,
 =09=09=09=09"failed to read coordinates for finger %d: %d\n",
@@ -261,6 +281,12 @@ static int imagis_probe(struct i2c_client *i2c)
=20
 =09ts->client =3D i2c;
=20
+=09ts->tdata =3D device_get_match_data(dev);
+=09if (!ts->tdata) {
+=09=09dev_err(dev, "missing chip data\n");
+=09=09return -EINVAL;
+=09}
+
 =09error =3D imagis_init_regulators(ts);
 =09if (error) {
 =09=09dev_err(dev, "regulator init error: %d\n", error);
@@ -279,15 +305,13 @@ static int imagis_probe(struct i2c_client *i2c)
 =09=09return error;
 =09}
=20
-=09error =3D imagis_i2c_read_reg(ts,
-=09=09=09IST3038C_REG_CHIPID | IST3038C_DIRECT_ACCESS,
-=09=09=09&chip_id);
+=09error =3D imagis_i2c_read_reg(ts, IST3038C_REG_CHIPID(ts->tdata->chipid=
_base), &chip_id);
 =09if (error) {
 =09=09dev_err(dev, "chip ID read failure: %d\n", error);
 =09=09return error;
 =09}
=20
-=09if (chip_id !=3D IST3038C_WHOAMI) {
+=09if (chip_id !=3D ts->tdata->whoami_val) {
 =09=09dev_err(dev, "unknown chip ID: 0x%x\n", chip_id);
 =09=09return -EINVAL;
 =09}
@@ -343,9 +367,25 @@ static int __maybe_unused imagis_resume(struct device =
*dev)
=20
 static SIMPLE_DEV_PM_OPS(imagis_pm_ops, imagis_suspend, imagis_resume);
=20
+static const struct imagis_properties imagis_3038_data =3D {
+=09.interrupt_msg_cmd =3D IST30XX_REG_STATUS,
+=09.touch_coord_cmd =3D IST30XX_REG_STATUS,
+=09.chipid_base =3D IST30XXB_REG_CHIPID_BASE,
+=09.whoami_val =3D IST3038_WHOAMI,
+=09.protocol_b =3D true,
+};
+
+static const struct imagis_properties imagis_3038c_data =3D {
+=09.interrupt_msg_cmd =3D IST3038C_REG_INTR_MESSAGE,
+=09.touch_coord_cmd =3D IST3038C_REG_TOUCH_COORD,
+=09.chipid_base =3D IST3038C_REG_CHIPID_BASE,
+=09.whoami_val =3D IST3038C_WHOAMI,
+};
+
 #ifdef CONFIG_OF
 static const struct of_device_id imagis_of_match[] =3D {
-=09{ .compatible =3D "imagis,ist3038c", },
+=09{ .compatible =3D "imagis,ist3038", .data =3D &imagis_3038_data },
+=09{ .compatible =3D "imagis,ist3038c", .data =3D &imagis_3038c_data },
 =09{ },
 };
 MODULE_DEVICE_TABLE(of, imagis_of_match);
--=20
2.30.2


