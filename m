Return-Path: <linux-input+bounces-13121-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2540FAEAE6F
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 07:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 560D24A724A
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 05:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC9819EED3;
	Fri, 27 Jun 2025 05:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="DTmy7CCY"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011039.outbound.protection.outlook.com [52.103.68.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0482F1FF1;
	Fri, 27 Jun 2025 05:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751002044; cv=fail; b=k8dBHe9PNVMrLOgFI211FiJoPegvM/xCipUs1vGBCSsm25AdHIZZIzdtxYXk3MiHMm+jLj02pw7UdKp4pfUyTflN78r2Ne9pnWsHH1WiU0AHRzcrn/eM8WFELIz8TkyrXM3+YHD1VcxKvF/qYHQHsSYcADtTpBJP6rHf/yBYMc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751002044; c=relaxed/simple;
	bh=6Rp+GjKUVYJDKpnCFUTrbCZNmQoiz28hZz0P52LRWlE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nqq1aPsz5f+uJxGIlDyfwpHFlNbu4YOk08kclCsEoezXWM0ijic6/v8dDnrSzRN9BP2vaVq0lHPO4XhyAWOsWTp0SqENi9/JYmh1l9XAQaFqJtmCnesgAc4cBGFLHRZLmxxN6ey8wAXSNh4q1zOMEJM/69uD9IErcJTIIEVdBNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=DTmy7CCY; arc=fail smtp.client-ip=52.103.68.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyBw67AIiRmK/uSFWYFCKpPz4ryP9bxIIkz9VTuJt+qTFMH1zcbM5KRJl1W9SCjO4ECnSqSiMaMY/dmopHa4U8t94912NCzCkpbn72ZS2P3z6PSuqeGKR6bR5mp8cB50wPjjtTXh4VY3i6z4y5iGRT48a2d9QCcmSuJtXVXEKhyZfY3lz6e+Ddq/EMy4wd67ZObuMnINwbouzSFuvufJafzUwoFQemz2ftPOAUcZSf/v53JzChiDLdE0rOv4dTcFSP+xmpFDhJszvXBdkUV9AU9P8gXr69E70c1iNjMffwYrAqaFqmAXGJ7vomwUGcsL/rgxW3nyyK1rmtGwcrK+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YbchTtFSwYIcIN2X+Bf3YzmSISouQJr2ahc3XZHQxc=;
 b=CyZVXLEeopvF75S0SJfxwZwPt2R+7Ea7COTuxMia8Xnp2fAXvl/d1eHYhVaRrVpK+rHhWRcPS2aKodORqRIsOprMB9rrTCLqNZctTqXFL/Wi3CtVc7VFwUrSI25+IRCj2M6PNgEPatqu/JAZ97j6AEmDkubaH+bAnJHju+XiujdFFWL7VfrLRXY45cVUOc7bWwKDU32M/fhtjmn6mZdcX4R6+Q4Z+AbtxXQmRBZO6zS8kkdzuYXPfNfKymjXus0W0lqbZM8z/GJxnNwJwOJfIXrONE2v7gzuL1+2C8HZUznIm6ftvMaskqknygfSk615UV4q1FVx7yr8xPnj+HLZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YbchTtFSwYIcIN2X+Bf3YzmSISouQJr2ahc3XZHQxc=;
 b=DTmy7CCYm78Zj+pi5C5D+iC64HkhjXGrkYC7Rrz58iu/t6TfoPd8Erbr6dupqqK676g0+A/RD2HV6EomPzYeZ4oksJN9egbYg7cdEFjf0vwpOpjpfcmNDNIlVaB2z06eajVim9zaIdXolH/62QXfj+S0wFclKCQU+EawJ02fXA0tXWTZ9fSaBCFek/N7mkhnul2hYFBP8c/9Ys70idMpMNzCrhoF94FeNyeyxpS4zweTo0t52wYSt/NoTB7yyK89IC6rMQI9np32m4qMizCnfe+ZKGkMP/+xQ4MUIG55cLxWgyEuIk7Mvn26GeE471zCj1bPuKY50BnlTlMVMBKzKw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN1PPFCCFB199CC.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::42e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 27 Jun
 2025 05:27:16 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 05:27:16 +0000
Message-ID:
 <PN3PR01MB9597EFD23199A2F2C7142801B845A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 27 Jun 2025 10:57:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: appletb-kbd: fix memory corruption of
 input_handler_list
To: Qasim Ijaz <qasdev00@gmail.com>, jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250626224711.13980-1-qasdev00@gmail.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <20250626224711.13980-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0064.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:267::8) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <dcea08df-da04-4779-9164-14c1b4d06a62@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN1PPFCCFB199CC:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ba59b9-8624-431b-ad54-08ddb53b4756
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|13031999003|461199028|41001999006|6090799003|7092599006|5072599009|8060799009|19110799006|15080799009|52005399003|40105399003|440099028|3412199025|31101999003|12091999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTNyTHVoNEQwdzc2Y1AzWndENkpUWmlSMEtPVmsvRC91TElJcWRxL0VZTDNF?=
 =?utf-8?B?NHhpa3Fob3VYb3RrK1QveDdxZW1yMEhpaTJyNG8ybmZtTEovM0xNbkJnVUk3?=
 =?utf-8?B?KzF6NGpmWnJ5SWpnV3ozdFJyYXBHdkZOSTYwNVdNNmQwVkVnOEpDN1BVYWlQ?=
 =?utf-8?B?dGx4U0dZc2F5MEJJWDFFMGNSOStmU2RpUjI1c2tYS254MW1hbXFWWkI0SlN4?=
 =?utf-8?B?Vkk1OXRnaUtBYlpDODJ1eW9ycGlnaGc3TDVjN1F4aFNoQm90STRMbVVOTG9n?=
 =?utf-8?B?bk1kc0JFN3Zvb0MvdVdmVjBGaC9RM0luZTFocEFveUNrcXVhQ3FLbzZ0ell0?=
 =?utf-8?B?TXYxWDlWRWF2em5qaEREK3JFQk9iTkhTcDk0dGc2MmVDMXNRMmsvSG9WZy91?=
 =?utf-8?B?ZTdJVkFwL3l2dnV3aWh5dWhOMjZvNlk1TlE2ekwwZFdwaHh0U01odkhIRUVL?=
 =?utf-8?B?UmdBVUVaZGZXb0tqVXhVMHdCRDYyd3F1S0hFVjVETCtuMHo2Y2lMVjFwemw2?=
 =?utf-8?B?ZzZqblNOV0pleTBMbnBHZFQ5dnJ2dkQ3YlBVd0grWXE2Und5U1Qzc2lxaG5O?=
 =?utf-8?B?ZFZRN2ZvZUh1cE1zMTQ3K1NHNWRmaGt1R2FvNEFuN0VZNXNEZHJ5NVBWVUp0?=
 =?utf-8?B?Y0tZbWM2U2paNi94UFhzaTE2anQreUt2WkhqV2dDR1lZWkFiTUQyaVNmV2FU?=
 =?utf-8?B?ZDJWQzdqb1JWU2VDQUZxRC8wREdsOUp4WnlBN3NCWU5MSnVLczBoQmJ5WFVp?=
 =?utf-8?B?Zmp6Y0RZZk9UalgwVHAzbW12d3VFMmUvYko5Ykd0OHhBMEErckdpOHRZYiti?=
 =?utf-8?B?QXE0anFhd0J3Y2VRZG94Vm85ZnBqczJiY0V3VzVKY3M3amdRc2crdTk2T3ZJ?=
 =?utf-8?B?WlJpMUJ6OW1pcUZ2ZEIwUVphMlFUS2xPM0FXVUhlSStIa2Noc0kyNm9QYnEv?=
 =?utf-8?B?UWNFd0YvTU9zcFROQUdIZkpqQXpGbExHOG0rTVpOVFE3WXM3RU1ZNkQzdmtm?=
 =?utf-8?B?UGFqa3Npb2lVaVMxT21HcmNTdEVKRTdwWDhFZ29ubWNXeWhoT1UxOUNubTVV?=
 =?utf-8?B?Tk1VREF6SXRQWmJJWTBITnZQcGxLajROMnZPOWJFTWlOTGJZOUJ4RnVPdHRx?=
 =?utf-8?B?OStvazVkdU1lSUljNjNyNGRvU2J3ZVNGbUFOVi9nYkpUTDZLR1JTK2FEYWNR?=
 =?utf-8?B?L0VsSnhNZjVSNGVTT3YvMnpzemRjQnJLV0lqR0lWRzhEeWNwUGZyVUh6YU52?=
 =?utf-8?B?djk1b1V2aFBLZnJPNS9Zb2dGck9kSGl2eHplUExocFBpbG9IZGJnUFZNL2Ra?=
 =?utf-8?B?T1R6a2JScmxhbnhzZmZHK1N1VFpJN3U4Uk4xNlhUbzRMTEM5MnN5MXJrRTNN?=
 =?utf-8?B?OXFiKzg5NHA5SW11aTNYWXFvQlA3MFY1V3V4TTRhWFlRZUFrOWxVMG03Z1Rr?=
 =?utf-8?B?NFA3OXFzaStVcWJMSmRqUzliaUh4WmhPN3VyM1RBdnJJcmZwQVdSTTVOUlBt?=
 =?utf-8?B?Y2NZV29HY2w3aVBjZ0l0Y0VVenJXZThTQVpLVmtYTi8xdWNmWUNMRmZxc1hY?=
 =?utf-8?B?Z0orYUNmeXg4UWd4ME5iM3lsVjJnRG9OMzZKWTkxc3dQMHBianhyV3pUTGtx?=
 =?utf-8?B?N0NpQ0RoaDU4MFlKeTJBS3VLZWFsN24veTlQTWFPd21IbTE5T1VUek5RcTJJ?=
 =?utf-8?B?b2lBRTVodlhBQ0l4SDR6Vy81cmh6NnZFWW0xb05aUGgzQ0pYenF2MlhPYmJ0?=
 =?utf-8?B?U1ZkVFhhbGRuY0luWCtmd3owVFBJODBrVHpFaUZMQ0ROTFVmTlN3VzdSRXZ5?=
 =?utf-8?B?YThDTGZCV0RlMG1jN2pBdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmZCQUJJRko5a0RGZk5lV0dzNlQyMThqVGJCSGpvSllYRzcwVHVEZHRCRVBZ?=
 =?utf-8?B?bldnV2FaYTZtL0k2VTducVBCenphNU5OYXJYOFJJeHNibDBXVm9MRDB3WEJP?=
 =?utf-8?B?cWhrdEpJRVNvRHZXWll3d24zV0VpMmttUnRmTTBZRkVKQmcvam9QbHZJWEFa?=
 =?utf-8?B?M0M1bjdENk5LT1Z3TVN2d0gwcVA2MGtERmpTVDJIRFRrVkkvT3ZlaHFkNEU5?=
 =?utf-8?B?bFJ4S2ZsbS9NRzJhQUZWSnl6czFWVGRBYmZMdElrNlRWajFlTVNING1rZ3pY?=
 =?utf-8?B?YnVnSVdDa2c1K0ZpL3E1cUhoVUxSVGFOcWM0ZmdwbUVEMzRxOTlFSXVlSUZX?=
 =?utf-8?B?TGhTTk9MbVliM281Rmdud0lnYlRvT2ljTEV6dTU1Wmw0aXA4OEZmekQ5bG9v?=
 =?utf-8?B?Z3Exb3IzcHdBb21JSTM5Tzk2cnZVYS9HMDR6aHhRMHhuczVxT1QvNWM1ZmFM?=
 =?utf-8?B?S3JOcnpTSFFMTUtIQUZYbERSVkREdXEvODBQYm91OURaY2dmSU1nbVRRWmM2?=
 =?utf-8?B?MnVGaWdDUnZBeHhQUHZraDVjSFJ6UkFTTG40TDMraDlIT3ZaZVAramw1cTZX?=
 =?utf-8?B?K3NyeHh4TUlmT2ttSzVrMVRWKzRDb25jQkExVEVmNHZzQXNDcncyblM5WUdt?=
 =?utf-8?B?aWZHMkdsRHpMcnBuSkhGNFMyTFcyQ2NOTmZ3Q2J5OVJZYmJnQWZhc1Y0cXRK?=
 =?utf-8?B?OFg1RlBkTmg4Z2NCQjhPTWx3U1RBVk44bXp3VjlGSFdUNnFnOEsxN1A1UFV0?=
 =?utf-8?B?MGxqMXZ1RVZJOWg3dkdyeGdpd1krdEZSYWtmQ2paaHFKSFl5N2V0NktrbzFM?=
 =?utf-8?B?V3ZlWXJaL0pna2VTMG5UQ21EbHlvZldWek1nV1d2YWIyZTRSZ0V4cy9FSENF?=
 =?utf-8?B?KzVud3cyWFduSUNPTUY1a2lqenRZbHZTMkVxbjgwMSszZGFwNnFHR21vMVRO?=
 =?utf-8?B?YmtQbXJxWG5LVWFRb0lseERYVG1penVUaGVzc2ppazc4TjhndUwvMnBZcnJB?=
 =?utf-8?B?R0RHMHlvVTFNanplRWM1dTBRbitOU0F1ZEZVanFtQTh0aXVCVDU5Rmw1bVQ0?=
 =?utf-8?B?Y1lOSnM3enV5TUtTKy9hMGhuMG1NeFBCVlk2ek1VNUtFMGpZKzVVNVZ3S0Vj?=
 =?utf-8?B?cEhHT2laS0wzMzZseTAwcnI5amt5OWZzSVkxUU0vMVljbWQwWHIvb3kwUmw0?=
 =?utf-8?B?TFIzSjVzcDVicG5jd3BCSjNzTXhYdTRqdytHbXpKR0pnQ2Z3WDl5MDBWODl5?=
 =?utf-8?B?NGZqOStDa0swblhsTUpueEZia2ZQSDNTMjd6MWcrSHBVVGtsRzJadmtvOEFX?=
 =?utf-8?B?YllsaW8wTE1DUWd5RHhEb0ZtcjlCWlcwUFZIbFVqaDN3em5CSnFGdmE4OStZ?=
 =?utf-8?B?bU9BVzR1dUY3OUtnckwrZXdwZ1VmUjR4cytXeTVNenRrbTltMy9Oc3RqV094?=
 =?utf-8?B?OWNmdlI1TUwvN3lEMWxKamVpZGRJMW1kQU53azh1elQ2ZVIvVlB2NGRvNUhE?=
 =?utf-8?B?RmdzWVdjVXBRblZSOVpnSnNBR0dTRDFpUWs3RmNSV0k4UWpiVlJ0QkNMWmtK?=
 =?utf-8?B?MTIrSzVLZVhrNmlaTmFvRzdpS0haQURjOVlqdHJKaUNncjBVTDVDbUJ3bjhy?=
 =?utf-8?B?UEtnWk56WHhqdnBCb282NjRsbEFSZlV1UHMySmVIZ1B0WWdkendxeG44MTV0?=
 =?utf-8?B?WGY5Vi9jMGJwRHZtYXVaR0Via2ZOK0xqREI2Q0h5MnRLN0FZWlk2MXhYZ3Rj?=
 =?utf-8?Q?1ygARvyTLcAWnrqo2I=3D?=
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ba59b9-8624-431b-ad54-08ddb53b4756
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 05:27:16.5300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PPFCCFB199CC



On 27-06-2025 04:17 am, Qasim Ijaz wrote:
> In appletb_kbd_probe an input handler is initialised and then registered
> with input core through input_register_handler(). When this happens input
> core will add the input handler (specifically its node) to the global
> input_handler_list. The input_handler_list is central to the functionality
> of input core and is traversed in various places in input core. An example
> of this is when a new input device is plugged in and gets registered with
> input core.
> 
> The input_handler in probe is allocated as device managed memory. If a
> probe failure occurs after input_register_handler() the input_handler
> memory is freed, yet it will remain in the input_handler_list. This
> effectively means the input_handler_list contains a dangling pointer
> to data belonging to a freed input handler.
> 
> This causes an issue when any other input device is plugged in - in my
> case I had an old PixArt HP USB optical mouse and I decided to
> plug it in after a failure occurred after input_register_handler().
> This lead to the registration of this input device via
> input_register_device which involves traversing over every handler
> in the corrupted input_handler_list and calling input_attach_handler(),
> giving each handler a chance to bind to newly registered device.
> 
> The core of this bug is a UAF which causes memory corruption of
> input_handler_list and to fix it we must ensure the input handler is
> unregistered from input core, this is done through
> input_unregister_handler().
> 
> [   63.191597] ==================================================================
> [   63.192094] BUG: KASAN: slab-use-after-free in input_attach_handler.isra.0+0x1a9/0x1e0
> [   63.192094] Read of size 8 at addr ffff888105ea7c80 by task kworker/0:2/54
> [   63.192094] 
> [   63.192094] CPU: 0 UID: 0 PID: 54 Comm: kworker/0:2 Not tainted 6.16.0-rc2-00321-g2aa6621d 
> [   63.192094] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.164
> [   63.192094] Workqueue: usb_hub_wq hub_event
> [   63.192094] Call Trace:
> [   63.192094]  <TASK>
> [   63.192094]  dump_stack_lvl+0x53/0x70
> [   63.192094]  print_report+0xce/0x670
> [   63.192094]  ? input_attach_handler.isra.0+0x1a9/0x1e0
> [   63.192094]  kasan_report+0xce/0x100
> [   63.192094]  ? input_attach_handler.isra.0+0x1a9/0x1e0
> [   63.192094]  input_attach_handler.isra.0+0x1a9/0x1e0
> [   63.192094]  input_register_device+0x76c/0xd00
> [   63.192094]  hidinput_connect+0x686d/0xad60
> [   63.192094]  ? __pfx_hidinput_connect+0x10/0x10
> [   63.192094]  ? xhci_urb_enqueue+0x523/0x930
> [   63.192094]  hid_connect+0xf20/0x1b10
> [   63.192094]  ? mutex_unlock+0x7d/0xd0
> [   63.192094]  ? __pfx_mutex_unlock+0x10/0x10
> [   63.192094]  ? __pm_runtime_idle+0x95/0x1c0
> [   63.192094]  ? __pfx_hid_connect+0x10/0x10
> [   63.192094]  hid_hw_start+0x83/0x100
> [   63.192094]  hid_device_probe+0x2d1/0x680
> [   63.192094]  really_probe+0x1c3/0x690
> [   63.192094]  __driver_probe_device+0x247/0x300
> [   63.192094]  driver_probe_device+0x49/0x210
> [   63.192094]  __device_attach_driver+0x160/0x320
> [   63.192094]  ? __pfx___device_attach_driver+0x10/0x10
> [   63.192094]  bus_for_each_drv+0x10f/0x190
> [   63.192094]  ? __pfx_bus_for_each_drv+0x10/0x10
> [   63.192094]  __device_attach+0x18e/0x370
> [   63.192094]  ? __pfx___device_attach+0x10/0x10
> [   63.192094]  ? kobject_get+0x50/0xe0
> [   63.192094]  bus_probe_device+0x123/0x170
> [   63.192094]  device_add+0xd4d/0x1460
> [   63.192094]  ? __pfx_device_add+0x10/0x10
> [   63.192094]  ? up_write+0x4d/0x90
> [   63.192094]  ? __debugfs_create_file+0x377/0x5a0
> [   63.192094]  hid_add_device+0x30b/0x910
> [   63.192094]  ? __pfx_hid_add_device+0x10/0x10
> [   63.192094]  usbhid_probe+0x920/0xe00
> [   63.192094]  ? pm_runtime_enable+0xfa/0x2a0
> [   63.192094]  usb_probe_interface+0x363/0x9a0
> [   63.192094]  ? sysfs_do_create_link_sd+0x89/0x100
> [   63.192094]  really_probe+0x1c3/0x690
> [   63.192094]  __driver_probe_device+0x247/0x300
> [   63.192094]  driver_probe_device+0x49/0x210
> [   63.192094]  __device_attach_driver+0x160/0x320
> [   63.192094]  ? __pfx___device_attach_driver+0x10/0x10
> [   63.192094]  bus_for_each_drv+0x10f/0x190
> [   63.192094]  ? __pfx_bus_for_each_drv+0x10/0x10
> [   63.192094]  __device_attach+0x18e/0x370
> [   63.192094]  ? __pfx___device_attach+0x10/0x10
> [   63.192094]  ? kobject_get+0x50/0xe0
> [   63.192094]  bus_probe_device+0x123/0x170
> [   63.192094]  device_add+0xd4d/0x1460
> [   63.192094]  ? __pfx_device_add+0x10/0x10
> [   63.192094]  ? mutex_unlock+0x7d/0xd0
> [   63.192094]  ? __pfx_mutex_unlock+0x10/0x10
> [   63.192094]  usb_set_configuration+0xd14/0x1880
> [   63.192094]  usb_generic_driver_probe+0x78/0xb0
> [   63.192094]  usb_probe_device+0xaa/0x2e0
> [   63.192094]  really_probe+0x1c3/0x690
> [   63.192094]  __driver_probe_device+0x247/0x300
> [   63.192094]  ? usb_generic_driver_match+0x58/0x80
> [   63.192094]  driver_probe_device+0x49/0x210
> [   63.192094]  __device_attach_driver+0x160/0x320
> [   63.192094]  ? __pfx___device_attach_driver+0x10/0x10
> [   63.192094]  bus_for_each_drv+0x10f/0x190
> [   63.192094]  ? __pfx_bus_for_each_drv+0x10/0x10
> [   63.192094]  __device_attach+0x18e/0x370
> [   63.192094]  ? __pfx___device_attach+0x10/0x10
> [   63.192094]  ? kobject_get+0x50/0xe0
> [   63.192094]  bus_probe_device+0x123/0x170
> [   63.192094]  device_add+0xd4d/0x1460
> [   63.192094]  ? __pfx_device_add+0x10/0x10
> [   63.192094]  ? add_device_randomness+0xb2/0xe0
> [   63.192094]  usb_new_device+0x7b4/0x1000
> [   63.192094]  hub_event+0x234d/0x3fa0
> [   63.192094]  ? __pfx_hub_event+0x10/0x10
> [   63.192094]  ? _raw_spin_lock_irqsave+0x85/0xe0
> [   63.192094]  ? _raw_spin_lock_irqsave+0x85/0xe0
> [   63.192094]  ? mutex_unlock+0x7d/0xd0
> [   63.192094]  ? _raw_spin_lock_irq+0x80/0xe0
> [   63.192094]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [   63.192094]  ? __pm_runtime_suspend+0x74/0x1c0
> [   63.192094]  process_one_work+0x5bf/0xfe0
> [   63.192094]  worker_thread+0x777/0x13a0
> [   63.192094]  ? __kthread_parkme+0x99/0x180
> [   63.192094]  ? __pfx_worker_thread+0x10/0x10
> [   63.192094]  kthread+0x327/0x630
> [   63.192094]  ? __pfx_kthread+0x10/0x10
> [   63.192094]  ? __pfx__raw_spin_lock_irq+0x10/0x10
> [   63.192094]  ? __pfx_kthread+0x10/0x10
> [   63.192094]  ? __pfx_kthread+0x10/0x10
> [   63.192094]  ret_from_fork+0xff/0x1a0
> [   63.192094]  ? __pfx_kthread+0x10/0x10
> [   63.192094]  ret_from_fork_asm+0x1a/0x30
> [   63.192094]  </TASK>
> [   63.192094] 
> [   63.192094] Allocated by task 54:
> [   63.192094]  kasan_save_stack+0x33/0x60
> [   63.192094]  kasan_save_track+0x14/0x30
> [   63.192094]  __kasan_kmalloc+0x8f/0xa0
> [   63.192094]  __kmalloc_node_track_caller_noprof+0x195/0x420
> [   63.192094]  devm_kmalloc+0x74/0x1e0
> [   63.192094]  appletb_kbd_probe+0x39/0x440
> [   63.192094]  hid_device_probe+0x2d1/0x680
> [   63.192094]  really_probe+0x1c3/0x690
> [   63.192094]  __driver_probe_device+0x247/0x300
> [   63.192094]  driver_probe_device+0x49/0x210
> [   63.192094]  __device_attach_driver+0x160/0x320
> [...]
> [   63.192094] 
> [   63.192094] Freed by task 54:
> [   63.192094]  kasan_save_stack+0x33/0x60
> [   63.192094]  kasan_save_track+0x14/0x30
> [   63.192094]  kasan_save_free_info+0x3b/0x60
> [   63.192094]  __kasan_slab_free+0x37/0x50
> [   63.192094]  kfree+0xcf/0x360
> [   63.192094]  devres_release_group+0x1f8/0x3c0
> [   63.192094]  hid_device_probe+0x315/0x680
> [   63.192094]  really_probe+0x1c3/0x690
> [   63.192094]  __driver_probe_device+0x247/0x300
> [   63.192094]  driver_probe_device+0x49/0x210
> [   63.192094]  __device_attach_driver+0x160/0x320
> [...]
> 
> Fixes: 93a0fc489481 ("HID: hid-appletb-kbd: add support for automatic brightness control while using the touchbar")

The handler was introduced in 7d62ba8deacf ("HID: hid-appletb-kbd: add support for fn toggle between media and function mode")

> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>  drivers/hid/hid-appletb-kbd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
> index d11c49665147..271d1b27b8dd 100644
> --- a/drivers/hid/hid-appletb-kbd.c
> +++ b/drivers/hid/hid-appletb-kbd.c
> @@ -430,13 +430,15 @@ static int appletb_kbd_probe(struct hid_device *hdev, const struct hid_device_id
>  	ret = appletb_kbd_set_mode(kbd, appletb_tb_def_mode);
>  	if (ret) {
>  		dev_err_probe(dev, ret, "Failed to set touchbar mode\n");
> -		goto close_hw;
> +		goto unregister_handler;
>  	}
>  
>  	hid_set_drvdata(hdev, kbd);
>  
>  	return 0;
>  
> +unregister_handler:
> +	input_unregister_handler(&kbd->inp_handler);
>  close_hw:
>  	if (kbd->backlight_dev) {
>  		put_device(&kbd->backlight_dev->dev);

This makes sense. With the "Fixes:" corrected in commit message,

Reviewed-by: Aditya Garg <gargaditya08@live.com>


