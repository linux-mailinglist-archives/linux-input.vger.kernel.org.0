Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8983EE665
	for <lists+linux-input@lfdr.de>; Tue, 17 Aug 2021 07:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbhHQF44 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Aug 2021 01:56:56 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:63586 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233676AbhHQF4z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Aug 2021 01:56:55 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17GEos1c009993;
        Tue, 17 Aug 2021 01:56:21 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
        by mx0b-00128a01.pphosted.com with ESMTP id 3afd66vhjd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Aug 2021 01:56:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wa0Y4JKhVEpH13iTDRWb9sDqJlr2vxHp60zLYONIZ+IDX0xSlYZGVgEqQqP3CiI8i+vGeZIx96uOjIGYEjKtDi0jK81+ZpWr/HO+nhSOur3Gp5Fh6/rCEusBmzCZMf8ruQHcKGJxatzPnujVbfgHyqsInrKo9xmIWoXRcn3bWI7alMNOilMwGNkMQEFW/rNjD8kgwYYAWOa1VZ/SrnxSBX0NoEfzsHOLcmBF8EoijbMtKyTX3v8zrABZ2waWgFraMxKABYbPiioT9lrOIEMNUA8NwMJamnCkxnQLgB849wIHzuNev1lcYAyRkHMfmxlfKGMUTBwEDznI7uYCT7DgCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0tnt2dzwd9QKPDiSPpLHRBpQFujIjKr/PGgdGEehG4=;
 b=TZBnW3szZOo8Vj1YsNcbn3/my/n1AswYzY6y+MMECe5c6GxdbrC455EKjYeFuFY+bBbDdCQb5Kt9Uyiim8/oflz3ltABBWjR7PKdpj4vH8HCWehFthbNHltR6lpXuYULwZ5tugw44+wYTzrLpDxj1P5jTLDCdjZIrPPs5F7FmSTPBbOnI6tiIze4OyIaR2lCPh/NwYll2ZkXz1sKfZ19AUrcyHBQpDzRRp1N4xnkmPrR5fPbb1BPJHL7QwtgmkT7P+gTUc5EtPzgkpGNilYBtOFjrT3kapDT8Kx8xNuqatubsXKPRRszbbZKAYo984UsMla8sE8E1tezzQHa3kjXnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0tnt2dzwd9QKPDiSPpLHRBpQFujIjKr/PGgdGEehG4=;
 b=7t9GqVimtdzsL1zZ4ZavpEu4mK0jN4cDKNzwWjFYdEF0T4TvQrH4QsEezYgIgTE9PiUNLONusecN3VjIuD53vhEdQMmMuSwbEU29Ue/xk8IZyjrqKhydJ0f1x8pAmh662dvK/8PL7RvRFnESXoEKiHpOpqQx1xU+DIfHZG+/t20=
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19)
 by BYAPR03MB4278.namprd03.prod.outlook.com (2603:10b6:a03:78::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 05:56:19 +0000
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::eddf:aaa8:b906:9bd0]) by SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::eddf:aaa8:b906:9bd0%4]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 05:56:19 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     Alexandru Ardelean <Alexandru.ardelean@analog.com>
Subject: RE: [PATCH] Input: adp5589-keys - Use the right header
Thread-Topic: [PATCH] Input: adp5589-keys - Use the right header
Thread-Index: AQHXkvaGrvH90oqFZEyF5ifvD5ry9qt3MzDg
Date:   Tue, 17 Aug 2021 05:56:19 +0000
Message-ID: <SJ0PR03MB6253F2ACB2755CD41B3C96928EFE9@SJ0PR03MB6253.namprd03.prod.outlook.com>
References: <20210816232707.485031-1-linus.walleij@linaro.org>
In-Reply-To: <20210816232707.485031-1-linus.walleij@linaro.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcmlc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1kNWM3NmE0NC1mZjFmLTExZWItOTFhZS00ODg5?=
 =?us-ascii?Q?ZTc3Y2RkZWZcYW1lLXRlc3RcZDVjNzZhNDYtZmYxZi0xMWViLTkxYWUtNDg4?=
 =?us-ascii?Q?OWU3N2NkZGVmYm9keS50eHQiIHN6PSIxNTEzIiB0PSIxMzI3MzY1MzM3NzEx?=
 =?us-ascii?Q?MTIxNjciIGg9IlNUOWpWNEZIcjFyZWcvL2hkMmRLR0dRVVBhUT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUlZREFB?=
 =?us-ascii?Q?RG56aVNZTEpQWEFjS3d2b1ZjOU1yYndyQytoVnoweXRzRkFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQUFXQXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBQk9ZR2NnQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
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
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJoQUhJ?=
 =?us-ascii?Q?QWFRQmhBRjhBWkFCcEFHTUFkQUJwQUc4QWJnQmhBSElBZVFCZkFIUUFhUUJs?=
 =?us-ascii?Q?QUhJQU1RQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHRUFjZ0JwQUdFQVh3QmtBR2tB?=
 =?us-ascii?Q?WXdCMEFHa0Fid0J1QUdFQWNnQjVBRjhBZEFCcEFHVUFjZ0F5QUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
 =?us-ascii?Q?QUFBQUFBQT0iLz48L21ldGE+?=
x-dg-rorf: true
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8ede177-f669-46a8-71e2-08d96143bc39
x-ms-traffictypediagnostic: BYAPR03MB4278:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB4278637558FBA84052D852638EFE9@BYAPR03MB4278.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gwQb+xPX+98uM616I3K1uhZF+oLqZdUnXJxY0D3EosdVW3YMZBILsXYnz694exo7+KmV/bzv4LiCTAWqQt8ItTFJm97itq2U6GWPuA/8ow5MltIst3S4kc7AJnqz/B9eXC2co8U6SN2MsRqwmWg6e0Y9cNtheQfiskLvkPDDvZpyPwEQbXSEFigmrwMPWyJDeAz9OfyOEwieJQqdpVNh/FZGHlwg7EDuyOY9i5KRqfzQ/ks33wx78Ueyy7TQ+Sk96/skHTo818BJlroDtJVyPBRDVOATcAPaE24pVQHLGMqRzJPJCMwao9/rAUSRfMRqWp0QDcD4ZqhM+T601uUfsgNlN7njikIE97LcLjvZV9UZmoAHbgVjfVWJ4lHLSo3wP9HnRWlwKoZQgPyySzr9VhRjYJNAWwMcdNUbQk7LFfQxGhhiFtt5fvZ5V8Sacf6DqhB2E6FWxP0wit7/8hL5pkRjZV8oEtIGTPP1uENPYAnrG4y0UMsrdxMgyVuwgoxTH2mBhPFQTx9J55UHCZc00SDMTqS6NxwIN13L8QtRAaHa6hVsBH3Oj/cHxcvqqkAvPGMYFRCxp5HE9bNy0vIukgQGD8O6Tx+dpQGjetO98YX98lef+2gY/32eSjQ7fUXc7K3VQzMEa1nMKZL8WPCSbrzwahhFxyddd2/0ajr2BMFd2IvR9pw9SULQgffolsgtamklaKjDFRkKow0qlGlrYw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6253.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(66446008)(64756008)(66476007)(66556008)(86362001)(33656002)(71200400001)(7696005)(66946007)(107886003)(26005)(8936002)(8676002)(52536014)(2906002)(186003)(53546011)(6506007)(4744005)(110136005)(38070700005)(5660300002)(55016002)(9686003)(316002)(122000001)(38100700002)(76116006)(478600001)(83380400001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6ok+zwT7seP2eugWs2Tp0e0S68mVSoCPd3ILd177eJQn9aia9k96g8QWb2qn?=
 =?us-ascii?Q?sBsz3KcunBYrQJdIBTqcm1rxQ2Iq06DxTunbA4ZEjDzFmh1gsUAX9yJ/Qos2?=
 =?us-ascii?Q?sXatRQuUYr+iGcedxLKTSK2cVPBcEN8g+Ea7h0qfnpeejM5r0Z/CaziG1rgE?=
 =?us-ascii?Q?+eb9ce6aUMX3MA/bFP2Id7hF5zVvW1gszPIEGfnpyP8jgPO4EYhRvYid+FAt?=
 =?us-ascii?Q?fSPgJp6GCjg7lsH64eYCH/i9gg0D2G+EAsINZtqHq7/3IPQaUE6SYUhGt3iy?=
 =?us-ascii?Q?JQMiwEe0zNzaHilZxXGPVqMBbRfUOvIuwbMhdXvRIC7eSExAgzPEItNo8Q+M?=
 =?us-ascii?Q?2COwcjcGxfe0C34UGcwhwIWLDiPNTNiTNVSybrjRuc5q4HmNmgcTdHBTwXAm?=
 =?us-ascii?Q?j4TiHv7/KCyqSAoe+25K75jp9ClU0Q7jCASVFNisi0cGGaRdSLFZCJPhQQwV?=
 =?us-ascii?Q?5Cqjk5CymQDeZjuvPeXpcS6mDuhDP+ya6aHpsH0Ef33xrPDlNSJwlWj410w2?=
 =?us-ascii?Q?H+jhcpTbBS4YVsVDHFA228SoKROgHugi2t/ycJrlCU4olzwJCmHMO++6JqZR?=
 =?us-ascii?Q?kihQTu4aI1f0H/raa23vcfiwjuHXt/XAkr+0TxgrB/2MljY+e4ZmNvuZgBHw?=
 =?us-ascii?Q?o7P0wGlEmtDmmwEVygsIsPVENqhqhLLtHQFradyR8aCEgM5asacbll1MH3r1?=
 =?us-ascii?Q?fcWfSvsIdndtd60BC/SuneZ47IsGQmnP6nNkS+rcXqWyTZA5FAwGvnqUs6iQ?=
 =?us-ascii?Q?6vg1GY3KASzUUk32gNI820YNnq2GSU5huM0t9FWzGFPiChaPTPByU5y5WGCw?=
 =?us-ascii?Q?LZr+k12IxHm+Jw7W8UBVrts3bYhNJ5pGKgtkNUNxFdw9d9vekwSUaCNbal3D?=
 =?us-ascii?Q?QT3IHSF9Yddlmyw5C1MK0mqw+rt5TnduYM+eRpKklTRn8P3XVyMN63kBSrQJ?=
 =?us-ascii?Q?EGSLSkks3xjyv6Ul9ToKYI85kZvloMAfGYSHh1VTLJM31b6XfccGiPlHs7o5?=
 =?us-ascii?Q?cFAd08C/6vGvUx/M/0KvVMOxC6zs/kgEvQpHkndzpXw4Ygkd9RgiCofJA/Ps?=
 =?us-ascii?Q?2aoXrZHb5RHkXtWfkqZMaF3/B1POByTKZmiM51HY9LYwATfZI7TjhVS4yr8g?=
 =?us-ascii?Q?RPlkVzKzVZ+euYtiGgnMC3W99QJXhTN1tAP2SWWUbmip3sCosqEzfdbSEAZy?=
 =?us-ascii?Q?RvnPEPBLROM/1luEdZcuG0Z1FEaKYl34r14P1Q5+dnx4OukaxCAKmW0sN6Ph?=
 =?us-ascii?Q?7UKZWSwqAQzyTLAtXug1/eBQNyqDLhYOOsPL1PoHRGzXV60YCKtHBGDghkrb?=
 =?us-ascii?Q?OL6KkLfpfSodC6Dk8tsSpoKf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6253.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ede177-f669-46a8-71e2-08d96143bc39
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 05:56:19.5960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xa9r5azn9HLjfu1hiALBVi9R+EQ054L16sUVRTUCi+VruTgmWhgvGqMWQG+7HogrVHlyrW9q4OiRMk53w4TVCzWMLs/p6PKmC5heIUy9cA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4278
X-Proofpoint-ORIG-GUID: 7yqSRS-r9j6fKtoF30j_Bc8jiT1V5xgN
X-Proofpoint-GUID: 7yqSRS-r9j6fKtoF30j_Bc8jiT1V5xgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-17_02,2021-08-16_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1011 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108170038
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Linus Walleij <linus.walleij@linaro.org>
> Sent: Dienstag, 17. August 2021 01:27
> To: Dmitry Torokhov <dmitry.torokhov@gmail.com>; linux-
> input@vger.kernel.org
> Cc: Linus Walleij <linus.walleij@linaro.org>; Hennerich, Michael
> <Michael.Hennerich@analog.com>; Alexandru Ardelean
> <Alexandru.ardelean@analog.com>
> Subject: [PATCH] Input: adp5589-keys - Use the right header
> =20
> This keyboard driver is implementing a GPIO driver, so it need to include
> <linux/gpio/driver.h> and not the legacy <linux/gpio.h> header.
>=20
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Cc: Alexandru Ardelean <Alexandru.ardelean@analog.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>  drivers/input/keyboard/adp5589-keys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/keyboard/adp5589-keys.c
> b/drivers/input/keyboard/adp5589-keys.c
> index 654e0476406b..bdd264459a97 100644
> --- a/drivers/input/keyboard/adp5589-keys.c
> +++ b/drivers/input/keyboard/adp5589-keys.c
> @@ -18,7 +18,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/input.h>
>  #include <linux/i2c.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
>  #include <linux/slab.h>
>=20
>  #include <linux/input/adp5589.h>
> --
> 2.31.1

