Return-Path: <linux-input+bounces-12518-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD7AC0216
	for <lists+linux-input@lfdr.de>; Thu, 22 May 2025 04:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E6CB1B64183
	for <lists+linux-input@lfdr.de>; Thu, 22 May 2025 02:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D853FBA7;
	Thu, 22 May 2025 02:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B7ITALHq"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80B01758B;
	Thu, 22 May 2025 02:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747879510; cv=fail; b=MkuoQx2+IlEIHhes023KZvmCf+Yh+++wEgz9sCRI5pH6Kyf/XS7PHHtmK6xbiRCDKqA+i6QuwGzxUxss2/uh848ilsneCAxmKrRQ0oqhBXqADxErnmt924JmtgQb30PImPjm1UingXyipkk0lhMkgB3lP7Ka4hz2g1Tgzdbtoow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747879510; c=relaxed/simple;
	bh=DS/SVdLzV6cnA4rlODrulujMNybpq7A3QsZlvyUpt1k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sCB4HTj5OYylYF+CDCcofNjWEDhhEJpXEZ/Q8Lu5UJP+QxZCfC0a44UifYuPAblUpnCPvU8bo7a6jzccgs/rS3qRb41HzOaa62Jn63IZ9Wk7FSzpG6yU+vuHvNoisqMr2ZC4Og0Hk1KYW6Q9ATakkXx/kqtfC5WnaDBRpYABZng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B7ITALHq; arc=fail smtp.client-ip=40.107.21.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8s9oxjFmc6yTqHcpgxsrNCL16cHTrvMCvi/6UavoL6KVqI56eAQWiZJzLWtRRZDGT2DCk3SB+2fpkA5bXllJ44WIhp5xpSeUFDLx+IKFCY2t1yd/h5D+u8E1kArFDyfANeJxBi6ZX3PQAOdDBTE1xaOBvP5ge0zch5X5sqRd3We1sjDbJZhPWrxoVK3IrmgL6UP5xtYuI3QXd4Bm4KKsTjx1KTS7QkFa79Y9iDbyb6xYyTgnXiKJYUd2LBk0fi2WCsEE53NEiJgHgLHo2zMx/erf9hRIBa0RFerqzuu5kUcVffTKZQK9/NzFS242MKC2Bn0ZpDfpePUt1uPPO1bLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DS/SVdLzV6cnA4rlODrulujMNybpq7A3QsZlvyUpt1k=;
 b=pyUSkJe2BDiHWpcP48zKoWdQ5Nw5MI53L7K3443wjWdQOVSV8Qk/sGm3EMxnSDuFgfMln7VN02KF6BLkNFYoDpoxDyG/vAMpdP0rc7FhZh98DmXXI2rCY2ec8WisljW3XRHcS3X2jmn0eFfajHAYZOwm4ResaYJTPyl5MZHOSKETpvWr3ff6tW9qwWaG0jvqqTXUinTYT0L6+JCN8a0XLHLJVvUbvwNm3yTJyJOP4kx+Y4pD09C/v4Rp+vuU88T7/XyY3JBI01plI4f+4V3+O/PNTACusc8ZWbKdj0ASZCLGVZu8KWV3b769D+FNWGRvxb4VYW+PwYzfoL3P1rsXzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DS/SVdLzV6cnA4rlODrulujMNybpq7A3QsZlvyUpt1k=;
 b=B7ITALHqFssVWlBh3iV4F92m4j61vNAm0boFqXc7BgJZ67i2PFdswfNoDgQsiOVZ92pcqC6jaYrp6V/MIJgXgCHyjIts3eoCalidJ3rGivGfoc/3GXRyOf4Z9oxVEmN7SQqRLMoPgIg40nZEJ1YCxMBQ+lxCE/bPojWGKD/LKkRhPo7UgZZvpWDFbsFqVUJTTJQrP6+CBu+KmKu1YWSyk0uPoURD3AIn9SN3orNiRtW4bHy4zMQytOogvoL8BJ4SJa1P4PNJ1QKG/L4INeomt0W3CRWH22IUTs2xsXERJM5UCwv89MykebambBreS5y8XcQR4LQZGbaLm8FPzGS0PQ==
Received: from DB8PR04MB6939.eurprd04.prod.outlook.com (2603:10a6:10:11d::8)
 by GV2PR04MB11215.eurprd04.prod.outlook.com (2603:10a6:150:279::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 02:05:01 +0000
Received: from DB8PR04MB6939.eurprd04.prod.outlook.com
 ([fe80::cfc9:8c5b:b1ae:59c2]) by DB8PR04MB6939.eurprd04.prod.outlook.com
 ([fe80::cfc9:8c5b:b1ae:59c2%4]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 02:05:01 +0000
From: Joseph Guo <qijian.guo@nxp.com>
To: Hans de Goede <hdegoede@redhat.com>, Bastien Nocera <hadess@hadess.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, "open list:GOODIX TOUCHSCREEN"
	<linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
CC: Bough Chen <haibo.chen@nxp.com>, Justin Jiang <justin.jiang@nxp.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbRVhUXSBSZTogW1BBVENIXSBpbnB1dDogZ29vZGl4OiBhZGQg?=
 =?utf-8?Q?poll_mode_for_goodix_touchscreen?=
Thread-Topic: [EXT] Re: [PATCH] input: goodix: add poll mode for goodix
 touchscreen
Thread-Index: AQHbyfshhBUmOrbKHUOgoE3/puuvO7PczySAgAEYPjA=
Date: Thu, 22 May 2025 02:05:01 +0000
Message-ID:
 <DB8PR04MB693958107D4F60467DB7B4529499A@DB8PR04MB6939.eurprd04.prod.outlook.com>
References: <20250521025011.887562-1-qijian.guo@nxp.com>
 <496e6e58-8ed4-4536-bca8-feb89e7e6e69@redhat.com>
In-Reply-To: <496e6e58-8ed4-4536-bca8-feb89e7e6e69@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB6939:EE_|GV2PR04MB11215:EE_
x-ms-office365-filtering-correlation-id: 14221be1-3e47-40ad-ab9f-08dd98d50f97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y21vTDkwbGVUZHM2UmJDUlR1VU5lMHJJdm1oc3BrdkJQZEkwUUtxS3dtM0lB?=
 =?utf-8?B?VzRpaWJ1Y0oreENoR3FlaSswb3BOOGZlK0RaMStzbWQ5bW5MT3ZveW9RYkdM?=
 =?utf-8?B?ZkxSRStoNncxMjFTM0ZkSGtXZTBmVVFiQzVEdXN5c3ZtTVhyZXlsMm4ydEQ4?=
 =?utf-8?B?cmcvV0EwMmgrVC81bU9NdUw3Mk1WREo2QWcrU0t6eWVyODhUdlRuUUVLNm1t?=
 =?utf-8?B?S2Zhbmt0YTZJQVZXYXc2TGJwVlJoZGN5UlpzNW5pelZ5bWJ3L1BWbGJwVlZF?=
 =?utf-8?B?dEdHd1FJejROUTZ1RDBtUUJ5R1BQTGRjYWs5T1lERUc2VktKdGFnQnA3UjBR?=
 =?utf-8?B?akEzUVkyeU9hMWhEaFJxd2taVitZWTZ4dDduNjg4ZDZiRDlSMFB5aTc5c3hi?=
 =?utf-8?B?Q0h6QUJyaE9FK1lIV1VXNnovN0tnQW5CcTA2b2ZYVy9RS0xwclVxWVd1SERC?=
 =?utf-8?B?Q3IrTFk0dGtPN3hEMlhBTWoySGVtZC9PUFZtNnNJSFE2dXRqZ2xqRFg1S3Rt?=
 =?utf-8?B?Um9CL1BKaHVsZEtWRjd1SFlrdUFSTVJyRFBqeXdETjRpY1VVYTJOcEVCcUk1?=
 =?utf-8?B?N3FadXI0R2lMME5zWU41N0hYakFTNWFlZkVuWEo5WFZFalJ5bitzQys0Z2U4?=
 =?utf-8?B?Z3VMemVpZmlReTd5T3VYOENyTE1JNVZHQ050bUh6MlJoS0lqeVYrZldCS2Y2?=
 =?utf-8?B?L1Awa1V0MkF5SlFEUy96TGkvUFE5ZGRZcGNtQmxqaGFqeGZCc2VwclUvRllE?=
 =?utf-8?B?a2pUNHRDNStkS1BmTUlsRnpTTzJacTFHQjlrMDNxR2hhT0ZJL09hRExyTTZJ?=
 =?utf-8?B?NXpldktoOFRwV3JwdWVDMGFuMWtISEVZdEJLZi93VDdvV0NWZGoyanBybnBu?=
 =?utf-8?B?dDhuVnlmMjJrM3o5QmZBSTZQdkhnNnRUQzRXVFhINFc2QVluUFI2Y044dzZR?=
 =?utf-8?B?c0xZai9sUlVsWTF4dEVIRkFhbHZEWi9PcFdGd1ZnSUhMVTUycWlWK1BpNXhu?=
 =?utf-8?B?VmlhNUJiWC9hOHQ0UVhYRUxlV0VSOWs2bHVFUVVuSWFkUUVQWVFSUmdCdmls?=
 =?utf-8?B?VDdnQzJpa01udzZDejJSWlVhUERIVnczM3VkdjdobmFDTHVRdVNrL3RicDZt?=
 =?utf-8?B?WkgwLzYzRW02RGtlRXVkTytlZlQ1QUlxUC9uZHU5YVlNR0UwaDRaekNBTHVn?=
 =?utf-8?B?eW9SSVMyMFgyOHFkS0k1dDFON0dMZGVPenVwMVZ4MmIwMjZURnZxbS9GNUhu?=
 =?utf-8?B?Z05Tckt2ZThpRmlYa1NTaW81TW1kS01XQlArbzhwd0RTLzZQenFGZzNxTDNM?=
 =?utf-8?B?QmhzN2VMT0R4UUd3SkhMVVgwM0N6NlozdmJGMTU3RkZESzJFa1lLRE9yR3kr?=
 =?utf-8?B?U1RNOW1uV2ZJTU5CZ1JZSEl2KzlSRXFxVlRFY1lGL2xib2pwOWM5ek03SmNl?=
 =?utf-8?B?RWhSbVR4WDhGRmNjRlNmMWZOekZzTFhsWmpIRW1GQ0dLRHNKN0dHOEN5VllH?=
 =?utf-8?B?bGNPVnRTUXl6bUNtbDJDNHBkcVBRSXk0Q3RTTVNHYWJEVXZqMGN6OTVpT3Fv?=
 =?utf-8?B?WHNueEZRcFNSeFptbVJtVFBYSzIwejdvTmQzWm9hM3pORFlndGtrYjB6T0hq?=
 =?utf-8?B?MU5KblRUSkZ4bjZOSnR1UU15NkRxa2hDM0kwa0dUSHIxRzlnMnpWME9wOTZH?=
 =?utf-8?B?L0x5RVBzOGFkTXpoR2UzVGUwVThUK002bG1tUGZCTWhzSXhVQ29LRXJsVkwy?=
 =?utf-8?B?bHl3OWRzSnVTMlZicVNvdk8xaDRvZmYzUTBoZ0xMbGp4TmJjWmZheGZSVTg3?=
 =?utf-8?B?OGVDU0VPK2JlS2Z2S0hJTUZ6UURSUWRTZHJTSWFsZGxOUVovenkxb0dQVCtV?=
 =?utf-8?B?TU9oclYxZWN2aFZ1aTR4QklSYUtSRnlaYTYzalY3Y3UzVFJ6T2swZzBPVUJO?=
 =?utf-8?B?R3BWN3d6bytUS01wdGFqTHFzaUtIUHgwQVlSVXlPa0pLaFh1TldSTE8xUG5E?=
 =?utf-8?Q?KN0HKzG/pAgA1FTTy9a9waU/qURVn4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6939.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3RnOXVXN3FSTG04aW9QMzJYTjlUOVhJNnNtc2ZlYkRaQk9YMzk5RW1xQks5?=
 =?utf-8?B?eXRHVzdrOHV0bjA3TXpEM1liNEtIemh6ZE11dnp1NGRxR1p6eUFldGxhKzFz?=
 =?utf-8?B?WGs3Ti8wUWNIcHNNM3dqaWVlckt3ZWZVTUY3dUV4Q0t3TE82dVpCSUU0RnIx?=
 =?utf-8?B?U2pGNmVQNGpyQnVBS2p1cDZ1NWpqVUFDUTVoWFZqQW5kenVNRVpUc2Z0UjFR?=
 =?utf-8?B?ZzhxU1dyVVdQMGF5emlYYlkreHFodm5JM3NQSWx5TW93ZGpxL0l0YXVSQmQx?=
 =?utf-8?B?MDJQTnhrZ0tBNVFWakdrblNsVm5FRUJmVElSanFBTlhGUVVIR0MreHZuM0Jh?=
 =?utf-8?B?ZGpQOFZ2eDBiSmJ2bkpOS3h4RkhKai92Vmc5SWc1TzZSTzRmTkVmV0p1Yk9o?=
 =?utf-8?B?S2NNYWtod0lpbHAxam5hbGd0ZXlSd0xSQ0R5aG9XTy9YUXIxU3pzcWd4a0pE?=
 =?utf-8?B?TWZGR2pXdlNQS1dmbVlESi9VZnZjUlEwWVg5d2JIdktHUFM3RGVrU0RiblRH?=
 =?utf-8?B?T3FMYzk2VjBGK2loYUVMd2doYjR5WVBTSGEycE1XaDZkUjQzVUJJcnl5RGxq?=
 =?utf-8?B?VDR6aUFhdDk1ckIyalg4bm5VU05PZkpJUTVmRVBsNkJ3TmVqaDVaakZpTGlp?=
 =?utf-8?B?aUVLTW9DWDNHRlpWc2dFSFN4bnVsWUdwL2xKalZIOEtldHZVVEVhVVhTckVB?=
 =?utf-8?B?ejJpSE5CSkFRWWlva05yT1N6VEY1OS9Pemg0eEhEZ1JmWGZWbEdQOHhFTTls?=
 =?utf-8?B?QkpKeFN3YXd2QWpZU1dCZ3VSTEp0ZFZBcnVDSVpPZEY0RXJMUG9GYWpBN2Rw?=
 =?utf-8?B?NDFINDdvQ01yZlNvNjVGUHl6eGxmbUF1ZE5RVDRSc25kQVRkemhvZWJDTmo2?=
 =?utf-8?B?amVFUVgzUGRaOHJlZVZoQmI0dk9JczJSOHFUeXJLRDFTaXI1QSsvM0lNbVRo?=
 =?utf-8?B?WFprREQ4ejMyZXVSNzZFalZ1cVJEMXRKU1JRYXpMdFU3Unl1Zm8yRUlPaml1?=
 =?utf-8?B?VHVtU3k4R1oyRW9yems2L3FoVE1zUkthOEx1aytFNXc1YjJ2SE9vTkYrdHBR?=
 =?utf-8?B?bXRaVzhxb3VJenRXejNZOUxlK3FDWXBDSkF1MklPVDlDUXc4Zy9GY01ma3lv?=
 =?utf-8?B?NTEwd09QR2lIL0NqMWo5SlZiNFFuRko5d0ljN3BjV3ZMc1VxWDl1T0UwYXZK?=
 =?utf-8?B?UTYvM2Rhb0x1MmUzaHNRQWlaZlhZWHZ2U05Hdys0NVVzcmRYTVAzMW9CdWJD?=
 =?utf-8?B?ejFVN1VFdmFiNHZlZjlhZzR2dmFGSFRuZU9ydlRtZS9LT2ovMlBDWU0yY0g0?=
 =?utf-8?B?K0lwRDNhOXdLeTZNVUV1ZmRYZFRJQVNiSUl2RnllQzFYVTNOblBBNE0rVDI1?=
 =?utf-8?B?NnVRclhJVUtJUlFEa2hmYktlaGttdWEwaERJVU4wMEN5OWlYWWRrQmV6YkQr?=
 =?utf-8?B?a1BnSHVrVkdrcTVLMjZucU1qNXBGbGhYQ1gwa0ZGMVFhOG9LSnd6RW00Q1Ux?=
 =?utf-8?B?QitqUXB3VDhxL3VlRUlyUFI1KytBTlNvOUR6My9GVHIyZ3lQVnFoa2JuNmFK?=
 =?utf-8?B?TkFkSGthekRJbEFmOFhsWDZtTjJiODJQNHBtbmh6eXpaVFB3a0hCMFVBK3Fn?=
 =?utf-8?B?WHRRQWttL3hZU3psdUV3bStLR2dGaUFSUTVZb3lPb0FrRmxVdm55ZURSajFa?=
 =?utf-8?B?bGdQZW51ZE5aaEJnazZXdnA4dVpCV2N1SnFPenlRcUJMSW95RjFKRXhWY2E4?=
 =?utf-8?B?YnUyRGVkVXBjUlVmM0ZEYkxmc3Z1Q3l6QlVVbDMzekFGaEczaThaVHF0MGlZ?=
 =?utf-8?B?eXFQMmJKb1ZEaGkvYlJ4dWt1ak9ST2JORmhnclh5SkhKbGZ2OEVFcWpJaDMv?=
 =?utf-8?B?S2x5enprRXRZZmMrTHNVN3hhN1hrTFo0Tk9VL2s3dUIyS3BDTmgvWklpRzlH?=
 =?utf-8?B?Y1R1OTkrekRRcjNLZHRLR3RNSHdPc0k5ZmpFUjNvakhKdkxmWEhCOFBwTGhS?=
 =?utf-8?B?Q29lWGhRN3dtYkVia09EUmZVeDNLTE9LWFZjdVpUYSsxd2NhUXVLeHR1YUhy?=
 =?utf-8?B?R0lNQWZPcEdLaXczTTFyMTMrK3VyMVBXTmk0SnY3a3Z6UVlBL3JUbEp4Q1Nl?=
 =?utf-8?Q?7bew=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6939.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14221be1-3e47-40ad-ab9f-08dd98d50f97
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 02:05:01.3479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DH3EVIlDAJNiEjW/9lmMtcEF43xtMJJWCbrhxqqdHltj6O/IGPsyG162wtYUt692zBAoydm5zX3e9ipGtT27zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11215

SGkgSGFucywNCg0KVGhhbmtzIGZvciB5b3VyIGdyZWF0IGNvbW1lbnQuIEkgYWxyZWFkeSBtYWRl
IHRoZSBjaGFuZ2UgaW4gdjMuDQoNCkJlc3QgUmVnYXJkcy4NCkpvc2VwaA0KDQotLS0tLemCruS7
tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5j
b20+IA0K5Y+R6YCB5pe26Ze0OiBXZWRuZXNkYXksIE1heSAyMSwgMjAyNSA1OjIwIFBNDQrmlLbk
u7bkuro6IEpvc2VwaCBHdW8gPHFpamlhbi5ndW9AbnhwLmNvbT47IEJhc3RpZW4gTm9jZXJhIDxo
YWRlc3NAaGFkZXNzLm5ldD47IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWls
LmNvbT47IG9wZW4gbGlzdDpHT09ESVggVE9VQ0hTQ1JFRU4gPGxpbnV4LWlucHV0QHZnZXIua2Vy
bmVsLm9yZz47IG9wZW4gbGlzdCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4NCuaKhOmA
gTogQm91Z2ggQ2hlbiA8aGFpYm8uY2hlbkBueHAuY29tPjsgSnVzdGluIEppYW5nIDxqdXN0aW4u
amlhbmdAbnhwLmNvbT4NCuS4u+mimDogW0VYVF0gUmU6IFtQQVRDSF0gaW5wdXQ6IGdvb2RpeDog
YWRkIHBvbGwgbW9kZSBmb3IgZ29vZGl4IHRvdWNoc2NyZWVuDQoNCkNhdXRpb246IFRoaXMgaXMg
YW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBv
ciBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3NhZ2Ug
dXNpbmcgdGhlICdSZXBvcnQgdGhpcyBlbWFpbCcgYnV0dG9uDQoNCg0KSGkgSm9zZXBoLA0KDQpU
aGFuayB5b3UgZm9yIHRoZSBuZXcgdmVyc2lvbi4NCg0KRm9yIHRoZSBuZXh0IHZlcnNpb24sIHRo
ZSBzdWJqZWN0IGhlcmUgc2hvdWxkIGhhdmUgYmVlbiAiW1BBVENIIHYyXSBpbnB1dDogLi4uIi4N
Cg0KWW91IGNhbiBkbyB0aGlzIGJ5IGRvaW5nIGUuZy4gOg0KDQpnaXQgZm9ybWF0LXBhdGNoIC12
MiBIRUFEfg0KZ2l0IHNlbmQtZW1haWwgdjItMDAwMS0uLi4ucGF0Y2gNCg0KT24gMjEtTWF5LTI1
IDQ6NTAgQU0sIEpvc2VwaCBHdW8gd3JvdGU6DQo+IGdvb2RpeCB0b3VjaHNjcmVlbiBvbmx5IHN1
cHBvcnQgaW50ZXJydXB0IG1vZGUgYnkgZGVmYXVsdC4NCj4gU29tZSBwYW5lbHMgbGlrZSB3YXZl
c2hhcmUgcGFuZWwgd2hpY2ggaXMgd2lkZWx5IHVzZWQgb24gcmFzcGViZXJyeSBwaSANCj4gZG9u
J3QgaGF2ZSBpbnRlcnJ1cHQgcGlucyBhbmQgb25seSB3b3JrIG9uIGkyYyBwb2xsIG1vZGUuDQo+
IFRoZSB3YXZlc2hhcmUgcGFuZWwgN2luY2ggcGFuZWwgdXNlIGdvb2RpeCBndDkxMSB0b3VjaHNj
cmVlbiBjaGlwLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKb3NlcGggR3VvIDxxaWppYW4uZ3VvQG54
cC5jb20+DQo+IFJldmlld2VkLWJ5OiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+
IC0tLQ0KPiBDaGFuZ2UgZnJvbSB2MSB0byB2Mg0KPiAtIFJlbW92ZSB1bnVzZWQgdmFyaWFibGUg
aW4gZ29vZGl4X3RzX2RhdGEgc3RydWN0DQo+IC0gVXNlIHBvbGxpbmcgaW5mcmFzdHJ1Y3R1cmUN
Cj4gLS0tDQo+ICBkcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2dvb2RpeC5jIHwgNTAgDQo+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0
L3RvdWNoc2NyZWVuL2dvb2RpeC5jIA0KPiBiL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZ29v
ZGl4LmMNCj4gaW5kZXggYWFmNzlhYzUwMDA0Li41OGU0OWU1Y2YxNDggMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZ29vZGl4LmMNCj4gKysrIGIvZHJpdmVycy9pbnB1
dC90b3VjaHNjcmVlbi9nb29kaXguYw0KPiBAQCAtNDcsNiArNDcsNyBAQA0KPiAgI2RlZmluZSBS
RVNPTFVUSU9OX0xPQyAgICAgICAgICAgICAgIDENCj4gICNkZWZpbmUgTUFYX0NPTlRBQ1RTX0xP
QyAgICAgNQ0KPiAgI2RlZmluZSBUUklHR0VSX0xPQyAgICAgICAgICA2DQo+ICsjZGVmaW5lIEdP
T0RJWF9QT0xMX0lOVEVSVkFMX01TICAgICAgICAgICAgICAxNyAgICAgIC8qIDE3bXMgPSA2MGZw
cyAqLw0KPg0KPiAgLyogT3VyIHNwZWNpYWwgaGFuZGxpbmcgZm9yIEdQSU8gYWNjZXNzZXMgdGhy
b3VnaCBBQ1BJIGlzIHg4NiANCj4gc3BlY2lmaWMgKi8gICNpZiBkZWZpbmVkIENPTkZJR19YODYg
JiYgZGVmaW5lZCBDT05GSUdfQUNQSSBAQCAtNDk3LDYgDQo+ICs0OTgsMTQgQEAgc3RhdGljIHZv
aWQgZ29vZGl4X3Byb2Nlc3NfZXZlbnRzKHN0cnVjdCBnb29kaXhfdHNfZGF0YSAqdHMpDQo+ICAg
ICAgIGlucHV0X3N5bmModHMtPmlucHV0X2Rldik7DQo+ICB9DQo+DQo+ICtzdGF0aWMgdm9pZCBn
b29kaXhfdHNfd29ya19pMmNfcG9sbChzdHJ1Y3QgaW5wdXRfZGV2ICppbnB1dCkgew0KPiArICAg
ICBzdHJ1Y3QgZ29vZGl4X3RzX2RhdGEgKnRzID0gaW5wdXRfZ2V0X2RydmRhdGEoaW5wdXQpOw0K
PiArDQo+ICsgICAgIGdvb2RpeF9wcm9jZXNzX2V2ZW50cyh0cyk7DQo+ICsgICAgIGdvb2RpeF9p
MmNfd3JpdGVfdTgodHMtPmNsaWVudCwgR09PRElYX1JFQURfQ09PUl9BRERSLCAwKTsgfQ0KPiAr
DQo+ICAvKioNCj4gICAqIGdvb2RpeF90c19pcnFfaGFuZGxlciAtIFRoZSBJUlEgaGFuZGxlcg0K
PiAgICoNCj4gQEAgLTUyMywxNiArNTMyLDMzIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBnb29kaXhf
dHNfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGV2X2lkKQ0KPiAgICAgICByZXR1cm4gSVJR
X0hBTkRMRUQ7DQo+ICB9DQo+DQo+ICtzdGF0aWMgdm9pZCBnb29kaXhfZW5hYmxlX2lycShzdHJ1
Y3QgZ29vZGl4X3RzX2RhdGEgKnRzKSB7DQo+ICsgICAgIGlmICh0cy0+Y2xpZW50LT5pcnEpDQo+
ICsgICAgICAgICAgICAgZW5hYmxlX2lycSh0cy0+Y2xpZW50LT5pcnEpOyB9DQo+ICsNCj4gK3N0
YXRpYyB2b2lkIGdvb2RpeF9kaXNhYmxlX2lycShzdHJ1Y3QgZ29vZGl4X3RzX2RhdGEgKnRzKSB7
DQo+ICsgICAgIGlmICh0cy0+Y2xpZW50LT5pcnEpDQo+ICsgICAgICAgICAgICAgZGlzYWJsZV9p
cnEodHMtPmNsaWVudC0+aXJxKTsgfQ0KPiArDQo+ICBzdGF0aWMgdm9pZCBnb29kaXhfZnJlZV9p
cnEoc3RydWN0IGdvb2RpeF90c19kYXRhICp0cykgIHsNCj4gLSAgICAgZGV2bV9mcmVlX2lycSgm
dHMtPmNsaWVudC0+ZGV2LCB0cy0+Y2xpZW50LT5pcnEsIHRzKTsNCj4gKyAgICAgaWYgKHRzLT5j
bGllbnQtPmlycSkNCj4gKyAgICAgICAgICAgICBkZXZtX2ZyZWVfaXJxKCZ0cy0+Y2xpZW50LT5k
ZXYsIHRzLT5jbGllbnQtPmlycSwgdHMpOw0KPiAgfQ0KPg0KPiAgc3RhdGljIGludCBnb29kaXhf
cmVxdWVzdF9pcnEoc3RydWN0IGdvb2RpeF90c19kYXRhICp0cykgIHsNCj4gLSAgICAgcmV0dXJu
IGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoJnRzLT5jbGllbnQtPmRldiwgdHMtPmNsaWVudC0+
aXJxLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLCBnb29k
aXhfdHNfaXJxX2hhbmRsZXIsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHRzLT5pcnFfZmxhZ3MsIHRzLT5jbGllbnQtPm5hbWUsIHRzKTsNCj4gKyAgICAgaWYgKHRz
LT5jbGllbnQtPmlycSkgew0KPiArICAgICAgICAgICAgIHJldHVybiBkZXZtX3JlcXVlc3RfdGhy
ZWFkZWRfaXJxKCZ0cy0+Y2xpZW50LT5kZXYsIHRzLT5jbGllbnQtPmlycSwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLCBnb29kaXhfdHNfaXJx
X2hhbmRsZXIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdHMtPmlycV9mbGFncywgdHMtPmNsaWVudC0+bmFtZSwgdHMpOw0KPiArICAgICAgICAgICAg
IH0NCj4gKyAgICAgZWxzZQ0KPiArICAgICAgICAgICAgIHJldHVybiAwOw0KPiAgfQ0KDQpUaGUg
J30nIGhlcmUgaXMgd3JvbmdseSBpbmRlbnRlZCwgYWxzbyBpZiB5b3UgdXNlIHt9LCB3aGljaCBp
cyBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5IGhlcmUsIHBsZWFzZSB1c2UgdGhlbSBpbiBib3RoIGJy
YW5jaGVzIG9mIHRoZSBpZi4NCg0KU2luY2UgaW4gdGhpcyBmdW5jdGlvbiB3ZSdyZSBkZWFsaW5n
IHdpdGggYSBtdWx0aS1saW5lIHN0YXRlbWVudCBJIHRoaW5rIGl0IG1pZ2h0IGJlIGJldHRlciB0
byB3cml0ZSB0aGlzIGFzOg0KDQpzdGF0aWMgaW50IGdvb2RpeF9yZXF1ZXN0X2lycShzdHJ1Y3Qg
Z29vZGl4X3RzX2RhdGEgKnRzKSB7DQogICAgICAgIGlmICghdHMtPmNsaWVudC0+aXJxKQ0KICAg
ICAgICAgICAgICAgIHJldHVybiAwOw0KDQogICAgICAgIHJldHVybiBkZXZtX3JlcXVlc3RfdGhy
ZWFkZWRfaXJxKCZ0cy0+Y2xpZW50LT5kZXYsIHRzLT5jbGllbnQtPmlycSwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwgZ29vZGl4X3RzX2lycV9oYW5kbGVy
LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cy0+aXJxX2ZsYWdz
LCB0cy0+Y2xpZW50LT5uYW1lLCB0cyk7IH0NCg0KVGhpcyB3aWxsIGFsc28gbWFrZSB0aGUgZGlm
ZiBzbWFsbGVyLg0KDQpPciB5b3UgY2FuIGtlZXAgd2hhdCB5b3UgaGF2ZSBhbmQgZHJvcCB0aGUg
e30uDQoNClJlZ2FyZHMsDQoNCkhhbnMNCg0KDQoNCg0KDQo+ICBzdGF0aWMgaW50IGdvb2RpeF9j
aGVja19jZmdfOChzdHJ1Y3QgZ29vZGl4X3RzX2RhdGEgKnRzLCBjb25zdCB1OCANCj4gKmNmZywg
aW50IGxlbikgQEAgLTEyMjksNiArMTI1NSwxOCBAQCBzdGF0aWMgaW50IGdvb2RpeF9jb25maWd1
cmVfZGV2KHN0cnVjdCBnb29kaXhfdHNfZGF0YSAqdHMpDQo+ICAgICAgICAgICAgICAgcmV0dXJu
IGVycm9yOw0KPiAgICAgICB9DQo+DQo+ICsgICAgIGlucHV0X3NldF9kcnZkYXRhKHRzLT5pbnB1
dF9kZXYsIHRzKTsNCj4gKw0KPiArICAgICBpZiAoIXRzLT5jbGllbnQtPmlycSkgew0KPiArICAg
ICAgICAgICAgIGVycm9yID0gaW5wdXRfc2V0dXBfcG9sbGluZyh0cy0+aW5wdXRfZGV2LCBnb29k
aXhfdHNfd29ya19pMmNfcG9sbCk7DQo+ICsgICAgICAgICAgICAgaWYgKGVycm9yKSB7DQo+ICsg
ICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKCZ0cy0+Y2xpZW50LT5kZXYsDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAiY291bGQgbm90IHNldCB1cCBwb2xsaW5nIG1vZGUsICVk
XG4iLCBlcnJvcik7DQo+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZXJyb3I7DQo+ICsg
ICAgICAgICAgICAgfQ0KPiArICAgICAgICAgICAgIGlucHV0X3NldF9wb2xsX2ludGVydmFsKHRz
LT5pbnB1dF9kZXYsIEdPT0RJWF9QT0xMX0lOVEVSVkFMX01TKTsNCj4gKyAgICAgfQ0KPiArDQo+
ICAgICAgIGVycm9yID0gaW5wdXRfcmVnaXN0ZXJfZGV2aWNlKHRzLT5pbnB1dF9kZXYpOw0KPiAg
ICAgICBpZiAoZXJyb3IpIHsNCj4gICAgICAgICAgICAgICBkZXZfZXJyKCZ0cy0+Y2xpZW50LT5k
ZXYsIEBAIC0xNDM1LDcgKzE0NzMsNyBAQCBzdGF0aWMgDQo+IGludCBnb29kaXhfc3VzcGVuZChz
dHJ1Y3QgZGV2aWNlICpkZXYpDQo+DQo+ICAgICAgIC8qIFdlIG5lZWQgZ3BpbyBwaW5zIHRvIHN1
c3BlbmQvcmVzdW1lICovDQo+ICAgICAgIGlmICh0cy0+aXJxX3Bpbl9hY2Nlc3NfbWV0aG9kID09
IElSUV9QSU5fQUNDRVNTX05PTkUpIHsNCj4gLSAgICAgICAgICAgICBkaXNhYmxlX2lycShjbGll
bnQtPmlycSk7DQo+ICsgICAgICAgICAgICAgZ29vZGl4X2Rpc2FibGVfaXJxKHRzKTsNCj4gICAg
ICAgICAgICAgICByZXR1cm4gMDsNCj4gICAgICAgfQ0KPg0KPiBAQCAtMTQ3OSw3ICsxNTE3LDcg
QEAgc3RhdGljIGludCBnb29kaXhfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gICAgICAg
aW50IGVycm9yOw0KPg0KPiAgICAgICBpZiAodHMtPmlycV9waW5fYWNjZXNzX21ldGhvZCA9PSBJ
UlFfUElOX0FDQ0VTU19OT05FKSB7DQo+IC0gICAgICAgICAgICAgZW5hYmxlX2lycShjbGllbnQt
PmlycSk7DQo+ICsgICAgICAgICAgICAgZ29vZGl4X2VuYWJsZV9pcnEodHMpOw0KPiAgICAgICAg
ICAgICAgIHJldHVybiAwOw0KPiAgICAgICB9DQo+DQo+IC0tDQo+IDIuMzQuMQ0KPg0KDQo=

