Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F692DBF05
	for <lists+linux-input@lfdr.de>; Wed, 16 Dec 2020 11:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgLPKwP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Dec 2020 05:52:15 -0500
Received: from mail-eopbgr140053.outbound.protection.outlook.com ([40.107.14.53]:24694
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725892AbgLPKwO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Dec 2020 05:52:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAmYTLfdNkwtRmudYTRgwLII5NflszARDLBouRIpR4Q9thGIRoz7yIrapqEYt4/g1we+wgr3IRUR1ABdrpOKRow7evhFQXtGihC0hr+mZK9MFbkYqBbsOcdlsugvw9dp+2g9UodFlRe44QrXIPSt1HXwI6n8j9i1wJqyNELe66EEMyfXFKow5zbjrXLYrNbaHcxTQ4pSzaxvtRkOs03+bogfEZmgFIIf9mfMy7cEFfHwomP9T7fHlL4mCu9j7L/B3qgnDObW5CfoCr3O7YLJputqprQgzEpHoNzSWm1v/4R+ly7uvZhNvR9f9vF3MZDA+eY8uSSdXnWvfts1AcNavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKakeKSyxKWfVInXINDzUbvee3peCFz/ojN7aoVITkc=;
 b=fRlYEH7cQXKBGHIxfr9KDhLlpko3kKpM9cloGO8LtXtn4BEtFr1uzNZrY8PLilhUTH1u9yEg/3ktNxF3Fi01OJd0ryLL9NGl10WAwtQBjkw5K+8FxjQUCm67JKajRaycutCccdOgeVe9mFXitW6iajxFnm0/OrIX9CQO4dcFe5stz1I6w9rX7XvNYkzvU37PFFsYgLPUCq4EGGWvQ3Moa0u3MSBcBk0Qyu4vZRVcKKxB9GR8+5oXCDae7ViZ3x0xp24HOtolzwamF1wOckjdN+XsH/NT8ErebhIHwCPDj5807OLDY+E8cNi+9enV45Y57GBwJhYhl3g+o8h2vb0QBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKakeKSyxKWfVInXINDzUbvee3peCFz/ojN7aoVITkc=;
 b=D02FcS5+p2IFGkELdB3KIEuz7J9LgKhSMys9y0wAWO+gcsytr07FPJgcmfL0qgXzmWTtJAYbQABjn609+aJ7yp5vDRGVWvUiHvDU5gO8/tAu9fi09vgls8dM+it24iSzjgh5YrMDa3WQYI3z3MgxKyD9BOB16G5WpPMBiCi6SPE=
Received: from AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:35::12)
 by AM5PR1001MB1026.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:203:c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Wed, 16 Dec
 2020 10:51:24 +0000
Received: from AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8805:7516:b929:e052]) by AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8805:7516:b929:e052%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 10:51:24 +0000
From:   Roy Im <roy.im.opensource@diasemi.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Roy Im <roy.im.opensource@diasemi.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] Input: da7280 - delete a stray tab
Thread-Topic: [PATCH] Input: da7280 - delete a stray tab
Thread-Index: AQHW04ZaHi4Ma+y8QEOW5kTL7J7ltan5ifow
Date:   Wed, 16 Dec 2020 10:51:23 +0000
Message-ID: <AM6PR10MB1926E4EA344C24F76881E89B85C50@AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM>
References: <X9nGNJjFi9AaBBwX@mwanda>
In-Reply-To: <X9nGNJjFi9AaBBwX@mwanda>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [1.230.217.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe8806c5-1b99-4ec8-424f-08d8a1b087ff
x-ms-traffictypediagnostic: AM5PR1001MB1026:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1026E3BBADD1A008356109E7A2C50@AM5PR1001MB1026.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w6FEs1QAjD/HUUTHu1EvKzT9vgAe+mA9c9i6In36QFvLcYWm/wbr2cStAIcjyjwv/DNJGdqa7xeIZYVoIO4V6tiqcyo+g9RJMDM1tY59/ERNyWgLG5dlJAuuYxm3i/lE3W93qVnEBSerFH+R2yNZMZeMJFArXXmczkwPlqKu8hR/yOCzFxn56zuwUHTynS1B1RTxO0yeRSjvdu+SAV75zy9yRnw99Igb++liKlqOr7nn6fhC6wmsNgCtXKLoVDJjj/PIuXKZXsgICiwve0ZR9x3XJl4JUQaU3Vo2BVxfNxEiszvhDSDbJpebrPu0ftpmURfABIi7Q6QBrgMlWwEdbA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(136003)(366004)(346002)(4326008)(66476007)(71200400001)(52536014)(9686003)(66946007)(76116006)(86362001)(64756008)(478600001)(8676002)(66556008)(316002)(66446008)(186003)(4744005)(8936002)(2906002)(26005)(5660300002)(55016002)(33656002)(6506007)(7696005)(110136005)(54906003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?cU7VTC1w5Zrj7xBvQpbwam734LUBC3A16SKWqeII66fV26n99tlAJmO3YVL7?=
 =?us-ascii?Q?XQmUYaL7ATWNLY+MCAfoHxLzp5PHLwtDTk8EDuVbzhIdnhMTF7yPz9Zu7eb1?=
 =?us-ascii?Q?uw1qiJmS6CDU1uJZYVH4w35B4N7A9Q7WSe3RTLpNq/fH7rFWP2OseTs1dvf2?=
 =?us-ascii?Q?2aVj0VW0tYM0bKRmde6GvRZfxO1eIA7cvykObj1cZcFugILSnWjDoB47513w?=
 =?us-ascii?Q?wWeSU6de5jeU9NmKl3XkRefPy+/A5nEsMgx8GkAtOht8GaBLkR//BOGIaPCC?=
 =?us-ascii?Q?1Nn547nbbcX9N4RiRL/qfbDaCBD64mDcxCTIbnKCNZj3OIyrikD0IY3BYsuo?=
 =?us-ascii?Q?xIpkpGsKiapLuvSpXl7ogpU+bBe6aPyLPCAYUITxta/+bgjMi9zfJjvVKRD6?=
 =?us-ascii?Q?12bffiUpRlZysAxXwrRVDzyuKj77ShDUWqeO7o07oXy2qddC/Gse2Kr0RGQm?=
 =?us-ascii?Q?S0QEPoMAUSiYAFJnzuZjbzA4GyHeBsHr8S5MTcc3tWwqr4wSHj77JCLqrBTt?=
 =?us-ascii?Q?quxwITAjHETAjTV5O+73+8zWSe5WF/8Z2JJOWjFw7q5irn1HULRIeuFSJWdU?=
 =?us-ascii?Q?YejJKd4H9aKQugIqYQubWSX8nUGr6Xxfje9rBTgc0kkQlRJ+08zT5fVo47Aq?=
 =?us-ascii?Q?s21M02sWHoB2pqET8oZYQkrAl66VcdeQdhHevVAPkq3+lz+/UzcON0MtAu7d?=
 =?us-ascii?Q?PnzJaysPMco4Hu6y95EHyizbJmcYcTaej9sVu5sAKWM3BZJgdaeRs7Rjv2hr?=
 =?us-ascii?Q?QMFlq4OeHzK+TqAAhYukf55u7j5w0clxQSxGcPOJgmvDGGX3g2hSpF2LNwWS?=
 =?us-ascii?Q?BC/gvy2wruv06muKQWE8X5/U5aUNfI9qVCVwvYVYYdDgcSh3aUSpUeRikVls?=
 =?us-ascii?Q?3nbEhy0RUuEYkVtpYZf4D9/HUglbekbNCLXy7GdFG4nrTw35+293pSPIxKvV?=
 =?us-ascii?Q?T1ikjnw4jxSHFRScGRxtgySiTTziRaH8k5RMm06USOw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8806c5-1b99-4ec8-424f-08d8a1b087ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 10:51:23.9764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HqwC66xaPabpmQGLQ79nIWk3POZWsuu8jsWyZHPByzJoImfzk3m9mAJrKaymKnQ9lzkRrstvEQZW4PIfwMftNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1026
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wednesday, December 16, 2020 5:33 PM, Dan Carpenter wrote:=20

> This line is indented one tab too far.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks for the patch but it is already fixed by Dmitry as below.
---
An "if" testing for error condition has accidentally been dropped from the =
code.
		error =3D device_property_read_string(dev, gpi_str3, &str);
+		if (!error)
 			haptics->gpi_ctl[i].polarity =3D
 				da7280_haptic_of_gpi_pol_str(dev, str);

Kind regards,
Roy
