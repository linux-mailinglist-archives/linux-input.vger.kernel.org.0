Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A418E0FA0
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2019 03:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731758AbfJWBYI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 21:24:08 -0400
Received: from mail-eopbgr700051.outbound.protection.outlook.com ([40.107.70.51]:14176
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727851AbfJWBYI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 21:24:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkEFZEvpjFeRl9guLX5ia9K3AgAgkhRVx9Psh3iyQus81wufjqRm+1fvbY0LlmzNpxDkZ+VZ4+FOubYPabddISnyZy81SyXcgYVf60sc2BWti/K2XT7hucQrPl4Fpt34O7+EbN9iAt73uacdaMA60dN0nXFCWGltGmrNKLI3tLemSz7KC5cKSx3kx2Kcdv3VICsiKtD9MC4zj1dIr2UziCDTPXVshJu/43vPB++7XDBIHaEafrmmsPIXKMtx8epyWZtoSyM+QcoXXOpRbjpjy9s/BPzKNazY0l5GR1tbvzs0db67a/bZo19auI98yJNZFGHQInGsU5N7c5qNbJjv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOIS7gRbTIur2wsF5YyfSrX/ijbRy0NAZyQBmdYrOkc=;
 b=EMhOTct1RiQ6Fwe/3SoK2SQXhBgIZZt53EKnOPeVGOevSxmPdxxj4GNJ4cP8790PSLADPTXizGy3GecHj2WCWf8kaBQEWoi80xnT+sakgMxY4Qq6KzKqcSICBxZTawbZyHTMAMbWosUXgTTgFPD7uHkfzZFFUYCY5ZE/JxJUslXNW+vBeL0334CTdsyCMdEo2lp8iIkxfm2aQvD74cU6Ewv/JMq+xZmGsFd5V4iJzTzi604a8FrPQe4uIpc6fhQT3p6zHNulJGmsTJsQ5iPbVUlN2RfjikQuBNIEXZsS6+xKtwaRVnA44ZvntLG8PMHS38mhvCA0FCDa7NdMneX1tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOIS7gRbTIur2wsF5YyfSrX/ijbRy0NAZyQBmdYrOkc=;
 b=LBUyp9Pfv2dnYKHKy9UC+2r5OpIi3IROPMU2dNezqtn8S+/6Q3jrT5vq7MYyiHDd/BWAWvRGOnS32lofIchCdf46cQRQpvq8XWrE/nb+tXIMhppee9Si7naoQFutSzSaG0/FGSjiSas+nndB5RHgIBld4CtakEeliJYb6U4mbKo=
Received: from BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) by
 BYAPR03MB3669.namprd03.prod.outlook.com (52.135.214.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Wed, 23 Oct 2019 01:24:03 +0000
Received: from BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124]) by BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124%4]) with mapi id 15.20.2347.029; Wed, 23 Oct 2019
 01:24:03 +0000
From:   Andrew Duggan <aduggan@synaptics.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Andrew Duggan <aduggan@synaptics.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Federico Cerutti <federico@ceres-c.it>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] HID: rmi: Check that the RMI_STARTED bit is set before
 unregistering the RMI transport device
Thread-Topic: [PATCH] HID: rmi: Check that the RMI_STARTED bit is set before
 unregistering the RMI transport device
Thread-Index: AQHViUCO+DvinpbczkaNw8YBbxu2fw==
Date:   Wed, 23 Oct 2019 01:24:03 +0000
Message-ID: <20191023012344.20998-1-aduggan@synaptics.com>
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
x-ms-office365-filtering-correlation-id: 3a11bf00-b12c-4763-98af-08d75757b08d
x-ms-traffictypediagnostic: BYAPR03MB3669:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB366938EDC5D3D61D9367CA67B26B0@BYAPR03MB3669.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(346002)(39860400002)(136003)(396003)(189003)(199004)(186003)(966005)(2616005)(478600001)(14454004)(50226002)(86362001)(25786009)(66556008)(81166006)(1076003)(8936002)(8676002)(64756008)(66476007)(66446008)(486006)(66066001)(66946007)(2501003)(81156014)(102836004)(256004)(14444005)(476003)(26005)(6506007)(386003)(5660300002)(52116002)(305945005)(7736002)(110136005)(6116002)(3846002)(6486002)(4326008)(6512007)(71190400001)(6436002)(6306002)(2906002)(99286004)(54906003)(36756003)(71200400001)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB3669;H:BYAPR03MB4135.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lbzZXOSBX0+Jq8LuSEZ+xHClqMlQ2k8m8FiqyrM6pNx0fCBB1BDl1Lco7YWl1y/alTUdxpDOIHpM/M1glFPlbQlUgHXWd4DG+XY3mylxtLi8no3HHSeq4KJ9wTFxGWgoghbs1Bre9ZLs3rb/o4/EqI2uhAopeEcDEiMdEITW6/9mn/PyxzgWNZzpPwnchC/QpgosDsgBduQuzb4i3ziqzksXkqjjWwBiKYH1iciM+VGwxjDud90zAyJ3tVLhJPhZL7nXWMoBkcFF5s/l2ELMb054xncFdqFGS0MgYef3lILmULMQ8aGSt/W2Z7FBDv47sOU9vhEDHfnq1WsIsfAmFAWNIBX0divHTLrnxNMKtn9Oj8twKmNw2BNm8cbaPViJeNQsBeNTc0luXjpXklxSyuWG4m98XfidFAFxZYAUOsVrxPjhKdBVo1oxojmyHSnhtjUSCKBkhmi7QpAKWNCqMkGA6ZC+Th18nCZuIUhhAR0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a11bf00-b12c-4763-98af-08d75757b08d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 01:24:03.4793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ivbaczdprqb1zgQgWufsKMGt4ZGqGRcac76u4FySy/xoutyQwTlDJl55PhZe0zM1oFOWc3xcZus4g/k9GHswRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3669
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In the event that the RMI device is unreachable, the calls to
rmi_set_mode() or rmi_set_page() will fail before registering the RMI
transport device. When the device is removed, rmi_remove() will call
rmi_unregister_transport_device() which will attempt to access the
rmi_dev pointer which was not set. This patch adds a check of the
RMI_STARTED bit before calling rmi_unregister_transport_device().
The RMI_STARTED bit is only set after rmi_register_transport_device()
completes successfully. A subsequent patch in the RMI core will add
checks to validate the pointers before accessing them.

The kernel oops was reported in this message:
https://www.spinics.net/lists/linux-input/msg58433.html

Signed-off-by: Andrew Duggan <aduggan@synaptics.com>
Reported-by: Federico Cerutti <federico@ceres-c.it>
---
 drivers/hid/hid-rmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index 7c6abd7e0979..9ce22acdfaca 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -744,7 +744,8 @@ static void rmi_remove(struct hid_device *hdev)
 {
 	struct rmi_data *hdata =3D hid_get_drvdata(hdev);
=20
-	if (hdata->device_flags & RMI_DEVICE) {
+	if ((hdata->device_flags & RMI_DEVICE)
+	    && test_bit(RMI_STARTED, &hdata->flags)) {
 		clear_bit(RMI_STARTED, &hdata->flags);
 		cancel_work_sync(&hdata->reset_work);
 		rmi_unregister_transport_device(&hdata->xport);
--=20
2.20.1

