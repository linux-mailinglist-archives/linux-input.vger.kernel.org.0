Return-Path: <linux-input+bounces-12453-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE94ABC7E8
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 21:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DB067A52E1
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 19:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35831A83F9;
	Mon, 19 May 2025 19:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="sg4nIrCw"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011028.outbound.protection.outlook.com [52.103.67.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162071E0E00
	for <linux-input@vger.kernel.org>; Mon, 19 May 2025 19:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747683299; cv=fail; b=rd27o4azZawLEfNJZZXpwD/cp11GHJDuSrD+1QJUK3XVty8Dp7uDO0M+k04+Gcsa2T0SSWCxcxKYzQALKkjmRwXpfclr8kqFp4iIU0tbtnN3Y3+5J/CDlsGNFt97fd8qnM2lv63Cw+qx1eCQ5pXkpFPwRFYUOxpL1Y9xc15So5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747683299; c=relaxed/simple;
	bh=8SR5sh0WwBicJtS6pQv1upbyfT76w79ziQkdj5i4eWQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SWiw1am4JtMn5CeSqXIWClU9LJ0cQDoaYGmzLEf0XbtraB/BhEwI87D0ZKuRiXKP0HBsKiFk8XoQVncZKTtUGi7PyAkvnX+1VAvu3c8dz7Eh7eh1p0bR3CCuCyRsqL1vHbiaQSX8wmKr5aYBccMv2NlmKomhPXZqFqEz66dw8JM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=sg4nIrCw; arc=fail smtp.client-ip=52.103.67.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRnb91fe918Wak8q8AiOKFdOzFBnyndyKIYhcambWc3mdUeaI+ivJk2bZRnI7/747JyoP8S6/SuZNdKTsj3mVqWRqAXYtyBXtHpjso8uXC9WVgfDNgSluBNZ1as6jRHhBmvHf3ltRfP0mvkE+/kv+q9+eiurxmkokMmiqMnajDrf4xYosQFyeBe590jXZqBbO77gTHSd210kkeFUpU1rDmbtVTp2SaIkotr4aFFFhuUO4jy84LxTRStNnoRVpoDoIEBnm0beevFbTyy9laOwgZQcz9Wuw7Sd+9YK2BHseCZGgoKThJGuC/5l7pKqo/NrJiHs5T5plsKsfmIV/pse9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twIz2waYWtmsU3NSSLiE1wDF8RwSzu8kobMszu5hKBI=;
 b=yf/xPjb10fWDRZgElGvG8ZT8E2oMRY5ayFk/AO96x8L6DSmkcrwNaCM1kLxAuuOdo8j0Rk2uhFxVcF/NSeSUFPE2A9bEEjNhm65qO9H3+/YULte2hqaE948rzmqyxznY0IaIQpIaoEVvGH8o0usHD7F+sZwcfWAo0j+KffB4KZ6JA2IfoGMUFqO0z1uTojxa9qeGt+A154yr7FuDMDqZezxeFT/waiowTZ++RglrtAwR9oGoXZKSu4vAhdpevT478xN1Qd9W1AIPI57WgW9mrU5o8nTlDyApZep7ss49t6OCxwn7+FjVbuHpYWKbKsEqGeRGsUcuM/Peo81xr2Zxdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twIz2waYWtmsU3NSSLiE1wDF8RwSzu8kobMszu5hKBI=;
 b=sg4nIrCwH/l2xPACaPIX2XCKmjDoj5MhcY+IwFQjXV+4mPvpMCkRQeFgyW8hHWLjuj0K6sThriOxMmmw8EndUCg9ttoJ/n8BH38j33W0BjQdmVuIMZR1Z1QedDq4sVZ1MTL6WCz9vBXPGf8oOtvpyOBFwjbZNKe0S1uExjVT9L9NhogXqacfNVBTa3V2DaszJvlEwuvohGKUflA26LzB0DSPeBlU3kya2oXXkF1sVOH/WgRiWPvm+BDPmhB89OTErq99cdhE9rfn7xkp/dA16lvjVv0dphfP3XrKpgEfIPv5Dqtnb6fhOLXRxhNJHarKiIuHLo5h8k3fDv1efUD+mw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB7758.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:9d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 19:34:52 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 19:34:52 +0000
Message-ID:
 <PN3PR01MB95979D822C69D96DCB33D67CB89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 20 May 2025 01:04:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: HID apple error with A1243 keyboard
To: Ioannis Barkas <jnyb.de@gmail.com>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <CADUzMVbe=9YgXfMtSDL-XAKhYnjuo-L6_s4pGiN1g1ibU-_G9A@mail.gmail.com>
 <PN3PR01MB9597F80FFCE6A1037092AC04B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959753C721C0B0C29B8F24B4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CADUzMVaZn6RTUuArHuvT9MAG=BD8HcJKh3PsQEKU08TReXzg5w@mail.gmail.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <CADUzMVaZn6RTUuArHuvT9MAG=BD8HcJKh3PsQEKU08TReXzg5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0157.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::27) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <cc4c8885-8db0-422d-8fca-9caab0573de2@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN3PR01MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b01f0a8-8180-4db0-66eb-08dd970c39eb
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrMi34iUpeHrvUBJkG+6rPgnI6J9YdQ/cvGqJAoYbwUuFV3wPvhOUK3vAjn36ZaquMBaSVmJ7Nrq1gW7tiwmqtabUI0WKW5ujO9Z7M7eGRrhDHGkViA7f5fZpBk7XxfI5otevUSOQlIHHp4MUdbgqXDQmVDLvSXZ+TOwsuTOrfJN9ehjr368nPQCbkL4qHhqjmY06zHogG8PaTEKZB1vJpv2VtKqZ85bhfeKWZuO1DX6YriMXfpHjtWUd2Pnq2ZLTudw6hrxnVkker93fSPDxU22hyTySvzPVbHD6MlhgTyroLkQR9N8fa5Wa8I6NXxa1Y8DzcOKsRXZmNmjGrVSSa924YoPtGdDZLIN6N/TNZfhBgcBU1dRmIK/tRDY6Sa69KYYN2xe0X/md8Tc1cnC7dHRxw902Ru9U0NLv2TWQWrd8rtVutneahxdDqW1sp2NnoqFLGlqCFPbO4gx4MX64X0M+xqMmrok5oLuSa2RDZdwi/+DZuhkNCKiG6DwtNVh0aVwghbr6riRA0D9PzZSWL0BRKsY3KmJne1UngaIich9Afj52vtJ/lB5Eb6dj6kxdLwuH4q6fMbpWlEaWaujEbJ0S8MjNCYcRdklo+0J7cCFqi+h8e5FnytRVsrh6KnGk1L6fOlwrJ+MEuyNzOIaLQ0vDgC5Cpy5krkcQ/5y2Ksir0smYGaUYLHjuJBh1+aiPve/s4u0C0nhqyihMVZe1rymbiqznVl3qIEiV6pabbQxt3EnHH9YKh8d8a+whIJbSOc=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|461199028|7092599006|8060799009|19110799006|15080799009|10035399007|3412199025|440099028|34005399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDZYa2xqUG9ESkpXdGkxZm1yZnh3NDlYNzI3UXd0a3NpbDlQL2RyYkIrV3ZK?=
 =?utf-8?B?bGJnZ0FVSXVjSDgweVYwd1hJK1YrdCtYY3N4UHJUUWVSNklOQ1lNdk81OGM1?=
 =?utf-8?B?MTlBdWJqOWppVi81UGhzdlBqYjFLUWVyYU9QQUI0R3loK1BUS2g4cG1MYlpK?=
 =?utf-8?B?N2UwbFZzaEhVWkxvWERaUGc3K2VSd1FDMzduRk02Ulh0bTE3a1l0cEs1a3E5?=
 =?utf-8?B?dm8rVGNzMUhBL1I5ZmJRTnFjdmdpRG9WRlphVkJEZXhBK3F4cXlabXBMV05h?=
 =?utf-8?B?OXkwaHdQRzZxcmN4enhnb0FPZ25sSUNkR0dYeTZTaVBHcnc3UFZySTlLZjNa?=
 =?utf-8?B?MmdkcXRscTFtS1F1WnV3b28ycjU0MDJtMnJOVHg5WmExSXFINDI5UVpKQklu?=
 =?utf-8?B?U1A3NDhJOHNCeHQ1NTVVWmZabjZ1U0hlb0dxakxPSzkzeTVrN3hCVC9CekM0?=
 =?utf-8?B?bWplNHBYWi9md29HbWZEUnBZc1l0VVVEb2Z4eEJBczF2cGhjNHdGb2RqSitr?=
 =?utf-8?B?Z3Y3ZEdOdXU4cC9LV1BGM1R0YU51aVkzMVMxNE5tUGZreGZZSzB4YlVPZFdZ?=
 =?utf-8?B?V0dSZWhtK25RMTdJS0VIR0lhVllDdmNBdXozVTlTMmFzWjhQMHRjTjEvUGhP?=
 =?utf-8?B?R2poYXc4eG9uOHZMeW1PaUtVL2tnZGhmcE1rYmtDY3ZyZ0QyOC9wUk85MHJK?=
 =?utf-8?B?RldZYVo1bUtiVVQ5SVU4QnFpYkhncWlSdzZkb2JuNWdJdG9FNklzS3VhZWJN?=
 =?utf-8?B?U0N6cUpJQ2VSY1Q4WFVzUi9QN0ZXOEtNays4VGRZZTdydnI1ZmxnOGh2WFJN?=
 =?utf-8?B?N1VrSUJRdUJRRjlXRE9PVDVFeXkzMTYvSk5mcVFYQTlXMFRCZi95RGhFamt5?=
 =?utf-8?B?SEFwd3p1Qjk5ck1Ca0MwRHg1M3paQTdOeVNCL2Vmc2J1Y1RPdk8vY2h3N1p3?=
 =?utf-8?B?Vm1CSVAyZG5qNVlPdEllc0FHYk5HRUFESnVxTHRkcGlrSU02TXh4RHVjR1JN?=
 =?utf-8?B?aVRwNHRDTGhxNERZSURpTWc1djdKaXhpTlNHblNWWEt2cTEra1o3cFBNc3Az?=
 =?utf-8?B?cmJiL1kremkzNFpaMi9YbjhBeXNVcU45SGRCK0VQOXdic3k3MDBOdy9JSldt?=
 =?utf-8?B?aDBmM1FaOUc0eGZiK2pvUDhZWjI5cmY4Z3lYeDNKNHFyOW15QUhwUFJHaUFm?=
 =?utf-8?B?enh0UytYWG5ERlRDaEtoRkJ1RmE3bnRpVjlJLzdpaDJaNUZPRTN0SllTb2FM?=
 =?utf-8?B?SkxKenZUc3B0MW5WaWNMUmNobnIrR3JNSUhFZE0ybVVCZWRJSEVyaEhJYmQ3?=
 =?utf-8?B?WTJxUFFieWoxRlZOQXNWd2xqVHIvL3Vobk9KdHoyd0JMMVNFSE5MZnNSVXkw?=
 =?utf-8?B?SzBDRzNjWml2TE9MMmw3TjlNNHVtRlIwTmZBN0xzd2R4cVV5cGN0akdWQTFN?=
 =?utf-8?B?d3J3SHRTMXc4Wjd0NFhaTm1DZnBsTUNuQ1dvV0pvelVGWHdjZFdPVEZhdHg0?=
 =?utf-8?B?UkJQV3pXRHZhSWhiaGN6WFM2WlE4bWxSS2pVQWsxN3Zoa3VYWCtIeUxJbmpz?=
 =?utf-8?B?ZVBwaWVMVnFYcU5BUnlHbFVVUldta3R5V2ZrNXA1N1M1cFVQMWdCeHlwblp4?=
 =?utf-8?Q?PQ1SgJBk9oYYCaX/aKb0NivYQgOhpakebm/J36K9Hufk=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MURlczBrUmZoeFBXd3dDZkRmNXZycGxDc1NoRGtRdWxldXFoZ251cVljdDNq?=
 =?utf-8?B?VVBzbndaL25kb1E2TTVRUlhaWXZieGEvMEIvdDNxVXhOZHVuZTlsNnNPaXVZ?=
 =?utf-8?B?WXl4dEtjTWZkRUdTN1ZkTjVoeWE0akRtbEV0dGRyZ0p2N0JjdFU0VzVZSDZN?=
 =?utf-8?B?Sm84OGNtcXZhU3FCbUFCc3hyZjdJS0NuN0toalhsUXZtNzNVZHNzWXJzWlNV?=
 =?utf-8?B?Y3RaNUpLNlBpKzR3a1gvSnZIc0hQSWJpT003cEhmak11K25sUWJiaEtVSnFH?=
 =?utf-8?B?TmRDaVdJY2JmeEE4UG1VM0t2UFhCRHNPSUV6TzVET044aGlYR0U1ZWEzNnBI?=
 =?utf-8?B?eSs2N1hlOXNqajE2a2VqZENXaktMUU1lQjkvVDM0cmE5Nlhhc2FUTjJVZXhx?=
 =?utf-8?B?MFpDb2ExajdmdFA3MWcwOC82M1dZOVpVaDBhMjJrYTNOam5oRmh1dVcrVExV?=
 =?utf-8?B?OVczTkcxMHA0eVFiNEMzRlphQjZxalNEek54L013cjQ4R3kzZmlKSU43L2sv?=
 =?utf-8?B?NTZlY1owVDA3RGRDOE5aUVJNYWVEWnBCZGVMUFFsKy9HZVlydmhJUmR6WE13?=
 =?utf-8?B?b0JhOEREbEtQOWpHVlBZeWEzOUFkbjNKOTJuU2lDYWNxUjQwclRCK3h3THFm?=
 =?utf-8?B?T2V5T3I5cDBhQXZXb05EQU1XSlpqNHRCcmVXcEFUTUFkS2kveGVSeFRvWUFX?=
 =?utf-8?B?ejFhdnhNR2c2YkRlM0ZWMHpoeWs1VUJSZG5XZnhubjhyMVJtMDVHb2p6cmVH?=
 =?utf-8?B?b3luWDZDWDRXZzB3ZW1TSTRMVWVvdXplTjIxcnNKdFI3MTA3UlE2NlFteHdU?=
 =?utf-8?B?VytNN0lTNWNCUmNGQ3JqSlpOOHg3dXRjb2c0UWpWdDNCeUFNYVgxOEZKbW1G?=
 =?utf-8?B?bUt4dWI1ZkMzakU2WXdobmxtOUV4SFNVWUpGbnBvU2d4a0dDbGpKYWlmVFZu?=
 =?utf-8?B?TnM4NTdBUTZOSkRYelVwWldKWDBISngzSG55ME1UVExJVDk5cm5WRGJ6Nnd2?=
 =?utf-8?B?cEI1aEZtL2tXRlpKWnp3YWdnUnQ5QVlSNVFIUHc0ZXd2eGFtK1RqYW5ER2Q5?=
 =?utf-8?B?ZUF2ZWo5cldPbUdTWnkrRnJDZUxJeVo5V0Q0empYRzFyZUR1QWhHdVp5N2g0?=
 =?utf-8?B?QnpXZWhraE4wQ1lFRWttd2Rhb1RyWkUvL2VVNDJzUWNFTGhiSEhEWGhaNTYr?=
 =?utf-8?B?dFFsaEtTREp0dkV1K2JuUlk2NHdaMWpWN1FBQklJeWVMQytLclVIL21mSUh0?=
 =?utf-8?B?a3RPK0Vkb2p4WXlLU0FxTjBSSC9uUUwzQUVPcjVtbUpDMmppNFNUVExOcGR1?=
 =?utf-8?B?OEJHUmtBNTM4aUsxS203eWNTZFNvRjd6REdJNHA4SWdkcFJHOExRSGxUU3FH?=
 =?utf-8?B?bGNxbUVSN0R1ZVhybTlOUUV4aDE2Y2kvOTE5Z1hHNlJCdmd6enhFaG12RC9F?=
 =?utf-8?B?ZlU1QUNyS01SbXFnZmxBV3p6RVlQY24rYWdGMVBCQytYa0JMWko4dzU2a1J2?=
 =?utf-8?B?bjFwZnBmSjF3bDdwZGlhWFk1dVhFNzczT2wzcTNuL3d4S2xFN1dYRjdwVmZi?=
 =?utf-8?B?c0hoV21YK2ZzUjkrV0pldzNta2p2YjVEWmlRd1VGOVMzRDNMMm1LRjViR3lN?=
 =?utf-8?B?YU1WNWtJeTJHM0orYVJsMGFoQ3VzaXF3bHliT2prSi9yVzcrQnd3Q25RVzdD?=
 =?utf-8?B?SiszUjNwNFJUOHdVZkZrTXZJMlhpNzN2azBXbWdrcGRmU1o1V1pCa0h2TTMy?=
 =?utf-8?Q?dEefhrpQjer2IF2vKA=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b01f0a8-8180-4db0-66eb-08dd970c39eb
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 19:34:52.6010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7758



On 20/05/25 12:30 am, Ioannis Barkas wrote:
> Hello Aditya,
> 
> Thank you for looking into this! Issue appears to be present on old
> kernels as you can see below. This time I tested it on PC.
> 
> Fn works fine as expected with kernel 6.12.15 @PC:
> [  137.137645] input: Apple Inc. Apple Keyboard as
> /devices/pci0000:00/0000:00:12.2/usb2/2-2/2-2.2/2-2.2:1.0/0003:05AC:0250.0006/input/input24
> [  137.282472] apple 0003:05AC:0250.0006: input,hidraw2: USB HID v1.11
> Keyboard [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input0
> [  137.282660] apple 0003:05AC:0250.0007: Fn key not found (Apple
> Wireless Keyboard clone?), disabling Fn key handling
> [  137.282703] input: Apple Inc. Apple Keyboard as
> /devices/pci0000:00/0000:00:12.2/usb2/2-2/2-2.2/2-2.2:1.1/0003:05AC:0250.0007/input/input25
> [  137.338545] apple 0003:05AC:0250.0007: input,hidraw4: USB HID v1.11
> Device [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input1
> 
> Fn works fine as expected with vanilla debug kernel 6.6.0 @PC:
>     3.504563] bus: 'hid': __driver_probe_device: matched device
> 0003:05AC:0250.0006 with driver apple
> [    3.505099] bus: 'hid': really_probe: probing driver apple with
> device 0003:05AC:0250.0006
> [    3.505649] apple 0003:05AC:0250.0006: no default pinctrl state
> [    3.506334] apple 0003:05AC:0250.0006: Fn key not found (Apple
> Wireless Keyboard clone?), disabling Fn key handling
> [    7.248274] apple 0003:05AC:0250.0006: input,hidraw4: USB HID v1.11
> Device [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input1
> [    7.248854] driver: 'apple': driver_bound: bound to device
> '0003:05AC:0250.0006'
> [    7.249456] bus: 'hid': really_probe: bound device
> 0003:05AC:0250.0006 to driver apple
> 
> Fn works fine as expected with debian kernel 6.1.137d @PC:
> [    3.118620] apple 0003:05AC:0250.0005: input,hidraw4: USB HID v1.11
> Keyboard [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input0
> [    3.118765] apple 0003:05AC:0250.0006: Fn key not found (Apple
> Wireless Keyboard clone?), disabling Fn key handling
> [    3.378932] apple 0003:05AC:0250.0006: input,hidraw0: USB HID v1.11
> Device [Apple Inc. Apple Keyboard] on usb-0000:00:12.2-2.2/input1
> [    6.746946] usbcore: registered new device driver apple-mfi-fastcharge
> 
> Pressing F11 lowers the volume. Pressing it along with Fn key results
> in maximizing the active window as expected. Log entry is false for
> sure.
> 
> Device has 2 hid raw entries 0, 4. hid logs were captured using debian
> kernel 6.1. Initially Fn key was pressed and then F11 or F11+Fn. No
> other key was pressed.
> 
> hidraw0:
> # Apple Inc. Apple Keyboard
> # Report descriptor length: 47 bytes
> #   Bytes                          // Field Name
>        Offset
> # ----------------------------------------------------------------------------------
> # 🮥 0x05, 0x0c,                    // Usage Page (Consumer)
>           0
> # 🭬 0x09, 0x01,                    // Usage (Consumer Control)
>           2
> #   0xa1, 0x01,                    // Collection (Application)
>          4
> # 🮥 0x05, 0x0c,                    //   Usage Page (Consumer)
>           6
> #   0x75, 0x01,                    //   Report Size (1)
>          8
> #   0x95, 0x01,                    //   Report Count (1)
>          10
> #   0x15, 0x00,                    //   Logical Minimum (0)
>          12
> #   0x25, 0x01,                    //   Logical Maximum (1)
>          14
> # 🭬 0x09, 0xcd,                    //   Usage (Play/Pause)
>           16
> # ┇ 0x81, 0x06,                    //   Input (Data,Var,Rel)
>          18
> # 🭬 0x09, 0xb5,                    //   Usage (Scan Next Track)
>           20
> # ┇ 0x81, 0x02,                    //   Input (Data,Var,Abs)
>          22
> # 🭬 0x09, 0xb6,                    //   Usage (Scan Previous Track)
>           24
> # ┇ 0x81, 0x02,                    //   Input (Data,Var,Abs)
>          26
> # 🭬 0x09, 0xb8,                    //   Usage (Eject)
>           28
> # ┇ 0x81, 0x06,                    //   Input (Data,Var,Rel)
>          30
> # 🭬 0x09, 0xe2,                    //   Usage (Mute)
>           32
> # ┇ 0x81, 0x06,                    //   Input (Data,Var,Rel)
>          34
> # 🭬 0x09, 0xea,                    //   Usage (Volume Decrement)
>           36
> # ┇ 0x81, 0x02,                    //   Input (Data,Var,Abs)
>          38
> # 🭬 0x09, 0xe9,                    //   Usage (Volume Increment)
>           40
> # ┇ 0x81, 0x02,                    //   Input (Data,Var,Abs)
>          42
> # ┇ 0x81, 0x01,                    //   Input (Cnst,Arr,Abs)
>          44
> #   0xc0,                          // End Collection
>          46
> R: 47 05 0c 09 01 a1 01 05 0c 75 01 95 01 15 00 25 01 09 cd 81 06 09
> b5 81 02 09 b6 81 02 09 b8 81 06 09 e2 81 06 09 ea 81 02 09 e9 81 02
> 81 01 c0
> N: Apple Inc. Apple Keyboard
> I: 3 5ac 250
> # Report descriptor:
> # ------- Input Report -------
> #    | Report size: 8 bits
> #   Bit:    0       Usage: 000c/00cd: Consumer / Play/Pause
>            Logical Range:     0..=1
> #   Bit:    1       Usage: 000c/00b5: Consumer / Scan Next Track
>            Logical Range:     0..=1
> #   Bit:    2       Usage: 000c/00b6: Consumer / Scan Previous Track
>            Logical Range:     0..=1
> #   Bit:    3       Usage: 000c/00b8: Consumer / Eject
>            Logical Range:     0..=1
> #   Bit:    4       Usage: 000c/00e2: Consumer / Mute
>            Logical Range:     0..=1
> #   Bit:    5       Usage: 000c/00ea: Consumer / Volume Decrement
>            Logical Range:     0..=1
> #   Bit:    6       Usage: 000c/00e9: Consumer / Volume Increment
>            Logical Range:     0..=1
> #   Bit:    7       ######### Padding
> ##############################################################################
> # Event nodes:
> # - /dev/input/event5:  "Apple Inc. Apple Keyboard"
> ##############################################################################
> # Recorded events below in format:
> # E: <seconds>.<microseconds> <length-in-bytes> [bytes ...]
> #
> 
> 
> hidraw4:
> # Apple Inc. Apple Keyboard
> # Report descriptor length: 75 bytes
> #   Bytes                          // Field Name
>        Offset
> # ----------------------------------------------------------------------------------
> # 🮥 0x05, 0x01,                    // Usage Page (Generic Desktop)
>           0
> # 🭬 0x09, 0x06,                    // Usage (Keyboard)
>           2
> #   0xa1, 0x01,                    // Collection (Application)
>          4
> # 🮥 0x05, 0x07,                    //   Usage Page (Keyboard/Keypad)
>           6
> # 🭬 0x19, 0xe0,                    //   Usage Minimum (224)
>           8
> # 🭬 0x29, 0xe7,                    //   Usage Maximum (231)
>           10
> #   0x15, 0x00,                    //   Logical Minimum (0)
>          12
> #   0x25, 0x01,                    //   Logical Maximum (1)
>          14
> #   0x75, 0x01,                    //   Report Size (1)
>          16
> #   0x95, 0x08,                    //   Report Count (8)
>          18
> # ┇ 0x81, 0x02,                    //   Input (Data,Var,Abs)
>          20
> #   0x95, 0x01,                    //   Report Count (1)
>          22
> #   0x75, 0x08,                    //   Report Size (8)
>          24
> # ┇ 0x81, 0x01,                    //   Input (Cnst,Arr,Abs)
>          26
> # 🮥 0x05, 0x08,                    //   Usage Page (LED)
>           28
> # 🭬 0x19, 0x01,                    //   Usage Minimum (1)
>           30
> # 🭬 0x29, 0x05,                    //   Usage Maximum (5)
>           32
> #   0x95, 0x05,                    //   Report Count (5)
>          34
> #   0x75, 0x01,                    //   Report Size (1)
>          36
> # ┊ 0x91, 0x02,                    //   Output (Data,Var,Abs)
>          38
> #   0x95, 0x01,                    //   Report Count (1)
>          40
> #   0x75, 0x03,                    //   Report Size (3)
>          42
> # ┊ 0x91, 0x01,                    //   Output (Cnst,Arr,Abs)
>          44
> # 🮥 0x05, 0x07,                    //   Usage Page (Keyboard/Keypad)
>           46
> # 🭬 0x19, 0x00,                    //   Usage Minimum (0)
>           48
> # 🭬 0x2a, 0xff, 0x00,              //   Usage Maximum (255)
>           50
> #   0x95, 0x05,                    //   Report Count (5)
>          53
> #   0x75, 0x08,                    //   Report Size (8)
>          55
> #   0x15, 0x00,                    //   Logical Minimum (0)
>          57
> #   0x26, 0xff, 0x00,              //   Logical Maximum (255)
>          59
> # ┇ 0x81, 0x00,                    //   Input (Data,Arr,Abs)
>          62
> # 🮥 0x05, 0xff,                    //   Usage Page (Reserved Usage
> Page 00FF)   64
> # 🭬 0x09, 0x03,                    //   Usage (Reserved Usage 0x03)
>           66
> #   0x75, 0x08,                    //   Report Size (8)
>          68
> #   0x95, 0x01,                    //   Report Count (1)
>          70
> # ┇ 0x81, 0x02,                    //   Input (Data,Var,Abs)
>          72
> #   0xc0,                          // End Collection
>          74
> R: 75 05 01 09 06 a1 01 05 07 19 e0 29 e7 15 00 25 01 75 01 95 08 81
> 02 95 01 75 08 81 01 05 08 19 01 29 05 95 05 75 01 91 02 95 01 75 03
> 91 01 05 07 19 00 2a ff 00 95 05 75 08 15 00 26 ff 00 81 00 05 ff 09
> 03 75 08 95 01 81 02 c0
> N: Apple Inc. Apple Keyboard
> I: 3 5ac 250
> # Report descriptor:
> # ------- Input Report -------
> #    | Report size: 64 bits
> #   Bit:    0       Usage: 0007/00e0: Keyboard/Keypad / Keyboard
> LeftControl         Logical Range:     0..=1
> #   Bit:    1       Usage: 0007/00e1: Keyboard/Keypad / Keyboard
> LeftShift           Logical Range:     0..=1
> #   Bit:    2       Usage: 0007/00e2: Keyboard/Keypad / Keyboard
> LeftAlt             Logical Range:     0..=1
> #   Bit:    3       Usage: 0007/00e3: Keyboard/Keypad / Keyboard Left
> GUI            Logical Range:     0..=1
> #   Bit:    4       Usage: 0007/00e4: Keyboard/Keypad / Keyboard
> RightControl        Logical Range:     0..=1
> #   Bit:    5       Usage: 0007/00e5: Keyboard/Keypad / Keyboard
> RightShift          Logical Range:     0..=1
> #   Bit:    6       Usage: 0007/00e6: Keyboard/Keypad / Keyboard
> RightAlt            Logical Range:     0..=1
> #   Bit:    7       Usage: 0007/00e7: Keyboard/Keypad / Keyboard Right
> GUI           Logical Range:     0..=1
> #   Bits:   8..=15  ######### Padding
> #   Bits:  16..=55  Usages:
>               Logical Range:     0..=255
> #                   0007/0000: <unknown>
> #                   0007/0001: Keyboard/Keypad / ErrorRollOver
> #                   0007/0002: Keyboard/Keypad / POSTFail
> #                   0007/0003: Keyboard/Keypad / ErrorUndefined
> #                   0007/0004: Keyboard/Keypad / Keyboard A
> #                   ... use --full to see all usages
> #   Bits:  56..=63  Usage: 00ff/0003: Reserved Usage Page 00FF /
> Reserved Usage 0x03 Logical Range:     0..=255

Judging from the logs, Fn has the same usage page as expected for other
Apple keyboards, so I don't find any issue here.

> # ------- Output Report -------
> #    | Report size: 8 bits
> #   Bit:    0       Usage: 0008/0001: LED / Num Lock
>            Logical Range:     0..=1
> #   Bit:    1       Usage: 0008/0002: LED / Caps Lock
>            Logical Range:     0..=1
> #   Bit:    2       Usage: 0008/0003: LED / Scroll Lock
>            Logical Range:     0..=1
> #   Bit:    3       Usage: 0008/0004: LED / Compose
>            Logical Range:     0..=1
> #   Bit:    4       Usage: 0008/0005: LED / Kana
>            Logical Range:     0..=1
> #   Bits:   5..=7   ######### Padding
> ##############################################################################
> # Event nodes:
> # - /dev/input/event4:  "Apple Inc. Apple Keyboard"
> ##############################################################################
> # Recorded events below in format:
> # E: <seconds>.<microseconds> <length-in-bytes> [bytes ...]
> #
> # Current time: 21:36:37
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000000.000073 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000000.103860 8 00 00 00 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000000.951703 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000001.071739 8 00 00 00 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000001.943577 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000002.055507 8 00 00 00 00 00 00 00 00
> # Current time: 21:36:40
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000002.800115 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000002.903383 8 00 00 00 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000005.911108 8 00 00 44 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000006.031015 8 00 00 00 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000006.422933 8 00 00 44 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000006.502931 8 00 00 00 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000006.950889 8 00 00 44 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000007.046852 8 00 00 00 00 00 00 00 00
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000008.702397 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000009.582293 8 00 00 44 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000009.742416 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000010.462202 8 00 00 44 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000010.606141 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000011.118016 8 00 00 44 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000011.254024 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |Keyboard F11:    68|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000011.677916 8 00 00 44 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     1
> E: 000011.870311 8 00 00 00 00 00 00 00 01
> #                 Keyboard LeftControl:     0 |Keyboard LeftShift:
> 0 |Keyboard LeftAlt:     0 |Keyboard Left GUI:     0 |Keyboard
> RightControl:     0 |Keyboard RightShift:     0 |Keyboard RightAlt:
>  0 |Keyboard Right GUI:     0 |<8 bits padding> |0007/0000:     0|
> 0007/0000:     0| 0007/0000:     0| 0007/0000:     0| 0007/0000:     0
> |Reserved Usage 0x03:     0
> E: 000012.229851 8 00 00 00 00 00 00 00 00
> 
> Best regards,
> Ioannis
> 
> 
> On Mon, 19 May 2025 at 21:28, Aditya Garg <gargaditya08@live.com> wrote:
>>
>>
>>
>> On 19/05/25 10:45 pm, Aditya Garg wrote:
>>> Hi Ioannis
>>>
>>>> Hello guys,
>>>>
>>>> I am getting a wrong print with the A1243 wired keyboard:
>>>> [  339.368030] usb 1-3.3.1.2: new low-speed USB device number 8 using xhci_hcd
>>>> [  339.460199] usb 1-3.3.1.2: New USB device found, idVendor=05ac,
>>>> idProduct=0250, bcdDevice= 0.74
>>>> [  339.460217] usb 1-3.3.1.2: New USB device strings: Mfr=1,
>>>> Product=2, SerialNumber=0
>>>> [  339.460218] usb 1-3.3.1.2: Product: Apple Keyboard
>>>> [  339.460219] usb 1-3.3.1.2: Manufacturer: Apple Inc.
>>>> [  339.469425] input: Apple Inc. Apple Keyboard as
>>>> /devices/pci0000:00/0000:00:14.0/usb1/1-3/1-3.3/1-3.3.1/1-3.3.1.2/1-3.3.1.2:1.0/0003:05AC:0250.000F/input/input18
>>>> [  339.556178] apple 0003:05AC:0250.000F: input,hidraw12: USB HID
>>>> v1.11 Keyboard [Apple Inc. Apple Keyboard] on
>>>> usb-0000:00:14.0-3.3.1.2/input0
>>>> [  339.558624] apple 0003:05AC:0250.0010: Fn key not found (Apple
>>>> Wireless Keyboard clone?), disabling Fn key handling
>>>>
>>>> I get this with kernel 6.14. Fn key is present for sure and it is
>>>> definitely not disabled since it works fine! Same applies to the
>>>> onboard Fn key of the laptop.
>>>>
>>>> Looks like the detection logic needs some adjustment.
>>>
>>> Was the issue present with older kernels as well? And, is fn toggle working
>>> as intended, i.e., is the log a false positive?
>>
>>
>> Following up, it would be better to get the hid device recorded.
>>
>> Download hid-recorder from here: https://github.com/hidutils/hid-recorder/releases/download/0.6.0/hid-recorder.zip
>>
>> Extract the binary from the zip file. Then run `sudo /path/to/hid-recorder | tee hid.log`
>>
>> After running this, choose your keyboard for recording. Then spam the fn key multiple times.
>> After that kill the terminal and share the hid.log file created.


