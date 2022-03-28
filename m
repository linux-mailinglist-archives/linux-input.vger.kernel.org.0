Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E66CD4E908A
	for <lists+linux-input@lfdr.de>; Mon, 28 Mar 2022 10:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbiC1IyU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Mar 2022 04:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239553AbiC1IyT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Mar 2022 04:54:19 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130047.outbound.protection.outlook.com [40.107.13.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5782E4DF69
        for <linux-input@vger.kernel.org>; Mon, 28 Mar 2022 01:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXql/Ry3O7cClwp8ymNB80cZIeSArMR1aHXRU/O/MX2peKalZCwk5YsHEdylmc6cxPGZPhPCEkJqb7mcewlM5CWKujXjGazGiIKKow/TfIvoL81lZlwZcRxb/xQItPvB/ZsEaLJnn/c/EbUWi6/A2Lz7lAmyPgWHK2/eMUiiwHRhlywQbIOU3tfGz2KuXy0Ty9JeyfJYKlZJwJOP5stgJRF0M0WQKk6xS65Ytggu3jgkJSeIvU3a+qyY8Y2RB8KK1nKNkNTBhccvc59R3imVZTVwOQpRFIY9XHo6YlbZoY8BVAkWO1tTNwg0a9ap9rKIbG+GwtXc2VScxsj0FCse7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw9xC2aj9R2+pj/ogo7Qi1zGQSMg1pzrkMgJTGMR8fE=;
 b=DiB0HGoEHZ5p3CHfW+RhEaocvGpVUnsxOmz4p9gIZEdj58sTKwlFbLZ6gIe3GPb9Mym8vqdkUvRkfzYf1lQ/UV9UtPDIDeFLEbsN5bhbgcDR3NCAq028Fq9zRJa3I4Lqb1GfDqNdPVko+2H1K3tEtZv8Z9z/y5nliIHGil1HIUePPlZXVj31VqMj7qtL5T1yxCulZMLa/gmJZooH2a6BUd39/JAHkpkzew2z34b8AON+OKOXGxQvveMDmpUPgUgkOZMXVpJKH7/03jVTKRBvQMAWyXrPsCsb9d1crogXGVLBGmvWYDQpdORCzTXVVT15s4vmXvQd0HSVawkfoBdV0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=guerbet.com; dmarc=pass action=none header.from=guerbet.com;
 dkim=pass header.d=guerbet.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=guerbet.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw9xC2aj9R2+pj/ogo7Qi1zGQSMg1pzrkMgJTGMR8fE=;
 b=YhufizMxvWtlNfs43GaJuqhn1FBaQZmgO7L/3X9i1aL5/JlU/vNZrO5yLOoCn+UzvNKh48V1U0sCQ5HQeA4E3oOIC3h8YL1kj8BdAaoivDlHXZIfGOq6m68dAJJK8dTyQu0WZ6V/Ii18hR5Q6hV4STGEil7HeivkvzfX6/lKksE=
Received: from DU0PR01MB8928.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:354::13) by PAXPR01MB9409.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2c0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Mon, 28 Mar
 2022 08:52:33 +0000
Received: from DU0PR01MB8928.eurprd01.prod.exchangelabs.com
 ([fe80::d988:e529:83ec:1300]) by DU0PR01MB8928.eurprd01.prod.exchangelabs.com
 ([fe80::d988:e529:83ec:1300%5]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 08:52:33 +0000
From:   "Liberado, Selso" <selso.liberado@guerbet.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: touchscreen event not rescaling to display resolution
Thread-Topic: touchscreen event not rescaling to display resolution
Thread-Index: AdhCfvUDLrdtSjVxRKC1mAcoNuAacw==
Date:   Mon, 28 Mar 2022 08:52:33 +0000
Message-ID: <DU0PR01MB8928F41059ACB5940834D60D911D9@DU0PR01MB8928.eurprd01.prod.exchangelabs.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=guerbet.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6eec1307-66c4-422b-5949-08da10984cae
x-ms-traffictypediagnostic: PAXPR01MB9409:EE_
x-microsoft-antispam-prvs: <PAXPR01MB9409D3414E87BC82376D5191911D9@PAXPR01MB9409.eurprd01.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DXhWhe0ex6G+WFR7HUL7uTQ1wNLR6wNC2evrRCwwlqWcQ6IIhigyPTdrHgywbx1KEHnlfTOwuTMv1QUX6yr1l56aXVslYutbKvIEwu4xV1viz2UEfHP+0lc8Xc32H67H8uY/ykEcgPzBFoTumuG4+L149R4xj8PfLm5H2+tJpFfiGs+sKYKJmSAtwKR1pN6taphbrxd4ygodi49aMM3TgQoF5Xc3zRiwpSojvoLPq6yk6aS7UhSly5VsaSlg0W4ZtzDrXSRNkPkok8ibfuw9LZ6D7Kr1BIH8UjtbaYZPW43KqptJsJMZzj9BciO/Utqrh1ZJHNON9IZVwdff+3Ib+9IoJUtlm9RGHHFvksASJepPMX0bjpD2/KAGsk6vK6M8t46acT2t6JyR9VVxERT62BHIWP/Tf2HpDVazJ5sCoz2+KcdbRbjnDoHc2VXIMramT3LTTNixGqwgmPk4Ax55DdZ+VQw/ye9kYyuF0NlBGJyyUwNcAFS6o86KzUykLgfYCchKyUMVitHFYUWbP4HoKOCwGaGxYyL1BbADAQsDEQ0XCHE0C7/SptUH4Fd/qZ3KMlZSwdBgV7GI1aRHxrtxhPddysNBIQP4WN+WADdEXW4QcwHfZoNPGhqGhr5wI3riqfC0gPlvLUslGTL9k1xFGFTKXgic/uYMh/BLPpYVihL1GkWz3JwQAVs030x/dhrm10ACE5Oas5UoV0ZI7eEmAg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR01MB8928.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(33656002)(186003)(26005)(8936002)(38070700005)(5660300002)(76116006)(508600001)(64756008)(86362001)(7696005)(6506007)(66446008)(66556008)(8676002)(66476007)(71200400001)(6916009)(122000001)(2906002)(316002)(9686003)(66946007)(38100700002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VS7KKh+IoLHgH/f7ePyebkaOuyhf4mH4Le++LN6w64+OgjOo8SyCOtawL7yn?=
 =?us-ascii?Q?KRRAhtOeU1cD/huEt/59ki757heaB6ackkDD/DjrZJVwE3xJy7mFpKvCkQ2D?=
 =?us-ascii?Q?DcAWyW2HGsuNTrJWl+mfeoB+uSXn0JRBPRIbQ7E16FlS59vCigwh8pjl5l5M?=
 =?us-ascii?Q?5GIzHeK6h5OTwZ9pv7iH5EyszlzOIA4O/Qi0xiqaJAPn8Uqeo4VFmCnKOm1u?=
 =?us-ascii?Q?G17lddG0/OyolJ5UnVprbrPrQT67vHVArkAwS13LiX8F1Xhf3nZjoU4EfmT1?=
 =?us-ascii?Q?Y9tN5aZtcBsvVv5q5xHdUmYPLhADhNVDh30kVrqPjJP1LSuXAS6KcvEgBFN2?=
 =?us-ascii?Q?rY2CSah/pAzDYPcazNvRJfRBdiTh9Lk/FjEwYSj2G7ipIUx4aaVmiVtE0gBW?=
 =?us-ascii?Q?7/0GtiI/GPj9zInHJB+Aaz0hNW0mhT2709hmHurtIhpdW8eWySKpPsquPjf3?=
 =?us-ascii?Q?Nw/cLde9sUIfq3MHh0LRfoPFoIa3KHPYdifzxpuGhOnYUL7/AaC6w2gmGCDu?=
 =?us-ascii?Q?+Dex95iUjqSVg8lN7mNI7FREfgIo4l2od/At8vff2TgAxdsGf8KBA3NjzZJ3?=
 =?us-ascii?Q?J/g8ZOfkYkH9/uCfaO6/nJ4JIHp/1VZa52zw7e8Ol1K+kCKAANtQ929PJZ2O?=
 =?us-ascii?Q?fmWdcOPxtIwrQzf7m3wjRNJ+ndwOV2jl/Yc9Xz2VZk4VFf2+3RfHS/tL+12C?=
 =?us-ascii?Q?6OAyh1YcHktMZp3wdtiTXRRWqQefxQ7Y/JRHFE8BGKARbc01w9qeTDFnuWLG?=
 =?us-ascii?Q?dHZD5QO/Og6SJDKR68vY63Dy9Eb+KKIIg0pPP0oBSVtBYVxV4J0uIADB/4f9?=
 =?us-ascii?Q?ZWyWGuuUGz0qcIrsxzqWllmVgWvtC3h+Sa+5UPCvcQLVmMa+0kL9n6NV0GY/?=
 =?us-ascii?Q?PQdo2K1XHvJBm1qODjc7o2pqG4StoNat5hmIOCj6ZwsEAkvb2Q7ef8x4yZvG?=
 =?us-ascii?Q?bOVxBT25Iw2tPZy6OXo7Iq9DjBeGD2gajPzEr1ONDOv+KJvbc3wGzSxsfgZr?=
 =?us-ascii?Q?rGIw28+GN2gEmGLxxJlcPn63lcK/rkZplKT/irj+0LLTHoTSOOSV9TwaUxtt?=
 =?us-ascii?Q?1yF9My4JG3OkatisqMmd6e/9lVPm6S6+ctH6cl5Ymi813PPCCLw6T1WLISSW?=
 =?us-ascii?Q?iJiW9oV5xGuipvIkMd2sm8MF3iPJrnbJ17CU7t1szoXUhEjr0bu9HOX76q6w?=
 =?us-ascii?Q?HhEWpm/6MdM/U3ypuc29eaTgrc6HSFoJO5tcsHVQ89d+VmgxCuef7JiUV48F?=
 =?us-ascii?Q?U5tG2Z1slwGclN+i/zKL5+j3p9f/yxDnJW6/vy5yZBXHieRGITxjwJKqILv+?=
 =?us-ascii?Q?zsYV6H09/K88IpwSx1R/TfHtdjTI0G4pnaRo3PcJCO8lwAI98CEGbx9uK0h2?=
 =?us-ascii?Q?kjD8L0KhFsn+zvpgmI8JMcFOlVzeWUzGNXMFAZwogf0tjVwahlR2iOh5s90D?=
 =?us-ascii?Q?iI4nDIuGtpw0vch9O9N1xNDdBh1NvgTjYjPhdiulBL/7yxaY4aA4HplbgzdK?=
 =?us-ascii?Q?8V3V1EST5Ezu2Yn/FZNTJ0cCQE9umU6BZIUqFmMkGy0vYZ2QfsrzzX/zhTHu?=
 =?us-ascii?Q?0VxRzmXSa21vWaAqyu8bt1enpiaesYV4MYOdgDJ0JQYpl7UQJEz5dZj+V2Q4?=
 =?us-ascii?Q?6rUITWoYovks77aiiy8TzK2FTAaAGiU6d2ZEcZb8nJ1Hes60FKIjMBvfkG/3?=
 =?us-ascii?Q?vyd3+HFymF2AMcZmaqyTl/p8P5dxU+7FIbN3Mbuh4acmEAA0pRcIzl8z3JWm?=
 =?us-ascii?Q?vK0DPdp0bPwV7ZciUDaNJUCAfPEEpl4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: guerbet.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR01MB8928.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eec1307-66c4-422b-5949-08da10984cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 08:52:33.3289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 152178ca-dac4-4066-8a31-806d8e21b17d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oMANNRVAI/lho56jps8htwLWgQYBGkumPw0mI3KGBTmwXJ/EZaIJtZg/fgji7AM/irkWxiy8d78gWCB57lbKnEMoljqYPzTZ8Y+RMXaKaHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB9409
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

We have a 120x800 display with a touchscreen panel embedding the Ilitek 251=
1 chip.
Kernel version is 5.14.85
We selected the compatible driver building ili210x.c (there are specific fu=
nction for our chip family).

We modified the dtb file as follow, expecting the touchscreen driver would =
rescale his coords with the display dimensions.

/* Capacitive touch controller */
touchscreen@41{
compatible =3D "ilitek,ili251x";
reg =3D <0x41>;
interrupt-parent =3D <&gpio5>;
interrupts =3D <4 IRQ_TYPE_EDGE_FALLING>;
reset-gpios =3D <&gpio5 5 GPIO_ACTIVE_LOW>;
touchscreen-min-x =3D <0>;
touchscreen-min-y =3D <0>;
touchscreen-size-x =3D <1280>;
touchscreen-size-y =3D <800>;
};

When testing with evtest, the driver always returns values that are in the =
chip resolution range (about 16000).
A dirty patch which applies proportional correction is working, meaning thi=
s is not about inverted axis or swap issue.
We tried the Weston calibration tool and that works.

The 4 latest parameters are processed in a common file input/touchscreen.c.=
 We don't see where those properties are reused, though.
Do we use this input properties correctly ? Is an input driver expected to =
do rescale ?
We worked with focaltech and "DT "Polytouch" chips and never needed to appl=
y applicative correction.

Best regards,



