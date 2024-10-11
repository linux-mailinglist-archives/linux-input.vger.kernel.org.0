Return-Path: <linux-input+bounces-7373-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD7199AD41
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 22:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C188C28216F
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 20:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6705D1D173D;
	Fri, 11 Oct 2024 19:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oQEDycBT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DD61D151E
	for <linux-input@vger.kernel.org>; Fri, 11 Oct 2024 19:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676697; cv=none; b=lUn58OH+uDY02KfRfkR4qgnwrIwzujRRTKqZD7wb/G8fJGL5AcLomu6EKDIA0mxQp6PChNONhgSgZxJYcz1bOpH3Jomr17DTPB6iotqG9sPAyWOoFiKzJ/bjRti2vL3VGZf7DmZSVf9Z1b+nCyf9uSzI7uJliB38FBUVubaDP88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676697; c=relaxed/simple;
	bh=bXQFE3itaFAdKfbtzcbHIC9auRWQD2GmCmBYI9BFMU0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WhV09pTYs5RjIxWrn9RPgo0/aWTb9I6zKSqYfSlTLJ9SjZ0qfTC2oa1X5HTIL+zS+kHQArfy5g9f0N/es2JSmACemq9y+9oHu533hWerIQDsqHxr/xnQu1yMl1ZDpDb3We1AeRQpd1mFagBvGlLgzzV9LsJyEYdjusTqdNN41vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oQEDycBT; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9932aa108cso358455566b.2
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2024 12:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728676694; x=1729281494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NPLrFiluaTv/AfVjUwsqICa5b7FOa8ej0Eq/Hh4yhYA=;
        b=oQEDycBTBOUyrqrzjoFbmPic2sqyw4oSXLc3IZ3YoXz8B863CjFhnUAwVddomTd+84
         C8/HnMmVnyGyeMv3nJq8sIjI/c3bTlgsPPdq1C2T0/F97uAxam5X93XyPlWXjUhsloN/
         ww8x5HIfsoeBf31zcFGBde+VKkIDaTZQl8hwz1hiIsao26rr8kgKPgAMzzaG/WrnVYaG
         /OVaKY00cwm38A1GyNl1sILsUJCgl/+3ttWHu1o8sVqljXPMsVmYUoPtk/6vyhqUOEDR
         LOgpJBGNgVLQxTXDHk2o+ZZUxhIw6McMujov7e2ue2dRAVXhJjWm37+xEPgxaqKxkUt6
         4DlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676694; x=1729281494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPLrFiluaTv/AfVjUwsqICa5b7FOa8ej0Eq/Hh4yhYA=;
        b=odQwYY24zEp+iekbRXsCwJvtFdIlXwMJMxN/oxd/iAbXZIW4BDpjn7pLcvQeXoQnvQ
         oelX7k+ZQKL6iZwU9ON9JMEmmVVIccXkQyHEQwINjkwd4biTWYaHzaXpA/ckGCeUy2/J
         tnuHN1VBQ9fGUdt5TcY6phH2c1C5VEtCzHKFOBepUistiyhMKPowPNikFfLpHUSeYNmv
         YZtBOvtJbmQE/xBAUp5qN25UGN0Gm7gU40pJxYQUNntXTbkL/6Naj+0KF/l3yjzhlYcr
         JhWNZ2hzam/DLrX53r9wX6DwxeaDdWJbwTCjxAeY7WoT+7JJPyC9cUYpU4EcNLIHnPJp
         QxIw==
X-Forwarded-Encrypted: i=1; AJvYcCWtEePi42gU+OuQ5oBjkEUjT17SSDacYaUrjm1lhk3iwO7d7eja2J0bWZiDCWDCOX5a2BjC7kICqi2/lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIWSa/Ap92bkF2y9t3LoWp0En07dMEZGpaYtL0fAFHs3AhpSwi
	YsCndTnbItA4aag0GS0lvvqKvbBsK+t1DT8/ZY1xdd9WtQ+uJFQ+Rr0aMJh0u58=
X-Google-Smtp-Source: AGHT+IEEBZFkjEosknpXmEyqlDxeJlFPPW8uctPPJouHKjCsMAMgWai9e5GK7hVpqtLZoTBKG/YBTw==
X-Received: by 2002:a17:907:720b:b0:a99:ea2c:59d1 with SMTP id a640c23a62f3a-a99ea2c5ca8mr5091366b.26.1728676693962;
        Fri, 11 Oct 2024 12:58:13 -0700 (PDT)
Received: from green.cable.virginm.net (nail-04-b2-v4wan-169014-cust557.vm26.cable.virginm.net. [82.47.146.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f27bfasm245315966b.73.2024.10.11.12.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:58:13 -0700 (PDT)
From: Terry Tritton <terry.tritton@linaro.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Aseda Aboagye <aaboagye@chromium.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Terry Tritton <ttritton@google.com>,
	Terry Tritton <terry.tritton@linaro.org>
Subject: [PATCH 0/1] Do Not Disturb broke GD D-pad 
Date: Fri, 11 Oct 2024 20:58:07 +0100
Message-Id: <20241011195808.2201-1-terry.tritton@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, 
We noticed a breakage in the android test: CtsHardwareTestCases_cts_tests
android.hardware.input.cts.tests.GameviceGv186Test#testAllMotions

I bisected the issue to:
	commit 22d6d060ac77 ("input: Add support for "Do Not Disturb"")
The cause is pretty clear there are 2 separate checks for:
	if ((usage->hid & 0xf0) == 0x90)
so the second one which handles the d-pad is getting skipped.

I've combined them both in the following patch which works for me.

Thanks

Terry Tritton (1):
  input: fix generic desktop D-Pad controls

 drivers/hid/hid-input.c | 37 +++++++++++++++++--------------------
 include/linux/hid.h     |  1 +
 2 files changed, 18 insertions(+), 20 deletions(-)

-- 
2.39.5


