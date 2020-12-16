Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4462DB85A
	for <lists+linux-input@lfdr.de>; Wed, 16 Dec 2020 02:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgLPBPm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Dec 2020 20:15:42 -0500
Received: from mail-eopbgr140089.outbound.protection.outlook.com ([40.107.14.89]:16642
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725952AbgLPBPl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Dec 2020 20:15:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTXmaAeK6AelJzv/xKJgbKmY1an4wwF4auNsz5GMvH/Ti1v6xByRBn/SpcVDywxUy56cRNTW+4hXfgOTu3BIfPO1Nih/poybSpuOlNRxnxotv5M0OhFQPIw22ozLClm3ASu2LD29+BGphzATHhvYkSXLplW/83AwtjbUo54kb6wKx/6un9OczNCGTTKJExVPpQFrikG2c3kW/rk4AI8LdyZl3Pj2eVhqwwSRGXtyUV8T0HUoeFIThc9PHzxGLHVd8HAbfpkN7mFMIDCmYmZmszFDZ3jEacpmZc6ShakTKX7x+19RQoL60fwC5zec+dNYSCDKvrmifF2+AMzuxx6J6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKfxeQkcPVyYiXnu8vpZNiMgS3MBPzORqGCwobWK1DM=;
 b=ctU5AzmDkPCmrh6iqQ3rHhVWCdQAanZ+pPNz98ZQkRniD3rkPBe0eyaJdgce1wLXHadb3lT1gvH/myLwPEhlR+Xq5+XD61/maRGY7L74oLw1Ql/f0pYM9TztG7yXg6H/IlLfO6+kjEg5ij0hX1oDrDBtkcuUivYOxosnsp/Hx+UobexolZmpUxdIhsTHtqH0OW9BT8Le55mgRgwEgofGEK0Tq1ztsD3o2iPO8WY6APgGON69NOSSEF35nFHOaPB7CdVyVJ0+5wt3TMPRX7tp0noeuDH8IkIzOVc2JhqjZsjIB7H1NmApBaVGUMs45FEefwGkxzAtUIwaawxtfFJHgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKfxeQkcPVyYiXnu8vpZNiMgS3MBPzORqGCwobWK1DM=;
 b=AdjbNN5DfLAFAlgeY0KN8QnChorv4vwwS6DIYpxzMjrBs/zt3a6REM60hw7nvFSWMy918Ety4FkMx1D9nYivBVCmwa4pK9hCtHdVL1gnTyQOv5TcH0kHhdznr4YvQKctSTLCPdvAS1+tl8HK5NY+cO6WKLek5d6Wx/PQT4wooJA=
Received: from AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:35::12)
 by AM5PR1001MB1089.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:203:13::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Wed, 16 Dec
 2020 01:14:52 +0000
Received: from AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8805:7516:b929:e052]) by AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8805:7516:b929:e052%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 01:14:52 +0000
From:   Roy Im <roy.im.opensource@diasemi.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Roy Im <roy.im.opensource@diasemi.com>
Subject: RE: [PATCH] Input: da7280 - fix missing error test
Thread-Topic: [PATCH] Input: da7280 - fix missing error test
Thread-Index: AQHW0w3iUU+dMa7ASUS+dRifbXIXqKn46npA
Date:   Wed, 16 Dec 2020 01:14:52 +0000
Message-ID: <AM6PR10MB1926910CB91FE36F95BC815985C50@AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM>
References: <X9j8lGFgijzHyYZZ@google.com>
In-Reply-To: <X9j8lGFgijzHyYZZ@google.com>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [1.230.217.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 944e6446-06d9-4e77-9e14-08d8a15ffdae
x-ms-traffictypediagnostic: AM5PR1001MB1089:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1089F09E8A938F8971A93D58A2C50@AM5PR1001MB1089.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +jifGKzWMz+blRLliXP2anIRk2wEi40cOzDVrqJ6K3cSsYxvxQtbISqAIUfEUjnjHUSNIiJesdUNpL/iRyRRskUvJ3Fg93DHRK/RU9LzPlYCwKWnnOYxTeuGpVEgQ2I8wFjEAmTlSEHjO5ngCIQAhZJwCw4lDDkowmfo6ndgVF4GoK1NceJmzTSL9h71dE6prITBrTyIEQGJ6mN8cBLvW+/S9/1LZbw8s+4warAqyjLcoJhpPyGp1lH230aCaDIDbRC5vV6l3bnPaMO3KIkwdc6ohgTI8u42WtRo8l7sO71wDzzPpKxk6M4AAIx3kFdbxIRO33RElv+eSdwraFX5GA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39850400004)(346002)(376002)(2906002)(33656002)(26005)(107886003)(316002)(6916009)(66476007)(66556008)(4326008)(8936002)(478600001)(8676002)(5660300002)(64756008)(66946007)(7696005)(53546011)(76116006)(54906003)(66446008)(71200400001)(4744005)(55016002)(86362001)(6506007)(9686003)(52536014)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xY0MskOvpEJ9ZZGskhB1oJZqrtp1mJnVd4Eu2tWY8zriS/AG8PNcZYgq64U1?=
 =?us-ascii?Q?zihqLy1jXQU7cC9gP7o5BDdRaYYxg/Zprwhc7wu1X83q7zlUJQFSaQITh+4Z?=
 =?us-ascii?Q?PN4Y1JXmKGLyjm2zO2lKwed0nG5jl8b6pC57Mm14xPXOwdJzDhj4XofDKJUL?=
 =?us-ascii?Q?3cETZuNtj9CFDedTKOmad7R4W0OHGd4sVkYnrmjY58HUaC8o6hW4+KKOEdse?=
 =?us-ascii?Q?MzGY68XX82LjDMfZ7ZFZMTGUAvza0WE9wLabwDlsK4AzmuBtt88WAHeL3hT+?=
 =?us-ascii?Q?pFRxTSRTQIwCNCzpriYwWg9g6Q8tX3fJqfntIMzJeHI9Z9NpfwR1sWGPhbUX?=
 =?us-ascii?Q?0il1dSAKPbCd8TsiHhgNLiF/LsC3P2pBVvj1+Ea6HN5ecmHnu4ya80D9pxML?=
 =?us-ascii?Q?SrC6U6mJW2Xp/iSaV86krzps+PN1sVmYZeWRzrs5l2JvoeQj+K8Lzpfq5WlP?=
 =?us-ascii?Q?LLk7We/VIexTJ1wbgaLxk5vD4+i6nD7FG9/DM/NAbJ5mwa4VR/81Y8azX4d4?=
 =?us-ascii?Q?4Iml4DAddSp315IznGyL+tvu+Yi3vS/1gdBUY4Af9Cq8Rz63h1AeAiHhEsFi?=
 =?us-ascii?Q?rUGwQ2ZghLqR4ul1ehuTBH2/xO25G4YOcnEsMhxRruRhiolZeckScVIxh+J/?=
 =?us-ascii?Q?YLzLY1q9rmX7scQqHFgPY7MoqHLJPMbBHqbVjxdDIPvs/FfVwTkwNL/kw/gF?=
 =?us-ascii?Q?UuMB9O7b9G6cdCpL0tCGcXK+yv6kHrB+/P08k6oo1ms3y/D4Lm8JTALR48MN?=
 =?us-ascii?Q?VoL9WLrb4Jvf2WVgWOLcN3v7zVKG6FJpd7noPkt708Ecvb9KkYVE3Io/Aqra?=
 =?us-ascii?Q?JXPP05JbTXRkLGALkGdQ9hHNmSEekKPXwBN9kd5yRVdLuCjaU7UzLR/QEwXy?=
 =?us-ascii?Q?5QRcljstbHDh7r+vilJ6Lo9cMUMVAI3kzW8DejMK0UQ6GCl0hw0GFr2qq06C?=
 =?us-ascii?Q?V+EhM/1Zuv4luOIijP/qmpCwefxdpCbnUcN+OyIFVVQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 944e6446-06d9-4e77-9e14-08d8a15ffdae
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 01:14:52.1660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GBfW+X5xXZprqz1EXVZ958YM8Y5ojnGSi/qS4VlCjonuDbMk04kpz7Q+ZIJlCpG/U7h/RQPfKtz0C2C9OrqNhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1089
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wednesday, December 16, 2020 3:13 AM, Dmitry Torokhov wrote:

> An "if" testing for error condition has accidentally been dropped from th=
e code.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: cd3f609823a5 ("Input: new da7280 haptic driver")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Many thanks for your help.

Reviewed-by: Roy Im <Roy.Im.Opensource@diasemi.com>
