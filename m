Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F672AFFB7
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 07:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgKLGjj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 01:39:39 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:54024 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725898AbgKLGjh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 01:39:37 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AC6Vxnp007499;
        Thu, 12 Nov 2020 01:39:36 -0500
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
        by mx0a-00128a01.pphosted.com with ESMTP id 34nsc984dj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Nov 2020 01:39:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEdj9Li2sHYl373Gi5wGTfhicr/mdgc5dOtknP77BEBgjk0CvtFGO6ck8irhusA1cCW0fYjsIVCbMxBmLX2/77zX0DIAyC1n/OGG6rcdyXZz2SCKmgdixpo9WwZbfe3lQzkaXpm7el1OJpfskE0AAY0JhpCFFfiS3UUS+KGeUQbURXe9sERgavuVKkfIFchC442ihhqNG4aFtw8qH4CH93YrldVNgZ89PKEo00KjSeghbml9InmhVzAJWW+RpZAV8n2L67nnJoZyMRhjgV5kQYXXnwXMRQxyHxtVsxa+vL57iPcXKqbGR+Is8oVYgyAiTYrTWfvqxPM90Wz5XAfljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwRqwG9EXbcuhRWolvAqcLThS3ImCPcBbGgBZFu2vJg=;
 b=iCB/yHxj989SAo+hlF8+D8XI9dlPZMHiqjeloqa4EKZc9Pxf96zKBEaMFu/ZUhueiM8IO26N+8OsaMVcMbry0TaiMexOph6SdUaKbZAI+bsuINb30cxwuB3/mDwuwfj4FNHSLOfvuoke/YXbbZVvWEqAvytRXbc5Iwf2B2qgwV8E2m0s/cOFC1RP2CwAMuTdSBUn7NsymjyTYBcSN/0/xTPTKgsnGgGhijQo4yprGlNPJnzmdVFIGxqrGLM9z+s6XWg34IumwLDG009HHGL4UCekvtctcN2+aLg2FOcBg26iA4IU7HpzGOLZYGNRrNnO1ZvpyLSOknbyGL3ots5TwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwRqwG9EXbcuhRWolvAqcLThS3ImCPcBbGgBZFu2vJg=;
 b=irwkz2xs7RIpDN+LU5QWT5QNpXJuBXcWW51w7qElfj6j0QkUS40/pCD/VzPKtZ19bqDq+xcEdkaYEenikOyep8HFkVGBegomfwhdsfRvX3+lAb2YDOd93gqLNktK6fhbKagwbJSILOc4QZehNN9IAIMhqmL5tZls2iXxJR5f3Uc=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DM6PR03MB3851.namprd03.prod.outlook.com (2603:10b6:5:46::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 06:39:33 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f8dc:93bc:313c:fc22]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::f8dc:93bc:313c:fc22%6]) with mapi id 15.20.3499.034; Thu, 12 Nov 2020
 06:39:33 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/6] Input: adp5589: use a single variable for error in
 probe
Thread-Topic: [PATCH 1/6] Input: adp5589: use a single variable for error in
 probe
Thread-Index: AQHWuAa+GlSvf4QZ5USdLlxwh/EZS6nDp/0AgABlBhA=
Date:   Thu, 12 Nov 2020 06:39:33 +0000
Message-ID: <DM6PR03MB4411AC5AC6EC2F0F4337A05CF9E70@DM6PR03MB4411.namprd03.prod.outlook.com>
References: <20201111084833.40995-1-alexandru.ardelean@analog.com>
 <20201111084833.40995-2-alexandru.ardelean@analog.com>
 <20201112003738.GZ1003057@dtor-ws>
In-Reply-To: <20201112003738.GZ1003057@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWFyZGVsZWFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1kMjgzNTlhZi0yNGIxLTExZWItYTViZS00MTU2?=
 =?us-ascii?Q?NDUwMDAwMzBcYW1lLXRlc3RcZDI4MzU5YjEtMjRiMS0xMWViLWE1YmUtNDE1?=
 =?us-ascii?Q?NjQ1MDAwMDMwYm9keS50eHQiIHN6PSIxMDIxIiB0PSIxMzI0OTYzNjc3MzQ3?=
 =?us-ascii?Q?NzY1ODAiIGg9IkVWMVh5MXZ2Mnp1TDlQcDZPdEdSTTlnblRFQT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QUVZOXlVdnJqV0FWdGNvYUZDNlFaMFcxeWhvVUxwQm5RREFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: 2391890a-08c6-4c7d-8242-08d886d5b78b
x-ms-traffictypediagnostic: DM6PR03MB3851:
x-microsoft-antispam-prvs: <DM6PR03MB3851E893907B9FBBB19CDDB1F9E70@DM6PR03MB3851.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pDTbHDixwZ7pDgSFMx//7Op8+pG0FPCkj5XP+jivECC3DKMX0z50fxe8KVkhSjQk/91wwWc/GU4gULIpSk607oz0eKLByYZq6816+wjvKuE12zIKE/y3EkRl/w43pBO+Tk9dOHHvxku1SCdGr4C/Itap0pgE1u4YA7wXVu2PsLhDfWcYJxx4AnwXni0bUneomyviAOnJStMhqaRq45K3qlybm1idcANSM89nWq6ka0U8WMdIbtpSYIqK0/B6ohmj2vkBrvc+uSgr3bbNsw9qVDhGArOrlF2YoTZwf17frnnITemDcCi8z3YRrnluHDWk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4411.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(66476007)(66446008)(316002)(8676002)(54906003)(26005)(6916009)(2906002)(186003)(71200400001)(478600001)(4744005)(7696005)(53546011)(6506007)(66946007)(33656002)(66556008)(8936002)(64756008)(76116006)(55016002)(5660300002)(9686003)(4326008)(83380400001)(86362001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Hb6Zv618C81Iv0ovRgqNXgl1ew72pO6+W6aMNOY2LPIHU7Rllsnib8oFlhSSTHOOnaKRgXLpvVAd8sxJ/t4qndrP08rLUCiuwoDoGK288L9dugmBbfKzLKGywT467fY5Gaj9eB5Y4c0GygSlnJNvAJKTAiIIkTZ6imRFcnkER4l1OrNFf5rDuBrg/ThtDyYLiP9EQYVKoMNHr0I0FVj6Q4xZikT0lKDW9aIjqwv3olINrTA5ZZHdkle3gTzCoPIeg4edvZLTeeGFMjNogIjHmv15xArbKZQaLkuBZDTaT/WA/kuIeqcSRE+uXW5BNn68vZ/zfP1NZrrjkGCiuXPNm0qaT9KR8eEGenmfaDk5L2d+YtZUH5OTNQaU4AqTuVegIIE79eC56cFz+4aDkZt8i+GCy1qZY2oIMs9bg2+OklBu7EBsNY+5bPMN8RyUsOooDtTXrmFJj/WtuUGXKIMXBnYaPxSAltl9waQP0Smk9TWLdWjJXiVJnHYFyL7+BbyLNsg0VBuVUNcgYoSYcN/wgxdGXFueQuUQnfxmVipucy5+0if/ZPuAkJAWerDnSjBzIE451AJzJdvaj3Xp1+cCmpecQi6r4cFEmQoNTIVHO9fWlrScedcXznQW7Mo95xnqrUgtoO2+2fDEahilPz9zpg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4411.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2391890a-08c6-4c7d-8242-08d886d5b78b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 06:39:33.6855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HaLfLhwkbg5as1G1l2UbPvzOssmux6J6bHVl+P2M3OCfBlrSWzWyvIofPd7JQ3lyd5Rh3H5azqlT9KIWo+alhfbd9RQzIBoW68p5E9dfDTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3851
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-11_12:2020-11-10,2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=971 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120038
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Sent: Thursday, November 12, 2020 2:38 AM
> To: Ardelean, Alexandru <alexandru.Ardelean@analog.com>
> Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 1/6] Input: adp5589: use a single variable for error =
in probe
>=20
> [External]
>=20
> Hi Alexandru,
>=20
> On Wed, Nov 11, 2020 at 10:48:28AM +0200, Alexandru Ardelean wrote:
> > The 'error' & 'ret' variables are used. This is a bit of duplication.
> > This change replaces the use of error with the 'ret' variable since
> > the name is a bit more generic.
>=20
> I really prefer variables that carry error codes/success and are used in =
error
> paths to be called "error", and "ret" or "retval" to be used in cases whe=
re we
> may return actual data.
>=20

Ack.
Will do it the other way around for v2.

> Thanks.
>=20
> --
> Dmitry
