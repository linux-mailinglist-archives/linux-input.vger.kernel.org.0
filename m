Return-Path: <linux-input+bounces-5588-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E68FA953732
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 17:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 074E61C2506F
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 15:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8571B5839;
	Thu, 15 Aug 2024 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VcHFN/tp"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB911B3F3D;
	Thu, 15 Aug 2024 15:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723735611; cv=fail; b=U6EHEZ2KHlij4WaXpXCqz2fYLu94Fw5VGmt/cz2OxbIYlawy576QhRvPPffyhS4E+6Xz4iX4Nf1T2PlrrzAJxzW5J823d5WT+d2vg2VkoxAk7UqI4d87xDR5pgRJZPf1ZFbFnFhO0wfrlHUCcySiVSNManV1tdZXMku5l0h2YBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723735611; c=relaxed/simple;
	bh=568HTejvwuplxMDMG70Z4aQ8LeZwGh/Ybkmy7DPh4iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fH4qzpeQR5xeLAOrRIjZE0O8Thsiox7UJPIY46oYO3HvDO7ZbVBmPd8OFX5RvTuF/TslQrVSLklErt1YDZAtVgziHQJtDTebosqEUljvcW8OWemUAS/zFyN0Ug60rrdv/EAZkw9jdDiw6Uc4KfMoJ8YDeLwGynVl95cfJHOVCXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VcHFN/tp; arc=fail smtp.client-ip=52.101.69.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiVGrvjqh0OpJf3bgk+D4OzMojxvytlKp9VTmgfG4w6tDGUr2gExQmEOW3WFRYHBxQ5nnCpkVvhvqJxmcKyTOn3oVhzAD5wLzPmCY55nMHtHGeJLyDd0eyJnKUqjxYVJVIYJQopTKfzkcvIv/a03QXPTDO3w9BRg5atri6en90pMgQkn6WCuK6iZjvSUV+bTBzIBIEug1fmkdI2irCpvJaXF8eIY0thqExDLkgYgXhrvs3omHX/5snN92ZeZ3lFqv88UYy2l/0RV6QbwvdfOqdW1sydchbMzScKSq9heSAIQuCTHKvZ8ICOGNZtpxhBHu0aV5sQvSGWLAfmYPvZSiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUMrkz+qH+mvSODFRU4FT+QDM5yyvOMY6M4W+wv81JQ=;
 b=YGKjcTgJUgGXurk0Fvr7AAmW90Ed2V56EPz6l9lfZgrSy0NRkNDSC7efkwa7Y/mKXKUwG420UFFFMfIPNP/FyX8+WsJMJSyRGNoufGhFdoAx16d2inVJD2qWw0DwBgrBySwXf2I0IbnXxo0PKEMo51JJ4cyexxMpFZDoQZDmFNZ+7I/InXhdQFu0FgOGC43zXzW4mQeN82WDtOsOhtdx+oA+VZ6KFU4qmN01QfbIF2DyiSQxXWjJ69sINZPKbDwXhWKRc7GnB0nWptl0JNgU6ytX4t5DjeM/+AZ5kEoAT+o4Wm0CT9LfjWsqF2MLTvOpxg55JqJdpkQ6ASaHODy0OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUMrkz+qH+mvSODFRU4FT+QDM5yyvOMY6M4W+wv81JQ=;
 b=VcHFN/tp3yfyxaWQo+dB/1fuygk6JMfoIIWdAFlR9k02SLggZE9NtOkuAS4yrketHt7cbY+G5qx9cXh7gqT8ZClahY81sgmlXp3+p/yYsyXQ6kvQfx4EgfwhezEoP8O+MTrNGLdpZZi5F/WF3yKZ8vFV1nDM90YyvCsMQD81aPp1b7qgREILA8q4XwwJYizpUWYCDLEgIoyM3TQyMrm+yfoWgtKROWMX/Xd2vrsoW1Bf5IvVIKVipjWUtflC3dOgLzoRA25HWtr83eL8fCYYoFyzf4VwhlU0ngS2hHHZtsIMZxHUxJJkHSg+lhP+/JHhgaTCVcs2y+cbAxopCyKBIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6899.eurprd04.prod.outlook.com (2603:10a6:208:183::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 15:26:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 15:26:47 +0000
Date: Thu, 15 Aug 2024 11:26:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert ads7846.txt
 to yaml
Message-ID: <Zr4eLg+CUQuJHc45@lizhi-Precision-Tower-5810>
References: <20240814185140.4033029-1-Frank.Li@nxp.com>
 <20240814211345.GA4028598-robh@kernel.org>
 <20240814214902.GA4101180-robh@kernel.org>
 <Zr1hZbAq/jrwyNQq@lizhi-Precision-Tower-5810>
 <CAL_JsqJs+aFpOLwWHi32pwAy2Q8N7qK43TuTmEJQn-BqXKwyAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJs+aFpOLwWHi32pwAy2Q8N7qK43TuTmEJQn-BqXKwyAw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 29cf6406-d547-431b-2aa4-08dcbd3ead39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzR6dGVkM3VlUEFFNGZwV3ovb1J2bUFIblpvUGdhRlYra1JtUFZ0SlIwdXlw?=
 =?utf-8?B?QWd5K1NBRlJ6TFFDRHAwN0NmejRtZWR4RmI4czFBRks0ekVDSkFSMzc0cit4?=
 =?utf-8?B?Tm4rTVR5SXR0WVNMVW5tTTRLV1d1a0R0YzZsaDdFNU1TRjhEMjNrQ2cySEJa?=
 =?utf-8?B?dVRtdy9YeFI2R01wN0taM1ZvMGtHeml6Q0pxSHJLSlJhL3BodVczckhnU0tW?=
 =?utf-8?B?emVDMGlSMEx5RUtRcmR6S1hmeFdrV0Z3cURlRnFlZFlmR0cwS2QvQUNEdjlt?=
 =?utf-8?B?SDM1KzNWQjVKZlVBRVFua0ZGMCtVcG9MSlhkNlpBcmhweVBzNUdDbjNuc0ZE?=
 =?utf-8?B?YnZzOWxmdmk5dFVCYWFNREFxZmJqOVpHYjJ5MU1uWTZFL01ESjJRK1FyUFVn?=
 =?utf-8?B?a3hnN3A0VWNDWnk4TzhLbWprdW1SWjJuMXI1cDJyMVpJVG1zaDdsU0FkYmo2?=
 =?utf-8?B?Q2Z6bk1FT2M5RW1WU0xIWGdNZUpzUDM4K2N4bDVkK0xGL1NzS3NjUzh3dDhC?=
 =?utf-8?B?WE0zZW1aa3RvWGs2Ui9kT0hOOEErM2djL0dUTXRETTMxcUgvRGYvWjRnUm1t?=
 =?utf-8?B?elpkYUdCVGs5MXhYZXBPaVQ2RHMvWWVZalZ0VWJFa0MwUXJ3OVRaZE5zanVT?=
 =?utf-8?B?dTN5Rm41YTAzdUlsNTgzcG5CcE1pRVNBMlVMNFlDRGE5V2RaUnlTdjluZEc5?=
 =?utf-8?B?ZituZG1GZDdQbldzN0lUUERmZHYycm5aVjlmSE9kM21QZmp0ZnZDekg3czBn?=
 =?utf-8?B?dzluN1lkaW5HMU13Zkh2dGVvUWphQlpxbE1tM0xlZDRiNHA0SWVrdW9MRnIw?=
 =?utf-8?B?UFUvc3BSSm10dThJdG9NeEtDSmNsS09vSzVwQVFiZEpZak5ZRjV1Vzg3cC9y?=
 =?utf-8?B?MDFtMm5ZYlJpQUl3ZE9yaG4zZGorMFlWeURNajNxQk5RaFBkQ2V5N2QxMzRG?=
 =?utf-8?B?ck11cGFlNUEydUE3Z0hKMXF2bS9xTGlnY0tSWnJTN2FBdVJGVG84ZDJYd2dO?=
 =?utf-8?B?ZXhrT2pDWXpIc2FlMUlhQ3VXSzUvTXlHVHdOK0hNSUcrbkd3TGY2eEJXelZu?=
 =?utf-8?B?b3o5ajYyUTVrWEN1TUNuVmtFUlZPTm9vL3ZwYXNDTWhJOWxNZkxzOVZpODRO?=
 =?utf-8?B?T1JmanhxYmdsd2Y3YmNVZU1ISkNzbkluUjF4eVU2bFI2RTN6NkVqdkp1S0Nn?=
 =?utf-8?B?MUlBb1k2SXNGck5hMUFsbW52Tnl1eGtVQXpXaWJwVXFraU9WNDFmQzNqUWVF?=
 =?utf-8?B?ajVHRWZNbS8vM1psSFFxMzFMeGR1WnNhcnFRVzV6ZW96TEF1UkpFa1dmRm5q?=
 =?utf-8?B?WTVZdFJJbGk0a3puUXhrcjg1Q0llTmlUN0dTcWF4S0NTb2VxRW4yY2M4am9H?=
 =?utf-8?B?NjU3QStJV0FLUFpER0taSkZlUlhBeUJQeVBRMEZuZXh6UXlLc2t2M2tyWjd6?=
 =?utf-8?B?RHlZVkwwWTBVYWdtK2FkN3JQRFp3ZkVuZXd1OGx3d1E2bGVYbTRlNHByNzRv?=
 =?utf-8?B?Q3NFTGNMVHRaZ01lZVJNOVJmMzREM29PZ0pFcXpQVVpURDNHOWNxeXplUEVV?=
 =?utf-8?B?clN1VjBPakV2TkRNY1FnMEFQZm9kMVBrSDltbmVYLzlDaWEvRmIweGtqdUlv?=
 =?utf-8?B?OVFSeTdIQ0htT052U1ZLdHR3WnIydHlLR05XRlNxcXZzaEEwUEsyUUJleDVh?=
 =?utf-8?B?Q2tEOEhCVHRaMVExdW1oOURHeVNTcTRtSWVmWGk4RS9PbFVBR09JYTVNQ1JT?=
 =?utf-8?B?ZmZQeVJvempKMGZXbnZSVndBdUc3L1VTa1d2a3hMOFhBRm8zcVJwcjU2WFRu?=
 =?utf-8?Q?GB6AHKEXs0Yd++VuoT6VIQMbqH8IqR53D1D9Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjBuaDBRbi9DKzNlLzAySmRDZDBlNlRjTnpFN1RWNG5EOU9wdkpDVlc5eXB2?=
 =?utf-8?B?ckdkdHBjSVowN2hsOGg4a3dPQjZxOXJxSk5MamN5MGgxdTN0c0Q3VE84aVYr?=
 =?utf-8?B?WW0rbzhaVXFnS3p5TUFMVi9vWDZ1SXhFVUJmV1lHL09ibjByNjB2NmIvQWlp?=
 =?utf-8?B?a1dWWDdmVEE3QXp4QlJVa3JQTkw5cnBhdFJEL092YzJTU0M5TUR1VEROSDgx?=
 =?utf-8?B?YUF6T3MxbFZWN0V4M254R3VEK3c4WmxISmVqdzB1Y3MwSS9OalE2VXRLeldS?=
 =?utf-8?B?TVAzaHErTDNYNHhIU09TdWQySU1iMzRCeEYwSzF6WFg0cTdNK2gzeWxNdHlx?=
 =?utf-8?B?NDVPV21GQXJ3eEp0dXMyZkZtcDZCOGE4Ni80RTBEa1RvTVNkekREMUtwUlZF?=
 =?utf-8?B?RWQ5VmxBbzFEc0wwVFVsWEMyYWhGQzBtUUxaWjk0MkVEWXRQOUJZcEhsdHp1?=
 =?utf-8?B?N24vS0hmUEVWT1M5VStNMGJKQ1pCY2xXS3M2WkhkMlE1WThueG1nTkZVZ0FQ?=
 =?utf-8?B?ZCs4ckJsTDB5SUlwclg2Y2FWRk9QcnovM3ZQS2pQRUZ3RjdjTU5xOUhXaWZX?=
 =?utf-8?B?VjVSa0k3SEZnMXBOQjRva2dOT09mVms1d1hrS0Z0cFlHalRndmk2dlYxc2Y1?=
 =?utf-8?B?RnlZVGpCOHlwVVVCMytlM0d4Ym4xZEg4ZlZDYzNvUG5rNnBpc0pqWGNyY1lP?=
 =?utf-8?B?ZVViQjJSTDFmcncvbi92d0JUcGV0dk5EeW1zRUFvaFpCOGdKSVBDdmlhNVJ0?=
 =?utf-8?B?eFk0bENyRGNUZzRVZVVTR0gyUjlXVmdrRk9ndURQeDFScU12MXJtMW1uZk1B?=
 =?utf-8?B?S3hIbk1HWGxOZGRWcDN0WWFLUlFXU1pRaURCa1M5Zi83aVBaTnFJYmF2R0ZE?=
 =?utf-8?B?dUNEZFdSWDZsRjZOOEk2bkFUWHRDaEFQZmtzVzlXdElIczZwdlVDMWZnTUYw?=
 =?utf-8?B?ZXJwdklndkdCcGFDQnc4K0xNbEZYcmlqUVp1THp0UHNZNkNUWDNGMW1HV3J2?=
 =?utf-8?B?VzRjenVLbFZqNTVLY01DVjlGcHJKenFPRDF3N3JraUxwbGwyZ0QrWStGOXhQ?=
 =?utf-8?B?WmJvbnV5VmU0Y3F5a0ZuSC9QaEp0cE1XMmlBWThid1lTNVZpVzVHZGxKR1ZP?=
 =?utf-8?B?emJrcW9nS0QxWFh3ZFdFbW4vWDJJTVNFdTh3Y2pEOW1Hb24vakRPL2NKZE9o?=
 =?utf-8?B?elRPYWMxN2owR21DNVVXOGU5Vm9ZTkpkSWtSMzlNZmNSMXlraFZKYlA0S0d2?=
 =?utf-8?B?c3ZPc213WEF2elFVNVZlQUNwUzA3b3VjWHJxR2NhWVQwZE5TNWtabm5jdjQ2?=
 =?utf-8?B?VC85ODFyWHBGaXBRdkIyK2h6K3UrbmVPMU5jaWNNcUhTdHBaQXpTUVJpekdV?=
 =?utf-8?B?ZDdQeVFRNysvd3VPcnpiSlphUkdoR1h1SlhFMElOT1FqR2ZmYU1PTmcwTlBB?=
 =?utf-8?B?SW1KWnMzcnE3bUlQUGJHZHhlREZPWTkzTXVYdUNyN1VieG9Rbjc5eHlTTFkv?=
 =?utf-8?B?LzZtWklYQitPM2czVXJkTjRxakhkZzRwMzYzSVlHc2FlN2hXVlZzMkJISlN5?=
 =?utf-8?B?cHdEK0pjb3NpZHdSUUlDY2dXYTNqT0RIckFlWlgyczMwd2U2MjVjZEZFeEF1?=
 =?utf-8?B?V1A2RzhaRThjeFB3bEZWWDBTQnhDbnVxS2hUaCtNWGZMZ0ZiaGlKbmZCTXdk?=
 =?utf-8?B?VWRYUVB2M3lPVmxSVzJNMnJDZjk3a1krOFJIbGs4UldXOC83THJ3OWYxRld4?=
 =?utf-8?B?bUNKaEhMc1NCOUpUU2tud2JacUVEWVdpKzFaTDcvRW1SVVoxS05ENk5qYmRo?=
 =?utf-8?B?QTdtUXI5NzBlYlI0ZGZUeml6eUlsWHgxRWRPK0l4b1JZZGhrYWtrdzJBK3Z4?=
 =?utf-8?B?eFh0YzY3alFTVXNmclVhdWIwNi83dFNOa2x5WDdMZUpZRmtNUnFIYWZPRzJC?=
 =?utf-8?B?UmVpQXp2M3FxNVlBRjZvRUNJUm5qcVl5YmIwWGpsbE1LQkxweXhWN29kV0pU?=
 =?utf-8?B?MjJzZkxDYzkxSmJVdHVBeHpoOWNGbGZZRUxOMEM0UkszVjhUL2FHTGhtL1Yy?=
 =?utf-8?B?VEFYS0U5TEpFc2FaRTRldlZlcERpbHFoS3drOEwrd2tKZyttSkZMMFp1VUwz?=
 =?utf-8?Q?p8Zs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29cf6406-d547-431b-2aa4-08dcbd3ead39
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 15:26:47.2422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bVirRt72RxEvfSYPkcGkRU1Bv92jTD/DF3M4dllpZJ7TJw6DAkOTbJmxSC9njA1uPjo5uGm3gP8zvzCSLo2rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6899

On Thu, Aug 15, 2024 at 09:17:48AM -0600, Rob Herring wrote:
> On Wed, Aug 14, 2024 at 8:01 PM Frank Li <Frank.li@nxp.com> wrote:
> >
> > On Wed, Aug 14, 2024 at 03:49:02PM -0600, Rob Herring wrote:
> > > On Wed, Aug 14, 2024 at 03:13:45PM -0600, Rob Herring wrote:
> > > > On Wed, Aug 14, 2024 at 02:51:35PM -0400, Frank Li wrote:
> > > > > Convert binding doc ads7846.txt to yaml format.
> > > > > Additional change:
> > > > > - add ref to touchscreen.yaml and spi-peripheral-props.yaml.
> > > > > - use common node name touchscreen.
> > > > >
> > > > > Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:
> > > > >   ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', 'null'
> > > > >
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > > There are warning:
> > > > > Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml: properties:ti,x-plate-ohms: '$ref' should not be valid under {'const': '$ref'}
> > > > >   hint: Standard unit suffix properties don't need a type $ref
> > > > >
> > > > > I don't know how to fix it. ti,x-plate-ohms is 16bit, but default it is
> > > > > uint32
> > > >
> > > > It's going to have to be a special case in dtschema. I'll work on a fix.
> > >
> > > Should be fixed now in dtschema main branch.
> >
> > Strange, dt_binding_check can pass. but
> >
> >  make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8 CHECK_DTBS=y imx8mm-var-som-symphony.dtb
> >   UPD     include/config/kernel.release
> >   DTC [C] arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb
> > arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0: ti,x-plate-ohms: 180 is not of type 'array'
> >         from schema $id: http://devicetree.org/schemas/property-units.yaml#
> >
> > anything wrong?
>
> Now fixed.

Yes, thanks.

Frank

>
> Rob

