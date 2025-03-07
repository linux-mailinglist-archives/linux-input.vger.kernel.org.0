Return-Path: <linux-input+bounces-10618-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CDBA5674B
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 12:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F72D1899620
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 11:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA6921885A;
	Fri,  7 Mar 2025 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="QJRez4Lb"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011034.outbound.protection.outlook.com [52.103.67.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2E121885B;
	Fri,  7 Mar 2025 11:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741348666; cv=fail; b=bDooSX1i4OyFTcj8rDwvoZQCyLN/QkqrBwLVaYcnpVP4cvQflFHhBe/cCivmeV9f2kFBw6MxRXqWC+DCQXRFiXB/bNES4c/wNLQrEcapAPEIqVZ041UrnSBxXu4yBMs/eKeO0x0BLNH9gUSLRQGgZGd8494yRnaJxaTRcec4MJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741348666; c=relaxed/simple;
	bh=hd6TCi9cxjGFUW3cjGinf3OtSiH5irxEjZHnX6flIDc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=spKfFkIrS7S5WkF8/qDfu6cmWdahcuTSvB0zmKIh7e0noUAw+ml6HYehrK7f+I0tb6fHjL/broB0yzxRxtQSDHd/xpUQcjrKnB0JOouBGRlsKtE0bfLqf8FkSkl9eBTBiT+x6lP+9mIOJYQoZOIJDafsZkq0wLL/CzBrcrQWUGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=QJRez4Lb; arc=fail smtp.client-ip=52.103.67.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbeE0Meg3hxZBVGiCsirIJLxKkh5HlfXqQ9dQcGlPbkA4UW+bOxgFTt1kb9IHjFdbZL7C8QJXrQiIDzkn0rGCuaDXDXBlny/km4Nk0qGlE2WZUROAfj/TAi2JMDJEHNn8D4YuLpVlkCo5ypQttqGdFpZhulqQZV0FxXwQdlS+ytOj0RoF9L/DfQBcMahOyH2Y5AeDe/XP/Q5v12DBvR3RzjeGEzzEu+AV4aHbIvGcXljmwuyaymiuJXRfXr7f+7XTXqsnyubtoY4nQTCLsuKKGnGKMCyAnF6r7oZxkwpmQzwOjVB49g3J0lV6ZCCyENywCkG9hW4x2wm9NGZpP888w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9tpJ/MCcRRU8FTjPzjGbV4CZ0YcaKbhV9ktpkNhIkg=;
 b=bnY5DQunmI5PJ1BEQCMS6qLScCsOhT1BZEShsOgQ+UJtUOS9eYIyEtqqVkvXwGAwk/J0YURrvMOiycekb5wVMIJWsNmtCD/Q2CtYYS05jKGD6un+rOeeHZDimvvIaiWMqqeouBDZJTkRFxACEomAwVIiCC6+TJwJ4VeKUHVVjDckXyeIix0b1chqbb86t+XgxYtXbQTfZVUWvgDMaGWjpEuFAnypFFeMqeSTpI/MFsLdEqiDav/wsrh+uxs8bAP+8g/urLZDC5hSwoillGUPvxKA9yBHkbrxhS699DTPvQC/uU69Ysgyekh81zfgF7DSi6v6VJ9g0FIPKfRSqDUmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9tpJ/MCcRRU8FTjPzjGbV4CZ0YcaKbhV9ktpkNhIkg=;
 b=QJRez4LbADwyqfMerzZgLYrCszQcVMG2r1NTfn76L1JqFheR93CtK5Krq4tDOZ+Qexep0sgJLqNgM0Uf593gJy9cMeVSz30NrDfaof9//AnK1bwFk3WA+tbr44JPVkl0qhbkwvMpnv5kiGrusQt7qhXsT8eV4jVhwiCEZTlG2Tx0nBfP3baYxRDmFNPp2fPgMk/+5NYSEVAHJya7GLFb7qnfmssjFFCgT/HWl48HoAUWbnD2WM84Kfh8dcM7W29V84C6Ct3GK1fC/h8QQ6AfM7Z5wjbQr+iQ3voV1AImi8UJ1cDb26T4UMzq5zGjfkXSft8RfszJGU50Xs8Rn6OLOg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB5697.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 11:57:39 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 11:57:39 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jkosina@suse.com>, Jiri Kosina <jikos@kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Grigorii Sokolik <g.sokol99@g-sokol.info>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH v2 0/4] HID: apple: combine patch series for all patches
 recently sent upstream
Thread-Topic: [PATCH v2 0/4] HID: apple: combine patch series for all patches
 recently sent upstream
Thread-Index: AQHbj1ggMNF7Z8EzSEyRo9Ep24SDiA==
Date: Fri, 7 Mar 2025 11:57:39 +0000
Message-ID: <A4FBEA54-C7BA-4864-9C4E-E41933D81FB0@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB5697:EE_
x-ms-office365-filtering-correlation-id: 8ae897b3-5d0e-4d4e-14b8-08dd5d6f429c
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|461199028|19110799003|8060799006|7092599003|15080799006|13041999003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?OjyC+Rw2R/CHR7RP0h+lyd19DHZAQR869dcsDbFary80x03PWsLUh8X6CpH8?=
 =?us-ascii?Q?Jz6yH2fJhiwqDzJANuE36Q5s7lHTXfd45t37UUK0rzVkMuKp5jeKVV7ALUgg?=
 =?us-ascii?Q?YFdPq18fIhEBlO3V9bK1Qf62PgET7hMz1MS6Cc/LZEOL/QhsWTc8VeRF8+iA?=
 =?us-ascii?Q?JUlmWft4BRPdFpEKT1OqfvH1h7iF6F480V+LESZaDg1/Fg42FKBgsHLEH+1C?=
 =?us-ascii?Q?3IY1qjTMxo/oXlvS5wP9tn+6pWD75e/kESx2J9VZbDB8n8qdkxNJbC1VyAE2?=
 =?us-ascii?Q?3RfHnJwoY7Nct6Wf4VGphR9DTaFVOH9QvdQ6uryaJlG2GcTTw9u+HSFnvhBc?=
 =?us-ascii?Q?7DGitcCM8rkt/zuApx5UUnO+hZRUASYIBFl1ImXqtkrjnTCUexl1jgRPOVKF?=
 =?us-ascii?Q?E+yQUvYqH2cg5Z6YV9KJ7b5K42JkWF2Bu3BAby+dbt07ZQHhAw8Ij5CjH5Iz?=
 =?us-ascii?Q?GNM3FBISbssF8npLBmks2/PQdXoY+y2Jsnb023hUbkUrWgheQblKqrflSoLX?=
 =?us-ascii?Q?V4WE7RsjDf9v4gfhkU5WxC5D+j5ScBRxmYzkCWvwHuyDnPtzTKQef2YJW1rf?=
 =?us-ascii?Q?m+R0wczCnxQ0y28yDUP2Slew9n9wqNi12fxeDq1qaQfug+FOwkuGR6RyuSSf?=
 =?us-ascii?Q?JhlCq1M8Qih+6p6JtjljRmnKYgu6G6qOPJLsPeALqtSvU/jD5Unhxhq6jXag?=
 =?us-ascii?Q?dkxNMQqSXeGbdh0Xq/nOIumgRixRk87dNe/vaBk2CeK2cZEpvw5NC/JKHBgr?=
 =?us-ascii?Q?/YoH+voNqzGTVgBo4e3wzip5pvYI7PrQxtr0nGiPWFHjxlCReXunM0unEy7u?=
 =?us-ascii?Q?1Po0oQB7k42PDjd8XcsxTBzu2JiUpFPjzErPWdGFARTwlGsjPN3lSSmI9FkU?=
 =?us-ascii?Q?7JiJRvRZp+i3azNzCh9oEp7XmfpJjBXatAEXwMkK9cugH1YF6rwalAtNZpb8?=
 =?us-ascii?Q?h4RB5H3bPxj3VKrcZOmHTT99lwcETFn1EAkzOeTa3bTn65/yl6HSvvYo/Foq?=
 =?us-ascii?Q?2BOCwUmmE0tavyORuLVw+pCMIdUWSU3mGMQyV+/Xu7ji6lsLcRn1Rg7ITKr6?=
 =?us-ascii?Q?tCVvPzKqvfw2J95qN1ITEGRx7c9WbEEB+BmbGx5ILrN5Zqx94Wc=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?z8JJ98PHHsKrTjPtxm/C9q/XU0QcDVCi5PnT2yhf9qoYMF9jy3kNBfLKTdHo?=
 =?us-ascii?Q?tIwKcsUutJGvr4cIwgn/KBmYK3upVySovUP4pr/VbWWfNrxgBNFXaza9Hwsu?=
 =?us-ascii?Q?u05WHoSQH3tcGvEnAtAbO8N3cSBCiWHsghbbfTr7Ee7oge3ysnB0+PCqPDQY?=
 =?us-ascii?Q?EUfLENgmtkxZkspP7JRfAEO8kR4zUzsbPhXL0uRkJ2GN0cdBeSaojPSzW7OX?=
 =?us-ascii?Q?fmDNOGXSuZYUsqv0PAnkuBDJKQ3s4yVCFr4vxcvrJHTDQ1A1+3cW8ZDdZ3yq?=
 =?us-ascii?Q?ReHEip6DEH8aLDNjKrWTvgaBD5+UDEH+0ziX7hgnw2B7kj1XbGwzAPIGrKvE?=
 =?us-ascii?Q?WcUFkMhGnNbibmYPR5EURIIw6yDeHotDpaIJQm+lvlc/IG8joR1U3RVzsZUP?=
 =?us-ascii?Q?BlX3kUUGtqmjUiaU8/aoNoWqZ04qRw0Ad5ZKaZ0D51JUVk/9AJ1Oa7Ev+QXQ?=
 =?us-ascii?Q?J+J+T8e1UnZMtYuzt7TQTB0oPMRa29278FjjZCa7yDb7xo6VGZNDD9zY4Qv0?=
 =?us-ascii?Q?/ZhiQyi32HZXlSZE6ctZBBNuLMqVgEl92hsoI2IS6hi0IS/9ymuGYFcarP8C?=
 =?us-ascii?Q?v80OgT/M7niGo01fGUhjYj+MfDW0icTjwgRziWa3B5Sfqw7WmVKOhiPCVwaF?=
 =?us-ascii?Q?1fv2RkujjTzXD7kQds5SdnjIAmoQY3dOUPWt9NceRUoimWte+IWgzjvK/r9V?=
 =?us-ascii?Q?pmnqCmFMh6uAoinAEa0aQHSZneRnoHrcAjV7TWcUFX8uWPkZGaoSTSkacyyS?=
 =?us-ascii?Q?hsqjYEzMmJJQ3g7rBtvktg3AGfyYtbwPuj/FjiNrmZs3NB226LzQpPUS/2/U?=
 =?us-ascii?Q?qXcbGLNAO/BQyxIzQNa7ecq4bgJuhtewgBcS8U2T1ZdFC+/XmvHwvQcYTFxA?=
 =?us-ascii?Q?SmmzvqjS9HLgZuUPIoCGghfmauwLLTojjopfsFN8nOAsFXgUDNSZWM4N2aU5?=
 =?us-ascii?Q?Qs0fa+YfWlDW0fPe78FOf++a/GkKtKn21J4dKL/tX1jNG1RjRkdIZgd6Xhl8?=
 =?us-ascii?Q?QQrnIDN/AUbs6rTMKCfLZ5k/9+pBcjs6wBgP76MtmF6yON13T8A86B7R1oBK?=
 =?us-ascii?Q?Ne8vZ6hgqHlM+BoFUEbJs8CJZtkgo7qmF1QB+dCqdDqx2M6+NAueKKj6/369?=
 =?us-ascii?Q?ZTuK4I+lc0UUZYvXaT75bb3CZcqYMwjEVqjVbQBMkgaq6Sz0xBPPpIUtA3q2?=
 =?us-ascii?Q?6nrAJR3Yr4RGGpEO1tAZNGW3TwNqtWdVaqM66DN5mxtW0yTXudvKNCVNc22g?=
 =?us-ascii?Q?uViQD6HmCHY5I1hAYDz9FNAvq5UtwAv1x2ulQN0y6X1lllORWbv6ihGPPxuQ?=
 =?us-ascii?Q?K6tO4SH9HqeaaaUIGs/zK6/a?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <330C7F4BA6493C4895BC1D8346CAAFA6@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae897b3-5d0e-4d4e-14b8-08dd5d6f429c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 11:57:39.6740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5697

Hi

This small patch series contains various pending patches for hid-apple in
a single series.

The first patch moves the backlight report structs, that were incorrectly
placed between the translation tables, to other related backlight structs.

The second patch makes use of switch case statements for the ever
increasing lengthy device table for fn translation.

The third patch removes the unused APPLE_IGNORE_MOUSE quirk.

The last patch adds Apple Magic Keyboard a3118 USB-C support.

Aditya Garg (3):
  HID: apple: move backlight report structs to other backlight structs
  HID: apple: use switch case to set fn translation table
  HID: apple: remove unused APPLE_IGNORE_MOUSE quirk

Grigorii Sokolik (1):
  HID: hid-apple: Apple Magic Keyboard a3118 USB-C support

 drivers/hid/hid-apple.c | 121 ++++++++++++++++++++++------------------
 drivers/hid/hid-ids.h   |   9 +--
 2 files changed, 72 insertions(+), 58 deletions(-)

--=20
2.39.5 (Apple Git-154)


