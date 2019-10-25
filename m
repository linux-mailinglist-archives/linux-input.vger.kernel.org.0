Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCF0E4092
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2019 02:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbfJYA0B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Oct 2019 20:26:01 -0400
Received: from mail-eopbgr720082.outbound.protection.outlook.com ([40.107.72.82]:9893
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727629AbfJYA0B (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Oct 2019 20:26:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yuvi79xyBESj1R7xJ5NjsghRlYfbq+oA49BWJPIA4AMb0fNZCBJNqhghTVYcynDT7nUoa2I+PLThxzqsXtOfKPtgvprCF8AFl1NsdJ3j+Tbn1O85pNIR78qe0MbN3hBH6uO2nAnx7+hlXL6BGShzTzx3u6y4JAKGed8risPFXZyQ6VF8M2SJr2eFQrkiCNjvrcNzVTT2ZpAaQqF87EEZrA/PiLpX2yzpId67iDqXftyb8QMB8JFOax+6gLMgpBHcHFx/9+sTswJ/zkPedrsmQUw7OJ+boVlh0MaVV9UOFjRXPD0KiAIqOHis7gxxX+7vvhMWEdSFbBcswYiovB/F0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eKl2TRohBcSM/cvcy/Gt7QXa/i3KF/x2n7qiSve+rI=;
 b=lH78hteL+WeW1IRBrLO90UCzSO2lWWsQ+EaOFb/Up46RYroJUgUTpMXWm1SGcTRo2Ixq5rrUoTQSblgL+z/1n3P3FYpiRQIPFUwwMyaJSyOwcoI4WGrAUVsCS8chLcxdk2XiBRKc5igQvfqC4pveot55T7FzpR5PvVYgDAgiNietajPh7Ivi7AtOb+D+ISqNXh3f5UEyviUP+D0a8rbcjbcfmb7F77faSVAkyWodilw1YnRYm4opNJQn5LQS2aGCHnQPTl/dMkvXlSWCKqrta/BncD2Ky+ncu1HwjVyhwVNdjQWFyWwZB5dXFNwBSmI5x+MGJUWuplDrijTs5wErUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eKl2TRohBcSM/cvcy/Gt7QXa/i3KF/x2n7qiSve+rI=;
 b=lRKkkhzyrsBkrx6qjcYl8Z0OtJWkdmgD2IwcXmeTaiyGCzsmzu0n9uJM9b81DeVvDUvotcY1Le2f605sF1NSyFhlkPQ5kyEt7RUgQHVaILs+YaNrLN+FgNDKlCX1a+jdKCghQmUM8wA9Mm1gLN4fyeEjcshBG6WI9Z1/ougsdmk=
Received: from BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) by
 BYAPR03MB4885.namprd03.prod.outlook.com (20.179.92.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Fri, 25 Oct 2019 00:25:58 +0000
Received: from BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124]) by BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124%4]) with mapi id 15.20.2347.029; Fri, 25 Oct 2019
 00:25:57 +0000
From:   Andrew Duggan <aduggan@synaptics.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Andrew Duggan <aduggan@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Simon Wood <simon@mungewell.org>,
        Nick Dyer <nick@shmanahar.org>
Subject: [PATCH 1/3] Input: synaptics-rmi4 - disable the relative position IRQ
 in the F12 driver
Thread-Topic: [PATCH 1/3] Input: synaptics-rmi4 - disable the relative
 position IRQ in the F12 driver
Thread-Index: AQHVisrE0vTfWVJQc0GvTvForKD/KQ==
Date:   Fri, 25 Oct 2019 00:25:56 +0000
Message-ID: <20191025002527.3189-2-aduggan@synaptics.com>
References: <20191025002527.3189-1-aduggan@synaptics.com>
In-Reply-To: <20191025002527.3189-1-aduggan@synaptics.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.147.44.15]
x-clientproxiedby: BYAPR07CA0051.namprd07.prod.outlook.com
 (2603:10b6:a03:60::28) To BYAPR03MB4135.namprd03.prod.outlook.com
 (2603:10b6:a03:77::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aduggan@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 774dab67-b8c1-492b-b0e4-08d758e1e713
x-ms-traffictypediagnostic: BYAPR03MB4885:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB4885AF7EE66F38C0509F06D3B2650@BYAPR03MB4885.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(366004)(39860400002)(376002)(396003)(199004)(189003)(6436002)(52116002)(81156014)(2501003)(81166006)(26005)(110136005)(66556008)(8936002)(386003)(36756003)(66476007)(66946007)(2906002)(6506007)(99286004)(102836004)(6512007)(8676002)(186003)(66446008)(86362001)(50226002)(64756008)(54906003)(76176011)(25786009)(316002)(478600001)(6486002)(6306002)(3846002)(6116002)(1076003)(256004)(5660300002)(11346002)(446003)(71190400001)(966005)(7736002)(2616005)(305945005)(486006)(476003)(66066001)(14454004)(71200400001)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4885;H:BYAPR03MB4135.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eMo5PXKnB2pW/M/MMssFj1ltWXcD4YegsO+auJpt+n4pRO4i3o9lekKuMZSnYDI7S0q11jQNCRCr87sx/Qh7rUVE8EThoPDsaVqZvGBXB7gTLfA691wTTRPvrhvnQAk+/ZR2fn7rN7Ue+d9KjtbRsURp1PnB3BUplgbEGArGcbXkNEwjKawRYLVQleOPFd6/DreWUI6So6e8myD+mbphRnViyo6tjn8HgLT0K7jtXBt879OTTrZ9ZmMPKuVlqsdXZWWNCFAxwMOWs/JE7uy8v11ZGo/vGCuGijZvW2bhWyiCS/vzGguYfVJ4QpgHPB5EY/vKOrvxJujvqy8tIf/IiGp2ArCMCYpkp9t8bREZQYXgw6negtiMN6Z8Oc9Azz9WLH3glzPFpo+X9lXflf/kTBhBvskBmnQD4PlyOsKGSmbv/ST3GpnnR1tcHpuNeNY8h+GBp9wBMfon1PgW6kK90c7lvYmgunF1mm0u4r/y7Eo=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 774dab67-b8c1-492b-b0e4-08d758e1e713
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 00:25:56.8375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mf4v7QPbKjt/Y0jWInSSHBBHSfafJl0EnRHviI7EEszVScnS5kPhBEhQB/q0hOzZQql4lDCN3czYmxgOOhtUPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4885
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch fixes an issue seen on HID touchpads which report finger
positions using RMI4 Function 12. The issue manifests itself as
spurious button presses as described in:
https://www.spinics.net/lists/linux-input/msg58618.html

Commit 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution
to irq_domain") switched the RMI4 driver to using an irq_domain to handle
RMI4 function interrupts. Functions with more then one interrupt now have
each interrupt mapped to their own IRQ and IRQ handler. The result of
this change is that the F12 IRQ handler was now getting called twice. Once
for the absolute data interrupt and once for the relative data interrupt.
For HID devices, calling rmi_f12_attention() a second time causes the
attn_data data pointer and size to be set incorrectly. When the touchpad
button is pressed, F30 will generate an interrupt and attempt to read the
F30 data from the invalid attn_data data pointer and report incorrect
button events.

This patch disables the F12 relative interrupt which prevents
rmi_f12_attention() from being called twice.

Signed-off-by: Andrew Duggan <aduggan@synaptics.com>
Reported-by: Simon Wood <simon@mungewell.org>
---
 drivers/input/rmi4/rmi_f12.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f12.c b/drivers/input/rmi4/rmi_f12.c
index d20a5d6780d1..734077f2c40b 100644
--- a/drivers/input/rmi4/rmi_f12.c
+++ b/drivers/input/rmi4/rmi_f12.c
@@ -55,6 +55,9 @@ struct f12_data {
=20
 	const struct rmi_register_desc_item *data15;
 	u16 data15_offset;
+
+	unsigned long *abs_mask;
+	unsigned long *rel_mask;
 };
=20
 static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
@@ -291,9 +294,18 @@ static int rmi_f12_write_control_regs(struct rmi_funct=
ion *fn)
 static int rmi_f12_config(struct rmi_function *fn)
 {
 	struct rmi_driver *drv =3D fn->rmi_dev->driver;
+	struct f12_data *f12 =3D dev_get_drvdata(&fn->dev);
+	struct rmi_2d_sensor *sensor;
 	int ret;
=20
-	drv->set_irq_bits(fn->rmi_dev, fn->irq_mask);
+	sensor =3D &f12->sensor;
+
+	if (!sensor->report_abs)
+		drv->clear_irq_bits(fn->rmi_dev, f12->abs_mask);
+	else
+		drv->set_irq_bits(fn->rmi_dev, f12->abs_mask);
+
+	drv->clear_irq_bits(fn->rmi_dev, f12->rel_mask);
=20
 	ret =3D rmi_f12_write_control_regs(fn);
 	if (ret)
@@ -315,9 +327,12 @@ static int rmi_f12_probe(struct rmi_function *fn)
 	struct rmi_device_platform_data *pdata =3D rmi_get_platform_data(rmi_dev)=
;
 	struct rmi_driver_data *drvdata =3D dev_get_drvdata(&rmi_dev->dev);
 	u16 data_offset =3D 0;
+	int mask_size;
=20
 	rmi_dbg(RMI_DEBUG_FN, &fn->dev, "%s\n", __func__);
=20
+	mask_size =3D BITS_TO_LONGS(drvdata->irq_count) * sizeof(unsigned long);
+
 	ret =3D rmi_read(fn->rmi_dev, query_addr, &buf);
 	if (ret < 0) {
 		dev_err(&fn->dev, "Failed to read general info register: %d\n",
@@ -332,10 +347,19 @@ static int rmi_f12_probe(struct rmi_function *fn)
 		return -ENODEV;
 	}
=20
-	f12 =3D devm_kzalloc(&fn->dev, sizeof(struct f12_data), GFP_KERNEL);
+	f12 =3D devm_kzalloc(&fn->dev, sizeof(struct f12_data) + mask_size * 2,
+			GFP_KERNEL);
 	if (!f12)
 		return -ENOMEM;
=20
+	f12->abs_mask =3D (unsigned long *)((char *)f12
+			+ sizeof(struct f12_data));
+	f12->rel_mask =3D (unsigned long *)((char *)f12
+			+ sizeof(struct f12_data) + mask_size);
+
+	set_bit(fn->irq_pos, f12->abs_mask);
+	set_bit(fn->irq_pos + 1, f12->rel_mask);
+
 	f12->has_dribble =3D !!(buf & BIT(3));
=20
 	if (fn->dev.of_node) {
--=20
2.20.1

