Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C075F2856D0
	for <lists+linux-input@lfdr.de>; Wed,  7 Oct 2020 04:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgJGC4k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Oct 2020 22:56:40 -0400
Received: from mail-am6eur05on2082.outbound.protection.outlook.com ([40.107.22.82]:22592
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727099AbgJGC4k (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 6 Oct 2020 22:56:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/1CbYd+LImiz0y9XyMhw73t7mgjvACzqg/BJGPjTQFrckEElNvxe+TmVhz6sJqvfpeGibzH1OORdt/19x6nLOkrKF+x+vVTxZYuZJiFw9W6pHuyTA0Hodn3I5pH4c+67Un3SnxL7Q7LMe8O8RxuLgyiGkSbvnBLwBqarNNUQWqTcr8L8mUpkLILeJyEa/ti/V+IWAYLac7AVkAwRp9tlt1wxWHch4T5fGF74U3XzY7QVRWxh0jjbX67kmXD6WmpfqqLhx/cs6q0vLyPNRGcXLxLQKEyzKJkyMcGY31oxRa0wft+JkdFj9FTwLVdlBhw+rKOxap2bAdP7VwFBXY9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+l0/v0f1hRLLOxDfzCHeY7JbmAvX7xF59VXXqSs8m90=;
 b=eokYWzq8evJpra3/hT+/Ot07ce5MiZSTe/AQ6uwuooG+n0prSIxHOplyrfZZcQb2Yu/6tv93mGEH9RMgrcRIbIC52FFvlBeElgWiz80/AimHzuzPb6BK2dhPP4HJA/GyUCyceu38rqNKfPZ23JyjCYFXs1jNrXKckNBteBMUKOU7/aPp1vS+ib6WzxCswqSDkuzjHx9tM418IAIfX+8g8dD2y9z4WdGIS4Gn7VyWVDNYgaQnTuWkTfE592Ka+sndb03oNWqST03EBnGeDS0GpbcEfFdwtY4Wu5q0/r9fVGxYGVC71eSmcQQhyhA/K+oPQ7/IBqkGHzdWIa17/t3EJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nextfour.com; dmarc=pass action=none header.from=nextfour.com;
 dkim=pass header.d=nextfour.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NextfourGroupOy.onmicrosoft.com;
 s=selector2-NextfourGroupOy-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+l0/v0f1hRLLOxDfzCHeY7JbmAvX7xF59VXXqSs8m90=;
 b=dF6fy0Y3ur359mkzM0llVmGRmpl7DBZg8OaIcvh06vh1+3ns44d7nCsCCUbtHlXfJTcgUOUDXgcJPAmruqNq5KlbRe6Xbz/1sDCoAjjRZGWIg//FF0f2Y+CIbGHRnz5hyHgbvTO6FubE7YCLrvimPl8l68qVN6CzNxXsexkHB38=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=nextfour.com;
Received: from DBAPR03MB6630.eurprd03.prod.outlook.com (2603:10a6:10:194::6)
 by DB6PR0302MB2789.eurprd03.prod.outlook.com (2603:10a6:4:b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Wed, 7 Oct
 2020 02:56:37 +0000
Received: from DBAPR03MB6630.eurprd03.prod.outlook.com
 ([fe80::c0be:3d35:b3b:116f]) by DBAPR03MB6630.eurprd03.prod.outlook.com
 ([fe80::c0be:3d35:b3b:116f%6]) with mapi id 15.20.3433.044; Wed, 7 Oct 2020
 02:56:37 +0000
From:   mika.penttila@nextfour.com
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc:     =?UTF-8?q?Mika=20Penttil=C3=A4?= <mika.penttila@nextfour.com>
Subject: [PATCH] Add MAINTAINERS entry for SiS i2c touch input driver.
Date:   Wed,  7 Oct 2020 05:56:23 +0300
Message-Id: <20201007025623.47439-1-mika.penttila@nextfour.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [194.157.170.35]
X-ClientProxiedBy: HE1PR0301CA0013.eurprd03.prod.outlook.com
 (2603:10a6:3:76::23) To DBAPR03MB6630.eurprd03.prod.outlook.com
 (2603:10a6:10:194::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mjptr.nextfour.com (194.157.170.35) by HE1PR0301CA0013.eurprd03.prod.outlook.com (2603:10a6:3:76::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend Transport; Wed, 7 Oct 2020 02:56:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1bb0306-091b-43bf-9a10-08d86a6c9b78
X-MS-TrafficTypeDiagnostic: DB6PR0302MB2789:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0302MB2789D8AF81FEF70656EE80ED830A0@DB6PR0302MB2789.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: djClKAWiRUeMtMSrhqjk+1Lfm/xRAjwbiYZPvrq0pf/s28oSarB7mr0/pDZ2qmMGmmCKT06fXuMJpGsniKjE3G1hSRsh6XgUWtuEGjoA1qvzd9O+i6CiFFfMU3JOmmJRbDcMjOb9uaqRx40xjt5J2Ot5b2rS2osRDKLztLVjnBPRWZphmpBUYydbmeBM0+G8teA0D30RFSKIllUb6HqZ1+ghu3yr7+JsZOUhyJwRHBTazm/D2Ws4eNv/aJqbwxhGfNCxzOkFCx9Wtt3kA6RIA25vJV2BANbA3RULhU8/I03nUHTj70Xw8j3EfZKw4Y2gt4NBBxfZUkUoKDyqusO0EQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR03MB6630.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(346002)(136003)(39830400003)(366004)(36756003)(66556008)(2906002)(66476007)(107886003)(66946007)(8936002)(8676002)(5660300002)(9686003)(6486002)(316002)(4326008)(52116002)(26005)(4744005)(7696005)(478600001)(186003)(16526019)(1076003)(956004)(2616005)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: xJKjh+x6WN+sDJxCIuudjHX60qHZBmw81HEHhyFO0YVuu0SB2GMg0L4m2FMsVRVvTxJGI3SdHh6Tf2xFp1XLaDznRBd/wYOYTBntVAGtCiI/XqYfdR7tx9It36Nn7EttEK8dfH/I80eAANG4HkRrKJw7Xfk5iygp7Kb7U+0nycHOjDwCBeXnzl0ocKwjmZItU7Rx2kvx6wsr6bN/cvhCAuxAwGg8j0bFUBC4uxKxp7h4arOYK1LbQPq4AK1walkpvEkYDhJa6u4x6f0jGZRTtrRhC6o4/h1sg6Ov/8zvUgvGPmhgNImXbNq80sVOKkqhm/qBIMGzgeNqTpuWMJfUIGebiLQxtCpToJ6XtvNFsiJ7RTgclKqtJYA7Kge8b/OUgOGlt2L6BNMi+sQgEjRx0/9uZ0h/qbEJonFKO36KjjJNMvq0375Ma7hObZqVDul38beMwlcqtj3JyRoeqqOKRMNLGbgc5fffV40KuShVhlqMBbnod3tuL+KBp4T6zv4P8w+Sab7voMcbVu4iQsD3Yb/k93l+sRiloSqYW/v1CCAL2IOEpwbnphLLGDTwBfF2OOUU7nAahZpt2YR3bRoEhZQzLxFCk/GPtmBUbu8ZGh3xg2QNMw16lkKpLhHPFcp7vkEXq6rOOVv/Er3F/saBeA==
X-OriginatorOrg: nextfour.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1bb0306-091b-43bf-9a10-08d86a6c9b78
X-MS-Exchange-CrossTenant-AuthSource: DBAPR03MB6630.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 02:56:37.2833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 972e95c2-9290-4a02-8705-4014700ea294
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0H0A4603hwtGHuznsYHeZyOXFSMh18UPTpjcqA6sfMvW1ZGhcEVxkW/wrrvn/zHi8CEWsmHAIUE+hZzdRhDL8Uu7Em+0g0isbC27Hwd+PU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0302MB2789
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mika Penttilä <mika.penttila@nextfour.com>

---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a54806ebf02..b13c539783c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15913,6 +15913,13 @@ F:	Documentation/fb/sisfb.rst
 F:	drivers/video/fbdev/sis/
 F:	include/video/sisfb.h
 
+SIS I2C TOUCHSCREEN DRIVER
+M:      Mika Penttilä <mika.penttila@nextfour.com>
+L:      linux-input@vger.kernel.org
+S:      Maintained
+F:      Documentation/devicetree/bindings/input/touchscreen/sis_i2c.txt
+F:      drivers/input/touchscreen/sis_i2c.c
+
 SIS USB2VGA DRIVER
 M:	Thomas Winischhofer <thomas@winischhofer.net>
 S:	Maintained
-- 
2.17.1

