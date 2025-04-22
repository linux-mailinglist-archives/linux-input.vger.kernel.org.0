Return-Path: <linux-input+bounces-11912-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E99FA95CED
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 06:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FBF31667B6
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 04:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E219319FA93;
	Tue, 22 Apr 2025 04:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DVI01wA3"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF73196;
	Tue, 22 Apr 2025 04:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745295912; cv=fail; b=J9PaF3TKi7nEpoo1frqMUUTb3GkKvXrkBCCSdtazyVP84YCcevHEFb9DPqamfkrJnU8b4on5ZK9rm54vcxXo4MVtAUlNZuFnVrwWiugbvYtA9su4pT+c4IK0lfe5FOR/Zplw/4GrqK+dhi4XwSDShWj3tHnEIFLTwjZOLgbyfCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745295912; c=relaxed/simple;
	bh=+SRJSx0P1ayIvvdLlROrnAkcy/GOpJzm+wd1HwMszDg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qzht2XFCFSnNA1xwMq9Y3kbIWwUkXRH390OBrkNlCQUd63DvRBJFd1uuJ3UeJxcjIW/tmr53wwXPIevyRDPE8j2azXtHlGjbJorrDB9TMky75OAhS1jvJFbTPfsh27XYBFL3aIXevrYsZZwzOHQCOGksfmHmJPZobkGLV8BuD9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DVI01wA3; arc=fail smtp.client-ip=40.107.94.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyIxs69HOXjyHrSt/YQzos+B+con8jNzmx1gJD1XjvdYBMb3z/IcZu58R8BH7MBM0sxHYHl9Ylv6yIg2djU9KMfJe0znvBuvQ4XJa1n/qzkLL+ReQFlrPEo0FLRKUdaTUFsY6UeewaHaQouEvVMiCjnhwmW/sgi14Etk3zZv02auZTNJDAYDTyMG9EVFZNcMUxUttjsUd0fLkkoY4MX5LYl5ughEPu9SRi5o6Nc0OAsW4Y+iAfYmx2XMNZIsnXYeaDWBXGew+ASq+l7ef0Y/ii7Fgeh/oSiCUnys2HJDMfNTkrJ4LlzW9rNGbkfw2w4rww9m6VtFXh7WeXhytT3SgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oa2dgJIyaViItZ/hcmW56punr2MP/mThT2gKq+QRys0=;
 b=t4huFxer9OKYdAhHDbm4aOnbCQ7d6y7BzzIMVmJcEn0vfbNOYqMfpZYzuFyL7OalmvzyD/Qw0/NVLP2QSRTTltEfKilvwg3ZKxDaDTdfaAC93VdQEFH1b+ZtlxqY/wCenLP6DC8+3SkNbA0zn3Q2tk5UM7PQrM0ZzC8fW+4nmclDsvk8FB9AhRI9aJv11CoDlzNUn76aFIwAfGsDJNE3MwcOpD8s4YC8GhvnM8gSDCJYGth31tXUufxZm0sxwb05CKYndU4nCf021g3+dfTpx8rJ/d/AUZnv1Eig1l3wmC00gBmxP+d8YZ4fSGgRJ2T4DHk1AdeN45OwUDipfXVEmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa2dgJIyaViItZ/hcmW56punr2MP/mThT2gKq+QRys0=;
 b=DVI01wA3Dk7ZKHJAZPXNTlHe4FjB9b7MplYo+uMGZj2wuUW1tGuqcuy7jweWYkX2oI3jvpSU153D6xhT2a4ZGzq1U/obAx1aQTGHxSKsbAZ67c/rg42eTZW/zf3lTCoRzgUMRojcn5oRA5uME8wVBrYeWrCDD8hxba71B8me7vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 04:25:08 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 04:25:07 +0000
Message-ID: <3055e872-176b-4189-a735-aa9caebc207f@amd.com>
Date: Tue, 22 Apr 2025 09:55:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 RESEND 0/2] Fixes for SRA sensor handling
To: Mario Limonciello <superm1@kernel.org>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:AMD SENSOR FUSION HUB DRIVER" <linux-input@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250421213210.1160665-1-superm1@kernel.org>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20250421213210.1160665-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0039.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:271::13) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|PH7PR12MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d1f11f-7e1a-4bdb-4e0f-08dd8155a972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmtoVjJ0WmF6ZWVNMkxJSTNmRlNocjFZR25MbWliQ1JkTURMK3BkWTQ1cXlQ?=
 =?utf-8?B?aU8vbmdzZ3ByZittZDhkQjNsYUdleGhHYlhUWitHRjh1dlBzbEJWTExZcklC?=
 =?utf-8?B?dXNLVU45RDA0L2pPM2NKNW9mQVB3RkozVmVQMFZOcWE2cVo0THdITjdMV0VY?=
 =?utf-8?B?QlV3VzlxM21oOUxSMDZQYUV5cFVwajkzaHlkdFRFTEVOQW1yZjlqZlZ4SC9L?=
 =?utf-8?B?YTFoanByUEhvUUlmWEdpUDZlTkFMejRibGNFZzIzUjV1Vk82RUxuSEtBa0xk?=
 =?utf-8?B?MjcxTFNCWklPMWVrRWo2Y2kwbGt5Z0Z5REdscWI1K3p1TzVEUkRTK3JqUVJa?=
 =?utf-8?B?ejlFbU9PZWlialN1WVl3RitoTVpOMGRMeUJDaHhZWWYvSlJSWVVVRHJCeGM1?=
 =?utf-8?B?dUZBbUVPcWd6amZZWkJEVk92aG5aUWlEMEZlWUUwQStPQlduVXlOUWtMMWU0?=
 =?utf-8?B?L0h4c1lsd2dLWE8xUWxOTlNuZjhna0pmWlRZV3p1ck4rb2pKalRYZkpjQ1Jr?=
 =?utf-8?B?YjV0QjFDSysrUFdCRDljcXNpV3VzYURRUWM5aDN1d1lhdEFaaUIrRlIybXZi?=
 =?utf-8?B?MkNHS3lpSCtxUGpQcVVaZ0F1MWI3akJoSm93QnVMTC9lNEFyRnlSTXQ5b3ZM?=
 =?utf-8?B?anNnbmRaRmI3MlBtTE9hWTh3bi92U2FYRUhVdG5TVE1CaTVxcHJoOU1VU0Z2?=
 =?utf-8?B?U2xVejN0RjZvWXhYaDRBYXZISmVKQmVVYUVZVnN3d2dWMEQ5TDBGNDFQemRx?=
 =?utf-8?B?S0RaUnJiVUo5eHZyMGg1Umw0V0s0K0YyMDQxSlVaZVdyU2x4YVk2WVh4QTVO?=
 =?utf-8?B?c2tFRGlWbXZBb2ZQRzBobFBZUzhrQVdjdGFSalcycG9lSWt5Mk8yYnl5S2xU?=
 =?utf-8?B?bHNjOXZVaXA4OG9SQm9GcFp2YUpjZTZheXlDMUdRZjRuZ3h6UytNTGhuNTFW?=
 =?utf-8?B?b2FVY2hzTnlQenp0NUg5b00zaDZKQ296OFlJa0xKSmhkMjMxVGhjbkJmb1BZ?=
 =?utf-8?B?YjZmdklmNTljenJEUnQvcjRBdkNRSWtXQ0NSeExMSlh5WmozakVWTUo5Q2Y4?=
 =?utf-8?B?VlM2c0VHZFlDOVM4K0ZIR1J1cHZLVjNLVnJvdUlNOE5zUlF2VUp5MVlraUFk?=
 =?utf-8?B?dC9RQW5EM2hIRHF0cGpKQ3JFNXk3WmdLY0g0enJpNzkxNnlRQUdZWkhpQXNH?=
 =?utf-8?B?YVZKVy9aUWFzWGtDYnFQMkRDMDRaWjFIektBU2VWYUNYdXowZjZDNGhTUStV?=
 =?utf-8?B?Y2RSWW1lQjMvSy81M3o3V081ODdvWEhEQmJZUDhaRm5jMVE2bE9hUDFSQUpH?=
 =?utf-8?B?NzdKVnE5WjZldmhqZ1h2eDFEeEc5QTVqbGhBUG9iWXpjUTdXbm9TOEkvMFVv?=
 =?utf-8?B?ZTJjNE1RUGdkOC9WNlkxcTBENmxLZ0xpeTIyWTlwTXhmR2M5eWs2bTR1MDJW?=
 =?utf-8?B?UWFOUnVxTHozU3N4L21yM3VnVU5XM0E2bzJuQTUvQStvRThkUXgvZjEvenJI?=
 =?utf-8?B?bjh0WTBLdWpZaS9zNlhEdXFEWjA3c0MzRXdxN0IwL2pOS0xWNXk5bjZOV2lk?=
 =?utf-8?B?Uk1vcXVTemVUSG14NURudzRHN2R0c25Db3lMOW1aV2JqaTdQa2o5cWR4eTJ4?=
 =?utf-8?B?R0xTTjRsNGQ4Ym4yaHpoRDZzNHFiYlY2Z2hXK2FhZk04b2lFbW45akIrRXhl?=
 =?utf-8?B?VGxpYU1TMG1Scm9YZFZhcmlZR1E3bkdiZnlydFN6bE8wR3RlWHQ5b3lVaity?=
 =?utf-8?B?WUZEZWNkd1gxeHpEZWt5MjdIQWtsREd4YlpPTER5Rlh0Z1VqUElmTURVeFh6?=
 =?utf-8?B?b0VjZ3E2MnQzbEZDOW4ySi9YQktHeTM1eXpVQUFBRW83NC8wS21QbnF1ZlZO?=
 =?utf-8?B?djZCdWFYVzdSM01UVHpvbmxmSnBYb0hFaXYwaGhuVEkxbnlyZmY3UFhtMnpH?=
 =?utf-8?Q?Hl3eG6LCjMk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzFZNVh6Y1p2UmFTZm5QY1I5emtDSXJmdkMweElCeDgrb29iYmdYeG8rbURz?=
 =?utf-8?B?Y0xlSXpHRVVmdVJsVU5FMXFBSGR0MVZqeXNMdHd3RjI5YlBGUEhTOEV5WXVx?=
 =?utf-8?B?SW41MFROTFVMNEhJWlloZkFTcWVxS0xKMm1vUmlQUUsxclVmVnpzL1BNYVpq?=
 =?utf-8?B?NW5wUDJhWVZwak1CZ0hOYUNpWGpkdXNOOURTTzQyRWNQQkd4clNJN3ZLSjg2?=
 =?utf-8?B?NXNuSDFIUzZwcHVaajZ3Ti9XbjNVOE5zaDA4bmNwNGhvOHhnZjFoOVBSVnRO?=
 =?utf-8?B?eENtWGRZdFREUUlYc24vTTVOa2dKMUw4VnlDK1NFSDJPMi9TREhaeXdnSFQ2?=
 =?utf-8?B?cWI1S3laQWxjc2pWNGpkNEhycHVuR1ZsS2RWTlVzd1NkMUhCRFcycWVGc3BM?=
 =?utf-8?B?SG5ubXRwcW5aS3VrTS9VUmFUVXh3OUpwOU5LOTdISTYvQWFKc1dOM3dvT0xw?=
 =?utf-8?B?dEJyUFZ0Ym5lU1M2cmpJZFFXRGZkL0VMZm0xYVhmcTRoVE4yS1dxem9hbEVC?=
 =?utf-8?B?UVkzbXlVVmpSVHFIZTBaUXFGZEJpdnYrUkYvY1JWYS9POS9aK1YyWTV1R0tZ?=
 =?utf-8?B?d3B4dFU5M0pYZHMwOWtrNjZLQXhIY0V3NnM2UG0zMEd1SEFkcXRiOWxMV0tp?=
 =?utf-8?B?NFBGMmovUjNDazdHV2VXZGdKazNNNHV4Qm1MNVRRelAveVRqenN3dTU5cUZx?=
 =?utf-8?B?WDB3OG4vc0IzZlk4MkovTzZ4WXJ2WURaR05zNU93Y2MwMVJHM0JiZkwwcFVB?=
 =?utf-8?B?WEFMQnI2NVU0TTJPaG1BU0FUZVJHSkZUMGtFWGJPSVY4VG5BR0dTdTlNOWh6?=
 =?utf-8?B?c1JRU3JwM2o1eVQvOHJvUDN1L1FpR1pxdi90KzFWOTQrcG5vL3lWWkZiOVVu?=
 =?utf-8?B?a2NpeUQwSzRMcFl6RVZTbmcyTDRoTUkxZ1BGVVQzRmNRYllLbWI3dWN5OWM2?=
 =?utf-8?B?MllPRk0rNWx3WHZTQy9Jb240QWJUcmtrOGdINzBqMm11emZwcTBmMnlrRk43?=
 =?utf-8?B?ZjU2OCtiblB2RzV0VmtJZ25UbGpqMm03VEVzS3h6UUtDWXY3MkY2QTZVcGRJ?=
 =?utf-8?B?NEVBYm5QaHU3d05LeEJwcGhHRVl0eis3c2tRcHJVL1BKdmJMRGRBSzlFY3pD?=
 =?utf-8?B?dkhONXEzR3ZpMXVtT0poZnRMU3MrWTh1VitFcmxLbmlPRzFXRFkzdVNTZkFr?=
 =?utf-8?B?Vk9LZ2w2N3FzU2g0Y01HL3pCZURTd3liL3ZhNHRlQ2NwK0J6TWt5MllqZEpZ?=
 =?utf-8?B?YWxiMkhZaXJtTnhadmdmYmU3WlN6MGI0bktwdHFqYmFkMGtFcjZOM2ptNVha?=
 =?utf-8?B?a3dHaFJ3ckQ4MmZqN0tQNjh5ZThaTWlIRjRzbFJNVjl0OFlJWGw2VVNweC9r?=
 =?utf-8?B?dFM5NEMrUUhsVVorYkNQaDhMSGVLQk5CVEFSWGsycEZTMm1ZU01BbHlsY2FK?=
 =?utf-8?B?RXN1MExvN0l3a21QZVFWRUZud2lCSEl0STF4RUtHcGFxc0FzNFRhY3Q5V2FV?=
 =?utf-8?B?V3crWTFOczhHV3FDYjFnYUNqWkpHcHJRamJNNllLaEhRa1dLQkpSa0YrVnNw?=
 =?utf-8?B?bVVLemkzMzh5cU5hbklHazNpSTBJWDBQVndVTk0zK1BEUlJuSTdqTU0rTmNS?=
 =?utf-8?B?aFNtaEFMaDRKaEE1SG04Nm5DNUx4WTZSWHFqRElRYWpETi82dkRmNFFJWjc1?=
 =?utf-8?B?RytGNEltZWNTcndlU1FYaU5mOVNyTkRUZmZDcWhuRzFhVEVMdEg2SFN4eVlP?=
 =?utf-8?B?OVRFNThaUXJXV29kd0E5MlFhcHU2ZW8zMVRKMnZHNnJ3d09YSm1QaTNWQ2Iw?=
 =?utf-8?B?UFRMbkVMTUxudmlHc3UwQUNmOElrbjNOc1VReENBOG00dXdCbXJhNjBFY2pt?=
 =?utf-8?B?dkVNaHV3cCtzOUo0a2FyRGlYTXd2aHlrSGZEQ3JKR0p6MnV6RGdkeGxoTnBR?=
 =?utf-8?B?Q1MzSW53eGVIcjc0QVkwU0QyemM3eURlT3ErbGVLems1TlZ5N0hBWmg4ajBJ?=
 =?utf-8?B?SE5uakkxSjBpM3U2bmdpT0wvMGlibGFBZHBGT0dBM2t3OHJzOXpNV2hkM3Br?=
 =?utf-8?B?RVE3cVBzMzRYc3Bhamx6NGxLMHNDM1A2bGx5aG84SkVUeVFPNnMxN2kvdTRB?=
 =?utf-8?Q?z0GlxIg0NdD8sJBnOEAkq2hUa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d1f11f-7e1a-4bdb-4e0f-08dd8155a972
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 04:25:07.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DqCFklZy0vq1jm+KfJnkRPdkaky60Fr4FDIU67Hx1oYDMbpqQ1UISsWl9HhNt/AmdHCLHdgqsTex8FbuEnggw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124


On 4/22/2025 3:02 AM, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> On systems with an SRA sensor there are some problems with both init
> and failure paths.  This series accounts for both.
>
> This is resend of V4 which ahsn't gotten any movement the past two
> weeks:
> Link: https://patchwork.kernel.org/project/linux-input/cover/20250407151835.1200867-1-superm1@kernel.org/
>
> Mario Limonciello (2):
>    HID: amd_sfh: Fix SRA sensor when it's the only sensor
>    HID: amd_sfh: Avoid clearing reports for SRA sensor
>
>   drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Looks good to me.
Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Thanks,
--
Basavaraj



