Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F05554EA4B
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2019 16:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbfFUOLk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jun 2019 10:11:40 -0400
Received: from mail-eopbgr780117.outbound.protection.outlook.com ([40.107.78.117]:45863
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725985AbfFUOLk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jun 2019 10:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aampusa.onmicrosoft.com; s=selector2-aampusa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wkc8PlDfgnc0z0QGHwV5rL8OLqorBQx8NN9Pv+BA9LA=;
 b=Xqj1hDkiC+qFTOK8hHZjeF3Pd5cCXG4/SKXMB7ef6M4Qz47WcXL7MtqLR3Ss22ExwSMKZs9HyAh5l7KK1NzpJQ9tn9jVSi+EGHDlvTEaVWnZ9O/7pZAIsqbbxhhqp1zpkpXWWoG0enwrM4L2QWJ2aMg05WzVgRHxYFuMCGF90sE=
Received: from BL0PR07MB4115.namprd07.prod.outlook.com (52.132.10.149) by
 BL0PR07MB5603.namprd07.prod.outlook.com (20.177.242.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Fri, 21 Jun 2019 14:11:34 +0000
Received: from BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e]) by BL0PR07MB4115.namprd07.prod.outlook.com
 ([fe80::f064:5129:63c6:d3e%6]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 14:11:34 +0000
From:   Ken Sloat <KSloat@aampglobal.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC:     Kasun Beddewela <KBeddewela@aampglobal.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ken Sloat <KSloat@aampglobal.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: input: Device Tree Properties for Captouch Button Device
 Registers
Thread-Topic: input: Device Tree Properties for Captouch Button Device
 Registers
Thread-Index: AdUmniJSlNglerPZSFOVaVVYianGHABm/o3g
Date:   Fri, 21 Jun 2019 14:11:33 +0000
Message-ID: <BL0PR07MB41150BF0740C6F7E63FF4E11ADE70@BL0PR07MB4115.namprd07.prod.outlook.com>
References: <BL0PR07MB4115574AA13B8F8C2E036644ADE50@BL0PR07MB4115.namprd07.prod.outlook.com>
In-Reply-To: <BL0PR07MB4115574AA13B8F8C2E036644ADE50@BL0PR07MB4115.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=KSloat@aampglobal.com; 
x-originating-ip: [100.3.71.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12c116e0-bea0-4d03-a3f2-08d6f6525de0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BL0PR07MB5603;
x-ms-traffictypediagnostic: BL0PR07MB5603:
x-microsoft-antispam-prvs: <BL0PR07MB5603F321029FECE485908448ADE70@BL0PR07MB5603.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(39850400004)(376002)(136003)(366004)(13464003)(199004)(189003)(76176011)(478600001)(81166006)(71190400001)(2351001)(186003)(6506007)(26005)(2501003)(74316002)(53546011)(7696005)(66446008)(99286004)(54906003)(5660300002)(52536014)(66476007)(76116006)(66066001)(81156014)(6116002)(66946007)(3846002)(66556008)(64756008)(316002)(102836004)(72206003)(71200400001)(7736002)(256004)(9686003)(8676002)(8936002)(73956011)(80792005)(4326008)(2906002)(6436002)(68736007)(1361003)(14454004)(33656002)(6916009)(6246003)(53936002)(11346002)(446003)(476003)(25786009)(229853002)(5640700003)(55016002)(305945005)(86362001)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:BL0PR07MB5603;H:BL0PR07MB4115.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: aampglobal.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EKLl5YENnKGwL4eX3BcUHp1kBa5NyX8+WJnpedSvTdDN9qkrYLh1HvQLqNGTSUIMvTcK5kdrEJ8RhXvWKyYrknQcOkIEUmSquQuz4FamTCSb5pdFUNgN7/VM0u5zUM67jWykjtnKburTjPRUk9bZwEwHD5mrvnvqTIldSNQbGVNSFmGNass1YgbJPJXrNjZ/k3OAP+0y/n3SEXuqEzPnpUQebKTLwXv/YnUelUBTaX/vkRXtoyxpSI1qn1nyoGxWofNoUoGMFL9pvUOCqKG5UO7/BXswdJWZYXj1Scq8RM8MbBChPYVm49vQEk5Vuzx2enu8hXC0lwHONFjl+KN506REl+pI2kA61LdLP0b++8EcNj+0/9NVh2ATt2TSm67h3XUpFtj9t71AzIMRFzWc48pLDoHoM2xIUDtfbQtJPwI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aampglobal.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c116e0-bea0-4d03-a3f2-08d6f6525de0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 14:11:33.9909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e20e3a66-8b9e-46e9-b859-cb654c1ec6ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ken.sloat@aampglobal.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR07MB5603
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
X-OrganizationHeadersPreserved: BL0PR07MB5603.namprd07.prod.outlook.com
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> -----Original Message-----
> From: Ken Sloat
> Sent: Wednesday, June 19, 2019 8:55 AM
> To: dmitry.torokhov@gmail.com
> Cc: Kasun Beddewela <KBeddewela@aampglobal.com>; linux-
> input@vger.kernel.org; linux-kernel@vger.kernel.org; Ken Sloat
> <KSloat@aampglobal.com>
> Subject: input: Device Tree Properties for Captouch Button Device Registe=
rs
>=20
> Hello Dmitry,
>=20
> We have a new input driver we are currently working on and would like to
> submit
> to the Linux kernel when we finish it. Specifically, this is a cap touch =
IC which
> implements potentially multiple individual proximity and cap touch button=
s
> (which
> would be reported like key events as seems to be the standard). A couple =
of
> questions:
>=20
> 1. What is the preferred/proper method to expose the many registers that
> these devices have via device tree?
>=20
> These devices have dozens of registers, many of which might be needed
> depending
> on the individual application. It wouldn't be useful in the majority of c=
ases to
> provide
> default values in the driver as the registers are custom tuned to the
> individual application.
>=20
> 2. Where should this device live? I am guessing in input/misc?
>=20
> Thanks,
> Ken Sloat

CC'ing people from device tree mailing list since this discussion would be =
relevant there as well, so the more generic question would be: For any devi=
ce which requires multiple unique register configuration values per target =
application - what is the preferred method to expose all these via devicetr=
ee? Maybe there are some good examples of this already somewhere in the ker=
nel drivers?

Thanks,
Ken Sloat
