Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE0D1D7A46
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 15:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgERNos (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 09:44:48 -0400
Received: from mail-eopbgr680068.outbound.protection.outlook.com ([40.107.68.68]:44608
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726726AbgERNor (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 09:44:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFvD1Rd7nyfoJW1eEI5jnbyy5s/Q/DJeekDUKPNYpxRdsJuGr9D589NplF6nHZDJ4Ya1lvcSL4Rnqlgbb9NboK/qXAj53wfpzYGZFrNCJ/0JpKPMxZZnmNNbvadqwkCV17hnKRZHLZzFfELf+AhY/6KuIPMSeqbK4M+e8FUlx/iiQyFOy5h7r9s9mZp2AtHuFpDtZDR2ETHFkZZAjUrrY2sUpE+WpyTYuRbq1rWz2OQ99aZA7n4A9wpoy0taHvzlvh5GGrv5/hYXuEc728aygaia2lWf2/PfEq3oydvhhD9dJoGIgZemgu9bkCW9SVrbMAahQCwrYtoS3OCjn9Phjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdRpEcHBkuczAax3aTfEyJUQniifwOFNciwRHcvOrjY=;
 b=V/gg3sOny4Pi9ZrPUBBXZydfgB+4E5AA0wpDgHx/dzUJvy6pGyRQGuICsqHWEVRW+Gq4cqg20h1G90suJattDjXL6WmfZE/SuVsJW40Pfjw/IMpkLZfLOFo19f4mjfTKb+OYmnt1yzdRBVxUb9dBcv9m0IcATpA2ss0/OPJaIQgp0wQG+kitNVSr0oINw1OwjPkme+tNJ/S/kJEnDz360lyE7LD+8DPBhg2R1xtEO52KVs12vyQ3KiV7grWnZXp0IixHNTL/AoU3V+3vxA4Y+BL5ipreEi5QYxhpRGKg1oDodNiH0PSnNdZMov/b8R8yjGc3GsS4r2LMXD7TYq9hzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdRpEcHBkuczAax3aTfEyJUQniifwOFNciwRHcvOrjY=;
 b=M9D2q1lFQcLzahMe/N7b7tJr8nxtS0YZEGBmBxHXomDFyeGV2z9uyBeUHun/haS2EYj25dZzHlCAMN8M0kgE3QO++frq48/tKb+f/51TKfWdqiKvqCfNXw03TFoA7Kr8GRmaScoxudD/3ls6wsc2eLJJDR02/IgVb3Vb4/UTLAo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB3983.namprd08.prod.outlook.com (2603:10b6:805:1e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Mon, 18 May
 2020 13:44:44 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d1f2:9197:cd6:4823]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d1f2:9197:cd6:4823%7]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 13:44:44 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH] Input: iqs269a - add missing I2C dependency
Date:   Mon, 18 May 2020 08:44:26 -0500
Message-Id: <1589809466-22748-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: DM5PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:3:d4::11) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by DM5PR05CA0001.namprd05.prod.outlook.com (2603:10b6:3:d4::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3021.13 via Frontend Transport; Mon, 18 May 2020 13:44:43 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b018ab0-6ac4-45f3-8d87-08d7fb319f5a
X-MS-TrafficTypeDiagnostic: SN6PR08MB3983:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB39831AA58D76CCB0C58BEEF1D3B80@SN6PR08MB3983.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aQeTmBEthWORozpApXU7B5tKeu/klD4KFxHlcg4gOpKmjE/EVi3wJMRtIO1NJsmmLoo3JgyZO04bfcA/q1V1lnXBF/g2C3SxQwNvSP1yCx8hSi1XR+P9jVrAXiDgmwAJdQ55xJA7vZpOfdkK7Hq/osNcO9el9oqWSGVIp+7633diltU4Ih585K8CX8XdBw9i2TMlUvFcfAzmSNzUu84+/AdKwdeNLHdqeeVYKZHgqq+VjQhmgjwQTWmGex4ctDE9L8+DJrrC0cmBJJrcgOkxb0GECPeQypKeNplkEI/eK0nMs4LokdXMjhiBUMv7hMkrQb3O6mpvg7ScwO6rFQp8K6JNNTFPoXt/7IaUWsa06YvNSMyxmuCiG/XjyFUAUT9Xmvlfhs3DkquzKkGJKkLh3JfTN+Ln8g7r1Kkryk1X3olcf+Bpvrub/ymMjpKfAgCBlxFpZsg8qpM8ygLdn6LCnE3PhhA0o/H4/qWsESUKg8Iw1sbJwwAonOV2UdjK6XLm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(376002)(366004)(396003)(39830400003)(6916009)(69590400007)(26005)(36756003)(316002)(6666004)(86362001)(2906002)(508600001)(2616005)(4744005)(956004)(52116002)(6506007)(66556008)(66946007)(16526019)(4326008)(6486002)(66476007)(5660300002)(6512007)(8676002)(8936002)(107886003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: sXwBcR7Y6CKkekBO1/7RljvzD9BFOIauImphgr2KDIF6aeHAkFstH29ZYuK4/kxw+kGWr37V6ZUbsk2MtdUGSBYfEIojMaUM3FG3HXe1L1uXRuwQPr4n/JmEGVetuTWiE0oa+9MADLkAkytkOnSvIU9Y1BkrbrKXKWIpH0x7Cq/SMKXrc+qUOZ5foGn8UklBat3x4BcltboviNwQo859lW4HJC2GnySKyIhMR4zhO3faD2qqqkFwHp1+cvnuQzIDAhzDa0S8G1FWksoxx0GdI3qlsxnZrap5giylVIHjcEloAzyOY/Cir2vaCR08l+XQHUPNpVXYsVWlV1FcuWd6Bx162YlpbDDbBarV0PPRFKjE1vRt1ozn8DKxCyfgTs6rSqIY+25k/tQo3/ivJt2IWY1s0F7IU3Z+sN9S953Xr0KkIYFDbYwg86ooz3tQfxXwxK2t8z5ew3Q+nNwE/YFDoGqnm2/XgxUgaqK1RqTMKEQ=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b018ab0-6ac4-45f3-8d87-08d7fb319f5a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 13:44:44.3434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRqohT+jCjQpsrBUd5s7Ger6z/Y7rCTgZtDqMPQ8PCm/DfbpVMenJe7Lec5/0D/uRw1oaLQIohpBv0Q6HLKseA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB3983
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If CONFIG_INPUT_IQS269A is selected yet CONFIG_I2C is not, the build
fails. To solve this problem, add I2C as a dependency.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 04e49867fad1 ("Input: add support for Azoteq IQS269A")
---
 drivers/input/misc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 943cf69..362e8a0 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -720,6 +720,7 @@ config INPUT_IMS_PCU
 
 config INPUT_IQS269A
 	tristate "Azoteq IQS269A capacitive touch controller"
+	depends on I2C
 	select REGMAP_I2C
 	help
 	  Say Y to enable support for the Azoteq IQS269A capacitive
-- 
2.7.4

