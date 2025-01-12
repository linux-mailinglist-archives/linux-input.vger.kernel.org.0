Return-Path: <linux-input+bounces-9157-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D49AA0A907
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 13:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E0353A676A
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 12:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D961AF0D7;
	Sun, 12 Jan 2025 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="JIJ3BH7z"
X-Original-To: linux-input@vger.kernel.org
Received: from MEUPR01CU001.outbound.protection.outlook.com (mail-australiasoutheastazolkn19010003.outbound.protection.outlook.com [52.103.73.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519D32A1B2;
	Sun, 12 Jan 2025 12:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.73.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736684315; cv=fail; b=iG9Om6/CadCkiKnuqGNOsbBqQ57eoUh53AmjydKhg3p1kqV2Ij4YEqAmyxRFktATu+kf0GBoInLZ04vFF04AXaR+urITcZmQddnL9luOt+Ibt+4LtaQpRTxl6fXNXZpBItiaNnrC3OmmueIEN9mYdPY/RWUW1pX9VMBtqT384js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736684315; c=relaxed/simple;
	bh=SlwI71ETdjk6PTwB3ab3Uia97gvNkq+O2GQGZcSrCh0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s/njUOz1vyPa2o/zSDgZKtOXhUdTFUCnBa1h/4vtmP12US6q+NXas0Yh0qzneAQ8+KXFOrNAUHqEYaJLdV+WJaW3xkViqInzzocQcN0NQgfsT8pbwm8EKCguVoTmXyfxvmwqmsoZe7ZmbkfAFZkL3pzlrccbsKvJ3nIC1nWx0fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=JIJ3BH7z; arc=fail smtp.client-ip=52.103.73.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRaJVRonhkJlQbJWEhDnSRFMIm5taHTy73V4ZwKXQJFpzanPGVLac0JTJHWIUWKWXyQZWoNDmC1eFvncVtHhaxWYW/zqCm4QinN4WjSF6GG19/QIIQry+hrgtXOSVut1AggqfzMXpz/hKb3e3GnLnySJZpImQfey25zfZrslsfGNNg6C4mu97j0mRGBvbZfGdlEuci2JVMPEeoP/pVaAcWjkjEsX0gAVCTxwiytgdGQToWYTEgEZnRboQzjMRmuq6xupRbAsnsCD66RNwz0CFP8dPs5C6rYAwbLSn5gnhyll0Ai2LhUKSRelOH6rJ9PHMgHw5eekhq5wxb/PiweJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlwI71ETdjk6PTwB3ab3Uia97gvNkq+O2GQGZcSrCh0=;
 b=ROazz8eCS29tQMaZi3es9WR0+nBY+k8VIgeK8bMgihfdqlZmNFlXOgFIIySMZGQlDDlOugP7xxB5A7EyzmB2iLnpkxg9C0YUoUVNpQKgQ6yVvwBcISBPhmkeSWEDRyKqojz11e4hOEAInxLgF59L/BvRGNHg9HSHmsVzLmHqyXTr8NUZgaUzRgDqz5A34fJAq1WK4eGM4eufOCyaWogRgjsJt+oInvGj6JFod1buP1IVcFWG40bB5YiK0BaJrL1kbzTLzIHFX9sFmyq9xuJe1rPRlWGwZt/P6BRpzZFBbSEIh9PhaYnbvVYwIIH5BL4oDvDBRWMrpaz/nrFM6uvx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlwI71ETdjk6PTwB3ab3Uia97gvNkq+O2GQGZcSrCh0=;
 b=JIJ3BH7zbz2jkoV84yVCg3pi6+2WyAIJWr3me1zjrWPdN3sica4rTvY/TVvMprg7Kh2Fdmqyu6dGT3ZimQWlun0Xeybvv1czu6OBc0R5T+yByK3m/RwlprDy3cJVyMk/mU4OdpbHewm50BemfXnatIT5xoePcP8d/NtP8sUQzf3ydSl4uDXy/BrD+yuCxN5ESTHpg27MOKu5WCPJd7cDJfu2YpW/dRwn6maldMRMoUowJd3wQ25lFxB5WJFpOY8LWSHYLK8tnMCmUpukut9O/21U0DwgKRdOfcadSbggPRURmcjYLNfiH9RGuzX3IQk8B4eMdqwHXzA15yLlBg3jog==
Received: from ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:150::12)
 by SY8P282MB5140.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:2b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.11; Sun, 12 Jan
 2025 12:18:28 +0000
Received: from ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM
 ([fe80::a309:11d6:4508:99f8]) by ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM
 ([fe80::a309:11d6:4508:99f8%5]) with mapi id 15.20.8356.010; Sun, 12 Jan 2025
 12:18:28 +0000
From: Josh Leivenzon <joshleivenzon@outlook.com>
To: "luke@ljones.dev" <luke@ljones.dev>
CC: "bentiss@kernel.org" <bentiss@kernel.org>, "corentin.chary@gmail.com"
	<corentin.chary@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"jikos@kernel.org" <jikos@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] hid-asus: use hid for brightness control on
 keyboard
Thread-Topic: [PATCH v3 1/1] hid-asus: use hid for brightness control on
 keyboard
Thread-Index: AQHbZOwWCgMHT4lH3UOwvtuCZJt/+Q==
Date: Sun, 12 Jan 2025 12:18:28 +0000
Message-ID: <20250112121811.434552-1-hacker1024@users.sourceforge.net>
References: <20240713074733.77334-2-luke@ljones.dev>
In-Reply-To: <20240713074733.77334-2-luke@ljones.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ME3P282MB3003:EE_|SY8P282MB5140:EE_
x-ms-office365-filtering-correlation-id: 95afaae5-28ff-4836-2ca6-08dd330338b4
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|8022599003|15080799006|7092599003|8060799006|19110799003|461199028|38102599003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gEz468o56hhtWa4I1bOhSUoWCTnsLgGGhTm+rMtUwztuB5i1wYO7NZrhK/?=
 =?iso-8859-1?Q?2Dv36XVqtScwIuewvvKwJ4Tei+smkCm+PHYiL1F7tv4Iz6CAccGMbDgWFj?=
 =?iso-8859-1?Q?qDEQ5GF+IDrOxRcraxqE3i/N0M/7ngwCTo8L4f8TJ5Z2YtKI/INcsurfQc?=
 =?iso-8859-1?Q?PoD/HXy/tm6QxdywC1ilCaeTlOHHbXyXL4doHkh+AJq5O6Wjmn0jJRTkVy?=
 =?iso-8859-1?Q?e2gO9phJUE+4GNNnEbs7P+26Ka26za0QXRHWEkVOh4/6Gc8gIvGJsSCDuI?=
 =?iso-8859-1?Q?5+ZL0gK8Azi0AICYGIaylb2+EVNwzyWGdL0rF7QUDMYzAMus6YHmdCWr0t?=
 =?iso-8859-1?Q?qyder9UceeCmF8mQHs1q7xxVmGbzuKDlB2wbtHy6geWBjJsJhu0fOmWl9f?=
 =?iso-8859-1?Q?pTy9T4UKGiCF7mFU1ROlTFJO5rbYI+Nli7rI/GbCH9sdltZsHI3rfWaHLL?=
 =?iso-8859-1?Q?fd3JkWhTcO6mDm96xiHH0XBtSpr62QLfR9sPvPXt65zwbjtjPYUX9L77Wf?=
 =?iso-8859-1?Q?UqYOQGVR2EP8EE03u5z283UvEOOayTEtOMXs6ZD2sQriIkG99ywpQUM48g?=
 =?iso-8859-1?Q?PbRmSOPEHfkIVPaHqZk+1RtefPbQpx6rpvCy+WcfzZmgMRe6gk3GmTw3po?=
 =?iso-8859-1?Q?ZbspjYIdrowL+f2AXr6lPr95bSI5CgKRT3kec6kyWYcCvT1aw8FUXbtQpP?=
 =?iso-8859-1?Q?hq6KYJ329tyqAoOG8ukoFMkAZAAWHbiT29cL2vTX4j2vWtgqgb5D20bIU5?=
 =?iso-8859-1?Q?tfHqmYz0MLs39RSD1uXhK2lM/zVa/rpzQgI/hWgZU1aQILL2WVTeTjrh6f?=
 =?iso-8859-1?Q?6zZWrF2frvrLuw+8H3J9B8tOXpPpqLF45nR1M7oASc/RRTs/uoRvZZz1Ec?=
 =?iso-8859-1?Q?zww8bywaDRaBLfQP3UBcskb+ns0tm+vd6w2GbyXoDnttQt3Q1d76skkzdl?=
 =?iso-8859-1?Q?5qDWXpCmLrJKLiVUayM5+CL6XhWk6TgIhnYraYf+hLIbSqZA1uLXXIBqhs?=
 =?iso-8859-1?Q?Yczodps87UKGtG5kZiiHKU021TxeVZMnM7emUa00A6CTpuUuNRPwofrNDx?=
 =?iso-8859-1?Q?+UKHigcordzVuGheUitwL4lC+gnf/AXu70RQ8kPUw4WKGg2ujVD785iieE?=
 =?iso-8859-1?Q?xFyIUqAFwK3XIH9OeecZsiAzbJt+lqwSRlYG9j/ycnswVsxVAp?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?O8mjOYUntBOEG0ug0du3ChQkarRjZZiKnqZFDGx72ABVUFrB7jCrw8Bq0e?=
 =?iso-8859-1?Q?pAgwJnTT0qneYb74b0DQkzKO6/Es41kEY7fg8TScbi813kTkKrPU32yu2W?=
 =?iso-8859-1?Q?meLIwXyObB+SlNNu1mgH4pav5l+NB/d5BsK2bfvHfSDOLcbSVkLVGefC7W?=
 =?iso-8859-1?Q?5n1Q9bwU4kJyBjJIL+mqDbZdstHxcUU4NYwAuXx24to4eoS//Y/yki6zhC?=
 =?iso-8859-1?Q?q6mP6LWHpcJnsgMCLzpQDyKoe36/q2OlM8h1zXoK7PL5A7FUNqk6tHJb0w?=
 =?iso-8859-1?Q?S3GuCwryOA8CZiq0YBB7L8lWYsKgMW9dZzvu1k/I1UHGN+GcfZagM3T/70?=
 =?iso-8859-1?Q?1/gUv6T4yLK14sJxG9agMhhyY4Tj2DN3Arm7hwMwCme1DPECwR0sJrGx1k?=
 =?iso-8859-1?Q?uunj7wT+cOQdB4W8h5pxcxCzSgtBuQbiZVhqmjfCt2RrPXo7vaOjY7dkO2?=
 =?iso-8859-1?Q?eK5FyezPhks59TnjCB207MZCW/wkkca4xFDOm8J1iL4IaYXckzpsLGR7sF?=
 =?iso-8859-1?Q?r5coBEfUfU52IWPTRQj3lmDPfOuious8p7tfzYLMAJ65RPZd2i/PEEYc1r?=
 =?iso-8859-1?Q?494t/PfJ/C21TCaDKOQcDlkM3boAkFGlgdK+WDkt3KLDfJLz89dvLJ94kD?=
 =?iso-8859-1?Q?yaEOrQscit/6Iwbu8pOhABVUO/1s/GiqSHgHS/XEkPMfjZsL1++4e9rPAT?=
 =?iso-8859-1?Q?MKTvBT2hCwu2YpKtMuNOi7eSW08OI8PUyCVJcXsb+lwkdHixIazJ5UeP6p?=
 =?iso-8859-1?Q?uNGbFMQik5mrXpJziqqIlfC75yUlOzBs88SswFlha45l71BrspBQJwCyJh?=
 =?iso-8859-1?Q?wrVo0fKwJIhRZ+0lfv6PM7t0tcuWv+U2MSug5l3upXY2MBZoT033zfQC/1?=
 =?iso-8859-1?Q?RSx/rT8Dj52FvJRE+lxrtzF4vfBsEM6a1uaaZL9H4g03qMCXXzZX0O+80a?=
 =?iso-8859-1?Q?U2VSn34+e6UU7nvVMGQDUGZk0qw7wuavRP6Os1wVLsAODaEKcY4hFuAV41?=
 =?iso-8859-1?Q?ZbKGLuZKkh1ilRsT7glTBNqrvwBOI06LF1itf8JdzADYBNLPQYEq2kUEFo?=
 =?iso-8859-1?Q?pUFeiAS31tjrC9jibo52WvHpHlMRCYILgaWyoHg/SWHR1EuZkwUaWEJz47?=
 =?iso-8859-1?Q?a1mgj3WwUqtdCGIGZdSWRh6qFByv6gWFhsgQrnMZdJp4qstKdl/vcBHJrO?=
 =?iso-8859-1?Q?KfnEqD75eR74BSih1Vmf8YdHRhFWiRvG4Ldtpy3bq1ot5pk2a6LM+GpKfF?=
 =?iso-8859-1?Q?5G+nUmBYs1t/7hsJXowUnRAS/OLk+GJNKhjVV075c=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 95afaae5-28ff-4836-2ca6-08dd330338b4
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2025 12:18:28.5271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY8P282MB5140

Hello,

Thanks for this patch. I'm looking at doing something similar for the Zenbo=
ok=20
Duo 2024 keyboard, which, I'm discovering, is similar to the ROG_NKEY_KEYBO=
ARD=20
devices in a number of ways.

Something unique about the Zenbook Duo keyboard is that it has an external=
=20
data-capable USB-C port, meaning it can be used as a regular USB keyboard f=
or=20
any device. This means that even if WMI features work, it is highly prefera=
ble=20
to use HID alternatives where possible in order to allow those features to =
work=20
on any Linux device that the keyboard is plugged in to.

This leads me to my question: Why the DMI check on the HID side? This is a=
=20
little problematic for me, as it blocks functionallity on other devices. Wo=
uld=20
it be sufficient to use quirks only in that case? The important part, to my=
=20
understanding, is that the WMI module disables itself properly, which is st=
ill=20
covered by its own DMI check.

Are there devices that use the ROG_NKEY_KEYBOARDs where HID doesn't work?

