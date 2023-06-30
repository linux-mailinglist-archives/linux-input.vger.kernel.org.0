Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6377442FD
	for <lists+linux-input@lfdr.de>; Fri, 30 Jun 2023 21:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbjF3Tzj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Jun 2023 15:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbjF3Tzi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Jun 2023 15:55:38 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B235107
        for <linux-input@vger.kernel.org>; Fri, 30 Jun 2023 12:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQEWpoCarKMUu+1yDZSUWRV+CxwN6uurUOvMluLpbioV8QszpOMCgYNIwsVhLSVhsjyUs50E5DBsGsmPGSFzDYBKrzfuts9FBctIyguU5XVU52n66oxu7cHIZFAqeH6T68BTAiv0P8iJSVqQlm0s47jtOW5ZLvvASSBSBlnF4yQsDQxkObcSlr74o7p53dXObGAs76KFiNSQNeOLC5DUZuBzOi5YsVg5TibS/DahDxjMQzddYXvnSXNz5YBjUqDkuUw0lx8k6otImk4IATZgy779Tsv3XTkU6RHdXhuMNBumIoSzF5yYH1ot3SdYCLRg3aR6G0GGgkEmSYqKxnkoKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faHI/2UAiqaxino4+vygZ0Rt+VVKFzV3ngJveFJrRcw=;
 b=eb9+hnTS888/No56wsawHG5EISZP7ChWEjh9fitKLyQ2ohiA7DR9J94GCGN4testZYuuBa9B7TDNePvO5yLT4MX1T5/VYOQ4S1NxxqPe2cMk2D9vb/JxXeNqM8iMCTQep+Rny3i2MKTsA7osf6c0Dgnd9HqzDfPKY0lsjyjsLcKWD/mmLnHUBK8Synzs6j6Qp2kkls0bvzHkwj9u08XAqHJ/aeatp2R0co5IcnPOgKcpeXYw77vRsaMIBSlbqa6kUSzEh+MadQiOtULksRF998GNyHidk/3icu8ZZv411C8rifH9ZAwwuylFRzIihraZSfqLErXQ4cC40D5SrRzhAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faHI/2UAiqaxino4+vygZ0Rt+VVKFzV3ngJveFJrRcw=;
 b=jjiFYnNaAnOFDMUMx1QetY28nuX/djmhMA5qVK40ssz9Bz+m58cT3sy8YVZcvXBT00U5EKpRjOc96R3ZvgNvuMPKntUZbmxp0l2ZboUkuZ3vgWhU3zMhAKHzqcL6x30zpb7c4V1usyMkPBSMxXbHK+QqSXB08TrTxDR00XQWjBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB8809.namprd12.prod.outlook.com (2603:10b6:806:31f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 30 Jun
 2023 19:55:33 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 19:55:33 +0000
Message-ID: <9c10f6f2-b145-db5e-ebed-981222a72be7@amd.com>
Date:   Fri, 30 Jun 2023 14:55:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] HID: i2c-hid: Block a rogue device on ASUS TUF A16
Content-Language: en-US
To:     Friedrich Vock <friedrich.vock@gmx.de>,
        linux-input@vger.kernel.org,
        "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20230530154058.17594-1-friedrich.vock@gmx.de>
 <dc4da9cf-a66f-6e09-165d-f16a405f2a38@amd.com>
 <7b2ec797-2fdd-9707-7f53-d0a24ed036fc@gmx.de>
 <b067c9a1-cc07-2781-9a9d-71488ec3ddba@amd.com>
 <491ec8a8-efc7-7995-ac82-03a5431f66bd@amd.com>
 <0a9ba51e-0b07-cd9d-32fa-d99596c34183@gmx.de>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <0a9ba51e-0b07-cd9d-32fa-d99596c34183@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:805:de::49) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA3PR12MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: 950bd114-7a65-4413-324d-08db79a3f6dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CfgLjOovt7pMDwSKeURE7U2uyHaTS17/y5yfEye8t/r07Y7Qr4hgyfMYqingRu1q0QcgP99316jg9zOYY3GpEiSDgR3BX1Sa9sEsuL2+o/RwXQos/Tfy1BVf01W8miQ+RCaAHS2vWuK6yTG4xf6sDn93PRey40emRl4SekfxZwv6qzWu2cURR0wy2ui3AQhhSf/5unEj+o36tkwN6B+gmnbDSvSe2cP3x2seeaoobdI+4k2IlzSvdMqwZCm1o1z2DZcFvgiylVrmyhgoF1FXkcczsDgqjTqemOGnroRZLlctGjlmHZqVYll3vCTbBRvl06GrrhbwDOSkqddX2yfbw1rO83RtvJipNpa+6hKqLrk2H2WBkNawyTh85aXKA6GQBi5o0x+sQzDzXC9BxxWiWFzCT7l5LK4VMpq0T0tZ4x1iwhpufONmfzWP/B33h9MDZ94IwJzrDMgiYfjeu4jxklBP5eSq0Ka3vymRv5i+n1vV7XQqFSdiunl6sbpq7W69+1u58NJ+1KhFYtwlGjPp6BTuS0MROj1FFaq5BcZnAl8Ms3l+THl04RYI1EgHm1CXoM/BkA3qWgrTXmPhKao8AZkJNcqFfcX6cOyvc4bnbyoeU8dF2+1kaN7171o6UIHRZvBSsMnUcwFz3PPZXQpTIAh9vwmj3609Srxpv954czW8omn1ujtOC8KzWo/hj0PW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199021)(38100700002)(31686004)(31696002)(36756003)(86362001)(6486002)(41300700001)(966005)(8676002)(5660300002)(45080400002)(6506007)(6512007)(53546011)(26005)(478600001)(2616005)(186003)(83380400001)(2906002)(54906003)(4326008)(8936002)(316002)(66946007)(110136005)(6636002)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME9MUUhWOUhnaG8zemFPMU5rcTZqQ2p5cTl2VE1SWjl2b2N1V1FBOXJoaGlJ?=
 =?utf-8?B?ck0ralFoajFuWC9yeVJXK1c2YXJwMmtIQ2Q0OStHNndLdGR5NXA3UFltRjJE?=
 =?utf-8?B?K1VuWHlKMlRJSndxTUpibWw4eFFxblhHbWk0MGJhbFQrbENGL09zbHNCcnQ0?=
 =?utf-8?B?RHQ3eUhJcVF1ODJ4YWUva1lrcU1SdWtHTEMvMGQxQzkxdVVDVjA1Q0tqNStP?=
 =?utf-8?B?bVNHNGszeEpDeUI5UWM1bGthQW9nYVN4Tk10aUZ6WEVFUSt0Uzl2Smo4aWNw?=
 =?utf-8?B?K0RXcGhoWjBma2ZuZ2FsUHZzRXV6WFM5d3ljQU5MSEJTMzExOHdkQTl5MTNu?=
 =?utf-8?B?R3ErTjBMMkgrRndycGRDbEcwS2Y3RjF4MTV6OGJFdDhFMTFwakR6YWpyU1FJ?=
 =?utf-8?B?cWZ1Zi9KUGlFMHF0STdjbmllc3VVbzllL2tzLzVyMldjb1NkcEE5WXB6ekY3?=
 =?utf-8?B?TWpVL0d3c0ZXM1lGRDJPc0xnU3pMKy9XSE5Qa2dFcHhVcVI4VGhGNDI2cURO?=
 =?utf-8?B?UXNVTWFWOHlEeEx2ZEY1T09sbWVWNmNqUS9qc2xodUxVazAwSlE2ZDY1czVE?=
 =?utf-8?B?a0hGbUx0K2VaVkh0Q0dsZUNDb0JJay9aYzdXU2dZRndwdjlWcDFzV0J3cGRx?=
 =?utf-8?B?TXYwMlpkUnRmcGFPSG5HUFNRN2tac04xWDB0WmVKN0ZocTZJcjVIUUdVODdn?=
 =?utf-8?B?SkI2cDlBV0wzSFlyZHl5MzNIQ0V5djVWdDMrUTV6NFJzSy9MUzlGaEI4dHZK?=
 =?utf-8?B?am5PVkpHMkkvSmN0UUVnc2pFSFZKN3h2UW1VODFJMjhtZVM2clNWNVhpNElw?=
 =?utf-8?B?YjlOZ1RpcjZENUV5V1Z5U1RxZHp3QnJSaWVIMlRyZUhDL3dHZGY4VWJSbU92?=
 =?utf-8?B?QS9WVUFXNDZ5V1haUW1KbmM5aDMyWVJ0a25EK3hESnZpcVh1TE1CcVluazRY?=
 =?utf-8?B?VHp2VXAxbzdYZ1E1ZUdlTUtndkd2TWZZelNDSDB2KzhZMFo2VSt1NFgwdXA5?=
 =?utf-8?B?MEJ0WkY5OVVOd1hzWU1Bci8xajV1ZW5LbkI3NW5KQ3FCdUNxS3lLSkpUQ2lB?=
 =?utf-8?B?N1BsQmtiRXVJRXhSbnNBOFp1elE4K2R6a0RWZ2JJUVl2MWJXaEQzYWVKZFpR?=
 =?utf-8?B?VFZ5cFowNDZlTmROYnNHTms1VWVoTG9EQUFkbVkrTE4zY0NaZzVldk8vTXBz?=
 =?utf-8?B?OXlJcGcvem4rY2tuOTR4UnQ1LytwYVBGTGk0MUlJeUpZd2tBbS8xZnczSGdr?=
 =?utf-8?B?dDhHdWxwUVZlaStHd2x3YXB1ekxJQ2FUTFhkSWxJRE5PUlVCem55WTJvUHJE?=
 =?utf-8?B?OWFjRWNyaEp0T2NXbmdzdUJyNUtVYmdHN2d2WUwxYTVPalJGUnI2UG84OEF4?=
 =?utf-8?B?YVVnUCsxSndWWU9mNkhSRk5lMjl3TEZsSUt3S2FjRE5pMHZhVmF2bVhqZkdG?=
 =?utf-8?B?Mm0wdHhjRVZsRy9TZEk1bXFHSzdoeWJTUWhnOTcrdVpOOTJ1eFVPa1p5YXlB?=
 =?utf-8?B?MGVObkNQR3VDSSsrRysrSWRKVGZ0bUNSdTA5Ym1jcEcxRGFRK1c0T3pscVVP?=
 =?utf-8?B?QnBCTFo4UnNnU2xIOHU1YmwrZmNOR1hDVHRDa2ZMNVQ3dmtlUGFZRXlkRDRj?=
 =?utf-8?B?ajNHMnhJY2ZKNjdCSFdjckcydGQzdTRJVFdIbUlSMFNlYjIzNUJWSVVONkts?=
 =?utf-8?B?R1NIaDRWRmxIZ2hyQVQyanhjTXhSa3ViSzhERXNxSy85eGhKeXhZMjQzQmJj?=
 =?utf-8?B?Y1A4Z2hxVjBsMzZ3S1E2MDhhTEsrSXNnalFpZlpvUnB1SEFMMGczUXk1YktD?=
 =?utf-8?B?RjM3YzVDem1yNlk4K3lKWXB3UWxVQ1NTcG5YbUpEY0RUS0lhM3AzeVRNNWM5?=
 =?utf-8?B?eTRYYVJ0b3hNK2FRS2ZsNk1CSFluKzdFTWRKRG5FbHJJdmsxU3RESjVrdCsy?=
 =?utf-8?B?Z3RrY3E2dmlkMXJPMVhkNDhBYzAzVnVKakYwME1MK2tMNERxRkd6bnlQTGlD?=
 =?utf-8?B?LzRBWk81YjhDRzBQT3ZObVo1cm9Od01CK0pWSERCdWNMT0hVMVU1TzRtY1dW?=
 =?utf-8?B?bFc5ejc1amlTOGxGS1VOakw5TXRoaVpjNnJZQTNMc3ZyTUtGbXgxTmFvb1l1?=
 =?utf-8?Q?GK2ylzMGXr4jjU3vJs5JrR5Eh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950bd114-7a65-4413-324d-08db79a3f6dd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 19:55:33.3650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46Ss/UBKKiHEeyw9JIG43BYG4A2EacIl1dlAJk8oXucjTN1Tr2HFjMXoJ1Utk0fIh2g4X5/W7GxRNpBgUeTHrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8809
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

On 6/27/2023 09:38, Friedrich Vock wrote:
> Hi,
> 
> On 26.06.23 17:10, Limonciello, Mario wrote:
>>
>> On 6/18/2023 10:05 PM, Mario Limonciello wrote:
>>> On 6/15/23 07:41, Friedrich Vock wrote:
>>>> Hi,
>>>>
>>>> sorry for taking so long to reply.
>>>>
>>>> On 02.06.23 20:43, Limonciello, Mario wrote:
>>>>> + some AMD guys
>>>>>
>>>>> On 5/30/2023 10:40 AM, Friedrich Vock wrote:
>>>>>> On these laptops, there seems to be a device that, when probed by
>>>>>> i2c-hid, constantly sends bogus interrupts and interferes with the
>>>>>> keyboard controller. When the device is enabled, it takes the
>>>>>> keyboard
>>>>>> around 8 seconds to register that keys are being pressed or released.
>>>>>
>>>>> Do you know what interrupt is firing constantly?
>>>>> Presumably it is the GPIO controller master interrupt, right?
>>>>> And it's for GPIO 7 (guessed from acpidump on one of the bug
>>>>> reports).
>>>>>
>>>>> To confirm check /proc/interrupts.
>>>> Seems likely that you guessed correctly. The corresponsing line in
>>>> /proc/interrupts (with the interrupts counts omitted):
>>>> 71:   amd_gpio    7  ITE5570:00
>>>
>>> OK.
>> I had asked in the past for R/W everything output to compare to
>> /sys/kernel/debug/gpio.
>>
>> I've added more explicit instructions how to get this to
>> the kernel bugzilla 217336 – keyboard not working Asus TUF FA617NS
>> (kernel.org) <https://bugzilla.kernel.org/show_bug.cgi?id=217336#c126>
> Thanks for this. R/W everything didn't work for the other people with
> the same models, so I spent this day getting Windows and R/W everything
> running myself. I managed to make it run and left a comment with the
> results in that bugzilla report.
>>>
>>>>>
>>>>> If it's not obvious which GPIO is firing there is also a dynamic
>>>>> debug statement in pinctrl-amd.c that may be helpful to figure
>>>>> this out.
>>>>>
>>>>> I would also suspect in Windows this doesn't happen.  If possible
>>>>> can you confirm that? Check in Device Manager what driver is bound
>>>>> to this device. Is it "inbox" from Microsoft or is it an ASUS
>>>>> specific driver?
>>>>>
>>>>> I wonder if the GPIO controller got programmed differently in
>>>>> Windows for some reason. We may want to confirm the values for
>>>>> GPIO registers from /sys/kernel/debug/gpio in Linux against those
>>>>> that are programmed in Windows.
>>>>>
>>>>> This can be accomplished using R/W everything in Windows.
>>>>
>>>> Unfortunately I don't have Windows installed on this system. I know
>>>> some
>>>> people with the Ryzen 9 7940HS model which might, I'll ask them if they
>>>> can give me the configuration on Windows and Linux.
>>>
>>> OK, I suggest directing everyone over to the bugs I linked and we
>>> should gather the relevant GPIO controller register dumps from
>>> Windows and Linux on the same hardware there.
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Nothing I tried seemed to make the device work, and preventing the
>>>>>> device from being probed doesn't seem to break any functionality of
>>>>>> the laptop.
>>>>>>
>>>>>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>>>>>
>>>>> There are a few bug reports that popped up around this issue that
>>>>> should
>>>>> probably also be tagged.
>>>>>
>>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217336
>>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217493
>>>>>
>>>>>> ---
>>>>>>   drivers/hid/i2c-hid/i2c-hid-core.c       |  5 +++
>>>>>>   drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c | 48
>>>>>> ++++++++++++++++++++++++
>>>>>>   drivers/hid/i2c-hid/i2c-hid.h            |  3 ++
>>>>>>   3 files changed, 56 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>>> b/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>>> index efbba0465eef..5f0686d058df 100644
>>>>>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>>>>>> @@ -1035,6 +1035,11 @@ int i2c_hid_core_probe(struct i2c_client
>>>>>> *client, struct i2chid_ops *ops,
>>>>>>
>>>>>>       ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
>>>>>>
>>>>>> +    if (i2c_hid_device_blocked(hid->vendor, hid->product)) {
>>>>>> +        ret = -ENODEV;
>>>>>> +        goto err_irq;
>>>>>> +    }
>>>>>> +
>>>>> The thing I worry about here is that an unserviced interrupt can
>>>>> prevent the
>>>>> hardware from going into proper low power states; particularly at
>>>>> runtime.
>>>>>
>>>>> I think we should better understand what's going on before going down
>>>>> this
>>>>> path of just ignoring it.
>>>> Yeah, I guess I should've searched more for a proper explanation/fix
>>>> before submitting hacks like this. Let's see if this can be fixed in a
>>>> cleaner manner than preemptively disabling parts of the system.
>>>
>>> Can you please have a try with linux-next or apply this series:
>>> https://lore.kernel.org/linux-gpio/20230421120625.3366-1-mario.limonciello@amd.com/
>>>
>>>
>>> That does change some of the configuration for the GPIO controller
>>> registers to align how windows is handling debouncing.
>>>
>>> I don't think it will change the outcome of your bug, but I'd love
>>> to be surprised.
>> Any updates for this?
> Tried this out today. You won't be surprised, it didn't change anything.
>>>
>>>>>>       ret = hid_add_device(hid);
>>>>>>       if (ret) {
>>>>>>           if (ret != -ENODEV)
>>>>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>>>>> b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>>>>> index 210f17c3a0be..d2c2806b64b4 100644
>>>>>> --- a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>>>>> +++ b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>>>>> @@ -440,6 +440,38 @@ static const struct dmi_system_id
>>>>>> i2c_hid_dmi_quirk_table[] = {
>>>>>>       { }    /* Terminate list */
>>>>>>   };
>>>>>>
>>>>>> +static const struct hid_device_id i2c_hid_blocked_ite_device = {
>>>>>> +    HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC, USB_VENDOR_ID_ITE,
>>>>>> 0x8051)
>>>>>> +};
>>>>>> +
>>>>>> +/*
>>>>>> + * This list contains devices that can't be activated at all, for
>>>>>> example
>>>>>> + * because activating them breaks other important parts of the
>>>>>> system.
>>>>>> + */
>>>>>> +static const struct dmi_system_id i2c_hid_dmi_block_table[] = {
>>>>>> +    /*
>>>>>> +     * On ASUS TUF Gaming A16 laptops, there is a device that will
>>>>>> make the
>>>>>> +     * keyboard controller stop working correctly and flood the CPU
>>>>>> with bogus
>>>>>> +     * interrupts.
>>>>>> +     */
>>>>>> +    {
>>>>>> +        .ident = "ASUS TUF Gaming A16 (Ryzen 7 7735HS)",
>>>>>> +        .matches = {
>>>>>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER
>>>>>> INC."),
>>>>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "FA617NS"),
>>>>>> +        },
>>>>>> +        .driver_data = (void *)&i2c_hid_blocked_ite_device,
>>>>>> +    },
>>>>>> +    {
>>>>>> +        .ident = "ASUS TUF Gaming A16 (Ryzen 9 7940HS)",
>>>>>> +        .matches = {
>>>>>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER
>>>>>> INC."),
>>>>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "FA617XS"),
>>>>>> +        },
>>>>>> +        .driver_data = (void *)&i2c_hid_blocked_ite_device,
>>>>>> +    },
>>>>>> +    { }    /* Terminate list */
>>>>> If this *does* end up being the best solution, I think it's better
>>>>> to patch in the DMI to gpiolib-acpi.c similar to other quirks for
>>>>> floating
>>>>> GPIOs.  Example:
>>>>>
>>>>> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L1654
>>>>>
>>>>>
>>>>>
>>>>>> +};
>>>>>>
>>>>>>   struct i2c_hid_desc *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t
>>>>>> *i2c_name)
>>>>>>   {
>>>>>> @@ -492,3 +524,19 @@ u32 i2c_hid_get_dmi_quirks(const u16 vendor,
>>>>>> const u16 product)
>>>>>>
>>>>>>       return quirks;
>>>>>>   }
>>>>>> +
>>>>>> +bool i2c_hid_device_blocked(const u16 vendor, const u16 product)
>>>>>> +{
>>>>>> +    const struct dmi_system_id *system_id =
>>>>>> +            dmi_first_match(i2c_hid_dmi_block_table);
>>>>>> +
>>>>>> +    if (system_id) {
>>>>>> +        const struct hid_device_id *device_id =
>>>>>> +                (struct hid_device_id *)(system_id->driver_data);
>>>>>> +
>>>>>> +        if (device_id && device_id->vendor == vendor &&
>>>>>> +            device_id->product == product)
>>>>>> +            return true;
>>>>>> +    }
>>>>>> +    return false;
>>>>>> +}
>>>>>> diff --git a/drivers/hid/i2c-hid/i2c-hid.h
>>>>>> b/drivers/hid/i2c-hid/i2c-hid.h
>>>>>> index 2c7b66d5caa0..e17bdd758f39 100644
>>>>>> --- a/drivers/hid/i2c-hid/i2c-hid.h
>>>>>> +++ b/drivers/hid/i2c-hid/i2c-hid.h
>>>>>> @@ -10,6 +10,7 @@ struct i2c_hid_desc
>>>>>> *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name);
>>>>>>   char *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
>>>>>>                              unsigned int *size);
>>>>>>   u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u16 product);
>>>>>> +bool i2c_hid_device_blocked(const u16 vendor, const u16 product);
>>>>>>   #else
>>>>>>   static inline struct i2c_hid_desc
>>>>>> *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name)
>>>>>> @@ -19,6 +20,8 @@ static inline char
>>>>>> *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
>>>>>>   { return NULL; }
>>>>>>   static inline u32 i2c_hid_get_dmi_quirks(const u16 vendor, const
>>>>>> u16 product)
>>>>>>   { return 0; }
>>>>>> +static inline bool i2c_hid_device_blocked(const u16 vendor, const
>>>>>> u16 product)
>>>>>> +{ return false; }
>>>>>>   #endif
>>>>>>
>>>>>>   /**
>>>>>> -- 
>>>>>> 2.40.1
>>>>>>
>>>>>>
>>>
> Thanks,
> Friedrich

Friderich and some people on CC are already aware of this, but mostly 
for Benjamin and Jiri I wanted to let you know that the additional 
register fetching comparing Windows and Linux allowed me to come up with 
a proper root cause.

This series has been sent out to fix the issue properly.

https://lore.kernel.org/linux-gpio/20230630194716.6497-1-mario.limonciello@amd.com/
