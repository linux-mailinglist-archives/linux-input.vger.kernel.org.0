Return-Path: <linux-input+bounces-13653-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B85F1B0E801
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 03:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF0183A7F73
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 01:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22F437160;
	Wed, 23 Jul 2025 01:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="OrDCJGT9"
X-Original-To: linux-input@vger.kernel.org
Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on2103.outbound.protection.outlook.com [40.107.116.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071461367;
	Wed, 23 Jul 2025 01:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.116.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753233875; cv=fail; b=Ncj+3ecULYXm0VBj+8dPQ+7Tdes428EKHwz2xHdkxnNcVGdOL7Nv4ioI+bjRzP/3D49nSixhzl5i9QY91lCiKrqhcmuC2RVIY5JpnPC3uDlXAedFAT+t3yeI8pAXZUUO6q6xpJ5Xi+NIY+5rmDh4fbQG4lmi3b5Q8QrPOa2vEfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753233875; c=relaxed/simple;
	bh=Cp+yBAbt/IXUt9yBoL/AALg1CnbxAM+Ap+AbIvmqSTA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FAo70yKaEbWEu2+MPCglMqNn0OywoAfm8ORHAFNehebwW/wWW/jvdwTLb9jkNU/dApVNlAQ2T4cpxfhHQl3jzX0FpTGCjBElGlwIzD+Onkv7tUa4FePgLV++4ttJA9rv9DX2Cavk/2i8GH3u2fdKLbNTKyyl7rxNJnhs8TtE/gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=OrDCJGT9; arc=fail smtp.client-ip=40.107.116.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D51jh98K1ngdOKoEmV1GVtsFRuPSqMKv7qDa85+W/QJ7v2QTD+oqmangwdR3LNiSpJDCPyKIWuiEThZksroW4iE3YN8QX7FH4eDRTt7EQoPxJz7cNitf/MuNYaS0oy4yzGSQ5Zr7ZtP5L4txitAQ8uTMlvrVnujxJ1L5ujaPfq7antG2f2giJAiZfliFECC7ifrxfM9oelF31/boMwMGhPLw+blwYJ+G5Ou9xjOJ+DmgOTDZlUu0qVKlJHKiw1z4qGrjWLth6+o0ce95ltobcMveMhWTAxx+tQqWKu0MBd1MOdJFQlzLCBDxkuh1/YU6Oh7xDYwUBlGerJNRAtGqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGHBP67Dov8hdEWkP3VCpC8Z8t2at9LRmN/P16OlYPM=;
 b=VVhalxYoTJM1Y9k59AhTxLe2t1aVbAEMykg/Sx7KWSfBmpbgPISD+sWfh/oFp9RO30+tf0a46y53bFCo7BKKzWbXJhI5eGHK0xVlXd4xN8DZCV1+1cM5Z3BF0huYGGgysr3yuCchCJZHGZXIu2huL65qdFwN8oly15QYiRr7wtjRIVeSJNbHD2g6/ZGNyI0cGMro3AmprUMt/N9rHkW3KwRhzd4XsemO89k2nkpPViuaX3ZzaGeSeuH4yTqXIAlwMNlMTMmWUnlokNUtr4plQuTUBf3QfSKRpL4ymUtREI69O7HIVaPowohVpbtcl0FIj9twrEgUZCjg8ZFreeUBAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGHBP67Dov8hdEWkP3VCpC8Z8t2at9LRmN/P16OlYPM=;
 b=OrDCJGT9yqo9O79lAcC8awjxOUkRz5BoPofaZgpvrJoI4v1CfYfkubfAQGKXXlxgw05HOdW4Ph5vve9SmnDEeqDjsY+Ays1q1pWXbwyN6tn+h72HYsLNeG7yK5QwfbTfNC1gyUMIXAhzjFHEem+pjY7qECt4YyBZBrcuqUpV05neT+iIFiDK29n+X3lRH9o9giqSi5GCMBcxdmMRcD09Y8j/Ilyb7JZKgUvlalod9sm1LchXtVfUtBeK+U5n1tZUTAFQLFRi2+ZTt7/eF8k9GZX81ieMcc6V4QecsqhbvHQ9AzlWflpuzYmFVS7oyTTfa1nncaCbacB6Fy2YUpOcIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a0::18)
 by YT3PR01MB6243.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 01:24:30 +0000
Received: from YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5393:fe91:357f:3ccf]) by YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5393:fe91:357f:3ccf%5]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 01:24:29 +0000
Message-ID: <2b31b238-667e-47b9-b61f-76832a1f77a7@efficios.com>
Date: Tue, 22 Jul 2025 21:24:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] input: Add tracepoint support
To: Steven Rostedt <rostedt@goodmis.org>, WangYuli <wangyuli@uniontech.com>
Cc: dmitry.torokhov@gmail.com, guanwentao@uniontech.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mhiramat@kernel.org,
 niecheng1@uniontech.com, wangyuli@deepin.org, zhanjun@uniontech.com,
 Winston Wen <wentao@uniontech.com>
References: <19571F312EE197A5+20250710072634.3992019-1-wangyuli@uniontech.com>
 <C1C54D7FA3DF3958+20250710073148.3994900-1-wangyuli@uniontech.com>
 <20250722202551.1614f59a@gandalf.local.home>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20250722202551.1614f59a@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::36) To YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:a0::18)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT3PR01MB9171:EE_|YT3PR01MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 16280f48-fcfe-4aa1-3832-08ddc987abcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qkt2TlRNSitTTUIzZ21NRXF4RWo4TUliS29JKzRJYXg0RXVXV1Y3d3RPNDhJ?=
 =?utf-8?B?OEI4TkRKanJiaTFBYTNPZjY1L2tsMmFxZWxzT3lGd0ZJNm1LRWp5MXFodGdX?=
 =?utf-8?B?eW1DR1drVVlMTWNjM010YWJXRXRFbUVOQmxEdDFjdjFmWGxFTDZiRnI2Wk85?=
 =?utf-8?B?c1pJTVIzaWdZY1d0K2UyN2lqejNnY3JXYU1ITzRSQWVQUm5jUkNGS0FITVZX?=
 =?utf-8?B?cVFIN0V4OUlodWoyZFhHK1pGTHg2MG5HOW1RT29CeVJYeXNneFVLK004QWVq?=
 =?utf-8?B?bHFWNzlBeGcvWnZYZzh0bTBsNmRnM2o2TUsvdHNYVFZVT1ZweHdmNC9WcU5i?=
 =?utf-8?B?azV5WExEQUZhb0drRFk2Q0FCWHZLcklvZWw1Q0RYbm5lcTIvdk5TclovNzBM?=
 =?utf-8?B?Z2lJekVjNDhIaGRlbCt3YVpnR2x4YUtnWlZHT3dLKzgvSkVzR0VvcGNCYS9K?=
 =?utf-8?B?R1dZZlZzVW8zZkFYV2JKdXc5OGxnZFB4UUZhdlBGRmZ3MFh2bFZNRGxLVVFs?=
 =?utf-8?B?ZCtCVGt4RFpxVStCSU8xTkdwVEkrYSt3Y2dBSVZDRUhRNDk3dFF2clphWEht?=
 =?utf-8?B?aTgxVjVqWlQrVDR2aXJrdHVQbnl0eDlxNEkwcTN2WUYzOUVKUEs4b0xOaHNG?=
 =?utf-8?B?bEIrOVduYUxMTnRPRGZ1MnFmZG52ZzBsOWxkWFdVNXNuZmhzSXowYW5nWllM?=
 =?utf-8?B?UkdVS2VqdXUyK0o4bG95eGJ1Y0pQMGtVWXZKU3lKSk1zV29PVDlZZGcrUDcx?=
 =?utf-8?B?ZXNHSG1WRlNEK2xVa0dac08ralZrTDk3Y292RVlQS01MRDQvQ2ZyUGExcjds?=
 =?utf-8?B?bElDdk5ZanEvYjltT3NLVmhyL1paRXd4ZTBHRkNkUEF1K2RKWTZHazlkRlI0?=
 =?utf-8?B?NzFNOURRd2haZEdSMk1wU2h6T3RxTmY5RnZyMytsemZLeXFiVGtrdzk5bE1i?=
 =?utf-8?B?dmJhZWpoL3lSZzViVUIxMUZIWGZ2czhMT25pTG1vV0psU0p5WVJXWkRqUnE4?=
 =?utf-8?B?SlgvNEVPRUZXdzY3QmZlQmZjZDJMdXl0SVBFUW03eWhuczJRRUNqbnpMN1JM?=
 =?utf-8?B?WWN1ellMTmdiV1RSUEN2ME1IRjRnYUo4Wk5KYUgrV0lSQ2lERm83cjIrdU1o?=
 =?utf-8?B?V3A5VFJOY2x6UVRxenJBN3VBYytHY0xhVGRWYVBqdkkxaHRRbG9hNk5TYm15?=
 =?utf-8?B?M2VtZzIrZ3FKZmlvTko2bTkrMi9EeEZkQk5ycERhZ2IyaG02cC9Oek1QVDE1?=
 =?utf-8?B?QkpBQlEzMHhnUXJmTUVSZVBJekFMdGdHZXAzcnMrYU04b2xScUVVQTBWY2kx?=
 =?utf-8?B?UlArWDgvdmFPaFpCZzJiMXFRb1ErZGhGRFBYNWVCNC9jT1hTcjROMU5kTEVJ?=
 =?utf-8?B?NVNMZW1aYUkwa2ZnQm5tdldvUG9HNitiTVFIU3lXR0VtNzdpa01mMEtKeHlo?=
 =?utf-8?B?YTJnUUJXNHZaOXBuczlDeVg3WjlsODlSM2phcUlEN0xVSWx0Z3d2KzZ6MzN4?=
 =?utf-8?B?cGtBdlpDYks5eW44S1NLcHdMeVgxcHFQU3hPMTZCdXBlMUdBelcrd0ZQWDFw?=
 =?utf-8?B?N2ZUWmQwV2pVRGhTakpFQTlQbUhhemIvL0Fia0x2K2dEaHJ5SFJXd1IwNGY0?=
 =?utf-8?B?ZXNEMlArRkR0b0hMK0M2UWxHZDlneFlydmxicklENWxMSzQ0K3V1VzYrUktz?=
 =?utf-8?B?L25HbkFzUmE4aWFRVmQrRlZVa2NvM3QrUUFyZHRxWWw4Y21QMGI1bC81MVI1?=
 =?utf-8?B?ZGpJckNJRnZ0cTNTTVVXZlhIWkV3RDRNYnRldmo1KytCQytpTW5CSkZ6d2NJ?=
 =?utf-8?Q?IASahX18vOdim1zjU90zF9z0fP8EGWkmOFObQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHRHL2RKZEU3dlBFL1V1VDF6Z3F2L1lNVko4SnQ0TWV2ZmhGK1hpUDYxQTA1?=
 =?utf-8?B?dzBCQk9zQXFxTkhSejhQdXRyMm9kYjYrSjk3eXdHU1BwcWxxMGNTT2FVeENK?=
 =?utf-8?B?RmxMbkZGQmJudk8rWVAxRmdVQng1WktJVUh1RU1tTDZObnVUOENPMzBQT3hj?=
 =?utf-8?B?a1FxZmg4bWI2dUFVWFRybFg3UjRGSlp5dzZWQlFScUZ6c255cXplSjhLYWxN?=
 =?utf-8?B?bmx4M09qNWJ2UU9WTHZMbFZZbXBWMEtSZVZ0SjBhb3RTZ3d6OXEvL05lZkEr?=
 =?utf-8?B?S2IwTFJIQVZPNWVpUjliaitUUDlIK3U2eW5tUnNNd1U3V1UrcmdORFpzUmMy?=
 =?utf-8?B?MGdxUEY4SlVka1ZvVDE2Um1WZXo2UXJ3cTZaY0hLWEhaenJtQXQwakRZT04x?=
 =?utf-8?B?MTEwS08yWlRqb3IrNHFiaVZ2OXhoQ0s5YzlrNGpoV3pZUnZXc3d4dGkxYnMv?=
 =?utf-8?B?dCtBSWdRL1QvdU1tS0N5eGszb1RVNGtYNldSczR2c3VPelZvek4yK1ozTFRi?=
 =?utf-8?B?SW1oQXZpeGplWVRFWFVTUXdaS1BGYTM5MzZlaGVqMk8xa243T1psKzZUUkJj?=
 =?utf-8?B?V1dGZ1B1VFIvckxZTmNSU2FOWXlEVERRZVhJL2Q3Ull5NVpvNDdjR21CQzdU?=
 =?utf-8?B?SnAwUVhjTVdDcXJzZzQ2UUx2REZwYmJIMWFjeFlWUUdmWm1ocG9OSDg3L2Fm?=
 =?utf-8?B?SHdiRVVaN3NhRXVEV2VTWE0xWHBkU0svVVNjeFMyczlhOWJZbFNuWnJaODRr?=
 =?utf-8?B?eUFNaGwzZXFHb3JWQ0tIYkgwTHlUellLMVRtT3RPbkdPNXphNCt4L1hnYm11?=
 =?utf-8?B?dmFWcnZpVm9xeUh4dGxMckZ5V1UwaXR2c0F3ZzZob3JRUm8vbEUvN3p6ZXJP?=
 =?utf-8?B?T0dwRlRGaDdmcGVWVnpwbzlFSUJOcW1YOXJXelRCaU1jT0I2QWplVzcwZDhX?=
 =?utf-8?B?YWZ3Z3FQOXhjL2xzcks2QXZKVkdtVjc0aTdEQitZZmw3eEYrR3ZMeGtqdlFG?=
 =?utf-8?B?S3UzMHk5NFZVQnlqT3JCbUJGVWgzaWUvNXpTbEZOMit6WjZTN3pySThjSlk1?=
 =?utf-8?B?bHV6ME9ueTUzTXU5b2pkNk83M2tHVGUxc2FkL3hkeXZ3ZVViTXdQL1YxUXYr?=
 =?utf-8?B?L2lXNHpiUC85NytENFZBWXNsaHhXNDJpOWJiaitlZUFCYVNvUzV2R3hDSkxy?=
 =?utf-8?B?Zm4yT3NiTnpsMkRYV25mVXBvQjFtS1A5ak83UTdpWkxLWEhZVW1IYU5GVmVN?=
 =?utf-8?B?V0U3QWp5YjBmVlRNcit0OTZOaElVNHdwNTMyV1FSQy9VNGwranZxUUdSWjVT?=
 =?utf-8?B?ZGw1VTRvWUQyejFtN2gzcmhlZlh3UVdhZmdtWGJvVkZhVzJMYkEwSHNXWDlq?=
 =?utf-8?B?VTNLQ1N3N0xTd2JmYjFYQmxDSTNEQWNlN2dleTdxQmUwSmJkYSt1UmJBSXls?=
 =?utf-8?B?a1lOQmNTd1MwRFBTZTEvOGRxUjh1U0cyQ0JjRm1Lb3hqOTVSQWh5SnJyc2g3?=
 =?utf-8?B?YXkzMzhDTSt2Lzk1UllYcnpabnFPVGtVeER5N0NhNU9sV2ZHdXhHNlFGWHBp?=
 =?utf-8?B?THdtUEVDYmNZVHVRbVI2NkFTWEg2NGFJTHlTNzYvWUNkOEpSYlRTMlZPTHJv?=
 =?utf-8?B?T1BUMWx2RGI3TDhPMUxwTkdNYTZOeVlGR254NWdxMWRUUFFzK01ITjZnSlR6?=
 =?utf-8?B?N2xJeG9xQ01WWTl3QjRiQlJEbWs0N3ptS1lFclBnM1l1dmlwcEdvNzFTM0lT?=
 =?utf-8?B?QWV5ZFQ4OG9FdEErRUVrQzU1VjdyZkVTY0RYbUZBbVBGd3loT3ExM0o0WXlS?=
 =?utf-8?B?ZFZ6RW5MSUZTS2cvcUdCcDZJdDZTT05GUEdhaGhJam5FVkJLNk9OWGdWa0hS?=
 =?utf-8?B?cStNZ1QzNGhCcTcxQkJmckdlK2VRVmEvTjZ2M1hvYXlSdk5HU1h2SWh6TS9U?=
 =?utf-8?B?ZTZBM0J2LzhyVjM3RE1HNnJ2WUF2dDZsNmdKUk44SmRyY3Y5T1R1RjJQQXln?=
 =?utf-8?B?akRGV3NYMVFWVHlsQStpckZYdW9QRm5ZK3NiSmdhalpLTnRjSkFTbFBOVWFu?=
 =?utf-8?B?VEk3MFQ4NXM3RU5id3puQWgxa1BIUlVsVXZZT0JTTjdnWStVOUg1aDlKL2ha?=
 =?utf-8?B?VDd4UjJFRVN1VDQvRTRqMHZDcEcyTDdqekVnYmZjYW02RWdYL2lpRW5lSDl5?=
 =?utf-8?B?ZTEvNkdWbkV3V2ZvUTlBSUd0WCtRTksrdzZnbVY0QnljdENVbllrTXQ1djFU?=
 =?utf-8?Q?slQ2cw9NiYcbDRh0nf6feEN5GfgbDxFXIsi+eZ5oXM=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16280f48-fcfe-4aa1-3832-08ddc987abcd
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB9171.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 01:24:29.8035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WW0t5B5wnTa8FkKbDWtFpEA6SmAPNHCxtuRzN0j/yE3+pANTos6URzirD7mCIaY1tWTjtSJLO6FaK1Z3JE58RSbhCtDM1e+afmwrGxc6Ynk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB6243

On 2025-07-22 20:25, Steven Rostedt wrote:
> On Thu, 10 Jul 2025 15:31:38 +0800
> WangYuli <wangyuli@uniontech.com> wrote:
> 
>> diff --git a/include/trace/events/input.h b/include/trace/events/input.h
>> new file mode 100644
>> index 000000000000..3c5ffcfb7c8d
>> --- /dev/null
>> +++ b/include/trace/events/input.h
>> @@ -0,0 +1,251 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/* input tracepoints
>> + *
>> + * Copyright (C) 2025 WangYuli <wangyuli@uniontech.com>
>> + */
>> +#undef TRACE_SYSTEM
>> +#define TRACE_SYSTEM input
>> +
>> +#if !defined(_TRACE_INPUT_H) || defined(TRACE_HEADER_MULTI_READ)
>> +#define _TRACE_INPUT_H
>> +
>> +#include <linux/tracepoint.h>
>> +#include <linux/input.h>
>> +
>> +/**
>> + * input_event - called when an input event is processed
>> + * @dev: input device that generated the event
>> + * @type: event type (EV_KEY, EV_REL, EV_ABS, etc.)
>> + * @code: event code within the type
>> + * @value: event value
>> + *
>> + * This tracepoint fires for every input event processed by the input core.
>> + * It can be used to monitor input device activity and debug input issues.
>> + */

I've always been worried about adding tracepoint instrumentation of the
input subsystem that includes the actual keystrokes into the event
payload. What I'm trying to avoid here is people leaking their password
by mistake just because they happened to record a trace while
typing on their keyboard.

I don't mind if this gets enabled with a new kernel command line
options "tracing_leak_my_credentials=yes" or such, but I'd try to
avoid making it easy to enable by mistake unless this information
is specifically needed.

But maybe I'm being too careful and people should really learn not
to share kernel traces with others.

Thoughts ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

