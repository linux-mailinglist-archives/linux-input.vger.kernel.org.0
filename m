Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB6C4D7807
	for <lists+linux-input@lfdr.de>; Sun, 13 Mar 2022 20:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235389AbiCMTuP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Mar 2022 15:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiCMTuO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Mar 2022 15:50:14 -0400
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-oln040092067049.outbound.protection.outlook.com [40.92.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BF755BF3
        for <linux-input@vger.kernel.org>; Sun, 13 Mar 2022 12:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vk/0ekT0f8wahDXiJPgUqXHB/+oOPZD0ds/3ynLYsdisw6vFQvKVmanP8kyz4tKw7SCb+5fAiLXqH9HpTiC6lIrrUPYU7RjVpGCWgqQCXCNi57ZXjLwoXFRf9VYqHIK0uSNGSvMhR2+R0cMTZ64/eVx6frekCgaEFU5muskV1AiqbU8W/6/0zKl951sRPXKtCzPnz34Iw30511ShqrW9mOIdl0m/WZRDVdTQWklWkRjmkz6DQRay6WTs3DB3gdLg1UGmjl6LhisQ79P+wQz/p/DahHtN0gzwCejsLz7xAnuF/79jZQebTttaCyPXXsFhA63oHak4Kptdy9MqKwMGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWzeuw5eRzcK1gkRodYvAy9TFTl964gIaBPWu54T3pQ=;
 b=AxBa+xcj/UGiUQSvbQsvr48X8LSgXTLQG05EzqULA3FwvQzTlj4ce8WRjiKV2IjB/cBoWzI53OYsxqicEKCIxcVG802P0L4azXIdyATilJviunSbt6iNDD5TtMM/Ij4eRBCV8aUFhReOHQzIWPP5seJXVSEiu1H/yyFly9tVEHbVKHQe2kz2wJVZWFspWq4oKFU9RbwJ2ge+F96HSe3PfmXRrb2CtMuL6PNiTApj9oyo9otiDFCMg+A2ZQ432QbyhPbzCXocbTAVUSuUkiwSyZT3+qn5Ss3ioGQzA8CfKf8s7Qs1ScRJGkputntPnGMN4q1zKaBv76iGJ58uUc+ZYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWzeuw5eRzcK1gkRodYvAy9TFTl964gIaBPWu54T3pQ=;
 b=aq5Twb7nMOEZsXJrX97SxDr2KBv3V8GMzIQGudwQWsR5dtm5DTtdaCjUs48OSK5zQLCrhIdKDbsYXad0/5Pf5B1/MaaV7pAg/YM1D2B2hUxv/7NdH8Oi8wS7ntFThqM42yb2gx16eRoPmYs28cI+tesm+rjtEq2EnKwc5VZZXBr/7OT56PVDyYAVD3ECaNQLQch/b9qqrwcmq0UCo9fx3B/ovVdYZud7aKnphO2me46uxnfRDV3xd2ojdbfHIsfHShdJ3aDMI9nThO2TgQxdjJcBrHDmc/Jk3Lb7OFAQ/AzovlDxFk1nV1Z0azPzzU8P8MVDVR+D5wpo4kW6acZCtg==
Received: from DBAPR04MB7366.eurprd04.prod.outlook.com (2603:10a6:10:1a0::23)
 by PA4PR04MB8030.eurprd04.prod.outlook.com (2603:10a6:102:cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Sun, 13 Mar
 2022 19:49:03 +0000
Received: from DBAPR04MB7366.eurprd04.prod.outlook.com
 ([fe80::cde2:76e6:f208:6d18]) by DBAPR04MB7366.eurprd04.prod.outlook.com
 ([fe80::cde2:76e6:f208:6d18%6]) with mapi id 15.20.5061.026; Sun, 13 Mar 2022
 19:49:03 +0000
From:   Jonathan Teh <jonathan.teh@outlook.com>
To:     linux-input@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jonathan Teh <jonathan.teh@outlook.com>
Subject: [PATCH] HID: hid-led: fix maximum brightness for Dream Cheeky
Date:   Sun, 13 Mar 2022 19:48:18 +0000
Message-ID: <DBAPR04MB7366AA271FE1A1022D96C0BD920E9@DBAPR04MB7366.eurprd04.prod.outlook.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [p7uatvXXH/0UKPQqGfqfj1FI7PlioOnx]
X-ClientProxiedBy: LO2P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::20) To DBAPR04MB7366.eurprd04.prod.outlook.com
 (2603:10a6:10:1a0::23)
X-Microsoft-Original-Message-ID: <20220313194818.13768-1-jonathan.teh@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81ef8d79-290e-48c8-ae85-08da052a86c4
X-MS-Exchange-SLBlob-MailProps: tBYDyRQCPclfnH/0UAfOFg3VcfzM92AUK3/tqtBfiAvTZ+0smU3iArrJS4yZSy2zEJkrGqgNqTvtAKTSKayCtrOGRXF2hQEJyRqerNnDnBnnFYXrXsYOfHICUFDwTsQsj/x9umB1d6/qy6mIDpczVCyx5yNFwNZvl3HH+0HFSrndlxWZMRtNDIltRNlgZmgdDpvb61Twj7EZoYgYogixW5v1IM6bIyWupwYpFNSRm5b9KPahQT8pKcJUJp3wzUnB3pSl0/Kz4J0EE4C0MzcdjX85kQE97icijVQR6MhFpgXjVvXlKxmVdsNMjWPERq6vtJyceWX7FyfaFoz9cllmEirz1BEVsrsShdd0bckmp496eec1w9heC49+H1yMKLgv355/zH/IHZVIxaGhxvK4TeCf9vAIf8lkfvMBQKOlp5lAhk9XvjvFjj3siYij4BNprP0DBi1bu2YiyutwbbMHYbzkAcSwpjYmQxhAILDSP75TA1U1kgrSFtXl2vEVPaqEYsDXDw9Q7DGh/jpLuMSSrrsHyKapm4XarTvAHvmuTyswgkqLlROK2uESHVL/g/GNS25tRWP0QfsFdZpa5pQjuVzgDnAO3Hw752tYUxhp3W6sYQL5OTXHTqfwDNouUi2pPL1X+k2N/vFY4a2s+MWwspujbHCSsqrbDNjG+haZn/OkgUTihz1QE0Gvy8RpDDreoC8wsaqjTcik+riJA7p/CAXOgph4dsFWUM/IAaheIDlenrOji3Et1ygJIdVbA7LyLOQKfDrKZdw=
X-MS-TrafficTypeDiagnostic: PA4PR04MB8030:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I4AHFcmwrHLHmza3eK7iZl73FvZL6PSWzdcnZyQFXXfuF8n+SoOfBIfLGG/I8lPdNq9RByIWEKUdked8QQnibbUcBWn7ncwbeyh4M7syJhUFT2rW3HqY85mO5ZqK462HYZqvbKQQ3Kcm77TJFTu0wqfYmAHiCchmT+C56pSepfEtc9LavaChoaGWB2PRRD2iNcWSS4Jez/a47AJ/Ii7lSEbR11eEDR5n9fh7/iBo43rMbM7A3TtHvzWEtlhMn/NW7kDRbbB9s2wSIDZ2zka35QPP++CbVupuYWjyCRDxjihlaNs8K31zZ1RtsnUem5PF5utbBA1DxI5kgqzjhbkU496jJyfL1zGTCupZC5St4JVfPtvRkT7MMx6XonVLymoM5fIokKch0Zc4GTDmoxQqu09YMZOAZDB0eyAGAoyGiz2IenTU9CEzAciLnb4oNJhWe+4lIJ30pFKfGNBkrDf1Qi3zA4cEkC7bBBeMP/rngzKet8ZJCw81hjRu1q760Xv8ofusdyODvawJD1yebheXl12EZ3iIM50bk8FGVNHT4QooqpT8+i189ImfOqHNDQZpE1HKvtjv8oOlyy4QH4y2GA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eSmMfGRCsm2olG2CIzMtjrHogpsWdZfDpyP0869gDfaFUZN8tKfsmUN0bIbJ?=
 =?us-ascii?Q?qYxwqfqaZbSu213nuSat3eOqPYK79kIHTBq2Yw10rtk2l7f9963gS4btKG2v?=
 =?us-ascii?Q?s4BE7nx4ibyTTNbxX11BUlRC5POCeJ3U9z4NT6ztzWNjb/SYAG4SyKTTfp4T?=
 =?us-ascii?Q?zx2DYySF8Gd/0Q3LK90qPzXgIxnW2VzbcERsvordZjTQP+ULoI6KOPfO45vB?=
 =?us-ascii?Q?qFEg2gyYGIDjmM7LuZvFGY8r1A7Z4dkqU6zeu96jI/m9QbQjoBOduHbFOMDJ?=
 =?us-ascii?Q?vfHTciHtC0aRtm9z4ni5AdjQVEqOkGhy8wHdYURsso44IWhjldDlzCe2zOcs?=
 =?us-ascii?Q?AKvavw2L3dR6t0Jbt1PSaLjUWPpaWb67o2TXOlES71T/YJR5CR4vuHiDdf1M?=
 =?us-ascii?Q?2wWJlu0X6JgVrU37q1ryRNRppJnDUpKZV4E7d//jSwlUqDrnAmNdOOJWY7Ny?=
 =?us-ascii?Q?e5wfqCj+SVVvwCcsnOd2joHkfIsu5qZ4LEKbF9Ap6Gz3nJcecErV3rYbzXes?=
 =?us-ascii?Q?/xF9711TJ0fqyChZotZLfbrtFYkWsZa6x7qg2knmgRbuk38TfuTnB1p+M48d?=
 =?us-ascii?Q?wekor4wtjeeT+mwQcqgXGlfzSoqfv6UYa14Cii7oaHduFsA+6/oNa2mfKA4L?=
 =?us-ascii?Q?QCIUUiComd0237dfNWCz4V2LEvhh3dBujwNS1X830TBT3SynKI+azsMspZgM?=
 =?us-ascii?Q?9VkXankeL3oFBVjC6IV0+cBGDpWyNxRLLF2csWIEtTWFEVukxg1BqfLfkGbe?=
 =?us-ascii?Q?DU7ULsHJBZ+RAfgFITDmQb8CASpNTfT5aeFIJR9XbCX3zeBSwLUgzfuAS20j?=
 =?us-ascii?Q?nOA8YWGJoEONvZF9EUZRVmD/W5rVj0jy9RCDketh/aNcJcKdB6UOi9gv01Eb?=
 =?us-ascii?Q?yFR9XdLpqYWrHmo/fuOZ2k2fbyyEZ4cBcHUQSIXej/YtFoEJUvxp8WkW45fq?=
 =?us-ascii?Q?Nrw9oE0VTyAA1h2CbrIXlE3Joubmdo6mPYIdkoy6NmCA87fu6JC2nOyzYuPT?=
 =?us-ascii?Q?HQpRe/cdiZYelITAImtbaswgrwzhZxajsEwuo4lWj3y8RZbF8asorHy6WB8Z?=
 =?us-ascii?Q?XS5dA3aOT9+Du2DrfVU5HJiOqeBGDa67pQQSG8mbybwdHIShmAZNQw6RqCKE?=
 =?us-ascii?Q?B/bAzB3gL9KAszetg+3AAXYiM6902nbAcQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ef8d79-290e-48c8-ae85-08da052a86c4
X-MS-Exchange-CrossTenant-AuthSource: DBAPR04MB7366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2022 19:49:03.5865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8030
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Increase maximum brightness for Dream Cheeky to 63. Emperically
determined based on testing in kernel 4.4 on this device:

Bus 003 Device 002: ID 1d34:0004 Dream Cheeky Webmail Notifier

Fixes: 6c7ad07e9e05 ("HID: migrate USB LED driver from usb misc to hid")
Signed-off-by: Jonathan Teh <jonathan.teh@outlook.com>
---
 drivers/hid/hid-led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-led.c b/drivers/hid/hid-led.c
index c2c66ceca132..7d82f8d426bb 100644
--- a/drivers/hid/hid-led.c
+++ b/drivers/hid/hid-led.c
@@ -366,7 +366,7 @@ static const struct hidled_config hidled_configs[] = {
 		.type = DREAM_CHEEKY,
 		.name = "Dream Cheeky Webmail Notifier",
 		.short_name = "dream_cheeky",
-		.max_brightness = 31,
+		.max_brightness = 63,
 		.num_leds = 1,
 		.report_size = 9,
 		.report_type = RAW_REQUEST,
-- 
2.35.1

