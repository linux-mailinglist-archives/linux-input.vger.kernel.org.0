Return-Path: <linux-input+bounces-11697-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F71DA83D90
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 10:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45B021B8439F
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 08:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5364120371C;
	Thu, 10 Apr 2025 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="eHnUQdhZ"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010002.outbound.protection.outlook.com [52.103.68.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616111DF979;
	Thu, 10 Apr 2025 08:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275172; cv=fail; b=WMvY5WYggkps0gaAk6JY55mXPKWocGYNFAEBky/Xiav22tR3IPtwcYB2w7/1whu/M9+xsOByeOvcpk298EfJQ8nSxDBed7GJC7Vtl+jI+uCnMcp9o5ZInoOayS2nIfpSeBxFyYOfY65K0dJaTQk5kVuv0ie9jUHIb2NWxf+V4uU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275172; c=relaxed/simple;
	bh=eV8uVwBq3xvFbCwLoD7mHW4J8VM45Dgvcax5ysyjZ3A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G4cRPddILWVOydPv7uFnpiowqm1PiG9kSqV6EWZarTb60ithlEy6z61PrDfz3anzB5PM/N3G+vm3NE6SYxStP0FnPwA6wibY+BxjRro5SeTWddOAb4TN35izKLnjWNMWoADDf3yC/UfqkaY95hOk3Uf0eZf1ZZlfURShAjMlx9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=eHnUQdhZ; arc=fail smtp.client-ip=52.103.68.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvvdmRsuaLA/IadKX4eGPdnqG7lE7ucCvo7AS52EHZ321xJgUN98/x8vboXVLvz+kd3nIIdeciWAn8n7HYe/qpD+tkQbJCng0FVZQ0oaxfIAhTr2GOH0T529SXXHPLxG2b5mZ5o0rN6LMx7k+GrrioPJ6agYlXfkiL6pe3LX0lQxI/5k4OtJY+s2B9OE68PqiFVhhfSHQs99wAa26XvzBantEmpRq8/BnBQj2QLe+IEJX10UfUtMSmmzqSzKwFobo6/+fIXwkPMjIxiReqnmS+si2REIOtTByDYdXFQzdZHs54VVMdvVIx74kNvSq5mZ8opk2PbiQudLTCpMoONsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV8uVwBq3xvFbCwLoD7mHW4J8VM45Dgvcax5ysyjZ3A=;
 b=cdrsGMyRPIIAz95w2YG6dmFB0nOs5i87eueAmXBHH1l7h0ySBtYTbtQKmweMQHKto98IM3zSrRAq/k6DIwg93vAsssm/Bqc/ANJXk+4n3cbWOjqmn0jFb5QHRT81Z1AdACr8AL4I5CiYhgdzESrM5f+Yzgm0i1GwsIJ3LJv/HdQJdu8mY7Tvuwjl1cL+fdtVLpdV0xe3j9A0p+WPuw2ampJWrNguX72mFvl4XNBZk7ym/o5dL5NyLEcIicdDNeWOC1V/NSZdsugN8qeiYdXCXjiZfyFA5cX72yVExSyupBdWW8pJ0tK+bhyG8UDyK7B1c3Djpol6XpAKERE5DbBgzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eV8uVwBq3xvFbCwLoD7mHW4J8VM45Dgvcax5ysyjZ3A=;
 b=eHnUQdhZJqHQJzrrD8l5OOYfFcmnwXQdkltnw9VkBmnayEsDt4HgDpomkDq+oxIf5rqawLW9xWmPM4vJ6bRtUbmWnJy2E5PM+Fb1R7NBPUodEhgXpCALHvJSXfT4gE2SDa2VqKS1tL9yGrxl+JiuqKhG1P8QDHC0rOnjEaNSY3J9/B/f7pUINHmo+wQW45pKobCJ2/vYrGZhNECd2VPx1abXW767u5HvPpV1jmxLukCSKkuBBMcr7rbbzlwofrZH9XEBhjJsJ+x6Y5bMYznNTcIgaxHD4VRPBCSgoRwUeajdnpIbRvRNzMOtYg54m4RWj+vjBZSA/9cqceUrqfTiBw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB7834.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 08:52:45 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 08:52:45 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Kerem Karabay <kekrby@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 1/2] HID: HID_APPLETB_KBD should depend on X86
Thread-Topic: [PATCH v2 1/2] HID: HID_APPLETB_KBD should depend on X86
Thread-Index: AQHbqfLnLzFfyTM/xUmS68Hpe5ENTrOcl/MR
Date: Thu, 10 Apr 2025 08:52:44 +0000
Message-ID:
 <PN3PR01MB9597160EE7E131BCC171FA39B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <cover.1744273511.git.geert+renesas@glider.be>
 <8fb6c5995f0e72482bad6367d89d9ee5312dd409.1744273511.git.geert+renesas@glider.be>
In-Reply-To:
 <8fb6c5995f0e72482bad6367d89d9ee5312dd409.1744273511.git.geert+renesas@glider.be>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB7834:EE_
x-ms-office365-filtering-correlation-id: 059a7f66-8bdc-4732-8b96-08dd780d0fb9
x-ms-exchange-slblob-mailprops:
 laRBL560oLQowKaVx7aWRf9b2EXVRKJl4ekgkM6EuqIazTomTxCnepwScqix7n0IugpQI8Wz2ZQCwbCh0DeBdh7z02olK6oE8gzaC7Q7HHtqNZfBzh0bVwqu4IO6bPPp78CLB6mFzF+879GBEA/Xhik4mNUk1K/yg8SdV2F5aHbYEFzCZGuuRxwmFPltqvt6+zLxQhxPXqf1moE0GVvKrGe0m1MvW9Z7sQptj9VqCUJh8PbrZIL/cPpHHHYDtj1WZUdTjLI+iZ3PPonB5gvJXYLma5t9r7PxkOtSQaJFC/I/nw6cQU0bq+IoQpR2mKArb7i536QIa6GPOeT7wqxDUhwlPPzE7EDGY2VkxaVza4oY6nB9qejopAxN3DZh45AaffiFvGizZGjwyoon+p5TnUiXloKUG76wr/040b1DUCANGtMgRxLZnmkswHZL3k9veKg9+ANl3TG7/3+rxZFbJzifKu2B51rhCn13WiTRKO+VUJaQvuwZ0MQ9TJKiAO1SyjkCgsshH7aJlNbfExiBwT1cPkkhZyW/HO4nXRJ0B3JO+NJxHVIIwu+MKFbwRPXso/4AkJLOxgakXbaX9UFYDNQ/pcbvT/titR39+zCdNl8AxPLaGPtefaUp3Xfy2CYUybMx6wFeJaJndBp0bcEIbMW4Qt6yFDJcCo2j7kXvlKrRY0i+SU63BghYJtHoWVsjlRuLcmkIqFxJCFSD9gH1pGmAXKLpxZTjDMlhxREPxPQP2qjuuACm9PXxSY5Q/cnJs8pAYpUxa5m4PzJ80Ib86JrpSFesNXWb
x-microsoft-antispam:
 BCL:0;ARA:14566002|6072599003|19110799003|461199028|8062599003|8060799006|15080799006|7092599003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?SW1PWnN6aG1BZmgvMUhGY3l4R3VVQnhkNTdPSzBxWlFKN2FUb0NIRkZBTEsx?=
 =?utf-8?B?YkgrczNLdCs0TXorTlRVZE9CSVlOZUF5THN0RHZZakYydG95RERtTXQ3SmVw?=
 =?utf-8?B?eHd3cE4vQXhvRzNNd1BFWlpIdzRZbWcrY3dYYm94NWZINDRYdnQ2MHJUUjA0?=
 =?utf-8?B?d0xtN2Z1eDBHcXhHYk54WkNORTF6bGZ4dmFLUndYZEpsOE5TMWRUNFJyT3gr?=
 =?utf-8?B?MHpPMTNlUUpDWG1OWXY3cDRZQ2FZdThVS0NnM2lJUENpOUhtYlVWR1dGalVF?=
 =?utf-8?B?T0x1MVVhekVrWndlY1gyVXo1c2FuY2xhTlR2SnYrMkthL0IyWUtGMUJvL1FF?=
 =?utf-8?B?eHpnK0pEdFRUZzhKQ1grM05UU1pFdnZsK2ZzMG5yblhaWGMwRWZaTmZOSmNQ?=
 =?utf-8?B?cG1sVWc1Tkx6YkhYaTZJTi9mbGJ2bDBVMmJnL1k4OTlpSHM1eWhpamxrY2hz?=
 =?utf-8?B?OVNseC9OZ05xc2tiUVlYNkxCd3hoREFDOEdac0F1UE1lUHZZYXRQN2JmUlo5?=
 =?utf-8?B?c3l0WDlVMnN6ZFQxSkE0YlM3VGZGRGIybkxKOG43dGtvTDlKU056aVFXbjMx?=
 =?utf-8?B?eXRKVGNzcWk0T3d6NEM1cFZFLzhnNDNXYU1ZN0Q0cUJaRlZUcXdlK2U0aG5U?=
 =?utf-8?B?bFhaMlBMY2xCRkszWHlvb1NsaEhWTkllTEp3RVNWazNVU3FFczJUN082a0hs?=
 =?utf-8?B?VjAvVnVmQmUyQVJ0MzFFYnJVMWkxQ3lrRTlSY0VsYXFxMjdQbUxTRVdEQ0xH?=
 =?utf-8?B?VG5pVE41d1FTcVJ2aFlSRUtlZVB6QWhJZytlY3AwN2VGSFNObU9YQ1VUSXYz?=
 =?utf-8?B?cmhDN2gxcnJDWWdBVTloTWZUMmtNejBjdG1Fb2NwbU5aZmZqU2U2VlM3cjZX?=
 =?utf-8?B?em1GOEhkMHhVUE9CeDdUWVpJQk8vS3dMSTFFRzNVVUI1b3liVmMwdU4vaU5L?=
 =?utf-8?B?WG1lV1JEN0Vnb0M5NTljRVREL2FJTm9vK1NKbkt4dkp0UFJmZGtqcGNIanQ5?=
 =?utf-8?B?Ny9pVVdOSVVOdkdVZXh0dU9ka3JFRnhpblRHcEd1SkdpMm9qWUZtZWVEN0cx?=
 =?utf-8?B?NWxsOGZGMytNeGJCY1FhMDlDUU1jOENYVnNpbURLeGo5bk10SmNZV2lSVWtZ?=
 =?utf-8?B?cS9IQTlmeVF6RDlscE14V2VNUE5kdXJZZUtuTlpmV3NEdnZUOG9TWXVEMHlt?=
 =?utf-8?B?cXhiaEtKTDdFSW5SeTJwS0JjWFNQU09wTlM4OEpNM1FDNDQwZ0FsMVJkQnBR?=
 =?utf-8?B?c1p6VWtVSmhoSzhRdjZGUXU1NmczNjZ2KzRBUVoxV3FmWmhmWWZFTTJyM29X?=
 =?utf-8?B?eTJ5VWo2aTJ3WWg0S0ZmanpSejJ1aHVJTHZ4eG5LeWt4bC9FODlKTUpuZVVx?=
 =?utf-8?B?Zk9kU3FucFBpQ1lIVzRHc0N4NlpRVG9tRWdxZVlVaU9CZ0dTMnhhUFBZSHN5?=
 =?utf-8?B?VWJFTUk1R0VHRFJXaU1DbXNoV0ZuRDdkTkpEbXk0WjhZbU05S1NObkVTM0dQ?=
 =?utf-8?B?bmdrbGdEb3FTVy9pY015dTN0K2haN01BZHEzMGlFNkxGaHNLaXV6MVI1L0xK?=
 =?utf-8?B?Z2NMZz09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?citOb3UwQnZyWEZmT3hRZC9XNVhpTE1Lend4UmdxOVlXQVNlWnA0dTJuTm9j?=
 =?utf-8?B?cE1tbHRuWkNGSjBDYzVJVzBWMU1MNXE5M1k2aWViOWs0anRpTWozbFlCcHVE?=
 =?utf-8?B?Z2NKcGszbW91cjNIQTRvSnVUemRXclBNVVFOM09BSXYxWG9wVmFKRkh5M3A3?=
 =?utf-8?B?Z202QXdlbjdkTDU4MHN3MWFMTVBCUFUzbmw0MS9PYkt1OG1aQ1djeC9lOC8r?=
 =?utf-8?B?SzliZmFmVEp5ZXVXL1E3eWxKR3FSQWJYdkdTSXpaWFJ2czF5MkdWQytRVXdQ?=
 =?utf-8?B?UldnSVFpTi8wRGlRYytMdnJubXViTS9YeGdFSnk2SGs4OG9RZFVzMFNZUVNa?=
 =?utf-8?B?cklmY01KUkdJR1Z2b2YyS3NpaFNrZkg3ZVNrREVQb0svSmdXSjU1VFZwVHFo?=
 =?utf-8?B?Zm1DRDlnSWFhRG80Z05wMzFuL2xDQVVDbjdZTW52dTVEaCtRZlNwQnBBZEhl?=
 =?utf-8?B?RThsc1JjNmUxcWtTaU9BWWNKSElrZ0dBZUQ5WStwUWxkb2Nza0JCZnFDU0NR?=
 =?utf-8?B?ekhzNlFQMU9RWnZ6bWRRc2pYVGwxenpBR2NtOFFrdmM4S3YvcVZlV1lCb1Rv?=
 =?utf-8?B?dGMxZGFLMGlsWURsamt6LzdGTjZCUTBmV2k0dE9EekFGb2trTkV2VUVEeEx6?=
 =?utf-8?B?K2R4Rm5YUVJTeGZNTU84dnhKbnV6bzVlcUE0T1I4ZHByNzZZNTlGSXlHSng1?=
 =?utf-8?B?RHFoQ1JMR0dZTnFBMVo1S2IybUc1d2w4MnJpVlFLSnp5Zk92Y3E1cmxQanNn?=
 =?utf-8?B?cjk5SFFnWjVIeEZ5N3A0K0ovdXE1YytEVjdNbGpzY3hYeFNhcjNwdlh5ZklE?=
 =?utf-8?B?d1IvZlYxNVpXU2V6akNZTjQ4K2syNStmZVBoVTZYMkZEK2xyVkphUHowRTZn?=
 =?utf-8?B?alZ5bFFrRXNrcUo4OEVvTVZMbXdMdWhlUCtkRCtsQ2hoclViTkdvK1ltSmFG?=
 =?utf-8?B?VVZPR3kwTk1zQ3h0cWlNbTN4d29FaS9yNnBoTzV1a3hydzhhQ2YwNCtDMjRu?=
 =?utf-8?B?a2I0T3pOQUYyTEFEVFE5cnBOYS9qMmxHWFUxOUR2dlNqUDJRc2tERlh4b2do?=
 =?utf-8?B?Rk5WUDFxcTdXMmN2em5OdDlubDU0Q3ZlOUZTZm11aURvYjhXeGpmQjhFTDFw?=
 =?utf-8?B?L3d6YU43Nm5IWjZqTkdCeVB3ckpZaFpYYUJwL3V2NnZGS2pLMmpwbGhQeFJ4?=
 =?utf-8?B?ZUxiWjNFU0F5WFI0bkdJY3hMYi80Tjh2UWs0dnEzMFF3N2JzaUVxN2F4M04v?=
 =?utf-8?B?cE5QYnVlTWhSZXRESmIwcjVZcXVCbHROT2VlWE9lM1duejdxclNYcVAvYXk2?=
 =?utf-8?B?Vmo4ZXRoVmE3ZjIyOVNHOE8rcUdUWXo0Qi9FckVEMVhNdndDcCttVW5pY3dT?=
 =?utf-8?B?c0pkUXdkTFEraEFNUnFCU0ZQKzNjWHhKOUg2UWNwUk9hdE1vRkVQY2FHQUQ1?=
 =?utf-8?B?SXFBTG5lRlN0dWl2dWo5elQyZElPYWYxbFNubkUrckdpYWJOT1hTNXFtYlZw?=
 =?utf-8?B?blA2WUx0a1N6Q0ZGekNnYmlSNHdHMkpKYnZHSGZuOEpHNmMwUlVkY05sUFFk?=
 =?utf-8?B?anh0cnpySHVwSE5PUTRJc1JRZ2YrZlVtQ29JUDlCZFFxT2s4YWlzSytqZExk?=
 =?utf-8?B?QU5Sbk5lQzF5ZmNJZGxyUGNNWXVIZDA1MlFBOHBJa0xEdWhFL2F3WW1vN1JR?=
 =?utf-8?B?RTNEcnhTcjBUQi85Y2RtWGZxTWJYRkpWZUFGRU11QzJ3cHNGemtNM0hwNEN5?=
 =?utf-8?Q?02+TUxBWTc2z8enE1E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 059a7f66-8bdc-4732-8b96-08dd780d0fb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 08:52:44.9842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7834

DQoNCj4gT24gMTAgQXByIDIwMjUsIGF0IDI6MDHigK9QTSwgR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydCtyZW5lc2FzQGdsaWRlci5iZT4gd3JvdGU6DQo+IA0KPiDvu79UaGUgQXBwbGUgVG91Y2gg
QmFyIGlzIG9ubHkgcHJlc2VudCBvbiB4ODYgTWFjQm9vayBQcm9zLiAgSGVuY2UgYWRkIGENCj4g
ZGVwZW5kZW5jeSBvbiBYODYsIHRvIHByZXZlbnQgYXNraW5nIHRoZSB1c2VyIGFib3V0IHRoaXMg
ZHJpdmVyIHdoZW4NCj4gY29uZmlndXJpbmcgYSBrZXJuZWwgZm9yIGEgZGlmZmVyZW50IGFyY2hp
dGVjdHVyZS4NCg0KVGhlcmUgYXJlIGEgbG90IG9mIHNwYWNlcyBiZWZvcmUgSGVuY2UuIEFsc28s
IEFwcGxlIFRvdWNoIEJhciBpcyBwcmVzZW50IG9uIHNvbWUgQXJtIE1hY0Jvb2tzIGFzIHdlbGws
IHNvIHByb2JhYmx5IG1lbnRpb24gdGhhdCB0aGlzIGRyaXZlciBpcyBvbmx5IGZvciB0b3VjaGJh
cnMgb24geDg2IE1hY3MgYW5kIHRoZXJlIGlzIGEgc2VwYXJhdGUgZHJpdmVyIGZvciB0aGUgQXJt
IE1hY3MuDQoNCkFueXdheXMgaXQncyBKaXJpJ3MgYW5kIHlvdXIgY2FsbCByZWdhcmRpbmcgdGhp
cyBjaGFuZ2UuDQo+IA0KPiBGaXhlczogOGU5YjkxNTJjZmJkYzJhOSAoIkhJRDogaGlkLWFwcGxl
dGIta2JkOiBhZGQgZHJpdmVyIGZvciB0aGUga2V5Ym9hcmQgbW9kZSBvZiBBcHBsZSBUb3VjaCBC
YXJzIikNCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT4NCj4gLS0tDQo+IFRoaXMgaXMgdjIgb2YgIkhJRDogSElEX0FQUExFVEJfQkwg
YW5kIEhJRF9BUFBMRVRCX0tCRCBzaG91bGQgZGVwZW5kIG9uDQo+IFg4NiIuDQo+IA0KPiB2MjoN
Cj4gIC0gU3BsaXQgaW4gdHdvIHBhdGNoZXMsDQo+ICAtIENvcnJlY3QgRml4ZXMuDQo+IC0tLQ0K
PiBkcml2ZXJzL2hpZC9LY29uZmlnIHwgMSArDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL0tjb25maWcgYi9kcml2ZXJzL2hp
ZC9LY29uZmlnDQo+IGluZGV4IGE1MDMyNTI3MDJiN2I0M2MuLjExOWU1MTkwYTJkZjc4NmUgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvaGlkL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9oaWQvS2Nv
bmZpZw0KPiBAQCAtMTYzLDYgKzE2Myw3IEBAIGNvbmZpZyBISURfQVBQTEVUQl9LQkQNCj4gICAg
ZGVwZW5kcyBvbiBVU0JfSElEDQo+ICAgIGRlcGVuZHMgb24gQkFDS0xJR0hUX0NMQVNTX0RFVklD
RQ0KPiAgICBkZXBlbmRzIG9uIElOUFVUDQo+ICsgICAgZGVwZW5kcyBvbiBYODYgfHwgQ09NUElM
RV9URVNUDQo+ICAgIHNlbGVjdCBJTlBVVF9TUEFSU0VLTUFQDQo+ICAgIHNlbGVjdCBISURfQVBQ
TEVUQl9CTA0KPiAgICBoZWxwDQo+IC0tDQo+IDIuNDMuMA0KPiANCg==

