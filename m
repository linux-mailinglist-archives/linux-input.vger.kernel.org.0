Return-Path: <linux-input+bounces-12449-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B13ABC737
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 20:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C49C57A3761
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 18:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8F37E107;
	Mon, 19 May 2025 18:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="nzSGgtM9"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010011.outbound.protection.outlook.com [52.103.68.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAA2288C18
	for <linux-input@vger.kernel.org>; Mon, 19 May 2025 18:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747679299; cv=fail; b=c1nQn8SLf1i+AbOVTOAP/bOVu2tVSweUqMwNAxi4FaN6f7EOyhl1j/71WWXTkmnrKMvOgaYvVy9d6SBeZT5Y+3UxSRwVR2YVfcgIbxGEkvDrrXoPKLmKN3W/a0Q0nfLsV+/9eSwN1MuI2Q2MQSMrtwu49uOSnyN0KxeF9gne/7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747679299; c=relaxed/simple;
	bh=IENF7D75v8F1B8hwbDvmJfvIkORcTz5IJmsjnHdq0/I=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aUn7dI/2y0fAYCUcWEUGuXMGN563I6988Bk7VPl+S4mgJewYFu4GzFcbaUKpy9iFWlWbc50ZMR7kRNVA16DKVrTiYDedBi/Y8X+KKSZx5/bugFEUXZDjQUqTzuOWfYRmlYszj39e9BvcwAd1XmVFgc2JuH72qCiMZedmpNQvpgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=nzSGgtM9; arc=fail smtp.client-ip=52.103.68.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adiPdillHGKkaaH1Tob8HMWfUxQ6scwBayrZQDbIwuIwD2Xb8qOd4vuhjLjYCrJzCnR9QS8wppCJV9DA2aMJPEAPXhyF6ZD7irpBD7XPu0Y2QGgvPDQnSXt84eeOm915HhPurnnTTAUwx2hA7D8o+orEe16R+dvnFontctCgO6nme8cDc8LivsPqsmQNXIuivILeXgcGXBy1uL93SjNsRTBTyTBR3cb8tXT8qsmH9aig5TneiZ73Becqyxfu1QQKCHY1RBVT7bZLH0k5wdUx4lKaNARCGCmW07nsR02WOfWw0Z64/KJ0klB2FBA57OD4sQmRRT1D/J38mKsgxMbtaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXmppR91aMOCmHi9gBDMwoAaHC2drpzyTcvKeNYj1Zs=;
 b=UXBgqJaZbRPmEi+IUEBRCZMUPez7cH8hzDSajvOI798YOcJ4Bm/h+xywBf0ac3k6OUE/OahrPLCJTRcaLODVzIZGqRoLJylK60jVTfD1SgMf9BdedfIPALM5aJFiXeO2h05USgLm3QqkUVSraxeNLoSMb49BT5oeJIeJ8C2Cczeo6T1ZxcmXauh9oNED1G4ROF0CPDT+a+1om9fQL8s0bSAzUcTZqqXZa/qCaKtQVhnejpu41IGbHohaj29K1dMOX9mKmp7Gn3Y+gi8hoTKNFS0Ztzc907LWw/0kAbVBe8kwqdAfhfKJTsHQPmAgmYk/HzSyJxCf+CNVAWmJ375aVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXmppR91aMOCmHi9gBDMwoAaHC2drpzyTcvKeNYj1Zs=;
 b=nzSGgtM9/2llrcq3EUS9ED+fL1iq9xUOmQDVY8GU0WaqOf9n7/z16YgA301vs/MegFGQ6HeR8l/p4y+3eeIe9zzy8soV19U0iT4c04xBKK7XtNEM+K5aWAlpzcNXIJ41c7EtJEY1WRd2mvohRpIKc85RTYplgxvX2R2Alb4+KKBdSmaOgCXMQp8fU31qHsBwqkRp+QJnI3qil6BDvFqdeOCcwOnbX/qthEXkb41LDCCHPNM7wFuQ5YHz83ArxjoVHflohCU3Li5V8lgSZzpmGc1vs0mhPdB1kkVIEzep0rA1Jp83kTpYjctQr648PBeTfP35HMOw0cPYSAyFAYs4Zw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB6941.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 18:28:09 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 18:28:09 +0000
Message-ID:
 <PN3PR01MB959753C721C0B0C29B8F24B4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 19 May 2025 23:58:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: HID apple error with A1243 keyboard
From: Aditya Garg <gargaditya08@live.com>
To: Ioannis Barkas <jnyb.de@gmail.com>, linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>
References: <CADUzMVbe=9YgXfMtSDL-XAKhYnjuo-L6_s4pGiN1g1ibU-_G9A@mail.gmail.com>
 <PN3PR01MB9597F80FFCE6A1037092AC04B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PN3PR01MB9597F80FFCE6A1037092AC04B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::17) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <9f691e3e-056d-4eaa-8a24-7290742cf28a@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: a34b4ea8-bb14-403c-921b-08dd9702e80b
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrMi34iUpeHrvUBJkG+6rPgnVFM12o9UD1ffSNOMr/TNoxxkUjYHjBkx4LwQ/9GjBI08/O+Qr4PqxbKIfIPNVGtYvr5o5oExIWUCLlcIr4takrL0m9Z+iERUQEBVcMhepntnszLLmJ6jLOYdU7kCFVMit46u0xzZ7GdyZlS6X3q+Ai1LxQw935o6fBdXUaV5GNErTak0kmaKyaftXBgROia4Wkp5xnGqL4IlzbgSx5bWDW3F3U9NOLcNZidreH6nqvLFYDoUVBokfosHUjU5BvYGc8MyCznd7PqC8p794LFF6m4/dKJqqiFvQwozhhpI9OiNERyN2QQOgGaQIO9gkl4Rjx1HWMF94n0ubErrGUeP8GcjbUfkAPi+Q3F75eps7jl3l2LPWDQcrOV6NDg7hS2pKuh03dZD6+YHK6/Q8b07QuahO3T8RnLrbAZptWSNRWhuNna+Dwuhs4iSm2MU/7ttGm80ABV7IJPj8ZbfMOAelDy/n7c+Hk+mw/NIb/m9qS9T/8nWC0idTt+auZJDchswPZpYAAzQ02OwWe+Ldqz62ibjj8F7z+QtLx9PM41XcNbPQyymrd9reE2F8tc00X9EDrGV93caKtmbFc/S3GQqvUGXAe+xl3l6S/0CXswucaS+AOw17OxNN34zojWkx1Qf7nS8R9oxZQ5RWXJpGUKlOQc1kDqX9DE8JE6gY7WXct6UUxkC4sxMf8VOC7ym+uCI0t96xyMkUBHhmMIEkR0pPCkDExT69AHQFUnVEqsKijQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|461199028|7092599006|8060799009|19110799006|15080799009|3412199025|440099028|10035399007|34005399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YktvcGoyR3pNbVI5VnpCbjRyRGNSd0xCMlNJcTdxa3hBbUhhR1BEZWRqUFNJ?=
 =?utf-8?B?bjBMUkh3Q3dtY3JnRXBRN1N4SmFyR2IzbWpEaE0zK2RzaDE0aUQ4dGdrRHdw?=
 =?utf-8?B?RlBzTnYvVGNsRDlhTmYyTzhqbjBzL2ZCNnYraUoya0dpUTh6Z0NUdFlBOTRP?=
 =?utf-8?B?Wko0c0ZZODdyVVlhR3c1YU5pbXVCRGxHeVFJZUwxMktvWk85R0xBVzJoVTM2?=
 =?utf-8?B?US9HK1FleTE2bXNIZkxOWFExbWh6bzl5dEJ5bzdxOE1aVDY4RGJ3K25XWU1a?=
 =?utf-8?B?bit2cDVEMkVaR2UxOHNnR0hjL0lxb2FSU09DNVZOM3JJNE5kKzMrSkl2bGIy?=
 =?utf-8?B?ZVI1R0VrQjZ4VjZJUi9BeGNIcWpZQmZkbFVCbnlSWFVackg0OUVFUnY3eVZK?=
 =?utf-8?B?QVFPNVpLNEtUMmpISSsxTjJEaGgxVDBuVTUvc3FINnFObmJHMGkxcDlvbUR2?=
 =?utf-8?B?UkR0RW1RMGpaUFYvbUdmRFdFQUQveWlvWUFVZ2p0YTBDWVd2ZE9TRnBTQUlI?=
 =?utf-8?B?amNwanl2OHZEeWZZbGRrczlLd1Zua1V4b2xwdkpzNk9hRlUzSmFMcFVFZkgx?=
 =?utf-8?B?T0VsQmprTFlZeDdMWElqOUQvWDdNekdQRTJRck56Mlpjd0Y3bnBub2xRK3M0?=
 =?utf-8?B?YUwxNlc0VlRsRWVVRlNKSHlJSzFZSGhFek82RHZneC80bCtSVmZwVGJwY2lQ?=
 =?utf-8?B?b1pxT1hkU1RWdm1CM2hvRWpaZFpremw5WjVRWHNBSGpSaEVhMm9wVi9qNzE5?=
 =?utf-8?B?RWlyejhOMGdCRWtrS3lQKzhOQkxPdWxLNkp5Z0tyZm5mb1I4MmRDZSsvWGE3?=
 =?utf-8?B?Umt1aC9WK1JpMit0NGFJYWJvUkY5R3pteU93aUpxZVBITUhqZm9vdjNNVlpz?=
 =?utf-8?B?RmM2R0NFZHBZR2lMZ01ueE5VeUcxSVQ1S2lYdEw2Q3dKd2F5Q2hkTU0xazZT?=
 =?utf-8?B?WjByWFdYNDFyNnZlSFRzdkZFbmpHRHZUUkFEMU9ESStrangvYnVQMXBYMGhl?=
 =?utf-8?B?Q1Y5ejRUdzA4WGx6TUk1akRBVXZraWdiMG1RYXhBS3ZtQkFXK2k5ZXFpTCtD?=
 =?utf-8?B?L2VZeVZlb3J5Q0lGa3JoQzVHTEtxeDh2OTdUcVdCSGV1MVd4eEV5dEV0Y0xq?=
 =?utf-8?B?ODRGZm4vem5hTEVWSCsxdHJVQWNqbGZsbFhWNm55b2FOT0pvckFtT3RYRnpq?=
 =?utf-8?B?M0w2S0tqbEQzd093S05LSVRxTGdGRzJxQlVyRElBR2pIWjBDVVAydmU3Q3E3?=
 =?utf-8?B?SkxQam1VcDlSU2xwYzkwVmtldm9FS2F3dnZBRTg3RldaSVRRNDlETVBDRGdY?=
 =?utf-8?B?Yy9pRGdaV0dzSlBGVFdBUHU3OXpZOVllTkRRdC9DNmRGNW9STmpOMnpYMjRC?=
 =?utf-8?B?ZGZ2NWkrOFdhdUVMRkRYeTdhV0RFN3VNcy9rem5vMXJFNlJqSGloYURER2NB?=
 =?utf-8?B?cVYrakU3b0l6WTh4a2hHcGlZSEdZcXZacTIvaDBVKzhhYUlDYXd6eS8vdjJh?=
 =?utf-8?B?RlljcVY1ZU02VjB4ZmRKSXI1bzIwWTBTUEJXQlN0ektZeWlxWUdOa3BhMC93?=
 =?utf-8?B?VTkvdXZKQlZGRHVCRDdlOUtESHlENHVsOERxVWowc3Frc0RmOGJZQ2lXS1Ex?=
 =?utf-8?Q?EsR72tHlpWX9q86+6HYxC9f/a4o1CG9t8whPArRDt7qw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2NleFNncTB3MTVLNXZhZzNING1CZ0dsL1lKSlVSdHBBY0Fzcys1MXFiT2VT?=
 =?utf-8?B?VnZiYWVvaVRrQ3k4V2JoODlxZXdhTEU4K21jSmMyYytjU2hSTjJGdHBLUkNC?=
 =?utf-8?B?VWFwT3hmL28xRmMzRmhsL2txc1JSQkpDTldsejJKQU12VFFPeFJRSjVJM2JP?=
 =?utf-8?B?eGxKOEpNa2I5eHl0SDJZTU1jMi9JYWJGbGsyV05vVDZVbm01ODdYWUdpaWY3?=
 =?utf-8?B?OHBCcXZYeW5Kdm9XWE1NVzZwSEF6M3NPRG05RVVKOVZmdmEyMWptdUtISkRS?=
 =?utf-8?B?OEJkWjhnckpPMGp2ZVorVHo4ZUhXSTN4K1BSSTNsTlhZYXZDcGFFenRrTEkx?=
 =?utf-8?B?U1A5WXhvcVBEcUYrbmJLTmgwSENrNU9OODE1NnhYdzg1aVhqSU1oZUlrZ1Zr?=
 =?utf-8?B?ZWpSREdzWXUwY1FOTWFxSlYxQm1oT3Y0aURoTGVJME4vZExyWVhrbk5NelpL?=
 =?utf-8?B?eVBzbVFLMVJhbWVpUFpvMWFIY0FGVlluWE1CWUJRRlUyYnU5SndVbHlwZVI4?=
 =?utf-8?B?YWkrbG5VbmQvVDFmeTdlRFB5b004K2FBOWQ4RllMdFB1L0plQkwySFZlS0RR?=
 =?utf-8?B?akhYdHJHQ1VCaEU2bk5qcnJBR1FNanRSRnVIcFZoYlZUTW44OXRaUGgwNVNQ?=
 =?utf-8?B?TWU2ZFBOM1F3elNHY0FSeXNhOEdGV0ZVdllqOU1JaDJQY2h6U1ZpOUtRNW5V?=
 =?utf-8?B?V2Q1d3c1NVRTNjhvOWtLNVpSNi9VNzQ3UGkrMEpEbmdoVVdvYkdkYnMyVy9O?=
 =?utf-8?B?bjBqallrczBQSXVORXd5VmpOQk0zQk1EMlc1UTFTZHc1VVh6SDg5Y0tXYTA2?=
 =?utf-8?B?aG9BcHFuWWp0M2hYSFVLOGw5Z0NXdW9EWTFDUTZTTlBNOFRoNVN2Wm55MFZH?=
 =?utf-8?B?NmNPdnAzM3REeWg1UWZCUE5ZNUgvNWNsdjF2WFVmYUtQMDE0WnA2b1FvaXJl?=
 =?utf-8?B?WHVrK3lMUWZxeVhDb01LR3ltRkt0WmtlblpSajFuUVdsdXIyNDF1UDdvWG14?=
 =?utf-8?B?ZThkaXAvNW5iaXNEd3luUTA5S1FqR1BVaWl5OUY5dWhrSllBVU54ZzMrdzl4?=
 =?utf-8?B?L0ZvbWluVCtpK0Z3YUhBbk51OWZDZ1hkZ28yaUNQRms1QmZMTDFrT1o2WkI4?=
 =?utf-8?B?eE8zYm5YTGZ6RHRRdC8rU0NVMkZXWDFsVmNKWVJuM1RBa2RuSHgyckgvbnpS?=
 =?utf-8?B?MmtkakZxaHRuWUNDSFhHcjhQVXErNlhpeWlCOTZKTnR2ckdmM0Foa0o0Zm5T?=
 =?utf-8?B?QnNyWUI5WUM0WnBFNGNiUVdtMjk3TTd4WXBlSFd1cWJEcm56WVQzSWZEMC9C?=
 =?utf-8?B?THFueGZwbUJIOTBRVWlHWEtKbE9Fc2xMM0d5Y1BuSW1PeFVKV1JXYVQ5U3lp?=
 =?utf-8?B?d0wwVGMyVjZWemJqbDBWZDQ3VmJ6SzRjeGZ5c3kza0RCN1JJMGRqUC8xaHlG?=
 =?utf-8?B?allrOWpCSWl2bTA0MmxJK0pFMFViMmZhMVhsakcwNDJrcTM1dnBnQ21abnNp?=
 =?utf-8?B?YUswL29JWFFXODl5aXAvbVVvRitaSXRsdmRnQ1E5SC9WT0NKdmRPRUsvUnJX?=
 =?utf-8?B?aDJIMENseEhKd0tFTzRDQURiUWk3cWh5R0Y5am1vU2JZS21kYjlNc3FHUC9K?=
 =?utf-8?B?MXhKV1FFQ1c4bHlIY1R6ei9FcTlyWTlkT2J4MzVFV0U4NllYa25aSWNYWURr?=
 =?utf-8?B?d2lyOUJ5Uzk5Z3hNbDVyVjhPMjNBYkErQUZ3QnN3NmdXT1p6S1ZQWnJROHI5?=
 =?utf-8?Q?9WS5Vx2A7qhviHF3Oo=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a34b4ea8-bb14-403c-921b-08dd9702e80b
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 18:28:09.7370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6941



On 19/05/25 10:45 pm, Aditya Garg wrote:
> Hi Ioannis
> 
>> Hello guys,
>>
>> I am getting a wrong print with the A1243 wired keyboard:
>> [  339.368030] usb 1-3.3.1.2: new low-speed USB device number 8 using xhci_hcd
>> [  339.460199] usb 1-3.3.1.2: New USB device found, idVendor=05ac,
>> idProduct=0250, bcdDevice= 0.74
>> [  339.460217] usb 1-3.3.1.2: New USB device strings: Mfr=1,
>> Product=2, SerialNumber=0
>> [  339.460218] usb 1-3.3.1.2: Product: Apple Keyboard
>> [  339.460219] usb 1-3.3.1.2: Manufacturer: Apple Inc.
>> [  339.469425] input: Apple Inc. Apple Keyboard as
>> /devices/pci0000:00/0000:00:14.0/usb1/1-3/1-3.3/1-3.3.1/1-3.3.1.2/1-3.3.1.2:1.0/0003:05AC:0250.000F/input/input18
>> [  339.556178] apple 0003:05AC:0250.000F: input,hidraw12: USB HID
>> v1.11 Keyboard [Apple Inc. Apple Keyboard] on
>> usb-0000:00:14.0-3.3.1.2/input0
>> [  339.558624] apple 0003:05AC:0250.0010: Fn key not found (Apple
>> Wireless Keyboard clone?), disabling Fn key handling
>>
>> I get this with kernel 6.14. Fn key is present for sure and it is
>> definitely not disabled since it works fine! Same applies to the
>> onboard Fn key of the laptop.
>>
>> Looks like the detection logic needs some adjustment.
> 
> Was the issue present with older kernels as well? And, is fn toggle working
> as intended, i.e., is the log a false positive?


Following up, it would be better to get the hid device recorded.

Download hid-recorder from here: https://github.com/hidutils/hid-recorder/releases/download/0.6.0/hid-recorder.zip

Extract the binary from the zip file. Then run `sudo /path/to/hid-recorder | tee hid.log`

After running this, choose your keyboard for recording. Then spam the fn key multiple times.
After that kill the terminal and share the hid.log file created.

