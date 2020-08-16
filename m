Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E922459AD
	for <lists+linux-input@lfdr.de>; Sun, 16 Aug 2020 23:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgHPVPb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Aug 2020 17:15:31 -0400
Received: from mail-dm6nam10on2076.outbound.protection.outlook.com ([40.107.93.76]:55009
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726331AbgHPVPa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Aug 2020 17:15:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=df0qRSBleGQchBZWTfhJ095d/ZIngtyi/gNYzUmiMPYiIAMuDokEJuwhbS+7xbuvlcuQWiNgp6UKlckU3sYCWy1vbpFt72Z7pKrWXSE10cKnMkLbLx57+NceuZ13W8+p++XRojp6QiFUuw/ObU1Z78I1gVPHXZlgDnYQ/TcF1+hX34iy9gi+FKR6yYvvxOz39fP3pupxfbQYIqjxDd6ESTuUbnqsk0/M4b0AzNUVqwLjJEMi2z8+9mwnn3tYom4bWS90pA8lYXbsASj4tks8o6GCYYizp0JRDt/cyifetifnnMYK2Vqa+ji/174HKcqauf2G57rnp0KY9JwwU+YX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3lAYRk7Xnd3eGubOeZNlLpuFpEiaC+e6zQfleKeurE=;
 b=gB0cPcDFYE57eoUWm2fDDIBI28tP5zjGkhk2Y8FoGAyz2aUJ/h13YMEyuQEWFnBlbO1t/KsrL0Nt5dLFeJFvjQamMBBMyBmKDWRfq4SIMnfIbvzye5y6uAUuN4QMf1N7wVIcMFN02lSzjalbarN1/0ebK7MetF0aP6XTN31sk1cpSt33agvZWY2jTmJvAuTV72bXeS2yOD1oNGBVcPBqQnBGrDBbnoqp7BSCnSzS8dA1SrgotgTSmnakVNXH5hm0tSAQr/t6lnyNfpdbc0ckfhN37S2Nq8Na7xvyeXROt6lYbgZibxeQDxPxrGJ4CzHnHHg3s0e4FK7OlUPlRwAZEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3lAYRk7Xnd3eGubOeZNlLpuFpEiaC+e6zQfleKeurE=;
 b=KbT2hdn4OfinnhpbagrAjAAtta0ySg6AAtZPTFhIfZo/cN/IbJw7pXyLW2PAXuWXEdXuwYuIIj4o2w7jXcTt/ZUlctWOwLcyxGALvDXnpjNXtuOof4ToRJATNHzQWM5FV+HACTb/8MJpkPxYY+xTFII9QK/twJCZs+A8kffrktg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5631.namprd08.prod.outlook.com (2603:10b6:805:fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Sun, 16 Aug
 2020 21:15:17 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875%6]) with mapi id 15.20.3283.027; Sun, 16 Aug 2020
 21:15:17 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 6/6] input: iqs269a: Disable channels before configuring them
Date:   Sun, 16 Aug 2020 16:14:27 -0500
Message-Id: <1597612467-15093-7-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597612467-15093-1-git-send-email-jeff@labundy.com>
References: <1597612467-15093-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:806:20::11) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SA9PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:20::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3283.27 via Frontend Transport; Sun, 16 Aug 2020 21:15:17 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf60ac42-a447-40b8-ab70-08d8422979a5
X-MS-TrafficTypeDiagnostic: SN6PR08MB5631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB563172D4D95F44B9833081D2D35E0@SN6PR08MB5631.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VqFweYbqhPWNI2Eekta+P+pyZHS/o77+8X+RgrJlupxK5FozB996SwohzS9O0eMEl5Msj9MODcOySPRCOKwqNc6ceoa0A0RBLfvZu3+Bua3bTp2yqSAj/vSMCFdf0MqzpoUjg2HknbVhZRDijsg1AAOrIaS3Rue86SmcwrdB4t3wAzWWpiLue44nM9JsKn7e5n1r+Kk2+VlIyjgqXzQgoS857MllVzYvZQD4oc5gzJekoALMZftvzgXSqKe6HGlwOIDsxgBmMX6xgkpogZGv2NILJRCn0KuIi/ERJB56x0L3yHZNqiXK1XY3CrDENGRgbSo2i8+DZKZWYj909FPpiReBQIvLIxPIAC9DnJqy4AZ6oZw2jb8I3HXW/eqG5UBk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(136003)(366004)(396003)(376002)(346002)(66476007)(6666004)(66556008)(69590400007)(36756003)(4326008)(86362001)(107886003)(2616005)(956004)(316002)(16526019)(8676002)(83380400001)(6506007)(8936002)(52116002)(6512007)(2906002)(478600001)(5660300002)(66946007)(26005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: BFG+rjzWDk0L8PGyY7M85rkjTTrl60jwJgb3nQjShhtY+Fdve46uu9CZ9JV1trW6ShK6YHyjw2hz8KQopH0YHbOzfK6Bo0KNdfi3vTOEb3aZ2Yy7P8a/RRvLG8whb819c/4mXM6TPDV+S6rL5VlQ/H4XRwvF7GHcdsQJqsqVMsAJpdpj77hktip1GaJwWTcd0Y9SY5ORgSfMMKGJXdECDmt8RBmA5xLOUEHT9zeLJtCVcq9N74/BpDSWcq+Bfs+wEL+haJgcl3WRWHor6bURixItzuHBZdG39oM0C8AkF+UOh33nL5ZvqgGDdeklfRW5/bU+bK6goRbMCWUv4xCAkxVajAhT5DxwpMDLp/VZjujWwUlGEDA/+8XfCtdQQMVwKO/6EUDlhtSgs+N3Ey+jCn+dQDJttnvxjrdFKrbGz+SwSS8MvZBuNZU5zN47D3Px7u8CSlmMYQYR5AQ72TlZuCmHP0NAV7v/Q0qQTIQ0YwIjSjViq3zYeyqEJcezQxC/li2qyYGmASb3QvfcdghqTuQN1LjhgtF2VUQU05rg0LxqVJh7/R10nwp7XdSpzEev636h2QvyzJrJjLS5H+aUHl/hlD0z6K4J/kkFTSJVZsmGEcb3DFpn8niGzg6L4zXJdngONLMts1h4JfaYhN0krA==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf60ac42-a447-40b8-ab70-08d8422979a5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2020 21:15:17.6267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bo1eUbsu4tineAoDgHoMOPcFZ2kf6PR2O3x/8+EF5t4CZGXjx2rrPv1a57x6UxtCKD6XL37OtMgyztO3OW0RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5631
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Unless it is being done as part of servicing a soft reset interrupt,
configuring channels on-the-fly (as is the case when writing to the
ati_trigger attribute) may cause GPIO3 (which reflects the state of
touch for a selected channel) to be inadvertently asserted.

To solve this problem, disable all channels before configuring them.
The desired channels are subsequently re-enabled as part of running
calibration (ATI).

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs269a.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
index 4a0e4ec..cb2773a 100644
--- a/drivers/input/misc/iqs269a.c
+++ b/drivers/input/misc/iqs269a.c
@@ -61,6 +61,7 @@
 #define IQS269_SYS_SETTINGS_REDO_ATI		BIT(2)
 #define IQS269_SYS_SETTINGS_ACK_RESET		BIT(0)
 
+#define IQS269_FILT_STR_ACTIVE_CH		0x81
 #define IQS269_FILT_STR_LP_LTA_MASK		GENMASK(7, 6)
 #define IQS269_FILT_STR_LP_LTA_SHIFT		6
 #define IQS269_FILT_STR_LP_CNT_MASK		GENMASK(5, 4)
@@ -1222,6 +1223,15 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
 			goto err_mutex;
 	}
 
+	/*
+	 * Temporarily disable all channels to prevent the GPIO3 pin from being
+	 * asserted during subsequent register writes in case this function was
+	 * not preceded by a soft reset.
+	 */
+	error = regmap_write(iqs269->regmap, IQS269_FILT_STR_ACTIVE_CH, 0);
+	if (error)
+		goto err_mutex;
+
 	error = regmap_update_bits(iqs269->regmap, IQS269_HALL_UI,
 				   IQS269_HALL_UI_ENABLE,
 				   iqs269->hall_enable ? ~0 : 0);
-- 
2.7.4

