Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E355716245
	for <lists+linux-input@lfdr.de>; Tue, 30 May 2023 15:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbjE3NkQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 May 2023 09:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjE3NkP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 May 2023 09:40:15 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2083.outbound.protection.outlook.com [40.107.22.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A4DC5
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 06:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqwOXt7sH7C8ITJ+sMOPR2HMPXu8F4HPNWaaUGX4W2N6rujwnvf7YHLu+Hl3mcXrjDeOSLL0+95ht7PwWDnTf+uf+hDg+blK2vt7G1Dkm8niyIN/5EnFv/LZm4wo7DQ9Z6uS7LyFNSKXHiG71ZPnVOVffacurAEUx4ElZuT4Ordw4oFnxAnX5KJ7//JLaXKCpD1Zjq2uWfpBbnXd5HnJ8+SBydSUKowIpX8yS40DWIOxAJau65fvR9B/bDkQ7hrM6Nw7S00pj5rz5D5pui/FiYrPMHdmviZmDGgItRsH6QJE2rUuIFY1nSUC0euo8tm5mowpybiqyZk9rt4OrZahKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tN8qfVTZFfWmCfCa2QlF4F4FkgfPVMWN9XCpTbK4KH0=;
 b=a0TPdlFvCyBnyYi0QjlaUMxv7Om44t0nbqBOl1x7XacGW3Im1YcKjqYcg2AsVu3a1zv8wVtodGKvuoEn6K3Yn8Ke7g27RWwLMV8yZ8uTUL7O2Ronk/GOGmX+9BmMBjora3hioebMJKMjvkSwRxfSAdf66qugLxrzVg2yYHbqy4MWUPs98HFhXEl+/oLWDYQc6kt5PQ9W8uJ2FwehX58HQLBUGWWT2qtbpt2E79vV9Fg9uk6K+CTDneYcWCAEMpUvVghujoqOCsNLgHEol6jbzvgPzXJ6b1310uFK5KdaEWk3T4U/+AXbvwhgexb1smQ8ClZPRMCfidwlGkUPd+c6DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tN8qfVTZFfWmCfCa2QlF4F4FkgfPVMWN9XCpTbK4KH0=;
 b=Q4yJpovuMT06t1Qc1EtViNkITOEFKy8f9PKVNrJT65FztRw/JGzwmlBbJWsvr1eV9h3v/I3BWUdP7mUsJPLvUXvbeLBZ/ypCJrtNv0909bIlcHOMCEh1aqEq5HMmMLMxcWcTVt0RE444AESE3AAuewYYVxGkc7c+IHdaFTgNAvCo6qn+IcPwAw8XKTwCxGVjuUNWkXunvOH+w6B3kfdvox+uHPYpAlPHWK1djnKMRocd2px3T9XqD+ZyiP5h640y/YhjXhPlg/puE1sYQ06WAx6gBu2fgd0Mz66uVuFWx1Ds5587zUNryNc+P47a3kzNv6Te4X8xk7bRLejWAubqWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from AS8P251MB0339.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:404::9)
 by AS4P251MB0464.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 13:40:10 +0000
Received: from AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
 ([fe80::462f:7e42:f813:c3d]) by AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
 ([fe80::462f:7e42:f813:c3d%4]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 13:40:10 +0000
Message-ID: <eaa51a28-fe4a-a41f-040d-93e7a32d0a1f@polimi.it>
Date:   Tue, 30 May 2023 15:40:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Marco Morandini <marco.morandini@polimi.it>
Subject: [PATCH] HID: HP: add support for 03f0:464a HP Elite Presenter Mouse
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Content-Language: en-US, it
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0062.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::10) To AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:404::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P251MB0339:EE_|AS4P251MB0464:EE_
X-MS-Office365-Filtering-Correlation-Id: 722a79bc-b7d5-45b0-32cf-08db6113636e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tn6CdvW45l0RUyYgbblPFksrXd09pp79louG4xm3kPf6NBtKnZecdZ2VgGs2QzdMzQYauJ7dNIT6y5ke2288N6OkBVsvft7gU9F5Xp+iU1Cn23hfB+C0ektp0pZUEvFNNErYyMHXdkTaUoz+IuKGydVQ8tXhoyCPgHPwC80L6zTIOXQ+HeAURLSKMB+YjMCqXfCdqLJif4a7qXgadkzYfbvDRwL6xjEQlWApu9N+1h/ALMHeLypSdU+S2268z05pFEw4X7qhkrjzUrveZ/S9tu96XOU9i1toh0iBlWzvNPiNmdHaiQITuRMivgHlHm9Bf7XXVCFfg8Xxvqv/fbGCsLrCdxLDYKBZALYCbPTORDi/45Rrz2g6EwJ4+EPTeJpUKzzbLHE08v2uCBquzkg+E9e17o3B99IXf/boM9nonXcT3qLROB5d8puzoNi9EiXAMAX2NLMutdcdwY3aSlBhOapYOgPpQ14KdLddg8H0VROVKPFADPbF5FzneB1AkcJX8jNVAOjOUhb6FftMlBunTRDxvqEdzut05Vx1Ly8Rmhpj2iLwtNSZ7zaE3vpv/OXRPMablNMlPr5r/mKNxGEJ1h1ABFLgcsxh6AoGj0SgAkxHunBL72icO3SQ+gL3bcKti4dWQJQZSLK9BasNk7WpNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P251MB0339.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(31686004)(478600001)(66946007)(66556008)(66476007)(110136005)(786003)(316002)(31696002)(86362001)(36756003)(6512007)(6506007)(26005)(186003)(5660300002)(41300700001)(8676002)(8936002)(44832011)(2906002)(6486002)(41320700001)(38100700002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzdQOEpCMDRFR3dLQkNwdzZrYWRlb296WjIvbkZYbFB4N0pxMG9zeXBGSW1R?=
 =?utf-8?B?ZkZBT21scXg2MXZPK3J4WTEyQzZBdnUyckJ3US8zQm0wbjg0emxMMkNDTDFC?=
 =?utf-8?B?STdoOS9qR2YzNHBHWElueXRyUUFGUVdaVFExSDlSdGI4YTlTNWV2SmtyREM2?=
 =?utf-8?B?MXRNejZKekZoODJuQi90QldQdjBxQTlKeFlxVlNXNjJWWlQ2UzE4NzdtTHNU?=
 =?utf-8?B?ZkJ1bFpEMVhEOFpUdzkySGJPUFoxZEVMeWtoVDZLY1Y1Q1JIYXp3YjVFYy9w?=
 =?utf-8?B?cjd2RVdFdTVqRTlZSHRaOEdNMHZnUnI0L1NGd0hqT1NJUzBsbGR4NEd2bWQ5?=
 =?utf-8?B?TElhS25oRDIrQjJMVCtxbHVsRStjeVNNWmNoUGVtWFgrNy83Y0FuNzhnMzlp?=
 =?utf-8?B?MGp3WUVqak9iVWYwdGdqejlSUXljRytqdm8vYTY2MzVpeFhldVVCR2JvdWxV?=
 =?utf-8?B?SFRYRmpCRWtucHZQY2pJTEpkZktpUmZzc3duT3BsbGg2dzQ5dlFwNVMveDd2?=
 =?utf-8?B?ZFlUbUM4QzhmTDViN1BLcnZHY2RnTzZqK3IwWXpYRnNHTHlvYUhHYVR5TVVQ?=
 =?utf-8?B?OUt3Z1VxV1dFUVBtVEhGNGNvbWM2R202Umg1RTdrZ3ZzVmk1bWhvTjlwSDdQ?=
 =?utf-8?B?dVQ4ZnpQNUgrT1h1RkRkN3AyaWhKR2ZSRHRyR1J4NE52YzRSa0M3T3hFVHNI?=
 =?utf-8?B?bkNDbXd5cVBnMXBaL2c5aHBmSThKQkVBam1GN1pXK3FvR1ZXaTYyUm5UT0t3?=
 =?utf-8?B?YWxBUEI3VzN2MS9UOTViRkpWOVROUjZKZFZLYXdycUg5MlkrQUlHWElTa2Fu?=
 =?utf-8?B?eDJxR3hYWGtZL0I4bHBJWm1YRi9yTkN0a0JDaUt2c2FlZC9oWVJienpXaGk2?=
 =?utf-8?B?MjB4MEJyN084NGVsZ29ia0kwY3FmbWtNaDZZbythcDEvRGxIdWZZaEVIMVRX?=
 =?utf-8?B?UGVCR0JvUEQ3czQyVytSRVZSdTFWcmVuZGtBMXlXNVNaNjNNSS81dUsyR21G?=
 =?utf-8?B?VXBLUHp2eWVUZUlQTCtxZ1lBd0FkdWtPcTR0WVpSdHhRYjU2RmcwbHRJaGNP?=
 =?utf-8?B?aVZBVFJPTFdtbmxyRHliaVl1bzVWbnV2MUpVblVuL0psOW9QMjBHLzlKRmdN?=
 =?utf-8?B?NHVObm56eDVqT0Y5ZVF5SU5zTWpmNEVDaGI3eXZ1Ylk1UWN5YTEweTdYZGw1?=
 =?utf-8?B?ODZnbUg2YXZEMUczUHN3TzFSR0s4U0hQODBiNTJhQ3MwZ0FsMVoxbWpjTldK?=
 =?utf-8?B?N1F2UVdaSGVDRjJ4YlkyOWhXTG96dU40SG9NTlJ0NCt3R3hiMngwNlBFaHlF?=
 =?utf-8?B?UzZSUFo1ZHVmRmtJYzNoRWJxeTRkZmNnWEcyWUhxaG5tWUd0WFJpUkIva0RF?=
 =?utf-8?B?VVJnV2lRbzFKdDBCNS9ITk1kU0hJVXh3NEJISXZJSEhJK3FNanQycVNlNURN?=
 =?utf-8?B?K3U4dUFncnN5VjJ3dzlBc1ZnUVRCVHB5d0E3Q1I3TXBIaWdpZVU5ZG81eVBh?=
 =?utf-8?B?QlBoL3JHU3pQZituOEVHUXVyVFhFVkpjWEVpY2grelpQT21kMlJLZG9VZkRl?=
 =?utf-8?B?VUpBc25IN0tjZWJUaEEyd2RXVTVET09makhNTGhpODM5MFlnS2NpZ3V0V2R3?=
 =?utf-8?B?VHByb1E3bU9EZ1JMbTB3YWowZ0RlUGdtM1ZJM1phdEJNUE1HQmdKSVhsRjdh?=
 =?utf-8?B?MHVMOGFENW5qV0JpaHNQKzUvTzJZYU9qL0hXM0s5Ymo5bUpvSmUxZFd5SGJ2?=
 =?utf-8?B?TndEREp1dzVoT0hhUVFEOXlyUjdscnJNUjFOUEswTVdJSmJFem1qMDhGUk9X?=
 =?utf-8?B?TVh2NTFYOUhEakFBODgxdVZWL3gvSmRlMExOTldyVzd5c3RaeDRMYmtySkdu?=
 =?utf-8?B?bVBSVThNNTloV1FmbDg2dlBZWER4RDkwN1YrZHhkNlRlRGJaUWRnUlc2bTJh?=
 =?utf-8?B?QlRnRzlYYUl3c2M1aVlMRTI3czJqcVZMYmxQcEFOYmg3V21PdmFXcDUvOG1i?=
 =?utf-8?B?VGdXSmJIeWQ3NTVHM0JxeStZL0lpZ2xVWlk5ZHRuYVpWODU0MFVIUmlYNEow?=
 =?utf-8?B?UlAzYkR6clBaMUZ5UzBsMTdzcXkzQTFmd1FUa3NrTER3aklzSktxa2cxUTkv?=
 =?utf-8?Q?FhO1PuMHXiW3Jd+grwoktFE25?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 722a79bc-b7d5-45b0-32cf-08db6113636e
X-MS-Exchange-CrossTenant-AuthSource: AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 13:40:10.4721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oswjwtZDRmqjt6p4/Z+QcHgHMxGqygjEHNDiPMc4vAXJvdNOItvqMilYkBUoyE+9PoHooCLkYX9USErJOmSzQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P251MB0464
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HP Elite Presenter Mouse HID Record Descriptor shows
two mouses (Repord ID 0x1 and 0x2), one keypad (Report ID 0x5),
two Consumer Controls (Report IDs 0x6 and 0x3).
Previous to this commit it registers one mouse, one keypad
and one Consumer Control, and it was usable only as a
digitl laser pointer (one of the two mouses). This patch defines
the 464a USB device ID and enables the HID_QUIRK_MULTI_INPUT
quirk for it, allowing to use the device both as a mouse
and a digital laser pointer.

Signed-off-by: Marco Morandini <marco.morandini@polimi.it>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index d79e946acdcb..8afa1149cdf2 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -619,6 +619,7 @@
 #define USB_DEVICE_ID_UGCI_FIGHTING	0x0030
 
 #define USB_VENDOR_ID_HP		0x03f0
+#define USB_PRODUCT_ID_HP_ELITE_PRESENTER_MOUSE_464A		0x464a
 #define USB_PRODUCT_ID_HP_LOGITECH_OEM_USB_OPTICAL_MOUSE_0A4A	0x0a4a
 #define USB_PRODUCT_ID_HP_LOGITECH_OEM_USB_OPTICAL_MOUSE_0B4A	0x0b4a
 #define USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE		0x134a
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 804fc03600cc..3983b4f282f8 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -96,6 +96,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HOLTEK_ALT, USB_DEVICE_ID_HOLTEK_ALT_KEYBOARD_A096), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HOLTEK_ALT, USB_DEVICE_ID_HOLTEK_ALT_KEYBOARD_A293), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_LOGITECH_OEM_USB_OPTICAL_MOUSE_0A4A), HID_QUIRK_ALWAYS_POLL },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_ELITE_PRESENTER_MOUSE_464A), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_LOGITECH_OEM_USB_OPTICAL_MOUSE_0B4A), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_094A), HID_QUIRK_ALWAYS_POLL },
-- 
2.40.1

