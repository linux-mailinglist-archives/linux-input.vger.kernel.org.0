Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39CFB9B9E0
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2019 02:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfHXAmi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 20:42:38 -0400
Received: from mail-eopbgr700123.outbound.protection.outlook.com ([40.107.70.123]:50272
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725283AbfHXAmi (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 20:42:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjR1sZslJ7Q3b8KPwCIzKxCeR13I/JGYdCRp5QlwqA5w0o7t+73eia88kZQeB5fL0YpmI0URzmCroj7Dyjq9Ejbfl6JZTxDxa84oxX7KI0MIOgplYjmV2AhaGBj1Nhuq27NBtUUO91B26y7Xz3X4/HQ4TQt/sM+o0tn+HTkn83ZOaslDaBLvcSVjw2fIPM3zeADYgHutCD8qRB8Y2N0AhKH76/3Mrsz7P2FaCDXu5D7ggIl/g2LUZlZ19bu2TUWlwALyRT9OIK592xiX11aNoXgbZah909JtcyRvNTL/5JYokUBouT+UtJdZzXoiWJAYPghqTrYkKqXa82nJkcyVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWqb6q6MaSOYZ4RAIX3+9+X4vEZTEnPPMBnHjQdvmrk=;
 b=mQ0p1PhfaqN7VfcihSu8GY7GUgCQKoLzBFclHYviYCoB/M90WMkLXFDmnVVoaQ+ZGmSJlxVDybQTqJAYGEj3RkmZPK+f7hwki3wUnPxrspr+nrHTmptukVQQi3xDaT7ILO2cUi9N95u2twmFv3KS2nTeh2Y0CB3JQuzrhM1aLas96x6HFqznl/676iG5srmqzVlyKatDHkL9TSxK4+Va6UUzmyZajILg/oyEHxsx7XqdOxFM1z65ZBY63+1P0StRH+0BwX9X6GGYLf0FwBSqWp0ECjHB0rCGLKY/j+syZHQ8uKoUkuj7/3zV9CAXTHe6txvqF2D498L1o5psEUc9/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 160.33.194.231) smtp.rcpttodomain=kernel.org smtp.mailfrom=sony.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=sony.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Sony.onmicrosoft.com;
 s=selector2-Sony-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWqb6q6MaSOYZ4RAIX3+9+X4vEZTEnPPMBnHjQdvmrk=;
 b=DwRNEKn9qWuLexTDrQn1MfPILPvO3UFCnFe7J08kadsn6T/3JA2OULM2draf/z2k5AckDgQ31TOLXNweI7Yx6Y4BN0nxmpPxcwrmTHLghpy1uHJKqgFvkBaRV00omtoKmgsqGJxrNhVkWDipxI3h5luwij8Ab2OOdePvF97IOhk=
Received: from DM5PR13CA0050.namprd13.prod.outlook.com (2603:10b6:3:117::12)
 by DM5PR13MB1434.namprd13.prod.outlook.com (2603:10b6:3:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.15; Sat, 24 Aug
 2019 00:41:55 +0000
Received: from SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::202) by DM5PR13CA0050.outlook.office365.com
 (2603:10b6:3:117::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.11 via Frontend
 Transport; Sat, 24 Aug 2019 00:41:55 +0000
Authentication-Results: spf=pass (sender IP is 160.33.194.231)
 smtp.mailfrom=sony.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=sony.com;
Received-SPF: Pass (protection.outlook.com: domain of sony.com designates
 160.33.194.231 as permitted sender) receiver=protection.outlook.com;
 client-ip=160.33.194.231; helo=usculsndmail04v.am.sony.com;
Received: from usculsndmail04v.am.sony.com (160.33.194.231) by
 SN1NAM02FT053.mail.protection.outlook.com (10.152.72.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2199.13 via Frontend Transport; Sat, 24 Aug 2019 00:41:55 +0000
Received: from usculsndmail12v.am.sony.com (usculsndmail12v.am.sony.com [146.215.230.103])
        by usculsndmail04v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with ESMTP id x7O0frvh014172;
        Sat, 24 Aug 2019 00:41:54 GMT
Received: from USCULXHUB08V.am.sony.com (usculxhub08v.am.sony.com [146.215.231.169])
        by usculsndmail12v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with ESMTP id x7O0frF2005808;
        Sat, 24 Aug 2019 00:41:53 GMT
Received: from USCULXMSG13.am.sony.com ([146.215.231.78]) by
 USCULXHUB08V.am.sony.com ([146.215.231.169]) with mapi id 14.03.0439.000;
 Fri, 23 Aug 2019 20:41:52 -0400
From:   <Roderick.Colenbrander@sony.com>
To:     <jikos@kernel.org>, <stern@rowland.harvard.edu>
CC:     <andreyknvl@google.com>, <gustavo@embeddedor.com>,
        <hdanton@sina.com>, <syzkaller-bugs@googlegroups.com>,
        <linux-input@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] HID: USB: Fix general protection fault caused by
 Logitech driver
Thread-Topic: [PATCH] HID: USB: Fix general protection fault caused by
 Logitech driver
Thread-Index: AQHVWZVNSKI3nkEJ/k+tQRra1utmzKcJdZDM
Date:   Sat, 24 Aug 2019 00:41:52 +0000
Message-ID: <1DD62093774CEE42AFC16E785A108804ABFF456A@USCULXMSG13.am.sony.com>
References: <Pine.LNX.4.44L0.1908221619370.1311-100000@iolanthe.rowland.org>,<nycvar.YFH.7.76.1908231128260.27147@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.1908231128260.27147@cbobk.fhfr.pm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [146.215.228.6]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:160.33.194.231;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10019020)(136003)(396003)(39860400002)(346002)(376002)(2980300002)(199004)(189003)(186003)(7696005)(6116002)(23726003)(33656002)(47776003)(66066001)(229853002)(478600001)(8936002)(2876002)(3846002)(55846006)(70586007)(2906002)(70206006)(46406003)(86362001)(336012)(11346002)(426003)(8746002)(7736002)(305945005)(2171002)(4326008)(956004)(316002)(110136005)(356004)(476003)(102836004)(446003)(37786003)(26005)(486006)(5660300002)(106002)(54906003)(97756001)(50466002)(6246003)(8676002)(246002)(76176011)(126002)(55016002)(5001870100001);DIR:OUT;SFP:1102;SCL:1;SRVR:DM5PR13MB1434;H:usculsndmail04v.am.sony.com;FPR:;SPF:Pass;LANG:en;PTR:mail04.sonyusa.com,mail.sonyusa.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cac92904-6909-4bc6-ff27-08d7282bdd1a
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(4709080)(1401327)(2017052603328)(7193020);SRVR:DM5PR13MB1434;
X-MS-TrafficTypeDiagnostic: DM5PR13MB1434:
X-Microsoft-Antispam-PRVS: <DM5PR13MB1434C6E34D7290B637049D0898A70@DM5PR13MB1434.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0139052FDB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Qj1aWUyU6SSi/0JKpwZ5rCkhz5ERaRk/EvKEZGGopMLe3SfbfGPqJFRjIH+mvWCX3St55Kr3qTsW89gh12OMrmntzoZsc/a98msYTnpWwf72V35jYYPprUKOZAewHCJhLtNXzaWfbrl6vshbXd+Ru4Z4wY/JAuD3GV74sRknqiz63Hec30XoQ1dZwNJhxXyTfkqwNmgFZE+gtjOTESbV+uvO9PxVC1h8gNCWdkbZ07BTtWOcRFSJelVbt3LpjkshHDW84IJQ3YfjJT6e1r35SttzpqrhDos1WZ/3/8wIKc+JC/V3mORs1hr+FQntNUSpRuEUqvf7XaTl7Rh2jFxjvOMa1BSpAl9q3NdNsnFpsUw16L+geZPqei/akFG4+oDv9am/jbIJNd3R/snE6W4N32PQc3n8/HCydNITG9/W3xs=
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2019 00:41:55.0409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cac92904-6909-4bc6-ff27-08d7282bdd1a
X-MS-Exchange-CrossTenant-Id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=66c65d8a-9158-4521-a2d8-664963db48e4;Ip=[160.33.194.231];Helo=[usculsndmail04v.am.sony.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1434
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 22 Aug 2019, Alan Stern wrote:=0A=
=0A=
> > > > > I've ran the fuzzer with your patches applied overnight and notic=
ed=0A=
> > > > > another fallout of similar bugs. I think they are caused by a sim=
ilar=0A=
> > > > > issue in the sony HID driver. There's no hid_hw_stop() call in th=
e "if=0A=
> > > > > (!(hdev->claimed & HID_CLAIMED_INPUT))" case in sony_probe(). Doe=
s it=0A=
> > > > > look like a bug to you?=0A=
> > > >=0A=
> > > > It looks like the relevant hid_hw_stop() call is the one at the end=
 of=0A=
> > > > sony_configure_input().  But I can't tell if doing that way is vali=
d or=0A=
> > > > not -- in practice the code would end up calling hid_disconnect() w=
hile=0A=
> > > > hid_connect() was still running, which doesn't seem like a good ide=
a.=0A=
> > > >=0A=
> > > > There's a comment about this near the end of sony_probe().  I suspe=
ct=0A=
> > > > it would be better to call hid_hw_stop() in the conditional code=0A=
> > > > following that comment rather than in sony_configure_input().=0A=
> > > >=0A=
> > > > Either way, these are all things Jiri should know about or check up=
 on.=0A=
> > > >=0A=
> > > > Have you gotten any test results from syzbot exercising these pathw=
ays?=0A=
> > > > You ought to be able to tell which HID driver is involved by lookin=
g=0A=
> > > > through the console output.=0A=
> > >=0A=
> > > Yes, a typical crash is below, that's why I thought it's the sony=0A=
> > > driver. Adding hid_hw_stop() in sony_probe() stops the issue from=0A=
> > > happening, but I don't know whether it's the right fix.=0A=
> >=0A=
> > Probably you have to add hid_hw_stop() in sony_probe() and remove it=0A=
> > from sony_configure_input().  But like I said above, Jiri should look=
=0A=
> > into this.=0A=
=0A=
> It almost certainly is, thanks.=0A=
=0A=
> Adding Roderick to CC ... Roderick, will you be able to test and submit=
=0A=
> a patch fixing that?=0A=
> =0A=
> --=0A=
> Jiri Kosina=0A=
> SUSE Labs=0A=
=0A=
Sure we will have a look and do some testing. Hopefully we can share a patc=
h some time next week.=0A=
=0A=
Thanks,=0A=
Roderick=
