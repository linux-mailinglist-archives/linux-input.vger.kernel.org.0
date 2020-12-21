Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1E502DFDEF
	for <lists+linux-input@lfdr.de>; Mon, 21 Dec 2020 17:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgLUQPO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Dec 2020 11:15:14 -0500
Received: from mail-eopbgr80088.outbound.protection.outlook.com ([40.107.8.88]:20298
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725816AbgLUQPO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Dec 2020 11:15:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fePz8blXo601mXA+cC3YVS1Tr54PT+nKk8fvWSAQIcA4IJ9q7iy680vEWJ47bxDPYemvb9G9CXwCvXOh0Rii/9WffareL58jUdsyRWXgvVp+tpMJwXos8q0A+q18K+2XnvUUMyPe22tV3B1JeQzlVKhgnswIeiUwys0HJO4ucyKsNttMKZT9CrhLk+MF0gB53k0xaGCzVBqVpYArCxmyV1RJerc53hewUjMoUgu1kPgQyJ33vDSePz3VNUEqXPsLqds6aZw4KGSw/lXdsuleLwi8YM8CZwM4mO+LKLIpc3mnviAQtmRyXw9VH+3Zp1+z0gPIFv2uqktNhw40x3bhUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNIu99YL4DPnXTrAqI6LDymgjO6dbjIkYSrONh4xrRU=;
 b=JfbQ1h5scapibKFzi6HsNpYCAE9QJJ7wrJJu7J48cmxa0gYTjfHhAthNmOeeA6YPH12ojxSk7URvVYuQr6+xZE6oftPm/dQWL0kWOJvRoX0Rpl+W50nq0NAgaHoJ7sR17cwc4jFQosTaZgj3Qe6LYdKr3YtRTfc/0IlH72BvVe6uq0rFCY6H2RDZRoNqEf4MaaMZRU1w+5lHywhyxcP3AP/BnfOTPV0Vso0b6zPe3fMvQ01Nu6wzeFg1PTKLpPR6B0kjWTfdz+/mCHpp11l7+FNWLB7yZvlLASKJxn4qYd6y8sRXgar2g+VdOOS4S8Bj3iK7NYNodLimY1fo+cLvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tbs-biometrics.com; dmarc=pass action=none
 header.from=tbs-biometrics.com; dkim=pass header.d=tbs-biometrics.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tbsportal.onmicrosoft.com; s=selector2-tbsportal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNIu99YL4DPnXTrAqI6LDymgjO6dbjIkYSrONh4xrRU=;
 b=iBSEMrFTHkjptXTdFFa3jkWwt8he8ftPoD3fZt47pRgr05uiWm6+ue128A9i6bJs17b77YFvpe70azibpGLuwk7ZlZBSD5ydHnbAYMxVR6kaVS/a5FeSHtTL/FEeO05qmLBQhjAIt6seAZjBB6Nz0uthPYUNuRcykU6QK18cBFE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=tbs-biometrics.com;
Received: from AM7PR06MB6769.eurprd06.prod.outlook.com (2603:10a6:20b:1ae::15)
 by AM6PR06MB6166.eurprd06.prod.outlook.com (2603:10a6:20b:da::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Mon, 21 Dec
 2020 16:14:25 +0000
Received: from AM7PR06MB6769.eurprd06.prod.outlook.com
 ([fe80::9d44:27b1:7c16:da27]) by AM7PR06MB6769.eurprd06.prod.outlook.com
 ([fe80::9d44:27b1:7c16:da27%8]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 16:14:25 +0000
From:   Radim Pavlik <radim.pavlik@tbs-biometrics.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Radim Pavlik <radim.pavlik@tbs-biometrics.com>
Subject: [PATCH] input: auo_pixcir_ts - add missing check for gpio
Date:   Mon, 21 Dec 2020 17:12:39 +0100
Message-Id: <20201221161239.5346-1-radim.pavlik@tbs-biometrics.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [176.74.132.138]
X-ClientProxiedBy: VI1P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::21) To AM7PR06MB6769.eurprd06.prod.outlook.com
 (2603:10a6:20b:1ae::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-I556OUN.local.tbs-biometrics.cz (176.74.132.138) by VI1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:d0::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 16:14:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29735ef9-3662-42f4-5752-08d8a5cb7c30
X-MS-TrafficTypeDiagnostic: AM6PR06MB6166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR06MB6166304D0C2BC3E55A5839E9BAC00@AM6PR06MB6166.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bDn0skUQfqCOpE2rIMlxP2YC6E1sBumcbvJIziC4P8zgGBma2a7GPSsSQdtqi1MlpuEqb2DASpoe2zGRXXwVI5W6/Ucx9InQ6Sx71gxkPD7c0OfwsoTPipr6ChAM+1fz+0Vc+UoHX4Q5QBeGudhnQtI9bB/uPdv5ZusunmgCCIeVsQdsEuOacAjcLB3CY12G/0ZDiFeqrJ9Rz3H4vu21CAu+EmJr1ZjgAP2aLD0iDWIXMX2lOw8+C2rWOGusDxWicIkB4pO5LKFksTdQ9BKncOTBVKQoDioq75Kc3XFozTC5+r0VCz44bJQ8eE0SK4Ld6x1Gtvb3TH8jYlgqRAsapDVxwflvK8NzxweE2K+Rdd5k2BfyWrbOI1IjpppAC8kpPGEsxRKRAfqM+hph+T+DDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR06MB6769.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(396003)(39830400003)(346002)(376002)(2616005)(83380400001)(956004)(44832011)(6916009)(316002)(52116002)(66946007)(6666004)(66476007)(8676002)(6506007)(2906002)(6486002)(4326008)(66556008)(107886003)(6512007)(5660300002)(478600001)(36756003)(186003)(86362001)(26005)(1076003)(8936002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7t37eGgy/GJashRB+U7m2wyft3GXMnxB/w++/WmeF5TVf6CkGQGFjBe84z77?=
 =?us-ascii?Q?KUmmnJlD1B9U6fa9ST0a7LzpW2yazvbEwmsXqhzAw9RyPMDx6WY6Nis2vOlH?=
 =?us-ascii?Q?yZa/gkldUjHzvwsU9AVCayX+oxkQ09eZ5MS3KMkjtcURKK/Q7zxlfRFArdYz?=
 =?us-ascii?Q?47N5cYXcBVBS6KJPJZ9H4ni3qtK3yvbV1A4qKWrqmOrebCmfig1zn48UrWLr?=
 =?us-ascii?Q?+Odt8jp59arbHAlDa2Ep9Xu8QuU7p9qy2OfQT5b7V2p+a8vp370+Cc3qyBwd?=
 =?us-ascii?Q?nTmQOTIjZdibrW3XTkZ10c+vnSGMsd1Yps74+2ojGIvoD/4Z1teJ5m/IcbRl?=
 =?us-ascii?Q?xOaZ+8VQpl+eDiEOME0RvESMm8BMLaSRFev2DUX74BHQBbSFpcAM5KZoqOeY?=
 =?us-ascii?Q?D316jwoqPX9fhmBHBib24n0+sTRWoXeJA6damqvueDSRP47SrrnYL3gtOzyB?=
 =?us-ascii?Q?o9p0mu2t4nK2SNGhQOpjzlCWJHoeOfdpfVoXh4L/oGyl4cxpfZZQUo2ykbgz?=
 =?us-ascii?Q?I25uLGPPJc3AxarZz3UExTFnxG42r0zc/D0K0Hy6R/dsgtNbJiLqAAaYjMfY?=
 =?us-ascii?Q?i10paJslqn0h9ArmvyC/S0A8L2O6bng7fdyFfye0Vet8r4ncCRyWrN5mXDnj?=
 =?us-ascii?Q?miA9KsTtW36quV45Bs852RtylcD+wOurYe4Tb5ca/dByEJpMw3oWTvK8L3Tf?=
 =?us-ascii?Q?br3r1y9WTiDTETROG6nCXF9zCNIT9fck5s6gcbprIcmcj1/vz/XKjkIEflS9?=
 =?us-ascii?Q?p/k8XM/JDxsWJUzTBllQ7r8UMAduVTzgFtjHaQ6lvqZAYaXTt3IYQHCsbZ/i?=
 =?us-ascii?Q?IBjvnfRzxVyMbThqg06BXmOPFE/9bXHsA8nB0eaAH1uLkV+VizlCO8J0YKWM?=
 =?us-ascii?Q?Z6qanBUjGukpr4lOPXFx5M7H4V1wnW4p0143yxHjpegeBWgMNnrh5Y3rBhKN?=
 =?us-ascii?Q?+p+ovmFZ5z9v1GNQmM9SNFngp8QHN4L3uhzBovrkAMwqdzeBtoqOcF9No5+l?=
 =?us-ascii?Q?WFig?=
X-OriginatorOrg: tbs-biometrics.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR06MB6769.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 16:14:25.2834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03c5283b-bdcc-41a6-b827-b66aa8b838e3
X-MS-Exchange-CrossTenant-Network-Message-Id: 29735ef9-3662-42f4-5752-08d8a5cb7c30
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGiA8vQeYzPZWpDXZJSr45hv2TmUC0QUkrsqNS5UMtT7Rn+6nOdMlmx9JsPsYh8xkKl7wSYns+8rY0Z47pEwYG9QlrSqTssvEQF/hQ45bZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB6166
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The of_get_gpio() may return error, so check it immediately. The old
code might fail with EPROBE_DEFER which was masked by the
folowing gpio_is_valid() and returned EINVAL.

Signed-off-by: Radim Pavlik <radim.pavlik@tbs-biometrics.com>
---
 drivers/input/touchscreen/auo-pixcir-ts.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/touchscreen/auo-pixcir-ts.c b/drivers/input/touchscreen/auo-pixcir-ts.c
index c33e63ca6142..8f3cfd743bdd 100644
--- a/drivers/input/touchscreen/auo-pixcir-ts.c
+++ b/drivers/input/touchscreen/auo-pixcir-ts.c
@@ -479,12 +479,16 @@ static struct auo_pixcir_ts_platdata *auo_pixcir_parse_dt(struct device *dev)
 		return ERR_PTR(-ENOMEM);
 
 	pdata->gpio_int = of_get_gpio(np, 0);
+	if (pdata->gpio_int < 0)
+		return ERR_PTR(pdata->gpio_int);
 	if (!gpio_is_valid(pdata->gpio_int)) {
 		dev_err(dev, "failed to get interrupt gpio\n");
 		return ERR_PTR(-EINVAL);
 	}
 
 	pdata->gpio_rst = of_get_gpio(np, 1);
+	if (pdata->gpio_rst < 0)
+		return ERR_PTR(pdata->gpio_rst);
 	if (!gpio_is_valid(pdata->gpio_rst)) {
 		dev_err(dev, "failed to get reset gpio\n");
 		return ERR_PTR(-EINVAL);
-- 
2.29.2

