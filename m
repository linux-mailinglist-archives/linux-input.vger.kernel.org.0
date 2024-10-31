Return-Path: <linux-input+bounces-7792-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F809B7494
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 07:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 150C81F252D4
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 06:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42271474B2;
	Thu, 31 Oct 2024 06:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="KcHxJL76"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013026.outbound.protection.outlook.com [52.101.67.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961F813DDAE;
	Thu, 31 Oct 2024 06:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730356264; cv=fail; b=KrbjcFF+6BBsDQbGiAArlpc3YtLCupmul0JOqZiEdhjy6bWK6QWrEwQISASWmJaHDTMU8Lx6rTmtDDsn/qMtirrUIhnHpHzBZULqeGr9EabiR0GLZ5XAYVe7Ua7tiJM7329wMy2WU8L+1LZ8rAtJpHqlQ/G1X0jaQGUo4USrJ0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730356264; c=relaxed/simple;
	bh=SLiygjteYy3D9gMTmdomf5GpacK9XT+u+eebMlGsj3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i5wJ86RIeGwZv+pjJNw85BSHsyr0+EaJaVpaaR9+faBffeUI18lf/b6pTiYbeaEOjq1XQ8QxlU7qKM7BjLZA4ugMHMFqJJ3a1jX8+658CKQyBeUZDaaaT236KN/oqxIj2hWr5TCEPCJf8pkHFxzWXEJ8HtAB4S2ZPfN10uCuav0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=KcHxJL76; arc=fail smtp.client-ip=52.101.67.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHOowlrpOtV/eR6QIAlg+hx10hwRnXXia+W9PuCcpIe4q/We9vWRobhiY7eR7DmCTJs11LUwzdtub9XtM00DR3aKJDpEZoutZJBwu55XiqlEctNgFCScez9lyKV+ReelyIhvZrhpjd84f3Xb25I7aWLpBfl2KaW9hk55eztj4fnALeuFjjDT/z+ea7HTbqX8mYKjw8mFEpZwCXxOeIp71PGIo4wsUQdcNGM2ANT1wiLEC8fdG1b6AwcRkjsDJH/mbn2e4PXsgtFP67J1TWFcl7AERgho29k+KUTcyHMYT+QD2iwB628te3Wb8ziN+Yw+ARheYzUW0G6YsenOuJgX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgGdKJiKCKSfW2OkGCQhkNI0k9EPY4wttilOMOkC1r0=;
 b=TOoZDL8TsLdh3fzLXdY/dnbajovAyp7isGRNczea9mDb1ahL6R8ouovS98kTy2MMBAOqrVA8D+9UiYTsflUmieJY+S25ZRg7hYm5pNzSpP2MEPTCPvtzyygtWgqoPdX/xtYHE4TRCN8C6a2rvu7P63Tk+BleH8BEc8gRkMxuRFEdMTdBLVuSvE8sFkIY0xUmu8fuYJTZLQsRImEhwxj+zQZSaKaajuIaW1677grecGN39UhnffMDSQWZULoctTEm52TKoYSyaf5IE815HAMZIlsH5ziUzraoxNSoAKZgYBX1nAhCS0boonU3GxpkBi9BShU+cw7S7HipRjBXUhqvrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgGdKJiKCKSfW2OkGCQhkNI0k9EPY4wttilOMOkC1r0=;
 b=KcHxJL76z8QkznfYisCF6JcaV1qY2IQOG53UwUDgF4JsY6KeLyow3a5zW0wthF/8E5h/7NSyWF1VyHA30VQbojmrCZyNOE26sM6g5BqCWKPIzbPgjUrR/JIfszMyRZruGaB8fRlT5o6OFEz4TqHxwTvTidyAHgeGLY3V9y1mjxmYLUnNrNPvJIAqUXaQr6n7HioPa2P9noll3wlbGogoh7a+n4EvxiUOVKCoINrFg6sRY1RSmXOCWqklyOgyi3/RVoz665erpnrKgyfz5Hy5JPAeK0quhhmXLsJC6zkY2JsNsSTBQb5b4yMjwDgQxz6M7JYTRsLuUnHNS7fDUMjwDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by PAVPR03MB9797.eurprd03.prod.outlook.com (2603:10a6:102:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Thu, 31 Oct
 2024 06:30:59 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8093.014; Thu, 31 Oct 2024
 06:30:59 +0000
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
Subject: [PATCH 4/6] dt-bindings: input: matrix_keypad - add settle time after enable all columns
Date: Thu, 31 Oct 2024 07:30:02 +0100
Message-Id: <20241031063004.69956-5-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241031063004.69956-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0015.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::19) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|PAVPR03MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: a07a9efb-30bc-4baa-1877-08dcf97595a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d6InHlKxIBXJ4dBx3BXdeHY8HCaPtTwluChZBlSN9pj9EhnbjoA0lcZB69TN?=
 =?us-ascii?Q?w/BCe0LpDjbw9M7mbmVN3JLrGZOuqFlf5wK8wHrbRoJqP1Q8hbogG4BCBgkT?=
 =?us-ascii?Q?KkDyKJSRe6gZQfLton+3eWmaxAgneB2jjZfwwtBwwo2hwfmodc6Kfln3MGd2?=
 =?us-ascii?Q?VoVnvrDEFWUUHn6Akfi3P9MfyguVuwrjyE1wyYiIh9ZvDvYCdBGwVwkjZRH4?=
 =?us-ascii?Q?MGOKINfJiwOMXNpyiNdGz+DmwAOPY5OQj3IjJV+me3J/jSdQ3T9i9R2NtEmY?=
 =?us-ascii?Q?VvNnCMpDJfM2kBInpzAu+/GuYcZzVk2c/ev8IlmnsjXuBLddEk9v8ptZsaBb?=
 =?us-ascii?Q?q4xSinkg3smCJz/Ytv2/UM46Fevgd5/RMg64guUwBhIkkJDc7l1KcEtGLQKn?=
 =?us-ascii?Q?Lfu+Lx9auiG5ksCke3SORVaxv4W00lY/5pSqDE72J7l7m0za2P6buKF3l4rC?=
 =?us-ascii?Q?o1sBy94NJsBo8zQRReToIFLzINrnssTPi0JTZHiC7B4VnWr+MFVh7m2obbRF?=
 =?us-ascii?Q?eICQrw1XTAZ1U8sBJcG3MhfW+Uz3PUf1Yk6VkrGLqnFzW3Vy8VyQd4n4s4AH?=
 =?us-ascii?Q?VAQklu5XVysTfp6JRWsRJaUfHbqkgD88t5GXK1ZuR06C0FZxsM8GHedVPFwj?=
 =?us-ascii?Q?LSYsj4MgQFEbACXzexTSYL1tcSHII3plrQbZJ41tZZ7CGJf9wCQpRfTzJZbJ?=
 =?us-ascii?Q?Y67YYE65ptBv64tNU0FMbAjbaUPGf2cMU8JvFIwEfSpR3GjJIHTFg9xywnqg?=
 =?us-ascii?Q?bHszXheS7uVW0ETDi+EU76g4Z46B0THCJiU9n7IxCJhjsq2jiy8Bcl/0Dwll?=
 =?us-ascii?Q?gWTw/Qh10hARLzZSGmnw33550OGvT5Mq1NLZY0AmENJQ+nAh+Y7Ve3yj6E41?=
 =?us-ascii?Q?BT+6tEsRwED5BL/QCqpO1EJ4duCEVa939ep3Qo6Vl+jXZasyENnc21r0nTj8?=
 =?us-ascii?Q?QZWR501dPP2rndAkEoVS5RvhR/EpaFpoP7L1KZJZXyfziWh4Zn1mSr7ns6i9?=
 =?us-ascii?Q?+eiQ+aeIyra3mzLNvH3NPiVlQLADA5zgOScCfQFmSXxendY2b+0NXpeIB/78?=
 =?us-ascii?Q?xDx5rWqbGeR86mj6NXcqg0N4tGVOB9XSxPCrLj3RwPwgPdfRXasyfXrRGahs?=
 =?us-ascii?Q?M7JAGxUU+TrSS49aSKZJ469kEa1qlL3f55/oq+NK1euTjWlBfmhomom79JcG?=
 =?us-ascii?Q?QPhV8YDwANgImoiPoEt25fQCXwbNh4gaIIRhIfufnMVwdiSQjkQ5iBdfy/GB?=
 =?us-ascii?Q?3PpBAlxWvGXImO9KssIfT0LIN0i7dDzMVhkTnH5wEDByARya+tcFHMgaIYfH?=
 =?us-ascii?Q?LzvYG+3uNr4QOpic9kX8lRx8Eh5kA3+SvRscLG0nMDucHcdNoMp7KxwvcrMg?=
 =?us-ascii?Q?cSjTJZU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z+woOE9cnOzgQKdtDaX0c1oj1WU8lydo6yBeEWdFohI+NADTApExhlmw1cCz?=
 =?us-ascii?Q?qKUHWhA1NaIuUD1VHNknCklSlbS14S6/vAfy9Aviqzw4UoZzWWFJdRGnu9tx?=
 =?us-ascii?Q?v95ihZHNmcpo9VyBqVX7SFwhoFAIjleQCjksbwPIFfFHEV42dOKXS/Tn9yNe?=
 =?us-ascii?Q?aTdiy2RvbD/J469zaPej+LIZUQP850tF24fZf5qIwb4nx/z4Y8ZCKtYOItg0?=
 =?us-ascii?Q?xQu3uQUzyI4Rkdfc8wyAqiZgUV4Y5COA0Mk8woL9ZQC2pFkaGdVgepYpomMD?=
 =?us-ascii?Q?1UElO48AKs8zVp11QIed4DXZ2n5UYyO6tNpEZcM4cpAG1QDja2P/fopDEDhW?=
 =?us-ascii?Q?lbLzvyTL8QoOvO0RF10fLKfn/71aufAUFh5Gga2sWoOsloy7KDjPwrwQurlv?=
 =?us-ascii?Q?ASPnFAqKRBBG+lKO3kLXpbz1ifsAJ72FlRig54S9qTwROAF5BSl1f+ld4mWi?=
 =?us-ascii?Q?8Czl7S1jaPycjNiTWKIVkbGeX12h/WegcEGR+mfwn736ZdsBa/MWBk9cdRun?=
 =?us-ascii?Q?nBAzbr219F2PuyWJQB1San5mSgiKZT+1qEOp9h+p0gnRAb6mwIJ4+d7nDw/V?=
 =?us-ascii?Q?7zhC/wvgmu3QzfsMOt0e8h5/9D4clV3Nf+rId0pyPjOm8htpQ6bY/PlUShB6?=
 =?us-ascii?Q?6lRXYXMG0qsWZj2YnNFpBybIj9XsDIlxDoqBIVi06UxuoSsnNwev5uSV9m5V?=
 =?us-ascii?Q?KjKSuPoEpZljD5x3+XE/zS4uRLAi1g4sGL3jro612o+IZRoxAmG69mWqL7M2?=
 =?us-ascii?Q?l52WS1cuFEMBqlV19HdEzXwLu1EJN/lc3dR1JjgsEsVSJEmUBFH1m4kUg3KR?=
 =?us-ascii?Q?OtKrvTV9mcktbU2+jtuzHLHoeIvQntMK2Wqc9BV0x8KNljcsIvifwF5W90dA?=
 =?us-ascii?Q?6YJ/5gffShBdcpmIi1wkCtta46GogaXzWrOw9LKGi0aQosFQoHw8Df73hdot?=
 =?us-ascii?Q?ctr5qTGrFWW+pdYdmUDCUj82AYp2bziSwILgIwH0vybKdFiW6YtCBLYmnIks?=
 =?us-ascii?Q?6eqrxeTqpctDOmvV5uDXeg9f3wJgKOxf9Lx1Pyh298OpYWARizHX2+EbJLFG?=
 =?us-ascii?Q?5F5rwzvbOyIHRqgpoxl8wxjUFWXn/8nLm3gYROU5i2GNg0yHHeqY/dO989QB?=
 =?us-ascii?Q?Kma1tp5Mj5+2pmgzd1JgjX8aIuHksjwkUzoJdg7RzHNOIyKxqA9uRKUZKaNN?=
 =?us-ascii?Q?giNw1i6XJB8ucb09aN29nctK9o+CgrMUe5Hj52EX6HURzpwqV0p0T0CqA+XC?=
 =?us-ascii?Q?C/HTPxmk+ocn24+jH3mrDuDPNKkU/MzHwNdS1WmMuBpAVBSNwM3IJlsXrmXj?=
 =?us-ascii?Q?Sr1JnW4ZlVWBrZfr3vp5du1s8FI4NpUnpYTOBjOA52t+hIzDons+2DfWnwNo?=
 =?us-ascii?Q?a76dXbRXhR3kz5oRz/QM4RIlz5bbaQdktBafzvg/v9HRit4p6YFLdJSc1Pz5?=
 =?us-ascii?Q?BUsDUhi7niDRIt41sE4ieYtHZpYwO1Kjc2KpceW0BO4EY90334I7aISHJfSa?=
 =?us-ascii?Q?wOIvvZ6P9Dli6bV7+R3c44LaZhuL5ZtrBZShjrmz8avaSbyuQlUXgH8NFyVI?=
 =?us-ascii?Q?KHnEwwpbM+H0ve2OnSU6fp8M+yVnkhBtwvE9Aknt?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07a9efb-30bc-4baa-1877-08dcf97595a3
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 06:30:59.7947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLFujr8LpeXJE0IAm1tP9jISKjNz6mLOsmgQ0saIdn/lYQTdNbV9JV1x80CSePP0i6pXptp5cUfPE2iXQgm4vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9797

Matrix_keypad with high capacity need a longer settle time after enable
all columns.
Add optional property to specify the settle time

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
Tested-by: HeDong Zhao <hedong.zhao@mt.com>
---
 Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
index 570dc10..cf43fa0 100644
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
@@ -24,6 +24,8 @@ Optional Properties:
 - debounce-delay-ms:	debounce interval in milliseconds
 - col-scan-delay-us:	delay, measured in microseconds, that is needed
 			before we can scan keypad after activating column gpio
+- all-cols-on-delay-us:	delay, measured in microseconds, that is needed
+			after activating all column gpios, default is no delay.
 - drive-inactive-cols:	drive inactive columns during scan,
 			default is to turn inactive columns into inputs.
 
-- 
2.39.5


