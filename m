Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCCA73E2E7
	for <lists+linux-input@lfdr.de>; Mon, 26 Jun 2023 17:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjFZPLc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Jun 2023 11:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbjFZPLN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Jun 2023 11:11:13 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2042D10F6
        for <linux-input@vger.kernel.org>; Mon, 26 Jun 2023 08:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y++DKBXxPkHFpeuC7+5lavJqMy0AbS0yA37E+RVxg9xbMxRY7ZfwlwkMVnFyB9VPSZc4NZsh6X4Wb1KH70a7Rhj56K2MdvGk5Vk5QCBEL2u8zSePgXdkmD5/FyjMHzQ0dbudc3okKdJUhuXE/5+IryL9QOK1BJ9vJ0M3rPQxquHVO6u0mjWjlkqF6uXCS7ql9xZjf7y5Uj4O67Or1E5gZYf1GjC4fr/RYLdT/K16gmDLT8f2xdMcOqoZw/f4tm8fcB+QwBNFG9JKoKnYVRTin0pD4c7G4N9+T60SCx4lsqTuxqe+XMsTSKhg5PnBrPEG+KhycEcPKcdPPuEO6ptRIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSMovu2J/uk1UuawJnrCPCNGomoMb+cWoedooWxl5DQ=;
 b=ROoI4+kGxg7kM4QNrtKIouj93F+mcQGDOyjhR5aw68Fztj/gOaqsOMXIrBbHQc89ew4GQJDjrjmRum0lggrEPlDWgH9l54J52Gosi+ZC1WUcSyyqOb9M1oJ3vNWqP1757iMcgrY3sUQM4VHUrtIJmfDxXW7DnLO4DTneLeBv+pPrlVYCXl16tqD3DiegsTP4zC/MNFu1q88fOooGzVF+2cg24zpFQK2lqlPik+IhDkJ+o7XtJAVcWWvk1scu9gsMDN8+UjfDGNKbl0GvsnQqSUVHNiVb108MTZRTtIR3NaRUDpzQ96sKVO/ZRe/AlvBAl9obL0Wx4IlWDgIfP9sSCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSMovu2J/uk1UuawJnrCPCNGomoMb+cWoedooWxl5DQ=;
 b=1C2tDkpt9tMub48uXO4A431HhllVgdVM44cTnzElZ+q4dJvPKGRZILUFsvxjp/syKYPDBl7f9Vi8PCBrODdG9FP0wjXgJsAQeqUjYuYxwElxvZ8YgLi7dgMBEfFwwLhFPkF2IioelKLYXv/9wQgOpGxo0CIsuDW96qAELW7TdjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CYYPR12MB8989.namprd12.prod.outlook.com (2603:10b6:930:c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 15:10:54 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 15:10:54 +0000
Message-ID: <491ec8a8-efc7-7995-ac82-03a5431f66bd@amd.com>
Date:   Mon, 26 Jun 2023 10:10:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] HID: i2c-hid: Block a rogue device on ASUS TUF A16
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
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
Content-Language: en-US
In-Reply-To: <b067c9a1-cc07-2781-9a9d-71488ec3ddba@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:5:3af::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CYYPR12MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: a29a5756-c83d-4f1e-e7d8-08db7657894a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dFkKJWKTVR4vDxzNhBauli3yXuY3Y9tNf2d1cqWgSGVnhoMe8+sAeSM2v6e10mV39LxqRkbnhbE4h1nwC9xJx4sParbmOW848GiSeDreISpXtFvPI+7K5HPARcv11KhnfKpijot+MNrtjOyORwkUpe5wd5oqPheFb62Ag6b8pFv7pnhOq3slVh0+iAvFSfpdbnVAP4q8QfNUp3QLEEHnbbTcy68U5X+kCH6Qr7DzytF4/mGep7ZMdHPZv/oNwr0clv9xwecA1OKV7iE9G0aqTGXO0lsnr5Yobj/MVbWkbRaaPX3TnQL6dDW6NCgEL0/cJT9apa8F8lL69PlaIwx2xq4Kpa5UaXiIFg8BPrQ4JgFn/iqOjm159C5IHVPnUNuYwu/DjJesmvHsXC3+kBYS/flacDwV28M35AAx+d4zg3CgQjMBBJdjPbUq8fICR1WDHVqq2B5JcRYzUYLByi2cNm8ft6Y0BU1SKix6AwoAlp2Jho//B7/YPfdU4MZPKwcuS7V4Aq3mmJyXye7lp4EvFRORM6BsPC0Jn/uFAWkknmVcWMj4ZSalDN0PoUC/wdJ+2/VGxDa+ChTObP7uHnPKOoR+PrbjyVXwTvGr94HF4tVhjnStKGG/yG6CVGg6DAfYlPgtRFGdV+dp/IDHtjeJ37M2QQRxqoQZ7bLlfI+b48frP/XDr51tAq7IuCXUltO/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(6486002)(966005)(6512007)(478600001)(45080400002)(2616005)(54906003)(110136005)(83380400001)(53546011)(26005)(6506007)(2906002)(186003)(5660300002)(36756003)(38100700002)(6636002)(66946007)(4326008)(31696002)(8936002)(8676002)(41300700001)(316002)(86362001)(66476007)(66556008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm9PdFd5ZHd0b0JKdytQc0UxbjVWdVhEWTZ0U2FydlBIMnh5K2ZvR3liT1lR?=
 =?utf-8?B?dXY5bExtWWpGcXR5Y0t4S1g0YjFmdmxuKzk0UGhkWWNXaUFlQmlNNGtwV1kz?=
 =?utf-8?B?RGNkTTBaTzZpdU5TbkRnZkNTc29YMjFtbW9aUWxxSGhsM0JvakY4LzZXRGRI?=
 =?utf-8?B?ZVZGeDhDamtmSnJDdUZYemk2ekZoVi94U1BDbHh0cnZIajFsd2t5V3YxR084?=
 =?utf-8?B?OG1ra0duSW8vd0JsUlZYZThTWTE4N21sY2FHenk5bjFsNEwwRXZvUFdncWxQ?=
 =?utf-8?B?eVVOYWJycjFoMXVYc0RCUXJheHZCekcwc2o1R2hPT3A2aVBXc0ZURytFVHhk?=
 =?utf-8?B?MFhsaFZWeGVFYUZ0ZzhDSktmOTRTQ0NibzA5bSsraXpWeW0zQ1hmUmRVWXY4?=
 =?utf-8?B?bXgzUXN4NGQzN095U01oKzViMVpiTzNpdGoveDVHL3dvY250bk1xeVRFeEVH?=
 =?utf-8?B?ZUkyQXJvRVBNMTRkM0pQNUhTT0pxK3dTZSszanRJNFFnNStyandGdFVTWFc2?=
 =?utf-8?B?cGpFVXc1eTg5N0p3WkZEbTM4T3dzbDAvc2VrVmo5Wll2cUFYTEh6cFV2NEw5?=
 =?utf-8?B?TVNtWk05eEtPNnhBdzR5b001N21BSTZOeXlNVWp2M1ZDSFAwUXF0TUliYUZa?=
 =?utf-8?B?OGRGL1hlQlQzT2hxQmFKclFqc2U3S0JVM1hTMmZQMGpTQTk0QkNrNUp3c1Vv?=
 =?utf-8?B?Z2prMHVMQXc5MUlNRGlZc0N6YW5OeE9ScENGUmR1UmdwTjJxVXFGaW5hZzhN?=
 =?utf-8?B?dUpuSG5FSXVsMWRtUm5mQUhBZUlrWXMwc3ZtbGhYYjMvT0lMcDExZEFjMGQw?=
 =?utf-8?B?MnhQcnY4SkUrcTZqQmRhYmRRdDNTTno1dUhMUFMzeEd1VG9wMitTK0NsVDFM?=
 =?utf-8?B?dFZ6Zm9DcitML0NSVzNpcXplZDFrNGVmdHErMnNCa1d2a2RVbGkrZjB2dWJU?=
 =?utf-8?B?RkZrcXdRWlVsSDVHTDJWeE9iOVErdkhrT3NqQkltZTk2TkJQaGZLTFI3RUJD?=
 =?utf-8?B?SXEwd3JZMFk3Z3B6eldyNElqYzN1OXFzY21Bcks0TWgvQUR3bjBWdmlqRG95?=
 =?utf-8?B?TFJFWFdKTUVETXk3ZnA1RUFtbWlRTnhoOHFGZFBpOCtqaFJPU2ZlQzBmUFcw?=
 =?utf-8?B?T2lzVHNwRWJ1QUR3SE5sbm9ieEdqclMvbmJUVHJvaXdHQXNZWHpNc2dLRVlu?=
 =?utf-8?B?RTJZMWpQMHV4SHBENHczeVhjYjZSMDhHMFdJQ01mVlFyeEZrdnpRMk5sdU1N?=
 =?utf-8?B?dFQxV29odjlEV2JoVXBRcDR3U29XQVczSEFtZ2g2eW1qbWR1Q01FdmpRb3c4?=
 =?utf-8?B?N2t2RThhRVBUSThLR3ltbDhkTk16bTdxMytGQXJrWkk5YmlMb28rNkFjdExI?=
 =?utf-8?B?djhqTjZ2akNGUHBMRG8wd2U1eURLQWZqZFZqSWF2a1pmUUdveXhaRjBGS3hi?=
 =?utf-8?B?anFMTUtiSDdzdU5Ic3FBVUZnZC9ibHNOZnovU2xMQ3hIREVsejZCOUF0RCtj?=
 =?utf-8?B?bEFJenMrV2pxOE05ejhUU2lFYlQreG9wemxmVGpUdnJ6Z2VLV0lKK0d6TFQy?=
 =?utf-8?B?WS8yc2JQQWtkMmhMaEtoc0tDd1dFdU1iYWkzbWtjQkZvOFlwVG9JYTF1QWZa?=
 =?utf-8?B?T0JzcEtQZzB0VXo0cjJuM3lpbFc1TDV4S2R6dGdoRDlpUDk2RUhsQXAxRUV4?=
 =?utf-8?B?bUd6ZEFCS2tGY2pSR3lzYWdMajM1REExT0F2TUgxcCtYUS9FMlpiblgrRGhq?=
 =?utf-8?B?Rk43djRaWkYvYSt3NDQzMUc1allFamc2NG5FOUpUK1BMcXd5TG1ISWRseXVk?=
 =?utf-8?B?K2RtU21SMVhKMnBlQ2FOZkNVaW82U3ZlQ0VEWE5iWklnbzJEcERrZ2xHVUMv?=
 =?utf-8?B?R1BSRGJoZ1RMMG5VeGwxbU1QSUlGTHV0MSs4RkEyUzZUNllqcFZtai9DdU4x?=
 =?utf-8?B?ODdRbXZoSTNSVCtDOGxINHhpeFI2eklvNG01R2tjazV5N0RSTVpjbmY5VW9j?=
 =?utf-8?B?VnVxcjh4SWtHUENMTy9FdUZiWHZ1SkZ1anpVRUJVQVV4bGVqRE1RNFkxaVJ0?=
 =?utf-8?B?NzBJVU41WnB4cExKY1lLMnVyN09ETkpuVGxJUWIrWnlkczR5Qkt6QTJFc2hS?=
 =?utf-8?Q?/sUlsI6FQXlI7JR5ox5fEIraP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a29a5756-c83d-4f1e-e7d8-08db7657894a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 15:10:54.3241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7h8biGANVEIkYUq2KaGCXExdMKN05zDX53nLDETcS5IsqPdngV0B/10a8PZIix83bMnBHpuWhJGij0rq1lumlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8989
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 6/18/2023 10:05 PM, Mario Limonciello wrote:
> On 6/15/23 07:41, Friedrich Vock wrote:
>> Hi,
>>
>> sorry for taking so long to reply.
>>
>> On 02.06.23 20:43, Limonciello, Mario wrote:
>>> + some AMD guys
>>>
>>> On 5/30/2023 10:40 AM, Friedrich Vock wrote:
>>>> On these laptops, there seems to be a device that, when probed by
>>>> i2c-hid, constantly sends bogus interrupts and interferes with the
>>>> keyboard controller. When the device is enabled, it takes the keyboard
>>>> around 8 seconds to register that keys are being pressed or released.
>>>
>>> Do you know what interrupt is firing constantly?
>>> Presumably it is the GPIO controller master interrupt, right?
>>> And it's for GPIO 7 (guessed from acpidump on one of the bug
>>> reports).
>>>
>>> To confirm check /proc/interrupts.
>> Seems likely that you guessed correctly. The corresponsing line in
>> /proc/interrupts (with the interrupts counts omitted):
>> 71:   amd_gpio    7  ITE5570:00
>
> OK.
I had asked in the past for R/W everything output to compare to 
/sys/kernel/debug/gpio.

I've added more explicit instructions how to get this to
the kernel bugzilla 217336 – keyboard not working Asus TUF FA617NS 
(kernel.org) <https://bugzilla.kernel.org/show_bug.cgi?id=217336#c126>

>
>>>
>>> If it's not obvious which GPIO is firing there is also a dynamic
>>> debug statement in pinctrl-amd.c that may be helpful to figure
>>> this out.
>>>
>>> I would also suspect in Windows this doesn't happen.  If possible
>>> can you confirm that? Check in Device Manager what driver is bound
>>> to this device. Is it "inbox" from Microsoft or is it an ASUS
>>> specific driver?
>>>
>>> I wonder if the GPIO controller got programmed differently in
>>> Windows for some reason. We may want to confirm the values for
>>> GPIO registers from /sys/kernel/debug/gpio in Linux against those
>>> that are programmed in Windows.
>>>
>>> This can be accomplished using R/W everything in Windows.
>>
>> Unfortunately I don't have Windows installed on this system. I know some
>> people with the Ryzen 9 7940HS model which might, I'll ask them if they
>> can give me the configuration on Windows and Linux.
>
> OK, I suggest directing everyone over to the bugs I linked and we 
> should gather the relevant GPIO controller register dumps from Windows 
> and Linux on the same hardware there.
>
>>
>>>
>>>>
>>>> Nothing I tried seemed to make the device work, and preventing the
>>>> device from being probed doesn't seem to break any functionality of
>>>> the laptop.
>>>>
>>>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>>>
>>> There are a few bug reports that popped up around this issue that 
>>> should
>>> probably also be tagged.
>>>
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217336
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217493
>>>
>>>> ---
>>>>   drivers/hid/i2c-hid/i2c-hid-core.c       |  5 +++
>>>>   drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c | 48 
>>>> ++++++++++++++++++++++++
>>>>   drivers/hid/i2c-hid/i2c-hid.h            |  3 ++
>>>>   3 files changed, 56 insertions(+)
>>>>
>>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c
>>>> b/drivers/hid/i2c-hid/i2c-hid-core.c
>>>> index efbba0465eef..5f0686d058df 100644
>>>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>>>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>>>> @@ -1035,6 +1035,11 @@ int i2c_hid_core_probe(struct i2c_client
>>>> *client, struct i2chid_ops *ops,
>>>>
>>>>       ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
>>>>
>>>> +    if (i2c_hid_device_blocked(hid->vendor, hid->product)) {
>>>> +        ret = -ENODEV;
>>>> +        goto err_irq;
>>>> +    }
>>>> +
>>> The thing I worry about here is that an unserviced interrupt can
>>> prevent the
>>> hardware from going into proper low power states; particularly at
>>> runtime.
>>>
>>> I think we should better understand what's going on before going down
>>> this
>>> path of just ignoring it.
>> Yeah, I guess I should've searched more for a proper explanation/fix
>> before submitting hacks like this. Let's see if this can be fixed in a
>> cleaner manner than preemptively disabling parts of the system.
>
> Can you please have a try with linux-next or apply this series:
> https://lore.kernel.org/linux-gpio/20230421120625.3366-1-mario.limonciello@amd.com/ 
>
>
> That does change some of the configuration for the GPIO controller 
> registers to align how windows is handling debouncing.
>
> I don't think it will change the outcome of your bug, but I'd love
> to be surprised.
Any updates for this?
>
>>>>       ret = hid_add_device(hid);
>>>>       if (ret) {
>>>>           if (ret != -ENODEV)
>>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>>> b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>>> index 210f17c3a0be..d2c2806b64b4 100644
>>>> --- a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>>> +++ b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>>> @@ -440,6 +440,38 @@ static const struct dmi_system_id
>>>> i2c_hid_dmi_quirk_table[] = {
>>>>       { }    /* Terminate list */
>>>>   };
>>>>
>>>> +static const struct hid_device_id i2c_hid_blocked_ite_device = {
>>>> +    HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC, USB_VENDOR_ID_ITE, 0x8051)
>>>> +};
>>>> +
>>>> +/*
>>>> + * This list contains devices that can't be activated at all, for
>>>> example
>>>> + * because activating them breaks other important parts of the 
>>>> system.
>>>> + */
>>>> +static const struct dmi_system_id i2c_hid_dmi_block_table[] = {
>>>> +    /*
>>>> +     * On ASUS TUF Gaming A16 laptops, there is a device that will
>>>> make the
>>>> +     * keyboard controller stop working correctly and flood the CPU
>>>> with bogus
>>>> +     * interrupts.
>>>> +     */
>>>> +    {
>>>> +        .ident = "ASUS TUF Gaming A16 (Ryzen 7 7735HS)",
>>>> +        .matches = {
>>>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "FA617NS"),
>>>> +        },
>>>> +        .driver_data = (void *)&i2c_hid_blocked_ite_device,
>>>> +    },
>>>> +    {
>>>> +        .ident = "ASUS TUF Gaming A16 (Ryzen 9 7940HS)",
>>>> +        .matches = {
>>>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "FA617XS"),
>>>> +        },
>>>> +        .driver_data = (void *)&i2c_hid_blocked_ite_device,
>>>> +    },
>>>> +    { }    /* Terminate list */
>>> If this *does* end up being the best solution, I think it's better
>>> to patch in the DMI to gpiolib-acpi.c similar to other quirks for
>>> floating
>>> GPIOs.  Example:
>>>
>>> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L1654 
>>>
>>>
>>>
>>>> +};
>>>>
>>>>   struct i2c_hid_desc *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t
>>>> *i2c_name)
>>>>   {
>>>> @@ -492,3 +524,19 @@ u32 i2c_hid_get_dmi_quirks(const u16 vendor,
>>>> const u16 product)
>>>>
>>>>       return quirks;
>>>>   }
>>>> +
>>>> +bool i2c_hid_device_blocked(const u16 vendor, const u16 product)
>>>> +{
>>>> +    const struct dmi_system_id *system_id =
>>>> +            dmi_first_match(i2c_hid_dmi_block_table);
>>>> +
>>>> +    if (system_id) {
>>>> +        const struct hid_device_id *device_id =
>>>> +                (struct hid_device_id *)(system_id->driver_data);
>>>> +
>>>> +        if (device_id && device_id->vendor == vendor &&
>>>> +            device_id->product == product)
>>>> +            return true;
>>>> +    }
>>>> +    return false;
>>>> +}
>>>> diff --git a/drivers/hid/i2c-hid/i2c-hid.h
>>>> b/drivers/hid/i2c-hid/i2c-hid.h
>>>> index 2c7b66d5caa0..e17bdd758f39 100644
>>>> --- a/drivers/hid/i2c-hid/i2c-hid.h
>>>> +++ b/drivers/hid/i2c-hid/i2c-hid.h
>>>> @@ -10,6 +10,7 @@ struct i2c_hid_desc
>>>> *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name);
>>>>   char *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
>>>>                              unsigned int *size);
>>>>   u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u16 product);
>>>> +bool i2c_hid_device_blocked(const u16 vendor, const u16 product);
>>>>   #else
>>>>   static inline struct i2c_hid_desc
>>>>              *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name)
>>>> @@ -19,6 +20,8 @@ static inline char
>>>> *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
>>>>   { return NULL; }
>>>>   static inline u32 i2c_hid_get_dmi_quirks(const u16 vendor, const
>>>> u16 product)
>>>>   { return 0; }
>>>> +static inline bool i2c_hid_device_blocked(const u16 vendor, const
>>>> u16 product)
>>>> +{ return false; }
>>>>   #endif
>>>>
>>>>   /**
>>>> -- 
>>>> 2.40.1
>>>>
>>>>
>
