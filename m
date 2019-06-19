Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1354B92D
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 14:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731807AbfFSMzJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 08:55:09 -0400
Received: from mail-eopbgr760104.outbound.protection.outlook.com ([40.107.76.104]:54358
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727129AbfFSMzJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 08:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aampusa.onmicrosoft.com; s=selector2-aampusa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2H8fCVRsrWG3ksdD4lAqALAmVA/Kh6g1GgF9aPTMDA=;
 b=u/itsmQ+crgSMSJVMGAuaPo6ohXykLysAxtoXFBb5YDQDeXSSaQwL58UelHs8oktctQiw+ckrHMWPIBi+nuLwrVewctYH9mzMDFnvLWtKM3EEPZPXG5wGHW321y4aSInLqIruC7Gp3FheqMRfePUek1FezobhfozGMllbpNoQa8=
Received: from BL0PR07MB4115.namprd07.prod.outlook.com (52.132.10.149) by
 BL0PR07MB5746.namprd07.prod.outlook.com (20.177.243.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Wed, 19 Jun 2019 12:55:04 +0000
Received: from BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e]) by BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e%6]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 12:55:03 +0000
From:   Ken Sloat <KSloat@aampglobal.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC:     Kasun Beddewela <KBeddewela@aampglobal.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ken Sloat <KSloat@aampglobal.com>
Subject: input: Device Tree Properties for Captouch Button Device Registers
Thread-Topic: input: Device Tree Properties for Captouch Button Device
 Registers
Thread-Index: AdUmniJSlNglerPZSFOVaVVYianGHA==
Date:   Wed, 19 Jun 2019 12:55:03 +0000
Message-ID: <BL0PR07MB4115574AA13B8F8C2E036644ADE50@BL0PR07MB4115.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=KSloat@aampglobal.com; 
x-originating-ip: [100.3.71.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00175fd7-bb48-44be-9cbd-08d6f4b5590d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BL0PR07MB5746;
x-ms-traffictypediagnostic: BL0PR07MB5746:
x-microsoft-antispam-prvs: <BL0PR07MB574628AD12E9BF0EC7DAEF1EADE50@BL0PR07MB5746.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(366004)(136003)(39850400004)(346002)(189003)(199004)(2906002)(66446008)(4744005)(7736002)(305945005)(86362001)(71200400001)(64756008)(66556008)(107886003)(33656002)(72206003)(5660300002)(55016002)(478600001)(8936002)(76116006)(81166006)(186003)(54906003)(6506007)(99286004)(71190400001)(7696005)(66476007)(486006)(476003)(6916009)(14454004)(316002)(74316002)(81156014)(73956011)(102836004)(25786009)(80792005)(52536014)(4326008)(8676002)(2351001)(66946007)(66066001)(53936002)(3846002)(5640700003)(1361003)(26005)(6436002)(256004)(9686003)(68736007)(2501003)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:BL0PR07MB5746;H:BL0PR07MB4115.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: aampglobal.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hYB47VQQVMnqf9Ucf7o9YcqZqo9epKMrV18KrcKzlU4lGnjlRhlTTwnUDyEmo0JFWB7iRPGF5SqzsS7tRMZpxTSNReI5KdSiGIxCG4CG9vQZOs61tVIAGy/j0gb8B/ICJMlt4Ix0PZQtbrHv3Nc5LqrGadZaeyLxDD2rR1cqQSTsbY+iVHLY9EJKF2HFILUR8NPx1MrJpEvretuCjiEIRCrdL2meQWE7qR7uuKmnm5uAkqWNdCpA3nXc6UPywM7bMf8aXymfK7GEYYasKmwDQykqkR19+gjEFyCpmqVOsWBQBFpP6EHV+aRQl7FH4o6TzjHk4IFdbsChDbuQtdZw74zjCHsD8//ZkamknABalzprYc/t1HlaEYtBEAKTmli3R6ZaryzLh5E4UbscbraiK5q44Nm52dO5N693lMm7zxk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aampglobal.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00175fd7-bb48-44be-9cbd-08d6f4b5590d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 12:55:03.9306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e20e3a66-8b9e-46e9-b859-cb654c1ec6ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ken.sloat@aampglobal.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB5746
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: BL0PR07MB4115.namprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-TransportTrafficSubType: 
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 100.3.71.115
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-transporttrafficsubtype: 
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: BL0PR07MB5746.namprd07.prod.outlook.com
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry,

We have a new input driver we are currently working on and would like to su=
bmit
to the Linux kernel when we finish it. Specifically, this is a cap touch IC=
 which
implements potentially multiple individual proximity and cap touch buttons =
(which
would be reported like key events as seems to be the standard). A couple of=
 questions:

1. What is the preferred/proper method to expose the many registers that
these devices have via device tree?

These devices have dozens of registers, many of which might be needed depen=
ding
on the individual application. It wouldn't be useful in the majority of cas=
es to provide
default values in the driver as the registers are custom tuned to the indiv=
idual application.

2. Where should this device live? I am guessing in input/misc?

Thanks,
Ken Sloat
