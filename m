Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85DB678C7F3
	for <lists+linux-input@lfdr.de>; Tue, 29 Aug 2023 16:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbjH2Osu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Aug 2023 10:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237111AbjH2Ose (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Aug 2023 10:48:34 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2077.outbound.protection.outlook.com [40.107.6.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8D4CE0
        for <linux-input@vger.kernel.org>; Tue, 29 Aug 2023 07:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lf7uvUYF3yVCxYKEqrvD4BcCych+hB62QMi6IZuE4P/fev8hrPEMFM/+SEk42NLXWeuMjHZzTMGIUULU11huf4kYZe5xFjZ9hMtqvXYZmp8hK4k0fThg+l3P6GKamyIU2rDtdAKTF3YBSMUoRHYFAy0W8XEBUvC68mlluWlC5WIXgqJ5WKUDBxdMIAibQBTlUMyvKO7dSnRQjJS6kBtlq1mdM3H2fRAmdYdpz9A57+LarlYIhYCz9PYy5G1YEDDsW3eTgbvYKpWzAdDqPx9MzV16XH3N049rpgsX8dwUsIKhjsxt9gH54KlpSo8OVuzOLN9ORjwPOXKBuDZ5BjqRBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTGw9IwoUJfJTW8Vy3qMdYZGAaCYPI2x0cNlXuyGCOM=;
 b=EjD8KOyHlX4oHtqqHliForhYBEhnNui8lnooz2srflIZqUNBjujFqsrajnEAHwxrX8/YWy1cK+QK+7NsjFq9m5gQRo55IqDiDQKt1uJ5ebtHecgmWlcEYXeCbH1jbkVBK0ltgub3VhQ+V6D/37vV9i1OoAWsHw3h5lggp2J1ABBwN+lNRYfiQjLjPZ7MJmvcnw5R2DF/3JGyrFZwS+5hQOP3rtv+gwCAIq/C3QkffwCs0gEQ2ZBV+lpiNTpgK1J+wXas6YobMpN0LmDQBq1TH9nOXmhIvjhUDqf99vhMV8J2g6z3CAu9tSpQoCIhRRpbMHpuBMW5PiCI2HRU8tjAHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTGw9IwoUJfJTW8Vy3qMdYZGAaCYPI2x0cNlXuyGCOM=;
 b=K+YDziCcqAJAXRXQuUrRH18fn92pwVUbUR8z3KqLMjA4CaKd+cK2HbVK3xmaSfw+aYxUXGXEPNt0bUAvdOnn5abThqIWOPGwqKz3jzxpkKkmcCQCdx2dAGoMZWcZ8cBGr9qkvfC0hRryPuylYmKjyYt68qD98HK3O/LK4nQOgMzW7pAzeWdzfXg5juMEfGQAb6cfqpQK88QoZVasW4ZievT12aSIGmZcy6/nKRTx4IFxc/zZGw191F/CIMx0XxX3wycAigm3cKDvQbgqWnWRm3ZyixB5RKH4EGzWi0jqY7s+PbSrHmDxkEdzjaV1nqS/J7Lp/Z/2vmoHE1cjEqxDMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from AS8P251MB0339.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:404::9)
 by DU0P251MB0825.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 14:48:24 +0000
Received: from AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
 ([fe80::e2cf:7f12:dbd7:791b]) by AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
 ([fe80::e2cf:7f12:dbd7:791b%4]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 14:48:23 +0000
Message-ID: <5d84881e-e855-9eb0-7e88-752010136715@polimi.it>
Date:   Tue, 29 Aug 2023 16:48:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
From:   Marco Morandini <marco.morandini@polimi.it>
Subject: [PATCH resend 2] HID: allow specifying quirks params for hid-core
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Content-Language: en-US, it
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0013.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::23) To AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:404::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P251MB0339:EE_|DU0P251MB0825:EE_
X-MS-Office365-Filtering-Correlation-Id: 246d20eb-97cf-40f6-fb91-08dba89efedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pYj79JTqsPQm9lRuXgbYe1VIFCCP1gcpGy50GA6x6Jm3/yn6CYuJ4lABRwEdMgc4o/ESPOvnw6M+3CSjxbVTVtBzzSj19TiAsusQirhHp9SkXVM3Q07N0D6nO8mp0p6LM16CURDx+SxuVmfUNvFMA4tzIEeG99QjcoWwc8nnQkxuEmqpJT8FZMIgPfld1JTKXeIX1Q0aV6fxS73yr73uR5Xm2cUFql42+VI80JBxWTLyH7xr8r8ZU2HxjAUJSO/0EoJUO7pO3S+Ix5PT2jzdoqbhVQ0mY+a5hJddHzagAaOnR/gyVsk/Til5UhVooeZ3VokIQG8Jz8RR6jd1CsqbRXixOoDvGIJ2mDScOfu0QiVfJrJHRMbou56/hIlk3ifwfTtTDqD2HGQy/I7YJGNpWEZ4cE8WLdTMtFBRQQnTnfL5t/oqqwSWEe7CZiPAPLDb1+q5Pt/q4WYJuTi1lyU0mMgdvC2MuUmypgTIT5wdn09S8IK0ulrlkge/W9QzvjigTafSTfJH5Ugk5y+jLwXf7abgo2qk5iQmJyW1FHR48HmcKeLpFTXOn91iD8I7bLxL0vKlloeh24YxwzuKCcJCwS4xwcqOD4Q3hokJvfz6zDrrge7YagnjW4TCdJcWTB1nYbjmQQVvz9n6RqmpFw3KUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P251MB0339.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(1800799009)(186009)(451199024)(8936002)(66946007)(110136005)(31686004)(478600001)(6506007)(66476007)(66556008)(6486002)(38100700002)(316002)(41300700001)(786003)(6512007)(26005)(36756003)(8676002)(44832011)(5660300002)(31696002)(2906002)(86362001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXRIbjhJRkttazBnRUgrZjhLVUtYRTJpbi85eGNiMzErRlA1alhyb25TenRh?=
 =?utf-8?B?cFlmemlWZWI2RDNaSVdFMjl4SnduNXlmcUJ6UElocHBtb0xGRVQ1bDc4Q2dG?=
 =?utf-8?B?bGYrRmpTLzI1QVk4UUJ4MUg0alNaSUEwNGMzU1QvcWhWczJZaTVNNXdvNDdl?=
 =?utf-8?B?WUtPYlF4S3hlRnZqemJ3OXFuSThNRlZOUzNRSVNDOWxFL2ttRHNrRm8raG4y?=
 =?utf-8?B?VlZSVzZrbXVaQ3Urb0swUTQ1Rnk5eVhwZEh2aG0rVjlQT3NBY1dEazVFNy9p?=
 =?utf-8?B?bk5YNXNlRTN0RG54SDV0WnF6L2U4V3FBcE9hV1hwZmg3dG11SVR0K0pibVhr?=
 =?utf-8?B?eWJvYWs2NGpaUXVJTWcyWUJ5ekZtUEVHSGNjeW5NTU02dWwxUmtvT1BocVRE?=
 =?utf-8?B?K2JSYmVRZ0o2Ny9WQzdpaEdHbnM5THdqSDhHWGN2S3c2b3N3QkRKcUxhcXhD?=
 =?utf-8?B?dHdVcmNMUTRoU1Z3UE1RRzdaTUpPVTJGd004a2dWclNFR24xczBVdi9MTmVp?=
 =?utf-8?B?R1c3cnN3L043S0xYSVlvZW5iTW9pUGJIZXp0SmhFTVVxZDNwRzhZYWc1aEZs?=
 =?utf-8?B?YnNub3A5cVJpM1ZFVFh1ZEx2OTI3VU1SUDBScFdFUmR1VlZVK21WSXVza3FE?=
 =?utf-8?B?VVl2NUQwU3RUQVV1d2ZpRVc2Y21zZXRQMEYxN2tacC9EaHAvOU15UkhSR0c2?=
 =?utf-8?B?T1BKOCs4OTJjemlDRnhjUkZJOHZBVmFjNVBGVHBvNlA3cHVpR0cybXZ2aUNp?=
 =?utf-8?B?TXZocVliOStSK1o0ZGRackVnL0l0cGtiR0NaN2FCQmN1YXdmNm1xNjJsV0la?=
 =?utf-8?B?OWpwZ2FHdUhaK0c5SFkzSUlqQlUwZ2c4Y2p0ZHNjQ3o1bVlTVmNvbkhIZk80?=
 =?utf-8?B?b21RbFk0TW1ZSEZiRnF0RjRxUEVXdmJNN2pHNjJoRXlObURqcTh2Z29iUlpO?=
 =?utf-8?B?SnJmRTZJOUVERE1IdzNtbVlPZkhNeVB3c2pQY0lRVlNmQ2FSQmVheDBSZThP?=
 =?utf-8?B?dTR0dldKSTZSUGJOL0ozcCtYMGlYRXI4RVdQWU9od2k2MlU1TnZMQWhaakdz?=
 =?utf-8?B?ZittZDlzbFJWWHk5WGxKUnU1dFlhNllwNVo0ZXhtWWJ4ZEkvcVByQXZwZDFV?=
 =?utf-8?B?MEtsNzNUTVdQRW5LTWVEMHpnZzBwMlp3aHJ5a1N0ZHRMVWlxRDkrRWg1aDNR?=
 =?utf-8?B?K3lTOTFZMmxZemxJemdWdmRSTlhmNTVzUEVHSE93WlFVbzlIdW55V3ZQa2J1?=
 =?utf-8?B?amRsTThTMk1WVlpOVXdzam5mT3NJVWNkVGVVMy9sa3FZNnMzS21BM3pCMVNx?=
 =?utf-8?B?UlJBaSthZmlVa0d1UHppK29pRXFSUC9zc3lkMTZMUDlzU3hxVk02cWNzYVJ6?=
 =?utf-8?B?bjMzMjQ0emtiWVVkMlZmejhQN1F0VDYxejY2eGU2UlIvVlpaazBHWVk5amJE?=
 =?utf-8?B?aDhjZGt0VzFhSkRNZ1hYRC9kZXluUXBaK1B2NHU0RytQSlNOMFc0cnExSXhi?=
 =?utf-8?B?cU9FN295SjZlZEtuQkdST2ZLNzZnMVJtbm1zM0F0Z3F0cVNEdkxqYzVoS3Fw?=
 =?utf-8?B?UlMxWmhYQjJPaHAzR3JBUW9zNUhmNUxlNE0yQS9IRG4vaDY4aDJVVGIvUHps?=
 =?utf-8?B?OGlla1YxNklDU3llUWtBVkFNRFRaQW5QSXg0UUdBd0JOK25qSHFSeDNVaGxa?=
 =?utf-8?B?WmR4VnRkSllMUTdBOGJiUDM1dnhiT1d6TUlTcTYveHhvZWVEZVAxa0JMWE8w?=
 =?utf-8?B?bFVPelB2cjNoYm1WNEEzVnZEekpwdlc5aG1JaW9BUXo1dStzcGZ3NEFQbHo1?=
 =?utf-8?B?cFlzaTdpUmphSEpuU3YrM1lTUG90THQ0ck83UHFYTWFlci8zUEtpNUwxSm1s?=
 =?utf-8?B?d0xvNU1QazNNUTN1cTh5V3FqNUZBaFh0MTJDMS9CL1A1V1pOTkorQU1TcCtE?=
 =?utf-8?B?L0lZb3BWYXlZdjN6anVVU1lVOW50QXBFWEt5OUpYa1dXOTAzMVo5NXhFSVJH?=
 =?utf-8?B?ejMzeXJYV2FUQlZPWWEwZkllVlNvQm1ydXI3K3Nkc2FPckp3cjJDZnFlSFlm?=
 =?utf-8?B?YkJLS3MrWHFBSm5rSlVGU2VDWXgrY1FyenFYODVqNHNBOS9KWGdhVXI5R0Yx?=
 =?utf-8?Q?j8BKlNGLOMO7Abvjru3V585oo?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 246d20eb-97cf-40f6-fb91-08dba89efedc
X-MS-Exchange-CrossTenant-AuthSource: AS8P251MB0339.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 14:48:23.8098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uv7852QpSfi0CRiRfP4SN+OWJVelPF/Az3vFJd/PQ6df7NoXUfEcpPZPBQSm7xWOKSg8sXECSJA63MoTPIgreQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P251MB0825
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

    Before this patch it was possible to specify quirks
    using run-time parameters, but only for the usbhid module.
    This patch introduces a quirks parameter for hid-core
    allowing to specify quirks as
    hid.quirks=BUS:vendorID:productID:quirks

    Signed-off-by: Marco Morandini <marco.morandini@polimi.it>
---
I don't know if this is a good idea or not.

If it was for me, I'd get rid of the usbhid parameters
and of the duplicated hid_quirks_init,
forcing everyone to specify the bus,
but I fear this could be a regression for user space.


 drivers/hid/hid-core.c   | 13 +++++++++++++
 drivers/hid/hid-quirks.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/hid.h      |  1 +
 3 files changed, 47 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 22623eb4f72f..e1bdba978dbc 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -45,6 +45,13 @@ static int hid_ignore_special_drivers = 0;
 module_param_named(ignore_special_drivers, hid_ignore_special_drivers, int, 0600);
 MODULE_PARM_DESC(ignore_special_drivers, "Ignore any special drivers and handle all devices by generic driver");
 
+/* Quirks specified at module load time */
+static char *quirks_param[MAX_USBHID_BOOT_QUIRKS];
+module_param_array_named(quirks, quirks_param, charp, NULL, 0444);
+MODULE_PARM_DESC(quirks, "Add/modify USB HID quirks by specifying "
+		" quirks=BUS:vendorID:productID:quirks"
+		" where BUS, vendorID, productID, and quirks are all in"
+		" 0x-prefixed hex");
 /*
  * Register a new report for a device.
  */
@@ -2951,6 +2958,10 @@ static int __init hid_init(void)
 {
 	int ret;
 
+	ret = hid_quirks_bus_init(quirks_param, MAX_USBHID_BOOT_QUIRKS);
+	if (ret)
+		goto usbhid_quirks_init_fail;
+
 	ret = bus_register(&hid_bus_type);
 	if (ret) {
 		pr_err("can't register hid bus\n");
@@ -2972,6 +2983,8 @@ static int __init hid_init(void)
 	bus_unregister(&hid_bus_type);
 err:
 	return ret;
+usbhid_quirks_init_fail:
+	return ret;
 }
 
 static void __exit hid_exit(void)
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 3983b4f282f8..40d3ba78ff73 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -1182,6 +1182,39 @@ static void hid_remove_all_dquirks(__u16 bus)
 
 }
 
+
+/**
+ * hid_quirks_bus_init - apply HID quirks specified at module load time
+ * @quirks_param: array of quirks strings (bus:vendor:product:quirks)
+ * @count: number of quirks to check
+ */
+int hid_quirks_bus_init(char **quirks_param, int count)
+{
+	struct hid_device_id id = { 0 };
+	int n = 0, m;
+	unsigned short int bus, vendor, product;
+	u32 quirks;
+
+	for (; n < count && quirks_param[n]; n++) {
+
+		m = sscanf(quirks_param[n], "0x%hx:0x%hx:0x%hx:0x%x",
+				&bus, &vendor, &product, &quirks);
+
+		id.bus =  (__u16)bus;
+		id.vendor = (__u16)vendor;
+		id.product = (__u16)product;
+
+		if (m != 4 ||
+		    hid_modify_dquirk(&id, quirks) != 0) {
+			pr_warn("Could not parse HID quirk module param %s\n",
+				quirks_param[n]);
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hid_quirks_bus_init);
+
 /**
  * hid_quirks_init - apply HID quirks specified at module load time
  * @quirks_param: array of quirks strings (vendor:product:quirks)
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 4e4c4fe36911..7f2e8ba7d783 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1178,6 +1178,7 @@ int hid_report_raw_event(struct hid_device *hid, enum hid_report_type type, u8 *
 
 /* HID quirks API */
 unsigned long hid_lookup_quirk(const struct hid_device *hdev);
+int hid_quirks_bus_init(char **quirks_param, int count);
 int hid_quirks_init(char **quirks_param, __u16 bus, int count);
 void hid_quirks_exit(__u16 bus);
 
-- 
2.41.0

