Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9828E419048
	for <lists+linux-input@lfdr.de>; Mon, 27 Sep 2021 09:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233223AbhI0H6V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Sep 2021 03:58:21 -0400
Received: from mail-dm6nam12on2072.outbound.protection.outlook.com ([40.107.243.72]:55682
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233239AbhI0H6U (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Sep 2021 03:58:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDRdOTiVcth7CFJWd0Vo220TEJfJzmTESQHvfyPreaDG4BKGeCnDSnCDrNFEMqtma833b8BOH3Bkl43Y4vmOu8RwN8+kXqe3I4y1IJM5P7HlctusnHn4xeeMhv423+ypPgc31i6lvh24KMH3Qu7Aa8RGuVAd50aVqcEcd52/2al42ZNB7LC7DI6fnrKYKYK1xYW1RPDclNED71WiobajSS2a/HpINLuAxNeGeH+G/SjngknddOFA2iI0PvGmi0gPSk7UIkVygzlxPxwzN93pjT8wZD6D7p6rqL6jMlr85MNnQcc6IksInmyCGcTZ0JiP3lKX4IreRDR8tHsXwTe/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0GpRIB2tvtvYB5HOL/0DQrFeSQx3/Gw234IOVAlrnJ4=;
 b=CnpYQ0Z4yysARVdBJRK4yIfjcneM9EMOEU3CROA/96Cxszjgn3MJUeABICWNYCY6M/BMJIy+A1U3W0mzoVs+wnMu0hbduwRn3oWEQEq/0q0URuF70qA2eufU8XPZUeZbk4CtiT2Gs1/X7kPrBCM16p/8hCfEdM1srI73cl8FmqWEUw0wf1VtWZeDCWqGVQr4HF2wm48Wwnokmjx8JNepYzOwhS2TyXuJaJClYdgCtGDdnKwwYcyF4hPN1agCh7c2nXRoGmnIOofiSmtfdDBrC0EXM8LeaQYCzn3VwTzjEsNCG6xmPe08J5fD19Tehi37mYAqmASrZYYAiHGB/FtfPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GpRIB2tvtvYB5HOL/0DQrFeSQx3/Gw234IOVAlrnJ4=;
 b=DnANPOVYY7UtLpWt+Uu2bc/04WPGw/SJEFDZ/iu43vfpImmaH6FVrr6ixI+fFPU4zX7TqwRD7RvoxEN+6IaZA+FxE7fkPP3sI1mhG8Nq9DgX99FBziXx9f3MN5L+9yqQvDYRxeHTL53q8xUy9Pf2Lpm0SI+Y840sIDrka+u6ILc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM4PR12MB5392.namprd12.prod.outlook.com (2603:10b6:5:39a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Mon, 27 Sep
 2021 07:56:41 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::9c06:d113:293:f09b]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::9c06:d113:293:f09b%8]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 07:56:41 +0000
Subject: Re: [PATCH 0/4] Fixes and updates to amd-sfh driver
To:     Jiri Kosina <jikos@kernel.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:AMD SENSOR FUSION HUB DRIVER" 
        <linux-input@vger.kernel.org>
References: <20210923122930.3873914-1-Basavaraj.Natikar@amd.com>
 <nycvar.YFH.7.76.2109270945170.15944@cbobk.fhfr.pm>
From:   Basavaraj Natikar <bnatikar@amd.com>
Message-ID: <1bb8c251-2506-d8c4-c93c-4e281803943f@amd.com>
Date:   Mon, 27 Sep 2021 13:26:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <nycvar.YFH.7.76.2109270945170.15944@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BMXPR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::19) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
Received: from [10.252.90.200] (165.204.159.242) by BMXPR01CA0033.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 07:56:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82e573f3-8e6d-4635-3ea2-08d9818c5768
X-MS-TrafficTypeDiagnostic: DM4PR12MB5392:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5392D9946C334E4E5479B679E6A79@DM4PR12MB5392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 18DfkCOQGN46wZ1Jx7NaY4B1sRDkwUpJ8lIr/PSPEeFguEmPmdntgU2HXw0iNq1Q6440XLm7GAmmWL2N6f+XA7nMpj/l4VfM1zN1Tlq9fwUeJ3AbSkgVAgo+4Xy7lYKrpZmb04uvmpWSwP19GpNl/Eremhx9HNtoy+VD0csbF/4Pl+T2FllWG8OsDaGp6sp0MK3D3Re9xZuHPSESunCSSOH9r40PY+a/Iz16piPH2xp9mfO1Z5GNjMjIaOwqXYw9xNit9LooZBHDrUY0JCTos4fdQGUpVGMNqbMiZrxHRzoLqgsItf1lIOaVajVWucfpsmdO9o9F/j44UNZ9P8YBSepa+hwZhAzBNLuEMko5Ysl1e0WHBb6Q6Er71behndUtn71fLiKIlXEYrF4rKUG+f8LsxSnn+uCfNLiY+6ccTfXwfgdtah8a2S6gAPeDz/D25gopQiKW6Sqx+GPKEcOPjJwPcdup299Q+qmb+B/RnDevuGjpXZHCl7byNet/I5L84LUp/fbrX+xKklJ91lbvJoONPFaRXiv17zjulD5/hT2mt4b/t5Y81FOE3MShAFBeF4tx7bIHagpuqVk3410XZfsKYHtOHz4yoR+eDeofR4I6gwLATMLYktacfPHDl1BMSghm5qW7+2KkyFEwNOZlrNSIUATTK9ep7Ra1o8LL2Xx1tWY1gTYSRVBSD08OZ6r9sRi58A+XintYDC9C2eXx+G9vtfnw3/DrzSkykBwaFPE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(4326008)(6486002)(36756003)(38100700002)(83380400001)(26005)(31686004)(16576012)(4744005)(66946007)(186003)(8936002)(31696002)(6636002)(54906003)(53546011)(2616005)(66476007)(8676002)(15650500001)(5660300002)(2906002)(6666004)(956004)(316002)(66556008)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEZXL29sS1ZPMXp0RkcxcnZ0d2xlTHQ5KzAraWJ1TFVHVW00VTFnYVBBT1Q5?=
 =?utf-8?B?WndVRGF3MU9ObjJycndYdEgwWDZsUjZyWFNVSVVrUmVNTFJLZ3JMLzBuNDFX?=
 =?utf-8?B?SFd0S1pjbmZwS2g1M2o1OFB4VG9Vcm5HMFdwQVlDOFIwRVhlMVVCS2U5WTIv?=
 =?utf-8?B?NDNUOFlsUVVVQW8xcEZ2cmgvWi9VRjBYeDlnTnNsMFUxMzBFMUU1eFNRK1cy?=
 =?utf-8?B?S3pPWXNHdWUwaUZ6RlQ5QUwzRGM5KzZaajhLelJJeGlWQ2FzQnBpc0duNTBz?=
 =?utf-8?B?elM3b3RueTVaUFlHeVdoTERtMU5ROWl0WXdGYjNmekxQNk9BanVSYm8wMlBZ?=
 =?utf-8?B?NmNsdGRObFp0ejkxYnBrbTZEOGEwZjlCK05uMGh0d1JlODhMN0JWa3RsWExj?=
 =?utf-8?B?TnFEWS9YK09nS2tjVEU4OE5BekFMdEgvT0k5TjZTcGpvbFFOREJYay8zT2x5?=
 =?utf-8?B?eEV1bzd5clRIa285T3ZSL3N5Z1lyY3RuU2p3Z3I3ZlVYZDBmN29zV1liVVM5?=
 =?utf-8?B?UDBZSkpQUlczemJHSXEvaXZMaUhzMlUveG9GcTl6SmdhR1o0eU5JR0E0ZWR4?=
 =?utf-8?B?dm5pZVU2WUlGUzIvdG5tc0pIMHNGcFFHVE11ekVESkJPV2JaMU1lLzlESDZV?=
 =?utf-8?B?MkZsMjh3bTJ4UElyNXNnNTV5Mm95QzVnMWx4aUJSVkhRMnlBNjZCVmNENjNi?=
 =?utf-8?B?WFlHR1lkZ1JZVmMvOVBkOUVuQi84OGFyRkl5bmRmYWZlMVlmTzJRcDNDS29o?=
 =?utf-8?B?WWNSR2tZeWx3TGVHenZLeEN4Mm9NUnlzeFpJMlM2ZFFnSk1wdEpmR3Q0UmJR?=
 =?utf-8?B?djhWRjFWRXhWT2d2dG4rcmZMOE51dW02M0VRQUxkL2FYT2Mzem5OQUN5R3Bz?=
 =?utf-8?B?OXVKM041Y210SHUzbUxEUzBUbU5KVUNUamdTSkZzWTFUbHQzN0NQcUtwMkZ5?=
 =?utf-8?B?b21Wci9WeWxqQmpmVm1hUjUrbGQrdTFPSFl2NW5ZLzRqdHRJOFh0bTR6QTRK?=
 =?utf-8?B?NWwzWlNlMUNUdUVINkowRFVzZVlsRmtWcWhMWktZNitaQjc2bTN2dWtmVkNR?=
 =?utf-8?B?bGo0emovKzRVMDB1UjR1MWh5N0c5T2JOc21ldG1OKytQaUZxWndZaUpMQ3Uz?=
 =?utf-8?B?MTdMQXFWaUUrb3UyQ2VqenRCbHZ1d2lXWlk3Njl5blBqVXRUSm5Pbi9ZSUln?=
 =?utf-8?B?eVFNT1lOWGpBaE5FVURnTG9ta3R5Tm1IUzNzelFOZTUrL2VRWUt0c3YzSHNo?=
 =?utf-8?B?cVRZNzdmRmlTTUsvVjNRVXdNRDBQNzBBUWlmaFlHRWl2Zy81L1FNUU9MSEFN?=
 =?utf-8?B?SlZSTlVMbnNHNkM4b2NaUDU2aUgyL000Y2JyU1hkWUJqU1orTk9pamZzK1ow?=
 =?utf-8?B?MHBmRGZSNkFZTFNSL0RHTkpwSXVGbFA1U3dZdFVnTmh1QzFWUXp4OXhlZlhl?=
 =?utf-8?B?RVQzK3I2L0JvZXI3R3NDZlVWLytIblpiOU1wRHEzYU85cW40ZGZIYXB2d3o0?=
 =?utf-8?B?QnlrejJQRm1TWXJ1cjY5ekgrTDgvVWp6Y2M1dVRwUnYwZnFxaXRaSk1Ibnpk?=
 =?utf-8?B?VEx5a1UyYnhXSE93ckM5RHE2bHVFTi9LNThTd0ovMGZTNEhzVnJnMDRWejBn?=
 =?utf-8?B?ZVJZTUg2YkFMdjB5a1FXeUxXNHNDMFg4c3JOQU9ManJYOWdlR200OGE3ci84?=
 =?utf-8?B?dkZWcVVHTnFoc0xFWVpNUjZJdkRFMmtPeEJNeFdRN2M2UkYwNzFra3grR0FS?=
 =?utf-8?Q?HrsycESIofBO3OuRS01LVkDaP7cfiXj9uYcJTuR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e573f3-8e6d-4635-3ea2-08d9818c5768
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 07:56:41.2734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCDYCWWlIDhwglVSeWfAsFHW6Se6xoEshHWazkoRkbTsmSd+EwMy+Bbe6kftGobm7m1xpTu18R1l5MJBssXwkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5392
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 9/27/2021 1:16 PM, Jiri Kosina wrote:
> [CAUTION: External Email]
>
> On Thu, 23 Sep 2021, Basavaraj Natikar wrote:
>
>> Changes include fix to NULL pointer dereference, remove pci_ wrappers,
>> use dma_set_mask_and_coherent and copyright updates.
>>
>> Basavaraj Natikar (4):
>>   amd_sfh: Fix potential NULL pointer dereference
>>   amd_sfh: Use dma_set_mask_and_coherent()
> Thanks for the patches. My plan is to push the two above as 5.15 material
> (fixes), and queue the 2 below as 5.16 merge window material. Please
> holler if you disagree.
>
>>   amd_sfh: switch from 'pci_' to 'dev_' API
>>   amd_sfh: Update Copyright details

Makes sense. Appreciate your help.

Thanks,
Basavaraj

