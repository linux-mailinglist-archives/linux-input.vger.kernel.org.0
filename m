Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34BA7734A71
	for <lists+linux-input@lfdr.de>; Mon, 19 Jun 2023 05:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjFSDF0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Jun 2023 23:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjFSDFW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Jun 2023 23:05:22 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92F3E51
        for <linux-input@vger.kernel.org>; Sun, 18 Jun 2023 20:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ufa33mcvijf2V0JUGZNQga9I/hpbJbs7bnjDElIWBtx1YFXUJCqrUWzPOFviQR1qkBJaaOTiNikGnA3YCQNw3YZNmPsGddrSIWL2R9qAkanoE8DwaDjcWt3g2cklv7JlfH/rUGEJZUuic6vXP56ZkRW2j/U15vXPMXvdZ644XN/hcbEDJ+Z4/MsG06+2/7h6xZ+OeP5M8YkZpBJbSzEERsaJbRo/v2X4R+ZnRx0nRQTQR72BDXPBrDnI3IRHFqsQmRCHQDc0V3Qr6DhNB1aX2lN/u9KEhXpKB3qttPSZHSFjD9h9SWertDewOB7tvMgoQb3492z52ORHNsI94CqzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kixn19DywA17JClcwX7vZrEhnJcrCbSlnWIoQyCwYPk=;
 b=IbEH7rfVQCP2mjc+5+dyPJXJoNyFSn+UY/o+eV7AzXlXEL0t4wxUFkK+gvRqFjgxPLM/zTXpYJXA7KBtnMv+ywIUlcnFZX9/k0q9wQpdcGdk0JeyuO39EVJwm/zp6vyVrvmJrYj4k6YIbQBOTmecRXYryp+BLRpZl4sEGHR+n1z+5AIFcfeONaq2sp4JKWn3ThR64pTw/lZmVcEGqMtQd67saiALDssoTFPH4H0K6jpZUQLZdX83gwsirZ8TvLPjqMRG6eeO1R7ctEhwCV8ZmZDjzhb9sN+02e71867jZMvtIm2vC3xAUNZxvMKI9fltHEKplY24SVyr5mKnvUx8Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kixn19DywA17JClcwX7vZrEhnJcrCbSlnWIoQyCwYPk=;
 b=S1kBa+xrmTmVgipYYdUVq6Sv87OzlDBSVfID5BcXe7sO/zdjd+5R1KQQnjJf/7iG7AK/54l+TKpP7p5WeRsAylhMza+4QYWs01acy2xgKpM4oFvqvLr50kvJKu846WgvrHdyzHmBrDBu9ozHkO+5i50MiRlWAWgwTpNyM62z3CY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6298.namprd12.prod.outlook.com (2603:10b6:930:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 03:05:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 03:05:17 +0000
Message-ID: <b067c9a1-cc07-2781-9a9d-71488ec3ddba@amd.com>
Date:   Sun, 18 Jun 2023 22:05:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
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
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <7b2ec797-2fdd-9707-7f53-d0a24ed036fc@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b2d93b-7e5a-41bf-38b5-08db70720234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBN+5Auw8NleJJt6Ix3HymaN3qw0GfTzf0tN1zy57mSKAYFHeeEzTsn3zeCnj3VGsruzhssvBK5LdgGmQ9CWzzqbxDHZgfezm1L/QHp+20efCubP5JlirqAxJk8bkZPc2VZlvKOQc2Jx3M6EeMeomycMdERNrffOTilm17Ky64pnCQBg3+8dDYRyEyKViAMDLGunW5GtLXth7H/YTfV+ru030TSIhzagQec+WqFdL8ROfScJg3BZbeJYfbDIjUeTR+eB/ViziFcNi8Vgjmw4kwZ2LC7xF2MgjinM00qgzRhG58kWBpNruWDZbE1M9nJYQELHo5ukvfHrYTuCn3rCZEIZiupF4AJc8HwuYJMH/oukcAUk4j9EpYM0nUzrFurK8oihXQxHdcU/34/GEDuGCc9KFUcGRvMITQcSqMi3nmCput2+dmTR7zJHah601IZQUc8kXuK+n4FrgRWn0QVp6K1sXMJmEyeyd9HWl1J6N+IiK4bxyBcc4wa7bInSi7XPSmurMzt3oJ32LliXGsZ/nTXAjPApNUOgoiy1UzDRUYOl5y2pcXdoeY/pwb/LChXgzComqjgOgxf3OBzCA6h4cRULbBMv2LBCgqq9iZIHCLjBl1vDDOvTUcgcZEc4zboEBuS9kW7+k3ywnnzHFJ/LL9l/v6YlxkIPSt0JN7m051iyxol5Wi4mCqcbBJCYrB2b
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(2906002)(41300700001)(44832011)(5660300002)(8676002)(8936002)(36756003)(86362001)(31696002)(966005)(6666004)(6486002)(478600001)(45080400002)(83380400001)(186003)(6506007)(6512007)(53546011)(2616005)(31686004)(54906003)(110136005)(38100700002)(316002)(66476007)(66556008)(4326008)(6636002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVhXZ0dCUHNPdU10UzFLamJGdW42Ny9wb3dGbnJmNE9NQmx1SUZkbFpEdmR0?=
 =?utf-8?B?bUZSc3NTMkdmekZkcVdUUXVUWEgvU05nc1dTdHc3Z0FuTGViQXdpZUdqUGND?=
 =?utf-8?B?L2g4c3FWbldsSWFXQWd3STdTUys5RWNQdHZVTy9NeXQ5Wk42TG1ncURuL3Rj?=
 =?utf-8?B?cmdpajFBbGFHVGFCTG16M0N3c3F5bkQ0N3lTdEdJbDQ4MnlITUhtOVhLaWt6?=
 =?utf-8?B?QXcrcjVmT0FTenBNYnVUaU0zNXpGRmg4eUdKZTd2QkJRZ05xY1dZc0w2YU9K?=
 =?utf-8?B?c1VXKzZPTW1wT3NoZ0ZPT3FrRTNxblR4OWN3MWwwUTFBWHZLdG9KR1E0cFA5?=
 =?utf-8?B?aWk1NDhoL01SNjJIQ2h5NGZIcEpWd0hNVTk3MTEwSUd5SEFXRjI1dXlBc0Ey?=
 =?utf-8?B?eHJXZVBYS3lBbUN3UDFtZ20wK0JEOFozUGdKVXBqL2JPdlR5ZWU5bStDL1dJ?=
 =?utf-8?B?NlJyWEtTaUsxN1JDZmdHS1B3dGV2Tk4rVkQ3aXV2aW9la2x6U1R4ejlRY3Ju?=
 =?utf-8?B?ejR6TWo0ZmNaWmxoY3E3NnlKa2NhZ01KMGUrUGVDU1RSNWxhN09XdUl4Y3Ny?=
 =?utf-8?B?OTJVemk1Qkg4bGg2MEcyRXRyZVBXeC9sZHVDMlhsNkdXUjNwRjNRMnErcEpE?=
 =?utf-8?B?VnZDS2p2TU1lSVcvRkR5VFF0VE5YeE1zSUpsOVNEYnkySnU1ekhXcGdLN0Z1?=
 =?utf-8?B?bFpEaUFuR3RxSmRWQjlnVmVnRHNDc3FYdHF2UXZkb2YxQnI2UG83R2d0azZk?=
 =?utf-8?B?VFFoLzluaU54VElQTGkvTEU5czU3SDBJSW1GTFhTQW1ZNWJKZkhIUDhsZjly?=
 =?utf-8?B?cUx4TVZtMFY5Q2RNbnZadnoyRzY4bE5ISkhqTWF2RmE2VzI3ZE9LU29UL0xH?=
 =?utf-8?B?TXJuMXJzRjRHNzByb0Rhd21FTkIwRUhoUDAyLzViVUQzdTREQS9yeU1LSms2?=
 =?utf-8?B?MzdtVDZrSTE0a1JsT3FHbVl5NS95VFBCQnZLcVFMUFJIM3RpaTRSdkp1elp5?=
 =?utf-8?B?UVYxaEM3MC9rSElsNUNOZlcxemlJN21sdlZ5UFBCMnVrVlVQNzFmR2lCMjZE?=
 =?utf-8?B?WTRGajM1elNUa0ViVmU3dC9CcnZFSi9CQXFVWitzNHdzTmZjT045aU9LV0pS?=
 =?utf-8?B?MXZqVkM2LzlWUHBMMnFtZUlDNHRiVFdDckJIS01hK09iR081dzBib3pxZ01G?=
 =?utf-8?B?eGFLQnl3ektocU5mNXA4bEVFems4TkYzbHJrYSttWi8zYmtuWjFzNFhEYk52?=
 =?utf-8?B?c0hjaVZZZ1VWVm9zbmUyR2VCSmI0QUtIT1JyUXZYYndrK0l6YU5RakR5WTFx?=
 =?utf-8?B?K0cxMkpkZ1JodFhuNDhCZjFENmU1MGd1RkNSM2J6VU5iSWN4MDNueTFBQ1Bq?=
 =?utf-8?B?S0k0ZVl6WDcyek5KcFRzaFY4T0pGeDZoaDFnZHlGUm9LbXlPc1ZWanl4Sk1w?=
 =?utf-8?B?Ukt6M0dVMmdxTEFTeVBkaVpjSWxYZzNTUHczVVFaMWJOSHNRR0x5aXhQNTVi?=
 =?utf-8?B?NGtIRVc4VVRXTHEzbzc1U1RSS2F0bDQrWW1Pb1Z1aGxDU1MyRG5pcTQwNnZn?=
 =?utf-8?B?eENlNjRkVU9idWRPZGpQdEEveUg1ZWU2NUttSkE2YVlxUXFSam1mUm5Vai9z?=
 =?utf-8?B?Q0ZHUUxySmEvNXhqMk5PNXQ3dzNDYWdYYWZHT00xYks5cmFlVmEvTnRyN0dN?=
 =?utf-8?B?YTl5dVgrZlpXejdhTDZXMkRVRjdrdUlwNk1sUndKZjZsT1Z2NTZ5Z1pJNmd5?=
 =?utf-8?B?OVY5TGozZ2ZUSUg2TnN0Kzg3aS85aEVNaWNEUHgyNGp2MUZxT1ZJREM2bGlF?=
 =?utf-8?B?WnhVakFNMEZaNmVDK2NjZitGa3pQSzZyR051TERsRWZ5V0dsOGVjOUN0WS9k?=
 =?utf-8?B?c2Q0VXczRWxXekNtUWlMRUczTGpHNUlHVnFZN3RGRGloVVRNREdNOVdISVF6?=
 =?utf-8?B?SVIvclVDTzJRYzFPRXBIakxYNjh1V2tUVTlkdiswVy9IOWhwQ0RKTTdCQTNE?=
 =?utf-8?B?WHBLaXRUS2ZkNmhoU25CK1Q4TS8zVTNhd01GaWRKWTdZblpYZEhjOGc3dktZ?=
 =?utf-8?B?S2NaQS9OTXZDYklSVzFqcE45RG1KUXM1WnVCL21LOVg2S2dCNnZ1dG9VUVVJ?=
 =?utf-8?B?SmJwU0VOOXBOQVpwcXZVd2wrMmJ6VFN4UHhZSkdqVElSZStwMks0SmpSaWhm?=
 =?utf-8?B?WVE9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b2d93b-7e5a-41bf-38b5-08db70720234
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 03:05:16.9655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FqEU9lBCIw1ROOIHpaU6/1/5mmFs6W/lzvgqpi5Z1ZBA0SaywnbP8j36zQCskczenezqWdysi2i0Df5Tp46aEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6298
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 6/15/23 07:41, Friedrich Vock wrote:
> Hi,
> 
> sorry for taking so long to reply.
> 
> On 02.06.23 20:43, Limonciello, Mario wrote:
>> + some AMD guys
>>
>> On 5/30/2023 10:40 AM, Friedrich Vock wrote:
>>> On these laptops, there seems to be a device that, when probed by
>>> i2c-hid, constantly sends bogus interrupts and interferes with the
>>> keyboard controller. When the device is enabled, it takes the keyboard
>>> around 8 seconds to register that keys are being pressed or released.
>>
>> Do you know what interrupt is firing constantly?
>> Presumably it is the GPIO controller master interrupt, right?
>> And it's for GPIO 7 (guessed from acpidump on one of the bug
>> reports).
>>
>> To confirm check /proc/interrupts.
> Seems likely that you guessed correctly. The corresponsing line in
> /proc/interrupts (with the interrupts counts omitted):
> 71:   amd_gpio    7  ITE5570:00

OK.

>>
>> If it's not obvious which GPIO is firing there is also a dynamic
>> debug statement in pinctrl-amd.c that may be helpful to figure
>> this out.
>>
>> I would also suspect in Windows this doesn't happen.  If possible
>> can you confirm that? Check in Device Manager what driver is bound
>> to this device. Is it "inbox" from Microsoft or is it an ASUS
>> specific driver?
>>
>> I wonder if the GPIO controller got programmed differently in
>> Windows for some reason. We may want to confirm the values for
>> GPIO registers from /sys/kernel/debug/gpio in Linux against those
>> that are programmed in Windows.
>>
>> This can be accomplished using R/W everything in Windows.
> 
> Unfortunately I don't have Windows installed on this system. I know some
> people with the Ryzen 9 7940HS model which might, I'll ask them if they
> can give me the configuration on Windows and Linux.

OK, I suggest directing everyone over to the bugs I linked and we should 
gather the relevant GPIO controller register dumps from Windows and 
Linux on the same hardware there.

> 
>>
>>>
>>> Nothing I tried seemed to make the device work, and preventing the
>>> device from being probed doesn't seem to break any functionality of
>>> the laptop.
>>>
>>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>>
>> There are a few bug reports that popped up around this issue that should
>> probably also be tagged.
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217336
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217493
>>
>>> ---
>>>   drivers/hid/i2c-hid/i2c-hid-core.c       |  5 +++
>>>   drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c | 48 ++++++++++++++++++++++++
>>>   drivers/hid/i2c-hid/i2c-hid.h            |  3 ++
>>>   3 files changed, 56 insertions(+)
>>>
>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c
>>> b/drivers/hid/i2c-hid/i2c-hid-core.c
>>> index efbba0465eef..5f0686d058df 100644
>>> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
>>> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
>>> @@ -1035,6 +1035,11 @@ int i2c_hid_core_probe(struct i2c_client
>>> *client, struct i2chid_ops *ops,
>>>
>>>       ihid->quirks = i2c_hid_lookup_quirk(hid->vendor, hid->product);
>>>
>>> +    if (i2c_hid_device_blocked(hid->vendor, hid->product)) {
>>> +        ret = -ENODEV;
>>> +        goto err_irq;
>>> +    }
>>> +
>> The thing I worry about here is that an unserviced interrupt can
>> prevent the
>> hardware from going into proper low power states; particularly at
>> runtime.
>>
>> I think we should better understand what's going on before going down
>> this
>> path of just ignoring it.
> Yeah, I guess I should've searched more for a proper explanation/fix
> before submitting hacks like this. Let's see if this can be fixed in a
> cleaner manner than preemptively disabling parts of the system.

Can you please have a try with linux-next or apply this series:
https://lore.kernel.org/linux-gpio/20230421120625.3366-1-mario.limonciello@amd.com/

That does change some of the configuration for the GPIO controller 
registers to align how windows is handling debouncing.

I don't think it will change the outcome of your bug, but I'd love
to be surprised.

>>>       ret = hid_add_device(hid);
>>>       if (ret) {
>>>           if (ret != -ENODEV)
>>> diff --git a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>> b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>> index 210f17c3a0be..d2c2806b64b4 100644
>>> --- a/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>> +++ b/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.c
>>> @@ -440,6 +440,38 @@ static const struct dmi_system_id
>>> i2c_hid_dmi_quirk_table[] = {
>>>       { }    /* Terminate list */
>>>   };
>>>
>>> +static const struct hid_device_id i2c_hid_blocked_ite_device = {
>>> +    HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC, USB_VENDOR_ID_ITE, 0x8051)
>>> +};
>>> +
>>> +/*
>>> + * This list contains devices that can't be activated at all, for
>>> example
>>> + * because activating them breaks other important parts of the system.
>>> + */
>>> +static const struct dmi_system_id i2c_hid_dmi_block_table[] = {
>>> +    /*
>>> +     * On ASUS TUF Gaming A16 laptops, there is a device that will
>>> make the
>>> +     * keyboard controller stop working correctly and flood the CPU
>>> with bogus
>>> +     * interrupts.
>>> +     */
>>> +    {
>>> +        .ident = "ASUS TUF Gaming A16 (Ryzen 7 7735HS)",
>>> +        .matches = {
>>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "FA617NS"),
>>> +        },
>>> +        .driver_data = (void *)&i2c_hid_blocked_ite_device,
>>> +    },
>>> +    {
>>> +        .ident = "ASUS TUF Gaming A16 (Ryzen 9 7940HS)",
>>> +        .matches = {
>>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "FA617XS"),
>>> +        },
>>> +        .driver_data = (void *)&i2c_hid_blocked_ite_device,
>>> +    },
>>> +    { }    /* Terminate list */
>> If this *does* end up being the best solution, I think it's better
>> to patch in the DMI to gpiolib-acpi.c similar to other quirks for
>> floating
>> GPIOs.  Example:
>>
>> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L1654
>>
>>
>>> +};
>>>
>>>   struct i2c_hid_desc *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t
>>> *i2c_name)
>>>   {
>>> @@ -492,3 +524,19 @@ u32 i2c_hid_get_dmi_quirks(const u16 vendor,
>>> const u16 product)
>>>
>>>       return quirks;
>>>   }
>>> +
>>> +bool i2c_hid_device_blocked(const u16 vendor, const u16 product)
>>> +{
>>> +    const struct dmi_system_id *system_id =
>>> +            dmi_first_match(i2c_hid_dmi_block_table);
>>> +
>>> +    if (system_id) {
>>> +        const struct hid_device_id *device_id =
>>> +                (struct hid_device_id *)(system_id->driver_data);
>>> +
>>> +        if (device_id && device_id->vendor == vendor &&
>>> +            device_id->product == product)
>>> +            return true;
>>> +    }
>>> +    return false;
>>> +}
>>> diff --git a/drivers/hid/i2c-hid/i2c-hid.h
>>> b/drivers/hid/i2c-hid/i2c-hid.h
>>> index 2c7b66d5caa0..e17bdd758f39 100644
>>> --- a/drivers/hid/i2c-hid/i2c-hid.h
>>> +++ b/drivers/hid/i2c-hid/i2c-hid.h
>>> @@ -10,6 +10,7 @@ struct i2c_hid_desc
>>> *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name);
>>>   char *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
>>>                              unsigned int *size);
>>>   u32 i2c_hid_get_dmi_quirks(const u16 vendor, const u16 product);
>>> +bool i2c_hid_device_blocked(const u16 vendor, const u16 product);
>>>   #else
>>>   static inline struct i2c_hid_desc
>>>              *i2c_hid_get_dmi_i2c_hid_desc_override(uint8_t *i2c_name)
>>> @@ -19,6 +20,8 @@ static inline char
>>> *i2c_hid_get_dmi_hid_report_desc_override(uint8_t *i2c_name,
>>>   { return NULL; }
>>>   static inline u32 i2c_hid_get_dmi_quirks(const u16 vendor, const
>>> u16 product)
>>>   { return 0; }
>>> +static inline bool i2c_hid_device_blocked(const u16 vendor, const
>>> u16 product)
>>> +{ return false; }
>>>   #endif
>>>
>>>   /**
>>> -- 
>>> 2.40.1
>>>
>>>

