Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10EBC661B39
	for <lists+linux-input@lfdr.de>; Mon,  9 Jan 2023 00:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbjAHX4R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Jan 2023 18:56:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233795AbjAHX4P (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Jan 2023 18:56:15 -0500
Received: from CY4PR02CU007-vft-obe.outbound.protection.outlook.com (mail-westcentralusazolkn19011020.outbound.protection.outlook.com [52.103.7.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E837DC69
        for <linux-input@vger.kernel.org>; Sun,  8 Jan 2023 15:56:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ll7SN/h51vkN1eZIMVjgv1kfIkoRsf25Dr6Q/+6hFYP67KEzHI9aiNOWgYLvqjyYB6//lg/pDhj35Fzvv9Q0S1LMbd56TRqTs/S3ttjwG0l6cW/VTl3a2st2LEP3ficA+VMGZpMcALlhRkZMSLzMyGFptJPVH65NyBTKbXDn6f3a1ngNuEpdKGhv5lu261yfGy0BdO33C5hG04E62EsASATzzN++2dMToO4YuPW8y3YEXwkBvoK/K4WBS4LWQiqUu8/VBVrVSidfGSA9+G6fu3o6yCzIGwS0qW5zrLQTTWAcW48DuJ8e9xVP+HEXOrCwyaUiDwZXN21G62LWjIUYjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYhc6qhm6rrcHJQ0N24bJ0Doy+Vi6wa3dsPJKCcNKJs=;
 b=KnMQ93i4rOaPsdhtktsJ/ds8LtePupEWESKSaNXaKR5NSHfEFiwkZajTXMYbhPtafpbtYJL22ZMpFmog8Vl7n+Kf+m0inaYvIlqTd3T1/7b3IvdjklO2jnfxEjVbMBdvLRqJH2hc+tm3KU1iNqBVKonxhTAQf4IKSBLC9KpN078ScJ0JaVAxruvID30i8QFW7Umm2lAc06D1MkB1HfLIgh5tJdD8NYF/vM93T1VBXzu1WdG7eS2AQzcDDYKSkV3AbzScH9Zo3qdOOLRdkEhFgOvqNQj9nPwJji0t1Y5pmYWhtTNy2843darBX7RUI/0FKbbwn8AVgJJhJVLKZoZheQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYhc6qhm6rrcHJQ0N24bJ0Doy+Vi6wa3dsPJKCcNKJs=;
 b=bcZmVc+qprRu++gRj+y5X0RAMFTDm2N8Hh6KJDJcLvvc7/o5ZbU2qirLIG9Hq1ZEJk0WPlQwhv/ovajkx4n6utcTGcaGa/AitieB04Pe3IHVqb1UleyUgNbzu4K4YX2GV3aMpwVhrmO/Dmo4cKRddaxXZyqbypVIqcDb+iH3M5SURuzfwx3btv1ZyanaUp0WpGuy/0c7JT3g4TJp7BByKsu63DNdwj3buc3YJ8sPhzRWCjceLUNOhY1Pr3hjcOtR6tTJY4hoGaok8GU+1fA/aI2unk8wKEvbRlNS7kjboOAiIS4SZ9nVT7m3+guC6nEVhZHiupbDNDM7pmOI8DVmTA==
Received: from BYAPR05MB4855.namprd05.prod.outlook.com (2603:10b6:a03:4f::26)
 by CO1PR05MB8586.namprd05.prod.outlook.com (2603:10b6:303:ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Sun, 8 Jan
 2023 23:56:13 +0000
Received: from BYAPR05MB4855.namprd05.prod.outlook.com
 ([fe80::6e35:ee2f:8d5b:e602]) by BYAPR05MB4855.namprd05.prod.outlook.com
 ([fe80::6e35:ee2f:8d5b:e602%7]) with mapi id 15.20.5986.018; Sun, 8 Jan 2023
 23:56:13 +0000
From:   Vanduir Volpato Maia <jackmcslay@hotmail.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [HID] Fixing support for USB joystick Hat
Thread-Topic: [HID] Fixing support for USB joystick Hat
Thread-Index: AQHZI7C1CVF3iToXMEi8urhfOlgl+q6VMgWv
Date:   Sun, 8 Jan 2023 23:56:13 +0000
Message-ID: <BYAPR05MB48556359FC6E116CE9D63696C5F99@BYAPR05MB4855.namprd05.prod.outlook.com>
References: <BYAPR05MB4855BAFFBAB3618D2E7A4418C5F99@BYAPR05MB4855.namprd05.prod.outlook.com>
In-Reply-To: <BYAPR05MB4855BAFFBAB3618D2E7A4418C5F99@BYAPR05MB4855.namprd05.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [ZVCs8xOBe0iWUktvcK2fbtYDq0tmbPvw]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR05MB4855:EE_|CO1PR05MB8586:EE_
x-ms-office365-filtering-correlation-id: 70a635a8-7c3d-4317-4e64-08daf1d3ec8d
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G9h0356IM5oO8UbUcyn+gUYUx2oFnAAAQEfJoerOpW1Pk5/w6Hf2f/YxhJjGx6flOLE3S7EcPDyfV9EnFbJIuZ32Vj/MSO9/wo1ow8B7ZjD/+RbAMHBSMCxlaElWEh4lAjrIB8j5xySPq0Hx5Dg2GKEuU91XokN8l9Ca7wfEf7A6eBoQuZudftuTx2V1THjC/UWtazK3psrXxDNavHi+fNj9Pl0ACTXbFCpV8D/A+TR0Y7kEyCSv4eDct6QkhVIN+YFiwT1KXX2JP620U3iuQUFq7pfP6+UWrnc7ftzKQvKV9aY/4kKr372b/6Ki+5MUQdp+uzHKL+U3Ta2SJVrT7Fz/BjANCTCne3AZLFk4uWcyppZk960IUsVe/ju5VCKbDUlLn/UgpRBYXubs638iAZWJEKzmxLBfKH00Fp+xK8gQY1sV6I/QTQM+ddVlXd13mvdynsPSsfAdILpy6NRJUeFMvEnMZFjzn9Rx7DEI6VTs8gsmZJrJ7BqcHjFfv+s4jXzvASIyRKW+D278aMYttI8Wet+z7gQSOpFy3tCnre2Qp83HWE5mATMcKlgePenADr5qZlXdL7tL1jbusEdcWLmzKLs0FpIf3CkKkBocrE0=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?c9QyrIABjrl2YuxgCtdCliFJqu+aJC2I5SCbRFqFn18ptwiQM7c9xCeUX0?=
 =?iso-8859-1?Q?JJ+jTuNxMlOwfQVNG4mO91PLPgOInK7FScj70lHfGRJRlWCRG1phc4XZWK?=
 =?iso-8859-1?Q?lOGUKAA/h7XY7wloKnFuZAIVPC969skssupZyEERTIbjMYHwFe4rU/N9ad?=
 =?iso-8859-1?Q?ZzfvwM+XI54k5IQkjQoKTl3n3ZZFVJZme81JV4fTYbSIiuGb5qVc1XyagM?=
 =?iso-8859-1?Q?3GvMaZlQ27MDu3tAarbeDvav2TN/W9Ki1eH/f8nJndaUvP5YJp/RCVHWl6?=
 =?iso-8859-1?Q?3Rx3GsqePOkYhuZntPbPkvmUJFMSRKcJM3xSlBS/34rfa6HKWbfnCqaAvi?=
 =?iso-8859-1?Q?KxWD/vTwR+Xn94AxLvn0MYrwC0xS639YQYMVZIjKSorNhAliOh8lDKRNLa?=
 =?iso-8859-1?Q?CPFUgxqGrv5wMj//bE6VeKNmzOaPCBEofNA5iL7+xcJwEoNWSz5E9zagk6?=
 =?iso-8859-1?Q?csm2cy6TXEHawEsH8C0liaBkVUyTPsM/nWGFyPDosJrAnvabNn1D6VzkaJ?=
 =?iso-8859-1?Q?bIzc/t3TyqGJBTgGmzgjIZfwxLBl9m1as6J5g7+z5Ljvp5W/TUKpbbLuGE?=
 =?iso-8859-1?Q?Ew3SDJXu6GaK56z8o821l8ltkr8XpkG4qnvYblcP9AwWPNp7SD2YlY1U3P?=
 =?iso-8859-1?Q?qiJh7hCNP+Cn5iTbWZjOhj5keQ3r71D7IeUpT+RCi4FYDQh+bOCWpLBgd2?=
 =?iso-8859-1?Q?6d2v3QZvIdMqe+Y/YHWFLQhyh66CVOy3gDBMBV8Mb4LbYm5qd/VgiiPVMe?=
 =?iso-8859-1?Q?gMoj+zTp3+gONA8gQ3VO6eVOgMQ1pBavG/nf1u+qofe/4NBv1p9gyKh00h?=
 =?iso-8859-1?Q?h289Gn36JleNuATS72KIlj0HBxvU5vlPbDW1G1uJHUsNlHl/JAHPmnJxyt?=
 =?iso-8859-1?Q?g6uP4ztrc3Mwv9hjQoMGFqkelcILCpsJNCAQOkAfVf1fWZy1gMD8vnuANU?=
 =?iso-8859-1?Q?Tp7aLZI7lEZaxj050L+3z95z09MiSb9CeIJ79WoUgeCUGUXb5MZxZXFqIW?=
 =?iso-8859-1?Q?HdF94AwJZn9mCSsDTB3Qob4pujd8X/USgdJ/GTUomoSKGXprThRktl9zD9?=
 =?iso-8859-1?Q?+qHs8KsrpeAqKx098CyklmZLKg78WuZlv4mzpUcQQ9bgv1mmJvD7H7e7fo?=
 =?iso-8859-1?Q?JxzlVNUinxystbIFhGiMO1+qHXndus388ylar6nm8o6Av9ryvf+Ef/YheT?=
 =?iso-8859-1?Q?WDR8bHON3gSqEYzxeaJR7eivGekPPS4HZ68yccutTS/dIQBdVvrtKcP2T5?=
 =?iso-8859-1?Q?2p0ScPVec6L4/Fp4zrWxsS7Zcbb92+fz1JsyuHgZWPMDNSlBL4vaPc0O0i?=
 =?iso-8859-1?Q?AaiJrIcdOP70KzzOS8BqTLEdoA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB4855.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a635a8-7c3d-4317-4e64-08daf1d3ec8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2023 23:56:13.5267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR05MB8586
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I have bought a Flashfire Cobra V6 and it turns out the hat does not work p=
roperly under linux. The hat reports as if it's a single axis that remains =
at a given value depending on the direction I press, with Hat0Y being missi=
ng. I've investigated the I/O of the joystick with Wireshark and worked out=
 the output from the joystick for each hat direction: =0A=
up: 0x8 =0A=
up-right: 0xC =0A=
right: 0x4 =0A=
down-right: 0x5 =0A=
down: 0x1 =0A=
down-left: 0x3=0A=
left: 0x2=0A=
up-left: 0xA =0A=
idle: 0x0=0A=
Which seems completely different from every other USB joystick I've tried t=
hat seems to go from 0x0 to 0x7 with 0xF being idle. =0A=
=0A=
Can someone point me where do I look at the source to try to fix?=
