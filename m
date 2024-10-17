Return-Path: <linux-input+bounces-7513-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C389A2922
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 18:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC3F8B2AAD5
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 16:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E021DFD8B;
	Thu, 17 Oct 2024 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3hL9cyo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDF21DFD87;
	Thu, 17 Oct 2024 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729182914; cv=none; b=jU8vP/1QlKTozvyzytuqOpDoEH5SnYE62kpt0EHIjQnDc1NzZy7eNZGvLucTVDXiByAGSc/H01q9ljFuPbZaCtSr+g4e/e+HAAdxYBGdtEq3uqRG34ShKzarvcZ3QPKPB09TWaUxWhdEB5iTSqh6SUmwTQlLwvm+y073hB1Oa34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729182914; c=relaxed/simple;
	bh=wHjaUMUGTPQe/HkvJVYcvU/Y5QGKlkTwf/y/FC47rCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SbRF/BPZ3Tp2K2TG36sPDIDJZmt1h86CTEk6nwaOKtIIVAXaoGFRrG+XhvT/+iqNbc14uyOPeg/JBz6horVQFslWSNjziPcfGMm8aEKXR5NX+GdfpBeiOd3y3Z71WfkhQganbD5Bz3EEH8+DsYOoVFqZFPJERyhOEJh9GuyR3+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3hL9cyo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE13CC4CED2;
	Thu, 17 Oct 2024 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729182913;
	bh=wHjaUMUGTPQe/HkvJVYcvU/Y5QGKlkTwf/y/FC47rCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e3hL9cyoQcDhcPoXJs2Ns+CsYRWvRpQtMVtdASWLRaxawwMTh5gq2P2G8QMvMO6xN
	 Gw5hpnO3Nb9j3RVZLNndu/dx5eYeuwy+IYruVa1gtju8mv3tqMcisJuXxpEQBX2MBo
	 vuysnwJK0H13w2cIb895CHqEIbbuYZRH1xMWM3qoY04yQBa55ORYkH1JR3sn6bw7GX
	 cyK1ygoCzG2CXSsSWZH1UCJRhW8HGbpZ8kBR9lgRbVBpmMdb0cNYyosEP+DtuRiKEU
	 5zcQLMKvoxCm8XYnNG628tZd6ZxrbEozdWSGLl4Hu7bP7mI2kzU+cnbQjPg43cZUNB
	 z9p6CoVhW+3rg==
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Thu, 17 Oct 2024 18:35:00 +0200
Subject: [PATCH v2 3/3] HID: bpf: drop use of Logical|Physical|UsageRange
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241017-import_bpf_6-13-v2-3-6a7acb89a97f@kernel.org>
References: <20241017-import_bpf_6-13-v2-0-6a7acb89a97f@kernel.org>
In-Reply-To: <20241017-import_bpf_6-13-v2-0-6a7acb89a97f@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729182907; l=12580;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=wHjaUMUGTPQe/HkvJVYcvU/Y5QGKlkTwf/y/FC47rCA=;
 b=s0cjm6Gl+p4Da/TvFHVwsS4gR2azj40f2yaw5ASXcz1ejohmG/rxhMsSYKvWzV1+cYVFEdHzj
 c+QzfAWOr1aBMNCQpw3TQs03xCIaOA80GCyGOHvyOWilb5M91OmC65y
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

Replace with individual Minimum/Maximum calls to match the HID report
descriptor - HID doesn't have a Range field. Abstracting this is good
for hand-written descriptors but almost all tools will output min/max
instead so let's stick with that.

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>

---

new in v2
---
 drivers/hid/bpf/progs/Huion__Dial-2.bpf.c       | 66 ++++++++++++++++---------
 drivers/hid/bpf/progs/Huion__Inspiroy-2-S.bpf.c | 60 ++++++++++++++--------
 drivers/hid/bpf/progs/hid_report_helpers.h      | 36 ++++++++++----
 3 files changed, 111 insertions(+), 51 deletions(-)

diff --git a/drivers/hid/bpf/progs/Huion__Dial-2.bpf.c b/drivers/hid/bpf/progs/Huion__Dial-2.bpf.c
index 2411dec6db08b684c6e24c73ab4d509300424768..9670e5ef8d54f0058260294ef99bc65e7e312472 100644
--- a/drivers/hid/bpf/progs/Huion__Dial-2.bpf.c
+++ b/drivers/hid/bpf/progs/Huion__Dial-2.bpf.c
@@ -214,7 +214,8 @@ static const __u8 fixed_rdesc_pad[] = {
 	CollectionApplication(
 		// -- Byte 0 in report
 		ReportId(PAD_REPORT_ID)
-		LogicalRange_i8(0, 1)
+		LogicalMaximum_i8(0)
+		LogicalMaximum_i8(1)
 		UsagePage_Digitizers
 		Usage_Dig_TabletFunctionKeys
 		CollectionPhysical(
@@ -234,14 +235,17 @@ static const __u8 fixed_rdesc_pad[] = {
 			Input(Var|Abs)
 			// Byte 4 in report is the dial
 			Usage_GD_Wheel
-			LogicalRange_i8(-1, 1)
+			LogicalMinimum_i8(-1)
+			LogicalMaximum_i8(1)
 			ReportCount(1)
 			ReportSize(8)
 			Input(Var|Rel)
 			// Byte 5 is the button state
 			UsagePage_Button
-			UsageRange_i8(0x01, 0x8)
-			LogicalRange_i8(0x0, 0x1)
+			UsageMinimum_i8(0x01)
+			UsageMaximum_i8(0x08)
+			LogicalMinimum_i8(0x0)
+			LogicalMaximum_i8(0x1)
 			ReportCount(7)
 			ReportSize(1)
 			Input(Var|Abs)
@@ -265,7 +269,8 @@ static const __u8 fixed_rdesc_pen[] = {
 			Usage_Dig_TipSwitch
 			Usage_Dig_BarrelSwitch
 			Usage_Dig_SecondaryBarrelSwitch // maps eraser to BTN_STYLUS2
-			LogicalRange_i8(0, 1)
+			LogicalMinimum_i8(0)
+			LogicalMaximum_i8(1)
 			ReportSize(1)
 			ReportCount(3)
 			Input(Var|Abs)
@@ -280,22 +285,28 @@ static const __u8 fixed_rdesc_pen[] = {
 				UsagePage_GenericDesktop
 				Unit(cm)
 				UnitExponent(-1)
-				PhysicalRange_i16(0, 266)
-				LogicalRange_i16(0, 32767)
+				PhysicalMinimum_i16(0)
+				PhysicalMaximum_i16(266)
+				LogicalMinimum_i16(0)
+				LogicalMaximum_i16(32767)
 				Usage_GD_X
 				Input(Var|Abs) // Bytes 2+3
-				PhysicalRange_i16(0, 166)
-				LogicalRange_i16(0, 32767)
+				PhysicalMinimum_i16(0)
+				PhysicalMaximum_i16(166)
+				LogicalMinimum_i16(0)
+				LogicalMaximum_i16(32767)
 				Usage_GD_Y
 				Input(Var|Abs) // Bytes 4+5
 			)
 			UsagePage_Digitizers
 			Usage_Dig_TipPressure
-			LogicalRange_i16(0, 8191)
+			LogicalMinimum_i16(0)
+			LogicalMaximum_i16(8191)
 			Input(Var|Abs) // Byte 6+7
 			ReportSize(8)
 			ReportCount(2)
-			LogicalRange_i8(-60, 60)
+			LogicalMinimum_i8(-60)
+			LogicalMaximum_i8(60)
 			Usage_Dig_XTilt
 			Usage_Dig_YTilt
 			Input(Var|Abs) // Byte 8+9
@@ -313,7 +324,8 @@ static const __u8 fixed_rdesc_vendor[] = {
 		Usage_Dig_Pen
 		CollectionPhysical(
 			// Byte 1 are the buttons
-			LogicalRange_i8(0, 1)
+			LogicalMinimum_i8(0)
+			LogicalMaximum_i8(1)
 			ReportSize(1)
 			Usage_Dig_TipSwitch
 			Usage_Dig_BarrelSwitch
@@ -333,25 +345,31 @@ static const __u8 fixed_rdesc_vendor[] = {
 				UnitExponent(-1)
 				// Note: reported logical range differs
 				// from the pen report ID for x and y
-				LogicalRange_i16(0, 53340)
-				PhysicalRange_i16(0, 266)
+				LogicalMinimum_i16(0)
+				LogicalMaximum_i16(53340)
+				PhysicalMinimum_i16(0)
+				PhysicalMaximum_i16(266)
 				// Bytes 2/3 in report
 				Usage_GD_X
 				Input(Var|Abs)
-				LogicalRange_i16(0, 33340)
-				PhysicalRange_i16(0, 166)
+				LogicalMinimum_i16(0)
+				LogicalMaximum_i16(33340)
+				PhysicalMinimum_i16(0)
+				PhysicalMaximum_i16(166)
 				// Bytes 4/5 in report
 				Usage_GD_Y
 				Input(Var|Abs)
 			)
 			// Bytes 6/7 in report
-			LogicalRange_i16(0, 8191)
+			LogicalMinimum_i16(0)
+			LogicalMaximum_i16(8191)
 			Usage_Dig_TipPressure
 			Input(Var|Abs)
 			// Bytes 8/9 in report
 			ReportCount(1) // Padding
 			Input(Const)
-			LogicalRange_i8(-60, 60)
+			LogicalMinimum_i8(-60)
+			LogicalMaximum_i8(60)
 			// Byte 10 in report
 			Usage_Dig_XTilt
 			// Byte 11 in report
@@ -366,7 +384,8 @@ static const __u8 fixed_rdesc_vendor[] = {
 	CollectionApplication(
 		// Byte 0
 		ReportId(PAD_REPORT_ID)
-		LogicalRange_i8(0, 1)
+		LogicalMinimum_i8(0)
+		LogicalMaximum_i8(1)
 		UsagePage_Digitizers
 		Usage_Dig_TabletFunctionKeys
 		CollectionPhysical(
@@ -386,15 +405,18 @@ static const __u8 fixed_rdesc_vendor[] = {
 			Input(Var|Abs)
 			// Byte 4 is the button state
 			UsagePage_Button
-			UsageRange_i8(0x01, 0x8)
-			LogicalRange_i8(0x0, 0x1)
+			UsageMinimum_i8(0x1)
+			UsageMaximum_i8(0x8)
+			LogicalMinimum_i8(0x0)
+			LogicalMaximum_i8(0x1)
 			ReportCount(8)
 			ReportSize(1)
 			Input(Var|Abs)
 			// Byte 5 is the top dial
 			UsagePage_GenericDesktop
 			Usage_GD_Wheel
-			LogicalRange_i8(-1, 1)
+			LogicalMinimum_i8(-1)
+			LogicalMaximum_i8(1)
 			ReportCount(1)
 			ReportSize(8)
 			Input(Var|Rel)
diff --git a/drivers/hid/bpf/progs/Huion__Inspiroy-2-S.bpf.c b/drivers/hid/bpf/progs/Huion__Inspiroy-2-S.bpf.c
index b09b80132368b6c504a61e1965263bdaaac67fb0..13f64fb49800b16f6d4d48c378f065fcdf51202a 100644
--- a/drivers/hid/bpf/progs/Huion__Inspiroy-2-S.bpf.c
+++ b/drivers/hid/bpf/progs/Huion__Inspiroy-2-S.bpf.c
@@ -170,7 +170,8 @@ static const __u8 fixed_rdesc_pad[] = {
 	CollectionApplication(
 		// -- Byte 0 in report
 		ReportId(PAD_REPORT_ID)
-		LogicalRange_i8(0, 1)
+		LogicalMinimum_i8(0)
+		LogicalMaximum_i8(1)
 		UsagePage_Digitizers
 		Usage_Dig_TabletFunctionKeys
 		CollectionPhysical(
@@ -190,14 +191,17 @@ static const __u8 fixed_rdesc_pad[] = {
 			Input(Var|Abs)
 			// Byte 4 in report is the wheel
 			Usage_GD_Wheel
-			LogicalRange_i8(-1, 1)
+			LogicalMinimum_i8(-1)
+			LogicalMaximum_i8(1)
 			ReportCount(1)
 			ReportSize(8)
 			Input(Var|Rel)
 			// Byte 5 is the button state
 			UsagePage_Button
-			UsageRange_i8(0x01, 0x6)
-			LogicalRange_i8(0x01, 0x6)
+			UsageMinimum_i8(0x1)
+			UsageMaximum_i8(0x6)
+			LogicalMinimum_i8(0x1)
+			LogicalMaximum_i8(0x6)
 			ReportCount(1)
 			ReportSize(8)
 			Input(Arr|Abs)
@@ -219,7 +223,8 @@ static const __u8 fixed_rdesc_pen[] = {
 			Usage_Dig_TipSwitch
 			Usage_Dig_BarrelSwitch
 			Usage_Dig_SecondaryBarrelSwitch // maps eraser to BTN_STYLUS2
-			LogicalRange_i8(0, 1)
+			LogicalMinimum_i8(0)
+			LogicalMaximum_i8(1)
 			ReportSize(1)
 			ReportCount(3)
 			Input(Var|Abs)
@@ -234,18 +239,23 @@ static const __u8 fixed_rdesc_pen[] = {
 				UsagePage_GenericDesktop
 				Unit(cm)
 				UnitExponent(-1)
-				PhysicalRange_i16(0, 160)
-				LogicalRange_i16(0, 32767)
+				PhysicalMinimum_i16(0)
+				PhysicalMaximum_i16(160)
+				LogicalMinimum_i16(0)
+				LogicalMaximum_i16(32767)
 				Usage_GD_X
 				Input(Var|Abs) // Bytes 2+3
-				PhysicalRange_i16(0, 100)
-				LogicalRange_i16(0, 32767)
+				PhysicalMinimum_i16(0)
+				PhysicalMaximum_i16(100)
+				LogicalMinimum_i16(0)
+				LogicalMaximum_i16(32767)
 				Usage_GD_Y
 				Input(Var|Abs) // Bytes 4+5
 			)
 			UsagePage_Digitizers
 			Usage_Dig_TipPressure
-			LogicalRange_i16(0, 8191)
+			LogicalMinimum_i16(0)
+			LogicalMaximum_i16(8191)
 			Input(Var|Abs) // Byte 6+7
 			// Two bytes padding so we don't need to change the report at all
 			ReportSize(8)
@@ -265,7 +275,8 @@ static const __u8 fixed_rdesc_vendor[] = {
 		Usage_Dig_Pen
 		CollectionPhysical(
 			// Byte 1 are the buttons
-			LogicalRange_i8(0, 1)
+			LogicalMinimum_i8(0)
+			LogicalMaximum_i8(1)
 			ReportSize(1)
 			Usage_Dig_TipSwitch
 			Usage_Dig_BarrelSwitch
@@ -285,19 +296,24 @@ static const __u8 fixed_rdesc_vendor[] = {
 				UnitExponent(-1)
 				// Note: reported logical range differs
 				// from the pen report ID for x and y
-				LogicalRange_i16(0, 32000)
-				PhysicalRange_i16(0, 160)
+				LogicalMinimum_i16(0)
+				LogicalMaximum_i16(32000)
+				PhysicalMinimum_i16(0)
+				PhysicalMaximum_i16(160)
 				// Bytes 2/3 in report
 				Usage_GD_X
 				Input(Var|Abs)
-				LogicalRange_i16(0, 20000)
-				PhysicalRange_i16(0, 100)
+				LogicalMinimum_i16(0)
+				LogicalMaximum_i16(20000)
+				PhysicalMinimum_i16(0)
+				PhysicalMaximum_i16(100)
 				// Bytes 4/5 in report
 				Usage_GD_Y
 				Input(Var|Abs)
 			)
 			// Bytes 6/7 in report
-			LogicalRange_i16(0, 8192)
+			LogicalMinimum_i16(0)
+			LogicalMaximum_i16(8192)
 			Usage_Dig_TipPressure
 			Input(Var|Abs)
 		)
@@ -307,7 +323,8 @@ static const __u8 fixed_rdesc_vendor[] = {
 	CollectionApplication(
 		// Byte 0
 		ReportId(PAD_REPORT_ID)
-		LogicalRange_i8(0, 1)
+		LogicalMinimum_i8(0)
+		LogicalMaximum_i8(1)
 		UsagePage_Digitizers
 		Usage_Dig_TabletFunctionKeys
 		CollectionPhysical(
@@ -327,8 +344,10 @@ static const __u8 fixed_rdesc_vendor[] = {
 			Input(Var|Abs)
 			// Byte 4 is the button state
 			UsagePage_Button
-			UsageRange_i8(0x01, 0x6)
-			LogicalRange_i8(0x0, 0x1)
+			UsageMinimum_i8(0x1)
+			UsageMaximum_i8(0x6)
+			LogicalMinimum_i8(0x0)
+			LogicalMaximum_i8(0x1)
 			ReportCount(6)
 			ReportSize(1)
 			Input(Var|Abs)
@@ -337,7 +356,8 @@ static const __u8 fixed_rdesc_vendor[] = {
 			// Byte 5 is the wheel
 			UsagePage_GenericDesktop
 			Usage_GD_Wheel
-			LogicalRange_i8(-1, 1)
+			LogicalMinimum_i8(-1)
+			LogicalMaximum_i8(1)
 			ReportCount(1)
 			ReportSize(8)
 			Input(Var|Rel)
diff --git a/drivers/hid/bpf/progs/hid_report_helpers.h b/drivers/hid/bpf/progs/hid_report_helpers.h
index 0aa1df438eebac72a64cc3fa24aa2fd28b952d1d..9b2a48e4a311b39ca20e7d9819beef8fb70315a6 100644
--- a/drivers/hid/bpf/progs/hid_report_helpers.h
+++ b/drivers/hid/bpf/progs/hid_report_helpers.h
@@ -52,7 +52,8 @@
  *     Usage_GD_Keyboard
  *     CollectionApplication(     ← Open the collection
  *         ReportId(3)
- *         LogicalRange_i8(0, 1)
+ *         LogicalMinimum_i8(0)
+ *         LogicalMaximum_i8(1)
  *         // other fields
  *     )                          ← End EndCollection
  *
@@ -74,26 +75,43 @@
 #define Arr		0x0
 #define Abs		0x0
 #define Rel		0x4
+#define Null		0x40
+#define Buff		0x0100
 
 /* Use like this: Input(Var|Abs) */
 #define Input(i_)			0x081, i8(i_),
 #define Output(i_)			0x091, i8(i_),
 #define Feature(i_)			0x0b1, i8(i_),
 
+#define Input_i16(i_)			0x082, LE16(i_),
+#define Output_i16(i_)			0x092, LE16(i_),
+#define Feature_i16(i_)			0x0b2, LE16(i_),
+
 #define ReportId(id_)			0x85, i8(id_),
 #define ReportSize(sz_)		        0x75, i8(sz_),
 #define ReportCount(cnt_)		0x95, i8(cnt_),
 
-#define LogicalRange_i8(min_, max_)	0x15, i8(min_), 0x25, i8(max_),
-#define LogicalRange_i16(min_, max_)	0x16, LE16(min_), 0x26, LE16(max_),
-#define LogicalRange_i32(min_, max_)	0x17, LE32(min_), 0x27, LE32(max_),
+#define LogicalMinimum_i8(min_)		0x15, i8(min_),
+#define LogicalMinimum_i16(min_)	0x16, LE16(min_),
+#define LogicalMinimum_i32(min_)	0x17, LE32(min_),
+
+#define LogicalMaximum_i8(max_)		0x25, i8(max_),
+#define LogicalMaximum_i16(max_)	0x26, LE16(max_),
+#define LogicalMaximum_i32(max_)	0x27, LE32(max_),
+
+#define PhysicalMinimum_i8(min_)	0x35, i8(min_),
+#define PhysicalMinimum_i16(min_)	0x36, LE16(min_),
+#define PhysicalMinimum_i32(min_)	0x37, LE32(min_),
+
+#define PhysicalMaximum_i8(max_)	0x45, i8(max_),
+#define PhysicalMaximum_i16(max_)	0x46, LE16(max_),
+#define PhysicalMaximum_i32(max_)	0x47, LE32(max_),
 
-#define PhysicalRange_i8(min_, max_)	0x35, i8(min_), 0x45, i8(max_),
-#define PhysicalRange_i16(min_, max_)	0x36, LE16(min_), 0x46, LE16(max_),
-#define PhysicalRange_i32(min_, max_)	0x37, LE32(min_), 0x47, LE32(max_),
+#define UsageMinimum_i8(min_)		0x19, i8(min_),
+#define UsageMinimum_i16(min_)		0x1a, LE16(min_),
 
-#define UsageRange_i8(min_, max_)	0x19, i8(min_), 0x29, i8(max_),
-#define UsageRange_i16(min_, max_)	0x1a, LE16(min_), 0x2a, LE16(max_),
+#define UsageMaximum_i8(max_)		0x29, i8(max_),
+#define UsageMaximum_i16(max_)		0x2a, LE16(max_),
 
 #define UsagePage_i8(p_)		0x05, i8(p_),
 #define UsagePage_i16(p_)		0x06, LE16(p_),

-- 
2.47.0


