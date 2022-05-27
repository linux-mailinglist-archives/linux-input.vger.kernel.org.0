Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF77535AB6
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 09:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234967AbiE0Hv4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 03:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbiE0Hvw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 03:51:52 -0400
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A305C662
        for <linux-input@vger.kernel.org>; Fri, 27 May 2022 00:51:50 -0700 (PDT)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24R41IYA019036;
        Fri, 27 May 2022 03:51:45 -0400
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
        by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3g93vatbkq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 May 2022 03:51:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzAvn5c0Ipk9yf+Bc0W6zDrtLWSWF7u8of0N3zKKy8+b6SkHGHxfsPUETiVrwdh9XF916jLTLCk75Xy+vKQnyBY8CNdzmztHLaOI2tPIb9kksTAzwiWL/hH/qc2D95cnRmOZuMTdpbxJeJePHuKCyVnDvBT2ZBgzzAWzUMGwQaUkVwpQ+Vs8evy1adRagbmJgYlGdo4+uz5oHk5ikQ09KQhtnuaZ2E8dgIDbRg+fU60Mqv1tQGU9BHT4nZ9vdpaaIeZqidZ+YbkN4bN7Dp3vfF+53D9Sr4fQUK3AmFsLNSGCgZ9ImwoqFNEYpMJ+r1BwDfx+cB+f7N863mDsjWokpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHsKebCz7f8z3OtFL6bNTp9/R78lzfQa4EPpa2BGvNQ=;
 b=eLPjH7NzrGrFHK+Qq/O9Va0jkDmr/9LCRZpLVRiK/5kkv2qps3mMA3LFW+TZDb2Tq8bn2JSHdLr30T8YpccIwcfriLXiRDxI0Vc4We3gYt0/Cn/WjdyxSEYIYH8r/RhU/1jWIiO/bkkaPFu9HjcIjRHbmaIcT+7Qr8OnNYANlMqYBciOz165lIXSHt+seVAUQDbfVmlWZvNLQzzjOfCAGRlBxPhXl3IhL+e6Fcc8oL1zs4ZnMA3PaXds0JtNFdEajGkG4CiRd4eXj8cFiJZhJwvcnLWbo5w1i/l1ibmkYHGUFvQwbJ9GuBqOXz8ZuyP4AhL4IRyThOAfYISIanUWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHsKebCz7f8z3OtFL6bNTp9/R78lzfQa4EPpa2BGvNQ=;
 b=1fqeV/pGCTOqaNhnhblRpXZwDyOUUx+84nXrKXGmtFbP7itUJAUOvHCGnMLY1MBjnqV51rdVn/wl3oWD61aosk2kAtbo6VvF+9vCinJpqBr4SB82qJapI8p5gK+yKqqwh2+q3Lkcp+ICCAh01eJtZAfpKbaX2fPcGpyfUi2k8nM=
Received: from DM8PR03MB6246.namprd03.prod.outlook.com (2603:10b6:8:33::16) by
 CY1PR03MB2188.namprd03.prod.outlook.com (2a01:111:e400:c610::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 07:51:43 +0000
Received: from DM8PR03MB6246.namprd03.prod.outlook.com
 ([fe80::15ee:3dc8:f7e5:d008]) by DM8PR03MB6246.namprd03.prod.outlook.com
 ([fe80::15ee:3dc8:f7e5:d008%8]) with mapi id 15.20.5293.015; Fri, 27 May 2022
 07:51:42 +0000
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
Thread-Index: AQHYX5OWMHq42+1B8EyK6hudoMqJqa0PzmBAgAAb5QCAAdLV0IAgvFMAgAABPvCAAAKEgIAAAHTA
Date:   Fri, 27 May 2022 07:51:42 +0000
Message-ID: <DM8PR03MB6246196C4684126F90D5CCE78ED89@DM8PR03MB6246.namprd03.prod.outlook.com>
References: <20220504084617.36844-1-u.kleine-koenig@pengutronix.de>
 <SJ0PR03MB6253FB12C55E309BA438BF918EC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
 <20220505074956.gmgdxfgvod7k2ind@pengutronix.de>
 <SJ0PR03MB6253FC31665D4ADA31A0A5458EC59@SJ0PR03MB6253.namprd03.prod.outlook.com>
 <20220527073508.x6ryljkozvvfvro2@pengutronix.de>
 <DM8PR03MB6246C0D8B4412C710D5962338ED89@DM8PR03MB6246.namprd03.prod.outlook.com>
 <20220527074835.qnbncnc3h2iaa4ik@pengutronix.de>
In-Reply-To: <20220527074835.qnbncnc3h2iaa4ik@pengutronix.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcm?=
 =?iso-8859-1?Q?lcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZi?=
 =?iso-8859-1?Q?ODRiYTI5ZTM1Ylxtc2dzXG1zZy1kNzlhZTQ0ZC1kZDkxLTExZWMtOTJhMC?=
 =?iso-8859-1?Q?00ODg5ZTc3Y2RkZWZcYW1lLXRlc3RcZDc5YWU0NGYtZGQ5MS0xMWVjLTky?=
 =?iso-8859-1?Q?YTAtNDg4OWU3N2NkZGVmYm9keS50eHQiIHN6PSIxNDc0IiB0PSIxMzI5OD?=
 =?iso-8859-1?Q?ExMTUwMDkyMDE2MDAiIGg9IjZGUE02djJmK0VTZTByakYyQ250YjZneUhQ?=
 =?iso-8859-1?Q?OD0iIGlkPSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk?=
 =?iso-8859-1?Q?5DZ1VBQUVvQ0FBREFkZldabm5IWUFXWk8wNTBFNHdWOFprN1RuUVRqQlh3?=
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
x-ms-office365-filtering-correlation-id: d232a87d-3972-473e-cbde-08da3fb5bd91
x-ms-traffictypediagnostic: CY1PR03MB2188:EE_
x-microsoft-antispam-prvs: <CY1PR03MB2188EE1326FD0D3E6ED56C7A8ED89@CY1PR03MB2188.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FdJ+fRuWjoJ+WGkA4QjUZMHYhckBORSn0rSR6U3clTZkwDOyixB2GaBfJq6h8xMRZceM28/BKjCWhh+UW4MUJZKJ6BhgagobnwWQR76PW5W94BEnHJYM7CKLxaAVLEJftcdnDXnthhFiLhg8pL0w7JaXm4zwWXh2U7jcAp2MAXt0cqFpyAdWhLnWZtn+GmYfUGAHSAdJcSuyVR0hoQR1uDx93fBngXekpxiiQb3v9iD10/eiJ0SpK6jyOYZI1icIxdj4b4bojhP4Mw8beo8Jnv/DvC/qVXA2vx8Vc9qoQUMJmQphl+LMAb7gaJaLBahYyCwhP6PbfsU9Gk5/SfqYnU5RhXXrbkfIUJ3vXU6CR0n5rCBeFdpTAP4yAuNzDV8cMeBRllBjdMnn+8NI+BCJcL/pnB+tZio42YWB2JdH/X0a6p2qoGOu3EFswmLgWw+fydLlfxLpAfv6BXiqRerr4ZzapawMpedD0ACPWTdcbJIA1hPOj3B3j/vvuSa7QA7oK+cGZYYWa6ckI2dorePYdVUqPTSGzFBfhS+/QCwgSaWyZZXKAql4mvUIGIHo6TcYt/urw/Nqc8tWX+bFaKMWrjQoYKq8+AXDFT7FNYToC/PcSbdpth6iCWwTRZ4ZXu25UzCzjWwiA65teuNwMGbbwinvhIpNH9avpXlSqCgGrvDJUwAVe5AjNo/sUDvCnbhpNGwPij/VLkf3FzGvLZXHwwC3JudI0Ict6emAEhjtXTh6IlYZpdPwspaScub19QDES1LShBEH/flVLZl4Od6QX5ea0q/cULsQmLgYHZXH3bA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6246.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(9686003)(26005)(86362001)(83380400001)(7696005)(6506007)(38100700002)(33656002)(66574015)(55016003)(186003)(316002)(5660300002)(4326008)(66946007)(52536014)(76116006)(66476007)(66556008)(66446008)(8676002)(8936002)(64756008)(508600001)(38070700005)(122000001)(2906002)(71200400001)(966005)(6916009)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FhYgzflB0VpMxHO+cbaK7ohGyi16/y9as5bPK3OI1shZkLV8c9moA9sI8r?=
 =?iso-8859-1?Q?EqTFYC3+iHVKxooyWufyNAVXErMZP5tNPgAv7j4RsDB3Kb5u4lakHok1YS?=
 =?iso-8859-1?Q?YK7ZjQPSUruK9A/9CRQhyHhJpvOM3GaO8qqbw8VNrcEViQ1GfbQ7ujCJ1k?=
 =?iso-8859-1?Q?bsnsT7gt4twCxvIkMLOPKQlwpJYehhHnleQS4cv9oD6lMTO0n426NpQk0f?=
 =?iso-8859-1?Q?OBn2A9PwSBBgx3Ph3zBFDojYSOwosjDN3aDtmAxlQ80COLRLeph0zI4Zj5?=
 =?iso-8859-1?Q?xcD9+JZG7NOdX9VkXvnadh467q4LOMa9IBgfc9n/UQpQirngky7yeBNbJw?=
 =?iso-8859-1?Q?sQSFyexOWh4BCEogBGc2h7+EZK0GPCTSCxjbmMv2KA4LYX5cEJKapvcinU?=
 =?iso-8859-1?Q?Z3vACH67AlYIWSnB5elOC5ZT4BVy1lt4bglBqbSiwqaDeMVQmKHdC8zILZ?=
 =?iso-8859-1?Q?qA19v0lAx4g1ZH6/ym3SyRKs4mUwGZQozhRncgdJUMP3ITW7VhRkUDSp+V?=
 =?iso-8859-1?Q?HAirvrJtAfOUgpnEE3/f2WpgXnX+y3q2Tz2HSLDANRPpTtqlRQls+u1BVy?=
 =?iso-8859-1?Q?nvXo/IVoiHt1JAhbPYePdnMfrmXROrFi9cfdhFQzH63LbNu0VhQb0Ynr0Y?=
 =?iso-8859-1?Q?EFuIPFP1O2cxPzzuHrNibdMqy2HPClmmfz0gVCYrWLUpCfejg+0TxQXJaJ?=
 =?iso-8859-1?Q?Fp0VjUdHJzmATGa6Jf2lkEGz/zi89bb91nbvjw890iljocEZERirE94tRt?=
 =?iso-8859-1?Q?NZuGRNMllRZB5ONgKCFrvRVQZYYSL5LqxiIam/LQat4hGOKdo0U+Qa/98/?=
 =?iso-8859-1?Q?jcamc4xCsMqfpYT61LrDo4RycZr7y3JZgzXxmTkQPRCpNWM1DYDmXEcVq3?=
 =?iso-8859-1?Q?M5lxt07FJR4mBIBgsdqmRo7+ysLMSz49nzw8p8ZLO6z/HNUsLFd/KNXloF?=
 =?iso-8859-1?Q?u7cnStY5200lr+vC0yleSRJH3uGj8bAKFoP2E3I+A9BF92vbNSNhFy5/UZ?=
 =?iso-8859-1?Q?Xbe3sN+GqhBi2T7TV7wBxMYe/olmypSGjHI89B+cMNmY6bjIvpiw94KzBV?=
 =?iso-8859-1?Q?2D1/Ii55UkbNtZMbb491o+6rZ45WoSLZJmF3Pc5BtGmlMUIbglwq7TGRg6?=
 =?iso-8859-1?Q?WZqbPAFidSQ4EgTmTYRCp8cdmH56r2YCugLneF3XUBo6HAnOjtWI1plu/o?=
 =?iso-8859-1?Q?Bz9YK3yDKMJJK490AHLcbR+jMxeOSaEiKaFnXAdcx5MFWXsjsGwCkVozm1?=
 =?iso-8859-1?Q?XCqtp7GLQmRG/nU4Dv+ICzvz5bFleofNG7QNnwPL/5G6NJaxFnQ1FKU09z?=
 =?iso-8859-1?Q?AuIoWvm1ZRATzA4zS4j9Ia65KDDusgqv72geEZmVqg9O1zBI/dVgk8RGjG?=
 =?iso-8859-1?Q?2PCTBKSpuXfMvjTlyPBf9QBBap0zJXnam2Hje+LzB+sd4EZULG76iMoGzM?=
 =?iso-8859-1?Q?LiAaFntAkFfavfqu2WzXUk4mI8nVMFtMGAFhfYoN6aQiE+lWfanq2fzDcc?=
 =?iso-8859-1?Q?UdAIJwn2mDxUokeszTalQ8xVM9Z8bx/lrpTCxbAXGMxF/ma+GtvRce0d5r?=
 =?iso-8859-1?Q?9WB/ZAQmek692vZk6yPAAluIeRi47+09D3e+tFmWF3fwiA8+7xLExqId/A?=
 =?iso-8859-1?Q?TSRbkY/HhfA9kNJcFuY7ZWUXDfU5jsOkvnI0qpNgg0t39TY9ZrX/dFQIFz?=
 =?iso-8859-1?Q?k7bIF9sQiDpJBoiolF9IO8UhGrKJPfy2UUNpMSpexj5hd+TCl14LN5uNAJ?=
 =?iso-8859-1?Q?B8u9oL52bjiu/q7H2VnA/dX5C81O4jlIy1fYZDgCAQyJ6qYDSyIFslvaLh?=
 =?iso-8859-1?Q?vkM1vWMAt2YKzCCHzoUizb+b+tnzpgs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6246.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d232a87d-3972-473e-cbde-08da3fb5bd91
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2022 07:51:42.7957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h5dPsOyTk0YnBbA89HKWvXyqC28X9oJ0i90zf3YbknFGiHYWv9+5mWaoKCfP3wSHD1lid87XOyDifym61BjUaq7C0SiJqtp9pSGiJOBrWRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2188
X-Proofpoint-GUID: oNNMV_ielSbLorU8-zQ29Vq9KmW3KTh6
X-Proofpoint-ORIG-GUID: oNNMV_ielSbLorU8-zQ29Vq9KmW3KTh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_02,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxlogscore=813
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
> Sent: Freitag, 27. Mai 2022 09:49
> To: Hennerich, Michael <Michael.Hennerich@analog.com>
> Cc: Arnd Bergmann <arnd@arndb.de>; Bogdan, Dragos
> <Dragos.Bogdan@analog.com>; Dmitry Torokhov
> <dmitry.torokhov@gmail.com>; Sa, Nuno <Nuno.Sa@analog.com>;
> kernel@pengutronix.de; linux-input@vger.kernel.org
> Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
>=20
>=20
> Hello Michael,
>=20
> On Fri, May 27, 2022 at 07:41:59AM +0000, Hennerich, Michael wrote:
> > Thanks for the reminder!
> > The driver cleanup is still in the works. We'll likely remove the
> > platform data support completely form the driver.
>=20
> Still I'd like to get my patch in, as a patch I have in the queue depends=
 on it[1]. I
> don't know if you implied that my patch shouldn't go in, but if you did, =
please
> reconsider.

No - I Acked your patch. Please continue.

>=20
> Best regards
> Uwe
>=20
> [1] Current short diffstat is:  617 files changed, 642 insertions(+), 172=
4
> deletions(-)
>     all over the tree. I'm happy about every preparing patch that is in
>     mainline to keep the need for synchronisation small.
>=20
> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig          =
  |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|
