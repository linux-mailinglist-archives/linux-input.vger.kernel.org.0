Return-Path: <linux-input+bounces-15788-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BB6C16B66
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 21:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E15DF1C25AA5
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 20:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8023350D42;
	Tue, 28 Oct 2025 20:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fawVl2WG"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896C350A2E;
	Tue, 28 Oct 2025 20:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681715; cv=fail; b=HRpB3z/KC4C5U6QwyyI6Bf6cB5PLk64eBLXkn8T9PlYD84Z/EpBQhsjaMG9bpEIqtRQ/tOXAUwVoSCJgcem5ZEIOJOTQcs+q+Q5tLFhjSVxwixKNcUX345zn1+KpZtUL6Be+3p+W87e0iynzGuq66QvRj4sUxzJN3QACJi4zkIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681715; c=relaxed/simple;
	bh=DoX8tCajpYKOUhtRuU+xaPuoYAGRlYqfTAPTAq8Ha8U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=K67BPlxqSkuO0okLmK0PeIzst8xSww652jg5kGYdNAYS7joC1u6CHOu29kjxwFVwBdBxP5B98fxQE1ji5tnxQAR5cFeO3Lh46sVdTxH6G12dT/diFqJvUGTdWQN7AcjXnowqJbug2RSVmcGDysbQK8aZLzpB+ijYXY0XQyVj8DQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fawVl2WG; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yabgnnvYsUNS2VeptH6MBw/vvpD5yiLSX8pHNbocf2enXYOdrI3BXwEKllhayJBIY7JHtDCLPKnQ7l/wslOxv5kqMGj5+1Ey+uy1rB31XagrkvflUqyu7oNN5l9BzOjmSXuP1R7Hlj1vEz0ehK4ZfACjRRbOY35QSaqmb3H0YocKVpgTDwF9Op7FCldxbNS/6tIOeARv31jrWNBYjkaVHjwQRwSbx+aC0k/9LmnvNU7rLUxwn+scmkS7FgoPUJkdNt9pGIZG6c8IqLDQXeJroFsQWBgC4PrkD+VTcUcf10qU0VD6x9wUjKpatFE96y8GBLcWBFijrSm8IdPhouZUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkZ8zjsSa9bJwiT1VtHcfFzYWayBXSAtOaAYrOzAep0=;
 b=Kcz9bJhEgZNs/bZSSHVT9BCX5w+M0Gz5hhXVo99yyWVD1tDNfjlPyZPmdkOhqHpoE/2cHPfSmmRKjdhS/Naw5RyE999wEj4XOA1x5KGEshj7/wASw0mkf08WK4mjGU8iiB6Cu2qZG2p3sHzISFkMz3Sy9eE7ZpdA/II2Og1E3Yw2aKqatG3ajGPRfnA6yIRQPSkcJkmcTPCNts2kNMjPCDiVP6kZqFEtKi9RsTNkOCg3BPQziH2tSblRb1QJuvGqZ8w4WZRe3L7GrVpH+R5Umf9ztQ7sV49Kjhnag+NX6POvaRVL6s5z5rbZhdplZDAxtIzPZkqaAQ8CNiB08Yzlng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkZ8zjsSa9bJwiT1VtHcfFzYWayBXSAtOaAYrOzAep0=;
 b=fawVl2WG+Yxgzr+zBwItM0uIew4URlgyc8TsBUpaoSCjOSC6gqJaplIG7eu8phqAzRPoOEHBsIicalDK+DaDSjk6Ff/QT8Gy2icD69ZlK8xyJK74mhtI0iMuIrg1KzhtTtvDqe4e3iUjrcdG5Ojrdj1B++8GCuJcK1D99F9v1gl7+jeLxKVaWbwN/U9KMekHPcUyF8eiCgWmpc9oipcvktW2idXgz2HwerI1yfpTv8zZFBUlvi+Wkme1T2vLqqfilP0EWaID5mfxfo+bzWA5rBdB4mqbb8BzDowlpDqVTcOc0YM56AYBNsm1XGPJdafGSx+9i202fAan0jTX6cEfeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAXPR04MB9219.eurprd04.prod.outlook.com (2603:10a6:102:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 20:01:51 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 20:01:51 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 28 Oct 2025 16:01:29 -0400
Subject: [PATCH 2/2] arm64: dts: imx8qm: add scu power key support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4_qm_scu_key-v1-2-9732e92a5e83@nxp.com>
References: <20251028-b4_qm_scu_key-v1-0-9732e92a5e83@nxp.com>
In-Reply-To: <20251028-b4_qm_scu_key-v1-0-9732e92a5e83@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761681699; l=1096;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=DoX8tCajpYKOUhtRuU+xaPuoYAGRlYqfTAPTAq8Ha8U=;
 b=h2l86e0FTEemJJdNk1up6a3lM6sigZgDYl/C4+aypdUPwhhDjNTyxZXI+sshpi6+9jVL/7RMr
 2/6dOTUPw62DZih4w30YeCpfByJchcyGWc7VfKrLE06oIi6yeNPI9Cw
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAXPR04MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb533f3-79d8-4572-a103-08de165cd5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzJkaGdWU3NJY1pHbEdaT2pIdml5cm5SbTdsWHFqaUFzbEk1RU5tMVNZV3Yx?=
 =?utf-8?B?SFNXUk5kaVltc2NZb2JFd21kcXdvVkVKMUpDOVlkRGZuVzV1bkdocW15U2xH?=
 =?utf-8?B?aTR5YUt3OWlWY1IzQmFXQU5kdUNMclh2RXhZenoxNGlUZ2NoN1R6ZTdlWTFp?=
 =?utf-8?B?NEJ5N2pCemFHbVZiNzlHUUl3Nkg4RExhazVpbWdjNzdhZ1hKZ0xLZ0NWVC9X?=
 =?utf-8?B?eVd5NU5qQzJFa0lRVG8yeUxKTVBxSnZsRUo1SGllWjU5S2VGL21Tdkp4Z0h3?=
 =?utf-8?B?SHdYN1FPakJNWVhZbkdEQWhYOUVLcmRyek1UWU1nS3FpU0VGWkpEQlNpOGtF?=
 =?utf-8?B?aDlpMUxtQXhQYWhkRzJST3M1dUgyRXgralBnazI5ak9uM01PQ3ZLbjIzeEtt?=
 =?utf-8?B?QnJUSkV6ZEx3T3dkOWFRWG41QkNsZ1RkRjFDR1pUakpVWU1wNldJNWdIbURG?=
 =?utf-8?B?Q3hsNXMxd01OdGZMMlAyQWJCcTJ6Tk9BREd5ZzRNeHRKekxVcUVDUE52dG55?=
 =?utf-8?B?RXRlYXBTVG1vR3ZWdUtVVzk1Q3BSall6azBUQW54Q0NaTWZGd3h0dE02bmU5?=
 =?utf-8?B?Y0EvN1ZTRFNrZUFoOFVOVnpJQWZheS82TzRsQmQ0QitCTFFuNWRMVHRoVWd3?=
 =?utf-8?B?UkNpTFZCT0ozQ1RjdEpwV0Y4R2NOTUNWTWh3aTBoSkRpSkZTQnhGQmVoV2d2?=
 =?utf-8?B?OEJTa2VVTExtT0UrQ3RzY2w4SVZvbWhRU1lPbmhyamVXQXE3U2dZOFpmUWNh?=
 =?utf-8?B?d3F3aUhBcnRZYlYzM0krdHpMQUgxOHNVU1hxdWZHZDJ2dWxDU3VmSE5obHJX?=
 =?utf-8?B?cVhaODFGQlVRZ09BWWRYSVQwTEpoaGZTOXRJZmxoOGdIQlA5a2xHb2NqdjlX?=
 =?utf-8?B?THB5emViNTc3QXJhck5EeGNjODRlcmRJKzRGK1QrdUIwOFhBZGxMQUw5SWZx?=
 =?utf-8?B?RGhqTk9QdzlRaWdGazg1cVdyMEYvNkFsSGEzNTVabWxZVFhicEwrTEI0MXlW?=
 =?utf-8?B?dkpqRnB0S3N6RUdsUU1uQnRVS29HNDFMK0puL0N4azN0NmxLTityQ0dRNTZK?=
 =?utf-8?B?WGx3aWdFb0l6NDhFdVN2Tms2M0lYb3NqRGpyUGE0dGJBQUxsZDRqWGdWRXdy?=
 =?utf-8?B?MkFQZXZTeUtFbGlZOVhkWGRUbnpVdk1xZllNM2Z3Z0tlRmx4cmNOaWNkNkJ0?=
 =?utf-8?B?ejZEUjBsQ09adHl5aDArQ3VGRzB4WDlpbGZ4YXR3UEtxUTk0ZDAvM3ZtaFNN?=
 =?utf-8?B?Vy9YVW5FNndFWmkxL3VpQkNDQ1FJNHgycVl4QXR0RUMwRldJRzVheEpwMlRn?=
 =?utf-8?B?ZHhKRmRxam1aaXJ5Tyt3WVlFKzVqTVNST3VVbkZ2ODFMNWZvNXp0UXk3UGJY?=
 =?utf-8?B?eXJGRnFMMlJCNGNXZTBkTkZmWUNJYXhXMmc1dUlMRDg5WmhCTWFxYUhIWVgx?=
 =?utf-8?B?YzhzUFhveFNEMUsxVE1JdTFlQVlVK1Z2VFk0STJGNEhBVktrTUVVTXBBWU1N?=
 =?utf-8?B?K0UzRUZ1T0c2WUZUL0hJZ0ZyL3lJSWwyVzNEb1RNRlBUMCtFaXVCWERIS01n?=
 =?utf-8?B?UnZ3dW5KSVJKSU9IY29IQkRUY2xKVStHcm9FS2ZSRW5iUWNHbkdFRERJWXor?=
 =?utf-8?B?UHJTZGRaVGtmMU9RQmxaSHFQODNrazdQTDVwY1FEaTlIUy9aTWhqdkJ2RUJG?=
 =?utf-8?B?QjZ1b1RPcTF4eG9SN2o0RGp6WVB6NG1RbUx4ZE1kWjVkS0FTVVVJQ0FDTjhp?=
 =?utf-8?B?cXk3Mmo0cDJGNUROd2JqZ3F0Rzdya3FQODNVZ0tuTDdUaW1TYjUrSkw3U1Fs?=
 =?utf-8?B?S2JvelhVZm9pd2QrWGk2dlM1UUpjUFlwS21kbERtNzBpWEpXQ3dFcHJuelBl?=
 =?utf-8?B?ZTcwRmdwdjJWSmlLbFMxWkhQK3VvdVBBVHRjckEyM2ZYcGJFazVyUHVobC95?=
 =?utf-8?B?WnhwMXU1UTBmNi9XcnkzajlaUUxuRDMvS2dFNlNWd0dhbGpkUHkxUHNqTW9G?=
 =?utf-8?B?dDRkTjR4ZzdNZWhkOXM3M25kVkkxQVFCZkF3VlFzdDdjZ09pUHR5akJJUzBy?=
 =?utf-8?Q?LNixI8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDlXcUNUYmZIM0tadk9WMWtVUGtEVXdGWnhybVdFTXFSdjNIaW84OTJNcGsz?=
 =?utf-8?B?TW5LWnZUaW1lUUp2Y3BBdFk1QnEzU0dmcHpadnNTYXlndUdHYXNmeVpDbDVU?=
 =?utf-8?B?SGxMNGxac3ZueHhOT2RRbmxkcGVwNERiT1Jpa205dXM5VnpOSzZtb0Q0V1V4?=
 =?utf-8?B?TmxEazI1ejBWWlg0ZGtlSWdEZWxDWDdFMGswckhnaVhlMlVFb3V6RzVzRC9W?=
 =?utf-8?B?bVpKYmxCS1VOUUVoTWQvbTMrNEFaOU43UURCRE4rM0psMGZLTFFTK01DVTVV?=
 =?utf-8?B?WEdISEhCUmtFTFd4QWJvQkpJRGFEOG5aOXRhQlhuQ29pRkgyWUNhcnJXYVBM?=
 =?utf-8?B?ZS9JZnE3NmtSL2I3aVpTbHhzb3BxRzVFOG9KNWxScWtRZlVFVUNlbWV2ZmJ5?=
 =?utf-8?B?bWdSUWFKYk5JSHg2S1ZXNWFQYmdQK1l0WGlqcVFuaE1vN0tBNmx3N1VoVkla?=
 =?utf-8?B?NExxOVZkbmhKU1FQd2Nxb1ZsVnc5Z2svU2JUTzN5M25rUE85bnFNWFVNb2ZV?=
 =?utf-8?B?bm9EbkZvRk1rVHJBTXlXTDhjODZKNU5hRDRFK25SUWdZYm55SXN5MWFnRE5Z?=
 =?utf-8?B?UERqZ28yeEVqQW84bzBKNjAzUTM2aWFpc0piR1BGWEtOTldmTEhrQkdiZ3Nt?=
 =?utf-8?B?K1NWSEdJUkVwUHNrZnptK3JzV1VxcXh1Wk42bjlveUdNb3VBRUhWclJoVVJ1?=
 =?utf-8?B?TGszaTJZMDV1RHcwN0M3SFlqaXdteDRsUWJWVzJqSTJ3NFVQYkxFQWR0bHJ6?=
 =?utf-8?B?ajNoNjU1emtYKzFmR1BXSmo2dUZEVVVXQmkxbWlEaXFOdnlBKzNJMUh6bVkw?=
 =?utf-8?B?MTBscTY0M3o2a0p6aDRhVENMdE96Nkw4UXF6aFV3NmJGaW5DektLSkJEWVJW?=
 =?utf-8?B?M0c0L1BFM2NZQzhUb0NpSG5IZjlaU1FFeU9ZQXk0MSs5V1FucXg4MldLb0Fx?=
 =?utf-8?B?SG10NXRvdGV3eVl3U1ZLT25MeHJvN0RtckNWVkRtMVk5UlZyem9PRTlyVTlm?=
 =?utf-8?B?dXJ5Uy91L0NQeTNTdjM5bzZWL3ZRMisvYU5Zb2NoUWpYcVNjVVFRejQrMXlw?=
 =?utf-8?B?MHVFbjVvanMzU2g2dVB6ek9PZU5YK3BRT2NyS2RIYjFLcEFUbUVabGNqWFJl?=
 =?utf-8?B?STNOSWprNm1aZ0tEQXhZTDdwUDd5dG5QR3lGQU1LU0NUZy91SGdFN1lSNEpZ?=
 =?utf-8?B?dTFHbnlVanB3Yk11VklJT25vRjV6WGh4YzcwVTRIeE1aUi9zMmMvcHBwQm1o?=
 =?utf-8?B?Y2Jyd0lmQnBWQTlUQU4rcmZmZlV0eGEwdDlSZGJwZUJIMUdIL0ZzellkTWUw?=
 =?utf-8?B?dlVpWWVRKzhEMFZMUElYZXA4R3pBd1BPYXM5Q2NSMnljalo5d1ZyV3JVTy9K?=
 =?utf-8?B?di9UdFpWUmZ2T3ZoS2pqeXQxMHQxSXFZSDhMdnVyZDIxeEo0SUREc0VQM2xn?=
 =?utf-8?B?bUdrVkQwTVpXYSszQnViSklUZm5OVDFHVkdIZGFtdEhKSTdHTEh0Rmdsa2xR?=
 =?utf-8?B?bnpiQU03M3lFaE5DdEpPaVZ1Q3o4QWp1Smtnd2t2SGIrZElZVDNkT09XNUp0?=
 =?utf-8?B?TCthWVRhWHlyeVNzZEtSNytlb3JvWFQxSC9YUHMrayszUUVNckRNSTJXeHJH?=
 =?utf-8?B?QklzY25zRUxHdWdPUEpnVk00SjNUdk4xZ1NCeUhzKy9ONmNSNnBBWXhqZjV6?=
 =?utf-8?B?aWF3MVBHTmdhZEpQZCsvYks2SDVPSEJFdXVJd2NMUE02Y09CNW0xWVBzK0Rq?=
 =?utf-8?B?SFpUS1ZRaEFNRzJXeG8ybTZadGZ5OHI2LzRzZ01iVG5Ub1JhdWU5NUxCWHFP?=
 =?utf-8?B?bzk2dmwwWVlhYktsdHpraHNpRjN0SDJxUnhxMklobjBvMlU2ZmUyMnYvODA4?=
 =?utf-8?B?bnpwT2ZQREF6VytOSVVYaFdiRG54Q2d1WlBiZXdCZHNHS3dGdkc0c0tNMXp4?=
 =?utf-8?B?WW5KcVJ6K3JHZzE2UzFWZ1crOXdhOGhXS2RiNmRMMEVaODY5enBqUTd1OTJM?=
 =?utf-8?B?ekRSOTcvVU1SK01YSUEzZTFZTzRGTnpZNW1JaHFSVlRrbGdweGlvVjU0U0Rk?=
 =?utf-8?B?cGNwMFIrWDF0eEJQNGRIVWxaWkhUMnYxRERlMkhSdm1RQno0UmpHVjdmTHhC?=
 =?utf-8?Q?SUih6He1Y6iFtMld6aeSxe/yj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb533f3-79d8-4572-a103-08de165cd5a8
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 20:01:51.1723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fozFvWsg5S4TiAw9AiTJtOYobth4FxuRybOmiEjH0UO+Bell1Dq4gxy4BDvnbdx0uhYMLC3qDkNat/UIP2PNWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9219

Add scu power key node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 5206ca82eaf642a32299147e9c1b45704075e2b2..2508a07832810831d019f81d47a8f7042a77d709 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/imx8-lpcg.h>
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/pinctrl/pads-imx8qm.h>
 #include <dt-bindings/thermal/thermal.h>
@@ -330,6 +331,12 @@ clk: clock-controller {
 			#clock-cells = <2>;
 		};
 
+		scu_key: keys {
+			compatible = "fsl,imx8qm-sc-key", "fsl,imx-sc-key";
+			linux,keycodes = <KEY_POWER>;
+			wakeup-source;
+		};
+
 		iomuxc: pinctrl {
 			compatible = "fsl,imx8qm-iomuxc";
 		};

-- 
2.34.1


