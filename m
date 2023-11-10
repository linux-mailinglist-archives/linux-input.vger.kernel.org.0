Return-Path: <linux-input+bounces-2-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D887E7F01
	for <lists+linux-input@lfdr.de>; Fri, 10 Nov 2023 18:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 872881C20E91
	for <lists+linux-input@lfdr.de>; Fri, 10 Nov 2023 17:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4763C6AB;
	Fri, 10 Nov 2023 17:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b="w3lSzuvX"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4713C076
	for <linux-input@vger.kernel.org>; Fri, 10 Nov 2023 17:46:52 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11hn2200.outbound.protection.outlook.com [52.100.171.200])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8891B93F4;
	Fri, 10 Nov 2023 00:21:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORFXeuKA49xKZGV/YQvx0NkeHQlYNUDjRaLz15v0CrXwSrWbUxiJx/0Aq/6TaJUwkK3tZqDLLO4+IFKj5OQET1WdLCIjE3BOg0c1EgFORmDre4WK6eLEZHkJYacF7EYvGkJiKpIX3dFaZ0uDr3lKJWCZIuOCkB40RXW7MpYzI+Y9O7TipOH46qK43svcN/TzaHxqDw20Q9y45BKzoPJ6YWOF29nXNra3JBArwoh0oDC3KLQ2lya5SK+DpVyLwibhnwr9OSKpNVs8ULg51F9NtS/Ph27BcvHwm91PvNPCxOXa1DbdbBnd41Uf8DnmLdeTTlkUCo+xuZmaJ9CEdD0nwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmlqQZv4ZpxW6bx7c33HLMDpFfWnShpVJlmBeekA+Ro=;
 b=jxct1DCzSNU7mk1xv9NSjAFHBkos4RxdELVUCzbBddEXEHd6RSms1JwHQyAgWe3UfA1/sReu+Q3HnJ0fHLLtYNw3xHzE1sl7riTUHCy8tcqZzzxhJm1crajMtNUPjgmcwpksh4ouQMTrEhuJIfHL5JWM0YSQ9nl/EeBou5gz3PBGOYZKz6k7/wE571fbxeF91j6KVs3nlDYqM3IjUrMGl9EUwUrWsA/hpqOI5a+UwOUvtyUxuucboiBFCw856npT7lLZnDSaBRO3mkNqW/IUN5+Sa+8ymXeuQTOFgW5oJZ5JKt7xbOmTK8GaffyN3bi1MAgJPRLXLd1XmzxlepBxXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.147.44.15) smtp.rcpttodomain=gmail.com smtp.mailfrom=tw.synaptics.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=tw.synaptics.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tw.synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmlqQZv4ZpxW6bx7c33HLMDpFfWnShpVJlmBeekA+Ro=;
 b=w3lSzuvXjNenenX+4jEWJQLkYSUmDtAaoxVKwhb46VI88a24E80YFKjaRId0UURhojJL8OX3EB1kBChKJPI6nGcqrMM1oliegsXG3aV3BRcsVUnf1KhWihJ9WVMx3yOKKFPPnUqYILLI7l/ExsrZtax0N8oUSnULFieVBtY4a9g=
Received: from BL0PR02CA0113.namprd02.prod.outlook.com (2603:10b6:208:35::18)
 by DM4PR03MB6126.namprd03.prod.outlook.com (2603:10b6:5:395::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Fri, 10 Nov
 2023 08:21:55 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::17) by BL0PR02CA0113.outlook.office365.com
 (2603:10b6:208:35::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Fri, 10 Nov 2023 08:21:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.147.44.15)
 smtp.mailfrom=tw.synaptics.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=tw.synaptics.com;
Received-SPF: Pass (protection.outlook.com: domain of tw.synaptics.com
 designates 192.147.44.15 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.147.44.15;
 helo=sjc1uvd-bld04.synaptics.com; pr=C
Received: from sjc1uvd-bld04.synaptics.com (192.147.44.15) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server id 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023
 08:21:54 +0000
From: Marge Yang <marge.yang@tw.synaptics.com>
To: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	marge.yang@tw.synaptics.com
Cc: david.chiu@tw.synaptics.com,
	derek.cheng@tw.synaptics.com,
	sam.tsai@synaptics.com,
	vincent.huang@tw.synaptics.com
Subject: [PATCH V1] Input: synaptics-rmi4 - Enable support for F3A by default.
Date: Fri, 10 Nov 2023 08:21:48 +0000
Message-Id: <20231110082148.1032629-1-marge.yang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|DM4PR03MB6126:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2e78987a-b232-445f-ddf7-08dbe1c6199e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SdbvIVm4zo33GxmoYcs6LgApQPv8GeZeMHkEnfPyz94DZMrbsuhpVxob8pWDYPlWo/tdeae1hQYd7mhzHErx7gJS1z1HYDIrNqXfqx2d1KFXn54uStD+Z7hxhT/qU1xkyxAYKZjy++hZaEXXco8FftUMgvRZuh9+/sGGcvOmFPcSilvER93hDcQ0GJdfbY18k+c0+4OLMj1xU+hUcHpkdSRzpP+eAUJUejJEMxD0u8vpc9zGLgv4q3xNO6jjKTR2Z6asXa8n73CkZ68UsPV7mcJ+0lgkeIHnkUg2PTyad/SiHm2Wqqo9+jMXOjZKF8UKJVoeCW0iX9BLx+0Ec6sKLKW9LeCnU82J5a0hE5Asf2f16V2J7Hx4hA9/8+vhuVKM3o5mAB7HrO+Dybk+scxAepMS4so96sU/YpMzz/nImYI64pXpDHsZzoyYLyWrYrzPfVpzr1q1hoPzeHID8bkgAyErqTIV4dlG1iBbeEJWhsXOaDwNeyl4fpucyAn1rHzrCsovXqYawev+kZHkxuuIVt3fJOkzmSVeGZXNm/5bIVCn7bOnwUFGC/LhA/WTbwaX4Wt4e9HBHzyQ76RhiGJzyvmCh5q2JxiUsneLPfbLbCsT4DnlDN4+Y8Vc0bYOvITXB6keoOTCQVzgY4kTNFkiZ06Xkne3+xmsDcZCfEWyHzoiXVQvkMh7hE/3WCbhPmtZVIKJHYk5WdaJ+uBmIhKmdVSlYOylFPBvIDNZlH2CBxA30dJ5w2uZ4fd6+anaC8W+RcdUkAzatnLXiESqqZ6GLljUKR8PNJa/xKtdlSQazOOHkLzaB8fWEcaUJDBKJY59
X-Forefront-Antispam-Report:
	CIP:192.147.44.15;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:sjc1uvd-bld04.synaptics.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(186009)(1800799009)(82310400011)(5400799018)(64100799003)(451199024)(46966006)(36840700001)(4744005)(107886003)(6512007)(6506007)(956004)(2616005)(6486002)(478600001)(6666004)(26005)(36860700001)(1076003)(4326008)(36736006)(2906002)(118246002)(44832011)(5660300002)(316002)(9316004)(41300700001)(83380400001)(70586007)(336012)(70206006)(8936002)(8676002)(34070700002)(356005)(82740400003)(47076005)(81166007)(86362001)(40480700001)(36900700001)(12100799048);DIR:OUT;SFP:1501;
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 08:21:54.3766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e78987a-b232-445f-ddf7-08dbe1c6199e
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=335d1fbc-2124-4173-9863-17e7051a2a0e;Ip=[192.147.44.15];Helo=[sjc1uvd-bld04.synaptics.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6126

RMI4 F3A supports the touchpad GPIO function, it's designed to
support more GPIOs and used on new touchpad. This patch will
enable support of touchpad button.

Signed-off-by: Marge Yang <marge.yang@tw.synaptics.com>
---
 drivers/hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index e11c1c8..f3a989e 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1082,6 +1082,7 @@ config HID_RMI
 	select RMI4_F11
 	select RMI4_F12
 	select RMI4_F30
+        select RMI4_F3A
 	help
 	Support for Synaptics RMI4 touchpads.
 	Say Y here if you have a Synaptics RMI4 touchpads over i2c-hid or usbhid
-- 
2.7.4


