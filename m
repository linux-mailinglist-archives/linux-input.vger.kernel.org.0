Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D02B737592
	for <lists+linux-input@lfdr.de>; Tue, 20 Jun 2023 22:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjFTUDJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jun 2023 16:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjFTUDH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jun 2023 16:03:07 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21DD10D2;
        Tue, 20 Jun 2023 13:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RD/+q/o5TJYBUdC719i31SVb/0JdHFnfxwSccF57Wcj5ggrLY6h+b8JGgemAMBoRFWwp/aB+Ff7BZaUMJXP9sUESMSk6Ln7ngD6pUNxrllG9pqkrIf7rOmKOKox0tUMjA79hOsp3+NaIhyOwlJ12AE9nvwkEgVgsHC7aCRWdYfht5WtHTtVk5WJD/taFFYLKUhwzfxC86LX1OxFqbI3acG0lJA0tAmUWs141jJs8IS5NHWIzUU5VOqIBmphZmUE65dN7PUlFA7/qoclNGaXDSWnxi3kF6C13sd0LvYD4VutHd8k7Vyth8DjBq3T9zn5aseTcXjc0IoAnPKtMszeoJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6oHWG/dIl240rT1dn7FX2/vA/z7UvThz/I56xU2ThM=;
 b=gET/QErBGMgokexAaKOxOIu8INPVuAjD/Ve1W63LERRF1KP5Df4E1fMi7hxMtFLKNhLoraLNanb76D/8uydlIm8hfTVh8rQRnlErjS2WoanhA2zG1IHkSEIeWUdLobvoc07bH9YxWiPYPFFafwt0KPGzQ1C+oLr/e1XFRb3IxvPvu6paky0pAZicV/Kj2XeqrQo5b2xCxCvSi4ConPRcF79CxVfUCKzPjyhlXxGK4ahKJXsS5EE7v5Hz6utcjcldc3VjHP4F916gTLiN0nOh4QZl3SjQk/QDuj0ISwKJ9Qbwm+8qEhIZvxqMS2S9wDG/RK0nK+uP1+/CcDz35Ki0iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6oHWG/dIl240rT1dn7FX2/vA/z7UvThz/I56xU2ThM=;
 b=KSgEQZSFF3OVVNW6u3GnIdTK6ukk6OUX3dWsSh7pEbVmerSznfcVPoyczaJgqhpvJu398TFs98+sIL4SnYwaNQw6mt8xjPP8N+YIlI2S5pRbZd+hJmCtI/T41OUXPghfGuA0GxulqWN1VmrlaHpaQxNUI+GfMuMeUOyM9TeTckc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB7448.namprd12.prod.outlook.com (2603:10b6:510:214::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Tue, 20 Jun
 2023 20:03:03 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.020; Tue, 20 Jun 2023
 20:03:03 +0000
Message-ID: <602504a5-334d-92e8-2fd3-f7e8662b714e@amd.com>
Date:   Tue, 20 Jun 2023 15:03:00 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: amd_sfh driver causes kernel oops during boot
Content-Language: en-US
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
To:     Linux regressions mailing list <regressions@lists.linux.dev>,
        Malte Starostik <malte@starostik.de>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>, basavaraj.natikar@amd.com,
        linux-input@vger.kernel.org, linux@hexchain.org,
        stable@vger.kernel.org
References: <ZG3ipauL9FTnQJiC@debian.me>
 <aci7a4jnosozypn6sffsdoaezg4p42zgjy5dwnjyvnbav7chdm@wettfjwb4enw>
 <79bd270e-4a0d-b4be-992b-73c65d085624@amd.com> <5980752.YW5z2jdOID@zen>
 <1b3fd148-44d7-d476-e9e6-f9d8c8ec0ee6@leemhuis.info>
 <f677a16e-1fa2-3f45-2b44-5acbf67aad3c@amd.com>
In-Reply-To: <f677a16e-1fa2-3f45-2b44-5acbf67aad3c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0071.namprd05.prod.outlook.com
 (2603:10b6:803:41::48) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB7448:EE_
X-MS-Office365-Filtering-Correlation-Id: 189d2577-f704-4b77-43c5-08db71c95ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFGQ9dXCusIfAGUGcBVs0BAnwBI4YZmH9r4+J5+MWB0GKGLAF8jXQW1hu6yV4Tfj16f8xX5VKcm7VZMHKEsxemTAoFnmrjVI2AH6xxPXpiGcaaXpJbc2+Tdv5mwiwN/mbcJt/5MPO7eZZeNW/sxo5ouYaFFyzvoUr9GbsEGim0hKtZXxylMFYP0nOt0Y8RF7pDoWNHfHEXX7Vqy9NbDKi5lq1cjf8UYhjq/cGX7kHtNXt8Sq/vfS6YTk3TUfhW2BfM01f1ectIfJ8CEGjWoFYEQiuw9LqmQvoMaZiaYMXcUecuSFOCV51AyiGBgr8kR/R3yNLyxyO1yidix1lJrlptzKLuVb8lm/6G8ByxzTFI+9qNHszzlDYplAzc0SPH7Aa4Qy7TuUqMbjdUAWBqJ2Qpy0ISctDnw3kz9Y8OW9HNeAZAblpH9R5y6KaLbLGzfWyBBBPLoOaSudCRVH+C1kx1XgJWtrmLrBThQPb3GaJDUi7zONmCDI5SPGral6XD4lZs2fD4Cva1slCmnDE7hxoxSWqOcGJ4l8eLDbfnbImStqhRqdPe6mDmBqxLNH/RabXNJwhdwIxMiq5oIJ/Tz/bREzzE5A3D5zeAtrQJwGThOv7TnN2WgovgfW3UAMo7rutjbAETKQQt4Pvc/VqWhgPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199021)(966005)(6486002)(6512007)(2616005)(110136005)(83380400001)(478600001)(6506007)(53546011)(26005)(186003)(2906002)(5660300002)(36756003)(38100700002)(316002)(4326008)(66946007)(31696002)(8676002)(41300700001)(8936002)(86362001)(66476007)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE4vbDVEdHhNTFIwZHNXbFRsQ2ZSeXU1SHY3NDBnNmFaWXZ0WjhiVWxZcWVT?=
 =?utf-8?B?T2ROaEpSQmNTKzNxQTNydzdRL1VXWUtlN0t4Y09QTlZkR201dml1WStyZlAw?=
 =?utf-8?B?bUV2cm0xRFQwQ3M0L0hjelR5N2dQdGZWSHhWZTlpSklrc1NGWXZ6OURJMDNB?=
 =?utf-8?B?YjJvQnN6M2VDT1lGa29Mclo3Tkh0SnpkUDZRNFpBb2lRdnZ5S1FTVjVkRW9a?=
 =?utf-8?B?NVJuSU1hMXNjQzZ4UldkV1lyVDJGYlljN2h1Sk9FVXVpdGViUytXOHY2Q29B?=
 =?utf-8?B?YmtFQVByZTdaMmgxeHZUc25mclFHUTBHdWlydDRIR3NrbHN2T1RQL0docG9J?=
 =?utf-8?B?QTRydFVidG0yVm1yUWVJM1hnNkc4QkVCNDVTeVdPdnFyUVI3emtmWmt3WkZ5?=
 =?utf-8?B?K2x1K3hPZCtDSEhlbjlpOEluZUdxNkwzYzJTYUd3MmM0SUJYMGJ0ajViUE9s?=
 =?utf-8?B?R2V5ZjVXWW5wMmhTeURYZmp5RURzbC9rNC8vUHVWQVNhcVJ0UURqK0FJZVhU?=
 =?utf-8?B?NDg5dzFpVlVxZFZreW44elcwZHFMSTlhOWI0T3VaVHRMUmdCOUM3RGtWRmg3?=
 =?utf-8?B?SWR6MmptZXFhL0pocXlnS3ZCUUJhWGZhdFZPdHlTbktHcG5OVElteVpvaFJn?=
 =?utf-8?B?dXBZb2xvdi8xcUZVc1gyL1FBNGNFWmxHTDJqRDJOdTNzWHZMQ0JPSUdUV3VL?=
 =?utf-8?B?QTVwazcvcjBsMGFHZXBmMVZZK2N1VTNzWE1xNyt2QzVUUERlenI5N3k0ZkI1?=
 =?utf-8?B?Zlpyc3hOMnRpNHZqR25pcXdXTUd3RTdwNjcvM1JIcGZGa0d2cGJzZC9HWkNy?=
 =?utf-8?B?VUhnMkdBM01zYThiSlgyVlAvenoxeTk5TXRYbi9GdCtjaHZDVUV6cG9LWE5v?=
 =?utf-8?B?SnF1bGZ2bzFtOFZsYVN6TE4yTFFDbUFGL2lpREJrb2J0UmVEY0tlODM4TzBK?=
 =?utf-8?B?TVplWkZwQVVCdmNFVXlXYVlSTXdhMGFMQzJvVkRZZnJmWURpRGJRS1RZNFZh?=
 =?utf-8?B?Sko0Ky8yU0VWdHVoT0UxV1d3Zlcwa2xkQVJxbEkySFZzTW05YmNOditqMGVG?=
 =?utf-8?B?VWVrTmZLZ1BpcWJEMml4MVJZK2JVSXlTUWtEOGpFOCszdXlhZ0JQZithNER2?=
 =?utf-8?B?MXBQYjdNM1VUVmlDOU9Ga21BSlU3RVJBbEdYazJReTdja2RIYmluUDB0UjY3?=
 =?utf-8?B?UTNEaWhYRjVpYmd0OWR5ZDhZTlErbGRYbDl2dmw5cit4TFZCS0NNM0kvME5q?=
 =?utf-8?B?cnRnSVg0V0hHbUJML2M2V1N0NHVnYmJYMzV5ZE5SbnBLcDV4d0dJUm4zaTM5?=
 =?utf-8?B?bU12Qi9QWEU2Rm1EK3V3WkJSZ1lydU1saWd3VnZhV2dNclRhalJ3REtpK2ZS?=
 =?utf-8?B?dm9IUS8xbUN1VG01ZjAzY1dhUm5mUDQzZGVXS2NzbjVtMlFxMUpMZ09PQlNV?=
 =?utf-8?B?SmZrUlRmcU14Ny9LYUxEa25Rb2V4NGxpQlp1UHNxSXBQZUpQbFUwMTBqZkla?=
 =?utf-8?B?M1lraC9Hd0ozN0YrNzVRK0ZRRVZSMmFZY1Y3cytNK1BZSnNuNktkR1IvRlVP?=
 =?utf-8?B?Z1d2aHczWC9BMmxKUFJVTmtiZmR5Y1RqUW9IUVdTTkZ4TFNKRXZZOFArblZD?=
 =?utf-8?B?ODZ3cmNFWDYrVkJLZXpvd0t4RlZXNFFNRmx1bTRRUHplaDhxSitHQklqNmVm?=
 =?utf-8?B?VEoxTUtCOHlXcDdTRnBjVis1S1RiNGsyZmxhcnV6RTV3RkhPaHZGSVR4QUxZ?=
 =?utf-8?B?Y2I1UEp5V3JlQmJLbjhuY0hSVEhweEtzc0J3ZklYZFJYRkM5cS96Uko2aUVs?=
 =?utf-8?B?MVVEOUlPeEFJc09jbGxGdFA5L1AvWThmR0JoY2o2cEFjVGdSYUgrYmg3VXIv?=
 =?utf-8?B?TmFhZFhXRHB2QTNJQnM1YUV0Y2dlbG54V1lCVVdtNXRuWkxNRVRSd0tEeTYr?=
 =?utf-8?B?OElqckVVTVJocGxPVUVqcUM2OVNwNUdPamFPSVE3eTBYQWYyeDZ3ak1pN1FY?=
 =?utf-8?B?aERrRmFhM0VqTStma3l1QkJsdFdUL0lFaUhBWGZmaGtiaU5iQ0lLSXBuZEFu?=
 =?utf-8?B?MGJXUElOQU01T2phWW0wN2V4eTEwSTlrUmJyWjdsbUxLTTJLdVluenFXNEds?=
 =?utf-8?Q?L6H7OFGjXbnkUhgFR+hYEMdYu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189d2577-f704-4b77-43c5-08db71c95ac6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 20:03:02.9836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o420MGX5ys12Nn/i52kNTG8Tab29mTijqSVr1gCbEnsX2KuAnmFAn/t/qIK+oJZ0HRYv/EZmko5cCjZrWpt9zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7448
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 6/20/2023 1:50 PM, Limonciello, Mario wrote:
>
>>>>> I have a suspicion on commit 7bcfdab3f0c6 ("HID: amd_sfh: if no 
>>>>> sensors
>>>>> are enabled, clean up") because the stack trace says that there is 
>>>>> a bad
>>>>> list_add, which could happen if the object is not correctly 
>>>>> initialized.
>>>>>
>>>>> However, that commit was present in v6.2, so it might not be that 
>>>>> one.
>>>>>
>>>> If I'm not mistaken the Z13 doesn't actually have any
>>>> sensors connected to SFH.  So I think the suspicion on
>>>> 7bcfdab3f0c6 and theory this is triggered by HID init makes
>>>> a lot of sense.
>>>>
>>>> Can you try this patch?
>>>>
>>>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>>>> b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>>>> index d9b7b01900b5..fa693a5224c6 100644
>>>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>>>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>>>> @@ -324,6 +324,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev
>>>> *privdata)
>>>>                           devm_kfree(dev, cl_data->report_descr[i]);
>>>>                   }
>>>>                   dev_warn(dev, "Failed to discover, sensors not 
>>>> enabled
>>>> is %d\n", cl_data->is_any_sensor_enabled);
>>>> +               cl_data->num_hid_devices = 0;
>>>>                   return -EOPNOTSUPP;
>>>>           }
>>>> schedule_delayed_work(&cl_data->work_buffer,
>>>> msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
>>> I applied this to 9e87b63ed37e202c77aa17d4112da6ae0c7c097c now, 
>>> which was the
>>> origin when I started the whole bisection. Clean rebuild, issue still
>>> persists.
>>>
>>> Out of 50 boots, I got:
>>>
>>> 25 clean
>>> 22 Oops as posted by the OP
>>> 1 same Oops, followed by a panic
>>> 1 lockup [1]
>>> 1 hanging with just a blank screen
>>>
>>> Not sure whether the lockups are related, but [1] mentions modprobe 
>>> and udev-
>>> worker as well and all problems including the blank screen one 
>>> appear roughly
>>> at the same time during boot. As this is before a graphics mode 
>>> switch, I
>>> suspect the last mentioned case may be like [1] while the screen was 
>>> blanked.
>>> To support the timing correlation: the UVC error for the IR cam 
>>> shown in the
>>> photo (normal boot noise) also appears right before the BUG in the 
>>> non-lockup
>>> bad case.
>>>
>>> I do see the dev_warn in dmesg, so the code path modified in your 
>>> patch is
>>> indeed hit:
>>> [   10.897521] pcie_mp2_amd 0000:63:00.7: Failed to discover, 
>>> sensors not
>>> enabled is 1
>>> [   10.897533] pcie_mp2_amd: probe of 0000:63:00.7 failed with error 
>>> -95
>>>
>>> BR Malte
>>>
>>> [1] https://photos.app.goo.gl/2FAvQ7DqBsHEF6Bd8
>
> Apologies; for some reason I never got that above reply in my inbox,
> some server along the way might have deemed it spam.
>
> Anyways; I just double checked the Z13 I have on my hand.  I don't
> have the PCI device for SFH (1022:164a) present on the system.
>
> Can you please double check you are on the latest BIOS?
>
> I'm on the latest release from LVFS, 0.1.57 according to fwupdmgr.
>
Hopefully the newer BIOS fixes it for you, but if it doesn't I did come
up with another patch I've sent out that I guess could be another
solution.

https://lore.kernel.org/linux-input/20230620200117.22261-1-mario.limonciello@amd.com/T/#u


