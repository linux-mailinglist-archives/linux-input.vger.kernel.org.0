Return-Path: <linux-input+bounces-10265-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF6AA414E1
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 06:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 382A016EB07
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 05:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E7C26AFB;
	Mon, 24 Feb 2025 05:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="bj7z2UrK"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010003.outbound.protection.outlook.com [52.103.67.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2CA1DFEF
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 05:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740376025; cv=fail; b=g5y1B5YpI0Ha2uRMtC7btJYOWXNqNW5YxmxRAfcb3jDpr1h14Vo7RiDhmhGmcQ0qioV6R548EhiR1nfCEXo56Z7zUq1pOLjn7Lpnk8trhH3Mg7O1oZyxwQyobr4Cf3TssI1Guzljs8FYYrm5daiodRTAvlgb6r35ePiUtpBRTs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740376025; c=relaxed/simple;
	bh=Q3msWw3nahDsRJagXesf43el64A7Pat2qcabluPC9Vw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OgzXbqigoU5VppWZZSj36wilXyDS+b1SL3Nk2biW0jfLiDlMH3bEcODKuFBefGzY1P/lYsrfVvWXreqk6sHF5jhK6aJoHNSBjXXzQnHlLnNYljHuIMuw2GgMztu0v8ZktXkOmU4LmOiO8y1yomrrZk7ItCuZWUvbRBj1liRSkic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=bj7z2UrK; arc=fail smtp.client-ip=52.103.67.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAeZIZ/0eJCTiHCC9HM+NLC2Gn34ZLw7I3tUNTZnqKyPbLd23ajOLr2tIO8Skd5zNS8JKCk35BvBGXOYQin7dHF2CRNeilsJ/uJp0p7LmOTN2DeNhbcJXzCI34sqlThkJRRURr/3yaiD8N5B86PBInxrQo2h7O0JhBvEhCllHgsVgDZYetLi7l5BO4p3cpK3Q2Ci+xvIXRJPiYuO7skafTxAB/TItalNYvcalYiHzPqA/5Aa3jc9H6g1/C6nCBIPSgfWQGql3PU512B/htk9VFto3VlDtMioWzKfpo4tklcHpnxafXLS7B+jHNFFPKikRVWT/sDOTRl0g6MjXsSSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3msWw3nahDsRJagXesf43el64A7Pat2qcabluPC9Vw=;
 b=o+JtDFGu8RiAtHLF+7q6ef0oXV1FeAkqXRaf9o6UTqyIfgEhHcd6FNxuA0tBbkSScjx/jnfD328nixu3ytEzcjw6D8HM+cLRftB5vmdlOOdWyn268+Hm140+4VfroTjxmi8J9DK9qgg3y4elYUIdiO/SwTmx3Mnu3qunaje3dUfDSM7zDU6gijmJnk670b4DhV9afTqc9QtA3d3hU59q+SQStLTt8rh0vauM2nxUoF/YuxG5gKVH1LcCJAtbaPZHJsn9ch8kNY8OQ+6tbuctYyh/J47oW3HA2vlq1pzBvOaOOrPm9+ZZGx5PO4Gf7XgOO9L6Rz0qYOHcp6x78YbKFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3msWw3nahDsRJagXesf43el64A7Pat2qcabluPC9Vw=;
 b=bj7z2UrK8eM0g67U2T4RbpFwpEHVqOQUmL4ewIJdrZgpr+7C+VqbOnDAWfd/nJRmINwGkHhR/U/2qLLbnSV1Ys5YcpbdC1bNi+Yc8F3HMwXhPJNecETLc2G6w2bhS/8/AGavO9pVh2cB+gmlSTXqgqgo6Hj3qrNQyevIlwEy74WDSHECRw+/+aUkq/zwthkJrtpuenVNzrTSyjwG4XsQGUjfhA4YdXcUmApu25PUZg0OaDs81E5uWc7FnR4j9qe3qhPDTtGe4I5iVKuaOknXhxGYkpzCAoXP8WfmrlVoKAz7QW3BX3Ncy1Vd2LdwiRq+LdRrnbfrgnzQMAoQuIPXMQ==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN0PR01MB10185.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 05:46:58 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 05:46:58 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Alex Henrie <alexhenrie24@gmail.com>
CC: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
Thread-Topic: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
Thread-Index:
 AQHbfXSaek/9eKHa2UOEiOnSSu3oB7ND8GeAgAUzRwCAAFNAAIAACtOAgAFn6wCAABI2gIAAF0+AgAA32oCACoflAIAAH6YAgAAF7jWAAAOdgIAAA3fogAACs4CAAAHHgA==
Date: Mon, 24 Feb 2025 05:46:58 +0000
Message-ID: <B5111ED6-6D0F-4DB5-8258-5297887EEC32@live.com>
References: <20241001055146.543800-1-alexhenrie24@gmail.com>
 <20250117061254.196702-1-alexhenrie24@gmail.com>
 <3137A636-3FC2-4016-BC64-F5CEF308F834@live.com>
 <55B3D2BA-F363-4335-820F-21DB90312CD2@live.com>
 <CAMMLpeTgY0pnAr9Q=_Dc4iUWkmZc3ixGU656CK+KU8qY2sLBsg@mail.gmail.com>
 <F209BEE2-29F0-4A0B-8B94-2D5BFA00AC90@live.com>
 <67482FB6-C303-4578-8B3D-6F4A4039D379@live.com>
 <CAMMLpeQDVinMKsRi-u5afKSYzoG=FGgYPsHwibHgheZwHaJSQg@mail.gmail.com>
 <99960098-E28B-4C83-BC52-BF5DEC1A16AB@live.com>
 <CAMMLpeSaND7MTYYF=uccM_HBYysHX_GuuTp3YSWzV_kx_9D6hA@mail.gmail.com>
 <A58096D0-D8FC-42F6-BCAE-8D099E81E3AA@live.com>
 <CAMMLpeRg8RhncwwK7yyJsT=8Q7221euMA7=-mySN3YLFpWPQjQ@mail.gmail.com>
 <CAMMLpeReEKgizVQ6Z9=Go2y9djoTBPofbB8vJbPDbjvunuLDLw@mail.gmail.com>
 <PNZPR01MB4478510C11E2D619C793D23BB8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
 <CAMMLpeQwAiD1_7Wc+25Gt4UHKwn6vfup+xdvekpEfr2G=-vW3g@mail.gmail.com>
 <PNZPR01MB4478184BF3EBAE540C876EA9B8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
 <CAMMLpeQ_pT5310atonw2-bs8Zn9a+Uwe_Pb16WQ3dV8SG6vZbw@mail.gmail.com>
In-Reply-To:
 <CAMMLpeQ_pT5310atonw2-bs8Zn9a+Uwe_Pb16WQ3dV8SG6vZbw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN0PR01MB10185:EE_
x-ms-office365-filtering-correlation-id: 6e1a17fc-1d8e-47ee-c200-08dd5496a72e
x-microsoft-antispam:
 BCL:0;ARA:14566002|6072599003|15080799006|461199028|8060799006|7092599003|8062599003|19110799003|440099028|3412199025|102099032|12091999003|41001999003;
x-microsoft-antispam-message-info:
 =?utf-8?B?QWozYXF2Vk5ycEFxRnZLdWZLK2hISUVQakNoWUNOU001RlBlSjFydVhrcDhk?=
 =?utf-8?B?cENYSHRWMndCNEtzNWphcGtBVVpuK0FBQWgwMlQ0UjZxaXJWcHRCRXcycUht?=
 =?utf-8?B?TlNyUWJvRlovTW43aVROd2dHMWlmUVBoaDZGMjVJSE81RjQyc0lWUU5pN3Rx?=
 =?utf-8?B?V2gzWGhuRHloekVjc05nVFdsTEhzcWFpeFk4K25WVVVEc3IrNFJHZ1ppakJD?=
 =?utf-8?B?OC9oejlOUUMxNW4rMmNCNE5IOE5FTS9FbkpYbWdDSHpITDlUS3RZOFhnU2VR?=
 =?utf-8?B?L2xmdldrM2k1TXB5QlIwTUJ4aXYwbG9xemp3c01aMTB2RyswdzNJMytFTlFU?=
 =?utf-8?B?b3BJTXZvYjRpOXNUV1c1QzRkZmpLTDc1aW5qUVBOL0FBaG95NkV6RkdZb3Ev?=
 =?utf-8?B?ZWQwaWdXODA1cG1ZOG01YWQ3VXdwckhnS0lzUGhsYm5tUlJqK25KOGpuVjRO?=
 =?utf-8?B?bDY0bU1ibHlXRW9BcU9yYmJGMmc1VDJjMGdTUGpUbkt3ZTI2K1ZaejRnbkJT?=
 =?utf-8?B?QkpTaHNVRXF6TVA0aU9OVlUybUlVSlNvc1F6eVorL1BnQVd3ODJKeDBzbWJD?=
 =?utf-8?B?alNkQnU0MXZjSmNIcFF5dGh5N0dJWGVoRzhwR2FCd1VTMlJESHpXVCswaGxL?=
 =?utf-8?B?dDNhTUg3V3VyWlhhSHgrMHNWV1VLTjZGQndjU21oYytDa1NIN2J1dWw0cmZi?=
 =?utf-8?B?dDJLWG1qT28wREJsNVNrY3crSndLL21NOXJXMEFhM09MczlMeC9TVW1yQW5U?=
 =?utf-8?B?KzFyVkhITXlzRmN0NXp0VkNzeHI5V2I0QlBqNVBaWTU5VDd2Z1FGaXFFajBW?=
 =?utf-8?B?d0h4cWh2dFNDaE8yUmZOeWVJQ3FYUENzbHZKMHlBMStOODU4bVhGMUJjdXFn?=
 =?utf-8?B?Y3QrZWlremZzVTlodlZxUjJ5SzB5anhFdTk3K2J2WW9jRVcrZyttbXpCMGtZ?=
 =?utf-8?B?Sjl6R1Y0djR4Zzc5T2NLS2pmQXVMSVl4d0ZNemdCV1ZnVUpaVzRncjQvQ2N2?=
 =?utf-8?B?Q0NnYkt5K2tYUEIxM3NhNGpOV3ZuZG4zN0dOU1hWeDJhaExuTG10VTR3QzFG?=
 =?utf-8?B?aTB6MjllU1BaZGMzc0srVTlrQlVia1FOR0IvYnNPaklQZ1ZPcE1aaWE3MjJx?=
 =?utf-8?B?ZFBWRXNnNEVNOXJQVVovVDJyZ3lpV3BIWlJsREcvbDNyejZKdTk4TFJYT0pM?=
 =?utf-8?B?RFlxOVJTdEpGYW91WE9MNjZ5dHRPSy96S3dXL3hZNFJIZEZYQnI5OGkraU5E?=
 =?utf-8?B?aHE1N2V5YUZZWTAzU1Q1VlF1d3JaOXZTVTUxT0NDc0p4c3hMWTFxZS9LQkNm?=
 =?utf-8?B?aWtpd2N6cG0xTnZoRURuZnRoRzRvMjZuOGxOc2ZuQmxOVEQ5RmhJMlZzam93?=
 =?utf-8?B?TklFU3FhNjIxRE5Ock5zYmRqcThYVWVSbkM1OTVGNERFMnBXdlpVSXlmU3ZZ?=
 =?utf-8?B?aGs5U2JRQW1LMWZJbVhUQ2RpOFJ6ZnAxb0tEQlc2TThyN0pMU0dUR2w3T2Y5?=
 =?utf-8?B?WThvR0IrdXU2bTFRUUNGTGl4VSs2K0d4ZkY2anpmNHVtenRZcXNDVEh5VmJh?=
 =?utf-8?Q?YvzTCwJ59X5J4VpNjIoqWolpo=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K05DalEzRkE2RE1iR0xTeVEvME1wQjFPaE80RUZ4RlQ0Z0dOOXN1M2VsNE9s?=
 =?utf-8?B?ZG90cHQvMmFwaEYyUUFrMEVyeHN6YzVzbXByRmhtSThtSkNFUEdXRkRNMDhZ?=
 =?utf-8?B?T1RTbTUwZFFwaUl4TjZHOUlaNTNVa1hERHAxMjNTZlZNdUEyQmx1ZUtINmpo?=
 =?utf-8?B?S1d6bHRMdksxckVBYS8xNk9Xa1d6T2NscXNwVnloU2dqbjQxZ1lhazlDRi9N?=
 =?utf-8?B?K0dGN05QQVJsUkZOelkvVExaYTUvSjJZbWJSNUhUaEF3WHZWNzdTQkhyeFJL?=
 =?utf-8?B?NUxZak5Yb0REM3VZTDZjaGE2b3lJb0lPYXhIeEJPdXptb01wMGJTUG54Zkh1?=
 =?utf-8?B?UE05WnVic2hLRld0MDF3RVNEUXFOemJTb2wrNWhlekFBUlRnUmZCZVB6Z1Zr?=
 =?utf-8?B?YjBjeXdZZ1FWalljRkRubmhvb2FNQmx0VFdnYTVsRXlGQlh6UVl6eGZGT001?=
 =?utf-8?B?RzRSbWhSM2JqL0xlMUlmVUx4WmY0cVN6L2RlWVJzRm1kOU04Y1ZXQTlGbTh1?=
 =?utf-8?B?dmpUZlpxdTBRNVZOM1F1ZFMxZHZJYXBzelFsdFZLL2FoeEh6SHpUdEg1Z0o3?=
 =?utf-8?B?MS92dzFvTWRTWkNTSXNSbENjTENYdDlzWi9DdmVHOTlGd3dKSWU4cG11K24x?=
 =?utf-8?B?VXZBTVBiWXkwa2VzVXdFb2xsOFpZNWh6dm1WVU15bHUvN3duei9yb3BMRlFL?=
 =?utf-8?B?bGVpRGNsM3JUaFYwS3J6b09UVytwQU1TK2F2dzY3U2IwYmRmN1o3WGpVT0lY?=
 =?utf-8?B?ZUJjY1dxdi9PVXRaK0NxUEFLTXdZcVRsK3lnUnQ3c1c2UUtINFV5QlF6WWdB?=
 =?utf-8?B?U1ZXQ3A3U1hrZlN0NVFOcTVCZ0g1UnBNTDc4Q3JyRmtEMnlsRGZqbVhJR1FQ?=
 =?utf-8?B?eWtDWnlSZWk5aFRrdnNTK1hybm1lWFEwOVcxZmdFNFBIRUJUMnpuK2w1NGtL?=
 =?utf-8?B?ZHZzWmlTZWcwVFFPUVBOVW5TVkN0aXZGZUZITXpwOVBvZjFQMmFCaG9WaFdK?=
 =?utf-8?B?eFVHNEZ5bTl0b1FxRlZPbG9qeVY2ZUJFMit1b2JyclRjNFhIekFIcWxpWGo5?=
 =?utf-8?B?Tk5memc2cmpOT2tybzhIZUg2Uk53eFFRZHNINWFyWFNNTDhlTm43eFRROUQ0?=
 =?utf-8?B?VHZOcVNnSzVWdVdSbWQ4ekNybkNNa1VqZWI3a3R0eTh0bWl1YmZhODIxZUNu?=
 =?utf-8?B?aXZ1VG5qMStGd3B1dUF6TzJzVk0wRnNSRm11Vk02WXVEOGttSm1nbUxSSXRQ?=
 =?utf-8?B?alRta0JWM0U5d2lXV2pXK3lXajZraDBFTEtCekIvZ01mWCsrYTVHWmZWWmxh?=
 =?utf-8?B?QUNzRFdKUjFqd0JlS3pDaWplM3hjaW56RG44U1ZDcTRMUzA1LzJ0QnQrUUM4?=
 =?utf-8?B?V0dHeHZVMUZSaVVZMXVqZGVybStMTXBqOTlmL1NwUW1sQWlibDczMStmUHJV?=
 =?utf-8?B?L29BV0J0TjVxeHVmRXROR3owQTlKbGNmZnhaQTFaT1JOcWRNNDJ0QXlYZHEv?=
 =?utf-8?B?K0padzFUY3FCMVdCL3F3c2YyU3ZONStpMDhzWkdDOHlGSjA2aTN4dzY1WVFY?=
 =?utf-8?B?TXRhcUJVc0VrcWQvbzRJWXF6alY0aFlvc2NOK1BWNkVyNis4Ynpsd2xydlpa?=
 =?utf-8?B?b2hyaXg1YnVpOVlmNEppRHRQSytnZkNPY25WSmNkTHdLSlZOYmZrWmk3K2do?=
 =?utf-8?B?dHordm50UWhGQ3dTOTljZElyMTJ5eE9DVjRzZ1Z6UllESUpSb2pNVVhjYUla?=
 =?utf-8?Q?rpbJu83G7cghjbTzDUluagY25B+WuscQok6hHC4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A670894439EB04488177667670C75ABE@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1a17fc-1d8e-47ee-c200-08dd5496a72e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 05:46:58.2602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB10185

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDExOjEw4oCvQU0sIEFsZXggSGVucmllIDxhbGV4aGVu
cmllMjRAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIFN1biwgRmViIDIzLCAyMDI1IGF0IDEw
OjMw4oCvUE0gQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0K
Pj4+IE9uIDI0IEZlYiAyMDI1LCBhdCAxMDo0OeKAr0FNLCBBbGV4IEhlbnJpZSA8YWxleGhlbnJp
ZTI0QGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4g77u/T24gU3VuLCBGZWIgMjMsIDIwMjUg
YXQgMTA6MDXigK9QTSBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPiB3cm90ZToN
Cj4gDQo+Pj4+IFJlbW92aW5nIEFQUExFX0hBU19GTiBxdWlyayBzZWVtcyB0byBiZSBhIGJldHRl
ciBpZGVhIHRiaA0KPj4+IA0KPj4+IEkgYWdyZWUuIEknbGwgc2VuZCBhIHBhdGNoIHNob3J0bHkg
dGhhdCB3aWxsIGRvIGV4YWN0bHkgdGhhdC4NCj4+IA0KPj4gSSBqdXN0IG1hZGUgYSBwYXRjaC4g
SSdsbCBzZW50IGl0IHNvb24uDQo+IA0KPiBJIHdhcyBnb2luZyB0byBzcGVuZCBhIGxpdHRsZSBt
b3JlIHRpbWUgbG9va2luZyBvdmVyIHRoZSBwYXRjaCBJIHdyb3RlDQo+IGJlZm9yZSBJIHNlbnQg
aXQsIGJ1dCBJIGp1c3Qgc2VudCBpdCB0byBhdm9pZCB3YXN0aW5nIHlvdXIgdGltZSBvbg0KPiBk
dXBsaWNhdGVkIGVmZm9ydC4gVGhlIG1vc3QgZGlmZmljdWx0IHBhcnQgb2YgdGhlIHBhdGNoIHdh
cyB3cml0aW5nIGENCj4gY2xlYXIgZXhwbGFuYXRpb24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0K
DQpDb21taXQgbWVzc2FnZXMgYXJlIGRlZmluaXRlbHkgYSBQSVRBIExPTA0KDQpDb3VsZCB5b3Ug
c2VlIHRoaXMgcGF0Y2ggYnR3LiBJdCBhbHNvIGFkZHJlc3NlcyBzb21lIG1pbm9yIGNvZGUgc3R5
bGUgaXNzdWVzIGluIHRoZSBkcml2ZXIuDQoNCuKAlD444oCUDQoNCkZyb20gMDk0NzJiZTY0Mjhk
ZDc0MDY0YjIxNjVhMmE3OGU2MWUwNDljMjY2NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCkZy
b206IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2ZS5jb20+DQpEYXRlOiBNb24sIDI0IEZl
YiAyMDI1IDExOjEwOjQyICswNTMwDQpTdWJqZWN0OiBbUEFUQ0hdIGZpeA0KDQpTaWduZWQtb2Zm
LWJ5OiBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPg0KLS0tDQogZHJpdmVycy9o
aWQvaGlkLWFwcGxlLmMgfCA2MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1hcHBsZS5jIGIvZHJpdmVycy9oaWQvaGlk
LWFwcGxlLmMNCmluZGV4IDQ5ODEyYTc2Yi4uMThiNzc5NDAzIDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9oaWQvaGlkLWFwcGxlLmMNCisrKyBiL2RyaXZlcnMvaGlkL2hpZC1hcHBsZS5jDQpAQCAtMzAs
NyArMzAsNyBAQA0KICNpbmNsdWRlICJoaWQtaWRzLmgiDQogDQogI2RlZmluZSBBUFBMRV9SREVT
Q19KSVMJCUJJVCgwKQ0KLSNkZWZpbmUgQVBQTEVfSUdOT1JFX01PVVNFCUJJVCgxKQ0KKy8qIEJJ
VCgxKSByZXNlcnZlZCwgd2FzOiBBUFBMRV9JR05PUkVfTU9VU0UgKi8NCiAjZGVmaW5lIEFQUExF
X0hBU19GTgkJQklUKDIpDQogLyogQklUKDMpIHJlc2VydmVkLCB3YXM6IEFQUExFX0hJRERFViAq
Lw0KICNkZWZpbmUgQVBQTEVfSVNPX1RJTERFX1FVSVJLCUJJVCg0KQ0KQEAgLTg0LDExICs4NCwy
OSBAQCBzdHJ1Y3QgYXBwbGVfbm9uX2FwcGxlX2tleWJvYXJkIHsNCiAJY2hhciAqbmFtZTsNCiB9
Ow0KIA0KK3N0cnVjdCBhcHBsZV9ub25fYXBwbGVfa2V5Ym9hcmRfZGlzYWJsZV9mbiB7DQorCWNo
YXIgKm5hbWU7DQorCXUzMiBwcm9kdWN0X2lkOw0KK307DQorDQogc3RydWN0IGFwcGxlX3NjX2Jh
Y2tsaWdodCB7DQogCXN0cnVjdCBsZWRfY2xhc3NkZXYgY2RldjsNCiAJc3RydWN0IGhpZF9kZXZp
Y2UgKmhkZXY7DQogfTsNCiANCitzdHJ1Y3QgYXBwbGVfYmFja2xpZ2h0X2NvbmZpZ19yZXBvcnQg
ew0KKwl1OCByZXBvcnRfaWQ7DQorCXU4IHZlcnNpb247DQorCXUxNiBiYWNrbGlnaHRfb2ZmLCBi
YWNrbGlnaHRfb25fbWluLCBiYWNrbGlnaHRfb25fbWF4Ow0KK307DQorDQorc3RydWN0IGFwcGxl
X2JhY2tsaWdodF9zZXRfcmVwb3J0IHsNCisJdTggcmVwb3J0X2lkOw0KKwl1OCB2ZXJzaW9uOw0K
Kwl1MTYgYmFja2xpZ2h0Ow0KKwl1MTYgcmF0ZTsNCit9Ow0KKw0KIHN0cnVjdCBhcHBsZV9tYWdp
Y19iYWNrbGlnaHQgew0KIAlzdHJ1Y3QgbGVkX2NsYXNzZGV2IGNkZXY7DQogCXN0cnVjdCBoaWRf
cmVwb3J0ICpicmlnaHRuZXNzOw0KQEAgLTE1MiwyMCArMTcwLDYgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBhcHBsZV9rZXlfdHJhbnNsYXRpb24gbWFnaWNfa2V5Ym9hcmRfMjAxNV9mbl9rZXlzW10g
PSB7DQogCXsgfQ0KIH07DQogDQotc3RydWN0IGFwcGxlX2JhY2tsaWdodF9jb25maWdfcmVwb3J0
IHsNCi0JdTggcmVwb3J0X2lkOw0KLQl1OCB2ZXJzaW9uOw0KLQl1MTYgYmFja2xpZ2h0X29mZiwg
YmFja2xpZ2h0X29uX21pbiwgYmFja2xpZ2h0X29uX21heDsNCi19Ow0KLQ0KLXN0cnVjdCBhcHBs
ZV9iYWNrbGlnaHRfc2V0X3JlcG9ydCB7DQotCXU4IHJlcG9ydF9pZDsNCi0JdTggdmVyc2lvbjsN
Ci0JdTE2IGJhY2tsaWdodDsNCi0JdTE2IHJhdGU7DQotfTsNCi0NCi0NCiBzdGF0aWMgY29uc3Qg
c3RydWN0IGFwcGxlX2tleV90cmFuc2xhdGlvbiBhcHBsZTIwMjFfZm5fa2V5c1tdID0gew0KIAl7
IEtFWV9CQUNLU1BBQ0UsIEtFWV9ERUxFVEUgfSwNCiAJeyBLRVlfRU5URVIsCUtFWV9JTlNFUlQg
fSwNCkBAIC0zNTIsNiArMzU2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhcHBsZV9rZXlfdHJh
bnNsYXRpb24gc3dhcHBlZF9mbl9sZWZ0Y3RybF9rZXlzW10gPSB7DQogCXsgfQ0KIH07DQogDQor
LyogV2Ugd2FudCB0aGUgZGVmYXVsdCBmbm1vZGUgYmUgMiBpbiB0aGVzZSBrZXlib2FyZHMgKi8N
CiBzdGF0aWMgY29uc3Qgc3RydWN0IGFwcGxlX25vbl9hcHBsZV9rZXlib2FyZCBub25fYXBwbGVf
a2V5Ym9hcmRzW10gPSB7DQogCXsgIlNPTmlYIFVTQiBERVZJQ0UiIH0sDQogCXsgIktleWNocm9u
IiB9LA0KQEAgLTM2NCw2ICszNjksMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhcHBsZV9ub25f
YXBwbGVfa2V5Ym9hcmQgbm9uX2FwcGxlX2tleWJvYXJkc1tdID0gew0KIAl7ICJXS0I2MDMiIH0s
DQogfTsNCiANCisvKiBTb21lIG5vbiBBcHBsZSBrZXlib2FyZHMgcmVwb3J0IHRoZXkgaGF2ZSBm
biwgYnV0IGRvIGludGVybmFsIHRyYW5zbGF0aW9uIG9mIHRoZWlyIGtleXMgKi8NCitzdGF0aWMg
Y29uc3Qgc3RydWN0IGFwcGxlX25vbl9hcHBsZV9rZXlib2FyZF9kaXNhYmxlX2ZuIG5vbl9hcHBs
ZV9rZXlib2FyZHNfZGlzYWJsZV9mbltdID0gew0KKwl7ICJCbHVldG9vdGggS2V5Ym9hcmQiLAlV
U0JfREVWSUNFX0lEX0FQUExFX0FMVV9XSVJFTEVTU19BTlNJfSwNCit9Ow0KKw0KIHN0YXRpYyBi
b29sIGFwcGxlX2lzX25vbl9hcHBsZV9rZXlib2FyZChzdHJ1Y3QgaGlkX2RldmljZSAqaGRldikN
CiB7DQogCWludCBpOw0KQEAgLTM3OCw2ICszODgsMjIgQEAgc3RhdGljIGJvb2wgYXBwbGVfaXNf
bm9uX2FwcGxlX2tleWJvYXJkKHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2KQ0KIAlyZXR1cm4gZmFs
c2U7DQogfQ0KIA0KK3N0YXRpYyBib29sIGFwcGxlX2Rpc2FibGVfZm4oc3RydWN0IGhpZF9kZXZp
Y2UgKmhkZXYpDQorew0KKwlpbnQgaTsNCisNCisJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUo
bm9uX2FwcGxlX2tleWJvYXJkc19kaXNhYmxlX2ZuKTsgaSsrKSB7DQorCQljaGFyICpub25fYXBw
bGUgPSBub25fYXBwbGVfa2V5Ym9hcmRzX2Rpc2FibGVfZm5baV0ubmFtZTsNCisJCXUzMiBwaWQg
PSBub25fYXBwbGVfa2V5Ym9hcmRzX2Rpc2FibGVfZm5baV0ucHJvZHVjdF9pZDsNCisNCisJCWlm
IChzdHJuY21wKGhkZXYtPm5hbWUsIG5vbl9hcHBsZSwgc3RybGVuKG5vbl9hcHBsZSkpID09IDAg
JiYNCisJCQloZGV2LT5wcm9kdWN0ID09IHBpZCkNCisJCQlyZXR1cm4gdHJ1ZTsNCisJfQ0KKw0K
KwlyZXR1cm4gZmFsc2U7DQorfQ0KKw0KIHN0YXRpYyBpbmxpbmUgdm9pZCBhcHBsZV9zZXR1cF9r
ZXlfdHJhbnNsYXRpb24oc3RydWN0IGlucHV0X2RldiAqaW5wdXQsDQogCQljb25zdCBzdHJ1Y3Qg
YXBwbGVfa2V5X3RyYW5zbGF0aW9uICp0YWJsZSkNCiB7DQpAQCAtNTQ2LDkgKzU3Miw2IEBAIHN0
YXRpYyBpbnQgaGlkaW5wdXRfYXBwbGVfZXZlbnQoc3RydWN0IGhpZF9kZXZpY2UgKmhpZCwgc3Ry
dWN0IGlucHV0X2RldiAqaW5wdXQsDQogCQl9DQogCX0NCiANCi0JaWYgKHVzYWdlLT5oaWQgPT0g
MHhjMDMwMSkgLyogT21vdG9uIEtCMDY2IHF1aXJrICovDQotCQljb2RlID0gS0VZX0Y2Ow0KLQ0K
IAlpZiAodXNhZ2UtPmNvZGUgIT0gY29kZSkgew0KIAkJaW5wdXRfZXZlbnRfd2l0aF9zY2FuY29k
ZShpbnB1dCwgdXNhZ2UtPnR5cGUsIGNvZGUsIHVzYWdlLT5oaWQsIHZhbHVlKTsNCiANCkBAIC03
MjgsOCArNzUxLDggQEAgc3RhdGljIGludCBhcHBsZV9pbnB1dF9jb25maWd1cmVkKHN0cnVjdCBo
aWRfZGV2aWNlICpoZGV2LA0KIHsNCiAJc3RydWN0IGFwcGxlX3NjICphc2MgPSBoaWRfZ2V0X2Ry
dmRhdGEoaGRldik7DQogDQotCWlmICgoYXNjLT5xdWlya3MgJiBBUFBMRV9IQVNfRk4pICYmICFh
c2MtPmZuX2ZvdW5kKSB7DQotCQloaWRfaW5mbyhoZGV2LCAiRm4ga2V5IG5vdCBmb3VuZCAoQXBw
bGUgV2lyZWxlc3MgS2V5Ym9hcmQgY2xvbmU/KSwgZGlzYWJsaW5nIEZuIGtleSBoYW5kbGluZ1xu
Iik7DQorCWlmICgoKGFzYy0+cXVpcmtzICYgQVBQTEVfSEFTX0ZOKSAmJiAhYXNjLT5mbl9mb3Vu
ZCkgfHwgYXBwbGVfZGlzYWJsZV9mbihoZGV2KSkgew0KKwkJaGlkX2luZm8oaGRldiwgIkZuIGtl
eSBub3QgZm91bmQgb3IgaGFzIGludGVybmFsIGhhbmRsaW5nIChBcHBsZSBXaXJlbGVzcyBLZXli
b2FyZCBjbG9uZT8pLCBkaXNhYmxpbmcgRm4ga2V5IGhhbmRsaW5nXG4iKTsNCiAJCWFzYy0+cXVp
cmtzICY9IH5BUFBMRV9IQVNfRk47DQogCX0NCiANCi0tIA0KMi40My4wDQoNCg0K4oCUPjjigJQN
Cg0KRmVlbCBmcmVlIHRvIHN1Ym1pdCBpdCBmcm9tIG15IGJlaGFsZiBpZiB5b3Ugd2FudC4gSXZl
IHNpZ25lZCBpdC4NCg0K

