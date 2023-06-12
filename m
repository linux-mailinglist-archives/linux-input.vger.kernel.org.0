Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75F3D72BF91
	for <lists+linux-input@lfdr.de>; Mon, 12 Jun 2023 12:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbjFLKpS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Jun 2023 06:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235628AbjFLKpC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Jun 2023 06:45:02 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2089.outbound.protection.outlook.com [40.107.8.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6360C6E88
        for <linux-input@vger.kernel.org>; Mon, 12 Jun 2023 03:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fh+lsjTVEXnF/h/cgVmcQFIPmiWdtziOFTf7QAMBVPIUOpEd2HZ7I9ZkKxhyy4v+Kd3n7zqbT+14Ntl6SjfBZawmGmgglchlX07Wmk3DNWlXC7UX7tK0ZLW7V7xV9iHsUB6nPZLv+sHcnPuIqcSvpEqAI/wMdl3BsCg8zDZOG6OhqvG2K9qAC4AXD/B0WA57dDoDM+PNEcbfyYzajuRuL9vRlFlutN+fh8ePtlNYIBqA4gWnx3EMYe3yqGyFrRonHe7y2OIRn5Eg4zAnbTVQ0mIiw5OonPlATIJB+GPu/B7XKYiYjRHyzqQk9F/Vi7ZEvif0KG8+/eyQERFrlN2GEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2zZUSnluIlMdT4LInrN4fRg++00ocTiJOpjLD9Gaag=;
 b=JydQ7quYa0DN6wGOdIB4ov0hRSlN9xITO0osr1ILHnaA1cKgrIL05STIiRWkAVgX5NgX0BTtrb1YyKUPVtuj1F9csVNPT2spAFgepJ3/RC31BxvUIXv+BlAxwnPjv7/SS3mn/fCT8u8Ne+RhmaTfRWkVzF2Supq4Elh/xvnuyD2rpP4KxuOnWUBJXokdDeMrQeQOtjkK0g1VotpNcjLk3iw8RbWJ2gK9Pr/DxwtsnBUwWZ6xC99OI/zpbcLCaaEolQoNNJne+xpycbhLkTVSFRR04SdkDC6ssMkkvhfxVBCnsQKYXuKk/unrsws/tGMqfJKmnVkRDXGP/O6BaUpeRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2zZUSnluIlMdT4LInrN4fRg++00ocTiJOpjLD9Gaag=;
 b=FxWRou1/wmFdb4l6dLXPakeaN2RW2B4SIkQzWejEy0xPI4s1Gpdy/IH6FT9dM9wt1Il0coYgOGtK8FdbL4EE9tMGn2H5SQVkwjlKSIHynwixjtym2v3rLDabI+MnlIcZLm7MIaLepK9Nnz9vfpoXOctHft+yynro5A/6GGAvANEw2rMVl8AKTKHQzMHMAbxTIp95auY1vnK3bvi8x7tYv/uo0iMmSMaROc5OKLd4Bu2UP/91Cs8KET41pWPbnpTpkJ2TKdCS++7mZ2d3aGgmoGXnhE6YMLas4ISkFrTjFelw8+rb9VyF9jFZ1i+sfb7/UKCGu1OcavHmi1NyOjjvtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from AS8P251MB0339.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:404::9)
 by AS4P251MB0512.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Mon, 12 Jun
 2023 10:29:40 +0000
Received: from AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
 ([fe80::d088:f8:7b89:2974]) by AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
 ([fe80::d088:f8:7b89:2974%4]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 10:29:40 +0000
Message-ID: <5673fd15-b3f2-7911-6eea-39e5126f4874@polimi.it>
Date:   Mon, 12 Jun 2023 12:29:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US, it
From:   Marco Morandini <marco.morandini@polimi.it>
Subject: Tree dumb questions from an occasional
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0050.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::19) To AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:404::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P251MB0339:EE_|AS4P251MB0512:EE_
X-MS-Office365-Filtering-Correlation-Id: 8438fc22-3ab6-4f4e-e9fe-08db6b2fede5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8FGsQNsC0Nds4yrnrHhkZYMjLbDaCXxPlUyrQrzmy0FrESeRDKTxfp/EeH2C1mUtqQGIYYpm4i14z+qnVLQnU41pVUxmjenkS/OnQv/2X4NvtqNJQ4Uf9T3BdFst1aH+WBP7yah8WsGqKUrtel2izQC7zwIAb0yxiiDWr1dAP1cRWKI5PoVCRyEiDlhAcAVbaijhWjL8TAQggumdlOV1JDNoD8OeDQ2Bx8lB+21/FGXpumBXSv9bixFtD/phRObiWh5dDmzg5xcUQH8VbCIAQubtAmmZQDwJuAfYkfZ2sHm/kUvKXe0wTEgOzmy/J0T23Lb6Yabdsb2RNevMpGkVE83tPqf3lZgUlEsYvHoVQtUqTQ3JGB+5OLVeQOmdGlQo337A7EmFDjAsfZMsF8xkLdpDPPz9Cof9ZS7ld5tbCcZI305+qGjdoIQUXF15GbObSzhlVAGz1m+8efl+CpMqa/ToRVXtWEC+lkGjFXm6L8xIJ+wEf6nOhTrDoramIHlkl3YqQDNo88jXsL5jtr90uoA7Cco95JCXMLnAwnrzAig4ZtXhEtVRxX3bdnksRFVhUPvSf6PzKdAp1lwm3gRyE24eyTgmu4Ak6HBE+qUqRmEwGIsk+dQM8ckX4E7bBgf9uEuxkZyUlvJxWFDLgXI9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P251MB0339.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199021)(6512007)(26005)(6506007)(2616005)(36756003)(83380400001)(31696002)(86362001)(38100700002)(186003)(110136005)(44832011)(478600001)(2906002)(316002)(5660300002)(786003)(41300700001)(8936002)(66556008)(66946007)(8676002)(66476007)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmhhaHFWb1gvSmY0bVQ4NWQyVFRQNFVmV0VXdk81NFVrQ0hiQzkxdlJFQzVN?=
 =?utf-8?B?TlhIckUvcW1oNldrWDJMUng3dElaY1AyTkY5QU1NYU5qK1ZSeEhzTWpVcUVJ?=
 =?utf-8?B?OC9lYi95RGFiRWJFc0JFSng2eTFqUU9tL2l5RXpQTjN2Ry8zT2IwaWlvYkhR?=
 =?utf-8?B?bjUvNlFuVDM5OHVrc2crakR2M2V0eXFIYXp2REtCZysxdzFKMVpWMzNPOS9s?=
 =?utf-8?B?ai9lQ0RaZTU1djR4ZHVXUHlWa1I4VjFhYUxzNDNzTTVuUUxwWVY2dXZvQXEx?=
 =?utf-8?B?VnZLWUxVcEpVSXBlVDFaSXA5bDNESE1PSTE2YUV0YzFvOEZuQ3JGUlo5Q3B0?=
 =?utf-8?B?dEozRXd4UDNBVk5LUnN4UEYyK25oUW83QitiL0RBdTdCUUpTOVJ5VXR1aHNV?=
 =?utf-8?B?eUcyOElXcExXSDZGdHZNVXRXS2I0cDI5NDVpOVI5SzRTbGFXNGwyS3FkTGV0?=
 =?utf-8?B?V091Rk42UklNa080RDBHL0NpeUhtaC80ZUFyQkVJZWtHN2hhNk53R0w5SmZF?=
 =?utf-8?B?TnN1bTZsdUx1TnJXZSs3NWpVajlJUnI5b1Q3UlM0U1N3R2pONXJYUWRSVStk?=
 =?utf-8?B?b3JkUitzUEcvWnpKV0dtaXpNNHRTcHhIWlZKQmQxUlAvTG9mdmVWUjA4MldF?=
 =?utf-8?B?OS8wZG9xdWFsdTFHcTZleC8wMWZrN09neUdTNXc2a1RvYzhHU3czQmJTWlRI?=
 =?utf-8?B?aWxqeVIvZFdsQ0dFMFV0TFg2Qnoya2xTcXEwRm9QN2g2RTZRdHFjc1lSNkxU?=
 =?utf-8?B?VXU0eVEvUkVFZlo2TmkxbXhQU0o4dTNPRFNQT29JMUs1WDQxZHcxUWJaYllM?=
 =?utf-8?B?RVlOTkNpVVUyODZncnR2N1pIT1BrYUFIbElkWWFxRzRNcXZmMkttc1pWdWN2?=
 =?utf-8?B?TlFwLzZGZ1FBZ0hhWHM1RmNKempIWHRTUFNqbi96eDBGMVRaWjB0VGhDSnFu?=
 =?utf-8?B?VWpGZTNucW1yL3I3aUR0ZUdsUmRiL1pZY2tsTEtHbmVHbWJWK2ZvV0dFdDBx?=
 =?utf-8?B?WERRK0wzZ1Nkc1V2eVVQUXZheElxVy9MTXZhemw1VmVyb0hMU0lDY3gyaUtJ?=
 =?utf-8?B?dk9mK2hYRXFYN1IySUltMXhpaThqeWJPTXJQdkVFOWFIQ3ZWYm1kaDFGdld2?=
 =?utf-8?B?QTJoSlBmMDhSa0x0cDBSV0NLUFRqWDNucmliYWwxU011VlRPS2ozQ0Q0cENr?=
 =?utf-8?B?aXQ2cVJpUENocDNmcml6eVVmN3p6Smk0OSsvdGU0Ulc5cDJ5c0tJWDdCcitk?=
 =?utf-8?B?dzFpT2grL1V2MVYzRnpoZVcvK0pXejNFWmt1cTdERXlCL2Zab296SHhNM1o2?=
 =?utf-8?B?NGVqYVN2a3lOUmpiY3FjWnhyQ0llZExwODZxOXZOT1RRSUZIRDBIT2M4dkhW?=
 =?utf-8?B?TTByaks5aUJUYnA1bnJmQm1oVWozbG5odUo1eXBBcXdxVEZkMFlsaUFXdlRk?=
 =?utf-8?B?UStIaFhTTG1GSXE2Njh6eEF2MFlNbHdPckhZQXhSQTVxOUFJRFZsZHFPUjU4?=
 =?utf-8?B?R3duQU5YYTlJQ29FUEMyMW9IbGMxQ1JTM1hYVkVBR2FtWEdXZWkySzhpQ0dx?=
 =?utf-8?B?djBzZTZJK1l2Z1llQktLTTNRQXNUcFM0VElzaEc1VE9tVlE3TUIxbktENmlV?=
 =?utf-8?B?bEFZMVY5dDRWTkFWZWtCSmVCT2paYXI0MzVRTTc2SnJtTGJXOEQ3ZXFTcDFO?=
 =?utf-8?B?aHN6V0ZUMzJyZGpORjNpcHN5SUZtN0xXbzduUVhDN2hwTW9aRlBWT0JockVk?=
 =?utf-8?B?L0dUUjVKRnpoeXZRbU9ubGFjMEIrNHFPS1IyYm9qUnhsL3ZxQlpONURGUUFO?=
 =?utf-8?B?SVkxbUZvdkpudFRoby9naSt2UmpYNGYzbW8xU2p6bVI1eml6aExZWlpVMUd1?=
 =?utf-8?B?OHZEMGlDSnNVQkd3TDVaK25Gc0liY2ltVkcwUkxmV3Nrc0txZUFOUVVVaU1E?=
 =?utf-8?B?czBYZE1icmh4dGw4RFh6NUxDNVRkRGNZNlJtL3hyYktMdXFZVktNNmFsS0tr?=
 =?utf-8?B?VWtVZFRZL085UGxNVUlWaitZelRUMjJHTm9Qb2pQN2lKelFVUWNXaVh0NkFy?=
 =?utf-8?B?cmZSR0NPbFVEQUFZbWFjNjlBN2hsdFFycm5BWlhSbEtWK1Zqc09CSHJMS0VV?=
 =?utf-8?Q?dvFUZSCJ/UhO8W1jdxDAVMKTM?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 8438fc22-3ab6-4f4e-e9fe-08db6b2fede5
X-MS-Exchange-CrossTenant-AuthSource: AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 10:29:40.3217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7wWozrrxyRZjn3uLkp8AYhjYlXzVifgudvCnuuwQyrlrFGZCCyGBMb7ygKhXoXsaQgR7C1x3kOw9SNvo5EWUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P251MB0512
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

First of all, please bear with me for writing this.

Should this appear email to be a criticism toward any of you,
be assured that this is not the intention. I'm
really grateful to all you guys, who keep improving the kernel
and allows us to use a free operating system.

My questions here below are basically along the lines of
"would it make sense to write this and that?". This is not
because I'd like someone else to do the work for me, but
because I really don't know whether it makes sense or not.
Should be wrong to make such type of questions without  
accompanying proofs of concept, then please ignore me, and
I'll go back into my cave.

Some background: I've recently bought a laser digital pointer
from HP. It connects through Bluetooth.
Since it did not work, I made a point to have it working,
even if I'm not a kernel developer, and do not plan to become a
kernel developer.
At the end, this turned out to be a two-line patch, adding
the HID_QUIRK_MULTI_INPUT for such device. Something that
would likely require less than 5 minutes 
of a not-so proficient kernel developer.

However, the process for me was much more cumbersome:
I had to navigate a lot o wrong or misleading documentation
in different forums, try to make sense of the kernel documentation,
understand what a HID descriptor is,
understand how to parse it, try to make sense of some 
unknown kernel code (mostly unsuccessfully), 
try with ebpf, try this and that... you get the idea.

Now, I'm writing because I _think_ I've learned something 
in the process, and perhaps it could be useful to share it.

Thus the questions:

1) do you think it would make sense to have some basic documentation
describing what a hid descriptor is, where to download the documents 
defining it (https://www.usb.org/ is linked from the docs, 
but this is not enough to get started, at least for someone like me), 
how to actually read it from the hardware, how to parse it... ? 
Very basic things, that, if I'm not wrong, are not currently 
covered by the kernel documentation, and that could allow 
someone else like me to get started more quickly?
If yes, I can try to write a skeleton for that, but I'm not sure
there will not be errors and/or omissions, thus it would likely need
to be fixed by someone more knowledgeable than me.

2) if I got it right, one can add a quirk like HID_QUIRK_MULTI_INPUT
while loading the usb_hid module, but not while loading the usb_generic
one (that turned out to be the module that manages my HP pointer), 
even if the statically defined quirks were moved into their own file. 
Would it make sense to add the possibility to
add quirks while loading hid_generic? Is this the right place for 
such code? If yes, I can try in my spare time to do this, 
even if I'm not sure I'll be able to get it right.

3) always if I get it right, currently it is not possible to inject quirks
using ebpf, but only to modify the HID descriptor. 
Is this correct? If yes, do you think it would be feasible and reasonable
to add such a  possibility? If yes, I can try in my spare time to do this, 
even if I'm not sure I'll be able to get it right.

Apologize again for this long email:
I understand it's full of good intentions but without any
significant contribution :(

Marco
