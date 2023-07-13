Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4539B75254A
	for <lists+linux-input@lfdr.de>; Thu, 13 Jul 2023 16:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbjGMOg3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jul 2023 10:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjGMOg3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jul 2023 10:36:29 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2058.outbound.protection.outlook.com [40.107.7.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0CEB1734;
        Thu, 13 Jul 2023 07:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wsck7C6KITxZ0w+sSlzYq+QLheua31IMu2CSWEgC2R+MGxE7RT8IoAnhkHJ9cqhADiBfp9menGFb/GevlrF02sdMBaE8ybr/fn9SLpqZlglDwNkw3BBVCJykAgq3txudizZUwLdFSxl/P0569VXcI4PtrXjXojjOZbZa5hkJDznJMi1cejsSGcJzBtyY5FxYfJaVvAGvKOMwem9KQ2q8tpQ3Jc4gl+enzr4OqBBOkQ9weFROzdPBduCUaCbvL+JsLfRx9BPGZA47FW6g4pxeCsZSsQFPdx9RyDK+dPp2YyikEQDJ7x1np9RoRJ0MiurUmczskh7WznyeW7dUeVnotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sy/heUV/2MMMy93NhTE5B2EhSQNoHpKoGE2v56od+ZM=;
 b=hE3rgVrNwMuwAPXFshCr/A1wJufyCBlWwwkBdA1h0jvuWk+MFDtGNoIZbzJJM3LHzcsClIULk991P2xyunupdBO/XuQGZMCSV91wO/WAlODLhHfUXDywhu0I1Ssfp9nY2qiX1qhuvJ71BT2hhQxxfjE7F4ywtsVP/Ub9PhH58qGtePL8XX+kDYBQsSuCjl/9QtCD6o2n6jsI3fVZ2jh5smW1g3ZJHf3GDz/MqahM34emTqS8d5CYBfp3hC9i3W9WKl7Dv6W9ZbD1FR8tB8X1i6M8ZPP3uFbtvpzGeQkAafeHGOGK5g1612c7lyHOmB1wQmR/dSAVZiPs/jy6PBddYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy/heUV/2MMMy93NhTE5B2EhSQNoHpKoGE2v56od+ZM=;
 b=aykOSbD6Voi5tXWkXI8N4XYwyijHtQfgFnkhOIxx9vMLuvNVDphBwL/ie3yPuCWVN+0S/TOfJpqTnyC5cNX7ltlPuR4q7wMBD4gFmUERS1Hu7SvHzMRUD14damflQm64CSwFEV9LJbrE7AianVe8XuB7ZJqonh5GzrsElAlUY1qctjuxtOZEgN+GLZgc50dgnxpo+1eqTQI7RmYDUo0l2cYOCl7GHuYKx3GQ/PAYBgV1vyVT3IDF7gHVErrbbpAiOjdbENj9UdX7L01gOmbHNq0cvDc2z3mRtwfxj4D9TWf0zOdsFbf3uY4BpIMWLjELUfgCRhcgO0EAMIatSMfGmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from PAXP251MB0348.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:20b::10)
 by DU0P251MB0411.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:343::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Thu, 13 Jul
 2023 14:36:20 +0000
Received: from PAXP251MB0348.EURP251.PROD.OUTLOOK.COM
 ([fe80::7b05:e472:3184:13f6]) by PAXP251MB0348.EURP251.PROD.OUTLOOK.COM
 ([fe80::7b05:e472:3184:13f6%4]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 14:36:20 +0000
Message-ID: <2c2a03ac-cd11-7893-4b89-b88845e0f189@polimi.it>
Date:   Thu, 13 Jul 2023 16:36:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Marco Morandini <marco.morandini@polimi.it>
Subject: Re: [PATCH v2] HID: Add introduction about HID for non-kernel
 programmers
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <70fdef05-d3b8-e24b-77be-901bd5be369e@polimi.it>
 <20230627060437.GA726439@quokka>
 <dc79f50c-0539-0d7c-129a-d02d5bbee4d5@polimi.it>
 <20230710021034.GA600582@quokka>
Content-Language: en-US, it
In-Reply-To: <20230710021034.GA600582@quokka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0123.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::20) To PAXP251MB0348.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:20b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP251MB0348:EE_|DU0P251MB0411:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d491d90-c48d-43a7-e683-08db83ae865a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ubxiOysjIuYBNK4wcQFi1YkJzstUCUXM6CpRTEiWVckUSnPGnOWFTStV7VLYaDsqhOh4JJtgUTpKTu/QuPSZdwsdf8Vx/+QD1EvEHU40WF8sgahvghXLYpS+3L6SzxvNSPgu/Q3IOaW6iOhTfN2B4odBu6mesN1JWplElWBW7ikgGWI0sPrrPl3vMTHOgKtmXyWttefcSUy4ZxDl+YboPCACDQA+H3Y8VNYhz+AEvBpuku36vkOMqYREBn8DZ7Pnop6fDx3grW1L+snfUfuJV0MYYvgTrbK7mSaDjwcW2RcbUSsX4QvRAmPTJFcnSx2qRkAoZqlNwqHz5INezODrICCpmHarXvvVVVnPcy5SkLUHP/oZL7N84g9RryK09w907f7kkHsCkBq14uYO4XGwKNIOhWA1oX3jOOiAh77zsEAzodUAj+xhMtX6Y77OpRkrlvDC++7e8HESqJQdydyqxASLPsY4K1IC1A7KHf2H9gnnfZoxnQG+j47dPTjPQVrUWrGaXl+XfxUjir5uCHaNwleFLQiPZlB8WMLkcEm81W3a4WaugORiKwNAx1sEDb9i1xjV3ireTf4rN4CkrZITKfUtbS8qFJ67Xx7YJxXJOa30VBQ1QIKV4vXGBi+vJJJT4ivt6E7o//Rl36gkSBvWwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP251MB0348.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(38100700002)(31686004)(66899021)(478600001)(6486002)(54906003)(26005)(2616005)(66574015)(83380400001)(31696002)(86362001)(36756003)(66946007)(2906002)(30864003)(6506007)(966005)(186003)(6512007)(8936002)(5660300002)(41300700001)(316002)(66556008)(6916009)(4326008)(44832011)(8676002)(66476007)(786003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em1CZUV5L3V4UWxldEtzMU5DUTBjTjAxd3EzWk04Q3ZPcFRzSnFsK1puUldw?=
 =?utf-8?B?SThtQ1BjN0FVZmxKeWUvaUduSFJEUTBtTlNKQ2RTTlRnMWRMeWlHa3RTbFBH?=
 =?utf-8?B?YWhiUjkxSXNUN2dmTXh6RTdVaHFvODFJSm9Fbmd1WXNGK2xsNHFjS2N2RFlK?=
 =?utf-8?B?U2g0aWVicXJFRFp6V0I2cDA1NytrSjlma2ZiSFVRRDlqR0NVR0RBQnNZSDN0?=
 =?utf-8?B?L2lYWld6eDZaMjhnMW1MVDJJb3h0SW56cml0ZFA3bHVVMDRoblhBMlh6eXN1?=
 =?utf-8?B?dm5hTFZvT2wyeDB4Sm5YRkdIMHVTTTRWVkR1MU55cVNLMnlScW5WR2k4TE9m?=
 =?utf-8?B?ZkltQUpwS1RoOXJZVk9KNkJrQnlvWE5NMm1uL3BFT05tQnd6SXN0cXh1dmRW?=
 =?utf-8?B?Q2NIbEFSUzJmTXA2ZFJNMW9WL09ZTVZUc2R2MnM0eUNjNFV4bVQxM3NtaDV5?=
 =?utf-8?B?TWJjb3cwMmNiNzVVcDdPeEtlTHZ2Z0s3RGR0THFSSWtQNVZpK1hyTnhobDNl?=
 =?utf-8?B?VkNmNGsyd3lHR0luWTdKMDg5d2t2VUlCdk9ZbGR1Rzd0dnlET2lISno5MTd4?=
 =?utf-8?B?WWhzWHpQMzZFL1VMaDBac05yN0hoUVh6MVBpUkhIam9Pb1VWRmY4T1huV1Vz?=
 =?utf-8?B?ZHRtaW5GOUhtNXJLRlNaZTVxZGtxeHJNb0tVTm0xWUk4eDhtZDAxVmcxNU04?=
 =?utf-8?B?YTk3RU5hMXdkR1BsNGpReGFWdE5ZWTBxN3k3eDA2a3l0bEhzcmNKVEpQNzdz?=
 =?utf-8?B?UDJXWlN2clhDaldlT2djTXhVdG1Oc0RDZm1OQTNPeG96bVVCUWhKWEd2OFU2?=
 =?utf-8?B?cHRpQ1lLK0sydnU4V2JBS0IrdjR3Vlg1UU90NU5ob3hVRGdnaElLMGl4K1F6?=
 =?utf-8?B?cElTRjZDY0FDem5CeHFoY2V1KytXRlAwVjNWeTJWdkI0VVVDc0dNWG9FL2dB?=
 =?utf-8?B?aW9rVXgzcmxYNlp6NHVNTmhFVUlJL3ZVaEdCRnllSEZJbG54TTFCUWpRYlVK?=
 =?utf-8?B?VzFpM0lwVDh5aGxCdHIvYWRWb2RaeUNSeG14UHliVjV0VTFjSHYzWk81eFFo?=
 =?utf-8?B?UFVEL0VPRWIzNnc4M0NZTUhxMU5TaUkzbzFLc1c5b0dwaHFaRStUenpxUko2?=
 =?utf-8?B?Y2duV3ZZMGhhZWtsWUdKekorRE4veWx0K0ZSeitwVVBKVkRXTDV5Z0ZpVHhp?=
 =?utf-8?B?VFdYT0dzamdKODBWRUlPWUhCeUNFdmYyK1FldmRrTUpmc1puRGJQUHV5OFA5?=
 =?utf-8?B?YmhaRXpORG5QKzZ5VHFVL3FZR0JQS1AwcE8zOTVJK0drclJXcU5TUFpYS2I4?=
 =?utf-8?B?bWJGd0JIWnhwNTZjSStCQzRWNlM0U0VzVGlCZzF0bFpsM3dWb1JVeC94VTBB?=
 =?utf-8?B?TkVrMVd0dThGY2pKeWYxR2FFLzQ3L09wVzhaYjJnWTRFY2t4U3V4VmpSVndr?=
 =?utf-8?B?UXp3K1JqcHJQMTlUTnJuTFRFcGRCWDdoYXZBL0RNcktzMnVkeEtDMFdpU2NG?=
 =?utf-8?B?WnlmckR0R1ZNV1VxUkRtOEJ4NHNYdUx4cFFHT2hzcHphUmtHWGRIaldxbUxM?=
 =?utf-8?B?L1RvMVRvR2MxZWdyUTk3NkkwZ1dZbVhydXlXWWEvSUZkakxXTXZ3OHV4Mmhy?=
 =?utf-8?B?VVZubjlwclVtbCtUWFlRSEQzYnAzeWVScTkwTGxxbWx2L3UvdlhNajNSMGRs?=
 =?utf-8?B?aFp1ek5kNWhiUHk2Q01qc1MybFE2aHEyUFUwaU5DVkhpYVc3b2lLcGwrdG02?=
 =?utf-8?B?QTB1VDN3TXIwZ1JESmJWQnlFRmlMTXRjWDAwSkhFRGp2WkVtdEp3ZGdHbUVM?=
 =?utf-8?B?dEo5elIvUGxtSjBCdkFSN1o4c1M2ZUYzQ1hOM1k4emdQZ1M2Q0liUEp0LzNE?=
 =?utf-8?B?b29reUIrUlFPT3l3Ymgzelk5cGNVRVRwS01mUXZoOGFDM1VWaWZaT1ZyaWRj?=
 =?utf-8?B?Wjh2VU9wcCtEQU42UjQrZGdsZ1p3QUl0Q05MTkxGY1JiV29tV0ZDeE5MMS9i?=
 =?utf-8?B?Nm41TWYxS1p4bkhqZnlaL0hiMVJ5aVNKRjNZek5GNnFHL05kM21vTDl3U1ls?=
 =?utf-8?B?ZTNIb3VlWUFldTZFdDhXKzhvK0NKUzJhci9wMStEVUZQcUlWTEJMTEM0ZUFt?=
 =?utf-8?Q?cnjYoJuyT1TNlTIhJFbcEC4P2?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d491d90-c48d-43a7-e683-08db83ae865a
X-MS-Exchange-CrossTenant-AuthSource: PAXP251MB0348.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 14:36:20.6703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZBXXbX2mx1xcNOwJzu2Ggi15dIFLbtQdo/qLZMN2E4GeaFB9MNSBIRVfxKv0O9Nt+LRpUYFD9CsNzbv+JPnSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P251MB0411
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> See my other email but this largely comes down to where you want the
> cut-off to be. You can link to each individual section but anyone
> actually attempting this would have to read the spec anyway.
> 
> So IMO it would be perfectly acceptable to just state "Report descriptor
> parsing is detailed in the Hid spec section 6.2.2" and not linking each
> item separately. For me personally it is generally more important to
> know that "those bits are that" because that's where the early errors
> are being made. I can usually find what "that" means myself :)
I mostly agree with you. However, I do hope that
these additional details, in this introduction, can help easing the
pain one feels when dealing with those pesky manuals for the first time.
I mean: perhaps, once you have understood how they are structured,
they can become your bread an butter (well... not for me, but this is not the point), 
but the first impact can nevertheless be discouraging, especially if one
tries to take some shortcut by not reading everything from page 1.

> If you really want to (so the blame for bug splits between us :) feel
> free to use Co-authored-by if you want though, I think that's both
> common enough and appropriate.

Ok, I'll go for Co-authored-by. It' more than fair, and
I would never neglect the chance of sharing the blame with someone else ;)

>> +Optional stuff: the HID report descriptor can be read also by
> 
> s/Optional stuff: //
> unless you're talking about cooking poultry, "stuff" should
> generally be avoided :)
> 

Ok, "Optional:" alone. 


>> +    $ ./hid-decode /sys/bus/hid/devices/0003\:093A\:2510.0002/report_descriptor
>> +    # device 0:0
>> +    # 0x05, 0x01,		     // Usage Page (Generic Desktop)	    0
>> +    # 0x09, 0x02,		     // Usage (Mouse)			    2
>> +    # 0xa1, 0x01,		     // Collection (Application)	    4
>> +    # 0x09, 0x01,		     // Usage (Pointer)		    	    6
>> +    # 0xa1, 0x00,		     // Collection (Physical)  	    	    8
>> +    # 0x05, 0x09, 		     //	Usage Page (Button)		   10
>> + what follows is a button
> 
> btw, did you check the proper rendering of this page? IIRC in RST
> documents you need an empty line after a code block.
> 

The current version is with a unique code block, and renders like this

https://home.aero.polimi.it/morandini/Downloads/Screenshot_20230712_185907.png

With a unique code block but a newline in between the report and the
explanation I get

https://home.aero.polimi.it/morandini/Downloads/Screenshot_20230712_190335.png

that I find somewhat more dispersive.

If I interpose multiple code blocks and explanations (as text) unfortunately
spynx add a colon at the end of every paragraph, as if the text was the explanation of the
code block below, and not above:

https://home.aero.polimi.it/morandini/Downloads/Screenshot_20230712_190656.png

I've not understood how to get rid of that colon, and I would prefer to leave the
explanation _after_ the corresponding code block, and not move it before.

Let me know what you think.

>> + See HID spec Sec. 6.2.2.5 "Input, Output, and Feature Items
> 
> missing closing quotes

Added

>> +    # 0x81, 0x01, 		     //	Input (Cnst,Arr,Abs)		   30
>> + and take Constant (Cnst) values i.e. they can be ignored
> 
> full stop at the end, since you start a new sentence below.
> 

Added

>> +    # 0x15, 0x81, 		     //	Logical Minimum (-127)  	   40
>> +    # 0x25, 0x7f, 		     //	Logical Maximum (127)		   42
>> + each of them can send values ranging from -127 up to including 127
>> +
>> +    # 0x75, 0x08, 		     //	Report Size (8) 		   44
>> + is represented by eight bits
> 
> "which is..."
> 

Ok

>> +
>> +    # 0x95, 0x03, 		     //	Report Count (3)		   46
>> + and there are three of those eight bits, matching X, Y and Wheel
> 
> full stop at the end, since you start a new sentence below.
> 

Added

>> +This Report Descriptor tells us that the mouse input will be
>> +transmitted using four bytes: the first one for the buttons (three
>> +bits used, five for padding), the last three for the mouse X, Y and
>> +wheel changes, respectively.
> 
> I wonder if here we should mention something like:
> "This particular device only has one HID report so it may (and does)
> omit the Report ID. Devices that can send multiple different HID reports
> must send the Report ID as the first byte of each report."

The problem is that, with the current document structure,
Report IDs are introduced later, in section
"Collections, Report IDs and Evdev events".
There we have the sentence "A device with only one supporteHID report 
(like the mouse example above) may omit the report ID."

Before that section the reader does not know what
a Report ID is.

Thus, I could add the sentence you are suggesting, but
changing it into something like

This particular device only has one HID report so it may (and does)
omit the Report ID (see Section "Collections, Report IDs and Evdev events"). 
Devices that can send multiple different HID reports
must send the Report ID as the first byte of each report.

I don't know whether we are clarifying of confusing the matter,
and I propose to leave things as they are now.

>> +Collections, Report IDs and Evdev events
>> +========================================
>> +
>> +A single device can logically group data into different, independent
> 
> superfluous comma
> 

ok

>> +sets, called a *Collection*. Collections can be nested, and there are
> 
> superfluous commas
> 

ok

>> +different types of collections (see the HID spec 6.2.2.6
>> +"Collection, End Collection Items" for details).
> 
> 
> Going with what I mentioned above: you provide the exact location for
> the collection spec here but I don't think it'll be very useful - anyone
> needing to know that detail needs to read through most of 6.2.2 anyway
> and the Collection subsection is easy enough to find.
> 
> This isn't to say you need to remove the reference, just that providing
> that level of detail probably has little benefit to most readers.
> 

The benefit, from my point of view, is to help the reader understanding
the overall structure of the document. 
It's true: one will find 6.2.2.6 nonetheless, but why not help him?


>> +Collections, (with Report IDs 6 and 3, respectively). Note, however,
>> +that you can have different Report IDs for the same Application
> 
> s/you/a device/
> 

Ok

>> +Note: if ``libinput`` is not available on your system try using
>> +``evemu-record``.
> 
> this should probably read "If ``libinput record`` is not avaiable..."
> because it's often in a seprate package (libinput-utils on Fedora for
> example).

Ok.

Thank you!

Marco


> 
> Cheers,
>   Peter
> 
>> +
>> +When something does not work
>> +============================
>> +
>> +There can be a number of reasons why a device does not behave
>> +correctly. For example
>> +
>> +* The HID report descriptor provided by the HID device may be wrong
>> +  because e.g.
>> +
>> +  * it does not follow the standard, so that the kernel
>> +    will not able to make sense of the HID report descriptor;
>> +  * the HID report descriptor *does not match* what is actually
>> +    sent by the device (this can be verified by reading the raw HID
>> +    data);
>> +* the HID report descriptor may need some "quirks" (see later on).
>> +
>> +As a consequence, a ``/dev/input/event*`` may not be created
>> +for each Application Collection, and/or the events
>> +there may not match what you would expect.
>> +
>> +
>> +Quirks
>> +------
>> +
>> +There are some known peculiarities of HID devices that the kernel
>> +knows how to fix - these are called the HID quirks and a list of those
>> +is available in `include/linux/hid.h`.
>> +
>> +Should this be the case, it should be enough to add the required quirk
>> +in the kernel, for the HID device at hand. This can be done in the file
>> +`drivers/hid/hid-quirks.c`. How to do it should be relatively
>> +straightforward after looking into the file.
>> +
>> +The list of currently defined quirks, from `include/linux/hid.h`, is
>> +
>> +.. kernel-doc:: include/linux/hid.h
>> +   :doc: HID quirks
>> +
>> +Quirks for USB devices can be specified while loading the usbhid module,
>> +see ``modinfo usbhid``, although the proper fix should go into
>> +hid-quirks.c and **be submitted upstream**.
>> +See Documentation/process/submitting-patches.rst for guidelines on how
>> +to submit a patch. Quirks for other busses need to go into hid-quirks.c.
>> +
>> +Fixing HID report descriptors
>> +-----------------------------
>> +
>> +Should you need to patch HID report descriptors the easiest way is to
>> +resort to eBPF, as described in Documentation/hid/hid-bpf.rst.
>> +
>> +Basically, you can change any byte of the original HID report
>> +descriptor. The examples in samples/hid should be a good starting point
>> +for your code, see e.g. `samples/hid/hid_mouse.bpf.c`::
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
>> +Of course this can be also done within the kernel source code, see e.g.
>> +`drivers/hid/hid-aureal.c` or `drivers/hid/hid-samsung.c` for a slightly
>> +more complex file.
>> +
>> +Check Documentation/hid/hidreport-parsing.rst if you need any help
>> +navigating the HID manuals and understanding the exact meaning of
>> +the HID report descriptor hex numbers.
>> +
>> +Whatever solution you come up with, please remember to **submit the
>> +fix to the HID maintainers**, so that it can be directly integrated in
>> +the kernel and that particular HID device will start working for
>> +everyone else. See Documentation/process/submitting-patches.rst for
>> +guidelines on how to do this.
>> +
>> +
>> +Modifying the transmitted data on the fly
>> +-----------------------------------------
>> +
>> +Using eBPF it is also possible to modify the data exchanged with the
>> +device. See again the examples in `samples/hid`.
>> +
>> +Again, **please post your fix**, so that it can be integrated in the
>> +kernel!
>> +
>> +Writing a specialized driver
>> +----------------------------
>> +
>> +This should really be your last resort.
>> +
>> +
>> +.. rubric:: Footnotes
>> +
>> +.. [#hidraw] read hidraw: see Documentation/hid/hidraw.rst and
>> +  file `samples/hidraw/hid-example.c` for an example.
>> +  The output of ``hid-example`` would be, for the same mouse::
>> +
>> +    $ sudo ./hid-example
>> +    Report Descriptor Size: 52
>> +    Report Descriptor:
>> +    5 1 9 2 a1 1 9 1 a1 0 5 9 19 1 29 3 15 0 25 1 75 1 95 3 81 2 75 5 95 1 81 1 5 1 9 30 9 31 9 38 15 81 25 7f 75 8 95 3 81 6 c0 c0
>> +
>> +    Raw Name: PixArt USB Optical Mouse
>> +    Raw Phys: usb-0000:05:00.4-2.3/input0
>> +    Raw Info:
>> +            bustype: 3 (USB)
>> +            vendor: 0x093a
>> +            product: 0x2510
>> +    ...
>> --- /dev/null	2023-06-28 09:46:06.188159532 +0200
>> +++ Documentation/hid/hidreport-parsing.rst	2023-06-27 22:56:18.886315875 +0200
>> @@ -0,0 +1,49 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +========================================
>> +Manual parsing of HID report descriptors
>> +========================================
>> +
>> +Consider again the mouse HID report descriptor
>> +introduced in Documentation/hid/hidintro.rst::
>> +
>> +  $ hexdump -C /sys/bus/hid/devices/0003\:093A\:2510.0002/report_descriptor
>> +  00000000  05 01 09 02 a1 01 09 01  a1 00 05 09 19 01 29 03  |..............).|
>> +  00000010  15 00 25 01 75 01 95 03  81 02 75 05 95 01 81 01  |..%.u.....u.....|
>> +  00000020  05 01 09 30 09 31 09 38  15 81 25 7f 75 08 95 03  |...0.1.8..%.u...|
>> +  00000030  81 06 c0 c0                                       |....|
>> +  00000034
>> +
>> +and try to parse it by hand.
>> +
>> +Start with the first number, 0x05: it carries 2 bits for the
>> +length of the item, 2 bits for the type of the item and 4 bits for the
>> +function::
>> +
>> +  +----------+
>> +  | 00000101 |
>> +  +----------+
>> +          ^^
>> +          ---- Length of data (see HID spec 6.2.2.2)
>> +        ^^
>> +        ------ Type of the item (see HID spec 6.2.2.2, then jump to 6.2.2.7)
>> +    ^^^^
>> +    --------- Function of the item (see HID spec 6.2.2.7, then HUT Sec 3)
>> +
>> +In our case, the length is 1 byte, the type is ``Global`` and the
>> +function is ``Usage Page``, thus for parsing the value 0x01 in the second byte
>> +we need to refer to HUT Sec 3.
>> +
>> +The second number is the actual data, and its meaning can be found in
>> +the HUT. We have a ``Usage Page``, thus we need to refer to HUT
>> +Sec. 3, "Usage Pages"; from there, one sees that ``0x01`` stands for
>> +``Generic Desktop Page``.
>> +
>> +Moving now to the second two bytes, and following the same scheme,
>> +``0x09`` (i.e. ``00001001``) will be followed by one byte (``01``)
>> +and is a ``Local`` item (``10``). Thus, the meaning of the remaining four bits
>> +(``0000``) is given in the HID spec Sec. 6.2.2.8 "Local Items", so that
>> +we have a ``Usage``. From HUT, Sec. 4, "Generic Desktop Page",  we see that
>> +0x02 stands for ``Mouse``.
>> +
>> +The following numbers can be parsed in the same way.
>> diff --git a/Documentation/hid/index.rst b/Documentation/hid/index.rst
>> index b2028f382f11..af02cf7cfa82 100644
>> --- a/Documentation/hid/index.rst
>> +++ b/Documentation/hid/index.rst
>> @@ -7,6 +7,7 @@ Human Interface Devices (HID)
>>  .. toctree::
>>     :maxdepth: 1
>>  
>> +   hidintro
>>     hiddev
>>     hidraw
>>     hid-sensor
>> diff --git a/include/linux/hid.h b/include/linux/hid.h
>> index 7f2e8ba7d783..8d1699f355ec 100644
>> --- a/include/linux/hid.h
>> +++ b/include/linux/hid.h
>> @@ -341,6 +341,29 @@ struct hid_item {
>>   */
>>  #define MAX_USBHID_BOOT_QUIRKS 4
>>  
>> +/**
>> + * DOC: HID quirks
>> + * | @HID_QUIRK_NOTOUCH:
>> + * | @HID_QUIRK_IGNORE: ignore this device
>> + * | @HID_QUIRK_NOGET:
>> + * | @HID_QUIRK_HIDDEV_FORCE:
>> + * | @HID_QUIRK_BADPAD:
>> + * | @HID_QUIRK_MULTI_INPUT:
>> + * | @HID_QUIRK_HIDINPUT_FORCE:
>> + * | @HID_QUIRK_ALWAYS_POLL:
>> + * | @HID_QUIRK_INPUT_PER_APP:
>> + * | @HID_QUIRK_X_INVERT:
>> + * | @HID_QUIRK_Y_INVERT:
>> + * | @HID_QUIRK_SKIP_OUTPUT_REPORTS:
>> + * | @HID_QUIRK_SKIP_OUTPUT_REPORT_ID:
>> + * | @HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP:
>> + * | @HID_QUIRK_HAVE_SPECIAL_DRIVER:
>> + * | @HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE:
>> + * | @HID_QUIRK_FULLSPEED_INTERVAL:
>> + * | @HID_QUIRK_NO_INIT_REPORTS:
>> + * | @HID_QUIRK_NO_IGNORE:
>> + * | @HID_QUIRK_NO_INPUT_SYNC:
>> + */
>>  /* BIT(0) reserved for backward compatibility, was HID_QUIRK_INVERT */
>>  #define HID_QUIRK_NOTOUCH			BIT(1)
>>  #define HID_QUIRK_IGNORE			BIT(2)




