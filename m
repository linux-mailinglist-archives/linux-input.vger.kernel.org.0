Return-Path: <linux-input+bounces-15489-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C76D0BDC75D
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 06:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A03674E9B61
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 04:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8332F4A00;
	Wed, 15 Oct 2025 04:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qyr8CwjN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779472E9EDF
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 04:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760502529; cv=none; b=Ek1IT/igXmQ8iGgQPgKvAAUBJGo5l3kKQbtWt+hijRwv0PgjWE8wnwELzEvOG45d7tOGAJHJtrYYGymD39fAKMqenBCofB6mVQAIYR+jmXyya0AutKStfyS8lByZHIOulVbvB5uIM7SUkFJpKLy4nTD3RsA7n9mx5oh+eG7nvxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760502529; c=relaxed/simple;
	bh=7wfAMnESvRVrcUxGm70UpqypFTY1iKeOAV6XurtA0Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TpeehkcLxMOEMvCx1juBWDL8zpb8DmLK03Z0sDRDY7eiU0EjlLZFTVyayxDAjyiWcPwAjzyx8hzy11dP7MtVTleuWoNZaTOTantMbn9jIAW3JApRWyliP3uQxrGbwcNxYT6bl6FrzOWlcGdPuT3ZtVU2CK8nqm22sW8wxL9wgCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qyr8CwjN; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3324fdfd54cso6490487a91.0
        for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 21:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760502528; x=1761107328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlH0cGjIB/p6Xp9aiuKUvkG4AK7l2RitPxC5XPops8s=;
        b=Qyr8CwjN3MWAP2TbGkPi/kxVritlsj2ORvjmauQFX2nWZrncOY2n+PWiSTaHaWWTUU
         98SLlvMwLMWe4Yvh0gQ8RHyYSKIiiPtwz4MdSZJohRSBEVFkAsOOyhIyR+R6enXTFxJk
         vCg5cZdwJpIjLeS/BDn+VfiXs613a5qqaLckCfajcrQN7s54t6tEWM1ZIHj1gocIbjy5
         4fitLYBKIP8fY+YgBr7B3jiShHe9xuColP+9+wN64eXWacS+HXV4BogEsbf+5gimtsVV
         7vuzKeK5c2HvEGeGfpDztTpkFPrGPRTecP6t1uDt3pDw80zohq4RScPVd/VWzQBnD7xi
         2wHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760502528; x=1761107328;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlH0cGjIB/p6Xp9aiuKUvkG4AK7l2RitPxC5XPops8s=;
        b=pmoG1rAMqhd6WQsRN0C2YdBAIDTxl2/HEuRZM8QY83FO040SQw7q42KqMP+sArkFQO
         Az68y8Wi+umrzNPEhBPKw7jpLV0OYNUfMYgUgzmXZZWO/X3XqhNvhultu4+/v1dq407n
         mQOQfe/XPKnJGuJBQNbbEsw4wKJq68TOQqU+CqnpNmlzMzIUPGZ4cMmNxiaRRMUXaEiG
         7YbG5JkhshmNfbcBEM7s1qn/QHsMAxKc23SUmsLB41M0YoOOwrryNAR43Qq1ZN8cbx6K
         etnTY3YBFp1r06KtI6l+MiAZziHuWfOt8qyTRSFsU1pNJv3xWeFG5kc+/bbucON/JeTD
         uyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3BfKZgKgxHWVK6DzF5BlNFPbp+Jhuf3P305yE5S2pcdLiLVZnSK/gWXlPYrmrpHr1aPfCYKXAS9uvdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIO7xmKPaKuarrrOdIfgt6EXa5KOErtpHNpKa0TQ2meLTfYl/s
	R6eiSYczQPvXV10Nu5a3v6kzs8d35IIia3x6+N7nM/JW4WInjEBS1mb/
X-Gm-Gg: ASbGncsMT/t5gk5a27cK7JAP6+FImhaSOtxKdqQqndPWru/2vd6ueUAhcytDGqG77uL
	hrZpP8GQEenlj6jowLyXw1SO+CvEtJ0wY4EjFiS4Xd8LG5eg97yiAQ+1CCvxNIUfjBDvQEUUuJH
	kATfIBDM965vAuRrAd+rW0xlG6zQSKnVUsugEBIkv/wBw/07RiHmusxwEacYi1DR6F4V3ld+1a9
	s1Y9jhzKn1TUqISmRKuIqaEt0oqCuc4/mrs6neSzFS7shG9Tb5wwvbDrGnYABB+fOIgY0VX4O8u
	EnmbzjpJUoo14L8sPxU9irVWL9Fo+BwNV/YjdvWTUFEAcw1Tt6L0A+Lxi7HpCdddLyKfoeze5TK
	PVdfHKpwSc6MmpB3Ir4EcpqmeT8XNkEL8zX5OgpR34gDPJ2DqWpEnzNGjVhzk80uX5lTDFPPbrN
	SlKIuGTw==
X-Google-Smtp-Source: AGHT+IE+Deb2FV+DtdpOThkIj5o2+mjtlGjIWhQkTWNRouhVEAGo+cWfvB8mD05/8Zm7cLUB7Rvd4Q==
X-Received: by 2002:a17:90b:4ac9:b0:32b:9774:d340 with SMTP id 98e67ed59e1d1-33b513ea07emr39765138a91.33.1760502527651;
        Tue, 14 Oct 2025 21:28:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:729e:7380:f286:50df])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9786f659sm680988a91.13.2025.10.14.21.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:28:47 -0700 (PDT)
Date: Tue, 14 Oct 2025 21:28:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?utf-8?B?5Y2i5Zu95a6P?= <luguohong@xiaomi.com>, kenalba@google.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: hid-input: only ignore 0 battery events for
 digitizers
Message-ID: <c5b52grvciabpcgavhjqximqqq6fczowgvmckke6aflq72mzyv@gzzkyt25xygc>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Commit 581c4484769e ("HID: input: map digitizer battery usage") added
handling of battery events for digitizers (typically for batteries
presented in stylii). Digitizers typically report correct battery levels
only when stylus is actively touching the surface, and in other cases
they may report battery level of 0. To avoid confusing consumers of the
battery information the code was added to filer out reports with 0
battery levels.

However there exist other kinds of devices that may legitimately report
0 battery levels. Fix this by filtering out 0-level reports only for
digitizer usages, and continue reporting them for other kinds of devices
(Smart Batteries, etc).

Reported-by: 卢国宏 <luguohong@xiaomi.com>
Fixes: 581c4484769e ("HID: input: map digitizer battery usage")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: rebased on top of linux-next, dropped Tested-by: tag

 drivers/hid/hid-input.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 5d7532d79d21..e56e7de53279 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -635,7 +635,10 @@ static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
 		return;
 	}
 
-	if (value == 0 || value < dev->battery_min || value > dev->battery_max)
+	if ((usage & HID_USAGE_PAGE) == HID_UP_DIGITIZER && value == 0)
+		return;
+
+	if (value < dev->battery_min || value > dev->battery_max)
 		return;
 
 	capacity = hidinput_scale_battery_capacity(dev, value);
-- 
2.51.0.858.gf9c4a03a3a-goog


-- 
Dmitry

