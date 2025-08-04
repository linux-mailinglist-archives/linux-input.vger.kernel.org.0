Return-Path: <linux-input+bounces-13806-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB98B1A436
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 16:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8054D18A124E
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 14:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6211E27464A;
	Mon,  4 Aug 2025 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LTZwAZ6Q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C40272E7B
	for <linux-input@vger.kernel.org>; Mon,  4 Aug 2025 14:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754316689; cv=none; b=W9djjhAYV+mPZINz17xaJ63J/5ucqtj5nVzeSIC0LiYPbvyLbxceA5O1hcwOle1odsMvitet2bTBeJPSfkETJsrpEsxeHmzAnb3Lv1sRMFOJPJmoSZAKZWONRQgwFZtK8YGNXzys3bYHtvVBeTYqoNU7MTJNSAI6Wx/bmG5quhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754316689; c=relaxed/simple;
	bh=LcDf0eRQa6CauF9x+0Xls3nBIKLOdfur99AWgEtgPGc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KfChRyJ/QP0m+7JiUvIc3TK/HNAZryPh0C5/F0zfDiZHIhBp2Ht7nq9mUfoCVIeFETc0TUbJiNfSe/rP5B2TylHhbO7sWcmp3LS8fwMaH7Wn6Yo1GBUXPr71LCqEDrj0XdyIlgajb/9kWZzGZwKygM8jTMBAqMu4r/9kJ8oRkUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LTZwAZ6Q; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3e410d87897so32511035ab.0
        for <linux-input@vger.kernel.org>; Mon, 04 Aug 2025 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754316686; x=1754921486; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s5ue1ow6B+qjHFJbRE57LcW6Xcqfgr6lS2a71BgvhiA=;
        b=LTZwAZ6QzE/FBZEzcr6e2oYqNdc/y1wLFNfCqarlQCaj3vzyKuIMx8YAeKpODY4qkj
         3X8WydY5yi+6HDjKbyqsHuDfwXLEXLjHRaHS1C9DZVQcVlBrivUHSZtj4EEoLUj1YXIz
         LPgirpiDjRQylO0TAeHabk6zYhFF/WpPZgvV/sNx2vDlunIGBy52ER/hk/qFQGjAfnMC
         Krxsb68qVBSB/RElLYhOf0tmeWBk6J8NK6YMkqFwIpAWxe6UhCk+g4Yob3drDn3mcfBa
         gNcqNrERixAnBXPrUpRyw3tN6SVupAoNk2kDzYLNHb1kpy6MFWNeL+93gAkfXZ0bDioo
         uZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754316686; x=1754921486;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5ue1ow6B+qjHFJbRE57LcW6Xcqfgr6lS2a71BgvhiA=;
        b=uYCTslvnBm7BVLCIa/v8gm0HAedLeXTr8Z9zjKzuRUZtUO8wh4ihJb8Mt3/InwAOuv
         bodef+Ody0oZeBM5RwEk+Jr3r3RqVPY1vsJqd0wsiiEiLHU5H/MkGUhsiVfhqtqYTq7G
         bUHKWS9KaId4YCGzBxyTCnFYje2TC+5/3cJDN7gyFNCoWJ1Sbuzh2Dh0kxaLefVcA3BK
         uEUfD5d/wK73dBp5N66ajcSJRJR9in2vz7fRLw84zdDOrbkrEJLYIQeSIAb0FAkMsREf
         vkKnV+dZzBY52YLvMkg8f10mKB0sJR0RUsGygBgWAd7A0CkIpHU+3npVkcFVJI3kg+FI
         32nQ==
X-Gm-Message-State: AOJu0YwJiYYpImPHA2aHf3bFz/+CFq/QM93qMaCjNmhAprySgmgRHEvA
	HlOl5gkRs0aEc3pv4LXR2kZPvboxF9fLvJszs/7uDaDY4BlT6ilTeb5iaOxMh/RnhgkCbeeUTAS
	QYhAD7Z+QUQ==
X-Google-Smtp-Source: AGHT+IEvuLZqvj7ju8vg5N1aQ1C6x+fs98fRd9oWA6NKgtlabYP/rk9fvPfLoXJvjw/4lU+T796rg6z5WX0F
X-Received: from ilbbn7.prod.google.com ([2002:a05:6e02:3387:b0:3e3:eae4:c433])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:398e:b0:3e3:d499:73f
 with SMTP id e9e14a558f8ab-3e4161b735cmr210331175ab.18.1754316686600; Mon, 04
 Aug 2025 07:11:26 -0700 (PDT)
Date: Mon, 04 Aug 2025 14:11:22 +0000
In-Reply-To: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250804-support-forcepads-v2-7-138ca980261d@google.com>
Subject: [PATCH v2 07/11] HID: input: calculate resolution for pressure
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Assume that if the pressure is given in newtons it should be normalized
to grams. If the pressure has no unit do not calculate resolution.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-input.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index d42c1fbd20a1cc01c04f93cf10f1d1c18043929c..1d59787bd0c0e251698e2a2944dae1c4a96adefe 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -303,6 +303,19 @@ __s32 hidinput_calc_abs_res(const struct hid_field *field, __u16 code)
 		}
 		break;
 
+	case ABS_PRESSURE:
+	case ABS_MT_PRESSURE:
+		if (field->unit == HID_UNIT_NEWTON) {
+			/* Convert to grams, 1 newton is 101.97 grams */
+			prev = physical_extents;
+			physical_extents *= 10197;
+			if (physical_extents < prev)
+				return 0;
+			unit_exponent -= 2;
+		} else if (field->unit != HID_UNIT_GRAM) {
+			return 0;
+		}
+		break;
 	default:
 		return 0;
 	}

-- 
2.50.1.565.gc32cd1483b-goog


