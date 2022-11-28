Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54B6763A1D1
	for <lists+linux-input@lfdr.de>; Mon, 28 Nov 2022 08:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiK1HO6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 02:14:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiK1HOy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 02:14:54 -0500
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5939D12D0B
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 23:14:53 -0800 (PST)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS60LVB014528;
        Mon, 28 Nov 2022 02:14:44 -0500
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3m3gkbj5w7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Nov 2022 02:14:44 -0500
Received: from m0167089.ppops.net (m0167089.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AS7AGeo011983;
        Mon, 28 Nov 2022 02:14:43 -0500
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3m3gkbj5w2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Nov 2022 02:14:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASHWZABi/qq6pHXLggzis798sS6SFoGdG79niTjY2O3v2KFS011fv39D+wW8RrTPMWumNMmuS6Z9l78zMTpPDM2W7rtCVBxVD/9ze6A8SvEfyAtVXMk6uUqPqNxksiDcHGr3stomSyAAOEPnwwsEmdEhr43UZsydc+3CBOjPSEtoQ+46czg+1sj3XAYq0MmMPr7McZNt5RIDLpTDC3rCK0fsy0R09xTYgpwwjsPdDXCytIWyITotGoqxbQ3MBvH1MI+6aMZQetKss5wa9HfA0s7rnNlOChqJQe5VtpphblH2f/JqTYbYejMvuBgo90IDS1a1xp0kmIKnR5UO8VUZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9qtcsY90okiG/FdbSMwi0c1/s0rhwGoOPBcqkwF3MM=;
 b=ZvYmCw/xfilBSrAGPIGkLlTrgEO+Lnsx6aMPYc6upuNmLsFGf0irxalgFwHHayjz44RVXXuGIOMJGmZbP8Lt2nx3XXurmwpfvgjTDgehFahofX/w98r1NoZ+uZaVlsxhQHRv/MSp58QZ9uzlsFk4OyWBJEcrElG9QeKzBjjpfhsruQmXd0uZ9EVRfMsXXlr3pDvvL4pZ+nODZAN9djudplAi5bL4ZlUUlix7J38AhSeV47mOTL/kT1ep7IvwaOA2JlHKJGL9zWknpO728WkAD6gIrgoqBPZq2Q+9AlnZZmh11FS9+PnkjEUJsZmoyNpmUV9HLiGdW/hK8IwdQ973Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9qtcsY90okiG/FdbSMwi0c1/s0rhwGoOPBcqkwF3MM=;
 b=g7wiQfXnDLOTOmvz7/tEI/El++6ab3tKtrSl1TssCQKRWAJ4vaha28Fp3Q4bQTvmN75l9fXtF3I59soRM4BArvObVzYCKER0hyLJAq9iN5970bw5uHXsuU5u5DNcZZdJKMSCBUthbLRBs7f7aG40O/3qV3suBfEd6AboLQjbK/g=
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19)
 by BY5PR03MB5094.namprd03.prod.outlook.com (2603:10b6:a03:1f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 07:14:42 +0000
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::9605:ca84:2a4b:643b]) by SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::9605:ca84:2a4b:643b%8]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 07:14:42 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     Jonathan Cameron <jic23@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: RE: [PATCH 2/9] Input: ad714x - Fix padding for DMA safe buffers.
Thread-Topic: [PATCH 2/9] Input: ad714x - Fix padding for DMA safe buffers.
Thread-Index: AQHZAmyXonu0NMxiJEiDGWx3M3//u65T7UNQ
Date:   Mon, 28 Nov 2022 07:14:42 +0000
Message-ID: <SJ0PR03MB6253CCA5E9E56D4AD2F669348E139@SJ0PR03MB6253.namprd03.prod.outlook.com>
References: <20221127144116.1418083-1-jic23@kernel.org>
 <20221127144116.1418083-3-jic23@kernel.org>
In-Reply-To: <20221127144116.1418083-3-jic23@kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcmlc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy01MjdlYWViMC02ZWVjLTExZWQtYjcxYS1iY2Yx?=
 =?us-ascii?Q?NzFjNDc2MTlcYW1lLXRlc3RcNTI3ZWFlYjItNmVlYy0xMWVkLWI3MWEtYmNm?=
 =?us-ascii?Q?MTcxYzQ3NjE5Ym9keS50eHQiIHN6PSIyMTY0IiB0PSIxMzMxNDA5MzI4MDM4?=
 =?us-ascii?Q?ODQ2MDAiIGg9Ikg1TkhtWnJYRG81R3FNVGQvdHdvRTRSZTkwUT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QTQ5dFlVK1FMWkFRSXkvVC9SaWl0eUFqTDlQOUdLSzNJREFBQUFBQUFBQUFB?=
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
x-ms-traffictypediagnostic: SJ0PR03MB6253:EE_|BY5PR03MB5094:EE_
x-ms-office365-filtering-correlation-id: 0e6360df-49b7-4c54-1df0-08dad110385d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jyT6l3+WFX4y/8CAQSFNWvI81RdHIbkmdYxa+vcAwtA75m2iyXG755Teg6mOfxani73XCoa4cu7G+dNxbVw7yEG+cuZUZIDjDQmbM2HMlQsu1tqXMBw0mx1Yf+NN8vJ8JmDMUVHe2MA3s5mv+ojoYPbbiXJrIXYs1+NfDF4DIzIR9SJkb+MuceT3MdAn5G09hE4FV5MKH24cHkLdnLGYThuKgSqW4MGvKZ1X+390XHjg/e82uXf+GIXNrikuxg06sMfESVBWEvAtdwd/qiqZ9udeyc6U1vief6djZlM3ub+Bml5tBlFHE53koAT60T3Qbju123Q69kElmDGJPTXpvnXfcjBD5DVnFOjNxrk+U9+jfqEQYsMYH6JAPjYY0tM6DFD6kdwK6cJot5M8IJXAUsaA3RgP70v+Y6F9yosFI/Y0+Rxkybn9VhHFiBMhM2n2/9GvJIHubsCRM3di7hvElFCL1LF/97BUMMZ+FmBn4MP94MYKZU49iH5H/DIP4aPB+ceWzS/eUb2uD/jEZUBNPX61LBGOWqglyo1yBmdDzGNRdXIIuQbqhptXF20m6n6TD2iTyezBApa9IFQ0UrrkjtFMwmVRgWegSC2Pli2gvAr+NaGTSLjnm7hKai+Z/2NknzfhCSkQCwfn9P8U7nhDV219fB+v3mRKVRvzjU7t2mjRJ6mjsr/0YWlOFYnJlDulZ4tYqTPNSjJ5cOcIpBK30A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6253.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(136003)(346002)(39850400004)(451199015)(110136005)(8936002)(52536014)(71200400001)(5660300002)(33656002)(76116006)(66446008)(4326008)(66946007)(64756008)(8676002)(66556008)(186003)(66476007)(41300700001)(316002)(83380400001)(55016003)(122000001)(38070700005)(38100700002)(478600001)(9686003)(26005)(86362001)(7696005)(53546011)(6506007)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yBf/Jgry792YshThdmfe3RKWlAHRKYu4nQyjD+AllQ4S9ZKcrpS1yaex2rSq?=
 =?us-ascii?Q?hHtjFhMFJ5dwO/MOQjzrQ+pfXVo/GjuCWUIK21GaDZwFreMB/Kz30Pt5T6EK?=
 =?us-ascii?Q?1oJ92iYYFOQVCRiTXoKsRJ1BgH9SqbxWImBn/pUkkzkkW2+Qgt1ys9Gw/4Wx?=
 =?us-ascii?Q?jc+EQ5aPdep0U/SPBeRoC3X7UIxCUiMqqTPb91zRAZT37aIVAIgqGjt0PUMO?=
 =?us-ascii?Q?NZIdqrCWXCulceojjpl0WvZwqvxAosGHuQac/8Wi3d1pbNHVowlM3YYLh/Cc?=
 =?us-ascii?Q?oFn36Ojo0a1qNnrLAdzg3lunyC2qEpJbk/dGiaIid4KkgQhP+2cMATmCa/BY?=
 =?us-ascii?Q?aZyEFMyMbiCZpPbO3WChGlXP3ByMGxdwXi7yQBDXtmPloJf3+rIn5diCmDDQ?=
 =?us-ascii?Q?KPTzPWZsJk0gYJHaHsDZvguM5flFKhUvsMeEC/RVfTny5Oi2e4qt3ZJHx86M?=
 =?us-ascii?Q?F9tI9mNHEHvWqxMuRUh/ENidA402UDStweRN/EnjeZ8vsWbozWMZL2tEn+2B?=
 =?us-ascii?Q?EW1atha/KbvCnpEMjHIgC37L5LzdPxcfTj5buvH2gH0Z4nHg0mayn9wT+gs9?=
 =?us-ascii?Q?n4lKFlMHtU/DhwowbEa5tXiEYZam984XFJcJJCJt9mYP6jei2irEbEn9VFcR?=
 =?us-ascii?Q?n/nESHiDPEUYrhW6D6sxPOKTyLRaBPEU4uYkdbfO+YcKe5Js6FX8pzECctn1?=
 =?us-ascii?Q?riE3KN+Bm38c7Sv1YsQ56ZBuiM/MBUpbcnt7FpTYXiZya5ZnyVAG/zzlULDi?=
 =?us-ascii?Q?XhR/dHU/qrSQbAQWJQs1JSiia7QRi3w5XysYTTCWAiUKN1dBfgzheG9pb4yL?=
 =?us-ascii?Q?XdwAXRAxtGow9GadWn6EMMcGEYR5BiOes7dMdbwBsfbL/OqfpTM4bZBLNn9H?=
 =?us-ascii?Q?1uhOLTds2+t66iZafI18kKDQow57M+2Y5/iC6gDC8mhiaCIgGrH3HQc6Eo2D?=
 =?us-ascii?Q?+fmjEzzzrqxeyyNeZE5QYu5NlVImWSOmYYSvq/65pcTziyM7nngdgHspJe4a?=
 =?us-ascii?Q?AM79jxhLtKml2NUnRBfY3YBFDMHYWDx/RV2MeBOstuY3y4zkIFU4rSBbLpez?=
 =?us-ascii?Q?vhvxLvQY+fwjVOymMP+wl4x6+HC8UjWIXgbPcumPtz1EupEGw88Oj0H6rPOW?=
 =?us-ascii?Q?Y3zjykHkOA6/fHKH80t7Qax9TAYPORa30qPspWK4TRjyH8kzjHLjTg0Kan4J?=
 =?us-ascii?Q?JJHUBZC16cjpA4mD66uHB3hNy3MAxKltwCr7C09t/gySX9tDJmhaSN41joGj?=
 =?us-ascii?Q?KujGCTGO7xE1o1VS7heE2o5DyT1VqpyRm3hnBwlgeFNIDLTU18kg5udiAMtI?=
 =?us-ascii?Q?Z1xYxGMZnAXXQpqNe5EOneHzEYR0/xOaJBXuXbYW7HfP7A+aCkKlYCScJBbc?=
 =?us-ascii?Q?LkkemaRQns4G+HF6bBjd16kxmRkX/qPbJVMniuLjr91jOLIn7GAuE9JWYIXi?=
 =?us-ascii?Q?w3l5oXcBpVf8q4uaIbI7sSwBcVb3DNOEmJe+Xzoajul1nf9ToruWFADhZUyK?=
 =?us-ascii?Q?FZXEGOMZ2vVhYtZ3Ae5RIrKem0VCWdPj5LDNm61sjLqGySMJ9BNHv+t1Kpdw?=
 =?us-ascii?Q?tSeRwN9LXjjvQaAYMDfd/FXPIwJD/9TMKyYT5K6YtZBNmJV0J7z9mYC0O9Rl?=
 =?us-ascii?Q?vA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6253.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6360df-49b7-4c54-1df0-08dad110385d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2022 07:14:42.1030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGD3AUpycsBmnkXob371kF69BcfBVwETskNeNqbkRSS1Ob8wbqJhfvpYaHJeLpA6k6somvbYE0Krv0IrBD2oCz7hmlVkjhPU475sxHQSXjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5094
X-Proofpoint-GUID: TIgGBNBKLJGzsKti5QYtWkbt4OS1CtRp
X-Proofpoint-ORIG-GUID: lyY7xGD6n4EIqQz6ksXtH_wM0eNKANXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_06,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 mlxlogscore=951 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211280057
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Jonathan Cameron <jic23@kernel.org>
> Sent: Sonntag, 27. November 2022 15:41
> To: linux-input@vger.kernel.org; Dmitry Torokhov
> <dmitry.torokhov@gmail.com>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>; Hennerich, Michael
> <Michael.Hennerich@analog.com>
> Subject: [PATCH 2/9] Input: ad714x - Fix padding for DMA safe buffers.
>=20
>=20
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>=20
> On some architectures (e.g. arm64), ____cachline_aligned only aligns to t=
he
> cacheline size of the L1 cache size. L1_CACHE_BYTES in
> arch64/include/asm/cache.h  Unfortunately DMA safety on these architectur=
es
> requires the buffer no share a last level cache cacheline given by
> ARCH_DMA_MINALIGN which has a greater granularity.
> ARCH_DMA_MINALIGN is not defined for all architectures, but when it is
> defined it is used to set the size of ARCH_KMALLOC_MINALIGN to allow DMA
> safe buffer allocations.
>=20
> As such the correct alignment requirement is
> __aligned(ARCH_KMALLOC_MINALIGN).
> This has recently been fixed in other subsystems such as IIO.
>=20
> Fixes tag is inprecise because there may not have been any architectures
> where the two values were different at the time of the earlier fix.
>=20
> Fixes: c0409feb8689 ("Input: ad714x - use DMA-safe buffers for spi_write(=
)")
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Michael Hennerich <michael.hennerich@analog.com>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>  drivers/input/misc/ad714x.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/misc/ad714x.h b/drivers/input/misc/ad714x.h in=
dex
> af847b5f0d0e..2b8b901183be 100644
> --- a/drivers/input/misc/ad714x.h
> +++ b/drivers/input/misc/ad714x.h
> @@ -41,7 +41,7 @@ struct ad714x_chip {
>  	unsigned product;
>  	unsigned version;
>=20
> -	__be16 xfer_buf[16] ____cacheline_aligned;
> +	__be16 xfer_buf[16] __aligned(ARCH_KMALLOC_MINALIGN);
>=20
>  };
>=20
> --
> 2.38.1

