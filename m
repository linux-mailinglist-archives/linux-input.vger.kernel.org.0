Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D850D245980
	for <lists+linux-input@lfdr.de>; Sun, 16 Aug 2020 22:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgHPUmO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Aug 2020 16:42:14 -0400
Received: from mail-bn7nam10on2042.outbound.protection.outlook.com ([40.107.92.42]:18400
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726314AbgHPUmN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Aug 2020 16:42:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pu3nfW/5cLydUA+lSgxvojUU0sAOEXilz+ljNjrT90GepZGlZ9c38sRHkCtqUeQ55uZYI783cvNDi9Q/mYUQdsePObYvdyvAUcZu2n5jthjjxBi4WndMwpBavyzKyxi43YXvuhQA0zSc831QnCjwbxWeVpEXtCD7UGbf08wOqaD/ExMdI4nUoTI4dkZZNwIAuKGuqEPGHr7iuxUgE12U7JJXG0FkH/thHB+2Ibk1VO9w8koUwvcH+9b3OqPGNnQ7GBiUb8u64aMXEmjVb1p0Icf++nEIL3M4aHkDvqKJfkqT5bUU/XGXUotug7iVtvlVATSROmr+rSjYyVq+ZoJNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9/eTZBlaPJEzAej8lbwEHc61Kn6Pi6rN+lShHZFG6I=;
 b=BVqyrmhwRJiDxxp0kkvb8gC+AKUn8CKqYG5Zuri2h0Ed6fMvxFn9S6lisp/sArO2J8KFBWdp22UC08gn3qubfxxd1XmLmp4UYoymXN5llqqx5JB6arxD/TqJp8wXaPbCOKYJ8g4g9wSBSEDaWTWDTYPzqAGjPZUAHvxnXEuOD9jISb2sSDP5gbH5oX89V56kUNANBjfXFQn9KZ++UtvJ4tuURf8y1EsfCMAqVddFDI+/TofuZ8O93uEWSy6sdv6ZUX4ixQaaFm00QiqjOVdgUT8WsfnVVbV9rvvAyRY/gly/3pRG+Zso8PtWlBkBvY7vlv3Bo8zCyPjENakNHqDRlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9/eTZBlaPJEzAej8lbwEHc61Kn6Pi6rN+lShHZFG6I=;
 b=xl2r7kcxFsQbBfXZH6wRjBgofnOawi+V3FZtLrPNL+JGABbtKaOmaz16Q/l6jCEhmf4YTuDIJI7gO+sluHbrUUJ/ea2dDgcsc+GwTE+6vnPUTxoxof1wqteOdy2LtEt7VQU1E4EEqik/r5peGbWX9oOlfGxmu0JW0vEcOd4eJOg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN4PR0801MB3824.namprd08.prod.outlook.com (2603:10b6:803:4a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.23; Sun, 16 Aug
 2020 20:42:10 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875%6]) with mapi id 15.20.3283.027; Sun, 16 Aug 2020
 20:42:10 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH] input: iqs62x-keys: Remove superfluous function parameter
Date:   Sun, 16 Aug 2020 15:41:46 -0500
Message-Id: <1597610506-6003-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: DM5PR15CA0053.namprd15.prod.outlook.com
 (2603:10b6:3:ae::15) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by DM5PR15CA0053.namprd15.prod.outlook.com (2603:10b6:3:ae::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3283.16 via Frontend Transport; Sun, 16 Aug 2020 20:42:10 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b781534a-27d7-4b03-c48d-08d84224d95d
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3824:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN4PR0801MB382478514FFBDAA3FE1546B7D35E0@SN4PR0801MB3824.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RRa5bf4A9N8JNPEWIv7m3tj07if3+36Yr4rxZSYr3UlOoGV1wvBurDtohkoEpqgcFStfD8ujkN+YJ6Slg1y1DMgBpFHSj5iryWEGW9Cw1Iusjfb+fWPsPeEvBezHPvGIBFpBPxCvWSOSMM7B66IykXSJ/OQvp9x3d9FvrWwRJlmeVUGSzapyp1lTqkh1nVNwMBVwp9FmrwPKpUedwCk+3mD/hoTdulbT8tnpLkh6KwskkyCqxy/ZJfd47urzCydaNqHihI/MEGyt/tJ+MGveZzNNT4KqAXEN9zWzywvqoByRcdV9TvI7OWkRuXSef9hfgmpMrC64tGdigMatNWhXMdXRRWMAybvIAiZ/sRQ1joN1B39dKMcA/+siVVy7JGIV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(376002)(39830400003)(396003)(2906002)(8676002)(69590400007)(956004)(107886003)(66556008)(8936002)(66946007)(66476007)(6512007)(6666004)(5660300002)(2616005)(36756003)(4326008)(6486002)(6916009)(86362001)(26005)(83380400001)(6506007)(316002)(186003)(52116002)(478600001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 28V6+/ncMTltB8cdqDw1kP5/jQzvfg8NqEeuWg168os5VWzQzIqrHaEsy1agCbgkhtHmoF8/T7RyI5+FDYzgxCpVuXRfkC9x9iDG0BllSVt4J9mh8piSznFeEqh7Cv+3etF+RTMpVFJWDRUoX20Rc0Vamr13zsVzLgaGKC5x5dFe6R5RIqFlfVnHZY9IY1mZnYRndDDBfqbgKg/eMj/NfizZxLlryNDJWvBfiqGWHTNFvHkAS/qMIqUpiANHjV8dWpZgtzT+spyJ3dv7H23rUSqHzhYY3IF8/bgRBy07cz17l+eWwvCWaWPL2bb5WYaRkyhgOn2qIrineopCQH+icL2KIaWOn7H6gW/Y51Al7XIkPEcZcXxI5k6BHwxqjdbfc/coWMI284VLEPITT/LxhOXBDakDk+eTbwqoJPgFBGYHqBvNyYTv2VqRXOHVvpFqmcRfmgRNJgUdZjR0Kk3vNl7RgW+RGr7qa8ecHPuayxBjmv4kmX+WZNcAhQUSinPdQ7y6iB4PbBQpymiBBNK5OcTgd0Sn7CDs4aYSVkXkblthcMUEos1mq0QZ0U4uJ/IjH5yDKJ1SwOd+KoBpSr7FLVtIek4imMs17lZmIyPgeaP4jq06GQpjwH/JU1Kay1XdkQVqbKkDFRG3L68yApqN4g==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b781534a-27d7-4b03-c48d-08d84224d95d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2020 20:42:10.7861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8mOHXwmL0CiA0h2OujZpbZKLXaW9ufiHHihtvcueY4xAFqfikigvOvN3Vj9JlhQTr/XsmhXI1Taux7H1IcPrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0801MB3824
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

