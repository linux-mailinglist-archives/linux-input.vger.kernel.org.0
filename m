Return-Path: <linux-input+bounces-16420-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C89DC977E0
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 14:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3ABC0342BB9
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 13:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F231311C13;
	Mon,  1 Dec 2025 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="nZI48ovO";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="nZI48ovO"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022132.outbound.protection.outlook.com [52.101.66.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4526F310782;
	Mon,  1 Dec 2025 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.132
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594474; cv=fail; b=P263ScKhnWfr4g7egQFI9VxmTLdLfALSw6ADWW97dfLRwaSmtLpkRwiIoYwbhzrNgHbK3BGP4GjOsj5h/z6lpxg6W/lqgdD95QtaEB/Qb33PJREHrM39bMiWMo5WNFc+fRrby5RsWDDmk2iK+V55l7ilhUmPVgeaM/KGBCaceQw=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594474; c=relaxed/simple;
	bh=2MfKhbs53mUFk8mRL907ZXmsTcUnBg9oBHloK4eeTrc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=vB1NLaI9rO6i6Peq9coq4wbZRvJ5LH51ML9buaMOx8jYXZuY8HdezVXWidlS82mHEBmUQXNrucJRl89BURn1yT0pUnKYTJS+6FEiYf/7JRaKA5vs3MZow+67uRvWRKmO8TfijqEAwouEYA8C5dPuNs1dI/PFn4JgTfYtY+OaaHk=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=nZI48ovO; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=nZI48ovO; arc=fail smtp.client-ip=52.101.66.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UrIz1e0KZrijqfoGtcKcXia/dY9mTmLW8nqrnFYCwjayGgakgMOqDoSq4UbBGPDWUkyLI0CyHXeAb3fmw6hgmmoL1CHiym/NFPJG1asLBGkvaGdgKRKbxQ80vdH0jDmv2Hphh2xnDSBwXMiyfA0nnK9jgpIOig2uqmEpsU/WRIl1v2snfx3+CY7e84NyCeA6neReicuj1Fv5dDU6T9+Ce2nZFcz5ooa1cs8axTGO2Nxusxo6AL1hqRgNFM246b86641eRNBWtQQaH1CVd+vwweIQ20fKsYB6Ja1UV/iHdBsfWmWaShdBbNZDz5npbagNVlw7RIZAxXKoJktVBhslgQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=vLvhO2ztXb4Oi8Ka4K9RUkYmppsv/W1IXy4Y9IeDSegPzFbF5P2x7/v988YxVXpbIc6BU9v7rfnetoU1K+urGabMEa/jlV+efkUkUWRv1QIY5J9JYXM0HbvWdrDH7vB2fNMtYmlas5cDh2i394JR4IUTBj63E9DGVIpI6bmFH+CAGZSIlPeISxh7jwTuUfY9JcPJYUk2K7pdmKVTzKCXTQHqLPLNQ9ceEtjiG0DjhK9vCly52wJPHImsGfqaw1Sj5yAEw3Duqourm1YRQRIhaX+34OpfBLbvFgDkWphaVOaCOS+ZyfzDov0f1GtqANwewAkvHNSfeAlRBLZ8mTVUCA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=nZI48ovOhh/Gkp7nYhMfO7RzXY3R8k+o+mhG30cgLh8X7mvmkzGr49XqGFCz5Wm926ZnAcnCa+DvwcXaVKauxG8dGItpKh9zuoUY4pMl3wAydjaIkpGSMB9CmMIQqopniiEkGFRlVZYsbZhHzeKBXGiaxP0glMMJGWc0VWOy3mY=
Received: from DU7PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::26) by AM7PR04MB7112.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:49 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::ea) by DU7PR01CA0024.outlook.office365.com
 (2603:10a6:10:50f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 13:07:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 13:07:49 +0000
Received: from emails-7584991-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-226.eu-west-1.compute.internal [10.20.6.226])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 6833A8013D;
	Mon,  1 Dec 2025 13:07:49 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764594469; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=AkvM0NADraT85MU5utvL/Gf+bgfxvEcHb7oyiaJvI/zdOvzj+m3rTsmIVBqSRbBlh4LWn
 BkLxF21X/m4W7XZ6GTorQKt4TqzdaqVyzcKk/gV3JqDu/ACzqrfUd7GD49GtwKD6lqEw+Fr
 dXiLTv7v3Sv5xQmYgXdWFFFNLMpUGsw=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764594469;
 b=JqQJuUdGGCMiqD6sGV2DhDpnnV/EG9wbDhzqqybpP+kAUScRXUYzvbKNwnj2f0BUb4zuU
 QCZzSiGSjVJ2kYtJPSXwv15nBavsc89c2+Wb+cQj8irqQIjPA9WspMAitszhgd1pZXxeXo/
 F6bFpreVZBJ5pvNw2Vsj0yMalj35CHE=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5afo77jt7x/e44zP6FLq1D49hamP3kdrbvnN4tzpESLlq1gpHXSfYIHMTbcq47D4s3WRuX6uiRyzIqXGm2znM/8SX75288yCGbnhV3sXfF1U+SZ80bJJGdNxKmPXzKE3WXbUIsknZyT8KMZTPqk6Z+qeM6h62jXkAJUwXB0v7CPS0mP8CcMqKJ/H7gER8T7wKjqZHkN+CptH0SqZHYvIgUWVW4+5dNMgWRqgwrPEM9N5LFgGotAgHu98HJkuRRhOyUAlE8KyQuLPfulD5YjcmLnDJQY4AJJOtbOjmYHePQGpChLHcVg8LPliNfTmINfOa9oLsO7XhOQVqOG84daRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=okJz/yCYbfkXdAesCtHpfXoofzgif35vhkHQhDSxtzmJMVow7NLWXkuwGuIluNE8Y4yUjREf311FE3mwUkcbv07Mg5DtRQLvi3b2kJu0+zMrMwDn/ZCu266PRGPtJUds38n/Rb2B4Ilc5z8SlFxviFRctl8qjEgzfXZXftFAJbSF0mnXCn7F/6Y5fl9OR/TlAz04SqkQxX9rLrpAOzAbDfj2ygQ/ZOviyBZIvDmyLr2nauVA7ckpElcc9jyyLD/VLGUnLWJHPHzaoUU3YXLZxg9G+vCqO7s2flDfqoUSdCHfond63sZhJ83XL19G+z/OPdmz48nkHtiTXem4MAKloQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2D+Y40ylXIIqWy1ZFDjZkfoLG/wxwceSle4+LK7rK0=;
 b=nZI48ovOhh/Gkp7nYhMfO7RzXY3R8k+o+mhG30cgLh8X7mvmkzGr49XqGFCz5Wm926ZnAcnCa+DvwcXaVKauxG8dGItpKh9zuoUY4pMl3wAydjaIkpGSMB9CmMIQqopniiEkGFRlVZYsbZhHzeKBXGiaxP0glMMJGWc0VWOy3mY=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:36 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:07:36 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 01 Dec 2025 14:07:23 +0100
Subject: [PATCH v4 4/8] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-imx8mp-hb-iiot-v4-4-53a4cd6c21bf@solid-run.com>
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
	PAXPR04MB8749:EE_|AM9PR04MB8844:EE_|DU6PEPF0000B61E:EE_|AM7PR04MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e88ea7-020d-4e1a-79b2-08de30daa10d
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?LzQzUUNZTmQ2Ui9ucjRPK3U3WHI5aHRxZXk2cklGNWo3a3QxM0k3b0xlZHU3?=
 =?utf-8?B?MS81L2NjVmdPV1hrUmdEc0tNd2QyVlpCOTJoaHQ2KzZ3aTZsdlFsNUIvWEF6?=
 =?utf-8?B?NytyZEFBbjZYS1JTcElEckhoL2NrRHBuVm1yWFhZV1dSUS9hc1FVd1BsQWF4?=
 =?utf-8?B?dHRCZWh1M3BVK1AreEJFWVVJcDBQMWN3aXJnWGRDUTBHQjJkZTVLUDBDNmht?=
 =?utf-8?B?bkNpUTd3ZFRaMmlPb3BWR1dRWGplRzhjU1ZmeENTM1hCVnVXWWlPRG9JaDR0?=
 =?utf-8?B?WGc0NHhTVWxpbU1aeU5OeGNIeE5TVVN6YW1DZFlYdjFGOFpIWjJESG9zU3ZQ?=
 =?utf-8?B?bll5YS9KWkRaTUpXTCtmNnljdktQSm1uTHpIY1hXMnY3NFBXUUo4bGVWS2lW?=
 =?utf-8?B?UUtwd2x0RGFETkIzblJPTy94dkNGK2NOT2tOOEFaSHUrL1NMRWEvbzE4d3VJ?=
 =?utf-8?B?eW1UUi9JK29JblZocnA4V09BMnkrTEFWaEltSWFnL0swQWE4NTFxSUI4OHJI?=
 =?utf-8?B?eGdZYTFZVCtkdkMzMzhmYUpJMjdHZVNqVXBrKytDMVJTMDFjeG1RZGM2SVdr?=
 =?utf-8?B?ZXl3aUZxZmUxNGttdlY1Z2lWbS9NUTNNbG5ydUNOMy9ockE4eEJ2clRmemFB?=
 =?utf-8?B?YXBRNzRoakRVVHVjdlFFT2hTL0RibzE0c2tXaU9HZ2grZDNSRDZBMXZhdjcv?=
 =?utf-8?B?eExoSkVDTDRaWEh2WXN2NVFWc200TmZ2Tnc5MEVWQXNWU2tnVnNzZkRKc0Vp?=
 =?utf-8?B?WEdnQ3BUbzloWHNrYXZUUVIwSkdiTXZ6NlNZbGRuTGk5emJQY2dPdVpjMjVM?=
 =?utf-8?B?ZEEybjNoUDNCZ0NUVWJjcnFtajQzdk1EbWZWa3FmOEE4cFFCN3ZrRFVtaEtN?=
 =?utf-8?B?ZTVOejNSU0hXMGsrY2oxQXFyV0k0RXJUb2JKVk9aWmVXL1dxWHFKeSs1cUh1?=
 =?utf-8?B?b3F3WU9KUFV2L0dMTVRDV2VhWjNsNSsyckJTV0NjVTI0UW51VGpBM1l4OVd0?=
 =?utf-8?B?ZU1IVGlnR3loRWtCUlNZNmh2empITmh1Z2s3Mm5tN3JkQkdFYmJqVHk2MERt?=
 =?utf-8?B?Z2srUStZVjlPWkdjaDNkUitkaWxWSHV4Um12aEVDYXluYjI3aU01TUxXSzlK?=
 =?utf-8?B?MDVOZXBRUzV1RGdUK0RiYzBwRGdGZXRleG5NN2VibFR6YU8rTmZQcGM4ZFdl?=
 =?utf-8?B?QnhaT0FIMG1iVllrVm84eDRBcXVIWkpvQXBMRzJxNkM2UmcrRS9USCtFMHhr?=
 =?utf-8?B?dDA5dGR3aDkyaElwVmxNekowWmg5Qm5JeWtYekQ5UERDbkxRalhLYlFPeWVr?=
 =?utf-8?B?YXkrbVJuVlpsSkVoVjhTUlZwMzNXVU5Ga3lsMWgvZ3g1QlZ6VXJtbGdXZCtK?=
 =?utf-8?B?Yi9pMGZ6cG9KTnJ2ZDBtaksvNEdlVVV1aTBhOE05N2tnbHJ4RDgxSmdLMGJu?=
 =?utf-8?B?eG1uK3J1K2tEdWFyeFRWZUJXUTJ0aC9PbnA4MWNBVWcwUlRqVDZ3Z05sb0RF?=
 =?utf-8?B?QXVuVWE4czhtaXBucjdVTDB3bzdJYnpoVjhycGlVN0VQMDQ1REZ3ZFBKUGsx?=
 =?utf-8?B?NHRBTUxoN2ltaDFrbE1RTmgxT1FtNHhSb2ZjTzBUQmJHcFJxM3ZvSDdnbjli?=
 =?utf-8?B?cDEyUGhjbzJIeUVVU0s1dVlvVi9JZEo3U0dPWEVoSGZwWWFlUWNPYW1TbGtJ?=
 =?utf-8?B?ZnZEcW1seWdScGFwVTdscWhvK1JJbGF0OTE3Vi8vUG9VR0ZkYVozYmdEWDkz?=
 =?utf-8?B?aFVVb0Y1TWR5TmFzejJQa2pkcE5nMTZ1dDZ2Y2ZEZnA0ODdDSmVwaXZKUUFC?=
 =?utf-8?B?N2ZxRWhPZWVqdk1ENVAzWnd5dFN6ZlIxeGcvNEZQRG9Cbkx4N3ZRRzIrY0gr?=
 =?utf-8?B?YUtKS1ZvaE5nZzRtZXNTVnkxbjhCZHJYK2x3VXpoZ0NzMG9qUDh5K1YyelFv?=
 =?utf-8?B?TFFtRDRWTGJQRVJwZWpINkx2SjZrOVhWNVF5SFFQaU5hNlg1SEJiKzJmaW1j?=
 =?utf-8?B?K2MrdFZFZzYzMXpxaXA5RHRyc1hPMC9uSnMyZzJydUwyekR4VWdZOW1CTHJO?=
 =?utf-8?Q?IabkF8?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 56271d8b0d364f74a807a4cab2d38bd6:solidrun,office365_emails,sent,inline:af0d6bc8e97772f40903536e75100953
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	93bea42f-c48e-4c36-4c21-08de30da9916
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|7416014|36860700013|1800799024|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzgyN2JkQ2lPdm5Zc1FvVHZqcVllalJUWWZsUmd5aW50Rm9xM3lHMVZXK2Ny?=
 =?utf-8?B?RG8raGhUOXUzT2p4RjFubDFjYncrSUNjOTF4dnlrczJJNFNZcm9pZEpjMHhT?=
 =?utf-8?B?ZFRSQlRKczAvbUFyU3dxVjFaZFVNNFNvakRrb1lKN1pHYTBocHVWTXRWVGt5?=
 =?utf-8?B?QWNWQlBCZDFZRTNyZzhxTU10R21VY0xMSVZsUElrb0MvMzlMZE9GYlZOUGhk?=
 =?utf-8?B?dnE5RlVMU3hzQlQxQW1tczJweTBEWVNHYitrQjZieEIrbUNuTmw2TzloNlNn?=
 =?utf-8?B?YjQvcUlOMjdNeWVsaTA3cnUxVkhjVWlkQTBlL29KenlQNWovWEdRZUxWOTBF?=
 =?utf-8?B?LytnclcwZ2NYZS9qU1FtMDVJUm83MndXNkdDM2p0Z01vcjgxc05oUW9OT01k?=
 =?utf-8?B?My9JTm1sNFFhQ09mQzB2em4rWXR6VlU5UW5rRE01WENJbUVvY3RDZVlHTCtz?=
 =?utf-8?B?cDh2ZW5veVFqaWFUQkFWRzlDdXRlZUJ0TzNIWmRxbGhXNi9ZYU9DaWYwUGMx?=
 =?utf-8?B?aVJrNG5hTlI0YnNTWjhiemkvTHJtRm9MZ2EwTldEWlhPM1pFYko5WFgvWXZV?=
 =?utf-8?B?TWN5dlRvTDQ2cXZDNWIrdnVhalNZQXovWjlhR3IyUm9MQklXSWtmanU0dTFI?=
 =?utf-8?B?TUJtUEJQY2k4R1BRYzd1STl1QXBKRC9EdXMrUGErS3lkS2o3Q3ZRdFJSU2U1?=
 =?utf-8?B?c3Q2SmVKYWhTa2RwdjJpMzY0RkZEeFVSaFpIem91ODY0ZTlpRFNTNzNaQjdG?=
 =?utf-8?B?VStiUUhIR3B0U21SMkhzdzcyczBsUXRuejlOZzdpWU51RWpTYzlLNFhiYzNl?=
 =?utf-8?B?T1Jzdk40dkNPV0owNlFWcE5Eb09kRXhuZ0ExMEJoU1U2NzhTakxaZEhaTDI3?=
 =?utf-8?B?ekhocnZrTTNZVmVUSW1rc2dLMkFlMDYxUkw3WDVRNGZYN2FhdmZoVHJuT2Y3?=
 =?utf-8?B?UkZhUm9RR29jU0Z5TU9FUVRadnFJT1RkbGpOZnFHbkpmM29QOU1xbW9MMnhs?=
 =?utf-8?B?TEQ3WXBrOGtiSDlhaUVzdkRvTzdKbDg2aTJYMWJqMGdPMjlBbUt2OHhMWm8w?=
 =?utf-8?B?Z2Y4SVZCV3hjU3VFNzE3VEtLUkszb1lTaGV1bEM0ajh2NG9abjRZcVJLUTh1?=
 =?utf-8?B?WXpRSFBSSitrUVNnSDJTSDNjSlNHYStwR2trdFpiQkNsQmtWZTdJWUY4VUE3?=
 =?utf-8?B?eFM1bUl6ZUxYNDlmSktoc0w5VFczOGkyVHpDZG5MTklOS0Q4ZHRpMHpGeldC?=
 =?utf-8?B?RmFxZDBVV3JKelB2UVBwRjZGbEw4bzI0OWNjL05Xd2diV2M3QzBqV0hIdUVr?=
 =?utf-8?B?YzdYcitheHUwL1A0Y0F0WUhVUk9ycDkraWtOMFhFQmV0OEh6S3dpbXc2cWRr?=
 =?utf-8?B?N3pRaXNwUVdEYWJ0RTU3QVBJcWxweDFNczBENlQ0c3UzSDlZaElZcFJKelJV?=
 =?utf-8?B?K1ppRkdhdHlYZ0J0cWJRMmg5RWRKa3N2VFV4b2FjeEcvbGQrSG54eE93bVIy?=
 =?utf-8?B?a1NrYWI0VTVIN2hXUmpNVmdRTkhqZWM2cTlSb3Y5UERjWjM1SUZuczc1VE1W?=
 =?utf-8?B?b3lRelVVOENJdGNCbTFuV2U3ZTFmUGNKdzJzYS83TFhzYlVvamxGYXE3UGVL?=
 =?utf-8?B?ZCttbEdoWTNhR3NOYVJ3R3FES25KM2tHYmlhdlAwSEk4MDNNbTZ4L2EzaDFp?=
 =?utf-8?B?UDkxeThJeno4OWRHVXBheXNrZVdQdlFwQVN4MUI1NTRpemNwZzJTSkxMSEhF?=
 =?utf-8?B?cWdkcHVmbHRMa3h3Y1Z6NTU3TkxaREh0cnY1elJlSmZkbkw1REU5TlZ0OUlM?=
 =?utf-8?B?UTN0cURQNXJZeVMyaUNRK1NOckFWb3Nha1k1N0dRRDNQQ3Z4QUEvbnhwWDhZ?=
 =?utf-8?B?R3hVVDE4OTRhdTB2TjlZNS85UVJYZGRRZkNSNmxxUGdiWkIreXNlSzZQNHpN?=
 =?utf-8?B?ZDlNbXlHVzRrS1hoS1FyS0lFaVdjcGN5ZW1nS0MrWmJnNzFmbGx3MEthT2Ex?=
 =?utf-8?B?emFZelRpQTUydjJJdVFrVFI5b1JGdENJYzNXc1RGejZUcEQvOWxCR2dqWG5R?=
 =?utf-8?B?U3NBMVJYNG5FUDVxM3NvdFJqaUJiREVudVovYzVoVUdoeVppOTBwVGppdWwv?=
 =?utf-8?Q?dTag=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(7416014)(36860700013)(1800799024)(376014)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 13:07:49.5775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e88ea7-020d-4e1a-79b2-08de30daa10d
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7112

imx8mp.dtsi includes a default port@1 node with an empty placeholder
endpoint intended for linking to a dsi bridge or panel.
HummingBoard Pulse mini-hdmi dtsi added and linked hdmi brodge to yet
another endpoint.

This duplicate endpoint can cause dsi_attach to fail.

Remove the duplicate node and link to the one defined in soc dtsi.
Further remove the unnecessary attach-bridge property.

Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by Josua Mayer <josua@solid-run.com>
---
 .../dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi    | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
index 46916ddc05335..0e5f4607c7c1b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
@@ -41,7 +41,7 @@ port@0 {
 				reg = <0>;
 
 				adv7535_from_dsim: endpoint {
-					remote-endpoint = <&dsim_to_adv7535>;
+					remote-endpoint = <&mipi_dsi_out>;
 				};
 			};
 
@@ -71,11 +71,8 @@ &lcdif1 {
 &mipi_dsi {
 	samsung,esc-clock-frequency = <10000000>;
 	status = "okay";
+};
 
-	port@1 {
-		dsim_to_adv7535: endpoint {
-			remote-endpoint = <&adv7535_from_dsim>;
-			attach-bridge;
-		};
-	};
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
 };

-- 
2.51.0



