Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBB2B73A990
	for <lists+linux-input@lfdr.de>; Thu, 22 Jun 2023 22:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjFVUh2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Jun 2023 16:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjFVUh1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Jun 2023 16:37:27 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273B1D3;
        Thu, 22 Jun 2023 13:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXSlTPgsFnqD5fdcB+8OkLV54qAJTpqAfvZtqrX0RrHXBJSAoFCKvtoDDpEELqZk6eQWTCdHCQvCPv7+Eb4mxio89M7Sq/8SPT71tNxGMq/cE6DB5VnisOXQMyuW9vpR5PagwCH8WvUrPM5Qeud68fcvr0SJzsEphawG3RqlG3MAh8s+n9Gt3uuDxQX3JBx/vbun8ruANFKcYW2/6INC6vmNN8xWxeIquSWk3zEyYhkaP4gzwEtdDlxBLF6vBm9Lutta1wS2Su4bCbvRqFV66aRwmtaPBV6GzB8CzjxAZg3eaT38RM6UwGUzJn1jGP6JkfiMmDnVZHiNQYtquu0+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86uPqyuBp9zgUIPTHXu+1RjsL0PLiZ/dm/kJcugwLTk=;
 b=oeAJh5QLzi3At4131E/Vz3BpMB0TrKbTCMmXARk9ptyafy/cTbBUX6vGnsAX0H6CEPsOzgBxDc+298w/8BTDmBqaJviOwcmI/l/+PIoq9QomzGxlWbOYi3L96+kbREt0+dAiE9o6Ew47K1Uukt892Eff9rCW+T1VZ4BEef9RwSTlEUHayd3p6ogyvQV1tnpb6HeDs1o8rVa4go3/YOsZl5WVvyKkYcJvB0CTP4jXdPVsuq0N0t7RBcvEs9ZZcbJkTDUNOhk38XytZO9jaNTVi62hHAqZdTPP/W7iUMmrEawqiuUZNXZV2zkwtSnkkRzcz8yh8JhHUpnJQ2X4fA8rLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86uPqyuBp9zgUIPTHXu+1RjsL0PLiZ/dm/kJcugwLTk=;
 b=ng5Ys0tBEkaMF2CSMWn6+eDn5InhCTV3v9yfc7CCnNxkXVRZmTrrE/iUgos9fdMeZf+xJ4924PjmfjVF5943BHnyM0yUjmPpkQ89s0JXQdDi9902mmDzvWWDVQQb+jtTEFjRIaa23dCQ3FKdprHaCXIecnD/T+pkxK2NZ4fnRGwF/QRSIwTsojCjWHOSygcGZwNJFsMp69UvvVPOIXhtPfcO7RyRGcy4is/lupGykHVzkW4NwHXvHr2bSw59qB4+L5M1LK6CdNszCqNhc4sk9caJK5EWG0CApB8/4qhAVeAfQJ8JjY1QoEvzNk9x4jh5K+fvh2383Bv6MK+l/HeDnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:416::10)
 by PAXP251MB0623.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:284::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 20:37:19 +0000
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8]) by AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8%3]) with mapi id 15.20.6521.026; Thu, 22 Jun 2023
 20:37:19 +0000
Message-ID: <f98c635a-5cd7-892c-2b9f-90ef49ba22f9@polimi.it>
Date:   Thu, 22 Jun 2023 22:37:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Marco Morandini <marco.morandini@polimi.it>
Subject: Re: [PATCH 1/1] HID: Add introduction about HID for non-kernel
 programmers
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <ndmq5lfkkjm4hkxv7423wz2esculnk3rfmxewnxav673tgssbr@dxsfytvyrepf>
Content-Language: en-US, it
In-Reply-To: <ndmq5lfkkjm4hkxv7423wz2esculnk3rfmxewnxav673tgssbr@dxsfytvyrepf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0034.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::15) To AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:416::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P251MB0350:EE_|PAXP251MB0623:EE_
X-MS-Office365-Filtering-Correlation-Id: 404891c9-41c3-48d6-b055-08db736078e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mQKYekZkvYEBnDv12VwwcFMQnhN/i3/mDjC+s2oDdTFXUCceM/0qKXC4DT+I+m4E3jEdvFFsJQP8Rjet6dY7UTBF/9ZBsY50hxWwB2SKuNKUq1NNLLVYmV/2Fw7zMjYYrwoIZQZ7/4uARjDvn7fy+Wx68ylzY5Z0+kQ4EgfTfNnFfXlzsRdDjqoYTGqy5P/Gk8Ea8V9TVNkjkKBhlUCwb9CbgBBfbsT/sfuhTj8T7LrqUXLGkN2VcT6SY3Hfv7qXdDVwhRPp2NoGj/kp0ag/g4DGlaJ5Ax85uEAxAmRPz9L6t90DChw3eoFlCYKjf40tNWxYwCc35LRSwFjXNGLXpCRz+W4PBHTI+LKRceg811Mem1ak68pHzmxQdiY+EZKnxvG+itnI+ObCRdZnE2bxSXEYRf4p7xyG+2QnP8BxuS6jUycN6cjPvs0SwpfFprHI0XATEl7EmR9D++s5GxZhnDpbIZJKaZhif5GaIwRGSPqOarmzzfdPfP0/LTBqwh1Xm3uF4jqVGVcyqkpXPayatQn0hTf7YcJTX8x0c+EYXd+bmq4R9/2HrZradFoWsduhSthCbkG2azk8u2s6a2C2l1CcxX527OzE+eWpe8jTFXAOKwDVajB4ZtyYPoXBRxHSUxK+l5g2OSSyimTfvTAKkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P251MB0350.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199021)(186003)(30864003)(5660300002)(4326008)(66946007)(66476007)(6916009)(316002)(786003)(66556008)(36756003)(44832011)(2906002)(66899021)(31686004)(41300700001)(8676002)(8936002)(54906003)(6486002)(86362001)(478600001)(38100700002)(6506007)(6666004)(6512007)(31696002)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0RWekF6YmpJSnJabGlFbUF3ejhZM0dPN3lKQWRmU0RHQ0lDaTI4QWRLSkxy?=
 =?utf-8?B?SVFmY1FWVHBiclNLVTlZcjhucmIxSGdJTFp4bytub2dOckJ4dHRYZWpYbmll?=
 =?utf-8?B?dkhIMmRWZGJzV3U3RC9kZEh6Nkx6cHp0bFZXWW5mRUJoZHl4bHRaYjhkZkxi?=
 =?utf-8?B?N1FURXVoR3pqTTlKL0NJTTVGYVE4dHR0b3Zub1dKMlpWZUFMQzBoc0YrVXFw?=
 =?utf-8?B?OVd3UlNVOXdPSlVDeDlzTVJyejhWYUxFanlsd2NPV1Z6UWFwRjg4bkUvcnph?=
 =?utf-8?B?emFLS3Nzd0VzQ3hKYWVQeG1DL1NDSWo5MnpZWjYwOFpXSDk4ZUt2bFZVcjFF?=
 =?utf-8?B?UmdqNDNUemU2STkyZ014akZTbW01Y1cxbEFLU0xKc1B5Y3I0ZXYxMTVUZTM1?=
 =?utf-8?B?NFh2NFIwTFdnL0hDeFh4L1ROaHFZRG42ME1tUVoyWlJVZlNNZ05PVE1NTlJj?=
 =?utf-8?B?RnJOMmJGWHdLQ1pLL1ZIV2szcUJBNFNmaTgyOUhVYmZaUTV6WlVzbU0xZkVv?=
 =?utf-8?B?Q3hoWjh3T3BJdkR3dERlTTc1ZG9seENSd0wrREtZV1dPYVdWcVF1S3p3M1Bx?=
 =?utf-8?B?OVlqS1VQYmlRS1hsNGFFdDFKSllJQlUvK3FTWGZxcW1lejl1dFBLY2haMHli?=
 =?utf-8?B?ZGZRUU8vSWJaaUl2dXZFVytlWnBCNHhZRnJWQnllb1QvOFFjeDlXS1NMM1g2?=
 =?utf-8?B?ZUFoSjY3dGx6U1VreEpjYk90RnNWVEtWbUpvaXZlQU05bWV3S1JkVFBsdDF5?=
 =?utf-8?B?eE1uQThHSHNzcERCRmI1YWgyOExmc2NSWU9FNUk0cGJMTE1hK1JXWDFQemdm?=
 =?utf-8?B?dGlxYTNISGVuOURYbm5Ed1dBUmpENFV4N0dFRUtaN0MvY3B3aUhsQU4wSm5z?=
 =?utf-8?B?RzMvSHRZZ0tBQzVCNHVPcVpyMWd3cXFBQ240cE5ITzh6MUZ6Lzg2bi9ZZGxN?=
 =?utf-8?B?TlRwT1Rva2VBaUhqaG04UUc1S1NyMnJHb1dTYld2TitYSGF1bkVsTmlJdEhE?=
 =?utf-8?B?MHdvQnJ3cmJBQ1dPb0dSSG8raGozNFlPRDdOT1Y2c0JaanZuRmwxL25ObTB1?=
 =?utf-8?B?MkExWDVJUGJFa0ZyaHFjYUVGUmRWY0JkLzVaeUdINTJXSUF4RDlBSWFhbFdB?=
 =?utf-8?B?OEdsc09UbTU5TkpiZ1JwczlzOWx4ZFcwbHB2RW4vTTRjVndMbTI2NVRLRXI2?=
 =?utf-8?B?QXRSK2FPWUFPV1FSd2RsNit4di9IR2RZUnM0OTB1eHEwMm1FdUZxcHlaUGxS?=
 =?utf-8?B?bEtxNUJJUDNpUmtMWjAzZ2ZLZ0dHQWdrcyszbWxEVlVNQkpXV1ZHOHNyYjI3?=
 =?utf-8?B?MGZ3dEJ3M2V1ZGpudTM1L09mOVB6NlA2OStuYWl3RVF4MzNzeGIxdHpsWFdV?=
 =?utf-8?B?QkpYWW54U3ZXUWxVbC85dU0yQlN6ck8vT2xHNDZweFFYMXZ6WjdIR1lnejJI?=
 =?utf-8?B?RXNRemg1K3ZkckNFRnlwOHo0cVlVMUw0bzY1dldwcUFreXk3ajl1V2ttdHFP?=
 =?utf-8?B?Ynd2d2RkbG1MZUM2dExLbmpRWXJNQnRLVUQwZzMxSThzSWtHRndISGVpOGo2?=
 =?utf-8?B?LzNHbk40amoxd2JUNE10c1B5NTZtSHl5YjZPc3VnZ0tOME1HYUZDZ1A4SUI1?=
 =?utf-8?B?N04yS3RMSUE0bjYzdzluOG1lYS9nYTg0Z3BheU9IZEVzbnVRQ3dWOFZuTnRh?=
 =?utf-8?B?U0MyWXVSMHJ6NVdlODIrL1F1Ui9RZU44bTlRcHdGaklJdnB0UnpZN01FdFVp?=
 =?utf-8?B?cXZsYXpXS1ZscWQvL3VLazA4bjRJNWVKaFVuUlU3NllBQS9UUXBUV2JxRnY0?=
 =?utf-8?B?NWxtVEEzb3lJdHNaanZzQ2xsTXg5cXFGUGFWSFdXQ1E0bXpjRGNTM2UvQ3lD?=
 =?utf-8?B?RS9aaUJrNXByZUpXd2NIMm9CRHlZYU91SnptbjZxVjRWWEk0NjFPZFYyLzQ5?=
 =?utf-8?B?ckdJUzNWNFpNcWpxQnM5anluYmNad3NVZnBzeWRlMWQvNXAzYnJoaWl1VDVh?=
 =?utf-8?B?V1lEQzB2Z0hzVVdsQUh0VEFyaEZic2tMQmVyaW5Bb08xMmlTbGpBb0lyVVM0?=
 =?utf-8?B?akNDMG1Bd0Vic3ZaTWhobDFWSFVzV1YydnlqeFkvMjJaMVFmMnlyNFVIODF0?=
 =?utf-8?B?dmhTNSs3NUFzUDVWejhOQ0NWdUg2N3dablFQbjFjMkpENm9Lbk5KUVJwR3Nw?=
 =?utf-8?Q?hRottVM8wZ5WbWambp5kmFkgrVesZUxmkVyTkrAZVXrf?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 404891c9-41c3-48d6-b055-08db736078e6
X-MS-Exchange-CrossTenant-AuthSource: AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 20:37:18.9464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKzy4JnvCMR3je4Ydk+4clsbiUo4aiJQn9JsWQ7TPLoonmEBNHY/RphMc1zm0p6GmbwLYhybnWJTx58nbw3Tkg==
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

Hope to have taken everying in consideration,
and not messed up things while trying to
account both for your and Peter's comments.

Also: I'm going to send an independent v2 with a link
to v1 after the "---".
I'm not sure whether this is the right thing to do for a single 
patch like this one.

>> +Many HID work out the box, even if their hardware is different.
> 
> FWIW, I always refer to a device following the HID standard to a "HID
> device". Done

>> +For example, mouses can have a different number of buttons; they
> 
> s/mouses/mice/

Ok

>> +The HID subsystem is in charge of parsing the HID report descriptors,
>> +and of converts HID events into normal input
>> +device interfaces (see Documentation/hid/hiddev.rst).
> 
> hiddev is deprecated I would say. There are still a few users, but I'm
> not sure they are quite actively developping products. hidraw is what
> you want when you want to talk to the HID devices at the raw level, and
> evdev (/dev/input/event*) is what libinput and Xorg consume.
> 

Hm... hope to have linked the correct document this time (hid-transport.rst).

>> +The basic structure of a HID report descriptor is defined in the HIDUDC manual, while
>> +HIDUT "defines constants that can be interpreted by an application to
>> +identify the purpose and meaning of a data
>> +field in a HID report". Each entry is defined by at least two bytes,
>> +where the first one defines what type of value is following,
>> +and is described in the HIDUDC manual,
>> +and the second one carries the actual value,
>> +and is described in the HIDUT manual.
> 
> I think the next part up to the various tools that allow to decode the report descriptors
> is interesting, but should probably be in a separate file, or in a footnote.
> 
> IMO, what matters here is:
> - it's a "simple" language defined in those 2 documents
> - it's working as a stack: each elements adds to the previous, and
>   summing everything gives you the overview (there are subtleties of
>   course)
> - noone should ever try to read it by hand, there are tools :)
> - in case there is something wrong in the report descriptor, then yes
>   you'll need that explanation, but it's probably too early in the doc
>   to explain this IMO
> 
> 

I'm not sure it's better to have is somewhere else.

It's true that one should use tools. We both agree
that you really need to get the meaning of those numbers
in order to be able to fix a HID device.
The problem is that if you are not going to scratch your head over those 
two manuals you are not going to understand neither the meaning of the 
hex numbers, nor the meaning of the parsing tool output.
At least.... that's what happened to me.

Anyway: I've tried to emphasize the points you made above,
and to move the hand-parsing out of the way, into a different file.

>> +.. Parsing the mouse HID report descriptor with `hidrdd <https://github.com/abend0c1/hidrdd>`_ one gets::
> 
> Maybe I'm too biased, but why adding the hidrdd output when you also have
> the one from hid-tools?

It was commented (".."): after writing it, 
I realized that it did not add that much;
still, I did not want to throw away the text, just in case.

I did non realize that you would have reviewed the raw patch,
where the fact that it is commented is not at all obvious.
Apologize for this.

Deleted. I'm leaving, if you agree, the links to the online tool and to hiddrd.

>> +
>> +Outputs and Inputs
>> +------------------
>> +
>> +An HID devices can have inputs, like
>> +in the mouse example, and outputs.
>> +"Output" means that the information is fed
>> +from the device to the human; for examples,
> 
> The other way around: outputs are from the host (computer/human) to the
> device, when input is from the device to the host.
> 

I've tried to rephrase it, this time without 
mentioning the human (that perhaps is confusing).


>> +a joystick with force feedback will have
>> +some output.
> 
> There are also Features, which is a side channel configuration of the
> device from the host to the device.
> 
> Most of the time Features have a state (are you using high reslution
> wheel events?) and can be queried from the host. Most of the time :)
> 

Added Feature items (hope to have got them right).


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
> I wouldn't say this like that.
> 
> The following is an attempt to explain to you the slight difference
> between collections and report IDs, so it should not be taken verbatim
> in the doc.
> 
> You can group data by using "Collections". Each collection has a type
> and purpose. You have "application" collections, "physical" collections
> and "logical" collections. For each you can assign a purpose: for
> example a touchpanel that exports a touchscreen and a stylus would
> export 2 application collections of "Touchscreen" and "Pen".
> 
> But then to be able to differentiate those collections, we have the
> "Report ID", which is handled specifically in the HID standard as the
> first byte (when defined) associated to a collection.
> 
> But given that collections can be stacked, there is not a 1-to-1
> relation between Report IDs and all defined collection.
> 

I've tried to rephrase the whole paragraph, also on the light of 
your explanation below that Linux builds a /dev/input/event* for each
Application Collection, and not for each Report ID.


>> +one can see that the device presents two mouses
> 
> s/mouses/mice/
> 

Done


>> +Events
>> +======
>> +
>> +One can expect that different ``/dev/input/event*`` are created for different
>> +Report IDs. Going back to the mouse example, and repeating the sequence where
>> +one clicks and holds button 1, then clicks and holds button 2,
>> +releases button 1, and finally releases button 2, one gets::
>> +
>> +  marco@sun:~> sudo evtest /dev/input/event4
> 
> evtest has been deprecated for a while, and evemu too. Now, cool kids
> are using "libinput record", but it's slightly more verbose.
> 
> Using evemu is probably better at least.
> 

Changed to libinput. Do you think I should trim the initial output?
I'm mentioning evemu at the bottom of the paragraph.

>> +When everything works well
>> +==========================
>> +
>> +* The HID report descriptor makes sense;
> 
> i.e. the current tools are capable of making some sense out of it :)
> 

This is not what I meant; from the few emails I exchanged with you guys
I got the impression that it's possible, for some HID report descriptors,
to be almost completely bogus.

Should this be the case, then the kernel could still able
to make some sense out of it, but nevertheless it would not be bad to fix
the report descriptor in the first place.

Anyway, I've got rid of this Section, and merged it with the "When something does not work",
as suggested by Peter. Hope it's better now.

>> +* It is possible to verify, by reading the raw hid data, that
>> +  the HID report descriptor *does  match* what is sent by the device;
> 
> nitpick: extra space between "does" and "match"
> 

Fixed.

>> +* The HID report descriptor does not need any "quirk"s (see later on)
>> +* For any Report ID a corresponding ``/dev/input/event*`` is created,
>> +  and the events there match what you would expect
> 
> That last point is not stricly correct. Currently, each application
> collection gets its own input node. You can have a collection with
> several report IDs because they are all using the same device but a
> different language.

Changed. Thank you for the explanation!

>> +When something does not work
>> +============================
>> +
>> +Sometimes not everything does work as it should.
> 
> *not everything works

Ok.

>> + * ``HID_QUIRK_NO_IGNORE``, defined as ``BIT(30)``:
>> + * ``HID_QUIRK_NO_INPUT_SYNC``, defined as ``BIT(31)``:
> 
> We should definitely include the doc directly in hid.h and include it
> there. I already explained why in the cover letter.
> 

Good point.
See whether the current solution (both in the doc and in hid.h) works for you .

I was wondering whether it could be useful to add a :block: option to the kernel-doc 
directive, with the meaning that all the comments in between a :DOC and an :END_DOC
should be included in the documentation. 
This could have allowed to have the documentation of the #defines
line by line. After realizing that I should have modified scripts/kernel-doc
(perl: I know nothing about it :( ) I quickly back-pedaled away from 
that overengineered solution.

I have verified that It's possible to repeat the 
DOC: HID quirks
comments, and they all get included, 
but it would still require at least a two-lines (three?) comment in between every 
#define in the source code, and I don't think you would want this.

> But moreover, quirks are supposed to be the exception. If we are adding
> too many quirks, and that the same devices work on Windows without a
> special handling, that means that the quirk should be analyzed, and we
> should probably rethink the processing of the HID devices to not have
> this quirk.

I have changed "common quirk." into "already known quirk."
Ok for you?

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
> 
> If you ever do that, please share your code on the LKML. The current
> background work is to integrate those hid-bpf programs in the kernel
> directly, so that we can share them with everyone without resorting to a
> third party userspace program.

Added three sentences about this. Too much?

Btw: would you want me to add something like "If you are completely lost
you could, as a last resort, try recording hidraw with hid-recorder (from the hid-tool utility set)
and sending it to mailto://linux-input@vger.kernel.org" ??? :-/

(if yes: the mailing list filters too big messages; for example the recording I sent you
did not reach the mailing list because the attachment was too big; how to deal with this?)

>> +Writing a specialized driver
>> +----------------------------
>> +
>> +This should really be your last resort.
> 
> YES, definitely YES :)
> 

:)









