Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26EA973B5A8
	for <lists+linux-input@lfdr.de>; Fri, 23 Jun 2023 12:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbjFWKqB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jun 2023 06:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbjFWKp7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jun 2023 06:45:59 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697FBE75;
        Fri, 23 Jun 2023 03:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRYmgWNRzgH+wTWzhuhoGhYnMxuofhuiiPoRK7n+8ywR9Bst2jdCMZfCrWM1tjChaRRQggFqUUb6C3K+MrZ6AzA9LO15VaTgQUdqyoFsF9LLFmOY5ZJVE0C8LFQWZErql2z2tJ0Wi7P8j6Nk5pQM5O/H93U6iwxn13imSXWGGC6GgzvNfvNScdbjzkpZKAvVT3aGRMELssXWDSWDQ1AzC2kvCP/2GLIgcJBNzELlW6e+mO7BwwhFtq3wv67S7pJqyqSrmTEmMjV11c+dUc33ZNqXqsDwpb8GnxOpV+Eb3flUhEJxMmrPqrkdTyZqj5DcXgpSx2EgotEN1qcKIMZpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H41hKN1mDc4hBikBVmQX/UqLDLgEve0lroI6QBSSfkE=;
 b=HO6O2HaW8nwAgchv37cPE7KgM2dqNFhb/d+hKZPyeiUIwoCYsY2fE+L3eqyyNZPSWWkfNoEs3YWt+Rhvg4ajS2e0YyMt0t4lsMNTbeQWKhGaYGDauGrUgQ45zmUT9NAXoO+2HeRKXgfCxVdTIIvqMvInKxw+mjxWa8ZOC+yFDoR1um5DYrNEMrjPqLXguCk2qGHh4NdMfpPlsMTh8OimtFmrRFyY944GOnRTFAxoWlNnG96Wq1ldc52GbXPWAmBMqbfYKexaQ3FE8sd8JLN7F6PSvoM0O9DwO+n5S2/Yv8RFO1x78LTEkptA+MQF+vo6MTyrhxFEVZNBRfpADCDM0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H41hKN1mDc4hBikBVmQX/UqLDLgEve0lroI6QBSSfkE=;
 b=I4cGJY4QTjXk9fVvt4u8GRHyquEOEjDKlwK3jiv3y483W0Fw7HfJ0bJ/zUNNtYxZg07E1Z6OTnKtYQLNH6GSQqF61tpAKoZa++0/UC4G0DgacovrwEyjwhH804l/UqfIiOjWuSSiILtJSeD93poQyhHdGr7lwkF+raqp0RmvohwRGH0a/GtCJonObXrF1VpmAl2HlxMqlr3C5Kr96ikowXkdeWhIiFdV7biRGwZ2y1evVuHIU6MbLxChI6wZK7lvr+vhe2evXubj3SFgspBCV11oMyuKPkks3rmqgxb2bm4iRtuF945U/kLIEXdqcXIZWyk5beuTkr/yvMhsXZmo2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:416::10)
 by PAXP251MB0520.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:276::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.44; Fri, 23 Jun
 2023 10:45:54 +0000
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8]) by AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8%3]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 10:45:54 +0000
Message-ID: <45d68dcb-7625-8592-fde6-60c9fbd5eaca@polimi.it>
Date:   Fri, 23 Jun 2023 12:45:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] HID: Add introduction about HID for non-kernel
 programmers
To:     Randy Dunlap <rdunlap@infradead.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <70fdef05-d3b8-e24b-77be-901bd5be369e@polimi.it>
 <d34eae36-0d43-6cd5-f8c0-57e1bd30f338@infradead.org>
Content-Language: en-US, it
From:   Marco Morandini <marco.morandini@polimi.it>
In-Reply-To: <d34eae36-0d43-6cd5-f8c0-57e1bd30f338@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0031.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::18) To AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:416::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P251MB0350:EE_|PAXP251MB0520:EE_
X-MS-Office365-Filtering-Correlation-Id: 18429fd4-d4fb-4f98-db0a-08db73d704ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pxHcvMg1zU2kEPm/Wq9c2wdwKC5cEzuCymk1pt5538LjDq9H3rH8/GCV+pVqPrnvXgQR4zmePvWraORTjeIZ6U0L/3xsYPivFf5N5WvIWmA/rW+WfRVeClDeWMNvrSwKKhDR6yPcWB4wQmgizobQPeT95hETy+nRTHhPgvYjD2SyakMD663Xt3QnjNOC8RKcUhYCEMcpnlHcxCOebQn81Uy8AQZDKVO5hM2iZnlAIJ1nuvCLPjnJth+qceLBqsB30uL6bEKBZ9lYQIymN/Jwj/KfjyJ2PEI2mKnlwJN8FOifX1OG8hK8TKCVH0YU4j4p/13Aa3yNK1EY7qY4ZthHWQ2RbU4JU8TuKaYWrKzQpHzPBcLOvlJrcrX7mr+6vl6DP5OqPeYr/2HaDd0Idt+Ft0JL4yj2A7fWnGXMb66x2w4xCKkU+lyJdNwXcOzo23JxDjyP9HmQDrIqi9saPI+H8dArOw6Q7FUxKp0IurAkAwniTOoPzn2ficTCGt3zEvGQ0jojr2Q13VIoq59s4QtCwyWPdFpqH+88vbkWvMc8LBSUi8tNk+K2C4RD9DwadwUb3xozDl+kSQts3M5TvMGmGi2x10NqLvFzAg743e39Ew4T1iykNQMQ5ZKUT8J/qMi0DhhZ9VBgH7PzbjO71vGtKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P251MB0350.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199021)(966005)(478600001)(110136005)(186003)(6486002)(86362001)(31696002)(26005)(6512007)(6506007)(316002)(2616005)(31686004)(786003)(66556008)(66476007)(38100700002)(66946007)(8676002)(66899021)(8936002)(44832011)(5660300002)(2906002)(41300700001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0s3SHdjaDRONENUT1lzaTBxYmpBTHN3UDFmZk9zOVUwdTRVaU5meE9FMTll?=
 =?utf-8?B?SjkwTmR6eVBEaElDd3E0RVNTc1NqV0V3Z0M2bnpOQW9PeGZ5cFFXVW1DKzl2?=
 =?utf-8?B?R1VBRUlsZythSWRtaGdxQ0IxbVBscEVaQllXaVRrQmljdG4yZUJTLytGTUhS?=
 =?utf-8?B?WElPbTB0UzZKZFJCRDArQ01MNnJPdW44UDcxSk5yQ2NoR3I1N1R6VlRDYTZJ?=
 =?utf-8?B?YVJLQnlrSFZ4Z3pKVTNXYmxadGR4VlBFRHpRYnlmNFdPa01hN3ZsNERrcFJY?=
 =?utf-8?B?bUFHYWE4d2ZsenUxZTBoL0tQbUgyS1lzNXlvNU54czh5SmxaN1hwRmtoSzZX?=
 =?utf-8?B?dnp5bFYwUUhmSVliVTRMdlZlRTFabXJ3cFJNTW1hOGUvR0ZDb0ZRb0NEY01i?=
 =?utf-8?B?dEJOTkZqNjZBb2pGdk85S0Fpeld3MmwwTU1iK3h6b013aVJ3czBpSFhubWpt?=
 =?utf-8?B?QkF2RW95bHZxak9QaW9mblc4YmtDY0I1T1pzMHA1NDNiM08wSXdGNi80Tkd1?=
 =?utf-8?B?YUF1eEwyNzBJSHpQaE9NNCszV2I2M2xUQjQ4blBNTGNsZDI5cHF3dnFxQTlW?=
 =?utf-8?B?WnBDd3VHcy80THo2cS9IK2pVclBYSDYzaXhlNklVNFZNTnV4K0dtSXV0VUR2?=
 =?utf-8?B?ZGs3OEU4bVA3cFNqd2R4WEJ2VkNjeG1xVDg3RlJhdEg5eEhXVkN0a29QWDYx?=
 =?utf-8?B?emdiR1pXTXk2MThQYXV0QlF1b2wxekJxNFRqVk1iaWZvN0c2M0g4aE5HSFdE?=
 =?utf-8?B?NWphMFYxemxodS80WGxrVkE3cXF4c1NSZWtkT2p4bUZjbllxbkUxQ3pscXNp?=
 =?utf-8?B?QVNTVmprUjJ1RlAyM2NLa09ETytQeEltUi9QV2RFdHJGcHVtSE12ak1Xdi9o?=
 =?utf-8?B?SlFiM3MvZE1vMlFiblQyZkx6VWIyeXdOdzdlOFpEdzJmTVFXRW5ETnQrNzJZ?=
 =?utf-8?B?L1cyZkgyUkdZYjBTWjVoZlBUd1ByMGdReXh3di9NeENHalFjR01rb1k4cUJv?=
 =?utf-8?B?UFRaTXBuNHMzcXU5TEFtVXpJZzgzK1NvOW02bGhiUUNxT3dSRmRqMnpWRW9K?=
 =?utf-8?B?UkJFalBrMHhPREdkYzdNZ0psMUxGK2tHRTBSTTZpdHA2a25xZ1k0Zk5IVUhW?=
 =?utf-8?B?QkRybVVpckhUZWw2cjBHcUthdUdRM1BpUjUzTlg2WXV1UFBkZHpYcmtOTDBk?=
 =?utf-8?B?RTlWNldwNWxQZVFrRXRHRGJZVlhXY0s2MFpiWDdKRm1sV2s5djJYTjZ5NFlD?=
 =?utf-8?B?NFpaR1F1Ukh0cWxEcWszMHA1Y1hjdTVIWWNDbkNUUGJvMHNYK2Vab3VPVUN4?=
 =?utf-8?B?V1FQTWwzRURnb3NkKzgzRm9MTi9DcDErZk90RFZxWVo4ZDVKRHRRUUoyeVl2?=
 =?utf-8?B?czRsT3YvSk1oemMrTmY4d3J3aHZ4MGJOcVNCRytTVUNJRys3QWxDTnJwQUht?=
 =?utf-8?B?UW5veitmVzlETmU4aGVYTUFLYlRpV2RxRFUvUnh3R0Q0V3UwTkUvaE14WVdy?=
 =?utf-8?B?Y2Fkd25mUjZlSFU0QkN6YkpIL0hQUDdnT3E4VmdRNWhDQzBWQkVFenJyeVJP?=
 =?utf-8?B?Mit3eHpISGhEaXJGS3BLNkJ1TGErc0ZqSENLRVBaUS8xazJBQ29MZjFweTBJ?=
 =?utf-8?B?QVRhUFdNOFRoT1MvTnQvSnMrc2pOVHRoWDNKMzlLOG9rRGRUVjhOZGZ2YmRi?=
 =?utf-8?B?VkxvVmNzSXpXVTZTUWR0SWo2ZmxRRFJTYk8xRDlrTm5nU2JibWsrc1B4bDJR?=
 =?utf-8?B?L25hdUVFN2VGLy9mc2dvZitlS3ZKTllHcHF2b1dVN2Y4Q2p6U1dPZVdNdjRv?=
 =?utf-8?B?QWVteFZiUFQrVGIxNDVwOGZwWlppbHEyTmtrTDlqVnRLbitNUkt3aTVNcUZH?=
 =?utf-8?B?bkRFTFNWaDdKeGx3eWZkNkhFTnpTRVJzTXNZVUxuaEJxNkR6MzI5dXdRYVZL?=
 =?utf-8?B?TmhISXFscVNPUGMvSWZMM0lQcnlXZjRkSVNDWEFzMmwvM3lZRmRVTXBUUG84?=
 =?utf-8?B?aktRRExJN2dlN210TEVoN1VZd0hoUjQwVXZ0R2FHN3NCcnpHY05IMHBJNlJO?=
 =?utf-8?B?ckdvUGVON0NNM1ZBM2hHYlloR3NXKzZ5dFhZazBlKy85dHhlOVFnUWx1RHRR?=
 =?utf-8?Q?9eWffsDowyujY6m29+u2GvrwV?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 18429fd4-d4fb-4f98-db0a-08db73d704ea
X-MS-Exchange-CrossTenant-AuthSource: AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 10:45:54.1923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skpSviVM3HhIt8R82UwEnPwn1A5dUrqx3kx9Ok7ezpQcd4FZ2cTP623YHd4aV29S6hesfqdt6vY1M8IXPOdVYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP251MB0520
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thank you very much for your corrections.
I've applied almost everything (see below),
but I have two questions below.

Marco


>> +This chapter is meant to give a broad overview
>> +of what HID report descriptors are, and of how a casual (non kernel)
> 
>                                                            (non-kernel)

Ok, thank you!

> 
>> +programmer can deal with an HID device that
> 
>                             a HID device that

-> with HID devices

as suggested by Peter

>> +may a wheel; movement sensitivity differs between different
> 
>    may have a wheel;
> 

Ok

>> +The format of HID report descriptors is described by two documents,
>> +available from the `USB Implementers Forum <https://www.usb.org/>`_
>> +at `this <https://www.usb.org/hid>`_ addresses:
> 
>        these

Not sure about this.
"this" here was meant to be https://www.usb.org/hid , while the two documents are listed below.

Would 

The format of HID report descriptors is described by two documents,
available from the `USB Implementers Forum <https://www.usb.org/>`_
`HID web page <https://www.usb.org/hid>`_:

be ok?

>> +In practice you should not do parse HID report descriptors by hand; 
> 
>                           s/do //

Ok

> and drop the line's trailing space. (Do that on any lines that have a
> trailing space.)
> 

I forgot to run checkpatch, my bad. Will do for v3.

>> +    It is being actively developed by the Linux HID subsystem mantainers.
> 
>                                                                  maintainers.

Ok

>> +
>> +    # 0x81, 0x02, 		     //	Input (Data,Var,Abs)		   24
>> + it's actual Data (not constant padding), they represent 
> 
>     its
> ?
> "its" is possessive. "it's" means "it is".
> 

-> these bits are actual data 

ok?

>> + a single variable (Var) and the value are Absolute (not relative); 
> 
>                                     value is
>                         or          values are
> 

values are

thank you!

>> + This time the data is Relative (Rel), i.e. it represent 
> 
>                                                   represents
> 
>> +An HID devices can have Input Reports, like
> 
>    A HID device
> 

-> HID devices that are not ....

as suggested by Peter
Ok?


>> +Note that, however, that you can have different Report IDs
> 
>    Note, however, that
> 

Thank you!

>> +
>> +There can be a number of reasons for why a device does not behave
> 
> s/for //
> 

Ok, thank you

>> +* the HID report descriptor may need some "quirks" (see later on);
> 
>                                                                  on).

Ok

>> +
>> +As a consequence, a suitable ``/dev/input/event*`` will not created 
> 
>                                                            not be created
> 

Ok

>> +for each Application Collection, and/or the events 
>> +there will match what you would expect.
> 
>          will not
> ?
> 

will not


>> +
>> +
>> +Quirks
>> +------
>> +
>> +There are some known peculiarities of HID devices that the kernel
>> +knows how to fix - these are called the HID quirks and a list of those
>> +are available in `include/linux/hid.h`.
> 
>    is available
> 

Ok

>> +
>> +Should this be the case,
>> +it should be enough to add the required quirk,
> 
>                                            quirk
> (no comma)
> 

Ok

>> +should go into hid-quirks.c and **submitted upstream**.
> 
>                                    **be submitted upstream**.
> 

Ok

>> +See, again, Documentation/process/submitting-patches.rst
>> +for guidelines on how to do submit a patch.
> 
>                      how to submit a patch.
> 

Ok

>> +for your code, see e.g. `samples/hid_mouse.bpf.c`::
> 
>                             samples/hid/hid_mouse.bpf.c
> 


Right.


>> +Check Documentation/hid/hidreport-parsing.rst
>> +if you need an help navigating the HID manuals and
> 
>                any
> 

Ok

>> +and that particular HID device will will start
> 
>                                   will start
> 

Ok

>> +
>> +.. [#hidraw] reading hidraw: see Documentation/hid/hidraw.rst and
> 
>                 read
> 

Ok


>> +We have an ``Usage Page``, thus we need to refer to HUT Sec. 3,
> 
>       have a
> 

Ok

>> +is given in the HID spec Sec. 6.2.2.8 "Local Items", so that we have an ``Usage``.
> 
>                                                                    have a

Ok


