Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E913A182663
	for <lists+linux-input@lfdr.de>; Thu, 12 Mar 2020 01:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387505AbgCLA4O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Mar 2020 20:56:14 -0400
Received: from mail-co1nam11on2048.outbound.protection.outlook.com ([40.107.220.48]:26730
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387404AbgCLA4N (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Mar 2020 20:56:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnktPdPqhGmq+mTf8YWypPtEJ8QDBU6qItPqJZJP2ZO9jNVy8fScHpavq3kL0Vv3AJ7EHzjGqzmv43gSsBJtsmcwtsI4QFwO1US7NOgaf2G8f1SliWEmeWTS/+Ltac8TyDhQVUD4pZmYeWLS72kjbMp+VTFL5Qeq/eyjOgzquCbdIITRiz51FCH+MTs6kja1cuiul3PaIcw4blAKIHKA16bgGBATsIcnLGtE2RUY040o1vHv8wtJIT90BZrFYB8gnTYWs1OX57ZNKanQQn+bn5HYOr0CQK1GCzKlaMwiHgKzvRtzIXHsT3t9G0EipMXH8UWu0xmo7vX3sMjieo0PjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1yW9YWezLSb77Gyj3ohrw8ymBJtQrxXvv5eCvZGvSE=;
 b=gnqN5NcIHNN6x40BrxjxbdQsYssHNfr/10mcd2F/tW0ZUxJe80ASvcal11GYGKCBgcAiKJZ3DnL5RN6C459qsjR19+HCrmMciHNmK/HJp35ECuhQsIWeM/AF//BFD1uj+eh1BfIouKjtDLaCZ+RpemE9qiO/Qd3SbERQdzw/ms1Z9VHSx1qlCMvCIcrEHiQrx4hNQnPnhABhAxC9aGoeeqk1ZXls7zUxC3LU7Nmpc71yx0BPEB13cRymW7lYoF+K0WKZRlf2/U46dI8H6NusKVVDcddsx2Vt/fDj/rjPq9d4EP7PeeU+W3zK7Z3DrMPqkxBS26al5ASNnKkPw21bgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1yW9YWezLSb77Gyj3ohrw8ymBJtQrxXvv5eCvZGvSE=;
 b=h1Zr6c+UYeLu+7OGgDaiQaKd0pW1Dsxi3uuCLWm4Cb/fEwAB+BWPnCr01609ZVitJWNxSfmhaHe0bouAzNf5kYeSg/rjhqfKezJ/x7l9v0Mise79P6zncHFuaJTAmuobcBDzCYJASnDFrg/uvkLgOEDIk2KjAYGnGqd0V3w3seE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aduggan@synaptics.com; 
Received: from SN6PR03MB4144.namprd03.prod.outlook.com (2603:10b6:805:be::17)
 by SN6PR03MB4064.namprd03.prod.outlook.com (2603:10b6:805:b9::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Thu, 12 Mar
 2020 00:56:10 +0000
Received: from SN6PR03MB4144.namprd03.prod.outlook.com
 ([fe80::4027:d39:bb5:4662]) by SN6PR03MB4144.namprd03.prod.outlook.com
 ([fe80::4027:d39:bb5:4662%4]) with mapi id 15.20.2814.007; Thu, 12 Mar 2020
 00:56:10 +0000
From:   Andrew Duggan <aduggan@synaptics.com>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andrew Duggan <aduggan@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Paul Hollinsky <phollinsky@holtechnik.com>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Lucas Stach <l.stach@pengutronix.de>, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH] Input: synaptics-rmi4 - Do not set reduced reporting mode thresholds are not set by the driver
Date:   Wed, 11 Mar 2020 17:55:49 -0700
Message-Id: <20200312005549.29922-1-aduggan@synaptics.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0032.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::45) To SN6PR03MB4144.namprd03.prod.outlook.com
 (2603:10b6:805:be::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from noble.synaptics-inc.local (192.147.44.15) by BYAPR03CA0032.namprd03.prod.outlook.com (2603:10b6:a02:a8::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16 via Frontend Transport; Thu, 12 Mar 2020 00:56:09 +0000
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [192.147.44.15]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fc687e7-154d-4e84-2eb5-08d7c62027ab
X-MS-TrafficTypeDiagnostic: SN6PR03MB4064:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB406417B10E57115EF44C5634B2FD0@SN6PR03MB4064.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 0340850FCD
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39850400004)(136003)(396003)(366004)(346002)(376002)(199004)(6512007)(5660300002)(4326008)(26005)(956004)(66556008)(2906002)(66476007)(66946007)(6486002)(81166006)(36756003)(478600001)(6666004)(86362001)(8936002)(2616005)(52116002)(8676002)(81156014)(186003)(1076003)(54906003)(316002)(16526019)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR03MB4064;H:SN6PR03MB4144.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3i4Mgqol+P95HXrY4a3rOeUNGG8Xw/UrrV/8Wr8HtAiS8LdbaTsvQMcqGOsRyUow22Q1nxXM9zOydqGoy6aKsklq1TBK7/8fcn6yiccVBnAOqyXLT5D0hUCGSGyeABXpOcJjOt/B7zfKkTU116+t0yZtxe4FSMUXn6qxIYa4JzORRDV+r3BbX6c5nw5QaYg1ZFMMWrlB8xYWabMUrdlUNX1VyZONqYbJSJNXfyLEztAFLf10Pf2qwu6BKnKkd3DnjlDeR8jaHgwg6b7aK3Gij0pXt0qXa6a5eJp8YKQW8iHBOa/nFrYj0GH1wC2c5he7szRWfdbQwaL3SvnYlV0RuGdevsTuf+6CDAnzD3UEjEVKewFAuvSVP04dWN+akeJCq9U5lH5E/DqoeEdHTEumpkiEDWoFCKyxlvT0OnKyugbdJKXlV4DUUrw9lzPK9/ZX
X-MS-Exchange-AntiSpam-MessageData: 2FDBqmU1XWheCWvXRarZk25BuQ3gB5sR5tqR/XfVgFD034047AjXqOQKArnIed8zjj7rX1ONf/4ma3KO/WiW1bh5D+y8z96aXwlPcO50G0whwqtKgjp3949fUVc+Ddi/SVWf1lvtFCRyJRj2PlL8Xw==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc687e7-154d-4e84-2eb5-08d7c62027ab
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2020 00:56:10.6445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ze2yTwnnRRn0tw+qMo9SuHuMKmJ6GC0qAt62mHUEX9F2bKzqKC+fI0gnvbiWatSDbmjVUlmC7r4PvRoB+edN/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4064
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The previous patch "c5ccf2ad3d33 (Input: synaptics-rmi4 - switch to
reduced reporting mode)" enabled reduced reporting mode unintentionally
on some devices, if the firmware was configured with default Delta X/Y
threshold values. The result unintentionally degrade the performance of
some touchpads.

This patch checks to see that the driver is modifying the delta X/Y
thresholds before modifying the reporting mode.

Signed-off-by: Andrew Duggan <aduggan@synaptics.com>
---
 drivers/input/rmi4/rmi_f11.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f11.c b/drivers/input/rmi4/rmi_f11.c
index 6adea8a3e8fb..ffa39ab153f2 100644
--- a/drivers/input/rmi4/rmi_f11.c
+++ b/drivers/input/rmi4/rmi_f11.c
@@ -1203,8 +1203,8 @@ static int rmi_f11_initialize(struct rmi_function *fn)
 	 * If distance threshold values are set, switch to reduced reporting
 	 * mode so they actually get used by the controller.
 	 */
-	if (ctrl->ctrl0_11[RMI_F11_DELTA_X_THRESHOLD] ||
-	    ctrl->ctrl0_11[RMI_F11_DELTA_Y_THRESHOLD]) {
+	if (sensor->axis_align.delta_x_threshold ||
+	    sensor->axis_align.delta_y_threshold) {
 		ctrl->ctrl0_11[0] &= ~RMI_F11_REPORT_MODE_MASK;
 		ctrl->ctrl0_11[0] |= RMI_F11_REPORT_MODE_REDUCED;
 	}
-- 
2.20.1

