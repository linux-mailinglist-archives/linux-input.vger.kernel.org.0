Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B673662310
	for <lists+linux-input@lfdr.de>; Mon,  9 Jan 2023 11:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237069AbjAIKVb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Jan 2023 05:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237086AbjAIKVH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Jan 2023 05:21:07 -0500
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1038FFF
        for <linux-input@vger.kernel.org>; Mon,  9 Jan 2023 02:19:02 -0800 (PST)
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3096A3lB031354;
        Mon, 9 Jan 2023 05:18:52 -0500
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3my68cfeps-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Jan 2023 05:18:51 -0500
Received: from m0167090.ppops.net (m0167090.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309AIRKr013870;
        Mon, 9 Jan 2023 05:18:51 -0500
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
        by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3my68cfepn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Jan 2023 05:18:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBWBc8e1jy8m5ix0elLdEN39Gf1az0TBY7WsCVvAQvCaufOK0hmFqKs3IQ8wS36ibFKyzjBx9B/4UbupqOYDkAo5icIc4zB2r1kTT30xqCaqxCe7F/U56b08oSntFoskyYECrvgFiu1IBJH7hG5RTWOolm81kxx76SLZuATq2DXtLD/yK7ZWg++Z5loPWzASnFs8YrQwmKwnVOg4JA3Y7jrrk+Lc0rWvGPw+Vu6GKcUVsfqL53S+U2izWt+6xnriZmb+fdHXmgoqdxMbhsm6JY+6p70qdcyeHvp5uo+yyR2yFbbxBY3Gls1zP+zJxp5bLm5DNemiWReJcTpIB2G/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDbN1bstVUxlJ5DgHQAFZNBy4JWZuCY0eRDUsE6oujw=;
 b=A6gpfk1D0OeOEHpoUEl+HDVfgxK9FTTNOprXJYBiZfzu0dKkCGHoExWuyd2IaGpJD+nOkQ9Me9HeH297D/4pQyeGmw/v1uMdAT90qtZfieJJDAekAl6gSz7RBmDvA+/t8IwsvVSAyjR2B11j1OmD9+uifCtpnmWTwiQJpln3sv0ZOwbV+hZEkVclFBe1w9f9Uif6DVERdvE2jXO0XxsMGuPm4/jjZUUNuBEBwyF9riZUqCq13YWx6cdSZNz5nC7ho3cenJpVxq5ASKVpqXvcQqPmsA+Q6OHRT4aEHvdxKzPiRZF7+yjCtO0rt6584Irpd0ki3vHZyH1WDeCYTPU6dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDbN1bstVUxlJ5DgHQAFZNBy4JWZuCY0eRDUsE6oujw=;
 b=LEIDyjt1fWrQNpB4CTpzlfxjm4v3cFV+4K3AXFHcCEpoHHaC9w0LYkXfHAB6Hmccc91C1wBFiQeCGdG9I6uqOgrOAM6GD/UohnPTOM3aXvrqZsGnF1uyG7xMRvhSZsG5iA42lwq7HaHyzWeFH8knIRarnlfTgrJdYbSWJNhGdtc=
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19)
 by MN2PR03MB5006.namprd03.prod.outlook.com (2603:10b6:208:1a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 9 Jan
 2023 10:18:46 +0000
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::9605:ca84:2a4b:643b]) by SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::9605:ca84:2a4b:643b%8]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 10:18:46 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     Jonathan Cameron <jic23@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: RE: [PATCH 30/69] Input: ad7877 - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Thread-Topic: [PATCH 30/69] Input: ad7877 - switch to
 DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Thread-Index: AQHZHtT2g5Xp/DaED02fzKa8EVSEc66V6aXA
Date:   Mon, 9 Jan 2023 10:18:46 +0000
Message-ID: <SJ0PR03MB6253A82E28F323773CF4FCEE8EFE9@SJ0PR03MB6253.namprd03.prod.outlook.com>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-31-jic23@kernel.org>
In-Reply-To: <20230102181842.718010-31-jic23@kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcmlc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1mZWU1NTMzNS05MDA2LTExZWQtYjczNS1iY2Yx?=
 =?us-ascii?Q?NzFjNDc2MTlcYW1lLXRlc3RcZmVlNTUzMzctOTAwNi0xMWVkLWI3MzUtYmNm?=
 =?us-ascii?Q?MTcxYzQ3NjE5Ym9keS50eHQiIHN6PSIyNTEwIiB0PSIxMzMxNzczMzEyNDkw?=
 =?us-ascii?Q?ODg4MzEiIGg9Im5RVDZDZUJRN1FiZHdWOGRxMUJVWjZIQm55az0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QS9pVHpCRXlUWkFlSVFKRzRDRkswRzRoQWtiZ0lVclFZREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBWDVsMkt3QUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
 =?us-ascii?Q?UUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQmxBR01BZEFCekFG?=
 =?us-ascii?Q?OEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdrQWRnQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRR?=
 =?us-ascii?Q?QnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURF?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVlRQmtBR2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dC?=
 =?us-ascii?Q?dkFHb0FaUUJqQUhRQWN3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21l?=
 =?us-ascii?Q?dGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6253:EE_|MN2PR03MB5006:EE_
x-ms-office365-filtering-correlation-id: b8ae4613-a5e4-4128-2406-08daf22ae49d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5fDxgQ06fBkDkI8c/tFAM1oTIgy7YQfdcZBHm82sn/YKjHqctNOcUEmufXTS1WJkDgyx4ab2Nzro/S2s/D/w9RFp65BXxFc3zGpE2jts6o0k/nPhUJsLgX3rtEQSv1nIpliKc9AmhL0fBFDcfgqH0dMvMIKRUp4TvFZu8zk6RbLPszorxtNBjew6wWehBd48YOExQGHC7iZ18t6K0BiVEug+CPuFxPMNY1C/UkYIZ5+Al90ObMYNJys1fBBLboQju0KS4cQsKjVi4qBLui9Z/ShUnEGofBEJjXrXaKxsZwQq2TYKh9uxyG/ATDTpTUHnOdAgHtaX7hiyGtyzzRZkO1OKIm0KsSCLVeJeB5JVwnNSHEtkA1ZR7f7sp2qQPe8e7i8xvImBfEGsS5JHZddalgEsY82fUxHEwwk6hxCqjJjBHnBM62Kr8QyufTfXHno8qTcKNGL7KeorD0pG1VCtRfe3gxvFIiQSVTXlWpblNnu4ffi/AKAL2aJ4rb2Jd/3n0TZaz1dfYPNUVuXH7WDAo54RGtVncxVeXbXzl/UnRIRRomAs5+5guHQ/1jfsJe6hrYwh2XGSBBtwwsLzphvpLe1UcFGOOheXAiEDETJG2RNuXBYGAe/tviMkguUvFVnbA/ecAuVW26CzSxJRdd/yMZqM+tJYyEF7K5Hl6P9COXdJU+NuTdy7lfnV7uUMvOopRc4bJteWzciSj61JZReXbQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6253.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199015)(41300700001)(86362001)(8936002)(83380400001)(38100700002)(52536014)(2906002)(38070700005)(110136005)(5660300002)(9686003)(53546011)(7696005)(66556008)(64756008)(66476007)(4326008)(26005)(66446008)(55016003)(316002)(8676002)(478600001)(186003)(6506007)(71200400001)(76116006)(122000001)(66946007)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XOqvS3j2z8OiJjiYrRXfyQnR0LSXkBZ6LGARxntKvLIZgsGW5UDQuaH9/5iO?=
 =?us-ascii?Q?T8NFT+SbQZLhlmCa0cFiMe7/j2q6eZerVOiIVK4ZCDrL29urrTPSb/Fl4Jqr?=
 =?us-ascii?Q?kIoTPV/TkGdri6DVsRkaCG8YkoTTig90UhbhwNILYY8UZ+cCg6Gdh+X1wrH5?=
 =?us-ascii?Q?NqF1A89/zak1naAEh76vyI81Au9PJqDLEhOt7/I64fapU5yiahkLnYFnUgrf?=
 =?us-ascii?Q?RD67nRHWG1QkTN1LKKg5owrPv696n3f71m36q29Mt405t9Z1f/hGYEPwvHML?=
 =?us-ascii?Q?natmJGxoy86qTrVPBuH5L2li695tZtBwtFqDtC8ixXz6ENwv+9YyHZQ/mThc?=
 =?us-ascii?Q?DO9gR1i/Fe+zB8cDloLscyV7PAk+DYZ0OsTE6rMpztIeexIT8VHzWpxu2Qn0?=
 =?us-ascii?Q?cw+vVi3TgcFNDCr/ITyxrlYd1k7kv3OuEfcAPfeA9sGaA6njY2qNBlmJr4Wo?=
 =?us-ascii?Q?0VNEPkWg6lCz6Os6mPRJtSWpO3NOEuAUwjuJp1nkO8UqmSfGjqurvC1C1mCD?=
 =?us-ascii?Q?p+msIdG/2p3pjX97Zt1tnDpmcRR5GkStC+mzYooq/fGCi/YXxWjHpRpx/AnM?=
 =?us-ascii?Q?udOvDMdlciF6RkEoMBdvoU5ZRAFDBZt1Uwd9h05nA5GJiU0hwUC7ph0daIb2?=
 =?us-ascii?Q?nV5yJ3obAlavbSHkur4+3+/CDUaHaAZi3oA8MHcXXJdOCyqGAZp+PdgMSFLq?=
 =?us-ascii?Q?M9YE3r681LWB9WiqFGlcgIqnFnFp6bx8HF8rj0chhyEh54dw/n//Yfy0sah/?=
 =?us-ascii?Q?icoIj//PnPzxITMSnSEuML5YeSAgnYKTTcZuoRAtBc1qVHFYBscVTAX7yPcj?=
 =?us-ascii?Q?0PHp5/c8DUo6MLSnWrnsIt43W3tofFQ9VFVCR5R9XIaio+Gh49P2yvNf0bn1?=
 =?us-ascii?Q?3MF3M0cUbPPizqBdS46WnRjZZOxTBN9+K/WnMcHWiZZ2u9XxBR1Q108/4cqt?=
 =?us-ascii?Q?jYuzlB+gqTYDtllh4swaZdmshC4fywfiqfYv41+UXmMmDJLDevyhozClGoA3?=
 =?us-ascii?Q?Yfwx20p9tUiPMpMrZIpnp7e15YaaM3y7SlrO4Co8JiwEJGB2O/zRulobo9Kt?=
 =?us-ascii?Q?OEm2lGLWYmNvcUSFFGdM38kMPcRtYlBwENLMI6dLdpqMGsUPi/3qad7OvyYa?=
 =?us-ascii?Q?q3LEjtK4I75AErJw+SqugJHnJKbcAC0bk6pNEG/GTZjZgvigbEvHenV/4kx+?=
 =?us-ascii?Q?o5znTv9z+K23DRic752JkoPvLf+pyhQZUFzUiQGKz1TY93Kvq8N7Sx/DkUUb?=
 =?us-ascii?Q?W8JKbViscUuWSZX4+TRcJ/+pCvvCH+j7UKvBb29rEhgXeBaxK0Ye4bIA98kQ?=
 =?us-ascii?Q?WlSb8L9AGyuFTFrFAkzTKc5QXi6NNV4JxohHlCIiXa5fxAXFLDDdUpHl23ZT?=
 =?us-ascii?Q?8bRo1WVlMgFW1sFAhuA0MXNOpuvkHWDJzijuNS3OdpT+obzuGG5Ixiez2W2S?=
 =?us-ascii?Q?/nSAzQgM3ExrS4j7VrAvSgjG1jooYDa4ZfFfZSAa7VWzzHSjrHA4NNEyZ2cc?=
 =?us-ascii?Q?RrmJP6t0Blw5Q7AG2yr9Pazx3AKpfm/RuVxoTZtwOvz1MHNy7VnThwSJ5VuF?=
 =?us-ascii?Q?/Mf8RgHbtws1NyAHEpZVlPpvmv50nJkFPtxW93sGsi5jVkygpsp/Hnd4j2rp?=
 =?us-ascii?Q?zw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6253.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ae4613-a5e4-4128-2406-08daf22ae49d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 10:18:46.3929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: skO8bwwUEynOe2Ru99pefeJS9HzNMdIq9l8T04t5n5UM0+f5QEtf1GMK6FreWg/XE64wIF6i5FVw8RJWggtA6p+oTz1rJqDDkI/uZSW2d5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5006
X-Proofpoint-ORIG-GUID: PLeazcLh7PSBW1NzB1s5_8YfSP7PTO4Z
X-Proofpoint-GUID: tEF-5GOdbz2ZTVxTeQZU5wwPfqW4nGd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_04,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=704 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090073
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Jonathan Cameron <jic23@kernel.org>
> Sent: Montag, 2. Januar 2023 19:18
> To: linux-input@vger.kernel.org; Dmitry Torokhov
> <dmitry.torokhov@gmail.com>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>; Hennerich, Michael
> <Michael.Hennerich@analog.com>
> Subject: [PATCH 30/69] Input: ad7877 - switch to
> DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
>=20
>=20
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>=20
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection agai=
nst
> unused function warnings.  The new combination of pm_sleep_ptr() and
> DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions, thus
> suppressing the warning, but still allowing the unused code to be removed=
.
> Thus also drop the __maybe_unused markings.
>=20
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Michael Hennerich <michael.hennerich@analog.com>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>  drivers/input/touchscreen/ad7877.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/input/touchscreen/ad7877.c
> b/drivers/input/touchscreen/ad7877.c
> index 08f5372f0bfd..edb36d663f22 100644
> --- a/drivers/input/touchscreen/ad7877.c
> +++ b/drivers/input/touchscreen/ad7877.c
> @@ -788,7 +788,7 @@ static int ad7877_probe(struct spi_device *spi)
>  	return 0;
>  }
>=20
> -static int __maybe_unused ad7877_suspend(struct device *dev)
> +static int ad7877_suspend(struct device *dev)
>  {
>  	struct ad7877 *ts =3D dev_get_drvdata(dev);
>=20
> @@ -797,7 +797,7 @@ static int __maybe_unused ad7877_suspend(struct
> device *dev)
>  	return 0;
>  }
>=20
> -static int __maybe_unused ad7877_resume(struct device *dev)
> +static int ad7877_resume(struct device *dev)
>  {
>  	struct ad7877 *ts =3D dev_get_drvdata(dev);
>=20
> @@ -806,12 +806,12 @@ static int __maybe_unused ad7877_resume(struct
> device *dev)
>  	return 0;
>  }
>=20
> -static SIMPLE_DEV_PM_OPS(ad7877_pm, ad7877_suspend, ad7877_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(ad7877_pm, ad7877_suspend,
> +ad7877_resume);
>=20
>  static struct spi_driver ad7877_driver =3D {
>  	.driver =3D {
>  		.name	=3D "ad7877",
> -		.pm	=3D &ad7877_pm,
> +		.pm	=3D pm_sleep_ptr(&ad7877_pm),
>  	},
>  	.probe		=3D ad7877_probe,
>  };
> --
> 2.39.0

