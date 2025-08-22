Return-Path: <linux-input+bounces-14254-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B83B30CE0
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 05:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5601DB60A2C
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 03:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CC727511A;
	Fri, 22 Aug 2025 03:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="gDnGe4Vg"
X-Original-To: linux-input@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013032.outbound.protection.outlook.com [40.107.44.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E22826E15D;
	Fri, 22 Aug 2025 03:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834496; cv=fail; b=Rgbu01/c0ZvUF7pJ6i82KFymLvJlXIWlz6Ok/yyRyl2zDcThO4LvvQnKWk6eTnf9qIJ77scWB0m3v5iq2ze8PYHVZRyK85uL/mhgxGWmQVVyAO0Co0AA11IfxQZncsJyq/n5O1zO5Mc+WpLsmsJ1RLV2/tYKL0bOwyp2+8kafOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834496; c=relaxed/simple;
	bh=+P5Qf6EnYQ3Hw4W3/C7nlSCnRP3BhM39ZZ03H5Z49dA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jnXVYYkQpWkQ7l6CudlbXKbzTWTeKu4zAv2XFFQAF0EtZFvas6+0gs5vAEq/Gen0Q1S+/kQx+sBlbsxb+6WuTFZxhz5LvQbQBZHbVHyFlM9su4/lkdAj3/8IrGVHY4NTvXHCgTPOJ4u7Nu1RahVYJPAgP4IDZbcTHMvsJ/AdPjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=gDnGe4Vg; arc=fail smtp.client-ip=40.107.44.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhY3aK4q54Hm+pdd4VQPWjMWH6ILj2cbZoIKR4vl/V7CJNG9Tvt1eNRZ04tBknIAIyiEv5DwxBzTQj0qt7tc94Lg4D+DmhlWHF+SsuLUkxAx+bdQwTGFArvCYnr3YDDC+PVgHGNbAAmX15XUXygApXXHWuMATUY4B7RLcy5znTdTH1w9PTAxCN4x66ZGENTRooc854ay9L8isyrL4NodDJrMvVaKR6n5rPBBFJOkKsMM2JCaYo/HAPAgTfghORYO147B/nXV0QamCKi9b2RYws9DNu/McRFe1YpZ7+r1QB17uT76L0WzjGujps5xVe4xJKqiglmA785ZCIQ2t1G34w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrzOy5sa0xLnU91Bba5jk+8t/rWYSiWiYBUuK6D4jv4=;
 b=VWegiXZzaKGA0c2+x2xDN2lRdoDLP/5z+YRTWic+EQSBsQpdmAisUuPy5ZJr9Mn8UpSW0bvjo9v3VxwckVGZ+6vU7QYg8RAvmsBTi4zQbiGMGRNKuidmDM8Q9WzX2sOOiFvrlWUKL1vh9ALYCa0dPIlBK0BZV5ap06AgXLe7mErD0tKQPJnh9ybgt+ufk4NTGVVCNyhvOSIJQltvAA4qiUtHubjdXA+JEfcPux/3sZlTQcCxnpNTpPQUhnUFMRetdJ/hu3v2VBRa2i5PJQa+woTiGeIx0l2XjWhiOpQfsHNe22z6u4ILmDDdWMAkSOkUkJore4RyqtuCjOZkDrqleg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrzOy5sa0xLnU91Bba5jk+8t/rWYSiWiYBUuK6D4jv4=;
 b=gDnGe4VgXxQc+l16zCrqWmujnafPG8hmb3cgDoimHKr+7AZmP/p1XJi3KX9lU+j3Z0ZvTeaZ2aQatOuYWh+FRXoO07J4eQJ14fR0wjNYDGr6/D75lsnofb+X+EYi7sr8s4lExH1UCBgyjVLJAnyuMyPZhqJ+yCOXM0qmI5noEvFgoAfQb6ClptnoZhpw+YPwG1RNhS7DfA7DciVHGrw1WJDvM9GVYS7qucMY7svglA4Y+X7ujSsZ7JJyDDV4BuJO+dX0K4YVUyltzRXd0SyP07XFszZFhS88XrEc7YfkDu+Q7yP+nIbDfG4FaOj7MqonLgc5Yg6K5xRUwqFXPnOJYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by TY0PR06MB5150.apcprd06.prod.outlook.com (2603:1096:400:1b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 03:48:08 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 03:48:08 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list)
Cc: Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH v2 2/2] Input: zforce_ts - remove dev_err_probe() if error is -ENOMEM
Date: Fri, 22 Aug 2025 11:47:49 +0800
Message-Id: <20250822034751.244248-3-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822034751.244248-1-zhao.xichao@vivo.com>
References: <20250822034751.244248-1-zhao.xichao@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|TY0PR06MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: c73d2b47-c1e6-4631-4ae8-08dde12eb56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PzOxGCyBAhLk7T7cKQ8KHzaS/OHynxrXCxx7nGbQ8av2zSf7dU7SQy/PVUoU?=
 =?us-ascii?Q?9KVBh61ekKGMtJa0qO7yMA4Um1KP0SwF61opV6tJ3xHJvOlKljSA6QUhscoZ?=
 =?us-ascii?Q?/mbo8xpCqPtWedaVWf6BkEaY1EHEnG6c75YsQIG/03K5b3KJKoIy/0HuxlnZ?=
 =?us-ascii?Q?z1tCkO6gv/D93U3XBdgxb4p3PZ/0IPTX8ZKL5BBLb0Xv6u5BPXsJhnaVn/xU?=
 =?us-ascii?Q?JOtK6AdqlDDyptLYfUOO7cjzZYaHHWNxJMeGll8rZhFPaC+2hM+8fn+oK5Wk?=
 =?us-ascii?Q?tlkxKZQ6FGNkXxhkvwi4Z9Jpxlq5+C0drycJ7oHKzoBzrJ8WozFxt97kV+Ju?=
 =?us-ascii?Q?soHFhUlq1LfyvXcUYPBRBTKdt5WFVu7zzz4GRV9SEREe58nN5Z5g5VRf4g/c?=
 =?us-ascii?Q?cP2NfVBZKgGMeOAuDj22jPgA8ow6ImX9vtGjdVI6U2MVFLpoWv9WcveqnloB?=
 =?us-ascii?Q?/yYtiOt2mTfQpSVfD5tY63ZqC1FvS0vaxU1oG2/aCTbxZB2/UpY0Xy/5dksn?=
 =?us-ascii?Q?YJaMWHcLC+0pwgbE2BhKK4ajRv4clJhPiLp7xDZnErN6dpc6O/SIG8CweXqC?=
 =?us-ascii?Q?DAz3x8UUN+HsTMsGlPiDDIX0EQQDZ1YKUvAGy11yWxHdKYZqtQfVB+QdRUsG?=
 =?us-ascii?Q?TT1SJbsXGdcGsBJ6lUZgnrq+xv3J3mcttff8hTlY5C+3QNwp2Lc6IWiR+4tM?=
 =?us-ascii?Q?h6mMm3zaBO9zijOYNOkrBzJHZl3gVQ3unZaTykfzzZNgH6XGIUmKFVnpqjY3?=
 =?us-ascii?Q?mHSWZBz6pxgkUgMX1wb83eavooUUMEjpgXjFmL1y86TZ5bJM6f77TL6fUXJh?=
 =?us-ascii?Q?qIzkr5aP7sCLRpDwqwRttets7L6hZ4st79zrE5Dm7hqUJeLFdpSmWVzglaE4?=
 =?us-ascii?Q?VJFPCUsrmt5JyYSEEuGhJypRYz1fUQlz4WOSHhZ2kNig9nBBOjH3w51S+UUD?=
 =?us-ascii?Q?uAYQJhk0kFsgbEgiL3/2K9q5j5ydSOibJkYVBI8NVYOxY5FdKhXOvArcphzp?=
 =?us-ascii?Q?LzSRKpETAXJ5aNQV/qu5GISfYiwF5lMygLEcd4qsetfXjnrKJ/f5/wFHWOVQ?=
 =?us-ascii?Q?9/zXlgsqlKs2PiJeptNNo1Ak0HJoaPuTYASvhpOWKx+F2qafOoSqdu2sT2wo?=
 =?us-ascii?Q?27/MhZe2XTWlwxsfWmCsOFLakGLWqted/XIW6TCpsjVEAtenovXwIBMm98ch?=
 =?us-ascii?Q?/4h4wp5xGbG5oegjSB42Kxw8OqRi2qslg4N8V+xFbJyd9O5HZzsBt7yerJCC?=
 =?us-ascii?Q?zTuTwdKDY98f9ck/tqAdifUc3XYxn3opngZyqfHBdJkywLkvmFHYO5oa7BhM?=
 =?us-ascii?Q?Mh+h3y7VwuCynKgyHLil3rsAisXe6O4snQOezc0vXk5UpcFm7Pvix9+WcxiU?=
 =?us-ascii?Q?ZbEZJWt4Z2j5BlxM8royhufFqtPXBqhRnDJqqpC9oheVwqciWzFMtX8XbRS0?=
 =?us-ascii?Q?9nh5QQKuacZQ/pKcRCISeWl7cCugX7816LOBSKmhakYU8yrtzjLu7w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6020.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QdEkRDgd7l1fknlfKBT7Htprgs9PEVC7Y7LYFw94nSkuVbL6LkKZOrQGw456?=
 =?us-ascii?Q?XWub1sgFGD4CpLY/bb3I0yOOjlRZefdTUUoCJW7ndW5Zn6n6iQn/Bt2hFxM7?=
 =?us-ascii?Q?HSEO8huDndPB7DOdIirmIbpAHCXCKpitQA+Wcvq+jqJ7OSn1G7i9eukWPm83?=
 =?us-ascii?Q?fPARsaZqy7fQ3ircm4KKplpyDmlqWKtN2mLm8kkOVC4AKyAFFXLeIn1+j3aM?=
 =?us-ascii?Q?hr2K4mU87jMMP7AF5Zd0J7XK/Fn5zV554tgdk/2vhBGJsLy2nxwwdmKCDj7L?=
 =?us-ascii?Q?O4oYM204tNbfWT3+5gsb/tyQSIr1wKPQ/oAFlvQNuaV6GUv9NuBVFfa41K3r?=
 =?us-ascii?Q?C1iM4ngcWlzeBRqjuIOX+bYw3nyUvCXUOC5zlD+JOPW/hHbONF5zkvH6Cdit?=
 =?us-ascii?Q?hy+HPNZtrkncOWO0q0K6bEOWJel2HalDv0nsaPlrWBAwqbxZwuew1pHHGR84?=
 =?us-ascii?Q?41H4+bULGdRanzfL1n968PBCX/BzNlFSMGt8hwL/sg+km01MYwBqfWIfBiQ9?=
 =?us-ascii?Q?geitASuScwAMzHyOjgiNi+JXOqHM4AuBZ5Wzlx09DL3lrdiJ18/KbCvKNRgi?=
 =?us-ascii?Q?ssl+g3MZxdpH/kpYlZ2izL2B8BoDO88c0oYLKh9BiGwBS4szBOC7TYxgZlqJ?=
 =?us-ascii?Q?LVhdiPk3NgarFLD4TRhuCCTuan925vprHUS+WJ8xAyvMJ1oPQA1ZPrHMjjNy?=
 =?us-ascii?Q?2Smzuc9iD3pXN7gMDvYtgsRfova3Am5ltM9gfYxb9L16Ngp3/vyf2O4lyEWy?=
 =?us-ascii?Q?KdCaE/A2/ygAtk5upY/ddJV+ePcobrAmX9BwnjZeIUBcNiTc4wMqDWyz4JDt?=
 =?us-ascii?Q?YPOSjxxeuP+wSKmkLgZbD8aZw7t6RiGQ+lyES+sEqxDVi38xceE22Vh/VwvN?=
 =?us-ascii?Q?xZQrRQ0VKVtZQ8VAZ0AHMV32ikJVM3iK9yNhPxzCNyQOMCVeBmAartZDrg5a?=
 =?us-ascii?Q?aCYso/SYvkGouUcFG2UJIjb37HooxTZDVAmsNkn2xenJT84XrDjh/roQZxwN?=
 =?us-ascii?Q?rlhF+V+5+WL0hi11tScm3WQL2y69q7+cpvTvse6mDL/8MHxq3hr83WITWthE?=
 =?us-ascii?Q?ThbDgYttO1kn/Q8uzwbYAKH7la13FIki3RuOeDnkPto1h7iXbsAS1p/WhAjZ?=
 =?us-ascii?Q?SLrn9gFsxUyBHFknB+6uWteC06/a0/ZFJCrbFsVx+5hTxI6ekYRvE26jUH/N?=
 =?us-ascii?Q?0l8akuVX3tJKg/C0gDzXIYta88clHl28a13/8FG2zku4GqhrWb+A13uUufnX?=
 =?us-ascii?Q?jViDE8fQWxGeXovA18vRcKA2WMXyCu4WuRMtKC4c/rCFBH68d6KXgc6G5GGG?=
 =?us-ascii?Q?a0r55mXo7uvS9ZLLvSagRDv62gOWjjmS8ECayX/s+uCVKuI+oQ2XH9cjnaHG?=
 =?us-ascii?Q?2V5bCh+kmbuKzBiwEH8oe79vSVCc72RoS25fJ3iTPVHZ+2Zruz5RCbaEEn+Q?=
 =?us-ascii?Q?ZiO34hMPFhXS5BSjltrCfp6BQ8/fYsisELyixTtS6jkIafSGckIjp0Rwc5F6?=
 =?us-ascii?Q?6bvnHq5rjCMmwoXhq57rCOOc0kvE7ufSAPAHYpp5K76GbpWycuWwAZ+gkWo+?=
 =?us-ascii?Q?fF/0ouo4cy1A6RHvt4GmsUJq+AbFiWesFznqkvlS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73d2b47-c1e6-4631-4ae8-08dde12eb56a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 03:48:08.6796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHrs2YzKGIcXBLaytSGsRh9II031giknvYYiY/nx1m9ozaVMKlGcWtQ9/0nYM0bvPVRAkAU1t352v3//Jj8ZGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5150

The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
Therefore, remove the useless call to dev_err_probe(), and just
return the value instead.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/input/touchscreen/zforce_ts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index df42fdf36ae3..a360749fa076 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -747,8 +747,7 @@ static int zforce_probe(struct i2c_client *client)
 
 	input_dev = devm_input_allocate_device(&client->dev);
 	if (!input_dev)
-		return dev_err_probe(&client->dev, -ENOMEM,
-				     "could not allocate input device\n");
+		return -ENOMEM;
 
 	ts->client = client;
 	ts->input = input_dev;
-- 
2.34.1


