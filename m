Return-Path: <linux-input+bounces-11686-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E0FA83B31
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 09:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B03C34A4336
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 07:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0815205E0F;
	Thu, 10 Apr 2025 07:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="qqhvT4NJ"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010015.outbound.protection.outlook.com [52.103.67.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0E420B7E9;
	Thu, 10 Apr 2025 07:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270176; cv=fail; b=pmEhJLHSKlNZAIaus46jY/iZbFLDCqYue3TG1zjJtJFSWiH0I6UhFJXjw2kRJXKAJm7vFb7GVNGwOIRX74qhrVI1WLyercxrlRHQLx/v/i2Ck78e9tFZ8vyzLdOt2z/hcxsvj61hXwOSLu/WHl7T7DZM0XVa7APbdr46D/MYXHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270176; c=relaxed/simple;
	bh=sI50eoZrPwdtjhS7IEnnZqlh9Tze6Q6u27NyrqJkYj0=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=Oy3zm6jelA0c+upqewb6L5+oI6HNp1y4MJa3+DVWrfmX6LGwuTKWrSZbRG8YfXFC34+LLdYBd4dZ1lTIACAlpVD0KHIF1hO3iUjmoLa/XcdIPmYc1maPgn3SWUfQnuIyMMtah8zt7WgYb57u7v1mmADaOgTtYAF2mBHNebalUTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=qqhvT4NJ; arc=fail smtp.client-ip=52.103.67.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bO/hNEgmxPFUMOgr53Ra6IWblsSrkWyvtGIu6j6SQBnSifwgOY6D7mFUy5DvGUfsRrteRhdaVPqUS3Pgttc7w7Hqpu+1aARB3xE0QHjuz0/rvqsI/tIBn+F/WSgljAA+l3kktaGLjYGPbNKjatU7/dyymuaLvDfeCsCMO8RrpcAo0ZLfhw+QzhizS3FP8oFltPYEJpEo90ZSLKIlY8rP6KwTJVnXLOa1C3KRii3rj//RMLw24/hTu93fBeTcBG+LvwVf2eAPThzl8oknBAKIwd/NdPFAu+Jw33nrrP/W7zMacrEq02cLfv1SYzSccHVEGtgWYhhuoz2ex9Ho32SPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMxMTsPnGnaIRhpKkVv/436HDAadBnqfg+fgN8Zp4fE=;
 b=WLki07EtMYp6z5LtF/OgnwJM4DyGFRRYOGh13lV5fctUwY8cCew5xMMHJiuEgi8bRmmJz9EYcTshrvZSgwQyNy0gS31J3YdNJGjIfrTfdhFMxcTmdZxOBcvbwfHnNrvG+AT+Pl+mzVkQZzX6Tof3P+dx28AkMGrxOexibXp4sVZsTW8bMMmIXXODVXZgX9WIlbPMSZ9wS2jhyJuJcPmcSGQD8O6PxpOQ0nVb1qCZV75yZWj9YkBn9d4XlUqcUraJGnt0uJUnUeU4eay3U7IE3aB4p3RCTsywMNkYuG1ni7a2km9e+WaqLigBYmbheWzmux6BeWFxiLTqqpX6U6Db3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMxMTsPnGnaIRhpKkVv/436HDAadBnqfg+fgN8Zp4fE=;
 b=qqhvT4NJ49CoTPTOphKEnCmOhfqdTYI25poVYANvMc1mydWI2dZKflSd4Q06O8ekqfgac4gCUiDULP0i8M48T7EgGp4kp7HZUwc401glZTtethvELSr3K/8WEFn5I3FY8H1D09Y++2Qu9aU5UCldPvXTUr+DvwNheWEh33MWvdNFk1czFXOElFOCr+Etx0pwZyPnM8lYYNTzObEdqKKPiQLtSEEdAQZitU14azRwyRgcgT2ByHQ1EegXv9rNedK0RylGqYTrjf8Fm+KIpRlhsCGgTGsjfHCLdOTs0shum9lpfSlpNYfr5cWhY2FJOt9m5QH7RzC/ywRvRmacUAZxLg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PPFCA32FAF10.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::3a5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 07:29:30 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 07:29:30 +0000
Message-ID:
 <PN3PR01MB95975285B1ECB09D2B88D113B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 10 Apr 2025 12:59:27 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Aditya Garg <gargaditya08@live.com>
Subject: [PATCH RESEND] HID: quirks: Add HID_QUIRK_IGNORE_MOUSE quirk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::11) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <a0941e42-d490-4498-8083-4888602e6264@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN2PPFCA32FAF10:EE_
X-MS-Office365-Filtering-Correlation-Id: 48af3718-d6c9-45ca-d452-08dd78016e54
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrPgu9FUvYZ88hunKvKD6srSb4RRLdG5YFNmgxNHMhip0EvL7G7aZMpv/0YVY5f9cw6zQp6H6aJoVACL/+KP+An1p4nzkafH+f/3obpO3W/bM74AkzK7b3ndxuMvMiZ4ao0mX4HY9bG6vtwFrThXx6D4t6NqzrfsNzvSpCKr8Q1714KDyTb21NirwAYRrwzjrd7/4ayBIjILhbxlyNkNiU7YV1thftvNCBbi++hbiTbq2XxJrykpZiyghI3J97ra8iJAZ768IUf6VguuTHlJsuOWf6VwTLCDmty6G0wDUezYac8cmo4zDyZ8DCIr4dZNNjI+TChmfS2A+nRoY8EnnfL9JvepmM1qkb3j+FFqkqZ3EN7Mai1qWSUYfaf+142p051CQcM50ST3D9cH5yycCFNYl4+0NqOWaq66fDXiPyuJ6pqNiw0KQNTxqgzwn0o54OlnWY1cDqHia1LOYrXqYpBS+hpfvV/zuRJPtAxWbAlgno2s4l97dLAnlzP/ZlsqkmsFhKZP8D8MZ7I405nBOb/zq+diEBHiW7rtWwfZAZ4mpY3f8YtrDS/DvU8M0iOZzbvfWIjcZ79DQgCqgmMNdjHK5LbINqgcXZSaSQYwKLIzMltaXoe3huvdgUt/rZFZDWYQL8XB03XSpomhSqlYcbUWRldJpY16kS8N+L2WvhE42rEM7X7+t5DMjPT3Wd4/N3HzK+AM6Qxwph1bB5l4Lse/n8gk8iddeOojfFLdIeIVgmWk29kGzAubXYk4J5ArbN4=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|5072599009|19110799003|8060799006|7092599003|6090799003|461199028|5062599005|440099028|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFdsNXJkTllKRlhvTWc4Y0QvTVBzaWZrdWsvL0NuOFV1RTNKZURaNnBDTnZJ?=
 =?utf-8?B?VWJNdThHTWhnQmhTMW13cGxKWjF5V0thLzRINWRYWGM2QzhaS1RmUUZCUnFp?=
 =?utf-8?B?MCs2UE5LRDlkQTB2djdLaXlnZDVHSFdoRHprVHZoaVNGQ05BencyVlZOK0JY?=
 =?utf-8?B?MGxOR0VHNlV6WnJZMEFLWGY1UzJKZ1V0aUQvRndLeFRaRmcrNERYZzRxUDFl?=
 =?utf-8?B?ek5TZk5NWE5ZcVZ1RWRseGtHTGlnOERsaEhKMUpLZFVQbkVaV05QcHRoUEg1?=
 =?utf-8?B?anhDVGNtVkZpOWx1NUcwdUdtdmRYSW5XeGNhWkxSVlNsUTRaS2NxQ3lSVDkv?=
 =?utf-8?B?QzFBdU52a1pvQU4xU3V2dU9saVRoTXFhd21GNjBiaE1wNVdzSEFJaDR5U3p0?=
 =?utf-8?B?aE1QTCs2ZlExOVJNOFVyY3lBeHJlWmQxbDZzeC9lMm1KanFJZzhZdnVETHo1?=
 =?utf-8?B?dW9vNlpwQlU4aE81Y1BKaUsrdzBENWJpWDZ3by9rdU5aY1NuM2s1OWIyaktH?=
 =?utf-8?B?akVlenZHcmM3d2czTjQ2ZmpQSzBab3EvaTY1dmwzTGlPZkVZUjdSWDUrSHR0?=
 =?utf-8?B?RVY4alJhRmVjRllrRm1JWkNzVElMVzVxNFlrVW1CeFJ0T251ekt6WE5iRTcw?=
 =?utf-8?B?cmQvVE4vbWZRckVUY3dXM1pod2FXdFVKazZsMXNya3NhSE8vR2h4M1R0Qm5N?=
 =?utf-8?B?a2l0ZTYzdmRsa3ZlVEhMYXJ0MkJRZmo2ODErbmdCaG5SUkRvejZVcHlCNWU3?=
 =?utf-8?B?d3lSNlpmbSt3SHEyOEtrRitvdk8ybzFMQTBmVm1KMjB5dVFzUW5IQmpMcVEv?=
 =?utf-8?B?b09UdzBCdnBUVzk5YjlhZUJKbTh4Znc5M2NjQ1RPQ3hlR2Z4Mm1KTXlUVXJh?=
 =?utf-8?B?U1MrNTVWWjdLNXhrTUIyVUxHeERQTDFCWHk0WFk1QitDNmpUOEo5K29kNWZV?=
 =?utf-8?B?em1oTml3bW9OeTgwOVZyb2F1cGEyU3daanJMMWRLQU40bUZVM2c0S2NJTGFs?=
 =?utf-8?B?Znp5TmFkeVVWdlZ1M2hJQmZUdmVIbWtjc2R3TWlqRnJrTktadnlEdTBEVUx4?=
 =?utf-8?B?OTQzQXIzNUo4bThSTUdkZGF6YXEzbEFkaU5MTUxSYzBxcE55NVlFMTBDK0NO?=
 =?utf-8?B?Z1FnTHVYRXJ3MGpjQldoRFhqU2N3NFREdHZ0ejdjWmpWWS9jZ1c2Qy9ucVV4?=
 =?utf-8?B?SVNRUnE1UzJJSDBYVUUzRCtVT2ZNdnVNL0V3M3lQOTBFRzg1MFlkRm1ES1lV?=
 =?utf-8?B?WFNvbTZ6RTZrZkovbVBBdC9wNlJGcmpaaWhpeUh6RXZGM0xvVC9qcnRyakRR?=
 =?utf-8?B?TzFIWWJaVG0yQVA3eDVQM2oxb3JVVnVFdldYSmRGaFZwZ0xVdG5QOFdVcHhM?=
 =?utf-8?B?c1NNUkJRZm5kK2htM01qWXNnZzhFSzQrTHhOUU1oazhGTkpBZ1N3NXB5QVdV?=
 =?utf-8?B?amlVWjNpSkVHQ3I1NDVwb25UWjViL2JqZzJZSGo1MXVxSGpGcmRoTmpMRFFT?=
 =?utf-8?B?azVHRnhMZ0w1elRQUjJaVUdpbmlrOWVmaUFxc3pRcnpheTZkdG5KaU14OTVv?=
 =?utf-8?B?QzdYNnExL2xuOW1tOWFEZUx5SHpidk5zaURid2dJYXd2U0dFTCtyYkdMajN4?=
 =?utf-8?B?Z2dLWUtCcHZGNEtQZnYxUldtdDUwT2c9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVNxNUg2ZkZkQnUxaUdDTDQ1YWErTlBiQjQ1ZmVOcjZQSHNvNGx6M0d1WnM3?=
 =?utf-8?B?Wkw0dnpCOFN3Q1FoWlZMeXFxNC9tYnBOYzk4cWlCbUg3TkpTdURBSDduNm96?=
 =?utf-8?B?NXNacmFJenI0YXVNazZhQmtWTS9iakN5cnZudlI4MWN5VHNaRVdDdnEzR1JI?=
 =?utf-8?B?LzVTclpYRVE4cXJJRXF5WjBYRnNUSW1GOUE5enRrblNHdlJEWDB0RUxsUTVV?=
 =?utf-8?B?Rnk3NzFiNy8wWDF3YnVTRWRnRkUxQWpMYXlRSmxrd2pDYUQwU3c2cFhNUmN2?=
 =?utf-8?B?Wk1VT01yLzg3Rnp4NWxreG13TmlwUk05aERaMzFZTTlmLy9WeWd2VVdYZG9H?=
 =?utf-8?B?eGprUUpIdEdMUEY0MFJPUXVIMDVRTkcyRTlUYmtXakF5ZUZPOFBxalJwakU3?=
 =?utf-8?B?eWRQTnNLcWpCUTZ6TFhySGpFNEpOZHp1Zk1EQTZacVdSUVMrWjFVbmpBL1Fv?=
 =?utf-8?B?QXVsVlBTbWt1ZUxVNVRVcE0xWmpIb1h3NTE5UlJJTTZWdHBMaEdBeFRtL1Fq?=
 =?utf-8?B?YkNqSmJXRWNqbGM0OUFYL2Q0Tkd4TXRFT1hWN3FrVVlZTWtuekprNE9pSXdn?=
 =?utf-8?B?dEhXQlhFMzRLU3pOK1MwOHJUMFd4b21pWm9HZ1FYUmdtMW9WZTlGbTVaVjJK?=
 =?utf-8?B?UVA0dHFWR2Z2amZzSzVEekJWb1NuOHNsUFNHVHQ4V1orK0E5c0xYRFBHRnBM?=
 =?utf-8?B?clJQWC9mZnpCZDYvNDdRS09xSWRUR2M2UytFaXVQcmpFQjE2TDlWekJHd3ov?=
 =?utf-8?B?dDB0NWhvR2djSHgrdG9Cb1ljYlFmR1EwNDNBNWNxOFFtdE5nWHFBWUJaQk1t?=
 =?utf-8?B?dHNldnhYM2dZTlJ2RGtOczZUYmJjei9mUTJZcks0Ly9rSUoxdmhlV3IxRE14?=
 =?utf-8?B?UHhDSmxUL3BQalpBdE9uTkE5OFBLZm9SdjhHU0o4YWdaQ2NpeCtOZkIxTFFP?=
 =?utf-8?B?d2RtZkIxNmFadnMwQlcwa1V2ZlMzY09iZWJTU0FWbkpGRC80cDJTT0pWR01x?=
 =?utf-8?B?UjNDVkFhblJxcVVFenVob2VRbTJKYW5wc3hNa2FudTA2ajg1QzlzODFHVDhh?=
 =?utf-8?B?YndGWm1vWTByNGNjdkFjTGtEdlY0Q0loUEpYb3A1VHVQMmhJRENlbi9TVzYv?=
 =?utf-8?B?eUlMZWtSNUdlVTdRM1BGVTl0Y1gwYk5TdTNkL2NjZ0EzdGlEUVdwMnYrTHBt?=
 =?utf-8?B?MWRicVA0WFY2ZFJldERXc3MweE9QakZnM3JSRzEvU1piemtST1NRMEVneXdz?=
 =?utf-8?B?a3FtY3ZUWWRoNFArb2g0NEFvQk5QVmxNVEc1cjJmdU5pOGY3UHpvdXpPVDd6?=
 =?utf-8?B?aDlvaUlXSmI5d1JnYXdQeEszbHppbzJzbks3VGY0UzlnbHd0NnU0TVVzSmhx?=
 =?utf-8?B?WUFFN0k2eTliMkJNUGIvQURDWWtnQXJXZElMYis1V3o2aEh6S2RWWHQvR0JM?=
 =?utf-8?B?VEZtR3lmaHVkSXp4YmhGRWZyYmt5Q2VTbmR2bkQxZ0ZYOHNKVnZMT1dMVE12?=
 =?utf-8?B?MVI2UUpUUnBpbm5Bb3p4WmNyb0JTbGRmU3VsT3BiQnlKTTUvbDRtZk83VFF1?=
 =?utf-8?B?dSs2aktxNEF5dVhaSEdhcG53aTRBZWxFVlVVVGM4TVRWOWo4eVVvdXZsOUkr?=
 =?utf-8?B?ZUJXTXBBakNrRjNFTjA4WFY1M3RVdSs3VzNzZVA2dEp0ZUVZS1ZYdWRUZXlm?=
 =?utf-8?B?OEFoM2JmQnVMVGtQYzVYQ3BjNFFnb0ROUTloZ3pzZ3dzV1pIMnV4dlZMLzBE?=
 =?utf-8?Q?lh1gdPBgb62cKhvazY=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 48af3718-d6c9-45ca-d452-08dd78016e54
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 07:29:30.0210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPFCA32FAF10

From: Aditya Garg <gargaditya08@live.com>

Some USB HID mice have drivers both in HID as well as a separate USB
driver. The already existing hid_mouse_ignore_list in hid-quirks manages
this, but is not yet configurable by usbhid.quirks, unlike all others like
hid_ignore_list. Thus in some HID devices, where the vendor provides USB
drivers only for the mouse and lets keyboard handled by the generic hid
drivers, presence of such a quirk prevents the user from compiling hid core
again to add the device to the table.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-quirks.c | 5 ++++-
 include/linux/hid.h      | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 2eb15a7ae..8917fc223 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -1042,7 +1042,7 @@ bool hid_ignore(struct hid_device *hdev)
 	}
 
 	if (hdev->type == HID_TYPE_USBMOUSE &&
-	    hid_match_id(hdev, hid_mouse_ignore_list))
+	    hdev->quirks & HID_QUIRK_IGNORE_MOUSE)
 		return true;
 
 	return !!hid_match_id(hdev, hid_ignore_list);
@@ -1246,6 +1246,9 @@ static unsigned long hid_gets_squirk(const struct hid_device *hdev)
 	if (hid_match_id(hdev, hid_ignore_list))
 		quirks |= HID_QUIRK_IGNORE;
 
+	if (hid_match_id(hdev, hid_mouse_ignore_list))
+		quirks |= HID_QUIRK_IGNORE_MOUSE;
+
 	if (hid_match_id(hdev, hid_have_special_driver))
 		quirks |= HID_QUIRK_HAVE_SPECIAL_DRIVER;
 
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 1d54bba08..a00c58c0b 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -355,6 +355,7 @@ struct hid_item {
  * | @HID_QUIRK_INPUT_PER_APP:
  * | @HID_QUIRK_X_INVERT:
  * | @HID_QUIRK_Y_INVERT:
+ * | @HID_QUIRK_IGNORE_MOUSE:
  * | @HID_QUIRK_SKIP_OUTPUT_REPORTS:
  * | @HID_QUIRK_SKIP_OUTPUT_REPORT_ID:
  * | @HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP:
@@ -380,6 +381,7 @@ struct hid_item {
 #define HID_QUIRK_INPUT_PER_APP			BIT(11)
 #define HID_QUIRK_X_INVERT			BIT(12)
 #define HID_QUIRK_Y_INVERT			BIT(13)
+#define HID_QUIRK_IGNORE_MOUSE			BIT(14)
 #define HID_QUIRK_SKIP_OUTPUT_REPORTS		BIT(16)
 #define HID_QUIRK_SKIP_OUTPUT_REPORT_ID		BIT(17)
 #define HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP	BIT(18)
-- 
2.43.0

