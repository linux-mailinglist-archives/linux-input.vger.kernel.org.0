Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F2F2FABE4
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 21:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388346AbhARUqo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 15:46:44 -0500
Received: from mail-mw2nam12on2046.outbound.protection.outlook.com ([40.107.244.46]:61569
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390080AbhARUpu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 15:45:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZ5FGconSIWH3VmM0SKD++B0BDGVeVJWMaCLzkny+c939OJxJFYpVJkEqtkT6k7x9IpNj8oJ/llsg8XSKPZCF3jgi4JJaZ28KeriysKQtwxnWsar2gM+bcu+RmO69GrC2xZyAMdPpHt9A9/rFg5TlOK+IU2T8xdSh7if51AGlAmcJIJcw4GnIpSUrezll6RMMX84WoaZjT7OdQMRDFfcW7ncpEKBu4sA4Rmfg4gyUZSC337CIASOVaPjJrOCiLO+bn5dB9OV8zO/cs60iNUt1F4mRQklmwIgyzDV57TKlcZ7HfLWyyqgHtAoQirlqwAScohxkzDgBe1+hI42Pwf7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWmQjg9gvgv+AX3U5twkHWmIY3cURw5FH5XfGTZanjA=;
 b=eAn3e6nF6EzAT/4TaRJWLwfzb/I4BfHPidAeqsRVjcM1PlP2gdih37VMcYE5VQmGI5sBPYg7kzFFXbm/l2WUVjuQbpb+3qXIP4IQiBFm4KdWZ6ZGlYzwWZc+TcoMNQ86RNsY4/PV3O/v+Ue+s707jYamZijn8lSyuTaxI+pLVvC32UV4ccRUBF+rRoL3Ux8ZeaORdP7NI2Nzfj2JkKa5k/aMrrTo4YN4pEsrwqpq1oNXmKtaREf7viS54qR+s/BQocU+ZPxHsSqRryGQPdQdBrVdLTG1bbOTg5CruMJbVTkOPLu2KWdbVLeLepXiHrRozxTd8RifvTPxByM8CCNncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWmQjg9gvgv+AX3U5twkHWmIY3cURw5FH5XfGTZanjA=;
 b=RuDU4iYNwly9cImWrFti9CT+85wGjcDzmSJvClOlI56v26/HDKYDqaQUMbdEgaCNrDJdx0G7eFwGQUAP9vFQ/pPhx2Th9GrYEMtTxTDLGnZYFK5dbiG8dmcDmghvbmvaNpdiW7Rj/cVu2eSrSPECYGdqawUc9tVdZOM7zJGv+DY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4846.namprd08.prod.outlook.com (2603:10b6:805:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 20:44:20 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 20:44:20 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 03/10] input: iqs5xx: Accommodate bootloader latency
Date:   Mon, 18 Jan 2021 14:43:39 -0600
Message-Id: <1611002626-5889-4-git-send-email-jeff@labundy.com>
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
Received: from localhost.localdomain (136.49.173.128) by SN4PR0501CA0137.namprd05.prod.outlook.com (2603:10b6:803:2c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 20:44:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 967985c2-0338-4b3e-5e9b-08d8bbf1d492
X-MS-TrafficTypeDiagnostic: SN6PR08MB4846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB48462C5C24E7B517C6C41053D3A40@SN6PR08MB4846.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m/V4k/KnSSnIvakwlkcY09Zg8UDXl/NnE+GOw1pW+AYJB+zYWFLep6fgPfGy9mQwcFdfo+ld6QDjltBodksLMKYh+qGP1+379GPAOKdY9CreiyuDgBacYt9/dRQAJx7rBtp0kx8k8tH3Notsfpcf5ygc8lj+rHTiyI9qIo72Tffb9zpKytrtKX3y+BweHOgUjtuImDm5P5pz+KPOq8KQkv04uqpTweu5KKgAqkcIT7VJFguhmIYeIrJ9O0RJOYAMOhWYHMk4kJ6Fs22Wv4vJbALun/J3YF6z6rUDJBqdZpZ/g/+uBnDq/YdSSTmXslNQDsBBK+/J1Z43bKDF9vDATAkf8ojPbZL4wFqfLBX7FQkkvV/rWvFgMtlsCxE1VOxPbk/HPwqYf8VUjKBMHjCyX5pHQ3p8N/sBK1395fXFoZh0osjff31uuO5s3psuS41EXykMbNTYW/buCZOoSwgoaJXSHpRvVrgpxRyP3Ill2dc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(346002)(136003)(376002)(2616005)(5660300002)(36756003)(6916009)(6666004)(316002)(956004)(8936002)(26005)(66476007)(66946007)(2906002)(478600001)(186003)(107886003)(16526019)(6506007)(69590400011)(66556008)(4326008)(83380400001)(6512007)(86362001)(6486002)(8676002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jWSybaJVzZvz/+FQAFG7El5EnXLwxat0AEt3WcZJHxh3hLaEizh3wrZtPJUu?=
 =?us-ascii?Q?9cVkkCNWYau06U1JJfNbbR79OKJKfK5ezKvZ+5bO0gujdpX3l7i+TwXSfGY+?=
 =?us-ascii?Q?hWmo8lBbT8P3mEjCfd90HX3jjNlE/Q3SXTB81xzubX9OsA19ixsgcn3G1cgV?=
 =?us-ascii?Q?Wkp7uI4IkVNK0SxaBp0KKcxwrPAqqH1f7B/kTya9mtBgiZVneVb2c8028gP7?=
 =?us-ascii?Q?50dEsOh5v7eofNlWeVeUJwnyvfJQj4B1a6iPA5S/kbJRpcTIi3EBV9HH1fed?=
 =?us-ascii?Q?ZsaaYKqWbPpJu4tKtHKckURKy4SGamIcGtZVOUye3haXfOHkXZ8b7LOtAUf6?=
 =?us-ascii?Q?wrnFAUsxISU5NL2sTXcq3AcRKmChXazbL5LR7DkWC1HgxWxPXYvvLjfhqwEr?=
 =?us-ascii?Q?EByORCS9wEkIWYKbRsxjPJVfHnEdQC9RsUROwXwk2xF6Lg/uyIUomfKrvp6L?=
 =?us-ascii?Q?idGShckHwhwx/aEURADVS+1ftCFEIt9GdHxIV6Ej5WJoUFwRMKXd+EZEY/7B?=
 =?us-ascii?Q?njOH5SI/KSy8m/lB3SARuj/KH5hXhm5SgJ9+w/fOpqfpLarGRGlZD17PVyzR?=
 =?us-ascii?Q?JNPJRljvp8Z7rExM+Zdbwjw/LwoSBlfGpL9/dOMt9RL+iMqqRhznPhIg/w3U?=
 =?us-ascii?Q?msdG6IWClAIcgqntO8+vsU8aCFuDur7zFOFcmuanxJq2y55RnFqgKSjmsc41?=
 =?us-ascii?Q?UkpO/0gMdKz1vavZ0zqSCpvzNtn6GDCbt+1ie2ElOoEe9Su8kxuy5ZfXlW56?=
 =?us-ascii?Q?no7Dw3kuvy+VyY/vNz6r4IsFTPKYXmlSDz4LVI7K0DaT6z5NAWtxLMVt3XVV?=
 =?us-ascii?Q?3QSmuzjt9QOvhn7Sj5xPU55/nODK32fTNYpw8AfOe+J4MSsb1TcuaNUM0C4f?=
 =?us-ascii?Q?JFhjXpwFEuDCwdYINZgPSyApwqbytws098lbt/N1DWZPyZeHpB8DFCvXmzw5?=
 =?us-ascii?Q?XEKPXUOcxXct51DSLBcbZ9ZZ/JAU9Cp9Fr76p2B+gqNQHRb39OJw77A2kqKL?=
 =?us-ascii?Q?r+RE?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967985c2-0338-4b3e-5e9b-08d8bbf1d492
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 20:44:20.1887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qh2UbzYvPInhEKne5l91590aNTLMYeYdLBkbIf6tfmkEv0L2HFnggaFghh/UTBtC3Bpfvosexrc7z4Oq5qiTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4846
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The bootloader NAK's all I2C communication after the first 64-byte
bulk write if the bus frequency is equal to 400 kHz. This prevents
the platform from pushing updated firmware to the device.

The vendor's USB bootloader programming dongle appears to insert a
delay between the "open" command and the first 64-byte bulk write.
Adding a similar delay to the driver seems to eliminate the issue.

Furthermore, the dongle does not access the bootloader immediately
after powering up the device. Follow suit by adding a delay before
the "open" command to avoid wasted retries at 400 kHz.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index ff0a0e9..b2de8c67 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -336,11 +336,16 @@ static int iqs5xx_bl_open(struct i2c_client *client)
 	 */
 	for (i = 0; i < IQS5XX_BL_ATTEMPTS; i++) {
 		iqs5xx_reset(client);
+		usleep_range(350, 400);
 
 		for (j = 0; j < IQS5XX_NUM_RETRIES; j++) {
 			error = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_VER, 0);
-			if (!error || error == -EINVAL)
-				return error;
+			if (!error)
+				usleep_range(10000, 10100);
+			else if (error != -EINVAL)
+				continue;
+
+			return error;
 		}
 	}
 
-- 
2.7.4

