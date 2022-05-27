Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1497535A9A
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 09:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236239AbiE0HmN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 03:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232238AbiE0HmL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 03:42:11 -0400
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5BB57B35
        for <linux-input@vger.kernel.org>; Fri, 27 May 2022 00:42:10 -0700 (PDT)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24R41IWf019036;
        Fri, 27 May 2022 03:42:03 -0400
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
        by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3g93vatacr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 May 2022 03:42:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6OeYZ2IbedrXAAOA6rdu5MQgZ0zK1eXCigMITVENqRoVlR30y4yTHMF10r0tW9teibuZ7qh45ezbo8SxLLIYLNNWwsdlNydNDCqt7Zzpk9XNNKNw832l0As25mHo8K8NbZQ6LBSw9MNVt2FWORrBPyiJP0A0LNW5QHFe32CoPMXtb2KVCUGHSojBVB2DpZzxHYW0DsbINUO1BxmFZwcHh+NeWtu2eYd+CRIOnqUqOHfdbOTmx7gljsTfHT/xRpgyOJBoRb3fUnJqM4HHqcW+0XqeaMAf4vMjgagV+nulRSZIICl09T8nSZfBiijk1EprKym8he72cv2jjg013Lu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NiEg3BCPKfuSoMB/rvs07ji03+hTOW7GEUD8SEeVjE=;
 b=jvFtR+U59x2+Q+bktRKoVaon/bNpj2a9p4bXMAu8/LXrRvWIZb9PEPHcnvqLDDg8lQYG6Q2ymdTVjV4FJriKYH9BnpMJLMciIaPqBwwYZW48cIRoh3+ZYNZmmJ1JGhWdL4Ncw97yKnj3mBEwZnnpApuOjPPIIAIFGeRnsL4SqLu3VFIqX+mnjDwD0Re8I1JxRBrLBydHnADD+FvWn0gXqs78Wxfo9FoFGL18c+yPxEhTGXy1NCZ1ozun2+J3lrQRcTWsur9Rwh6ID0zvSe72WCcg0UANKhSN6xS7q/lQI6yq6XdqTRPIuMGTnwzw8a1KaP8DqBTKarOvRfmhPTh/qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NiEg3BCPKfuSoMB/rvs07ji03+hTOW7GEUD8SEeVjE=;
 b=DEJ06J5Y/c8aatjdX/imcllWa4JDzw+4SASLChrMp67cB4ErZPNUZaY658h3hPoDNxFW5jQd6+A7t16I6/8US16purnYR5jTs+0kpWzHBO3rdUDD+scNGiVD2pDtz+9Ng6nym86+PLYt/dmSIlsLD/ZmMsxgT60RvUJAxDRyE9g=
Received: from DM8PR03MB6246.namprd03.prod.outlook.com (2603:10b6:8:33::16) by
 SN6PR03MB3711.namprd03.prod.outlook.com (2603:10b6:805:3f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Fri, 27 May 2022 07:42:00 +0000
Received: from DM8PR03MB6246.namprd03.prod.outlook.com
 ([fe80::15ee:3dc8:f7e5:d008]) by DM8PR03MB6246.namprd03.prod.outlook.com
 ([fe80::15ee:3dc8:f7e5:d008%8]) with mapi id 15.20.5293.015; Fri, 27 May 2022
 07:42:00 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Arnd Bergmann <arnd@arndb.de>,
        "Bogdan, Dragos" <Dragos.Bogdan@analog.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Sa, Nuno" <Nuno.Sa@analog.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH] Input: adp5588-keys: Remove unused driver
Thread-Topic: [PATCH] Input: adp5588-keys: Remove unused driver
Thread-Index: AQHYX5OWMHq42+1B8EyK6hudoMqJqa0PzmBAgAAb5QCAAdLV0IAgvFMAgAABPvA=
Date:   Fri, 27 May 2022 07:41:59 +0000
Message-ID: <DM8PR03MB6246C0D8B4412C710D5962338ED89@DM8PR03MB6246.namprd03.prod.outlook.com>
References: <20220504084617.36844-1-u.kleine-koenig@pengutronix.de>
 <SJ0PR03MB6253FB12C55E309BA438BF918EC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
 <20220505074956.gmgdxfgvod7k2ind@pengutronix.de>
 <SJ0PR03MB6253FC31665D4ADA31A0A5458EC59@SJ0PR03MB6253.namprd03.prod.outlook.com>
 <20220527073508.x6ryljkozvvfvro2@pengutronix.de>
In-Reply-To: <20220527073508.x6ryljkozvvfvro2@pengutronix.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcm?=
 =?iso-8859-1?Q?lcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZi?=
 =?iso-8859-1?Q?ODRiYTI5ZTM1Ylxtc2dzXG1zZy03YzAzNTc3YS1kZDkwLTExZWMtOTJhMC?=
 =?iso-8859-1?Q?00ODg5ZTc3Y2RkZWZcYW1lLXRlc3RcN2MwMzU3N2MtZGQ5MC0xMWVjLTky?=
 =?iso-8859-1?Q?YTAtNDg4OWU3N2NkZGVmYm9keS50eHQiIHN6PSIzNTQ3IiB0PSIxMzI5OD?=
 =?iso-8859-1?Q?ExMDkxNzc1NTU2NDEiIGg9InBnUCswUHdBMkRYT2wrb3lvc0UvdExkZUZo?=
 =?iso-8859-1?Q?cz0iIGlkPSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk?=
 =?iso-8859-1?Q?5DZ1VBQUVvQ0FBQzVtbDArblhIWUFUb2VMT1U0aHNGYU9oNHM1VGlHd1Zv?=
 =?iso-8859-1?Q?REFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFFQUFRQUJBQUFBSnJqSklRQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBSjRBQUFCaEFHUUFhUUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QU?=
 =?iso-8859-1?Q?c4QWFnQmxBR01BZEFCekFGOEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFh?=
 =?iso-8859-1?Q?UUIwQUdrQWRnQmxBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQU?=
 =?iso-8859-1?Q?FBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdV?=
 =?iso-8859-1?Q?QVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURFQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVlRQmtB?=
 =?iso-8859-1?Q?R2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dCdkFHb0FaUUJqQUhRQW?=
 =?iso-8859-1?Q?N3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21ldGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0ff9ba8-08ec-4774-9f38-08da3fb4622f
x-ms-traffictypediagnostic: SN6PR03MB3711:EE_
x-microsoft-antispam-prvs: <SN6PR03MB37113E25D2076453D133AF9A8ED89@SN6PR03MB3711.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nQGioB3Xrv5TX0dUHpWF4OOjrqs77ZC7IV+PofrdPpYjeRbotT0/t96vTZ+CIG/gyQ9YRLXoYjs4V6OJ8o1RYtO1ft/FPk6dCmJdC1H1x9jjHwTl7ILGu/Xu8aRjfiMHOHb0fmXmIq049KQy3gb83m5HvOLPRhSKDaPW5WAvz3rTHZfIBrUVfqVpj0UuABxzWnm4sqPV6S1h81uvUZrNbxAsbYN2/d7OfrFmKvi2q/8sAJj6jD6A3ZM5qRjyzkZkyBBbi6H+n+tKahDg9TTTaGdEFV5xHnVlFsuQluzMyL7wdrC8w6KXunarBafQuc4+spjMmyO2gF6bzzAQ2NOs6K6nsJc4rYhFRe09nuuWAAsuL/MW3OiYuvDyg4hGvs9y6Zh5YPJ+GzeUq3cXZ3ND7P/FujdSply9JybU6E5comn3S4XUtihJSfuDHsxRVSoh6uLtlZX5eiAOXfmAaY095P13/FfFtbuOcGnkM86AIM4GWlj9g8zlnknHzTqTxDzddkzAXIgPJzyVr7dlGRncn++iokI+i2PHwuSZA57NNsg7VVk/3ONrmM3mcFNQyE8ZClqUjX4dJIy7UR8/+FXT+IQwHekPt88PRjABqfAmXZdTGHwx4Jci5XbTRBr/SIxQMaKaHT0y4LQWr4kUybcdkXOpEbMYA0B3uiLXk+wCYWiuRcNOdp7X18ggGlC8k/NvWPavW9UeHud2TTgGET/AM/FGnqDdI9tnxJVHPWT6GqEx+Lpp1XA4u2tPQ/zfIfwlZa2mejPZqso96ETEvKeKznEWI9vONuA31sjZQw8JBd5K/8TJPr38CEseOQ5XivqZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6246.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(508600001)(316002)(6916009)(53546011)(54906003)(6506007)(71200400001)(26005)(9686003)(55016003)(7696005)(86362001)(122000001)(38070700005)(38100700002)(66574015)(83380400001)(186003)(8936002)(4326008)(76116006)(5660300002)(52536014)(66446008)(8676002)(66556008)(33656002)(66476007)(64756008)(2906002)(66946007)(3714002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RQbl9MUvgea5EYcoRTTRfPiy30gWWI82rVS5CGgceoIVmLRDCzNoOirRmt?=
 =?iso-8859-1?Q?LD2xpDb5TnTqtsc2m/wLRLfZzqLst9rg61TRCuDgqvWZ27v033y1FmFys9?=
 =?iso-8859-1?Q?NCnHaRR5AQ2ipysJOICEf3BWkj3RVeC+UQKaf3Upbxs6Bhbta37RO/SLgc?=
 =?iso-8859-1?Q?nwk/LA2l+7d2F7TD3qiThP4nrQ2ESZbJyoAfBkbEvztL9QUml/KqMQJ9tU?=
 =?iso-8859-1?Q?R28iDodcLytUotn4AIt6Hw6KUfgI3X1V5l0j4a4FAkcZfCfggZ0PZYNq7B?=
 =?iso-8859-1?Q?fp+jT2WeEu+WV8qrFMuPDvb75khcYDycTc2oLMelcZZ2KGUjCGt/C9IeIF?=
 =?iso-8859-1?Q?YDdAGdlDYwD2Zra2ZyBusKJLe2O4DnZg4CwfXXOLyhcduAt1RskDtuRQJC?=
 =?iso-8859-1?Q?Bdzyb9YmU0Dp6ESCik2apmBEma7h145sofbzhyTkXp32dHtGX5z5/F2znY?=
 =?iso-8859-1?Q?a6Fda0/crze0YJQDNSmZ9Q6aVMQuP2m90IzPuu9JLyZ/ShWbkv8IrKV7fe?=
 =?iso-8859-1?Q?2vHDIWpyyPLKsnZYIltj0+C6VSwtlh6URpNDpR0qDOw6wi8R14x9+0k5/I?=
 =?iso-8859-1?Q?sFZn1ImKYCEhNzFYiHv7rmAOS+z8cmo0zMOI7dvpvYl5M6YAhP2TgPZ0MV?=
 =?iso-8859-1?Q?jiOH7LetkSebgNmV/H+3T7/5lqGRTBcDERNXxFB/EdhcVLetz605uce80n?=
 =?iso-8859-1?Q?4qJufQ2/b1Vga74s+sBtsV1uTQwa5gmv5wNEfOOnSXa8KFPtQt3a58sdWn?=
 =?iso-8859-1?Q?hxKLQUAdF0piQH5+fKfZjox4WkS58q4qlaNWEN6oQiHmzegBZTe7dOj+/g?=
 =?iso-8859-1?Q?VXzfK0OSg8vNMfL+PxCJElOsRFDJoEngYWm0Q8KisSxqLBOHdrlYGHRYXe?=
 =?iso-8859-1?Q?VC7PztnfoxRba0aky0p1i7Q7LEK8t/SF1wuHkYzPUjdGaN2T8UpOVkGeOt?=
 =?iso-8859-1?Q?Hj61RhIt3JeX3+oA0WXCqR3YHl5D2aks/4JXVomdJrfIfOxt5hRuAQ22ub?=
 =?iso-8859-1?Q?OvTyha4JKEbwdPkzFeEXGymHpuuk7okab190Y0nzeZy3CHBszK43h7vC7S?=
 =?iso-8859-1?Q?FR7IyIX+cox8VwmGVDOMuj5F9ZynWDCRI1ukdfAWvETL/7WEvtWfpcdqHz?=
 =?iso-8859-1?Q?i8j7dT3KchqqIDS8FMwWNTIjJi4GqC8ONTpT/zX+1gtrOtzjO3lnSJ7XIk?=
 =?iso-8859-1?Q?GPUGHprcfqjcfXJFw9gYDpqTXELzZyxxHT9ousGOw+KDiPAz7mglfVVOwJ?=
 =?iso-8859-1?Q?ADZ8nn3y5PSwzjPeO7tswVt7cD/e1LITEKkk5Hl4Hpgp3BxOCv8Un7lpft?=
 =?iso-8859-1?Q?KxagFKpoBx4nfExFhe5YLMmD0dnmp1qgnhUSG6lf9YKdRyIUZ+vVPJmjtH?=
 =?iso-8859-1?Q?Rit0nScz6G0aRajtkvHX0Z9p3B8OQESe32zogXc8YboqN+gD+nc4JlODHE?=
 =?iso-8859-1?Q?bQUbgAk2K/LpOEoKknyOqwOgRvdjt/31//4wZgCbmXy9GQCWDcFkQmaQcK?=
 =?iso-8859-1?Q?YlKpInhBqynbpQHXQY0hhvPfJjLV+etR7jCDTd+foLs/aIsb/EraBRYn0y?=
 =?iso-8859-1?Q?RztEaHv7frzWZbyPytXPXf2lg408Dmh5IUu/HMAQMjF2Hp4KoWDYPvovqi?=
 =?iso-8859-1?Q?Q5mKNLEX7Vc/vSlHb/jKQhgZ4MRue2Cg55zzmvFji8qhdj6fzD9JlV3hZZ?=
 =?iso-8859-1?Q?8GBW8X/d/fm46uEid1/q/R5ooKtB/PVSswa0HMaTywo4Gvqxeqt9RXmKvz?=
 =?iso-8859-1?Q?mEBL3nOF1Di3Ew2BzUWGeVrMh3yNJUxAgxKQ57Z+PWI0TeuSnOfkvjjP5m?=
 =?iso-8859-1?Q?RQS+HauKDiqudbFZJ1v4R0lcBjFIOXA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6246.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ff9ba8-08ec-4774-9f38-08da3fb4622f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2022 07:41:59.9829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cq4aB2elcokB9+0CmXWWLPYZ2ILnMAAhveg5vMpUcDHwmOvcajTn+b/lIWMzEdwp2yleUJNrCR8CVpfXlgF16+wdsVAn1nJaDyCg8Vbjh4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3711
X-Proofpoint-GUID: D8bhZ82W9mvtSHtjQiE5q5ArGOD2Jcix
X-Proofpoint-ORIG-GUID: D8bhZ82W9mvtSHtjQiE5q5ArGOD2Jcix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_02,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205270038
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Sent: Freitag, 27. Mai 2022 09:35
> To: Hennerich, Michael <Michael.Hennerich@analog.com>
> Cc: Arnd Bergmann <arnd@arndb.de>; Bogdan, Dragos
> <Dragos.Bogdan@analog.com>; Dmitry Torokhov
> <dmitry.torokhov@gmail.com>; Sa, Nuno <Nuno.Sa@analog.com>;
> kernel@pengutronix.de; linux-input@vger.kernel.org
> Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
>=20
>=20
> Hello,
>=20
> On Fri, May 06, 2022 at 11:57:57AM +0000, Hennerich, Michael wrote:
> > > On Thu, May 05, 2022 at 06:20:22AM +0000, Hennerich, Michael wrote:
> > > > If we start removing drivers which obviously don't have a mainline
> > > > in-tree user, we would upset up many users of these drivers.
> > > > I agree on updating this driver to make platform data optional.
> > > > We could provide a patch in a few days.
> > >
> > > Just to add some background why I stumbled over this driver: On of
> > > my current quests is to make i2c remove callbacks return void. As a
> > > preparation for that I work on updating all i2c drivers to return 0
> > > in
> > > .remove() to make the change to void have no side effects.
> > >
> > > One of the offenders is drivers/gpio/gpio-adp5588.c, which in the
> > > presence of a
> > > pdata->teardown callback might return a non-zero value from
> > > pdata->.remove(). While
> > > looking at the pdata of possible devices I only found
> > > drivers/input/keyboard/adp5588-keys.c.
> > >
> > > So the options for my quest are in increasing impact order:
> > >
> > >  a) just warn if struct adp5588_gpio_platform_data::teardown fails an=
d
> > >     still return 0 from .remove()
> > >  b) make struct adp5588_gpio_platform_data::teardown return void
> > >  c) drop teardown support from adp5588_gpio_platform_data
> > >  d) drop platform support from gpio-adp5588
> > >  e) drop gpio-adp5588
> > >
> > > Currently I'd go for at least d).
> > >
> > > Having said that I think e) has a net benefit. If there is no user
> > > left it reduces maintainance burden. If there is a user left, they
> > > hopefully will tell us, we can restore the driver from git history
> > > and then at least know a tester for future cleanups and changes.
> >
> > Hi Uwe,
> >
> > Thanks for the explanation.
> >
> > I know that there are users of this driver. But I admit, we should
> > have earlier made platform_data support optional and also add proper dt
> bindings.
> > We're in progress doing so. And in the meanwhile, I would prefer a
> > less disruptive intermediate change. For example c) with the promise we=
're
> working on d).
>=20
> FTR: a part of c) hit the mailing list a few days ago. This is good enoug=
h for my
> purpose, but to complete platform teardown (and setup) support, it must b=
e
> ripped from adp5588-keys.c, too. I won't do that as it isn't in the way f=
or my
> quest.
>=20
> See
> https://lore.kernel.org/linux-gpio/20220523083947.840708-1-u.kleine-
> koenig@pengutronix.de
> for your opportunity to ack the patch.

Hi Uwe,

Thanks for the reminder!
The driver cleanup is still in the works. We'll likely remove the platform =
data support completely form the driver.

Best regards,
Michael

>=20
> Best regards
> Uwe
>=20
> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig          =
  |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|
