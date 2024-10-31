Return-Path: <linux-input+bounces-7794-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1639B749B
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 07:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7681CB23B8F
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 06:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8980C1482E3;
	Thu, 31 Oct 2024 06:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="Yg9p1bS8"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010070.outbound.protection.outlook.com [52.101.69.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617FA146D59;
	Thu, 31 Oct 2024 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730356283; cv=fail; b=l0AlJGKD2DHKQjcvt1+CY1/jvkw19MqPKVONSLChRrLpBaHrf7AA+4cyM5bu2COeIN7iJHWQcUkZJyBbo/BB4eeMPyl8mYfB3WfDxLemYgAnB31NsoLWr5MqQEAfv8SLuH2lHeXlPHd0XSUz1NkgR2DiNwmWAGxlVL4edmz0zsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730356283; c=relaxed/simple;
	bh=4fbsm3p05dHdFKozzpdHPtHRQIg2i58rUrg4QP6dj8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rtzZMQmvfhgNOkoJzgH85uHsd7i6gEfonm1k1Gpv3VlSZthufTFcpazz6Z1qNoYhIiy828lImr+B3JHJEfW0lPLs6W5/N/hG/GQge6K6/8m1D3U6C++mliyGerBDQP4p90evbvHT5TzK8b7Mncb8vRtuCGiI7W7oYE0p1kSFthQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=Yg9p1bS8; arc=fail smtp.client-ip=52.101.69.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwCn2XIdS3urRfqkooQ62VB3vKF17LZTTL72h4X8DnFfDEstQv56l1c40C3fWmbSet7XFUG/+hfwcys2/Ac4V3ykMt3jP8DBmTzZKSG3l1/9mCIlqARCIwYJkXGHsyfsDeabHn7keIsS9HiZEDt+RY0LFr6wwUcEGMXPXV45CNlrB3O1yS0OuyR38UrdTrySPFK7DlBEM0cJqEIwl7/rgqPz1vgd1iB1z2F11w16BSX+pZRa78ckhLtbHtyAsAnPqCdw3ogDy/xt5Z4DEYlCc2+zVpyZlaeeYJwIY1Va4E4aLEmNFEdnrAvQzvcFW/Ex3fbsfaloLLYMdaWcJbrs2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40sO2nvbbkMxOTpX0qWijE4NSJtlb6hxD2NqP2tGPiM=;
 b=YuIPRTe6nxE+APOAl03XvkGAcc89Ap8lBAnCdH53MZH70CcfzhU+LV56Hg6XvJhTsREyAXwsyYpRhZhGKWDJvnI7TiQF1rw7YJpkzgh5CZJkOXaGwnbzZKD3g3d8EvAV8jTWnn9/IDTzFf2Ewc1ibhuoKAaZwKeKISrULLilM6LArEuKJZ8Lc4FV0KSqnH/q1SUhI5hRxilHCZH9xoqwZ+aqLUal0EI3QHaRtwJbZ7hK2wsNMvF9aXLYXD+uC7eZB0sK2dBn/BGuVCVNU7+kCoHwRNKWGuGbDmaEJyzBZOaBLKeOdxSG1qRq7Cl8uGUQmU4MAp8pX4un10sMliAigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40sO2nvbbkMxOTpX0qWijE4NSJtlb6hxD2NqP2tGPiM=;
 b=Yg9p1bS8FTdC4x8B2DBYJEOihd2r+LsH0Zi4z93Mk6BQMIF9BENMGzvHWZ4Uk08z3vMN2kapcAqcby1DbONRD95u+qOpWWgtmQm3iqYBrnezynXzknLQTSmpEkUhKsTdF5uvuHHJwCuHMaRUcdie7oU+4x6hCZzTL5T8JgextgS1p9vJsG8me50i7Rtm6/DeV7UZtLu3ub5VCSr+UKjw1jAonOnJbTny0ZlKXrLnYDR5g50sMPr1cqi0ZDMsZGkXWR177QzWyar7zfeOSxnzyjCAQcZxy//mdTY6NGNhku0QRjsFb2dyf5d41GXBedIEiZDCTniZNUBmFKhfrRp6dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by PAVPR03MB9797.eurprd03.prod.outlook.com (2603:10a6:102:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Thu, 31 Oct
 2024 06:31:17 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8093.014; Thu, 31 Oct 2024
 06:31:17 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>,
	HeDong Zhao <hedong.zhao@mt.com>
Subject: [PATCH 6/6] Input: matrix_keypad - detect change during scan
Date: Thu, 31 Oct 2024 07:30:04 +0100
Message-Id: <20241031063004.69956-7-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241031063004.69956-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0011.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::21) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|PAVPR03MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: ffed2d29-159a-434f-ed07-08dcf975a04a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BEmwpQsYnJBlDXPwkxuz1LiNJ1qDCQJB05xG4KAVoJ+s0qxNu9m7rVG9FJNQ?=
 =?us-ascii?Q?rBTZdeCieD0AQh8XMQX6PfPxcvwzct8HZvNSlFO3GtKS9oIf7sINo3eGeASB?=
 =?us-ascii?Q?lFtlLaJumNiRYvON+Ipy0axxoH08v8F0WcZIeLkLlkiPPvm8iFdQBPC65f7y?=
 =?us-ascii?Q?0fGvwPI5oZH9pku/VZi2DinUBzz56TuhtvyM/cRgAmHG23UEb8chKwp6UlsB?=
 =?us-ascii?Q?f3tiutVdZ5fz9uL+fyMmpmfHDKj1C86k9fbqKQYSqBgpNDWt9wGBUmC6LAfL?=
 =?us-ascii?Q?QtRCUHzK3C2t0ahX0Z+esaEOhio8S1RXQx46IRX1k1C4B9bTzvnfQ7/x6pJi?=
 =?us-ascii?Q?kFfshuM0D1KqNMYbVjCn6cIkEIPIVFIZXeFCZA0tjFmlAsbWVBGKjEqiq/wa?=
 =?us-ascii?Q?G/Mw/McfZJmYP6UtCIad+muiCnzX5W7P1LKMfDz3Z/rQ8VEL8XomZEs92Whv?=
 =?us-ascii?Q?4hQS2AHwkT7OdhiSkqtAgI5HQ2+2pAfYi7rGlcqhTxCzoNtelToRhEyd05vO?=
 =?us-ascii?Q?KbB+FOodBhP8LKpbVmAWuRanQ35xKedErSFay2fqodM3cnYSw3XEdmxNCUm9?=
 =?us-ascii?Q?vMr1oIpRyQlI8FbzP5LMYtpHGExAH3yM+1isYnL9IK0KcxuqQpOZ/Ahs9aoZ?=
 =?us-ascii?Q?3JydjOiZULLW2QUhmiXtQyeb1YNbCIKKvl4c9E2bSTKd33EE5J/NcuV4O974?=
 =?us-ascii?Q?2+DoW2cHBBlV0YNCbn7QoqAooXwn/lMB3VjGs56RLDAcyaDB0cVmdBYlRfO3?=
 =?us-ascii?Q?XhivwnaO+kJvdO5S7haca3yYmZ/V5WTdCYbPGMHJ476F5mskz4Fz4gxMJXrd?=
 =?us-ascii?Q?rAMvySLeqda7dqcUK4hQ5UbOlIg0eelL7HVosoUTZfEP3Z6IUa0wS0xJo9VE?=
 =?us-ascii?Q?LXHCGg/ePuhr1/3fEhDRKBHmGzKBh7t5qqmMPz+D+cLLhRvSRgfbbz4ymaxv?=
 =?us-ascii?Q?pcxdGLKOAxefBSRGocjQSjV1DTxGfZnhH0HKomfVj0P6ClL3atZ2NLUIw0mI?=
 =?us-ascii?Q?oeA9CAP9PX20KyJDyApj2425vqncV+EN/qFjrh5OlRRJf1WPpU4wCeTqQVxP?=
 =?us-ascii?Q?Fy7dToG7/cf9M/k70bWcx0/GHymGR88ko2RK70bRu6dbRRhMGNZIG2CTy+ol?=
 =?us-ascii?Q?HklXIYIfKImE0Qf6j56tTU/gx1GOJIej2C03zOnbPBq7xEx+MObgkoRaRpV0?=
 =?us-ascii?Q?2V7YkVv57huI/TtYhMXSkSzhhaVbXeUh6geAK3EkfmAY6DK14ctdCNjDV1AI?=
 =?us-ascii?Q?AKqeHy8uEDzr+MRZYsprNlTRO1je+Gef2jYQYKMu0qRZE7fwYHQ3/4kAiRTL?=
 =?us-ascii?Q?hA1AHjcpx9pgdgebe6hQOqOg8taEWNOs2aabu77QtV6WxULO1bjfs8H70ZEH?=
 =?us-ascii?Q?YKDgQVU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IWV0J3/OGe2e0/RhHd1zfR1960n9RuINc5BlPfdmtGY4lO5HlvbRjCmWXK2X?=
 =?us-ascii?Q?sCmgSPWnnSQj8aCkUvcrKLPLMYz9H6oOfYg6ywj7IMXzbAZq/y7PzGSIaZoA?=
 =?us-ascii?Q?VA/8WTqnSFhiLn/NkLOKa8nz2Sz6BlDLDQiAsTNR0EehcT77vr82J70FbPIv?=
 =?us-ascii?Q?eJvTdn8JkUQVA51Wl7+If4iInJpkVtvDZ36o4I5RRIwa8NP5oDKHtIjMl8r+?=
 =?us-ascii?Q?+YLKE8oaf67qjK+w0odTQ3Z0WX5xPPnsxa7HYeH8SdnUhn2YgkxU30+fCtpI?=
 =?us-ascii?Q?VvGM/DqKq4WwQ2ayBaeWhwrhjkJi4wyZbt8xMSz0G/9kQnhpC6MVWsLzNKr1?=
 =?us-ascii?Q?4C4/zdkJH5tIvp6u/g2OnCk8jLPoMfXNA8vtbHx4RI3KZNaMFK1tdZA1gp1g?=
 =?us-ascii?Q?iUn2ih3k7C6PvPS1lll9vPbDWT3ViQWXR7z/E7/jS6Y2y/62sL6q/glSBxJ4?=
 =?us-ascii?Q?N/PvT2jaylsbCyVoynm+hjhuTk6zxQyRT7FM0ApBL2TPJ3qxEn27QFF5/3/j?=
 =?us-ascii?Q?vvU2cT21MbWIJr97hBn9Nd19ojNkILKmxv/ovJiBxTpC2UQWcO98ohAaRRCy?=
 =?us-ascii?Q?HJMM+YMH0XdFg3y55sgTKTxdwDd0wy1SPElafK8na4tTKYk8oApkr2Ec7Z7k?=
 =?us-ascii?Q?CUk6ty4djG/7X4fd2V0TC1lrhOCnbHLrYQjJUOD1663KXKChxnedTbCKc3jm?=
 =?us-ascii?Q?pHjPZCKB5Fq8H8Jw2GEZaPByKafPnNhauC6JuwBum7P6MIz9ZUp/NkmAAs4R?=
 =?us-ascii?Q?b/dI3B4M1LENeBM2hqZ/hx23BLijwsmL3gAW1zOTlNz/8wHqGW5X49wOBa/h?=
 =?us-ascii?Q?3+wqgKjpzexmkDPocVlNy/8wbhhBR2ZzPFvk+gNaDl8r06srVYk9seQSyt/m?=
 =?us-ascii?Q?Sh0QAE4uWkU9QscdCrJB1cXxSZTxtDsuzhOP3jf9u4ZAqBOFrd6M8z+Fgp7P?=
 =?us-ascii?Q?AtoVNIMi5TuGPjZzEBhqT0yi9EJz8iPTUmvbMAzfRJob8e7LRuRMIm2+cGO8?=
 =?us-ascii?Q?cmx5qCTvqHPSo5J/d+/Diorxpl/a40zDVDCcL8YE0+tltLGzGNrfgNH8qjV4?=
 =?us-ascii?Q?UppLta5qOyXKfUTdlfo08S+EprPRqa31uHCU4ldSXuayObEHb9dnd37jYwBo?=
 =?us-ascii?Q?HNpHrRijqzoYpt9eNj3nOiJ38XpDo1FkWZTosYhKVgNrsAK44xKI5REnp/dj?=
 =?us-ascii?Q?uht56LQEfs1KDkHxs6JJQnA6VRKqEBAP547ceZaF8ktOyKVVHgBEg9rU4hjE?=
 =?us-ascii?Q?dsKx9XIi88rH9/tdIpQU8uFvzwsPp3iRngM+eXAm+t2GP5zFWsXFWXE+kNBv?=
 =?us-ascii?Q?lJL8OvWmRTPw1lOJ8inCNmC9uzdg2G+ig4m9BLaxxNrwbqLRaKGkSkleVoTF?=
 =?us-ascii?Q?A4aHe2xGgKdX+Yy8Rz8sAQYGE4uTKGsnkji3tN5VrxNiJlP1ERGuIs4iCTiu?=
 =?us-ascii?Q?fV7fboiAEiYUT28909hAjF5IUPzHQwaQNrt+OFbYgeeUCImrhJ+pyCyyQZN+?=
 =?us-ascii?Q?dHsT1Lwq2oPupU3r5L/Ug4qby0A5wl48rkyh+Wuf8nBKrDfphCUJeuaFFIc6?=
 =?us-ascii?Q?daGSfNfYOisVwbKpghP2VQwjkhI2KS0cmvc/QZ98?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffed2d29-159a-434f-ed07-08dcf975a04a
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 06:31:17.6769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OS73Qkl9RhAIZBMiQ9AhEggTGJf6JNsD2qqQ80ABVFPXW/K8KoI2ydypOa1B3iI2v8l1gbYC+2WwOjRKDULKCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9797

For a setup where the matrix keypad is connected over a slow interface
(e.g. a gpio-expansion over i2c), the scan can take a longer time to read.

Interrupts need to be disabled during scan. And therefore changes in this
period are not detected.
To improve this situation, scan the matrix again if the row state changed
during interrupts disabled.

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
Tested-by: HeDong Zhao <hedong.zhao@mt.com>
---
 drivers/input/keyboard/matrix_keypad.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index f0d3004..428b36e 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -126,6 +126,10 @@ static void matrix_keypad_scan(struct work_struct *work)
 	const unsigned short *keycodes = input_dev->keycode;
 	uint32_t new_state[MATRIX_MAX_COLS];
 	int row, col, code;
+	u32 init_row_state, new_row_state;
+
+	/* read initial row state to detect changes between scan */
+	init_row_state = read_row_state(keypad);
 
 	/* de-activate all columns for scanning */
 	activate_all_cols(keypad, false);
@@ -171,6 +175,19 @@ static void matrix_keypad_scan(struct work_struct *work)
 	keypad->scan_pending = false;
 	enable_row_irqs(keypad);
 	spin_unlock_irq(&keypad->lock);
+
+	/* read new row state and detect if value has changed */
+	new_row_state = read_row_state(keypad);
+	if (init_row_state != new_row_state) {
+		spin_lock_irq(&keypad->lock);
+		if (likely(!keypad->scan_pending && !keypad->stopped)) {
+			disable_row_irqs(keypad);
+			keypad->scan_pending = true;
+			schedule_delayed_work(&keypad->work,
+					      msecs_to_jiffies(keypad->debounce_ms));
+		}
+		spin_unlock_irq(&keypad->lock);
+	}
 }
 
 static irqreturn_t matrix_keypad_interrupt(int irq, void *id)
-- 
2.39.5


