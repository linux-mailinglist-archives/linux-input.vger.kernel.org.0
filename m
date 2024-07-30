Return-Path: <linux-input+bounces-5211-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2FE9415C5
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 17:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61FFE1F2283F
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 15:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B165B1BA861;
	Tue, 30 Jul 2024 15:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mscyuVX/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468ED1BA863
	for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722354730; cv=none; b=O/jF7fzGGK1QUi8OEOyawqrPXUT5vOOuCmvPV71WIATpQrvWRi5kAVI55NhE48EFc2UUu3MtJ5LoS9SXcvRIZ+jTeFW0JAY7CJAggoqrDUo/kCN3zd9NDjff1wbLakvWHpn7uNtZsjIUCnmJstt6Wxv4lcHQCmIFXGqfJF4mdk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722354730; c=relaxed/simple;
	bh=uvBeMr+gnmVasu6Z9oy9pv6M0lMRifbwhZ5SZ5vJooo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KOY+/VaMMqEN2rAs3sNTUi/CflT3yB2DLTZynZSfk0ofdXYB7AfukqIkWg7HKjOYpShDD5+LiVnd0OaSnjVz3lEOLuhvCVfatWOGynn+pSihnKt9VjNG6hCtbhvMSDvAjdioTCO+PJowBYy7kNV8w2nRDk9vU2lANROi5v4i8lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mscyuVX/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d1c8d7d95so2902024b3a.2
        for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 08:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722354728; x=1722959528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JDXmT+9NceTWH8KohoT7sAzeOEtpvwWoaxsk4ASnv0=;
        b=mscyuVX/P1uh+tCCKPEQGF/Cn8QOxKqEvsE6H337ATgmaMSC+ic4Nyt1eQw5ul5ucb
         oecpKd3dRSagCRBOJKUaCwTrIxAAIwNbLFJOBnp0iA9+qVRUmAXIy/dPGlbxuvysTKA9
         OMVK/Ghz63I+5lSE1VrLTp9eCNUSNH+skn1Q67Lc0T9SyVRX9xiAd40lXX4I5lVLJypp
         tv6rWMZcXr+JJieFvT7eSNeN4t+YNja0aozgoLGz3BCBCY2HX5WyLSX04SFVPFSOkJ4h
         Dp8h0kioWbQSVc8mZqKpKYnDFwkfCss6oQorV9HzNWDEMhQI6mThUI8MW/V9NBxnCuA9
         wIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354728; x=1722959528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JDXmT+9NceTWH8KohoT7sAzeOEtpvwWoaxsk4ASnv0=;
        b=CUrCI9iBzNCluX6W6shUUnBPT4ed/6z3tR8JXU8p9sC0VrXLOlTcN74odPKD1Ak0wL
         deLRoIybrMWXaX9Xc630li45JE/wSc2A2G+7fkhQQFrr4Bd6KNEBoPwRXXnUVgbYtsev
         L2v2NuEEarzPKYhT788dGD76XszM0yq2Tm0o+Rezol9UHXKDz/UKZya/afqbanFWa/AP
         qkfZrQwv5fjLKWVdIDADqfLFcA7pliyEhidFm4OocXCPTZUqWg908PoHWr6Q48svmRis
         7+dQiskfFcVKxT8mxQlPs8dB39Kluu75vs75WSIey5YcGcSSeSxvGmN6VbQr3BEYgnC2
         HqlA==
X-Gm-Message-State: AOJu0YyKIz33MepI0JJ1gQVLB5rGkl6iBemt+vMasIUjMMEnhhu+xeI5
	kWowLM+Xl4eIbmAbaXgAJQbzjGpeBJNOpGJojJQRYkSsi99/cioAtZpehA==
X-Google-Smtp-Source: AGHT+IGoO6DQ1rtic7l3gtPx3JF2F1Dz170Fr2A7Ut5Qg0NxwSC9fA9FjvW9tkZzH0NC1QwRbnV3nA==
X-Received: by 2002:a05:6a20:d707:b0:1c4:bb9f:c574 with SMTP id adf61e73a8af0-1c4bb9fdb54mr6559666637.43.1722354727775;
        Tue, 30 Jul 2024 08:52:07 -0700 (PDT)
Received: from localhost.localdomain (71-34-81-131.ptld.qwest.net. [71.34.81.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb7600054sm12788517a91.47.2024.07.30.08.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:52:06 -0700 (PDT)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Erin Skomra <skomra@gmail.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH 3/5] HID: wacom: Support touchrings with relative motion
Date: Tue, 30 Jul 2024 08:51:57 -0700
Message-ID: <20240730155159.3156-3-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730155159.3156-1-jason.gerecke@wacom.com>
References: <20240730155159.3156-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

If a touchring is configured to send relative events (e.g. +1 or -1 every
time some bit of rotational distance is covered), we should similarly
send relative events up to userspace. Previous non-HID tablets used
REL_WHEEL to send this kind of information, so we opt to use this same
axis since userspace (xf86-input-wacom and libinput) already expects
this kind of behavior from the Wacom kernel driver.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 7e81c93d18229..96b158a94ef9c 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1911,6 +1911,7 @@ static void wacom_map_usage(struct input_dev *input, struct hid_usage *usage,
 		}
 		input_abs_set_res(input, code, resolution);
 		break;
+	case EV_REL:
 	case EV_KEY:
 	case EV_MSC:
 	case EV_SW:
@@ -2047,7 +2048,10 @@ static void wacom_wac_pad_usage_mapping(struct hid_device *hdev,
 		features->device_type |= WACOM_DEVICETYPE_PAD;
 		break;
 	case WACOM_HID_WD_TOUCHRING:
-		wacom_map_usage(input, usage, field, EV_ABS, ABS_WHEEL, 0);
+		if (field->flags & HID_MAIN_ITEM_RELATIVE)
+			wacom_map_usage(input, usage, field, EV_REL, REL_WHEEL, 0);
+		else
+			wacom_map_usage(input, usage, field, EV_ABS, ABS_WHEEL, 0);
 		features->device_type |= WACOM_DEVICETYPE_PAD;
 		break;
 	case WACOM_HID_WD_TOUCHRINGSTATUS:
@@ -2112,7 +2116,10 @@ static void wacom_wac_pad_event(struct hid_device *hdev, struct hid_field *field
 		return;
 
 	if (wacom_equivalent_usage(field->physical) == HID_DG_TABLETFUNCTIONKEY) {
-		if (usage->hid != WACOM_HID_WD_TOUCHRING)
+		bool is_abs_touchring = usage->hid == WACOM_HID_WD_TOUCHRING &&
+					!(field->flags & HID_MAIN_ITEM_RELATIVE);
+
+		if (!is_abs_touchring)
 			wacom_wac->hid_data.inrange_state |= value;
 	}
 
@@ -2165,6 +2172,15 @@ static void wacom_wac_pad_event(struct hid_device *hdev, struct hid_field *field
 				 hdev->product == 0x3AA)
 				value = wacom_offset_rotation(input, usage, value, 1, 2);
 		}
+		else if (field->flags & HID_MAIN_ITEM_RELATIVE) {
+			/* We must invert the sign for vertical
+			 * relative scrolling. Clockwise rotation
+			 * produces positive values from HW, but
+			 * userspace treats positive REL_WHEEL as a
+			 * scroll *up*!
+			 */
+			value = -value;
+		}
 		else {
 			value = wacom_offset_rotation(input, usage, value, 1, 4);
 		}
-- 
2.45.2


