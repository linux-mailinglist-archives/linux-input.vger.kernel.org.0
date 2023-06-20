Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F2D73748D
	for <lists+linux-input@lfdr.de>; Tue, 20 Jun 2023 20:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjFTSuj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jun 2023 14:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjFTSuh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jun 2023 14:50:37 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A706410D2;
        Tue, 20 Jun 2023 11:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAcdUJPrQOijF1ChHBSFmRRWkqJDjI9i5r8FrK5JyWzGit5qAcn/VjWQwg1cKsf0De9cdKFp9PgzI/kbZ6bp75EEdNIMd/pTQqkPEimvfobs7xd3+2XWf0CNrxHCbNr/zdt1hd2QkD0BP3si27OrD+uoKtEq9wr36QRlPGEweqMQpIorz37eZTVPFrI5FnLGowk41MHaU6MXJd5GkgWNqads5arqMMGRsed2lEp4JqJn0a4gPzS4l0SdILiJQVXYuKAChyvTWx/4aNLF8Bp1jfDS4qia7qgOD3509m+CA7EYiOotjQC9JOAdP+c87ve/KVolp6+9j1fFbNgOMcrCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WtDFhNrHYiqqBDf75JtzXD6bmWgT+GyF36qyTbwDx4=;
 b=DbaBsH6GNDP1d1tvhIq8xZT3+UrrrVHoIFHakKWH42Dt2Aq5cUBLeHpkKaoxGPH1KUoVX1csv3TmJhK6btmuYqAHDyLInUSJbzCNHRPrciJdZhKafzAzqfpCTqr1dtoh5fef5xUyCCRUfVukOA8MM++zsF21lcPBsncdavlGqOjrh0JiBmjZCQLbASev3qGdGw5hpPPcU+7qYw26mULDH/MunCJfShPrNZKDcoaSmOYUdk+C2MdJnsshi8FdSZjBXt4tohr7sfyMDbUfQ+6C1r1LDI4adyUDnSEwI3KrS7gQm+EmvFtRYpEzhi6I1+eNHHdzv2c/4ZXY5aJzFM/c4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WtDFhNrHYiqqBDf75JtzXD6bmWgT+GyF36qyTbwDx4=;
 b=tKZiI2/EL1j4Ge0hZEqvrvwKOnimYlh4MYOuK7w0n4k9sTSm8blfxqG1mk1I/dfbtm1keAbyb0BUH2odwo5jRzHxnXZAaqr1DvshUTZh7MeKMRh/eIukHtKmyh+hQxPi4SjuV2I2jEMKyo6G8RD3qTW6c3iRMWv+EEkBHKvCImI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB6711.namprd12.prod.outlook.com (2603:10b6:a03:44d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Tue, 20 Jun
 2023 18:50:33 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.020; Tue, 20 Jun 2023
 18:50:33 +0000
Message-ID: <f677a16e-1fa2-3f45-2b44-5acbf67aad3c@amd.com>
Date:   Tue, 20 Jun 2023 13:50:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: amd_sfh driver causes kernel oops during boot
Content-Language: en-US
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
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <1b3fd148-44d7-d476-e9e6-f9d8c8ec0ee6@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR02CA0133.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 4253db94-b436-4f7c-2958-08db71bf3a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZxxvYYL1Kt+ykcC8j9DKtNG2N6nQefXJPvwBsjLprGipKuGPlaR3EsKmAe/xyv13ySjCPqCLdLEIHkZWqQcV8hUaNelb+j/TzkCVPyXYA9inbPgvez/oXIkPWx6cDTP7tU9gav6jBwxNMF8U2yM3I4AMSsYBi+/O5/YfgM9A5zVotkJa+KL8q8oOQLI2pldE7+6rLy9prQEvBtqmsot25ozmZi/m70s7vIF+5X2MXK658MwTdZBzsK1ZXy4Dr0sH7I4fkFCpPb7wZ0qLH71CUcI+fo5CLZ8uKoKnuU6Y87vM8khB0COr3ZhU4vgaIoW1AscuiGMfQ0tDFN+W5nN+17FyNINnq1NcuzjDkElMrsAGQLFBR610ebP+CnLDs14W30MIddCFgFMbIrMCvcotUd1LKNpn3bQguQRSnW0QXgg2nKJYh3HqG59IJ5THiXM5FIUvUdLLu9oqP/jrCEzVcgjFPysuHEq0839i9yt6IgfLU17UAhKhRCgJhS4NXX7uAMRT3PaVuJUh+JnWCklsdoOd3vx1IS2sOkyBxvInzxyienJldwaJpJHPevJHkTYNdWstv+tMLivO0hJLsfDVxDBku31ehSOipaf/J5nXyf226mHLRFI+XCb56gqSeNS0QsC7Njmh2faM7xGTeUUVqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199021)(38100700002)(110136005)(966005)(6486002)(478600001)(2906002)(5660300002)(4326008)(316002)(66556008)(66946007)(66476007)(8676002)(8936002)(41300700001)(2616005)(83380400001)(6512007)(26005)(186003)(6506007)(31686004)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmxSSXZvWk5ybWRieUoxWWpQZUpPYTNzSGtWUDdjWU9hN2lwMCtUWE1qRk1s?=
 =?utf-8?B?OXF6YXNhbCt1UFhzNkxHOEtSWEtzL0ljZyt2Nit6TjJhSERsU0FjZWllZnFO?=
 =?utf-8?B?Vm5VaFJkU2tJZWVRNSs1UTZyY3l1UDR2b29Rd2I1RUdLVnkvUUZvaEw1aE1G?=
 =?utf-8?B?NWhXRkZMTmJqVUw0Z3BhbEhjd3dwOVpiRGt5OWR3aWFsbFZBZlhGUU5Dc3cw?=
 =?utf-8?B?YnFrVEJHVU53c2JKR3Q5VW51L1JBMzNwaWxOSVBmZGE0OXAvQUFqQ2NzeEdu?=
 =?utf-8?B?anVKS1NGSlZYcFRPNkhudFFtTWF5aGxWU1FoZ1UxVE1ydzdEZnozYzVnaTVn?=
 =?utf-8?B?TWNaY1JVcHl6NFcraldUbDBwbEVzTXg5dVkrMjBWYnNTYk40a1NKWi9EaHVz?=
 =?utf-8?B?bXNZZHA4Vm4xTFFOYzJEbk9kWXlKU3pveWsyWk1wNW1UbFQrYTRRM1FwL2ht?=
 =?utf-8?B?MnJGM2hsQUdSRjdRNS9PajB3V0NRNEJWQVNuL2VBeEc0RXYxMVZ2N3AzOFNh?=
 =?utf-8?B?NnNwa1JnNEJXL2VCeU0wSW1BUW5qd3J1eDhzVEp6a2hMZndqWENuaWs1ZVdO?=
 =?utf-8?B?bE11WkxWd3FuZUxGRHR5ak1LRzZxb21jSXcwK2tSYXRKd3hNVVZUSnFyZzRW?=
 =?utf-8?B?dVJwZW5qR3VNVHR6Nkt1OXliakRkRDZFOFNoa1NwTnIxZDYxZFVxL1NVNWFF?=
 =?utf-8?B?eU85cUF1VE9rL24vQjk4NWRodnY3ZXIrdSthSldNeTBEUjl1UTFZVlc3SUpX?=
 =?utf-8?B?MmxlQTRZN3VFOXlpVXJkNURlUDFyUXJWS1FSMDd3TGF3bkgzblJVRmY2eXoy?=
 =?utf-8?B?ckdHTm9rZnpZYnpHdmsrSk5QMUN5VWNiNHdNYWZTd1pHUy96elFUV3IvMCtv?=
 =?utf-8?B?WUtjTmhrS1F4REJ3bnFXd1NoQ054Y1MzclNyWEYwNTZPYnNjb1AvSmlaZ2di?=
 =?utf-8?B?ZW1tYzFDSXlEbDh4bDRtV3B6YTBJNjViTkEzek14NTVPbHJCQWxGUzM0MzZ0?=
 =?utf-8?B?M05UVE1NSnVFVzZ3aVBvMEJOSEt1T2xjTXBUTlJvbTVkMUZxRTYweGtYMU1Z?=
 =?utf-8?B?T0ZWSitSdzlIdzJzdi9PRkZsMHA4RmpyZFlUWEVwNzh3ZFd0cWNBL3VsNytT?=
 =?utf-8?B?SWgzRjd1dEZNWGljYytCdW1PbWR1dlE3OTFxMFMrRUdWS0svaTErQ3ptOVcr?=
 =?utf-8?B?Tmw4eWtxTEZQVDQxQmpTcUthK1l4U0pFSWxoUTQyelVNdHkyaFVnaXdueDkr?=
 =?utf-8?B?ZmlVVnBGYjRiZXltLzBBYUxJcTRjL3p4amVQOGNqcWVLQ1JsUlFjWmk0WHZt?=
 =?utf-8?B?MTlUSEY0M2s4aEViQ2xNazdlZkVUUEowbG43V21XU0JvK1ErSG1hVkdXTzlQ?=
 =?utf-8?B?dE04WFJiN0w1bDNqbzl1N1p2MGhLaEpJbEFxaTZrSVR0NXhHWjVrSklhbmRu?=
 =?utf-8?B?Szl5RlpBRDBibEF0VDRLcldhYlFxVXlqeWJIcXROWnJaRUxGRzhtL3ZSTFlB?=
 =?utf-8?B?NDNheEFMLytkVzNIK2tnazBzR0NhMUFGajBTbDF5aE1VMEJaRCtpaFV4c2l1?=
 =?utf-8?B?UFJJWGtvUW9sQkhWT2t0NjhFcmxIQ0Z2ZHU1MktxYXQ3V0prRnhSVTJsQTFV?=
 =?utf-8?B?amJrRXpoRE4vZ3RMT0N1RmpCc0lwM3RnVzVNSW1wQkRCUjF5REFYcjJteFgy?=
 =?utf-8?B?MTZFZ29hQy9yOG1hWVBvc2ZiMm1hWnBZbCtlRG1TMlJqZ2wwK2NqY01pVzR4?=
 =?utf-8?B?eHB2eE51YWZyUWx4cmFZM3JXV3JUYysrdWcxQjhjUnZGc3ZWVGVKNUJZdlI4?=
 =?utf-8?B?ZEpPQnRwVFdjTjdFS3I4MnJQSHJDMkI1U3ZEd3UvWGhPZFJpMmNtVFlRY3Jk?=
 =?utf-8?B?K0wweC9ELzNGZW1wcUlhL01TbVQ3R2g4OWJhclQyeVU0a2MweXplb2d6Umkr?=
 =?utf-8?B?N1RzWFhVYTlja1pFQ1JxNVFEbG5pYWdwQmRaa2V4QjZnbGdTcS9yVEQxNllh?=
 =?utf-8?B?Qzd3TzdZc0V6QVF1L3FCNVA0eHBZUXdQWERZRnpDZisrcXhuQ2Eva3dUZzds?=
 =?utf-8?B?dEZuNmtjbXFkYzBzaUtiU3Z2OUZCQnA2OEcyeWVOTkFxWm9XSWk4dk5XTGJi?=
 =?utf-8?Q?xbgRyEzUJhV9Nkvc0dRJig2uh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4253db94-b436-4f7c-2958-08db71bf3a36
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 18:50:33.3706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnKEXp4pCrCf5MI/Zjmtyf1IGbgR23v/k+COW3eZuLU3fe2TGXc3rP8cRy/uEZQXO/LPHAJfR/5KcC1ElE6SXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6711
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


>>>> I have a suspicion on commit 7bcfdab3f0c6 ("HID: amd_sfh: if no sensors
>>>> are enabled, clean up") because the stack trace says that there is a bad
>>>> list_add, which could happen if the object is not correctly initialized.
>>>>
>>>> However, that commit was present in v6.2, so it might not be that one.
>>>>
>>> If I'm not mistaken the Z13 doesn't actually have any
>>> sensors connected to SFH.  So I think the suspicion on
>>> 7bcfdab3f0c6 and theory this is triggered by HID init makes
>>> a lot of sense.
>>>
>>> Can you try this patch?
>>>
>>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>>> b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>>> index d9b7b01900b5..fa693a5224c6 100644
>>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>>> @@ -324,6 +324,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev
>>> *privdata)
>>>                           devm_kfree(dev, cl_data->report_descr[i]);
>>>                   }
>>>                   dev_warn(dev, "Failed to discover, sensors not enabled
>>> is %d\n", cl_data->is_any_sensor_enabled);
>>> +               cl_data->num_hid_devices = 0;
>>>                   return -EOPNOTSUPP;
>>>           }
>>>           schedule_delayed_work(&cl_data->work_buffer,
>>> msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
>> I applied this to 9e87b63ed37e202c77aa17d4112da6ae0c7c097c now, which was the
>> origin when I started the whole bisection. Clean rebuild, issue still
>> persists.
>>
>> Out of 50 boots, I got:
>>
>> 25 clean
>> 22 Oops as posted by the OP
>> 1 same Oops, followed by a panic
>> 1 lockup [1]
>> 1 hanging with just a blank screen
>>
>> Not sure whether the lockups are related, but [1] mentions modprobe and udev-
>> worker as well and all problems including the blank screen one appear roughly
>> at the same time during boot. As this is before a graphics mode switch, I
>> suspect the last mentioned case may be like [1] while the screen was blanked.
>> To support the timing correlation: the UVC error for the IR cam shown in the
>> photo (normal boot noise) also appears right before the BUG in the non-lockup
>> bad case.
>>
>> I do see the dev_warn in dmesg, so the code path modified in your patch is
>> indeed hit:
>> [   10.897521] pcie_mp2_amd 0000:63:00.7: Failed to discover, sensors not
>> enabled is 1
>> [   10.897533] pcie_mp2_amd: probe of 0000:63:00.7 failed with error -95
>>
>> BR Malte
>>
>> [1] https://photos.app.goo.gl/2FAvQ7DqBsHEF6Bd8

Apologies; for some reason I never got that above reply in my inbox,
some server along the way might have deemed it spam.

Anyways; I just double checked the Z13 I have on my hand.  I don't
have the PCI device for SFH (1022:164a) present on the system.

Can you please double check you are on the latest BIOS?

I'm on the latest release from LVFS, 0.1.57 according to fwupdmgr.

