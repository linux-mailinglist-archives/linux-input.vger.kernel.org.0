Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F12298774
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 08:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769770AbgJZHbl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 03:31:41 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:39682 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1769769AbgJZHbj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 03:31:39 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09Q7PIRm025122;
        Mon, 26 Oct 2020 03:31:36 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
        by mx0a-00128a01.pphosted.com with ESMTP id 34ce45prn1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 26 Oct 2020 03:31:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYNGhBksbpQzzbUz0fa8qE+p+vYEDHmLeeoARMmKLo8AHsrmbnn8HAgoaEJeJ5FOqjtCi2JerndWM+uR+RQC4BzGSPTXVaA9zQI1o1fXch8uydv5HxwpFBFLbnlp21EF6/tiOpQDJp5VKHmHflCQcWesQOYp4XiM4JDIn3D7ZYWRtXxz+Y3QsLLvuM1LfHEsSHDhIG6J5Whquv1oaZ3yfF3jAeRTA3Eq5f9OXZQSY724schIgk/z56r3grgKaCCm+L+LVKWLcz2lMHGuMqx3DYdKiOx8yTK2oDATshPwwrHg3OWXFKFLy1ST4oI7TVPqQy+y0SFVKgu8zZD+TlpOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fddl9AGVydZeQyJO8O9KfWywt0LZGwzHe3UnTFklBlw=;
 b=KcaQ/mfsYb/aTwzcYvc1/+DcTpYH8D5mT+syqKz37Zk4v1aNbdToPRV/GJqpq0f4z/8zvWhOspRG2xByn6DIvVSyAptL34/ui+qZFeiOT3Hk0PE6JuHi2sG17WFLOWJFKAEY8F9v0NG+mRljAo4nn44twTJ3Z54gozTZCvkDmKr3SZbupqylUT5wdwGBre7I67Fu+/8cU7iodZUvfqV+mMeqPyw/+mmScoQpmTuidPBjdHQml4V6HZ1LX8fedxRUjikeio9jI7ig8v4Lr/nr7riJ8TNTRlBLv0jts+L/FptVGdefIECnSfu4TCn/8NDNykXq+oE+9nIyo0vZn5tbqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fddl9AGVydZeQyJO8O9KfWywt0LZGwzHe3UnTFklBlw=;
 b=nXnaDYuvXdwNDzUgtxJDLDH1x2kWsze8OmEENsv1KcpJxGHxOowU2FC8jKHvy72NGYJLtoUr4R/WS5q3TsUR5epat7AfGLCxVG/n3mgVNZyDyJrcgPMn2a6/ytMWxvqpCfq6iIH1sKlxVCttRi+O9/QGILQ6n24M5X3N1pen+5s=
Received: from BN6PR03MB2596.namprd03.prod.outlook.com (2603:10b6:404:56::13)
 by BN8PR03MB4769.namprd03.prod.outlook.com (2603:10b6:408:68::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 26 Oct
 2020 07:31:34 +0000
Received: from BN6PR03MB2596.namprd03.prod.outlook.com
 ([fe80::b938:b508:be0e:ea27]) by BN6PR03MB2596.namprd03.prod.outlook.com
 ([fe80::b938:b508:be0e:ea27%6]) with mapi id 15.20.3499.018; Mon, 26 Oct 2020
 07:31:34 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] Input: adxl34x - clean up a data type in adxl34x_probe()
Thread-Topic: [PATCH] Input: adxl34x - clean up a data type in adxl34x_probe()
Thread-Index: AQHWq2mf84zHZ4vkRkKGm75pDC+L4ampfRWA
Date:   Mon, 26 Oct 2020 07:31:34 +0000
Message-ID: <BN6PR03MB25968C0FF47F64CF580887B18E190@BN6PR03MB2596.namprd03.prod.outlook.com>
References: <20201026072824.GA1620546@mwanda>
In-Reply-To: <20201026072824.GA1620546@mwanda>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcmlc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy00NDkzNzlkYy0xNzVkLTExZWItOTA4MS00ODg5?=
 =?us-ascii?Q?ZTc3Y2RkZWZcYW1lLXRlc3RcNDQ5Mzc5ZGUtMTc1ZC0xMWViLTkwODEtNDg4?=
 =?us-ascii?Q?OWU3N2NkZGVmYm9keS50eHQiIHN6PSIxMzc0IiB0PSIxMzI0ODE3MTA5MjQ5?=
 =?us-ascii?Q?ODQ0NTEiIGg9IlJRNkRocG41NVNJWjFGQ2tra1JWc2VMeFlRVT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?Q0RjT3NHYXF2V0FhNWUyTEp3UTlVTnJsN1lzbkJEMVEwREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBOHpRWGF3QUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
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
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=analog.com;
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9c368cf6-cc61-4842-83f0-08d879812aa7
x-ms-traffictypediagnostic: BN8PR03MB4769:
x-microsoft-antispam-prvs: <BN8PR03MB4769E5B0E55E190A0D66CC1B8E190@BN8PR03MB4769.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OGW800roZgVRs4m4oL/Wcpnk/V2AKYvnMAzfxmSyNAqlM+VgAJ8jHJV3pu2tw35ZCxMmnUBBuW218/8aEtWunvbE/ZROHnDog0q2nN0rkQNvOwN8aqq7zgaRJJxzSRTZxkvSC0sIR4ru2IafR/33FrM3/ixRFp5fVToNfL791hIkPU/ISgMzwtFSXgli5959ISCUsXavGRFhgCUAP749ChxRxwTA3LLeMeIilkkjTMlaSERyXW14Y/JO1gIB+df/r+oLenJKwTwrCzVwJD2ucim+emq31oBzGd9eSdi8VCIsJ9kf7HZQIdJ0o1S+sWIf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR03MB2596.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(26005)(9686003)(6506007)(8676002)(6916009)(186003)(5660300002)(8936002)(2906002)(86362001)(52536014)(53546011)(478600001)(33656002)(83380400001)(54906003)(64756008)(7696005)(71200400001)(66946007)(4326008)(66446008)(76116006)(66476007)(55016002)(66556008)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: pDuc77aokVDflKIn8ygF2hRVIXMFPIDkHyfNL9+kC1ZgDvF3mMpkxhNfHQhWyfw41GZwlr4CXpr1c21J+ZfVmSl6NJaJWDA683nn5OhnOnPCMWp3MAYjUC8+xuF5SIH72cbdAJ+Ec0DY4I1Z+AHxqaMBX+fdViYzdf5Msbi0+y36FVRosvuGRf9XJEO9uoeOJMO8fhcbR9Dwv3HASn3PxW/tVN8NOfab4hfoqy8iH3DhWWv88KtYpruRHBPhz/EKBZKo/DFZRISTcRt5+Phd2p25cEoN61A/PVgzdzr0AQEiFjgoN3Ox26T4svyTOVPre5tF1Mv4HS1j0iy0Mhy6X1w2yGkYZxWV9tsGdgU5lFf5Wd4oWg0O8cBlTuIoEqhxj8zVYfvtqUG2ZHiaMaXI5AxA/aeKpB9it9sThCQUO0/zWvnbPrHt3dLZK2CecoqbtSp3J84jc36R9rOzXR9/riWQWXvMES7CJaZ6nL46caOr2ShZ+orGNkQCDIl997tQFxxpCO8Mxj4TkmRMo56fPvDJR9zdFCHxUe/33NtIG2twGz85wJBlT8ZClXOpxg42oRIQO6JaPJG4poWsdb8NfpNNkHAtCXD2SF6GWlSOvp/gXNjITGi+uzRw7s4Rrcc0hNkHN+KGAWvZwZDEkiXKKQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR03MB2596.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c368cf6-cc61-4842-83f0-08d879812aa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 07:31:34.5658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 38SBt5hce47oLWhX9hkovQH/MHZ+tGxEhiMv5m+h5i1+irLzBtdC6+Wd+42yDSxxkP8oOA+9BB/K+7ANQxC7FXTf9Q+kw5ZTQPlv/ap8Ik0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4769
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.737
 definitions=2020-10-26_04:2020-10-26,2020-10-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010260052
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Montag, 26. Oktober 2020 08:28
> To: Hennerich, Michael <Michael.Hennerich@analog.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>; linux-
> input@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH] Input: adxl34x - clean up a data type in adxl34x_probe()
>=20
> The "revid" is used to store negative error codes so it should be an int =
type.
>=20
> Fixes: e27c729219ad ("Input: add driver for ADXL345/346 Digital
> Accelerometers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>  drivers/input/misc/adxl34x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c =
index
> 5fe92d4ba3f0..4cc4e8ff42b3 100644
> --- a/drivers/input/misc/adxl34x.c
> +++ b/drivers/input/misc/adxl34x.c
> @@ -696,7 +696,7 @@ struct adxl34x *adxl34x_probe(struct device *dev, int
> irq,
>  	struct input_dev *input_dev;
>  	const struct adxl34x_platform_data *pdata;
>  	int err, range, i;
> -	unsigned char revid;
> +	int revid;
>=20
>  	if (!irq) {
>  		dev_err(dev, "no IRQ?\n");
> --
> 2.28.0

