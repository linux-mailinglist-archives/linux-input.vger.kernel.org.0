Return-Path: <linux-input+bounces-4627-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DC9917D04
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 11:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0213F1F239E2
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 09:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521EC16EB7F;
	Wed, 26 Jun 2024 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="WnYQyLHy"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2134.outbound.protection.outlook.com [40.107.104.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458EFEEDD;
	Wed, 26 Jun 2024 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719395787; cv=fail; b=n0h9h76qQoENoJdJFzw+lt/F7Enc9C7eFHl0KCV9ViF2DG0Ye5lpLpgf0Ea3YaeTxcVLmFMt42WCsZ+uGJrFpG25dxtqzEwkAdiLsm+7mes5wsQQG/lLHjluPFNIKHD0Mieje2p35Wd1j5x58n2ZsUVjp1sBY4S18NNJXKn9uVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719395787; c=relaxed/simple;
	bh=p9Jwz/8rK0zTZPWVuIL6lA7Sdrjcu8RH3+Ur4C6kCgs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AByjWg9YkwzS8YkuU378msfylBc3YAi6Fl1cK5FnrcW4cepGHgCH9hEHl7WrYkpXcEw5wZ95x1il01IS8DQ8+9W2seA9PoaLu4070ORWMX+KKwNaldQ4NvqSlljp+4VeWa0IFESKz6FBUrqTIXX9GPyPCks7tXmUKb80Fni9cBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=WnYQyLHy; arc=fail smtp.client-ip=40.107.104.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6fT8LjrlHowDNSyLJQiEMieRicvTLas9fuJKFa84xpbai2pCJTVLGZVGOOhm5fQsoWrXk7qcQVkxFE3kP2yi5oDClAUQoQoU1fkX6ElR9YYm/ZvS6YV3CwyPO2Do5P8nD6At76J+asELpp8hRFlhNg/kEviAMqranfh6JLG1s2S4oJKvctCwZVPNuC0rm44kRj+MBV+h4/LSQwtIHo64LTKidv+Gq2NCsGlIPUNv7Z4IgoujI4B2Mfh/rA6+xxswHF53MiC4Ng73NJz0l/p4QrfcZLRDMddnNrMCSX+78yU0U4/AgDLrnU+rf/4JzZYWE6ZJjzvZJ7RHhpoka/mRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u1KdYXdRmqiAc1PitUbeMUNPuGUu3updOr0DLsVY+c=;
 b=mwOdxKUnYsyfHLE6UHckjUYlYSUGagjYfVWyymwPaGzAFJ5P3h2VK+1R6LByFDtKbooWKUTnVSMavQVAsQCgteclSinZPP4n0TAZG7JJ2D1JryO7IibvrYaM+9DHsWqyPtlJgFz1zBN+3YhEOTIPsJBrE51H2fThWrQk4IlFiCD8sCDxEEj0QDhuNkx4NzJ8iDi3F5ayowaaVHT6FTqGUPsQXGX/0EXp5wqzC2r7xm/LgkGgAFa1ZEVYvNoplCuzgNJUXtFs+/m7WiaCOlWqb4ZDQ6VT+Pj4APXtBTKIltSfscoZxDwHj6sKV3n4SdT/aZ/HkW7s8njp9P/FN/y5mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u1KdYXdRmqiAc1PitUbeMUNPuGUu3updOr0DLsVY+c=;
 b=WnYQyLHygJav0em+nIwujeMZZIZ2kVCPL0dSgE49QjFBFuXZhlcQ6cvenmBhqw2YI3rINXJFUQDn7Dx+SF9IVvxR9/ie1GSXDNIO/zyEt6I5NDKgAj9W0Bw/GSC3MZyNElP0Sedk6Qo5uUECa/VY36o0cGw+266HfPiNn0dwdgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV2PR08MB8679.eurprd08.prod.outlook.com (2603:10a6:150:b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 09:56:21 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::a08:11be:8709:f5e1]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::a08:11be:8709:f5e1%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 09:56:21 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 26 Jun 2024 11:56:15 +0200
Subject: [PATCH v10 3/4] dt-bindings: input: touchscreen: st1232: add
 touch-overlay example
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-feature-ts_virtobj_patch-v10-3-873ad79bb2c9@wolfvision.net>
References: <20240626-feature-ts_virtobj_patch-v10-0-873ad79bb2c9@wolfvision.net>
In-Reply-To: <20240626-feature-ts_virtobj_patch-v10-0-873ad79bb2c9@wolfvision.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bastian Hecht <hechtb@gmail.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719395779; l=2517;
 i=javier.carrasco@wolfvision.net; s=20240617; h=from:subject:message-id;
 bh=p9Jwz/8rK0zTZPWVuIL6lA7Sdrjcu8RH3+Ur4C6kCgs=;
 b=YOY/sceyh/9SmhZoZz1Yj0SLpNlA/xWw+BsDI0zl/k50nkrYzJthkY6t1JZlxSFiT4uWyM01V
 d0lQtx2XOngDq8b9AFcbh/hpKjdBCIr2ug3XBLMx0/VEh1IM58AgM9O
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=hfASRUP6l4lf3Lo2mjLM085/h37dT3m0Qj1HejXDPDc=
X-ClientProxiedBy: VI1PR09CA0118.eurprd09.prod.outlook.com
 (2603:10a6:803:78::41) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV2PR08MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: 373c5a69-c95c-4d01-6a1c-08dc95c63af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|366014|52116012|376012|1800799022|38350700012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1hhSVMrdXIxMEFncUFXd3lEalJlYlY4OElTUlh3aGZyRllSbDVFZ3IyTUxY?=
 =?utf-8?B?ZG5FOGFoT053U1FYUzRVRUMwV3p0VndMZlFwc2pjVVRtWXBFYnJQWTI3YVZR?=
 =?utf-8?B?Uk1VSWJqZ2dpUGRaOFNwYUxaSTdkNWlrUGprQWVUOUl1d1R4UGFzaW0xYlRw?=
 =?utf-8?B?REFlYkp1eUsxeXdLTklJRWk5NTJxVE9CRHZlK0JXR0tFbTFGbktScmFKOFJ1?=
 =?utf-8?B?aDhJSUdnM1pTNEwvVzRXS1JyTVJjZkJHc1Vpanh0blM1U01FUHJUNEMvL1BI?=
 =?utf-8?B?Q2w5RjdCcjRMUkNMYVNvQWJweW14NmJ3TCs5M2k1T2tkZksvandkNytvZ0d1?=
 =?utf-8?B?TXZiWEZOWUxBSWZiTEpaNCtTbUZZZHhPZEFMQ0VMSGc3RHJ5bjN6RHpCang4?=
 =?utf-8?B?eEdIbDNKNHl1U3FkZkZCMDJWcWNlU3RrVzZiNVNMSE81WDlscGpySlVrSFFL?=
 =?utf-8?B?cC8ydkgvK0Z5TGwxT3NpYWlac2lnK1gzWFdUclBRb3JIcTc5WFhDWDlBMWpp?=
 =?utf-8?B?TitNemRSOTJQRldVc1NEQXZrVEdqWmFKdnZBTi8vQVZXZkNRZE14NEtvVjd1?=
 =?utf-8?B?T1hmUFAwcVBjbUszRWdKcVl1Wmo3RWpUTWloSUZFR0tkZFNpQms2T0VmZkxt?=
 =?utf-8?B?WjdKYk9HWVZtZDdwUGJiM3NaTzhuelBiMmlwV0lKbTFGSUhPQ05na3hVR3RR?=
 =?utf-8?B?Q3JKaVVmVHpGL2FYYUdxRzN2MlUwQlkraCt0TXplMk5HTUFITWtvY21sMnIx?=
 =?utf-8?B?b2IwbHNlbjFNdGxCczB3R1RTNzB6SHNkUjRCN3hFSGRkcHR3dzQrSTRibERZ?=
 =?utf-8?B?UkVNMzUxSkpuY0dkS21PNUpvT2JSNFpSdy9ucjhSUk0raGV3cFVDZ3h1emZm?=
 =?utf-8?B?QVN0NjJhZityQTdDSStaMis0NUlKbmJwTEV0ZXgwVVhWc2dPWm1HcWQvOEls?=
 =?utf-8?B?a2VaWXB5QUc3NUlrUDczK3BoejNMc3hWVTJBTVJWZXZlVGhzeHcrUENGZCts?=
 =?utf-8?B?ZTBlZnFVZjdLRm9Za2wwT2dHNXExT0VUN05jSU1ObFdVNHF1NzAyS1dwYWl3?=
 =?utf-8?B?TFRSMEtpZUZ4STVUQkJTVnQzSEh4T1NoQ2wxRVZvbXBubm8wcmRlVVZFVkk0?=
 =?utf-8?B?WFZEUkhDbzJkcUxhZHJrNW1QL0JCdkZjWURVcTFCL3FtQUNXelJLSktLWXFF?=
 =?utf-8?B?T3BOV3F2UlhkVTR5VHZ6MldvREFBc25DZENhTEpXYkJzeldSZHVENk1WeEZy?=
 =?utf-8?B?VEpHVitNQVlISjhCcWowc1ExL2FNU3VLNXZIcXN4QUJFdDNFM2xOOWhnenhM?=
 =?utf-8?B?aVQvdnFySUJZZHdLUXh5d3JFZkVPTWtxMVBvcXBtbytHempORG5Eb2tBalZF?=
 =?utf-8?B?aERCU3p6ZVhjYTFmK2c4VkpjeHZVUlJQM3gxOUIxa0ZDVW5vQ1F1UTBxdlNC?=
 =?utf-8?B?SzN3MXZkajlyOW5VYzc2L0V1bmVOdGlxM0FxdlF1UUF1UU1LSjBFU0wyQ0Fy?=
 =?utf-8?B?a0tiazNPaG45NVZCNG9oYlZseTMrc2doV3UySVhSeWtHOTA2SUNGSXNKUzhj?=
 =?utf-8?B?SlQvTTRVeUlmcEpsMWFBRklnWnc4NEtyNzZYakI4NE9GNG83ZFpiK1lueWYv?=
 =?utf-8?B?NXNRTG1iU2VrRFdtOUV0Ty9hSkdrRjc2MHJVQzFTK3U4MlZzZlhPUjVMZFRh?=
 =?utf-8?B?TzBBMkxPL21pYStPcHdQQ21MUjYyZnY2WkVTWHJDdThIbzFyc0ZMTWtBMjA5?=
 =?utf-8?B?ek5kcHhOZ1daWWhNSG1xYlJCcWw1ZG9RWEhXTndhZGpPczBHWkJ1Q20vQWs2?=
 =?utf-8?B?RUYvaEhES1JVd3EzTWRUK2w3YUVENzJUeVN1N3JZcUlOUk5oei82QmRadUJu?=
 =?utf-8?B?SmUyZnI0NkxHZXV1NmtKZFpNNXZWNXNpT3JxM0xZbGVsNUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4974.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(52116012)(376012)(1800799022)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkNkTHRkeDlUVUFzYUtqTDc1Sk5NSXhVejh3bWxNL3hmdnQ5K2VORVBnaERL?=
 =?utf-8?B?WmxFWERKZVFUZ0czTjhHNXFkR3U2emZjM2NlaFgzdU51ZVpBbjBocXlIVVZk?=
 =?utf-8?B?WUFTZHNDckZOYU1aTWpLSkZiWmtqVmhVOGJFRFpKS1BXYUM2WGtFblY3UGhz?=
 =?utf-8?B?aStiWk0xUDF3SkxFQ0t3R0t1Mmt4QnVKelFHWFdNNGdMOW11U2o0b2o4Yk1P?=
 =?utf-8?B?VTV6VlR2MjBLbXFiSStGejI4aC9FNjFrS0E1OVZESzRxWU9FNUwrMmRvOVBG?=
 =?utf-8?B?YnBleWVEYUtVS3lzcktZWHBnVkJVSHU3Vzc5MVVsN2MzWEkxaVBkS0dUM0tB?=
 =?utf-8?B?WkhxRXNxNDVwb1E1WFoweDFTY2dTUFBiMWFXTGF6VXZhTk5JNnBUM0hGOVB0?=
 =?utf-8?B?Unp0V2ZXb2xZMnFqTFR4aVRUZFplSkpqQll6TzNvbzhGZmc3MCtJa01mL291?=
 =?utf-8?B?QzZiR2llekNmUWpEUUpWc2VjL1VMd3ZzS01GZHR5QWpWT3RJU1R4RFYzOTNm?=
 =?utf-8?B?VDdvY3U5UGYyeXNkL2Z1aWExemVqcFhnOU85WFRrTXhqdzFKamlVU1Vtb3dh?=
 =?utf-8?B?dmp0SnFEbmVyOGYyQ2RLYVBGNVA3RUFsa25XSmtVNVBTUFNsdHlobGVHdU1R?=
 =?utf-8?B?aklHVmN6b2cvMFhlc3hRU1gvdGMrNEtLM21nVUZHSkNPTFMzMkg3UkFITE9r?=
 =?utf-8?B?c1pkZ3RacWY1VG1xbmFWZkVqY0hZQ2pPMit6UXJQWnBXTFd3dFdudkdBT2pl?=
 =?utf-8?B?aG9RTml0RGRyRG9lWHNxaGRRK29hM0dBRTR6eDVSYkViSjlHU0NPVUY3Rnlt?=
 =?utf-8?B?clJCcERBN3p4T0w2UGpZYjQreWtkOFdVMUZkNjNIL0FzMXQ3RVRtMWFmZTlF?=
 =?utf-8?B?d0loQnRoREtNaWVucVFwQmFycjhXVHdnaG1WcERKVW9lM2czL3RMZll5U3Nw?=
 =?utf-8?B?RTdmSzNmTWhpUHloZThFdVNuTmlqSk0zRWtibzBHTi92Uzh0S2YxQnpzc1JR?=
 =?utf-8?B?N2ZmWWkvNDN1bWpsSDUwQVgxYVpNQ1F6U1BndjV3Qng5UHZCRzVlZEVwKzJL?=
 =?utf-8?B?OVBwVUYxSmw3UWtEVCt3cDU2TWtuaVBJNmFLZzA0SS9xMHRIdHZCbkdNK1Jl?=
 =?utf-8?B?QmFQU0JmbEkwTnhONitoWGlydlhXWjVyUmhnSTdqUmpDNXhTbzJyR2xKZ1kx?=
 =?utf-8?B?WjB3cGtSWWFESlg0NGdsT0d3T1JaczdwUmcvNnBheFZzYzdYWGtrY2F1VDVq?=
 =?utf-8?B?cUR1a3lWUm1NRWZJV3pCbWZ5RStVQVdXMnppYU5EUklSYXFjbldScks2a1BK?=
 =?utf-8?B?aStXUWZnUjNWY1ZZeGR5KzJmcVJCMlVObG8vazhZdWRLSXJxYkxmenFVamZL?=
 =?utf-8?B?UGhhaDFlVDZXN3QyV2VTRTRCY3N6Y2hBMSswa2pIamlWSVdwbFRGQllIR2xy?=
 =?utf-8?B?N2dCSDhTTWpialUvdTVkS1VjY2FIaG5yMVBnYi9PdEw2QzRFdjRLdnJIeHhs?=
 =?utf-8?B?K0hWQ2Q5bkQ0ZEZESXpXMkt4TlQ5OGhCZGJxVEZNYklYeWdaT2g5bC9SMjdO?=
 =?utf-8?B?UlI3TE5iR2pTemVHQjlvS1JSaktDYThoaWpTc1N6b1B1cm9KZm1NaDhvRkg1?=
 =?utf-8?B?ZCttd1VGZnRNZkFLM2hmbCtNWFFzL2J0bkxTdTIzdDNuOS8wYmNKSU1wcTZT?=
 =?utf-8?B?aStuY0tXRGZXZms3NmhwWGtDeElMSS9ZUWFnbnJpN2pGNXY0WHM0ZDZPdHE3?=
 =?utf-8?B?Y1NWWXlBVllaVnVPT2NSSnRaamdxckM1VkxZTGwyLzF4UWJESlhKRlc3ZS9i?=
 =?utf-8?B?dXRYczQvN3RrZmVyRFNmYmNmQ0dZWFM5UkQ4L3V2Qm9wSnkxUjMwMnNaUjB6?=
 =?utf-8?B?aEsvOEo4ZnNuSXVPTmhlbVdlYmdtOW12SlVnaEFGVFZPSXA5Zzd1dGRNNU5G?=
 =?utf-8?B?eURUL1JQcC9CWi9rRDVJaldralZzWDZJQXp0amRoZlZSdzcweGVldTkwOTdP?=
 =?utf-8?B?ZHIrazFhYlZGMUM4M1VPR2hJUEVDNGY4dnVpbERHS052anJBcnJ1UWFlUUl2?=
 =?utf-8?B?TTZFRkllcnFkd0xyNjU2c2dJQkFpcWh0QmNreFNUVlVHUFg1Sk1IWlE3Wkx4?=
 =?utf-8?B?WXB2RmVZQWlYWWxieFdQekpFOElHbzN0ZDRQMy9oVmlOTmpQbDlBeExUbXJJ?=
 =?utf-8?Q?A/NEammBSQIf4GB9CQoklto=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 373c5a69-c95c-4d01-6a1c-08dc95c63af2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:56:20.5690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZIjfpY8Dp59xtqtozBUi5ihSNX/5cxnHWgTJ5Vwj6InB2PmPW3CM9ml5mKLH7jlpW16aheyDmzxoFQ7IPXGfRG1H33q/wwLK5abCW7+E/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8679

The touch-overlay feature adds support for segments (touch areas) on the
touchscreen surface that represent overlays with clipped touchscreen
areas and printed buttons.

Add nodes for a clipped touchscreen and overlay buttons to the existing
example.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 .../input/touchscreen/sitronix,st1232.yaml         | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
index 1d8ca19fd37a..e7ee7a0d74c4 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
@@ -37,6 +37,7 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/input/linux-event-codes.h>
     i2c {
             #address-cells = <1>;
             #size-cells = <0>;
@@ -46,5 +47,33 @@ examples:
                     reg = <0x55>;
                     interrupts = <2 0>;
                     gpios = <&gpio1 166 0>;
+
+                    touch-overlay {
+                            segment-0 {
+                                    label = "Touchscreen";
+                                    x-origin = <0>;
+                                    x-size = <240>;
+                                    y-origin = <40>;
+                                    y-size = <280>;
+                            };
+
+                            segment-1a {
+                                    label = "Camera light";
+                                    linux,code = <KEY_LIGHTS_TOGGLE>;
+                                    x-origin = <40>;
+                                    x-size = <40>;
+                                    y-origin = <0>;
+                                    y-size = <40>;
+                            };
+
+                            segment-2a {
+                                    label = "Power";
+                                    linux,code = <KEY_POWER>;
+                                    x-origin = <160>;
+                                    x-size = <40>;
+                                    y-origin = <0>;
+                                    y-size = <40>;
+                            };
+                    };
             };
     };

-- 
2.40.1


