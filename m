Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A669262A80
	for <lists+linux-input@lfdr.de>; Wed,  9 Sep 2020 10:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgIIIiC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Sep 2020 04:38:02 -0400
Received: from mail-eopbgr770055.outbound.protection.outlook.com ([40.107.77.55]:60533
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726293AbgIIIiA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 9 Sep 2020 04:38:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCQVplxlwj9iX6Gz5PzqSHmDOTLaStvKu0DtCBinkE8B83pqI9GAWjgnvB/da88TQIlalIm88xPKY4SbFy6fd9tkqpsfOZ16Ch3pav2zCy+Cia92y77Xf1MtFBusdNRUn7fwlmmqsT06n11vnnciffOxk6BvqLswMSdFXUno6Z0iFWl4cKMB6ayYMcgKt83hPEcMH49WpbQxvq6gCDCljlbNnl6BvhvnelBW7k+7QFPr/a3oAZn89IOkp0H/bn89VaOjYMArgMQFWtHaLTdG034rIXw+oi+j0fXX7fziEC75wanXMjnz8nip/uxhQunm+N9jxu6sAq9MPBxqM0jkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWKU3+E0uGMriPbQVbqUoLuf5GcXi4s5+g1Ao3ohpvI=;
 b=gscHa5pLHzqePG+BUYxi8Rozz2hj+MzZKgjxvFg6KijPqazo03G/iVjfeEWVgYIumZWYMifThYwSry3mclWdueIzLTN7D3+yLF/qUtPcRRF35Aw4hYPcYBEt4cmE3q2jB6U1B70VHICH8FP76F08C9/cVYOTzCLAAoBKhn8LKlMpuYuozUsp9Fsa206AaTxHgCQDzPi1Nojchif0hCVQ6n/NHKxsZTJTSNSo4mrdwB0SrNxg+w8JVYARB9YlGiD96TN91560YjlSxYIusAWxrx0csVekiGzVo4pCszXec76bJMBU+WutCLcL4HKYm6pavzknYN2yxbT2yM5hmNZDJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWKU3+E0uGMriPbQVbqUoLuf5GcXi4s5+g1Ao3ohpvI=;
 b=D5wkIpZgavx6juHXCqQ0WC8I7ZBPBSXSddiCygxzzn7T4CZ2GZyvfP1YOwpF9e69HXbYD5cIxcKZ1VGuGaz7nJcYKz+46AqrFAc4gc+3mlEtfiE0lECx3q+ASJTP0tSOhL/mB+C9rRWh+gFuOit3JdG9rpeU5JRBKBEk/vQkWNM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=tw.synaptics.com;
Received: from SN6PR03MB3952.namprd03.prod.outlook.com (2603:10b6:805:75::26)
 by SA0PR03MB5562.namprd03.prod.outlook.com (2603:10b6:806:b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 08:37:55 +0000
Received: from SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e]) by SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e%7]) with mapi id 15.20.3370.016; Wed, 9 Sep 2020
 08:37:55 +0000
From:   Vincent Huang <vincent.huang@tw.synaptics.com>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrew Duggan <aduggan@synaptics.com>
Subject: [PATCH] Input: trackpoint - add new trackpoint variant IDs
Date:   Wed,  9 Sep 2020 16:36:32 +0800
Message-Id: <20200909083632.12971-1-vincent.huang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0103.apcprd03.prod.outlook.com
 (2603:1096:203:b0::19) To SN6PR03MB3952.namprd03.prod.outlook.com
 (2603:10b6:805:75::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (60.250.40.148) by HK0PR03CA0103.apcprd03.prod.outlook.com (2603:1096:203:b0::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Wed, 9 Sep 2020 08:37:52 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.250.40.148]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f506b8a-222a-4c6b-0886-08d8549ba5b0
X-MS-TrafficTypeDiagnostic: SA0PR03MB5562:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR03MB556216190B3A85D7B826A5F5D6260@SA0PR03MB5562.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xe6ywytwovSIgUBTSmEQ5jKr3CouQBNLpxxzKGe5GaMTDwwh6bueCdExCwaY1vQx3EVB6XjoUf127P8JutCVWwBwursm/R0PUpktW1zydEdzt0CYbogyxWfnVr+hxdMSdJK0rL/99md4Wxwzsz45W/AlFlaHwQFLNiXY+xtAiL9bxRFec93cL+T42drX9IKPebTYeucaF7DA07DlP6PPInZMkvLr9gyRmtFlztROnTJwXxYP6Y6WgbJX+zBjnESo+2OFLh6TwUTwdz4LBH6z0SiZrvoU7MRy9IXk1ht1iiLYG04I6TM/eI+T+jDcey8s8XTdFwlXfD+NFbHOOzSo8ai7vzqlOBvzI/s52SiCyxmGb2jg7pFE+iLMhnUDl7Xc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB3952.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(66946007)(8936002)(1076003)(4326008)(478600001)(6512007)(8676002)(66476007)(66556008)(2616005)(956004)(6666004)(86362001)(54906003)(107886003)(26005)(52116002)(2906002)(6486002)(44832011)(316002)(186003)(16526019)(69590400008)(5660300002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: FpNzgB+cq8bMUd3oVBw8ELdlAC/FkHnEBmz01A7CB2h3+IWXHnaYniuLv/T/nc73oVE8y0kLW+Yj2qCf2CVX1+5b/guMY3wAKvc+H19y7pjHnreKf8dvFlBdjARc8yAsYRlJdEFZVbpnuRyeD1mhzaWWULUfY5ozfqwZxWKoHia8W3ODuMaTMM32HinR+l8mAK0wUGu4+2GHproBPc7aUZlXzOJINF0GZE1GRfLCLf5RSgsE/6WvPbG6RaUnZUcOdzGF0X+uYF1zR3HMbyQM/oHuBW1ZOcmORDzjF2JoG9qKs47tbCe2SRpYrnuwiud4rNn9VBf7KNPFwPdLt9C3jzDwX3BFXCRBqQaZNYEM0+zIqJyfgPd/oNZWN9mYUZz6wCemMcQWWHvlRGFJavPTPb9h/Win3RIgtipZpvwknPS6k8c8GRnG/CY/k0Crf9fIBSYhWDxjgF9XziPhYFN22qZP63NIM2owpbj5IuaWn09idZ/9WzZUoRYcuEAuVvMUXd16pqD6abwaitW//Bz57k7kMdYN4AXdLV+pmda7qD/mJZkdf5gPDRoxrEKi1YLITkwPIDCF4th6g1o5CAo9FkF+2HUBtFVtoeUADyKdt1mhiXgkFeiHlsH4Q5il8B4z0ci8KTkflQBJSMgxXk2WXg==
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f506b8a-222a-4c6b-0886-08d8549ba5b0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3952.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 08:37:55.3913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaqFYuiCPstSkMAyNE8MpjKmrazxSM6q4hZA8YkmSJ1OQRafETMRtDVI5ZpdtOc2N5aPcOsxmfkxGRxBI3VK/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5562
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add trackpoint variant IDs to allow supported control
on Synaptics trackpoints

Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
---
 drivers/input/mouse/trackpoint.c | 2 ++
 drivers/input/mouse/trackpoint.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 3eefee2ee2a1..c54d2f9e1c4a 100644
--- a/drivers/input/mouse/trackpoint.c
+++ b/drivers/input/mouse/trackpoint.c
@@ -21,6 +21,8 @@ static const char * const trackpoint_variants[] = {
 	[TP_VARIANT_ALPS]	= "ALPS",
 	[TP_VARIANT_ELAN]	= "Elan",
 	[TP_VARIANT_NXP]	= "NXP",
+	[TP_VARIANT_JYT_SYNAPTICS]	= "JYT_SYNAPTICS",
+	[TP_VARIANT_SYNAPTICS]	= "SYNAPTICS",
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

