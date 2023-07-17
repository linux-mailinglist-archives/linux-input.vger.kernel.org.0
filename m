Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3891756965
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 18:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbjGQQlF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 12:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjGQQlF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 12:41:05 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA62AA9;
        Mon, 17 Jul 2023 09:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjKm4u4Ct1hujvRC5l9jSP+KXW8u2uIvnmnoG0fr94d9WCeC9HGHb4z8WItqVYvEVgPo8pjF4NCeN16/EmNqEVkvzzTeH/awnav7YWULHKQck7aKFrN7Pf3LFtDT3VhKzuVe4VWSubI3OS8QgWKi+4kalKF9a2Ws7+Gyz3muWP8jNV3MqwPrWWxFvHlJSlyyuamByGGR5UilAq04Dy2/N5p5L77pb42tfVH4dLuUwrJDWy4CvWegOGRb+bkTwZLCsI8i+55ON+XuTEnVSUQRXNJmmvnSReY4vFTaAaZwloCxMAerAsEVcHKvloRBNnWrCeZDT2HbSu543MV2YaAbGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gHr/X9t9JC6uYBG9ohOydZON8mkXeqt8G7dYhjO5Q4=;
 b=DB0AWPKPd4s+lgxHtSS/n3rc4rKSeIqs0bF+xWq8n+TNIi9uReU79xpOmeL6iDi/jaOHmrcSDlehSczFdjZQoQm9WcoALVq5QjLxpY2c6j/QEGTEMOa/wGlZO+GwKmFYgCN9nvS16IZWa9KVn5ePMlSDWVGHcTQC2ZhlJtrxQJTxuFWFZcRK5s1MNkGV/ImMfpXGWeHwfYD+nQqoERnexgaW/MwQ+eal9KyvdU0fOdKQnHn5QDcEOx7OxsuoIkU0UhffKCjrvxHmmHi8EcwY9i71xe+TnT8ljpmlLiloymNhTyKCwUG2ssQJFmQ9Ldxo9orlIwwEVXwOGA/1sMzj/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gHr/X9t9JC6uYBG9ohOydZON8mkXeqt8G7dYhjO5Q4=;
 b=JLWcYtSeUyLDJV23JjcB297h0k6M64FWvPVqHR9PiSULTej5NBy6kMH9kwb/r+QAOPfLLCZ2Xd1GYrw6xZXFP93oCn1oG4PvlP61mufFmuI7snK20rXOCafLETMvUszy5Mblhusgni/gCqaRbm969bVcEyb1jcP4xvoDBlpKymkYzEWU0j83ItyXo3aBbIxtMtVvLJqkVx9aFckD6jn54+BDbOrUR3Vqlvgo1qQ23Shc7RHP5bDrN5M/2IUgOh1LtfOxGTw+Klogy0iYYq87HDuPNBfnYLlTnxbjZM1LB3vF0OyQMciltrq2uOi4/VRMcDZyGEIrRpFhPlcj1Z6JEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:416::10)
 by DU0P251MB0753.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 16:40:58 +0000
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8]) by AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8%3]) with mapi id 15.20.6588.028; Mon, 17 Jul 2023
 16:40:58 +0000
Message-ID: <9c021454-bb7a-a8ce-dc2d-ee9f168c9db5@polimi.it>
Date:   Mon, 17 Jul 2023 18:40:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Marco Morandini <marco.morandini@polimi.it>
Subject: [PATCH v3] HID: Add introduction about HID for non-kernel programmers
To:     Peter Hutterer <peter.hutterer@who-t.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Content-Language: en-US, it
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0183.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::17) To AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:416::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P251MB0350:EE_|DU0P251MB0753:EE_
X-MS-Office365-Filtering-Correlation-Id: 270c86d1-1865-4d45-40d2-08db86e49903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3V6s3/4Jl60WLhNU8xQvvVztxxrvI5qVcy+xbP22Nc40vh7P8U4Z/qE6iVMZmigYCH3CifP5sbBTu4lkXgVwkbw93+H0+u058m3DCjy5tN3N3vuS2vBjmEIJYHE8oIHUzXBGOSKr56petkdVT9dFEPUGj4B3g/t3TrBvR43Xe2+dxjqWQImkHfcBjIIbayVM3EhHMtguIY1x54yYACx4hlSW54moi1IVNB1xb/sWc6Ae+tmjftxlXokyMNXzh806D7X0/BfLzEf0AsBwng0LyQxd1C/JOjmDxYZtpRCegXLDJGwRNy8ouRuySGU6k9cdb97/3HPsNzTiXFM9rqitSyO3vTWuRJF2HFfDDmuU0HfDlosZ6CWK72MZwRuI15abp/5vctYf0M+gMrkwwX3+fIEUzUOtWWVL9T8VuT+4pifA2Kj3q1P83zCi3vjX1kAtNHpAvd6hRJJIbuqltAs05mB1uHVKuv9BxpzrmoQZQp1+sgdfx2Ln8K/yed0B6/a5d+AmlzZnSHejAc4kIQfxhUfNPeCANkKtN0OQbCLNnNt2C3jslrUrb76JjIjTE/OnO4LWS1mKLL2NiSyjhSWW42+urd4Gw2EYiqg7cUpwhl4JpCszDUz97RS4LsZwafGFuHfCVBepzEyxGHsbEonMOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P251MB0350.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(31686004)(66899021)(2906002)(110136005)(478600001)(6486002)(6666004)(8936002)(36756003)(8676002)(30864003)(44832011)(66556008)(41300700001)(66476007)(316002)(786003)(66946007)(83380400001)(38100700002)(86362001)(6512007)(31696002)(966005)(5660300002)(26005)(2616005)(186003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2R3K2RTM0JyYUwzd2p6di9rNkNLT1FhbjhjUFJuclRFRlpuRzN1UWJSTEZr?=
 =?utf-8?B?MmZrT3d4bDM3SnVvYVFaOWFqVmVhbWVqaFZ4cUtZaDE2Ujh0elNWS040QUxL?=
 =?utf-8?B?SHlJOVkycXdYOStMQVR2dmpla1VMVXdybG1RQWtDQmY5MTZuYldrWUk1aDhZ?=
 =?utf-8?B?NUx1V2EwS05icXhidmkrRkVOb3RwbFI2SVpOaVlnZnZGK1dsbzJvY3dXUjdq?=
 =?utf-8?B?bThtVnJpRHZaZTM5bzgwcHRaZDlYZlVTRW1ZSHVIVERwRXhuOUFkRllOVTND?=
 =?utf-8?B?THZLbndGSkd4bDQ5a3J1dXFyaEgwUC83YklYWGVNOW1RRTV5dUlBQjE4NzVM?=
 =?utf-8?B?cmhuMzdZaTlPNFZqYnhtc00yYXc3RDFZZDRnanNNN3BjY01VQzBVOGVpeFF4?=
 =?utf-8?B?S3FPbE9vTDdjSDA1c0VGL2JqUVM4dkZPZDQ4YjFDOXZyVTd5L2pmR0dMWVNt?=
 =?utf-8?B?N21rWXlaQUdsREk2K2FySnVSS2hnMHZqRmtBWVNNNmVxL3dOa3cxZDE4bFhw?=
 =?utf-8?B?N01Bb3Q4T2pramRqRHlJTEplMVFQNGJlNUxIOFZpVTBYM2NieE11N05oVWVu?=
 =?utf-8?B?S1I0NHd6MWtwTEZ2ZnU2Ni9EN3h4ZnlXU2NOcXZvcDlVd0MxTFg4d0FPdWM0?=
 =?utf-8?B?dTF3REJCeGk3cEJVOUNwbkpHaG5jVEdOcS9HcnFVbkZNVFk5bWJQc3NCRllO?=
 =?utf-8?B?VkNlN3hOZGdnL3A2Q3dacGh1ZUNJZWJWNTNKTGRJdmFib2ZWamRpTWRsVVBF?=
 =?utf-8?B?dit2VDIxYXluNDZVUCtvNDhuWUFzT1BVRmZBVkNGUlFBeEQ1OVRxVVZqQTBF?=
 =?utf-8?B?U0dadXFhY1FJcHRGMTFwZzQ2K2NmMzkrWDBIbDhTUExpOVFtc2JwVWc1NS9q?=
 =?utf-8?B?WURpcVhobjFqeEY2RUM2OGw3cElxU01PU3hwazdiSndwOXk3U25nYURUTVk4?=
 =?utf-8?B?ZmdoYkMwNHM1MENKd0cxTjRqdUZCbERKajRaWXNtVnBqMDkvQ0o0M0g2RmJX?=
 =?utf-8?B?TDJJMGFpRU52S01oVTVvZDQzQVN3OTVsd1dJRDlBV1phbW13UVRYdjAzeHhs?=
 =?utf-8?B?bnFzYk9vTGtZUXZwQU9STjFxN3FVZkhlOU5EM0ROL2dxWk9qUmJLN2ZNbDNW?=
 =?utf-8?B?M1N2RUFKQmJIcHk0QURpNEttV3BWT1FzTlMxb0x3UWllcHI5YzA2N3N1aHQy?=
 =?utf-8?B?dDAreGNDaFBoaFV1RFBBQlB0aGREWVhXVjNYSEZJdnNDdU1iRVVWRHNyYUVq?=
 =?utf-8?B?cTg2bkFia2lYSnNqMUFPRXRSd2d6NHVOUVNNTjhjUFhBNENlUXBGOHFNZkZz?=
 =?utf-8?B?OEVQUG4xWDAzZis0VHI3Q0Z6bGJNWTlqVjl4aWhIa3BpVlMxTDlVK1dFdzJr?=
 =?utf-8?B?aHhDMzlBNmlsK0NmU1l4Qko0VnRobWd4SlVFMmlYaXdIbHlBYzc1MXYvN054?=
 =?utf-8?B?QXd2TmdjSlpVR0VhbEpRS0FVMFljMlNsY1NtY1pvZkltdVlrUlBydlhTczlI?=
 =?utf-8?B?Um5NeFl5RWxmQlJuWWRGSDR1dXQ0L3RsMDIxdkJTRlUvUmxwRDVwdmNCZEZ6?=
 =?utf-8?B?Mm95L0xTeGNiVVJJcUIvaUlQYkkyV3hzS2dmUHRMVi9vVDRZVDF1NXhJY3BZ?=
 =?utf-8?B?SFJPYXFDMlFGZWhWWVVqYUJIN1ZNQmUzR3MwbVVjSFlGSFhjTCszaGw0OFor?=
 =?utf-8?B?YS91NW82emtrSWMyOUNza3hFZHJLd1VvMWoreTdWbm81bjdkZmJjc2VGd05p?=
 =?utf-8?B?dGZ4Rk84TmdaYkNVL1poM1lVb0JtMHZiTFZvSXlvNTU1WlFsWGhkaW1iRzZw?=
 =?utf-8?B?ZXJVTkIyV2U3WVRjb3Q4alVOZVhjODF3ZkhZdFBzbU10dFdhS3J5T3NzbjBn?=
 =?utf-8?B?djVua2hrb1B5dkt1QWZBSkV1bGl6OXlXVjJhc0p2WkkrSDJGMjFva3dNclhI?=
 =?utf-8?B?Q1NNMFlFUmY0NWV0K3JkMStpREpnZy9McFRvaDc5d1pSN1ZPNUF1V3JrQkFp?=
 =?utf-8?B?M1hxZkxuaDlDd0l6QVJaQXljRUxySkV6VWdsUmRReXRyMFdJNVkrR0QwUUtC?=
 =?utf-8?B?OXlZTE9ZMnZIN0xXb2Y1cmpOcVMycXBkTDkyWnJKcDVjU3I2VmJIY3Vxcnd2?=
 =?utf-8?Q?P/m43MK+RSfX6661ybdYKKNc1?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 270c86d1-1865-4d45-40d2-08db86e49903
X-MS-Exchange-CrossTenant-AuthSource: AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 16:40:58.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAW7DKu6/Bux1ZO2H3B1GzUvw+/LA9TI0Y5v230pB1o5oX+wK24yoyIejMtkzUOJV1r1aq+RpR6pgkWOYr6FaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P251MB0753
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add an introduction about HID meant for the casual programmer
that is trying either to fix his device or to understand
what is going wrong.

Signed-off-by: Marco Morandini <marco.morandini@polimi.it>
Co-authored-by: Peter Hutterer <peter.hutterer@who-t.net>
---
v2: https://lore.kernel.org/linux-input/70fdef05-d3b8-e24b-77be-901bd5be369e@polimi.it/

changes: 
  - corrections suggested in https://lore.kernel.org/linux-input/20230627060437.GA726439@quokka/
  - corrections suggested in https://lore.kernel.org/linux-input/f53e756f-7c81-1c79-23ea-b9009fdd2ef4@infradead.org/
  - corrections suggested in https://lore.kernel.org/linux-input/20230710021034.GA600582@quokka/
  - corrections suggested in https://lore.kernel.org/linux-input/20230717001544.GA129954@quokka/
  - some rewording of Documentation/hid/hidreport-parsing.rst

 Documentation/hid/hidintro.rst          | 524 ++++++++++++++++++++++++
 Documentation/hid/hidreport-parsing.rst |  49 +++
 Documentation/hid/index.rst             |   1 +
 include/linux/hid.h                     |  23 ++
 4 files changed, 597 insertions(+)
 create mode 100644 Documentation/hid/hidintro.rst
 create mode 100644 Documentation/hid/hidreport-parsing.rst

diff --git a/Documentation/hid/hidintro.rst b/Documentation/hid/hidintro.rst
new file mode 100644
index 000000000000..73523e315ebd
--- /dev/null
+++ b/Documentation/hid/hidintro.rst
@@ -0,0 +1,524 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+Introduction to HID report descriptors
+======================================
+
+This chapter is meant to give a broad overview of what HID report
+descriptors are, and of how a casual (non-kernel) programmer can deal
+with HID devices that are not working well with Linux.
+
+.. contents::
+    :local:
+    :depth: 2
+
+.. toctree::
+   :maxdepth: 2
+
+   hidreport-parsing
+
+
+Introduction
+============
+
+HID stands for Human Interface Device, and can be whatever device you
+are using to interact with a computer, be it a mouse, a touchpad, a
+tablet, a microphone.
+
+Many HID devices work out the box, even if their hardware is different.
+For example, mice can have any number of buttons; they may have a
+wheel; movement sensitivity differs between different models, and so
+on. Nonetheless, most of the time everything just works, without the
+need to have specialized code in the kernel for every mouse model
+developed since 1970.
+
+This is because modern HID devices do advertise their capabilities
+through the *HID report descriptor*, a fixed set of bytes describing
+exactly what *HID reports* may be sent between the device and the host
+and the meaning of each individual bit in those reports. For example,
+a HID Report Descriptor may specify that "in a report with ID 3 the
+bits from 8 to 15 is the delta x coordinate of a mouse".
+
+The HID report itself then merely carries the actual data values
+without any extra meta information. Note that HID reports may be sent
+from the device ("Input Reports", i.e. input events), to the device
+("Output Reports" to e.g. change LEDs) or used for device configuration
+("Feature reports"). A device may support one or more HID reports.
+
+The HID subsystem is in charge of parsing the HID report descriptors,
+and converts HID events into normal input device interfaces (see
+Documentation/hid/hid-transport.rst). Devices may misbehave because the
+HID report descriptor provided by the device is wrong, or because it
+needs to be dealt with in a special way, or because some special
+device or interaction mode is not handled by the default code.
+
+The format of HID report descriptors is described by two documents,
+available from the `USB Implementers Forum <https://www.usb.org/>`_
+`HID web page <https://www.usb.org/hid>`_ address:
+
+ * the `HID USB Device Class Definition
+   <https://www.usb.org/document-library/device-class-definition-hid-111>`_ (HID Spec from now on)
+ * the `HID Usage Tables <https://usb.org/document-library/hid-usage-tables-14>`_ (HUT from now on)
+
+The HID subsystem can deal with different transport drivers
+(USB, I2C, Bluetooth, etc.). See Documentation/hid/hid-transport.rst.
+
+Parsing HID report descriptors
+==============================
+
+The current list of HID devices can be found at ``/sys/bus/hid/devices/``.
+For each device, say ``/sys/bus/hid/devices/0003\:093A\:2510.0002/``,
+one can read the corresponding report descriptor::
+
+  $ hexdump -C /sys/bus/hid/devices/0003\:093A\:2510.0002/report_descriptor
+  00000000  05 01 09 02 a1 01 09 01  a1 00 05 09 19 01 29 03  |..............).|
+  00000010  15 00 25 01 75 01 95 03  81 02 75 05 95 01 81 01  |..%.u.....u.....|
+  00000020  05 01 09 30 09 31 09 38  15 81 25 7f 75 08 95 03  |...0.1.8..%.u...|
+  00000030  81 06 c0 c0                                       |....|
+  00000034
+
+Optional: the HID report descriptor can be read also by
+directly accessing the hidraw driver [#hidraw]_.
+
+The basic structure of HID report descriptors is defined in the HID
+spec, while HUT "defines constants that can be interpreted by an
+application to identify the purpose and meaning of a data field in a
+HID report". Each entry is defined by at least two bytes, where the
+first one defines what type of value is following and is described in
+the HID spec, while the second one carries the actual value and is
+described in the HUT.
+
+HID report descriptors can, in principle, be painstakingly parsed by
+hand, byte by byte.
+
+A short introduction on how to do this is sketched in
+Documentation/hid/hidreport-parsing.rst; you only need to understand it
+if you need to patch HID report descriptors.
+
+In practice you should not parse HID report descriptors by hand; rather,
+you should use an existing parser. Among all the available ones
+
+  * the online `USB Descriptor and Request Parser
+    <http://eleccelerator.com/usbdescreqparser/>`_;
+  * `hidrdd <https://github.com/abend0c1/hidrdd>`_,
+    that provides very detailed and somewhat verbose descriptions
+    (verbosity can be useful if you are not familiar with HID report
+    descriptors);
+  * `hid-tools <https://gitlab.freedesktop.org/libevdev/hid-tools>`_,
+    a complete utility set that allows, among other things,
+    to record and replay the raw HID reports and to debug
+    and replay HID devices.
+    It is being actively developed by the Linux HID subsystem maintainers.
+
+Parsing the mouse HID report descriptor with `hid-tools
+<https://gitlab.freedesktop.org/libevdev/hid-tools>`_ leads to
+(explanations interposed)::
+
+    $ ./hid-decode /sys/bus/hid/devices/0003\:093A\:2510.0002/report_descriptor
+    # device 0:0
+    # 0x05, 0x01,		     // Usage Page (Generic Desktop)	    0
+    # 0x09, 0x02,		     // Usage (Mouse)			    2
+    # 0xa1, 0x01,		     // Collection (Application)	    4
+    # 0x09, 0x01,		     // Usage (Pointer)		    	    6
+    # 0xa1, 0x00,		     // Collection (Physical)  	    	    8
+    # 0x05, 0x09, 		     //	Usage Page (Button)		   10
+
+what follows is a button ::
+
+    # 0x19, 0x01, 		     //	Usage Minimum (1)		   12
+    # 0x29, 0x03, 		     //	Usage Maximum (3)		   14
+
+first button is button number 1, last button is button number 3 ::
+
+    # 0x15, 0x00, 		     //	Logical Minimum (0)		   16
+    # 0x25, 0x01, 		     //	Logical Maximum (1)		   18
+
+each button can send values from 0 up to including 1
+(i.e. they are binary buttons) ::
+
+    # 0x75, 0x01, 		     //	Report Size (1) 		   20
+
+each button is sent as exactly one bit ::
+
+    # 0x95, 0x03, 		     //	Report Count (3)		   22
+
+and there are three of those bits (matching the three buttons) ::
+
+    # 0x81, 0x02, 		     //	Input (Data,Var,Abs)		   24
+
+it's actual Data (not constant padding), they represent
+a single variable (Var) and their values are Absolute (not relative);
+See HID spec Sec. 6.2.2.5 "Input, Output, and Feature Items" ::
+
+    # 0x75, 0x05, 		     //	Report Size (5) 		   26
+
+five additional padding bits, needed to reach a byte ::
+
+    # 0x95, 0x01, 		     //	Report Count (1)		   28
+
+those five bits are repeated only once ::
+
+    # 0x81, 0x01, 		     //	Input (Cnst,Arr,Abs)		   30
+
+and take Constant (Cnst) values i.e. they can be ignored. ::
+
+    # 0x05, 0x01,		     // Usage Page (Generic Desktop)       32
+    # 0x09, 0x30,		     // Usage (X)			   34
+    # 0x09, 0x31,		     // Usage (Y)			   36
+    # 0x09, 0x38,		     // Usage (Wheel) 		    	   38
+
+The mouse has also two physical positions (Usage (X), Usage (Y))
+and a wheel (Usage (Wheel)) ::
+
+    # 0x15, 0x81, 		     //	Logical Minimum (-127)  	   40
+    # 0x25, 0x7f, 		     //	Logical Maximum (127)		   42
+
+each of them can send values ranging from -127 up to including 127 ::
+
+    # 0x75, 0x08, 		     //	Report Size (8) 		   44
+
+which is represented by eight bits ::
+
+    # 0x95, 0x03, 		     //	Report Count (3)		   46
+
+and there are three of those eight bits, matching X, Y and Wheel. ::
+
+    # 0x81, 0x06,		     // Input (Data,Var,Rel)  	    	   48
+
+This time the data values are Relative (Rel), i.e. they represent
+the change from the previously sent report (event) ::
+
+    # 0xc0,			     // End Collection 		    	   50
+    # 0xc0,			     // End Collection  		   51
+    #
+    R: 52 05 01 09 02 a1 01 09 01 a1 00 05 09 19 01 29 03 15 00 25 01 75 01 95 03 81 02 75 05 95 01 81 01 05 01 09 30 09 31 09 38 15 81 25 7f 75 08 95 03 81 06 c0 c0
+    N: device 0:0
+    I: 3 0001 0001
+
+
+This Report Descriptor tells us that the mouse input will be
+transmitted using four bytes: the first one for the buttons (three
+bits used, five for padding), the last three for the mouse X, Y and
+wheel changes, respectively.
+
+Indeed, for any event, the mouse will send a *report* of four bytes.
+We can check the values sent by resorting e.g. to the `hid-recorder`
+tool, from `hid-tools <https://gitlab.freedesktop.org/libevdev/hid-tools>`_:
+The sequence of bytes sent by clicking and releasing button 1, then button 2, then button 3 is::
+
+  $ sudo ./hid-recorder /dev/hidraw1
+
+  ....
+  output of hid-decode
+  ....
+
+  #  Button: 1  0  0 | # | X:	 0 | Y:    0 | Wheel:	 0
+  E: 000000.000000 4 01 00 00 00
+  #  Button: 0  0  0 | # | X:	 0 | Y:    0 | Wheel:	 0
+  E: 000000.183949 4 00 00 00 00
+  #  Button: 0  1  0 | # | X:	 0 | Y:    0 | Wheel:	 0
+  E: 000001.959698 4 02 00 00 00
+  #  Button: 0  0  0 | # | X:	 0 | Y:    0 | Wheel:	 0
+  E: 000002.103899 4 00 00 00 00
+  #  Button: 0  0  1 | # | X:	 0 | Y:    0 | Wheel:	 0
+  E: 000004.855799 4 04 00 00 00
+  #  Button: 0  0  0 | # | X:    0 | Y:    0 | Wheel:    0
+  E: 000005.103864 4 00 00 00 00
+
+This example shows that when button 2 is clicked,
+the bytes ``02 00 00 00`` are sent, and the immediately subsequent
+event (``00 00 00 00``) is the release of button 2 (no buttons are
+pressed, remember that the data values are *absolute*).
+
+If instead one clicks and holds button 1, then clicks and holds button
+2, releases button 1, and finally releases button 2, the reports are::
+
+  #  Button: 1  0  0 | # | X:    0 | Y:    0 | Wheel:    0
+  E: 000044.175830 4 01 00 00 00
+  #  Button: 1  1  0 | # | X:    0 | Y:    0 | Wheel:    0
+  E: 000045.975997 4 03 00 00 00
+  #  Button: 0  1  0 | # | X:    0 | Y:    0 | Wheel:    0
+  E: 000047.407930 4 02 00 00 00
+  #  Button: 0  0  0 | # | X:    0 | Y:    0 | Wheel:    0
+  E: 000049.199919 4 00 00 00 00
+
+where with ``03 00 00 00`` both buttons are pressed, and with the
+subsequent ``02 00 00 00`` button 1 is released while button 2 is still
+active.
+
+Output, Input and Feature Reports
+---------------------------------
+
+HID devices can have Input Reports, like in the mouse example, Output
+Reports, and Feature Reports. "Output" means that the information is
+sent to the device. For example, a joystick with force feedback will
+have some output; the led of a keyboard would need an output as well.
+"Input" means that data come from the device.
+
+"Feature"s are not meant to be consumed by the end user and define
+configuration options for the device. They can be queried from the host;
+when declared as *Volatile* they should be changed by the host.
+
+
+Collections, Report IDs and Evdev events
+========================================
+
+A single device can logically group data into different independent
+sets, called a *Collection*. Collections can be nested and there are
+different types of collections (see the HID spec 6.2.2.6
+"Collection, End Collection Items" for details).
+
+Different reports are identified by means of different *Report ID*
+fields, i.e. a number identifying the structure of the immediately
+following report.
+Whenever a Report ID is needed it is transmitted as the first byte of
+any report. A device with only one supported HID report (like the mouse
+example above) may omit the report ID.
+
+Consider the following HID report descriptor::
+
+  05 01 09 02 A1 01 85 01 05 09 19 01 29 05 15 00
+  25 01 95 05 75 01 81 02 95 01 75 03 81 01 05 01
+  09 30 09 31 16 00 F8 26 FF 07 75 0C 95 02 81 06
+  09 38 15 80 25 7F 75 08 95 01 81 06 05 0C 0A 38
+  02 15 80 25 7F 75 08 95 01 81 06 C0 05 01 09 02
+  A1 01 85 02 05 09 19 01 29 05 15 00 25 01 95 05
+  75 01 81 02 95 01 75 03 81 01 05 01 09 30 09 31
+  16 00 F8 26 FF 07 75 0C 95 02 81 06 09 38 15 80
+  25 7F 75 08 95 01 81 06 05 0C 0A 38 02 15 80 25
+  7F 75 08 95 01 81 06 C0 05 01 09 07 A1 01 85 05
+  05 07 15 00 25 01 09 29 09 3E 09 4B 09 4E 09 E3
+  09 E8 09 E8 09 E8 75 01 95 08 81 02 95 00 81 01
+  C0 05 0C 09 01 A1 01 85 06 15 00 25 01 75 01 95
+  01 09 3F 81 06 09 3F 81 06 09 3F 81 06 09 3F 81
+  06 09 3F 81 06 09 3F 81 06 09 3F 81 06 09 3F 81
+  06 C0 05 0C 09 01 A1 01 85 03 09 05 15 00 26 FF
+  00 75 08 95 02 B1 02 C0
+
+After parsing it (try to parse it on your own using the suggested
+tools!) one can see that the device presents two ``Mouse`` Application
+Collections (with reports identified by Reports IDs 1 and 2,
+respectively), a ``Keypad`` Application Collection (whose report is
+identified by the Report ID 5) and two ``Consumer Controls`` Application
+Collections, (with Report IDs 6 and 3, respectively). Note, however,
+that a device can have different Report IDs for the same Application
+Collection.
+
+The data sent will begin with the Report ID byte, and will be followed
+by the corresponding information. For example, the data transmitted for
+the last consumer control::
+
+  0x05, 0x0C,        // Usage Page (Consumer)
+  0x09, 0x01,        // Usage (Consumer Control)
+  0xA1, 0x01,        // Collection (Application)
+  0x85, 0x03,        //   Report ID (3)
+  0x09, 0x05,        //   Usage (Headphone)
+  0x15, 0x00,        //   Logical Minimum (0)
+  0x26, 0xFF, 0x00,  //   Logical Maximum (255)
+  0x75, 0x08,        //   Report Size (8)
+  0x95, 0x02,        //   Report Count (2)
+  0xB1, 0x02,        //   Feature (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position,Non-volatile)
+  0xC0,              // End Collection
+
+will be of three bytes: the first for the Report ID (3), the next two
+for the headphone, with two (``Report Count (2)``) bytes
+(``Report Size (8)``), each ranging from 0 (``Logical Minimum (0)``)
+to 255 (``Logical Maximum (255)``).
+
+All the Input data sent by the device should be translated into
+corresponding Evdev events, so that the remaining part of the stack can
+know what is going on, e.g. the bit for the first button translates into
+the ``EV_KEY/BTN_LEFT`` evdev event and relative X movement translates
+into the ``EV_REL/REL_X`` evdev event".
+
+Events
+======
+
+In Linux, one ``/dev/input/event*`` is created for each ``Application
+Collection``. Going back to the mouse example, and repeating the
+sequence where one clicks and holds button 1, then clicks and holds
+button 2, releases button 1, and finally releases button 2, one gets::
+
+  $ sudo libinput record /dev/input/event1
+  # libinput record
+  version: 1
+  ndevices: 1
+  libinput:
+    version: "1.23.0"
+    git: "unknown"
+  system:
+    os: "opensuse-tumbleweed:20230619"
+    kernel: "6.3.7-1-default"
+    dmi: "dmi:bvnHP:bvrU77Ver.01.05.00:bd03/24/2022:br5.0:efr20.29:svnHP:pnHPEliteBook64514inchG9NotebookPC:pvr:rvnHP:rn89D2:rvrKBCVersion14.1D.00:cvnHP:ct10:cvr:sku5Y3J1EA#ABZ:"
+  devices:
+  - node: /dev/input/event1
+    evdev:
+      # Name: PixArt HP USB Optical Mouse
+      # ID: bus 0x3 vendor 0x3f0 product 0x94a version 0x111
+      # Supported Events:
+      # Event type 0 (EV_SYN)
+      # Event type 1 (EV_KEY)
+      #   Event code 272 (BTN_LEFT)
+      #   Event code 273 (BTN_RIGHT)
+      #   Event code 274 (BTN_MIDDLE)
+      # Event type 2 (EV_REL)
+      #   Event code 0 (REL_X)
+      #   Event code 1 (REL_Y)
+      #   Event code 8 (REL_WHEEL)
+      #   Event code 11 (REL_WHEEL_HI_RES)
+      # Event type 4 (EV_MSC)
+      #   Event code 4 (MSC_SCAN)
+      # Properties:
+      name: "PixArt HP USB Optical Mouse"
+      id: [3, 1008, 2378, 273]
+      codes:
+  	0: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15] # EV_SYN
+  	1: [272, 273, 274] # EV_KEY
+  	2: [0, 1, 8, 11] # EV_REL
+  	4: [4] # EV_MSC
+      properties: []
+    hid: [
+      0x05, 0x01, 0x09, 0x02, 0xa1, 0x01, 0x09, 0x01, 0xa1, 0x00, 0x05, 0x09, 0x19, 0x01, 0x29, 0x03,
+      0x15, 0x00, 0x25, 0x01, 0x95, 0x08, 0x75, 0x01, 0x81, 0x02, 0x05, 0x01, 0x09, 0x30, 0x09, 0x31,
+      0x09, 0x38, 0x15, 0x81, 0x25, 0x7f, 0x75, 0x08, 0x95, 0x03, 0x81, 0x06, 0xc0, 0xc0
+    ]
+    udev:
+      properties:
+      - ID_INPUT=1
+      - ID_INPUT_MOUSE=1
+      - LIBINPUT_DEVICE_GROUP=3/3f0/94a:usb-0000:05:00.3-2
+    quirks:
+    events:
+    # Current time is 12:31:56
+    - evdev:
+      - [  0,	   0,	4,   4,      30] # EV_MSC / MSC_SCAN		     30 (obfuscated)
+      - [  0,	   0,	1, 272,       1] # EV_KEY / BTN_LEFT		      1
+      - [  0,	   0,	0,   0,       0] # ------------ SYN_REPORT (0) ---------- +0ms
+    - evdev:
+      - [  1, 207892,	4,   4,      30] # EV_MSC / MSC_SCAN		     30 (obfuscated)
+      - [  1, 207892,	1, 273,       1] # EV_KEY / BTN_RIGHT		      1
+      - [  1, 207892,	0,   0,       0] # ------------ SYN_REPORT (0) ---------- +1207ms
+    - evdev:
+      - [  2, 367823,	4,   4,      30] # EV_MSC / MSC_SCAN		     30 (obfuscated)
+      - [  2, 367823,	1, 272,       0] # EV_KEY / BTN_LEFT		      0
+      - [  2, 367823,	0,   0,       0] # ------------ SYN_REPORT (0) ---------- +1160ms
+    # Current time is 12:32:00
+    - evdev:
+      - [  3, 247617,	4,   4,      30] # EV_MSC / MSC_SCAN		     30 (obfuscated)
+      - [  3, 247617,	1, 273,       0] # EV_KEY / BTN_RIGHT		      0
+      - [  3, 247617,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +880ms
+
+Note: if ``libinput record`` is not available on your system try using
+``evemu-record``.
+
+When something does not work
+============================
+
+There can be a number of reasons why a device does not behave
+correctly. For example
+
+* The HID report descriptor provided by the HID device may be wrong
+  because e.g.
+
+  * it does not follow the standard, so that the kernel
+    will not able to make sense of the HID report descriptor;
+  * the HID report descriptor *does not match* what is actually
+    sent by the device (this can be verified by reading the raw HID
+    data);
+* the HID report descriptor may need some "quirks" (see later on).
+
+As a consequence, a ``/dev/input/event*`` may not be created
+for each Application Collection, and/or the events
+there may not match what you would expect.
+
+
+Quirks
+------
+
+There are some known peculiarities of HID devices that the kernel
+knows how to fix - these are called the HID quirks and a list of those
+is available in `include/linux/hid.h`.
+
+Should this be the case, it should be enough to add the required quirk
+in the kernel, for the HID device at hand. This can be done in the file
+`drivers/hid/hid-quirks.c`. How to do it should be relatively
+straightforward after looking into the file.
+
+The list of currently defined quirks, from `include/linux/hid.h`, is
+
+.. kernel-doc:: include/linux/hid.h
+   :doc: HID quirks
+
+Quirks for USB devices can be specified while loading the usbhid module,
+see ``modinfo usbhid``, although the proper fix should go into
+hid-quirks.c and **be submitted upstream**.
+See Documentation/process/submitting-patches.rst for guidelines on how
+to submit a patch. Quirks for other busses need to go into hid-quirks.c.
+
+Fixing HID report descriptors
+-----------------------------
+
+Should you need to patch HID report descriptors the easiest way is to
+resort to eBPF, as described in Documentation/hid/hid-bpf.rst.
+
+Basically, you can change any byte of the original HID report
+descriptor. The examples in samples/hid should be a good starting point
+for your code, see e.g. `samples/hid/hid_mouse.bpf.c`::
+
+  SEC("fmod_ret/hid_bpf_rdesc_fixup")
+  int BPF_PROG(hid_rdesc_fixup, struct hid_bpf_ctx *hctx)
+  {
+    ....
+       data[39] = 0x31;
+       data[41] = 0x30;
+    return 0;
+  }
+
+Of course this can be also done within the kernel source code, see e.g.
+`drivers/hid/hid-aureal.c` or `drivers/hid/hid-samsung.c` for a slightly
+more complex file.
+
+Check Documentation/hid/hidreport-parsing.rst if you need any help
+navigating the HID manuals and understanding the exact meaning of
+the HID report descriptor hex numbers.
+
+Whatever solution you come up with, please remember to **submit the
+fix to the HID maintainers**, so that it can be directly integrated in
+the kernel and that particular HID device will start working for
+everyone else. See Documentation/process/submitting-patches.rst for
+guidelines on how to do this.
+
+
+Modifying the transmitted data on the fly
+-----------------------------------------
+
+Using eBPF it is also possible to modify the data exchanged with the
+device. See again the examples in `samples/hid`.
+
+Again, **please post your fix**, so that it can be integrated in the
+kernel!
+
+Writing a specialized driver
+----------------------------
+
+This should really be your last resort.
+
+
+.. rubric:: Footnotes
+
+.. [#hidraw] read hidraw: see Documentation/hid/hidraw.rst and
+  file `samples/hidraw/hid-example.c` for an example.
+  The output of ``hid-example`` would be, for the same mouse::
+
+    $ sudo ./hid-example
+    Report Descriptor Size: 52
+    Report Descriptor:
+    5 1 9 2 a1 1 9 1 a1 0 5 9 19 1 29 3 15 0 25 1 75 1 95 3 81 2 75 5 95 1 81 1 5 1 9 30 9 31 9 38 15 81 25 7f 75 8 95 3 81 6 c0 c0
+
+    Raw Name: PixArt USB Optical Mouse
+    Raw Phys: usb-0000:05:00.4-2.3/input0
+    Raw Info:
+            bustype: 3 (USB)
+            vendor: 0x093a
+            product: 0x2510
+    ...
diff --git a/Documentation/hid/hidreport-parsing.rst b/Documentation/hid/hidreport-parsing.rst
new file mode 100644
index 000000000000..1d3c17f29f2b
--- /dev/null
+++ b/Documentation/hid/hidreport-parsing.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================================
+Manual parsing of HID report descriptors
+========================================
+
+Consider again the mouse HID report descriptor
+introduced in Documentation/hid/hidintro.rst::
+
+  $ hexdump -C /sys/bus/hid/devices/0003\:093A\:2510.0002/report_descriptor
+  00000000  05 01 09 02 a1 01 09 01  a1 00 05 09 19 01 29 03  |..............).|
+  00000010  15 00 25 01 75 01 95 03  81 02 75 05 95 01 81 01  |..%.u.....u.....|
+  00000020  05 01 09 30 09 31 09 38  15 81 25 7f 75 08 95 03  |...0.1.8..%.u...|
+  00000030  81 06 c0 c0                                       |....|
+  00000034
+
+and try to parse it by hand.
+
+Start with the first number, 0x05: it carries 2 bits for the
+length of the item, 2 bits for the type of the item and 4 bits for the
+function::
+
+  +----------+
+  | 00000101 |
+  +----------+
+          ^^
+          ---- Length of data (see HID spec 6.2.2.2)
+        ^^
+        ------ Type of the item (see HID spec 6.2.2.2, then jump to 6.2.2.7)
+    ^^^^
+    --------- Function of the item (see HID spec 6.2.2.7, then HUT Sec 3)
+
+In our case, the length is 1 byte, the type is ``Global`` and the
+function is ``Usage Page``, thus for parsing the value 0x01 in the second byte
+we need to refer to HUT Sec 3.
+
+The second number is the actual data, and its meaning can be found in
+the HUT. We have a ``Usage Page``, thus we need to refer to HUT
+Sec. 3, "Usage Pages"; from there, one sees that ``0x01`` stands for
+``Generic Desktop Page``.
+
+Moving now to the second two bytes, and following the same scheme,
+``0x09`` (i.e. ``00001001``) will be followed by one byte (``01``)
+and is a ``Local`` item (``10``). Thus, the meaning of the remaining four bits
+(``0000``) is given in the HID spec Sec. 6.2.2.8 "Local Items", so that
+we have a ``Usage``. From HUT, Sec. 4, "Generic Desktop Page",  we see that
+0x02 stands for ``Mouse``.
+
+The following numbers can be parsed in the same way.
diff --git a/Documentation/hid/index.rst b/Documentation/hid/index.rst
index b2028f382f11..af02cf7cfa82 100644
--- a/Documentation/hid/index.rst
+++ b/Documentation/hid/index.rst
@@ -7,6 +7,7 @@ Human Interface Devices (HID)
 .. toctree::
    :maxdepth: 1
 
+   hidintro
    hiddev
    hidraw
    hid-sensor
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 7f2e8ba7d783..8d1699f355ec 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -341,6 +341,29 @@ struct hid_item {
  */
 #define MAX_USBHID_BOOT_QUIRKS 4
 
+/**
+ * DOC: HID quirks
+ * | @HID_QUIRK_NOTOUCH:
+ * | @HID_QUIRK_IGNORE: ignore this device
+ * | @HID_QUIRK_NOGET:
+ * | @HID_QUIRK_HIDDEV_FORCE:
+ * | @HID_QUIRK_BADPAD:
+ * | @HID_QUIRK_MULTI_INPUT:
+ * | @HID_QUIRK_HIDINPUT_FORCE:
+ * | @HID_QUIRK_ALWAYS_POLL:
+ * | @HID_QUIRK_INPUT_PER_APP:
+ * | @HID_QUIRK_X_INVERT:
+ * | @HID_QUIRK_Y_INVERT:
+ * | @HID_QUIRK_SKIP_OUTPUT_REPORTS:
+ * | @HID_QUIRK_SKIP_OUTPUT_REPORT_ID:
+ * | @HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP:
+ * | @HID_QUIRK_HAVE_SPECIAL_DRIVER:
+ * | @HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE:
+ * | @HID_QUIRK_FULLSPEED_INTERVAL:
+ * | @HID_QUIRK_NO_INIT_REPORTS:
+ * | @HID_QUIRK_NO_IGNORE:
+ * | @HID_QUIRK_NO_INPUT_SYNC:
+ */
 /* BIT(0) reserved for backward compatibility, was HID_QUIRK_INVERT */
 #define HID_QUIRK_NOTOUCH			BIT(1)
 #define HID_QUIRK_IGNORE			BIT(2)
-- 
2.41.0

