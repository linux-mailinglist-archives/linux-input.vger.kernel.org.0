Return-Path: <linux-input+bounces-14095-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBEEB2AABC
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 16:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C0A67AE56A
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 14:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95CB322A1C;
	Mon, 18 Aug 2025 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Ct0a0Gt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18208322759
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 14:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527348; cv=none; b=KuMZQ+Gyx8RGoA8421xOZQkFZU4H6rC2/F5lsKkAV6VC1XFFdQHD/zjULOpTin7nTvvrUyNg1W4oF/wCjRjGaSimyCEw9c2y6JzBrePYdEgN6MQUEMyhy0EPqTZNmsqKrdiQLBQ37+q2zn6bBoYwfekb3vYJiA8Ug+SKmVWcqSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527348; c=relaxed/simple;
	bh=Atcf/onrjtwlUDJDKbgX+nxH8WoEO/HoYTnRVc1sXTk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QCo7pxo5eV5VEHJpJLHlfl1sMCMFY6fyt3th7qMBeFbfDp8zSKJSo46EYOUSLojUQ2c6AecyLTLGiB1MmcbG8BPfUdaS5m0gl6/REoQIEaJe+MdqTLob6IZDkp+VPcxug16J/2FaXdb9Tcu3HTO5RKPYPMbqVpqt+YZjW76GCaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Ct0a0Gt; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-88432e1ea71so1203977839f.2
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 07:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755527346; x=1756132146; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q1k1mjvOHwuify9LTlOteZLmh387iXArNoe6DszPTuA=;
        b=3Ct0a0GtXUmplU5qI0Q8BVm/wBsDt2ZGxAPGxK0wRomjXvqDHSKxAlWMtNSJZLX+Oy
         5fSGc4ctmtpVJEzmAb+Jitdk/PnY0wOMm2vGlh45cePIFqtawEO06OlUJt8bJpJRdn7b
         THO62ceIv5nIo6CwMS8L8D14lJwpmd/BeukBu9kxtv5SAEBb8Ty4cZuVDszVdYUhAjMS
         8ufY/OShbuP4ySi/9E5ZrDCNRgwWcmYGYtBgbbkQitc+d0tIoH2fMwFgoLdOk7CmOmbx
         vvulinrMHFJzs0rRJzK+Leyh+CnhVnEN1e1eD3OmQvFnMFBMddLpTLymgy39m2+tDNaj
         Fgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527346; x=1756132146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1k1mjvOHwuify9LTlOteZLmh387iXArNoe6DszPTuA=;
        b=o/BjYznAA/Bywmk99n0y/ufP96P3e9RZF9Pg9Eaj86KzHKd+aNVzN5TvMjwoPphE50
         gdcJgXYCbVZt8JtXI64F11pJBPeDqjiAzTVjE6uUsSPWt42ti7J6bSD7fb3VcJfJm1gT
         wpXcHfLTqQIIwxiHJeZ7XCMKlF79aSDkDRt7/+DZxCuDEXC91C5qXr2D/OYj3TpNHNuD
         irtKu1vomxaKHxjfuewEkxusSM5YjB0oXe3mSBNPQOLc74YPbrz5lAxqXCykXBgLorPP
         JrPof5GXTqsM1J7iw8XrjAZmPGfCU+HHascFaaqXNv9URr6AQNPLT90NOwZPkokXkiJX
         OPhw==
X-Gm-Message-State: AOJu0Yzmo+qwdpUNehqmHkL6vgONmMcqmkdfB+RGKIkOOUAl3HWwppQW
	x2p70i7begNe2a34O0iRRi3xsKXdmkYf34ebjDewMKl61fyYMbl3tNYpc2+4tCUh5O3rPsRxb82
	VI4zq2kw+pQ==
X-Google-Smtp-Source: AGHT+IHskcxyJpFYjk5Ryp9JEoiKYpePKMrSar2kRX1rGmIsjtIdsVkijDGJ4H7+mfWpdUH3OI2LF6xfPnW8
X-Received: from iobce3.prod.google.com ([2002:a05:6602:42c3:b0:881:9efa:4bc8])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:2cd3:b0:876:7555:9cb4
 with SMTP id ca18e2360f4ac-884470f7150mr1505137639f.1.1755527346152; Mon, 18
 Aug 2025 07:29:06 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:28:07 +0000
In-Reply-To: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v2-7-ca2546e319d5@google.com>
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
2.51.0.rc1.163.g2494970778-goog


