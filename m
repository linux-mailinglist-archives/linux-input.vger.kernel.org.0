Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE9373213F
	for <lists+linux-input@lfdr.de>; Thu, 15 Jun 2023 23:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjFOVAZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jun 2023 17:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbjFOVAY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jun 2023 17:00:24 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2054.outbound.protection.outlook.com [40.107.249.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4268D193
        for <linux-input@vger.kernel.org>; Thu, 15 Jun 2023 14:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tu4YngdbOFFU9ELM5GgGHU3Vjo3xl7LQewFxNGFLIVk3SCPEmM6g8HbCxWeKl4GCSozjVXpeTk7EdG0DGTenr7MXhapBvRt2cic6V7wwgKokO/dHz33wqDQl3Q9pk1AS1vvmHwEVwnWgl8JV3iO5GoCwr0yy2JnAiaGso6tQnfNcdsszU/0hCVV0/qc8Y80/GhNOKKpM4zbD+1rZ1oDZQduS013KEK31Dqpa4w3bx8TEVhF8WOjP34mkW5pmmyg0W3Bq7cjkxK6eYOybQsKTMIKmtneEzYBXKf88XdGX2X2SQCNQR+VSb1tXrW0TCV8TrueS2Sfjqu9EsArz+O3qwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d134nqB7YNO4fLFG7QmCi/NGBTmIyiokAX/FyIuNoYM=;
 b=KlveN3JIEUug6qqKAuy3DECvFyJ+rfB2ZhHouHYSybmQKRkCnPA/hn7/84hFGeseWYn3nIeXYqFPtO/UDGTWt5BPFd0/ngLiHz1xtNgxCxVT59YfjxyBBTZ+Ew3p5M8fAjJzrZWGjh39beKDbGzTKhIbbtLQHxpDr4o/2ecUGSLPpTtsTPxE/6vA/F6T3YPTmR6aSjmeFpbk7Ai8vpzclWZPGGOlSkvcawPK5T3SffSi3wa7GDcS0qK+A917aGhtg94lDBFOrEObMY7mLJmVDyfGVcd9aLpZ+KlceWaEi3NRLk08h6Akameqd8dASwhCNW3K9PdS8BSiVWwtPTAlrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=polimi.it; dmarc=pass action=none header.from=polimi.it;
 dkim=pass header.d=polimi.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=polimi.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d134nqB7YNO4fLFG7QmCi/NGBTmIyiokAX/FyIuNoYM=;
 b=d1oCq6grUc0IbmnIt76LMj/AeUn/EnU8lf5APvKoH8IKE82bL6BKo+4KWVGaBekHBGnOPt/7R+2fdN1dhemCcu0xcEFgzznZyA8o85tH0s0EhvT/y2/jjMv/0cHRGI/5BqbI3FRyk1sBa/AIq/S91zcdhkXdp4ZPZ7P+uBj4WdhjX7L3Hvje7a1Z1Lq0NY7Op5mVERjd8VlBDpGqxsjTggAo64Ch29IQtPnPLudb8glqKYVsVbvAwy1OJcRHFEoBTmXLoIrmNmnnuV4jbAqsKL8r2hV0V5j7mLp08K0JW0OmgKhFlgvv/BdH3EqCL5hAzscv7hiBDJE7gSLdE+lVfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=polimi.it;
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:416::10)
 by AS1P251MB0502.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4a4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.38; Thu, 15 Jun
 2023 21:00:21 +0000
Received: from AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8]) by AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 ([fe80::651:7435:58fc:9db8%3]) with mapi id 15.20.6477.028; Thu, 15 Jun 2023
 21:00:21 +0000
Message-ID: <e33a0224-ca42-1c07-1b5f-2d7671d2febb@polimi.it>
Date:   Thu, 15 Jun 2023 23:00:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, it
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
From:   Marco Morandini <marco.morandini@polimi.it>
Subject: [PATCH RFC 1/1] HID: allow specifying quirks params for hid-core
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MR1P264CA0127.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::13) To AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:416::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P251MB0350:EE_|AS1P251MB0502:EE_
X-MS-Office365-Filtering-Correlation-Id: 6904f98f-c2b8-4fa0-908e-08db6de38825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rfO7dvaXfGdRsxhaJmkbEtgVVbyK5HP3woNVXHGiO2TfIPMERCW+x+qBLZjvMMvYofcX9DGCH5wzXfmZXfigj6lFdWL91/nXhn0pbJbJKsXordyDuXeCxnfctuo8/2sgCseot9Ed93bnrgHX1Bq4MwiCCvE61NjfVWvMbbyoI18xfLPys00V7r/SuHqZjhT/l1tv+MdL51PTSUAhjQnvV73fCqo8dTtVRpePALwbQENXTwz5HK/PQYDWTRVVtA9I9IjxEsEXhAhGAqlSSIZzk4cfdCg3E+RP1FQ+6Z7WNfZoHpsG+ADA6SVhwcmk6ON0Nb5/zx9W2MIh+CJpvlZEB+vvnoekLbud+DcjtAx3Chm1kkeGPuJ5CztuyPTLWe4FzUCMGgErZZAVjWZYzrm/I9avDX5KNlJRBvX6ZzkZCBEWXNke9Ebdwn/Dt89SVBCZrudFedmjYhtbrwUMTWiMAm7ikMJ2AwKIYyV+jp0Gp3A+4u34zIcM/KwFnbmCPYKDVnMyC88XgQir82d3OnVrNKa3NAzhyDIZ37mxisJGi+60iUqQVbGshXhXGloxdcrDBLFuLLzweNBcm7i3gJnikNWnuFwEN3UR2rCHVM4KM4vEKzYt1mudKD14ANRVgw5tgYwp+/GH19n/lAyS2ooV3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P251MB0350.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199021)(6512007)(6506007)(478600001)(36756003)(186003)(6666004)(6486002)(2906002)(8936002)(786003)(316002)(41300700001)(44832011)(8676002)(86362001)(31696002)(31686004)(5660300002)(38100700002)(110136005)(2616005)(66946007)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEVJNWZtd3hZbnI3eGpZWHM5eFBQQnNMNkI2TFR3bHp5cGRnOURFRlErVm85?=
 =?utf-8?B?dDFsSDlRK3crYkUyVTMrYzRIc2t1R0o1bE1IelBIZXp6eFUyRlRkSVJJL1V2?=
 =?utf-8?B?RkZyNHQ0MStZdUsyZms1SHEzNnhMRlJnVzQxcGZmZVFOQXgzNytwZHhVVFdz?=
 =?utf-8?B?OUk3enlqWFJndXRHeEt2amlXbmRodGFaM2MwZ2dvc3JYRmZLN0xVNGlmS3NB?=
 =?utf-8?B?Sys2a3FQRm8zYnV3RldZeloraHlldWwvVnFOSXh2VHBSV0YrcWxuRnArVmFq?=
 =?utf-8?B?ZHMyQTcybkVyaDFjMGU5YkxFeFljSVlWUGsxR2Rpb0FPbEUyWXdvY2c5bXU0?=
 =?utf-8?B?ZUd3M1NmQWowQ1cwam9GT1ZlTWZFdXNja1lnK2gxNVpFOHE4bkZmTkNjZ05R?=
 =?utf-8?B?Z0IyeDJrbmNncnJsZ1lmc25KcXR4bTRIaER1Sm5aaHd5TXV6WmIrbUJkSC9h?=
 =?utf-8?B?YTJIRm05bm1JUFVpL00zNFRtRWxRVGlEdnBKQkppOFE5UXh1WGtKOHlhbEtE?=
 =?utf-8?B?YkNubVBjczJkVnc3SHJFRW5VMUo5VzZFZWUyNDBnbGc5Q1lZU0ppZnZlMlhz?=
 =?utf-8?B?UVhKZVFmaWozWWFZWVozaDlwUTBVU2t3ZFNtOVdHSlpDTlU0aUUrRjNreGts?=
 =?utf-8?B?L21OMXJ0c3Y0NnZqV1h4UUJOZUFlVXE5T1BJL1NoUFZIQ21FbnErREd5eUg0?=
 =?utf-8?B?cUw3VzkwTXNvZk9rVW1YTFZjVjA3Q3kyMFFGL3Z3TzRWOFZxUUhKbjk4N1dN?=
 =?utf-8?B?SEJzRW5KMzhNSU8yczBWTnRhQjJLb1Z2S2Nmd3g5c0VOaWdFT3daK0ZBVWk1?=
 =?utf-8?B?RkVoL3BpUkxpcnUydGFZemNYMnJwQi9nRFI5M0ExbHExWVRkRTRsMFRZSzQv?=
 =?utf-8?B?c01xYktTbERLWG1GZXNlaXZNbER0MXAralcwTnExdkczcldWUlhYRzV4d2Uz?=
 =?utf-8?B?c2FEbE1BUEhJN2tsT3FzRWgxMW9JRFYxck5WdW9EYWRPWkpDenpQZGNzVzI5?=
 =?utf-8?B?YURiUU1iK0dxcjZDR2orbXdEd0dTQklWdURzMzdNTTM5Ukcwbld5UndxK2ZS?=
 =?utf-8?B?RnFTVStYWEJ4bjkwT0ZJYnVVSzgvZ1FwNlVlbjQ3Q1lzZFIyNGQxcGxlYWNF?=
 =?utf-8?B?MlZsckEyNStuTm04TVBRYWI3LzFHNVdaeXIxWkVtWG95aCtPUXJxWjhLYlg1?=
 =?utf-8?B?Z25BS1FVQnhNZVZvNUJlWmNjZFVyRHYwYkZCNVpuTkhMM1ZMWGVWOTZ4VzBv?=
 =?utf-8?B?SlRxQ2o2ZThaemJvTmZBdlEvMWxFSFZGYkY0TEZGY3d5YXhQT1MyQW1ITkI0?=
 =?utf-8?B?ekN4M0lTcThRMHlOTFhhcVFQdG1STlFBWExzYlVPMVpmTlIrWmwycW1VWnhD?=
 =?utf-8?B?QVYxa3d1WVd4SVFVdkh6UXlEMTNoT2RwMHRISDhBL0l2V09RNEt6eFo3UUJO?=
 =?utf-8?B?ZklzLy8wdGsrZjJqUFhwellMRkxLR0lRR21ZbFZKSndoTWVJTG8rQUMxSS91?=
 =?utf-8?B?T0g5VnBYYmZVcFd6SGpYQlExQmJyelZBL3pHNEhIUUFaUEc5RHFTSXQwUjFU?=
 =?utf-8?B?eTNNWHJQZ2tPemswNzhFTVB5RUU1ZExUTTRqd0lXcDZCcDhNQ2JUeHQ2Nldl?=
 =?utf-8?B?ZlNyWTFYejcvQzhGVUk0MkdrSVVrbWpPNTcwWFg3YnEzaWhCZWl4bTBLSi82?=
 =?utf-8?B?cHVqT2NzVmlMSVdFWlFKM2dMZ2tKU2R2YTNKNUFWYTJVZ21Id2JXcmw1VEpW?=
 =?utf-8?B?a0ZndE5sRGpYNGlHZUxOMU1UUlB4TzJuRG11Mm9UN3BvelNLVzlPaVJMUXBn?=
 =?utf-8?B?VHU2bDMyZUFDaCtvU2lBY0hpZFlOOEdlU0lPK1lwQ3BJcllmV2ZxVmZNQWdY?=
 =?utf-8?B?NnlVWlVwcTQ3R3pSMjA3ZlJkeHlQRk95WDBJYWZGV0hwOTQvMjVBcW1UNWFY?=
 =?utf-8?B?ckRTcm1sUGwydFpRMzdhZE5NNUo1M0lIN1QwLzQ5dm1JOElIQ0Zra2ZsdWhY?=
 =?utf-8?B?UE5HQnRyVDRwdzRzUlhTSW9NMDd2R2NHdnV1SjJ6VklDanhnTnR3UWxHVmd0?=
 =?utf-8?B?WG9zRGpLMXJUNm9yMnE3TFoycDJmSXpFRWxweGYxODBJUGJFcTA1L0d0dmtC?=
 =?utf-8?B?MnpzcUM2ZXRmTXJNSnpjd2gzaG93cUhJaE5GcGkrOGhlTlRTYThQa05MV05Y?=
 =?utf-8?Q?/7L4/J9B1TOM6JxwIIRsESF9Tk92Zfg5nGAfSq6mlQQ3?=
X-OriginatorOrg: polimi.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 6904f98f-c2b8-4fa0-908e-08db6de38825
X-MS-Exchange-CrossTenant-AuthSource: AM9P251MB0350.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 21:00:21.3207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0a17712b-6df3-425d-808e-309df28a5eeb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdwHFIzD8rATuVq1wtk0sJa+7YBemPbQ8rrxVbb/jHPv6aUDgW9IimG62e0NZRjHbVHR/qizV4+0eeDeoVsAVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P251MB0502
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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

