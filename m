Return-Path: <linux-input+bounces-9130-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 994D0A086F6
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 06:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93844169313
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 05:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB882066FE;
	Fri, 10 Jan 2025 05:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="bHs5D3mN"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB382063F1;
	Fri, 10 Jan 2025 05:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736488222; cv=fail; b=kxa/F8eGF5WnBxiVaybQ99jupbNZgLvKccqGTahKofB91ezZYx/rnWwO7Dvh2HK21QIM2MM0yKQyxgGQ46ih9HbrBBCc93UYoIe862fmpoQd9BVvupXPnOtE4HBeiRomQUDwUNcGPw31Jp/xbk2fhM+oCOOPPYuMrsdPe1AQ6e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736488222; c=relaxed/simple;
	bh=v8k8ugvjybQT9dxu2k0Uyuxpx5+LWRXd0lMgHhFUN9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lbsTTu/N0gl40hkJlA/hlwuKrkon1dTSDPwUzayce9fRA+q+WprqjY43xIAjjWQcP+m36USp0Rs0D8QncPa2kNT8gW7EQkFXutccC2uq+83/k97WJFRy0RQwXPmiqX3rquoFzr/NGiUA67Ev7wyRt8V1/ddgpSEu7e65IVVwuFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=bHs5D3mN; arc=fail smtp.client-ip=40.107.22.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKmWq+/PO/vB6PcHkGNRLIVQYVG/MU/RtDQlPGB3AfgZ9X8fVnbQMGAxjve/i2PlRsHrWUEliJgc/2My0SFjj8Df4VVGKaEDGiU/vtnicDWKb8wU45Qy2TVyxW4P+nt9C2p13vITfDqeSWm88XfAf/fzLCtUL3jJiSpDyhT2uG/J50pwoHgZ/3MQBslJAWwxfN/iKe+2q4H3gUaYTWwlQdLxk85AedXNL3gfI8PdKntOyQl6UN7NaL8Q5IQnFsXYfwjzIBkt3Aq1LnWPBP7F0sY2JNOtr+ttb9tTee2+VwFhDnQqT1PnFCLQ+aKHYqEQb6pI37MKALz1AKNJQsaL/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vd3cgXOZNocABuSffotEqyOPH5w04TTyG8W7gsEZz0c=;
 b=X9tdcQ5+BQ1l/mIZrvHZpUUXtGZ4CXcEC6ZQTJH7jm7e71b3Nzzvo4xtzF9Ha2Jjj8CXoN+oqu7EkmST+VCSeOynnN+CVQjeuJlF1Tctaj4BBjagc92pIDH6DO6+/iQg3Rp9tBpbjM2dzmlS/Ww8tSnIUwLl2esCLnFaFIiCtTNtTvoguzwxJgY/ImoLdCv2dkdNQr3s6KgxQ3I2g5LgtLTD8vqDTGvuq4zBNh+DgTU1NOTIkx/YLVK6UutGaGNAPolwPtALZdWLHhPcJBOcw8jlN7uMkpDjZ7zsD8G3lJv1ZXPVU5r1OQ3p6sjfgLTVzKtk3IUg8FAQXuXK1AVgWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vd3cgXOZNocABuSffotEqyOPH5w04TTyG8W7gsEZz0c=;
 b=bHs5D3mNxQpmnzk4UQ8PoKbW2fyK6dB+PwgD2C1DFM+kyQHRSfKxqyQlo7UpIKEeo9r2omP7X5TO5M1g6bhZSiv1c9EAoJsLfl/7leS93AGKfRElemT+ujHPE0iyDRt+QHY47Auvy7f1Z7uWTReDNkNJ1BwChbvOJKybty/8oVeqHR5kjpwmVpqX20sr6E1zjEp+9PrSQUzdMe9WgC0vv/doPE+zLBCuh3vodUCL5tTI8J2f9Cp2N41Qa9agN0JiZbgyUyS9m7guE9joDK31H/VQALqgOOM0Fet8n2ypI0at8jhfdIGaRLbX08zQqsaxv/0wCoC8Dwyych5TAVmzQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM7PR03MB6435.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 05:50:18 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 05:50:18 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>
Subject: [PATCH v5 3/7] dt-bindings: input: matrix_keypad - convert to YAML
Date: Fri, 10 Jan 2025 06:49:02 +0100
Message-Id: <20250110054906.354296-4-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110054906.354296-1-markus.burri@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0009.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::18) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM7PR03MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: cc22a769-15ce-47d9-8f6a-08dd313aa9db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?POC2QtW0sZHzbPDa4wAp2VDywyrH0CrjEg2JPQ00qgIJUOF1tNNB86O1sLbz?=
 =?us-ascii?Q?zbyGGRVNW+iRXdpC5MDLj93nvqrWAdP32NKYoJVATSZedltc94zIQ/EWIfi7?=
 =?us-ascii?Q?AXyxRIrme3E5dU1ZLMwjGQGiQREnxomcJ7xqTvpwld0jXzER/GDZ42PgSs2v?=
 =?us-ascii?Q?FtzV9nuV9ZGOHuwsmqvNHgX2q1brAF1DVr8NcV4UgzO2ouqQhOsiQp9Ujs3l?=
 =?us-ascii?Q?2xngwvAbFqcqadoxEZB0mWF9MKtsC8kNzB5JAzIxchWiMjAqwTd9jhuP8qDs?=
 =?us-ascii?Q?29JY2ic6AbaPSVArRvGip2FKW2nhBdAGGo23i9vrC/Ri85qH3G10bFg4D34F?=
 =?us-ascii?Q?dTfjy/+oUZ1N1KqQM0Txw0biytjocn+o8FJfzcN6I+o0s6i1RDI0toqypoql?=
 =?us-ascii?Q?RIxmTWE1cd1JlW3G4GfoJHCG/67oPOhHhFuaqrgB9iCt/LphDXUgS2NIrIkE?=
 =?us-ascii?Q?bATMWu9sKol48OfhwoOwaMMOrUt99dMHGq3F+NuJfT+/6cFPXpN5WZhcLF78?=
 =?us-ascii?Q?cdlrJoJ6ztb9bb/38HIqxMKHr6wFs55s2VOY/l469okjh47T0uYogxm0nWe2?=
 =?us-ascii?Q?tX/AABjnDwoPfVK8eXfwZMLOZXAVrCr30GsOATtv+cJ5Zb9un/rFuPBpFw1h?=
 =?us-ascii?Q?bwHMX0Z4yyHmUiivLkxX2LYqlPBPrP5yr7z58x9k0kNcojdpVwSHs0cRbsMg?=
 =?us-ascii?Q?Y9Ev/iiAKe39A4+fv/7iRorkT93kPLUo4mREPncJUe7SniygODx0GSUcO44k?=
 =?us-ascii?Q?hJq4tw8iDFo1a7k2MOoze52IfolJpfGLiVtC2NGNaTv5UpFQjWZ9bQdb+jRg?=
 =?us-ascii?Q?aYg1pGHg9Nu8pkMJns5NR6Ldkn1ownqPbkGfXGHltPQSduyG2EcPSG++TvI2?=
 =?us-ascii?Q?4JDlGedrO94+fKIwgc1ROsMUgkHjJu+eWY2t+9b3Qv1XiVaFDGa86cpMYIBR?=
 =?us-ascii?Q?sqBw1SZ5nl5AA0IGt66hcDfGSdnVKsLGOUzSKeHWLgx3ZOmuKKJNnkluM+OU?=
 =?us-ascii?Q?dAS+y8MzHc/9a+f3cEzVCZALZz5EnVshkTt3Sghx5vaNxydvWEB7AcuY/lkV?=
 =?us-ascii?Q?Bbj+r2WEymKDzDXcXhWSFmsKIwuXezb/nMoiptTdEYGVd/7TCKTK01FSxpZ+?=
 =?us-ascii?Q?wAiW8a0jNJVoSjdRjzCb5aQLYyRuAc7yYJGrAkgupfylkDxrrvs0Q2ViFbgg?=
 =?us-ascii?Q?WkhDhMKBGDnx4+LHS9A3eXEMWTYbOMY2pm8QwYJrdL2Ib06Wyg7fCbrPF1Vx?=
 =?us-ascii?Q?79S1jQ6IOnXkFIwWmP4VgTqzZGMRSpn+O/7OiFGHoZTm6gLegfE9RecC+jSB?=
 =?us-ascii?Q?0NfkEH6nOMMyp8cty8lW2DVzG3G5UpMTM8XdppsXJyrweDe2OmF5orJJSWOF?=
 =?us-ascii?Q?vH+MvnPbElKMzjnRhqaJU+53n++V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tz0SmN+xXnJ2wztJVVU2G57reK8Mjv8kb1tAQ1/xN0Rp1fHAYPy84hj8USPy?=
 =?us-ascii?Q?mKD1nNmWYMQrxGEtbjLeKWH2T3lsmj/oUgPtpqELFtwuEyaGZsOV3ngZE9/3?=
 =?us-ascii?Q?TocDQZD0KTfWKD/p4ILGykAm0xIqNJCaggQmdK1MtEE+dU0frt0sQ5JB9U7k?=
 =?us-ascii?Q?/WBR39PttpPcDL5ri/Q4JaQO3oggMBgUHjLAxQCCOGwkdPxJyhV+i706fjic?=
 =?us-ascii?Q?jpEiJA7rs5ZLG4srpnkQM3Pjb6gO2nEqgVGjcmogxCcrKPlB+15denGmeOlI?=
 =?us-ascii?Q?rbcNi4UAOKO6R3HYgARlpXP2j5hGNvfZD5xNX2KQuzpTXXpsTdd3iTmh64cC?=
 =?us-ascii?Q?xY39JZ0sPIYfZvXNpIPXenDFGAYRDNgwXmlxMIHOLzsRgu3+LD0RPZmP79m3?=
 =?us-ascii?Q?mGdYegxP8Xg12hJLudfIK0XkpeTDru+cWDFau1jHo6jb4m3HnK3cuHQe796p?=
 =?us-ascii?Q?X3Fu8MmOZmBqq+gsy8JRNx2IvD5cZkuHQNvjbWzKYl6lT3U26Hm6STI+MDmF?=
 =?us-ascii?Q?PYkweVCm7Szd4huvABaNuXcawXr/1xmzWikak0TXC/4TJdIqSqq0vitlDVGD?=
 =?us-ascii?Q?k1fwpuA4YxtiKER8WY5b6oZ9Gw1LWexsVbUxHhTHzJgX+9b+yd0fV9dg+rAS?=
 =?us-ascii?Q?pSNq9KWakZ30KK+Q9BRDjS8OmiWq6z13/liqSesuF3HISwTwvsRrVC9u7dXJ?=
 =?us-ascii?Q?u4ZpiWk/q+5QojmK7auZC4tNSUUTOYmoxEN+hTCF98Af8HmdvkyH4rcQJiLQ?=
 =?us-ascii?Q?A5ajey3kNoqXUyhH2suTtLVE+5GpcbcPUVzQIoq5XjAUahs9zd8XelhXPRh2?=
 =?us-ascii?Q?sFNaLZjgUo+tFEdhOkz2fVu3JtKvvPKBWXohlBwiRG6IObM/VjYrbW12ofpA?=
 =?us-ascii?Q?y5GdzQKjwgiGTWorkbXw/EZHnhj7gVncWtWXa7UAcUegAKEo/Ld5Qza9UKP7?=
 =?us-ascii?Q?L4JjTNUfhYh873N/hHe7/H8L00FDHXEkbSJWM7pzSlnHTQmCdB76sQunL6/p?=
 =?us-ascii?Q?l2AJ+IXPbWzNrBybEEQ1lywSD4sp9RQQN8mhxfu7MVffVGQMNqN6+jS3oNEv?=
 =?us-ascii?Q?zUGlJSZOAOqTqy+sEApKT1Ad5bntqhKdqCjcnmOGQ+w8iBQYtDbiH96n+PY1?=
 =?us-ascii?Q?RujasQ2oNH7zY7Rq3UdBrV/FxLa4z+nyiq6ZWT1JA4uvhfRakp/kxH//4ScN?=
 =?us-ascii?Q?OxVCYPeFNu0btyi1FJO9ZWgB3sAtdDlV5+3NmnhsY7BR7+/zkdCYke9pNfZX?=
 =?us-ascii?Q?6m0+5ut6z9hs+GTdfHL3iCNyFQE29OpJkTJkP2shBv2JnDksLK7+HzkYIW2Z?=
 =?us-ascii?Q?33h4LKT44eNph2YOgjlZVWSrRA1AveI6MYz75Mp3fh5nyXlQ1ZRgaA/sfWwJ?=
 =?us-ascii?Q?l79JjnH9npmSDBKwolw038c6pofJyFdQZvF/WyhDDY+8aJdLNEbc4WTaA5cY?=
 =?us-ascii?Q?1yddBFt9aaxJKtor8RnMp/PGvO3nDk0oU9qZc8Y1tvU7qHRBt2UFhghAyskS?=
 =?us-ascii?Q?Tc6ANvxpdXI+d6vGteTdlJiWKEN61d/0QuNXN/wMGYHddmO/XguEvd1b4NEQ?=
 =?us-ascii?Q?KtCsKQx0zK0AWu/XS/dl0DlP7p6PsXOk24iiJbLs?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc22a769-15ce-47d9-8f6a-08dd313aa9db
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 05:50:18.5042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfCiqJrx9eLYHRdtQuXckkitCDo4eUDw5ykGPWgoZB9es7eceo0r7TDjHZZvNY3ZtukpWHRQ2jy483DLufEAgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6435

Convert the gpio-matrix-keypad bindings from text to DT schema.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 .../bindings/input/gpio-matrix-keypad.txt     | 49 -----------
 .../bindings/input/gpio-matrix-keypad.yaml    | 88 +++++++++++++++++++
 .../bindings/power/wakeup-source.txt          |  2 +-
 3 files changed, 89 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
deleted file mode 100644
index 570dc10..0000000
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-* GPIO driven matrix keypad device tree bindings
-
-GPIO driven matrix keypad is used to interface a SoC with a matrix keypad.
-The matrix keypad supports multiple row and column lines, a key can be
-placed at each intersection of a unique row and a unique column. The matrix
-keypad can sense a key-press and key-release by means of GPIO lines and
-report the event using GPIO interrupts to the cpu.
-
-Required Properties:
-- compatible:		Should be "gpio-matrix-keypad"
-- row-gpios:		List of gpios used as row lines. The gpio specifier
-			for this property depends on the gpio controller to
-			which these row lines are connected.
-- col-gpios:		List of gpios used as column lines. The gpio specifier
-			for this property depends on the gpio controller to
-			which these column lines are connected.
-- linux,keymap:		The definition can be found at
-			bindings/input/matrix-keymap.txt
-
-Optional Properties:
-- linux,no-autorepeat:	do no enable autorepeat feature.
-- wakeup-source:	use any event on keypad as wakeup event.
-			(Legacy property supported: "linux,wakeup")
-- debounce-delay-ms:	debounce interval in milliseconds
-- col-scan-delay-us:	delay, measured in microseconds, that is needed
-			before we can scan keypad after activating column gpio
-- drive-inactive-cols:	drive inactive columns during scan,
-			default is to turn inactive columns into inputs.
-
-Example:
-	matrix-keypad {
-		compatible = "gpio-matrix-keypad";
-		debounce-delay-ms = <5>;
-		col-scan-delay-us = <2>;
-
-		row-gpios = <&gpio2 25 0
-			     &gpio2 26 0
-			     &gpio2 27 0>;
-
-		col-gpios = <&gpio2 21 0
-			     &gpio2 22 0>;
-
-		linux,keymap = <0x0000008B
-				0x0100009E
-				0x02000069
-				0x0001006A
-				0x0101001C
-				0x0201006C>;
-	};
diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
new file mode 100644
index 0000000..0f348b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/input/gpio-matrix-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO matrix keypad
+
+maintainers:
+  - Marek Vasut <marek.vasut@gmail.com>
+
+description:
+  GPIO driven matrix keypad is used to interface a SoC with a matrix keypad.
+  The matrix keypad supports multiple row and column lines, a key can be
+  placed at each intersection of a unique row and a unique column. The matrix
+  keypad can sense a key-press and key-release by means of GPIO lines and
+  report the event using GPIO interrupts to the cpu.
+
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
+
+properties:
+  compatible:
+    const: gpio-matrix-keypad
+
+  row-gpios:
+    description:
+      List of GPIOs used as row lines. The gpio specifier for this property
+      depends on the gpio controller to which these row lines are connected.
+
+  col-gpios:
+    description:
+      List of GPIOs used as column lines. The gpio specifier for this property
+      depends on the gpio controller to which these column lines are connected.
+
+  linux,keymap: true
+
+  linux,no-autorepeat:
+    type: boolean
+    description: Do not enable autorepeat feature.
+
+
+  debounce-delay-ms:
+    description: Debounce interval in milliseconds.
+    default: 0
+
+  col-scan-delay-us:
+    description:
+      Delay, measured in microseconds, that is needed
+      before we can scan keypad after activating column gpio.
+    default: 0
+
+  drive-inactive-cols:
+    type: boolean
+    description:
+      Drive inactive columns during scan,
+      default is to turn inactive columns into inputs.
+
+required:
+  - compatible
+  - row-gpios
+  - col-gpios
+  - linux,keymap
+
+additionalProperties: false
+
+examples:
+  - |
+    matrix-keypad {
+        compatible = "gpio-matrix-keypad";
+        debounce-delay-ms = <5>;
+        col-scan-delay-us = <2>;
+
+        row-gpios = <&gpio2 25 0
+                     &gpio2 26 0
+                     &gpio2 27 0>;
+
+        col-gpios = <&gpio2 21 0
+                     &gpio2 22 0>;
+
+        linux,keymap = <0x0000008B
+                        0x0100009E
+                        0x02000069
+                        0x0001006A
+                        0x0101001C
+                        0x0201006C>;
+    };
diff --git a/Documentation/devicetree/bindings/power/wakeup-source.txt b/Documentation/devicetree/bindings/power/wakeup-source.txt
index 27f1797..66bb016 100644
--- a/Documentation/devicetree/bindings/power/wakeup-source.txt
+++ b/Documentation/devicetree/bindings/power/wakeup-source.txt
@@ -23,7 +23,7 @@ List of legacy properties and respective binding document
 
 1. "gpio-key,wakeup"		Documentation/devicetree/bindings/input/gpio-keys{,-polled}.txt
 2. "has-tpo"			Documentation/devicetree/bindings/rtc/rtc-opal.txt
-3. "linux,wakeup"		Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
+3. "linux,wakeup"		Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
 				Documentation/devicetree/bindings/mfd/tc3589x.txt
 				Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
 4. "linux,keypad-wakeup"	Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
-- 
2.39.5


