Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCACB2FABEB
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 21:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbhARUxt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 15:53:49 -0500
Received: from mail-mw2nam12on2046.outbound.protection.outlook.com ([40.107.244.46]:61569
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394497AbhARUqo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 15:46:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SN8HDqNfJuIgkRJmZyHa21pmh+7qTM/D1wxXEInkw3gcNydL8j2OiHIZqo7P1KsjukiOKZ/eqsvnl8L2VvPAic5vTbh3ec9HJRe//m0XDoZAy7HNVKdmRo7LsZnEz56zDvTGcjLFyqOs2+tf+0UosVtckbFjIlix54x/C3sYcc3QQF2/bcnAlSgvL7/I2/jIqVDwrAmpu3pehj1YvLxnwJ1ViAeEmLeAF1d24VGsrGiy9sV2YGV/OJxUJCnV/g/6HytI0G6PJz5a98NmH6DXvqi+lTNfJ3e9ruM9u1sEzH7U9lHVAHreaZ2vNbr4nJptg0EgEkiFIhoVajUt+wIccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhgl2iYRca7HZoQUK4EJ5IVrZk32sjJFMIjWE/zshLo=;
 b=U6e4GFmPG9OKQKaIl65sK4uYFyQDpnCGVUqVPZ3E0UvNtayQZi2vDaD+/E5XdwWXTZg0iU1jODv2yP07pSCmnn88tO4iRhp0Liz9vhB+Nqp3yCBuOus5KSY/80i3Ju463AjUxuhfyY7YIcEHrSneFvaAJ3Awpi/InwsGqSCjwL7mlFeg0zx4QIb7HQG/ZQb1jfY0pAw787zzBIJ7yy96TjF9idIlRUwM3Rpb2b5WCcQ/qDn/7xMgFZtzSAPv/qwA9wxov0OYMObJeZNfjI1LvFsn98eVLt0vdxjX5vUphYeNX/K5S1Ir/tsj4GUVJyxnZoXBHU85gHqlNGaemPdASQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhgl2iYRca7HZoQUK4EJ5IVrZk32sjJFMIjWE/zshLo=;
 b=ifN4RyYM5gVZyDDaYJ7VxXCBgYwg2CFxXQac8YIJKZyoN9l39R1gPPsd3Svx5VWp7MtP4iLECO/Igwqj5wWd+opJm2Gndb/dDEa8F99evkUwVL2sg2ZiFup8h3pdOB1uPsziM3h6r0Fc17hXIoW7OMs2sfmNDfFdCsTi8Mgyn9A=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4846.namprd08.prod.outlook.com (2603:10b6:805:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Mon, 18 Jan
 2021 20:44:52 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 20:44:52 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 08/10] input: iqs5xx: Allow more time for ATI to complete
Date:   Mon, 18 Jan 2021 14:43:44 -0600
Message-Id: <1611002626-5889-9-git-send-email-jeff@labundy.com>
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
Received: from localhost.localdomain (136.49.173.128) by SN4PR0501CA0137.namprd05.prod.outlook.com (2603:10b6:803:2c::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 20:44:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1b118ba-d3e6-40e0-a0e3-08d8bbf1e798
X-MS-TrafficTypeDiagnostic: SN6PR08MB4846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB48466DC1A2EFF176704AE973D3A40@SN6PR08MB4846.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KGdJ7p8EIvHfBOWbRooNRBr/SKUbG6d0siH4vHxqJU0LxSjEen/ECwx5Zxi5comFdm+0ZrQ5RYTdnGJhZgeqdCDyX30n2gNKhjA7ge92Ak97UOiNiwExYV+llylqKRWl8u/iUqkbg2Xrg31XTa0KG2VffmfMvtThdw0Yzv47DkKjLMfCpPLppNOVGlPseuZuO7tvrTxg7MNz6z8r2wxsFibc/SY+YnbzUaKbeA65W7fHsQXEuSI5a681E3EFgi8nVTLsx2C6Upyg1ICboABA3HKk8lFaCdvFK4D6hH5G3VQZ+HQZr075+czVKxjsMPupWcK9mMpRbCctapBXPn3RdKcrS7W9oCUzzXzBL5Z1ubWMSVzky1I25dVRXBOPDi4/kDF5wSKIfeVM/v30LRo37X+l9xOborqSJX+sRxVqBH4vcQFJmNt7lYeG4FfEAOLCOhKgpCdXKa1Hb+MP//szhz+7rPS8mkjaYU5FIYkf83Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39830400003)(396003)(346002)(136003)(376002)(2616005)(5660300002)(36756003)(6916009)(6666004)(316002)(956004)(8936002)(26005)(66476007)(66946007)(2906002)(478600001)(186003)(107886003)(16526019)(6506007)(69590400011)(66556008)(4326008)(83380400001)(6512007)(86362001)(6486002)(8676002)(52116002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6HSlESQ2BON67t0bBUZkZXsadPKzI5q5SHUUgWcbshQXucfDemvi+R6osSzW?=
 =?us-ascii?Q?zDi2bpToKISCzeoU09XT40dPn8rG+aWi6gvpgsmszKxLvKzAYj09LgWux+CP?=
 =?us-ascii?Q?J2T82UHDVCBP6dZchnq/Z+fhkW2w+a9Mj37kq4hU23Cs7mmd0GlTuRXEwTom?=
 =?us-ascii?Q?IE+6fmPes3Uf0jAkDmykJH3wli0FvQrHP15dl5QLdXUgnGA5G4wqcH1HqGBp?=
 =?us-ascii?Q?lKKiqSqwqYm0HklsyyYK5A1kEh+aSxho54QTcUUQKu44qdHTIjWoJWrHZo4w?=
 =?us-ascii?Q?LHuiE7fCRsRKbxQV33BR3NZ/atlAsM9YY/b6sJ8Q2Y8MSHlwkqwu40yL/Otq?=
 =?us-ascii?Q?wmjh6JJ1F3TZe30Ndz36OXUSJ5CVR3sx0iJ6tsG9PvyKYdi5ZYFGtmvInbuP?=
 =?us-ascii?Q?Oy0rsWvKzrgdxJr4i/GWszVYdxnKRFtPsR1CgqXHltphuWXvN+xQ4h6RWX8g?=
 =?us-ascii?Q?zlqDmLbM0/cRYS2k5cbhHK5dTNXRT45EcGH/+Kfhpb6q6Si+5aK5cQ44t4H8?=
 =?us-ascii?Q?bdzI4oFZeWcKw/erJMROO141gPTTBlYnC+w4MGD0NhEGkWMKbwhWywsK/R1t?=
 =?us-ascii?Q?w86Ix+bhwqONrYWNj9dhrWgSWp5NC1KrlUqgR+EI16qNZI1O9rQiNBirUNEU?=
 =?us-ascii?Q?atgfNxQqW9WLJTZ5yX/U2ax+6N1V3gyWPPMG+0xtb3dOx4ui+w6eSv6nqt/w?=
 =?us-ascii?Q?VsAU68FWwi95z016kuDjWQcquZmoeuUDUiNmvfQ/JCI8XLTHlo266BVXSqc5?=
 =?us-ascii?Q?ybnRZgMEcdti5v83Trirj8o3/dMKd04/i7nCN6IRU5d3MB3HjF7wsgmeR7r1?=
 =?us-ascii?Q?317u68wsDuDjiqCOvmCZvwjTnXOVN21vJGuZb7JV5SdnGq6BAw5dysoGUkmx?=
 =?us-ascii?Q?z+IzxlUsmrMhoGswD9AZUt4Synyt9Vb9hUr7cC3VQBiEVmpLt5xB0SCNf4rp?=
 =?us-ascii?Q?Hepf1LmKm8i67RA6wl1fy7Cm9QoE1bwfAGyg9nd97vkLnsUWmswvPHjdnnts?=
 =?us-ascii?Q?mEpE?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b118ba-d3e6-40e0-a0e3-08d8bbf1e798
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 20:44:52.1065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LO1/SeGgA7I1Jqxhlv8t9wgBPEvWpzsxw8J7Rk6KYrkVVOm+qkKKTUh3EzQRQ40ygoKTlKbHqsI6zkaxUQo50A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4846
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

After the device is initialized, it runs ATI (calibration) during
which it cannot readily respond to I2C communication. To keep the
open and close callbacks from writing to the device too soon, the
driver waits 100 ms before returning from probe.

The vendor reports that ATI may actually take up to 250 ms to run
(including margin), so increase the delay accordingly. Update the
comments to clarify the reason for the delay as well.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 50b9344..babd1f1 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -648,13 +648,12 @@ static int iqs5xx_dev_init(struct i2c_client *client)
 	iqs5xx->bl_status = dev_id_info->bl_status;
 
 	/*
-	 * Closure of the first communication window that appears following the
-	 * release of reset appears to kick off an initialization period during
-	 * which further communication is met with clock stretching. The return
-	 * from this function is delayed so that further communication attempts
-	 * avoid this period.
+	 * The following delay allows ATI to complete before the open and close
+	 * callbacks are free to elicit I2C communication. Any attempts to read
+	 * from or write to the device during this time may face extended clock
+	 * stretching and prompt the I2C controller to report an error.
 	 */
-	msleep(100);
+	msleep(250);
 
 	return 0;
 }
-- 
2.7.4

