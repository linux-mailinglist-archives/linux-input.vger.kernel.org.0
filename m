Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 263B675BC89
	for <lists+linux-input@lfdr.de>; Fri, 21 Jul 2023 04:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjGUCq1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jul 2023 22:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjGUCq0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jul 2023 22:46:26 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2041CCE
        for <linux-input@vger.kernel.org>; Thu, 20 Jul 2023 19:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pg9kpuGZmYMreap0MYATIu5eOodRajXcedbHEnjSE7JSe1FEK7ELMQxyoW5KvYyCd2oNLrY8duY43Fubg0rwn7tvL7zsgKDmnS7JzWMTRdbgGE5YfZG+gALq7ttBp7Pb96pNwZArF1YH+XogY3PjmVq+LwlAG3OsLjQ7QpukgUMIjGdxcc4+PESMqEiSQj7NTJLa20V4xA+6IXv4kjcglwagHaiy/9CWC0yhvqC2iOmJMowZpyP0Ta0txqZ1LFE1bM1wWCI772dLwx7/GwiUqcL4YNGPrdw+xXwZnbv2B1dG6xubTN/GL6aOM5XxZHjCMNVmit22tk8LpEldRQtSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXg2D8eNEmtSTabQDJAARNX4YI0K0W2YTruIywzib8k=;
 b=IkVlSvnrSYphpNraakIKjTaeP5MDs+3kZdISq6lPAWbhTY5oKeKH+TdF8JNlVcxPtfX3oKlyEyDxsAsodNzEZggdSBWowvmuGJB1VFUecpk9G9a232mWWXyp0PXeWY6ecuFnJQix6r4hgHJMwZwMjjjyI7R1ag2ja5Lo17ouiM9UGLWAknszr4BpI9QFR1RMMA3kstzWYJCboqLmr4VHD2S/+9neh47myojs5dwhaYtA9d1r4eJYrt1w2aTVvqnqKQnm3wS7yGDGNJPhb7COYDv7PZqksA9R+UxFF0bAyzirvVanvhVYgAH56xQ6LA1QtyMiXZr0TFbpxTEcMLLAWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXg2D8eNEmtSTabQDJAARNX4YI0K0W2YTruIywzib8k=;
 b=kRB0c9Uz1W8qT6ODxt2L2PzKUJMcXWx4MPvs0DsGyBGvKxdtke+ebdZpaJdKXkHB9zF93h8h1JRkFwu9SGsxQEolhLwn4EX40AaXhkfjrf2Vw5adxhatky8mcnfoIN7c2F80aUxhptfssVJ4zC8uJZR5Mszuf5MfYNdtc70uMOX7ZNVUVcT85Z/+rL/0KjN94zOuojwxsO75kLlDimtebY2mbsQp3UTdDAPltP/2RPR95KLcfWy86bgHueR06QWelu0IpvPGDFV5V0PfysSpxr9UaJCb5su0l8XxrYMRa0+GRmxriGJP4O2vcATeMxhXUrG4jA9yYpWAeQN699Rhjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB2743.namprd12.prod.outlook.com (2603:10b6:a03:61::28)
 by DM4PR12MB5247.namprd12.prod.outlook.com (2603:10b6:5:39b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 02:45:44 +0000
Received: from BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::6933:8c58:b59:ba17]) by BYAPR12MB2743.namprd12.prod.outlook.com
 ([fe80::6933:8c58:b59:ba17%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 02:45:43 +0000
From:   Rahul Rameshbabu <rrameshbabu@nvidia.com>
To:     Werner Sembach <werner@rdorf.de>
Cc:     linux-input@vger.kernel.org
Subject: Re: Need information to implement correct handling of the GSP 370
 wireless headset
References: <e01dbcd2-3ce3-ebaf-e685-3b89601ae55a@rdorf.de>
        <f26c2aab-7c89-d6e4-b8c1-f6740e08b034@rdorf.de>
Date:   Thu, 20 Jul 2023 19:45:30 -0700
In-Reply-To: <f26c2aab-7c89-d6e4-b8c1-f6740e08b034@rdorf.de> (Werner Sembach's
        message of "Fri, 7 Jul 2023 23:22:58 +0200")
Message-ID: <87r0p2rnhx.fsf@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To BYAPR12MB2743.namprd12.prod.outlook.com
 (2603:10b6:a03:61::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB2743:EE_|DM4PR12MB5247:EE_
X-MS-Office365-Filtering-Correlation-Id: 06512eb4-cfb6-4abd-f685-08db899493e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BQllhhI2ldqy2MnXt9j/kaHOUK0TdlpCeBonjnnQbTWIuZvKfQ9rDHZJ9H48P0M9PGxdxap4gCkmuWWWSWtIwfh30x86mL4noTaKFOp8CGr3aDhLDg/Ls1g8BGxRjI6yKIAmM5fQHBsgSddAXCeIVsfZFXPzLzAaVGO8vGUdyqrWIPE4XMJbpdutnw8Aa3qMJHlq4pDn23gu4m2jL2v4piPo+cUCvu7G2YCLUW6ZvNNiCOnzeiQ0zLjYAc7rkwvHkuf33e/SiD1zHcJUnkI33TrU01+4kXvXZmsrsUzZTQ2Su/xWfebpGo7gG9tGaRVfwyaj4BggxHlG2kDvdKAITT3dnFdZjJ1Az9bQ6ChAknQCtTpPG5um23JTKFpu0TxcGHc3eYqxBoUGivVGM4jykhPABvQleQtsU1MBkzdvzJH4FRXV8DHm+B7Vadssiosp/hAQ7p+ctT3fBbakPL1JV6WaCZPhtDcxh5urzl6Kp8YY6b/DvF/mJ/sT81HRBinbEIOKcNmaJeXIDezdhNn/JFr9roYjEH0TPqGegu5VtFcC+5wl2f+cfOHiJmIRkQlLrPTiI+2dJw8QOnQcVOgY2EhaHAqOpZAm4tVlbLYMSh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2743.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199021)(6512007)(6666004)(41300700001)(6486002)(966005)(6506007)(26005)(6916009)(186003)(316002)(5660300002)(66556008)(66946007)(66476007)(4326008)(478600001)(86362001)(8676002)(8936002)(36756003)(2906002)(2616005)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QGPQGcFXllA7Rh+tDATEiIggtT4OewxSclXMXSQT/hJVwgMxhXVD0elrMPGt?=
 =?us-ascii?Q?nO5BJ36R5wK6+9IX6dpkjMitkNhIrTkIc7JDNzHHkZyxBpGc8jpGCtZv9nN7?=
 =?us-ascii?Q?s496cT7j6WvcbuRBs2lYxB0C8toNNV3zlWszkI7WeJE1+3IFvg+LWEWV2tki?=
 =?us-ascii?Q?pZt4BzeJCA7k5OHilnYJ86BIuBoa6Lyz3z3FZLZk7yFforsXWngWqHQG7Y8N?=
 =?us-ascii?Q?n9YRqmm/OWqNkZc+lWwntOF43bd+ut+SpeiX41+y+nqRvxYeSJbFt7RhhM5/?=
 =?us-ascii?Q?WFotAR3rauZLvrQSpDSzA+UYqa0YnuhfzC28f7Lxb3yCEAOWcekrEimsWJAI?=
 =?us-ascii?Q?hlxSmVY+lnH/N2P/wAT13JX8XSImDceyknKkjHVbJBq5LCioMys/A+UZLerB?=
 =?us-ascii?Q?qgi/1IofwYKZh9f4AxizxS2Ob995SnuNwWQBKDXBMcZiyep/UjT37bu3Qc/m?=
 =?us-ascii?Q?tHPfyvmAvR8TXtiH1U3RHG/UWZ8xFtKe4eqZ5TKBNcYtHMwlsRlNA5t5uG9W?=
 =?us-ascii?Q?uyTAowW4okgYEeMEgn8aneDEYrNLlIdj4lFErZa3ct1zSRpOwRdLRWcpYfwZ?=
 =?us-ascii?Q?b6ZL2VnAvbIUr3Sk0gbwWbGMHbBWWd21lgY03TgEHSDZN7OH3qUKAcsa3qAC?=
 =?us-ascii?Q?UfAiT2PudzEESptJTtpnqfw9oqn8eK3OsxvIu71jWVkSZ7TJ1H0Afs9XmRzz?=
 =?us-ascii?Q?btSpfrnKmeMOb5lvMt09VqJvKAAqjbqZDcLXGwzQ0401vbGNcApd9Hn8AWQI?=
 =?us-ascii?Q?N5dVdcEHv2zFa4/edjsoylWP4DOfN09ypsau95wKlRW6FsHXEvCk3JlueTdQ?=
 =?us-ascii?Q?Gmc6HIbf91wRiMbprelY1m2vvP8zttxLK4jT1bDnniqHGASzVjbwfooh2zJM?=
 =?us-ascii?Q?ARqaUES06w2hqV6RRkU5f9Fbk8w2uBa92kQ6xbl/zLX/r1fu9JTjSiGy/Jsb?=
 =?us-ascii?Q?Tta/fr5KuYpYsovCjGP8Fz3HeykYyOrhrkBfqP8KDuTw8BCClIPbfgt4eDLN?=
 =?us-ascii?Q?MD5H/gN/bwsS3ny8vq1gQuUcKsxZitKTznhzBBOF6BMw1YnM/1EDJmQKzlxR?=
 =?us-ascii?Q?VKfhNI7RkmJtdg01qI3ptCkpRMiVxQIDuGdfHmzsHSMTaEIWcS5YygRCy+/e?=
 =?us-ascii?Q?XwqXqTXQGUgCFA1MAewIu+ETeIrQsHtJp9K5M1+VqIE8/XnSLXjrmF41tq8G?=
 =?us-ascii?Q?2mv64XlGo5DqwJOuOORZvqDf8FrgS9psjvlWdVcFFvJrKhzCaZsCcG4GN+dP?=
 =?us-ascii?Q?UR+Z/hUfUTte4i8HHoyLl1hlzbTSnQxW5zWFXBlL/edY9nQL/x+drRhlVaP6?=
 =?us-ascii?Q?cPCHuAEYhNjl6cBWURIaZihfItYgIeYASAAiCZetlVFR/wdf21NLUeB9X5NZ?=
 =?us-ascii?Q?hEzMZBstz6ruY1uPzroACC6+h9qI67WREJao9npInHA4PjoRlfbggQC3FlP+?=
 =?us-ascii?Q?+75VSNXfTveidpk7f/ZEFun9xMVEq3SQ03GgmkofGpLW4D6JAKMuNCEmxqMC?=
 =?us-ascii?Q?B7CL+6PYuNeQ8DgT+/N7VfJAZhpD8i87IoDnlqzp0uTXFlckUePWEH2E7INf?=
 =?us-ascii?Q?e1IeNxr7Kq9mRw20zGviynDoYgjDlqWDD2W6cbhL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06512eb4-cfb6-4abd-f685-08db899493e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2743.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 02:45:43.3966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2eudhwa8O5XOCvYKdaybVnQcP42UwvtfpTxqC912mpl/9zRMeOZLyaN2aZ4RLYkv6+gNALCfNqfdDbuN/kOxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5247
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 07 Jul, 2023 23:22:58 +0200 Werner Sembach <werner@rdorf.de> wrote:
> Am 07.07.23 um 23:12 schrieb Werner Sembach:
>> Hi,
>>
>> The EPOS GSP 370 wireless headset has a volume control knob on the headset.
>> Turning this has 2 effects on Linux:
>>
>> - The volume gets adjusted in firmware
>>
>> - A volume up/down key event is sent to the OS and the volume is adjustet on
>> the OS level (the dongle registers both as a audio device and an usb keyboard
>> to do this)
>>
>> This double volume adjust is ofc not the intended behavior and induces all
>> kinds of wiredness, like the os is already displaying 100% volume but you can
>> still turn it higher because the firmware has not yet reached max volume.

What you will likely want to do is implement a custom USB mixer quirk
for the audio device advertised by the USB dongle. I delve into this
more in the section discussing which subsystem would be appropriate for
this.

>>
>> Running Wireshark on Windows and Linux I recognized that Windows is sending
>> "URB_CONTROL out" events to the dongle on volume adjust, which Linux doesn't,
>> these events have a paylode that seems to encode a volume value in 2 byte with
>> little endianess.
>>
>> I'm unsure if I can attach pcap file or if it will get blocked in the list so
>> i will send them as a reply.
> As I thought: The pcapng files are to big for the mailing list. When someone is
> interested let me know how I can send them (should I open a Bugzilla Ticket for
> it?).
>>
>> So my 2 questions are:
>>
>> - What are these USB "URB_CONTROL out" events? (Does not seem to be HID
>> reports?)

URB stands for USB Request Block. You are specifically working with the
USB layer here rather than the HID layer that abstracts away the lower
level transport interface.

URB in general is a system (OS) - defined format for interacting with
the core host controller driver in the OS stack. This means the
implementation of sending requests to the USB hub driver in Linux and
Windows differ. You may want to understand the specific requests made by
the Windows USB client driver for the headset and implement an
equivalent driver using the URB API of the linux kernel.

Generic Overview

  * https://wiki.osdev.org/Universal_Serial_Bus#Host_Controller_Driver

Linux specific information

  * https://static.lwn.net/images/pdf/LDD3/ch13.pdf
  * https://docs.kernel.org/driver-api/usb/URB.html
  * https://docs.kernel.org/driver-api/usb/writing_usb_driver.html

Windows specific information

  * https://learn.microsoft.com/en-us/windows-hardware/drivers/usbcon/usb-control-transfer

>>
>> - In which subsystem would I want to implement them? Or should this be handled
>> in userspace?

I am guessing you would not need to add any additional support for the
USB keyboard device advertised by the dongle. It's working fine and
advertising media keys to the system as you expect. Your goal now more
likely is to send USB requests to the headset (dongle) whenever the
volume level is changed for the audio device through the system. I
assume such a "driver" (quirk) would live under sound/usb in the kernel
tree just like sound/usb/mixer_scarlett.c,
sound/usb/mixer_scarlett_gen2.c, and other usb mixer implementations in
the kernel. Specifically in sound/usb/mixer_scarlett.c, I think you will
find the add_output_ctls function to be a helpful reference for defining
a new volume control that properly controls the device firmware volume
level based on the ALSA PCM level set in the kernel by user interaction
with the userspace audio component on his/her system. You will see all
these mixer implementations then get instantiated in
sound/usb/mixer_quirks.c in the snd_usb_mixer_apply_create_quirk
function.

>>
>> Bast regards,
>>
>> Werner
>>

Might want to ask the alsa-devel mailing list about how to go about
handling the device firmware audio control as well in the linux audio
stack if you did not find this explanation suitable for getting
started/want to inquire further about the ALSA kernel architecture.

  https://www.alsa-project.org/wiki/Mailing-lists

-- Rahul Rameshbabu
