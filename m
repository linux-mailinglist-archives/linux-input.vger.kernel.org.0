Return-Path: <linux-input+bounces-11749-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C82A87E6A
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 13:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92D6E1893F74
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 11:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1EF283698;
	Mon, 14 Apr 2025 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="nQv1gpmi"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2103.outbound.protection.outlook.com [40.107.96.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1DF280A3E
	for <linux-input@vger.kernel.org>; Mon, 14 Apr 2025 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628809; cv=fail; b=puITSqe2Lzztivyq4AkR8oLuEXOq3xRHRWdWketmFXkqRU1uANAeT84OWCxs1cSYCyizxxgaLGdIP56x3J+rWXOcAgqIaSHwdrBx9gtK35AS5sbLgq1OGJLWfR9/2Y+UIiyeUcRDHMyuTwZbj9W322tSdFw/YfYMkbLwCPjwESg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628809; c=relaxed/simple;
	bh=MwBxcZ2ZIcIdfAaqPyYowpf6Hl9x+eZEmwJqkmJ7wAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q/tE47OskBCDT+W9gV/ValuEh1to7RtOS/5XmADuWG7bmv0AB0YA60bHGPTHHUp1Puqt/1mGERJnL6MB2rPA5CWT9fD/T9y+madxGWkmh2EmbIp7zT8kz8Eg5UpNV1mhKIKNbZXsQDnj1idJDiFSS6Eg6fBuFIgqWiROb4ovt88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=nQv1gpmi; arc=fail smtp.client-ip=40.107.96.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvsKeGeM1hY1D0se6/oH1WXpP7PjETmA1CrOx+grwujUEIup50vU/Ci2zSNcYyx6bUYpaWZ2D0tkqGl2CUNqFOVewls0w5+3CZ083+T6Epg+rRBYBGCV/qfIebfnwvCIzwPhhUeiT79lGgh6fWO0IN4TG2ICsCo9wdi0Q/9M7ykxa/kquOSrsf3cbTUbvGyKikpw8p0qArwLjDUqHkdCAg09WIxr2jGHek18iaPXNtv+3HRlfHfWE328gQ5/SvPc1ifNzmqXli0/gBZ9H6cibNLpyYCCtKbQN3vZGoaXPV2WQITERUzSND966mdEBzqnhSDMiWB/1EZ7ZHRm1bizzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pm1yq/g+YEAwQN+yXlt2kIqPey9eZqBl0RNS6JphNrk=;
 b=ivWMiYUX3I2EP1u96sCx5mG+LpEbhGaHdUNHrnSsYjnuwzGhUmZ3s4vErm6j0q6v3/xZO2TYeXuCFaTmCp5NSxDC4jwKLpCTgWUiXejg2PXAu/pO/kpKMgO/62nHakVQeyccDyX3xVgrsUZgzYdMuCwSgUabvfbCu0GaLH1Li+sK2InT+zBzqkiCZivS0HVISNVbCTmkBK/LHUf19dbSKn0lXxvYO1+QARRZnzGTfcBOC6JNJGKCZTirRKglZ6uVOYpoq7YmoCIzoWkC6J4ktmKdajccwdr33+rQZoSH1YXiATH6nIC/QqQAEypYxSUOnYlk3uj0iV1UUJimts9+Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm1yq/g+YEAwQN+yXlt2kIqPey9eZqBl0RNS6JphNrk=;
 b=nQv1gpmiue0Dwz8FfzX3pINaFDYJoKGudOCuZfL/KWB9Ht0MX0+c9Lb7jXvmR07dp7M7HmKRGzKzuwPRwpLUGJTZP64/FnuwUV6c4t5q+oK1mVV9Z9JPxuR9OBdlm1CwCF20kV7anNSELcGL0TcADGsqwS8iPsBrZQxZRCup8II=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by DS0PR08MB9260.namprd08.prod.outlook.com (2603:10b6:8:1b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 11:06:43 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 11:06:41 +0000
Date: Mon, 14 Apr 2025 06:06:39 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Wentong Wu <wentongw@amazon.com>
Cc: dmitry.torokhov@gmail.com, sakari.ailus@linux.intel.com,
	linux-input@vger.kernel.org, Calvin Fang <fangtianwen@huaqin.com>
Subject: Re: [PATCH 1/1] input: misc: Add as1895 hall sensor driver
Message-ID: <Z/zsP+OsbraVti7W@nixie71>
References: <20250411172410.25406-1-wentongw@amazon.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411172410.25406-1-wentongw@amazon.com>
X-ClientProxiedBy: SA1PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::7) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|DS0PR08MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: 6549b392-fa1c-414a-0d11-08dd7b446fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PsYXZ20GbiGB/94j/knSnkGmJ0uWjXephIcqVdJZ3k5ZaHLo7WmLdJsAfc0D?=
 =?us-ascii?Q?nbAEcpLstgKU02GWgcpLdk9xrccJdrzXDVMaOWTQNEB+J2BDXK8MJeR3Zx/s?=
 =?us-ascii?Q?l59WPB9J64ou47E8U6eqmdCKFaaIUe0put7cUbiTXOZagTX9sC/yYRjC6e+5?=
 =?us-ascii?Q?Z6jNn6RiqELUq6JHB7xyBkFLWWVdkIdvEuPU6zbhXkCka6UxJrHtZU/PH1XD?=
 =?us-ascii?Q?XZOspBXMke4EFsghrtsDEwNajNyQmNS62RYaK9Diz+x926tKFfT0Re/uGSg7?=
 =?us-ascii?Q?dGQGFsE37u+ANQmFOwuwTmGRIUsd4+FTS5FjCe17jxSJiYPyEYXPPQuGfmT2?=
 =?us-ascii?Q?Tgl6A6HWkB30gZcwXuK0qVDLnMOGxdFjWuMMSPXj+3ijUH7vdzl+HuALm01E?=
 =?us-ascii?Q?kt8Mb67XarQRwc94i9DC2BBmn4NPRm4crM33rqdzMkshdPAn1B4COkvYUHal?=
 =?us-ascii?Q?JEY52wmsmS68+gvVqfUuBfbJW7ddw6sDGdNmJAgCZJ5VR8mzGT9+r8vRX6BS?=
 =?us-ascii?Q?iEGPDYNaIn0V9oLTYXlVFCjCoGDxkKdbLPJ5Q+pbHPDeOc/IbCAlAEYETdFG?=
 =?us-ascii?Q?mVDrvniq94MUmcdIkgK3xIf3KeLPLCIC93v1CDn02UP6J5vV68+t4B+eLovh?=
 =?us-ascii?Q?gMhZDdGGf2Y0ELCvSpwpWGahtnmmjEw+XtjypCGxJBhaPtKYQkVOJVC9rGOe?=
 =?us-ascii?Q?uvvW6Au1gbvdokNJd6k0mm2Qf8IdlalBk3t6zfwEHxQSnuGs4Dx9SXxH3Nw6?=
 =?us-ascii?Q?URmR2rkkicyui7n0m5TaM8Mzeu3qKrPPGXcEtsnKkPvmO49QajiwL43jp5ch?=
 =?us-ascii?Q?NZoqxda6wpVsAG21dsMrgZLht1oZheHws2eCtenw/U9eJYHmNvTkqtYrBN/l?=
 =?us-ascii?Q?CbLaH2gGZ0ZhrbU87VPHoCPsZ2/rNgTZy/1NjnZarUD2sB7BfAo1/RhkY12J?=
 =?us-ascii?Q?4356vTRgeB/yiO3vuYSJr7Az4nfMcj5zi3DEJsuMIp/Mxer2owZ4RI/q6LMe?=
 =?us-ascii?Q?SrsFZRmTIu7NVyp52XfFexVZ5ASyTwKAsHBxhrlSJkpfX/R9wvidf/aTmb9z?=
 =?us-ascii?Q?VcOrvuLMkbHuzzpjP/TB/w8ds2cA7DcELgllmJlG14TKU3s7cSD/Kl7LeB9r?=
 =?us-ascii?Q?a+eYYXfYNdrOhtlUBrngVJFQXcRbFQfzj78INBqteDILCZsIHfiZds8Tahyv?=
 =?us-ascii?Q?7DBDZ5hmpP28PnnulsVuxA3Hc24ZnxWeFnXIyLvzQSXUy4nULD4Dl+mogX6l?=
 =?us-ascii?Q?KTD+QdQFpTDvpI2IUdi6i0JxwsxuY5L9qz0Eja6kxLZ5DON6Pf6T8WXcFYW4?=
 =?us-ascii?Q?j+e3ZTOTdx6FWe2FXrzTWMsAch5QSxvZFOkE+OnUlYvI3/W7nhvUVGM3WFOz?=
 =?us-ascii?Q?exYA8cyEBU5wi5kiOuxkKwAgpAhT9z0zGmSDNxofJTZeP9ipuYa1BF3DOWMr?=
 =?us-ascii?Q?zxaunnYzEO0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bVfguGD5QZHlZWley6lKJkfFSAHhD/G+Hc6BXItCOvLK/SHRB2tj+U8HI26v?=
 =?us-ascii?Q?oMGhpe+J7XV49owKM8BliGEypZRE1FBVTeoA68m2dESP5Ri05+CiYEnkoKoK?=
 =?us-ascii?Q?b+/nOheJ97BPKJ8UI+CMZ5MYHMx+wmN1vPIKeoljf4u/MnpGnQDSoIwGYBHC?=
 =?us-ascii?Q?ndbBGLYtPDj6vIJFrB6tJUzpyZDnk5ZxB8TCiIhrzmaZXNyJfQfXEXMPPlno?=
 =?us-ascii?Q?JTiZvekiJlsh/d3TWg97oTbZc3MZ/CWKyUm5HKBA4Z1lOtxST4XzDU7r+aR+?=
 =?us-ascii?Q?U1FhqjsiWN8gjpaE6yJHj4Ppd30oyG7jjf1q7UmaBBCZAq1nOuPuPVoc5Nbk?=
 =?us-ascii?Q?w7PyzKt20MBZuKutMyxlETDpjJKSHt0hMCPkwHF0VUzuvi9isrLG9mPfshZE?=
 =?us-ascii?Q?f5m1lxVNTsfZ2SSgiGHwAMvp3EH1MOi8DnosrOfJH6ARtKor7V08wd/cdxYO?=
 =?us-ascii?Q?wcIlzccwzMD2b0kTYkALu1KUTVOAPscTEuFpHlPl9rEQCpahyRGLe70jKdMm?=
 =?us-ascii?Q?WraYWtg67izgDbtP7Fot6UFojCY+BZr1Fc3zQBFfMumoWb7CLKoZxIsbvnkt?=
 =?us-ascii?Q?Rqqm9ODiCzn3m0DMzxH/yg/bg3cP3As2WcjksEpP7LFEy/hPNhIiPF7YEE8C?=
 =?us-ascii?Q?K3xACqsTY7HIGOKGNH4kivETyTFWeY3LcddjvFRYaf9JrRxCfO5ovVj4Y/ad?=
 =?us-ascii?Q?HBqhrG6WpKgypFf52f2fitxtu59wMuN3ipAf4CB/unpbhikm7dii/RVEuM86?=
 =?us-ascii?Q?DM3f2njuiOIG5AtKRdJYdSFkMSPysQvg+yehKJyPmAxRoBzn2tTi672C/Mja?=
 =?us-ascii?Q?y2XQIV31p71Y2lunWS3pTNgrjfgts3PGnBzIxeI9qsRto87Mcoe0Sn3pOlMz?=
 =?us-ascii?Q?8gcSBvDw8AppqMTwXAb28WcvOMvmFUd+b16TozxTquutrNNe/U9PcPBeQf/4?=
 =?us-ascii?Q?K7TkLmMLUKl6r10Nqig2EULjuI4/pfOXmnYa8ILUtGXdGvnJsFC2NiQERPIM?=
 =?us-ascii?Q?arUbGlXPitSKAhiGlzl9CZhL0RNth5uUPnLGbw8w9D5jDp91tAUOCNImQzI7?=
 =?us-ascii?Q?yWNuKItYHrp3y3W3upD5ckiAvaiO4A/QxBPR8od9UmiPWJnON1KP+/kxrLbo?=
 =?us-ascii?Q?5tEmzkKdgod30o00uAK+mTs25MkVMEFMLghC0Z4tx+w8OMOxPEQkP9lPuscg?=
 =?us-ascii?Q?UJNL6TnB2G4ckpz1n4/wGUzvdDavw0TOjKyK1TdjJMwS8//liCM8R1/GRWbU?=
 =?us-ascii?Q?xrMcPV/JkaezAbDX38+mqiOy2f1O/x1wrnLb56n10ytQ52uaky3BlKCunLAK?=
 =?us-ascii?Q?q4g/JNaLzeHky2l2Ob/l2Hq7NnEKw+LcE/gXRvz3dCGwETx7UXSv/XpmamVe?=
 =?us-ascii?Q?x1Ri1RE9n0c36HmYayvi9VncPJHS6rA47KvkLpD+bXcqp7md61FNdVgZc7Rv?=
 =?us-ascii?Q?0eIhIz9UlLEceWqP2nQDczec983K33bYqW8vl0Jp1LtzTfMYulHijxGVlE7b?=
 =?us-ascii?Q?N+qR4KNYRX/42Kw36B/B7PP+AWvrisKVM4b7O6e0iOMwhKW1XcqC1XNd0QQ+?=
 =?us-ascii?Q?+XgwwN8H1izFxq55z6R8RAiHarjNWAS4704Q5f37?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6549b392-fa1c-414a-0d11-08dd7b446fac
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 11:06:41.9099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WNy8fPT2q/zZHj8285t/wModsUzDx8Kh6giJthkPPnPTFN/yU3M4ovE8goqEhPUpe/7cG+SPxb6hRmm+imDgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB9260

Hi Wentong,

On Fri, Apr 11, 2025 at 05:23:56PM +0000, Wentong Wu wrote:
> The as1895 is designed for omnipolar detection hall-effect
> application, such as cover switch, contactless switch, solid
> state switch and lid close sensor etc battery operation.
> 
> When the magnetic flux density (B) is larger than operate
> point (BOP), the output will be turned on (low), the output
> is held until the magnetic flux density (B) is lower than
> release point (BRP), then turn off (high). And the connected
> GPIO will trigger interrupts to CPU according to the output
> change of as1895.
> 
> This driver reports the magnetic field change of as1895 via
> input subsystem to notify user space system suspend/resume
> status. It can alse report the state change to the external
> connectors via the Extcon (External Connector) subsystem.
> 
> Tested-by: Calvin Fang <fangtianwen@huaqin.com>
> Signed-off-by: Wentong Wu <wentongw@amazon.com>

Thank you for your patch!

It seems like this device can be supported using the existing
gpio_keys driver, which allows a GPIO to be represented as any
key or switch. It does not seem necessary to write an entirely
new driver for this device.

Please note that while this device does seem very interesting,
this driver is also not suitable for mainline because it doesn't
follow the style guide (i.e. does not pass checkpatch) and makes
heavy use of the legacy GPIO API, among other problems. Please
refer to other drivers in mainline for some examples of what is
considered acceptable.

Kind regards,
Jeff LaBundy

