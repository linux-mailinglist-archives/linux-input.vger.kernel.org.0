Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267FF75E2EB
	for <lists+linux-input@lfdr.de>; Sun, 23 Jul 2023 17:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjGWPpy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jul 2023 11:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjGWPpx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jul 2023 11:45:53 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2087.outbound.protection.outlook.com [40.107.100.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6666E5C
        for <linux-input@vger.kernel.org>; Sun, 23 Jul 2023 08:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8OeSgv7UNiUe/WWa0Kh+JtVeEztRzXHRbQfCP0k0XIXTAUVT4VdyzbWGGjDgIBYf5DjjAyZZOhdevgZd8E9Yc0PF8PfQaKnhhxS217RGU/OLjpqOJ7AdFkd6L7EXJvQothOEZaFf9ObbfvdxsQ3wi9XAQyXELp7Sgmbi1Fb6FqdFmkVmM/LHI9+euEB0v03w35BQ6FifYRJa6T4ULfjB8kw3EXpP9XvpihZqzXN3tJao+420445p5X90JYc2b6fuVJtge/rdcbMfRwjwPhPsQKESPoo06YitMgEQZ885tEiY07waPzenUV0GuxpECefjbj2v5kpddHi3YxZXdM1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzPv6IjgE9fi3GwFl3kMdV/ud7joRKvhvvLQVGUWdu4=;
 b=ZBWRhScq+2ukbmgZJo+ZCnoMo/4G3BCa7hv8ikHOwu6TYjvQglhYIcOTbNYLhCyeyDs/ozNK9sH1KEKBCDva+G0Fm2aIts6cbJImp53w1wfzvR7xgXdbiaQn2U10r+nT6YPX76kJ83lj/XFxdqwckBXH8aQpdzveN/QH/LvcJ5iVhYx4NM6jMv+PqMlco/KCdNGxjRi8cM1OfXulCqTtvCEmrWnu69sNk11KfD+zP5KbX+bqwN8VhHsVJkfjhv1K1K+5f6h0Rc5Ej52VAWa2Vc4Ijq9gR7ic1GaRiNx7AMiokmYRFzjj7EyxZeupGFoNsZW8PJfoxdk1RCGmwMJi+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzPv6IjgE9fi3GwFl3kMdV/ud7joRKvhvvLQVGUWdu4=;
 b=Z526fSrnRwM0axKdyTe6qcUaSC8WHZUXgdpJJJa8IRbybhm7lJRPy33OSl1hCQzo18cvjuctJm6Dz3RLJAekVOvCBd6+LMYMSKlXPGXaR/9YgepY5+9a/N8YHnhS2KxheYtyuadB8axcKMsTbvFU7uAtRBLFx7Y8NzmYWeltOIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BY5PR12MB4209.namprd12.prod.outlook.com (2603:10b6:a03:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Sun, 23 Jul
 2023 15:45:43 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146%7]) with mapi id 15.20.6609.031; Sun, 23 Jul 2023
 15:45:42 +0000
Message-ID: <bb99c57c-4d86-618d-81c5-74cff1c732c7@amd.com>
Date:   Sun, 23 Jul 2023 10:45:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] Input: i8042 - Add quirk for polling the KBD port
Content-Language: en-US
To:     Friedrich Vock <friedrich.vock@gmx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20230530153644.17262-1-friedrich.vock@gmx.de>
 <ZLsYUlSMIK0Gtr21@google.com> <a8e101fd-d221-7f56-77fd-d4656bc909f0@gmx.de>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <a8e101fd-d221-7f56-77fd-d4656bc909f0@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:8:2a::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BY5PR12MB4209:EE_
X-MS-Office365-Filtering-Correlation-Id: d459b088-c8ad-44d9-b91e-08db8b93df4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XufMqFq2Md17AxFjiqSG++NcVODt3fBuybgbqKpFQ02wTyuQZ0d1rKHiYYZx6jQMVNvBhbZVXwkN8GDX7XIpuLnWW9T0T6dAYarhsMEBkXW9GEItknqzwv+3ba1GqhiJu1b5PUtZd5Ru37UXwwM2rP1jLYN5Vwr7BYIOvLTTJ+4JMgKqxUDk2LxKapmhrvuFNfzQY4GUQ9q5DZkVuu7pZyfBYMU7SjByXroRRi8EG4cQHEGhKIytMHFpPc/ZhJVTuxQ0cqIjFsAWCn9zeoQ/vTDr6poQiX1EpspoZtzxlpFZQDRcvRTFYOf00qTTONuiKcogjiIc4q1MbuVRvGk4VXdPF5kFzkwxYgo+UVnecLU1iVFookbeTIS9YXzuCLMJFMOa+XR0F+9Rndg0Ecpxoma43FLHqWE5jleqtKQ0ycYmXLCSpdyfgNG3iiMhwm+n4mCklv54fL97VJ5JIMEJGIASbORm1g9tJWJBPD1qbzI+3WQj7NgITWEgjpazfFC1SX1p2735oWiXP23gq0OuH5+K89NF9n/PrVK7SK+/yYoQtCaveSaY2cM/5GLvK0ffwjfCh+emvVoGruDe0DxfdvG2OoeuVNtBsNb2Sp7upZZVpKBjHeYLjGIOdpiHiO6oTRmjluAq3GnaVmZvfvuvpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(366004)(39850400004)(136003)(451199021)(38100700002)(36756003)(53546011)(2616005)(83380400001)(8676002)(8936002)(44832011)(5660300002)(110136005)(478600001)(66556008)(66476007)(4326008)(316002)(66946007)(41300700001)(186003)(6506007)(6486002)(6666004)(6512007)(2906002)(31686004)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1BnbnJoUEduNmJVSHU2aEhDdE9vdEFudHgzMzBiMDZ2NjB5TjdNZE5OSjFM?=
 =?utf-8?B?V2x1clYrazVTcHNqc01RYS9SdGRWdHA1L2N4RFVVc0lDNDk3dmJGRVI1RjBX?=
 =?utf-8?B?OTA3Y1U1K1ltTWtGTnpUeWQ2OUUxUHlWNnZORG5vRlpvSzcwWHRSNnkvK3ph?=
 =?utf-8?B?bEdlTEZNUkM2UHVmdnUvcEdlNGowREVKZ3p5Q2pYVkh4R3hwbGg5RjZ2dHVF?=
 =?utf-8?B?cm1paWY5eFlxVGJqeEhHQk15N2FCUmR6cy8xMXFDNmVTZ29oWmtpZmc4L2FX?=
 =?utf-8?B?cmNQT0ZiTlNsVXpyS0VGSDhxdlNXbzkyRU1jKytqM2U5dWZ5bWNZUElKdTgx?=
 =?utf-8?B?OCtyaGU2bU45UTk2ZmsrdmVlVU1SUkVFcTBZU0FWazNsSUk5RFlZUDNWb1Z3?=
 =?utf-8?B?ZHl3WVcvdzYwVVE1c3ZGcVNkSFJjM0RON0dEbWN0UTVobjZieXRIYVBvbkpp?=
 =?utf-8?B?L3c2QUV4d0N2ZEVrZHNqd2FuQXM4eWNBQWJaeGp1ZXBaQjlBemtFYkczbUVa?=
 =?utf-8?B?SlViVU43VUhoT04zYVlPdzArK3N3U3lTRHZrYWRPUjNDeGVWZG81T0Y4YXRV?=
 =?utf-8?B?STBtQ3Q3R05jNEZIU09mWE1kL2xsV1l3ay84b3JGbHpBcWJVRWxxc0Z6R0hx?=
 =?utf-8?B?VVVnK0U5d2Fod1dQR2FvNFJOcmVTRk1LUERUNW51WDNtN2dkRHVHWWRSak9G?=
 =?utf-8?B?UkQrWGdCNTBCcXJzRFp1ZFFMQlQwSlVPWjhGeEcyelFSczZGbUplRjRDbkhn?=
 =?utf-8?B?KzJVUk0vSGJRbUJwWjZUOUdrWGZISGlkOVh2Ynh4L2RSeGpPa3RNcHM2MEV6?=
 =?utf-8?B?VHBoaEdoYW9HTWpEdXRITUdLR09idlpldnkyY1JIekRnYU1uT1d2TVN3Z2lK?=
 =?utf-8?B?TUp6SjNqVnB2a095ZFV3cDBPNXI0WEJnREhiTGZtNWxlSkdxOHc3OU5aT3JS?=
 =?utf-8?B?WHdzUkJaSWJ5NWsvWUFGVDRNT0dwdnhGRzVPUmROK3F1WjJhU0I1eWtnSG9H?=
 =?utf-8?B?cGxsci9ISzkxN3JCcWZURDVQaExNSWFYeEJNQUVEYytSU0ZJNXNQVkNKaHIv?=
 =?utf-8?B?NDRBZzBFdUs0ZzUzY1h3cVFHQUFwSVd6dGxiTG5ZVUJXeEpFNm1xWG1wZ2Z3?=
 =?utf-8?B?R2ZCbkFVNXZpOHlkV0pFcU43TTRHaGIxakcwNnAwZHN4c29NaS9zV2dIc0sz?=
 =?utf-8?B?NUx6M2F0VDNTS1FpVEZTanF4WGFBY1pDZTVJRjNaUm56cHcwbVpDanBnUVRz?=
 =?utf-8?B?ekdkOG9nQjlKL2pLTlVlVnkyRktEb2ttdDdSVXhzU0g0dmwxMWR0dEpIMVZZ?=
 =?utf-8?B?QTVybngxM3U4TjlHOGJhY0JsZUpXcDM3UVJGbU9QTmZBcHZBREwxNWdOVTVZ?=
 =?utf-8?B?czhsSWplRjBiN2c1bHdycVhuS1VnTFFXM1dSNkZZSVUrRTRsWWttRUdXZWFK?=
 =?utf-8?B?QWdOZVpFeVNOcWxnRnhvM2V5YUFwUDJ5WTBYdDQxSHFTc2pTTEloT2w1clM4?=
 =?utf-8?B?Rmh1bWtKMEpmbUtBdWRjdzdBalpHaWRpbDNCelVSbGdMRHlmekVBRE1XbFEv?=
 =?utf-8?B?allxUHJ3U0syazgwYS9hOTFlcnhRdFptZ3F1MXhNYkNBQ2RWeDFxSU83RU9k?=
 =?utf-8?B?bWljQnZrNjN1aWt6WFByNGNOcVM1R3Izd2EwVjZzN3lTV21Gdlc4LzFmZlY1?=
 =?utf-8?B?blBqdlBKczVYdmNqYXl2d2pyREhXaXQvNTNqVVcrbTZDN3c1Ym5MSUs2QjJa?=
 =?utf-8?B?QndEMkJGTjFmTXNoeWd0Z25odERXbzA4U3BKczBtZmpOMkI1MHNjSUgvZ2RJ?=
 =?utf-8?B?OTdRc2N3RlpEb0pZcG00S3ppSDJxK25kakNGMUt3ODdZVXV3MCs2ZWtrMERH?=
 =?utf-8?B?UE1FTE1oMk44OHptWllUYkxVeWVmaUZaZ2J0MmJJaU9NYmU2YUZBQmNoUGla?=
 =?utf-8?B?MjBiZGswczZRcWo2THlRQWZma1VNMGFKbWxpZncySTVJV3k4NW81aUlOWXk1?=
 =?utf-8?B?UUtxNXJIQ3ZNWms3cFFSckVTNEVmTGdydWREbnpDTlZmMUxKVGZQZi9NUnhX?=
 =?utf-8?B?QmtSRDh3Q3Z2bDNmbWFINE1MUEliNlc0eFNncU5BNFRxdjNqY1p2V0JwWFQx?=
 =?utf-8?B?TG1MZDJEMFFzZnR1eTFzY1hSVlJqRUVWNzJYbWMzSkNyZTVqL2Q2REwxRVEv?=
 =?utf-8?B?cEE9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d459b088-c8ad-44d9-b91e-08db8b93df4d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2023 15:45:42.8155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTj7/b1yssoqCRXG0CmzvtUYu6fiuvrhmnmat8GyL9wRBOOWDiEhMVG+LxY9UZDKTrbBLDsIURSy4O3BNc819g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4209
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/22/23 10:35, Friedrich Vock wrote:
> Hi Dmitry,
>
> On 22.07.23 01:44, Dmitry Torokhov wrote:
>> Hi Friedrich,
>>
>> On Tue, May 30, 2023 at 05:36:44PM +0200, Friedrich Vock wrote:
>>> It seems like there are some devices in the ASUS TUF A16 laptops that
>>> just don't send any keyboard interrupts until you read from the KBD 
>>> port.
>> I am sorry, but continuously polling keyboard port will absolutely wreck
>> battery life on these devices, so this can not be a real solution.
>>
>> I wonder if this is yet another example of incorrect IRQ 1 polarity
>> override on devices with AMD chipsets (CC-ing Mario).
> I'm pretty sure that's the case. I only found Mario's patch reverting
> these overrides sometime after sending out this one, but that patch
> indeed fixes this problem as well. It's contained in 6.5-rc2, so this
> patch is not necessary anymore. Sorry for not sending a "please
> disregard" earlier.
>
> Thanks,
> Friedrich
These are the Phoenix based laptops right?  There was also a second patch
series that went out that fixed and interrupt storm caused by a 
misconfigured
GPIO.  Everything is in 6.5-rc2 and most of it is coming back to stable 
kernels.
>>
>>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>>> ---
>>>   drivers/input/serio/i8042-acpipnpio.h | 30 +++++++++++++++--
>>>   drivers/input/serio/i8042.c           | 47 
>>> ++++++++++++++++++++++-----
>>>   drivers/input/serio/i8042.h           |  2 +-
>>>   3 files changed, 67 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/input/serio/i8042-acpipnpio.h 
>>> b/drivers/input/serio/i8042-acpipnpio.h
>>> index 028e45bd050b..be2e72aaa658 100644
>>> --- a/drivers/input/serio/i8042-acpipnpio.h
>>> +++ b/drivers/input/serio/i8042-acpipnpio.h
>>> @@ -83,6 +83,7 @@ static inline void i8042_write_command(int val)
>>>   #define SERIO_QUIRK_KBDRESET        BIT(12)
>>>   #define SERIO_QUIRK_DRITEK        BIT(13)
>>>   #define SERIO_QUIRK_NOPNP        BIT(14)
>>> +#define SERIO_QUIRK_POLL_KBD            BIT(15)
>>>
>>>   /* Quirk table for different mainboards. Options similar or 
>>> identical to i8042
>>>    * module parameters.
>>> @@ -99,6 +100,26 @@ static const struct dmi_system_id 
>>> i8042_dmi_quirk_table[] __initconst = {
>>>           },
>>>           .driver_data = (void *)(SERIO_QUIRK_NOMUX)
>>>       },
>>> +    /* Some laptops seem to not trigger any keyboard interrupts at 
>>> all,
>>> +     * even when there is data available. On these devices, manually
>>> +     * polling the keyboard port is required.
>>> +     */
>>> +    {
>>> +        /* ASUS TUF Gaming A16 with Ryzen 7 7735HS */
>>> +        .matches = {
>>> +            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "FA617NS"),
>>> +        },
>>> +        .driver_data = (void *)(SERIO_QUIRK_POLL_KBD)
>>> +    },
>>> +    {
>>> +        /* ASUS TUF Gaming A16 with Ryzen 9 7940HS */
>>> +        .matches = {
>>> +            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "FA617XS"),
>>> +        },
>>> +        .driver_data = (void *)(SERIO_QUIRK_POLL_KBD)
>>> +    },
>>>       {
>>>           .matches = {
>>>               DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>> @@ -1634,6 +1655,8 @@ static void __init i8042_check_quirks(void)
>>>       if (quirks & SERIO_QUIRK_NOPNP)
>>>           i8042_nopnp = true;
>>>   #endif
>>> +    if (quirks & SERIO_QUIRK_POLL_KBD)
>>> +        i8042_poll_kbd = true;
>>>   }
>>>   #else
>>>   static inline void i8042_check_quirks(void) {}
>>> @@ -1667,7 +1690,7 @@ static int __init i8042_platform_init(void)
>>>
>>>       i8042_check_quirks();
>>>
>>> -    pr_debug("Active quirks (empty means 
>>> none):%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
>>> +    pr_debug("Active quirks (empty means 
>>> none):%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
>>>           i8042_nokbd ? " nokbd" : "",
>>>           i8042_noaux ? " noaux" : "",
>>>           i8042_nomux ? " nomux" : "",
>>> @@ -1687,10 +1710,11 @@ static int __init i8042_platform_init(void)
>>>           "",
>>>   #endif
>>>   #ifdef CONFIG_PNP
>>> -        i8042_nopnp ? " nopnp" : "");
>>> +        i8042_nopnp ? " nopnp" : "",
>>>   #else
>>> -        "");
>>> +        "",
>>>   #endif
>>> +        i8042_poll_kbd ? "poll_kbd" : "");
>>>
>>>       retval = i8042_pnp_init();
>>>       if (retval)
>>> diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
>>> index 6dac7c1853a5..7212263d3a41 100644
>>> --- a/drivers/input/serio/i8042.c
>>> +++ b/drivers/input/serio/i8042.c
>>> @@ -115,6 +115,10 @@ module_param_named(nopnp, i8042_nopnp, bool, 0);
>>>   MODULE_PARM_DESC(nopnp, "Do not use PNP to detect controller 
>>> settings");
>>>   #endif
>>>
>>> +static bool i8042_poll_kbd;
>>> +module_param_named(poll_kbd, i8042_poll_kbd, bool, 0);
>>> +MODULE_PARM_DESC(poll_kbd, "Continuously poll the KBD port instead 
>>> of relying on interrupts");
>>> +
>>>   #define DEBUG
>>>   #ifdef DEBUG
>>>   static bool i8042_debug;
>>> @@ -178,6 +182,24 @@ static irqreturn_t i8042_interrupt(int irq, 
>>> void *dev_id);
>>>   static bool (*i8042_platform_filter)(unsigned char data, unsigned 
>>> char str,
>>>                        struct serio *serio);
>>>
>>> +#define POLL_TIME 1
>>> +static void i8042_poll_func(struct timer_list *timer)
>>> +{
>>> +    unsigned char status;
>>> +    unsigned long flags;
>>> +
>>> +    do {
>>> +        spin_lock_irqsave(&i8042_lock, flags);
>>> +        status = i8042_read_status();
>>> +        spin_unlock_irqrestore(&i8042_lock, flags);
>>> +        if (status & I8042_STR_OBF)
>>> +            i8042_interrupt(0, NULL);
>>> +    } while (status & I8042_STR_OBF);
>>> +    mod_timer(timer, jiffies + msecs_to_jiffies(POLL_TIME));
>>> +}
>>> +
>>> +DEFINE_TIMER(poll_timer, i8042_poll_func);
>>> +
>>>   void i8042_lock_chip(void)
>>>   {
>>>       mutex_lock(&i8042_mutex);
>>> @@ -1437,13 +1459,15 @@ static void i8042_unregister_ports(void)
>>>       }
>>>   }
>>>
>>> +
>>>   static void i8042_free_irqs(void)
>>>   {
>>>       if (i8042_aux_irq_registered)
>>>           free_irq(I8042_AUX_IRQ, i8042_platform_device);
>>> -    if (i8042_kbd_irq_registered)
>>> +    if (i8042_poll_kbd)
>>> +        del_timer(&poll_timer);
>>> +    else if (i8042_kbd_irq_registered)
>>>           free_irq(I8042_KBD_IRQ, i8042_platform_device);
>>> -
>>>       i8042_aux_irq_registered = i8042_kbd_irq_registered = false;
>>>   }
>>>
>>> @@ -1497,10 +1521,14 @@ static int i8042_setup_kbd(void)
>>>       if (error)
>>>           return error;
>>>
>>> -    error = request_irq(I8042_KBD_IRQ, i8042_interrupt, IRQF_SHARED,
>>> -                "i8042", i8042_platform_device);
>>> -    if (error)
>>> -        goto err_free_port;
>>> +    if (i8042_poll_kbd)
>>> +        mod_timer(&poll_timer, msecs_to_jiffies(POLL_TIME));
>>> +    else {
>>> +        error = request_irq(I8042_KBD_IRQ, i8042_interrupt, 
>>> IRQF_SHARED,
>>> +                    "i8042", i8042_platform_device);
>>> +        if (error)
>>> +            goto err_free_port;
>>> +    }
>>>
>>>       error = i8042_enable_kbd_port();
>>>       if (error)
>>> @@ -1510,8 +1538,11 @@ static int i8042_setup_kbd(void)
>>>       return 0;
>>>
>>>    err_free_irq:
>>> -    free_irq(I8042_KBD_IRQ, i8042_platform_device);
>>> - err_free_port:
>>> +    if (i8042_poll_kbd)
>>> +        del_timer(&poll_timer);
>>> +    else
>>> +        free_irq(I8042_KBD_IRQ, i8042_platform_device);
>>> +err_free_port:
>>>       i8042_free_kbd_port();
>>>       return error;
>>>   }
>>> -- 
>>> 2.40.1
>>>
>> Thanks.
>>

