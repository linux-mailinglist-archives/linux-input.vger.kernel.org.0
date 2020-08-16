Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2132459AB
	for <lists+linux-input@lfdr.de>; Sun, 16 Aug 2020 23:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbgHPVP2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Aug 2020 17:15:28 -0400
Received: from mail-dm6nam10on2076.outbound.protection.outlook.com ([40.107.93.76]:55009
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729072AbgHPVP0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Aug 2020 17:15:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlDtyH8F/KXERVUI2JjUVLPJF9NahCmwJA0RYcuGAuaMS+jx7R+E+npaLk2md6/vS7FspvCMvXOpJTv6flO0nypzOQ3rHzMv3x5ZNN+4lHRwOGJuDPMpROPy3coxIQGtmXI3kVTzt80n/Q4tt18URqW1/Gsdtd3Q0xO4PWbMLsROTuk2oLlSZCe/1MtgzinSDxE7drWdkNg4fuFStEz0hcXENKt83mEMzdpnmvi+nsZrDCF3w2tirtaCHDx9TWmGwFR2PUgKkXytLKSj5etMTi41zt1ITac8O1l9zYDVV0vqJbFVnspUufWgH+q3poZOJVeTgwJWydmEfUcu8KqCpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZOS9QNE92oxGWSPhUfAu6jraI0qXSySjYhObHDbUcA=;
 b=GOguSVJBxBGO/rqlJlzFeSTVaT+HnC7lfjYMMbNFXoof6M75F6INkWHGlVYKia/9jdRQq4vBnzyrViSie4LC8Ujiw9YnAR3pm6dGO98dw9wHH20yUnYf3dUPImmjim/JeXZS4WifQG9Uwq7iTT7to7B4ok7PbamzCDL4D2MaU6YAHG3LRDwMlCeD8xWMr/+6qkJCdmrVqk8y1z4vjsmO8/GhEFpq2Q927paAOEczNvI5rTof5HYv2pmphNyHz33OHemjNV6arE8YqjnmAwPmdaCH2PWyPtEFAtRTg8u2xKasX2MzXIT0aEirFZTIx6w6BTtkFp2Qq5fmgvv9G1gG+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZOS9QNE92oxGWSPhUfAu6jraI0qXSySjYhObHDbUcA=;
 b=qU1JyO5Z4Bl4x3hVsDligHDq/5XdRjaikO/Xq+03LujYanJK1Vu1DeK3SE2LuCaXRMwftYqk3RTFJrS9f78rPLmP6nyOVyq21bkHVtlNTsfDdhJo7vY4JxRNd/zUMNFOomu2JH+AiWTp3iGVI1uuyLJVB54hGNJy4GNMgPtw5Hs=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5631.namprd08.prod.outlook.com (2603:10b6:805:fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Sun, 16 Aug
 2020 21:15:15 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875%6]) with mapi id 15.20.3283.027; Sun, 16 Aug 2020
 21:15:15 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 5/6] input: iqs269a: Make sliders two-dimensional
Date:   Sun, 16 Aug 2020 16:14:26 -0500
Message-Id: <1597612467-15093-6-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597612467-15093-1-git-send-email-jeff@labundy.com>
References: <1597612467-15093-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:806:20::11) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SA9PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:20::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3283.27 via Frontend Transport; Sun, 16 Aug 2020 21:15:14 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c770b67-8125-4d25-7f7e-08d842297805
X-MS-TrafficTypeDiagnostic: SN6PR08MB5631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB5631B26C95ABE526D4D4B0FED35E0@SN6PR08MB5631.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAQ3Ok9OJ+AQuQqAxRsx0uA2EVq7madAdEvmdoGeA43BIrVj+sUNqZlTLEYqUHYBKVgJp8kck2YZ0mZCSXOnggkwOi60uNpmV/pGBvn2i1ASgVXgn7Wd8Jm8P/8E1jVatYwZ8IfMqddR19TUAlRhc26WxoVt+XsD5620ugF+LsrSEe0tg2xDbCS/umsM+iuB3LLrOgGB4PvlsB1nUsSom3iWgxuby4/Dy84J5zBiIr7rz6Z3uxsFgKLJ5BXuq8ycuXcymrXO/rHzeY69Iblf+530jHK2Rei+RHtXxJKKJd2dgOPAA3wKNu0v4amP+D5uCOTycqSSyG/8szt4jZYW2UktU7FAto6PzFO0pu9LSr87EXuAdjyCIiBaXP9InT3F
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(136003)(366004)(396003)(376002)(346002)(66476007)(6666004)(66556008)(69590400007)(36756003)(4326008)(86362001)(107886003)(2616005)(956004)(316002)(16526019)(8676002)(4744005)(6506007)(8936002)(52116002)(6512007)(2906002)(478600001)(5660300002)(66946007)(26005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 6tTJl16iEY2Go9od6QXwc4aZwKlGx3nUtLv02MH4KmphqpTKQGMVxrKjlvEgbKC8iU3P4WsmQGT4CWA3EJcIvAYfdj7lkQYQpzvNWZLrUJtoFhiSvC+UnGbw7j339PAkwezEc1HA+b8ACRdeQDmlaxjwvlfTRF+9r3QZUkM7ksyEHlRdMTtnlJWa2xsEq/furIp3e0WpCaTTm9cOeGUMkyfTwmmMCHBum95jBGXGnfMr7JRxDjkfxLRrgZUzERBtLdambyFImDlbAoNBtqgmesbDvFI6iK5MQVeM0bzCuoxRWLSMR0srBfZEmaJNYhYI9XKi5lJtlw7TAcfl0Vs28BPRXBr+XpZ89UJSymkfoQrLUGOedD+xEuhGBZYwZvXfxDmXVFpCQLtNzzJBoeM6JPjrAYqL8f1GPpHy7us8uGW5CLukxG7s/oxnqrTt2noxTgg6Z81WhrTRReyFd9qDiscmy3enqGnDGmXvjtqIHVE461b4QkjX7u5joxvjB/390fw/3vok4ezUY7WCqoKXULjDQyqPFdhzVawbrgtQKAH9ge8ZPpgwy3NaS12a77NoRnliMtfiWJLjFMPcZZxy3+R34/3wfo22efsfdh1SYNVCrjq2GONc3fa6jbZ7GduMJw1Lun7QV/Ng9EYFzQMFBA==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c770b67-8125-4d25-7f7e-08d842297805
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2020 21:15:14.8983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTGcvUwYeZAq4vxQjct66KkyNrvGcxxRpGog5q5NN84m32b0gyn7hsnEp9ifHR+1iaApGYN++4oecP8wYN42Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5631
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

libinput rejects devices that define one axis without the orthogonal
axis, as well as devices for which either axis's resolution is zero.

To solve this problem, present a thin y-axis with a resolution equal
to one.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs269a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index 04947f1..4a0e4ec 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -1377,6 +1377,8 @@ static int iqs269_input_init(struct iqs269_private *iqs269)
 					     EV_KEY, BTN_TOUCH);
 			input_set_abs_params(iqs269->slider[i],
 					     ABS_X, 0, 255, 0, 0);
+			input_set_abs_params(iqs269->slider[i],
+					     ABS_Y, 0, 1, 0, 0);
 		}
 
 		error = input_register_device(iqs269->slider[i]);
-- 
2.7.4

