Return-Path: <linux-input+bounces-13393-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A34AFA348
	for <lists+linux-input@lfdr.de>; Sun,  6 Jul 2025 08:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C16E3B4082
	for <lists+linux-input@lfdr.de>; Sun,  6 Jul 2025 06:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7C61B0437;
	Sun,  6 Jul 2025 06:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="H3l6iy2y"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011030.outbound.protection.outlook.com [52.103.68.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C0919F424
	for <linux-input@vger.kernel.org>; Sun,  6 Jul 2025 06:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751783235; cv=fail; b=db1Ag5lMXFQLgjm78JVoH34eDcn/Kz7Y64cNpdjJAXDny7wmObCXLAHsdpQNO/eSfQThNe8jOU5zdxftFAprtX+BO8Zr4qt2560Lp+8UZula5U/flHuZt2WiH1FX2HkjwQ8LnWr96DziDmX6aMje3WqX5gYY9H3kewEUHzWLnfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751783235; c=relaxed/simple;
	bh=iVhyLQ9K3JuOxVr/aRoZ78qyt24ZTFInZWWpAgTTfHg=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iklK+w/stvgyeOWp55jsM39/cxHCu7rt2Xw9ZfgBu7FKiIg4lYfxhWGmb9rme/nAgQwfsmPNqaVX5RR7LTYO0qn5EJq3TRuak3KCS49UyI7WdpuOhaJSn+s3uKzEsbsoUiVb/ufGtEnh/6wUEdgHyQLK2/LklnUcAvH6oyrQvWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=H3l6iy2y; arc=fail smtp.client-ip=52.103.68.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROLcGyeTLb0eQtWzxgGWgdSGF5thAsS977pbvwrazgqy1K1PJ2wQjSUKK3JGoGMdLv25mWRDrukoCKuebyOy+Cs+SyrxYyr4u+Le0Yjl4JLGn3UocpsIiAt739J5VGZMC1ge9+DE6BYinHg21xwxCU0M/pTnsfv9Z1tOorAnPJgFpQK9uJJT72XL5cbwq0yDWnQSATPR/wNPxoVrTgJDvHjF4Dam3M8ykQjixyW1ftV5XK/BiCxIhxYXqzOkQHd3fPtfmoHlKek6ekecc6OG49WTYDJ8uCfUm8DcBMNcdWkz9HR0PG3EmuQnVmSuq66m2P1sIujr28Tblso7wsm1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zw77TB5s9F/trFwSRaJdyDWaBR155Ax0jKXbKHXLsRY=;
 b=c3yaFZ+KroPIVrwsrvjoLot7GY4RH6gO+HbrKI7Jz8Eip9hebxCQhlUAMST62Jwj8Qa0w35TywhsfZXZbhWVRfWlNSTO6E/DOFE9lmDUdLmraHkQ9U6yWEMErc3Li2Ky9sDqJ9RWe0Ube+hjxAbfEcyLyyxoxMftBdG6bMPHwbA6x2+rnhdm+48QeOA/NHSpp2mO8YHMrYdSwzaRZq7VmFuhdKeYZ/4eUOGvoapXzKAUazbIgIialytIBB/IZghx535KcZDBp6E5aV5KHoqtevTm2clUozu23zbbp68pDY8VEmdVg2dF37U01Xk2IgHSCmhMXQsT27H+Vil4D2v10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw77TB5s9F/trFwSRaJdyDWaBR155Ax0jKXbKHXLsRY=;
 b=H3l6iy2yvY0sAzU3IZpRkZSfbHS9QJ8uspV4zvACykE86Zgs7G7S+exk4Em5AKc5BVL7DBF/mJ3Fu73TOGnzGUFl3Rix5MPJTKziOQMZS/IEjkqjFIBbja6lr4DbAKsuVmPBIyK/Ga3u1FTD0hbMHLpFy0uDnvKs17zKl7atZ7DQ5tEg9szhKOSEoltrky005scn/EEJTQXbJGDofzmRD87QJG4TQmHXAPO5GI26euGrS6ZwMTvlGtLweQmZnVr7BBRn1B1TkPTWfaZoSbKG7KuY52KbR/yjk3leJc+3BJUKvRNbOXNkPZRlMj3SbLsIlvKdeUhBpfWD+VO9Md3oQA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAXPR01MB4343.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Sun, 6 Jul
 2025 06:27:08 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%6]) with mapi id 15.20.8901.024; Sun, 6 Jul 2025
 06:27:08 +0000
Message-ID:
 <PN3PR01MB95979E06C65B4BE4051BF9B7B84CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Sun, 6 Jul 2025 11:57:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: hid_nintendo Switch 2 Pro Controller support - where to start?
To: Saihaj Johal <personal@sjohal.net>, linux-input@vger.kernel.org
References: <3642543.dWV9SEqChM@saihaj-mainpc>
Content-Language: en-US
Cc: "Daniel J. Ogorchock" <djogorchock@gmail.com>,
 Nadia Holmquist Pedersen <nadia@nhp.sh>, Emily Strickland <linux@emily.st>,
 Ryan McClelland <rymcclel@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <3642543.dWV9SEqChM@saihaj-mainpc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::25) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <c9a01ff3-b5ac-4e1f-bf8a-86a3bcd88dfb@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAXPR01MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ef29dc-674d-415e-e7dd-08ddbc5621e5
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799009|7092599006|19110799006|15080799009|5072599009|6090799003|461199028|440099028|40105399003|39105399003|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2MzT2ZydTdxYU54Kzc1YW5udnAzTm9LTWVWRXBMV2k3aVhReGFXVWgxL05X?=
 =?utf-8?B?RHhXWjVZNFVWcmNxSUcybXBVVktlQ1hUUDFxbDZVTXFrbEtnMEJVSE54cWg4?=
 =?utf-8?B?dDVBNFBiWVJkRVJJMVJtbnZleWxMaTZJa3FmaVlnUUMvWklDQ2kzMDJEOHU5?=
 =?utf-8?B?NVBIeXV1bHBBanY4YVFtc0RlU3pKYWx1V2MxTVkwdGhzVGxybk03d0pzdm5I?=
 =?utf-8?B?QWVNUDF3aXZUWlhqc1R5bEJQdm8vVms3elZTcytQR1MrSThsQUt2NmlmeUcz?=
 =?utf-8?B?QjlUNkZlMmp1ejJPcjhlcXBoOXNyekhteGdoM2xxL2xzTWlmdm9DMjF0V2FM?=
 =?utf-8?B?VDJNYzlmWVIxVnYveTQvYkNJa0RydzJFSVNNMlFnT3Z3RzlNUkRWbzRvUEdD?=
 =?utf-8?B?SFZzYnRLTXRFckUwMVNCT21EcUhSekFZbkcyNWF5cFFPdjFYc2RhYnVlMVdv?=
 =?utf-8?B?MUEveTNMR2FMUlQvVE5mSTVYK0U5QStEVTVPSzZPby9GYXdWMk5zeWljNzFm?=
 =?utf-8?B?emZ2NnREbzVqM0hRUGhwb2o3VFJnTEUwUEFjbWVXWldZNnFOemIrdlhxS1Ry?=
 =?utf-8?B?TUFUODhOeXJMVytpZmtqWTFac2R1ZGlWRDlwcDBjUU9MQWdXazNvQzc4TWN5?=
 =?utf-8?B?eGtlblNyNXlYc2RKanMzTFVENzAxd2d2ZUxBZGdNWlAwdTV3dXp5bFQvdU40?=
 =?utf-8?B?Y25VcDhBNy91Uk9sL05PKzBSSkdzdHJiSS9mOW5hZ29TTC92cTBmVWZacHE3?=
 =?utf-8?B?bFBIWGpJelV5TXlWemtSWFJFNEF0YktHQnV5WDhsWTZRd3QvRzVVVmQ1NEVQ?=
 =?utf-8?B?eWNFbFQ5elJRSFJkUFFTamtmZUdURGFINEdlRkdaQ1dLcWhMdzYzZEU4bWRB?=
 =?utf-8?B?d2JhL0pWc3B5d3diMnAxRlc0dU9LOEQ2bW1jTER3RmttRU9zdzcrbEkxQlQw?=
 =?utf-8?B?NnRmRVJvTmhKTHRmcUV5RDJOd2hJeFBpWWJBT29YWGtibE5hbEFSRE9LS1pi?=
 =?utf-8?B?OXIyK2psajYveS9PWnBPTXROVDNkUFBlRzYzM0pWY1RvU0w2d1FvTTdnUVVY?=
 =?utf-8?B?R0J4VVVPeUVVM2RXdnVzNzl0Z1lzSGZzYlE3OE5Oc2M4NWlUUFExOFpzL0Zx?=
 =?utf-8?B?ejVBR1VtZnF5aHAzMEN0NkoyZ1Y3SW83SUJLakc2UHpDbTFIelZHazhuOTY1?=
 =?utf-8?B?RVBiZ0VyZEJidkdMSC9DckZCam55ZlNXUTZraC9VNENUVmtoaFhmZlh4VFFm?=
 =?utf-8?B?UnVnc0JTQWxZTHJwQ1AzbjBxZlhMNkVzWXExb0JGaUx3b0p3WjlKSmdZeGYy?=
 =?utf-8?B?aU9FendwcENwdU8wa0R0QlpaTkM4S1A1cmNwVno1c0EwK3kwNFVuNmF0VTFV?=
 =?utf-8?B?K0prSWljNXJsRExxUU4zUE9aUmxHWWtOZ0trRXlRbFNwVVp5dDAyNHFPU0N6?=
 =?utf-8?B?WHd2KzdHS2dtSmRQalVCNVJWL0VaZlA2VFJKWEljdmYwUkRub3BuQ1cyeUJL?=
 =?utf-8?B?d0tPVVpKbEF1YWE5S2g0MEZXRGprZG9ubWFsTjhLRmxDWE8vbDZ5NTlQcGVX?=
 =?utf-8?B?YUZnRnJSTXdpRytnMHZjS3lWam9xY2IwM2oxellEb04wZ044eGVoY2JkT3Rk?=
 =?utf-8?B?UXVvYVBPM3N4L2hiK2Y0TmduWEcxVnc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHl3Q3NqVU5OaElSaVZKYlFXd2dSMWZqb2VaNlMrMW1XSHNsRkx1d3IwY3NP?=
 =?utf-8?B?MjcvSHVOM1F3WXJUc251M2czN2Yxbmx5L0xBY05WNXQyMHRLanllZU5kemVr?=
 =?utf-8?B?TWhHT0M1blc4S1B5ajZJMVZvaXEwOWJNSk5mcVh4OEdyQ1F4UEU5azFEeXRF?=
 =?utf-8?B?WTIvZVNSV3pHM3IyL1FEM08xOE9rKzRHNFdDeEtJT2Z1RDRmc25xeFJidWl6?=
 =?utf-8?B?WUlucGh3SG5laCtWT0lYUEtpN0Yxd3ZFa3Z3NzdmNHFsRnJjcFEyOWFHWmZO?=
 =?utf-8?B?Q3c4Tis1Q2hqa05qQXVKMWt0K3hRcUt4akZTOEZXT05IeG1QaGpLV09VeXhX?=
 =?utf-8?B?VEpYYStWOTB3bVM2Wnlzbm5WN0g3S1hjY1FPR0tYTm9Kc28vRUJLUGx6TjN2?=
 =?utf-8?B?WHM5UW5SbUx1VXBoODVOUkdtZnNCU29jMEREd2hlemJ0ZXBnT1BTTjFVWE9n?=
 =?utf-8?B?WHJkanB6ZVFEdHRvcVVDQTVxSWxTbVQ2c2tqWUF5UFZ0TnhJQUFjUnJsWXJS?=
 =?utf-8?B?Qyt4VytoZkhweUZmTkNFKzgzWkhHTStSalgwc1hhRTJ5a3JENTUzMGI0Rkdx?=
 =?utf-8?B?MWRzak44aEh4TW9ydE1aYUJXakhzZzUvYjI4dDkrZVVqS3d6S01rOEZPRWla?=
 =?utf-8?B?NFRZMHRwWmZ3d2xDYzZtVjh2WXgyMFREaGJpeEx3UlJGbGN6TjRzZi9saUhP?=
 =?utf-8?B?ZGRuSjk4YUpiRlQ4WFM1QVY1KzVvS0tkQ1JtQ0EwTVBOQXlkRmlwY0RQVElw?=
 =?utf-8?B?UkprV01TMFd3SklWNFhoRXFCRlJVbUZUTDF1SndWYy9Ud0xEWGRWQkdkWDdD?=
 =?utf-8?B?TnhuQXpJTjVZZitGc1MxNE5yeUMxWkdCcUMrZDltRU1JWXlpY3RTOUJPUnV0?=
 =?utf-8?B?c2NyUTE4Z3p0OUd6N3Q0U2JxeEsxUVY0SG9pclRWMXZybHNaamprOEhhOFlR?=
 =?utf-8?B?UnI1NGtkaW5CaGFYZmMva0lWV0dIblZNa0RYUnFKTEN6Z3JXTGZBdnFDWmwr?=
 =?utf-8?B?Wms3VVJTS2Qyc3A0amVyNTFOMm8xOUR6SXlEd1ozZ1hmUGhOcHpLS0lkZys4?=
 =?utf-8?B?V2o1dHpRaU5rMVdGeXV0ekZ2NXV6dHpJWm9JWjdXQ1Fta3lHa2dLQ3FWUGF1?=
 =?utf-8?B?MmFERXVMS25DbFcyd2MxTkdZcDBTTytHdzBqWVM4ckF1WjBMczBrVmZNTTc1?=
 =?utf-8?B?Q1h1R1dGblFZUEovYVR5V0NRWlJ3bERWSzdqN2VMWTZzRHBlUWxmRGovdVNF?=
 =?utf-8?B?TlRUKzdSWVJ6YlZnaEVHa2w0cWVNSHBiTlpLS2ZmbDFMSkJwa1VSa1pGa2Nz?=
 =?utf-8?B?U2JES2VsNmJyQWgvYXM4N3VyaCt5U1pTdHRKOFVneXUxQWh4SUJtUHNkSUlw?=
 =?utf-8?B?M0Z3dG5mOCtlMGFLRjJ4Vm9sN1kyZTBaZFdKL3cxa2NYS3JHTUFTUDN5S2Rt?=
 =?utf-8?B?R25RMndmRjVNMHg2L2pveWxUZGxpT3Q3bUZGcWlITTFmdGxwMnVHQmdSNUJD?=
 =?utf-8?B?L2Y2a0ZvUW5samR5NmE3d0M0VFp6dW9VamJheGYwUi9wT281aU5xcGViUXFG?=
 =?utf-8?B?Yi80ZWRVaGd6cEZWclYyQ1NLZjA3NDhOU3BXbU9TR2Q3eVN3UXk0T2h1bUpl?=
 =?utf-8?B?TW10VWtVaDdyODZpdEdSSEgzLzE1L0QxczUrNGN0YUJoWHAvcWhtLzZPN1la?=
 =?utf-8?B?bzNhSy9sS1VJa1NHUElZZndnOURudXF6dkxtRkFmUVp1eTZibGVKTmNvdGRJ?=
 =?utf-8?Q?Mz6Z1f3o6ANKETOQ1euqAFsYnWrorMUPplckSZQ?=
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ef29dc-674d-415e-e7dd-08ddbc5621e5
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 06:27:08.0578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4343



On 06-07-2025 12:18 am, Saihaj Johal wrote:
> Hello,
> I recently got a Nintendo Switch 2 Pro Controller that is not currently 
> directly supported by the kernel like how the Switch 1 controllers are. 
> Looking in "hid-ids.h", there is no product ID for the new controller (got 
> 0x2069 from "lsusb -v"). The device class shows as miscellaneous device, and 
> the controller does not show the player LEDs to show it is active (it only 
> charges over USB, alongside showing in "lsusb" as well as showing as a USB 
> audio device for the headphone jack on the bottom). However, I have managed to 
> get it to work as a HID device using this website (https://
> handheldlegend.github.io/procon2tool/) which uses WebUSB to send the right 
> commands to make the controller turn on fully. After enabling, this setup 
> seemingly works with the existing evdev system, although with some bizarre 
> changes like the left stick's up and down being reversed (at least in KDE's 
> game controller settings). The first step would likely be to add the device ID 
> to "hid-ids.h", but from there where should I go in order to perhaps work on 
> full support? I assume anything would work on the things discovered already by 
> the WebUSB enabler tool, however I am very new to C and kernel development in 
> general. 

Simply mailing the mailing list won't get you replies. You should also email
relevant maintainers.

Ccing them

