Return-Path: <linux-input+bounces-11788-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F03A8A375
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 17:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 229AD17E520
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 15:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25051FDA9B;
	Tue, 15 Apr 2025 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="M8hdyU3r"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010012.outbound.protection.outlook.com [52.103.67.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AAE1EEA59;
	Tue, 15 Apr 2025 15:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732551; cv=fail; b=q9NHqAsWGwsp0BG6bRkAiODJJENXAbC4OBJpu7J0t6yZ7z0BlhjKIvc5SXZdJkIsUP9QMcq+v5NgvxNZ+34hsCu5qWZhXhaBhoz/+5YRMKHoP3ngA34sTXPzztAdEp6twiYQAgK6y67yQ5SScVHuP9bQNjNwtSF4DDzZ+R19FBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732551; c=relaxed/simple;
	bh=Njd/qfe4tA9tiwx52iVgjaaUQrOfjQvdiCzpQ7G41E8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ru12L9edBNiTNxBn091aEbRcQm0yclQ5omeW7taMTiro1IWsDyPYwxLEqVnzfKXRIQmZPNcdhR0I+sMMWhAVk7lJucP50sn4Q+W7UkIVj0vcEpPNywH2sBjQxBhbh5gwm71rB1WOmcFSbmiq22MGq7AAmUMI4ip2bp5gaG6P1+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=M8hdyU3r; arc=fail smtp.client-ip=52.103.67.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hiNCLswDTlGmGp5hvp/VceOw4qBCD71JDhF6nANRlIRJEOIuY3sSPqVjwSQW/sc8zoib9/lS47pHLphswRzF+KBTdEsOdv/aPLKHDga0Ei7SBXUMRWnb4kDGo13n43RTUgkXxx1xNXNftDh+E/Vwd7+Pg5o9/xwwhFYP+VQJefZZEdi4dhjVJqj0mZ3YsHA/oRa4fTY1UQzjYQY4fWaACL4S3a07WTDIhqu8cyjBaOdphL+yYMeeLbJQRTN56V3asPezOwXXDUOvqPGZel5imhmaC5AL0+Gi8MpuhjbKgrWGTgdJbTFchKLHY0/hf/slUoUzmw22M7eohTgAJJvurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Njd/qfe4tA9tiwx52iVgjaaUQrOfjQvdiCzpQ7G41E8=;
 b=N0qGOBZMyByChQyi5FImjJINdr4PU64KQn3UonQL+5LrgNpYo3ubyrjXh8vuZd1/YajOklK9e7Fcf/3cgzTSpTwWNDXqrnD2K6hZTinHtxiQfUgSrOgHc4PIkkPildpZ5NIt3NKU6EBKG9jumMtxo8xl53Q4rhH/3zzaa3RNYpYjD8y0DXopo/np/7n2vRbnELSMXI70wmRUBZz49+DKBXMz2mBLKILVltU4tpxk3/wjVmurXXmdslXC6dIZTDsb3f1Y1I1tJsUxk/Tt1P2UlzNK6Q+RsMDOPpViCF8esLOX5nIo2QjE0/EipRVwNzj+laJ0wXestTEpI/dwQD3W7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njd/qfe4tA9tiwx52iVgjaaUQrOfjQvdiCzpQ7G41E8=;
 b=M8hdyU3raBx0kGnlkbPhL5BJ2jp2B3We/TnBR/BJNXXPm7EcYqPkqT1hskx2DznIDRdPsz5IwO3HVccRTWHVQZLx8A4lpe/IvRfEaYt5j53w/+jM0M1cFUgLoMAaPS4cr8oAmW34jlo9c4/MmbVu97sfO29uUR9gXEItqDRBDO4ryRzzoIW9r2EwK3Oh/OO+sfDT2LRszAIGzTgTgSY+SpThQRfEfbs4hD6xfkGVj+FtK4cxF7crbc6cf+V4HO8+xZg/MNjJ4tPbJJmJwdvlJvxyWQUEnvzzECod8e3kImjxPCx0CR+76WuAkLwD65fQpaQY7GqGDKbVwnL7TxuB2g==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9647.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 15:55:44 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 15:55:44 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, Benjamin
 Tissoires <bentiss@kernel.org>, Benjamin Tissoires
	<benjamin.tissoires@redhat.com>
CC: Grigorii Sokolik <g.sokol99@g-sokol.info>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH RESEND v5 1/5] HID: apple: move backlight report structs to
 other backlight structs
Thread-Topic: [PATCH RESEND v5 1/5] HID: apple: move backlight report structs
 to other backlight structs
Thread-Index: AQHbrh7YoHjMlIqGXkmOor9ehQI18g==
Date: Tue, 15 Apr 2025 15:55:44 +0000
Message-ID: <7FF04FFB-40B5-4978-9082-DD896580D42F@live.com>
References: <665A7C7D-0AF3-45C3-BB48-DDCFF9C63B4D@live.com>
In-Reply-To: <665A7C7D-0AF3-45C3-BB48-DDCFF9C63B4D@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB9647:EE_
x-ms-office365-filtering-correlation-id: c8005a39-1521-4218-05c3-08dd7c35fb3e
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|461199028|19110799003|8060799006|7092599003|15080799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JyQqhj9l0rwa5MshNTwqHm77G64LcgzYG3LDdbwAKsYcPp0MBnjUwGsDlXHP?=
 =?us-ascii?Q?hTVqC5RkeE7Reu0u+S1QrcwWpCAcMKSfp8P3wudrc1PIWF2fmcA0kgVfbYUM?=
 =?us-ascii?Q?6IHXeRO70Y/OiiejXUph6ZDI6WLyntfZcqRkK/AZjn/j/yhGO9r6ZAFJCEe/?=
 =?us-ascii?Q?7k9nNLM51kLI3OdjMnKWofbECn63MCQIN1N1IEzcgTkdPWp0n7qjJB5IpJub?=
 =?us-ascii?Q?TX9xakjPk+e9KnzzDDo7M3SOZREteLe3Q8Ao033bbfkKgsphhy05wROlEFOK?=
 =?us-ascii?Q?4q6YOSIPHgpXaqKtP9r68GanzotDOX/IbLysZejAog9DbtoSsUWURIUQy4IM?=
 =?us-ascii?Q?63Gx4THkjkHhgc3snIuoya2WfV40aTnvkJAA7SPE7XKFXigivZBhR7Y+WqPh?=
 =?us-ascii?Q?mn5sKcIda81OfLCABjJcx7Zpcm6u+FkX/QnF1KOjxO+j1tfDEdtxW7OleTzV?=
 =?us-ascii?Q?kYpau+1pg5BE8yz7dWzjYoVaRtzlqs1EV5jD18BSjooMjzsOs/354lKRVbDC?=
 =?us-ascii?Q?thhokKFYZjD0U/t6g/8FH6Za7s3/Sp8k5HA0rUHG8sX6/3VpLjm9RYltIJ95?=
 =?us-ascii?Q?6IylbN3oyvnwXRtQuPeV3TI3bLjimvqp9ARej3/UqEODrCakUzm1FB8Nifjm?=
 =?us-ascii?Q?o97uwBY/ZbZTkzTT1SNk9BVUku+eZs4SHyG4DFN0wzXs79cDiLMXzWCBj5oY?=
 =?us-ascii?Q?SZ+Bed4bP9dfgVAwvgAi/W5dWc9RTUdQacxhF8GPP+LrieeSCXMBb9elK+aa?=
 =?us-ascii?Q?/PyvPIimc6mznCiG1Kk1qByZShAEfz36udlt5PIgqkEqaLQOKuKXTnev//IV?=
 =?us-ascii?Q?+RJYFQ9qba8S9ycHFCnJu8lobJXJm4rtSAkZMkGIKI0EqdQcvcHR1Gg/rksD?=
 =?us-ascii?Q?2BYHqTyr4jON7rp6qmku/cLiik+sGeQUUdF53NOg6z55Ns5S/yFcD668blx/?=
 =?us-ascii?Q?8hOtxTjv9qlErRN/4EHFuCPcVwUp1Koys7k2r1Aq6ls2rbZw9gAYEdJuhh2s?=
 =?us-ascii?Q?F+6bE88ZKm7Ds+h3hXzViqLHLoVYjz8aZ9fwr8KwVcxsC++o433XR/ob9Y1g?=
 =?us-ascii?Q?MlkqTRsHNTed5Me23G9N28rpV6/gd9FIS7gdo/PxvxoFLQPGHN8=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZBKZQrlVzNY49Fd7Blpt3ExE8omyosipmzGQYC8L9sAiIJdhrRU5nDgRcCn/?=
 =?us-ascii?Q?ndoB0pnrIFWiuh4QoEhA2GNhmjw9hXoqex2x9Gs/kMXO/mW0ZERF5A4g5vSA?=
 =?us-ascii?Q?PUNT9ybfa5jQhY85AadSa/qCARt/MbvxD2luI9iCAO7ld7nzdT8x094NRJLS?=
 =?us-ascii?Q?meBjzSWLLAn3xI/SgXDUO9mYf9hbTbB/KpZIe3SQ0YqG8ODr0WcQJ2EA6je1?=
 =?us-ascii?Q?31yY1p3MhQONkjbOhaA39pPNngUdFN3opYhb+HMd/sQGyIcoLNLPp7+feCnK?=
 =?us-ascii?Q?cPhs9bX6QXdmRVYQOrmCVfWkXFLeSAmwYMBhkM8gEJfMCUIzlQp9nMtUGjGy?=
 =?us-ascii?Q?3XQ1E/veQ7R8sWCce5dOgun4Mk4+PISs/LkocfrXnGFJyQ2GbIrp3n50AEwE?=
 =?us-ascii?Q?lEN8pMZFcGHCZ65UIXNKX9LFFP7KGAr43jwcGVYRbKhzGCEpuDZDpnpBINMV?=
 =?us-ascii?Q?GPpoIqPeyXsltVaKNaiTFq/AJVBq6XMVFrD1EW4pBotEy9qPpveahpco8a0n?=
 =?us-ascii?Q?Hn2dYdUt15HXPhCToXpgzexEW/fduNrnRJnlHrc3SPFrzwY+/0yHkWpuMP+c?=
 =?us-ascii?Q?aAXGPNSQy73BWC7TN1QjWK/giCU1+E5vXZO5wPpsFJkJPy0vTcTbDTdPJMOh?=
 =?us-ascii?Q?Vyah3NjRLquepKSwIUGCJzc7gRLN2ET/w7K7wZpOrKw1j3V8j+5Butq0LAu8?=
 =?us-ascii?Q?pWa1veReJl5UPoVynHcqN7SQBfBMyEjymet7cFS4spNklzoYros6aZwlM1/5?=
 =?us-ascii?Q?mwtWiIs7Q5oQjwW7chUaQRzkmUY+4bfsHpmX4W+hyb+n9f91TxhRN7Bb4G0s?=
 =?us-ascii?Q?TI5BE9Jsu19RZFhHbDbKs6rkdDmBGAP5J0pPqJWAtucQTTYGVE/5MVFjHGyt?=
 =?us-ascii?Q?6eEujQV6MBwrvAH7Xc1l7+p+QWOedDGNMlpoiFEUTF57lNuyR6ZDccCsWFWR?=
 =?us-ascii?Q?Yl/vGUHC4YTbvEM/nKwsXX7k5m/2YB3vrQc0dMPV7TuEAOkOzB2cgTnZFxpZ?=
 =?us-ascii?Q?3BpuyUw93dJTXibVuRF0LS0zKp03bjFHzNY+/16X83ez/W7SovggG59U7QZa?=
 =?us-ascii?Q?Z6KSnAQayRr/2yl/tfpmGBgUW48k+KOjKrU2A8+R/g5SMFHZBGmJGU6lFPCX?=
 =?us-ascii?Q?YuI7udBIdVfLxjttsnLOINkS/tOlkOzODu7Aju+Ujpo7IvfMz0OB3MZ2FahZ?=
 =?us-ascii?Q?Kiw2/7HfGF4xy1CJc5dvVLmAQ3I851ZeI3yKmGRojV4rwL0Uf8oly3mB64XU?=
 =?us-ascii?Q?lsWQoiZQ6klEhJTlTjHl/cMpdnSxm40FfxS41VVe3tosPevEEuF81GDnaQ8a?=
 =?us-ascii?Q?u82WKE3+47DZOnqWnKhmXyIM?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FA2B5910EFF7FF48BF84C80D69F7CF32@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c8005a39-1521-4218-05c3-08dd7c35fb3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 15:55:44.6514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9647

From: Aditya Garg <gargaditya08@live.com>

The apple_backlight_config_report and apple_backlight_set_report structs
were incorrectly placed between the translation tables. Fix this.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
drivers/hid/hid-apple.c | 27 +++++++++++++--------------
1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index d900dd05c..93b990603 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -89,6 +89,19 @@ struct apple_sc_backlight {
struct hid_device *hdev;
};

+struct apple_backlight_config_report {
+ u8 report_id;
+ u8 version;
+ u16 backlight_off, backlight_on_min, backlight_on_max;
+};
+
+struct apple_backlight_set_report {
+ u8 report_id;
+ u8 version;
+ u16 backlight;
+ u16 rate;
+};
+
struct apple_magic_backlight {
struct led_classdev cdev;
struct hid_report *brightness;
@@ -152,20 +165,6 @@ static const struct apple_key_translation magic_keyboa=
rd_2015_fn_keys[] =3D {
{ }
};

-struct apple_backlight_config_report {
- u8 report_id;
- u8 version;
- u16 backlight_off, backlight_on_min, backlight_on_max;
-};
-
-struct apple_backlight_set_report {
- u8 report_id;
- u8 version;
- u16 backlight;
- u16 rate;
-};
-
-
static const struct apple_key_translation apple2021_fn_keys[] =3D {
{ KEY_BACKSPACE, KEY_DELETE },
{ KEY_ENTER, KEY_INSERT },
--=20
2.43.0

