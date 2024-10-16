Return-Path: <linux-input+bounces-7475-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C402999FFE6
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 06:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDE891C242E7
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 04:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338A818A920;
	Wed, 16 Oct 2024 04:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="Z/WE3BpY"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2099.outbound.protection.outlook.com [40.107.104.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3243D189906;
	Wed, 16 Oct 2024 04:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729051379; cv=fail; b=gv3HiDDLPMD8NSUwBaKcfPWYt4ZxT9/2ex4vKECCulcwmCfOhcWU8To0J3fybQ1l/Lq4IO2HKlAELuWsN/TTe/25rorpZqUZxyvSz4yzaxT3f/i7a95BuF1jjnzSpAlH4Q7OzCI/Gz38ePOvFEY+2fvzu6MRzOngoTgfmAc5slY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729051379; c=relaxed/simple;
	bh=jdJvamDCLB03jG7UmkYQcoILhVnVlu7OFv5WsJ4UHqc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sfNBaoJ1HufgztxPPes2xz2uWtSNCTNkGkq8sxR0eegrP6Tv6BRaIw630/Y85/OS5Z3FrArMCIoepVLVBqLIGTFV9YeMrsdIsdk2wvpO5PWrnDljpfDK1LH6x89Sc8FqS0ZFY/0jEIl9+q2lw4a75Xn8nB37EofV8vx776ivvdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=Z/WE3BpY; arc=fail smtp.client-ip=40.107.104.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bw6xNYWCxd2ksNiAKDuHV0tBYJ9jiTaF5hlh9bsYnIGHdaKAO80j+B69GSoHLX5UDid6dLPHY0JkULBhYkVBk28VO9ap3BzD385MrFqjGOsHpLPujH+9WF02nFVwVFmV5z/wZcZwhNUq/He0UpT4sNSnFCTV2fMg2ymti9Rx459/sA6/VxhYBOUqCSCPbkLKWmjfMu/wWwIhDT5f4EQbw7mjDjivaN4oSZ26K4bp5l6WowY9+/l6CYksuA72MvTaX/qA6JaO+7vh+BIKJUd3/WR4H1W8cZIUBd6DUCsUL0bO6XMLCBL3wOIkWrSwEbfoBJWEIOrWkfUrsTwtbU69jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roCj5cj0UOTRVRR4/qbjDDBEx1tybxsLLqewz0ql7fs=;
 b=ies/FIlTT6HnNSAjZrgbbe65rXdFI1RmpFM2HWWqjU6MxBX3Hd0yTO9EM3iglGHk7ChlzvZpdxoVJmU/iYzMDHbHV+nh2xrNxW9nowvJixfMmgqSVVwh6AEcUF4SqlZGwBkkiSGOCq9Q2DnxiKZFPFnI8u4s/95VmbPTZ1aCay/O3rXu8Px+uhQAAFZuPNCVF56wQk2BxcVIQzzuqFUcw0Vy2fSl5wCUReTRvsRWhHsTjugbVftiubdreuTMx8UVDR0cW8pboWIJePoBzpCKB1wKzT0U8QJZQ4xPjmlEU2D9z9aNKpo5a1uYIXuRWmkmtYxd2WUNezDdq5xsAck0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roCj5cj0UOTRVRR4/qbjDDBEx1tybxsLLqewz0ql7fs=;
 b=Z/WE3BpYF2/DWfHQwMeKxsF7k7CelwHiZ3nEofvynWLGdzdMXjtn9XEePhvBxbMl6K39Csj3Z43V0z2J18LXt1AR+sBkJFgNl3heMCragfKpcEiv+Rkx/UqfUq425xcJu4rNmPMBTH9m9db8nJdkwvDRSPqzK7K2uMkXY4PUrXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com (2603:10a6:10:3fd::21)
 by PAWPR08MB10183.eurprd08.prod.outlook.com (2603:10a6:102:368::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 04:02:50 +0000
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4]) by DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 04:02:50 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 16 Oct 2024 06:02:41 +0200
Subject: [PATCH v11 2/4] Input: touch-overlay - Add touchscreen overlay
 handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-feature-ts_virtobj_patch-v11-2-b292a1bbb0a1@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729051368; l=11690;
 i=javier.carrasco@wolfvision.net; s=20240617; h=from:subject:message-id;
 bh=jdJvamDCLB03jG7UmkYQcoILhVnVlu7OFv5WsJ4UHqc=;
 b=MOF9v6orUPG7u1JyizROmgsCf7RZnL11Ki0tgFvsi59Onp/9Iknu/0z08qSNHPMHe59zWDnNq
 JXI5i96zSZRCJW5vjBojCeOU5NCmNfX/xzR8/Yp5VEtnHP6rdYkRdjr
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
X-MS-Office365-Filtering-Correlation-Id: d12cadb6-6201-410c-3de6-08dced976740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1hVZlZzbkY1ODBrS2xtWkM3dGtqOWFrSU5TSkRLSXEwVTJadFR1SzJyL2hy?=
 =?utf-8?B?ZE5aam9FaE81SUs2WUllb2t4VkZ4K0d4ZU5xYVE1eFBiSlNiUEZWRzRYekdM?=
 =?utf-8?B?UVlEVWY4S1hUOEF5Nzk1M29xQVpqTlBvZXBMMEMzYUtiODVCSUJ2SmZoc0ph?=
 =?utf-8?B?N2VERm9QZE4yNDBJbXBlOEFFTmVLVGYxNUx0bXhRbDMxUlltS241MmlZWFZG?=
 =?utf-8?B?Nmw2Mi80aTVMYXhWRTY2VW5naFpCakpWUGZwalNPY0hyYStaNzJlckZqQmNO?=
 =?utf-8?B?R2xRamhVeVByQXNJSEt1aCtSb1Y4WVczbUhmTWUyMHNCcGJPLys5MlRjOTl1?=
 =?utf-8?B?S1BHYzBrMmV4TEdsOGI5N3cwMTA4MllWb1VhejhscVROL1ZwNEhkTU5TOEVT?=
 =?utf-8?B?MEhOaWVqdnVQME01MnNXNWRyYkJlU0NkQXplT1JvOFlRaDdCcmI2SFQ0Wmx1?=
 =?utf-8?B?d1dkN0tubGZrdCtMcFFVRlV6SVVPZzNlWU5tUG93Y21iRFBEdDh5U3N3MXR5?=
 =?utf-8?B?V3Qxc2xZdjM2MHhIa0g3QlNZL0NVT2kyNjNISm1ocE1mVGNDQWxWUTFXVDB2?=
 =?utf-8?B?TDA0TmUwcFZsbjhITkFSVlg0VEFTSzE5cDg0OG9hUW1WcTE2MVVWc1hNbDN6?=
 =?utf-8?B?ZjdZUWZlSVNVZjNDM0dsUnJ5UEEySzdkSnhBZHR3cktSRS85S3FvRFBNeXgr?=
 =?utf-8?B?YnBPRkN0T0hhYkZmYzNWWU9Td1ZTY0FGZUdiSGM0VEJ4MTdIejAvT1ViZ0Ji?=
 =?utf-8?B?MkwvNGY1dWUzcEwvU2RxQlFySWo4MW51aisvZGRrOFJrSHVEbUVmNXJYVTNS?=
 =?utf-8?B?Qks2Nzd6RjV2dlNVMXArMzN3bmxTNDBVZENVcVFJMjBLWU1ZY0U3NjFPM0lM?=
 =?utf-8?B?dkVzYkJVeEtFRmN3OHFRc2tUY2l5eGJRY3hlTUcvdWhwWm1QY2RUeHJuNU9t?=
 =?utf-8?B?eWJLZGpGYXRRa2c2Tm9WZFBDWVc5ZCtYTXRGRERWV0hTbTJaL3NOK0VreTBk?=
 =?utf-8?B?SXJJRnk2TU9wcDVWenNJSGE5T09tdVpXcTB0YXorSjM2aE5pZFoyaHl6R1ZQ?=
 =?utf-8?B?THNaQVdZVXBNVDJ6RjJqMy9iRnk3cElLeEFvQ085LzgvNEd1WWRKNWhaSkxN?=
 =?utf-8?B?YTNIdFdRck1zY1ZVZmRHOG82WTRpNlFLbnRWUnFSU2dJVlZBMlMwbC82Zldw?=
 =?utf-8?B?bUpBbEdXYWhMbWpka3lsemdyV010ZkN5d0V0Y0VIZ1dqY3N5N00wL2xOVTVK?=
 =?utf-8?B?QkRnbU45VC9ESEd4QmpPd085OVFSWlhuNlRILzFCaFZjWEk3S0VqdERiN3Bu?=
 =?utf-8?B?anBzNTlHQUFDdXZzaFMrQ0lEZXg3c2czcmFqRkJjSS8wMGpEQURSSWpEUTdI?=
 =?utf-8?B?Z1kreTVZOEt0TlZWS1lMOGUzUlFHKzNvM08xV01wVUlmcXhFUnNmQjNWejZm?=
 =?utf-8?B?QWtjandZaEx2UldabGxOdGdtZ2ZjQ2ZMdkc2KzNjS3BzakMvcHJnc0x3SGVa?=
 =?utf-8?B?NmtQdWRlYnRhUXNWTFQvOE4waWpvcnNwbXJjQ0dWN0ovbjI0NmpCaGtJdnlj?=
 =?utf-8?B?MEZMS2EvQ0ZNdjFEbU9YK2R2VmFSME14T3V4Ky8zUlV4d0xnamtZRjZubzZN?=
 =?utf-8?B?QVZEOWJGQWYza0Z0Q1A0ZzB3dmthVXVWTzA0ck01empOK0t5VWxLNWlCbHUw?=
 =?utf-8?B?WWt1eW1HTU1lbVBEMytjdnp2K0NRRVRvMXdpQ2Vta3dEZDRKSzFYUkVGVDhM?=
 =?utf-8?B?aEtEeXEzYlFEVFM1U1ZNV1ZxMkxYT0l3TzhuYlM1Ry91K2FFbXQwbjd2TTd5?=
 =?utf-8?B?dnZabjJJaEVOckNwazZlZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB9190.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnlJRHF5aGkzK3krK29iZW5nWmdGQS9EbU9YQmJJMU5ZaEx6cEVZc0dlT2o2?=
 =?utf-8?B?WGdMSFlqYnZITnFOOXhOa1VjNitNUXBOQlJCczg0Vk1yREZuK25CWHE1NG15?=
 =?utf-8?B?azFtSk5HZERqaExzNTJudWdDVEFXU01QcnhFZ3BCbVNVODI5Ukx3K0RqK0I1?=
 =?utf-8?B?U3JRU2ZNNUpJUm9BY1U3MGdhWGdQdTM4d1BFMFZkaDV6N3ByV3c5VDREQVRX?=
 =?utf-8?B?ZjRrdEFXelhtdFh4T3NPTFFSZENYZHg3bWptdi93Mm9YVkhOdVdIbTBhWXNC?=
 =?utf-8?B?WUhlcU1wMG9SWG1jQnB6Rmd4K3M0V2h1UHBGSEllRVc2RkRhSlExRlA4eGtv?=
 =?utf-8?B?NVRSdnRDQ1VQSlloMzRaazg1aHpabjJtWlJ0QlBHc2xSR003OGgvMHI3QVJi?=
 =?utf-8?B?bUJEZTB3bHdsYzR6eEhwSDJacWRRWktHQ0J4d2JwMkptMkQvUWQrTndkSWd2?=
 =?utf-8?B?REpMRlJCZ2hIMW5hbFVzZ2w2OTUyWlBBVGlmTldiSFhhcXVjaDFFdDJYQ0VR?=
 =?utf-8?B?MGlweEtFakpHZ0F0dUJKSXBRQnBSNHRaWGEycjN3NGhhcWR5RURZbXBUNmtt?=
 =?utf-8?B?VTFaSTI4MTc0bmNNbFMzRDdTU1cvczFIeitwRndneWZLUFNKMkFOMG9VK2wx?=
 =?utf-8?B?ZmEzVDNjN09iNTlOZUtVckRiakc4Y0FOVnpPaWp0cW1ZS3oxclZjRk1kYVNG?=
 =?utf-8?B?SXVmb3pHSGwwRmJkNVlMZlhjaHZjbzVjam5GeUFiS2ZIMkwvVWxKOGVvQ25Q?=
 =?utf-8?B?SERtMEdneUpKWWxUNnd3RWlidVFzNS92Skg1M2kzcTRhSWlOQXFOWGU5SzJw?=
 =?utf-8?B?OHI4c3J5ZnA4ZDg4YXR3QXcwUDZudzJDQnZpYXJNQUZBL05uUE12YmVYZzlz?=
 =?utf-8?B?RE0zNmN5cDIxOTZPbWZjMkduVzBoN29zVHRORVhmTVZvZmVRUDBybCtEc0FF?=
 =?utf-8?B?MzdrLzBaTXQzUVdqT3BMcTAvd0E4OXVJRm9YK05BeUNzNVZYamRkemlMZlJO?=
 =?utf-8?B?cVpyeitpS1dRQ0ZtSWlEOFllWThtUERCK090L29RK1RmaDhKOEhtck45RmtB?=
 =?utf-8?B?TThYYXZOMk5NcUJtUmcxTmpDRTlyNUpaVHduankxZWpTUWVNM3JGUFpDTHVu?=
 =?utf-8?B?Vk1TdjhDV084T1lEcld5Z3MyRHhpMVliUWxWUTVZSGRaTUlwSzFLcDBvQVp0?=
 =?utf-8?B?Y0QrdnZWZVRIU0NjS3VoUmVOZyt0WmEyWGZhWXovcGo3T0RoVlpqekNiUkx1?=
 =?utf-8?B?RWFYdVp1MWFONmgwN1BvRUo0OGZhR3RBdVM0Wmt0VktGZFd2eHgwTHlxVVJh?=
 =?utf-8?B?c2xEMVY1NFRiQ2dMcE96NjYrbEZtMFVzTnV0SHA3UlpNUVVsL3RGWWo5V1Ri?=
 =?utf-8?B?VXFhK2ZXaHlDZUloREpKSk9aVitiSTZhY0J1Z0dFZ3JYamJnMUtFd1JTOVZR?=
 =?utf-8?B?NlorT1JlS0xDM3FLNUV2V3ZGb00yNjB5cVpMekV2ZC9BRmNSZ0Z2Q25WZEUz?=
 =?utf-8?B?SDFiMXd4MVNTOHBnZm8wajhhd2s0VllKUGFySWNZYlc1dVhmNmlMdjdWa2F5?=
 =?utf-8?B?Y2hJZ0tsYlpaUk54d1hvcXRrc09yOENLOEQ0T1M3aTVBcXJoYjVETnNnMStD?=
 =?utf-8?B?L09TeTZ2TXNqaXAreTUzbktRVjE2QUxPd2FtQ044anRFOFJmSk9ZL0JYalRL?=
 =?utf-8?B?OTk3ZDZ4ZkdIRWl1anBmbjd2K1lBVjNrTFc5S01sbDdlWVlqR2lyU2U3YlJo?=
 =?utf-8?B?L2VpMXh4U3VmUmNJb0U3NWM1aWNWVmFWdFR2MFRRN1VCTlR5Sk1paU1rM2s1?=
 =?utf-8?B?WHl4NVRueEw1ME9nbm8waVVoR0hWUHNjQ3dmanF0ZC9UNnVYUEgxVUhmdUJX?=
 =?utf-8?B?VlFQMFEwN1huc3JENENQNTlPWWluUTF1cC9PcmlDckNhaWh5bkkwYW83MnFL?=
 =?utf-8?B?eEdwK0tBK3dtaTVzTHZ3TlRNQ3NuaG5JVWp3M2dhRkdaRUFtVzBRS1Uxbm5z?=
 =?utf-8?B?RDBLeW9SMFZIU1gwWlRQZXovY1lONTFJQnpjcGM2anFKUTVtRlBxTWZHWHdj?=
 =?utf-8?B?Tm5zRFZ1M2lwMlM1VDdnMTA1SnVjdFB3cUZMMjBoNHcxY3AxS0l5SUpIcENW?=
 =?utf-8?B?V1lFK2Q1dyszTEVaWnhyNXA0ZEdIaDlnSFN1YWlBb3pBb1VFUXY2Mlo5S1dK?=
 =?utf-8?Q?bxh3racgFHWZPZg0mIuiuL4=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d12cadb6-6201-410c-3de6-08dced976740
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB9190.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 04:02:50.8603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ML54QFZoRIBNd5xUsARMQNAdokpPQYEUyqdKx8oVSl6e/m1tHwm+YRvlu6tkhmxbRfPCS5Qxo2nlW4IdjAgVcZh1AZ1X8xrgV/vNAcs8WLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10183

Some touch devices provide mechanical overlays with different objects
like buttons or clipped touchscreen surfaces.

In order to support these objects, add a series of helper functions
to the input subsystem to transform them into overlay objects via
device tree nodes.

These overlay objects consume the raw touch events and report the
expected input events depending on the object properties.

Note that the current implementation allows for multiple definitions
of touchscreen areas (regions that report touch events), but only the
first one will be used for the touchscreen device that the consumers
typically provide.
Should the need for multiple touchscreen areas arise, additional
touchscreen devices would be required at the consumer side.
There is no limitation in the number of touch areas defined as buttons.

Reviewed-by: Jeff LaBundy <jeff@labundy.com>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 MAINTAINERS                         |   7 +
 drivers/input/Makefile              |   2 +-
 drivers/input/touch-overlay.c       | 277 ++++++++++++++++++++++++++++++++++++
 include/linux/input/touch-overlay.h |  25 ++++
 4 files changed, 310 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f..898083ea3a1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23478,6 +23478,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/toshiba-wmi.c
 
+TOUCH OVERLAY
+M:	Javier Carrasco <javier.carrasco@wolfvision.net>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/input/touch-overlay.c
+F:	include/linux/input/touch-overlay.h
+
 TPM DEVICE DRIVER
 M:	Peter Huewe <peterhuewe@gmx.de>
 M:	Jarkko Sakkinen <jarkko@kernel.org>
diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index c78753274921..393e9f4d00dc 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -7,7 +7,7 @@
 
 obj-$(CONFIG_INPUT)		+= input-core.o
 input-core-y := input.o input-compat.o input-mt.o input-poller.o ff-core.o
-input-core-y += touchscreen.o
+input-core-y += touchscreen.o touch-overlay.o
 
 obj-$(CONFIG_INPUT_FF_MEMLESS)	+= ff-memless.o
 obj-$(CONFIG_INPUT_SPARSEKMAP)	+= sparse-keymap.o
diff --git a/drivers/input/touch-overlay.c b/drivers/input/touch-overlay.c
new file mode 100644
index 000000000000..8806373f7a4a
--- /dev/null
+++ b/drivers/input/touch-overlay.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  Helper functions for overlay objects on touchscreens
+ *
+ *  Copyright (c) 2023 Javier Carrasco <javier.carrasco@wolfvision.net>
+ */
+
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touch-overlay.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/property.h>
+
+struct touch_overlay_segment {
+	struct list_head list;
+	u32 x_origin;
+	u32 y_origin;
+	u32 x_size;
+	u32 y_size;
+	u32 key;
+	bool pressed;
+	int slot;
+};
+
+static int touch_overlay_get_segment(struct fwnode_handle *segment_node,
+				     struct touch_overlay_segment *segment,
+				     struct input_dev *input)
+{
+	int error;
+
+	error = fwnode_property_read_u32(segment_node, "x-origin",
+					 &segment->x_origin);
+	if (error)
+		return error;
+
+	error = fwnode_property_read_u32(segment_node, "y-origin",
+					 &segment->y_origin);
+	if (error)
+		return error;
+
+	error = fwnode_property_read_u32(segment_node, "x-size",
+					 &segment->x_size);
+	if (error)
+		return error;
+
+	error = fwnode_property_read_u32(segment_node, "y-size",
+					 &segment->y_size);
+	if (error)
+		return error;
+
+	error = fwnode_property_read_u32(segment_node, "linux,code",
+					 &segment->key);
+	if (!error)
+		input_set_capability(input, EV_KEY, segment->key);
+	else if (error != -EINVAL)
+		return error;
+
+	return 0;
+}
+
+/**
+ * touch_overlay_map - map overlay objects from the device tree and set
+ * key capabilities if buttons are defined.
+ * @list: pointer to the list that will hold the segments
+ * @input: pointer to the already allocated input_dev
+ *
+ * Returns 0 on success and error number otherwise.
+ *
+ * If buttons are defined, key capabilities are set accordingly.
+ */
+int touch_overlay_map(struct list_head *list, struct input_dev *input)
+{
+	struct fwnode_handle *fw_segment;
+	struct device *dev = input->dev.parent;
+	struct touch_overlay_segment *segment;
+	int error;
+
+	struct fwnode_handle *overlay __free(fwnode_handle) =
+		device_get_named_child_node(dev, "touch-overlay");
+	if (!overlay)
+		return 0;
+
+	fwnode_for_each_available_child_node(overlay, fw_segment) {
+		segment = devm_kzalloc(dev, sizeof(*segment), GFP_KERNEL);
+		if (!segment) {
+			fwnode_handle_put(fw_segment);
+			return -ENOMEM;
+		}
+		error = touch_overlay_get_segment(fw_segment, segment, input);
+		if (error) {
+			fwnode_handle_put(fw_segment);
+			return error;
+		}
+		list_add_tail(&segment->list, list);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(touch_overlay_map);
+
+/**
+ * touch_overlay_get_touchscreen_abs - get abs size from the touchscreen area.
+ * @list: pointer to the list that holds the segments
+ * @x: horizontal abs
+ * @y: vertical abs
+ */
+void touch_overlay_get_touchscreen_abs(struct list_head *list, u16 *x, u16 *y)
+{
+	struct touch_overlay_segment *segment;
+	struct list_head *ptr;
+
+	list_for_each(ptr, list) {
+		segment = list_entry(ptr, struct touch_overlay_segment, list);
+		if (!segment->key) {
+			*x = segment->x_size - 1;
+			*y = segment->y_size - 1;
+			break;
+		}
+	}
+}
+EXPORT_SYMBOL(touch_overlay_get_touchscreen_abs);
+
+static bool touch_overlay_segment_event(struct touch_overlay_segment *seg,
+					struct input_mt_pos *pos)
+{
+	if (pos->x >= seg->x_origin && pos->x < (seg->x_origin + seg->x_size) &&
+	    pos->y >= seg->y_origin && pos->y < (seg->y_origin + seg->y_size))
+		return true;
+
+	return false;
+}
+
+/**
+ * touch_overlay_mapped_touchscreen - check if a touchscreen area is mapped
+ * @list: pointer to the list that holds the segments
+ *
+ * Returns true if a touchscreen area is mapped or false otherwise.
+ */
+bool touch_overlay_mapped_touchscreen(struct list_head *list)
+{
+	struct touch_overlay_segment *segment;
+	struct list_head *ptr;
+
+	list_for_each(ptr, list) {
+		segment = list_entry(ptr, struct touch_overlay_segment, list);
+		if (!segment->key)
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL(touch_overlay_mapped_touchscreen);
+
+static bool touch_overlay_event_on_ts(struct list_head *list,
+				      struct input_mt_pos *pos)
+{
+	struct touch_overlay_segment *segment;
+	struct list_head *ptr;
+
+	list_for_each(ptr, list) {
+		segment = list_entry(ptr, struct touch_overlay_segment, list);
+		if (segment->key)
+			continue;
+
+		if (touch_overlay_segment_event(segment, pos)) {
+			pos->x -= segment->x_origin;
+			pos->y -= segment->y_origin;
+			return true;
+		}
+		/* ignore touch events outside the defined area */
+		return false;
+	}
+
+	return true;
+}
+
+static bool touch_overlay_button_event(struct input_dev *input,
+				       struct touch_overlay_segment *segment,
+				       struct input_mt_pos *pos, int slot)
+{
+	struct input_mt *mt = input->mt;
+	struct input_mt_slot *s = &mt->slots[slot];
+	bool button_contact = touch_overlay_segment_event(segment, pos);
+
+	if (segment->slot == slot && segment->pressed) {
+		/* sliding out of the button releases it */
+		if (!button_contact) {
+			input_report_key(input, segment->key, false);
+			segment->pressed = false;
+			/* keep available for a possible touch event */
+			return false;
+		}
+		/* ignore sliding on the button while pressed */
+		s->frame = mt->frame;
+		return true;
+	} else if (button_contact) {
+		input_report_key(input, segment->key, true);
+		s->frame = mt->frame;
+		segment->slot = slot;
+		segment->pressed = true;
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * touch_overlay_sync_frame - update the status of the segments and report
+ * buttons whose tracked slot is unused.
+ * @list: pointer to the list that holds the segments
+ * @input: pointer to the input device associated to the contact
+ */
+void touch_overlay_sync_frame(struct list_head *list, struct input_dev *input)
+{
+	struct touch_overlay_segment *segment;
+	struct input_mt *mt = input->mt;
+	struct input_mt_slot *s;
+	struct list_head *ptr;
+
+	list_for_each(ptr, list) {
+		segment = list_entry(ptr, struct touch_overlay_segment, list);
+		if (!segment->key)
+			continue;
+
+		s = &mt->slots[segment->slot];
+		if (!input_mt_is_used(mt, s) && segment->pressed) {
+			input_report_key(input, segment->key, false);
+			segment->pressed = false;
+		}
+	}
+}
+EXPORT_SYMBOL(touch_overlay_sync_frame);
+
+/**
+ * touch_overlay_process_contact - process contacts according to the overlay
+ * mapping. This function acts as a filter to release the calling driver
+ * from the contacts that are either related to overlay buttons or out of the
+ * overlay touchscreen area, if defined.
+ * @list: pointer to the list that holds the segments
+ * @input: pointer to the input device associated to the contact
+ * @pos: pointer to the contact position
+ * @slot: slot associated to the contact (0 if multitouch is not supported)
+ *
+ * Returns true if the contact was processed (reported for valid key events
+ * and dropped for contacts outside the overlay touchscreen area) or false
+ * if the contact must be processed by the caller. In that case this function
+ * shifts the (x,y) coordinates to the overlay touchscreen axis if required.
+ */
+bool touch_overlay_process_contact(struct list_head *list,
+				   struct input_dev *input,
+				   struct input_mt_pos *pos, int slot)
+{
+	struct touch_overlay_segment *segment;
+	struct list_head *ptr;
+
+	/*
+	 * buttons must be prioritized over overlay touchscreens to account for
+	 * overlappings e.g. a button inside the touchscreen area.
+	 */
+	list_for_each(ptr, list) {
+		segment = list_entry(ptr, struct touch_overlay_segment, list);
+		if (segment->key &&
+		    touch_overlay_button_event(input, segment, pos, slot))
+			return true;
+	}
+
+	/*
+	 * valid contacts on the overlay touchscreen are left for the client
+	 * to be processed/reported according to its (possibly) unique features.
+	 */
+	return !touch_overlay_event_on_ts(list, pos);
+}
+EXPORT_SYMBOL(touch_overlay_process_contact);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Helper functions for overlay objects on touch devices");
diff --git a/include/linux/input/touch-overlay.h b/include/linux/input/touch-overlay.h
new file mode 100644
index 000000000000..0253e554d3cd
--- /dev/null
+++ b/include/linux/input/touch-overlay.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Javier Carrasco <javier.carrasco@wolfvision.net>
+ */
+
+#ifndef _TOUCH_OVERLAY
+#define _TOUCH_OVERLAY
+
+#include <linux/types.h>
+
+struct input_dev;
+
+int touch_overlay_map(struct list_head *list, struct input_dev *input);
+
+void touch_overlay_get_touchscreen_abs(struct list_head *list, u16 *x, u16 *y);
+
+bool touch_overlay_mapped_touchscreen(struct list_head *list);
+
+bool touch_overlay_process_contact(struct list_head *list,
+				   struct input_dev *input,
+				   struct input_mt_pos *pos, int slot);
+
+void touch_overlay_sync_frame(struct list_head *list, struct input_dev *input);
+
+#endif

-- 
2.43.0


