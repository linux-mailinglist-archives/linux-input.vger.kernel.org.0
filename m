Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D368391D4A
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 18:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbhEZQu2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 12:50:28 -0400
Received: from mail-dm6nam12on2082.outbound.protection.outlook.com ([40.107.243.82]:44288
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232270AbhEZQu2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 12:50:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eavlRX3IHda+ln5//SrwNmuwqd9sqs4sZ4998QgCNtzgRrMh1HormbdpRkQGQ2ifgKMWdytV7/Uuc5SY4ZStg2TD3xW68fYroltva5wT05MNfa9OwpN2yZ+f3WFfjBeUn/tHcUgS3QRsEw5gHcMmR7JanaEVv2sOLL5aQaZPEeTZgO5wstdjFclTd1gP+Q2ARFgWMggKigXd7uSA8/I7lCDMLKpIuoPQhvsX+06cnllEriU4MHghXBHk7FNZ8YwqiMr+SZyamY+3qmYdFziEr5u2cMw7Bor4YkymE05nwe8zPjQ2BgqjMnjELMKfuhuxCBySdVixISl/kHXS2TfT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGEAaK26PNzETZXyBDGjfTNXJm+rtNR+Eiy0VBkt/JI=;
 b=Hvv0UCkG/c2FhC6LR5vGDrw6STxKaQvBrmKOOgrgqMlr9ukMWXPPkIidiLEuDF7QuQafzRDbNzTrglPSzwXcUE7778rrE5un5uwtVLauP4rNAefvQxtuZgMEiLN6LBimnqKEq+I606pQpVCPnnKTeevNIksOhxmCZ2M4TKLa089iqkvjp1pkdjt+F7za6KoK4NdhCQ3NF14+xYZmfybNJ80O3DAr7uQbr0rYF2m0GwJB4i+RSrBvb5L7vT5+MCtWsBVa/nt0Hn85wpuRbrXN3YcKsTwQ3nh541KC6s6CvQzwPYXQbeTnOLHwvkKlL66u3H8WwntUqa/RTkjQT9Mawg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGEAaK26PNzETZXyBDGjfTNXJm+rtNR+Eiy0VBkt/JI=;
 b=zEHZmMqr4/FhiP5WQ/GAHSJvXycVEHrcCvedYw0azaMM/CHrnsg0WV3xWdyanwyv3d7GY0e39puCUjEVa7HoLOq1zdcIpepWgAO3nGxz98huNqggPP4BD2h5uFuvou2IVddg/j1G8THBnA8FlrtjfAnOMyObPVH61Q1iiXO7I2s=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 26 May
 2021 16:48:55 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::3157:cd9d:233e:70f9]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::3157:cd9d:233e:70f9%7]) with mapi id 15.20.4129.036; Wed, 26 May 2021
 16:48:55 +0000
Subject: Re: [PATCH] amd_sfh: change in maintainer
From:   Basavaraj Natikar <bnatikar@amd.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Cc:     Nehal-Bakulchandra.shah@amd.com, Sandeep.Singh@amd.com,
        shyam-sundar.s-k@amd.com,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
References: <365fa7b9-2829-75b4-c152-d58dffc6eead@amd.com>
Message-ID: <0ea1d0d0-1fc7-30d8-faa3-d6d707e6830c@amd.com>
Date:   Wed, 26 May 2021 22:18:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <365fa7b9-2829-75b4-c152-d58dffc6eead@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.90.99] (165.204.159.242) by MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 16:48:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f042b49d-2a96-4c52-539b-08d920662651
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5040D7EDB829B2DC304AEA0CE6249@DM4PR12MB5040.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D4TG7rkueTHCibaGstTqigEgJM42f+xI+9Zk5srCt8lU+xkVKvsmgdG3KvK3usw4OFtnRp9BdPUZdB2dpNTCKX93kgHSqEH0Plvbf3XQyNFkSnIDTZ097ZJxQXey6C2IfX1LX1Xxw5zTQMo0lz6efGvjMc2cMb67HUhMxImjl6FG+c3YcMnwtcjNwBFO4rhp0Pf8JWZcvq3eGqR9S9IcMDmjmLwSZY2du9gwyoyCI01JIvgrma/GlYFAojZJ8bKoXYYDqQPdzb0c1QSNyME4L9hC1rF7Z5s44gSHB3ay21UMvvqhtR6WZ7v+y4b6WmuFfiOzeRhy6Y3bp0RT+E0oT/xjJVrtP36MVo4jhJDGHszMJ4SJAwDEmLuc0RmIdOw9jWaiL5TVXGlQ3j5dad5e0KVcdjbgb6lERI/g5m87AefWJHALXsKxw631t0P6xlG1Sy53/aZ4q8CyyP1HrFdvsNNipIbMLli8z06dsuNH/XLyMCnImA+k5JHnhJsSYFHUfOixvYvTCBeQb58j77hS5BUrFRb6jqcPCQtz5A1yQZePY43l7yeBF6QfPA1ah/1K5M56vHvNKak0e/VaqI8zIAgxR6MrTaGx6ZwIQy3Uwvpxu7+7GWHyo5W4GA5kUSHtGjZsKbt1iCZJll4Ty8XlEwmTMCLY6XNod7hkV466huxUhD/e8IOOOvcY9B+E0idv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(316002)(4744005)(2906002)(956004)(66556008)(66476007)(16576012)(478600001)(53546011)(66946007)(2616005)(8936002)(8676002)(31686004)(16526019)(38100700002)(26005)(36756003)(31696002)(4326008)(6486002)(6666004)(5660300002)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZUFVUTRPL05LVS93SWNTL1ZpNjg3eGQ3THFHR1BaeTQrOGU0bWlQQW5hbkV4?=
 =?utf-8?B?cnRYME9MS1Z2ei9FMUNDc0Q0dUpxOU1rdlVjd3d1OUJwSHA2MHNNcVZxK1pU?=
 =?utf-8?B?b2J4RkdsMm1EWGQ1WXFKT0NjQkdtMlBKbUtnQ05ZUGpvZk9BelMzRlhKc3Nr?=
 =?utf-8?B?ajAzaVBpaVNHbUMyWmphdFRiQnJMdWhCeS9ndUozMEhvaEplZFFSL3VRZ3BG?=
 =?utf-8?B?aWtDY29vamtLTmN6ZjlVdStxR0FYcnhVSHd6NlphSnRaZnBLNGY2ZGZEK1F3?=
 =?utf-8?B?RTRIL1ptcjU0bmMrUEpENjNkcWlVam1qdFZQcmdHSFdWSUZhOUVjcXNhb1dB?=
 =?utf-8?B?elU4YURnSUdKR2lYOWUwVEVkOXdtTHp3T21BWnMrc2I3QjFLNVVZVTRGdUl1?=
 =?utf-8?B?TzA2U1BIZEI1SGhBdlFpcjlIOXQvSHQ5Q2c1bWlwOXM5MmpaSVlFckJueXJs?=
 =?utf-8?B?N1VONlJLVWUzMDJJcitIdnVYVzB2SjlkTi9qWHQ2V0lobEE1Tm9VYzR2bFdh?=
 =?utf-8?B?WVpXTFE5QkJhWlpsUHNEOWRKTkcyalJLVWlhOTVtcjBRYVZzT3FYSGcrVFVy?=
 =?utf-8?B?M0gzeW54ZTZKOHJrb1RQQ3dJTjl1VS9ZUGQ2TXh4UXdOdGluZTRpNUxMeEJF?=
 =?utf-8?B?YWx3b0R4RWY2VGRIc2dKOXpLRGs0eWVjdnRaOWgvRi9WcTRXeGs5UWpZb0xr?=
 =?utf-8?B?TW1mWVk0empzRVk3bTJadmdEUnBNQlVZS1B2SHV5Vm5BQ3hCczc5KytnaGFj?=
 =?utf-8?B?bW5mbVpNMDAyVUs1bm1kZGxkTXNwWjJQOTQ1RG9KQzZNTDBSdjBTcmN1TEVw?=
 =?utf-8?B?Uy9pS3hyTmR6THhSTmUyV0tuNTdGNms4RzQzYmorMDNJWGkxdzY5dWt1dXV6?=
 =?utf-8?B?TWVnVnJlSG0rVHBCZDNidzNuNDg4YnZReGFac3JVcS9lSEk4Y081OC9xcStR?=
 =?utf-8?B?bGsyWnBYUkdGeHZucEkyU3l3ZS8vN1VaUXAyWnB2LzZtZWdUYVJ0akVXRHMz?=
 =?utf-8?B?Ui96dXlUNEdGZkl3TkZ4MWxYaVRmUmFKRFpkWXR6WE9rYVF3R3hhNm1HNlZ2?=
 =?utf-8?B?WG9oZWUvQkpmT1RXTDFDb2NjNWwyQ00zZ2FyVE5tOXp3bGhKUS9qK0ZMTHBR?=
 =?utf-8?B?QkJ0b0hQY2tIbzN2K3R6WS9WTTlOSzd0ZGhqYnc2QVVUanFZVnkzMUxOWm9h?=
 =?utf-8?B?cWVEK0lvb09jSlI1ai9sSDQ3NFprK0NVVitKWXo5ckNicTVNMHBWVWloM1dt?=
 =?utf-8?B?aTJ5bnl2QmtCVWdnWWh0RkR5OHFwL3l5VDdaTlVuUWRwUWNvdDM4WWQvR1dQ?=
 =?utf-8?B?N09XZWFjYVFnTUR1N2p5Mm9KUXJqZkxOeVpORytLVXN3Ky9UbUdvbGFEZnE3?=
 =?utf-8?B?Q2JZaXMvOTlQOGpETFB6cXloaS8yM1B4K2J5cjF2Mk5LUGl0R2RNSkxiNHVL?=
 =?utf-8?B?THdhL0d3NUFlUVlhOVJBdC9Vd2ZOSDhYTm85WVFYTzJsQms2Tzg4aFdkRG96?=
 =?utf-8?B?QkV5anhPUitYRTRYdlM2dUNlSHZZS1JQL2J1aFAxSGJTZ1J0Wml1WWYwREt6?=
 =?utf-8?B?RFgyenB5Tis3dDRYMDBYOWxsM2lIb1hoNmFidG5SVXBVajk5Qmd3MGZuUk84?=
 =?utf-8?B?NUhtenFKbUlENUc3cnJDQlQzRmtOOTcvVXR1elpOeWo3ZzBHQlBkYjc5UXY0?=
 =?utf-8?B?Wlg5d0RwN2l3UzVVOWtQZ1JKSVM1dWZvcjI2Zm83c1FnYVFvRC81clZRSGJs?=
 =?utf-8?B?bzFVcjd3VVMwa1VTZEEyYU9qZHoyUkNZb3VuSFU2a3lNd3FVRElxa0R4RDRC?=
 =?utf-8?B?NlM1QUVlV3o3dmE4ZXNJZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f042b49d-2a96-4c52-539b-08d920662651
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 16:48:55.4548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zfOcy7Ukrj8N3eYCix38TwoHzLSLKSTvMl69OC3XF20UYlYe+MQ49QK37MNGfDPSXJPmSG/Ta40ZeK3Mo5WRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5040
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On 5/26/2021 9:00 PM, Basavaraj Natikar wrote:
> I would like to take the maintainer-ship of AMD SENSOR FUSION HUB DRIVER Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com> ---  MAINTAINERS | 2 +-  1 file changed, 1 insertion(+), 1
> deletion(-) diff --git a/MAINTAINERS b/MAINTAINERS index 04babfa8fc76..1d27060fca21 100644 --- a/MAINTAINERS +++ b/MAINTAINERS @@ -973,7 +973,7 @@ F:  drivers/net/ethernet/amd/xgbe/  AMD SENSOR FUSION
> HUB DRIVER  M:     Nehal Shah <nehal-bakulchandra.shah@amd.com> -M:     Sandeep Singh <sandeep.singh@amd.com> +M:     Basavaraj Natikar <basavaraj.natikar@amd.com>  L:     linux-input@vger.kernel.org
>  S:     Maintained  F:     Documentation/hid/amd-sfh* --
>
> 2.25.1

Sorry there was an issue with my mailbox . I will resend .
Sincere apologies for spamming your mailbox.

Thanks,
Basavaraj

