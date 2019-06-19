Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCF7F4B044
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 04:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfFSC4b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jun 2019 22:56:31 -0400
Received: from mail-eopbgr1410089.outbound.protection.outlook.com ([40.107.141.89]:10211
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726330AbfFSC4b (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jun 2019 22:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKir8IRZYtz4DkWnk2/KtIINgK/3u4YoIKOuOChoyuI=;
 b=TO2kZe7WYuDyGQ/8U+W/KHI4XA46GDqoFU5fQU2uRe0+McHGgG2Akwa/alXPFtWsZ9sh3ZbcKamYp1pEj0q6bYqZBPZXq4na0fey9bgD/9a+tBGIfG1WnbQKXJI1G9hOePD9A8H3ddlePGln5k5CFR3eLFEVCstyD8WSRzIWMI8=
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com (20.179.180.211) by
 OSBPR01MB5128.jpnprd01.prod.outlook.com (20.179.182.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 19 Jun 2019 02:56:15 +0000
Received: from OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::2cae:ba96:df6f:c1d4]) by OSBPR01MB4855.jpnprd01.prod.outlook.com
 ([fe80::2cae:ba96:df6f:c1d4%7]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 02:56:15 +0000
From:   Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>
To:     Hui Wang <hui.wang@canonical.com>,
        =?gb2312?B?UGFsaSBSb2ioonI=?= <pali.rohar@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "sliuuxiaonxiao@gmail.com" <sliuuxiaonxiao@gmail.com>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        Naoki Saito <naoki.saito@alpsalpine.com>,
        Hideo Kawase <hideo.kawase@alpsalpine.com>
Subject: =?gb2312?B?s7e72DogW1BBVENIIHY0XSBJbnB1dDogYWxwcyAtIERvbid0IGhhbmRsZSBB?=
 =?gb2312?Q?LPS_cs19_trackpoint-only_device?=
Thread-Topic: [PATCH v4] Input: alps - Don't handle ALPS cs19 trackpoint-only
 device
Thread-Index: AQHVJkqP/vGN3Xs8p0+hhZ+9UdfYrA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date:   Wed, 19 Jun 2019 02:56:14 +0000
Message-ID: <OSBPR01MB485555E7F04DF7DF0CB01007DAE50@OSBPR01MB4855.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaoxiao.liu-1@cn.alps.com; 
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9942094-2ead-4be1-0433-08d6f461b1da
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB5128;
x-ms-traffictypediagnostic: OSBPR01MB5128:
x-microsoft-antispam-prvs: <OSBPR01MB5128DDD6FFF490640C9E0E06DAE50@OSBPR01MB5128.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(39860400002)(376002)(366004)(136003)(346002)(199004)(189003)(9686003)(33656002)(74316002)(81156014)(7696005)(66446008)(107886003)(64756008)(5660300002)(186003)(6506007)(99286004)(66556008)(85182001)(54906003)(68736007)(8936002)(6436002)(76116006)(110136005)(305945005)(256004)(558084003)(102836004)(7736002)(73956011)(2906002)(486006)(316002)(476003)(3846002)(478600001)(224303003)(66946007)(86362001)(66476007)(55016002)(81166006)(26005)(71200400001)(71190400001)(4326008)(66066001)(6116002)(53936002)(25786009)(52536014)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:OSBPR01MB5128;H:OSBPR01MB4855.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:ja;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: cn.alps.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RnLWiSLPqch4FYdpY0vB9LYGQUM1oWef3uQh5Aywie3QulxRZqOzdIparLENVLNBG1d4tl0gL1vfw0Faxii90sogyTstNvHhQ9Klpq+TWjyVOt5EauTnMv7IDFjqbinLF+omDE4mX6ac/mmgyxUZy4zxmXUWdcbq75W/D4dplo4fnRa0gXWW7DJMhcZiWolAcShiJhbNjkN9LB/ye9ZGPkWis/Xi39s91RwjRMJvT8N0k+jf2YgyQs+did0PMu5Kol5MGrudW/d5diA24ML6wtSc7U6beNYoAE3rNB6F885447DsKKVKdl5VMHSG1IULBsFhJ3ie6zXhRqOxantmbCX5fxOxG5i6IQkt+Bskj5m7O/xo8CyzBhUY2YR5P0pOvfk9hEm5hPJoZ3zBS7ChnibR0oJhrIBjA1usKgE4hEs=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9942094-2ead-4be1-0433-08d6f461b1da
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 02:56:15.0315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CHT1HTSH3197@gl.alps.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5128
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

hKIgldSV1CBYaWFveGlhbyBMaXUgvauzt7vY08q8/qGwW1BBVENIIHY0XSBJbnB1dDogYWxwcyAt
IERvbid0IGhhbmRsZSBBTFBTIGNzMTkgdHJhY2twb2ludC1vbmx5IGRldmljZaGxoaM=
