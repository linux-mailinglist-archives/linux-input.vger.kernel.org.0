Return-Path: <linux-input+bounces-8996-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5D2A041C1
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 15:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAB3D3A67DB
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 14:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB9E1F892C;
	Tue,  7 Jan 2025 14:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="DfD95fVF"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA321F8F15;
	Tue,  7 Jan 2025 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258609; cv=fail; b=mFidtq5DxoInOVCIa9xQLlKciOiQ+aYjY1nRrTjR91AJF2JOeYG0/xAFnm7usCMzIzxpjOjKPiaR+q4u7+C3BckXRQ2fX/rf49sIC54goEsFN69NWRCdQKqVfOsnamyAYdiIODfdhbGxx2Dg8plqkbvk/fIR22YrX8wFAPVhBOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258609; c=relaxed/simple;
	bh=Xfzox5PcAJY0Vf93eXYbjU2/B3WWS3ocjTDoCwCZ4yo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mqwj6r7KDMkWqmMfeUIgJup/PhomyjEumywqkg9sZDGj23pqTDj8cSyYdtf+0H2K9GY1w7kZHNsBeW/qIgYyuamb8yEV1+J1KDFSLpjkitvMwwzQl1qGNF3xd/jgwp/oQ5PV2wV3SCsZNxjdRFWauO5i/LBurvseEhL+uElZe7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=DfD95fVF; arc=fail smtp.client-ip=40.107.22.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCKc3CkqNNv2P7jHcN08MrY1AJIvBZPadGX/07g4kITsCDABjxVevYtQT1+bNlTUvrPEIATyIR9Kp0qrRcOMJziNbHATxSEK5+Q530n2JI+emD8yXPtn9SZrZh4Mp23hN2nGrASyTnjnSYA49gIyp7XxwJD+f6L6GR6BV4ZS7w26pPf74KUIR/7zQ81KCx+6TEsN7ZW1o1g/v/uwonUo6+cWt82aEsxb2gEyL/dM3HixA5UbwJje6qfBcGZRi4kQ1NF+MslkUTc2672YqsB9/YL+zikhGqtbLI+8xWysOZOjtoVs/j2HO3JKUHqc5ZQbK1zLFQSPdyq6y5WqxgdvlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZI3BvU8z1GIGEddIcbgkXGABPLGMCgmwctzoeViF9I=;
 b=iERUV2iv9B8k45Cy2NWZlRydJEaKcdLlFr1wE1qvBZRofAScER4QMtQPzbjp5bgCflXFlsrD4W/m1kLBbifsK2HYTnxSpanq4bU3DPLmj2m2hiS4cSNIMwNX7Ggc066E47pKuHmS7AyyvTKAbn5ucWoxgRZjmHuElBkuxAi1GRPlej5CUg/y3rLtkJTp+6JwW8Q34kEk8D4DMszGDCKYe1dSCTrfmXX01XeTc8NLC2k0VLxwhkXGcUoRixa8Vy4B5EBkDT+r0TVLtbpGAMXOwAL26lHkKkzA1NRobFNRvi/HSShoWqZrp2Kk9hnBx/4I5rQDAP4RmfbiRIUfot+WGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZI3BvU8z1GIGEddIcbgkXGABPLGMCgmwctzoeViF9I=;
 b=DfD95fVFPDyiAKkgIdmPSsGAARB3A+O9Zhqz+/xQe9I8dJHpHuEtrJq02cRYbzmBLpaQiZNW5JepK9nNEbGER0ZsnqtTIl215RtIaTrA+tEbga+gqZ52xBQDTyscZCaHOI/4yJJ0Mq7lQShs7Xi6gdLmvC+WUN5+OmhoWRsndYM3xqtNwl24exBUD3ONLOHgNSFzk/Swd0pK4A7HW+WHYlLmGS4tb2WYp+5tQbCmt/b0a9r99/6dHatnziwyb83o+RmdN8p/OOJHyQW3FlQASkFczT6zT+GTAWZlHsvyinKQZn3oZDFZlReDhYUMv2LO44i4svW2eN5QYqvCgWLllQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by VI1PR03MB6544.eurprd03.prod.outlook.com (2603:10a6:800:19c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Tue, 7 Jan
 2025 14:02:47 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 14:02:47 +0000
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
Subject: [PATCH v3 2/7] Input: matrix_keypad - add function for reading row state
Date: Tue,  7 Jan 2025 14:56:54 +0100
Message-Id: <20250107135659.185293-3-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107135659.185293-1-markus.burri@mt.com>
References: <20250107135659.185293-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::17) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|VI1PR03MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fca062b-4964-406e-56e2-08dd2f23f6f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L/GIvE7QnlJpinBK+GAN3zv9hOHvdMmcZbZSkM24qNXmUPzaoEj5ycLkWqpE?=
 =?us-ascii?Q?HXRLBUqTmqx8a6QdfBiV2OW9FleNCNDIay/v1JO9CHmeOIEbGFirwe1TlfWs?=
 =?us-ascii?Q?0zP9++Zdsncsrwm50dY2eiN7JHr+swdTtTs/iiJjxHeRfqsDrbC757HFNsYm?=
 =?us-ascii?Q?LBHNKjP1qhPZN7L5jcbMNTrsV+H5hU9YOaMza7qEBESaIlMHk7Jg3SvQa6ec?=
 =?us-ascii?Q?zO7V9L7TFF089xDdgHrCZv1zQK+wm1CXBS+vhesAuaBCLMXzEdfWZSs8HkMB?=
 =?us-ascii?Q?ogHMO1LrfbV6+RFs+gIQSMxq23d7LbUr1Yxj9/sHK0k2+aNbEQtHVcWLeWVW?=
 =?us-ascii?Q?E1z7PaYwPgR94JEx/K6XYIJtQXFLG6YQKPlBIVNWzIzBzOkgsREeHVf5l2wF?=
 =?us-ascii?Q?/2YEP/DC8saC8NznT7z5B+xKTIF2+U7Ex3hs6B1ppcw3yYm+QY3jkGGb9qLx?=
 =?us-ascii?Q?KH+o6UaE5uMfBR3fWUO5Hhtta9y8GUeCz3GEyNKhg3O48cX32HkSbu838Uge?=
 =?us-ascii?Q?7ibxQLHAXAVpwRSqWCMPm0ww28M8YoQwDwQjNPqu+KdjfxUxd3Sk68qsB4ex?=
 =?us-ascii?Q?8F4iVAUymDnEkUiCoz59cxemFahBvV8Zvhfk5p3qXa5xLtEyeJH6AxySuNHB?=
 =?us-ascii?Q?drtYg0gbJbJXZ2TLeuTRhC8ixfNlw+qMjhcQhiT/DcUyEH0mlzt7JMtHTGEV?=
 =?us-ascii?Q?m0ukT6NOikri5Ly1QFfYiwh/xrOfYsIIZueKbkXcaYOvPh8lAC2xWqsXe7eV?=
 =?us-ascii?Q?MnkQTMlOEzT7DoWMgeX8bqrrysnHH/Ig3zoFwUJL01DGArLHc94/yLDJOf7X?=
 =?us-ascii?Q?R58TcRgCydjbtgF+NF1F4An2PLFWJJCknOQStq+ch0ToqfttPBlIbw59BZeQ?=
 =?us-ascii?Q?Pr1xIxW+gce4Kq1s9vniYKId8UYn/Q/Hicri+LJOTH5zyLdWOHgDKsTrt7GB?=
 =?us-ascii?Q?3DHtkwxAXUq4zgVluBBlOboYVSPuuh6Z/Ku1abGWL0uoC5mHEE94OG14kCx7?=
 =?us-ascii?Q?qjG0SbVaRZ+ER5nFHe+bfmdpf2PUjeHTUvQ5ajAj4cRxr5KKEkd0lS3r9HIF?=
 =?us-ascii?Q?KI4R2xfeBHU7KSDBcPkOD6G1Hho3G8hWJnwk/LFFFFBR6USxGeLDd9fyR4AA?=
 =?us-ascii?Q?pEvSwIs5sOZoEiFCMFw6wws6Rqsh/2kS29juVEv+enj589ysi6QPBFwMPxVI?=
 =?us-ascii?Q?ezlNqhaZkVFn7tAB3Dn/H8qn7C/XIiCHTpvTgeFhMLHL/bWu9wxkRg4rytC7?=
 =?us-ascii?Q?BMYD63JR6tV9ZFNMuHy/D3Ab3CYhEWZQJ4ADpg6pfDzCp3l1YevVRUdsZKNG?=
 =?us-ascii?Q?7B4IZV/sD10IriLZxZEs1AbxlssWzjIChFthDI/LZDtMdeBW/JZUQ6D/05gN?=
 =?us-ascii?Q?wnabAt3HIvaexK54kp9WQPuD1bS7Vn5aEsYaVp/eRMx8DkQb0J4xg7zX7Va4?=
 =?us-ascii?Q?8jm0WYEOxYbXn1LJXofaKBr07IL47NOA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aY02L6UL/dmlNOgsDKwPUwxhoSRVFeVrThJMclEkPLIVmGmi2YXl23EoMyKC?=
 =?us-ascii?Q?u03hGg4TsSmTH8MXtVnSqIIos+dONoeQoEJen3kiwT0//EBkSZo2CJz63xQi?=
 =?us-ascii?Q?RkRDGJt84t+VC4BRzyjUR5g2nd1CgRgAdzg9RfVttnvI/3NPSOPnUGXwytnB?=
 =?us-ascii?Q?uTm/9vYAnB2GBOPpscKy/nq6iNg+OWP9e4DuO8vjtu56+dgjlcgnNCkUQJ9+?=
 =?us-ascii?Q?AeuTQaWyD1Kmn8tBrJPD8bVA00py0w8acZF4+z+qMp9Nc+kd8IIV7Wk/e/QT?=
 =?us-ascii?Q?5ovdGk7JFiTW+WrZDNazvy9zOJ89uvQ8F3JSZICbHhcchITUdus77bC8CRst?=
 =?us-ascii?Q?AGJtxtZnEoNHyy5heJnLQJgBviaL5TkJONDJeyU1IA5kPtn4mkG5Sa416/ku?=
 =?us-ascii?Q?PQy/04oCzRXYe1eGgN4WXmalIgsvVQVtZPciVjiyV80T6iJMUQFdrXpOfDKB?=
 =?us-ascii?Q?9E613aLFcA02juYzEfsKXiuFa2sNMFw7mXvmlRwlHHd6JpsSeLVtuhYd0hvc?=
 =?us-ascii?Q?aAfwBNa0kuC1E3hJJd9F8zuTb9cRlLtm8gKrNWYgQk2fxMt1SwuccI60+BSK?=
 =?us-ascii?Q?CUKGKRz10hRTVTtZV+pdRj3vzJHF+VIFVf4Vs81unhsEbosRcpozWJZSlLIl?=
 =?us-ascii?Q?BADMolbX5W9rQWipT4bibs8bcVUHAkfo4af1cwHZRcVa62VN8fYtFXJ7pUPQ?=
 =?us-ascii?Q?qAtjylNdN+C5G4u5dkEN5kz+RYgo4WwY0XqB3d1FN56XGfkSP0aAvrDWVoP4?=
 =?us-ascii?Q?uD82dY4BylG0P0/sYjntbT1msV8KndVBmUbLvWS1CGvfFxwa4uNjRjjUrizP?=
 =?us-ascii?Q?0hu1TWglSM8XUsYmkRbbsDUu9OABoMf6pp2SBVu3TjohE/iTD0NwD2Q5TDiZ?=
 =?us-ascii?Q?VB2EWEXP1arTgEgPaElJp9ECLwU7uVj3/Ibem8A+ApYk/ns2tBlVjX88BZ4n?=
 =?us-ascii?Q?9XzAYpdHP6FB0rNjQvGPjGDEU+le/G8KMLHK05AMI0lUjmnUCxKDVg75fyGR?=
 =?us-ascii?Q?/ioYCiDeTYrjZaw75LKnyJgAPfIvPrb0oJ8K3WQ7CBPWrq03QEaZZxrCtsO3?=
 =?us-ascii?Q?lCjNnaw6XRqxe8wrLrOFmc+10WzXi2cHCK4eqYByUDCqKOyvlbRd7VZvlLdT?=
 =?us-ascii?Q?YNoINcdm5WX6QQ1OA6z1wVwDQUSWtZayZMnxv2IRRp1p+x9rd93Pguaw5t9k?=
 =?us-ascii?Q?lxUMVX+NbX74yJlm7gJvt0+MrQoFnUbuWHI3cmSjjYhLzCk6VmGSvOVx6e6i?=
 =?us-ascii?Q?MHUUTOpaLELIlpuMFK+ymvKNZ7iIIvFrlEVCfxG8uvjKPJZQSYVYXkX04UeS?=
 =?us-ascii?Q?WuJ5dBQnplY0HWhnlO1nEujz86NgUttCu69S29e1oBDd8uLU8VKfKKWp+dE5?=
 =?us-ascii?Q?ZmA0SM2ZNWfeCbi6PhEvKnK4GPD6y25v7wguipUqUXshMfM3LUfRY2E+kSMC?=
 =?us-ascii?Q?eKlcPDE94SwVRaB/5F8mYoC5mdSn7IqQznqp+l24vOfeIKsoxXHkopoN7JWk?=
 =?us-ascii?Q?j+mYDT9hPznmx5k9D8lmw5ZX29VHNF4F44yBhmJh24lNEFWIKxlGv2cCZ3Al?=
 =?us-ascii?Q?haRQvA3DutNkCBMS4Pg15EsvUFsG2NpFsBDS/TBJ?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fca062b-4964-406e-56e2-08dd2f23f6f3
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 14:02:47.1018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YV+TZmtcxypYljbGOCmuLMR7FJuCo15HxxbUjNC/CXO/YYWb4sYsqbvdDJdr0mdmrQXatG+j5OlljPBFeAt0OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6544

Move the evaluation of a row state into separate function.
It will be also used by a change later in this series.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/input/keyboard/matrix_keypad.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 5571d2e..90148d3 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -100,6 +100,16 @@ static void disable_row_irqs(struct matrix_keypad *keypad)
 		disable_irq_nosync(keypad->row_irqs[i]);
 }
 
+static uint32_t read_row_state(struct matrix_keypad *keypad)
+{
+	int row;
+	u32 row_state = 0;
+
+	for (row = 0; row < keypad->num_row_gpios; row++)
+		row_state |= row_asserted(keypad, row) ? BIT(row) : 0;
+	return row_state;
+}
+
 /*
  * This gets the keys from keyboard and reports it to input subsystem
  */
@@ -125,9 +135,7 @@ static void matrix_keypad_scan(struct work_struct *work)
 
 		activate_col(keypad, col, true);
 
-		for (row = 0; row < keypad->num_row_gpios; row++)
-			new_state[col] |=
-				row_asserted(keypad, row) ? BIT(row) : 0;
+		new_state[col] = read_row_state(keypad);
 
 		activate_col(keypad, col, false);
 	}
-- 
2.39.5


