Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 879036ED23F
	for <lists+linux-input@lfdr.de>; Mon, 24 Apr 2023 18:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbjDXQN2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Apr 2023 12:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbjDXQN1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Apr 2023 12:13:27 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC531109
        for <linux-input@vger.kernel.org>; Mon, 24 Apr 2023 09:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrtT3aiTsiABG25WkALc8WVwfebTpU8gd2rrBRxpzFgDB8qtLpVhyq+PntfO0FqLpiraywjfRRaVIyLLDFQU+UieFKMuWCCa3ZF9na0vyfw/pwFe9+RFuz8PMv1flf06kgr54PQ9C10k06d99ZEjR14NB51g068r1l15WFs1QyP9bBuqaHC4OkyVit6CqSgfpMBhyANN47wmFerGqHJA113aIuSx7mYHU5FnG9P3sFXFwLHKHRNuTVz7t3x0ise5JANuwQxhJ6LlN5HQBlDIPM6DjiP3IaIrYu3njW65XqinOVnTP8lutbnaYp525iFY4b93/bM5hUiHYoK3A30sfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CcHdfsyX3aWLM6CJbrD26Ro3ZQepvZU8IikNuNHPgA=;
 b=aTPDVgNTFHcQaAmA8KPq9qZDNOij/jMTGkRpRY1RIMhg1uqRvLej1zvZOjrVIDCrdfOLBefvqxkRt7CRAiTIfRAth+xwMd3Xo0ROqJzR76Nb/NBLNQMm1iUL6tnBhHTED13yX2vxvV2IzZqt9RNCiiNXZT21SgJwfvlOPjAwgnhVXKSYsHY7wQDjeA/NaBnrqIJ0hGnLM37q1QBZUYquoBg3ABBssL3DcNwtFpO4uUe3WPUh0Cahik/s+IuqvzhDAuMNCuDMJ2Es1wS0npGmE2cD1X988KkfZTAzCA7LFNIjKJBN3dglEGs5naKHmrEtWvuqUKNoT3Z00dlJpnJkFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CcHdfsyX3aWLM6CJbrD26Ro3ZQepvZU8IikNuNHPgA=;
 b=G5B+dMcK009m5rH1lPlwR2taW1d6FQcZc4Gt5loF0MP8yeGNBvm0mekGImG/JuNzq0G2Gbv3TMC3tI4s7jxIQkjXrhTdZjPXDMxFa4GlERkxr0UHs78HpJYSFR+Lkhp6V6KgLTi4jMLl/u0Odo5arLvkPkcDqUboSv+JFzb2UZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM4PR12MB5295.namprd12.prod.outlook.com (2603:10b6:5:39f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 16:13:24 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::61c3:1cd:90b6:c307%3]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 16:13:24 +0000
Message-ID: <4dca182f-60e1-4322-ee30-33c75771cd1d@amd.com>
Date:   Mon, 24 Apr 2023 21:43:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] HID: amd_sfh: Support for additional light sensor
To:     Linux regressions mailing list <regressions@lists.linux.dev>,
        Jiri Kosina <jikos@kernel.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
References: <20230411161901.909940-1-Basavaraj.Natikar@amd.com>
 <nycvar.YFH.7.76.2304131557420.29760@cbobk.fhfr.pm>
 <0b83318b-5ae2-9b90-5d5a-11d95f3501c4@leemhuis.info>
Content-Language: en-US
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <0b83318b-5ae2-9b90-5d5a-11d95f3501c4@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0225.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::20) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|DM4PR12MB5295:EE_
X-MS-Office365-Filtering-Correlation-Id: d85f78f8-cbc0-4646-edda-08db44ded437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yj1fnkGY2zrBVUE6h7h1p8Jqyg6dE0qp3kIvf25ogayb9p6r1TKhPegjqhAZvrIFI6krIlrUY/Y3Kb6CJ/IFVe/vNZcVifAI7QhPY0Pug0VFjIrRnP/+JgY6+resZGuHaCI1e2G/bQP8q6ZAZUzTdwWPPsNtDR/BucWKevyBKoqp6sPcbWCMsFy/qgiKC7YT/gvoNhhaBn+3qGZOGS/fp6Z2x7LPPw6hvdLRGkfZ+VltJeQebRqMlqS6URDqa63bq/XSo3xj+KuWtq3v8bs0MWyz8/DnFA4m36R0iDIhlyAnntdlkngy16DsUW28uOnyrlZd19Wl8vyCVFo2jEc/zuqCSy0jU1017MO7lxPrfYXbnD7Jovum30gUkECs47Kl649ScwgKGPMx5cUHuq3WfSRXLUIyUZPRo6Ym4HiQxxcxtypvLc4V/B0Q6R803OdExggzpS5ydd4Vu9RqqqH+kU1A38HCoMss9zmoxexwjB7l/GNNYj40+ENwI8hapI81WUjJQjnGW/ZwtJQFx7Hcjcz1ooReZBDs/2bBP2gIv289XHJ2s+3r3ATV/n7TSvaAtkcDRPo+xc4YfHOzTYtkcvhAvtKHVBPxuGlusFbyro77rYYqVMN/NWi2SDazMIS9GpM+chFXiPBqx3qjRhhMmjL0SM0Glvm98lSIbjGK+OFPaSGLIka9csx/wT40/1dp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199021)(2906002)(4744005)(6486002)(966005)(2616005)(6666004)(6512007)(6506007)(26005)(53546011)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(4326008)(478600001)(5660300002)(6636002)(110136005)(38100700002)(36756003)(31696002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXp6MURIcGZyQkhmbFk1TURvbmg5TkZoZVh6ZmYydUd6elZrUTBiYmRZSGdi?=
 =?utf-8?B?eUx2TmU1RWpYOVFOblVjSFM0eDRTSHlpVEc0bnBmcWIxT3p2R1dwNGNOUE1w?=
 =?utf-8?B?QlhwLzRYSjNHdmRRVnl3bDBvY1FnS29WNnkwbVZ1OTZNTi9oejhSSmJYQWJp?=
 =?utf-8?B?Tm4rci9hS21nMWt1YzlWMFhhNlhOcm0zMXQzcUlRNG8vYTh4bmZPWmJkOS9J?=
 =?utf-8?B?STY5NnlCbEU1R1ZCQ2VjZTBJVXV6SE1GZ1ZWSlV0OG9TWmdzOWc4STJweTRw?=
 =?utf-8?B?dGt4TmNSYnRNRWQzWXhndU93SVlvUkt4UlBKVGRhYy9rWjdnM0FBdkg0SmZQ?=
 =?utf-8?B?SklWNXJlakVXSitUTHBoRlJ4Y01mR2xsbUcwSUkvbFNsTkIzZ0VvZ041MjdN?=
 =?utf-8?B?SlphWEhDeS93R3pBY0hPcVEvUUxMNC82clh6SjgyMzhyamhPWGEwUUd4YStv?=
 =?utf-8?B?eXdQTDljcWFqZUo1MjJJVFhxUnJZVVJKZW5xOHRRUjk5VjNIditxelo3TWwx?=
 =?utf-8?B?QzNzdS9IMWR3YjNVNCsrV0p4SWw5blhSU1dqWXZ1NFZKRTdTbmxnZU9TSkpq?=
 =?utf-8?B?THZEVXpUT1JINkhIalByYlJ5VmE4SnBkNnhQaDR3TzBPcklwRlA1UTZQNUcx?=
 =?utf-8?B?L3cwa05KY0ZNcmpZZ2ZFQWxNNDkrN000WS96T1pQa1g5VXRHaXdqdS9hL3kr?=
 =?utf-8?B?blRyaVBOdG53bGlrZ2dqSTdiUzhCUjU5U0VTOTlwcnNVcXhIQ0NEd2JTUExl?=
 =?utf-8?B?NVNwZXNaZDMxN01mVENHeUY5dFNxc1lmbk1ZenlLZVpXQVZKTnUrR20wSGFz?=
 =?utf-8?B?VjBLdVhrWm56SVFMVEtwL1ZwTXd6cFlteS9TR1p5OWltWWsrdkVINTRMYXdB?=
 =?utf-8?B?YzdwYStxenlQWlFMVURwOTZUQVdtTTZHVSt1ZkdEZnh2cHhYSFIwZmdmb05k?=
 =?utf-8?B?TnduYldtaEhOdDE1c21LbW0xdTZwTUxRRGFUTlVZMS9JYXFGYVlocFNuQ1Ro?=
 =?utf-8?B?eE1SbVhZelNFZnBYanhNMFlUam5IK2VvVU1hdDZ0MHgxVFJnT09KdUhnWnBp?=
 =?utf-8?B?WXliVzRvanRKamNKNkV6OHpZdFJKWTF4eU1Vd1I4VUNyN0tsL1o2TFBDZ2FI?=
 =?utf-8?B?SmdEZm41RXU3alQrWUxEL2lMNzBjQzZGTUFPUTc2TTI4aXZHOHN1LzkyWFpj?=
 =?utf-8?B?ekl0OERSS254QzhxeFRUZWJjSkplSVhFZTJmd3pUVVk3S2NSV1VBcnJqY0tt?=
 =?utf-8?B?NFRDSExQMUpwN1RDdW9nbmNpMmNham9FZlh4LzNQaFdkcERRemUxMUM5KzhC?=
 =?utf-8?B?Z2VFcmdHYWdKY1ZHMkU1Q2d0eEJXYkFoejR5b1BUYkJTMVlQWkVleC9UcUgw?=
 =?utf-8?B?NGtjanV0OUdsVm1xNkhoOVZnQ1BnQTU3UzR3RnVNNnpTWHhDaUhqZkpPWFY0?=
 =?utf-8?B?RkpxeFZkaUpiTlpUSUVsVHZadWVhb1ZneVRWYzVXcTRpVWNBb3dRNk5EcmYr?=
 =?utf-8?B?b0FPVTdnRG9pblplbG1POUVwaDFEVDhwcVNKSSswY3BqSGhiUjFuc3NpeG1O?=
 =?utf-8?B?bHl2aWREckNSaDgwSE5NU1JpeXdYdDFrTTZzcitIWkF6Z1c0NEtmVFVCVWdD?=
 =?utf-8?B?Q0loUDE3UWtCSXdaLytBc2VGbzhRckg5SlR3elpGeFMyaXFYYVBPNHF0a085?=
 =?utf-8?B?NHB3VWU2UGlCTzZaS20rUVNaNEd6L2h6bHkvNU5iOVR6YUVUZGxvNmEra2ZT?=
 =?utf-8?B?VXdhYU9CVWFEaE1JTmxJbEFFWnMxdFlKOUZVN0RhT0VFdHdvaE91Y1hrK24w?=
 =?utf-8?B?cUtOTTFJVWEySUl5QTF1NmtoQnRrcFlhTHFFTWgyUnRpUUlwNHJFU1RFOWRH?=
 =?utf-8?B?YjFNL2cwdmpmRmJRNFllTldhSW03dVVpeVd5R1ZCVnQzRHYvbjZEM29KZVVp?=
 =?utf-8?B?TTlsYVVaU2svaFAxQUtXOVd1cC82dlliOHkvZzloaUFrTEh2S01tYkRDSWc5?=
 =?utf-8?B?ZDNxVTNiSlVnbG5ZS3dOeThWS2hmUVpJNTZKRTFyeStrM212OUtrbE1nbDRm?=
 =?utf-8?B?dTlud1ppSzduUVFYSUFGWHhtZndsSXZUOVYxQzh3dzFYaTltSjZrUExpeDRT?=
 =?utf-8?Q?iM2cMMTpwPNYs/AcxG5ablWgI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d85f78f8-cbc0-4646-edda-08db44ded437
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 16:13:24.2725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3iECal2JwB37tOVR2T3GJDHyqBLKJ74oMAPtJ0nSkpA1blV4dM8C7Ry4miPQxNHbPk6mLHHe9/MDKvQRIDKrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5295
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 4/24/2023 2:02 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 13.04.23 15:57, Jiri Kosina wrote:
>> On Tue, 11 Apr 2023, Basavaraj Natikar wrote:
>>
>>> There is support for additional light sensors in the SFH firmware.
>>> As a result, add support for additional light sensors.
>>>
>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> Applied.
> FWIW, there is a report about a hang at boot that was bisected to this
> patch. For details see:
> https://bugzilla.kernel.org/show_bug.cgi?id=217354

Thanks a lot for information.

Added a Fix in

https://lore.kernel.org/all/20230424160406.2579888-1-Basavaraj.Natikar@amd.com/ 

Thanks,
--
Basavaraj

>
> Ciao, Thorsten
>
> P.S. I normally don't track regressions in -next, I just noticed that
> report and wanted to let you know about it.

