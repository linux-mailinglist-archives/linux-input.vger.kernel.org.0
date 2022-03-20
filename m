Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7C74E1989
	for <lists+linux-input@lfdr.de>; Sun, 20 Mar 2022 04:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234035AbiCTD1p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Mar 2022 23:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbiCTD1o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Mar 2022 23:27:44 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90CEDEC8
        for <linux-input@vger.kernel.org>; Sat, 19 Mar 2022 20:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0htjbRp/g8+92v7zuS0Z2YOmKT7xkAwn1uNedD+PX2lJY1v8i8XzZC8bpYAKSTYwZd+6MHSNjNw61CfeBKCwp6E0tpNBhV6iOyifhL16uuF8Z2gAwI952zAEM866oBdS+/AxfcMzYkOWHgX9tLLFk5AtymaB9hHIqZ0hCIEBnUfwewhOWvcgqdn16uR0eB3bUOlj5bqnqejU4uKL55ak3fNJXKdPuU5lvOS2u972YOI+48k17HVIRAFx+ZIKUNNqVjJLMYS63MUQPOyZ2lc0SjXcojoAQ8ke3QrWZfYcDkpCDpDHmf7OyiFx+8PQaKR0xinFn9uiGQ84WD5dWDRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OctkXTKE2q097gSw2BNdaaec+gStWS8nCHpL5qvi2Qo=;
 b=CYS8T4vmUtiSpOl/XxdN7Qml0yU+LluRs3bTreBXnuZE/zOim56VykCfw05Ja/gwAjTYmBHH6dbY0hhlLGnKaaWTff7nFsRDwx+S7zPAXSC7h1VL0dSdrRpcs6DX6Z+GQk5eFqV11eOlDxV7o2+po20DcK/MIDcWZqT50Spy3sV+SBB/aqVOtWtEDjVhZXODZLwUI3JHh4d9KxgGCTZjpsDM4f+jkXJwNeH4a3zZ7q4jP9cZew9hqyY1RRC+YkqsrOhQcdVyaL8juJqRKrMVpIUhiatOD0IKn5FPpmU3HM218Lgs32ZHbl26l1HwPlp/uQZhBvSYSYcnArevThR8eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OctkXTKE2q097gSw2BNdaaec+gStWS8nCHpL5qvi2Qo=;
 b=Zqw0k5E7MHsQ+5F6aTC7hFJkj3oKmkOEfFtBNfngaEBdJ9DldGbp7jCm/o8cOtI0RGI6a7WK3r3ha7+A9N8bx8C0U1dlrf+j/ELUEUI+b37tlmV84JpOlEBh24t28BQjH81sqQvVoTJguuPs36NwE+VffIwnRGnpxGQeJBZdwGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by SA1PR08MB7101.namprd08.prod.outlook.com (2603:10b6:806:18b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Sun, 20 Mar
 2022 03:26:17 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::3d7d:ce41:a265:4481]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::3d7d:ce41:a265:4481%6]) with mapi id 15.20.5081.022; Sun, 20 Mar 2022
 03:26:16 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
        =?UTF-8?q?Tomasz=20Mo=C5=84?= <tomasz.mon@camlingroup.com>
Subject: [PATCH] Input: add bounds checking to input_set_capability()
Date:   Sat, 19 Mar 2022 22:25:37 -0500
Message-Id: <20220320032537.545250-1-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::25) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a83e371a-a2d9-417e-e0d9-08da0a21647f
X-MS-TrafficTypeDiagnostic: SA1PR08MB7101:EE_
X-Microsoft-Antispam-PRVS: <SA1PR08MB7101295C080F8D2F87EC510CD3159@SA1PR08MB7101.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 264F9l63oaUaPLRDB+TCIFnZavYUkWR2f8ijeRRj8A+I6F0HwBD7BvRS9fVUMQN33sIZ7Z4ZNNcBrZ7FmHt1mzBlQsn+1ptaej3AOjxSgfNpD71ljEzYteOvctnjcgMSlqASpuk81FuZmSKdOvLqIKbwA9Y3RLPjHkzmibwZZP7wUBiYU6K69v/lS55yVbRDiM1hXrvjhhv9ncL8x8LuAy4knqVwfpBQ9X9XiHyWsLyYwoYffMgGOqq4blthYaMQiUQFPzaDZE2fqYUdPeePJ9RgfsrxRu6usjGm3Vly3O+DQ0dYlQhNVv/5DQueq1rfy4purm+3wFSZ1L1tcD1yISKEn4YnFbmKB0nacOVjYpxrUUy/ZZ01CQpdaL1YjXpWDbNbbgRAUcKbSmTWk5MAp2k35HU8wdQYX4IZ0ONCR04CR0qhEV8YnaAOPY6BWLY1w5KdqmDmDa5YuYYf/Fq7Mf6CXpP+FQwMe1/U6HLl2eTtJv5VMZl0zavbjH5Mw7uBuNLeUbTf9DHQ0m5i3w2MQdiScSF0ebfHWWIU1RX8dLNBSM7hyR8rhVC97dpaIbIF4xqy4KB8SAcmL3szkl9tGEqTU7eJEVpp/wh/cvtZsulJVgxSHYXC1dnu5i0R7GhZlv5Yj9J+tc9xaRk+8xQznieV0rb8GfnX/Mg83JcRdb3ote2FRCKgj3yrmYtMYAGzInvVPPGBxwFj/vGfAIGjKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(376002)(346002)(396003)(136003)(39830400003)(366004)(66556008)(4326008)(66946007)(66476007)(6486002)(52116002)(6506007)(6666004)(2906002)(6512007)(186003)(8936002)(1076003)(26005)(38350700002)(38100700002)(508600001)(2616005)(5660300002)(86362001)(8676002)(36756003)(6916009)(54906003)(316002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1NyZU1zVmxQK0xXTlJQNGpPanlsL21FRjVFVDBGaTJCZkh6ZEowQlpaYURw?=
 =?utf-8?B?ZG85SENxaE9Nd0dHajZ3MGQ3ZUtGY216akhLUkhOWkhMZzQ2ekRWamZHUHN6?=
 =?utf-8?B?TmdUL0FTUGhvbllBTHpsSEUvNWpDMFo5OVMvdUNwUXRsTjM1Qjh3b2JubW9Q?=
 =?utf-8?B?MnJTN3FYOVBrTTZ1M1BzMElzWCtkNkF0bC9iZU5TdTNKZzYyQ3dzbEMyUnZV?=
 =?utf-8?B?SVV1SU8yQld4R1dOZDlJazhsanRvL0M1ZzA0OXRGZXhxMi9nQ2xidmt3Q3gy?=
 =?utf-8?B?Q25EOUQyYkdmWFdFWGp3N3dtcU1PUG1vSjYxdWtPM3RPOXZTeGlWWVdSMkEx?=
 =?utf-8?B?NmJ2TURhK2E2N292VXFZRkFhRXpuQ0pnaENDMGdsRXN4a0tsUXNYZzlCdDU2?=
 =?utf-8?B?SVVDTXk3ZEVhbWJSWkkxR3h5SGp6dldjOHd3UWNpTGtRT0c3N3pHdVR1WlFp?=
 =?utf-8?B?bkF6bFE4dGsyeU85TWY1a3pvWkVoU0sxcFYrZ0JhWi8wdDlUV2RzZDZRWmdz?=
 =?utf-8?B?anFzWjBJMDd1QkR5SUlReE50b1hsT212TmwzM1N3b1pKdnRuNGhtb1RqTTVU?=
 =?utf-8?B?NGZuMUVqUWFTQm02clRuTGFlbCs0OXlrVWk4MDdlV2VrVEJabUNIaE01b1RQ?=
 =?utf-8?B?ZW1tRkt4RUk5bzE3V0RxbmNZQy8wVy82REcvcTNOSjdNb0tYbmNKTjIxM3Vv?=
 =?utf-8?B?SDdGdDN4a2tmNnQ2dHZUVm94KzdNSm5HbCtYVGdmeXZSTk5qN2VPdm00aGxw?=
 =?utf-8?B?elVtZGlHaVRQM0R6dVU1RlloUCswLzhMT3U0VExSSnIxN2RyS1NCcm85V3pS?=
 =?utf-8?B?OFIvelltQzlSUW5UREtkbnIzMlNqYmRIK0gyN2VjemFKaW5Ydzc5RFZyKy9J?=
 =?utf-8?B?WExCOUJyOE1BM290d2N2TVR5enNZdHVhRTZQblJlTG5FZ3NMaGtqbjhLeDc0?=
 =?utf-8?B?anpwTmthcUlETmVFL2pHdmw1Y1ZrU04vMnNaNUE5YnZpUkJYZ2FWWDlHbklI?=
 =?utf-8?B?elZwSkN6ZzVTSE9TQm1JcytYWHlmOUh0YWs3OVNCRzhaTWF3TmhyQW5wYVIr?=
 =?utf-8?B?N0dySWd1Y092cENWM0tmdTlKTkFHN0FnZGdmdmIySmZNcmZDT3NTUTZ2MmxH?=
 =?utf-8?B?djVHeTg0cnBKVXNSemVEU1dOejROSkpnZkhHWmFJQmpMbDdCakdGenZ5SkYr?=
 =?utf-8?B?U2VEaFZlenRiWTMzNVBlb0xoWVBCV3RsQitGOTJiQ1kvMU9GV2I3elhnQUp2?=
 =?utf-8?B?V1FEbjBqeWk0WE91U0EyMXVzQkVIK29XN3k3ZWlMcTEvWkp2RXVHK2FMMEFu?=
 =?utf-8?B?Qmd5dFhhQTlDMURBaXlNcXNVVUhqVzd6YWxMRWxYRGdWazdqdHc5V3MxNXp2?=
 =?utf-8?B?QWpId0xMTkhPeGh0NW84aGoxMnlZNk82TmNkeW9ncDAycUtQSzNUNmZnaVR6?=
 =?utf-8?B?eUwzY21PUlB2eXVCNVEybWZYbUtReWtab3EySjVZSUZBaXlMNHhteGZFQW9o?=
 =?utf-8?B?Z0dYSzlCTDc0a2x3LzJwbVViR2ZvR2hGU01jZk5MYVpwU0VMdVV4WHh3ZU1J?=
 =?utf-8?B?cjJkcURuZVBSRzd0VWpIbDlwdWdnTEIzc1ZzZHNSTzlGL29YK25KWGd5UjMv?=
 =?utf-8?B?NEdKNnN3eE5FVTg5REZoaVkrSjdCRHg4QXBKSExNbnJaMkg2QUwrME5FMFpF?=
 =?utf-8?B?cmJ3VjV3SGQ4VDVLUlN4dG1TeXF2L25wcFV3SG9xZ2dlUG1MTGhiT2Rvc1R2?=
 =?utf-8?B?Zk9OUlZkRU1FbmtsWUgxckwwcHFOeEhQL21wVFlEUm42Qi84NWJVQkNyRHNt?=
 =?utf-8?B?LzlYMDhGaC9TU1BMZkJvRStlK0wwZDZ2ekwzOW9kazVzMjErTkkwRnhyRUxD?=
 =?utf-8?B?a25kc0ZQY2VsbmhsQWdIS3pQdjBrYWdyWkF1TW90QktWSUl1aWRXR2lJWkdW?=
 =?utf-8?Q?JLVYI4Qhl00Ux9egfeNcjIiJ58g64p1M?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a83e371a-a2d9-417e-e0d9-08da0a21647f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2022 03:26:16.4209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPkP4ymQZUSG6GzCqcAki1IFxIxSO9FAyXH4MhUq9+MYnO+8cQ4fIGFJvj4eSiNmPu0TA3cB6Y1Do1aMUgk2Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB7101
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Update input_set_capability() to prevent kernel panic in case the
event code exceeds the bitmap for the given event type.

Suggested-by: Tomasz Moń <tomasz.mon@camlingroup.com>
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reviewed-by: Tomasz Moń <tomasz.mon@camlingroup.com>
---
 drivers/input/input.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 7c7e4042ec10..6428cdacf534 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -47,6 +47,17 @@ static DEFINE_MUTEX(input_mutex);
 
 static const struct input_value input_value_sync = { EV_SYN, SYN_REPORT, 1 };
 
+static const unsigned int input_max_code[EV_CNT] = {
+	[EV_KEY] = KEY_MAX,
+	[EV_REL] = REL_MAX,
+	[EV_ABS] = ABS_MAX,
+	[EV_MSC] = MSC_MAX,
+	[EV_SW] = SW_MAX,
+	[EV_LED] = LED_MAX,
+	[EV_SND] = SND_MAX,
+	[EV_FF] = FF_MAX,
+};
+
 static inline int is_event_supported(unsigned int code,
 				     unsigned long *bm, unsigned int max)
 {
@@ -2110,6 +2121,14 @@ EXPORT_SYMBOL(input_get_timestamp);
  */
 void input_set_capability(struct input_dev *dev, unsigned int type, unsigned int code)
 {
+	if (type < EV_CNT && input_max_code[type] &&
+	    code > input_max_code[type]) {
+		pr_err("%s: invalid code %u for type %u\n", __func__, code,
+		       type);
+		dump_stack();
+		return;
+	}
+
 	switch (type) {
 	case EV_KEY:
 		__set_bit(code, dev->keybit);
-- 
2.25.1

