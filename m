Return-Path: <linux-input+bounces-9602-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C748A21D1F
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 13:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C170816667E
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 12:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F85372;
	Wed, 29 Jan 2025 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=skidata.com header.i=@skidata.com header.b="qZucS8/y"
X-Original-To: linux-input@vger.kernel.org
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazon11010027.outbound.protection.outlook.com [52.101.186.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B5B36D
	for <linux-input@vger.kernel.org>; Wed, 29 Jan 2025 12:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.186.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738153834; cv=fail; b=KgJ+lx7Xb8jfGYFhCGV8Ah3x5m6lKZStHJGlPc+xLnQXGRzXKRLIGXXc09CJNxaAGFqEPWPUhQW4vXuj81NFtBBy8VxJ+JIgT1oWUOXXYtTxzpbLxhdNP5090+MddRdo7easKms3iCmgKiYj4lQyJdCtUovJaiasd5oEBKcgKJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738153834; c=relaxed/simple;
	bh=DIa8wkADbE2oB+FLq1m22xd5sywBmBac0J4L5m+Z5Ac=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CZmgfHvSMJYQaQOpcTj7GWTARv4CW0bez670j0H00CeV6QqU+pUI6vBkl79fC5zZ4zXpVnj3MR028LqgD5SgEpzjUky1VqZcIpBSYPuRb/YmqNV5ZqE2MA1Jo3+kmLWbnNLJWLEGMj0GvKS6IYCH6mbchCzLZeKIz0kf7XUMODc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=skidata.com; spf=pass smtp.mailfrom=skidata.com; dkim=pass (2048-bit key) header.d=skidata.com header.i=@skidata.com header.b=qZucS8/y; arc=fail smtp.client-ip=52.101.186.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=skidata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skidata.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqzGcjs05dj+X6W7ueWHRAy8liCMfvJc2n/y1/qezr8ID5YvlyUi0vPZczD4RtTZm97PePtSOqVCiDNhpuBSzp9DtQWRc/Tz/cUYMAUaN7Dfec0TTaklBMzYZ006kbGVzNp6XfX2eVWiQoHQj986IsBjUZHdFBFzuTjCqow6HymHxKbJtM9ysiQBpCBAPWTzMjHOSkiI0gvDiXsbciN2qMlErUhubqXVDLBaCMB6gVNC7Ig8KUT+6owO4W1g6IP/5ZbPD9CEh+0pvKdPJgKHQFAmL8rH7rrDcfYaOqYPSoq1FacFyz9dYtGCHGhi9pMI/ThpyEkUnQbduYCDPNW1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIa8wkADbE2oB+FLq1m22xd5sywBmBac0J4L5m+Z5Ac=;
 b=qydX8tDlKtKOLmNIaRUyPhq6JtW8CacfHHnpEuKGTPq20k9+k+KNtHNG7BaQWN9+Zwj0BEc0Z3nZiZwH0MsYymZFN00+hEcMA0olW3sRjkkEdQHPBltGCu/LZHx9/wPBLk55dvLNhhWnV18gvNGZ06IQMBZkj/fMY0+BORxTtWzTgXgWOnOATUfNRhXduSFee+TIuR9UGUeSoif5DClugrMfsNMMBBjB+JelPfLpncF+aCYmMmIUZpZvp/mDNFIEW3ux3QC+LoNyEBKHYTj3bNtn1yAOq4h1JP7h0MK/wtDNr9uprLv9TQl+wh90Ha/IQPTFpbu2RaVQysObiIyK5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIa8wkADbE2oB+FLq1m22xd5sywBmBac0J4L5m+Z5Ac=;
 b=qZucS8/yOdHiQGyG9fo7Hu6oY1k7Xk7hSwl4YszOQMtfjScxbZ7PGpHT6OGzbNWhtYjwyxgwswVD/GI7YnIwtvUkXXplKZqC/de1l9cEUbpP9vaPdkQWrX7FNtT83yrqBKE2Gbyy8BDp1kl9Xi4mMTo8Nx+wtsOX6lsiQ2eqVGEZi9BpVmj/rKDHcNdwBIGQ8NWhZbxX2bFGuGvFFAGt/ftek4Ikj0VVIiYNOiwSS4S++C5AhBKgUhnDJ+z+G3ViVHvYYNvxONZWAl4hrs0XUtyw1n18RQ62D3o9E7Oz1H/zIZIJfLyGk4RdynU9DzK72JI8k+0a9XKmOVuMnKTjbw==
Received: from GVAP278MB0456.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:39::5) by
 ZR0P278MB1350.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:82::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.18; Wed, 29 Jan 2025 12:30:28 +0000
Received: from GVAP278MB0456.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f5f4:4769:5e87:a09c]) by GVAP278MB0456.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f5f4:4769:5e87:a09c%2]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 12:30:28 +0000
From: Johannes Kirchmair - SKIDATA <johannes.kirchmair@skidata.com>
To: "mailinglist1@johanneskirchmair.de" <mailinglist1@johanneskirchmair.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: AW: [PATCH] tsc2007: prevent overflow in pressure calculation
Thread-Topic: [PATCH] tsc2007: prevent overflow in pressure calculation
Thread-Index: AQHbckTLl2ML/y34j0SUMejTfJDJ1bMtrjNA
Date: Wed, 29 Jan 2025 12:30:28 +0000
Message-ID:
 <GVAP278MB0456160071176231C59896508CEE2@GVAP278MB0456.CHEP278.PROD.OUTLOOK.COM>
References:
 <20250129-fix_tsc_calculation_overflow-v1-1-3a6e388637c4@skidata.com>
In-Reply-To:
 <20250129-fix_tsc_calculation_overflow-v1-1-3a6e388637c4@skidata.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-bromium-msgid: 1c2a9538-e57e-4d1f-a1ca-3a9ff9ac732f
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVAP278MB0456:EE_|ZR0P278MB1350:EE_
x-ms-office365-filtering-correlation-id: 143f4f6f-61e9-437a-94fc-08dd4060b6d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NmhWUXJHMHNsOWJPdWx1Y2thZG92RFpnM3VnOWtMUUgwTTFvcDNDWHZqay9B?=
 =?utf-8?B?OWhsd0JzWld5cHlMZmF6NjQ4eWZEYk5Md2dRd3NSczd5YTRMY1BtUEhNWDg3?=
 =?utf-8?B?d3NLMk1kRGVDbzQxYmx3eHg5R3FBMEVDdis4NmN4bDBYVnIwNHFBNGE3S2M5?=
 =?utf-8?B?TDREVFZnMzdqYzVLTnNzSzQ4bnRaRU9kNEZmaDlQTXBvYUpFdFlqWm9wRndX?=
 =?utf-8?B?UEpLcnYvVS8vMW9OMzJ3U1BsVzBFTGU5WTVEa2xGdzRMZVoya2tweGNHM2xr?=
 =?utf-8?B?SjhkV1ltWTN2NllnQkU3MmJIbEFLaW1CZG9jZThZVGdDYUFRVDJmRUpVL2Mv?=
 =?utf-8?B?aG5hNE8ycThXaWVyNk5qMzVyalExbjlTTWVQdGJGd2krSHFUY01kelpObjMr?=
 =?utf-8?B?SlM4aXVINEhpL3NjajRlYVRsbnZQVDh5ZDR1Wjg1RHpnbVBuTXNBYi9vbDg2?=
 =?utf-8?B?WU1YQ3c5NmZVUDJpUE5GTGJGNEJ6MWF6a3FXdllFSkx6ZFlNWnFvbXNSVGh5?=
 =?utf-8?B?Rm1lT1ZrY1gwaGJhdjhQT0F4SU1RdGRCQmtHSW1aL3FsYUIrY0VFNTlaY0xE?=
 =?utf-8?B?Vmxkc3I4V2I4Z0ZCemJXendnTzl5NEwwWm1mV01BeWU4Y01wa1pMWnE2aEUw?=
 =?utf-8?B?c0NEVTlqWGswS0IxTzJxWWNCZGRSMXIxTmVCVWlNUU5PRTZLNU9xMEJNalE3?=
 =?utf-8?B?c29ESnhUeHBxMDhLVzRvT1BqT21yMFA5N21ybU9vbnB6OVh4Nkw5Q2FkdDdt?=
 =?utf-8?B?WkRQMElkU1NsREZWSzYxSkx3NTJVeHA5bVU4ZjFBbWxBZi9SL3pOTWRkaUdP?=
 =?utf-8?B?Z2Z5NDVLRFZxOTRPTFVPQWNsTlREL0U3aS9UTzFGU201bldLdllzR2NGUXFa?=
 =?utf-8?B?cXQ2dm10UVExbzByWWFCYzVaMk0wUC9PckoybmE1R29BT3R3R2ZLTXR3MHFF?=
 =?utf-8?B?SVJ5SkxVQ0hJRmt0Zkc5NVU0T0xsV091NWtyMC91bWIwZ3IxOHlCUFRrM0lr?=
 =?utf-8?B?YkIyNnBIK0dnMFhzV1Q5d1dQbGJZM2R0eWwrLzlVUVhCK3d2WCsrN3hiV1Ux?=
 =?utf-8?B?aHZLQUx3RVlqNEdaMXZZdTFaRkZvUS9EaG9pRDFOYURiMGNWak5vTFFOSC9j?=
 =?utf-8?B?OGp4MGJrOURuQmhXb256aUt4eVlFQ2NqL0dKaGtjcnRocnBVMjNpbTZMUHQr?=
 =?utf-8?B?SUZTTmhDRFRYUU1raHcyZnAxdXI3d0ZZM2xBM0hSWUhpUUlGa2ZacEZ6a1J1?=
 =?utf-8?B?Y3djREJqc1c4K2N3L3NxRkFRREU3Z0dkR1pIZG9mSm5oUTRJTVdRTVo2T1Ry?=
 =?utf-8?B?NFZVTmd4c0pEajZqeU9FczJiMzl5dzhkRktkT0RGUDY4VGdxU2VIUmRPS0xW?=
 =?utf-8?B?cXFIbkZlNjJ2RVR1YkFac3RHTmRDMkR0TDA2VTYwRUdRdTROY3dnd3F2ZHBj?=
 =?utf-8?B?MkdXdjhGWXN1anp4dmFXTTA5VE8zOWJxelBNWDVGbHdXb29Sc3dPRjluS3Q4?=
 =?utf-8?B?bkY0WWVlUE1YT1ZNMmpueVdXTktVZ1dzYlBKQkFLUDhBRHZ5VmpsTk9odjNm?=
 =?utf-8?B?OHJSTzluVFNBYUdvNWE0S0QrMnZsMEcrNmQ3cnh2cSttRUxzRWpNNG41eGNs?=
 =?utf-8?B?eDI1bE5hMWtjYUxzOUtoQ1RZbk1sRE80Ty9sMWhKeURRQ01DTkJBeDNJVFBl?=
 =?utf-8?B?NStYMjNKM0Q5elBPUXZEa0NKL1VVK29haitwcnEwOW9PQWhjYWVBSkVsN1k0?=
 =?utf-8?B?dUE4WW5nZndmdm1ROHo0NmMwTjdEWHBQa2U4VFZmZTMyQ1NoSzNDVThUbTd2?=
 =?utf-8?B?ekVGZVI0c2RHTjlpNDlQeTU1VXhUeG1taXBNYnkzVmw4bmRtT09LRXVLY0Fs?=
 =?utf-8?B?cnBOMG41a25lbDM4V1lCLzBxVERtSUFOd25zRisxc2dTYUZ6NWdWbjB3MUhM?=
 =?utf-8?Q?jVRLS8GaaoF8c3OmbsqgyagYC56XGTPD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278MB0456.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGU1TTMzWkxBSStvc3J2NTRPVjAzV1hTTjIvbThFb0Q0UStYZk8wYXIveVJ3?=
 =?utf-8?B?d3RPYTFHWHdmaSt0c0hQWkNZQlN0aUJ3NFNHV3JZbFB5UDdzNytnN2xINVlO?=
 =?utf-8?B?ZzljVkRmK0tobENJNWlmU2J5dTk2WVE4Qlp1RFhLbzFxZzU3Tm9jMElBZEJO?=
 =?utf-8?B?RXhCNTFhL1BjcXM3MkZZck02WFk1Q1RPVzNJTkpHYnB2Wk1lZm5NbVdJR0xO?=
 =?utf-8?B?eHhnTkM4Y3FyVm5rQ3FyV1dvNko4YzV0ZHo4d1VIT0w5QnFEUVRDclZyNTJ2?=
 =?utf-8?B?YTVOc0lLWm1SaENUUXcveE5CcW1ZbTlvSmhHY2VnTHZDZW0yZnN3Q0NIbkUv?=
 =?utf-8?B?b2V5UW1UK3l3dHVwZGpsbE9HN3E3OVBUNHFnM3ZDcFRDN2VkejJsRXBZYVVm?=
 =?utf-8?B?WXVDRDNxLzFqVzBXMWpnWkxxL2kwZTh1Nk1zdmdOSkVwL24zTDNxRFVUa1ZL?=
 =?utf-8?B?SklYNjk5bHBkb3VWTHlkM3Vta1BEcnNjSFZBNjdFSmJFRzFWc1lsTkI5MWVj?=
 =?utf-8?B?ZGJJdXBHV05hOVg0V21DL0RXRVpaTytPM0tCTnFwTUk3TTk0amJLbDB4Tlla?=
 =?utf-8?B?dkljcjJJcDBTZmtOWm5DaDFIV0FUZW9JbjJBVVY2QW4zWjBmUlRDY2pTeHgy?=
 =?utf-8?B?dU95eitiTHVTRGJaUURGdFZiWEtBOStXam1wV2lNNy8ycVZ4N3I2Y1IvTHcv?=
 =?utf-8?B?RU1UdXQ1Y1czYUpEYnlBOHpIcVhwWTE5OUh6TUp3UUNlR1EydGFUUW9STXRG?=
 =?utf-8?B?ZlhUSUE5RG0zQWJ3aldPcUZETVFldkZiSHg1RWF4M3N6QWcvVGdMdXdEd2VX?=
 =?utf-8?B?aElyTWI1M0IvWGhTOEtSSTc4NXVZcmRodjhUSHFxbEtNME5VNEhWV0hPclJS?=
 =?utf-8?B?R0xmRERLQ1QwWFhlNHRlbFRqZE0wT3BuZmtCbXAzM2NZSEk1eXFyOG4xbCth?=
 =?utf-8?B?dk9CK1owbmFKQ3oweGt5SWFoSlpGMW1RQ09KSXBTZFZqOVZ3RkxlZFMrOXZF?=
 =?utf-8?B?WXdTbWlFc1hEcFRybzZaUDArNllkVmRoY1MraXMzaVAxSDkwaXMzaThYcG15?=
 =?utf-8?B?Rmx4NjFpeEQ3VzlYUUQ1WXBiYXptL1hMaXgwMFdmTnJOZGMwdU9JU0tIWW5V?=
 =?utf-8?B?NzNDWWZ2S0FIeDB0N091dWpmZzdJVGdMcnk5RmVNZXV6VjZtN2ZFVDZPSXdD?=
 =?utf-8?B?UHBpUGExd0ZYdm5NYWJHa0oxemFBTElraklGRjlUL0YwSEw0VGF4UnhkWmE5?=
 =?utf-8?B?R2gwWjBabEZocjQ0M0Y0SmhQYTN1Nmd6dmZ6cDQ4Ump0a2RHYTJ3Y0hMbER0?=
 =?utf-8?B?N2NISDFWcWVIVlRJRktVQUk1eGtRYkdBK2xRTTFUdUtnbldkS1RVYXRCdHlQ?=
 =?utf-8?B?aVprdTdsTkszT0NEeitiZ1JVQXRYUUw3aDNYbmJaZkJ0RGFpMFhXVDVkUExR?=
 =?utf-8?B?M2JBMU5ZVXQ0VndxWTkzZ2Y5KzdlL2pmbkdUMW1hMmlCckdjODZDdE9Zcytm?=
 =?utf-8?B?OExvUzNNcEV6UkhsWmtlejZhbS9QblQ2dW5iQzk4SVlFcDVxVHIvRzdUL244?=
 =?utf-8?B?aGROMDFjREg3WCt3WVRMNUhPSi9uRk9NVFh4M0tMSm1VV1VvcmpMMHU0SmVL?=
 =?utf-8?B?S1A3QVFqRTZaU3dxalk3TEdIM1JsdWU0bW9RLzJMdE10VnY3SmFUaktxTUht?=
 =?utf-8?B?RTVIVkVUMGhYL3ZDMjR0V1hUUms4ZUFJaGdnbTBMY2creCtwYWNxZi8wYzR5?=
 =?utf-8?B?VFoyRnBocVIvYVByS3pxQUlxUVJta2NHKzZFdUZOQ3c5Zk9vWDI4eU1RdlB6?=
 =?utf-8?B?YUZpdUtUSDhOL2ZHeGdCSitEVTVHZzRlemNIampkSjVDQ09jU1Z1UTg2QnhY?=
 =?utf-8?B?K2pXZkNUUG9VY2VWK0hITjRrNUZzekxsNFI3b2xVOFZjQnhvSE9MdTREdG9O?=
 =?utf-8?B?UlZ0bW02UDVzN0hoU3pUSXl5bkhGb1hlYjlXYldBNFJzcVNmNDFteW1EZ05Y?=
 =?utf-8?B?OGoxMjJQM1J2dFRCQjF1b3N5alRsYit5S0RmVytiYjRrT1ZTZC9Ockc0V2lq?=
 =?utf-8?B?V0ZaR3krZ2czMGNZYzZYM0JEZ3BTMndrcTVFeml2MDdhU2plblVJekZSMDlU?=
 =?utf-8?B?ci9YZVF1NTBURUYrUFo4WGlJcFI5bWx3VHorSkZSeUwwODRXRzVsSHVZbG5O?=
 =?utf-8?B?eHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 143f4f6f-61e9-437a-94fc-08dd4060b6d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 12:30:28.4607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tO3VQ4i7RK/khh68UyQdev8PtBMflBE81iRYCGaxZt+KeAWci7r6VOa9w2guuT08gJn0U/ZO2JIM0XIvqtrXu0263xU2FZWxgrmwQjyt1AU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1350

SGksIA0KDQpEaWQgc29tZXRoaW5nIHdyb25nIGluIHRoaXMgcGF0Y2guIA0KU28gcGxlYXNlIGln
bm9yZSBpdCA6LS8NCldpbGwgc2VuZCB2MiBzb29uLg0KU29ycnkgZm9yIHRoZSBub2lzZS4NCg0K
QmVzdCByZWdhcmRzDQpKb2hhbm5lcw0KDQoNCj4gLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmlj
aHQtLS0tLQ0KPiBWb246IG1haWxpbmdsaXN0MUBqb2hhbm5lc2tpcmNobWFpci5kZSA8bWFpbGlu
Z2xpc3QxQGpvaGFubmVza2lyY2htYWlyLmRlPg0KPiBHZXNlbmRldDogTWl0dHdvY2gsIDI5LiBK
w6RubmVyIDIwMjUgMTI6NTYNCj4gQW46IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92
QGdtYWlsLmNvbT4NCj4gQ2M6IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgSm9oYW5uZXMg
S2lyY2htYWlyIC0gU0tJREFUQQ0KPiA8am9oYW5uZXMua2lyY2htYWlyQHNraWRhdGEuY29tPg0K
PiBCZXRyZWZmOiBbUEFUQ0hdIHRzYzIwMDc6IHByZXZlbnQgb3ZlcmZsb3cgaW4gcHJlc3N1cmUg
Y2FsY3VsYXRpb24NCj4gDQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwsIHBs
ZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBvcg0KPiBvcGVuaW5nIGF0dGFjaG1l
bnRzDQo+IA0KPiBGcm9tOiBKb2hhbm5lcyBLaXJjaG1haXIgPGpvaGFubmVzLmtpcmNobWFpckBz
a2lkYXRhLmNvbT4NCj4gDQo+IFRoZSB0b3VjaCByZXNpc3RhbmNlIGNhbGN1bGF0aW9uIGluIHRo
ZSB0c2MyMDA3IGRyaXZlciBpcyBwcm9uZSB0byBvdmVyZmxvdw0KPiBpZiAoejIgLSB6MSkgaXMg
bGFyZ2UgYW5kIGFsc28geCBpcyByZWFzb25hYmx5IGJpZy4gQXMgYW4gcmVzdWx0IHRoZQ0KPiBk
cml2ZXIgc29tZXRpbWVzIGVtaXQgaW5wdXQgZXZlbnRzIGV2ZW4gd2l0aCB2ZXJ5IGxpdHRsZSB0
b3VjaCBwcmVzc3VyZQ0KPiBhcHBsaWVkLiBGb3IgdGhvc2UgZXZlbnRzIHRoZSB4IGFuZCB5IGNv
b3JkaW5hdGVzIGNhbiBiZSBzdWJzdGFudGlhbGx5DQo+IG9mZi4gV2UgZml4IHRoZSBvdmVyZmxv
dyBwcm9ibGVtYXRpYyBieSBjYWxjdWxhdGluZyBpbiBhIGJpZ2dlciBpbnQNCj4gdHlwZS4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEpvaGFubmVzIEtpcmNobWFpciA8am9oYW5uZXMua2lyY2htYWly
QHNraWRhdGEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vdHNjMjAw
N19jb3JlLmMgfCA5ICsrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L3RvdWNo
c2NyZWVuL3RzYzIwMDdfY29yZS5jDQo+IGIvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi90c2My
MDA3X2NvcmUuYw0KPiBpbmRleCA4ZDgzMmEzNzJiODkuLjgwYWJiY2NkMWZlYiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi90c2MyMDA3X2NvcmUuYw0KPiArKysgYi9k
cml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL3RzYzIwMDdfY29yZS5jDQo+IEBAIC02OCwxMSArNjgs
MTIgQEAgc3RhdGljIHZvaWQgdHNjMjAwN19yZWFkX3ZhbHVlcyhzdHJ1Y3QgdHNjMjAwNyAqdHNj
LA0KPiBzdHJ1Y3QgdHNfZXZlbnQgKnRjKQ0KPiANCj4gIHUzMiB0c2MyMDA3X2NhbGN1bGF0ZV9y
ZXNpc3RhbmNlKHN0cnVjdCB0c2MyMDA3ICp0c2MsIHN0cnVjdCB0c19ldmVudCAqdGMpDQo+ICB7
DQo+IC0gICAgICAgdTMyIHJ0ID0gMDsNCj4gKyAgICAgICB1NjQgcnQgPSAwOw0KPiANCj4gICAg
ICAgICAvKiByYW5nZSBmaWx0ZXJpbmcgKi8NCj4gLSAgICAgICBpZiAodGMtPnggPT0gTUFYXzEy
QklUKQ0KPiArICAgICAgIGlmICh0Yy0+eCA9PSBNQVhfMTJCSVQpIHsNCj4gICAgICAgICAgICAg
ICAgIHRjLT54ID0gMDsNCj4gKyAgICAgICB9DQo+IA0KPiAgICAgICAgIGlmIChsaWtlbHkodGMt
PnggJiYgdGMtPnoxKSkgew0KPiAgICAgICAgICAgICAgICAgLyogY29tcHV0ZSB0b3VjaCByZXNp
c3RhbmNlIHVzaW5nIGVxdWF0aW9uICMxICovDQo+IEBAIC04Myw3ICs4NCw5IEBAIHUzMiB0c2My
MDA3X2NhbGN1bGF0ZV9yZXNpc3RhbmNlKHN0cnVjdCB0c2MyMDA3ICp0c2MsDQo+IHN0cnVjdCB0
c19ldmVudCAqdGMpDQo+ICAgICAgICAgICAgICAgICBydCA9IChydCArIDIwNDcpID4+IDEyOw0K
PiAgICAgICAgIH0NCj4gDQo+IC0gICAgICAgcmV0dXJuIHJ0Ow0KPiArICAgICAgIGlmIChydCA+
IFUzMl9NQVgpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gVTMyX01BWDsNCj4gKyAgICAgICBy
ZXR1cm4gKHUzMikgcnQ7DQo+ICB9DQo+IA0KPiAgYm9vbCB0c2MyMDA3X2lzX3Blbl9kb3duKHN0
cnVjdCB0c2MyMDA3ICp0cykNCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogMDVkYmFmOGRkOGJm
NTM3ZDRiNGViMzExNWFiNDJhNWZiNDBmZjFmNQ0KPiBjaGFuZ2UtaWQ6IDIwMjUwMTI5LWZpeF90
c2NfY2FsY3VsYXRpb25fb3ZlcmZsb3ctOTA4NjBkNGUzNDkyDQo+IA0KPiBCZXN0IHJlZ2FyZHMs
DQo+IC0tDQo+IEpvaGFubmVzIEtpcmNobWFpciA8am9oYW5uZXMua2lyY2htYWlyQHNraWRhdGEu
Y29tPg0KDQo=

