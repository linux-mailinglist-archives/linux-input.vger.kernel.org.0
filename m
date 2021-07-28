Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D41613D95FF
	for <lists+linux-input@lfdr.de>; Wed, 28 Jul 2021 21:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhG1TXI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 15:23:08 -0400
Received: from mail-bn1nam07on2071.outbound.protection.outlook.com ([40.107.212.71]:22945
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229690AbhG1TXI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 15:23:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mv5qAOBWFI5Z4Lbw5KQg+LJz37+Te7o9QSmS0izwqJOBcCll4bm5dOEv39G96NDXjljmrZUrxJ+MPxEFyPMfFhDyuD/zV0/BGU0B/WBFqbMAtVVE1ddHn96F/uP8uh4IsIS3iVHRFgS0IhW4E51RlcIAibu6aGcWULOakZVmS8BC0S9QepCtCMwnxSpSftbSFBSGNvUiB2M8ulTmpoWoFbfel0pm9o6MhxK0L9ytttfZfSmLCByxcmlB+QFHrQmJtp7ElFaPQyMh0nMXYv+C38XxT9MSw+YLOqBxN5E0aqbNBd10/yaSdvOBoiJJEm59QVS+wItXzSJ2sVtPrfo2iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnN/Kc89ikX1olYEAuPE2yjHHUKeoZofNysZ/hv7qQc=;
 b=jzPek5XMSs+4EItJdK3mjyxsXqPLtwqg/2Ph6rwh7yJ9m1Tun0zbgag650AqcGy4gevoGW3exFkOAStC7e9tmzwQwoNdtUWGHpydo2UVRD6eq8vi2VIpBhiHlOqCXcZliRIwcwdfqE3eFSpCKPd8f1wIRMJuzkfbMCrk1sXujghmI42pin8Cqkwie+HVug2c93oPUNhxsCgSwXFHgRtxs1FSQhYZyPTUSOZwsv8quKoZzUlkwQ6z0InBIwz2YQOQIwU4CSSaW67Qgp0sPDrdTx57kTO0qrKV0AFABqGpp1SbgC4MztMI9pM0Zs+1HcyyfJ2P9EKRPYKXi5HdBp+6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnN/Kc89ikX1olYEAuPE2yjHHUKeoZofNysZ/hv7qQc=;
 b=OyiWgSePVxxMrFHil11zBYplfX59NSdgQOD+nyL5MH5LKSdRg9DWmgjYQc+nCU3e2cfxunVgOkf91hvoYtzhj4KPtFU5HFyzKwqBZJT7UjxGBdJB95KF97TSk6I9JIfZaQKld1WucQz/k1oveZKnGeGK2xuUlej3iKNuIabR700=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM4PR12MB5376.namprd12.prod.outlook.com (2603:10b6:5:39a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 19:23:04 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::7c6d:57fe:e2e6:69e3]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::7c6d:57fe:e2e6:69e3%4]) with mapi id 15.20.4373.018; Wed, 28 Jul 2021
 19:23:04 +0000
Subject: Re: [PATCH 0/2] HID: amd_sfh: Minor DMA mapping bugfixes
To:     Jiri Kosina <jikos@kernel.org>,
        Dylan MacKenzie <ecstaticmorse@gmail.com>
Cc:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Basavaraj Natikar <basavaraj.natikar@amd.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210622001503.47541-1-ecstaticmorse@gmail.com>
 <nycvar.YFH.7.76.2107281128140.8253@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2107281132410.8253@cbobk.fhfr.pm>
From:   Basavaraj Natikar <bnatikar@amd.com>
Message-ID: <637db2da-d5d1-ca95-edc4-d6357a89fd03@amd.com>
Date:   Thu, 29 Jul 2021 00:52:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <nycvar.YFH.7.76.2107281132410.8253@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BM1PR0101CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::12) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.90.200] (165.204.159.242) by BM1PR0101CA0026.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1a::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 19:22:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e96e3403-eae1-434f-b896-08d951fd1f14
X-MS-TrafficTypeDiagnostic: DM4PR12MB5376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5376F0E4AE4FC1698EFCE475E6EA9@DM4PR12MB5376.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A81Q9K83IYUyOV3+rpju+xeeqCE5DKv00zFpOgvtOIS6yOGWQYfrI40eeri+nntP+RDNiSEmakZb4EDOupEl/1HoZWe2ivBZVJY/pGDWA+7ACmoXF9ZFpviPR4UgNy1QA+CppaTyqYonqjO9xyaQFf62geYgp9JOMEIqTlcroxC+YWJa/sN/XvaNAHO43kxkwE9W92ngMzjyTnxdc3p0xvHUIWmsPKUSmGzwi5nafblMxLjoOawkta18AVlvwG9d/jw43nX+6vtgtF37RYrMCKG9ThCvwOIpWT67e7ZuW/fifRCkaWTUUgfS/J9hk75i71xh4nsHnMEMnOW5q/w5Qwux/DWt3B1A/g7JB9A1G4ol+MlBSfiyNPY/rmWFO7+rklkKtUxnhSXsTZFkGR1DLuRjCAhzMTjZ05MhtSNHN5C4z8pjFDaLsxCLN425lZb542bEZgXWGqV/DbZd5jn05gHXq6RiJ1T1vypszS9tBh4TjnZVQT2qqWo3eIsUmu9Enx/M3Xko8N/GyFI4190F2w3v0WzDDjuccDkHd3IzV+kcySZUQHyBCXRf9ErAVQ/UlHCE5qwhmUosLLpyqxPJbwz1Tgs+Jt7nJDeQkPz3uJD8GZy57blyO1fT6iw3dGY5ScWtssXB6ZuqCZARiQBUBzYl7FQNe+n2eKAZ35c6n/QiBDv0Taa3XcZ+v/t+Zinqvvp5IAarszu/u4oSqaRX02huEhZKBETqXvznlUft6oWBI1W7Bq5IOh99T+LKGfCAPrxGUXUfGlxssnnH/MCfTqoBg8rgnDQlb5ownUau/i8spDLSzp678MHt81HDjCYr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(8936002)(83380400001)(31686004)(966005)(186003)(54906003)(110136005)(66476007)(2906002)(6486002)(478600001)(66556008)(45080400002)(956004)(316002)(16576012)(8676002)(66946007)(6666004)(38100700002)(36756003)(2616005)(31696002)(26005)(53546011)(5660300002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVJsVlhUVmtTREM1Z1lwS1U2bkdkWW40K0JDcmt5V052WS9wM0VKMHg0cVhP?=
 =?utf-8?B?NnJZblBTdXdDN2h0dFRIaG8zNXAvUVhRUEg1ajFnbHNsT3B4K3BHQlF5ZHdD?=
 =?utf-8?B?dzAva2NOQW0zeXNFRGhnSldaTlZ2Z3kxVitVYzF2eWVWL1FCMHgvai9ZcjM3?=
 =?utf-8?B?cEtzNDFtYURzRXVqeXk3Z2t0TmkwOWpyaDY3OWNqVHBVYmVzQXFiTGFacmNQ?=
 =?utf-8?B?ZERKZ2RYbFI5bFJHQS9IT1RDa2hYaWxuNmZvc0M3aVZVL2RGNzNYRkh1YXpt?=
 =?utf-8?B?MXZSMCs2emRNbXBnZU1aVFVXcGFEYytZMjZEeU50Q2xlMlhZR1lZaldmb1ZR?=
 =?utf-8?B?NkNxUDZmODZCb0xjcnBRYUFOdDlGSUo5M0JlTktMb3NIREdadm5aYVRoeHo1?=
 =?utf-8?B?RUVZQUNFTlZzd1Ivbm4vcUJMc0xhWmE5aC9FR1pIQzJxaWJ5eWJlZy95cHdY?=
 =?utf-8?B?WFI2UGtpM1RpTkJVK0hpR0xiNGlVemF2QlJhYXVKa1BmcVlDRTlhVlFlZlVK?=
 =?utf-8?B?N2ZlWjRBTWw4WWtJSWY0MlppTjN3WDRDeWs0T1EwbWdVY0hGKzdkRnErVTJI?=
 =?utf-8?B?U1hkcmpyRlhlNlZrMis3QStYVHE1QUVaR2dwbGFUT205Rk9LQUdpVmYvcjZv?=
 =?utf-8?B?N2lmOGtaZk40SWx0aGs4NzduN0t0K2VTNEo3Vm84blpvdFRpK3J2bVlFNEgr?=
 =?utf-8?B?WnN2RnlJc2h5VDF6d0taRTVDNlFnSzlrWk1aU0NCUEpHZ0RkL3cvU1R6NUE3?=
 =?utf-8?B?a0hnUFpSZkpoaitHdWE1QlNFUG55NXhhUXhEeG5OK3NlUmcramhLeDRzTjcv?=
 =?utf-8?B?YXIxaXNIcGFQd080eXQzQUs5bGwvUUMvN3h6YnRlTjJKN0E5VWI3ZE1ta0ow?=
 =?utf-8?B?VHp0SDB6MS9hNnVBTHRra2wzSGM0SzFqNThPN3lNa3BjaUlIZzRDNWI5ckp1?=
 =?utf-8?B?ZEc2aEZPMk9URHV6ZHBtS0ltUm1McHFDK2JRRWF2cVFvS2wxZVhxY0pOQXNu?=
 =?utf-8?B?SzZRbDBxbXlDVFZQMTAyc294R0pLZ1FaNjM5YnZhL2xMdnM4M21vMUxKMmlX?=
 =?utf-8?B?a0FqSHlDMjI5dlJzNmdvL01EN21xeElnTHdkK3lZc0JiWmVhcmcvV2JGWEdG?=
 =?utf-8?B?MnJqSDdPb0JzL3NxdkRSUzVKUG9MWmFpWUFZMFJPb3pkTVZXbHU3TjcwcmNm?=
 =?utf-8?B?NExYQWFjbXZYbnRPVng2bTJJUUlWRVFRRmxMK1ZJcTJ5b2ZrSzNBcmR5bFd2?=
 =?utf-8?B?aHpIUVc5SldjYWdDSXFhbUl1RVJ2MitVYVFjN3BWY3FrMDc2UFR6UkovN0Vt?=
 =?utf-8?B?V0h2c2VyOGdOK2ZCaVZHMkswRGJ6Y1VJNnRQYXV6dm5weHBscEFscGNlWlVy?=
 =?utf-8?B?M0ZYbUVqMklHOEpORHVDdDRCYkFibE9nZUd0RGhLRUhoNXd6L1ZGZ2RzTFE4?=
 =?utf-8?B?RSs1VEk2bEJEVFp5SjhnQzc3K1JPRXdia2FPd0RtanhlemwxQWZ6K29qb1lY?=
 =?utf-8?B?ajhyZU9TTzcrRjlUYWZVeWExcHBlOVV4RERUUVBGK1pZLzRaaHB1eXFJTWt5?=
 =?utf-8?B?MkZWT0gvRWZZQzRuRkFWV0haa1dIbk8zejc2N1IxWGJYS2lzak5pNWhLbktu?=
 =?utf-8?B?SWNsM3kzVU14NjF4NEdnVFVBNWM3MEI4ZDd5N3EydWJwQkQ0ZGFxcnBTNUc0?=
 =?utf-8?B?U0RxTzRXNjYvMTUzaDBZNURVUHVJT3RzbU1CVzZEaktDeXVNa1hicWVVeUM1?=
 =?utf-8?Q?B8Wg5O9vpiQIfFdJUumWCi240lyJ/bqeH0KSyUP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96e3403-eae1-434f-b896-08d951fd1f14
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 19:23:04.1047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFTx1nvxeq6vuCBfxhszhTQGVlAyqqjYudFzhuq9NUfYZUOlxcz/joOo/IJKX5c1FcFfJjGcuA4kkwv603oEEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5376
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/28/2021 3:03 PM, Jiri Kosina wrote:
> [CAUTION: External Email]
>
> [ dropping Sandeep, CCing Basavaraj ]
>
> On Wed, 28 Jul 2021, Jiri Kosina wrote:
>
>> On Mon, 21 Jun 2021, Dylan MacKenzie wrote:
>>
>>> While preparing to investigate
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D212615&amp;data=04%7C01%7Cbasavaraj.natikar%40amd.com%7C2dff45d8dc964dbc5b1c08d951aab806%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637630615935776199%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=hGpNFpr6BjVg8dvfUTNF8Td1SOdtN5T8c2WACGAZWUo%3D&amp;reserved=0, I read through the amd_sfh
>>> driver and saw two (unrelated) bugs in the logic that sets the DMA mask.
>>> Ultimately these are harmless, but they should probably get fixed.
>>>
>>> FYI, this is my first time submitting a kernel patch. If I've done something
>>> wrong in formatting this email, it is likely due to incompetence rather than
>>> malice.
>>>
>>> Dylan MacKenzie (2):
>>>   HID: amd_sfh: Set correct DMA mask
>>>   HID: amd_sfh: Continue if fallback DMA mask is accepted
>>>
>>>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>> Nehal, Sandeep, could you please provide your Ack to this series? Thanks,

I think, you can merge both of them together as it addresses a single problem. 
can you please respin a v2 with the changes something like this?

        privdata->mmio = pcim_iomap_table(pdev)[2];
        pci_set_master(pdev);
-       rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
+
+       rc = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
        if (rc) {
-               rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
-               return rc;
+               rc = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(32));
+               if (rc) {
+                       pci_err(pdev, "Failed to set DMA mask");
+                       return rc;
                 }
        }

Thanks,
Basavaraj

