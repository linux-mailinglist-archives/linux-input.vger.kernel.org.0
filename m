Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 469CA743D4B
	for <lists+linux-input@lfdr.de>; Fri, 30 Jun 2023 16:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbjF3OSg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Jun 2023 10:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjF3OSf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Jun 2023 10:18:35 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2095.outbound.protection.outlook.com [40.107.20.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2AF92D78
        for <linux-input@vger.kernel.org>; Fri, 30 Jun 2023 07:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ma8O3SwGIwE2YruOOi6oViVk8DhGKCMYE3kDo2AcAMJVcNwLmkbeS7qYbMti0nOTOmm7tJib/0vYUcQgzPChgpcMRfeZq4It8kVZeEEatZTU6uE7Q9T7lrnHOknOo8Tmp1pIZlTndU8HyoONW7nFiF1WqbZTGOroBOKob8X5s8f4wY9KxmoLL4ns2VqBCZn1annPW7YiRdkLmgNSiTrNVQg8AFP9g3dUthpgXSx9b2NpFjgQQqTrf/D9fm5i2tMDaZXsoQqRugKk3TZuR2DDZBTYB+QxdzAgFsvXrV8FPnBIyXXmOKvmIiYFklWfTEHLA03hV+p5ru8hZa4qY4+h2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AB6QX6ApcXKASteQlM3pxAqrN1L+b6Gg+oVZ8iNC90Q=;
 b=KV8oSVb6PFSZZjIuhh9sz0mg5Hy3p3qcJoRH56Ni06aydBAIAxgnoOgtcC9mqoxSv2Noa9z23YIdvrboLhiwgEj5ac5iWU0+n+Mne7oEYqyPH6QfnYgJa8PZOeNm+o7QI9NFNr207qtDCjLhzChlxRsnuCS0UlaL0F9A6pBdUjLTr0wA5hC8vHcfG17xp2CdbBF3T4R6i+I3xVD0UgB3M1+2EYLbWbOx5ugq5smpAO1v/0IS8UZvHYVs8Dr3hWkm94MyF/6SgLR967jy2+PpcAZUWJqenTihp6C+aA64kGZkKppRKKbzaoSDRpIDNVXTmRnpTtyjQ8UKks2EWuoRAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lely.com; dmarc=pass action=none header.from=lely.com;
 dkim=pass header.d=lely.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lely.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AB6QX6ApcXKASteQlM3pxAqrN1L+b6Gg+oVZ8iNC90Q=;
 b=pX5ffa9zOmNgeGG13ZR7UVM9ZV62ydaWD27/UvZFQpqLbZC/rkpnvuUeIIJwIBQyVXhJgPPalZKK3r/7E4f9OgUjyBb94nh50+zCotLnSILSTixapoBU8tEz70D2J7rYrGkDual1kGWfeYskJBVpd6LOLm7e/ly7UgYt1vqvnh0=
Received: from DU2P193MB2339.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2fb::10)
 by VI1P193MB0686.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:145::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 14:18:30 +0000
Received: from DU2P193MB2339.EURP193.PROD.OUTLOOK.COM
 ([fe80::e9fe:f23f:2853:371a]) by DU2P193MB2339.EURP193.PROD.OUTLOOK.COM
 ([fe80::e9fe:f23f:2853:371a%7]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 14:18:30 +0000
From:   Lex van Teeffelen <lvanteeffelen@lely.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Setting Synaptics Intertouch to 1
Thread-Topic: Setting Synaptics Intertouch to 1
Thread-Index: AQHZq1sFyu/W9ZAnEkK8mmP1oNzwzA==
Date:   Fri, 30 Jun 2023 14:18:30 +0000
Message-ID: <DU2P193MB2339830501EEDC773F209232CA2AA@DU2P193MB2339.EURP193.PROD.OUTLOOK.COM>
Accept-Language: en-NL, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lely.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2P193MB2339:EE_|VI1P193MB0686:EE_
x-ms-office365-filtering-correlation-id: 22eace47-f237-4650-24a8-08db7974e112
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tIiVTy6SR6OVKsVZQOmBSsLfYXT2nhdwsIbgIqagn7cvCzKrlFF8fo57nDiAYKbuIbZprQBIup3mI2UJZo43uP805f0XxUHX8c07CjhNMOwdBrpksD3WbYnbiWTdh+nsr6kesGMo3rq/oCJA5PbEE8+1DneNrhoQZFgdcA6CGZfB09IIELeWjyw8MKLGGz+pHXWZs7DrIG874cKO9OtMqTvsm8nWx6OTVYguAOi1fY5BT5cgz4xvpF/45zJWit7X7rhdfUbIMD17RO4bxRiwlX6ty9c8VruPzV5GGRuXaesLjL5cC0PYE6+1QwC6+XPt8Vp6A4+kHnla4Y0QVciGr6rUOia4R7D3nWp+r0iUG7yEDu3Kcia0ZlOmdfoKgIE5yAz3fpirjdeRpHbOudm03g7c2/bUCGisBmft/4ubEy16G9joO+EL/lUyb/q2Y3/wMXQi9RYhfSr7uWd4uhzbdrFi8ctlqUCcyb9ZoFHWOvr/fAlaHtuPQpqUbWcvjVGq+mlGuIY61/2kuQcjT3YvXpmDJ1ddK37Zyr2Wma2K5Z5njgjjqBkSXhxGW+HtOelYMuYiNd7NYBqfxf1xENjmSQTTMlxSsZEksysUHwyU9skZ80UCbdvWKIUfmSbFSmce
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2P193MB2339.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(39850400004)(136003)(346002)(451199021)(316002)(41300700001)(83380400001)(38070700005)(86362001)(186003)(6506007)(26005)(52536014)(9686003)(2906002)(33656002)(122000001)(38100700002)(55016003)(5660300002)(8676002)(8936002)(71200400001)(91956017)(7696005)(6916009)(478600001)(76116006)(66946007)(66476007)(64756008)(66556008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GCcnLNUsIV+7rZmaEgXv6RcNyB8Y3x3qJf09BLRdkZZURs4F4JnC2lE72Dfp?=
 =?us-ascii?Q?HyNiQLP5tbSvixempunPDWRllFAogr+ejriEVxx3X7eeiGV4K2qkBv2l36Bb?=
 =?us-ascii?Q?P40oerOoStu9VDOpn8TFq1lSTC1AoqpNH0Bo09GovZbl2ASsdEu5tGmIC2Vf?=
 =?us-ascii?Q?LiiUNUsJeg7IxQmW3AzSwPXqCuna/5i/CTh4MX5kDEjyQgc4SUBxZovLNyKV?=
 =?us-ascii?Q?hkJV8w0mCmKUT+pn4g38aSCICqIje6BcZ/ICPBEodJpb8ccgtDYqBCIUJoap?=
 =?us-ascii?Q?wZ8yWjtW3Nqnv6N7YsU19aO1RiLyFazPPDtYiczo8htU6zGIpLrczTwcRioC?=
 =?us-ascii?Q?ejsg8qlUaSefqZDvXZBi/6/FiNPs9ItrwfXKDzo7/hZT17qFIZwt1NKQhpk2?=
 =?us-ascii?Q?5OfloklITMnRavzlJ9FFk1+41W7TV5gGKyZzLBOxP4vF/wrDV4odpYGiW2J3?=
 =?us-ascii?Q?KMx9HIt1tH60opWtJBMnNmNrGhc3FNuchaPd8YQ230aCpRZmoB7TIoU2IHPD?=
 =?us-ascii?Q?Y8hJgdGCqL09q/XozjffTJWR46qLjnifxjA7yVyaMn50wTq/lXVC4F+1JZb9?=
 =?us-ascii?Q?fbu9K8XXdMPHUNkfA16o00Hr8fZUizsJrM3gl4S6H3USNWUj0+6Tu3TR2UkK?=
 =?us-ascii?Q?Gh25D6LjVsCq5VOUZJtMupi1ex9TCIBIOmVwO7wK5zfIMl33zfTLzW6tokRQ?=
 =?us-ascii?Q?SZlHeKvFGWbJsabYhHGv7a4MX+nSCBBv5efZjQglbIAWjlxG2G8JuM2M1vEl?=
 =?us-ascii?Q?OQPg1wmod5Sh0W+HUTalCeYsdq4+D8bk1F79Hievr5pQBLFe9tU8tuviq/rl?=
 =?us-ascii?Q?bTN/5jKMfS/kKXjC4LqBJBV1pWYchWkn0Xv1+IWemSgRG8lvCKnKHsK2T8J8?=
 =?us-ascii?Q?EH8hJ7Z4O8Gw/Dh1jnvIvUd4vNEeLIw0iQIA5fR9mof+mi7lSXOlU/b9Euy8?=
 =?us-ascii?Q?qlNyQb0Pk7ZBgDD5O2Ibo0Ks4ztatiJ6iyqh60qxEJNNyZb8NZeVPos/7Aml?=
 =?us-ascii?Q?iINCjBbzg91ODUfBlj9hPQd6OnslH/0pNTrlanZUDCX9MfOZascKwaMwd1zj?=
 =?us-ascii?Q?FHVdgFnopljxQFet4P9UzjzJMqEWvLPupoRsQygRi0oitnexViI3vpFQwEko?=
 =?us-ascii?Q?Ex1sdFBmHDR65DZ2U5RsN1r/qFy95b9Xz7EDgunDorVjCFyik4zzFBB+aPL4?=
 =?us-ascii?Q?5mZBcWwBOpmYlIjq6Yucn6/26/UCjXlblyZzracd6WDoI9JI1d5dcn1Bd2ua?=
 =?us-ascii?Q?IDzlGNwOx2C8xEM+IiEEx7GH1RfYsO+edVk9byU+0c5RsN2iKrSufGSMY0SR?=
 =?us-ascii?Q?MddfWRyKUrO0xR53GjwGF1s7v/ylBAo6c9chIaSl961iDd8xEG9/ryWvQLNE?=
 =?us-ascii?Q?l1KPZAy0bmAAISFND2Cbyf49vCivMglIMRHTqCHHPpQYna/qYiiF5Hd0g5Uo?=
 =?us-ascii?Q?pXo8vo09wtMN1P3DkVi/sog/fkf4Y+sLPQaznBdxwMrvo2y6n/4evLxFaNeE?=
 =?us-ascii?Q?tH/jYqjwVkaH8zhg+9Jllr8tPgsnaopgsBQuWvZSvI5hkyFR6+mYQ4JRXu06?=
 =?us-ascii?Q?lUqfykhWqTYSyM38mKcfnYWYhryr8WO/skyTWenc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: lely.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2P193MB2339.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 22eace47-f237-4650-24a8-08db7974e112
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 14:18:30.2183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ad1af34e-72ec-4617-8123-2280b7b426b6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VUnRutWRRfvYjm55OqEMht9mjARwx1741QBAHP9UQQRIhiQmHjI7q9KbyXTzDpbFPrJs5qNocepFfY9SCCxXtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P193MB0686
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear linux-input,=0A=
=0A=
I was having some issues with my touchpad on my Lenovo Thinkpad T15 (gen 2)=
, after reading some log messages, I noticed something among the lines of:=
=0A=
=0A=
```=0A=
psmouse serio2: synaptics: Your touchpad says it can support a different bu=
s. If i2c-hid and hid-rmi are not used, you might want to try setting psmou=
se.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org=
.=0A=
```=0A=
=0A=
Both of the mentioned modules were not loaded by default.=0A=
So I decided to set the intertouch option in the grub config, and after a s=
wift reboot I verified if the intertouch value had indeed changed:=0A=
=0A=
```=0A=
cat /sys/module/psmouse/parameters/synaptics_intertouch =0A=
1=0A=
```=0A=
=0A=
The touchpad is now noticeably more responsive and less jittery, hence this=
 email to report my findings.=0A=
=0A=
As for the details:=0A=
=0A=
- Hardware: Lenovo Thinkpad T15 (Gen 2)=0A=
- Distribution: Ubuntu 22.04.2 LTS=0A=
- Kernel: 5.19.0-45-generic=0A=
- Touchpad:=0A=
=0A=
```=0A=
  *-input:2=0A=
       product: Synaptics TM3471-030=0A=
       physical id: 4=0A=
       logical name: input11=0A=
       logical name: /dev/input/event9=0A=
       logical name: /dev/input/mouse0=0A=
       capabilities: rmi=0A=
```=0A=
=0A=
=0A=
If there is more information required, feel free to ask, I am happy to help=
!=0A=
=0A=
=0A=
Kind regards,=0A=
=0A=
L. van Teeffelen=0A=
