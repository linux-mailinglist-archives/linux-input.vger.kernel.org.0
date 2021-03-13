Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911DE33A03C
	for <lists+linux-input@lfdr.de>; Sat, 13 Mar 2021 20:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234384AbhCMTOH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Mar 2021 14:14:07 -0500
Received: from mail-bn7nam10hn2206.outbound.protection.outlook.com ([52.100.155.206]:53024
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234336AbhCMTNa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Mar 2021 14:13:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4HYUshvEDMW8SkJsDfHBTZWjegwsEDwiQM90iB1fxeqp1HkFBgy4abo50fqJkPNDbMF9p2kPjcTNvs6MbtPDvO7NvEv+sB1Y0Iw3YP9mIK8rtR5kW9txqFzu5C26A1W3ulvVscoPY1M79BTTaOwIxZqoj4B1lMDZyfHzZW1YEz4bgu14ZWQ9ibDR8XR0Gr5mbjt3i7odTQXg8DioN/3Mdef+1hZ1Ind3G1hOa8wP37Std+YFe/Mny0c7nFvhS3nkh364RL6zizJPcGKfOedQj0QAA72sAi9rRvjwAUmTCrbkWtWfRv1YeoP4hJZX4uNM1zIIfuWwTI3hsndsewhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7P+XrUv/M/HwUkxxb/ZCp0IQ1C1nEh/oekmjQhVAz2g=;
 b=hQAbLbEi0KpZAl8DuFyELudz0Et3cGaPUoK3dZPt+2O9hrqi+wzGkVfDT/GNRlJHQUhKWpD1JcPb4VTfU0U5CwpdG0Nk4P75+I7mICfLdVidIRy+QmJ8isJ7tiU1PlzviJ3L2KraHoagatUDqoT460RcTMA/yrax529Xpbm4mvrt80r3mVz1chIdlTUtIudOF7kBMBWCKuJ8PCmi1E+5yjbCdOvJnRTj1TXMpV/EzIvWuYPa0gKy5+x9MFaVFXwaSwvu92SqGhV4f8UdNmqoM/VBCmVrbCgjMzPBX6TdxhvP61bfP1XQ/OpcktPSp2AuLtbOiYsyu5GxgdfOIfSb5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7P+XrUv/M/HwUkxxb/ZCp0IQ1C1nEh/oekmjQhVAz2g=;
 b=aWn2m0lijFKbcSJFqFBfxFdf85cvq7PiA2gCc0lmiToZjhuUp2C/+DWXn4gfAXr5zygVH1zQK/l8BqB4HDq0GqMS5N2eOO++YnBnepBSdpqD9ZUq+toZiCOjzFs3jGDaGZByJgn4B3f4juuP6ylbHW3+m7OpvZgbX0YE74gs9xU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5694.namprd08.prod.outlook.com (2603:10b6:805:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 19:13:29 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3912.030; Sat, 13 Mar 2021
 19:13:29 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 5/9] Input: iqs5xx - close bootloader using hardware reset
Date:   Sat, 13 Mar 2021 13:12:32 -0600
Message-Id: <20210313191236.4366-6-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210313191236.4366-1-jeff@labundy.com>
References: <20210313191236.4366-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN7PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:806:127::26) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SN7PR04CA0231.namprd04.prod.outlook.com (2603:10b6:806:127::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sat, 13 Mar 2021 19:13:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c778abf4-0ad1-44d4-a336-08d8e6541603
X-MS-TrafficTypeDiagnostic: SN6PR08MB5694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB56943B601A9926A584E9D378D36E9@SN6PR08MB5694.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hb+zdYghlPUiWYmX7XS4rwbesQwcms8cuweCbLRefeN2h2/Z+mU7Bg+f/cJq?=
 =?us-ascii?Q?G0KOmNnBPEAoFr/hECc44jCoUzVu3kUpmDqMyI+VUdfhHiyVcSAuPWAYzNCS?=
 =?us-ascii?Q?YAbVExKwEDgQFgI3b5pWQU/ujYnTDchY6IMkk1zPLXI2/aQOYhREtNU6fzgg?=
 =?us-ascii?Q?03MB7jlW78gLyfLwMi93xdxcMsCV8q+y8TriHBpVAdjcxnNgs7Sx3AEWQLvQ?=
 =?us-ascii?Q?ZpPeJ4gNp9VuODWX+FMMN7LuQKEs33t6+ilN3Sy9Z++r61y5qOJaRAKtDmBZ?=
 =?us-ascii?Q?pA3rAd2BOtAS9QhqdUmeSsgaWteA0RNJuWNseijgpLh6RpYBuF829+ESL72a?=
 =?us-ascii?Q?aOobwovxXaap2M02BniSdDiCDeJyNh4XXLtXdieEP0eFOWwgJ2YrNXonfSCq?=
 =?us-ascii?Q?UfdNa3SGVjwr5aPeYkrZRZQ0LFINWquXiysfmtqWSNiUZFyep6kYUDfTOMei?=
 =?us-ascii?Q?+cU2eLaIEA7d8FVPGrx7aav1ip6uf7PRhMBQz9Mqha8Ol7vmtcWcZFeXvBG/?=
 =?us-ascii?Q?raSMMVlj4oqY3i3iwNpNQEP4eCLJSHC+mVNNX6QIRygKCDp69jqTnoG4pTEa?=
 =?us-ascii?Q?SdG5240HxiDmh5C+fmayrdeVAx+EfcwfAefEj4yFcUp2PwqteTJC5hAAn4e1?=
 =?us-ascii?Q?NxLAmWgc6v/Dit+5FMG2uJoq7FTaWMO2uP5/IU6UrCnA5tQW0mA9/L+28say?=
 =?us-ascii?Q?x/3OwGRhq+GryZFPKhHM1YKEsxLbeIHFDSkuaR1+cSplZas3rYedk4KcVlAJ?=
 =?us-ascii?Q?VUoMUbnGGinPhOnF1GvsQ3cShK8/v+KAgMUN30fj1UQ69j7Gzwx1uCmy4jig?=
 =?us-ascii?Q?pSIezgckK5+KTnjs+CukTZJB7JwjX05fTmTJVo3pba6/FZIAfmBFk3OsLKum?=
 =?us-ascii?Q?epM5l7yBz4M0sAu6wElO/jFsmf2ysxfApeE0VNu30rSpU8fK7cAMfYb1FcYF?=
 =?us-ascii?Q?he3YDHUVrg/lusyD+m2p9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(39830400003)(396003)(136003)(376002)(346002)(366004)(6486002)(52116002)(2906002)(66946007)(6512007)(2616005)(36756003)(186003)(69590400012)(6666004)(16526019)(26005)(1076003)(66476007)(478600001)(83380400001)(316002)(66556008)(956004)(4326008)(8936002)(6506007)(86362001)(5660300002)(107886003)(8676002)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RyHsX1GLx3SFRsSTbXPFrxuy0WjBzURxmOp10pRd/sUvLkfxjFQeKgNqnSo5?=
 =?us-ascii?Q?PtTAtElWwSTKEp3MGUmRirrObzf9Ei2YuwTocTSKN4tKIR9p+aJ8xfDaIkUn?=
 =?us-ascii?Q?gxpHYdQtiRgcrig/vL3qsAZkb+DcbbGBIWM1YNc9MhYOu3d9tRJAfDdnjO2O?=
 =?us-ascii?Q?EfT12x0HfiLDrhdqH1eSgfGzlQbaE7LznJp77sqr7VOprlwBDFLDFFoIqJJh?=
 =?us-ascii?Q?wt1lrmZHLKqUmjSj+zD7pCkYbaNlEUmuKg8ug5wmDHXEO3nWxYMglEe72eG6?=
 =?us-ascii?Q?5+XYW9dIdk4Wrual64hXUADldANyd6N+tVEDeS8y0TH8cw6w+Eo9iqGHYuBx?=
 =?us-ascii?Q?nwTBoSxouOzzTGZ7FAdgxFOfCylcGry4v+Zr5N+9SYji6iCT1kfKklgvNy+g?=
 =?us-ascii?Q?THBJeX2ceQNldto5Zxfg+8TMPcaKUuAPlDyePgVa60hMRnyjGahNQlSyNjYV?=
 =?us-ascii?Q?gvzOQHxACTpoIz/Vcg/up7sauURGeZTSzDCCh7i4T7Eyl7eI7VutZ8domf1p?=
 =?us-ascii?Q?DrFkNzLko3MxYUA0OcITwOn8yXUdfEVmDucmIds4LF+lJWpcf8kswdWuZqL7?=
 =?us-ascii?Q?WxrxV6EBx1/rOhMfmo3XKW3vDErsPMKiQCEMtw+vM7MKw+727BziZeZC5iwp?=
 =?us-ascii?Q?MpRVORJrDbt6S7a5OAFzElCIRQcmt462X/LHKLS03b172itsFKMxsr0SN3tu?=
 =?us-ascii?Q?vYsEcBXdXWtVCelC8KiPDe6ELsRJsJkDSVn29Goufcnoox4VG72SFaZv088+?=
 =?us-ascii?Q?W89iNa+abGG76gyk1XwY08XDT4Ap0ZdcVQLpLUNx4POTVkfEvzwKJiTbAAA/?=
 =?us-ascii?Q?wRqlvMhP+LK/X2VHp5eBCivHg5cofjqLPtOkvx2e5qRRC2p7Ffw7bIBkBj8j?=
 =?us-ascii?Q?v4Epl/TVlZ7JT4TEvFiMW98VQMDigg1DEW1I6qpwybulpiTc8UiR723GcsPG?=
 =?us-ascii?Q?qUshW3YxuxmdK5Cgh6rmFXxeVWlvY/Kl6XLKzSAUQrI1i4gzDk8EDKtmcE9h?=
 =?us-ascii?Q?pvN5EGTM8lRE8TP0DW2Myiru8GIRoAXPrhPS5l/3Yqy7tqqq8gM6Ox2Txup6?=
 =?us-ascii?Q?42o01C85aT6fG86jWsK6jpFj4DnofyQ6Xq6YdHV57hLDtnpnYnBcg2/Zc5wX?=
 =?us-ascii?Q?N+29ZDAiS1wHZ+mSKFNpe16ToyGKCUZykMYrVdUIIg8HMJ9tgn809xChKWy4?=
 =?us-ascii?Q?A1GEb6B6G3MvA35w71nDlyVMF/P/H+MQW+6zUt0nbfhWBzaOnqvGcN5uccjW?=
 =?us-ascii?Q?ie7wkKNuDuuTf0mDK9rDjFlJa8iRg+nQxyBjLgePbAwnhO2S0q6hc7QsAYgq?=
 =?us-ascii?Q?ZOYVbGykys4+m3Xj5S57fK7j?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c778abf4-0ad1-44d4-a336-08d8e6541603
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 19:13:29.5192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNpDkPD//Mm17J48BU17bx4tq14Q9AIELr0AqcqAh4RURR+6rjb/oqT8UcvF6Dpa9naWq8C8JP9/JrvloSJzfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5694
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The bootloader can be closed using the 'execute' command (0x02) or
hardware reset. Rather than using the former option for successful
firmware update procedures and reserving the latter for recovering
the device upon failure, simply use hardware reset for all cases.

The post-bootloader initialization delay increases marginally when
triggered by a hardware reset, so increase the wait time to ensure
the device does not subsequently fail to respond.

As part of this change, refactor the return path to avoid an extra
assignment and to make the logic a bit smaller.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - None

 drivers/input/touchscreen/iqs5xx.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 0920516124c7..a990c176abf7 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -832,7 +832,7 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
 static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 {
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
-	int error, error_bl = 0;
+	int error, error_init = 0;
 	u8 *pmap;

 	if (iqs5xx->dev_id_info.bl_status == IQS5XX_BL_STATUS_NONE)
@@ -875,21 +875,14 @@ static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 	error = iqs5xx_bl_verify(client, IQS5XX_CSTM,
 				 pmap + IQS5XX_CHKSM_LEN + IQS5XX_APP_LEN,
 				 IQS5XX_CSTM_LEN);
-	if (error)
-		goto err_reset;
-
-	error = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_EXEC, 0);

 err_reset:
-	if (error) {
-		iqs5xx_reset(client);
-		usleep_range(10000, 10100);
-	}
+	iqs5xx_reset(client);
+	usleep_range(15000, 15100);

-	error_bl = error;
-	error = iqs5xx_dev_init(client);
-	if (!error && !iqs5xx->dev_id_info.bl_status)
-		error = -EINVAL;
+	error_init = iqs5xx_dev_init(client);
+	if (!iqs5xx->dev_id_info.bl_status)
+		error_init = error_init ? : -EINVAL;

 	enable_irq(client->irq);

@@ -898,10 +891,7 @@ static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 err_kfree:
 	kfree(pmap);

-	if (error_bl)
-		return error_bl;
-
-	return error;
+	return error ? : error_init;
 }

 static ssize_t fw_file_store(struct device *dev,
--
2.17.1

