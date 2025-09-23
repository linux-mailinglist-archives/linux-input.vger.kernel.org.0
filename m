Return-Path: <linux-input+bounces-15005-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C62BB9616E
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 15:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14B6C16A631
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 13:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942DB1EE7B7;
	Tue, 23 Sep 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="qHAxEBYK";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="Vngn7Hv+"
X-Original-To: linux-input@vger.kernel.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5E61B9831;
	Tue, 23 Sep 2025 13:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.134.29.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758635501; cv=none; b=sYYbJjpaLZazX4F6tcufmLmixwjl2R7oUHpE4oYjgCsGzezaIruJPH2wkz5gxpMCwvoORvlI+cxeKgm+2M8v/jP3GUFno0Z4vwJ7n1C7YdtcUCaOEoQyPmKigyxjsy560NAoNbSAlaQiFB3NgvfCmNaxBuDewxwhmntSk71saks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758635501; c=relaxed/simple;
	bh=jOTfBBuhp4/KXUmQRg6f3HjP0MtVrb5Hzovk33nxhfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pVWNlqRTeJwllRsw8AyIuWN5gpvElEmOYNYVn2neijRs8iBO6qpBcgX7e2LRsu3ibsd8KHsy1/Sn5r2B5Tm2Xb8LbpHFnVLLV2eX1hTPwFhBdry4ZsGZKW1vOrZM1A5DeGDWF0UkFOzl9BlxdF/ak6AyMCXWPqbHSzDC1+iOo/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org; spf=pass smtp.mailfrom=sigxcpu.org; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=qHAxEBYK; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=Vngn7Hv+; arc=none smtp.client-ip=24.134.29.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1758634954; bh=jOTfBBuhp4/KXUmQRg6f3HjP0MtVrb5Hzovk33nxhfQ=;
	h=From:Date:Subject:To:Cc:From;
	b=qHAxEBYKHjks72BqCNQ+G5xfgrM/gXCbUAOnkdslE3sv59JX7kwK4qACkeMJIFvxP
	 04tDkTnbyO+jRauXBthoPt3BBZjstGTNzc5/qZQ9B+nVVsBIPfe/iXBmmBd8T1kuNh
	 1NShXaa1in5wH+gbLL+nGyDzkPoP1coTrDhng6/moiRQwhITyKEa/7Ru2QSVraffPK
	 VqZ3blcFYqnzKIfenJA0fiadC60D9DwmDD6CRC/7TrMj2ivEEMRoUlb9j3K8gmQ0jK
	 0GPr9Ih2JXxMefsBr47BUemtoNOOzUKzLoQQrM+hhpG6SD6KvUijmzYE4wZGr8sVSO
	 pLRQKKKXIoAKg==
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id B3709FB03;
	Tue, 23 Sep 2025 15:42:34 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ufJNWvGsT0oV; Tue, 23 Sep 2025 15:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1758634953; bh=jOTfBBuhp4/KXUmQRg6f3HjP0MtVrb5Hzovk33nxhfQ=;
	h=From:Date:Subject:To:Cc:From;
	b=Vngn7Hv+T1WTNZWUBsVdmYRczXjmN8VFfA9+Fp+kf6Yz9roQ+phC2BDeSQ4olzng0
	 CqNm+J2Zew4gFXQo5GO0LteHpnUGCWAPY7FQXIz5f78cfGyQC4HesOE/5naYq9cT+R
	 5IrUhZCggwSvHbF2CvUFag8AfixZ0XXaXSR0HSLNI+LwQrf7mcnINNfQPbngWpvmf2
	 mqxz056qrQXtkBuMZGT8wSHs1/PhoqOexuWHvBVWnlTuaoeyvy/Dz46DVqpYbQW3yg
	 4Aqy+An+EGOmrhSHCVrRO/bOUDlGCB//Stg7HgiKMREY956T6UqkAiEIkQYZ+OxnXP
	 oZIZec1foGEHQ==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Tue, 23 Sep 2025 15:42:09 +0200
Subject: [PATCH] Input: edt-ft5x06 - Detect ft5452
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250923-ft5452-v1-1-c9bc51608b7f@sigxcpu.org>
X-B4-Tracking: v=1; b=H4sIALCj0mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyNj3bQSUxNTI13zJKO0JHPTpDRjCwMloOKCotS0zAqwQdGxtbUAwMY
 a6VgAAAA=
X-Change-ID: 20250923-ft5452-7b2fb75bf380
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2618; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=jOTfBBuhp4/KXUmQRg6f3HjP0MtVrb5Hzovk33nxhfQ=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQm8wcVBCOVFzeEp6cWhuZFdYenQwb0Z2dGVSdDFyClhGL2hNWnRvZ1NHODZVcC9M
 ZjZKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYU5LandRQUt
 DUkFsdjRaU1N2ekI0K2tHRC85L1NTSHdMZzVGK0pFTktTc0lJa1FuTHNOY0E1ZmdJVldWT3BxRw
 pMemZOdWxPWTNQQ1dseG5iYkVOeXFrcW43eWtKaW9GbTNRdUVDSjNoV0hPaStTUTFaNldYeVBsS
 EZVbDA2YkMyCmo2aUlnOURVdWxGblR3VlFNVDFoeWtkMWZldGluWWR1SWxyaGw3a2tla1ZYQ2RX
 ZE5veklhMlluQjAwOWlFcEYKYXdqVzJjZWFSNkI4WjViWGwrRmxmaDJJc2dMdUxQa2Fpd29UQnM
 5WVBtTnRZN3NGWDBDeVFaME9wN3h1VHE4eQpGd21Eb2VxRlRvajh0cUlpSVJ1VjRvU0t3YnBXR0
 pvMmsvN3BWa3BRKzViSWExSkNuOFN6SkRDWU1KQjMycCtkCjdRaGo4QWtVU3hEdWo1dDJMelE3b
 m1oVlhaL09Mck4xYW1nT25ZQzFaRy9RQ3VZdFFRT3N3azlQRXpIZnZkWjQKWVlmZUNVRU9GV1Qv
 WXB3RnZzMk5kNUVCVk1ERFVtWDBLRmRqQ2NiaU5OS2c0RkNSaUgwSnN0WERLck9BNXRVTQozTmY
 yNlkrSHFyMURuMm5Kb1A5NFdCM0I2ODN3MHpvVnVvZDVzdnp1ZFVtNWhxaE1lK1NhS3grVE9idF
 R0Ni9PCkhPOHAwdkprTm1pVzB1R251dUJIUEtqUUhZRGlRdVQ3a3gzTytyTEs1b2c5RnE5YlhDS
 FhtVHoyZHo4MjE4OXkKOEloc1U1emJUVFlxT1JINmxVcDA1R0NuQVc3N1Z0TnFpMnhMWGRwNzVi
 R1RsRlNMMFEyakdsZXRxNzJlZXRDNAp5bmcyd3h6OXFBUm0wNDJ2bmZ5ckU2TlNKampYZVVDbGd
 DRjk1dVJxVWZSQ2pZT28ya3ZTdVVDREhScEQzYUlBCmhrbFFhdz09Cj1HbEZhCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=agx@sigxcpu.org; a=openpgp;
 fpr=0DB3932762F78E592F6522AFBB5A2C77584122D3

Detect the chip that is used in lots of smart phone models
by different vendors (e.g. Xiaomi and SHIFT).

We don't derive any properties from it yet but spare lots of people
adding this code to figure out if their panel actually uses this chip.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
I hope we can add more values to the chip-id switch once we identify
them.
---
 drivers/input/touchscreen/edt-ft5x06.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index bf498bd4dea9651ac939fe137b1c0f05e8557962..c0f98d622970846f47a61afa7ec042886a7b95d5 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -57,6 +57,9 @@
 #define EV_REGISTER_OFFSET_Y		0x45
 #define EV_REGISTER_OFFSET_X		0x46
 
+#define EV_REGISTER_CHIP_ID_H		0xA3
+#define EV_REGISTER_CHIP_ID_L		0x9F
+
 #define NO_REGISTER			0xff
 
 #define WORK_REGISTER_OPMODE		0x3c
@@ -849,6 +852,18 @@ static void edt_ft5x06_ts_teardown_debugfs(struct edt_ft5x06_ts_data *tsdata)
 
 #endif /* CONFIG_DEBUGFS */
 
+static int edt_ft5x06_ts_check_chip_id(struct edt_ft5x06_ts_data *tsdata)
+{
+	int val, id;
+
+	regmap_read(tsdata->regmap, EV_REGISTER_CHIP_ID_H, &val);
+	id = val << 8;
+	regmap_read(tsdata->regmap, EV_REGISTER_CHIP_ID_L, &val);
+	id |= val;
+
+	return id;
+}
+
 static int edt_ft5x06_ts_identify(struct i2c_client *client,
 				  struct edt_ft5x06_ts_data *tsdata)
 {
@@ -857,6 +872,7 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
 	int error;
 	char *model_name = tsdata->name;
 	char *fw_version = tsdata->fw_version;
+	int chipid;
 
 	/* see what we find if we assume it is a M06 *
 	 * if we get less than EDT_NAME_LEN, we don't want
@@ -962,9 +978,18 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
 				 "EVERVISION-FT5726NEi");
 			break;
 		default:
-			snprintf(model_name, EDT_NAME_LEN,
-				 "generic ft5x06 (%02x)",
-				 rdbuf[0]);
+			chipid = edt_ft5x06_ts_check_chip_id(tsdata);
+			dev_dbg(&client->dev, "Chip ID = 0x%x", chipid);
+			switch (chipid) {
+			case 0x5452:
+				snprintf(model_name, EDT_NAME_LEN,
+					 "ft%04x", chipid);
+				break;
+			default:
+				snprintf(model_name, EDT_NAME_LEN,
+					 "generic ft5x06 (%02x)",
+					 rdbuf[0]);
+			}
 			break;
 		}
 	}

---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250923-ft5452-7b2fb75bf380

Best regards,
-- 
Guido Günther <agx@sigxcpu.org>


