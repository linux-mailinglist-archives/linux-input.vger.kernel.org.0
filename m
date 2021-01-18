Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4702FABC7
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 21:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394374AbhARUrh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 15:47:37 -0500
Received: from mail-mw2nam10on2067.outbound.protection.outlook.com ([40.107.94.67]:64404
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2437508AbhARUp1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 15:45:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNz23Z0nEyFkXW3uIzXoWXpCkH4GjwoO/y+PQoQ823r71k+vIkkUVqZk08fmds7lpJGqlTiZ2YiBJzJM3DtkTpgZVq7SZebxdK1nd4H8TutBVxcWaeriBvfg0P4G3YOY7fAHi9iVJ9pSaXT+IfajdDPWbPVm4beFTK9wx4C3p61GGtWGoA+JRvkf2m/WvzDKogdPQG8s2uY8FHD/YI/mihdCR9RzJizmWmZHvMa3+wyTXuIoOaS8u/BHJuy0Eumf3Lx0GwTOR+y7fvmYd59jWMr/Hvr7TH2U+U+jvf3sYPgHUT1Me2NO7F+6uimnUehkP0A7CKBrp5si67nrVILXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op8kCt3yku8I7EPb7J3l/Go44Px7QPKFf011iDvwjXA=;
 b=PgBi7cE7df9Py+LHcRCjVqBISdWZ+zYVUfltRvXfLxDXKmc4h5l98WHShi1rOecZ6BuBW8kkGOH3Z0vxtplQjWXV1gLabmeluU2MV5yMa4+sY1qY3u6eDcPfdTuu6E3UWweQ98ZI0+vG5j5vMPPBLkThIHcy7QS7xZt+wcu+Bh73uXGU2kXb9wvV4Cn1fD8rVr4cFhN6aNIJeETL6GyPmwy5DINdc3gwjivxrZ2HSlK3wcMGo0dHdTOnW9p3BX/Vaw2mg8rjum85kMDw2cUwqzNNJBhzz4Tv+CpkFC3AWKVf8hj/q1f6P0O6G+LyrWKcl85fMOhXNFjSSNHoQRAMDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op8kCt3yku8I7EPb7J3l/Go44Px7QPKFf011iDvwjXA=;
 b=nA08StiKALIOvcMckF+un0bCTppV/mj7IHjS3anuChePfuR/WrejfAUFZBpLfn28DsL07eoYlNOd6mDu4ACniGy6hhIL7RdpHbAPP830/6GaS1Lw3FPqpssCBaL6ECM6wt3vhOoZLrKTSlxcJgdqrC0XG8hBtgr46KLTrDw3/Wk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4846.namprd08.prod.outlook.com (2603:10b6:805:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 20:44:07 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 20:44:07 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 01/10] input: iqs5xx: Minor cosmetic improvements
Date:   Mon, 18 Jan 2021 14:43:37 -0600
Message-Id: <1611002626-5889-2-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611002626-5889-1-git-send-email-jeff@labundy.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SN4PR0501CA0137.namprd05.prod.outlook.com
 (2603:10b6:803:2c::15) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.173.128) by SN4PR0501CA0137.namprd05.prod.outlook.com (2603:10b6:803:2c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 20:44:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98d6cac3-e51f-4a67-6237-08d8bbf1ccb2
X-MS-TrafficTypeDiagnostic: SN6PR08MB4846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB484675C2D60C83DBE0A0E288D3A40@SN6PR08MB4846.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e6fVFPmbFigpdIWEiSBpJF+wMxltO/A3oGms548bia9OiVJBzKyHSBNUcSMU4sFzZ0kMf0wzJ9ymqFmbCgXyqEFFeTm/xVw5wL7p0chPlcRNt3mXTt21U3Uts4cbzSX72viXmm+UIDiZwyvj853WqfDDE1xDDIZxC6pAz0e7tZ9tpt6QEAtW40MWSnwZdOyo+lKOTG/UV3qzwD+4KJ7lHAe44DABbb2zn48KLPuLOKrh3xCDC3Cpdn+lqnjWt2iTtjuzhjCEX+HvAFBu7bAupqNfS95m0QHK914PgENTmNK+etrDLythRyflfdZmQRQOfkbiAvYfeBqpIDPExy1WhoIIYi/V/OxzOoZ4IAx1weOYH0XrDUEJjGUyHXFVzX7HsTyQNCi47sftIBkqI0wKhWbrkjwzkCwRpgWTYubJH1str7OpsjNocOxCL2FaeyJ5zI+G7TP3gNZjyIQ/JfunYURWgai9LxqU9JntCbx0yDA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(346002)(136003)(376002)(2616005)(5660300002)(36756003)(6916009)(6666004)(316002)(956004)(8936002)(26005)(66476007)(66946007)(2906002)(478600001)(186003)(107886003)(16526019)(6506007)(69590400011)(66556008)(4326008)(83380400001)(6512007)(86362001)(6486002)(8676002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ClsoSGsuMMy4oiLT2HcLhpWmSpuJrmmkpm1LiciKOznDiEaLxLq1fq/7DFGL?=
 =?us-ascii?Q?efpykYY6XJ1CnI4eshsTawux9l/Lo52ptcp0xoWSvEbDMj8VPviLMy5yeQIa?=
 =?us-ascii?Q?8/yAWm6wimHsSXP0/mKgl9ZEPbSBDw6E2pUQEefaWQjBCE2fcgYVazrPsrqZ?=
 =?us-ascii?Q?jKvOOFIevxTSuMlk6QNVWjmCKB/hf0b9+d2XP18FHdukRtGVFwI67FNttu9b?=
 =?us-ascii?Q?Emaco94twUb2u5uXUEwRcSMGXMFTcFjWBjkcKiv58x3M7VIMNRb1HhV40BK9?=
 =?us-ascii?Q?WkqRGn2N6v1Xk1YJZJXdmLRQ5KAmlbj/x7++mUy5viczVoNkFSxtVZ245xpM?=
 =?us-ascii?Q?FMXlC5wi6d0t9evtQNqoOWSREjaXcF3q925B+1o2HGvySTVkdHq4Fuh4HrE7?=
 =?us-ascii?Q?Q0WILPQsanXRj525Uc7FzeNkHAxsI2ofT+uS4CM46/whaGxM462Yg2wuqbY/?=
 =?us-ascii?Q?ypnY9NPx4kWSJHSv4JC93XnpKWZUU8mbgyuMtxXoFCXiXh4Empnpce4NgBj7?=
 =?us-ascii?Q?t0dUlxu8bKp7Z4/VZ+SogUKjMd3POXfkJz3aF/gv+9rVZOOefTbqU61Q+Szz?=
 =?us-ascii?Q?6Zvv7SoEyxf6/nGLKhjbub5zC8tM49wN1Xco4YrVStbg2v48TyMVmutr/Iyn?=
 =?us-ascii?Q?8W185D9nsuKCcp+0sAmjEZ+hMvRJDLoRe624H6CvlEon06MOVTKWkTQvNChW?=
 =?us-ascii?Q?R54s7QwOyqU/RDUfCzKRF6byJ8og1SIv+iVq16lUpc8JEblwEz3N0jfQo9EK?=
 =?us-ascii?Q?ALI/YPFwaZyQiJShmDeZWzZV/gbcAwXo6E+JU9/XqnIpB4cxVrrTHELbziJH?=
 =?us-ascii?Q?dT3sc/Wah2+iNr1e8/myspFGC5ntQyEuNYJ4jk7wCUaK37rOKusYFlZW7z7W?=
 =?us-ascii?Q?qAWsdPsSdTXgPA61Hx+ZrFkCyy+Z4JEKdEeQ/OGScm3e/xBvCOqoV9XqHKBv?=
 =?us-ascii?Q?mFvZ+R6DN79efJpt8Z1HJF+eWntBvGbtf3j6Q4tK3zyQ0Vz6ToJ01IYgVvFO?=
 =?us-ascii?Q?Mkbq?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d6cac3-e51f-4a67-6237-08d8bbf1ccb2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 20:44:06.9838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eempRyx1yXBwUB59+8Ue2ADpy8/UlMKy6O7BR3ow1I53sARhOZpATPAcmMe7BGQLUClkj2cpQMTCPn66Do1RZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4846
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Copyrights are generally followed by the name of a person or a
company (i.e. the copyright holder) but that was not done here.
Fix this by squashing the 'copyright' and 'author' lines.

Also, trim some leading whitespace ahead of the parameters for
the fw_file_store() function and re-align them for readability.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 4fd21bc..08e79d6 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -2,8 +2,7 @@
 /*
  * Azoteq IQS550/572/525 Trackpad/Touchscreen Controller
  *
- * Copyright (C) 2018
- * Author: Jeff LaBundy <jeff@labundy.com>
+ * Copyright (C) 2018 Jeff LaBundy <jeff@labundy.com>
  *
  * These devices require firmware exported from a PC-based configuration tool
  * made available by the vendor. Firmware files may be pushed to the device's
@@ -952,8 +951,9 @@ static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 	return error;
 }
 
-static ssize_t fw_file_store(struct device *dev, struct device_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t fw_file_store(struct device *dev,
+			     struct device_attribute *attr, const char *buf,
+			     size_t count)
 {
 	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
 	struct i2c_client *client = iqs5xx->client;
-- 
2.7.4

