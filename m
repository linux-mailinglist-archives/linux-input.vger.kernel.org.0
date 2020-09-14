Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A032693E9
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 19:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgINRpH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 13:45:07 -0400
Received: from mail-eopbgr690084.outbound.protection.outlook.com ([40.107.69.84]:19078
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726104AbgINMFj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 08:05:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A49i+r5wkVTNODvUcWX5z1h5d/Pz48Odt4U5rPOWU60uz42Smfi0fJGHARHdn4nsaxKVdpU8rLt66AwoYQD5nxpZh74x1zk2K+z7P708b7oMjs6uFfoudxw2DPdC7H0jhfd6IafgSSZWq5rt9J+ubOJNuiGvZvzMpSTcXjb/Cl/0bxpxfUW5g98Kcf1vmuM9q3g1HeagbYHY1Q1DILbxvoYZLXXUKDK+eeWsiNmagmtkHa962FtPBdPl64D9ubN7ai3/QGOlj8P2wpULWaDBeAXOtysHApfwB+8aHtWzmaJGGjyJqoJxnnPiL8HODZbqFNWZfKpV0Za4/ddv/jJKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXnyBccMue9ZoWvF8U33+0ExjhxyLeHHkuIFiRa2qYk=;
 b=a7vSjLc0bkr/1C6kZyJtn2K7dhTEr7atFzzRbOri2kwi4ZkBJEyYCawDOJ2hl+n5p+84GVMSPJ5D7BwnU8Eof2uzAtwoLAMq1YrZrB/KOkNRNxILAWvuYl4dZNRZ1fiufAopnwE2Y2vttAr7jQmdFM5AhSG9bkeSO+Lar1m3XiRSZ0pYrmJ2Gtu9W62qPEVk/GCQJ29Do8Km0yWvbP8H7ljXy0iEOCL/5LG1CwwfeISYBTomP7hzZ5VHO1cQFRjl5z7uqrcqVwYrw52wdxPzduw+aSczGZONZvTkYwd8A+AYGVlArSYz3RUqlh1gctT8i/xBOa+T0WjyqNI9f6bekA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXnyBccMue9ZoWvF8U33+0ExjhxyLeHHkuIFiRa2qYk=;
 b=gXN+jS0XRTSzVD9s2HqV1nBQlPXG10eiQ8IOYpCujU/2PRnLty3+YmpBQFZy0/7sSnH7GqTc+ymMFt3QIymX3tY/8cjsF6w1QZ+8wA5y3VZ9YPJUqCEsZ+gXj/bVG8HwItyzINTa3flldaxZx5vSnoa0lp4oj8Bz4EPGUWji/20=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=tw.synaptics.com;
Received: from SN6PR03MB3952.namprd03.prod.outlook.com (2603:10b6:805:75::26)
 by SN6PR03MB4014.namprd03.prod.outlook.com (2603:10b6:805:c3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 12:04:14 +0000
Received: from SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e]) by SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e%7]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 12:04:13 +0000
From:   Vincent Huang <vincent.huang@tw.synaptics.com>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Vincent Huang <vincent.huang@tw.synaptics.com>,
        Andrew Duggan <aduggan@synaptics.com>
Subject: [PATCH v2] Input: trackpoint - add new trackpoint variant IDs
Date:   Mon, 14 Sep 2020 20:03:27 +0800
Message-Id: <20200914120327.2592-1-vincent.huang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:203:b0::31) To SN6PR03MB3952.namprd03.prod.outlook.com
 (2603:10b6:805:75::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (60.250.40.148) by HK0PR03CA0115.apcprd03.prod.outlook.com (2603:1096:203:b0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Mon, 14 Sep 2020 12:04:11 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.250.40.148]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f25c0dec-0a31-4fa0-c9ab-08d858a64bc9
X-MS-TrafficTypeDiagnostic: SN6PR03MB4014:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB40146C37E9E96196D2D92310D6230@SN6PR03MB4014.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OrkB7faiDd5vFxXkt4p5mrOprY28Ou19ZB7K8Jk462msoiSi+NhG0NOg3rGo136P6BSeTYiqs4rebj9LmNt/G+uQLjdhhpXl7lzUntAxl7n0uFLyCa9bSempi584YtRpkrXA5SB0TM4Ag2OiSj0ElaXJj+jO6TEVR2AnD7OqbSd6c0gBBhZXkTeCCbfpk5O7DsLtYWHwOvPAszb/rSoE9D4c11bHuFp3BBya6pQwUo8XN3wpxjOs+4GRVjzP/OM3JGqPjJTe5ayDUWDDxFs4LRhmrYZRd+Mw4Vekfvau/db2GEMbThRBIF7KbMEHJJeN6rc4Z2IhD3Wrgy2UGepi7FnnwC5xkyncR/YbnrZ2o1lkGn60qht4etTExv36+2ff
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB3952.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(39860400002)(346002)(136003)(16526019)(6506007)(2616005)(8936002)(69590400008)(44832011)(478600001)(86362001)(316002)(6666004)(4326008)(66556008)(54906003)(1076003)(66946007)(66476007)(6916009)(107886003)(956004)(26005)(186003)(8676002)(6486002)(6512007)(5660300002)(2906002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: cF8eRxunP40m1VtLOEtbGUa80WRbtAhX0Rkt5eXuvbG0bDA5BA0YBbNIMRAKVGrpV9AqFWM5qZoWgXtwGNbKGjLePIr7nnyQ/W+AFfJoQilo6LqSLCecLMZTJ/u/BLSWxuErKeM+F/VmoIwLSCXKEo+GOT2A1EIALZZ8J4k+3/p7TIfFT1C6RBDHssnVbcZjYvojpCtPNvvGcSf3GvbUGAz/A/pgj3KRKMzmG1h7JTyb5A2Yu4nDaA0rwIhRuTWGhh+C7GXu9G9P3F7h5HvU8WDSOBM6XAKenjrQ/6bj+7bfHoXkKu1lBscMvWm1tFAeSjrqcq9RPoQgc0JlBakURoOAHD7twsXDx1yBlSMj3HVvZktYEUutSEwm1AZwkgay0ogTl3Irce4DrOtuF5sNqnG5kqDn1adIWBFD8EhS1yyRsQbK6aOn97trxCzHjGGcD9E4hklIbKt1O/RxubZdJzDxH77MDckenLNf3+exX6qQgphSgDarQmgMZtIVWT5puq9H6uulWYEXiET9ms8s/EqQkaQGazrkMyID8Q/CAOPbdnZ/Pxx+5W5oEVAGqGwBiJinz4toj7rvJY09gyfLw5vGJB57YfWw/EZOmeXZWThTCdWiIXKpejfB3jyQ6EW/AF2t4Es/wz93aQ7RU9Qs2Q==
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f25c0dec-0a31-4fa0-c9ab-08d858a64bc9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3952.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 12:04:13.6233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEVWrIYNYmoulcJSyrlhNOerloEpYAgWtkZKRC5/E3bWfiQXMxVHa2bEHzaguH1gQWUC6rbmo0zRsxIgss8FKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4014
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add trackpoint variant IDs to allow supported control on Synaptics
trackpoints

Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
---
 drivers/input/mouse/trackpoint.c | 2 ++
 drivers/input/mouse/trackpoint.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 3eefee2ee2a1..dde4c9d8d6bc 100644
--- a/drivers/input/mouse/trackpoint.c
+++ b/drivers/input/mouse/trackpoint.c
@@ -21,6 +21,8 @@ static const char * const trackpoint_variants[] = {
 	[TP_VARIANT_ALPS]	= "ALPS",
 	[TP_VARIANT_ELAN]	= "Elan",
 	[TP_VARIANT_NXP]	= "NXP",
+	[TP_VARIANT_JYT_SYNAPTICS]	= "JYT_Synaptics",
+	[TP_VARIANT_SYNAPTICS]	= "Synaptics",
 };
 
 /*
diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
index 5cb93ed26085..42eda7d4ba08 100644
--- a/drivers/input/mouse/trackpoint.h
+++ b/drivers/input/mouse/trackpoint.h
@@ -28,6 +28,8 @@
 #define TP_VARIANT_ALPS		0x02
 #define TP_VARIANT_ELAN		0x03
 #define TP_VARIANT_NXP		0x04
+#define TP_VARIANT_JYT_SYNAPTICS		0x05
+#define TP_VARIANT_SYNAPTICS		0x06
 
 /*
  * Commands
-- 
2.25.1

