Return-Path: <linux-input+bounces-12435-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE20FABBDB9
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 14:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 902AF189DEC7
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 12:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BA7278E68;
	Mon, 19 May 2025 12:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="S/c7ItQw"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0F5278148;
	Mon, 19 May 2025 12:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657689; cv=fail; b=qTCEmrrzPxLg6rlRCqfB2CPOm8Uh3eVlUETguhLNoYgiRCfW4CuNq48YsSgcp0ldLmb4oHp7eoAI7KTNROAxCB0DqiTMqo4ywzpkYJgn9LCJ/PFHrv7c+b5dfSj5x03rPchhkrkUOW35314dLQEtb3Dou4+7xkDd4WFo56gUZd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657689; c=relaxed/simple;
	bh=wrjrNTvSG5gHRpNH1unObL/93RoovzpKMS38OcQ/vAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cyLj5PkH2avpFHiEazCsi7EtGLLsEkYhw+cUVBnGgkjlOXoCQlQJpgyIRoGKTuyf0nzutx94Wcx/EDKMwEAiN+KgePdOeXkwyVTbMLY+Xu7t6xz1/ZtjvGNGAJTMfPmCfhBhDlyq87d5xWS0ihJshhhf6XQCUrg5wx/QfAyg/uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=S/c7ItQw; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kosHJh9jx/+mzXQ5TFIYa9P+ZJdgCqgL2scI9KD8eUAmthdysuT9EaExU0KWoGCIjVjN9VDpEEET3Q3LV0Z8VtO5jajf5fBlxM//P2TJoDJYfi+0ZZl9Ho40AgCboMCbldkvZfal0UjVfI51RulDJ6nPSb3Y1EJoDFyBIM6Qoc8IBmAWgGLMj1vKPkRxlbPoKCw05iwf3WoJhRn/+eHRUVfRdNRmL53uSqrkuJjgFP1q7hBgFS+DvF1RJzzU1cJz2NcXhW9qfz0zduM2dzDmVixhTu6vJgnfmcmd9e+l6i9jak64FgQRMWF8bq/bhJvTYu6IgxWOO43nvOB3i89Gag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xh6Vv7Rb8tKjP5uD2F4eE1HpigWUPD5hDEePHnUg4zA=;
 b=rsiOmpD4jDOTsA6rRma46LnPo1ZhkW2aJ5z1AYvpzF1FCAFU6HNHbMKLH0JhGNERHSnLUEuBvbwUW3UXLyrnll4msS/tGPAFabTudNzdCEbZDoUzavCwAoFzjhBnsn02lgvNmq+osjGX2PR0/aDlqpwtjsaXuFdjLxmIUIi6Rx6FLs9LNXQlBVWM8yWMIx2UiTeOjZXdLM7gLPBzzpjbJW9vtWukOgXegk1offpApvIG4fWlISoBAruUMZ4SJn1UcAjLgP0fxST31loyD37sP/5fDDJLVoUfgDNxjt0asmpJqgxju7Rc4GPU08YG/7sl/j5hBsgNBSmUqjyHzX3njg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xh6Vv7Rb8tKjP5uD2F4eE1HpigWUPD5hDEePHnUg4zA=;
 b=S/c7ItQwSp96PUYFyfGxjH3R2yDl07kE9LscLGzDBO81q0BG6GYHE2VUnR+Ou5R0/xIsI4ODnkUNTLJzvZq8+2v9Bm3Wy3pxGlPaIGiggXM+fTXMy6fvGYmBdZeI+075uIqDCk2W+W9Fv+ULyubczrYU+la14Ex1PwewVbCcmu+V/eWNMwP1Zw9kPNMjW9fg42GpqU7wmfHs9d8yNJ57a0wMBEUxjCEoN8HwQb60I6ea2N6QA/2UkL0Y3MfxC0/RWXh49pRdxTs9fR+bGkEz2vaaNElB1dBisNmRSZ00OoAlVZJteyqP3l71FVANZMn43HxSZUPYau9x/qdIItymCg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5917.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 12:28:00 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 12:28:00 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v6 5/8] HID: apple: Add Apple Magic Keyboard A3119 USB-C support
Date: Mon, 19 May 2025 17:46:20 +0530
Message-ID:
 <PN3PR01MB9597AAE0DC11DF82F299562CB89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250519122736.38469-6-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c828236-67de-4391-6727-08dd96d09769
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnoSu68Y5FdRDlCPOBk43FEtmvM8QYpQPjFjo7PvJa99d66plwp9xMmEGd0QTY/Q8G0/O+uwUFxhsiEBsMcObHqx3ff7lxclJI01MoXJrBK5FQW34jtPGQPP8szGLF+ea2aSPd12r1icgdBVEGtP5L0Amilcst5pJylJQTkpfUaaS9FYeQqmVWQ3NX1ldUbFM/7mWYvEFHh8VprMm6zx+WGxtm+akpEsQdLkw9cdhqD+KUMMKuYe/cC67zgtMLk1rLHZSbhffZ/pPVUvSxr5eo7NRYYp9sPDQeBGVUKRDZqJHV3iGDGMtJd9keAkFg73+MzEw0sSHYyA99PjkgJQBY7q0hq7u0+jImN16izhL66ZwlYo2LUuZoMarZ1rsI0+F/fCjVOS/C2VGAwtSJQHXzoCHAu1WUtKodk9nnulQwKAtITeSXSuk2DniUnMvJP2cTRVsQaECroVELdbawUysK+2dddd7gqXQXwcBJI0/KQFbNJisW2R/Jx1ZQC/sWcKNFDE7Preegu4zW2KM1hui9zIn6BT8DgWhpcKG/aj1yWwhUTPOeQHas3Fp7liNvwsvZvj5PEcCrIqyyXDAmph1minXjSg6mn7GBj1qy6jlJsSPS5j/bLRaY6u17iVSkOYF5Q/puK/iMmXhNUBvua+Md4z7ESluOBZmvaFIE2fa3xfNy4RKRhy7IbXBxHVMDawt2XMcN0lXjniEc4DZ65eZCNDL1xWKiscNa5YSge1mSw7MnpTk0AOK+4trMXp1OhUpOY=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799009|19110799006|15080799009|7092599006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bcdd/v5O/Lae6CCa4GL5SNOe4UBKr+to1Vdkdt0yWoDTF+cQTVn/uH3BWb0T?=
 =?us-ascii?Q?acCexbL3SZrkcXemDYkbw2MXpaPNoIKEXS4hFxu/CEWwZTnCDgVZD/Op/Xl0?=
 =?us-ascii?Q?kyW5hYbghLyYUivCA/Y8DhU7xeb5iFO11l1BDuLoJy+nqgVCG+ni/IRZ64sJ?=
 =?us-ascii?Q?ZGvjdFLk14KM5jV+DUYiIFZ3BaOvvGP/S3lu1GjgsBxmI5HPbm/KJHen8VgK?=
 =?us-ascii?Q?vd012XrsvU4swod4KltUmBucKEbiGUUw+mDs67ytJGnxc1ZtJaQl/accLHUN?=
 =?us-ascii?Q?QpnB9L7H3UoH/oaAQ+prEv2eu/Issz/cpyMBcny0ezIT3DSZjtSu9PXHzvyn?=
 =?us-ascii?Q?NmjQM2h6ofXeFCHGLMhTTKrtC0E1GZkt5kE4P1kWj2DUntGB+JfT5XExoCwI?=
 =?us-ascii?Q?LVTQ7LqYVAhcfsAonezXpzg8ENqH4DwIFmOEpBEnBwN3okUdlYH1zWoD8LqR?=
 =?us-ascii?Q?Fy7xm2Jqu7G7H8VMoa3wokpduA7ZLEbGDG+KUL4e1TzurTEPDjq+rQlx/Ss8?=
 =?us-ascii?Q?o/gMKbn3cqln19ZXFtFBcgHtJfyTgClWc50BnJqv4BOH9Z2s+cVwpl/anjIR?=
 =?us-ascii?Q?+Tw3y1R1GgquvJ8NAJwv3IXjSf//H1f501BXae2nPkNX8SsNaACzeMVVm/iD?=
 =?us-ascii?Q?RBWt6Y207GUbz2m28xW2WP9qqTwzkzWeUA89555bHFzdp86Vqs6HZtTrpVnS?=
 =?us-ascii?Q?7wl+IRobxrexWqGQFHREH4PS0yA0dnADFdEn8i/R4DAwQtIWaYrooofBLFbH?=
 =?us-ascii?Q?SPP4QA4Fpzbdph78IRzldV+UNYqwpkuZHZzqyoM5BfAyVrnBltcm377iTVRI?=
 =?us-ascii?Q?lsr3uLIijW5xNCjiZp5Y1bckSIRGr+SVeal/DpoWEvE6oMXXkEsuRexITV/0?=
 =?us-ascii?Q?MPO0vUT9dO7jlOy3aYjnqDj7xxXi0lh65vHEVmRTF8UgmcNaOxNrZ+vwLEbs?=
 =?us-ascii?Q?k8kmEvYEDGojWwdsOYCPGHFHJ3J0B2Oz9Vcwd+ajNr9bmPpFcmiqPxC8/CS4?=
 =?us-ascii?Q?omncd8KQUqJMMMrAsg9wsCAxSCQl3AQN+x9bdrSJZDs22mndQY3CXCLvqiSN?=
 =?us-ascii?Q?xQeqV1OGJFGdqMciO+HDLq1c0NOVt7lbLfZke2Mgj3whBz6NO38=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xx+lsTjnWoPMDwI19YS0iFA1mOpGwqN8zwU1ps5oPptwJYDV5kGdEtOqduTn?=
 =?us-ascii?Q?w/24zq3lCnkJX9BdryygB9PEolOOvEVg5EtINqPZTLqJRAVlQ16H5MoLEc7v?=
 =?us-ascii?Q?W+K/GtnnQtkXYSQA6rLvTkpc9+WZx20pAC6Y6g4mAGMH/jMF6vlNHEW85QD0?=
 =?us-ascii?Q?CK+5GJvepu4XbUs04dYGu9XS0Eg6vnNCupqdc4ogZLUU8rIjjiQ/J5LpHaAp?=
 =?us-ascii?Q?lxx2Duah6/biJVCIMEqTBgGLdgO3DnXyT/vcNwkTOV60RRCuY3claDqOGXsh?=
 =?us-ascii?Q?jqk3sVXyyfVcaubZMk/kWS8pBPtm0mxhtZ/aJUTbHC+dpiTRC/uB0HIF7cCk?=
 =?us-ascii?Q?lKpritESqdwLzpNC78KuXKaSk3L3zavvT/KP6b55ezojVZYMreyBx7GlGn7Z?=
 =?us-ascii?Q?LzChAdXMdERmOYKQYUtWjMO1cmqssW1AOHrLOdf4LkJZ9Q5oqe1NbDOCT2ac?=
 =?us-ascii?Q?iibNf1EccqNZbqrQI3C8oJJK0OvrQg71MERddTrZLH3s3ACNZe+9GHQ3/tJY?=
 =?us-ascii?Q?IPhXxe7dButYbav61L7p1tHLT/DjaR5rosKKbIuFfaihKoETW8/dEhlid29p?=
 =?us-ascii?Q?AUtXQ/psjWF47kjzVPsgEU0uyggg0q7Pj/GG1P6GlOUKjySppEV6Um+F5RgC?=
 =?us-ascii?Q?DfLND1YGuMThIT/ojo7M+E90G0s53q8AeJBdjQThNwxazS4+wB3HxbXEH0fE?=
 =?us-ascii?Q?V5f7ArrULkdtOFestYiJ+8PTY1ydVTHcXe9GcGiGLj505lKC7OD8hth58nFn?=
 =?us-ascii?Q?nQZv5aMOdmlIWRyrrvjl1o/C1Z2yVCL+DZlDo/XzTWWYcwFALXFGKjrd6YgC?=
 =?us-ascii?Q?VwfETyOr5Mz5M82hR2KbpYKPxNHxH8odiGzVDxQ/XldHq2FkJGGN0PAK15s5?=
 =?us-ascii?Q?+wZj5NUWUvwBkYztQl/xdJe3DQgRNyUA8amTtUhb9sSw5oV5x8ypBE9Y+aM8?=
 =?us-ascii?Q?hqcy2M62df2Mg+KCNQqwJflGC5wUK6CfC6PUiqPKivVhvgfTUjlbIR92HCcK?=
 =?us-ascii?Q?0x90TPE4hAZne9CIaFkxSrWvyBhBGMmy4hmYYBJqCu9JerV0IY0Q82+GouMr?=
 =?us-ascii?Q?jX/ZTVK2YDjTxiNVuOCaMj0Q96inxvbrHZ7JH6Qa/bqqILCz5Q/bAG++Jrg5?=
 =?us-ascii?Q?JPTeU7np8lh/budpknZaGgQWR/KSdccrL+dw11FTkcMe2W685PStXFlQPImD?=
 =?us-ascii?Q?CLRuHqlOIioEJb+DVk8IiNHWAEvPOeg/udH9HZTSlGwG7IWImvsYeGQM6Pbn?=
 =?us-ascii?Q?hOvG930RxzNEobrfqn5YjHWbLmNszcW3UEbR/mSQxJDoxkgrIt8nJjhnAR9T?=
 =?us-ascii?Q?Rrg=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c828236-67de-4391-6727-08dd96d09769
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 12:27:59.6972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5917

Add Apple Magic Keyboard 2024 with Touch ID and Numeric Keypad device ID
(05ac:0322) to those recognized by the hid-apple driver. Keyboard is
otherwise compatible with the existing implementation for its earlier
2021 model.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 5 +++++
 drivers/hid/hid-ids.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index e95a54113..0524893f7 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -486,6 +486,7 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024:
 			table = magic_keyboard_2021_and_2024_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
@@ -1182,6 +1183,10 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT),
 		.driver_data = APPLE_MAGIC_BACKLIGHT },
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 6e6606734..dd0a48595 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -172,6 +172,7 @@
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024   0x0321
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024   0x0322
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI	0x0290
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ISO	0x0291
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_JIS	0x0292
-- 
2.43.0


