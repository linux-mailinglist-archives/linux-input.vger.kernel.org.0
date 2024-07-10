Return-Path: <linux-input+bounces-4949-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C0492D15B
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 14:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CFF11C20F5C
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 12:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2747819046C;
	Wed, 10 Jul 2024 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="s176fF0N"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2093.outbound.protection.outlook.com [40.107.22.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC79189F26;
	Wed, 10 Jul 2024 12:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720613782; cv=fail; b=CQDszGnIMA5+zAliLRQKui3b5wbx2BWb/Mj+YTD5rpeIWJBoBR1Xur19WyXy1lisqiXj/r0srsmRQ6ROJ/NP31mKXE3BamhwErZLGUsYNNq6ykbTA0wBWBltnBOJ53Wx7eIwBj/gWVJyP1+ZCj18lrIR8a5gmjD2071kl09NIwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720613782; c=relaxed/simple;
	bh=jyHGKmnY2VuLNe4DPVhUMol3lQgIUp3BFmMMs+FeqWk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XaziYaBLQ5sfu7m/ZTdQxCCiE8U5txDUQzraCRFulEBxP4tOY6E1DPIWL8SShpZmAy8+uGs5Qpa/d762zaQBfDmnWRM9Odnkfq8RQkGQ07ufSvBd5hZ9DAHZNT0T8JtQY5jyiaj5fwRulTo8FXevwDgY/0bKwmAQTuP9rUXWY68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=s176fF0N; arc=fail smtp.client-ip=40.107.22.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6V1wRkP2ejkecVyupdC8sk2G7HCDLo6egFzU/3HbTpu0hbXZjdHUlF2+98ZEU+xL+UXh9QQeNXgUf3wv+7avEzI9sAUs37KSde0XPIcWao3lMhfrHAwl3R84ISE5VAzCIsI6RoojzgkK01tDuBdZGTfXHheAGGiqxHLzTaqyDrDAZ4LbQRhdu9fuDWehhC1uX/YHaJMMLbP3SWOcERON1xalgjM7GX52cSyYxHIPd/6rvDqvdzCAL8ORxav/kNBAkA92yTmNlIu6NV69zD7nl2Lu+gp2H6211J9S7mBjUbCzQknUKdqpTNuNxQxf3v1gtqBAQoHgh2RXllqrO+AoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8NXhARJyj3hl/Zql7JD0kuCQnsdFTQ6N8PxkVU9At8=;
 b=YT0gTmmuGr6XBkwilqVM4HfWLUCRGO6DUAKMYVmi+zMs3A3Aie+3eLyWr55j2nK7s+MVFZspaswqtSLA2GLrSFM7yau2sSbu5imbFoCBVmqBrkOkBx8QF7ImkNTRw5mix48IbNSpnPP3hRyi7FMpvcZVY6hZRkXk7d8Y08sHsMtRbC3JEADTOCDQxGI9MMoT8EQKjTHmSjjwmO5xP8gUwD5XW/xbOemhwmLWhzA9RBGBanZpDC1GRmnGwsQirff/eV8MOmCOOFtQBZkNryECv3rvINJl829eC96HHFruBxu4Hy64sZts/wBdGXlB+JCIRoqVClGhWSEEnFORPGWy7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8NXhARJyj3hl/Zql7JD0kuCQnsdFTQ6N8PxkVU9At8=;
 b=s176fF0NtqaSDo9El8x8tdUVAKxZryu93hkPvBxAqmd2Y1OU8+b8ACcwrCIGdValxDZOBjDsTTtTijl2wATV6vhKY6AycRvqro4w0A0/eVtKkloxnSfGGoGD6QN4aOxXD/qbrAP/xIorN/RWVfLccKPBUseXRK64crniXivZQv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DU0PR08MB8446.eurprd08.prod.outlook.com (2603:10a6:10:406::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 12:16:15 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::a08:11be:8709:f5e1]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::a08:11be:8709:f5e1%4]) with mapi id 15.20.7741.031; Wed, 10 Jul 2024
 12:16:14 +0000
Message-ID: <d8734538-81f4-4883-bd29-2f8b682c3d1c@wolfvision.net>
Date: Wed, 10 Jul 2024 14:16:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] Input: touch-overlay - Add touchscreen overlay
 handling
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bastian Hecht <hechtb@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jeff LaBundy <jeff@labundy.com>
References: <20240626-feature-ts_virtobj_patch-v10-0-873ad79bb2c9@wolfvision.net>
 <20240626-feature-ts_virtobj_patch-v10-2-873ad79bb2c9@wolfvision.net>
 <Zox_cVYsErrLu4Mq@google.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <Zox_cVYsErrLu4Mq@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0024.eurprd05.prod.outlook.com
 (2603:10a6:803:1::37) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DU0PR08MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6a3664-6816-478b-9000-08dca0da180c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFAxRXNCeFJXTHBWcGcyeUlaSG95bjM1Z3JnWmdXK2V3ZEJiRXlNOGZ5Q2pY?=
 =?utf-8?B?RGtJdDltK3VCNXcwTHhRN1k4aktVTDhEdnRVZ2Z2U2Jib2ljU09kd1ZpQ0Ew?=
 =?utf-8?B?ZHR3WktFbkE5NUl4UWZuSWVCbFVSTnJZSmFOdHVCcWM3K2pXT0Rac1lGVGVV?=
 =?utf-8?B?MWZwc1dudmlObWZBVERRWms5YVZHdm5WWEZ5MDdBajQzdmtiY3c3TzFCcXd5?=
 =?utf-8?B?WElEaEN1L2hsNFZobjduVERPRjVQd3lkcE9JYWJvWDJncEw5YW5GbHdsMndj?=
 =?utf-8?B?Vmh6Y3I0Y29TN1BPeXNIek9wTmgwMkYzS1UxMHNxZ0hwYTR2MGVNeHpJelAy?=
 =?utf-8?B?WEhQTmtYNUVVM3NrcDd1R3ZjbXJidGNSUm0zdWMrMzljdmNIY3hET3VMZGsw?=
 =?utf-8?B?d3gvTDhEcnBEUElyVyt3VTBtR3QzRE85OW1CdmszQzNOSWdyUTlKUVp4MTVR?=
 =?utf-8?B?VmI4VTZjdG42TURCY05BSGZjdExIL1JhbEV6Zmhmb1NYMUdJeld5cTFlV240?=
 =?utf-8?B?Zks0MlRlUXkzVFEwQ0pBYm5ieVROQW82c2tzWlpteTZML1hFelV6T0FFdDlz?=
 =?utf-8?B?NkV3V0ZDMXVUcVljVlpkVW85QUVqU2pjWDg3V3AxNjg2ZjlFZkJnaEY2NjVB?=
 =?utf-8?B?TWxHL3pLSUl5RXY4Wm9iZFB6TlM3ZlF5N3o3bmE1NzI5bmc2WWxkVnR5emNW?=
 =?utf-8?B?OEtScVlhTHE3cDJsazV2cE40TTRHVEpEUW1QdGQ2VTJOeXNYaDZhNS9nOHJV?=
 =?utf-8?B?N3lhV2dYWGJjVUgwZnVNZVI3TkxEbkpvbWttV2NhYk5icEMyOGhLS3pIOGgx?=
 =?utf-8?B?STBuMUpFMlU2NG10ajlLNXdtOUNrWmhZSUVjSngvZEQyL1EwWDluNjAzTVlQ?=
 =?utf-8?B?eWRwV0xpdVh0aWlKTlpQd09HS1pSeFp1cE5rMHhldi9mOEtIQ1dJd2NOMGNm?=
 =?utf-8?B?OTgwOG5BY3JvZTJLKzJTRDBUTXgrbEFGSjBXTEhyeVVUUjFrdzVtL3VoRW94?=
 =?utf-8?B?NWp6cnVLcjlIZDZsaVBqVG5JcTFOa2lpam55K2ZwVEU4aVp6VkZtL2c3dFFG?=
 =?utf-8?B?QkJ2MVoyVmloT09PcWlMdTFzclkycWJ5U0VEZ05qVFpEVkdMcVczazhUM1J2?=
 =?utf-8?B?Sldvckc1YlpWdVJHNi9XWDBhRVVoS2RnTFhNWmcxdXFxK3QybDQ1enFUcDJO?=
 =?utf-8?B?RkxGdkRnZWpVckZQUmhlektBSzRZU1RWbVpXQUQwZGhVRURwTndKcHFiL0xz?=
 =?utf-8?B?SFozM2ltM05UTXpZUHpzQUpLMDRzcmhaaVdvczZnSkQ1Yi9SQ0NRYnJXQ0dL?=
 =?utf-8?B?dldyWTNFMGF5SjljMkUzNTBEbnNmT0k2RUl5RmVrRkVzd0dScnNxVUhpN2hT?=
 =?utf-8?B?aERiV0l6YThQVlNFUURBSkFQWk9NTnp3R05VVytQL3lDUW5tSERURXpPK2tI?=
 =?utf-8?B?Z1JDbFVLeFRRUFVuQ3o1Vk9USUxHZHBkd3hOR2d2YVBEQ29VbC9JbDR3R2hi?=
 =?utf-8?B?b2djNTlLNXltdHBIdmxlZFFDQWZGTzZLQTMvVVFFU1JRc2x5SGMxNTdEKzV5?=
 =?utf-8?B?bllZTDg5ZnYrZmh1RWVaQjJ4KzZCOWJ1eVRwNWtYeW14cFd6VittMUNDbWU3?=
 =?utf-8?B?ekNVUlJHNFFyR3NlSlpteXJRNkdEQVpvQlJLOGlLTXc1MDF2anpqSU13cE5x?=
 =?utf-8?B?NmhxRTRMaFZvZ0tVb2ZqSkQ1d091bWgwVlpodnUwRnM0M3dNdGVTUGcvOEVo?=
 =?utf-8?B?NmU0WWE0NlZPczVtNXR0eDVsT3cvaDZYOHpQV2p3MytvckxBVFBkUEZneVBa?=
 =?utf-8?B?a3hMeGpKSDMxSnU5WlgwQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4974.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1ZYMzJockk0cGpDRFEvOGNuTFNHaVFlSWtSWE5YYTZuWkZxbURIRXQ1VjhS?=
 =?utf-8?B?clpveFVLTmI2bVBMUVNrdHlxVXdhOFIwUTdLTGxJWXVRVEV0bCtQeS9INnpl?=
 =?utf-8?B?QisvMy9uSWtwTE1uRTRyME5odjVyNEc4N1RiTFI2ZXFHdmFMNUFhOVN5UHI1?=
 =?utf-8?B?VkpFWExOc0Z2TldMaWZYWGNYNFZOeVdLZmRndlJocitERE5INGROUVB2WVBz?=
 =?utf-8?B?a3FxTEZmV2tRbCtrNVo1LzJmRkZ4ZmlVNVBIajRLVXIzNDlFVmJyWGN4c2dt?=
 =?utf-8?B?Q3prNnZydjZyd2hibGxPUXErN3poVlA5UzF1Y3hLaXhkcXF2WEU4S3pBQkk3?=
 =?utf-8?B?SUxPU01jS3c3VSt1UlBFSUF4ekpqaUxHQVE4TUxDdW1TTHVOMlR2anJHZG1i?=
 =?utf-8?B?R1M1ZnJQYi9mQi9TNWlubERGc0w4cVNKMkxXOFZ0L3gxUDdIUVpmVGd6WHBL?=
 =?utf-8?B?b2ZzYnFGdEZORGdjV2xmNEg5eDh1TUZJUWw1UWtHZ1pXUnlTSThnN0U3L0JG?=
 =?utf-8?B?eXFhUWlzZ0VsamMzOTdJd1FhVGFnRTIxN25VU3F5QUp1ZUlHV2phd3pwell2?=
 =?utf-8?B?dUxyWEU0ZldhK0RFcWJhTVM5bkhHYU1NdVNBWHpQZ1V1QVNZcStaa08rNlYv?=
 =?utf-8?B?eFg2dEYvK1JXWmFwTlVoSkFBTXZZNk1uSzhDTkQ0WXpQeFhPNGFDdi9rUXVX?=
 =?utf-8?B?WURDYjdLWlN3MjdFbjBxTzhFRnlLNzhXQzluZjNqMERKaXZ5T0N6OFNiSndD?=
 =?utf-8?B?T2wwN0lBbGFqc2lvSVVrL3FTRU5QOEtoV0FpSXRkZWMzdklNUEorVGNDWXR5?=
 =?utf-8?B?bllkWXhHZXdra2pNS2pUalRERXFmelZPQ0pWOWxqWjEyZ0JldC9NajlyWk1h?=
 =?utf-8?B?ZEVPNHhzbUs0MmpPV0orT3B5Z0FSazBGTVJXdlA3eXI0YkVVK1RHM20zUDNm?=
 =?utf-8?B?VXdIckxwcHAxbjdhdEtpQ1ZKSEgvYzFwMFdIMmgrdzUrbFZJZmtjN2lpSnh2?=
 =?utf-8?B?dWorZ1BHdDhYcGx4N3lzdG5IK0M5NmN3Tm9sblF3WDVaSGU2R05jUlRHQytZ?=
 =?utf-8?B?amdRc0FDV2VmL2UyN2dtUHZWU0ZZaTc3MUtLeHVxd3VtdFpWOUZkNlplc0pt?=
 =?utf-8?B?KzVaU212YkN3VUo4ZWJiRnlWcmM1QmdSR1BnL2xJUnZnY0VqS3BoNFU5VXkw?=
 =?utf-8?B?UkJXd1laSytkR2JqS2tkN0ZEOXBSeU16Z1lHTE5VMERHbzlCam1zMlo4Rkta?=
 =?utf-8?B?aFp0NlMrOE1RRFA1TUlnbjBtY2RVZ0kwekppU0J0QmtPUmEyQWFCR2dxUWxL?=
 =?utf-8?B?c25xVVlXOFV5dkxXZEc3RmVZZ2tESmp6ZjZYTWgzamFJRUZyWUxvTEtPTU43?=
 =?utf-8?B?bUZEaXBVMmdDUXpQZmhERVlza21NOHltT3N1NFYyRHdoZWJZSUxjRHRSWlcy?=
 =?utf-8?B?bnZuWW5yZElQYXFGQVBPQTlXZzBUTWgvVlFhd2ViaTRubEJiUFNqYVJ0RDRs?=
 =?utf-8?B?ME1haW5qTExFcHFXNkdLZGMzVUF4OW1aYkdPai92Sjc1VzMxaEpRS2JBNEtD?=
 =?utf-8?B?VSt2Y3BKUXdoQzdNN3g0MFJhdlBwQ3AzSzZvYldhdStMSGhpNHdNUHB3TktV?=
 =?utf-8?B?M1ZjWE9NbGFJZTVtMk45aGRNVW5wRXJMY3djRy9mODBzYnA5YmpZaEdUc3pI?=
 =?utf-8?B?aW9aK0xacUhEUWU0RnhqaytIWDlGSE9QeTNrZE1Pa1RRTWk3cDlPVi9BMldj?=
 =?utf-8?B?RkxnSG1UVTVnZlMrTS9CeTFKcGYvSU9pSVFtcFRoVDdrcGJSVVUvRDZJYVYr?=
 =?utf-8?B?WmZVdFYrRkgvN0dOQ2tBenVFanBQdFZmajlRQUY4c050WGFPc3dWWjFBSUZZ?=
 =?utf-8?B?RGg2MmEwcUI3MFBESTFWaDJhTUhoQ1hIZU9OZ3FjQWQvYW9xejJjYTJpS1dJ?=
 =?utf-8?B?TTBTU0ZKeW9iM1lsWjErcStvRWRlZVFFeThqYkp4bXpQNHE0ZnJuYWxKanNE?=
 =?utf-8?B?d0EwRFpkZWpyaDIwOG1yRURJZE1kR3pzZTB5L0lYVTlQcEJXcElkYStxcHhT?=
 =?utf-8?B?eEYvY3lBT09oa3g0d0xRRHhlTFdxVFNsN3IzVytBL0g1QWRZRHBWT0tjeVJv?=
 =?utf-8?B?blVQY251WHNza2ZTR2FTUUZmTjFiUFVzaGRyUFl0SmVtdGlabHJLblJ3SlV3?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6a3664-6816-478b-9000-08dca0da180c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 12:16:14.8372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmdAKzbm6lte+hFd+/+t/xGNCer32UAdIdNxxOBm/59aOAtGUTNp38DrCcY41oDX3NmcE6ld+Db4xzZ6XPEP2do4TnV9oafHBawU1O1awg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8446

On 09/07/2024 02:08, Dmitry Torokhov wrote:
> Hi Javier,
> 
> On Wed, Jun 26, 2024 at 11:56:14AM +0200, Javier Carrasco wrote:
>> Some touch devices provide mechanical overlays with different objects
>> like buttons or clipped touchscreen surfaces.
> 
> Thank you for your work. I think it is pretty much ready to be merged,
> just a few small comments:
> 
>>
>> In order to support these objects, add a series of helper functions
>> to the input subsystem to transform them into overlay objects via
>> device tree nodes.
>>
>> These overlay objects consume the raw touch events and report the
>> expected input events depending on the object properties.
> 
> So if we have overlays and also want to invert/swap axis then the
> overlays should be processed first and only then
> touchscreen_set_mt_pos() or touchscreen_report_pos() should be called?
> 
> But then it will not work if we need help frm the input core to assign
> slots in cases when touch controller does not implement [reliable]
> contact tracing/identification.
> 
> I think this all needs to be clarified.
> 

I think this is the most critical point from your feedback.

So far, touch-overlay processes the coordinates of input_mt_pos elements
before passing them to touchscreen_set_mt_pos(). As you pointed out,
that means that it does not act on the slots i.e. it assumes that the
controller does the contact tracing and pos[i] is assigned to slot[i],
which is wrong.

Current status:
[Sensor]->[touch-overlay(filter + button
events)]->[touchscreen_set_mt_pos()]->[input_mt_assign_slots()]->[report
MT events]

If I am not mistaken, I would need a solution that processes the
coordinates associated to assigned slots via input_mt_assign_slots().
Then I would have to avoid generating MT events from slots whose
coordinates are outside of the overlay frame (ignored) or on overlay
buttons (generating button press/release events instead).

But once input_mt_assign_slots() is called, it is already too late for
that processing, isn't it? Unless assigned slots filtered by
touch-overlay are kept from generating MT events somehow, but still used
to keep contact tracing.

Any suggestion on this respect would be more than welcome.

>>
>> Note that the current implementation allows for multiple definitions
>> of touchscreen areas (regions that report touch events), but only the
>> first one will be used for the touchscreen device that the consumers
>> typically provide.
>> Should the need for multiple touchscreen areas arise, additional
>> touchscreen devices would be required at the consumer side.
>> There is no limitation in the number of touch areas defined as buttons.
>>
>> Reviewed-by: Jeff LaBundy <jeff@labundy.com>
>> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> 
>> +int touch_overlay_map(struct list_head *list, struct input_dev *input)
>> +{
>> +	struct fwnode_handle *overlay, *fw_segment;
>> +	struct device *dev = input->dev.parent;
>> +	struct touch_overlay_segment *segment;
>> +	int error = 0;
>> +
>> +	overlay = device_get_named_child_node(dev, "touch-overlay");
> 
> We can annotate this as
> 
> 	struct fwnode_handle *overlay __free(fwnode_handle) = 
> 		device_get_named_child_node(dev, "touch-overlay");
> 

That's right. A scoped version of the loop would have been nice too, but
there is still no such variant for this particular one. I am pushing
that somewhere else, though.

>> +	if (!overlay)
>> +		return 0;
>> +
>> +	fwnode_for_each_available_child_node(overlay, fw_segment) {
>> +		segment = devm_kzalloc(dev, sizeof(*segment), GFP_KERNEL);
>> +		if (!segment) {
>> +			fwnode_handle_put(fw_segment);
>> +			error = -ENOMEM;
> 
> return -ENOMEM;
> 
>> +			break;
>> +		}
>> +		error = touch_overlay_get_segment(fw_segment, segment, input);
>> +		if (error) {
>> +			fwnode_handle_put(fw_segment);
> 
> return error;
> 
>> +			break;
>> +		}
>> +		list_add_tail(&segment->list, list);
>> +	}
>> +	fwnode_handle_put(overlay);
> 
> Drop.
> 
>> +
>> +	return error;
> 
> return 0;
> 

Ack.

>> +}
>> +EXPORT_SYMBOL(touch_overlay_map);
>> +
>> +/**
>> + * touch_overlay_get_touchscreen_abs - get abs size from the touchscreen area.
>> + * @list: pointer to the list that holds the segments
>> + * @x: horizontal abs
>> + * @y: vertical abs
>> + */
>> +void touch_overlay_get_touchscreen_abs(struct list_head *list, u16 *x, u16 *y)
>> +{
>> +	struct touch_overlay_segment *segment;
>> +	struct list_head *ptr;
>> +
>> +	list_for_each(ptr, list) {
>> +		segment = list_entry(ptr, struct touch_overlay_segment, list);
>> +		if (!segment->key) {
>> +			*x = segment->x_size - 1;
>> +			*y = segment->y_size - 1;
>> +			break;
>> +		}
>> +	}
>> +}
>> +EXPORT_SYMBOL(touch_overlay_get_touchscreen_abs);
>> +
>> +static bool touch_overlay_segment_event(struct touch_overlay_segment *seg,
>> +					u32 x, u32 y)
>> +{
>> +	if (!seg)
>> +		return false;
> 
> This is a static function in the module, we are not passing NULL
> segments to it ever. Such tests should be done on API boundary.
> 

Ack.

>> +
>> +	if (x >= seg->x_origin && x < (seg->x_origin + seg->x_size) &&
>> +	    y >= seg->y_origin && y < (seg->y_origin + seg->y_size))
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +/**
>> + * touch_overlay_mapped_touchscreen - check if a touchscreen area is mapped
>> + * @list: pointer to the list that holds the segments
>> + *
>> + * Returns true if a touchscreen area is mapped or false otherwise.
>> + */
>> +bool touch_overlay_mapped_touchscreen(struct list_head *list)
>> +{
>> +	struct touch_overlay_segment *segment;
>> +	struct list_head *ptr;
>> +
>> +	list_for_each(ptr, list) {
>> +		segment = list_entry(ptr, struct touch_overlay_segment, list);
>> +		if (!segment->key)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +EXPORT_SYMBOL(touch_overlay_mapped_touchscreen);
>> +
>> +static bool touch_overlay_event_on_ts(struct list_head *list, u32 *x, u32 *y)
>> +{
>> +	struct touch_overlay_segment *segment;
>> +	struct list_head *ptr;
>> +	bool valid_touch = true;
>> +
>> +	if (!x || !y)
>> +		return false;
>> +
>> +	list_for_each(ptr, list) {
>> +		segment = list_entry(ptr, struct touch_overlay_segment, list);
>> +		if (segment->key)
>> +			continue;
>> +
>> +		if (touch_overlay_segment_event(segment, *x, *y)) {
>> +			*x -= segment->x_origin;
>> +			*y -= segment->y_origin;
>> +			return true;
>> +		}
>> +		/* ignore touch events outside the defined area */
>> +		valid_touch = false;
>> +	}
>> +
>> +	return valid_touch;
>> +}
>> +
>> +static bool touch_overlay_button_event(struct input_dev *input,
>> +				       struct touch_overlay_segment *segment,
>> +				       const u32 *x, const u32 *y, u32 slot)
>> +{
>> +	bool contact = x && y;
>> +
>> +	if (segment->slot == slot && segment->pressed) {
>> +		/* button release */
>> +		if (!contact) {
>> +			segment->pressed = false;
>> +			input_report_key(input, segment->key, false);
>> +			input_sync(input);
> 
> Do we really need to emit sync here? Can we require/rely on the driver
> calling us to emit input_sync() once it's done processing current
> frame/packet?
>

I will test it without it, but that might change anyway depending on the
outcome of your first comment.

>> +			return true;
>> +		}
>> +
>> +		/* sliding out of the button releases it */
>> +		if (!touch_overlay_segment_event(segment, *x, *y)) {
>> +			segment->pressed = false;
>> +			input_report_key(input, segment->key, false);
>> +			input_sync(input);
>> +			/* keep available for a possible touch event */
>> +			return false;
>> +		}
>> +		/* ignore sliding on the button while pressed */
>> +		return true;
>> +	} else if (contact && touch_overlay_segment_event(segment, *x, *y)) {
>> +		segment->pressed = true;
>> +		segment->slot = slot;
>> +		input_report_key(input, segment->key, true);
>> +		input_sync(input);
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +/**
>> + * touch_overlay_process_event - process input events according to the overlay
>> + * mapping. This function acts as a filter to release the calling driver from
>> + * the events that are either related to overlay buttons or out of the overlay
>> + * touchscreen area, if defined.
>> + * @list: pointer to the list that holds the segments
>> + * @input: pointer to the input device associated to the event
>> + * @x: pointer to the x coordinate (NULL if not available - no contact)
>> + * @y: pointer to the y coordinate (NULL if not available - no contact)
> 
> Would it be better to have a separate argument communicating slot state
> (contact/no contact)?
>

Passing NULL would be ok to save one extra argument, but I have no
strong feelings about it.

>> + * @slot: slot associated to the event
> 
> What if we are not dealing with an MT device? Can we say that they
> should use slot 0 or maybe -1?
>

slot 0 would be ok. I will document it.

>> + *
>> + * Returns true if the event was processed (reported for valid key events
>> + * and dropped for events outside the overlay touchscreen area) or false
>> + * if the event must be processed by the caller. In that case this function
>> + * shifts the (x,y) coordinates to the overlay touchscreen axis if required.
>> + */
>> +bool touch_overlay_process_event(struct list_head *list,
>> +				 struct input_dev *input,
>> +				 u32 *x, u32 *y, u32 slot)
>> +{
>> +	struct touch_overlay_segment *segment;
>> +	struct list_head *ptr;
>> +
>> +	/*
>> +	 * buttons must be prioritized over overlay touchscreens to account for
>> +	 * overlappings e.g. a button inside the touchscreen area.
>> +	 */
>> +	list_for_each(ptr, list) {
>> +		segment = list_entry(ptr, struct touch_overlay_segment, list);
>> +		if (segment->key &&
>> +		    touch_overlay_button_event(input, segment, x, y, slot))
>> +			return true;
>> +	}
>> +
>> +	/*
>> +	 * valid touch events on the overlay touchscreen are left for the client
>> +	 * to be processed/reported according to its (possibly) unique features.
>> +	 */
>> +	return !touch_overlay_event_on_ts(list, x, y);
>> +}
>> +EXPORT_SYMBOL(touch_overlay_process_event);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Helper functions for overlay objects on touch devices");
>> diff --git a/include/linux/input/touch-overlay.h b/include/linux/input/touch-overlay.h
>> new file mode 100644
>> index 000000000000..cef05c46000d
>> --- /dev/null
>> +++ b/include/linux/input/touch-overlay.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2023 Javier Carrasco <javier.carrasco@wolfvision.net>
>> + */
>> +
>> +#ifndef _TOUCH_OVERLAY
>> +#define _TOUCH_OVERLAY
>> +
>> +#include <linux/types.h>
>> +
>> +struct input_dev;
>> +
>> +int touch_overlay_map(struct list_head *list, struct input_dev *input);
>> +
>> +void touch_overlay_get_touchscreen_abs(struct list_head *list, u16 *x, u16 *y);
>> +
>> +bool touch_overlay_mapped_touchscreen(struct list_head *list);
>> +
>> +bool touch_overlay_process_event(struct list_head *list, struct input_dev *input,
>> +				 u32 *x, u32 *y, u32 slot);
>> +
>> +#endif
>>
>> -- 
>> 2.40.1
>>
> 
> Thanks.
> 

Thanks a lot for your feedback.

Best regards,
Javier Carrasco


