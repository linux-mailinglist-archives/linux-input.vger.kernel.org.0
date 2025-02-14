Return-Path: <linux-input+bounces-10054-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43915A35D4D
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 13:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A57077A16C4
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2025 12:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D775725A625;
	Fri, 14 Feb 2025 12:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=skidata.com header.i=@skidata.com header.b="b9B1xKXF"
X-Original-To: linux-input@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11012062.outbound.protection.outlook.com [40.107.168.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F492139A8
	for <linux-input@vger.kernel.org>; Fri, 14 Feb 2025 12:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739534977; cv=fail; b=S2jSZxJ98+VUa1JayNHc5AQDuH2U8iNAJtfExq7KoJ8BZp+dTWVS60dxOYYD27kVTjpGUwbbx36crM/gmgYmZZblxxE1gdwdWCVexaJmP2NaSsTWHYNoH5yc9ggmuiV5SsdEBDUOUQ6oEwJxl0YJcvdlTqNataJqUGQlzVK8adc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739534977; c=relaxed/simple;
	bh=lTP5tI7fO6GBZvfHzdtb16be2Q9Bhf2Qo3EC/dU1mzs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c2Ytb3kwYaPKU/BEzjNVy8gFujGgCUDS+zFl6G1aXXTR/r0xGTVW/f3HcuOjlOdScNBKnYJitRPifiqkiDDuCrDuS6qd0PlHkW2ISWtMrAYIC2LTY2yJnXsl69mUtoyjlNprfeKhdNrV0GCKjc8ou3XstjiYZl3JN3dOB2vC0fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=skidata.com; spf=pass smtp.mailfrom=skidata.com; dkim=pass (2048-bit key) header.d=skidata.com header.i=@skidata.com header.b=b9B1xKXF; arc=fail smtp.client-ip=40.107.168.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=skidata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skidata.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEppl+BHTC41BvRiFxsub1HfZriudf23CpW5PY9peCB0XVzMin/bBtp2NFXCTNNU96gKGnuq8nNXxcT0sXzk09wuulBHUKG4uoiutPHea1VqTLIF7Ocyq3AnuKzmg0XtyRTX9h4SL8ydwL8pIxoVd4Ag4BGvaFBUN42twxOOB8X7+GtQK0Gc/v2Mb6RLfa651+REJyWG5BYTI2w16fMcjvq+Do/LZByyGHxHmsYY3xRxqzJtWJ/btdFndUhNhRkYoHKnDgdNP24a/izrBtLrtBk/VNiG4q34AKR4pt16xAu6L9uI5UY1U/bwjAji3bp/OunlREMj5t3hIku8847yLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTP5tI7fO6GBZvfHzdtb16be2Q9Bhf2Qo3EC/dU1mzs=;
 b=HxBkyutR49FPkbr+4XAqlUxIwXpEGyMcw4dh1o7ytiqfrG6HWcVIEWW2/5O/O41cJK1NBxdszGezRmMuya/N+cNttMW27K68SbvUDa6i9IVq2ig+CFKgbzLXnGFaC5rCh4RwI3Vm+bVlcRHdQ9kPl8TQSx9C2wQnY49cDhA4Sj6LaFcms1hpStBSW/TPPQ2YNWXVpkyedS83UQYAxW6O6iYq6sAdz2s1l9bKSC/Z301D9Y1YWa46K1Ka10YNPy9RKqBu7qUjW5tqWnadml3uRfZDnRIQRNeRF6j/VuIdnsMqHp/cmagrBXSKzm8bczfyRll4Gkm1m2/UVFBRnJT6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTP5tI7fO6GBZvfHzdtb16be2Q9Bhf2Qo3EC/dU1mzs=;
 b=b9B1xKXF7oXghGKQLgRN3q7BkD9S8jkoKQGD0DRON4T55VNnPiBq9IqWVMKVLprLTVjHmnQU0c1wU7XWY5UoDnekznk6Km0m+MvJItwN8xzbszcKdNIbAuF7p0HZWOVneEkwwQ0SItJbLwZOT14qMD/6qHqZvDQ+dus0dqTH8BSVkwO96hVfxJjV41P2qbESFbnp/TP94Vi33Yc8D6lZyYtHpdINeBvyjYp1LGzKZvyGOiCMmXFzSrh2N2lB3uHBIUP4ZWipzA+/DCspVDtmjg/ktq4I8ESjjFLOReRpPfjzJ/v/G7CuEEEoY1LebZHqKhirLuuSPXchZ3xy+oQSLQ==
Received: from GVAP278MB0456.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:39::5) by
 GVAP278MB0907.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:47::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.17; Fri, 14 Feb 2025 12:09:31 +0000
Received: from GVAP278MB0456.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f5f4:4769:5e87:a09c]) by GVAP278MB0456.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f5f4:4769:5e87:a09c%4]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 12:09:31 +0000
From: Johannes Kirchmair - SKIDATA <johannes.kirchmair@skidata.com>
To: "mailinglist1@johanneskirchmair.de" <mailinglist1@johanneskirchmair.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: AW: [PATCH v2] tsc2007: prevent overflow in pressure calculation
Thread-Topic: [PATCH v2] tsc2007: prevent overflow in pressure calculation
Thread-Index: AQHbclTo68ulvArnVk2qcLLTPVVaZbNGzXVQ
Date: Fri, 14 Feb 2025 12:09:31 +0000
Message-ID:
 <GVAP278MB045630438175DC96E60F0C7C8CFE2@GVAP278MB0456.CHEP278.PROD.OUTLOOK.COM>
References:
 <20250129-fix_tsc_calculation_overflow-v2-1-9e51333496ad@skidata.com>
In-Reply-To:
 <20250129-fix_tsc_calculation_overflow-v2-1-9e51333496ad@skidata.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-bromium-msgid: f553ddcf-01e0-4a75-94c2-1e959cf4ba55
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVAP278MB0456:EE_|GVAP278MB0907:EE_
x-ms-office365-filtering-correlation-id: b81f7bf0-b441-4592-ec99-08dd4cf07042
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?aEw4dmpiaW11WVlUNXZkRjFuOEtzeURoUHc4QU0xRkxwOERNMkxMQ1JHS2lD?=
 =?utf-8?B?cHdndFFrSFNHVXo3SXg4VzZTZlE4VjUzelhvNCtRei9NRjNkMTdLN1RHd0tJ?=
 =?utf-8?B?eG9sZ0Q3QVRINmkraDB4WWtadUlCUUxHYk9FL2k4eXVxcWtkcEtJa1JFVFhV?=
 =?utf-8?B?NS9YcHZVRTE3ekRpTkczQ3hmUGtIM0lRNm5yU2lVRDJrMmU1Tm42TkFLd0tS?=
 =?utf-8?B?RHRaVWJJZjF4ZTJaaXI0NGlGVmpWbzFUalJSY3l1S3YwV1Z6NTlsVGFlaVNE?=
 =?utf-8?B?UU1mT0ttUE9CckxiWnBVUmJVTlI3YUJIakpONGRjMWlsRDFDQUx1eFZDd0Zw?=
 =?utf-8?B?eG44MnZqZUtVWGNycG9JOGo4aU50SURBZTY0UnJCdzJIcFFMMUc3blpGb0I1?=
 =?utf-8?B?SUZIQnZEQjByT2Vxc0o1eHBDUkcxMmcwN05RVFNBa0RqS1JFdVpIUlQ4U1p4?=
 =?utf-8?B?bkJNYVlPdVNJMDV3OWpRRUwwYUw1UjFCZGJldUIwZ0lJOWt5THVvSmwvaUR5?=
 =?utf-8?B?UjlhU1A3eURQNFFBNXlROGZLbWFUcEFVcXM4QjNNVVlQUUZDL04rblYvM0g5?=
 =?utf-8?B?OExpVWVGQnZNczZaNzZCandUUzgxZHFqM1lUSGZjMkladlFyRnpjYVh5OTFs?=
 =?utf-8?B?QTRGU3hhZUtzelJ1eTgrKzRLNk0zV0VVdmlYWXdUYzA1b09Ld1duRnNFVGpZ?=
 =?utf-8?B?NlpZcHZtUU1OYlpNenBHRkVXbGVLNGlPdjUxZUd4RkZLMUc2VjhmSXpRak1p?=
 =?utf-8?B?ZFo2TlhleTNtamJxUXhIZnR1dnBjOGNmbGMxb2xXRTNRb3RZZGxTaEdSSW5G?=
 =?utf-8?B?Mzdqb3hZcVJKUjNRd2Q5YnUwclJsTGhITWRxV0E0bmtKMWpzUERCYzA0R1Ni?=
 =?utf-8?B?ODBHdDJOVkdJSk9YaTYxcWQxWHB3N0tMTGpYYStBd2hlRTJtTndHc090bG54?=
 =?utf-8?B?ME9HaGkyYXJHK0VLNXROWGt2UGZ5ck56K1NGbzRTUzBnWTlIYUJYRkZwWm9r?=
 =?utf-8?B?RlVXbTUrQUJybWlucXp5YXgwT2JjbDBucDJTaFRlNVY1a1FFRXBqVFpKODEv?=
 =?utf-8?B?TTVnRlRpQTBEbFlHRE1Vb1ljL0lSdlNSN0ZNbGNPVzRUUUREV0VCbWVVRUJn?=
 =?utf-8?B?bFJtWjBSNFdYSzIybTRkeWVMSHdjS3dxcmtDdkpycHpXajVVK1QwMzlCUmZi?=
 =?utf-8?B?R2REVmtURGs0Zm82K1hmWndUYW13b1ZtQTBsRnlhckhiS1p6U3JsTFU5Q0tK?=
 =?utf-8?B?c2RkMXQ1b2g1UnNpMlBxc0JVYTR0TGZPUVpMWEJyVFhoUjVJN1pVU2RnQVlT?=
 =?utf-8?B?LzlNWWNTN1AydFRBaTRGZUNxMlhQQnhETkxvSjZwSUVWemM5Rmt2V0R0ak9K?=
 =?utf-8?B?MEF1WEgyOEErN2Zlb2dManU5VlNCN0p5dmE4bHE4VUxHL2daUDBMWExtYm1q?=
 =?utf-8?B?TlpvM2RwWTVmeWI5aFJvaTRCTE5DT3lFNG1sSStXSGRyY3VvTDhFN05sZDE5?=
 =?utf-8?B?VmVPRGYzQ1BRSkFTNEEyT3QyaWRYbzRLNmFBWGRQR0x5cS9oNEJqV1ovSWp3?=
 =?utf-8?B?YytBUmlWaENwSUorV1UzcmhyS1h2Z3d1eThMVTZKOHk2VjNSY00zWndwRmVh?=
 =?utf-8?B?R2VEaFBHM0xxUEdOa2ZyYVdPMFhheFRWaHFCUUZRMVFtTG5RSlNETDVnUzAv?=
 =?utf-8?B?QUR2WWMzUmR1WlVDZW0rNmdMeEkveHhGeTRlYmdVWC9PUDdDZUZieUp2aGdk?=
 =?utf-8?B?R0VEM2FpTkYySk0vWmdyWVFVT04zZTgvL2RTQWVSQnQ3T0NLVUFDN1JnanNL?=
 =?utf-8?B?K01lZnN2bGpjaU5PaGo1VVlGSGkvOUhVNWRMNm9pMDhWZ2ZUWTh6WGdhYTM1?=
 =?utf-8?B?WnZCVG02QWhmbHNBWllFQzd3WVZNeEI3ZVdWWEcvV3BNWUIzZUl4ZEFlSnBz?=
 =?utf-8?Q?aHtj3FxAYq3llk6Jkv2D9CPxJRZG9pd0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278MB0456.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NERpWlRjMjFEdkszdmtCYjFZTjNMY2dUZldJaEkvbjlSTVdjSW1odlllYnU2?=
 =?utf-8?B?MWlJSlVQRjc0NUtBa0pHWm8zbWZrTzZ3bjlENHB2aTRBQ29aMTNCeXk5RzA0?=
 =?utf-8?B?ekxiN0RNcTU0NGhMT1oxTWIwRjZCTjJna0tyb1lCdzFsTkpHRzh6WGV5N3hI?=
 =?utf-8?B?RnFwb3hrdjNLTFc1NXNqV2JrMjBGOGhJNGZnc2tHNithckRPMXM5MVE4M3Y5?=
 =?utf-8?B?OGRRU0VTcWJ1TWV3S3RHdC9wZjA2UzVWM2FIekJVMWFYNk1mTFVBNTZqZ212?=
 =?utf-8?B?Wm03THJheUtoaG40eDd1RmcxKzhGMExaTFRLWGR4Zng0LzlNUUJBTWQrMFlj?=
 =?utf-8?B?YStld1BqM2VsMlNtYkp5aEUyMFdzdGtiRVBpQVVMb2NNM0R0RUZ2SS9DS0tr?=
 =?utf-8?B?MEUxTlZEWkw0MWpoNTA5QVlDSTlGWGJoV1FGNEkxbTJhVTNvZ0pyWkxRZUxF?=
 =?utf-8?B?M2xkclA3Z2w1bGZBcmZZK0NMVzlNZ3V5bXNUNk9rMEJRR2gvMDBMMXRGdlNh?=
 =?utf-8?B?MTE2UENMZTFkcDBRblV1ckFoUDlyRkFBaGNVTmR0eE55RGdOSWF0RGVFMkgy?=
 =?utf-8?B?TU1SQndIYmNtUTExRXU0YkdWZnRDcm1YSzU0UGhTT0R6bnU0QTgwYzNvWnEr?=
 =?utf-8?B?R1VsR2k5QTNRdTFwVUlTS1lSRFJVMzhLZjlrL291NUlYNm13Uzc3NFVvUHlQ?=
 =?utf-8?B?UnZ1SU9mTlVGdS9EbGQxaDBXb242UjN2SXYzMzVIUkY1Nm5reGIwZ1prZ2dn?=
 =?utf-8?B?Qk5aN3MzZ1hlQ0M1TGwvT051RzlHdS9tWEUzYjAwQmxYSEVaZTFoU25jbEla?=
 =?utf-8?B?c0ZtSlVVazBlczk0RGxlRU9YUFlTUER5R05sV3AzVUFUTXl0TU1tUUNkZG5Z?=
 =?utf-8?B?RG94VkJLZmwvQ0RpdjFUYWUzdGFsZkZ0N0V4NWhybStXME1QY3d0eVlLR202?=
 =?utf-8?B?b0NMRTFOWHZJQWxhTWs3Tlh0a1EzSnhSOUcxbTM1Tm8rUU1CNlUwaUR1RmpS?=
 =?utf-8?B?M0Foc3JzQ2dDbmpwRm96c0w1a0ZwWUdYUCtHUlQ1Q1loRkdheHdGSmhzMmdW?=
 =?utf-8?B?TVlZUHNZR0IxT1FwYzNjU2pLZ2J5WEw1V2dNMFRqektrelNHM21VQ2FmdFRW?=
 =?utf-8?B?ZWtyOUhydXltTzFvRVJVRTJwWFJXQW5NTTJidjNwTkZTdmgyYU14MHJ1cGM3?=
 =?utf-8?B?MUJKWW1PRDJPSEtLK0haa3R1M3hJOThEUE1Ebkc2UmNqb1ZlYStoS0F6TGZw?=
 =?utf-8?B?TDNMeUJiblZlcGVPbFA1aGlDQnlOUWR6NmhxZHdOOFVkdmZNb0tmeTJralIw?=
 =?utf-8?B?ZlVXb3pKem4vMlF1SEM3VVpGR05YY0NNTmRiUGptYnZJcEJMRTJUM0xNY2Vw?=
 =?utf-8?B?WlJ1QjVvNzJmQTZ1YU5zczFtR3ZZc2xla25nS1NIQVFRU2dibUdycUlJYW9s?=
 =?utf-8?B?RW80U2owaDB5M0RZMzZETkoweVkzSDNremh4am5yRWdPbks1WDNYWnoyUVlx?=
 =?utf-8?B?aGlYVUJsT1pZbTFQam12RDFYQnBNNzRyK2VqOHNQTFVXWTF3Y0E0WmtUMW0r?=
 =?utf-8?B?YTRUaDY3YVVYRXNmREVQVXhoaHhMZnhuaFJIWkhBK1p3VWdCWDd1SjZYKzRw?=
 =?utf-8?B?QWhxRGVWNjd6MFdjU1hCRzRmYW81b3RtR2tvOFVuV3B1anV6NkZrcVlML3Bh?=
 =?utf-8?B?WWRkZzNzUFpRMzkvWjlCQTZIQXowKyt4a1lXSTR5T2dPdkVFV2J3WXNJbVB2?=
 =?utf-8?B?MFdKM0QyVnBLcEs2ZDlqZmI1eWdnS2lPR2ZVaml6VExuQWhCWnpoWGFzcDZa?=
 =?utf-8?B?alZKU2lzajJyR1FIdmF5aVVhU1JnSDBCVDBLNnZxaXdZR2t6VDlaL1NNTC9s?=
 =?utf-8?B?QWVsTTIvTDRYeVlNSS9sd2dmSlROMDNhMkQ4KzVjMk5wY1NJaS91aUZoeUNy?=
 =?utf-8?B?c0FyTkZqZ1pyRis5N015czg2aXZJUXRJT1RSNkNqZzhNb2JTT1EwZFk1WHdk?=
 =?utf-8?B?bWg3VVdwVkZTRkhJdThQZis1anhMUFkzYzlBbG94bXhBeDFmRmRmb2NkN3JK?=
 =?utf-8?B?cWNxNS9TaEdydzNCOWVHTGRSRTJITnlRTjg3dkZRaURsRkUwZWdCNys2OUtI?=
 =?utf-8?B?QS9QU3ZJcXljUXlZdHAvb1ZFRWZIZWFMWGdObXh0UWQwT2xyN1NQQjVkdEln?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVAP278MB0456.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b81f7bf0-b441-4592-ec99-08dd4cf07042
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 12:09:31.5636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FL69RlshJPSQhSCJys5mZoqjb246+dmAlnwUVVIRn9bzAGP6Igr80upCEtnec2yJ5Q0jfwa92KNKCqMbxI2BdClxPE5BgsqmYdijndL5Oug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0907

SGVsbG8sDQoNCmp1c3QgYSBmcmllbmRseSBwaW5nIDotKQ0KDQpCZXN0IHJlZ2FyZHMgSm9oYW5u
ZXMgDQoNCj4gLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQ0KPiBWb246IG1haWxp
bmdsaXN0MUBqb2hhbm5lc2tpcmNobWFpci5kZQ0KPiA8bWFpbGluZ2xpc3QxQGpvaGFubmVza2ly
Y2htYWlyLmRlPg0KPiBHZXNlbmRldDogTWl0dHdvY2gsIDI5LiBKw6RubmVyIDIwMjUgMTQ6NTEN
Cj4gQW46IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4NCj4gQ2M6
IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgSm9oYW5uZXMgS2lyY2htYWlyIC0gU0tJREFU
QQ0KPiA8am9oYW5uZXMua2lyY2htYWlyQHNraWRhdGEuY29tPg0KPiBCZXRyZWZmOiBbUEFUQ0gg
djJdIHRzYzIwMDc6IHByZXZlbnQgb3ZlcmZsb3cgaW4gcHJlc3N1cmUgY2FsY3VsYXRpb24NCj4g
DQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwsIHBsZWFzZSB0YWtlIGNhcmUg
d2hlbiBjbGlja2luZyBsaW5rcyBvcg0KPiBvcGVuaW5nIGF0dGFjaG1lbnRzDQo+IA0KPiBGcm9t
OiBKb2hhbm5lcyBLaXJjaG1haXIgPGpvaGFubmVzLmtpcmNobWFpckBza2lkYXRhLmNvbT4NCj4g
DQo+IFRoZSB0b3VjaCByZXNpc3RhbmNlIGNhbGN1bGF0aW9uIGluIHRoZSB0c2MyMDA3IGRyaXZl
ciBpcyBwcm9uZSB0byBvdmVyZmxvdyBpZg0KPiAoejIgLSB6MSkgaXMgbGFyZ2UgYW5kIGFsc28g
eCBpcyByZWFzb25hYmx5IGJpZy4gQXMgYW4gcmVzdWx0IHRoZSBkcml2ZXINCj4gc29tZXRpbWVz
IGVtaXQgaW5wdXQgZXZlbnRzIGV2ZW4gd2l0aCB2ZXJ5IGxpdHRsZSB0b3VjaCBwcmVzc3VyZSBh
cHBsaWVkLiBGb3INCj4gdGhvc2UgZXZlbnRzIHRoZSB4IGFuZCB5IGNvb3JkaW5hdGVzIGNhbiBi
ZSBzdWJzdGFudGlhbGx5IG9mZi4gV2UgZml4IHRoZQ0KPiBvdmVyZmxvdyBwcm9ibGVtYXRpYyBi
eSBjYWxjdWxhdGluZyBpbiBhIGJpZ2dlciBpbnQgdHlwZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEpvaGFubmVzIEtpcmNobWFpciA8am9oYW5uZXMua2lyY2htYWlyQHNraWRhdGEuY29tPg0KPiAt
LS0NCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSByZW1vdmVkIGJyYWNrZXRzIHRoYXQgc2xpcHBlZCBp
bg0KPiAtIHVzZSBkaXZfdTY0DQo+IC0tLQ0KPiAgZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi90
c2MyMDA3X2NvcmUuYyB8IDkgKysrKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQv
dG91Y2hzY3JlZW4vdHNjMjAwN19jb3JlLmMNCj4gYi9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVu
L3RzYzIwMDdfY29yZS5jDQo+IGluZGV4IDhkODMyYTM3MmI4OS4uMGI1OTM0ZDg0M2I5IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL3RzYzIwMDdfY29yZS5jDQo+ICsr
KyBiL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vdHNjMjAwN19jb3JlLmMNCj4gQEAgLTIzLDYg
KzIzLDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9pbnB1dC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4
L2ludGVycnVwdC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2kyYy5oPg0KPiArI2luY2x1ZGUgPGxp
bnV4L21hdGg2NC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPg0KPiAg
I2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+DQo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGF0YS90c2MyMDA3Lmg+IEBAIC02OCw3ICs2OSw3IEBAIHN0YXRpYyB2b2lkDQo+IHRzYzIwMDdf
cmVhZF92YWx1ZXMoc3RydWN0IHRzYzIwMDcgKnRzYywgc3RydWN0IHRzX2V2ZW50ICp0YykNCj4g
DQo+ICB1MzIgdHNjMjAwN19jYWxjdWxhdGVfcmVzaXN0YW5jZShzdHJ1Y3QgdHNjMjAwNyAqdHNj
LCBzdHJ1Y3QgdHNfZXZlbnQgKnRjKSAgew0KPiAtICAgICAgIHUzMiBydCA9IDA7DQo+ICsgICAg
ICAgdTY0IHJ0ID0gMDsNCj4gDQo+ICAgICAgICAgLyogcmFuZ2UgZmlsdGVyaW5nICovDQo+ICAg
ICAgICAgaWYgKHRjLT54ID09IE1BWF8xMkJJVCkNCj4gQEAgLTc5LDExICs4MCwxMyBAQCB1MzIg
dHNjMjAwN19jYWxjdWxhdGVfcmVzaXN0YW5jZShzdHJ1Y3QgdHNjMjAwNyAqdHNjLA0KPiBzdHJ1
Y3QgdHNfZXZlbnQgKnRjKQ0KPiAgICAgICAgICAgICAgICAgcnQgPSB0Yy0+ejIgLSB0Yy0+ejE7
DQo+ICAgICAgICAgICAgICAgICBydCAqPSB0Yy0+eDsNCj4gICAgICAgICAgICAgICAgIHJ0ICo9
IHRzYy0+eF9wbGF0ZV9vaG1zOw0KPiAtICAgICAgICAgICAgICAgcnQgLz0gdGMtPnoxOw0KPiAr
ICAgICAgICAgICAgICAgcnQgPSBkaXZfdTY0KHJ0LCB0Yy0+ejEpOw0KPiAgICAgICAgICAgICAg
ICAgcnQgPSAocnQgKyAyMDQ3KSA+PiAxMjsNCj4gICAgICAgICB9DQo+IA0KPiAtICAgICAgIHJl
dHVybiBydDsNCj4gKyAgICAgICBpZiAocnQgPiBVMzJfTUFYKQ0KPiArICAgICAgICAgICAgICAg
cmV0dXJuIFUzMl9NQVg7DQo+ICsgICAgICAgcmV0dXJuICh1MzIpIHJ0Ow0KPiAgfQ0KPiANCj4g
IGJvb2wgdHNjMjAwN19pc19wZW5fZG93bihzdHJ1Y3QgdHNjMjAwNyAqdHMpDQo+IA0KPiAtLS0N
Cj4gYmFzZS1jb21taXQ6IDA1ZGJhZjhkZDhiZjUzN2Q0YjRlYjMxMTVhYjQyYTVmYjQwZmYxZjUN
Cj4gY2hhbmdlLWlkOiAyMDI1MDEyOS1maXhfdHNjX2NhbGN1bGF0aW9uX292ZXJmbG93LTkwODYw
ZDRlMzQ5Mg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBKb2hhbm5lcyBLaXJjaG1haXIg
PGpvaGFubmVzLmtpcmNobWFpckBza2lkYXRhLmNvbT4NCg0K

