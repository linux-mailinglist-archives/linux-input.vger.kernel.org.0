Return-Path: <linux-input+bounces-12448-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76349ABC559
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 19:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04F4F3A586C
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 17:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5387FD;
	Mon, 19 May 2025 17:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="tjZX/GEK"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011036.outbound.protection.outlook.com [52.103.68.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817C21E0E14
	for <linux-input@vger.kernel.org>; Mon, 19 May 2025 17:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747674943; cv=fail; b=S5WnIfjS86htGKji9IBSUrW4kfIV3aNXOGpg281Lq/7/a68BSo6Ju3ZKCxBL+u03cPHOkBzid4KIaMd55zTQIEuEPzEmampQFR6e+6tuShXucT4dMpj8YayyUcz7dWYOY+QZ2VhzCC/UxrL4NGwMOrpLftf355kvKy4Mr0wOO+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747674943; c=relaxed/simple;
	bh=oT9BReHdBmHO0dBU6wOg3PBM5GV6zeftzfcBoCYFhd4=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ltjn8ngGlSu9bfgiRDNwGHeJoxIfAzdz4uYeE2LWHP8OjvwL2vLx9ttYoKI/RW+qY72hVNlVmpTrk7RURmMx9DS/IKES1cATC/UB9r2ySeTOZ7GYJ6nfAYwUhFcAisGBmCL7QJTU2nBw7uuRGROd6WrCy3ZxKG2ZPWdXaTL0Eyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=tjZX/GEK; arc=fail smtp.client-ip=52.103.68.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hE7bB8Hwh/QVjo2Nd865T+hoW/QFFLTut4EoaRVGJ2C3W/mFrSBhh7sfAtBoU6ZQJC3lCAnrqKq5e5V01ZT5P7aAdiLjQKZWD8LmQoIgXL8oAXnvlYlqD2E4nt72CPmStfOMUCd9TAmOHKx6+dZyeBTk42faMCiTc2lXQG+aXLtyz7j/xZ4QkOx4hAPNCtiuLimwCqcPXZ7KR+1SthGQAsOQuQJ7ipj920jBKjIY2hBK9/V6Z6IvJ1o98feurv4IZyQ0V27PP1M2SQPfpQwPGkZI+wYCSWwcgI5auiE2NV8Gg9tLe+/p+FGzTEYnMdjTh9lvxy2ZPPcCLnpgTD7IBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfURCcX0qMTSl8MWjOlT6w5ydp7qzwY/oseU68A3ABI=;
 b=BxI0VZluuF6LyrQh2QzBy0+F9BCahc2JOctWy3cRvqEKjLMxOQgGxH+Ki8L1flv4EGHRYnD6vZmIbdMRBL0beZ64l0b6CLqOPaC5N7MJAwbZaPGmDgfbMO/hl2YI4hjVyuWcP1DdOo2u3XDnIb8TU/oKlFGB/xqJnV02hXo20/zTPPXWbr1s1h8aZP2zVOc9Ce6Ppw53AAjbGr7mHgfyG5T2f2Z06jZiRU4DvLAK2ejqtc+86kR6fEeJ74q9DipZmUq8gp+Cf6t1yM2zvbIUjBHDuZvNpWEbRyOK8xgx6TRtyov5FdZ1pgq3gAAKv9YI6YP7G42d3jbLBOLbkjKZdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfURCcX0qMTSl8MWjOlT6w5ydp7qzwY/oseU68A3ABI=;
 b=tjZX/GEKjPSaTdCEmJVjpYbEhfRaxwfj2ZpLcgly44fN+41lqIMSZYMARhSxJSXX1CsIcbK2qPADTRN0f2GuFO+hSkdcJ0vAY/CuW+6SCD58co8tuo9pEI+plJZ2iergOp0UzRzB9M0ZI1qq56SFtJrwJdMglOIS9rfn0XppMVMzfRtcwFqJh7kvCHhYm2/OBBQkJ5XurPY/cKS5una0AyUsfTNR5/JxA4XNXo0B3RjPsc1yfhRx6jprMNiIUlPpZdt1hidLIndpZeYsd3Ynz+nDxQ8F5npo6GfEbc2PYNDPP0RGTiE+TKjxtaYpzn0H+9H5hNlM70WyDU7091rKxg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PPF771D36FE7.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::496) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 17:15:31 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 17:15:31 +0000
Message-ID:
 <PN3PR01MB9597F80FFCE6A1037092AC04B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 19 May 2025 22:45:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: HID apple error with A1243 keyboard
To: Ioannis Barkas <jnyb.de@gmail.com>, linux-input@vger.kernel.org
References: <CADUzMVbe=9YgXfMtSDL-XAKhYnjuo-L6_s4pGiN1g1ibU-_G9A@mail.gmail.com>
Content-Language: en-US
Cc: Jiri Kosina <jikos@kernel.org>
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <CADUzMVbe=9YgXfMtSDL-XAKhYnjuo-L6_s4pGiN1g1ibU-_G9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <1652bf59-3a14-4d66-a882-124a138ec03f@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN3PPF771D36FE7:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c7709c-ba19-4623-84e9-08dd96f8c21a
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHzgPFTkOkKHOaNyTn4nQw6B1ujhWg3hyxBqfMAtWdltdt5VqkteD9d3iSLN2rq7k4WAxbbtksBkNKUuc46WvA1D62eUQIziQa9sEaOSMakoOQAi3fDYUkH8HGshF6IDZT5F4Bg9nh/l8ih4E+LiPXvuZ5FA1KoaMGLiy0anBAk68KmUZaeVipSPnnflTAluZv53cYvwe4KQc9xTiQA7Aefe9DI9BLf49y8Hy+InRzzrnOqZQlI+pcIE1r12R3l8Zzog4uDbRehPo3jHSEGYVP6Lm513QX5vSEiioyyL+VyBCnJ5bLGsGwBQD69u8aPpvt/Pc30gos1aUncR4D63dLM609HRiKwv5O5xVp4scY9SVyghQZFBfuw0OmEbCF3lfz9NtTtzsR/KTDdvxF5x45nXjJSmc6N2MzFyOvxFP3ToLEP897FUc+496YG4IoJ6kR98JICUN9dt1u8BbDYYL1Ys/jLS3UEai5lx4FqHlQ5OaQ1Y+DPthn7mrBHdA3jrKdkM7W+wZEDiKn9b1sWsX6TqyYslheJ+yaDF/5UkDV1oNa9SaFAd9YwlZdhKSIaCYsLnvaR9QDVdD+z8lYNC1ltBoQr4h1dUJV9SOzONko/5HXoIe7Ikp45i+XegG72V3mnUfcV5HCsQ/IxDM+uUnRPRg3R8zk/5+LZERrp3zS1exdqIG67esOE4T7m7NyIGdFxjGQ2BP3y+pjsSXCqByf0aXoG3urY2YU=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799006|6090799003|15080799009|7092599006|8060799009|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjR3czF2UjUvUXRPVGtJbHhDb1ZEWk15L1pYalBPak1YSWRCSjRnQVV4eVlE?=
 =?utf-8?B?anhXL3RuOXBuVXV2MGZSRERTRFdZYTB1NjVOL1NYVWx3c1lpU3NYOGRPM0ZN?=
 =?utf-8?B?MlY2OFJBbWdzR2RscSt2ZE1jTjhrUUlpVk1HMmxqRGx3aGNCa3BNSjBxN1li?=
 =?utf-8?B?SEpxLzczVS9pUEE5L2l5eGptV05JMDBtNzhZRWNqb21yWVlaa0J2UDZnSkhZ?=
 =?utf-8?B?L0IrdnBIUllIL2UwWXdjTjV0YjNRZGhhU0hhcEZiamhJRHhMRkFmbTdRZ2M3?=
 =?utf-8?B?eDBqT09RaXZDWHFEVUJISXJBaldZTU02OXcxWS9HNmtqUkdLWWI3WFgzeVhm?=
 =?utf-8?B?NnZsbEdhcS9wOEpUdHhmaGVGeGJpamlDcGxlS3pVYlN6SEttOWpDMERXMWJu?=
 =?utf-8?B?ZzRQU1ZnVzBGdi9XQkt6WFlKclBjQWV1UUpacXlIQnlDVjNiUW5pOGdacHM5?=
 =?utf-8?B?ZGhDWFcrdGtscVEvTzROWi85N3hBanYzeHQ3OUpoMXhOV3ZwRkJ1dHk0bEw1?=
 =?utf-8?B?S2xkWkF3RW40eHRJZ0NoZ3lDTnpzVjRpanpTMlQ4ZkRZZlQrQWlQa3Bsb3Vp?=
 =?utf-8?B?YTFYYU9RSUtpcGhrWFNIMXZBQjNmNkFjRGxtNGw2KzR0REROaDdqd2kxN0hy?=
 =?utf-8?B?cmFVSENjQjA4SjJQekVPSVhuZklOYVFjWWFEVFJJQUlKT1o4TmY4UjdnNTMr?=
 =?utf-8?B?aC84TmhvSmNodEc2UTI3SWZBVkpHeFVMbDRGYWZ1RzVFK2Mrai9yaTFXazlK?=
 =?utf-8?B?K1JTeDc0NnN6SVFEdDdabGF0Q0pOWnJwN1N1ZkJkL1Y5T1B0d3dmSW9aaVhX?=
 =?utf-8?B?ekYzUE9ZbG1zYnVwTnhsbytyYVpOd0NxWXZPVWtYSWpIRjhDcVRBcnRaQ1NC?=
 =?utf-8?B?WTV5bm9zTzRNRHdvTjVLYU9WR0N4bms2K241NEh0WFcxcUM0b1RQUjhqb1lh?=
 =?utf-8?B?WUdycWJNMno0VXRjenp6eXIveEhUZDNqSEtKSHhKc3I1NFRjRUw0WEIrU2Zl?=
 =?utf-8?B?ZWtOb2dqUjd5V1lxVW9Db1ZnWjRDUzgyVEtnRHRpditjOHJvNGZDMXU2SWY2?=
 =?utf-8?B?R2JCSzN0SVg0NGU5cjJacEpTc1YyTmpwZE51bnFzS1FQcUQrVHY2alN3WjBz?=
 =?utf-8?B?Ym9zZVRDUFRoTXJybHJMYW5GbmRBMWNlQ25XbW1CTkVWNDJSd2RtdWErZTZC?=
 =?utf-8?B?SVlWbVZKQS9LL2M4aFNzTW92Sk5wSklxMTBIckxrNXlwWGJ3dFk5UHlJdjln?=
 =?utf-8?B?bC9pSFVjck9kY0RzRm5CZG10VU1rUkJYR09BTCt3cWhoYytWUmNFYkticEow?=
 =?utf-8?B?b1I2OFZHU2pGUDNPWnR1NU83K2FWdlJBYzVESS9LdHplc25yL1k2YUg2eFBM?=
 =?utf-8?B?aXJaYk41Yjl1SVFVaXF5RFR0MlhZZS90Zy9FVE1WVjZGYW5HbWpmeDFleWx6?=
 =?utf-8?B?TVNiWkZxSWxKT3dvZGZ4UytDVDlDM0F1QUs3czJDVDBkdm53N0JtUEU1c0dG?=
 =?utf-8?B?OVdGaE1GM3gvRC9mazdRWGZFU0d3NDcvQXhGdEVSaDZ0TWZ1bUhhUHFwalZ3?=
 =?utf-8?B?MWZJUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEZzODlWWHh1cmFPczg5MHpaK0N0UzNyaFI5ek0zSnZqNzVIMjN0alV1d1ow?=
 =?utf-8?B?MkFYMnlDQ2xndkNvZUg3OU5CYnQvd09HOVhkTmZzZm9raXpmSVBDTk1vNDlZ?=
 =?utf-8?B?MUd5dktlRXRiZmUwa0lseUpKMW5DbHdHUW80clRVeGpEUmpQbkFWa0NoR2o2?=
 =?utf-8?B?bS84eEhiMVBjYW9VdnN2Vi9NVzl0QTlBU0dCeXBQd0VEajVyV3lHUzEveXhI?=
 =?utf-8?B?dWEvZWd1REIwU1Y4R2VJVzQvMmVLQ0NVa1lORHdneGFNNk1KWnR0U01BZDhM?=
 =?utf-8?B?elppT2taMEl4R1NlK00wakI4M3NWMmo4ZEh0aklSTzlYOXFyV1h1RzNJK2Ru?=
 =?utf-8?B?R2JOdFFKRGl0RTB3NTIzeEMra1dSVnB1cm93a205VDZzVERLUUpRcGQ2SUF6?=
 =?utf-8?B?ekljSmFRZmNIR2gxZ0xScDg4akRwNnVnbnFNZXJjdktPeERTODFReVRnZ0k3?=
 =?utf-8?B?Z05mZjRqZklaMkRrbXo4cnIwcTJLeVMzSlF5UnpsK3E0MzczZEM5TjBSeUFH?=
 =?utf-8?B?cEcwYkJWbVNuQ0w5S1dlSTRPWmYrNWpDVkcyWEc5cjRlMGF0YUhLYk1iTjRz?=
 =?utf-8?B?eTcvNm5xMmxPcUx1d0FVY2E0ZFRteGJoaDVEcWdiRHA4b2habnMzNEdaWjRO?=
 =?utf-8?B?ak41MlFEMGF6NCszVWV2VmJiall4a01WUGYwVUpHTEw2SzRzc0RiYVpvK1Rl?=
 =?utf-8?B?TUkwUnp3MlBiREJ1TjEwQnBCSC9qY1YwVU1idTVSbTVKaWpOdTgzRDlCZlFK?=
 =?utf-8?B?M3psZ0lSU3FlZHhEQ0gzZTZsZFNLalM2QlJiWVlkRDQ1QXQwalE2QWNZRm5v?=
 =?utf-8?B?ZTBPcWNPd3cwdmZUeFRzR3cwYW1ZSERjc2J4bXR2bzlPREp6ZGJNK28wMFdC?=
 =?utf-8?B?TE1jd2NjNEt6UXRVa282a1pLd28xa1YycGh1SitGYlNwaUFHZVRHWDZ3SWNw?=
 =?utf-8?B?NVcxRHNLRi83NTZDNVBKKzZJV2NDSVRvZGNsclo4NVFyZ3ZaV3VvVjhYYndE?=
 =?utf-8?B?UXlCZUhpNWRjSENDRTZSZFdOWDBGaG91ODhTSERxaVBSMmRTRFRxR3BSQTdy?=
 =?utf-8?B?bEY0S1BpY2U1TmZzRExmNmZYVWxIbUJrdEhsYjUwUDdZeDQ2bVlGS0hYT3M2?=
 =?utf-8?B?Yi9zWU0xL1hLZzZOV1phTkoycXUzM3RWZ1B3T0hTQ2k1d2hRSnlKMEhDMnVy?=
 =?utf-8?B?MVBWUGdaV2p1amdGUG4rQ0I0cDk3TStmSVBBL0V5N1RWMWR6TUFDNzBGUXJN?=
 =?utf-8?B?RlJ0STlsbU43K0ZWY0daTm5pMm5EL3lDWU9mV29BMEhYaDc1Y1RpYlVMd294?=
 =?utf-8?B?aVMza3VSKzA1dVFHcnZ3c1lDOFRqZVhWYW1QQXVtbCsxanF2TEhGdkpZYzlO?=
 =?utf-8?B?cTdwaitxUXo4eFhRajk4YjJkUEx2Mk9JUnlJZ3EwbHpuUlpIWElNdE52ZHB6?=
 =?utf-8?B?T1hnZVVhMU9tcHlsOGZsRjlvdUd2M1hVbno3dDhMYkhuZHBTNWg4bVh5TGtJ?=
 =?utf-8?B?VzQwRWowRitwaVYwNlNHVVZGK2N3ZkoxTjY1TGFRTUFubEc5QlpMM0c5VVNV?=
 =?utf-8?B?QmxXZXZ0R0ZzUksrdEYwZHllK1RwcnVEZVBjaDM5TkRVa0hua2VvS1N6M01z?=
 =?utf-8?B?QmFUbWE2Y0ZiekNBdUFEOVI2M1BNQXRxNE56TEZEeVNEZm1ZTHZVazBWeC9B?=
 =?utf-8?B?SExIZ2xtTXkwZWFWNFBqM050b0JqdUpUOWU4cjFrQm9yL0NnOURUUSs4NnJD?=
 =?utf-8?Q?/S/Aze2fepc96kmAGk=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c7709c-ba19-4623-84e9-08dd96f8c21a
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 17:15:31.1446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPF771D36FE7

Hi Ioannis

> Hello guys,
> 
> I am getting a wrong print with the A1243 wired keyboard:
> [  339.368030] usb 1-3.3.1.2: new low-speed USB device number 8 using xhci_hcd
> [  339.460199] usb 1-3.3.1.2: New USB device found, idVendor=05ac,
> idProduct=0250, bcdDevice= 0.74
> [  339.460217] usb 1-3.3.1.2: New USB device strings: Mfr=1,
> Product=2, SerialNumber=0
> [  339.460218] usb 1-3.3.1.2: Product: Apple Keyboard
> [  339.460219] usb 1-3.3.1.2: Manufacturer: Apple Inc.
> [  339.469425] input: Apple Inc. Apple Keyboard as
> /devices/pci0000:00/0000:00:14.0/usb1/1-3/1-3.3/1-3.3.1/1-3.3.1.2/1-3.3.1.2:1.0/0003:05AC:0250.000F/input/input18
> [  339.556178] apple 0003:05AC:0250.000F: input,hidraw12: USB HID
> v1.11 Keyboard [Apple Inc. Apple Keyboard] on
> usb-0000:00:14.0-3.3.1.2/input0
> [  339.558624] apple 0003:05AC:0250.0010: Fn key not found (Apple
> Wireless Keyboard clone?), disabling Fn key handling
> 
> I get this with kernel 6.14. Fn key is present for sure and it is
> definitely not disabled since it works fine! Same applies to the
> onboard Fn key of the laptop.
> 
> Looks like the detection logic needs some adjustment.

Was the issue present with older kernels as well? And, is fn toggle working
as intended, i.e., is the log a false positive?

