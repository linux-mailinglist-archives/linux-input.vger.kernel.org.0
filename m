Return-Path: <linux-input+bounces-11719-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1086A84C44
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 20:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 881A44C4F74
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 18:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5599F28EA4C;
	Thu, 10 Apr 2025 18:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="FeY4ny14"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010003.outbound.protection.outlook.com [52.103.68.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C9328A408;
	Thu, 10 Apr 2025 18:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744310589; cv=fail; b=nrxGTGu2OorTcklGyoDLO6n+5PMMAxTuzYsy9Z9ps0f8tyhf0ss/6TxsE+OyfhwkjwvO9aQZJrzhyv3/mTEGi0geNqqFiVsr7XKYeeeKAVLUJ6UFgaYJ5UNFiqeDo8u8dv5eWKY0nol//BSgC9GeyvBMGmwq46GyJZCpC4dJKs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744310589; c=relaxed/simple;
	bh=EHwPX8gegZwSG3mNJuxoqQNkqfHpQY4vkEEEeYf2Qng=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bXiiIx33RQ23xSuhPw6ZWdzDaySrRsnMebQXjBYMVFH8p31Kk39/tLZE6b99WFQ6hdpI+lmUjKR+oGEprP1OIRtpD65sU4j4YW1zkdAKf3HDZ+adt/G2Il0tXP+4cbYUNNywdwtU+nPfl91v7ge/5PmRhvkByjcLPJ21vbSp+9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=FeY4ny14; arc=fail smtp.client-ip=52.103.68.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8VWjxk/UA00Uv/dj/8cd29lHfhs4KQyryVfkCSdwgpaSeqAx9FeZjVNx1eX08kBwq99vaM3dn5J7nXHklb0ECYyraU9/FnmTJ8cYXwq+ZasdGxuvwwnYLe9JnXqKkwZYIk2qX+vE1UZjaUPE2vTrBMYRIgJsJ2+SPrNd5gQ4HBbNC8478bk3ekzVX11VUuOxGSDuVEeDAI8vzG2Rmvul28Ax43mfTtkXRLOR6a754rMmTd8lWYDgtcXM2+mS36cJUckWAc1HrIs07SSC4n/fI4HOfXzkh4RiUGB5OLRU3cpHQTsO1ztUMhyjgt1TmDG9yCjIf5wEEoeh/8L9/Y1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMVgzXdkdM6NNu0I+cV+Xrb5YDpOIFrI7g0gJwXU5UE=;
 b=NhRtrWyxqx4q8QMKFa6ksVV7a41PO/1eHOInVBLid4ggfbtj7EMtxqaBwQWd6InvBGLxgAc4b89maZZOjrS9Gz9vRkOONzM3zqIZXo8+sve3dJzVtlmCjcmU5JB/DK+WiWNfmlGpPsnPC2cmORD4MjMEp/B74FV0e4x+knkkvtx0hCFxzDHfMfvwG0mu0/njawq3sNDap3VQpVCD7jiMVEWTYba99IxdXdpA9oclUVE1HD9ooHao4iKvIRHkqNNOm4Uef6RE61oJ9qEJiTs2UB+cL2R81AludZpoCan95nRkEEZNUcOZbNEH44qleN3i0fSdqhxADmkFqZqz+Xr8gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMVgzXdkdM6NNu0I+cV+Xrb5YDpOIFrI7g0gJwXU5UE=;
 b=FeY4ny14qQ/dAqCmMITa81J973JJQ+u8n/KZWdR07YaTvRQDE4YZhfNaexzjk7Ao3RlMvVEtXmE+051ybYNLQnTDjw1zSQ1PsgO1M2HdytIZ4W7tP8iAG3BLIqL9ZJiN1vRY7gEtgvLUvFB/+2R0x00HYl/TUa26k8SAR/wRsmpzKYdXHz2MGKEZc8fvapPz1aqm8pQ35PFlGjEj/ljyNDAxvxhRCxkZBvin0anVg6md30hLw4E52e/pjFGLwzKlgJqzrh0Jv5N91OdyHLvoQmqpZk5AStliOemVjzeBGk6lwD1CdjlqT85SbhDTBVLqB1/PTQqyApoxfnXY/C0dAQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB8880.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 18:43:02 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 18:43:02 +0000
Message-ID:
 <PN3PR01MB959768118E9A5D6EBFB84802B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 11 Apr 2025 00:12:59 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND v2 2/5] HID: multitouch: support getting the tip state
 from HID_DG_TOUCH fields in Apple Touch Bar
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
References: <PN3PR01MB95973D930911AF73E262F299B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PN3PR01MB95973D930911AF73E262F299B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::9) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <15f03d9b-36aa-4e43-aba6-1a5af6a87cd1@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: ad118372-0525-47e5-1d6c-08dd785f862b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|7092599003|6090799003|5072599009|19110799003|461199028|8060799006|3412199025|440099028|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVF1bWpqMHNLVndZY3ViK0dOMEh0d3h1VXlsZFNpZEpQTzByVEVFbXRaeS9N?=
 =?utf-8?B?YUlyenlHSVpxWHMzM0lLZDJrWmVLRDJ1S1ZiUHVjcFRpS09TaTV6UHVFbGM0?=
 =?utf-8?B?b1A1S3NENWc5ZmRCL0dvZ2JpM25KNTZjajRmUFFzWDlyS0o3NFV3ekNoWVdv?=
 =?utf-8?B?L0liU2QvcGpWeEZSY00zVnkxT0pZMWthbFhsUW0ybzdObnRJRlBuSUg2YUh6?=
 =?utf-8?B?TThKTjVLMzNBVGJJMk9Dc0VNajZVSXg3Q0tMUnBuM0RCYlhHcW8zSVk1aDFI?=
 =?utf-8?B?U1R6YnJhNEtidWxSRlQ1ZEFZdkE2SlRHdDlMTW1lekR6ZHlRZWdXTEduQ1BW?=
 =?utf-8?B?SFJpK2czcm1vRmdDL1RFUnFqUzZKOHg4UEJiUVpER3U2aDVWWDFYYlF5RGF5?=
 =?utf-8?B?SngzUlNySVpJSlRuN3U1dFNZaDBINkdlZDBhaWFHMzcyY0VyWHVCYzFqSVZH?=
 =?utf-8?B?ZW9xL3NtOEtOOHBsTUJqVGxXUVFSZjNXaVpieE5CYnY5aUpjbS9HdkZWNVpq?=
 =?utf-8?B?WVFJcVl4VzUxcEpOWklkSEQ3WHdPZG1ydHJlb2ZUcFVoQ05HcXovelBIQXpT?=
 =?utf-8?B?Yy84MUdINWJLalRMblgvZE5jNStqK1RkRm51aGR5ZTErQXlBWXUyUnNXSGtJ?=
 =?utf-8?B?WnZTdFZsazZNQlNlK2d2emZ5b092T2NJdmw0NWpQVElhaEJ0c2FiOHFBVW5P?=
 =?utf-8?B?NXJGaDQrRE40MGlrOWNEcno5aXFhZHFjeXgwWmVXL3FWRjdqL1hhbWJLUU9U?=
 =?utf-8?B?SXVrR0pPUXRKWC93SSs0TXFSRThrTXRjTjFwM1kzZ3hFWjBvQ081S3VSc3VS?=
 =?utf-8?B?UXhCd1BhVE9VT2hqbTBCK0lpVmhXTGIzREFZOU54YVlZZ0kzM3hsZ0ZPM2tu?=
 =?utf-8?B?TnNQZm53VjdOS0lOTEFsem8vMjdkVnZXeThKeHp1VVM4VWxiQitOdmg5bk1M?=
 =?utf-8?B?NytnY1JCTUo1eWRrSXJMUDVBM3FWd0I1VGtsbTNQNTV2RTl6U3V2aG5peUJn?=
 =?utf-8?B?L2xIMzNobHcwWDNkT3hDTmM0ZEVnOHJGK3ppUkxHYzRjSm1ZVXF2TU9YTklw?=
 =?utf-8?B?YVR3TUlhS0pDcnN4dFdqR1cvaFgvN2dHQ082MGo4WnR4cVVwSXRHcndSaVFF?=
 =?utf-8?B?Mkh5MW40N1A2MUd4WkxFVDcwckdoSXh3dXduM1ZJVlhTNG1wT0I1MWw5dTNn?=
 =?utf-8?B?bVJFVFVxdGtyWnMvQ1B5V2VRRld6SVRQaWlaWkI0THlaeU1MT2JvSmJnRHZu?=
 =?utf-8?B?bkVzRnZaZG8xeUs2QWNsQllsR3lmb1huZDhiamhPc211b0ZrdnBHY1JqT2li?=
 =?utf-8?B?MWM1aDU5U2pPMUozWUdJNXlkYzBPclJHQzNJUDRDMlgxQnl4dlg3VzMvZ2Vp?=
 =?utf-8?B?eEhFbTh2YVNNT1JHTE44S0JCY0Q5TzFMZnZMTVJzbGJ4NW5jT0JOVXNMSFlx?=
 =?utf-8?B?WXp0VWd2bGNmSWJFQmRjMnZOR04weVk0UkpEUys3NkN5YWVJTGVPQytKY0wy?=
 =?utf-8?B?RUFuMmcvSjZCa0plYnEzVGxPT09hQWZGWkF0aEt1NGlaYlNFeVIvYVFlRG9z?=
 =?utf-8?Q?7ZV9U5ouvPTrYpLxeODe/cQt0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0FocDhzWE1sSnZjQVR5MmRNMDh4UVZRSDRjSEc3OXNJOWF0UFR0ZVc2L3N6?=
 =?utf-8?B?STBNYitXNDVLMVpHSnpBbzV3emdGUEtHV2pKbkpKT29IR3Z0OVBjeW9MWGdO?=
 =?utf-8?B?cmNLcVMwYXhwWjV2Q2hyVFg3c3RxSmNWVEtIbncvQmZWZGpzcThMY1NVTzg4?=
 =?utf-8?B?REdGNXlvSWhjMEdRZXFIcVpUcWVSOG1JZkRKQUVUNlBWUnlCRnlRTzNhdjZQ?=
 =?utf-8?B?SWc1R0pTZVVteHd2d3k0UjNwSStDd2p3ejNVcWdpRUVSaExlL3lGbkRRVWlX?=
 =?utf-8?B?UWN4T2pyTEluSjNpSFJjeDhOUXJ6Y3VXSGgwNktySFIzVFcvdnFxaThiK1cz?=
 =?utf-8?B?TG1BN29ZTy82QVZyNFBhZVk5MC9Fb1NGTE13clhuZUFUV1ZjVTJXbnNhcVhz?=
 =?utf-8?B?KzRsNW51ODJINGtVN0o0ZmxCOGQ5VHh1M3cwa2NDaHVhWVVsaXB5MzJuTW83?=
 =?utf-8?B?UURvdnBFcHF5TjlBODA4MDlHekd4UUdDQUo1U1M0elUwNnZZdWhITFV2cEZR?=
 =?utf-8?B?WStScngxeWM3Q1NpKzRuVFk5UGRIV0NObFB0TTlYZ3QvdzBVN3hDNTVTS3lh?=
 =?utf-8?B?SzJHRmZKZVkvcGIzd3lpWTVSMFA0YTZ5d21GNmRPR1JuMVBPbkF5Ui9ZZTJ6?=
 =?utf-8?B?UEFSL0JOYnJ5RHpGVUFKaWdldERKVEJuTGVsNEx2Q2tXalNKTjR0MmRzSFFn?=
 =?utf-8?B?UmxQRnFjVEpYMWduY3lRSTFsNDAybE5UaVFmeWV0SXllZm5EK1JEcGJrNktK?=
 =?utf-8?B?SWVlaGhkQzRPRkcyeXJSWW54SC9OZDVQRXVIRU9INnBaRDdsRCtMUlBlY1VI?=
 =?utf-8?B?bWdBQnJHUUFzSEwyUEkzTHRBN2FNamRpYTZBNFQxOGxHc3NIZiszVEJxaDBy?=
 =?utf-8?B?SWU2dng5L2VlM0lJdzJPSkppYlRuNENVUkpBRVJ4R3diQm0xVVYxRHRuNXY4?=
 =?utf-8?B?dzcyYjBiaE1nQzRYamFzcHduKzU1MllVQW1zZnFOU3ZqOWxPc3VhMEExNlBJ?=
 =?utf-8?B?TkZWUXh4ZllmaktTOS9NTUlUTk1laW5wL2FiZTlCWVJNTGJuMmVJSTRyU0Vo?=
 =?utf-8?B?UjJXZFE3YUUwU3hsRFBsdWsyTEcybWcvdHVwd2FJYnlKdU1Pd3dvc2p5YzBT?=
 =?utf-8?B?U1F6a204SGRmczdTdUhaT3ZTM2JhSjMzNzl2RHN2czl4M2lHbDFlQk1LaWV1?=
 =?utf-8?B?VXc3UkdBUjg1NmNvL1ZucDkrbkJQOXc4dGJLbFMxTE12OU4vNXhocEpaVmlh?=
 =?utf-8?B?dzFQRlBpaTMwb2tpWkdHQWFQTGx4NU5iVm9FL0RqYmF0RFFUWnFEMUZtNlFw?=
 =?utf-8?B?M2RkUnUzUmxnUzlwbGxUT2hRWXZBNUFBQ1BoeG1jdjJKUzNYKzdqQm9Td0lD?=
 =?utf-8?B?dk41emVOOXI3bFFNa25FWDlKOFlTZU9CbWI1dWZLTFFmTGxDZEc4blc4WUYz?=
 =?utf-8?B?cW53UDhIS2NlU0VpTnJtNWFQT1c2YU9rK0JYZVhjUmYyUndIRmtPcFh1akRt?=
 =?utf-8?B?L3pXdHBWVThkUlU3S0M2K0tkQnMyUmJaVUxjWlNqNEdTZEJaTkt2SGxPcTJa?=
 =?utf-8?B?d1dPMy8xa3hMMzJtUG1EaDIwa2pMZGR5WUZhM1Y5N3Y0a09GU1JXWGxBenJz?=
 =?utf-8?B?cGZoQ1p5NkVoRmNiRG9Zd0pUVmN3TTV4aG5Ca0tWOTYrRTdMeDY1Q1FaYklB?=
 =?utf-8?B?RWxBNEFKdzV0VDYwRTNURmR4NEhlSEoyTDhIOU51Zk5aN2pyWFVKTVlDdTJ2?=
 =?utf-8?Q?zUqekAMd1/24j+IgKd64+b5ngj75qTbWDjImRCs?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ad118372-0525-47e5-1d6c-08dd785f862b
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 18:43:02.7307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB8880

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the tip state is contained in fields with the
HID_DG_TOUCH usage. This feature is gated by a quirk in order to
prevent breaking other devices, see commit c2ef8f21ea8f
("HID: multitouch: add support for trackpads").

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 6e7f34a47..70fdd8cf9 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -827,6 +827,17 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 
 			MT_STORE_FIELD(confidence_state);
 			return 1;
+		case HID_DG_TOUCH:
+			/*
+			 * Legacy devices use TIPSWITCH and not TOUCH.
+			 * One special case here is of the Apple Touch Bars.
+			 * In these devices, the tip state is contained in
+			 * fields with the HID_DG_TOUCH usage.
+			 * Let's just ignore this field for other devices.
+			 */
+			if (!(cls->quirks & MT_QUIRK_APPLE_TOUCHBAR))
+				return -1;
+			fallthrough;
 		case HID_DG_TIPSWITCH:
 			if (field->application != HID_GD_SYSTEM_MULTIAXIS)
 				input_set_capability(hi->input,
@@ -897,10 +908,6 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		case HID_DG_CONTACTMAX:
 			/* contact max are global to the report */
 			return -1;
-		case HID_DG_TOUCH:
-			/* Legacy devices use TIPSWITCH and not TOUCH.
-			 * Let's just ignore this field. */
-			return -1;
 		}
 		/* let hid-input decide for the others */
 		return 0;
-- 
2.49.0


