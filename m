Return-Path: <linux-input+bounces-14349-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12207B38316
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 14:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5BE4685FE7
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 12:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA70352FCC;
	Wed, 27 Aug 2025 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ROQyeSXt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9FC34F491
	for <linux-input@vger.kernel.org>; Wed, 27 Aug 2025 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756299462; cv=none; b=n5AG9j8Q35vAyVGD+C9r9ie1nCZPyppgW0JUTLJATgpEaj6kG8zl52wr+j+SW3jVYcssOwglRct4VKKkgnvU71Fkpw9/HCeWb6TGQZiTyPaD82vveAJWIioxEK/rKWdUdgMBzKLfuhPs9FBsxnxm4f3BdkYT2soSH5BPHzGy1A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756299462; c=relaxed/simple;
	bh=IVQvp15wfNkLgDcY12BQoE0NmPQxYuWThoUBl1tUWxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dcC+PT/eQEz0jN/WcB/3ROIipjtZ2sLI4yNiuf8M0tfaZNC2x4MF0hCAe8U1HNsCmahY6T6lniuRfa780D/8UJN151uFvhW7CfFucSIWqxMCXr5B2uHMrqwHMJi3TkKRS9KpCLmT+LGdzePcJlD/MynvAVFO+J5lGTmr+OyiWfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ROQyeSXt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso58347335e9.3
        for <linux-input@vger.kernel.org>; Wed, 27 Aug 2025 05:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756299455; x=1756904255; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qt3k+9WJ1vxtDbvUOLITs++A80wdPJ5qfZ84mPyZtBY=;
        b=ROQyeSXtvrK2+APnbNXPM9OoO40s261Y6zCB6D/C1eUzr65UiWGuXZigWKEIRkTvMu
         GRgHf/XjogakwKg8yibhQ93RK39QlTPPbUBzYX5+AhDwZuIhOimp/uMX/WutvlWjwuBx
         YnGLl2VgIarMF3cLK14XBa1SYAHceY9z2uUSGpns4AlIBrBDRYtS3ywl9Ls/GwK59aQi
         ujLD7mArJRFf2k33dQ1d2dYKo9EblTQ7EpUJAJq/pYA4LTp4Y+Mmds9nfQRbNMKX0KCU
         D2Co7zLlRVAC5ZFQ6wXkG5LyF6Ml09FtyZM/KdjzeRV+RHLamKz2am4AUu4Nxe1m25Pi
         G1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756299455; x=1756904255;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qt3k+9WJ1vxtDbvUOLITs++A80wdPJ5qfZ84mPyZtBY=;
        b=W/X5Z9PayLNbzYu3MkI///oTQrAUFxlBXtR9DAMoGSl+J4fTRMCz2cocLSyhc0r7G1
         jXVJXUn/QD1Jgyb7NKgLKXxMjPEQvzFX9Oe5zsLfeztEyLflqWLnLwHXQjAej5KUQQWF
         iOqQBWYeNtEYYl+8kv/pCxfJ0GB7lXK6KCRryMzFbK26U6iI1Bl6i3kynmbdtsxi8/6S
         /a9emjyFLmvzModtCpVJHGh1Fh1FE8OA8V3hz33Z0Hi1RAbJtTR5YjG0PQ8hL+T93qX7
         6VVEdDa3R+a+jSbz+/dDQv8b1nZzXGvAC++ok/b2iaQmPqdy1B22/YHn1YIe3fyT05DO
         3M5w==
X-Forwarded-Encrypted: i=1; AJvYcCUVt5hWzsl0P7ipWBl6lscsRNXB3lwm2tM52zpsdrcRaE4KQp5d9t8m8FQZqfzv3OirB0eC8nNzRqV6RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyseJonwg2Vt74RSaCPgPEkYUtTxTaZIXIn6pujvtIhdgaxcDvU
	IcaIQOUjb1EQlTE/EJZ5vL4Z4G+GJV67n3iwgPVSLNyhPclzLQdcAnFStigBMcHVJC1SAEKeIxH
	Ofxwp
X-Gm-Gg: ASbGncuK4UPafIsv8Y0TrtZGDjEGpyIwK9ouD+vEi+ECkU+xJ4FMpShqfBevf6MA3/R
	55UAfMvk0Ivl148NGPVyHB+BcLgUMbW6C29L7uwQ8NfXo4Z4gK2Xy8I0S0vaVuIRgDW6y4NZ12v
	fCxCNo+SouUFTJkEx7VenT/2fv0IO5iWQVkwORoAS2QVcY69FitZVL4XRACw3Thcx5AZqer5Xgz
	RAyMD365OTNeyp4UKavPUWbdRQKeBymCDyAOIcGdWOKs/1rWuCLnWHNEKhbWG1kNYx3pZiKnH5X
	7gW41XxggpNTOHz5OqSXP4rsMaMa+R3HPFIsuH8zoAYY6UsWMMz1bLm//noacMHKRxTNHEHoZ9m
	x2GBaD3BtXq/+Nl/Ia/tbjDSR69o=
X-Google-Smtp-Source: AGHT+IHjUEVNRaMcvygKv+iGwtxqWwlTGN/e2l08ILhSI6zslwistJVIxeihubmkK8ZmS/PqRK6l8w==
X-Received: by 2002:a05:600c:3552:b0:459:dde3:1a33 with SMTP id 5b1f17b1804b1-45b517d26d4mr163145305e9.26.1756299455350;
        Wed, 27 Aug 2025 05:57:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c711211e87sm20190252f8f.44.2025.08.27.05.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:57:34 -0700 (PDT)
Date: Wed, 27 Aug 2025 15:57:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	=?utf-8?Q?Bart=C5=82omiej_Mary=C5=84czak?= <marynczakbartlomiej@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kenny Levinsen <kl@kl.wtf>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] HID: i2c-hid: Fix test in
 i2c_hid_core_register_panel_follower()
Message-ID: <aK8Au3CgZSTvfEJ6@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Bitwise AND was intended instead of OR.  With the current code the
condition is always true.

Fixes: cbdd16b818ee ("HID: i2c-hid: Make elan touch controllers power on after panel is enabled")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 99ce6386176c..30ebde1273be 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1189,7 +1189,7 @@ static int i2c_hid_core_register_panel_follower(struct i2c_hid *ihid)
 	struct device *dev = &ihid->client->dev;
 	int ret;
 
-	if (ihid->hid->initial_quirks | HID_QUIRK_POWER_ON_AFTER_BACKLIGHT)
+	if (ihid->hid->initial_quirks & HID_QUIRK_POWER_ON_AFTER_BACKLIGHT)
 		ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_enable_funcs;
 	else
 		ihid->panel_follower.funcs = &i2c_hid_core_panel_follower_prepare_funcs;
-- 
2.47.2


