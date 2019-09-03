Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D890EA7421
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 22:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfICUBL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 16:01:11 -0400
Received: from mail-eopbgr720117.outbound.protection.outlook.com ([40.107.72.117]:52005
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726085AbfICUBK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Sep 2019 16:01:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWa5TIUmibXc6c91a923V9sFk9U5hYPbGOy47rOBHwEXx+oNL8rj5nS0i7Fiy35Pu5JCcKs5rJj5GkdWCgNbH7VdhTehb6HOLl1Q75uu36rmDwwmXeh1T9pm/NwNUkvwbC+R885VRJhgBL+r9rFuPBNMtsRAZ/iq9IRpavL2+pnOqadKiffItnGznIHmBnlrP4UZBO2T1II3NfGbad0DGiW+aKcRvXN3rULa/3uNDlkfNQ+19sxQGfenEWqTSpi9uY6JgXupEms6/WOaEMlTmNSdiM59NCkYT5oRcyKwncCDyik2JvuCINMJbagYiiCuvOKv0VpLwdh936jR89BEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgVGz95PStLBLF7zz0kbR7DyekeyAB4DZ4dHgWajqd8=;
 b=X6N81mRCaYCwCv/B1lMHVmsvDXbcJ8bt8Xc70XX/u8P8OeEwKYi2qe2bYGUgFgJDUb9mI4FTmoHXUvDy2FEe5lbOE8dP6OW2/MGmo6TOR2UEg2CNkOfyl0RnXuslx82mcseOEwbGBlkRH+ug0bpnX1RDQb4ZLoMNu4O5WuGFWQj1RQc2RHRjrcIov3tS8vZDpbR2NCwpGbDPoLn2zXmMMiAZsZGA39bUZcs0bt8Fxg3/khq/Hfm0ipOCx5C5AX+rLkDbFh3RsfeC9IwOy2fS0KwHHPwzFscwy+YdriC4fntj2zIufm5RJaqqCwEAgsIhR5fHUq3ivlTfWprn7KUspQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 160.33.194.231) smtp.rcpttodomain=google.com smtp.mailfrom=sony.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=sony.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Sony.onmicrosoft.com;
 s=selector2-Sony-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgVGz95PStLBLF7zz0kbR7DyekeyAB4DZ4dHgWajqd8=;
 b=NybeJf08ho+w8dADsGwOYX7XBwjSBOqCXiAu6VMwU8o/sAJ3JAqX6PbvCGcJaSuEfI4fGB/knzcpHxiWDK5rZUdi0qt4lgcO2AchoXyQ7jNhoWK6aUxZv9kio0ss1oA1AWmYfKyxF263oG7HShOOK6ruOQYK8lq6aCQnFdQL3yk=
Received: from CY4PR13CA0040.namprd13.prod.outlook.com (2603:10b6:903:99::26)
 by BN6PR13MB1826.namprd13.prod.outlook.com (2603:10b6:404:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.10; Tue, 3 Sep
 2019 20:01:03 +0000
Received: from CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::201) by CY4PR13CA0040.outlook.office365.com
 (2603:10b6:903:99::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.7 via Frontend
 Transport; Tue, 3 Sep 2019 20:01:02 +0000
Authentication-Results: spf=pass (sender IP is 160.33.194.231)
 smtp.mailfrom=sony.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=pass action=none header.from=sony.com;
Received-SPF: Pass (protection.outlook.com: domain of sony.com designates
 160.33.194.231 as permitted sender) receiver=protection.outlook.com;
 client-ip=160.33.194.231; helo=usculsndmail04v.am.sony.com;
Received: from usculsndmail04v.am.sony.com (160.33.194.231) by
 CY1NAM02FT063.mail.protection.outlook.com (10.152.75.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Tue, 3 Sep 2019 20:01:02 +0000
Received: from usculsndmail11v.am.sony.com (usculsndmail11v.am.sony.com [146.215.230.102])
        by usculsndmail04v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with ESMTP id x83K102V026828;
        Tue, 3 Sep 2019 20:01:01 GMT
Received: from USCULXHUB02V.am.sony.com (hub.bc.in.sel.sony.com [146.215.231.16])
        by usculsndmail11v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with ESMTP id x83K10YF008802;
        Tue, 3 Sep 2019 20:01:00 GMT
Received: from USCULXMSG13.am.sony.com ([146.215.231.78]) by
 USCULXHUB02V.am.sony.com ([146.215.231.16]) with mapi id 14.03.0439.000; Tue,
 3 Sep 2019 16:01:00 -0400
From:   <Roderick.Colenbrander@sony.com>
To:     <andreyknvl@google.com>
CC:     <jikos@kernel.org>, <stern@rowland.harvard.edu>,
        <gustavo@embeddedor.com>, <hdanton@sina.com>,
        <syzkaller-bugs@googlegroups.com>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] HID: USB: Fix general protection fault caused by
 Logitech driver
Thread-Topic: [PATCH] HID: USB: Fix general protection fault caused by
 Logitech driver
Thread-Index: AQHJUTD4m0O+HaIaMR6nsuxwGh4CjAMH2rJ9AquOy3unBI78gIAAVPjS
Date:   Tue, 3 Sep 2019 20:00:59 +0000
Message-ID: <1DD62093774CEE42AFC16E785A108804AC002291@USCULXMSG13.am.sony.com>
References: <Pine.LNX.4.44L0.1908221619370.1311-100000@iolanthe.rowland.org>
 <nycvar.YFH.7.76.1908231128260.27147@cbobk.fhfr.pm>
 <1DD62093774CEE42AFC16E785A108804ABFF456A@USCULXMSG13.am.sony.com>,<CAAeHK+yissGc22RXh6t3KZxnGL=6_+PdP7LoQ_dvfALJcdQk8g@mail.gmail.com>
In-Reply-To: <CAAeHK+yissGc22RXh6t3KZxnGL=6_+PdP7LoQ_dvfALJcdQk8g@mail.gmail.com>
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
X-Forefront-Antispam-Report: CIP:160.33.194.231;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10019020)(396003)(346002)(39860400002)(136003)(376002)(2980300002)(199004)(189003)(478600001)(106002)(6916009)(5660300002)(54906003)(956004)(70206006)(55016002)(76176011)(8676002)(97756001)(33656002)(8746002)(336012)(186003)(55846006)(8936002)(4326008)(246002)(70586007)(46406003)(26005)(53546011)(37786003)(102836004)(316002)(2906002)(229853002)(66066001)(86362001)(6246003)(50466002)(7696005)(47776003)(446003)(426003)(126002)(476003)(7736002)(2351001)(305945005)(23726003)(486006)(356004)(11346002)(2876002)(6116002)(3846002)(5001870100001);DIR:OUT;SFP:1102;SCL:1;SRVR:BN6PR13MB1826;H:usculsndmail04v.am.sony.com;FPR:;SPF:Pass;LANG:en;PTR:mail.sonyusa.com,mail04.sonyusa.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad3a927c-b5b9-40ee-a0ff-08d730a972a1
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(4709080)(1401327)(4618075)(2017052603328)(7193020);SRVR:BN6PR13MB1826;
X-MS-TrafficTypeDiagnostic: BN6PR13MB1826:
X-Microsoft-Antispam-PRVS: <BN6PR13MB1826D337B2FF52467AA269A898B90@BN6PR13MB1826.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 01494FA7F7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fShZZyVw7HfuaHHKtVZ+WUquUXpTHundSNdjcrkpvwQLS6glnuE9yYpDb+GBcUTqx7Z0twmtBsea1o20Wga/Aka9KVumOHTrsTjmA2cGwPeVkG3oCDPdu0JvWYJEnj/+XrhckdvZBiohAEYRs/xSNSSAJXPoWHpgm6PO0K+i4EEhduQwUzGgN0LyjeIvrPjKhvhraxqosUijqagcpTmP2Vk72z7HRAKvT43QrDx8zxp6994RKS0TV/phM77my/UutROF7Fs0Ky/iOK0x9qX45w0ZXRcS4wBRldZIpSmDrrMCMRf/bWMtxWxyk92oLbRlWzMnqFBN0UVy+eJhsMdniSRlOCLvSIBL7Anb2ROoLd5VItnvy5VIQn8FeqI4Z1M7Qwb1eCAZP3MA1Feh3MEX/vmcVDoDyDl2q5KZ+V5RUJA=
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2019 20:01:02.1761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3a927c-b5b9-40ee-a0ff-08d730a972a1
X-MS-Exchange-CrossTenant-Id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=66c65d8a-9158-4521-a2d8-664963db48e4;Ip=[160.33.194.231];Helo=[usculsndmail04v.am.sony.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR13MB1826
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> From: Andrey Konovalov [andreyknvl@google.com]=0A=
> Sent: Tuesday, September 03, 2019 3:46 AM=0A=
> To: Colenbrander, Roderick=0A=
> Cc: Jiri Kosina; Alan Stern; Gustavo A. R. Silva; Hillf Danton; syzkaller=
-bugs; linux-input@vger.kernel.org; USB list=0A=
> Subject: Re: [PATCH] HID: USB: Fix general protection fault caused by Log=
itech driver=0A=
=0A=
> On Sat, Aug 24, 2019 at 2:41 AM <Roderick.Colenbrander@sony.com> wrote:=
=0A=
>=0A=
> On Thu, 22 Aug 2019, Alan Stern wrote:=0A=
> >=0A=
> > > > > > > I've ran the fuzzer with your patches applied overnight and n=
oticed=0A=
> > > > > > > another fallout of similar bugs. I think they are caused by a=
 similar=0A=
> > > > > > > issue in the sony HID driver. There's no hid_hw_stop() call i=
n the "if=0A=
> > > > > > > (!(hdev->claimed & HID_CLAIMED_INPUT))" case in sony_probe().=
 Does it=0A=
> > > > > > > look like a bug to you?=0A=
> > > > > >=0A=
> > > > > > It looks like the relevant hid_hw_stop() call is the one at the=
 end of=0A=
> > > > > > sony_configure_input().  But I can't tell if doing that way is =
valid or=0A=
> > > > > > not -- in practice the code would end up calling hid_disconnect=
() while=0A=
> > > > > > hid_connect() was still running, which doesn't seem like a good=
 idea.=0A=
> > > > > >=0A=
> > > > > > There's a comment about this near the end of sony_probe().  I s=
uspect=0A=
> > > > > > it would be better to call hid_hw_stop() in the conditional cod=
e=0A=
> > > > > > following that comment rather than in sony_configure_input().=
=0A=
> > > > > >=0A=
> > > > > > Either way, these are all things Jiri should know about or chec=
k up on.=0A=
> > > > > >=0A=
> > > > > > Have you gotten any test results from syzbot exercising these p=
athways?=0A=
> > > > > > You ought to be able to tell which HID driver is involved by lo=
oking=0A=
> > > > > > through the console output.=0A=
> > > > >=0A=
> > > > > Yes, a typical crash is below, that's why I thought it's the sony=
=0A=
> > > > > driver. Adding hid_hw_stop() in sony_probe() stops the issue from=
=0A=
> > > > > happening, but I don't know whether it's the right fix.=0A=
> > > >=0A=
> > > > Probably you have to add hid_hw_stop() in sony_probe() and remove i=
t=0A=
> > > > from sony_configure_input().  But like I said above, Jiri should lo=
ok=0A=
> > > > into this.=0A=
> >=0A=
> > > It almost certainly is, thanks.=0A=
> >=0A=
> > > Adding Roderick to CC ... Roderick, will you be able to test and subm=
it=0A=
> > > a patch fixing that?=0A=
> > >=0A=
> > > --=0A=
> > > Jiri Kosina=0A=
> > > SUSE Labs=0A=
> >=0A=
> > Sure we will have a look and do some testing. Hopefully we can share a =
patch some time next week.=0A=
=0A=
> Hi Roderick,=0A=
> =0A=
> I was wondering if you had a chance to look into this?=0A=
> =0A=
> Once the Logitech fix is upstream, this similar Sony bug will start=0A=
> producing a large number of similar syzbot reports since it causes a=0A=
> major memory corruption and we'll need to triage them all again. It=0A=
> would be nice to get the Sony fix merged together with the Logitech=0A=
> one. Or at least to have it available so I can apply it manually until=0A=
> it is merged.=0A=
> =0A=
> Thanks!=0A=
=0A=
Hi Andrey,=0A=
=0A=
We are still looking at the issue. I had one of my guys try the fix (and tr=
igger an error in sony_input_configured), but he claimed he crashed his ker=
nel. Due to the long weekend in the US, we didn't get back to looking at it=
 yet. We are looking at it some more today or tomorrow.=0A=
=0A=
Thanks,=0A=
Roderick=
