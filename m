Return-Path: <linux-input+bounces-12985-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0986CAE1E1A
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 17:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F2B61BC2656
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 15:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A36F2BDC03;
	Fri, 20 Jun 2025 15:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="UpfMTHhu"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011028.outbound.protection.outlook.com [52.103.67.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC7F296169;
	Fri, 20 Jun 2025 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432203; cv=fail; b=No/tuiRrv9xxXGH6k/YtUhJ8RaOyWimV7DbhuhHr5VKL746iCCKp+UW2KGmwu+Djv64Cm0h3U30LeJV0aV6FzI49CQpnUynHNhSE0a/C9MVOtr2aYAlErsmAgTzyucR1/fHA1WKHoTtH/fxGOGrCR2t5fPskmgo9E5MssfunmV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432203; c=relaxed/simple;
	bh=fggrRve2ZxKOPCbn8vzQxvCsxSOp9zdGwpW7ra5jnI8=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=T8vK7wrP7U9WcbCJOsRWj1EFLusw+jsmzObwFQgfh6nAorzrPVkU90PUwxFfCRk/fZV0ILEtWUd9rKFIhaveveYTCaGarRZMmjBP5w0Kj9Aj/bcACLNpM55bVzd6HJ3E8oDxGtKeUz+uWMr39t73PzO1WiGvps/IpVPAM04aQUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=UpfMTHhu; arc=fail smtp.client-ip=52.103.67.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XidqIceopBUlg99RBLZ4JV3iBQXOm8xFYHW9WfJ9J3k806rr3w5HzggWgg1DVUrA2WWO2N0Cc1GsXYJsP2woH3NOVAv0ro9R32L8/7FYa1aB2KsS/eTs8W39ys58XQp8cH0jctbaxzFgwZHSih8cz88xYCl9Yk37hWxI2hGBC9jtjDWmOOfoD4GIa6Txx5q3shkNTdf6YOQmsf+jUWaYRkvcX8lwLuRGgpdMK/yFb5wZIo3F5V8xaNtrUAOiAq0x4ga9P7YMB1h5gQBcMkTf8O5nfRczqyvm6O+yDyXo9NvLr99gZYhnurkvlGEz5ZM9j1CKppHbuIjWkLDQmFXRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqKa0wY4bV3NTq0yibhAhBLHkogLpa1XKd1fHX8tdGo=;
 b=Fwndsi8PyrBOhhexkiGTsurvrNYWsUYXsZMGqZ+d1GetnAkYEQN9yI1Q6Wea1B86d0ARONjVgRnFTRRqwQUwXkt93tU3mtaw2oyRc8Vdgw47RfUxhhV9Dv71jJ0noAD0l8+MNe8n99Hlr3Y4aVnEC+KYfGJzkVi25E8XE1MXmw3CpqB8j28VYLHQ2pbzKbr8PYQWlLUaPo/Zd2VQMIoRHC7Z5ddf+nIhGLimHGguAn8y7uMLhXf34ms5XWJgdG8Wh1st7bs8TVYqOQOJKENyDYqPODPnlNAFy1eBvorXv5q1oajCm6IU5dsNcEgQzixTz0sPPIlXCdvp5X4NDKyxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqKa0wY4bV3NTq0yibhAhBLHkogLpa1XKd1fHX8tdGo=;
 b=UpfMTHhuJKizgaT68UO6kRRInwg+t3Et4N4MOeZrdLpB6Kh4usfXWCasPuZ6bdeLEGSAC7QiQCteNhb16JuEN1vtOOtvQX+aFLiBklVu3Jtgn5upr+lx9GHiPCGfP1ug0dZvEmGOgVmgVcKNTbKGGQoUfbGjJVS/fBKoVfhycgetVN80GsQawoIx/vhFGHtzPDgY+C1SqsVrCSrtEqswp987Gojipxu3Mqj/ZibKL3m8v+vP+7FbMvvACInCVgdZkZvjzfiHLgsap0aiL5vidxmH1blhwmqGLfdlf7BZES6MnvCls3Y2EIkkQzqMGz8FqkaEpnNpFgbcwaS57dBtdg==
Received: from PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10c::9)
 by PN3PR01MB9872.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:171::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 15:09:58 +0000
Received: from PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5b05:29d:5646:39aa]) by PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5b05:29d:5646:39aa%7]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 15:09:58 +0000
Message-ID:
 <PN0PR01MB958896253AF96FBFC2C3F743B87CA@PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 20 Jun 2025 20:39:45 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
From: Aditya Garg <gargaditya08@live.com>
Subject: [PATCH RESEND] HID: magicmouse: enclose macros with complex values in
 parentheses
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0027.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::16) To PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:10c::9)
X-Microsoft-Original-Message-ID:
 <6058720c-7263-4f6a-8982-1a35529921a8@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB9588:EE_|PN3PR01MB9872:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf67848-8117-413b-e4b0-08ddb00c83e2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|7092599006|8060799009|19110799006|8022599003|5072599009|6090799003|5062599005|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dk5sbGpJOS9hcjlPZlVEVU5OSnExZWZFcm5kZ2NLdFQyQmFhTXZ2MTF6NnRI?=
 =?utf-8?B?a05JaURJNmQzZkdzM1JNcGhSb0ZnSU9FZHBqaEk0MUNubHVLOEVJQlB6WFZM?=
 =?utf-8?B?eTdKTmE4SVdDOE1RbXdVRmRFbzNLUXBGckF4NHloTVcxcUFyWjNYSVJjTWg3?=
 =?utf-8?B?K0VLeDcwTDRaa2ZuMjB1VUlmVlNkeFV0N25DdzhETTdIL2hVTmtKV25JMFZE?=
 =?utf-8?B?VWZONjRFWkhwTjhhMm01UDA5YkNDYWFCOVd6TXNidDdoaWtjUTd5YW9va21w?=
 =?utf-8?B?OENyREFWcG5VeTcwMHJHeU93YmJTMGQ5ZWdaZVB5eERFTDBWWlBObTRxditx?=
 =?utf-8?B?VjVVOSs2Z2VPd1paMVZvemh3bmtpL0NOWXUveVVJTG5pd3REaFl0WCtGdGNs?=
 =?utf-8?B?VlRSTG1sZ1ptMTNaRk9oYTJOQXhRR3dRWGJaVUNRNTdXNFJnRlJvaHl2Ync2?=
 =?utf-8?B?Y1Q3Zm4ra2VxQU55dWViZFNmN1RzdWpLT1FRaWNZd2F6N3B6blJsd1ZGS0x3?=
 =?utf-8?B?ZU8zL21Cak5uR3huQjFMZmFSYjdENHZISk95aWUrMG1zbDUrLzY2YUxMRi9j?=
 =?utf-8?B?WlZaMHhpVjBaUGlBU0MzelBWZXJNVmRMQ2Rud0kwSDBSQVg0V3FHUGxIdXRN?=
 =?utf-8?B?OFQ2SmZCdXp1UmNvVHg5YTFmS0NFZUp2bEE0dkY1ODhBUEI0NDhUdWx5ZWZq?=
 =?utf-8?B?U2UrSTFValZzUFBHUVllbmZ4Zm5sQ1RwOVU1NmtYRFJqUzJhT1U1Qnh0NnJW?=
 =?utf-8?B?Z3MzclpoS3dUaEc4SjRXWEh0b1djWVo3cVlvL1NYUlVSL3RrNmhJNWx1Vms1?=
 =?utf-8?B?M2xYRjc2NlNCcnhYazVCdWJsYUZ5OVp6OHdRNXpoZHRoN2syTEhmbDdUR1Ar?=
 =?utf-8?B?RlBydUpENmExeWpySFRhc1l2WUZhdnhzV2JDbnpHdGdHS0JvREt1YURaTFZi?=
 =?utf-8?B?RUpLcmRQK3NPMFUyTzgrSVUwMWlCSitvQk0zTEhVcnkyQURuSUI0YXNDbVpL?=
 =?utf-8?B?a0NZb0NoU2h6L1lqc0dKaGtTNjlWTDU1WHRYcnVQeGpmc0dnS2l2WXQ1Si9w?=
 =?utf-8?B?ZWdaVE5rT3N5c3VzS2NpbmRqZXM4RzNKclZnRzAvemJkaVRXbTR4Z29KeEtS?=
 =?utf-8?B?U1EzWS9oL1FIWmEzcGFJeTM1dzhBV1ZSK3pOQ3JEMzNVZ1E4SFd0REYzVzRX?=
 =?utf-8?B?WTVtSFZJQXl6ajJmdzhPYUczSlhRMFdOT1VUUFZEQlE1Ym8rdEFWZGdkNWpF?=
 =?utf-8?B?N0NGRWJCMjR1Tzg1RFZpU1pYR0J4UEpod2w3UGJZY3JHQjRSZzFGZm4wUmJr?=
 =?utf-8?B?dkVpaG9zYitiaHMyU0FaV2dUTW02QnZkc05JOEFEb0NKaEFFOVpnQTgrQzVH?=
 =?utf-8?B?U01uNUNmL0V0RkFWNWtVTS8rcE1SOXYxNWJoY2JNekNDbDNXTGoyc2pHYVR3?=
 =?utf-8?B?ZFVKeGRLOGtaY2ZLclkxVXcyRlhoeXlQUEZFWDFEajVpc3kybThsTWYrN3kw?=
 =?utf-8?B?ZkJZenpVMnpGMmpsLzArTUlLTjZxYWlhbjBIRjFudk5YaXg2aEtMb1JDai9C?=
 =?utf-8?Q?dth8I6vuai6oglQz9oCPMIxoez11nVGAPbFwYUAflQNmoZ?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFBIajZSZ3dBSWxLVW1TN01hdzdDRFlVTHRFVmVyMFYwNGUzays4dWFST0w2?=
 =?utf-8?B?V2RQVXJFVDVBNXhsUWlMMHArMVBSeWJFMHZ1ZjdCaEp3YTM5S0Q4WHhHQzZG?=
 =?utf-8?B?VXB3QUp5dmVkUDFOSHBZMnNkQlZndHZ5Z2hQMS9GZEpzVCs4UlhGdnNtY3VT?=
 =?utf-8?B?RjN4RWdwN1haaEJPOStJOTV0OVBBRFp6OGQ1NVV1SFZoUVYzRW0rRXZTZEdm?=
 =?utf-8?B?a0VvZUsvclFEN3FxYUtvcXN4Y052cDRiUHVHWVBXNkdFQ3hyOGdaZWFjamtS?=
 =?utf-8?B?b1NxUk1VblVFZUovU1lOY2lWSUt4WEtmWTR4cmd5UnQ1bVBUd2svZm9yQlJl?=
 =?utf-8?B?QkdwSFI3dkZSY1VHM0hNTXJBRkZmS2o3ZjJPZjIyeThneFBDb3liRENoWFc5?=
 =?utf-8?B?MmZ1SW9KbGtjUW9oYkJzbGpGMll4S1JWRko5aWxXRjlTSDVodHZ6YTV5bkhY?=
 =?utf-8?B?SU9iRm42VE9TWXBSaERZWEFuR3dCRTBTZHoxNEFjaFRmWm44Mmd5NWhpS2c2?=
 =?utf-8?B?Q04vYXMrZGxPc1NsVmMrMGZQVEF0ai9jeURHb0U5NHFtK3lPeDlkY3BlTnZH?=
 =?utf-8?B?YWJvSVhsYlVJUk81dWpFR1daS3FXdDk1ZmhZRE8vUnFXdEFzUTNBdHBVMG1h?=
 =?utf-8?B?TVZDUk5VYU1hR0ROclBScXQ2dmQ5SVdCbTJ1d0pESVJ4UEFGbkhIRWM3MWxw?=
 =?utf-8?B?SllsbHR4L0cyK2tzRnR5M0E4T0t6YTZ1SDdQcUNMbVp4Y1JzemxveEdnelVV?=
 =?utf-8?B?Ym16K3dlRG5XSXVkeWdleERxektmZ1lkNU1SeURsTW1telppYTRHcHpkVWsr?=
 =?utf-8?B?THRoYURDckV2dU10L1FVNVNBbkNYQ1RsS0hQNHorRk9qVTIrcGZMSVN0MDI5?=
 =?utf-8?B?YzVyOGhHUEowVXZqV3RwdGR3WFFQL1pDRTRmSHhnY3R6Y0w5OWd2dnB6NHFT?=
 =?utf-8?B?MGU5eFNBWlk2Y2hnSm5YVjl0NUIyQkFEVHBGZ1FjdCtBaThYL09xSU0xSnUy?=
 =?utf-8?B?RlhzS2xGOFVpV1RIMFZkbDdubHVrdmJPdnhYS2V1NHVjSmc4OVd1Y20vRitX?=
 =?utf-8?B?MHdRSmtRZmFJd1BWRllMYnFKYVo2czVQT3ZBeU5BVkZpeXJncU9hQy9kd015?=
 =?utf-8?B?OHFocldFMGdna2dZdklNeFpHVGtxNVEwYXdCSFFKd2FPZWNNeVcrMWoyL0dy?=
 =?utf-8?B?SFJ3SkNzNUxQVUk4Sy80WlJjZW10ZFBmVUdmNCtmNjU2RXBpMVhucCttcTVJ?=
 =?utf-8?B?TlZGMHpISGJMYTdLN0dKNlVlS0JpUFRwVTVtQysvakxuaVU2WmRrbHBrb09a?=
 =?utf-8?B?Y3pZZ3NKai9mWWM1OWxKWC96TFRubVk0YXE2bTRzNDF2K01CVGVIMGk0azY0?=
 =?utf-8?B?QzIrSWRRTUs4dktCZWVvTys4NW9Db3dsOE9HZHkrK1BBMUQwL0E3azFkc3lz?=
 =?utf-8?B?V3NuTjNRMVpudGtQVWhEcG9Dakl4ODFuaVMvY3c4QXZEeDZDaVNWWHd5OG14?=
 =?utf-8?B?N3BIcU50WGpiNVVKSlZ5a1BaU0k5TU84RkFQV0JudlhnOGM4L3FoZXdmZEcr?=
 =?utf-8?B?ejdsUWg2enVIeUt6STUvZmR1b05wWkE2dGY0OEE5K2xJcGk0MzZzQk1IRkVY?=
 =?utf-8?B?T3R3NnduajFDT2p5YitvcHZHOFNrV1FJbHBvTE5LUXNDN2RNb0l5TlQ3cExS?=
 =?utf-8?B?c1BGNUNUZmVjUFc0YmV6VzJYcVBxNHIvdVFuTWRmZGdYYjk0Q3hFVCtNQThn?=
 =?utf-8?Q?j5WH2pGM/jrcM4deFA=3D?=
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf67848-8117-413b-e4b0-08ddb00c83e2
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 15:09:58.4132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9872

Checkpatch reported this error:

ERROR: Macros with complex values should be enclosed in parentheses

This patch is a simple fix for the same.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-magicmouse.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index a76f17158..d83909761 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -81,32 +81,32 @@ MODULE_PARM_DESC(report_undeciphered, "Report undeciphered multi-touch state fie
 
 /* Touch surface information. Dimension is in hundredths of a mm, min and max
  * are in units. */
-#define MOUSE_DIMENSION_X (float)9056
+#define MOUSE_DIMENSION_X ((float)9056)
 #define MOUSE_MIN_X -1100
 #define MOUSE_MAX_X 1258
 #define MOUSE_RES_X ((MOUSE_MAX_X - MOUSE_MIN_X) / (MOUSE_DIMENSION_X / 100))
-#define MOUSE_DIMENSION_Y (float)5152
+#define MOUSE_DIMENSION_Y ((float)5152)
 #define MOUSE_MIN_Y -1589
 #define MOUSE_MAX_Y 2047
 #define MOUSE_RES_Y ((MOUSE_MAX_Y - MOUSE_MIN_Y) / (MOUSE_DIMENSION_Y / 100))
 
-#define TRACKPAD_DIMENSION_X (float)13000
+#define TRACKPAD_DIMENSION_X ((float)13000)
 #define TRACKPAD_MIN_X -2909
 #define TRACKPAD_MAX_X 3167
 #define TRACKPAD_RES_X \
 	((TRACKPAD_MAX_X - TRACKPAD_MIN_X) / (TRACKPAD_DIMENSION_X / 100))
-#define TRACKPAD_DIMENSION_Y (float)11000
+#define TRACKPAD_DIMENSION_Y ((float)11000)
 #define TRACKPAD_MIN_Y -2456
 #define TRACKPAD_MAX_Y 2565
 #define TRACKPAD_RES_Y \
 	((TRACKPAD_MAX_Y - TRACKPAD_MIN_Y) / (TRACKPAD_DIMENSION_Y / 100))
 
-#define TRACKPAD2_DIMENSION_X (float)16000
+#define TRACKPAD2_DIMENSION_X ((float)16000)
 #define TRACKPAD2_MIN_X -3678
 #define TRACKPAD2_MAX_X 3934
 #define TRACKPAD2_RES_X \
 	((TRACKPAD2_MAX_X - TRACKPAD2_MIN_X) / (TRACKPAD2_DIMENSION_X / 100))
-#define TRACKPAD2_DIMENSION_Y (float)11490
+#define TRACKPAD2_DIMENSION_Y ((float)11490)
 #define TRACKPAD2_MIN_Y -2478
 #define TRACKPAD2_MAX_Y 2587
 #define TRACKPAD2_RES_Y \
-- 
2.49.0

