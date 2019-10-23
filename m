Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8C3E0FA4
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2019 03:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732690AbfJWBYJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 21:24:09 -0400
Received: from mail-eopbgr700051.outbound.protection.outlook.com ([40.107.70.51]:14176
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727881AbfJWBYI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 21:24:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hxs/t3wfeNWpqDJrVVelMXaxQqRCSY9Ln8mm4zo26qnjgp+jlAI6W0+HeMJGTjiOhXgymWAc0TfVMkVYa97RK7n7921m8iqqrPT/zhLvhdV/H1Mf+ep+eetWlJITg5UDrjyFmgcNkY61gauuWnFgSrfuJd8sUjVRhaG5GuSv5W2IY55BmRIWXHzp7Six/xMECjd4No0KQNW/+Pm8dcHsGNLDWG3FTFB+tOYr/tR9xs2/8q5CPT7r/Knh+G78c/1ZV/4WwfJ7LcKaXkYF5/9eN5c8bUKNm6CcIJy2K2cpsmdD9zuGOyadJmfyM469tiV1RImc4Frpb+ZQB8rydzSMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTPvpu3onupjSAlpVUVEAaCGLefT3W+hE++mRnSXGZU=;
 b=JmmBIkxfpfRp4OiStw4qA3IInVWxd8PUEGDbQWTjDHCaEqAfTxpl4kKkr3uU8Pi7L2FKlwhNqXg1c27kHTzy1YAbyrseoqxSvdusSraFcgP3UgVAwkfu3PPpb4edK1E/UdM09zZeYyFl8vSmEEHnqX/9x2T0wg91jw2VPpqlBqqA1JM4i4F/orz8DHcJJNQ+VFAhOR27orSzsfv4cw5Ktq+oEL8Jevm4NvH+/8X4KXNQNXWi1XEGfA9FTCywCUcgn+pe9az9CAunxlMOEGm9PxbGNPMSIWElmLw0wrs1uiGN7q/HowdTYgdVPXS3DpL7nvcgYHYS9UBUOlmflrhYUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTPvpu3onupjSAlpVUVEAaCGLefT3W+hE++mRnSXGZU=;
 b=Nonvx4cC3W9LP6WQKJ1BI5du5ZuZZeBxnla1S4+TEVQvNb+LkuCPkn9PUJpX8nJLZmOO2ZE9umoTBixkKriRNlN+TQpC85Aas7Hev6mFjj4buNmTgmdZB6FuSjjQ0Ax3oSm+JIBSCBmNcUs9T01C+rQhUYcCm5b4CeYswBSnQM8=
Received: from BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) by
 BYAPR03MB3669.namprd03.prod.outlook.com (52.135.214.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Wed, 23 Oct 2019 01:24:06 +0000
Received: from BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124]) by BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124%4]) with mapi id 15.20.2347.029; Wed, 23 Oct 2019
 01:24:06 +0000
From:   Andrew Duggan <aduggan@synaptics.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Andrew Duggan <aduggan@synaptics.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Federico Cerutti <federico@ceres-c.it>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] Input: synaptics-rmi4 - validate that the rmi_dev pointer is
 set before dereferencing it
Thread-Topic: [PATCH] Input: synaptics-rmi4 - validate that the rmi_dev
 pointer is set before dereferencing it
Thread-Index: AQHViUCPzjLAumaXX06BfCvuoJBvvA==
Date:   Wed, 23 Oct 2019 01:24:05 +0000
Message-ID: <20191023012344.20998-2-aduggan@synaptics.com>
References: <20191023012344.20998-1-aduggan@synaptics.com>
In-Reply-To: <20191023012344.20998-1-aduggan@synaptics.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.147.44.15]
x-clientproxiedby: BYAPR21CA0007.namprd21.prod.outlook.com
 (2603:10b6:a03:114::17) To BYAPR03MB4135.namprd03.prod.outlook.com
 (2603:10b6:a03:77::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aduggan@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 638fb80f-0cc1-4952-626a-08d75757b213
x-ms-traffictypediagnostic: BYAPR03MB3669:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB36699DB228FDAA957C2C3613B26B0@BYAPR03MB3669.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(346002)(39860400002)(136003)(396003)(189003)(199004)(186003)(2616005)(478600001)(14454004)(50226002)(446003)(86362001)(25786009)(66556008)(81166006)(1076003)(8936002)(11346002)(8676002)(64756008)(66476007)(66446008)(486006)(66066001)(66946007)(2501003)(81156014)(102836004)(256004)(476003)(4744005)(26005)(6506007)(386003)(5660300002)(52116002)(76176011)(305945005)(7736002)(110136005)(6116002)(3846002)(6486002)(4326008)(6512007)(71190400001)(6436002)(2906002)(99286004)(54906003)(36756003)(71200400001)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB3669;H:BYAPR03MB4135.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uu0D6AENQmEbak8Zt86JzTbUUDV7aC65M4mQ3j6djg2OR8sWC/49jqLv4w4I064ouPiLMpUJhpD/Ju0eHttXa2XRspulinHp8ATN5dTWlOB+YiYP+J9PS9t94vXYH+CxjA53pBU0ZucMzYNiuNx7nRqeainbnrQPopKPGXSIMGDz4QPan0xUpvt+hPEMJIQVChR+jTTS2EYTaYs/V/GPX98C15r0sKTa7mG3At98TkX1cwzKB2WqZbzjoDDrzlgSDyMKK8AQzu7fvGNm6M1xbNbRABhYKDBOA8DUbp9GMve0QkJ06cJPek2wFOqsxeOE+S9d3by/pHERIFNvbFgPx+V8fF26X/EBPOdMPp6X1uJO5gjNFjeDfHuNy1aYHwjlHvPdyk4bn1w0XthT3c4rCKMU2LZEeAPmIbDhWnYCybI/iJtmKawV7l3N5GpW0P6M
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638fb80f-0cc1-4952-626a-08d75757b213
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 01:24:05.9879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SvaiXCzhNXz0X2hzyYl3flZD0Vbucf92V/BDdnNE8mhqoZVudcRLQXy3K7XtM6JozMMdkxXQdGiLZ9hr5fUJGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3669
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A bug in hid-rmi was causing rmi_unregister_transport_device() to be
called even if the call to rmi_register_transport_device() failed to
allocate the rmi device. A patch has been submitted to fix the issue in
hid-rmi. This patch will ensure that should a simialr situation
occur then the rmi driver will not dereference a NULL pointer.

Signed-off-by: Andrew Duggan <aduggan@synaptics.com>
---
 drivers/input/rmi4/rmi_bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
index af706a583656..6c3abae1e159 100644
--- a/drivers/input/rmi4/rmi_bus.c
+++ b/drivers/input/rmi4/rmi_bus.c
@@ -118,8 +118,10 @@ void rmi_unregister_transport_device(struct rmi_transp=
ort_dev *xport)
 {
 	struct rmi_device *rmi_dev =3D xport->rmi_dev;
=20
-	device_del(&rmi_dev->dev);
-	put_device(&rmi_dev->dev);
+	if (rmi_dev) {
+		device_del(&rmi_dev->dev);
+		put_device(&rmi_dev->dev);
+	}
 }
 EXPORT_SYMBOL(rmi_unregister_transport_device);
=20
--=20
2.20.1

