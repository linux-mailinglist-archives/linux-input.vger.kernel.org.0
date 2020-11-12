Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945E52AFFDD
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 07:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgKLGvJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 01:51:09 -0500
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:5108 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725898AbgKLGvI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 01:51:08 -0500
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AC6p6a2031102;
        Thu, 12 Nov 2020 01:51:06 -0500
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
        by mx0b-00128a01.pphosted.com with ESMTP id 34prvv45kn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Nov 2020 01:51:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXHOrcrAbZgX0GOPqoeUU1/cKwad5DGPLhtaOPb/+djeaEANcGvrNaD+Dc6iFeqEIpqnBrrlF71lNYcxYAtaJUKB4CuXj6aZtU2mcXpOHZSS4vUNrSrs0f2H376WyjirjZ9veqri3Qom+3Bs5sGVJtrpPVnlMarzHiheRcHqJRN4Cw3xoxR7TWexS5Xqm1GpR8mC8DHKHahbO1qtBUtAEz1teq4LIeR79PpBDTbQFrZ5pY0Kt5RUKEh86D27pexVwfESrUIvS6arlQGvrCrnWj34E1Crm8LSnEHFY8CTVp4xJtSKBywXT7NcbCwR0v24+ZzTfzzJYE8rH6FfqbRkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFAo/Lw5NOA0O+9LC618OO5uVlwrkmXeXYMNEDtBfBc=;
 b=RiLrX+p5TeotghIwtUd1zgXW9peCfOF6spq3Y3igXj2vPHXn/cbBSb/My9+HP0LGrSGyKM3Cfn/Q8WOW2oVUB3KpO0JUTqWy8I7B4o/V1QcoVSX1L3qQYLH9XsfcmjSf2ds1A/zOwbpKNj/oiXe8lqNrldkptQDizxJAEgvQwPnAxyDuFzS5sBXLP7i/ckQJfH9Ujj3K17TzaRxLJN0jeTVkT99L+2Ks4iH/MmPmscCiXxHrxzAaO0F4lnT8KFqvwQ2W5TJhK7w5p7Pt14LanykyvG5GFSC6Yayv1TpEQvtXtfx/i7rjZO0VmcYz9B1rOhF2dOXYbBgCWWKNjdztPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFAo/Lw5NOA0O+9LC618OO5uVlwrkmXeXYMNEDtBfBc=;
 b=zF3iMnEtlj67LZdFvC/w4Gs8Z3ZW4BxuvZqwBfWI7H+N6C6mQzpqOhmbHuQndzQKsAXsJW3W/2kJC9WfZ1H/4Vcxq6QrOcqUKU4ezCr5zX8hDcm3YUPgezrg7MLwFq8clEiQCf3fjITTBN4oIl5CD5r2qC+E3mKe8FJFk3Z2t9w=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DM6PR03MB4649.namprd03.prod.outlook.com (2603:10b6:5:18c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 12 Nov
 2020 06:51:05 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f8dc:93bc:313c:fc22]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f8dc:93bc:313c:fc22%6]) with mapi id 15.20.3499.034; Thu, 12 Nov 2020
 06:51:05 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/6] Input: adp5589: use a single variable for error in
 probe
Thread-Topic: [PATCH 1/6] Input: adp5589: use a single variable for error in
 probe
Thread-Index: AQHWuAa+GlSvf4QZ5USdLlxwh/EZS6nDp/0AgABlBhCAAAMygA==
Date:   Thu, 12 Nov 2020 06:51:05 +0000
Message-ID: <DM6PR03MB44112F9E87F383E0B727D83DF9E70@DM6PR03MB4411.namprd03.prod.outlook.com>
References: <20201111084833.40995-1-alexandru.ardelean@analog.com>
 <20201111084833.40995-2-alexandru.ardelean@analog.com>
 <20201112003738.GZ1003057@dtor-ws>
 <DM6PR03MB4411AC5AC6EC2F0F4337A05CF9E70@DM6PR03MB4411.namprd03.prod.outlook.com>
In-Reply-To: <DM6PR03MB4411AC5AC6EC2F0F4337A05CF9E70@DM6PR03MB4411.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWFyZGVsZWFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy02ZjU2NTA1NC0yNGIzLTExZWItYTViZS00MTU2?=
 =?us-ascii?Q?NDUwMDAwMzBcYW1lLXRlc3RcNmY1NjUwNTYtMjRiMy0xMWViLWE1YmUtNDE1?=
 =?us-ascii?Q?NjQ1MDAwMDMwYm9keS50eHQiIHN6PSIxNDk1IiB0PSIxMzI0OTYzNzQ2NjA4?=
 =?us-ascii?Q?NjAxODAiIGg9InYxdjNnRTVSbkt0TEZob1lEa2U0K3g4WXNYaz0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QVVDYkF4d0xqV0FaODRXVHBoNE1qa256aFpPbUhneU9RREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBS1ZJV2JnQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
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
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=analog.com;
x-originating-ip: [188.27.128.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f1cb4eac-d1a1-4b04-e830-08d886d753d5
x-ms-traffictypediagnostic: DM6PR03MB4649:
x-microsoft-antispam-prvs: <DM6PR03MB4649E397814671FBB4982288F9E70@DM6PR03MB4649.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i+06LLnWtfh2tQ9Cogqv6SpMcSoXQkh/lzxuNqR1Zg8klJRYh2DpuPCW+7WIIA0NUeHtJuMRiQBgwi5yZU8rl4A9hJIipKbp+m6b5nQ2/dc/bF2Rnve1FCXx2viumiuX2LfGE+EnZikj+Nto/Fq+DOoJI3h2pyMDr0NstR5oon8zTcPndQcpGCKoWmGwVRexDG6oS7cFEt5NckycQgd0VTt816EbY3kEbr90w/xNkqzbwQlVuZfeBWeLTyS3FYkOcWRT5p5yU0Z5whh6A1lmbUPbBJf0n6aicI3nPIV3dx297Lw/7BmTDcz0aqvjOiJe
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4411.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(66476007)(55016002)(2906002)(9686003)(478600001)(83380400001)(316002)(53546011)(71200400001)(66556008)(64756008)(26005)(86362001)(33656002)(66946007)(66446008)(5660300002)(52536014)(2940100002)(76116006)(8936002)(6916009)(7696005)(6506007)(54906003)(8676002)(4326008)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 0OF8+ey8KnTkzBIHU50I+WlrgpzC4kND4/nmBUf1QJUOqJzMts6HZsTEZUsFOhsW0biat6DC1mkBhxhKjibCiIi506In8E1PojwHk1BT0aq00UiYO8BWE5/wR1tobJdVfocnAQiw4r9zbSgErf67fD42K2BpP5WrhDgXa4QKHdI+tsu10LCSXBjFzG4rABlUKlGAQveMsR9PfE1lfP0gWLcU/bvqfRzF1b4PJUKccwOmAJXA8IZ7IPtXO8m/LnuySJIk4dayNyQnrG72zU4A6UBfYuRZwSo+v/YHkt7XofBqFXHMa6N0A4WZTX7Xb1mCG6GmEnjjs0UWH+jW5PndJqiXt9aRAcMWbGQjqKnfRUX3PkZXaCN2G47fbjOxCa0j/S4mIcPE1iT/kbnJpqDUOmNODiqG1Z9gf0w/1B6LYSube/h84pziSx344B83Vev0dY6p9nDxQ7CqBylMtIa/scGDc2x9u2Hh4mRV3gsbrWhUX1rfWmXLRNrT9n1EIRpLoMXaek4168+zwctyzj/dDfFWIku+T1ZNRE7NKec6zMS6QyQ5AO0RJpWfb0lCUI3HiLX+k09ZhFU6+ItQxIoQDN1QjRItznX7n/ijn5cQkVV7JMxq8ufugBre9Z3WopFZNdGM/SgRAwJiMUYVxud9rg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4411.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1cb4eac-d1a1-4b04-e830-08d886d753d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 06:51:05.5043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MGfjvUcVKj7wwfHYn5PRzUMYq615pjNDkSybPozs7qD+mrsNToOcfEENqzQbcRb5Yo6mzlr4gc5Jhxz2NWRzge0AxreThj0Ady83JRyYV40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4649
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-11_12:2020-11-10,2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 clxscore=1015 suspectscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=984
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120039
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Ardelean, Alexandru
> Sent: Thursday, November 12, 2020 8:40 AM
> To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: RE: [PATCH 1/6] Input: adp5589: use a single variable for error =
in probe
>=20
>=20
> > -----Original Message-----
> > From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Sent: Thursday, November 12, 2020 2:38 AM
> > To: Ardelean, Alexandru <alexandru.Ardelean@analog.com>
> > Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH 1/6] Input: adp5589: use a single variable for
> > error in probe
> >
> > [External]
> >
> > Hi Alexandru,
> >
> > On Wed, Nov 11, 2020 at 10:48:28AM +0200, Alexandru Ardelean wrote:
> > > The 'error' & 'ret' variables are used. This is a bit of duplication.
> > > This change replaces the use of error with the 'ret' variable since
> > > the name is a bit more generic.
> >
> > I really prefer variables that carry error codes/success and are used
> > in error paths to be called "error", and "ret" or "retval" to be used
> > in cases where we may return actual data.
> >
>=20
> Ack.
> Will do it the other way around for v2.
>=20

Wait.
I just had some coffee.
I think you're saying to drop this patch.
Also fine from my side.

> > Thanks.
> >
> > --
> > Dmitry
