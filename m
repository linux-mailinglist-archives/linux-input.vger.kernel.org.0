Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56632B00E8
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 09:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgKLIMA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 03:12:00 -0500
Received: from mail-db8eur05on2085.outbound.protection.outlook.com ([40.107.20.85]:42369
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725884AbgKLIL6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 03:11:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNtQs+vvapkV4rQmoRhKXOu6hCe9cR+xU8FpnzHlrLg543XrHV9pJ30+FrVZdeBFIdLKMoCgzTkgSuUiyIe6MuFfVymcgJ4qtxAm0WH/Aq4t/lichA06fz5bJRAZ6R6xPXMpjxvXTyAbkqswsyip/CmyQW+kihTM6dGgQDa2xv6EjalNrprY8KqsbvEC146pRGoFyOU6qVQBPNhKsOJR+MqwlgVEXiOOzWb2YoNC86G4+JNGr3F7guxOw5CVTVEA4UwQ8SnkrCS/8U3JBiEW4D4DdO7t8i3gsBm1UdAnQarfb7aALxRgz7YRA3T5A03+iOpV2GIHB5dyKZTncbVfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYIgd/BQ7h2nM2oYg3F6i6MmE2pDQYjLLmRMyAaausk=;
 b=C/NkuvydbRiS1y292Z9D/QiR8KUhy44+nHWBy/srTcKs42NNScr2ErLtf81EPw/lwWGdOOJA3LlAc97k4MuRyKmJhOzFUVfWQgmZ/O3aRAK1w0lbQij1jl/mQMNHgf+ZFEmnTjNXharIXwxIzzllJTqpMGcLilu7rZnu4Z+BrMZp0w6tF+6b5HZZrcF9V+wd4h507WnMFbCGpfdlkddxNazpEuxPVrJpjQR+C37RVk3KFWCqrDQQXZFZLhRWE7w0zP5k1xP2RypBTIPf7wdSYqezYy6KGsv1Yof7sUjyUsB8bWSS6M8ghP4uvPEZZMRy9ZcZ6RCJVstIwk+ahRxDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYIgd/BQ7h2nM2oYg3F6i6MmE2pDQYjLLmRMyAaausk=;
 b=e+1Nxiaynq9lgSd1haunqjnU5p5Fw/VK3/MrkuVo3p+kKSw+1xleCO5KewC6HmmJiSVHNo+F9k8aWHHngqVfC+DsnnfBYwmVyekR/mUU/Rin22jao1AKP/L4zCH1OSs6FaIWXLWx8pA2ifrmbOl44IyQOR2lVnOgwgtd+j0Cmh4=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB6PR10MB1559.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:6:36::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Thu, 12 Nov
 2020 08:11:55 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dd4e:81f8:cb7e:a1eb]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dd4e:81f8:cb7e:a1eb%3]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 08:11:55 +0000
From:   "Valek, Andrej" <andrej.valek@siemens.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>
Subject: RE: [PATCH v2] Input: st1232 - add support resolution reading
Thread-Topic: [PATCH v2] Input: st1232 - add support resolution reading
Thread-Index: AQHWuJausQ675DfOyEKCxRf7capNnKnEJVGA
Content-Class: 
Date:   Thu, 12 Nov 2020 08:11:55 +0000
Message-ID: <DB8PR10MB3977BDD73A260EE7999DD76892E70@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <202011030200.dKK6cKCM-lkp@intel.com>
 <20201103073949.12198-1-andrej.valek@siemens.com>
 <20201112015348.GD1003057@dtor-ws>
In-Reply-To: <20201112015348.GD1003057@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2020-11-12T08:11:53Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=8687f37a-1984-451f-bf2b-f32752f66bf7;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 69d6f610-5e72-48f6-7c0a-08d886e29e94
x-ms-traffictypediagnostic: DB6PR10MB1559:
x-microsoft-antispam-prvs: <DB6PR10MB1559EC8EBDB5D3CC084343F892E70@DB6PR10MB1559.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4FgFAe0fS9PQiprAu6XHu/nfaCo9H2XQH7Q/PnhzQ3vuJw7KS7NZ3995wI9vSV73MZRRfV7Pfn6a46OzI0M8vjC+FX5cZZP/+nOZlDC0mrYvhtgntnzbX/rMUSdqAdpLjtdkFyAO+TaY5w1/WP24dMtlWvE4wJZ6BHQMX//1eOI5Q6nf58rMLZ223QF8VrgrgqVKAGDzYSBHseUYQMBgVOv0tgVeIGnfbL+KRxzMJv6ZZH2GgM7GnN7PT/JlItXhqi5KuZXk7k3bg4CXjHcVBPYG2d3g9ZYxvzNXTnBaZWIOjveUS0+lTiivH/lAdB30oaLiL6HKLk9aP+ypPhx25g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(64756008)(2906002)(86362001)(8676002)(66476007)(5660300002)(83380400001)(66946007)(186003)(55236004)(76116006)(316002)(71200400001)(26005)(53546011)(6506007)(33656002)(66556008)(8936002)(6916009)(7696005)(52536014)(66446008)(4326008)(54906003)(478600001)(55016002)(9686003)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 2W0WzavkYSa/9qFgquW8QVbIdmUKlTHt+rG4VZhFkwqYypeeG12PnsP57rupJ5JQAS1TFxaoayRoVdJzuKYwxz+wZf43kAdKTodlwT1fwtQpwS0g87AGaPd6LnvUTweLNxbahNciFr5asmjmjIL6KrbRoBAi0sRWqSZm+pNgn3dsjnSHuncJNm7dMMDlwaJAwlHH+t2fpySsNADI9gGP+MDvPQFPiGwPSClY6k3CkaokCDWqhXpzzWBsXlSVfDZ0gm7bWfsVpKg9gz70UCXkPfxicjmoFZr/X8ske+d46SAWO1e5TaqlgpG64Ceo+wgEZZlW78CXhikZ2heYi/VxnIYfl9PRqgqsYGR3mtL9oWiJqoYItHq7xu2EwNFYVhje454sCsdBgDXW5hmW3OTdZfeYQ1MfqaslFkukm7/sSQH4xWeyTBtdvjAF1F3qYeamZVIPaz5/AIvPsTE4gl3+4luV4iZVvQOCYpuUi0PyWqgRkyjHJJ29ZEL3jz5u+KSBOBLzwUwqBzruah+nB7g4CDgXoH0jHWZvZflqioy1oAZkRKlqkS8vpVUfL6qH3mYLGNi2UQ5dSv+/DlEWUny7zjdpor4D6lzEmFpUyKpRGxBN1WyBgYDPDfQFnJfaQvCimAcnABk9n1eZsHbHJUSSlH8/02A0tQ3LzfCazexN2pd38+313WWc4C4qSg4BsyAYpiU2+fWMyP5HB+KR+l7xrjTr/aeHMn83rbP3fk2Qmdsi6Hg+5Q75O4N6VDioyAuKVDUR2F5bYZDFJXAuipY+8zgAeRO7GimhVw2wkEs1UDwY9xKolRugQhh/cme+uoOCfs1UolG7rx5Ti+KHrYDarnvgGFzGt0Xh3pihfg5qJG2N4fdbvS4+BoEYOOlRJg3j9xH2WrN6D+QZAi5x2dQe7Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d6f610-5e72-48f6-7c0a-08d886e29e94
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 08:11:55.3131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KU/5LD1xwZzgJlaURIpbqgxptncP0BTm9zRcOSVDfVz/F0lGF8ePym/z9dHUMZQW+EnHtPYQ+2R86UPuGNvOpCo71ed/6lwBMAx4kgl010Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR10MB1559
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dimitry,

Thank you for that.
What about the other patches?

Regards,
Andrej

> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>=20
> Sent: Thursday, November 12, 2020 2:54 AM
> To: Valek, Andrej (ADV D EU SK SI-BP1) <andrej.valek@siemens.com>
> Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; kbuild-all=
@lists.01.org
> Subject: Re: [PATCH v2] Input: st1232 - add support resolution reading
>=20
> On Tue, Nov 03, 2020 at 08:39:49AM +0100, Andrej Valek wrote:
>> Hard-coding resolution for st1633 device was wrong. Some of LCDs like=20
>> YTS700TLBC-02-100C has assembled Sitronix st1633 touchcontroller too.=20
>> But the resolution is not 320x480 as was hard-coded.
>> Add new function which reads correct resolution directly from register.
>>=20
>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>
> Applied, thank you.
>
> --
> Dmitry
