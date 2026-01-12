Return-Path: <linux-input+bounces-16986-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9155CD13FA3
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 17:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79D303036AD0
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 16:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDE03644C1;
	Mon, 12 Jan 2026 16:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HRMi8rcj"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578AD1CD1E4
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235135; cv=fail; b=l8oueVIPsqy0F5va/ox4q8evvUKOW9gNPFGiVs4UaU9MKPsotfREhUgyH2CkH56/l3RMWEqFeqj+LLS2cPqBnux4I7qrNOKGjg3aiFiMQaa3E5wKjz/3Bvu0OA9PefND9C66ypxzJFFfUBCdHijF2PRQv4AvqVzfqnBF5+FRi8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235135; c=relaxed/simple;
	bh=nsRK1BUrNckWA1W5+Foqg7mNUs9ig4yBGiVBhE6icmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=im3F2zU9SRaCwU/82fgTJ9S90djBrfBqrJBkm/WfYLnzPRMuPFEi35XTb8/ZsoacuAQx7GijeRxjMTeiC6yBP8132GOHA6eUqSvZeQvOt3H0N1JW25TnaS6ADuLy1WMhkt+AW0ex1ZGDr2LK96Z5/E9z57okwe2NpT9IOIGcHBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HRMi8rcj; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjBfm3hGhs4Msy+czOBGhO3+3oHDIlRSk/WJ8Uhw74n/qKMXOH/cpcYYvN7a9M3EQtxDBoFOsHlP93WqFqEC423Bv8+jOaPBStM2O4qBEYQakdFoPyfOkBy9XJxvaJdD78NTQa/GoBsixmPSwUVNZvFnSrGc5biXcL2+MsYFFzePMCqPih404NmMt1qFCY4TmlI4P7J3kH+ptayviZJFdj/NuqbHDll/L2QtQtdgbSoFpn+rhkbEjr913xaG7DWviXwFGVDcMpsZMdZKeogNl4ILFfFPk8CiYhtzuupL/CiJytvf76Ig8x7x7fQoOi/jjiqCnvLgj4HVXc/1YkBVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHgaqMVAkEC6V+DA519zqQ0UWZLAH9PB2aTmnwwXHog=;
 b=uhiGys2tU/5HfzYe3s+C00dg6VilE+Kvr4cpBw3qYebNEwTaz2AKbFe3gLnDvWi+cQPvZwMtj9aeAYz4eYyGjOfLtkzx+zwZmw/zQ11L3fKFdoeGbY0rzuKMuLXiLgGA7h+o90cwSxEYLJWDstXD4jQ5kM6Z6TNWX2DDhYN16qmZkUUJmN5cQlBb0BYQoMET64CjgU3ZaDhHws8eMdqHYBUcHRRIiGxDnVc8/kBgc16w7IosS9EdCoRJSnJwxbQ/v0atsNTtuI1jLHaYrguuRUy/gtrKpxOlG2hR5v4OTQh7G63yo8p0Emw8YhkJXUObyGHfnASV5g9xnS833oZ0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHgaqMVAkEC6V+DA519zqQ0UWZLAH9PB2aTmnwwXHog=;
 b=HRMi8rcjz0tUvalt8j3eroOknSlx8GuEGMFhcMvlJQ3fgt0HXrZfP0Dk+IJfr8nS+k+JAfOzHWH/Lm5gK5J/VwgL5x55H1a/uzwMR7cSVE2Hj7LddIsISpSmuHybhE+7IGjlfZ9PWqXOpvJu/snT+CXqBhLHXKbsOG/klC6iqkCYimJJ5dH8LVKQsvvKU42gX9G/omYn9H1hld8GMQ7MhFV9XI2rFrs4+M/bPnqUaDeHulKhYbe0tDekRsWOiG924sGGuWPSADXEfI5ajUHYjISnANl7Mbks3xyoaXvgJhgH1r/lZ38krCrOIztPqLNGIJ7c1OV6C5YoTsgxdTaTXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 16:25:30 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 16:25:30 +0000
Date: Mon, 12 Jan 2026 11:25:24 -0500
From: Frank Li <Frank.li@nxp.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Samuel Kayode <samkay014@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sean Nyekjaer <sean@geanix.com>, imx@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: pf1550 - cope for CONFIG_PM=n
Message-ID: <aWUgdOixLYh36OBB@lizhi-Precision-Tower-5810>
References: <20260112161401.3751275-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112161401.3751275-2-u.kleine-koenig@baylibre.com>
X-ClientProxiedBy: PH7PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:510:23d::18) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA3PR04MB11153:EE_
X-MS-Office365-Filtering-Correlation-Id: b61a7359-a37c-4f6f-0aac-08de51f733d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVVJQXdLaGxBcWVnMXVOYVdWYUsxL0RnN0J6S1dLY002QVk2a0F6VkFSSCsv?=
 =?utf-8?B?eXVITHY2elBod21QN3RSTXF3M09ZajdQUWxuR3VTaW90SlVmVWg4RmFGc0R2?=
 =?utf-8?B?VEdxdElBdWxoeW81ejY3SGY0M2dUM3k2QXVsYnp1N2ZXNGxSaXBnWVhXQm9Q?=
 =?utf-8?B?aUZvTVRYNnExSk4zcW9EZXYvbHdSc2Irc1dHMU9GdmEwSHU4aTBGQnNjR3Vv?=
 =?utf-8?B?eWFFdzZYOFpxY2pmRytVdmtybXFoaWtjaXM5L0ZVOTd0Um96VHAyK2RkU05k?=
 =?utf-8?B?c3VuZG15RFV5L09BeDAvOWtiZ2d2OUk4QlpWWS9zMHR6OWNwcEl6R2xETFI0?=
 =?utf-8?B?TXFZS2QyZE41TFdTeTlsNlpTYlY5elh0OXlRQ2pJMmY0emc1TWlkdXlWRFBO?=
 =?utf-8?B?dGhXOWFPMXd4SmdlNFlTTGpFRnd2LzFSTERTSkZrTUZVeGlkbG9uUUxCWVBy?=
 =?utf-8?B?bjNKRFhQbEtJd1Y5a1owVlNocnhiYUxkdXQ3c01jZy9Ndi84Y0FydzREKzJU?=
 =?utf-8?B?VWlnbTFOT2dSem9NRzFucHRRdytxRjN1T2E4QXNoOW10dlhRaFNMeFdRREFs?=
 =?utf-8?B?ME9HUEpqZWQ3Q2owLzVvL3Fac3libFNYU3plU2NEamU2MUNCdVBnR0NsSFNl?=
 =?utf-8?B?MTRZNEh1WlZOejYrNVdWZzZyUG1qaGlKVHBEYlVBQ0psdHNWZyszeW1zVWVE?=
 =?utf-8?B?Z25YOXRjdGxuNjFSNFJmUnRoL1BDTzE3YVdDT2lETVpjMjhtaFdUUDRIYTNv?=
 =?utf-8?B?SGl3dXcvR0ttb0xSbUlHZldUWU9EblMxdUN4dFNXdnBrd0xZbW1JampQcG9W?=
 =?utf-8?B?RjdJcnI4dVhlRkVxNXpmNFlYQmNPejVqQ2w3bVZjbUlkai8vQ1BNRVBDZlhP?=
 =?utf-8?B?Mk53YlVMc3hBWkYxT3lTdkFMWnJjY0VUeGpWdEE3UmFrUTVmbXBKL2RUSWtW?=
 =?utf-8?B?RW9kMVhJSGlPeng2bllDMmROZjBmTDVqOWEwbE9iY2tQSHBtTExMa0h4emdM?=
 =?utf-8?B?S2VQRi85Z1dUTmJJdmJDdExBcnNLbXVIRmhlc2VnS1ZWSk8rLzBZYkVFc2hk?=
 =?utf-8?B?WnViMWcyNUxEQXlMaHdiN3hvSFhDc0dSYjNRWGMvZXRIK3hRUEhGb2oxdkhQ?=
 =?utf-8?B?Qjg3TnlMNGQ3ZURoVmxoNk5WOGdXb2xhbmF1cTFUS1VDNWV5QUZGdTJqNE9Z?=
 =?utf-8?B?Ynl3QVZRRjZrNG05MUlkeWFiZDFyM2p0c05rY043UGlCQ01zOWxYZHlxTWQ0?=
 =?utf-8?B?UGRGeGo1STkyUjM5eDJUTkRQOFlXSDN4ZE1lRVBYcW90WnNBdFFxVTdQbk9F?=
 =?utf-8?B?dzFPbzZSazZvcytYZ3Y0QmRsamNkYXIycHBmMGdTMFNIQVdjQTduRHVFYXAy?=
 =?utf-8?B?eWVtRmNGNWNJVlRVUUc5NEtsTjBQaXd5bnhZNnQ2QThXM0RDTnVkSlVrdmJ0?=
 =?utf-8?B?MyswWlFuQk83M1Z5U3prZE12bmZSeFo0TzNIeGs1VmlzWmNWMlJkYldyd2ti?=
 =?utf-8?B?dTZNaThTd3QrVVpSTE90RDBJcWVQYWswT1Nkd1ZoOE81UG1mZ05MbTI2akZy?=
 =?utf-8?B?czB3M1krUU83SDBkRU80OEg0b0R2emtjaFlsN3poVjA3c0JPZmpsZFJTVmVT?=
 =?utf-8?B?SWZMa3A2aUpVY1UrV3VCbTAzbm0rb2pSK2NNZFJFSUFZT2Z4bWUrWUx0azkw?=
 =?utf-8?B?SFZRb2Z0NkpoS0tEWUYreW54ZHFQWU9BeklQTVZ5TjgyK3hrSzhEbm5MWThK?=
 =?utf-8?B?MS96K1l6QmxMMHh1VzVZN2ZlcUZvOVJBMUtGYjlSUXNPaDZFYVFGLzIycnhr?=
 =?utf-8?B?SWl0dGhyNkNrT0lHamhHZ3hDdjJkeEJhRFVmOXdicHYxSlNJeUhxeGJlMHlD?=
 =?utf-8?B?cXcyeEdTUHk0YVV5TUxCQzZQRHNUTGRUWlh6Q1BKNlJxN1M4N3NxRlUwZEty?=
 =?utf-8?B?UkJGSk9xdnFCNHBvTGI3WE84VkZLc1QrckQ5WFV0NU1raFlqTkViaThrRWlO?=
 =?utf-8?B?UnBtY2UvSWZtcTFMWTlrUkQ2cEV4LzJqNGl0QmxQcS9xZUhXckNRT0h6SVRM?=
 =?utf-8?Q?PM8Jje?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R09sYk9ZOGM3azRqazZteTZTeFc1Y3VRc1RJaFVKOGpWdjV3QTFwd1V4ZXdv?=
 =?utf-8?B?bnF0K3AwVGhVZ1k1Tk1tdk8zUGg3N1hMdU1FMjIveFlZSmJRV3ZkdGFJcExy?=
 =?utf-8?B?eldHSVA0SzdKcW1hZE5EYkF0VXJ4Wm1QYlFlNEF2QkswMVU3dGV3K2VEOGdp?=
 =?utf-8?B?bHZaNEFUbzNuK0V0UENJL3VPdUZuOG1TUURBU3lzSDE3RzdzTVlweERaR2VC?=
 =?utf-8?B?eVQ4TVVyNTQ1SjBUTGxsWkVzUDZSa2FRM0U5amhmSXQwOEhhbnUxRkhLVE83?=
 =?utf-8?B?MHR2TDRvZ1BHMklMbXdUZUdCcHpSb2d1YmtjL2l3alpuRm1tOXRVWDBmRTMx?=
 =?utf-8?B?TkdNTisxUlMreW85RnNpajVPdEEwWTdpRlk0RUk4RGl2N25JU2M0QUJBTTBL?=
 =?utf-8?B?QjdXZkV0Y2NMSWRIY3dVQnpmQUczeFNCMlZiVDQzYlphKzBQOGVVbmZTVFhu?=
 =?utf-8?B?M3FmNVVMSU4rS1pSdTlua05tQ2xJTWVzT0xLTmRMZm8vUmlEcUlpb0I4bThw?=
 =?utf-8?B?eTJ6enBKSXNjTDZnN25VSE11T1FlZ1NjQVpWODlaYVQvYnQ5eXZjZXcybWdu?=
 =?utf-8?B?ZFJENytOMy82Rnd2dVoycXh0NE13c0h5U3ZQWW9RazdJQjl6VFNTS2Z4ajAy?=
 =?utf-8?B?MWtvVlpwVE8zbEJKc25scnFlTXExNy9obnBWVzg2NkRLZWFoc1BWN3JBNVd3?=
 =?utf-8?B?WXFDWkRxWkU1Z2I1bW02cXVTOVIzQ3dldWZQSVZvb0RLLzdBcVE5MGdTYTBF?=
 =?utf-8?B?aHlPM1VRMERscGVwT0l3NEV4OWFGd0p2S2dNODFyUUs0RUYrcmpuT3d6MHRw?=
 =?utf-8?B?L214eHVPd3BzWGZBSjlUNW1iWWFoV2xzSUFZQ0FnOFl0QlJGbVFISk0zdEJy?=
 =?utf-8?B?NmxXUGZoY3JpVStUMmdhYy85cFJXNGRJWW11R0ZxWkUzZlRnZzlNM1NjN3ZO?=
 =?utf-8?B?OWtFVXZ0clpIK3c4TXc3cUZDa2xZSjJzQ08wSHd2QUtvSHk3eWp5R3dVYlhI?=
 =?utf-8?B?UklYemgvbVRFNVlCTTVMOGVmc3FCc0ljNS9abnp0cGgxSVQ4VVliMGV5VHhp?=
 =?utf-8?B?UThSL3Nudml4SzBzOTVOLzJJR202S2g1UXJGU2JRMDVlWU9rTWxNSkJTNkYw?=
 =?utf-8?B?NnFVM2daY1NET3gzZ1pwMWlNVVhmamdBVjFqVVJoYlhKcEttdlo2VzlEMjBY?=
 =?utf-8?B?Uy9NdU03b3pIMG9ZNFliTkxoUVZ2SEM1U3JnMkFzTnkrVitObEZuRGFtdEYy?=
 =?utf-8?B?N2NqYWNOeHo0QkpWWUxieWJqV3hGUXdTcW5nQkp3NHlicDNYVjNkdkJ3SUVq?=
 =?utf-8?B?aGp5dHAxaE0wYTZ5cHcwMGJkZm9ibjhpTVJic2dMSlBaa3laMGhzV3hnSW5K?=
 =?utf-8?B?dlF0bUVLOHdSSDhFR2pDRjVPTkVmNW1Jb1d5d3ZHUTZrdHZVUDJ1ZGxBWDdS?=
 =?utf-8?B?ZTNDWDFZRWZvWTdNd3pZN281UXR5MWp0MG9FbklZTTZoZTU2VisyQnh2NG96?=
 =?utf-8?B?Um5NanJCdlN0SlZJdGlLSDBnYkxzSnAybnlmRG9hNzRKVkF6bTdKb1htbStu?=
 =?utf-8?B?OWsxeEgzRVQyN2c2VEdTb1B2RGlXMHl0V0EzWGdBeDlCNTlXazFqL1RvcEpF?=
 =?utf-8?B?VThMWEtZVWlxcTN1bzlHSDEwN3NZa2lDTGMzUXNMVHd4RFZSdUhGNnVyRlFN?=
 =?utf-8?B?cGpBLzNJMWV6ZWhjZ3VMM0V6dTdOaXViUjdSTnNJWlc3eFpxbHNycDUySFF0?=
 =?utf-8?B?NWpCcEl6eTBQdmtVaDJFV0YxTXpIRHZKVS9pc3JQUWtzbW4zUjJpTmM3MzZw?=
 =?utf-8?B?NmpQNDFwQ0lWQXorQjZPRjgvRFNadDJPVElCUEdJZ0IwVlEvYlg1dWhtVisz?=
 =?utf-8?B?ZHNNRW1rYWRGSzJMWkFJYjJGTkVoQ3V0U0hqemU0TEUrTlVHcktWekdTZDZl?=
 =?utf-8?B?ZXZGbUVJOTRzeWhjNlZRZ3ZGTkpGOGJmZlVZSU5hZjh1cHEvQ0tzYWJGZE14?=
 =?utf-8?B?aVB6YzJtaisxTENZYXgyOXRkRWQrSjV3eUtobmRtcVRSa2VwYTNucXUyKzZ2?=
 =?utf-8?B?bHJxNjREeXBaSG1RRjV5L3E2aklPNTRmWS8zbEltMlR6T3pFNEdoNDJWV3Fu?=
 =?utf-8?B?OGZWSzdiRm5TUmpxd082L1krUU44RElRa2Q0dTFvS3ZZTEh6VFJsZVRKL1VI?=
 =?utf-8?B?VDJDQkJ0aDVDLytLTWVENU1KeWpqNFVSd1Z1dk1vRWRQWFdJY0NJSFR6NU5a?=
 =?utf-8?B?cDBrRlMvSVFwMlJqOU8rdUZVbkpqdGZuRUdZeTN6NCtyRVRIVFovaXc2TlEy?=
 =?utf-8?B?WjlBWklDdURBdTZxUHF5YUJPNDVXcUdVWGdqOTRvUlRVSmdTWnlWZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b61a7359-a37c-4f6f-0aac-08de51f733d4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:25:30.3107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8ds8og0NXmr6qcZ+5pn/Kw7IVSSAxDg15w6ekdEO5oiNYixhKuI0nNYKQ9XqrC7Euv6v5G2A4k104qdtrLs9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11153

On Mon, Jan 12, 2026 at 05:13:59PM +0100, Uwe Kleine-König wrote:
> This fixes the following build failure with CONFIG_PM disabled:
>
> 	drivers/input/misc/pf1550-onkey.c:154:12: error: ‘pf1550_onkey_resume’ defined but not used [-Werror=unused-function]
> 	  154 | static int pf1550_onkey_resume(struct device *dev)
> 	      |            ^~~~~~~~~~~~~~~~~~~
> 	drivers/input/misc/pf1550-onkey.c:133:12: error: ‘pf1550_onkey_suspend’ defined but not used [-Werror=unused-function]
> 	  133 | static int pf1550_onkey_suspend(struct device *dev)
> 	      |            ^~~~~~~~~~~~~~~~~~~~
> 	cc1: all warnings being treated as errors
>
> Fixes: 9acb215cbebd ("Input: pf1550 - add onkey support")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/input/misc/pf1550-onkey.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/misc/pf1550-onkey.c b/drivers/input/misc/pf1550-onkey.c
> index 9be6377151cb..a636ceedfc04 100644
> --- a/drivers/input/misc/pf1550-onkey.c
> +++ b/drivers/input/misc/pf1550-onkey.c
> @@ -173,8 +173,8 @@ static int pf1550_onkey_resume(struct device *dev)
>  	return 0;
>  }
>
> -static SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
> -			 pf1550_onkey_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
> +				pf1550_onkey_resume);
>
>  static const struct platform_device_id pf1550_onkey_id[] = {
>  	{ "pf1550-onkey", },
>
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> --
> 2.47.3
>

