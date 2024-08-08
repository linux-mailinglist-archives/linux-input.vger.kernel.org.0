Return-Path: <linux-input+bounces-5440-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A94FF94BED1
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 15:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E9E91F2200E
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 13:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84501148307;
	Thu,  8 Aug 2024 13:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="fPKygb4p"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2072.outbound.protection.outlook.com [40.92.102.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20ED63D;
	Thu,  8 Aug 2024 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723125141; cv=fail; b=MoR+gQ9WA26oM9pugRVqo90ZjPd785h/DOULyQcsBJ9wjzK11smoO+DvZX4B2w7qf0u6fnot+AX/FNAPuAEq/xTPNqKCxJL2LQVDOcMY9HNdlkHUkOpUKR/2m7im01zUsYx/ei6JZFNntBofu1RASlfb1PZSrLsxp6orFqSUXTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723125141; c=relaxed/simple;
	bh=ksj+9kigbAd7lgOyDE0QH31QaRW3sThCErQrLWY2ocU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Lc9DjS1yqpCpvqxIvGdX4wGUDKWixH/8XwmJ2EqjOgDEcLanCILPA98OpEUxLOJqk06nm4+MwTA4K2ej1Q37PmiMebSMqWSNee0qNf3RCC6p1JdNALbnqT/KslnuaCTiclzJyEfePj2jwIf3lappbr+ujokR9j+2SwF6UtwcgVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=fPKygb4p; arc=fail smtp.client-ip=40.92.102.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vV+llHRNt5/U9lnnRfBqlGJxAjxNtbn767cgw0PvDH+KYsPTYgsSTrRma0oFUCrQobOTJM/xE0jVxiKIkXinxs2+PHHnMisgSRmrewTeWndxPuX8MI81Hog6P8iDElqVMRupPLFpC9GJxltN1ZqrhhNbFP9VrWKfXYqfVCGjXtFrRqvHLw6gyAi6fjtqBsMGYLKfZBY5rkxxtYQftv7rGV5GGwNKXGqDJ4C4vYYm8GTxqAbICXZy/EN9Ezw7xbYRK6vwcMJq43GvsJ9VHQbgm8oAso+OMZ9JbwB3Om6CwUsvfowLKce/wEs5GxYHrsPjV18yBMwUIe4089zQhpokiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzJQNbir3aksonInPunSVUKKA+KLTVCBzdPlbfwum3A=;
 b=NzRcxtHm1G7Yxal3JfSbuA8cNQR6xCO1aCjZVYf6ZYNPhs5TPlSgnV7XtPLFdKAB5y/CiOuWoUsLaL+aH3PS1s7m35CMggeWBIBUNFQwUKMIlyn8kKFmyfKHngAf0P1n1+bxsCG1Y0m/f+WkIczehK23tuHT6ZJJGaLTtQDyvXisKckGlS4/E8CRIMGNO8V4HEZUxcsXxSgIWVE5dVJgki8mURyjL0b++zij4BJPOWguvCXLIvNW6XdcJSXnFTTR0FPVVfZIsyDknzLZUAUUfdWRUFQdX9H/16izjvNL9YseaFLjeiyiZF8qSwywcHEzBvbcWCu8QsVBVc6Axgf1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzJQNbir3aksonInPunSVUKKA+KLTVCBzdPlbfwum3A=;
 b=fPKygb4pH1bsUAroDwYrrlcpEpyXfxPUl0tGb+Ryq62nnPwkWVRTtekUzcDfqBZxDeJsEOq0dHnsl4/eAZJ56zbzBMBzFjeA8YZ7UX3OzeYkK3QfkIwxI2Uu2PQ9coobcBxdaQNDDbVU3zYh5zXcZZFL1eQKLA4o+yRFIUDAgn7YoUOI4rLgRDlGh+0z+piXf5bwxdMf2E5OuXkgckhr87BpJ20CitCccDd6GUmquLnAIPdRDnn2X3sEVFQDvzLuyQzYEEhtib7W9ONz8ODFG5Pu0LyWQsfRFMnercqnRsSd1YOzTxDuELCGtWolp40q6fsgV28jqNCQ6wiO5s++tQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB1976.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.13; Thu, 8 Aug 2024 13:52:14 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 13:52:14 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 3/9] HID: multitouch: support getting the contact ID from
 HID_DG_TRANSDUCER_INDEX fields
Thread-Topic: [PATCH v3 3/9] HID: multitouch: support getting the contact ID
 from HID_DG_TRANSDUCER_INDEX fields
Thread-Index: AQHa6ZosbH7BEGdHFU+LQ2KDcb73fw==
Date: Thu, 8 Aug 2024 13:52:14 +0000
Message-ID: <949B2D47-5E20-4B0B-9441-5B41610AAE64@live.com>
References: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
In-Reply-To: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [Rv2nliO8yvlGTGaj9NH4hhG3ufImDZ4F+yHiEDW/GIrEKPCQBosZgV65ZoEvep3Jvksfc/g3qnw=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB1976:EE_
x-ms-office365-filtering-correlation-id: 18d06f78-6ad5-43b9-0f5e-08dcb7b14f08
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|15080799003|8060799006|19110799003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 a1HF8TCa1+FoSPJ8ftTcEAIs4U++FZmyiZltWgzFY9VlFfzoel7jgXX5PYHbh985qhLfO90T66aHL3izYt8faHgsrL9syroS/c5AWGGoZ91jRWVYhFVcyluh4K338z8PYlEdLR/6Lmbr5cO5hP+f7ipfn04mocRInbvb79QmZ023ml2pnqaUz4ZsB/jJxjht8TxmuNVJpl+flA/JC0MjgxH5rKhgw3VD98ra88LXxho2TZybLbT50IajlPU4uS6D+/+JoeAOz3DQdg/7h6D7Y08upZfQTN9bdR0h2BExdGuckQkmpMLDu7ttz3nJ2FiFuFNG7dkW2wQ83IUdBAN4v+NJ3vgtMmqplb8kZoBMnak5xsGLX/q67m1+0oFhCbRUOUrJSmqI8U1rqvx2agIFaTb3KU5wHp/dmX3Igoq/A1CDCCmTS91UfvA4W05QzJ7XKUaMzqdw4sQK8x1dArQaiuSB93z/Ui3IzHqlctrZ1pu6K1Xgh0qToa9JS8c9bicP0aE1LiQ+9UGPA+kYeXhdv6AH71lq8h5nvSXcRug+Xe87YNdu022tzFbrzbUfvXt8KwPJxr55u2/S/zV+mzzqR+X4BIum/tBVWcmdYN9vaY27MB0oj1HoQzNeFx0ZlB8pDGLEs+u47HkuX/ePG2qNaSbv76/jtPAXgPZG55bTFtZ7YGGKaf9371zI72tkYQ+d
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nC8h7o0nP6RQFBWg3poWAvvZzNVfB/hnkhoTA+eXw1cu9IiiE2veXRa4fbT9?=
 =?us-ascii?Q?GvPQMHq93FkOj04PeXagjoZqDw5hFBSPDj+ZvGB1MnR26zwwtNl4gafMro+9?=
 =?us-ascii?Q?a7+qDsnmxIaDGIt/WxArpcIf8rejZnZBJ2YC6OvJX9V8RI0jA593U5h0DjuA?=
 =?us-ascii?Q?sxxdGf8+Hg6GXcGfp1PB4fPSroaeiHBjH6QXE4vhiw7WFDigFc/pz8POAPeM?=
 =?us-ascii?Q?nM3zgzY59b34FQiN2dhCVQPMkSMnhlD8jbP7Qku9+yCnEA6EncTAfCnnJGwy?=
 =?us-ascii?Q?86i732lkPPCfhgQbaKKhO3VftMSn3O3JTsQBsJH4Kr7t+PuDsJniSsdk+KPQ?=
 =?us-ascii?Q?SOxt2n0khQxA5X+z0hcJqwRje6x92I8ZcnisjN6opo4cao53aMlu4+7aVPNm?=
 =?us-ascii?Q?sIfuHv5olmw1O6c9VsMZ01FLTuCE4EP6GzqjRQlYNeCxPpQRNVqvh8oQz0+b?=
 =?us-ascii?Q?Ip5GY47XpM8PPxfQBAJdcTOi4bbltLM+5pCPSRYZW5EbG5K8W0Sp1MwMjUPg?=
 =?us-ascii?Q?cb4oyKWyJhT8vaYa1XRnuJezCye1454m3LODRQA0H8q1AjyJ02CYqqnCTpw8?=
 =?us-ascii?Q?Q2svAgVUcJKlmk+sY20EnRDm/pMOPlZn6Swg0nD+kKkAMcR7pPGqqGcIYHLB?=
 =?us-ascii?Q?GlSDEGsdJBKBjB/J5IhxklmwImYBtFkfrhzOgt14EF4rKpbMaggxiIizERb7?=
 =?us-ascii?Q?oJ3x76jFBKVzWbw3Me+1+bb281QcKMJ8pgdeWA0DIPPg6JArHy27+gaSrhXq?=
 =?us-ascii?Q?CGTJPjTW92Z4z7wAAMQYL3gX0d/efa9x2foxtsfpUK4ytgEzf6MEuDDbP1Ij?=
 =?us-ascii?Q?a3ZApbygTeSlweZ7EH7ZBuPzD7vv1Gk+Qwx0gazVaQ3VVsvYH1ZT22XHtjs9?=
 =?us-ascii?Q?30GFfXz0LfQ7D6Lkg0FIs6ysZYEaVVqurMf77r9hPX+xGYMgVrju1Fy2kYmE?=
 =?us-ascii?Q?QowLA/yxY1W3KgjS2fO+Z++T9KoAtOcmvwechpDNIx+mHN4l7CcNBarKFkd5?=
 =?us-ascii?Q?4gHamYPYBFyQa4F6pzm+E7cRkcDKttbVKlpZ2zjDXECRBKzwJwPWHq5WEZfq?=
 =?us-ascii?Q?JAKcS36lJJMwT4DhRltBF+ON0T7cZIWbwAEkfUBd3OeNzxRmGuBAtobJdPrm?=
 =?us-ascii?Q?GYD9jFeoNppf1ygqYEwJyhhuNvVj6U3BsksYrNM+ThFpPnHXJBXs+pbVv+Qr?=
 =?us-ascii?Q?8UhOJqWEgyukrVlUKSNljAaY15fzAoHGwfyoAlbG/AsItdLry9BzEhmtqzi+?=
 =?us-ascii?Q?xG5YfjAYpLsOJggI6nNT+rUON1ftI4VxziJQ/vPDGfySYdnKxIcUuUBmp3CH?=
 =?us-ascii?Q?IQNOcanB9ijU+VwSofmrR1QK?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4AC668852276794088C2EFC0245F1E30@INDP287.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d06f78-6ad5-43b9-0f5e-08dcb7b14f08
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 13:52:14.2733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1976

From: Kerem Karabay <kekrby@gmail.com>

This is needed to support Apple Touch Bars, where the contact ID is
contained in fields with the HID_DG_TRANSDUCER_INDEX usage.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 56fc78841..3e92789ed 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -635,7 +635,9 @@ static struct mt_report_data *mt_allocate_report_data(s=
truct mt_device *td,
=20
 		if (field->logical =3D=3D HID_DG_FINGER || td->hdev->group !=3D HID_GROU=
P_MULTITOUCH_WIN_8) {
 			for (n =3D 0; n < field->report_count; n++) {
-				if (field->usage[n].hid =3D=3D HID_DG_CONTACTID) {
+				unsigned int hid =3D field->usage[n].hid;
+
+				if (hid =3D=3D HID_DG_CONTACTID || hid =3D=3D HID_DG_TRANSDUCER_INDEX)=
 {
 					rdata->is_mt_collection =3D true;
 					break;
 				}
@@ -814,6 +816,7 @@ static int mt_touch_input_mapping(struct hid_device *hd=
ev, struct hid_input *hi,
 			MT_STORE_FIELD(tip_state);
 			return 1;
 		case HID_DG_CONTACTID:
+		case HID_DG_TRANSDUCER_INDEX:
 			MT_STORE_FIELD(contactid);
 			app->touches_by_report++;
 			return 1;
--=20
2.43.0


