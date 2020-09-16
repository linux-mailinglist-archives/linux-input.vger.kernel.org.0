Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6CE26CC01
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 22:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgIPUiA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 16:38:00 -0400
Received: from mail-mw2nam10on2085.outbound.protection.outlook.com ([40.107.94.85]:20054
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726850AbgIPRJU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 13:09:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+kbP05Hj+MGkkN0VMIew22BrATOvrM2ayKeMMX0Xy7Q2KD6ZwB2FIWFWsvxOvhmWFuf/iE9Dj212ighDUP8C2hqi3gfIvwPSeHicCXDx3W9tXiUKiudim35Uscy4l1sgKdi9c3X428+Oo3RE3Y5noJU2zX1CEOmogz65bmlkCGqF3l6VBuhwyV3Kg+PW1DbPebJ1hWBaXc90TV8PNvnsRWg7gdugGihpjznKDKVEW6FRVPJIRYSxFA13OW+kQbRQpPXj4LJM67EL4Yi9thWN5pbBjjQufxnFoV31bqU+3/n9fjtkQkgs0e3BJoBRrHkKw57i8QgAqAAK/jA2eLV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9/eTZBlaPJEzAej8lbwEHc61Kn6Pi6rN+lShHZFG6I=;
 b=H7R76/vuABPcnlQlt4aWBsEK2cJwtXaDKCw4MDlvnWHifYUEIXYqwCrdeSrk5zf+UlF+sTnT8kY7HAt4H7CgHFbKH+FVyGNoSdhsLUwUKGyJ5UAo8qUid7BnC0oxWQTgYJL/SYeEJfu2hWw5rYZBZ5Py4p2v9Nl6UY6V4+0P2dxgRHRwlLzmWwOk/xU3jJJH07jQOWUVsLsS+OVC0Ij4/mW5Qnos+ur8UKA9aI1oPi7DPoqJyfg5UWjg8pqBMbVZd8odmTjyhEMs2IDc/x99fVV8MzbqwtNiggQQQPehpW6hM9cjUPbQQOxX6PzZ1xJvsTLUqvSHcwGNusk/em2IrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9/eTZBlaPJEzAej8lbwEHc61Kn6Pi6rN+lShHZFG6I=;
 b=VvTLmYTIW0kF+44uA9eqG83qFbEMGG2P1WtEDR2zz8BDMxhajRW/xkMGiYfthpsqAq9GsKtYb+IaiCYElO/UOorpsNRv+k6FCl2D3Rf3wxO5cXVTKrVC+dCbwZA4iGE3T6y9Mesm/YUn6GbDd440QucaMs+EjjJvWrlevVCJeXM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4848.namprd08.prod.outlook.com (2603:10b6:805:6d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 17:08:58 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 17:08:58 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [RESEND] input: iqs62x-keys: Remove superfluous function parameter
Date:   Wed, 16 Sep 2020 12:07:33 -0500
Message-Id: <1600276053-3336-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SN2PR01CA0082.prod.exchangelabs.com (2603:10b6:800::50) To
 SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SN2PR01CA0082.prod.exchangelabs.com (2603:10b6:800::50) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 17:08:58 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b77ff112-dfa0-4515-bac1-08d85a63336d
X-MS-TrafficTypeDiagnostic: SN6PR08MB4848:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB4848F74EBD1E0EBDB6DB1655D3210@SN6PR08MB4848.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R0Ugd8lOy+G513JDvidDePdy2juIMd6jhhHBQDuFfeALU8NWjL+cC3r8hhN++xOdtDxbdSwKASuU4VEPMfLkEY6L3VciE07lbNKvyhSujlTM8GYf7zv+Tmr/NkPwR6iQW1+kbq5Rfb4Wv5/m2BcKdPaZzu/5VbQQyCcGDRDp4GjyPQt8IcKlAGPSO6ysURcYRKb5FzhiK4cA5Ee09xa1O7RPkQOFb5l1ICBF2CWyblTMn0zaa5AE/wRYuiWESAUQFWbbVnPfLA2xMLQTiqLlyZ4aNn/rqb/KL4GtOjHmXC8qSub3IvzjpX+QowacdardjsnHpP2v3dp25eXB6JePPnvQ0sVcGJQrimWhKBY/J61b8pB8A2XrLEHTnQMFhkCbw29s0B5eY1QQ0U7ExY8hJYGSD2n8cVZbIfTW+2+TrZK0nBrinTmNv67jav6zYMZ7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(396003)(346002)(366004)(376002)(136003)(956004)(186003)(316002)(4326008)(107886003)(2906002)(2616005)(26005)(8936002)(83380400001)(478600001)(16526019)(6666004)(69590400008)(86362001)(6512007)(5660300002)(66946007)(8676002)(6506007)(66556008)(6916009)(52116002)(36756003)(66476007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 71vod8TtW3DMEwD/jm5L6zbEvvLmeZo6cQZWmlr1uwIvx+DKmVfEOC876O31UlY0d1gtxBdPzx5Q6rSuj12CEW9yxgspFOmBUK9OARLV3wld+MkqVch/JNPv9RCao/2YUsx09MIKait9EPWRt82GlY+YbWMzTjazxpo60AW9dp6NwS0nB//TvToO0fDXrZuacX4bdG8l0hXWaIO5AqVN0VaE/cpHIkAB7r6EDELb0wtuzrOyUCQ+F7qYY2EQW/MnH/2TPMDfAPEPjJMzMi9SX5Zrvgr2FHUhVigm39pxaWg/Ajh6Y3c4/HF3Fovgjhfm7MgVKrTNlp/eM3CDLHAIjNr2S/xl9nbUSmm2AHdraTh2mOY8jXooJvIdKacU310kZ+QVucM9ni+I8t4f9d4OBqPWbfB57BfIppYXjIlT8hMMC++pgPhEsZJkNpVYHrOQRoxfGtSinHK89aECm5+b0tLb4ZRDRquEGcP+hWcmP43md9nC69y04wmO9UzxLrPB/Sife4lrgcTgeAfFums1tyfjRuPzNE1fELVYQ3YbxFRwyj3wQ5SkzIsw2OelbpaTulTtcyhNDCIr8/jsnEs23/QWmPb23HUP0wG/GoeqOncQVK6lI6WbHlQ0I6WxSWDMrlVyqTejTDpL6n3Baj8XLg==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77ff112-dfa0-4515-bac1-08d85a63336d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 17:08:58.5745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kULfHg6Xp0/pLXt6DVWZc5nwTqyrufWdWx5HAllwboS9gs15InQKpjl/uqfnHKqbat1KU5ng9b6cIEQZandWEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4848
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It is not necessary to pass iqs62x_keys to iqs62x_keys_parse_prop,
because it can already be derived from the platform_device cookie.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/keyboard/iqs62x-keys.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keyboard/iqs62x-keys.c
index 93446b2..e2a2b38 100644
--- a/drivers/input/keyboard/iqs62x-keys.c
+++ b/drivers/input/keyboard/iqs62x-keys.c
@@ -42,9 +42,9 @@ struct iqs62x_keys_private {
 	u8 interval;
 };
 
-static int iqs62x_keys_parse_prop(struct platform_device *pdev,
-				  struct iqs62x_keys_private *iqs62x_keys)
+static int iqs62x_keys_parse_prop(struct platform_device *pdev)
 {
+	struct iqs62x_keys_private *iqs62x_keys = platform_get_drvdata(pdev);
 	struct fwnode_handle *child;
 	unsigned int val;
 	int ret, i;
@@ -258,7 +258,7 @@ static int iqs62x_keys_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, iqs62x_keys);
 
-	ret = iqs62x_keys_parse_prop(pdev, iqs62x_keys);
+	ret = iqs62x_keys_parse_prop(pdev);
 	if (ret)
 		return ret;
 
-- 
2.7.4

