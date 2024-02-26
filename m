Return-Path: <linux-input+bounces-2093-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 795648683E2
	for <lists+linux-input@lfdr.de>; Mon, 26 Feb 2024 23:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EF7F28DA10
	for <lists+linux-input@lfdr.de>; Mon, 26 Feb 2024 22:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F591353F9;
	Mon, 26 Feb 2024 22:39:35 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04olkn2100.outbound.protection.outlook.com [40.92.75.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44631E878
	for <linux-input@vger.kernel.org>; Mon, 26 Feb 2024 22:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.75.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708987175; cv=fail; b=OECX+BDfjjFhXljGSlKd2+sOXlwt70KWb8Cy6GTDOduAT356DdaEXDMJ/2xsAiDze1vDjBY5ShpNS94s3GccPQvB3c8xJvjouh96ZtLT9caU5gNoqwJuJDad+LbzkqbM0N4MaO340E9XbsPqBiU82GKKkIAIwte9b4F45Xlx+9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708987175; c=relaxed/simple;
	bh=HbXHPPvYh3agSVr/XidprSukZVRegCE584Ie1rFEPFA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HDpNxE9aWvnvY/n7rF7C1VemJV+j7MHPLLPfXiABUI+Vugt5m3z1nQZ5XxBpGtM5jeWndI6TsBb8y1KCrp0T9jCAzuNVigNTQtC+uCf7dhTEFZzVOfyCMhL28+YIPrpEQrwA+A8hR0D4JScyM8Jv+b8rM/lpATY2ZU9f9YsZ8h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.pt; spf=pass smtp.mailfrom=outlook.pt; arc=fail smtp.client-ip=40.92.75.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.pt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUM8tPnzYtSRrPj/jqsAqBe0ZBUQINFgaTLT2c89gWjQagZJ+/EBXutgU6f868q3SRWE6VlcRbs7RRsA5LFEF9btzNN8cb6Ed38jFAXx7YA5VqbnyRDcLl2VpqW6m5p2UI+N7FAKzGLsesSSFRMJVeTOj+oNFwuE06QEknQn68vAucg69uq4hEGcX5Mqs6NfU0RipOKmDWouGWs+9xwyOx7H3P0M4+vT1vjx1jRmUBMQ7cYkhjqifeEPc3gt3E7V0eZqkZbZ16t2IMd8itBubwXv+FwGWm7YxRoE14cg/cLjZ05mDTFXXTDhwBsKkWN8A08gSR/VbrBYQnZt5K4ngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hZIkjOuagEPQ8GHurCS6oHBMERxErEMMGg+og83V5w=;
 b=dTC4ypCkOnCizyHRNUF6AqBJ9dksh82q6aWWG7xrZOiVaqxQehc0ptRR8RbaJtmk4eubd8RGDOzx63g4TociARgfXrCT+1z9+Kg7hGl6zEqj0isLnUjqAZ2t610H7aHugZagn8MmB+TxshXWIIKH7ccMR6KduIoQ/ae8I94WYrXe8QJ6M+z9n71bONEnXa2AAveFf7pmpLSqLjmL3tUWk6p0YLjTF1bS5YCTO+LF0On60b4d0MATz0g3Y5UBYq3b1BJM7zliC04DrikfUalaj3B/6Brc2K9/51nAnwtVzvY1Iz6FrdnYbxSo0Wic6miR46ODdpcjCssvL1luIqNMGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DU0P189MB2044.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3bc::10)
 by PR3P189MB1001.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 22:39:31 +0000
Received: from DU0P189MB2044.EURP189.PROD.OUTLOOK.COM
 ([fe80::d8d4:7065:fa11:ba45]) by DU0P189MB2044.EURP189.PROD.OUTLOOK.COM
 ([fe80::d8d4:7065:fa11:ba45%4]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 22:39:31 +0000
From: Nuno Pereira <nf.pereira@outlook.pt>
To: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC: Daniel Ogorchock <djogorchock@gmail.com>, Ryan McClelland
	<rymcclel@gmail.com>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>, "jikos@kernel.org" <jikos@kernel.org>
Subject: [PATCH] HID: nintendo: Fix N64 controller being identified as mouse
Thread-Topic: [PATCH] HID: nintendo: Fix N64 controller being identified as
 mouse
Thread-Index: AQHaaQOGaWUcQg00tEKCUeoMRSTM5g==
Date: Mon, 26 Feb 2024 22:39:31 +0000
Message-ID:
 <DU0P189MB2044EAF345CB76578D8C1A5CFD5A2@DU0P189MB2044.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [x6MSQ+cbIHMO6wS343kEaTrVDvHzfCg7]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P189MB2044:EE_|PR3P189MB1001:EE_
x-ms-office365-filtering-correlation-id: a41733b2-8fe0-470d-98c4-08dc371bcc4e
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lKdojOg3NEU/xcyHiJoMIPtUcayL8dv7tXyr07PYHzyFwfotQk/5XnjO0u6sNBhW7k0v9+udZ+aW7ipkeDDIuYXhvauQtfeeWJ57tKgPH0fAy0Z/Ha6SWkBh+Ty8vnQb4LfDfVXZXtQY5/SjnD1uToi3tjG1kqecquCtFeakZq1h2Igm1buMxeeRkuSOwkHDkQtG/xHsTchYboFmJgvKorRe2RFpQNQL/wacnhuIq8o4/eloUhIRis+zgTsBDJw7wo5eCz7pgJ9xLtpXrRQCvt/kDfCMVtOIZjJA33QMMnT6bPh/mbWo7nWVmFHaN1PCQzn5NQ6mDtzQiKI+TFxq1StauTV5E6zwCpnFQ8TJEODZznfWDYLnoifh6yTMocTh6NZvZIxcbz+sXcqGul+VgrvrxGnfXdjXKjN8snFS83aPjYRWrMEIAEB43IoulYWvBT2vV5Zd/xYrJLWnmj9UVqkLTcMFjqJdtcXs2W+dspkJcXkQto24MGu6K9X2miQAO75Bm0Cv1XsdBDYTPpy+dkP2+vtxOkmbMpI9cYOiIPP48WKTHmqyOK60QiC+Zzyp
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RzctQs9nAarJxJp6xNmBypk9JhCnx0k65DObXA/JZ48HXKZhbtAMiQIXZt?=
 =?iso-8859-1?Q?WHNRCrUe7pkEOqe5WZzOoCpnGUptwF0Hf+uKx5EKCL9ycINLn42qReOwo7?=
 =?iso-8859-1?Q?EgWqDVhu7MUI76mSU3wwIEEQbdXgxyETt06/v1fqylGX3saooMfO7d3DJq?=
 =?iso-8859-1?Q?Yn0jf/K/DFP0s7IYpal4LVLiqH0jDnBXiGMYnYW5QQxIKmSD9hMMok2mcE?=
 =?iso-8859-1?Q?eLiQ2twsNIz6py+3VBJI+jKq2wHmd/YOCcXXWv4rrgpJbsgmbdAdKB/gnH?=
 =?iso-8859-1?Q?8TmHiJrd7GP01wPas31sw7bbRYEuxYxgdopPa5ABLZeejESDm9ywrKm2Or?=
 =?iso-8859-1?Q?i4q+d41i3KGlu0AOFW3VAldF9Z2Nby+t5+lqZNDe8poj1sHvGlRpoBHXTs?=
 =?iso-8859-1?Q?cfEx2X5DkIZK7JiqLBLkTpYYplVHCxgqSbaTkhchnYI59IuTOCh1nhVE/f?=
 =?iso-8859-1?Q?XRb+HUh2pZZbL/xigFVqRYHoQadSXZlzL2movnyJYtwsotWMP8kZM3LjkV?=
 =?iso-8859-1?Q?rIB3L54P4ArdlcmykVKtH962R0J+Mrs5fMpzVYhEFYwvHHRzjdItc0j5BU?=
 =?iso-8859-1?Q?WqpAOVvuHyiCeVOo1DJEq1iQYDVvsFxvh0KCU37pMw1bzK+KfpvmBYu80j?=
 =?iso-8859-1?Q?Fb4x9Qo1XZpxPyIWnlVe5KHCtIvNPq1dytEEL/RVftE1kmW85Emy3NGVB7?=
 =?iso-8859-1?Q?dn97Z8Qc/wkMpOukSnZS7TTkOC7URGauiHA7ZtudEMkvVdnls3v2TrLLHp?=
 =?iso-8859-1?Q?LLxnTwtc52RpFvtbyQV+qQKFwUWAU/Kg75TOr38DqutYVS3dWBxR9mvI4j?=
 =?iso-8859-1?Q?Ysqyvdv+pI/UvQ61c+1T9F3eZFQw0YC6K4w7HtWjy6OhzqGHADZfEYDtBS?=
 =?iso-8859-1?Q?SK3T07CEHXEx9LZh/EfL96G2oLHb2MysIOYeMiABSve1JqdrDJO/d8kZfG?=
 =?iso-8859-1?Q?vKcvPFTrNAlAvaI00ELu45nKb6tgW8cEYvtHiBa0OEt0FmWbqZO0Eba484?=
 =?iso-8859-1?Q?oT3YoPoaCTUM+bovrMVgX93eYrdT3jNKyqO2+sudZY/wZtjp3X+bOTn8At?=
 =?iso-8859-1?Q?j5NAYlgxFl/RHkKn10ICGUN+5n3x/Orq+ODhsD7OaJjmJ9HRIly8yGOKrp?=
 =?iso-8859-1?Q?7aTwu0R+y+8EesrwT2yuD0p/s0TxwCRFu6nZZjVe5Hf998NUWBYYg1csU7?=
 =?iso-8859-1?Q?f3lyOc3JWGtrtxy3LoDuvDT58IgFKd0vb5+gIwESCchAAzF4cEitCsa/c4?=
 =?iso-8859-1?Q?wNzFzUYRsegZTFeIZAzQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P189MB2044.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a41733b2-8fe0-470d-98c4-08dc371bcc4e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 22:39:31.0855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1001

This patch is regarding the recent addition of support for the NSO=0A=
controllers to hid-nintendo. All controllers are working correctly with the=
=0A=
exception of the N64 controller, which is being identified as a mouse by=0A=
udev. This results in the joystick controlling the mouse cursor and the=0A=
controller not being detected by games.=0A=
=0A=
The reason for this is because the N64's C buttons have been attributed to=
=0A=
BTN_FORWARD, BTN_BACK, BTN_LEFT, BTN_RIGHT, which are buttons typically=0A=
attributed to mice.=0A=
=0A=
This patch changes those buttons to controller buttons, making the=0A=
controller be correctly identified as such.=0A=
=0A=
Signed-off-by: Nuno Pereira <nf.pereira@outlook.pt>=0A=
---=0A=
 drivers/hid/hid-nintendo.c | 8 ++++----=0A=
 1 file changed, 4 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c=0A=
index ccc4032fb2b0..4b2c81b49b80 100644=0A=
--- a/drivers/hid/hid-nintendo.c=0A=
+++ b/drivers/hid/hid-nintendo.c=0A=
@@ -481,10 +481,10 @@ static const struct joycon_ctlr_button_mapping n64con=
_button_mappings[] =3D {=0A=
 	{ BTN_TR,		JC_BTN_R,	},=0A=
 	{ BTN_TR2,		JC_BTN_LSTICK,	}, /* ZR */=0A=
 	{ BTN_START,		JC_BTN_PLUS,	},=0A=
-	{ BTN_FORWARD,		JC_BTN_Y,	}, /* C UP */=0A=
-	{ BTN_BACK,		JC_BTN_ZR,	}, /* C DOWN */=0A=
-	{ BTN_LEFT,		JC_BTN_X,	}, /* C LEFT */=0A=
-	{ BTN_RIGHT,		JC_BTN_MINUS,	}, /* C RIGHT */=0A=
+	{ BTN_SELECT,		JC_BTN_Y,	}, /* C UP */=0A=
+	{ BTN_X,		JC_BTN_ZR,	}, /* C DOWN */=0A=
+	{ BTN_Y,		JC_BTN_X,	}, /* C LEFT */=0A=
+	{ BTN_C,		JC_BTN_MINUS,	}, /* C RIGHT */=0A=
 	{ BTN_MODE,		JC_BTN_HOME,	},=0A=
 	{ BTN_Z,		JC_BTN_CAP,	},=0A=
 	{ /* sentinel */ },=0A=
-- =0A=
2.43.2=0A=

