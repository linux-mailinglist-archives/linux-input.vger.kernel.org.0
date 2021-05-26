Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A2D391D5E
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 18:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbhEZQ4R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 12:56:17 -0400
Received: from mail-co1nam11on2076.outbound.protection.outlook.com ([40.107.220.76]:37505
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233550AbhEZQ4R (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 12:56:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZi7krt4Ch03JriO4Wzs73DDWgImSyhoSAu1YnokaN/Eq0gZbahSptUfKZ+G9zFRRQFPONOEh0Qs8IV2ytNzxVt6chS15e+grV4y5tHKR7/aOj9v3pgaKkZf6CaI/ib0nlXb3rZTmInG62CCTpdT8lZX4E3Zt0jUspt76joCcq/MwNjlLXzA1P63R9j5VyuzZHoXoYSX+kZKaOJtHZVxPRxyrn5DFmen9xQMetl7ITVixhV2WDKW+I/v6xwLZMIDvH7kTr2RyZMTLoeHm3k2ECEmam/aQ83/DFY5lYOsdx2coVRoEAQmBo1r38hg26TtZQhWkO2C0yYI9AbftmI55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEnoIS1iD9ch4uy8gnE5Wln7FJQ7yg6fBC5wsY3BIGM=;
 b=dqZsa+z5FACm5n2ytUjBBEU5DVX7F9WjGrYpz+5DJV7IuUnP95cZDIZiABlOphs1h6ge+OLcdt0CT/FtkDMCIkZJ9Sb5H0zsHoUX1XVJ4DnFTBBIbHba/q6Adxg4xBSDtGxk+yBbpJHR4IU/ge1FXyRGCU7I2WvWS9wdEXxEo/Ps8ZbYbCzawJeEPY8yHJNwQjaugJorPQsaQP0VEr7/LH61IqHSs4WGv4eVHpHhNCeh4DLc4pAHbdnxtafBNnLy/OVUSHdCXnJY65YLhroAyJu4te3FKb8YeKfh8zH/L64LLRfFTrOwsLyH0vmE+mJVis6P+xnEgBmdzq+qki5rMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEnoIS1iD9ch4uy8gnE5Wln7FJQ7yg6fBC5wsY3BIGM=;
 b=UOw8tHuiNaGVhUYD+qXcvkInZDfCR2S6AZDJYENwpgQ/4QMJG3rozXBiO85LCj++D2BfiTJdTt759QBCNjJHhnAl4gI3xXz8ctBOgMyq8hoz/NAYBMcfrEMKw5kYXn3EjWG9tpug58kkWCcsKjSRAD8GdhpyaFEWrd6Bp6PJgLs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM4PR12MB5167.namprd12.prod.outlook.com (2603:10b6:5:396::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Wed, 26 May
 2021 16:54:45 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::3157:cd9d:233e:70f9]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::3157:cd9d:233e:70f9%7]) with mapi id 15.20.4129.036; Wed, 26 May 2021
 16:54:45 +0000
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Cc:     "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        "Singh, Sandeep" <Sandeep.Singh@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>
From:   Basavaraj Natikar <bnatikar@amd.com>
Subject: [PATCH RESEND] amd_sfh: change in maintainer
Message-ID: <5f36f1b9-67f8-519d-051b-eb88fcfc2e71@amd.com>
Date:   Wed, 26 May 2021 22:24:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: MA1PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::26) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.90.99] (165.204.159.242) by MA1PR01CA0110.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 16:54:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0aca6a8-3eba-42cb-ae5c-08d92066f69f
X-MS-TrafficTypeDiagnostic: DM4PR12MB5167:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5167B770DAEC9003DE2F1055E6249@DM4PR12MB5167.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EyAj4TGpjx6H5uYL2pIH14GqOKPo352bQT4wcjACRtZWZ4Moz9PX3MdgbQLUGRCJ5OiTDX5UVBCmqX3SNtRdkbxSCA/lL6SmDrG+kTjSmMKwz1Gwlz3Vb/N0nbWQ+/JoyxfExxlfy5vLgEOfLdXA3V5VrBvFOy79X+uKw8a2iqKc4gHEEpiSXmV/XvCLmOvNW9LzXgbEdCWpTkcpiwOyVRZZHb+TSke6xHLiNlRHvm1Uph+styIj+fv+9GO7DXsmJ7CFnr7Ssx3/ppnx2PtykGUKABMtNOwH8qRDYQ6yYxy7FR4PAhfislb3zb/jMybVnKHFF6slfp+5gBtQN+HDWLEBQvWSmKyfZUS1Al8dFfnCBtrsss+yYjPaQqiWRuGMS3/cBOmG/wrQLk358H1q+0rh0jS/Ao5oxwU93ihloPu7HNhJbqNqMDToCqBhzQHsHaJnpPvZ7soU40FBNdP7nYTodnB8ojzooCimqoAKnQjLaDS1zgfnFCKswxcJELXuqIulEcHqoooBI+Pex4MfcMVYNEOeR+0VCpxvL+ABFL+uaDxfbp37EVOFvCRh15EqPsxulpyN4thdyEia+GCX5exZ3Cl3+s+AT9CDcv3k+nOxzkS4gPMIdYcGhxgnMfdYdcXcPz3Ns30KZUjIIZuOrRrpKRKXugtRUmcca5DLRunk4Fa97ULg/goeKdmzlQPi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(83380400001)(478600001)(316002)(8676002)(16576012)(186003)(31686004)(2616005)(66946007)(8936002)(36756003)(16526019)(38100700002)(26005)(4326008)(54906003)(956004)(2906002)(6486002)(5660300002)(4744005)(66556008)(6666004)(31696002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ODByWWVhZUw0c0twOGptZGwwcVU5RzlTa2x3dzQxZHI2UitiN2pSQUJNdXlM?=
 =?utf-8?B?ZU5vVWwrdlFWWS9CTTl0d1F4N0dQVG1NVUZDTU1PQTgrVGR2ZGNOR1FKREMz?=
 =?utf-8?B?bVFwVGJOWlhxblpxTmc2R2R2cVBTMzlrZFZROXNyUzd3YlZvSEErblBjdUVM?=
 =?utf-8?B?NStTMFJCUXJjeXJFUDkyMmxxUTFDVnBSdU1BOVBxalMyM1pCaENHakJVSG9O?=
 =?utf-8?B?MVB4eXNkY201TVV3djQ2MXFkMUtYaHFNOXZVVTNUQzVITmQxVlFLWWw4T0FI?=
 =?utf-8?B?Q3pPQ296czZwN0NFOS84WjVWckEzOThKSGpwR3NHeExaL2ZaeENwSmVBQXZt?=
 =?utf-8?B?ekJtWm93U1ZWUURBWWZ3Mlc5cEZsOVlBK3V2Um1KTVoyazhCYi9VZEZTZE9E?=
 =?utf-8?B?T2h6OStQbk1kRmcvUzZCU05HaENpTUJ3bk13cWMvL3BlbTJrN2pvV3RNczdB?=
 =?utf-8?B?cEpCV3NTVnd6dTIrMS9sQm43NWJueXNoNldBcHk2NHUzS21VTFE0d0RrT3VD?=
 =?utf-8?B?U3A5aUQyZk5LZnlDc2orTWIwWkFML3BtZkJHZkVhRnBLdVdhL0hsV3NOQnVr?=
 =?utf-8?B?c0ZQL2hyT0hrSlBRMzdpeThMQ2J2bzdvdE54b0JKQzlvTGFEejdIQXR2VnhB?=
 =?utf-8?B?SFRNVlV4ejJRV2ZDbUs5bnhWK1pIaHNWNTZZTmlodmxVOS9tSXhpeUxabGRv?=
 =?utf-8?B?am5OTkkzWXRZOXVYQmRLUUJrQ1oyaVhLVzNaZ3IwWmorbEVTenpHWjNlOGhr?=
 =?utf-8?B?ZDJ6aEhrdUZ4ZVZPYncxSEpHMFg0OU9nZk5iamVHdUt3Mzk3N25vTThFYjVa?=
 =?utf-8?B?QTQ5aEh3dFhpMnA3R2VLamVhNHp1bjJneEkrUGFPYnhFYjNta3RXczFBSldx?=
 =?utf-8?B?YS8wd240R0MyNUpOd2VzcnQ4aHhQckhNL2o2K3l5eHFIMkhycE4wNVlnenAy?=
 =?utf-8?B?MnE2MC9CdVZoa0dTdXJ5cDhsRWRFei9ZbGQ5NDVZeWlzVlc4LzJkc2hQTGZs?=
 =?utf-8?B?d0NFWEJXczJvM1MvQVBPbjhDU0F0RTNFbnpDQkw0c3ZpL2l2ODFzcnVxMjI5?=
 =?utf-8?B?SjFBcUFuV2cxdEljK2tuTHpEZ1lkc0ZGQkRiTlU5Y2ZOY3g4Sy9teld1MGZD?=
 =?utf-8?B?ODJiOWwzQm5yLyt4cXZMSXllaHgrWFA0VDMrWHNwSEpSMDQ3cC9EOEVGK1lP?=
 =?utf-8?B?VkZ4djdydUR6UXNyL0R2RlRRQVhHV1dLWHBxRFFISGpoYm55ZnRSTnBOaDV0?=
 =?utf-8?B?NzFKMEdudHdXM1BXeDYxRC9QV3pXQ2pKWGtKRGdodmxVcnBvQ09ISjlDeUVC?=
 =?utf-8?B?RFZPK200NnVrblRuNlNQWEEwalVicFBzWTAzVzd1M1VadTV2Q3RlRVdPbVVy?=
 =?utf-8?B?RzJMRldKY2kyYm13bVh0OHowZDRWVjhMMng5ZTE1Zzl3VGVqejVkbkErTWdQ?=
 =?utf-8?B?RVduRHQrRmUrTGhFeHE0T2JnOVQyZ2QxTTFvYUV4NGxHS1hSSXdNb3lxaGcw?=
 =?utf-8?B?Um1TNDBGczVVNVE5SGlVK2hid0NmazVOT2hHbllFbFROejJqczdQcUh4S25t?=
 =?utf-8?B?Z2lIM01qbEdVajhHL2NkSU8wUWhjOExNMi8vbldQT0NTS0dzcHBwZmtxZ2I5?=
 =?utf-8?B?VzF3T3plNzhBVHJKTVVienFVTExrRnFjcVBIaXQzd0hsMkNsMUVkVGVpOFF2?=
 =?utf-8?B?d3JVeUl1MkxrUDMrckR1V1lkdzJ1S0FvZ2Q1QS9tQzAzR2pSZGg5MjlsdFYy?=
 =?utf-8?B?MVErWmxlNmJDVE4xVzVhUFRVYVdIVDNsS2J3OGM5aWdqZzFYNEVxN1gyRk8w?=
 =?utf-8?B?NVl5azdRdVRaQ05PTWRyUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0aca6a8-3eba-42cb-ae5c-08d92066f69f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 16:54:44.9752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekRmHC2c7BLn0KePUBD/qnBqvGYDv8lq89+eEbEm4XWxswYlbRRQng0lJQ+HFa6h+PeIdddA2wffu4mJvIwgcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5167
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I would like to take the maintainer-ship of AMD SENSOR FUSION HUB DRIVER

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 04babfa8fc76..1d27060fca21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -973,7 +973,7 @@ F:  drivers/net/ethernet/amd/xgbe/

 AMD SENSOR FUSION HUB DRIVER
 M:     Nehal Shah <nehal-bakulchandra.shah@amd.com>
-M:     Sandeep Singh <sandeep.singh@amd.com>
+M:     Basavaraj Natikar <basavaraj.natikar@amd.com>
 L:     linux-input@vger.kernel.org
 S:     Maintained
 F:     Documentation/hid/amd-sfh*
--
2.25.1

