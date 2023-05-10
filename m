Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 550FE6FD856
	for <lists+linux-input@lfdr.de>; Wed, 10 May 2023 09:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236495AbjEJHfW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 May 2023 03:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236630AbjEJHfE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 May 2023 03:35:04 -0400
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C400A7696
        for <linux-input@vger.kernel.org>; Wed, 10 May 2023 00:34:41 -0700 (PDT)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A5N4N6007391;
        Wed, 10 May 2023 03:34:38 -0400
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
        by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3qf79e2su6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 03:34:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQfN4eECAaEUq6hoxSqLP6Qc7+aBjDn8pELvk8ZGuGtbBNcazvBB58WScxTUxjNwEfgQ/XFydGeleWKosoNC0Ug6AX8OTseLnWcqY6hiuz0R18+wx8RtwwVoT15cgUXX2zvCTh1Jo3RqZ2Exiv42jVkVb5QRHpZGFiYXn0h1hUJsfL9xrVu50wVQgPLkkQSlHu+jim7NBCHxoSeze4aftSlGbLzutBFHhFSbl3rpgphJ6vi+Pt1um/nC3/UBHZUU1yQdbKx36sSw5XhTWVEfEV83UUnzWI6PZYisaNoLt8mbGPZFawXMV3UFEKpnWBBdNGuZWhTLWspMA5glIjanDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvK66OdlU6vCyh1vMyvFYBXjyNzQcwn97EmfchjXOjQ=;
 b=DT7nYcoAElL6bqgBjZmkggx65ulbAhVai2xirI9zNvXOB273Dgc93OGqYHFUbpOjBFpkN8/ZGbpDnizZP1gh7L7YEpDAfYAjPU4IDtxMImfc6Kocf/zaVN90WZM1tn8ilC3vE9ROb2A4de6oRueq3u639Ew+/geXJtic1bSCUbSRsxDtVDEfr6Q2YL9uiOGrr6+NhnjO7+VfxOapeGHCPhbZo2tnUsN4f3IXzVIvvTShfpJpQyvqYmITgLUhuMxqC/8+Hk7Z7bODamfp/vr0LWyIHHq3BYrIIS7UWMnq+z/9ylTMC/ik4oD2kzKCfdrqzmfJk/QRUWoy8OdPCSy/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvK66OdlU6vCyh1vMyvFYBXjyNzQcwn97EmfchjXOjQ=;
 b=sidfYfcB27VxrVDRpVbiYBbVXQ6W2Jdm/EClqS6K1ee0TXxXZIHshHvQ6w1XW9KGBzb4x0ZrpvfC3+zJQNEGAxiJQ2E9IX0wacglqw5yU5j4Hlyu2A+FJGM4eP4gwIj65EToMPOk6TdCFLgszFZkPt77wRvMIqLFbF4xeH/j1rM=
Received: from SN7PR03MB7132.namprd03.prod.outlook.com (2603:10b6:806:352::6)
 by SJ0PR03MB6455.namprd03.prod.outlook.com (2603:10b6:a03:38d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 07:34:34 +0000
Received: from SN7PR03MB7132.namprd03.prod.outlook.com
 ([fe80::2389:6eb3:5794:ef45]) by SN7PR03MB7132.namprd03.prod.outlook.com
 ([fe80::2389:6eb3:5794:ef45%7]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 07:34:34 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: RE: [PATCH] Input: adxl34x - do not hardcode interrupt trigger type
Thread-Topic: [PATCH] Input: adxl34x - do not hardcode interrupt trigger type
Thread-Index: AQHZgrXkw3bqRPC82EeUgkBhbSmYDa9THi3g
Date:   Wed, 10 May 2023 07:34:34 +0000
Message-ID: <SN7PR03MB71321189A319922EDB4FD01A8E779@SN7PR03MB7132.namprd03.prod.outlook.com>
References: <20230509203555.549158-1-marex@denx.de>
In-Reply-To: <20230509203555.549158-1-marex@denx.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcmlc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy0xYWMwZWNhNC1lZjA1LTExZWQtYjdiMC1iY2Yx?=
 =?us-ascii?Q?NzFjNDc2MTlcYW1lLXRlc3RcMWFjMGVjYTYtZWYwNS0xMWVkLWI3YjAtYmNm?=
 =?us-ascii?Q?MTcxYzQ3NjE5Ym9keS50eHQiIHN6PSIzMzA2IiB0PSIxMzMyODE3NzY3MzEx?=
 =?us-ascii?Q?ODgzMDYiIGg9InJDZlREMGlseFRkMk5ZNWdRK0pya0VPcGI4TT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QlNiQmpkRVlQWkFjYTNtS1YzaWF2NXhyZVlwWGVKcS9rREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBU2pFWHh3QUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
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
x-ms-traffictypediagnostic: SN7PR03MB7132:EE_|SJ0PR03MB6455:EE_
x-ms-office365-filtering-correlation-id: 821e607a-dd09-43a7-9ceb-08db5129006f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G7tfVcbDZb9Onn6VCB0LNb9QBaUJbH5k4kVCQqgD6uCqypKHXO+Zl+10XX601PAZ7SI6ULAk88frctquhHBiUmQHYC+pg7ZvD1GR1YgDZjwB/lax7EABApqr2JxaMfR1/lNndoZk7Em1y2YJn9IgxlHk/U0/dr9g7NH/VKFgi0WwB1d3JrD6GQ8jxEC9pr/Dk592rVI3u8kKl01uScuEtGNKex5xTgT8dozqoyHerv+joOYjoPe48ZU7raTw/0xFr6FWV50I6/E2N00Q+upBDZ+63VSwYYyvwNYglBuAz44lxkMHxcAJhRbNefn034/ek635stJpg9qJdNsZw+dEstcWuuHmNIgbEQb4bVLGXLJMU7hpzifKwXDm6T9MIvYSpaTJQLPhmuUHZdm+1o1lAuZ5jzUy672QhTxfvOLzxBPkJHvksgq58HIA+Uyhyf6gjdX1yfkLt44yVqHsNyrQMJ0i7lg0oDPhw4VCX2WenJquD+34Sa7KKc4LbWUSCCISPjCmo9ybfzRuiv3q8QChkXTG3ilEccfgnlsPs2X4AFalXcbI18VybdLcstXmBYAU9K8jrLTE5HTn3W1MbqnT2ES9oT6i+55US3b7dai70v6fxRJpVL70a+wm1ZFOoQmv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR03MB7132.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199021)(4326008)(76116006)(64756008)(66476007)(66556008)(66946007)(66446008)(122000001)(478600001)(38070700005)(110136005)(5660300002)(2906002)(8676002)(8936002)(52536014)(316002)(86362001)(41300700001)(38100700002)(55016003)(7696005)(26005)(53546011)(9686003)(6506007)(33656002)(186003)(83380400001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?brjItGis/gCXY+Tgk8MAGgtiZjZWA10mc2CgyTBslg/U+47CyhsYpf2fQDeI?=
 =?us-ascii?Q?arJ8kfbDIqeksJ5DfkbkbFYnu1lZgf7yE1Y97P1zCQ4KwHEq+w2sEXk+CK5w?=
 =?us-ascii?Q?9DGWHkoqOmIdVTYjoFYS72lB9H4/K9L2dJJM+HwztCgl24IeTo9pekmjw+tt?=
 =?us-ascii?Q?DT25HTGh3Wkig41GqDET3caSg2WfgpeMjZxcu4G43Pnxz7+wJ4I2ikiE8uHi?=
 =?us-ascii?Q?MO5UtWSh+hIw+m45XNmutZ7R4zeVvyN8/gSdg3Y6eidun6DjWFOO2KlUav2t?=
 =?us-ascii?Q?1Q45Iu+/1R0vEaQNpDQFHpAPAMRRR4M5kcKaVD/jjxOlLRGJ6UKtn4d4kMJl?=
 =?us-ascii?Q?vpCCIA8RnjOJp4OZC1DQQ+KGMoC3D+Mv/lhhBcHHiMpB3OzXBL0f660MykoT?=
 =?us-ascii?Q?odpVrZdColRKbUDyCaxw8j+pBW0DfgCAvzUAIMWFyiMpCCYuPWCIoJo73L0Z?=
 =?us-ascii?Q?x4FMrJWdeYSE7wXZPw/lJqJhNezVd5WIClJ7WXnaKM6mwi3TBSr7rAzFRfu9?=
 =?us-ascii?Q?KcWncHB15hrq0uDQD2im/TFIPurGkVqUC12mMhfw2CEv71ftNMu+XSsL0LgY?=
 =?us-ascii?Q?lWkZBMcYsJIDZ7HsjCPYmE0/ENFilBfWG06RcOMX8z+RnD6DyiyAWpTJXzvE?=
 =?us-ascii?Q?95KmHjVFCgitskGZI2MpR0645VvHiPOh35t83Tx3QjF7ANSt0x5YSt7tzOx7?=
 =?us-ascii?Q?/XIXT2DYirzy+cVQ6dMuZLGhsU4lgFi3mPbyh4rW2iITX/+ei1B/Qjko/R7w?=
 =?us-ascii?Q?OK3yqduj5EjA7ej8RYDdVSZSDF/AxfM3l8uhq7p8tu1wGhf03YqyqRZvnPn0?=
 =?us-ascii?Q?g7KnvqKPNpXZcHWlADQLm8FT4/S156UV+f/s8NjKiANDM99naWrMrTfUieAq?=
 =?us-ascii?Q?XUN7k5gfKYzh0D/ErJhe1SW0Oz3XxlVgn3s1E5JQ5IAafE5LEQyI6kUmas0B?=
 =?us-ascii?Q?vatCn96FzqjdwqRJghfLP4LEwYwHo0Lnk3ThRQATHrmdGOa9JWzHwb4xXS9T?=
 =?us-ascii?Q?1/Ct1PDtflCScyVJF7fDrKpb/VbGZOaSK9EU7enGCORejttRyyeiOe9QkYUE?=
 =?us-ascii?Q?OhFmYblt3sAiCnrQNROUpGJhi8ffeZZNRoFvgXQO8/C8KvtY5vKMW98BlyZ0?=
 =?us-ascii?Q?cdoX/h8BK4tWb8hF2EB0ebsYgBjd+vu46DH/7FEPfv6TzrSq4/C3PV87dFqn?=
 =?us-ascii?Q?lMiLyNNVHJwCnd+7ZlvKxrYqlnZeSuls+Q1AY362sfimwULtzXe9+hfyueF+?=
 =?us-ascii?Q?wBNzaw+lIBai+fKTm+yfl82nkxe/YvfAMVi91nFJtpOWyp/7x8UbeWdkw7RF?=
 =?us-ascii?Q?72irPXnFPvuFKqXbivo6DbVq08VdVKmWt00nW0PiP0Pnc8kgDQUWOXDymOhD?=
 =?us-ascii?Q?F0yF++rvKV351EPwXNOaj7x+BuOX5a2sq0dqr77hQ+efvVB6b/XwddtDCQY8?=
 =?us-ascii?Q?K+fCIAn3/Sqa6Bx1Y6wP4pniI79IGMg7PjwamDqx58UmWRVhxiHJxadOHcss?=
 =?us-ascii?Q?cpAsgbsscOfgYxb9pEKXajRTXwFGjRRy9Hb7guDNoACvRsPYMlzhwCSnKyf2?=
 =?us-ascii?Q?9bYBO5qu7Ax15FFIFQA7DcAMqZlg1FsWR8QgU4XlI/XqBdhrKtDd6iwWHKq8?=
 =?us-ascii?Q?hw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR03MB7132.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 821e607a-dd09-43a7-9ceb-08db5129006f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2023 07:34:34.5651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1VOlVpUivcaVJP0/5FDGLBk98iRMeXU6lav9ODRVbOmSWyE5dRaWS2RiCDpSKwEOGPWM6y2uREGV+Y5WvJHaZupvfHd0CRU2IAq6R1gys8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6455
X-Proofpoint-GUID: nK3wqrWzc4DWx3gzLcpfmwKsEl0zcKSL
X-Proofpoint-ORIG-GUID: nK3wqrWzc4DWx3gzLcpfmwKsEl0zcKSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100059
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Marek Vasut <marex@denx.de>
> Sent: Dienstag, 9. Mai 2023 22:36
> To: linux-input@vger.kernel.org
> Cc: Marek Vasut <marex@denx.de>; Dmitry Torokhov
> <dmitry.torokhov@gmail.com>; Hennerich, Michael
> <Michael.Hennerich@analog.com>
> Subject: [PATCH] Input: adxl34x - do not hardcode interrupt trigger type
>=20
> Instead of hardcoding IRQ trigger type to IRQF_TRIGGER_HIGH, let's respec=
t
> the settings specified in the firmware description.
>=20
> Fixes: e27c729219ad2 ("Input: add driver for ADXL345/346 Digital
> Accelerometers")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Cc: linux-input@vger.kernel.org

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>  drivers/input/misc/adxl34x.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c =
index
> eecca671b5884..a3f45e0ee0c75 100644
> --- a/drivers/input/misc/adxl34x.c
> +++ b/drivers/input/misc/adxl34x.c
> @@ -817,8 +817,7 @@ struct adxl34x *adxl34x_probe(struct device *dev, int
> irq,
>  	AC_WRITE(ac, POWER_CTL, 0);
>=20
>  	err =3D request_threaded_irq(ac->irq, NULL, adxl34x_irq,
> -				   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> -				   dev_name(dev), ac);
> +				   IRQF_ONESHOT, dev_name(dev), ac);
>  	if (err) {
>  		dev_err(dev, "irq %d busy?\n", ac->irq);
>  		goto err_free_mem;
> --
> 2.39.2

