Return-Path: <linux-input+bounces-7477-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E4299FFEC
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 06:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BE521C245ED
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 04:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3203B18BC1D;
	Wed, 16 Oct 2024 04:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="eKGV5CfY"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2099.outbound.protection.outlook.com [40.107.104.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53946290F;
	Wed, 16 Oct 2024 04:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729051383; cv=fail; b=abaMM7H6h0E1zuVYdYUXyH4wQ+h+583/sYaku18l6Y0oDgNMg/xdYAExjZ1p47JRRRAtMlUZNE72BIEfU2M4yGFutsVPB5eSBNPPp91vHUKhf0w9cNdsu+WZE9ADPp8K8U3jUy8A3yNbGlD6RrO0oOvXj3LE0TGQC1jgbpE+1ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729051383; c=relaxed/simple;
	bh=6Rd06mzprzVBozWdIS79zpyXpkHY0oY+g8+KrxW3IOM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eJjRo/YU5MmxSbF57uOLyO0aqFNRj1xd+Ojou6+9yR9Wg99sDoQCEZ67b1Ye8R9S2k/6SO1UW1TsSV6/dLf7Dvr8XTFnopHBM898xlqmtEsG/14/PqCZrMznmDMfyNqKVjxkzvFfEKMfbBv6dC8n3Ex4rHINb3eOQRUiJ4yR5fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=eKGV5CfY; arc=fail smtp.client-ip=40.107.104.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dTpX33ZQR1uZl9d0uG2kPqOyEzUsb4JD92TJjlgBnRJnE9eqHpeaH1dLjbgIoYlkCgAWQ4pE7KpO/Yxi20x4vpJ5R4WAWrpVHLoU/w6rqPtL1SSEkBghYtXScygjJwzsH5WSORqulm7D1L3d+9V+l+UU0fKAd4td4ZrAMVOgQtTttPFepNfW5PxbKfFtXRVBtYb6XCxJgBCWUu5RHtzvdk73NOBCc/kIkObQA6HYFaYAB1qFGHk60caHgf+4ddR0etbKh7WOUqRXZE3IN5qNz3NrjRvKm+5Vvl24JJyefm8u2MBjhQhICgqekWdB+XlW9oKH8t0gVlglyenNr8qOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8aCWi7+qUdaWhJcJz61qNnK96Og/DumwNYjndfUjZo=;
 b=Lhm9ecbnyxP+/JjUltpT8Uz7U3WfJ0ltfmeiiDM9Lw4frY8LJ3hZ28ttMK3EfT6RDikUGeu2P4QOKLTTYxAdMuSjFdaRDLdV0GDnm1IBqLSMmDZyd6YRLxpTGML2WRP2NZetAvs3GqFLdWeWZFHTXyMefKzlfDewN11bMk+PoWY2uu8lHPQwr7i65I3jp11msaK9w9IP30J4tykZJ11szQ91qbWnEwp768GKC4Ca8MFvAtd92pHLCxqCy5Fne+xLb4ctGmecxGzBdhNCm6xThUjUKy8P1LvPg2smoEhYzg4OWEVPacMNz1lcOg6qUaTFrUWYRlD4KNTboWwlk1rIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8aCWi7+qUdaWhJcJz61qNnK96Og/DumwNYjndfUjZo=;
 b=eKGV5CfYd15QsTJFh71ooQMVWE+kngURGo6SWzMeJKknAy6blLUsobC0yQ/ePESxQFQbZanxmu4heIimvG4mMe9a/z2H4EucgwkTvEH5kCmb0aWZQfms21lRDterfpQ2BkE0mcO5iKYzjkHYQwe9l9ZYbaBKMiSYWmdjBvVBBTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com (2603:10a6:10:3fd::21)
 by PAWPR08MB10183.eurprd08.prod.outlook.com (2603:10a6:102:368::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 04:02:52 +0000
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4]) by DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 04:02:52 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 16 Oct 2024 06:02:43 +0200
Subject: [PATCH v11 4/4] Input: st1232 - add touch-overlay handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-feature-ts_virtobj_patch-v11-4-b292a1bbb0a1@wolfvision.net>
References: <20241016-feature-ts_virtobj_patch-v11-0-b292a1bbb0a1@wolfvision.net>
In-Reply-To: <20241016-feature-ts_virtobj_patch-v11-0-b292a1bbb0a1@wolfvision.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bastian Hecht <hechtb@gmail.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 Jeff LaBundy <jeff@labundy.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729051368; l=3162;
 i=javier.carrasco@wolfvision.net; s=20240617; h=from:subject:message-id;
 bh=6Rd06mzprzVBozWdIS79zpyXpkHY0oY+g8+KrxW3IOM=;
 b=VF44P9sxVB7wtJtTURWetgKIiz/ENaKIyFWiF/DEWnWiMyykkaPCFvM0ahcPkyKbrmIe7GSqA
 boT59t/HczUBYWKZ1/IJCieumLYG4wubuz8IHvD4EHVsgQtdoJ3e3n/
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=hfASRUP6l4lf3Lo2mjLM085/h37dT3m0Qj1HejXDPDc=
X-ClientProxiedBy: VI1PR07CA0154.eurprd07.prod.outlook.com
 (2603:10a6:802:16::41) To DB4PR08MB9190.eurprd08.prod.outlook.com
 (2603:10a6:10:3fd::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB9190:EE_|PAWPR08MB10183:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b06a46b-5030-4d04-a3e1-08dced976826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzBGK25mcnYxQXBTYmRPa3JhT1FWQzQ1ZU9GZ1FyK285UDdlK0FscmlneFpJ?=
 =?utf-8?B?OThnUnBzYU10YlZ2S1ZyMGJOQUVvZlNVOC9JQzFOWCs0bThrL29nK0Vudjk3?=
 =?utf-8?B?WHVVZklFK1pxQ241R0ErMjJyNTEvbUowU3J3NERERWI4cDhjNlZEOWJaV0I5?=
 =?utf-8?B?eVhlS1pZWlNnZGtYR1hVV3NBcWo5UVJZdFVYdzNSalR0dG5VTDRHSlFOQTUr?=
 =?utf-8?B?MGwzWG5sRXR2ajBZTDBJK1hGWkFwMnJQbmh5Q2NXb2V0a1NEYkhHc3FiRDMr?=
 =?utf-8?B?QjVINVNGNmI4L1IyampVUlZNb0ZSWkRMZzIxTmZBZ2xoS2U4YlZuUDkySjRn?=
 =?utf-8?B?OGFsbTZ3RTVDb3MwVDl6TisyVnY1Z2YrYlhhUGFuODZhQzBlVXJEbk1yRFpt?=
 =?utf-8?B?QTBlSUczRThFRFZ2NlUyVWNJTGFNNjAyOXNPaUkxbE9FZHdzS2FkMWVURXFF?=
 =?utf-8?B?S3pXTEZUbm5yaE1zM29xY05tREJML2Vmd0lZS3pvd0FDMk9YbEFWWGxPSEJj?=
 =?utf-8?B?N2hDY1Rsc1RSclhoUnNtNWYySDNSMnlXUVV5UFI0NlRRVHJxSm1ETGNUY0xO?=
 =?utf-8?B?eFhsOGcxMUxxTVNsNURmNU90eUJHOHV6VEJ5eXA0ZVN2czlsWXhtcUhSWjlQ?=
 =?utf-8?B?ZGhKZGFHTkQrSm1reGxzOWwrUHlKNUM5YkVwMitLWUtMUmVZZW50QklFUnNS?=
 =?utf-8?B?YmtKYzBDaHpFNkhqWUE2eGVGTHQwUkhjYWUyK2hTR081Z2FBbjExTUlIK1pL?=
 =?utf-8?B?SzFESWExSFlvOG9xL1F6ZDB0VnBuM24zNG5SWEdlTUhqSkpxQ3VDU2tQWWpv?=
 =?utf-8?B?VHZnVnE2Y0FnT01YdjNvNy9BQ0NxMTQ1QldwMDlsTVlkUGZ0WlZwdkVsdENq?=
 =?utf-8?B?S1NuQUNIOGM1OHFFL25YOXVIREtCMC8wZXpoTk1na0FRVHcvQ3RTRnVVbVpn?=
 =?utf-8?B?Mnh5OGwwa1gzNHpacnFJM01RSWx6enlKSkFwZ1p6Mmx6L0JFQUNkd0dkdlZE?=
 =?utf-8?B?RUJ1K0UrUDZaSzBpcklGNnIvWE9TU2EzVTg0TkEzd0dEVE9VTzBsOWtpQ2ZS?=
 =?utf-8?B?SjRSNjEycTVRcUg4ZklxZVJrQ3hyMHZrNnU1V3MveEw3MVBZbnhVQlFVUlJZ?=
 =?utf-8?B?UHlRZnNMaDg0N01qZ0x0OTlycjBadDNZd2pVZXhrd1F1SmN2V1JqZGozN0dJ?=
 =?utf-8?B?VDk3RmJXTDVnb3VRZGc4L0VMK0tUTHBxWGphTFQwbWU4aEthTjVtSm5pbHpN?=
 =?utf-8?B?aktId2R0SGoxN3lWQ1VpUXFrY0QrTDE5MnpiWityb1hONHFVZTh2NUpmTGpI?=
 =?utf-8?B?M2M1czRtaVJ0ZTlGVTdWd0duKzdvL2dUbTR0ZkZDRXY5cGFsQWpuUXkrR05n?=
 =?utf-8?B?Ykk3c2Z5Q3U3Zk5DdWZLWEYzck1mMEpZdHdLWHVoS24yclh5RGI0SmJiUWpY?=
 =?utf-8?B?eU9yMENoZXVVNFRXVFpyQlBSMWJlcjJZK3dpSXdhTFJJNXBtSDdoMEtjb09X?=
 =?utf-8?B?TzFuVXdFcU41d1gvaCtteVJSRUJLMWY3NU1pck9saDEvcWR4MHNiTGF2T0h0?=
 =?utf-8?B?Z0Ntdzg0K3lLR0dNcUR6SnFuQlpUM3ZuZ3ZIOGtUaHMybDJmd3pWVnBuTEJK?=
 =?utf-8?B?RFV6d2d3Z2t6dklxUXlIQTdUNXV4enZWcmM5ZFljVDNNb1pOaElrZ2RueEVo?=
 =?utf-8?B?Q0tzaVJ6VjNEcFQ1MWZORFh3VnAvWTVTbkZvQWN3RGgwenYxd3lNNzl6cDd6?=
 =?utf-8?B?TTIvdTN2NGh2TW9IS1RJNFFVN0xRSFI4TWNoTEZpTkdVZEFxL0E5VWNxNnN2?=
 =?utf-8?B?eHdXZGlhU3h4N09lVzgydz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB9190.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEFaRHBENG5rNkloWWxZcDMvemJhQ1pNcGlVaDA2ZWxNUHhJWEFhL29xbWtC?=
 =?utf-8?B?OFRQL2E1RUZOd3ZQcmdMeXpIdmZyY2NOeHl2N0l1dGZaY3R0VWVlNHd5RkxO?=
 =?utf-8?B?RTF1WUlrdTVTMVJXZkpCWnVuakVnWFVMTWtuN1JtcytuOUFzSU15SThwS2xN?=
 =?utf-8?B?WHFyYWxORmsvakp3VkJXQitTdXNuMmtUaHhuYkJobWg3c1M2ZWVzUEJUUlZF?=
 =?utf-8?B?Ty8rMGpzZ0RTUmJsVEhMeTdvV0xYTTR5WStKaThkUTl3R3BLZlY1eUJVczJk?=
 =?utf-8?B?Tjl0RmhzWHJJNDd1QWZjMUhBdTFvRkdZcVFEa1lncnNXaUZRMHZxSEg5Z0hZ?=
 =?utf-8?B?M25KT24vZjQveDNJUmRKNThXaHdZRko3eVcvcU9ycjRoWWRkb09xNlNlMEQv?=
 =?utf-8?B?bEhDNnZmVndWSGtxSmhRSkxJTjlsd2IwelkyY1RvdDlqN3dKMytlaG1nQTNr?=
 =?utf-8?B?ZTRHbzVWUUFDUnR2MDVnZ1BpQ3RBTDNwSVoranNQYlNDUjcxSFk0UFpkWU0r?=
 =?utf-8?B?T0R4OFNvRjdOS3NOSW1GYVkxWlZKbXZGSU82elpEbkx2Y1lISU5PUVg4cjRq?=
 =?utf-8?B?T2I4OXJWcDFYL1AvUjVuTVJlNjZ0VklickdnNm4wRWFNSmJLWWVSMUFnWkpK?=
 =?utf-8?B?SGRuNCtadmtaUmIzUXZGZklzSGlrSjJ2Nms4TUc1UlRtbUxuRHRzNEE2R0xO?=
 =?utf-8?B?c3dVZGM3U3FGNTRFUG1ZaC85QUZKSzdWODh4MjJuSjUxS2N1UVNoM0FCd3JV?=
 =?utf-8?B?dkh6RGtHZFlQMUVsV1JPZ25kcXIvOWM3UzRJeEZyS2gyZUM5eUFPQnpBSnBW?=
 =?utf-8?B?d3pDQlhYUXJUanNSTWQyVjhFVnhiVXhKcEJtQWMreVdXckpuQXoyV1hPZnhq?=
 =?utf-8?B?bCtlNGdSVUlOQnJUQmlocG13RXFqTTZFTmF4MU5DKzd0WGpBTU5NaStQbk5P?=
 =?utf-8?B?cHRGUXZlM0tMVW4xZ3c1WjI4NHFnZStadzBsUXR3ZDk0TmxRSkxnWWhXUFo5?=
 =?utf-8?B?V0wxeXozWTV6cFIvRWQwMmpPaithTllYNDQvdmk2UTl5K29RRXMzTUpFR3Y4?=
 =?utf-8?B?REE0VG1aYXRJV1NvMkxxY0JldU9FTk9MNk1INmZJUVNDZE93aTV5dURibXdG?=
 =?utf-8?B?b0ROUktBUktJb2JPRkh2Y09XRW1zR1R2eDkzQjJMVHpPaDBKVm91dmR3WWpL?=
 =?utf-8?B?a3RFYVMyS0Ywc2hLU3VBSWc5M1lyOVpyZU41djJoRzZVOG1kcjh2L0twdmxU?=
 =?utf-8?B?MEszTGp0M1FLSHBnZmVsTEczVWRYdmM2WjJ2ZHRFclVaOW9EQXMxZERkU1BH?=
 =?utf-8?B?dlRlWTltNHBkMkF5WVJGL0Z6RWM0b2dtMkJpcFI2RW1tTno5ZGQ1TFBJNUlN?=
 =?utf-8?B?UHVwM2dCSUZPMTBSbG1FUjhmMVVqLzJXUFN2ckdNQWZiekNIYndmRnNpK1JF?=
 =?utf-8?B?SzJNbDhTZExqcCthdkREakNDRDhZYkZZR1VKL0tibWRVZ3htWnNlYS9HODll?=
 =?utf-8?B?RU1mZG9RNDFlV2U5MUVzOGJyR1NqU2t2amZwOWlSL1lZZTRQaFd4c2JhYm9K?=
 =?utf-8?B?ZjJQWmxKRzdWT3I0L2lzVlFwTmZQTEIrVjBZR3ZnNHhuaUgyVGJORTcrMWJh?=
 =?utf-8?B?VVJRV092THJCOGtRNDRIR1UvTVJXT3JrMUlxdFZwcUlUdDc3RDQwRkVXNGIy?=
 =?utf-8?B?RVpFTFNjSXBjT29ieE80WGNiSmUrL3N4Yk82ZThQWlZXdTVLd0UvWFdVYWxD?=
 =?utf-8?B?OFpxa09nSjVQWHFRd0lYMCtHNEh3cnF3L09jcmQ0SktLaGVEbitZaVZiTERt?=
 =?utf-8?B?b2VORGFYMjdPYnhRM2tFK2E4SHBSU0tBMitjeTExQlhPQU1NT3I3MityVVN4?=
 =?utf-8?B?VGRDbmVRRUVoOE5GM3JCYkE0dFpYM1UxOEhXZzJQNGlWOC9UMGdKK1BhT1hV?=
 =?utf-8?B?Q1lTVlQ2b2pUM1V6czBCSUpJK0w1WktaTWVvK25hZitSMitBa1h4QjBpTlAz?=
 =?utf-8?B?c0x5T3B0VURzK0hVU3NmekJiMkZOT0d1Ykw2WGZIeUhwMUk5TCt3bWVwdWxZ?=
 =?utf-8?B?OW0zMWMrT24wSXVSeFBjMktDMjBHa2Q4ZmhCaHppOG9URDZIMmZabWZLVTQy?=
 =?utf-8?B?VnFMbDZ0eGkyTTZ5NEYzNTdIRFRQdVpqbnAxMFgySEhsemxMamlhZ1Z4Tm9G?=
 =?utf-8?Q?6tWxq4Wz7Q0H7/vSbCvCKDA=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b06a46b-5030-4d04-a3e1-08dced976826
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB9190.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 04:02:52.3570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29dSvq+SUhKTuL3IWz/FWbXwR6iwHkbIXALG2n31dbk+39ANFTU5x7ZdNWuR2not1GB0rHyaIohYokAtsLYNlvhwrLUCohXDORqeprAl/QQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10183

Use touch-overlay to support overlay objects such as buttons and a
resized frame defined in the device tree.

A key event will be generated if the coordinates of a touch event are
within the area defined by the button properties.

Reviewed-by: Jeff LaBundy <jeff@labundy.com>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/input/touchscreen/st1232.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 6475084aee1b..9b3901eec0a5 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -22,6 +22,7 @@
 #include <linux/pm_qos.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/input/touch-overlay.h>
 
 #define ST1232_TS_NAME	"st1232-ts"
 #define ST1633_TS_NAME	"st1633-ts"
@@ -57,6 +58,7 @@ struct st1232_ts_data {
 	struct dev_pm_qos_request low_latency_req;
 	struct gpio_desc *reset_gpio;
 	const struct st_chip_info *chip_info;
+	struct list_head touch_overlay_list;
 	int read_buf_len;
 	u8 *read_buf;
 };
@@ -156,6 +158,10 @@ static int st1232_ts_parse_and_report(struct st1232_ts_data *ts)
 
 	input_mt_assign_slots(input, slots, pos, n_contacts, 0);
 	for (i = 0; i < n_contacts; i++) {
+		if (touch_overlay_process_contact(&ts->touch_overlay_list,
+						  input, &pos[i], slots[i]))
+			continue;
+
 		input_mt_slot(input, slots[i]);
 		input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
 		input_report_abs(input, ABS_MT_POSITION_X, pos[i].x);
@@ -164,6 +170,7 @@ static int st1232_ts_parse_and_report(struct st1232_ts_data *ts)
 			input_report_abs(input, ABS_MT_TOUCH_MAJOR, z[i]);
 	}
 
+	touch_overlay_sync_frame(&ts->touch_overlay_list, input);
 	input_mt_sync_frame(input);
 	input_sync(input);
 
@@ -292,18 +299,30 @@ static int st1232_ts_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
-	/* Read resolution from the chip */
-	error = st1232_ts_read_resolution(ts, &max_x, &max_y);
-	if (error) {
-		dev_err(&client->dev,
-			"Failed to read resolution: %d\n", error);
-		return error;
-	}
-
 	if (ts->chip_info->have_z)
 		input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0,
 				     ts->chip_info->max_area, 0, 0);
 
+	/* map overlay objects if defined in the device tree */
+	INIT_LIST_HEAD(&ts->touch_overlay_list);
+	error = touch_overlay_map(&ts->touch_overlay_list, input_dev);
+	if (error)
+		return error;
+
+	if (touch_overlay_mapped_touchscreen(&ts->touch_overlay_list)) {
+		/* Read resolution from the overlay touchscreen if defined */
+		touch_overlay_get_touchscreen_abs(&ts->touch_overlay_list,
+						  &max_x, &max_y);
+	} else {
+		/* Read resolution from the chip */
+		error = st1232_ts_read_resolution(ts, &max_x, &max_y);
+		if (error) {
+			dev_err(&client->dev,
+				"Failed to read resolution: %d\n", error);
+			return error;
+		}
+	}
+
 	input_set_abs_params(input_dev, ABS_MT_POSITION_X,
 			     0, max_x, 0, 0);
 	input_set_abs_params(input_dev, ABS_MT_POSITION_Y,

-- 
2.43.0


