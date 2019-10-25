Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 752CDE4090
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2019 02:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbfJYA0A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Oct 2019 20:26:00 -0400
Received: from mail-eopbgr720082.outbound.protection.outlook.com ([40.107.72.82]:9893
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727208AbfJYA0A (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Oct 2019 20:26:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dH3VKwWZSz0/vtxqobJ+AageAxt/Fw78Ztpqp18m/vEtc3UwXYgMCmHU6ZSdfKDxzBL3MkaHHQ+joePGTFKeT4C9NOS1VMobTYzNeQN3sO8KVibPh5vfNMXPriZl6/0WLXM3f/wQR5eRcA76zK/3+mNrSkIVdNAjcNL8U7LIEIIGZO7uf9Fz9hDMcGviurGrxUbskyTTf8aTlkibieNKeaqg9FLVB0tqY3uIMZgYGNnc4pPCUb91WVS7EmPiQ8vJRq2D+MT/dd+LiuO29b6O09Nc30lW8x1q72UXDGgnlk8EwTWu872PTLej+8y2dk0UFIb5Yi/Bjh8/5LpUXJR4Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrtMpXK3Wx0LtjDGK41/+dSD9IIzDlfeuQDegnpkDJQ=;
 b=C3ftNMFxwu4fWdQLlFB4EDqoRXI8B4HrZwzrKzn2L8+nmOI70tevgAh7sGKaWRNjv8atYUROCr8fskfrSsnUXuV1V3CbRJ4iTRI+SfcM6c2M8CvLPUk1zzJnz7IZBnTqSGIhfVBHdJroqbEkAHmgnGDV5lcwvk9px6uA8v/5eefIjIsSktJW42W0JNCjHdpaMy+Jsxwxde465HTCLvvF4sYCDncOjD5858YI2xr3BPznPFr1dXrYj6iZJH0aGmXYMNoZJzyDw90BmbeT3gpOlaQVE1BwERC9N7EqKcG9wxYBgdROQfiVOC5eya0T2jxz9/i7RJ1hHwt1gHu6aD5z4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrtMpXK3Wx0LtjDGK41/+dSD9IIzDlfeuQDegnpkDJQ=;
 b=G4qULm2AHpahCUShV9rt78KN9K+ctdYC0dYnwD9grx6UDxIvs+pU8QlLFaFQEeQsKI1TpV/+E4cPzTR0vGP4A1OEjidPOaFiEfowSf0LkEKBgaN97si1y7+UW2k+5zK5xCbg+IEx6MWiSQjqJAZ2QFkZob7YSdSjJr0UQXoMWEc=
Received: from BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) by
 BYAPR03MB4885.namprd03.prod.outlook.com (20.179.92.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Fri, 25 Oct 2019 00:25:54 +0000
Received: from BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124]) by BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::d168:6b9a:e289:e124%4]) with mapi id 15.20.2347.029; Fri, 25 Oct 2019
 00:25:54 +0000
From:   Andrew Duggan <aduggan@synaptics.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Andrew Duggan <aduggan@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Simon Wood <simon@mungewell.org>,
        Nick Dyer <nick@shmanahar.org>
Subject: [PATCH 0/3] Fix spurious button presses for some HID touchpads
Thread-Topic: [PATCH 0/3] Fix spurious button presses for some HID touchpads
Thread-Index: AQHVisrDQNaW5dIaQEGv1ewe3Gj6NQ==
Date:   Fri, 25 Oct 2019 00:25:53 +0000
Message-ID: <20191025002527.3189-1-aduggan@synaptics.com>
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
x-ms-office365-filtering-correlation-id: 37eb294a-6792-4bfd-d2e6-08d758e1e583
x-ms-traffictypediagnostic: BYAPR03MB4885:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB488551F17115F70B1600D29CB2650@BYAPR03MB4885.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(366004)(39860400002)(376002)(396003)(199004)(189003)(6436002)(52116002)(81156014)(2501003)(81166006)(26005)(110136005)(66556008)(8936002)(386003)(36756003)(66476007)(66946007)(2906002)(6506007)(99286004)(102836004)(6512007)(8676002)(186003)(66446008)(86362001)(50226002)(64756008)(54906003)(25786009)(316002)(478600001)(6486002)(3846002)(6116002)(4744005)(1076003)(256004)(5660300002)(71190400001)(7736002)(2616005)(305945005)(486006)(476003)(66066001)(14454004)(71200400001)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4885;H:BYAPR03MB4135.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IEwKMAiaD8/mH3UFcY8nfQVXHoHXMNxKr6khLCE8bUR3HTKg0/zOLlyxwDpwFngLyZmaqmyo8vjqbvrGD5XqWgQCw1qlVAHqAkJZvPgBUKCINJGessVrfvpi0rr62acabFPWOxCCezpD3j4+XIUi+LKjnNoUBHMT6Eab9RaKpXYWCrQNHD12CYtevZ/1MYaR5DLcwa/eyo+OmfBJjV28lrlwfMRjwIATZR33OEJTgPCz+hfN0eA8KUblR0b3/9MYUyKvavgVxc81lfyEjPZcnOCGDchtKjS4rquKnGuSHqWopSkdiwmuEA9y2Ai7KSXOIgwu+uV/1IYh3p4Qaz5C9eMhibIh7xFKkAzk3ECac5jVY41kb61/EmkxJrlZ0GMdX4sJ1AbyZDMgBN1maAq9LYBp1p/5SF7EpCkVCritpaeqbWs8V9iiffO9shV+G1X/
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37eb294a-6792-4bfd-d2e6-08d758e1e583
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 00:25:54.0660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AIR9z/g9CDTHTQNFTDv5Lj2E4qw0qSdJrBP/W5SGD7xRMOzDfMdq8ubF/e++UnC5KnNw3dT/M0cwrUJsNjWdLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4885
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series fixes an issue introduced by the switch to using an irq_domain
which caused some touchpads to report spurious button presses.

Andrew Duggan (3):
  Input: synaptics-rmi4 - disable the relative position IRQ in the F12
    driver
  Input: synaptics-rmi4 - use the number of valid bytes read when
    updating the attn_data fields in F11 and F12
  Input: synaptics-rmi4 - remove unused result_bits mask

 drivers/input/rmi4/rmi_f11.c |  9 +++------
 drivers/input/rmi4/rmi_f12.c | 32 ++++++++++++++++++++++++++++----
 2 files changed, 31 insertions(+), 10 deletions(-)

--=20
2.20.1

