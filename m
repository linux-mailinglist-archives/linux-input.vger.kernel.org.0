Return-Path: <linux-input+bounces-7875-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BD39BCD88
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 14:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 983AB1C225CF
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 13:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D2B1D63F6;
	Tue,  5 Nov 2024 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="lDKFoiNv"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2050.outbound.protection.outlook.com [40.107.103.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880B81D63E8;
	Tue,  5 Nov 2024 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730812218; cv=fail; b=jc+S4Pz9ITe7zyOFnviLBWHY8KoAOWJBg5kJLAkyO2wcZLrsCYpXWhNTcvEBq9e3RRMQBQCz1Khca98zrGmyT/Wlz6xTUb8d2EI2KXlw0W150TRpd+90k9o0ExbhrfnfGwm0UuM7xyP4SA/JualR0QnJ+Uw5rszY1rAePKu9yDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730812218; c=relaxed/simple;
	bh=dS0EPvrlKmpyuZD95c7kn0I5Qj6u/+zLwSdT5HG9YeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CrFX//01NrERX2bWhM2mM3doawcuWblWfgdO8I7ZCq7jzioifXoiAhvwPGDS0SU9CYAUbGrf/V59jyZcJOJqnFOQKQOE2B/hGkuGDF6pY2GOcR7qDLVyR3/+lBAHtUecdCs0PkjYCCeCYR7aBV6GdX5sT3+W9BjSznqRndADhgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=lDKFoiNv; arc=fail smtp.client-ip=40.107.103.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgGDEym0MEHaplfMVRhs3kQjEJIsqC5jdEhyXAxv3iSCzHErUcm3aeDGTyYxW65cpGCvazmqCaawrlyT2CjhBnvJOuZ+f7T3s6BRAnebgKZsmIzb8z4k/jQlKk6n3LlH+PM8x1dMXvXMyWpCnl0s1Y4fOhMEE47YLejE0DSgGPZE9LrELbqKK3coHgdGLYSO612hgwhJiLMQJBeJzDirj2LNoU3UT5okGlLct+PGjhNkOAzLNO40syUFqMUY03iqXx59hNt60zS4G/X7GM4Rf5YhbbUulJKwSk4O/q9yS3U+RA8RvGZfY2wdpe37mB9u1djpxD4Sii6zlxu9A7s00w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cQ0GlwCUa1Pyu+/7QMAItAu+fgfDkTFS0ht19uK+x8=;
 b=yuwLboJ9/r5AgNvIH85z6NGMeoduEzI9Er//1GUm3qNdPoj2dCO8j0akcPZtXDFEo23ecy7Tv8kGk7vPOuIzI+3bYkV5qYmVZ7poxEYJ2w77JYS2iWCqpKNXKCmFtU8QZa4aaYU8fM1y9pEkFIYZgyLN4pund4xeCNPY9h4ZpDkd/Onx8Y8Bd4eXxLEzMTCFhrNAdKOcJcHu7BoyE1IelwGo6yRVasboIKLrV6pU3f67D6GUfbOVcP9RRkhmlng/IuU0WBamD/WecI9zBHFDdAoErPtFirYyO7Iz60M+PFtaXV8ep4u2MkfeWazeMwC3W+LyfZOstguHEvLWEkMj5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cQ0GlwCUa1Pyu+/7QMAItAu+fgfDkTFS0ht19uK+x8=;
 b=lDKFoiNv0NA6R+UuI3BiwUR+mawvnsglrlp67vxd7jJYzCFgD7ZJllUl4Dnsn9kD7QluGGEMHwlYLEFD7MTAcyBXbcDU3MJDQir9lISoRe0gZ6YORRs2GyYsHCYYZxa5iuGQuI5MMCZMYUsSn4eOwS9Ebb04rXlSYEBAHEvcoEo+2gCspM+nrxsdCD7MRsc4lxUWcTi9dZL0RmU0hSjutGX/xZffe28uhJ/ueGGYXvtExSsAkxvqpS05Y3RwtdmmKAWAjC3VE48EZYaGhHTTPIInmpwK+xQhbo6BtyCWEW9sm5u4GTpuxSsgbsGIwX4Z/TCEKL/6uwtcX4qyrtrmCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AS8PR03MB8468.eurprd03.prod.outlook.com (2603:10a6:20b:52e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 13:10:13 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 13:10:13 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 7/7] Input: matrix_keypad - detect change during scan
Date: Tue,  5 Nov 2024 14:03:22 +0100
Message-Id: <20241105130322.213623-8-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241105130322.213623-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::9) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AS8PR03MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c0c6e7-0da2-4827-810a-08dcfd9b2f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ICH0sQE0BQikQxcLfG8p2KOAlbwGHwlukeWbfXR4K5Q0AgDDPnzLhPgInUpt?=
 =?us-ascii?Q?V/eDOOO4IkU9b/ysP3H2K3EVVoCA9papheNK23PH6OkWhr+TArEq5e3dQKDP?=
 =?us-ascii?Q?S2W1Y5Im6c+9g63mcl6sFUQS/mC2TsZezel6iZIHge2OmDMx6FcEsMVhyPHG?=
 =?us-ascii?Q?Ti8q1hfK6S0SM9sObtIz+BYp+oAHTWAtZ42Hft5l8aEGlHOR5u6tuzhXDBEC?=
 =?us-ascii?Q?NVe+J/13LKfEQRuyzWoo+jEmJ4jsvbLb25P/rYILLSCSylgeplhlqpNBaWfw?=
 =?us-ascii?Q?h/8M/tRICIgPd2ZRXKr/3+1Nm2IQaUwB/JowTMmObnrf+ripNl5/AErTXOW4?=
 =?us-ascii?Q?XEkfXYDmyVKHtrZx3pQDfjzfiiKgH44PUxGpo2F0dydPyehfuUMROCNsiwHZ?=
 =?us-ascii?Q?dTdaWb72wYh/LkLwG3exNc2HkfYNppodAX/K5vJCx+sUnnRDRRT4rZYSXtLK?=
 =?us-ascii?Q?WH8J0KCUX9T8B6cNYqzrOBhfQQQnJCdBaw6/SVZi4qJDk1pJ7JMBbC8VBh6p?=
 =?us-ascii?Q?WNUu8cwzjJGB0uRL+1eAYIAnJ1n/iYlcpbIO81lVPToKaII9DSiBPEgfFFTY?=
 =?us-ascii?Q?+hxnDrg/Gols0XL9p7YuamUoUJVO7puvbPWVVKQgbwtzY0R07KO0S6gC0Pn8?=
 =?us-ascii?Q?zs2FWanL++bSSaGnkqFQaeA1stZYU3l9Sg6unKZBtGupuQ3i5hqVxILzAC9P?=
 =?us-ascii?Q?GIEulAqw8cKpmxPtUKnfA3bmFVnZ66H+W2AEBIAxxfezxCRQKocR3cAMKY6n?=
 =?us-ascii?Q?oSwdDxKUJfF+A6vV29nubcxAl9I9ViN+vT9mNtYXL3gC+ciPoAIiDqGhHw5d?=
 =?us-ascii?Q?ru4PzWQJG76S1WeRB2a6vuOzjMiZkoKdCgjZ03lXtXyR2YZWlV0pLYNm9rM2?=
 =?us-ascii?Q?7Vr6ObuQPFCdiwUHtbV7+8CuXpUgfJVNIP144yqW6nCqAp2jRz5KCqZcTY2F?=
 =?us-ascii?Q?z9GGA9S0TGQj3QmvXq4tvKJQtQmJRN4s2g1/V0qVr+ZY5R/nbvPcS5SK4LjC?=
 =?us-ascii?Q?Oi8ispofGLpEIqHaFeKy+SPGqVQwhYHhBPGaRBkJnoeMZQzxWh0y3OGX3fY6?=
 =?us-ascii?Q?SejuYdK2J7RqRpbNbN1/nz2sNPPpPg8UwjmMNzmLp+Jri0ebbZxAt6VkxaCg?=
 =?us-ascii?Q?xG6T7RPkBFd5Xb9XsJ/yHv8g+rGmRNJixIpRTqbGydp3KkVg/V1nXDbeOiqa?=
 =?us-ascii?Q?p2ndi88HLow1jg1E9RDJsIe045ozHHZT28Jf599JgNW3Y7rAncu2Z2lM5OiA?=
 =?us-ascii?Q?6Z/TlKdJg7OMLfVOfLHFC5U20X9R0o+tO8hprzpYbd2hKekX3GrkN3hVzb/p?=
 =?us-ascii?Q?MdJkT+oDtJ2v+BCxc3ii1WshewIMZpSliEqH+dsoBAANsDD/i9Y/Naw2w5Os?=
 =?us-ascii?Q?w8zPN5w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IaQAChT+oA8TNfz1Hkka4TrIvRwb0G4Ni3ely7A6puEv0e6v3G3aPdWUlb+U?=
 =?us-ascii?Q?EropenZjXWUZ1DZGtj5xlxi8/ozTdj2+ZCYsmg8Isva/a1JNp85yPOSxScWF?=
 =?us-ascii?Q?JmE4jd2VXLZORJqkG3OGO9R/jEScn9wmjvolPD3Hijyb5+AdUD2MjZFTDDHD?=
 =?us-ascii?Q?9RrXFjLNoMZyU3h8PxbCajsvWsVn7oMi9Kbm7gAiCO1SmFPQx7M55XrAx3GT?=
 =?us-ascii?Q?6KPduy1o1xZ/rtB8CPpnvWFRhbm3LHXTLf6qQonRmbx8YGze8r8BHLf21aep?=
 =?us-ascii?Q?skB4TLJNTVKJOj5vX5bguDh9N4StWa4ltoORd82Cbjsl/qNbfm+AB4Wofqd8?=
 =?us-ascii?Q?YJbd8OEiQbLtkI/aUnvBuL1Fxkb4CYg92+BAu1S8mnjmNd/49BgzEq0WoXmh?=
 =?us-ascii?Q?Pk7Vz3iueOP8W4W7NMJpo0hc5WaOd6L6IPU9gJeiNjQ6Gks61py8IupWvns6?=
 =?us-ascii?Q?2bQksTy/+5WjV6I758wIRToH6FBYzie5h6OLuQVJRMUbD2q7STfhkciVrxJ+?=
 =?us-ascii?Q?IwbLgvSc9hc8uXPlelBk4kaUAg63dJ/9Tzhsqwre0Oa0Y2vnTMgjAe/1QFzf?=
 =?us-ascii?Q?YFdgiDZrmBKDvCrYHpX7mQ/3gdT+JrsYbh2tKVQtiCq/YoNQ6bJuwEbvi73S?=
 =?us-ascii?Q?DHWkyOvvArHRJgX8Z6fRDf9XIduu2NtXGL0z6dw/dktgdgbiuONddAJCGOrD?=
 =?us-ascii?Q?tFJakX7HJoKN00RyUsSEX9+HP3tzu5WWO5LoVGuG/r/ugaog5OUNWeNFScMT?=
 =?us-ascii?Q?qswqp/Svkxba7uBqUSWOtOZH61Rst2KILBxn1niZBPrqjTN4E9GfC0HGTpR8?=
 =?us-ascii?Q?wH556pX352c4nYX0CO035dkHhn2hPj4beLJLFhA8AU8Wyyx+pImn3bBpLp9S?=
 =?us-ascii?Q?nTKPb5G3hu9WjflQHV7QdTC/BAVi/seW9yaBuwScR7fINL/qRew3gfLmx0UX?=
 =?us-ascii?Q?EcoMfahnCOLCXjIDqpO5RhdhqgSk/FiKED32gkZGSiK+yowYqGZRkDtdVM88?=
 =?us-ascii?Q?xVZbMbqJv3Q0/ypyWSkimgUcn9SLZJycKC7/QEVlmGjvi7wT0Izs7fWvMngq?=
 =?us-ascii?Q?c7sV0kDC5Q8VQeiKbj1+5onzc5bNa3ygK/YLNlAAqhaJItR6/9DwZhkWpnki?=
 =?us-ascii?Q?6V1vVbL/R3qqFND2TOJ73ocb+dDTblew5yQbV2fXFKygcuCPQ4yyL4fC34Az?=
 =?us-ascii?Q?dbPxeThXBXnS12svVp+TKh7HdHWV9IhdH82+mVHDty+capFV/2wGNDGxF44s?=
 =?us-ascii?Q?58uaX67pmXd6+tSqlQXIYZ2pZ8cdsn/ESh9QrMXE5aaGj+Hg1PDn7ERTfQp+?=
 =?us-ascii?Q?p0CGbjMgxowCWnzbbdZJqSwKIa+OsJmJgJz3Z/9PkVYl/wDrB8QSIun6MWov?=
 =?us-ascii?Q?T/aS6Bti8/7lQTRkBvGJ1gkE9MYLuA9UYHVLYIXP+q0wXPrexpq4yDuovQek?=
 =?us-ascii?Q?zE/SwIl8gVJRqv7/YIjX7GNKpwTQ/tNsW7LiJxCN4oR/jAaYsDx449mo8zp8?=
 =?us-ascii?Q?5dhZyJrFb8Ah+OGRgkc+JRQ9QBq5UuPDKNo/NmogBRTXFd+73KZ9VMvNERPB?=
 =?us-ascii?Q?Ja8dmK/I0GVqtlNLgTwiBlkm/wttrOrp1st81Uo0?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c0c6e7-0da2-4827-810a-08dcfd9b2f24
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 13:10:13.3134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgpl7a5KV6jWg37qzmOxYGKWa9BuoPSqaUlBN+axYJ0YLkzTEI1ii6SA+crOH9dhQQHeZ7bPCb6eZUWyK+5cmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8468

For a setup where the matrix keypad is connected over a slow interface
(e.g. a gpio-expansion over i2c), the scan can take a longer time to read.

Interrupts need to be disabled during scan. And therefore changes in this
period are not detected.
To improve this situation, scan the matrix again if the row state changed
during interrupts disabled.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 drivers/input/keyboard/matrix_keypad.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 46873b8..93c8404 100644
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
@@ -174,6 +178,19 @@ static void matrix_keypad_scan(struct work_struct *work)
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


