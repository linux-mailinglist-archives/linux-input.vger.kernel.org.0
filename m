Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E64346A4A5
	for <lists+linux-input@lfdr.de>; Mon,  6 Dec 2021 19:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234358AbhLFSfO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Dec 2021 13:35:14 -0500
Received: from mail-mw2nam08hn2226.outbound.protection.outlook.com ([52.100.162.226]:42305
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233544AbhLFSfO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 Dec 2021 13:35:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n65oe5nTydKhHV9My0pw7HrrX6YIYeSRg+PQvY1J/t+K6gjRtD5Y+AQOlpI0J1CQfCbZaUI21cUW2yg7l5aswcVYKE222MUAYTWLmavYkWsVPnRrhYg7QNKzbk+SYvSWFa+DAHX1MA9ba30qRHgdfuBeON8xlQYXWfMkps47k46DqmlP0n4iTA1vU7alzErrXYu+vPT02NDgYpYZQuWTR9wAjPmRHT29PG6HlsMV7LqOpWwQe7vNo4ozcXpRFrI4z9oV+Yw800UEtPMedsWNMiM68xxdu4RMIcoZgiyyCfh6uE7vzeHu1PLVPyellVPehlvybb0oDngjusCi3Xk3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=kpH8GBCSzGP81RDecrFr3+4u5RXxxbH5sbf5x6rMtKX0JUGht6bNtIC1GtuChcPOMr2M3a1m/NIox5/mMfTxsUOXW8ht4OKsqFc+Ymbr23fXxV7Fo6tx7I5cXgdpeevM24kai+heM84YxCE8QKbU4eZ8N3mNq7Hy4px6A8p/Eu3KJf3YWepqzYyThJd2unrpoITPWbvE+76+sTK4cPBg8LcPZNlHShqSbHJ/5qNvby4kCvUgAEbJvgfCs6VaTYZwGT65KMx+NGOhetWFnvJFzTPcJEhKjJObZ0cqmx+LZ4+/j6t/CHbIyl+1vbMY4/cKjM/8vNcJlV5R9TCKbK0gbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 146.201.107.145) smtp.rcpttodomain=sbcglobal.net smtp.mailfrom=msn.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=msn.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fsu.onmicrosoft.com;
 s=selector2-fsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=NbHlrrbE27RrCBMIXe3wXj6aXp27PqR3DAcHX625PdhpQCYa2KegJEY//A2wQvPMegqpcY3rN0cl/w1NQBx0ugEyAgeHcP4Oy40uaqzlmcAZvi5PXx7jeK1ZljG83mTd/P1+shI+EtgI1YqbPxntYDMiEyjZ+zpITv/HJnqNaq4=
Received: from BN0PR04CA0187.namprd04.prod.outlook.com (2603:10b6:408:e9::12)
 by DM8P220MB0407.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:24::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.19; Mon, 6 Dec 2021 18:31:34 +0000
Received: from BN8NAM04FT066.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::e3) by BN0PR04CA0187.outlook.office365.com
 (2603:10b6:408:e9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20 via Frontend
 Transport; Mon, 6 Dec 2021 18:31:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 146.201.107.145) smtp.mailfrom=msn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=msn.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 msn.com discourages use of 146.201.107.145 as permitted sender)
Received: from mailrelay03.its.fsu.edu (146.201.107.145) by
 BN8NAM04FT066.mail.protection.outlook.com (10.13.161.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:31:33 +0000
Received: from [10.0.0.200] (ani.stat.fsu.edu [128.186.4.119])
        by mailrelay03.its.fsu.edu (Postfix) with ESMTP id 40B27951BD;
        Mon,  6 Dec 2021 13:30:55 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re: From Fred!
To:     Recipients <fred128@msn.com>
From:   "Fred Gamba." <fred128@msn.com>
Date:   Mon, 06 Dec 2021 19:30:11 +0100
Reply-To: fred_gamba@yahoo.co.jp
Message-ID: <5c4e2481-2867-46ae-ae7c-bb3d7b8c1e13@BN8NAM04FT066.eop-NAM04.prod.protection.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b1df9f7-0bbb-41e8-09c9-08d9b8e6a15c
X-MS-TrafficTypeDiagnostic: DM8P220MB0407:EE_
X-Microsoft-Antispam-PRVS: <DM8P220MB0407BBE29C3E858C34D3A107EB6D9@DM8P220MB0407.NAMP220.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:146.201.107.145;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:mailrelay03.its.fsu.edu;PTR:mailrelay03.its.fsu.edu;CAT:OSPM;SFS:(4636009)(84050400002)(46966006)(40470700001)(7596003)(7116003)(7416002)(7366002)(5660300002)(86362001)(356005)(83380400001)(82310400004)(2906002)(40460700001)(6266002)(82202003)(7406005)(6862004)(31696002)(786003)(9686003)(26005)(2860700004)(31686004)(336012)(35950700001)(316002)(956004)(508600001)(6666004)(6200100001)(70206006)(8676002)(47076005)(8936002)(70586007)(3480700007)(480584002);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mk50UDh3UFJ0Tld5T3VaYkNReXdrTVVUZnNWYS83WldoK1BpMTl4cVkzaDhP?=
 =?utf-8?B?OU1LTWdQQVRPQlFrK05yeVZwL3d4SFhEQ1NWVnhCSjdOS053VXVRdG1XME85?=
 =?utf-8?B?WkFDa0VBeTVBNGpFMXBwNi9BZ2lXOUNWdld6RERDMUt3V2MxN0x6dk41Ykta?=
 =?utf-8?B?Q29CY2lRazg1YmNqaXQyUUFyS2hyVWt6MG9OcDh6KzczaGk0djhIYThGdVhx?=
 =?utf-8?B?Uk9DQlRzMG43K252b1VFTXJOV042MFVVQUNUcmhoR1R0cDJvWHlJNlRrQkFk?=
 =?utf-8?B?TU04aWdQemJnQXQ0N0lzTnpSL1g4ZUtyRjB5SVFmS2IyU29BRlVWT2xIVUQx?=
 =?utf-8?B?QWgwZlpINkxWeVJRTytEdFhJc0tLb3pHQ1pHT3JlMkxXR2hRbjdaZWoyN2pu?=
 =?utf-8?B?bVYxejh1bmw0N1dGbEZKTUdqNHFVR1pjT0tleFJXWjVqd1lHYjdsRk5qU0dL?=
 =?utf-8?B?eGhGYkdSd1MzTnBHNUhMS0Fkb2xCUGNhRGVRaUFrVmFYQ3J5b0kyQlRZaXlO?=
 =?utf-8?B?ZUlLQnc2YVRWSGcrMGsrQkRFSUxuSlhkbXFPdUUwajBYeVl1QWsybjArUHVw?=
 =?utf-8?B?K2E3TEFHVmlsalhJbWVYc042MFhNRjlJVkl0aWVTR0p0aWZGTkhpb0trUnZ0?=
 =?utf-8?B?NU44NTZPTmNRcE1Zell4QXljTFBTWEJLdDdjRUtDYXNLb00yUkhFNU1qK1RL?=
 =?utf-8?B?RW1NOEFiYSt4QmRFUGpnQS81T2p0V1VWZkMzanJjMWlydjRYUWxRWW1MV1NJ?=
 =?utf-8?B?V1U4ZlhhcTFDQ1N2ODhhZmY3WHozKzdmQ1kzSE9KTmg5cTVxUlN0SGNhRXdO?=
 =?utf-8?B?MTZnbzhDSEJlTy95bmpQMTA4d0FqMkRkY29DYWUzeWF6U0NzWUNxdm1xNkl3?=
 =?utf-8?B?aVJIYi9Ia052VWdqWEtydGZhdUpycmorU0FSQUFZcjQyNStscVRHK0kvYkFV?=
 =?utf-8?B?NGdldTYyTVJnbU96eUJSdi94ZVB5WjZ5MWljb04vek41Y0Qwd2pEWE4rWUEx?=
 =?utf-8?B?dXJCbFZnSmJuTGd5TSs3RU9XL0JzRW42djZrYjBsb0NJbzRBcVRLRmJ2dkpR?=
 =?utf-8?B?R2JyUDY4ZGNrdUJqYkkyM3JKbGJBMHQrZkdVUlFkVjlYbjZiQmlIT216ZzZz?=
 =?utf-8?B?QmVlczlndFl3WFpMcDRGVVNUaSsrQmtmRVhRSlJ4VjRTbXZPUk05NHhuR0k3?=
 =?utf-8?B?eXBUZHZLejg4elM4djQxYjRJdVl5eGFKdGRtQVdBRjl3VTVtaU03dzdwbkM1?=
 =?utf-8?B?Z1duWXoyQ3JUdWhzQW8welJrTW5CUzBYalhIYTdBdFhoclI3SWhBZkJndVRB?=
 =?utf-8?B?R0pDWloxcEkycVc3WTdZTWc3cmFTaGFnWElhUW5Qcm9uRkNCQTVKaDdtQUJa?=
 =?utf-8?B?MVUwekNUNlBWbGV2YlNUbmNTa1dRVmhqZWt0OGtDZ25iWlU4WFRJTmZ5S0NM?=
 =?utf-8?Q?xbqVWMX2?=
X-OriginatorOrg: fsu.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:31:33.7694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1df9f7-0bbb-41e8-09c9-08d9b8e6a15c
X-MS-Exchange-CrossTenant-Id: a36450eb-db06-42a7-8d1b-026719f701e3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a36450eb-db06-42a7-8d1b-026719f701e3;Ip=[146.201.107.145];Helo=[mailrelay03.its.fsu.edu]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM04FT066.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8P220MB0407
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I decided to write you this proposal in good faith, believing that you will=
 not betray me. I have been in search of someone with the same last name of=
 our late customer and close friend of mine (Mr. Richard), heence I contact=
ed you Because both of you bear the same surname and coincidentally from th=
e same country, and I was pushed to contact you and see how best we can ass=
ist each other. Meanwhile I am Mr. Fred Gamba, a reputable banker here in A=
ccra Ghana.

On the 15 January 2009, the young millionaire (Mr. Richard) a citizen of yo=
ur country and Crude Oil dealer made a fixed deposit with my bank for 60 ca=
lendar months, valued at US $ 6,500,000.00 (Six Million, Five Hundred Thous=
and US Dollars) and The mature date for this deposit contract was on 15th o=
f January, 2015. But sadly he was among the death victims in the 03 March 2=
011, Earthquake disaster in Japan that killed over 20,000 people including =
him. Because he was in Japan on a business trip and that was how he met his=
 end.

My bank management is yet to know about his death, but I knew about it beca=
use he was my friend and I am his Account Relationship Officer, and he did =
not mention any Next of Kin / Heir when the account was opened, because he =
was not married and no children. Last week my Bank Management reminded me a=
gain requested that Mr. Richard should give instructions on what to do abou=
t his funds, if to renew the contract or not.

I know this will happen and that is why I have been looking for a means to =
handle the situation, because if my Bank Directors happens to know that he =
is dead and do not have any Heir, they will take the funds for their person=
al use, That is why I am seeking your co-operation to present you as the Ne=
xt of Kin / Heir to the account, since you bear same last name with the dec=
eased customer.

There is no risk involved; the transaction will be executed under a legitim=
ate arrangement that will protect you from any breach of law okay. So It's =
better that we claim the money, than allowing the Bank Directors to take it=
, they are rich already. I am not a greedy person, so I am suggesting we sh=
are the funds in this ratio, 50% 50, ie equal.

Let me know your mind on this and please do treat this information highly c=
onfidential.

I will review further information to you as soon as I receive your
positive response.

Have a nice day and I anticipating your communication.

With Regards,
Fred Gamba.
