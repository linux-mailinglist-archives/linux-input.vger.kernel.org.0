Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC28EE4096
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2019 02:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfJYA0H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Oct 2019 20:26:07 -0400
Received: from mail-eopbgr720082.outbound.protection.outlook.com ([40.107.72.82]:9893
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728974AbfJYA0H (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Oct 2019 20:26:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmaVFjwc50K41Am+sWMst+WRFGpGVz9Luoh/jic4FY1VAIgMo96n9sMOKTy34maphMdv19WHXauCxoJSwEk8xM/nCfTEq3hn1Qm1rk5BHclfjyRT8GS6HeGhOPdKOcx5bda3reSc9frSuP9jcvl1O3JzdiMzjR/NadocGxtDr+ugLDqG4Sx7pdmrC991haqNTqKKBmKtSQUHDiidQw7siDfGAJRgaintxOlGC5BDqxH6kf7DiN5Co+GnBFYtQ12RIeTeJcXvsPzV4FrqF6PZkeOj0auSFloKKw6HlKjD/KxOeDVR5p5QOLQKhSs870iq7tYAHth7Rq8IH57If0c+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfff4yOH061+CW62Q5/udySjEm4p9yEfJG5pf6tkhnA=;
 b=ixwK5AYlcaRW3OBu7Tj0y3cwCO95cH5Q4DhKxLy2K/oNs5peMmyCwFzxYM+WAWaGK60+C3K9uQEPF7AqESMzEZL2qRWhB4qhZK0N2lpeUezLmwYjhEMCtN2INv75ai3AD3w/IeZiI0lB4IcawR00DfBBpTRLM6K7+PxQLpQtlttU+8S6j5YiEJ17rHpJpPmM6aVsZo3i4wOsWU4PCa/+dcESVKyujJmq7eoFkUFj+FT20bhmN+EiH7SM1d8fbqghyZDE9GvRR0Qxz14tw+qNXJnpmm6iXG5zBp4mgpMz7deMRXrYUkcP8aB2jbXbjfYo8ElOxHU/rYDdU2Rd0Ny3YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfff4yOH061+CW62Q5/udySjEm4p9yEfJG5pf6tkhnA=;
 b=Du+lHpQx/VkZysgfGX3rIccIRMEt42Xi7tGucDUzamTrPiMc2/BC9ShFT3unhM/q3VthMTAypGzvj8R7ZTEsfggsaLZyqCxhnFJ3scaBrrhsNYwAKgMqz/D8Tx9Rq4K+14WJijjDekPBL0qF9XjkXr5wnt/apxprIFT6be/zDzI=
Received: from BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) by
 BYAPR03MB4885.namprd03.prod.outlook.com (20.179.92.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Fri, 25 Oct 2019 00:26:00 +0000
Received: from BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124]) by BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124%4]) with mapi id 15.20.2347.029; Fri, 25 Oct 2019
 00:26:00 +0000
From:   Andrew Duggan <aduggan@synaptics.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Andrew Duggan <aduggan@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Simon Wood <simon@mungewell.org>,
        Nick Dyer <nick@shmanahar.org>
Subject: [PATCH 3/3] Input: synaptics-rmi4 - remove unused result_bits mask
Thread-Topic: [PATCH 3/3] Input: synaptics-rmi4 - remove unused result_bits
 mask
Thread-Index: AQHVisrHXpJCG1jOgkKDGh+ebpapnw==
Date:   Fri, 25 Oct 2019 00:26:00 +0000
Message-ID: <20191025002527.3189-4-aduggan@synaptics.com>
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
x-ms-office365-filtering-correlation-id: c51ebfb3-cac3-423e-9d1b-08d758e1e95d
x-ms-traffictypediagnostic: BYAPR03MB4885:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB4885D953063025AE0535B4E6B2650@BYAPR03MB4885.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(366004)(39860400002)(376002)(396003)(199004)(189003)(6436002)(52116002)(81156014)(2501003)(81166006)(26005)(110136005)(66556008)(8936002)(386003)(36756003)(66476007)(66946007)(2906002)(6506007)(99286004)(102836004)(6512007)(8676002)(186003)(66446008)(86362001)(50226002)(64756008)(54906003)(76176011)(25786009)(316002)(478600001)(6486002)(3846002)(6116002)(1076003)(256004)(5660300002)(11346002)(446003)(71190400001)(7736002)(2616005)(305945005)(486006)(476003)(66066001)(14454004)(71200400001)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4885;H:BYAPR03MB4135.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i+UdQdgb7hSwkfSEl2VK1flk0ZQf4ZtP4UZqQzh97ClBPw8T3CnX1Oi+/qO2hbE4RAnCuUxkE4hfP4sYECgjVfMp3x0582Y6iirSCdOUHnhdrprc65m35eNiSA5Pb5CWnb8QMlCgFavr08JwHJ7hHJENJQlwoGSJNXMhMXE/jQT3ov4T2+RDUpS0ilg6amCU+4ZxHB6LnPrBg3x88fmaWhKoJxB+be5sIXL2/+alCSULqCGqLiA4yJRLqgJdelNB8kz7SAeKPP9be1FfiwPyvVCVFTyao+skMvfyXAFw/UbT42KHNlsztvb0/NNvIvLslPIHlgkmyEb/BmBYEkfE9VOTXuN3Hplzg1cz2WDe2j5jsurF/zlkO5+YKi7DQfBvslhoiVeR0H18M1xgHbnO9t8vkMHp9l3OxrN2XXoFP1bxc/z1igd6zKRCUIeyrwkV
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c51ebfb3-cac3-423e-9d1b-08d758e1e95d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 00:26:00.5595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lC0jCkNHJ8+b/OAPTqyXUerBJy3LKTzSDVymF5elQRSvFhVHgkN0qGB8jlcq7kcAYvt7RlRT2CRq/Jg/R5RqeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4885
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The result_bits mask is no longer used by the driver and should be
removed.

Signed-off-by: Andrew Duggan <aduggan@synaptics.com>
---
 drivers/input/rmi4/rmi_f11.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f11.c b/drivers/input/rmi4/rmi_f11.c
index 26c239325f95..bbf9ae9f3f0c 100644
--- a/drivers/input/rmi4/rmi_f11.c
+++ b/drivers/input/rmi4/rmi_f11.c
@@ -510,7 +510,6 @@ struct f11_data {
 	struct rmi_2d_sensor_platform_data sensor_pdata;
 	unsigned long *abs_mask;
 	unsigned long *rel_mask;
-	unsigned long *result_bits;
 };
=20
 enum f11_finger_state {
@@ -1057,7 +1056,7 @@ static int rmi_f11_initialize(struct rmi_function *fn=
)
 	/*
 	** init instance data, fill in values and create any sysfs files
 	*/
-	f11 =3D devm_kzalloc(&fn->dev, sizeof(struct f11_data) + mask_size * 3,
+	f11 =3D devm_kzalloc(&fn->dev, sizeof(struct f11_data) + mask_size * 2,
 			GFP_KERNEL);
 	if (!f11)
 		return -ENOMEM;
@@ -1076,8 +1075,6 @@ static int rmi_f11_initialize(struct rmi_function *fn=
)
 			+ sizeof(struct f11_data));
 	f11->rel_mask =3D (unsigned long *)((char *)f11
 			+ sizeof(struct f11_data) + mask_size);
-	f11->result_bits =3D (unsigned long *)((char *)f11
-			+ sizeof(struct f11_data) + mask_size * 2);
=20
 	set_bit(fn->irq_pos, f11->abs_mask);
 	set_bit(fn->irq_pos + 1, f11->rel_mask);
--=20
2.20.1

