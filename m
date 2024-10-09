Return-Path: <linux-input+bounces-7226-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E45997225
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 18:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CD38B25F01
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 16:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077FF1A2554;
	Wed,  9 Oct 2024 16:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKR9ltST"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4632629D;
	Wed,  9 Oct 2024 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728492088; cv=none; b=qmGNnGEL9H5ZNzHAXPmSW9xCcemyZ/o/XESLgU4m3jGQIt1xDvdQD8TjboKMLynwLhYyP3B9MMBeCf2u2ew8mOsY+8Ydh6k2GQMS39SmqETrwl9O8tYXN6kAj6Zmu3tGFgRctKquZxiCsav6TQzQosoAvBcc6FmKwT8DhC2bLN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728492088; c=relaxed/simple;
	bh=FtmFacOX5DCpi06Gq4yOe+w4z3bklN20e7XbbS2twxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1oq/KZnkx9q7AGHuL+Q8BVpm8WMxSqaidd6qj3FeT//A64KSwMrrF11436dT0xfWf13/EhXTQxpDaKy9gV3nhXOLpJzrwdTEmFfCJ+n+BKn1DpysAM9elPV5EdtABlobPZF6rY7+3CYEzYYR0xpxGR5IvvZpjMG6b5jaj1FOzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKR9ltST; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b49ee353cso65830195ad.2;
        Wed, 09 Oct 2024 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728492085; x=1729096885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1oc6MVsjRwuDR5zSAmQkVBBBJHZlhUlDFodVgsGox8=;
        b=CKR9ltSTJQzwJSGJg1/vxvvwr8obkRaO6Glja2z8HtYuGVz/7QMMAu/BQyzdrfS0bf
         bSTLKMLJo3SetIKwk5EzAXkn3crUJciPDV64HmeWrls6gTbtTvGMGpkHjDHCBe5OcoHK
         8RPfIPl/PdWbk1H9BZLNoWG/kTbd66lv2KHSHyRjz6n0UfKk/8/HiZTsXpvAJhQ8xQd7
         YEt3F3JsZpolcDthsWIcf2nxJIfZdSvszxZ4v38NRbeC5ag1PMGIPitLPC7xOpkU0orv
         Lr6exTjZnH3f6aevThNoLLsDLPvkXGZEnWr7C2lQtpMfVHuQI8UcATS8Bz7ql5jvR0e0
         HO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728492085; x=1729096885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1oc6MVsjRwuDR5zSAmQkVBBBJHZlhUlDFodVgsGox8=;
        b=WyGvFWhJ79lYss2FUwpxwdR0UNKRjmOPANIhkbKhapziHUU/L4C2RkhtIyyAbSdH/x
         Oix3P6fcXN+eCALRHT8xtfxNV8xrJgEWEHF0YiJZ6IcN7V93hSjwO3p1YeHMRoxVtAqv
         7/nTPEEfV/pmWRzEKMLqTvxdRXTN7K2jO9N9F4PpmRPm1ASMIuTVziw/Z1lhO4H+HraB
         9l7bUYWrpSOngAA//kVxWpUWyLhKtmtDcnrg8kwwWfcDj7UqKJH4lQmpTTeZxqG8B+g0
         F5mgpAXf4qa7QNJM8kW/6nbr+b56plUTnzKVSsxIlveJQPMueoEG/GVxqhZ8lckxL4x0
         OOaA==
X-Forwarded-Encrypted: i=1; AJvYcCXmd/7xSbQQUdoeoPo4hoXhhmSpor1LGQvrqjXXEMYc6jgiaH2Glwdvp/fLhVeqa+sy75TkX2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyai+c+FrXOoxQQi2qsgfwS8qvmZ/2zjcYkQ82OK2F2PJ9VazNS
	qI6x7MKO9qHO1Kl384+/xkEdAERkmRZWvKUxEjg8sj7MS7IdiCZ+vudCkQ==
X-Google-Smtp-Source: AGHT+IFB5OWqkgJZgC+qhM5Gk9d4+IU7Jk4BArvpxTKrpmrXEe8CBX9v9bISUo0sZWvcgLyFQOiPHg==
X-Received: by 2002:a17:902:ea03:b0:20c:7ee8:fc3c with SMTP id d9443c01a7336-20c7ee8fe86mr5648745ad.22.1728492084914;
        Wed, 09 Oct 2024 09:41:24 -0700 (PDT)
Received: from US-191-ENG0002.corp.onewacom.com ([50.226.71.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138d158bsm72961055ad.99.2024.10.09.09.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 09:41:24 -0700 (PDT)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Ping Cheng <pinglinux@gmail.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Daniel Jutz <daniel@djutz.com>,
	Christian Heusel <christian@heusel.eu>,
	stable@vger.kernel.org,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: [PATCH v2] HID: wacom: Hardcode (non-inverted) AES pens as BTN_TOOL_PEN
Date: Wed,  9 Oct 2024 09:41:21 -0700
Message-ID: <20241009164121.30281-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241009001332.23353-1-jason.gerecke@wacom.com>
References: <20241009001332.23353-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

Unlike EMR tools which encode type information in their tool ID, tools
for AES sensors are all "generic pens". It is inappropriate to make use
of the wacom_intuos_get_tool_type function when dealing with these kinds
of devices. Instead, we should only ever report BTN_TOOL_PEN or
BTN_TOOL_RUBBER, as depending on the state of the Eraser and Invert
bits.

Reported-by: Daniel Jutz <daniel@djutz.com>
Closes: https://lore.kernel.org/linux-input/3cd82004-c5b8-4f2a-9a3b-d88d855c65e4@heusel.eu/
Bisected-by: Christian Heusel <christian@heusel.eu>
Fixes: 9c2913b962da ("HID: wacom: more appropriate tool type categorization")
Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/1041
Link: https://github.com/linuxwacom/input-wacom/issues/440
Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Cc: stable@vger.kernel.org
Acked-by: Benjamin Tissoires <bentiss@kernel.org>
---
Adds additional credit. Apologies for missing it on the first round!

 drivers/hid/wacom_wac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 59a13ad9371c..413606bdf476 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2567,6 +2567,8 @@ static void wacom_wac_pen_report(struct hid_device *hdev,
 		/* Going into range select tool */
 		if (wacom_wac->hid_data.invert_state)
 			wacom_wac->tool[0] = BTN_TOOL_RUBBER;
+		else if (wacom_wac->features.quirks & WACOM_QUIRK_AESPEN)
+			wacom_wac->tool[0] = BTN_TOOL_PEN;
 		else if (wacom_wac->id[0])
 			wacom_wac->tool[0] = wacom_intuos_get_tool_type(wacom_wac->id[0]);
 		else
-- 
2.47.0


