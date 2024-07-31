Return-Path: <linux-input+bounces-5223-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EECBE942A35
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 11:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33D73B24B2D
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 09:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618881AB52B;
	Wed, 31 Jul 2024 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b="OWf41vnt"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2102.outbound.protection.outlook.com [40.107.101.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC101AB51F;
	Wed, 31 Jul 2024 09:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722417482; cv=fail; b=Lzh39KSFmiJ/mquyzQYoRB5nzDPaWtOnQ6OqgAOpD5kK2JculaDRS+XH57YsJHQrU/R7Wo7uQ1wwWimcHtfRvHeC2IwdM7c8IU0PnFyHcwqq2bdOEbvmTsGJp+X56qfF7Wh68r/aT/iW8xyUD/1LZ7aX7BolU4A9I9sWqlc2Mig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722417482; c=relaxed/simple;
	bh=zfSrbEHYrkhZMhJwcTvIiY8vj8ITvFVYG4MO99CbC1s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dK+rau33lJul0PSyBrS8rEpRTdI/iilW/EGTnMI058G+HilhN1ceRJFroC+5HvOTL3VhycKKcpDVMl6GZeeb4ZUS900ynLxcHLhsqxjKmPOZSR7bGz0oD+GGWIxbNgNBHogniMLFHMJE4KKJ20qDOwpcEovxrbesiYAMXm5hkr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tw.synaptics.com; spf=pass smtp.mailfrom=tw.synaptics.com; dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b=OWf41vnt; arc=fail smtp.client-ip=40.107.101.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tw.synaptics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tw.synaptics.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRKZGcYwAsvPfSkGW0rXUlDKoWNZAHn/rSRKvryKk+WZBqch+2atVn0SlM+/YRPEL6Sj2i57qN9R/fS6HdKYyYTPJ6ecaHz9IRGHwCFzY0n1TD5n8d5mD3NJPOmd/PNl48W0aRz3X/bfiuvOFKgZi0PWUB8UGlxZKYr8cqtw61LLYHok9AGZVWKWUNDxPOmEmPljWdSp6n7u69wgXptxdiuIS5cB6HmAYiPeS3mdcFUGWt+CLjOD8uP7E5z6D2pi2Sd+cvarZnZn5KUuXrIOJ2yPRLnuZ18/JZJh8Ow8JySnGY1bTsE8AyQmiOmCLkKXNRZUtWQYfMzDdRkkjmYZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfSrbEHYrkhZMhJwcTvIiY8vj8ITvFVYG4MO99CbC1s=;
 b=xD4EfuFF2KznpVZd8xpRAQQqCKIuS4fdxGbJIiQvU+KNiy44bWR8i38a3YN7EvURn1zCXyu+j1vnci0n+BIbJOXvbumYd/TZytnpo1raE9jTm+qjIfBEbeSX8/CN5Labb5alSn/yeNJkiQMWrIRWXgWG2xdD+1mCdRafHGwYSAT37aLxzeC2ZRFOGv9srIpezZ70XQUgqSZep5IDjNmRVImVKd3sQPPPk+0syTUgOLLtqCLsK4NVy7XVWO02xbVyOrfw1brtbzlvVYeQcmN1TTzMNxsKQLVm07IcNGgDNp56Jeac24uqRB3stQf4WljrU7ZrvpPsmi2gG/V4dwHUqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tw.synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfSrbEHYrkhZMhJwcTvIiY8vj8ITvFVYG4MO99CbC1s=;
 b=OWf41vnt2j/K4RI1/bs3OEIyJRy0UcMrpjE/OtqpOg5xubCTcfubU70Z39WfijmQYjTlWxcmK6IZlHv/oitfU4FKdKHTgK7+2HMIMY8WHqICuQIOgKWYQ/1gCuSgPGNVhkQZGbEUpqWR3jiIFqgvOKiBXRFDyqTLtygHtt8Dm3E=
Received: from DM4PR03MB5998.namprd03.prod.outlook.com (2603:10b6:5:389::7) by
 PH0PR03MB6939.namprd03.prod.outlook.com (2603:10b6:510:16d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.30; Wed, 31 Jul
 2024 09:17:56 +0000
Received: from DM4PR03MB5998.namprd03.prod.outlook.com
 ([fe80::c0bc:d3f2:2124:c71d]) by DM4PR03MB5998.namprd03.prod.outlook.com
 ([fe80::c0bc:d3f2:2124:c71d%6]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 09:17:56 +0000
From: Kevin Chu <kevin.chu@tw.synaptics.com>
To: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Marge Yang <Marge.Yang@tw.synaptics.com>, Derek Cheng
	<derek.cheng@tw.synaptics.com>, David Chiu <David.Chiu@tw.synaptics.com>,
	Vincent Huang <Vincent.huang@tw.synaptics.com>, Sam Tsai
	<Sam.Tsai@synaptics.com>, Vincent Tang <Vincent.Tang@synaptics.com>
Subject: RE: [PATCH V1] Input: synaptics-rmi4 - Supports to query DPM value.
Thread-Topic: [PATCH V1] Input: synaptics-rmi4 - Supports to query DPM value.
Thread-Index: AQHaerdNsbe6Kfbtv0m/G8A2qzbufLIRQAgQgAAY5aA=
Date: Wed, 31 Jul 2024 09:17:56 +0000
Message-ID:
 <DM4PR03MB599884A63173E935FAF7EE7FCFB12@DM4PR03MB5998.namprd03.prod.outlook.com>
References: <20240320111058.601156-1-marge.yang@tw.synaptics.com>
 <MW4PR03MB6651C14EBEE7D8B56C82F1EFA3B12@MW4PR03MB6651.namprd03.prod.outlook.com>
In-Reply-To:
 <MW4PR03MB6651C14EBEE7D8B56C82F1EFA3B12@MW4PR03MB6651.namprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-ref:
 PG1ldGE+PGF0IGFpPSIwIiBubT0iYm9keS50eHQiIHA9ImM6XHVzZXJzXGtjaHVcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1jM2ZlZmU1Zi00ZjFkLTExZWYtOTE2OS00ODgwZWEzMTcxMDFcYW1lLXRlc3RcYzNmZWZlNjAtNGYxZC0xMWVmLTkxNjktNDg4MGVhMzE3MTAxYm9keS50eHQiIHN6PSI3OTEwIiB0PSIxMzM2Njg5MTA3NDM0NjE5NDAiIGg9ImNPNjJkOWR0UUw1eDFoQnQ3Ynl5ZzU5TUVLOD0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tw.synaptics.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR03MB5998:EE_|PH0PR03MB6939:EE_
x-ms-office365-filtering-correlation-id: 303196aa-dc8a-458e-30f0-08dcb141aa2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UDdlZWFvUmdiU1R1dEVHK0ZnWmFkb2JSUDkxeW8vTnNkdFdSZjB2bURVdHhu?=
 =?utf-8?B?T09va3JDbHJ6cTRhbEJmMXY1Qmc0V1VSbUk1ODVBajBwTU5najFNSEQvZkZR?=
 =?utf-8?B?ZU4wQmF0SmhpRkZlYUdnT0gyTXpTSDZ6TGVJclJHK1h2RzFJZk5vUE9Kc2U3?=
 =?utf-8?B?N0NYYVNxMlNTZTlmdGw0OWEvdzUvSVE0UlJLSExPL2xWOGZKSFg0cVBFY1lF?=
 =?utf-8?B?dHFETzgySXVmWHJFcEI3RHhwUVpWM2E3YW1pbUlMeklxZmxWR0ZzRTNuZFBV?=
 =?utf-8?B?anphK0xQZ0p1NHY5NEVPUzlQK3F5RS9kOHBjdHZtc3BzNjR6K2g3NFhKZkV1?=
 =?utf-8?B?QnY1RlQvRGp3emdKTHBudG84dVh5NVYvUWJ2UC80VGRaRVJlZjMwR0RBb0o1?=
 =?utf-8?B?am5qdFBaTDcwdzBlRmp4Y05CZllCQ21FNDU4QldTNWtOaE1Rc1lYbThGb2pV?=
 =?utf-8?B?eTlNWXlJQWxvNmtUUHZudFkxOVZQSnBSem44OExNQVBmVjVQSm91MnNpN0hl?=
 =?utf-8?B?QWg4VVphcFhXRXRzWmJ1UnNzRnBVMnBtVHpkVW5lVXM2T3JDRE1mdkpCVmYy?=
 =?utf-8?B?bGtPYitzRmpKcFhXYVJ5TnRtcGdBbkp6dTUwMS90UWs5VXNFaVBFV21nVEZK?=
 =?utf-8?B?NFFRRm1ncmRXcHJFNVhjbVd6NHNMekJQVEFDa1FiUzc1amRKcXFPRWFJVmRa?=
 =?utf-8?B?bmxwc1pjcHhnTDVWNzdyeUNTNnovNnA0d1RhTUtqSHE0OGxMV0krSFA4eTBE?=
 =?utf-8?B?UU5qWHREaWZBUG5hYzV5c1B6UnhtSXdpT2c5Zk14dDduK2dBY2pFSnh4ekdm?=
 =?utf-8?B?MUpYMVVhVjBELzZFcE9kc1VleVFwNUhiSDBWVFRHajR3ZkVGQ0ZXeXpTajlk?=
 =?utf-8?B?YTVLNTQ1RnJhQUY5VmZFc1RmOFlsR3VBTDlhbXFxQ0UwbzFUMEw1OWZXeTBv?=
 =?utf-8?B?NFdNS0pnSzdiSmR0TjNtM2RrUzA4R0RCd2VsSDgxQ3c0cjZYR2VxMEd5b2Zp?=
 =?utf-8?B?K09rSWdaOC9hRkZ6bzV5bjMrWXQzenpDZENEVHZKUkZzUkRRZWlSbkYxN3cy?=
 =?utf-8?B?U0lIVkJOT050NjBQVTcvRWxZWXlRU3lmWkxDUjNHWXIrNXBjb2NYN3BScHdi?=
 =?utf-8?B?NTk5SmE2M2FPN1VCN0JGM2REbzhwMnYxMjBTZGE2UHY3ZnVkNFRJSXhVT2pT?=
 =?utf-8?B?QkgvL1VMSjJhM0dlTHJvT1BXNTZPZG5nYUVCN1hJL0FaNkg4ZUdxSWNSL0dq?=
 =?utf-8?B?MUI0T3B6ZzRJNC9JRWcwUTFFdnJvMFVwam41aHdrUmZ6dFd1VisrdEpKRm4x?=
 =?utf-8?B?dmVQYk5Zbit3WXd6b1hnYUowZXQ4bFVST0tUaEFydTV0bldpd0g1S212NERK?=
 =?utf-8?B?TjhhZDFYRk9Qd2hFNzNDeE8zd0toa0E3RVpRSkh0TkJtczNxMHdXZkVod3hi?=
 =?utf-8?B?WjVZSGl5cENNYldkRnhSei8zVkZzTzJYVnp4aWtWMFgrVk5wWFBDQWFHMHBu?=
 =?utf-8?B?TVpDK2IxaE84MkRRckZ4c1VLdWc0eEE5YUg0ZFc1KzdhTk52NkVjOTlWWWZo?=
 =?utf-8?B?cTJ2TGNYcCtjSmM4Y1JGcFQwa0RNTGhHSEJJVnprQjdWZWlFMXp4K3doTDBP?=
 =?utf-8?B?R1BtMFJYWjNyTThidmFBRWZCU3pQdWNxQmxIQjRUTSt4VkVTUUJCMm40ZVNz?=
 =?utf-8?B?cVovbUtqVkhub01iTUhTOHFjZ1d2U09GdmtTRWljMGlUaVB4d2YrR0NndWxF?=
 =?utf-8?B?Q1NvYnF4eHByUUUvcG0vb25lY0VZUGszU091VGJpMEpsZkdFeFhzVHdGR1dx?=
 =?utf-8?B?ZVJ4eVN2ZG5uQzhKTkhIZE56VmliUHZYNFZkVCtUVXRTSUJSdTNGN0NXcUNp?=
 =?utf-8?B?cVgrOGo2MHFTdHY5VGRHdU4rbmRXTWQzS3lQdGd3NlJBekE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5998.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aHNKRmNKVlVOZDYwdXRGT1JvNDdoUWVyOG5LWDFzaHh6M1VqeU80TTZhSzdj?=
 =?utf-8?B?OTdJMG05YjJKaUdiRHlrSTRvNHN6MUxGcDg2S0Z6czlKcnZ1Uk00WWNZVmxQ?=
 =?utf-8?B?R3JaNVRnL2MrV1MvZ1hMZTdkdDV6ZFp4NUhDbHR2TmhPbkJjREpjMUtBa0l4?=
 =?utf-8?B?VHJBQzVjbk03cUVOSXF2N2V2TEZWT2dDMUtsRWs0ZEY4VDZyQklwRU9EVm82?=
 =?utf-8?B?akFTV0NpVEhtMDh0VnpGQjZ3OWRJTjZCSUY5TXZnc290NjN3Yy9hL3dGOUEw?=
 =?utf-8?B?aTF2UzlXaCtSV1JHdlRRaWFFQnh6UEdFMC9oOTNyWjJPS0ZvUTdoYTJQWjlE?=
 =?utf-8?B?a29Semc3c3p5V3gvSDgzVldVVll0T0tDMk12N0plNEU4V1pUcnhEVmh2UDBs?=
 =?utf-8?B?TkxKdlA1NFBYUzg0VnhqREp2Q2p2YXlPL3hkNmVHUHZiWkk0UmxINU1yNVNK?=
 =?utf-8?B?V1JaQmRudkdDMytZMmwvWVFNbVpTaUNCZTBSekFraGgzSWZUYWxtZGF5ZFkx?=
 =?utf-8?B?N2dXNUVyV2NFYmMxVGtxR0dQL2hjNk8rQzFEN0VnWlE2TkdFTXhHbU9POWhO?=
 =?utf-8?B?UXJURmsyMm9wNkFzcjFLb2d4OTdCdUpQbGVRa0F2dUY5UWhXamRRejFxT1p2?=
 =?utf-8?B?azNFSEtYRUJldFVHa0RwMitrK0pXRnhjbDFlQTBQeUxwZE9ML2VqeUhaTmtj?=
 =?utf-8?B?dnowRlBPTHFLOW9zelNIb1NBZ3FVZmdmelFCVW5yaGtQdFZyRk0xbDZMR1Q4?=
 =?utf-8?B?TjhyUXpnWnd1a3huUU9ibzRsRkFwak84bWlndVIrWld2VnI5SzdVRlAyL0Ev?=
 =?utf-8?B?VHFyREFpdkovM2VieVUrblorWnQrYnlPUS8vcXBscDFUZ0ZHMWIvaHJaSVpZ?=
 =?utf-8?B?cFllMVpJUkJoQ0FTTHJmcy9Fa1BVeEVha3BoazdyVStJSng0WmJ2bGsvYTRn?=
 =?utf-8?B?ZmhodFRIZEdwV1I3blJLNDRUSHB4dHluNkJkZWl2NlR3Z203clRKYmhBeDh2?=
 =?utf-8?B?blloU3BvSTlqV0xxdURzSnNicjRTeHpPNXhUTEJpVlcvdXF2UE8zVjE2SW5a?=
 =?utf-8?B?SGd5QURURzk1SWVkakdxTmNBNzViNEhPRG5TaE1FQU9TL2VvTHFzWVludGNB?=
 =?utf-8?B?SzhsSU1qSkNzN1VZcUl5Q0RxcnQ5dVgwQTViYWpKZG9XalpwNDE4dWV1UWpI?=
 =?utf-8?B?dTVYQ0JMTG5VL05hc3lmck85VVhhKzNsUmxabko1VG1yTmZhSHp4dWxJYWFE?=
 =?utf-8?B?UDNNblRvYWFMcHRsSHl4MENMamRqWlFuQmZuN2pYanpxbXNUUkUzQVVJaW5K?=
 =?utf-8?B?V25wSkNDZUVicDgwK1o3bndUTzJ1TTM5ZmxsVUNvYzdJaWprVDZXcVZDZnFx?=
 =?utf-8?B?VHdLbGlSSStlcDR3WVVKYk05eEw3S0piOEU1YVdyV3dyMnNEZ05JR29SdkNG?=
 =?utf-8?B?b1pZWXlzdktodkhWMDZlNHpaVGprakFjVmNaZm5BN2hJVCs0U1hVMDFOaXlj?=
 =?utf-8?B?eEFlRGpWUW45U3d3Y0F3ei92dkdxRWwwVHpMUytIYkdpREJnaWtWeXFlREox?=
 =?utf-8?B?d3lxRHRYZVlXcjB6WDF5OFdzeVd6UzEyNEs3bVBCNlZwVHp2N1NpRUtFdTRa?=
 =?utf-8?B?QUxjd2RjMlBqUzcwUnp3N2Z1ZWNVZ1RzdEdTbVp4VExDaEw4bUNTZ2JoOUxi?=
 =?utf-8?B?bDNzcHhHZ3dyUUV1SWJTbVptNnRJYUo1T0k2MDMvdG1WWjdrdWZRbnhEMVBj?=
 =?utf-8?B?a3o1NmFBcTN1TXFhUG1pTGdvZ3hJMFhXWW9seXZBUzFrb20rZDc0M2lGNC9t?=
 =?utf-8?B?YkRoc0lCMVhXSU1SRXpYR1NPbDYrWmc4UXV1V21FTXFMY1ZnMUEyTXB6TzFl?=
 =?utf-8?B?OElPQmNFREt6VnpaZmxra0pEMHVSWjlOSUJnbTVQTENia0VHQ2dCWEVqTWU4?=
 =?utf-8?B?SDJ0L3Y0NURwb3I5aVlrTUtmS0g1TXl2eTNUU2x2VjRXT2pNWWlmSmtkZDRU?=
 =?utf-8?B?WEcrazFhbExXMHZEdUJOdnczaHZic1VGQ3V3ME5HcjJSdXVZYit3OHAvcmNR?=
 =?utf-8?B?SXpUKzlCZ3JFeWtNeHpId0pWc0NiRzZRYlljZldDTURVRWk2THpoa1NWaUNC?=
 =?utf-8?Q?d/e4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5998.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303196aa-dc8a-458e-30f0-08dcb141aa2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 09:17:56.5230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A9u8DH7omNsTpoicdim/RmdaAJLipugQuN8CSYGfpwY83LnrwC46ocx0TJZ2f8hHc8kI1JbNqCResPjQDuecCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6939

SGkgRG1pdHJ5IGFuZCB0aGUgTGludXggSW5wdXQvS2VybmVsIFRlYW0sDQogIA0KICBJIGhvcGUg
dGhpcyBlbWFpbCBmaW5kcyB5b3Ugd2VsbC4gSSdtIHJlYWNoaW5nIG91dCByZWdhcmRpbmcgb3Vy
IGtlcm5lbCBjb2RlIHRoYXQgaGFzIGJlZW4gYXdhaXRpbmcgcmV2aWV3IGZvciBvdmVyIGEgcXVh
cnRlciBub3cuDQoNCiAgR2l2ZW4gdGhlIGV4dGVuZGVkIHBlcmlvZCB3aXRob3V0IHJldmlldywg
aXQncyBsaWtlbHkgdGhhdCBzb21lIGdhcHMgb3IgaW5jb25zaXN0ZW5jaWVzIGhhdmUgZGV2ZWxv
cGVkIGluIG91ciBjb2RlIGJhc2UuIFRvIGVuc3VyZSBhIHNtb290aCBhbmQgcHJvZHVjdGl2ZSBy
ZXZpZXcgcHJvY2Vzcywgd2UnZCBsaWtlIHRvIGFkZHJlc3MgYW55IHBvdGVudGlhbCBpc3N1ZXMg
cHJvYWN0aXZlbHkuDQogIA0KICBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgc29tZSBndWlkYW5j
ZSBvciBoaW50cyBvbiBhcmVhcyB3ZSBzaG91bGQgZm9jdXMgb24gYmVmb3JlIHN1Ym1pdHRpbmcg
Zm9yIGZvcm1hbCByZXZpZXc/IFlvdXIgZXhwZXJ0aXNlIHdvdWxkIGJlIGludmFsdWFibGUgaW4g
aGVscGluZyB1cyBwcmVwYXJlIGVmZmVjdGl2ZWx5Lg0KDQpUaGFua3MNCktldmluDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBNYXJnZSBZYW5nIDxtYXJnZS55YW5nQHR3LnN5
bmFwdGljcy5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBNYXJjaCAyMCwgMjAyNCA3OjExIFBNDQpU
bzogZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbTsgbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBNYXJnZSBZYW5nIDxNYXJnZS5ZYW5nQHR3
LnN5bmFwdGljcy5jb20+DQpDYzogRGF2aWQgQ2hpdSA8RGF2aWQuQ2hpdUB0dy5zeW5hcHRpY3Mu
Y29tPjsgRGVyZWsgQ2hlbmcgPGRlcmVrLmNoZW5nQHR3LnN5bmFwdGljcy5jb20+OyBTYW0gVHNh
aSA8U2FtLlRzYWlAc3luYXB0aWNzLmNvbT47IFZpbmNlbnQgSHVhbmcgPFZpbmNlbnQuaHVhbmdA
dHcuc3luYXB0aWNzLmNvbT47IFZpbmNlbnQgSHVhbmcgPFZpbmNlbnQuaHVhbmdAdHcuc3luYXB0
aWNzLmNvbT4NClN1YmplY3Q6IFtQQVRDSCBWMV0gSW5wdXQ6IHN5bmFwdGljcy1ybWk0IC0gU3Vw
cG9ydHMgdG8gcXVlcnkgRFBNIHZhbHVlLg0KDQpSTUk0IEYxMiB3aWxsIHN1cHBvcnQgdG8gcXVl
cnkgRFBNIHZhbHVlIG9uIFRvdWNocGFkLg0KV2hlbiBUUCBmaXJtd2FyZSBkb2Vzbid0IHN1cHBv
cnQgdG8gcmVwb3J0IGxvZ2ljYWwgYW5kIHBoeXNpY2FsIHZhbHVlIHdpdGhpbiB0aGUgVG91Y2hw
YWQncyBISUQgcmVwb3J0LCBXZSBjYW4gZGlyZWN0bHkgcXVlcnkgdGhlIERQTSB2YWx1ZSB0aHJv
dWdoIFJNSS4NCg0KU2lnbmVkLW9mZi1ieTogTWFyZ2UgWWFuZyA8bWFyZ2UueWFuZ0B0dy5zeW5h
cHRpY3MuY29tPg0KU2lnbmVkLW9mZi1ieTogVmluY2VudCBIdWFuZyA8VmluY2VudC5IdWFuZ0B0
dy5zeW5hcHRpY3MuY29tPg0KLS0tDQogZHJpdmVycy9pbnB1dC9ybWk0L3JtaV9mMTIuYyB8IDQx
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5n
ZWQsIDMxIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pbnB1dC9ybWk0L3JtaV9mMTIuYyBiL2RyaXZlcnMvaW5wdXQvcm1pNC9ybWlfZjEyLmMg
aW5kZXggN2U5Nzk0NC4uNmE3YTE3ZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaW5wdXQvcm1pNC9y
bWlfZjEyLmMNCisrKyBiL2RyaXZlcnMvaW5wdXQvcm1pNC9ybWlfZjEyLmMNCkBAIC0yNCw2ICsy
NCw3IEBAIGVudW0gcm1pX2YxMl9vYmplY3RfdHlwZSB7ICB9Ow0KIA0KICNkZWZpbmUgRjEyX0RB
VEExX0JZVEVTX1BFUl9PQkoJCQk4DQorI2RlZmluZSBSTUlfUVVFUllfRFBNX0lOX1BSRVNFTlNF
X0JJVCAgICAgICAgICAyOQ0KIA0KIHN0cnVjdCBmMTJfZGF0YSB7DQogCXN0cnVjdCBybWlfMmRf
c2Vuc29yIHNlbnNvcjsNCkBAIC03Myw2ICs3NCw4IEBAIHN0YXRpYyBpbnQgcm1pX2YxMl9yZWFk
X3NlbnNvcl90dW5pbmcoc3RydWN0IGYxMl9kYXRhICpmMTIpDQogCWludCBwaXRjaF95ID0gMDsN
CiAJaW50IHJ4X3JlY2VpdmVycyA9IDA7DQogCWludCB0eF9yZWNlaXZlcnMgPSAwOw0KKwl1MTYg
cXVlcnlfZHBtX2FkZHIgPSAwOw0KKwlpbnQgZHBtX3Jlc29sdXRpb24gPSAwOw0KIA0KIAlpdGVt
ID0gcm1pX2dldF9yZWdpc3Rlcl9kZXNjX2l0ZW0oJmYxMi0+Y29udHJvbF9yZWdfZGVzYywgOCk7
DQogCWlmICghaXRlbSkgew0KQEAgLTEyMiwxOCArMTI1LDM2IEBAIHN0YXRpYyBpbnQgcm1pX2Yx
Ml9yZWFkX3NlbnNvcl90dW5pbmcoc3RydWN0IGYxMl9kYXRhICpmMTIpDQogCQlvZmZzZXQgKz0g
NDsNCiAJfQ0KIA0KLQlpZiAocm1pX3JlZ2lzdGVyX2Rlc2NfaGFzX3N1YnBhY2tldChpdGVtLCAz
KSkgew0KLQkJcnhfcmVjZWl2ZXJzID0gYnVmW29mZnNldF07DQotCQl0eF9yZWNlaXZlcnMgPSBi
dWZbb2Zmc2V0ICsgMV07DQotCQlvZmZzZXQgKz0gMjsNCi0JfQ0KKwkvLyBPbmx5IHN1cHBvcnRz
IHRvIHF1ZXJ5IERQTSB2YWx1ZSBvbiBSTUkgRjEyLg0KKwlpdGVtID0gcm1pX2dldF9yZWdpc3Rl
cl9kZXNjX2l0ZW0oJmYxMi0+cXVlcnlfcmVnX2Rlc2MsIFJNSV9RVUVSWV9EUE1fSU5fUFJFU0VO
U0VfQklUKTsNCisJaWYgKGl0ZW0pIHsNCisJCW9mZnNldCA9IHJtaV9yZWdpc3Rlcl9kZXNjX2Nh
bGNfcmVnX29mZnNldCgmZjEyLT5xdWVyeV9yZWdfZGVzYywNCisJCQlSTUlfUVVFUllfRFBNX0lO
X1BSRVNFTlNFX0JJVCk7DQorCQlxdWVyeV9kcG1fYWRkciA9IGZuLT5mZC5xdWVyeV9iYXNlX2Fk
ZHIJKyBvZmZzZXQ7DQorCQlyZXQgPSBybWlfcmVhZChmbi0+cm1pX2RldiwgcXVlcnlfZHBtX2Fk
ZHIsIGJ1Zik7DQorCQlpZiAocmV0IDwgMCkgew0KKwkJCWRldl9lcnIoJmZuLT5kZXYsICJGYWls
ZWQgdG8gcmVhZCBEUE0gdmFsdWU6ICVkXG4iLCByZXQpOw0KKwkJCXJldHVybiAtRU5PREVWOw0K
KwkJfQ0KKwkJZHBtX3Jlc29sdXRpb24gPSBidWZbMF07DQorDQorCQlzZW5zb3ItPnhfbW0gPSBz
ZW5zb3ItPm1heF94IC8gZHBtX3Jlc29sdXRpb247DQorCQlzZW5zb3ItPnlfbW0gPSBzZW5zb3It
Pm1heF95IC8gZHBtX3Jlc29sdXRpb247DQorCX0gZWxzZSB7DQorCQlpZiAocm1pX3JlZ2lzdGVy
X2Rlc2NfaGFzX3N1YnBhY2tldChpdGVtLCAzKSkgew0KKwkJCXJ4X3JlY2VpdmVycyA9IGJ1Zltv
ZmZzZXRdOw0KKwkJCXR4X3JlY2VpdmVycyA9IGJ1ZltvZmZzZXQgKyAxXTsNCisJCQlvZmZzZXQg
Kz0gMjsNCisJCX0NCiANCi0JLyogU2tpcCBvdmVyIHNlbnNvciBmbGFncyAqLw0KLQlpZiAocm1p
X3JlZ2lzdGVyX2Rlc2NfaGFzX3N1YnBhY2tldChpdGVtLCA0KSkNCi0JCW9mZnNldCArPSAxOw0K
KwkJLyogU2tpcCBvdmVyIHNlbnNvciBmbGFncyAqLw0KKwkJaWYgKHJtaV9yZWdpc3Rlcl9kZXNj
X2hhc19zdWJwYWNrZXQoaXRlbSwgNCkpDQorCQkJb2Zmc2V0ICs9IDE7DQorDQorCQlzZW5zb3It
PnhfbW0gPSAocGl0Y2hfeCAqIHJ4X3JlY2VpdmVycykgPj4gMTI7DQorCQlzZW5zb3ItPnlfbW0g
PSAocGl0Y2hfeSAqIHR4X3JlY2VpdmVycykgPj4gMTI7DQorCX0NCiANCi0Jc2Vuc29yLT54X21t
ID0gKHBpdGNoX3ggKiByeF9yZWNlaXZlcnMpID4+IDEyOw0KLQlzZW5zb3ItPnlfbW0gPSAocGl0
Y2hfeSAqIHR4X3JlY2VpdmVycykgPj4gMTI7DQogDQogCXJtaV9kYmcoUk1JX0RFQlVHX0ZOLCAm
Zm4tPmRldiwgIiVzOiB4X21tOiAlZCB5X21tOiAlZFxuIiwgX19mdW5jX18sDQogCQlzZW5zb3It
PnhfbW0sIHNlbnNvci0+eV9tbSk7DQotLQ0KMi43LjQNCg0K

