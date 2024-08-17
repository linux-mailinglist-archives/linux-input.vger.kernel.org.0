Return-Path: <linux-input+bounces-5618-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 414369557A5
	for <lists+linux-input@lfdr.de>; Sat, 17 Aug 2024 13:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BCEB28163A
	for <lists+linux-input@lfdr.de>; Sat, 17 Aug 2024 11:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9475145A16;
	Sat, 17 Aug 2024 11:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="j65dwuoe"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2086.outbound.protection.outlook.com [40.92.102.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176232114;
	Sat, 17 Aug 2024 11:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723895378; cv=fail; b=dz4Gv+xwHY6OdXVg96YLyIf5vtc/ECevL7o26xh+9rI2ruV+8/wk0zk2L6oVJ4MWLxMn3re0yLW/lZ04RWzBKe5YmewVpgg5BwB2FgdPKTeaLVUqGYoPNxbDzkay3K/Oxnp4wbyyXItWaLEE7YX1ST+sumnqyogiGi8NJFzjADo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723895378; c=relaxed/simple;
	bh=DSIn0rCuzaMxDHKXX705h12J8fR+BBIGU0iKhvR3YOs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N3Lbv6CLpRIUfEtco8qGn5uLf7bOW/fauJTlbXFCaErYg2CbNclPsV//0MNoePzlgqSy/jKmij/YdyS9o51gZA+aHcg0KeOALMN1uMh5v1LjFph6tREWDVzBeMjQKVILcrwgE0mOFIrgW1oMZd9f6VuK5yCzPBBIeiwGg8e7YCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=j65dwuoe; arc=fail smtp.client-ip=40.92.102.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXgBGR+wRWKg7IuMTx8UeR19mZuBUoEWg0bsQ0+kmZCHzJr6bsLYaR8ixaoXCSN05/69JvBiz8tsb2GaIvgyoHeZM44XS6jP7dmR0ly31JWQvTOaQwbbB42mivnCRuyt+Xuh6/ZOto3kW9ci5CqJMAfP6OpGNsancDhu2lJwb8TXIFsRdMMwM5tkH2NjlqcJItxwKCeGSUaGYBlZTtiQK4W1iFG2j2dh8rxRbAyd5emYyunThusIUIdbIRp5YehAGckLS+Rhwu2QyIkc9Zqo4Nu/r1mRLGhvbnvvJVeRA4b7QvVDnYitnGeUwPutRTpABNgdQqPTL3vgqn32LYdDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myY17nFmSwRYTFKqjQNWGfiM/kNxDYUsRpGSdEJLqhY=;
 b=v0dPbEa7QOb3u9HiM4asnjLJEjL54b+ri/LLJMkA8Jr4oWDjBu5RFd9jfia4f1JHMM4no8BsRc9LPhQ5y899SW1sCnttZyFiyrDWsk45fs9tCy5uSMiTlscDzJB+nOB+rpUWY0wnjXVaHCg9oOyQftSAiNslR/ya1KwBrzDj5AGDYExzyM91pYAnCKkIu9u67ixIygBCOQQEslsc+9YLQgFdXcVutPNKJ1MPrDNQg6iH5GupdM96RNcNzP2D/L/uh15Eq9bSB5O2h6X92825pfoa4kWZMwf6UgtRouQ2HlSf7yBI5a8N/Khi5qa0u6pe8JtPNKcjx7OWG3LfvjLpBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myY17nFmSwRYTFKqjQNWGfiM/kNxDYUsRpGSdEJLqhY=;
 b=j65dwuoeyNYNldHEcdWAgXrsi3YTWairklsCmLLfE/eGTBNfDZ3ipKltjbRWI8F9UtIfkqKj6RQ1tG1X6QwY8HjpcYZQhWnJvd7Y2GjInSNvTmYF7yPAjNMw9Osmd1zZKIcUpM6LL7VGhQBnI3Rl0UUglOhPNu5ZxrNcGSAYVGGQdpuLKtYt/CKLzOA1/WcJPMkjMVeHkVyxzH/jgBTKyHSg/4fJ8ZfYB1Yj9Up9+t8GNu+60jQZG9tlYw8jTbQoX0tInrTNdre/pt5p3nW9+rBueNQ0pLuEkl3vYqrpHMB4f7SXzBhoMs78wVwSOyfOl53LKhiogvyqa/w7LPSvZw==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB0241.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d2::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.20; Sat, 17 Aug 2024 11:49:29 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 11:49:29 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
	=?iso-8859-1?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 6/10] HID: multitouch: take cls->maxcontacts into account
 for devices without a HID_DG_CONTACTMAX field too
Thread-Topic: [PATCH v5 6/10] HID: multitouch: take cls->maxcontacts into
 account for devices without a HID_DG_CONTACTMAX field too
Thread-Index: AQHa8JuE5QMYD2v6V0Cg7E5Ci2VY0Q==
Date: Sat, 17 Aug 2024 11:49:29 +0000
Message-ID: <1AE4AB8C-7C1A-40CA-BC7D-146A67460490@live.com>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
In-Reply-To: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [bJ8yja5UFWK6IQG1st9Q/RvUu1sckXdME8WPfZfSR4YM2RczpzOAXa5ang5SSE4oiVGAjI/4Dfw=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB0241:EE_
x-ms-office365-filtering-correlation-id: 3f91b49f-2889-4050-6739-08dcbeb2a709
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|15080799003|8060799006|19110799003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 ICFq5JPTmzJSJsV3v6QDpvYDBs1CG/WQn/4qfhk42qQBgQeNurLfoEVarO03C4pYKp6OiE4+A3ufCfJNsm+60PdaRaOer+yPnYgDROWZcR1WIe84YPR50HY63mo/z5hQzi+YnU0w2vPUm8un5drgRtQZiIbWHuuhLVzsjITcm0a/gu+uHPRvaeoe2QZVwF6CjeXVeU6VhWNYOo31kXiMApftpg6igHQxMTLqDkhugq4oGidFCsD5Y0mw9+HtpMWWrE6Y0hwBvr+3WGLp1fBCojH9WuoGJO25Bvi4ZzUo4aLcHAeYMIZjM3VNcK0J6+g1G5sombHeIcROPd9iYsLxEyLxwb4TBkicJMpAbANNVihuujSkoIh3m3XDdcObT1/35c4SwZOohmeYSKSJH3KLGsPdJqyoR+fCqkxBPwvN+z4Uczu9A1Evfm27RHmcY64WTZkjJX1GbzcXZ1nb98gfet1Arpd/97zX1hCkHqkNg1KsatrJ1abfNss14tFIuNKtSHLJQIQVLXTnLTmZY24U2KTUJcu3/Zac0gacXQzgGfVLlC+VCNjcaRXdeznVC8p9zN5QzGAs6UbDmrwCN8t151HzYwN2UEH8iHEgIUIksDU+yNF7OI3t8DdcEYBRLR+XsQ5vQN1X5FonsTFWtOXXvvl/xmL4sbIJ1wAZbTEYafQmpfZjrufPNKnqUWNQsWom
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IIM1aG1SzGp9dthEwJHLyyw4srXRanH9jUjJx34H4WETBJ/4OYWCx3fbk8?=
 =?iso-8859-1?Q?ZqVr8SU3jWlrVol/jYpyYg7pjFdu72vSc4Ek38kyvsHI4mk/lMqatinKL7?=
 =?iso-8859-1?Q?i9cj9JaeTGqWrcA5zDzO3LCQ8c2Zen35i7OtNki5EpxFjzY101BxxD2eSM?=
 =?iso-8859-1?Q?MlSvirDCoOJ78z4Hsu+J54cxYPGWYL/pxXJF92i0I/snG5iJoD/NHw30xw?=
 =?iso-8859-1?Q?Isrz/+iheaAOfxVjlFs0wf0l1slG8srwypPO7rxNWZZIOG+wo/sdRBml4d?=
 =?iso-8859-1?Q?uktjTm0mlQwOfGRLpGkJ4B1xgRqQPxwZU6ls/U8r4a+xN6xpZ7pR7Ikx5T?=
 =?iso-8859-1?Q?s4/HV+/4LU9dG4kpWHVdk0hnxI67OHOtgUJ74XiszaJ+OI237Gx+9h47Qs?=
 =?iso-8859-1?Q?YgZ5w+pSdwhaeahFP4noSAfHUygZfZqruJZXrD16v672M2kAI6v/Yw7Hd6?=
 =?iso-8859-1?Q?N3rIB8cvzXWyZzRB+cZSR6NHbuBnemT43J/1tLJSycnxKKRCCRdzGAU1su?=
 =?iso-8859-1?Q?8jWL5Htuh0Q+4mv3qO7U0sdzamMM4jvNjCKD8BOPxU5PkFvlFW5W+pMWX1?=
 =?iso-8859-1?Q?jdUhzLuSsS7RNkh/AXGKbbRpfQ8OPAxVZNP1+GoeyxgDI+UuaHoKaOBeSz?=
 =?iso-8859-1?Q?0kO1oz8NvVhdV0Xk3wsE9cuVf8Vd7YwJRgqcPaf6qbnETjc1kZppE4BzNJ?=
 =?iso-8859-1?Q?Ohc3Mey6WML29B8w+n5gTgZ0rnnsJGuEtXWwKTeqhF1/zEiVDu0AnLwtKZ?=
 =?iso-8859-1?Q?SAKfNBSwZZqj0T3J+KJi5M072sV3CBp+25pgSLjBgtCjie4rGuuLbw7MbO?=
 =?iso-8859-1?Q?LtUmNgdjG2cI3r3lMLebQeYbqCzER9dlPtMe9r/6qzdhwSvbpJ7rJmHBty?=
 =?iso-8859-1?Q?objfgrGtZx6EUK+pHqgQBAlXt/cxn0AawVQkvi43zNUXlwbzV8CRnCseGy?=
 =?iso-8859-1?Q?O34mnN9avVAT1qukyDY9gXCos+kp1637N0BvrpkR4ifxFZ+dE054ysA5f9?=
 =?iso-8859-1?Q?q+U7gb5MpUas8BgIqNFHSwi56PjqiCSPhOjRpTg+Xv87T5gKkGvHWgPtUm?=
 =?iso-8859-1?Q?dXgYEpkiwK6a/81Oidd4tamcAfu17zvQq6zFihtELL/vCuNkOTZ5yV8MAW?=
 =?iso-8859-1?Q?lbGR+ANDK8oUQPq/CNsXPKIRav3/cNQ+wHzCT5xNRDqPOlqTvQ8dOcqdRD?=
 =?iso-8859-1?Q?wMr96C+XNTKhRzln0CXXOUPu0L7zRkicRhO45cTqFOZC6+3LTtEZmED85+?=
 =?iso-8859-1?Q?Lwjh8NjaQJfXvG7Yq43C11spm5nSyiendeeXsf4Bx0QU/3g/Fmqv+LmAQm?=
 =?iso-8859-1?Q?ZSjNXsmQgJ/5N9I63zrvif0OFo6YKE1O8Kj2huE577cGvo3WqmGwQPbbI2?=
 =?iso-8859-1?Q?BXFTH25sAn?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1A07FC1BD94C0F41BB5D13E524035A72@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f91b49f-2889-4050-6739-08dcbeb2a709
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 11:49:29.5418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0241

From: Kerem Karabay <kekrby@gmail.com>

This is needed for Apple Touch Bars, where no HID_DG_CONTACTMAX field is
present and the maximum contact count is greater than the default.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 571435da5..60b675cd1 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -490,9 +490,6 @@ static void mt_feature_mapping(struct hid_device *hdev,
 		if (!td->maxcontacts &&
 		    field->logical_maximum <=3D MT_MAX_MAXCONTACT)
 			td->maxcontacts =3D field->logical_maximum;
-		if (td->mtclass.maxcontacts)
-			/* check if the maxcontacts is given by the class */
-			td->maxcontacts =3D td->mtclass.maxcontacts;
=20
 		break;
 	case HID_DG_BUTTONTYPE:
@@ -1309,6 +1306,10 @@ static int mt_touch_input_configured(struct hid_devi=
ce *hdev,
 	struct input_dev *input =3D hi->input;
 	int ret;
=20
+	/* check if the maxcontacts is given by the class */
+	if (cls->maxcontacts)
+		td->maxcontacts =3D cls->maxcontacts;
+
 	if (!td->maxcontacts)
 		td->maxcontacts =3D MT_DEFAULT_MAXCONTACT;
=20
--=20
2.43.0


