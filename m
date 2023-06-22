Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53B6F73A992
	for <lists+linux-input@lfdr.de>; Thu, 22 Jun 2023 22:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbjFVUhv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Jun 2023 16:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjFVUhu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Jun 2023 16:37:50 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2048.outbound.protection.outlook.com [40.107.8.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC7A10F0;
        Thu, 22 Jun 2023 13:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bu0vUqB0GkG9CEfRcLdVttRAPWWTxPVRJH+srIayju6Xu65AblEYXEKgAdu+0PipEXAuCol4fqVZj35xhm1kTSnIJCiwbq0Ti0+eUfEnM60BTF9Rdoil2gre/AtceM2SBL+6xPsC6KtxJDkQZibNP0zRinuAkNMt+hbNRil6vhuPv47pzi+q0m2itEgYJ7IHnfCdqqivMSumREHlEEgwceodgAvAERl1VbVxY5v6C39fvni/9SONkPMwIVM5eGALb7LnvpUEgjbE6JcZLKjJrd9w1NwQny4MFCtthWCKkR8z252LO+nSKxjiuAnP7wdhlD91o4K5Y2eRJKatJo0JzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iaRV7QiNeg6eG37dnCY0dcUDeGiP44om/dJm21Q89c=;
 b=ESOscbEGxDb4vknF0Ie/DYzi8cegq6qZ5iIQLWykJlEE65wrK4wWjQUWHUtLls5xBiErOCaOMfXwYso9rbg1/yLHLOIsxx2P+R61CPFOx5u/xiVshSO33pegwA1V+IU1JlxvYnCVSb8s+zfSV9PNeC5dpJpo7ej+cUDyQEgaKZqVvWsqTWjlErn02RLYNgrFqXVO+/jcZkE8QPJeI2XMrHgbd9JwOFABBoszzyRffgfz12wlVrRP9VX0i9eIGF54YapZK3DmAnEx08r5OKzCi9g8jA0OqyxK4BsG3H+ceUzzONbdVsbijbbcCc+1vRrbKUTUonltWXMBWSlnpN/sjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iaRV7QiNeg6eG37dnCY0dcUDeGiP44om/dJm21Q89c=;
 b=YoQW5Uu2MHk9P0vMgc/DC3pO5GbFAhI+94f7uPcLFKfojJ26n6hds6HCSlU4Ztxjw/2b+DxvW5DTq0HdxZIJmm4agkkfzKADOgDzGnvsVO11+74aIYj3BPBUICj29dTzRoyzxjFTHXvIfUgG1sGQPGljTgnObCSmqR52ngmtUwkOwmR3XdhmTVqsNQwh7ElOzJevR1RO5XyFpV1n/sJ7FU+8oPbQ0NTor7iEtLZOvsZONnSzCoDCKJaEG4bIEyijV8PraNA620jvSSGIHXOmvnG+lXnBq58M41iAyjq6FwqR5pxZHjnR7Q+9YaP/PaEc+/E8E2C3OkhXDr3OKqPYUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:416::10)
 by PAXP251MB0623.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:284::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 20:37:43 +0000
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8]) by AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8%3]) with mapi id 15.20.6521.026; Thu, 22 Jun 2023
 20:37:41 +0000
Message-ID: <fcb47559-dac0-963b-8798-dab0d6b0b636@polimi.it>
Date:   Thu, 22 Jun 2023 22:37:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Marco Morandini <marco.morandini@polimi.it>
Subject: Re: [PATCH 1/1] HID: Add introduction about HID for non-kernel
 programmers
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <d6d16821-2592-8210-475a-5388d7a79e82@polimi.it>
 <99a679e8-6b01-6805-1e33-ce02485e0063@polimi.it>
 <20230622075905.GA35108@quokka>
Content-Language: en-US, it
In-Reply-To: <20230622075905.GA35108@quokka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0035.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::20) To AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:416::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P251MB0350:EE_|PAXP251MB0623:EE_
X-MS-Office365-Filtering-Correlation-Id: d129938e-6152-4550-e681-08db7360868a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ynRnZUwTLEGU9fbXuwf4Fwyf5bj9YQKaNUmLAL1KRM77608C2PCEOh4ld87rcPLt0IQON+01s6QbgNL9Xl4sLDa82cKtP7IyG+0QdAPug4USzSv27lA+EYZH2yRayKfuU4rsdczpNuWEIhWdYlpf+oOk4Y+QbVBIHPZ0DaR6IWO7JLj5fwwHD7gM6+vuCNmjCTxADuyZPNCnBzqmh6MMAGJaPiLNyQ0I7Q80UjTrWAW2M4khA4R1UzRv2LAl+Og7dFrGJErYXttEXfM38oqp35FFblR+Wq7SqA+HZBq/5UF5APLpyw9wL02sNG4oh0Uevq9ONetUd85ZMYlg/SEQ2DTw/1MT8jZ0d/tMOqwLWSEB09mZqlPgXvfmyDdLsP+1dzgPJ7yIaq2bfwVVWrOk9hcbVJWvGQHL4xr5ZXPbG9iXs+FJ5vQgdOhcZXODPbSbNUUupa1Jf1TIT7WfB/5QwOFiZzXP1pPWx3LmgkHzY+D9amzIAzlCjMfazwnrfw67pXEGlNOZNoLQaDyO/5x+1p7Ew/tzv8fi+TC4JJ3++znvVW2TGGawcU8zsmFP9JWjcDhCvGLhPrPInw0U5mGsTQilinJT1g0hIKQD2xMehFObrM7UnGgkXEgEGH76l2rcJ9KXdN4/rfm2DhmjBN22qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P251MB0350.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199021)(186003)(30864003)(5660300002)(4326008)(66946007)(66476007)(6916009)(316002)(786003)(66556008)(36756003)(44832011)(2906002)(66899021)(31686004)(41300700001)(8676002)(8936002)(54906003)(6486002)(86362001)(478600001)(38100700002)(966005)(6506007)(6666004)(6512007)(31696002)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anJMcUs3em5wVmtFY0RSZ3lPYjlpRStVZDNkNmJjWmxUNnR5Z2dVcUZ6MjV6?=
 =?utf-8?B?LytTeUZ4MHljb2xUUWJBejFwdnFqWFo0MHNPZWZPdU0yV214eC8rQlI4OUtX?=
 =?utf-8?B?NzdYb0N4VitpQ0VNOEozeTQ5RmVVOEFZeU41Y1prNmdCQVpvck9HRGE2RjN1?=
 =?utf-8?B?clZWRDFDaW1Jbll5MG1NdE4zeTVDNExPVWJFa0dhUytLWStZTHAva1BmY1VV?=
 =?utf-8?B?eWlvSXBoalpMKytuU1dsU0lrVmdhWW1EcDJWYUN6RjBTdjc0WFpmVVlwWDhq?=
 =?utf-8?B?VHdKM0UrSUl6VEFXVlA4c1QxSlVycHl6MlVDNjVZZktQbm5EQ0hVZFdxVVU0?=
 =?utf-8?B?MGQ2QkROMGdGeUM3Z0xqZWJGNDNTU2lFZ0ZWQlJraUl1alZrMFpscXBndHRX?=
 =?utf-8?B?VkZ6bnhTS1dMdlNhK0htZUZmMWkyNjBMQ2xuL1RCeHRTOG5abUxnazE4dWp5?=
 =?utf-8?B?YlRCdmFEeGY5ZmROdE1XL294SEpFMjhCMTQ4cnNqdVFrcTRVb0hOMHBzSmo0?=
 =?utf-8?B?bS9rUHNOeW4vVzRtU0hpTUVBOVk0dDcrNTBxYmdFQmIya3BRTm1zN2doc2Zt?=
 =?utf-8?B?SEN3WTFHcnJjL01OZk5GbGd4ZitIczdGUGVVV1JJT0Z4TkhUdmNQaDJ3TENH?=
 =?utf-8?B?MkZlclVORkpUSnlGY09MZ3VFVEZUdWF0ekE1MVBBNFkzaDVvV0d6dVdBaUxu?=
 =?utf-8?B?YWdrcGZJcWRZTVdMQ1M2TFRrUHhkZjZWNlFnOWRhM0ZmcHBNUEhFcDA5QS9P?=
 =?utf-8?B?cVJhS3BIOVFMRUgwTktQYnB3ZWt0c2FaUjArTEpLbHlnVnNCMVJKK1d0dURR?=
 =?utf-8?B?YUl3SXoyblBpdDlsb3dGMWJwQmR4Qjg1RXRYdTNEQ3p5WUlDVjdYZ0lrN0VS?=
 =?utf-8?B?d0pUVFlnWkF3U1J4RUtxSy94ZDQwMm5JRWlHOHNOVmtHSzFIZkJLdHQwMDg2?=
 =?utf-8?B?TVdlZnRYeXVHVWFjL2lkK09lcmd3M2pUVkFlSkNmM0FOaWhBRVp3V1ZNZE5x?=
 =?utf-8?B?ay9QTWVPYUhmUHVNQTg3eXhwT2hETEhBVHJiM2VtdWNsZFJvTFpqTG9qOHNG?=
 =?utf-8?B?WXlLRFRBeTE3K1FGdnJMdUFTV1o0ZkUzbUJuUTdUOHBKWTVoRi9Fc01TRlJD?=
 =?utf-8?B?WVhBNzFQSWIzQlJQTjliYy84Z1lpMytxRFhTd1B2bm5zRlpwNG53Z1crTzQ5?=
 =?utf-8?B?QjkreWxZcEpvY1B4WnBnVkE0MWJFRUNPMWdGV1B4azVNdmxZZlVwQ0NadExy?=
 =?utf-8?B?czJ0NFpvY0JxVFRxMHBIS29PNzVES0hMZ0dhWW5iUUVxbVpzM2V0R1pSbVZ5?=
 =?utf-8?B?ZGx3Q0xJVFY5WTF1TGlqclIraDdMb2Jwd2o1TUdIaW0ramRnOW9RS3hSQVJY?=
 =?utf-8?B?VytlTjg2bUJBVVZ6UVZrT1dKcUdTdmFQdEt3WFhwU2pkM3pOWUJ1TWRBY21I?=
 =?utf-8?B?UnE2bTlYOHhkdVhTcjJzRmJmTzd4cWpVN3hVQ0dPcnY1MDBJZkwzMUdlN2M1?=
 =?utf-8?B?Rm1nVVZFeGw0NElxQUtTL2FnT01xVHo4ZnZTZ0QyVUttQWs1SXQ0MjNOMmF2?=
 =?utf-8?B?UVlvL3IyVVpQUjcvckt5Z3BYd0FEcFFENEFvRlRmMk5VZVB5NWNhd0dQOWFI?=
 =?utf-8?B?M3NWMHRDZFlzM0FHVmpHWm5LVlQ4dUhlZkszcmo1bUxRd1hYbkNBMEVoVmFu?=
 =?utf-8?B?RmhKOEkrc1hwZU9Eanpta1M3VHlIWERsQW5iNytWeFNHSExpbjNKNUVuK2Ja?=
 =?utf-8?B?R29IZ1EybGpvcVFMc3hsdHh2YkVkaHUxNDVRaW05a2ZGMk5PUElwS2F4clFh?=
 =?utf-8?B?WW9EaVVNY2VJOXU5YnVuMUxSSFo2ZlNBbTVZKzJQa0VjRjMwOWNySGtXUU1v?=
 =?utf-8?B?eXluM3FpUmpjNXl2QUs4NXBoVERDM2EzU1RYWUhkNXZWT0ZydVRUQzg0dzVQ?=
 =?utf-8?B?QlJlNnZpdENuU2tiTXczcktoSjlZQnJFRlhuWlg4RUowSTlFbUEwTlJYUGR1?=
 =?utf-8?B?MlZiYUVQY1JMTzJnQlgybnRZZ2dPd1Nub1M2YUNKNEFnYjdNRHFRVkEvWTVk?=
 =?utf-8?B?VWVLeGt0K2hNdmVZb2FFQkRubU1FcU1CLzdEZ3RHZndhUDFNYVpOL2tJUTZP?=
 =?utf-8?B?bnNHdm1iOENFVFBQRmhyUWNqVTZEZHJMcGVwREY3ZlFlVHY4ekl0SzJmczhV?=
 =?utf-8?Q?aoBeLKVRbnsH4X+dMjeNu/29nE4Xy3GkijjJrGM3F+qF?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: d129938e-6152-4550-e681-08db7360868a
X-MS-Exchange-CrossTenant-AuthSource: AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 20:37:41.6774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vK9CoKpaNyDwRZCNs+MrLx8fMPGa+/9BKzo4Vn7V8ZG1t2cxDkZRJ9f1bQTqmTYoGPhFHV9UFFpvG/JQR/F4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP251MB0623
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


> 
> shameless plug! :) I wrote this post a few years ago, feel free to
> incorporate bits from there into here
> https://who-t.blogspot.com/2018/12/understanding-hid-report-descriptors.html


Damn! This is much better than all the tutorials 
I found while trying to orient 
myself, and I managed to miss it :(

Would it be ok to link to it from the doc?

>> +Many HID work out the box, even if their hardware is different.
> 
> See Benjamin's comment too, I think it's better to use "HID device"
> here, primarily because we have the "HID protocol", "HID parser", "HID
> quirks", so it's more a qualifier than what the acronym actually stands
> for.

I should have fixed this, please double check.

>> +For example, mouses can have a different number of buttons; they
> 
> s/a different/any/ - otherwise it's "different to what?"

Ok

>> +can have (or not) a wheel; their movement sensitivity can be
> 
> I'd use "may have a wheel" but it's correct this way too

Better "may"

> 
>> +significantly different, and so on. Nonetheless,
> 
> maybe something like "movement sensitivity differs between different
> models"

Ok

> 
>> +most of the time everything just works, without the need
>> +to have specialized code in the kernel for any mouse model
> 
> s/any/every/

Ok

> 
>> +developed since 1970.
>> +
>> +This is because most (if not all) of the modern HIDs do advertise
>> +the number and type of signal that can be exchanged, and
>> +describe how such signal are exchanged with the computer
>> +by means of *HID events*.
>> +This is done through the *HID report descriptor*, basically a bunch of numbers
>> +that allow the operating system to understand that the mouse at hand
>> +has (say) five rather than three buttons.
> 
> I think the above lines are at risk of confusing newbies, how about
> something like this:
> 
> 	This is because modern HID devices do advertise
> 	their capabilities through the *HID report descriptor*, a
> 	fixed set of bytes describing exactly what *HID reports*
> 	may be sent between the device and the host and the meaning of each
>   individual bit in those reports. For example, a HID Report Descriptor
> 	may specify that "in a report with ID 3 the second byte is the delta x
>   coordinate of a mouse".
> 
>   The HID report itself then merely carries the actual data values
> 	without any extra meta information. Note that HID reports may be sent
>   from the device ("Input Reports", i.e. input events), to the device
>   ("Output Reports" to e.g. change LEDs) or used for device
>   configuration ("Feature reports"). A device may support one or more
>   HID reports.

Much better, thank you.

>> +The HID subsystem is in charge of parsing the HID report descriptors,
>> +and of converts HID events into normal input
> 
> s/of//

Ok

> 
>> +device interfaces (see Documentation/hid/hiddev.rst).
>> +Whenever something does not work as it should this can be
>> +because the HID report descriptor provided by the device is wrong,
> 
> "Devices may misbehave because the HID report descriptor ..."
> 
>> +or because it needs to be dealt with in a special way,
>> +or because the some special device or interaction mode
>> +is not handled by the default code.
>> +
>> +The format of HID report descriptors is described by two documents,
>> +available from the `USB Implementers Forum <https://www.usb.org/>`_
>> +at `this <https://www.usb.org/hid>`_ addresses:
>> +
>> + * the `HID USB Device Class Definition <https://www.usb.org/document-library/device-class-definition-hid-111>`_ (HIDUDC from now on)
> 
> Benjamin may have more opinion on that but to me this was only ever "the
> HID spec" :) The term "HIDUDC" also doesn't provide anything useful in
> the search engines so anyone reading over this bit and skipping ahead
> will be punished for it.
> 
>> + * the `HID Usage Tables <https://usb.org/document-library/hid-usage-tables-14>`_ (HIDUT from now on)
> 
> can we name this "HUT" please? because that's the only term I've ever
> seen referred it to other than as HID Usage Tables.

s/"HIDUDC manual"/"HID spec"/
s/"HIDUDC"/"HID spec"/
s/HIDUT/HUT/

Thnak you!

>> +This does not means that the HID subsystem can deal with USB devices only;
> 
> s/means/mean/

Fixed

> 
>> +rather, different transport drivers, such as I2C or Bluetooth, can be dealt
>> +with, see Documentation/hid/hid-transport.rst.
>> +
>> +Parsing an HID descriptor
>> +=========================
> 
> I'm pretty sure that most people just say "hid" like a word rather than
> spelling out H-I-D, so this would mean it would be "a HID descriptor".
> In practise, this particular nasty corner of the english language can be
> avoided by always calling them the plural HID report descriptors and
> thus avoiding the windmill battles of "a" vs "an".
> 
> Also, I'd rather you alway use "report descriptor" over "descriptor"
> since that is the full term and non-ambiguous.
> 

Should be fixed.

>> +Alternatively, the HID report descriptor can be read by accessig the hidraw
> 
> typo: accessing

Fixed

>> +driver, see Documentation/output/hid/hidraw.rst and
>> +file samples/hidraw/hid-example.c for a simple example.
>> +The output of ``hid-example`` would be, for the same device::
>> +
>> +  marco@sun:~> sudo ./hid-example
>> +  Report Descriptor Size: 52
>> +  Report Descriptor:
>> +  5 1 9 2 a1 1 9 1 a1 0 5 9 19 1 29 3 15 0 25 1 75 1 95 3 81 2 75 5 95 1 81 1 5 1 9 30 9 31 9 38 15 81 25 7f 75 8 95 3 81 6 c0 c0
>> +
>> +  Raw Name: PixArt USB Optical Mouse
>> +  Raw Phys: usb-0000:05:00.4-2.3/input0
>> +  Raw Info:
>> +          bustype: 3 (USB)
>> +          vendor: 0x093a
>> +          product: 0x2510
>> +  HIDIOCSFEATURE: Broken pipe
>> +  HIDIOCGFEATURE: Broken pipe
>> +  Error: 32
>> +  write: Broken pipe
>> +  read: Resource temporarily unavailable
> 
> I don't think you need to include the error messages.

Ok

> Also: you now already have 2 tools to look at hid and then you use two
> more later (hidrrd and hid-tools). I'd say it's best to just stick to
> one tool to reduce the mental load of having to map different tool
> outputs to what is the same base data.

I'm not sure about this: I think that hidraw needs to be introduced somewhere,
if for nothing because it's what gets consumed by hid-record .
Furthermore, looking at samples/hidraw/hid-example.c one can learn something, if not a lot.
For the time being I'm leaving the paragraph, moving most of it into a footnote;
of course we can drop it if you have a strong opinion about this. 

> 
>> +
>> +The basic structure of a HID report descriptor is defined in the HIDUDC manual, while
>> +HIDUT "defines constants that can be interpreted by an application to
>> +identify the purpose and meaning of a data
>> +field in a HID report". Each entry is defined by at least two bytes,
>> +where the first one defines what type of value is following,
>> +and is described in the HIDUDC manual,
>> +and the second one carries the actual value,
>> +and is described in the HIDUT manual.
>> +
>> +Let consider the tirst number, 0x05: according to
> 
> s/let/let's/
> 

I changed  it into "Start the first ..."

>> +HIDUDC, Sec. 6.2.2.2, "Short Items"
>> +
>> + * the first least significant two bits
>> +   define the number of the following data bytes (either 0, 1, 2 or 4
>> +   for the values 0, 1, 2 or 3, respectively)
>> + * the second least significant two bits identify the type of the item:
>> +
>> +   * 0: ``Main``
>> +   * 1: ``Global``
>> +   * 2: ``Local``
>> +   * 3: ``Reserved``
>> + * the remaining four bits give a numeric expression specifying
>> +   the function of the item (see below);
>> +
>> +This means that ``0x05`` (i.e. ``00000101``) stands for
>> +1 byte of data to be read, and Global type.
>> +Since we are dealing with a Global item the meaning
>> +of the most significant four bits
>> +is defines in HIDUC manual, Sec. 6.2.2.7, "Global Items".
> 
> typo with "HIDUC"

Ok

> 
>> +The bits are ``0000``, thus we have a ``Usage Page``.
> 
> I'm guessing you *don't* want to explain the full "how bit's being parsed"
> so a simpler approach would be a basic byte diagram with references
> to the official spec:
> 
> Then you get something like:
> 
> """
> Let's consider the first number, 0x05 which carries 2 bits for the
> length of the item, 2 bits for the type of the item and 4 bits for the
> function:
> 
> 	+----------+
> 	| 00000101 |
> 	+----------+
> 					^^
> 					 ---- Length of data (see UDC 6.2.2.2)
> 				^^
> 				 ------ Type of the item (see UDC 6.2.2.7)
> 		^^^^
> 			--------- Function of the item (see HUT Sec 3)
> 
> In our case, the length is 1 byte, the type a "Global" and the function
> is "Usage Page", thus we need to refer to HUT Sec 3 which indicates that
> the value 0x01 in the second byte stands for ``Generic Desktop Page``.
> """

Well... my intention was to be more verbose (not every programmer out there 
routinely deals with bytes and bits; for sure I'm not one of those 
how are confortable with them :( )
but it's perfectly ok as you've suggested. 

>> +
>> +
>> +The second number is the actual data, and its meaning can
>> +be found in the HICUT manual.
>> +We have an ``Usage Page``, thus we need to refer to HICUT Sec. 3,
>> +"Usage Pages"; from there, it is clear that the ``0x01``
>> +stands for a ``Generic Desktop Page``.
> 
> note "Generic Desktop Page", you can skip the "a" here
> 

Ok

>> +
>> +Moving now to the second two bytes, and following the same scheme, ``0x09``
>> +(i.e. ``00001001``) will be followed by one byte (``01``)
>> +and is a ``Local`` item.
>> +Thus, the meaning of the remaining four bits (``0000``)
>> +is given in HIDUDC Sec. 6.2.2.8 "Local Items", so that we have an ``Usage``.
>> +
>> +In this way the HID report descriptor can be painstakingly
>> +parsed, byte by byte. In practice you need not to do this,
>> +and almost no one does
>> +this: everyone resorts to specialized parsers. Among all the available ones
> 
> I would be harsher here: "In practice you should not do this, use an
> existing parser" because the people who first learn about HID here
> should probably not immediately write a parser (mostly fo their own
> sanity :)

Changed into

"In practice you should not do parse HID report descriptors by hand; 
rather, you should use an existing parser."

Not sure if you agree with the preceding paragraph, that I've added
after moving the hand-parsing example into a separate document, as suggested by Benjamin:

"HID report descriptors can, in principle, be painstakingly
parsed by hand, byte by byte. 

A short introduction
on how to do this is sketched in Documentation/hid/hidreport-parsing.rst;
you need to understand it only if you need to patch HID report descriptors.
"

>> +  # 0x75, 0x08, 		   //	Report Size (8) 		  44
>> +  # 0x95, 0x03, 		   //	Report Count (3)		  46
>> +  # 0x81, 0x06, 		   //	Input (Data,Var,Rel)		  48
>> +  # 0xc0,			   //  End Collection			  50
>> +  # 0xc0,			   // End Collection			  51
>> +  #
>> +  R: 52 05 01 09 02 a1 01 09 01 a1 00 05 09 19 01 29 03 15 00 25 01 75 01 95 03 81 02 75 05 95 01 81 01 05 01 09 30 09 31 09 38 15 81 25 7f 75 08 95 03 81 06 c0 c0
>> +  N: device 0:0
>> +  I: 3 0001 0001
> 
> Benjamin already said this but: pick one tool and use its output, there
> is no need to show different tools being different. Since Benjamin is
> both the kernel maintainer and the hid-tools maintainer, that one should
> be the favourite ;)
> 

Yes, my fault: it was commented. 

As already written to Bejamin, I'd like to leave the links
to hiddrd because its output is more verbose.

Deleted

>> +
>> +From it we undesratnd that
> 
> typo

Fixed

> 
>> +
>> + * the mouse has three (from ``Usage Minimum (1)`` to
>> +   ``Usage Maximum (3)``) buttons (``Usage Page (Button)``);
>> + * buttons can take values ranging from ``0`` to ``1``;
>> +   (from ``Logical Minimum (0)`` to ``Logical Maximum (1)``);
> 
> so, remembering my early HID learnings - if you just throw out "Usage
> Minimum" and "Maximum" that is mostly meaningless unless one also reads
> the definition of what those mean. For me it took me a while to wrap my
> head around the term "Usage" to begin with, it not really being an
> english word that you'd encounter every day.
> 
> I think it'll be more understandable annotating the button line by line
> with layperson's terms - anything specific needs to be externally looked
> up anyway. So you get something like this:
> 
> """
>> +  # 0x05, 0x09, 		   //	Usage Page (Button)		  10
> 
> what follows is a button
> 
>> +  # 0x19, 0x01, 		   //	Usage Minimum (1)		  12
>> +  # 0x29, 0x03, 		   //	Usage Maximum (3)		  14
> 
> first button is button number 1, last button is button number 3
> 
>> +  # 0x15, 0x00, 		   //	Logical Minimum (0)		  16
>> +  # 0x25, 0x01, 		   //	Logical Maximum (1)		  18
> 
> each button can send values from 0 up to including 1 (i.e. they're
> binary buttons)
> 
>> +  # 0x75, 0x01, 		   //	Report Size (1) 		  20
> 
> each button is sent as exactly one bit
> 
>> +  # 0x95, 0x03, 		   //	Report Count (3)		  22
> 
> and there are three of those bits (matching our three buttons)
> 
>> +  # 0x81, 0x02, 		   //	Input (Data,Var,Abs)		  24
> 
> it's actual Data (not constant padding), they represent a single
> variable (Var) and the value are Absolute (not relative).
> See HIDUDC Sec. 6.2.2.5 "Input, Output, and Feature Items.
> """

Done, but I'm not convinced by how the result is formatted.
After some experiments I ended up putting everything
inside the same verbatim block, but if you can suggest 
a better alternative that does not disrupt too much
the parsed report descriptor you are more than welcome.

>> + * information is encoded into three bits: one bit has
>> +   ``Report Size (1)``,
>> +   but there are three of them since ``Report Count (3)``;
>> + * the value of these bits can change
>> +   (``Data`` in ``Input (Data,Var,Abs)``);
>> + * each field represents data from a physical control;
>> + * the number of bits reserved for each field is determined
>> +   by the preceding ``Report Size``/``Report Count``
>> +   items (``Var`` in ``Input (Data,Var,Abs)``);
> 
> tbh, I think that's a mischaracterization of Var vs Arr (and tbh the
> exact detail what those mean doesn't really matter here anyway).

Ok.

> 
>> + * the data is *absolute* (i.e it does not represent the
>> +   change from the last report, ``Abs`` in ``Input (Data,Var,Abs)``).
>> +
>> +The meaning of the ``Input``
>> +items is explained in HIDUDC Sec. 6.2.2.5 "Input, Output, and Feature Items.
>> +
>> +There are five additional padding bits, that are needed
>> +to reach a byte: see ``Report Size (5)``, that is
>> +repeated only once (``Report Count (1)``).
>> +These bits take *constant* values (``Cnst`` in
>> +``Input (Cnst,Arr,Abs)``).
>> +
>> +The mouse has also two physical positions (``Usage (X)``, ``Usage (Y)``) and a wheel
>> +(``Usage (Wheel)``).
>> +
>> +Each of them take values ranging from ``-127`` to ``127``
>> +(from ``Logical Minimum (-127)`` to ``Logical Maximum (-127)``),
>> +it is represented by eight bits (``Report Size (8)``)
>> +and there are three of these set of bits (``Report Count (3)``).
>> +
>> +This time the data do represent the change from the previous configuration
>> +(``Rel`` in ``Input (Data,Var,Rel)``).
>> +
>> +All in all, the mouse input will be transmitted using four bytes:
> 
> I would say "the Report Descriptor tells us that mouse input will be..."
> because I think that makes it a bit more obvious

Ok. Thank you!

>> +the first one for the buttons (three bits used, five for padding),
>> +the last three for the mouse X, Y and wheel changes, respectively.
>> +
>> +Indeed, for any event, the mouse will send a *report* of four bytes.
>> +We can easily check the values sent by resorting e.g.
> 
> s/easily// because it may not be for some users

Ok.

>> +to the `hid-recorder` tool, from `hid-tools
>> +<https://gitlab.freedesktop.org/libevdev/hid-tools>`_:
>> +The sequence of bytes sent by clicking and releasing
>> +button 1, then button 2, then button 3 is::
>> +
>> +  marco@sun:~/> sudo ./hid-recorder /dev/hidraw1
>> +
>> +  ....
>> +  output of hid-decode
>> +  ....
>> +
>> +  #  Button: 1  0  0 | # | X:	 0 | Y:    0 | Wheel:	 0
>> +  E: 000000.000000 4 01 00 00 00
>> +  #  Button: 0  0  0 | # | X:	 0 | Y:    0 | Wheel:	 0
>> +  E: 000000.183949 4 00 00 00 00
>> +  #  Button: 0  1  0 | # | X:	 0 | Y:    0 | Wheel:	 0
>> +  E: 000001.959698 4 02 00 00 00
>> +  #  Button: 0  0  0 | # | X:	 0 | Y:    0 | Wheel:	 0
>> +  E: 000002.103899 4 00 00 00 00
>> +  #  Button: 0  0  1 | # | X:	 0 | Y:    0 | Wheel:	 0
>> +  E: 000004.855799 4 04 00 00 00
>> +  #  Button: 0  0  0 | # | X:    0 | Y:    0 | Wheel:    0
>> +  E: 000005.103864 4 00 00 00 00
>> +
>> +where it's clear that, for example, when button 2 is clicked
>> +the bytes ``02 00 00 00`` are sent, and the immediately subsequent
>> +event (``00 00 00 00``) is the release of button 2 (no buttons are pressed,
>> +remember that the data is *absolute*).
> 
> "where it's clear" can be problematic for readers for whom it's not
> clear at all :) In this case you can write
> "this example shows that when button 2 is clicked..." to avoid
> that issue. I think there are a few uses of that phrase or similar in
> this document.

Good point, thank you. 
I should have got ridden af all the "clear"
instances.

Also 
"The examples in samples/hid should be relatively straightforward, see..."
->
"The examples in samples/hid should be a good starting point
for your code, see ..."

>> +If instead one clicks and holds button 1, then clicks and holds button 2,
>> +releases button 1, and finally releases button 2, the reports are::
>> +
>> +  #  Button: 1  0  0 | # | X:    0 | Y:    0 | Wheel:    0
>> +  E: 000044.175830 4 01 00 00 00
>> +  #  Button: 1  1  0 | # | X:    0 | Y:    0 | Wheel:    0
>> +  E: 000045.975997 4 03 00 00 00
>> +  #  Button: 0  1  0 | # | X:    0 | Y:    0 | Wheel:    0
>> +  E: 000047.407930 4 02 00 00 00
>> +  #  Button: 0  0  0 | # | X:    0 | Y:    0 | Wheel:    0
>> +  E: 000049.199919 4 00 00 00 00
>> +
>> +where with ``03 00 00 00`` both buttons are pressed, and with the
>> +subsequent ``02 00 00 00`` button 1 is released while button 2 is still
>> +active.
>> +
>> +Outputs and Inputs
>> +------------------
>> +
>> +An HID devices can have inputs, like
> 
> I would refer to those as "Input Reports" and "Output Reports", simply
> because for me it was much easier to adjust my head to accept that you
> can send something to the mouse than that the mouse "has an output".

Changed, please doulbe check for correctness.

> 
>> +in the mouse example, and outputs.
>> +"Output" means that the information is fed
>> +from the device to the human; for examples,
>> +a joystick with force feedback will have
>> +some output.
>> +
>> +
>> +Report IDs and Evdev events
>> +===========================
>> +
>> +A single device can logically group
>> +data into different, independent sets.
>> +It is *as if* the HID presents
>> +itself as different devices, each exchanging
>> +its own data. The HID report descriptor is unique,
>> +but the different reports are identified by means
>> +of different ``Report ID`` fields. Whenever a ``Report ID``
>> +is needed it is transmitted as the first byte of any report.
> 
> This is a bit ambiguous since it's the collections and applications that
> split the device into different sets, the reports are just different
> ways of reporting data that belongs to one (or more? not 100% sure) of
> those sets then.
> 
> And the example below works because you have different collections on
> your device here but that's largely orthogonal to the use of reports.

I think this came from my misunderstanding of the role of Report IDs
and Application Collections (not that I'm sure to have undertsood everything).
The paragraph has been rewritte, please double check.
I'm glossing on the fact that the same Collection can have different Report IDs
inside (btw: is this correct? And if yes, is this something that is done, in practice?).

>> +
>> +Consider the following HID report descriptor::
>> +
>> +  05 01 09 02 A1 01 85 01 05 09 19 01 29 05 15 00
>> +  25 01 95 05 75 01 81 02 95 01 75 03 81 01 05 01
>> +  09 30 09 31 16 00 F8 26 FF 07 75 0C 95 02 81 06
>> +  09 38 15 80 25 7F 75 08 95 01 81 06 05 0C 0A 38
>> +  02 15 80 25 7F 75 08 95 01 81 06 C0 05 01 09 02
>> +  A1 01 85 02 05 09 19 01 29 05 15 00 25 01 95 05
>> +  75 01 81 02 95 01 75 03 81 01 05 01 09 30 09 31
>> +  16 00 F8 26 FF 07 75 0C 95 02 81 06 09 38 15 80
>> +  25 7F 75 08 95 01 81 06 05 0C 0A 38 02 15 80 25
>> +  7F 75 08 95 01 81 06 C0 05 01 09 07 A1 01 85 05
>> +  05 07 15 00 25 01 09 29 09 3E 09 4B 09 4E 09 E3
>> +  09 E8 09 E8 09 E8 75 01 95 08 81 02 95 00 81 01
>> +  C0 05 0C 09 01 A1 01 85 06 15 00 25 01 75 01 95
>> +  01 09 3F 81 06 09 3F 81 06 09 3F 81 06 09 3F 81
>> +  06 09 3F 81 06 09 3F 81 06 09 3F 81 06 09 3F 81
>> +  06 C0 05 0C 09 01 A1 01 85 03 09 05 15 00 26 FF
>> +  00 75 08 95 02 B1 02 C0
>> +
>> +After parsing it (try to parse it on your own using
>> +the suggested tools!)
>> +one can see that the device presents two mouses
>> +(Reports IDs 1 and 2, respectively),
>> +a Keypad (Report ID 5) and two consumer controls
>> +(Report IDs 6 and 3).
>> +The data sent for each of these report ids
>> +will begin with the Report ID byte, and will be followed
>> +by the corresponding information. For example, the
>> +report defined for the last consumer
>> +control::
>> +
>> +  0x05, 0x0C,        // Usage Page (Consumer)
>> +  0x09, 0x01,        // Usage (Consumer Control)
>> +  0xA1, 0x01,        // Collection (Application)
>> +  0x85, 0x03,        //   Report ID (3)
>> +  0x09, 0x05,        //   Usage (Headphone)
>> +  0x15, 0x00,        //   Logical Minimum (0)
>> +  0x26, 0xFF, 0x00,  //   Logical Maximum (255)
>> +  0x75, 0x08,        //   Report Size (8)
>> +  0x95, 0x02,        //   Report Count (2)
>> +  0xB1, 0x02,        //   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)
>> +  0xC0,              // End Collection
>> +
>> +will be of three bytes: the first for the Report ID (5), the next two
>> +for the headphone, with two (``Report Count (2)``) bytes
>> +(``Report Size (8)``) each ranging from 0 (``Logical Minimum (0)`` to 255
>> +(``Logical Maximum (255)``).
>> +
>> +
>> +Events
>> +======
>> +
>> +One can expect that different ``/dev/input/event*`` are created for different
>> +Report IDs. 
> 
> as Benjamin already mentioned, this is incorrect given how the kernel
> works, so definitely needs rewording.

Done, please double check.

> 
>> Going back to the mouse example, and repeating the sequence where
>> +one clicks and holds button 1, then clicks and holds button 2,
>> +releases button 1, and finally releases button 2, one gets::
>> +
>> +  marco@sun:~> sudo evtest /dev/input/event4
>> +  Input driver version is 1.0.1
>> +  Input device ID: bus 0x3 vendor 0x3f0 product 0x94a version 0x111
>> +  Input device name: "PixArt HP USB Optical Mouse"
>> +  Supported events:
>> +    Event type 0 (EV_SYN)
>> +    Event type 1 (EV_KEY)
>> +      Event code 272 (BTN_LEFT)
>> +      Event code 273 (BTN_RIGHT)
>> +      Event code 274 (BTN_MIDDLE)
>> +    Event type 2 (EV_REL)
>> +      Event code 0 (REL_X)
>> +      Event code 1 (REL_Y)
>> +      Event code 8 (REL_WHEEL)
>> +      Event code 11 (REL_WHEEL_HI_RES)
>> +    Event type 4 (EV_MSC)
>> +      Event code 4 (MSC_SCAN)
>> +  Properties:
>> +  Testing ... (interrupt to exit)
>> +  Event: time 1687254626.454252, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90001
>> +  Event: time 1687254626.454252, type 1 (EV_KEY), code 272 (BTN_LEFT), value 1
>> +  Event: time 1687254626.454252, -------------- SYN_REPORT ------------
>> +  Event: time 1687254627.342093, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90002
>> +  Event: time 1687254627.342093, type 1 (EV_KEY), code 273 (BTN_RIGHT), value 1
>> +  Event: time 1687254627.342093, -------------- SYN_REPORT ------------
>> +  Event: time 1687254627.974282, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90001
>> +  Event: time 1687254627.974282, type 1 (EV_KEY), code 272 (BTN_LEFT), value 0
>> +  Event: time 1687254627.974282, -------------- SYN_REPORT ------------
>> +  Event: time 1687254628.798240, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90002
>> +  Event: time 1687254628.798240, type 1 (EV_KEY), code 273 (BTN_RIGHT), value 0
>> +  Event: time 1687254628.798240, -------------- SYN_REPORT ------------
>> +
>> +
>> +When everything works well
>> +==========================
>> +
>> +* The HID report descriptor makes sense;
>> +* It is possible to verify, by reading the raw hid data, that
>> +  the HID report descriptor *does  match* what is sent by the device;
>> +* The HID report descriptor does not need any "quirk"s (see later on)
> 
> "quirks", can have that inside the quotes

Ok

> 
>> +* For any Report ID a corresponding ``/dev/input/event*`` is created,
>> +  and the events there match what you would expect
>> +
>> +When something does not work
>> +============================
> 
> you can fold the "everything works" section into here with some prelude
> of "There can be a number of reasons for why a device does not behave
> correctly, for example..."
> 

I've tried to do that, even if not having a shining "everything magically works"
section make me sad.


>> +
>> +Sometimes not everything does work as it should.
> 
> 
>> +
>> +Quirks
>> +------
>> +
>> +A possible reason is that the HID
>> +has some common quirk. Should this be the case,
>> +it sould be enough to add the required quirk,
>> +in the kernel, for the device at hand.
> 
> this phrasing is a bit ambiguous, because in the first sentence the
> quirks is the bug in the device, but in the second sentence the quirk
> is something the kernel provides. You can rephrase this less ambiguously
> with something like:
> 
> 	There are some known peculiarities of HID devices that the kernel
>   knows how to fix - these are called the HID quirks and a list of those
>   are available in `include/linux/hid.h`.
> 

Thank you!

> 
>> +This can be done in file drivers/hid/hid-quirks.c .
>> +How to do it should be straightforward after looking into the file.
>> +
>> +The list of currently defined quirks, from
>> +include/linux/hid.h , is
>> +
>> + * ``HID_QUIRK_NOTOUCH``, defined as ``BIT(1)``:
>> + * ``HID_QUIRK_IGNORE``, defined as ``BIT(2)``:
>> + * ``HID_QUIRK_NOGET``, defined as ``BIT(3)``:
>> + * ``HID_QUIRK_HIDDEV_FORCE``, defined as ``BIT(4)``:
>> + * ``HID_QUIRK_BADPAD``, defined as ``BIT(5)``:
>> + * ``HID_QUIRK_MULTI_INPUT``, defined as ``BIT(6)``:
>> + * ``HID_QUIRK_HIDINPUT_FORCE``, defined as ``BIT(7)``:
>> + * ``HID_QUIRK_ALWAYS_POLL``, defined as ``BIT(10)``:
>> + * ``HID_QUIRK_INPUT_PER_APP``, defined as ``BIT(11)``:
>> + * ``HID_QUIRK_X_INVERT``, defined as ``BIT(12)``:
>> + * ``HID_QUIRK_Y_INVERT``, defined as ``BIT(13)``:
>> + * ``HID_QUIRK_SKIP_OUTPUT_REPORTS``, defined as ``BIT(16)``:
>> + * ``HID_QUIRK_SKIP_OUTPUT_REPORT_ID``, defined as ``BIT(17)``:
>> + * ``HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP``, defined as ``BIT(18)``:
>> + * ``HID_QUIRK_HAVE_SPECIAL_DRIVER``, defined as ``BIT(19)``:
>> + * ``HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE``, defined as ``BIT(20)``:
>> + * ``HID_QUIRK_FULLSPEED_INTERVAL``, defined as ``BIT(28)``:
>> + * ``HID_QUIRK_NO_INIT_REPORTS``, defined as ``BIT(29)``:
>> + * ``HID_QUIRK_NO_IGNORE``, defined as ``BIT(30)``:
>> + * ``HID_QUIRK_NO_INPUT_SYNC``, defined as ``BIT(31)``:
> 
> You *definitely* don't want to include this here because it will get out
> of sync (and the actual bit value just doesn't matter anyway). Use one
> or two as example just so a reader gets familiar with the
> HID_QUIRK_FOOBAR notation and can use grep to find where quirks are
> used and go from there.

Following Benjamin, I've brough in the comment I propose to
add in include/linux/hid.h

> 
>> +
>> +
>> +FIXME: ADD A SHORT EXPLANATION FOR EACH QUIRK
> 
> as Benjamin already mentioned, this should be documented in situ and
> linked to from here rather than split across multiple files.
> 

See above

>> +
>> +Quirks for USB devices can be specified run-time,
> 
> "at runtime" 

I've changed this into "Quirks for USB devices can be specified 
while loading the usbhid module", 

> 
>> +see ``modinfo usbhid``, although the proper fix
>> +should go into hid-quirks.c and be submitted upstream.
>> +Quirks for other busses need to go into hid-quirks.c
>> +
>> +Fixing the HID report descriptor
>> +--------------------------------
>> +
>> +Should you need to patch the HID report descriptor
>> +the easiest way is to resort to eBPF, as described
>> +in Documentation/output/hid/hid-bpf.rst.
>> +
>> +Basically, you can change any byte of the original report descriptor.
>> +The examples in samples/hid should be relatively straightforward,
>> +see e.g. samples/hid_mouse.bpf.c::
>> +
>> +  SEC("fmod_ret/hid_bpf_rdesc_fixup")
>> +  int BPF_PROG(hid_rdesc_fixup, struct hid_bpf_ctx *hctx)
>> +  {
>> +    ....
>> +       data[39] = 0x31;
>> +       data[41] = 0x30;
>> +    return 0;
>> +  }
>> +
>> +Of course this can be also done within the kernel source
>> +code, see e.g. drivers/hid/hid-aureal.c or
>> +drivers/hid/hid-samsung.c for a slightly more complex file.
>> +
>> +
>> +
>> +Modifying on the fly the transmitted data
>> +-----------------------------------------
> 
> "Modifying the transmitted data on the fly"
> 

Thank you

>> +
>> +It is also possible, always using eBPF, to modify
> 
> 
>> +on the fly the data exchanged with the device.
>> +See, again, the examples is samples/hid.
> 
> Using eBPF it is also possible to modify the data exchanged
> with the device. See again the examples in samples/hid

+1

