Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98BA4E4093
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2019 02:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbfJYA0C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Oct 2019 20:26:02 -0400
Received: from mail-eopbgr720082.outbound.protection.outlook.com ([40.107.72.82]:9893
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727208AbfJYA0C (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Oct 2019 20:26:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5duDluDRnXn8b8mioS6+r4JJ5Q3QCGtv+o22N/5PhoVxPyPDK75L4DLVpIZBfjLJQ88yndXxJKKzj8RCp23aHE9B887GqX16v+1c8VCel22TmafmTpzl/YZ3ILrw0+u+n6p9zrY19aFh0QBqJw5q/4Rw0rf3bzOz3JNxzv2/DOZ8Qh7RaQ94jcJtgdQ8WH5Qg7zTvJssR2RmlPWf8UOqExZwwTUQK51FtA34AVu/OZ7mNrvShJ16ZlVYWsXcKMT1qrpVU2FKMpnCi18FTBYE0IobzjTx/9/Q/DAUUIFTXKTR+HLxAwQV2gkVQIvfT9bauO8SmCc56RffyZ4VRcP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RL9uikq6IQrdG0QWvzWXG8YBdygq+//QeWGqO4YA39g=;
 b=UokJFOahDpB84XsoQvW6E39NQeCxDtao5CF+E6syN4JCM8IzCulfPIHITgsHy/6sqHpr7Z7AJG3+4RaqPn/gfM6G0DaY/7E0Mrzso/nCzQH6u6PlZs/Xzk/K1z2uzCIYjP6lnj60F5VFiSvT/q8elJ86kWclerNggityoxHx7yPqt1bY5CjF34qTR2Xpg2iIPcb+kNEp5cvFW1O/Oz6SxcIWZ1Hmiu5QcBXouDEVVed6xsLgnNqpA5oTn7dhtYbLRfYijn1sBJ/Xar/fhDpMwTK+eTr7M1SH0xIJazkm/OCp6xI+9hPERN1Aie4D4b4m7znwgVmdhRvnPjc5NWlTTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RL9uikq6IQrdG0QWvzWXG8YBdygq+//QeWGqO4YA39g=;
 b=gZy+binRZHcya5qwDrreUnwOuKVDRkVl+7cyd5ou+FAR+K0oHCw/se/vqhCtg80rfRl1nqShlWAs2fOX7/tIzKglheO3XE0LMSGDpd42wOPWNdoLehLeh5g2KQKj2JubKYOkurQmD9XIG63bSAVlIbT5P8KS9fisXEZlQLhq05Y=
Received: from BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) by
 BYAPR03MB4885.namprd03.prod.outlook.com (20.179.92.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Fri, 25 Oct 2019 00:25:59 +0000
Received: from BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124]) by BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124%4]) with mapi id 15.20.2347.029; Fri, 25 Oct 2019
 00:25:59 +0000
From:   Andrew Duggan <aduggan@synaptics.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Andrew Duggan <aduggan@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Simon Wood <simon@mungewell.org>,
        Nick Dyer <nick@shmanahar.org>
Subject: [PATCH 2/3] Input: synaptics-rmi4 - use the number of valid bytes
 read when updating the attn_data fields in F11 and F12
Thread-Topic: [PATCH 2/3] Input: synaptics-rmi4 - use the number of valid
 bytes read when updating the attn_data fields in F11 and F12
Thread-Index: AQHVisrGYuZ2map7AUGC9fcxnMF35w==
Date:   Fri, 25 Oct 2019 00:25:58 +0000
Message-ID: <20191025002527.3189-3-aduggan@synaptics.com>
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
x-ms-office365-filtering-correlation-id: 4fe28b19-01a0-4786-7435-08d758e1e869
x-ms-traffictypediagnostic: BYAPR03MB4885:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB488559B55EFE379F531BF69DB2650@BYAPR03MB4885.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(366004)(39860400002)(376002)(396003)(199004)(189003)(6436002)(52116002)(81156014)(2501003)(81166006)(26005)(110136005)(66556008)(8936002)(386003)(36756003)(66476007)(66946007)(2906002)(6506007)(99286004)(102836004)(6512007)(8676002)(186003)(66446008)(86362001)(50226002)(64756008)(54906003)(76176011)(25786009)(316002)(478600001)(6486002)(3846002)(6116002)(14444005)(1076003)(256004)(5660300002)(11346002)(446003)(71190400001)(7736002)(2616005)(305945005)(486006)(476003)(66066001)(14454004)(71200400001)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4885;H:BYAPR03MB4135.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uuqr36t/dr2Vz9mIbjSi0HFhWDzY3U9ZWeoJYZyJFh6Js/jyuuYUp+LjVhf2G1o5PwBBUjF3ihg/e4+fJGUTlOaOpvYCo2ugtzREDiNjl/yOwBYw2ueTtiC3HQUemE2xHw5jRkGtXO2SidUZZw9o+S7UiBfFki98wYQV9vQ0J1BTdKp4ful4QEcysuxeT0J78A5MDZCzq/coc5iv2wYag7Owzk6/bicJZVGnxOBLnwKCg5RRtIYMGeWQoZ6p+8p4STcZjlozfS0QOH4mF60ZEDiM5HiAzTQiW+Fnqnt/B9qNo26Pt2ts5sFTzVJP1CUbVzI3g/WUpGr4jTNoK5RTn8tuIODD3I5P5vRsT0bZTJ/4gFt9cXfNcMeX0Wr9UIN9ys7dWQjOYHzOoTmEg8sRuJGHo5dPJFmJH6gqBIjTniMbE2HKkmUk1CSxT6RZwQFV
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe28b19-01a0-4786-7435-08d758e1e869
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 00:25:58.9423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGc+4CTL7O6ik2BuUUXAohxEiVeGX0ZirqRsul/2EXJV+5VC9Ye8FcTwZtgmmAGZ2uCrnz8I4WAxemM8ZRoR8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4885
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently, rmi_f11_attention() and rmi_f12_attention() functions update
the attn_data data pointer and size based on the size of the expected
size of the attention data. However, if the actual valid data in the
attn buffer is less then the expected value then the updated data
pointer will point to memory beyond the end of the attn buffer. Using
the calculated valid_bytes instead will prevent this from happening.

Signed-off-by: Andrew Duggan <aduggan@synaptics.com>
---
 drivers/input/rmi4/rmi_f11.c | 4 ++--
 drivers/input/rmi4/rmi_f12.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f11.c b/drivers/input/rmi4/rmi_f11.c
index f28a7158b2ef..26c239325f95 100644
--- a/drivers/input/rmi4/rmi_f11.c
+++ b/drivers/input/rmi4/rmi_f11.c
@@ -1284,8 +1284,8 @@ static irqreturn_t rmi_f11_attention(int irq, void *c=
tx)
 			valid_bytes =3D f11->sensor.attn_size;
 		memcpy(f11->sensor.data_pkt, drvdata->attn_data.data,
 			valid_bytes);
-		drvdata->attn_data.data +=3D f11->sensor.attn_size;
-		drvdata->attn_data.size -=3D f11->sensor.attn_size;
+		drvdata->attn_data.data +=3D valid_bytes;
+		drvdata->attn_data.size -=3D valid_bytes;
 	} else {
 		error =3D rmi_read_block(rmi_dev,
 				data_base_addr, f11->sensor.data_pkt,
diff --git a/drivers/input/rmi4/rmi_f12.c b/drivers/input/rmi4/rmi_f12.c
index 734077f2c40b..7e97944f7616 100644
--- a/drivers/input/rmi4/rmi_f12.c
+++ b/drivers/input/rmi4/rmi_f12.c
@@ -212,8 +212,8 @@ static irqreturn_t rmi_f12_attention(int irq, void *ctx=
)
 			valid_bytes =3D sensor->attn_size;
 		memcpy(sensor->data_pkt, drvdata->attn_data.data,
 			valid_bytes);
-		drvdata->attn_data.data +=3D sensor->attn_size;
-		drvdata->attn_data.size -=3D sensor->attn_size;
+		drvdata->attn_data.data +=3D valid_bytes;
+		drvdata->attn_data.size -=3D valid_bytes;
 	} else {
 		retval =3D rmi_read_block(rmi_dev, f12->data_addr,
 					sensor->data_pkt, sensor->pkt_size);
--=20
2.20.1

