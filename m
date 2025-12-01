Return-Path: <linux-input+bounces-16421-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E74C977E9
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 14:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 396EB340FF3
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 13:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475973126B2;
	Mon,  1 Dec 2025 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="FD16PgWe";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="FD16PgWe"
X-Original-To: linux-input@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021131.outbound.protection.outlook.com [52.101.65.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972C831195D;
	Mon,  1 Dec 2025 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.131
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594476; cv=fail; b=pe7FLsAzUuD/nMl8NCxM2H81GBGzUxTg8Kf4VyQMtdm99lFP/gG8RN/701Q5KW5wyGYfA26/+RoRTONaMUh7RHxoEMtayVxnUacawrWzJqkJTNYLEW9QO312kFF9i9YzRchz3WwZLWbRrv0JGunhy81qTkAKkg4ZCQ8/Lv2Vqew=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594476; c=relaxed/simple;
	bh=bJv6czjD9oU1spij3uamTG1DONEIfDuHnHxl46Pgnu4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=F98Rp16W/gfoAtGLbBG3ZYbzH1Qbki3q7F4SEmCOhb9pCdi++gJZtbQC+xQ0PVAAvFW57z7wvyyNqcZZTN0q9CCt1w0AepJTELyEmTElUDBK/9I1HJGeIF0pqlrVgJtiTdZojgxEGpGg5t42T/VyJ2m148hfIjkyIc3KCbF72VI=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=FD16PgWe; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=FD16PgWe; arc=fail smtp.client-ip=52.101.65.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WUbdvEip15+nWt4poBTQxveL4i8ywMADeRm119JjeTJF+sxtPGUvCzob1mqNl9qpjRieIEp2e1oEcQfkI15sKUKYnXYiE9jxY1lDRHF2zxrU/4s2DzOju5/AYKZyGp4l6PTkzs0ST7IFkaLrM10I70w7aD3Kc/Fzx5KwtncEVNDQTIyFJe0JAvZz1YF+vV3rVj5IJnaesrQczFF44RXIQtluETrjPA1g1XjDjKTu8lbo8fQUdX/Yw58kCbkUsJGk5BZRzYTEK9K4Ao6OiteSESMWbE0rId5ZxLcvhqfXe0z17SZCntjxzP41KK+CdqRfvz4U7Joq6iXkTt5VjYdVzQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=ls/Rk0Gs2DU5qq3+QPlJAu+iawxPjjtgnuDVKLlFwsFA2c/AoddCh802YBo2UaS0fSXXrF4sFVn25B4+BzoOn0UyEduc4/UeNamKDcBmyIN6y3GtfTbmtqt3XcRebd4ZoCbi5tYATp4pfUYlyK2JO9Vd5rY1tXWNq4xSDidOmsk0R8gUCuDdrAkOdbbOj0JrAD469s2qiTFdnDRn5fVzdpheZvPl1/qmHYShXaOKkOWy15paPqNFh0iBQuNi6xbXIwTyjR0D1suh4gAWWjVbC8y0kHro0GuQzuk5D/vjWZ3hniMXegnRKBbpRiMxag7rIq7nUgTtePOZXxCt4ZCJyA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=FD16PgWeqLN1Uuu/G95ZAFx9OxONbyxXbL2KFmUmxDuZh36BftosKe0MZQ5GAJUv35WxGfREewC1nPfKUDOGOO04KTCeNoe/hqGDy3kd1u9sTQ20Jhp/WePUKoXfnqkXwWh3ptaKTHe8kXNGLJPSNWTwCyxp3GpCz571bvHuzLA=
Received: from CWLP123CA0227.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19f::10)
 by VI2PR04MB10570.eurprd04.prod.outlook.com (2603:10a6:800:27f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:48 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:400:19f:cafe::3e) by CWLP123CA0227.outlook.office365.com
 (2603:10a6:400:19f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 13:07:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 13:07:48 +0000
Received: from emails-8290778-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-226.eu-west-1.compute.internal [10.20.6.226])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1970D80116;
	Mon,  1 Dec 2025 13:07:48 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764594468; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=W6EeXsR6qd3IGzYGzXw9EWf80QpA2COsYKwD2LHTeRx0fEfX88m2ZHfP4MgtXynBHKn5l
 4knVX+hy5BLHauXlMZjwPLC3eOwx+cYCTYejTOwMcEuSoiji3MDnLha2QLb5AJNHSbKO+mS
 uv1St/jPCE3Sq9Z6v4sa9FZuTjMELTk=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764594468;
 b=IweKNYyjq4ZvYclUxctM/nr7/CYqeZKeAxDzfEhxHzAC2vBo8ORw7kiph9YW4fSxhSWWE
 WZ0xgHnRZmttQxAyjAw21nqNYPK+K1gi3TjyGQKBdKlVZxNJClF4P9FkRcUSFHTt+8HkCb6
 ZhbG3oxjv/SkActSMVDTtADoJ5LMeZo=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmPSCxV6tQkR7pQdjz499l9rMEEX2oF5eyKrlroqTst0nlBmtVPVGYU3g0qJyTjg/YvEIfoUZoe66BvIJHvML6Jqm5cs3OpkhpUf8P717dJhMlFYuenRBwkbPnSVtJDnAxx7XzbY6k6WF5XQlZtAgB2I+HPRVUklpWepA9/V0uQKbui0tGaRdgvdve9/I4umgieBOGhooEaSVh4JXsCXXso2NiQghWcE5h+efK1JnapfZeXBC7b+4GAFubzO/9jcxm60PgKAXGQAy4COnSws4LdwdnksBOujq+5LD6eJo5q6ODvHgwb0rc+fatjlugzi1K3QMLQVl49+GFNCM4pxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=afh0NnKZIioyf6GMuumY+ZiaYo+OMNCzzjvN+eRRXslGiv8Nnt4m4kySGhFS6MkCu1EWDLpRMdWo7uiWjk/wXktwxE3M6vRSpAMeJl5JaCCH8aSgDLfnfn7fv7Q4XyjtQxUyRoxl0htDaac+bnfecrX1iR+vAhO0MT5oUs5EXDTyA7gCVYLjOoH0GwAbj2b362ViJEmvvwJTbg5InLKC7ETmvghpKN+MGgh7aCOPxZhrZIUrkORqK4R3ib3rnVLoYBu+Hk3jGDcKMp9Zb9WO7rvA+XS72uzMLEJJEmZW/b3YKpikfCa4yvjUj1NCMdPKrct2lzShsBUZlj4s2ZldYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=FD16PgWeqLN1Uuu/G95ZAFx9OxONbyxXbL2KFmUmxDuZh36BftosKe0MZQ5GAJUv35WxGfREewC1nPfKUDOGOO04KTCeNoe/hqGDy3kd1u9sTQ20Jhp/WePUKoXfnqkXwWh3ptaKTHe8kXNGLJPSNWTwCyxp3GpCz571bvHuzLA=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:35 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:07:35 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 01 Dec 2025 14:07:22 +0100
Subject: [PATCH v4 3/8] arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix
 vmmc gpio polarity
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-imx8mp-hb-iiot-v4-3-53a4cd6c21bf@solid-run.com>
References: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
In-Reply-To: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR5P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::10) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|AM9PR04MB8844:EE_|AM1PEPF000252DB:EE_|VI2PR04MB10570:EE_
X-MS-Office365-Filtering-Correlation-Id: 828c6860-4612-488b-7fa1-08de30daa05e
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ckN4b1RLS1ZPMTQyY2Zna1pEaDk5dStCbXBCNXpaQ0R3azgydjBuT2lKSG1i?=
 =?utf-8?B?SzRrdk1wRnBHQ2NrKy9sa3hoOFRodFE5eFdKZGlKQTRwWDF6WWdnUVN3ZE54?=
 =?utf-8?B?VnhMY0habVpSWnpTMXBIakdycUpCdUVLbElzSGpFMm5KQXBrWmFtNU03dDdJ?=
 =?utf-8?B?SThlNy9udlQ3dFdUVmlWU1E4NlhzZE9HcHowUDZOUE5mTmd6WThvc3NpaHlq?=
 =?utf-8?B?RmVTMlZIVS95T00vdFVDVG1yaC8vbmorc3J4a2w2MTVvYlluZlB0anNOZkhq?=
 =?utf-8?B?cGZFaWx0Wnk2SkhyNzA2ZzNIYmxBMFJiVk0xUkR1VXJLeTh4SzdmQ09PWEdj?=
 =?utf-8?B?ck1IWDlCUE85Y2tLdUhOK0s4bzNldjNWK25rbS84elNCaVliTHdYVjM0VEN5?=
 =?utf-8?B?QWxWT1Z4ZmhTMFR2NVVhbUt2UUZwbTFHbTB3aW9NK1ZEaGhpTXJMd1RaNTho?=
 =?utf-8?B?MXhvQTZ4OXBJVkQyTE1FT21ZYjlvcEJTdXVIUFF4bzhSWTUrSzk2aGFjNk93?=
 =?utf-8?B?czNyWDdNbjFId3JSM1NReWpoS3FsOWlVdHpxZTJGVDEvTGxwdDh0RlBHbXhl?=
 =?utf-8?B?b3EwUmNHTGQwV1VaK2JHWVczU3FUYTk2dXR2TGd3TFMvd0krRWNrTHFacTYy?=
 =?utf-8?B?aksya2J3azkvb3VJOTl4SlBiK3VlNWJ6S1VqdDc4eE1zM1EzempPYVdCbkVR?=
 =?utf-8?B?YUw1Tm5qNlNaZzJXdFNNUklEdTVmYm5kUVJvRlBVdEdKc1JCcGRnbGs1Sk9r?=
 =?utf-8?B?L3oveE03cEpQenltenFGbFZvQVRKR0c1YnY5M1JqUjgxdkZudVkwUm8yTVpY?=
 =?utf-8?B?S0dXR01tcmY4NUI5UEpLeDU3OVZ4aGN2cmpKWnM4ZGVTYndrRlV0S2hnWThN?=
 =?utf-8?B?QWU0elNYMW1JR2xiSmZYenplWkRTUDhXd1U3dlhTSU5RbEdKOVdKZkk0VHdx?=
 =?utf-8?B?MVlrS0ZMNkpWVXdMTGFsdTh3UkZxTVUrclZERWpiNGFBcG1YamJ2Ull5RHo4?=
 =?utf-8?B?TlJBY01vWWNWL1AyYktVU3RNVFRYOHd1UlJrM0g1ajdRWnNpVU9ySHByTUE2?=
 =?utf-8?B?WFBFOGM1YkdPbk8wS3o5blhVNktlYTB3TktQUEVkTDRlVG1vbHRXNmRGZjVR?=
 =?utf-8?B?dUtBdFliSWFpNFpYYVo1bkFpZ3lPcDhWajZPUC9LWVl5TjhmdERMTTNnekVv?=
 =?utf-8?B?UEVndFp1SHIrUVRqeHJYQWRXdDBzNWYvU294UUI4UVpJclI1Q2FBNXNTbVl5?=
 =?utf-8?B?WXV5S2RHM3VCUTRsazc4M2NGczZJU1lHcThPc2hMVVBrbUY5cWRoWEZRQmNv?=
 =?utf-8?B?M09CY1FQcHRKWWRWYkxIcXVpak1YWHY2dHB1UGREaTcxOWJqOUMwb2VuRExN?=
 =?utf-8?B?bnRRemdGRWw3K3hiSWxDS3dCSURXemRwS2g0RGVUa3VJWFR6SE5jZkJsUWND?=
 =?utf-8?B?ZnYrb3FpYXRYUGFnc0ZlenFLTGpxQ2NKYjZxYk9HaFM0dlZKYVpaazNvcHh0?=
 =?utf-8?B?VlJmL0o3QjF5L0xXa0ZkTTRaRXBIUXFHbWd1TU01QUxoSTJIMHVDeXRtUDEr?=
 =?utf-8?B?YXpuZVlQcjRxVnEvYXNCK1p6N1c1dllQZGxEclhYZU5mT1BKczREZVNrdDFQ?=
 =?utf-8?B?YW5TRDk2NmxrcFZYeWhsOUVvczlWSU4wU2hIM2ZrNlhjeDZMM0xxV2lhZkN4?=
 =?utf-8?B?WS9LbmI5cXQ2bjRDQXduRkFqY0FGMlp6anQxZU1lM0FaQ0FnbVpDNGx4WVEy?=
 =?utf-8?B?bXozb0RBVldLbG9RbVE3cy9ma2twQmVIS3FtNE1TVENiMDFBNWJ2ZkVIZHN3?=
 =?utf-8?B?c29TN2hiaXlRYTNuN095NDZCTVBhdnZ0MjZCejZFdy9CWVorQmxGT3dUTmxq?=
 =?utf-8?B?RUJXNlJFakhHMjJpSjlHelhSQ2dZMENtMDJGSjdUNmdXRmMyUDhzRHFvSVQx?=
 =?utf-8?B?NjlCK2VDNitRbmpQWXVZMXY1TXNRWEtDOVhDcVY0TVJ3V3dXWnd3YUpueXAv?=
 =?utf-8?B?bkJFRDkrSHFmSGR2clZJTGR6SFZYbGtXd0V3NWRrTW80bERsSnppWGFPMmpp?=
 =?utf-8?Q?+b/iIe?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 7a6eb6fb5fea413b97a4a6ca61356a47:solidrun,office365_emails,sent,inline:af0d6bc8e97772f40903536e75100953
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	60d0b281-e985-4733-4337-08de30da98b8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|7416014|36860700013|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejVCSGJvNDhKSElnYk1tMkt5VEpNdzRWTEZ4b2tyaFE0YmdOcFlyWm9vbEY2?=
 =?utf-8?B?VUdmMEgzZmlhNUJwdHRuS0gxQnp5bUNPUTNIZkk3RWxtK25Ic1BKY1Q2WndW?=
 =?utf-8?B?NjFNTlRvRmRqUWtPWXVSbUc1dXZvMDEvY0dKWnFQS203NnFLOFpZRnBRRHV6?=
 =?utf-8?B?WDJLYndJNVFYUFBxQVV1aUtrbExSNk9rc1lhN0t3OVVCNVNVUnZvSWNnMmNB?=
 =?utf-8?B?WUo3eTd4UDUyZmRRQ2RJMkkwaWN5STJnbThDUnpPa2hjTDBOak41YXRmRFRK?=
 =?utf-8?B?bkZLaVlsNTJIUFdWZmJQZDRsK29zZXVmcm4wNS81TkpmL3FRWHlRaXd0KzlN?=
 =?utf-8?B?K0lZeGdRS0VkNmNHczBGcHFTckVXVVBiUmE3UUduMG5OTWx5Zkw5ZCtpenRh?=
 =?utf-8?B?L0Rab0FkZ0hGWnA5dENNK1Zod2w0M2RQTTJudUFERkZYR205RDhzT0p5T1l5?=
 =?utf-8?B?Rk1sWDFia1pTQ3UwZzY0RGMwUzlZWmpNUk1RbURFKzFEYmRvV2tnZGRyeXlG?=
 =?utf-8?B?VWtGR0QvaVB1cG42SFRzWEVWN1dZNk5LdE9udFM2V3RPd3ZkZXU4aTdnNG1G?=
 =?utf-8?B?VGkyeHpqM2pJcFdZUlJka2tNS2RabkZrRTVrQlo5TlRDTGxBWXMydStEeXpv?=
 =?utf-8?B?VjNjcnM2QnpLWFJYY2Y2QU9JMmc2aG9HVUdHTW42RVN2SkxmKzZQSmorNkRI?=
 =?utf-8?B?WUtqMXI0cjl0VFAzR2QzSnpLNEltM1FPcXVUOTBZZ0xuS0pwdDhaSmRCUGcy?=
 =?utf-8?B?Rlg4a0E3V0JaZkMwN1ZOVjV6dm9ka2ZxZmR5ZTM3M01JRTl6elVUVTdCd3hh?=
 =?utf-8?B?TkE5M1p6MWdpVE1ubXdKTlgycndHSzI1eGZteWo0MGljQWEwOHpkbUE2VlhT?=
 =?utf-8?B?MlVEQk9zMmNrcktaTE9GL1JOd08yRktpYkZlVkZWOUZkMCtMdGx2VXBBVUVK?=
 =?utf-8?B?aHNvMExtR2hLQ3EwamJobmI2enlQNUdRUU1YWDdQSVJUbGtRamVwZmJkd2F5?=
 =?utf-8?B?S0JhRjJmc1VnSHhXNGdiTzl1RHFNNzZLVzNHSGNHaUNjSy9hL3VNNDZEY2Rh?=
 =?utf-8?B?TFhhdmw1cmZtUjlTeUM3cnJHTHpPU3FjVGZXTC9BWGd6ZVhOOTVQeG5LSE9r?=
 =?utf-8?B?bUJ3MDRhOU92QnNZQnFRdkJCMTBkN3lMaTJXMytoKzlqSC80S1dmTUpkc2N6?=
 =?utf-8?B?RmEzdmFjSkdKU1I2cDlZOFBzUGdvdkMyZ2lxYlkxSjArdTZjSldtSFNKa0Vz?=
 =?utf-8?B?WWgxc0RBYmQrZkRFbUhvN3FteXVNRmxCZzN5QmJ4c2lRWElYZnpsUDRvVGk1?=
 =?utf-8?B?NmxMVkg1NCtMWVlJb2k0bnEvOTlvZVgwQ2JkRGwrc3VjOE5mTE9YVmtnUHg3?=
 =?utf-8?B?ZVBNSy9vWWhhTFd3ZUM1OG5ncUp2em5FZkxPbEVxWnRsRmdRZ0VBcjhVb0pS?=
 =?utf-8?B?U1F3WWNaR2lEcjNjdnRkK0ZiRWUyNVpUZVV5ZWp5N05hcG9IMzROQzlleUhs?=
 =?utf-8?B?c1FKcXRIU1c0L1FKdkJvQW5MSG92bXQxVjBMQ0JiYVV2RTY3Q04zVTNlWG9r?=
 =?utf-8?B?TjVZanhkUm5QWFlqQUxvTHZvSlBhUXNDbEJscDlKZEpYL1owWVFBU0pwbjh5?=
 =?utf-8?B?eFhRZTY1NlJoL0NYSDlVNXByNU9ENVJrS1RreWs3bUY0SHB4SnBXeldOOWVF?=
 =?utf-8?B?Z1NZWjMxSWNEUUtKWnlaeG8rVk9VcGsvN3J0eExMKzFPbjJLZ2xVWkEyRFgy?=
 =?utf-8?B?Znl2OU1WazlDWVUzSHhKdXZZQXNibVJDa1pSTDF4TEU1Z0ZiNTZ4c3lPL3lF?=
 =?utf-8?B?RWg1dm1qSWRlMGRVTURseEpxMkwwRkIzZ0s0ZkttRm9aK0JaRm42czJ4UTdH?=
 =?utf-8?B?ZEdwa0NXK0UxMWcwd1EweU1GWlEvU29oTzNKQXBTOHlwTHM0OFhHVXFKalRx?=
 =?utf-8?B?M0xiVnMvSUNOZzlobDBTV2plbzdKM2RUeW4xTmRreEExWi9xeDR5WjBvY2w5?=
 =?utf-8?B?bDlHVWRQOW9tRVllN0l4OHNQQjdKcjFhSjE3ZUR3QzdrSVpQODNVN1JXV0lY?=
 =?utf-8?B?SFhGT3NXNUtrR1NjUEFOSmFRQW1zR0JrNzJYa3VpWGVEUGwzeHJDTmFXYnpI?=
 =?utf-8?Q?WXmM=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(7416014)(36860700013)(35042699022)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 13:07:48.3727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 828c6860-4612-488b-7fa1-08de30daa05e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10570

Fix the polarity in vmmc regulator node for the gpio from active-high to
active-low. This is a cosmetic change as regulator default to active-low
unless property enable-active-high was also specified - ignoring the
flag on gpio handle.

Fixes: a009c0c66ecb ("arm64: dts: add description for solidrun imx8mp som and cubox-m")
Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
index 8290f187b79fd..7bc213499f094 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
@@ -68,7 +68,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
index 825ad6a2ba14e..5b8c8489713c4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
@@ -73,7 +73,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 

-- 
2.51.0



