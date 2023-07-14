Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF7E753EFA
	for <lists+linux-input@lfdr.de>; Fri, 14 Jul 2023 17:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236385AbjGNPfC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jul 2023 11:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235215AbjGNPfA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jul 2023 11:35:00 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2063.outbound.protection.outlook.com [40.107.105.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF5F2D79
        for <linux-input@vger.kernel.org>; Fri, 14 Jul 2023 08:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpYcgc3tHKIHIAe0JzDG3UHh7636+wMMZQk28XEhFlfaG0CHhTthxCVpHr6iTW21sWVORO6tJFQbF0r1E2KAQHk75F+xih2GFGnLhYDfFz9ijVA+tQ2pceopZzbWpfZEwgPl5Cr96mWFpPoeoDtiEzUnvyZnYUYnhiTueys+fpENWj187nvYEmxbJCOrqHzilx4gCjeem50bCjNx+H9Zlf0LCOdnxERiwDTYtFvDRmjpMxj4obR8jq9rPSjccCBlckxrYVFK9dRKBKomzjVOjwhjsUauZFgH/onG6aj2ILewgIeujWDgvy3YnAFSodcu1/f04bsPGnS9u2K7ubtfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQ7oAea+CjI0Fv7HPEiqo50koB9YWBwlVh5SNH2fkyU=;
 b=DTHIAlpTaeHGt9QxC74oWNISwuwc/kcl5rVbThqK28OhKzJFNfZei3x+8PI5RXdaVjZEhAGq4QLM5MvLQ7BSEBShLD9ZnXcnRpREub7JyaMA4ldNQSGQkUpYFV2a/A/h5HMJGDWU/1yqMKPMVhHOZKO7OMw+9BmeQluXbz9QcIYVzQM9o8Ww/WTuCxo3hYdV4ndpDVVs2ddIqCSzQIHDpG+Yo6THGetdGU34vnbzFpICQmQhpR1fDtfTtImluI1LOrm2WnudLr6HGMDUIVIa3wW/PUWhyvfVD+HbvkJUwwqg67Pa05G40V/NKlgXLokmBT6qJ1fA14PkxZLskGaLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQ7oAea+CjI0Fv7HPEiqo50koB9YWBwlVh5SNH2fkyU=;
 b=oxl6gMCw2Tp1F+48EsJkex7/kNnInxWD8MRAMJFQPmyTOmaD6QB1K/YWDjHZbIrJCkrjM3XGxf0ou23yE8YVsOGRyUXAGivnL/XJ4+M9lAbUuRCNp6EOAy9lMOwIh+BvSyriA0osTmNn7g3SOHoHUGK0QgBzZJg6t3Wp/xzzAo2RXW6sPQozbcTM12DNdkPh6Xczh37vFxotDb31o6LIrKQlWLC4uOfMSQWedHJlaeCVK/gHfWk4ZmKicuwyO90+6VgUo9Df0j37ikRFqWTf7bKz4S3tlSX46hUkejihkG9BDrhOyEtID+AcHQ2Glf4dAGGvi1pS1vyqaJuVUdBleQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from PAXP251MB0348.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:20b::10)
 by GV2P251MB0900.EURP251.PROD.OUTLOOK.COM (2603:10a6:150:a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 15:34:53 +0000
Received: from PAXP251MB0348.EURP251.PROD.OUTLOOK.COM
 ([fe80::7b05:e472:3184:13f6]) by PAXP251MB0348.EURP251.PROD.OUTLOOK.COM
 ([fe80::7b05:e472:3184:13f6%4]) with mapi id 15.20.6565.028; Fri, 14 Jul 2023
 15:34:52 +0000
Message-ID: <5dbf769a-b815-390d-d9dd-d055eedf59ed@polimi.it>
Date:   Fri, 14 Jul 2023 17:34:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Marco Morandini <marco.morandini@polimi.it>
Subject: [PATCH resend] HID: allow specifying quirks params for hid-core
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Content-Language: en-US, it
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To PAXP251MB0348.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:20b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP251MB0348:EE_|GV2P251MB0900:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4b4161-b49b-44c1-c4b5-08db847fde47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +8gM5mqOuW84qjI0O2eu55SvFq4eucRaiDKcuVzCgHxmI7Yi1BjRiPMqyB18zuDp4Mkq/C602WCt0d5d9oNLymTc0ZHxvZFydsH2O+7Kjg2xb7GoovNiQ7giWm8G5ywq+WDj974KayJ0BwrS3dtUCMu34H3aeK8IRhUyILVj3dZa5Nhy3A3MSJObfH0bAB7ADVeVJrnAwbhpnVmq3NxnkogypdWjjqsjEk+kkayInaBk5Ed997QUb/ZxwfNmJDdoQRd1q/cNIDIWvko7Pa7ZOcTnsoqpmpkcZsTZIY/dcF+Gz1GXgUY9u+yBCjYmF0WdNpMv6qowJPA2/nMHC5inFDwE1+ULhSWWYT1P6wAjPfubA0RrOyczTAVh3mpuqkp8MIBnyxc6RlLwkpPjHcq4GA2a3axgodCHA4RjuEeErpRuJL0F9LR1n5ycOv2ukwa7gNW5YMealPTXTdsh/XVtjA7F/Qb5OsbRh6AAkIh1VFXFU16XEwwIBcupNuj72JG42ashD9DeRVHYTu9hsusa2gbvxeHSa2WSrfIzfvo+u+rDGQgrGgP+x6ovQcJFY6IyIJ02ylOt4RbGnGoUyLzKNd3zMjwxTL6Kfu/MCCIkhgZ2Imi1b3wkbRsBXXq1cN6NciuUQoPmdSDqXoZu6CGZjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP251MB0348.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(31686004)(6486002)(110136005)(6666004)(478600001)(2616005)(36756003)(86362001)(31696002)(2906002)(26005)(186003)(6506007)(6512007)(316002)(38100700002)(66556008)(66476007)(66946007)(41300700001)(786003)(8936002)(8676002)(5660300002)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnpvNXpPWW9FQVBpN2VWRWdJc1c1ZU82QXY4Q1pvQ2RYdUs2bmN1bWo4MzlB?=
 =?utf-8?B?anFPQnZyeGtucklaQnpodWtkK2IxUi9LZ1hQLzZtMWp5ZFc2K29lVzJwNWdo?=
 =?utf-8?B?Y2NNVFl0L2hQS0JNN2tyV3NDc3dVd2M2NDFsVmdiTHNva1ptb0IrWDNZd2U2?=
 =?utf-8?B?eklJUXN1Q0xacVhmSTVIdHZNQlQ2Q1laMFVLb1prcXJKcXNnbnZkc2VuTkFC?=
 =?utf-8?B?M0R2d1FCTjJLUGp5MjFqZVZScE5rWVdXdU5BZnRKb2Q4Y2lMdy9ITzB0Y1R0?=
 =?utf-8?B?SVhRMk1RNzlxN05Db3dVT3Z5NEFxZk5mY2dqNUlvQUp0SlRzL2cyU09uWHlm?=
 =?utf-8?B?S3AvenJIWmJEaFZ5UUlmL3VCTG9VaU5PekVnQnlVT0NRUVVDT2dUK0FrVWVh?=
 =?utf-8?B?bzRPV2pqdGdtMVBmUnVBYXhqUDF5Q0NoUXNLL1BhTHVXUjNPLzhFZkh5a2RK?=
 =?utf-8?B?dENGWE1vZzFhMzdOT3dVa20wK0Y0b0RMK05wRnduZ0tubFFtTjJ1ZkN1U1N5?=
 =?utf-8?B?Z0p4cVNPaEZqSUFaTG1ZVy8rUWlBdGNvVXlZK1VrMndHMVAzK0NPL2hQVnpF?=
 =?utf-8?B?cC9uNUZKckVEbThJK1E0TDZpZ0N4S0x2YUhGQXFvQ0J2WHZMUmpWcW13Vm5P?=
 =?utf-8?B?aGN4dVZpdU02ZllZS0EwbGVJZDZHQTZNMGVjUlNwWkF2eUtvYzB1T1I0ZTBp?=
 =?utf-8?B?VFNURUZJR0lSUDNWQzB6SG5Hd2VTQkJPQTZOMUN2aTBrSTNhMm1zY3NHUUJq?=
 =?utf-8?B?bmVWMFJacTY0NE44QnNyMWIrWlRuOFRzRjZUZ0EzdjZEYnB4YVVHdlZiZjlZ?=
 =?utf-8?B?MnVFdGJuc3ZiU0lZMVBYakc1cndjV2NyZzdORmpTQW54YzVNUHAvZ21ScW1Z?=
 =?utf-8?B?RFMzbXV5TjhmVE1DREgybis1NmNPWE1zY2NvZHpwUmZ4OHVwMVVFYkNEcVpE?=
 =?utf-8?B?eHRTL0lncytGamp2b0h0dXZxR3hYT21SR1RBQ0FjY1lmbml1cDRYV2dXa0Y3?=
 =?utf-8?B?M1pQV295UkptbkYwRk5lTHhCZ0Z2QmNTQm5pa21YMGRYbnJMKzkvTkd0S2Y2?=
 =?utf-8?B?QVIyRklGZk0zVGZLOTNMWjJSdHJ5dG1EUSt4QW8rR0dGVTFXZzhXdnJUcXM5?=
 =?utf-8?B?cmh1eE5NY2llVlBCQVo2UFBaRmVSTXdEVkd2ejJ5UEpXcERHTk1QQktaa0hO?=
 =?utf-8?B?NkhTOWFmZ1hYQ1dRelBIa3c4UEQzYURhblpNaTQ4VHluMkhIZkZpUzJoeGNi?=
 =?utf-8?B?WEVjQnB3cGI1VVJoMm5QZlQ5a1QzSVNTWUJBVkt5Tll6TFNVWEltTmthSEN5?=
 =?utf-8?B?OFFNMTBsNTBQZ1JYL0srcVJwb012UDhCSFVpdm4yM2d2UUFXWVA3QWFocDg1?=
 =?utf-8?B?bndzTGJMMzhnak9HaVEwS2pVTjVSVVhCLzNDYkxkWHZ5S3M1WW5EaDF2OUNm?=
 =?utf-8?B?Sndtb2JQRW5OSG0vYkR0ei9DUDgyZ25ldUEvYktra3dtSmxwS1lOTU1vTE5E?=
 =?utf-8?B?a3F3cUYvRGlTOWNEMG9Zd2FRamJNTUZNNjdQTGt3bjZTemJoekpyTWdIMEtK?=
 =?utf-8?B?VlBXdHY5clpaZWZNMEFuUCtIWXZjd3JvSG5naDdLSlVlMTZ3NnBzZkxTZE9D?=
 =?utf-8?B?V0liSWo2RTloaUxPMXAzbU5GRWI2U0JnSklxNmNnbFB5Q3dlNllEUCtwNUFT?=
 =?utf-8?B?RlZnTHY1SFpoSVEwSXFsRDIrUFIrdFNuNkRDKzcwcWM5Z1NKYkxJUTZzMHd6?=
 =?utf-8?B?aFR2RjVIaWREVEhMM05ubmdIYXN1UkdaZ25HTzZScVhaR1Iwb3I2VmtJTjNZ?=
 =?utf-8?B?RmRUMVJ2WDhmMGJxYkt1VVFndlpmVVkwZmpSaE54VmNYQ3NEVTdickY2V2NC?=
 =?utf-8?B?L1pnRy9WTEo2OW5IUXl4blRFNVQzY0czbnlCZ0dyWmtVbE95ZVJ5OXMzM0RR?=
 =?utf-8?B?YTNZdE5XOFNISDkyc2hFdnVtT1B2bEpCdmRBc3NaRWhSSExlSW9kYTN0VVMr?=
 =?utf-8?B?aFFhbjBlbSs0YUN6RmZheEdFb3hhaUhrNEV6K1hkNHVEbElwNTAyYVRKeTRN?=
 =?utf-8?B?QUo4eEdzR3lwWURQdk94WnFPTmhXMnErNDBpYVRFV3RWaEN1L2pjU0xZT1Bz?=
 =?utf-8?Q?R9DAoAQjmy2QA+UTjipq3ZazX?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4b4161-b49b-44c1-c4b5-08db847fde47
X-MS-Exchange-CrossTenant-AuthSource: PAXP251MB0348.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 15:34:52.9507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6bEw7Pau7N0m8uBxec1IL9nihFBbQTvQgOwNWMGcRERoTf7s6eZdGf672kmknSR7VpoycZC+aJTpbIm6AZ3BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P251MB0900
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

    Before this patch it was possible to specify quirks
    using run-time parameters only for the usbhid module.
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

