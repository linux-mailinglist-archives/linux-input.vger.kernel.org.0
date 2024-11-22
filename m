Return-Path: <linux-input+bounces-8197-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF0D9D633E
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2024 18:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0D10282DE3
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2024 17:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B6422339;
	Fri, 22 Nov 2024 17:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eeY1oGmL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88251DF970
	for <linux-input@vger.kernel.org>; Fri, 22 Nov 2024 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732297018; cv=none; b=gEqRKx3Zjeh0CYTGl5ZnrWuwxQ1AAyAWbBczNBCRwR8uLVRs/BMTDx6gLiy90eHbqhKwQtGvjMxmuc1Lio+dl5Hq0qbLPjx+OLj50fUzrdKOOPw1WvTI3gKff9JOTWWLAvs9G2+rd2ne8ubKomhAtzuYCgxhW1E+FD53er9+FQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732297018; c=relaxed/simple;
	bh=LYHv25BlgnNGezmW4hSk8hWrtuIkhqDvhTcO/j2PRUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gRx2re2Sj5afq0SGdJ4k5Rag+7LzyaG6rpO/F/ufSbvhFu1zapyx1496vINohBfAi6JTMqmgwPZJjQekUDPjEDQMOsPLKT7bcYE2Ok8rlJOwpjfFKVXIcbl3BV9PHcGaiqIRGvA/uy8nySrjetuMpa3LQz3cvEWVlOaebRikirk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eeY1oGmL; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b1511697a5so132707585a.2
        for <linux-input@vger.kernel.org>; Fri, 22 Nov 2024 09:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732297016; x=1732901816; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3n7nEmxo8kDo/GdhI+k2+p8juIiYwWmm+yhRX/Vo/Ws=;
        b=eeY1oGmL5InSHEKcGfB+60P7AqZpquR2VP/BcLbuUw2778i6xxHVSlcehUPPFuVvtL
         npKdLi5xmZa4SwgHK6yiU8bmpo4ubvhhxwbn4EOFBvSyYT1YbeKUWNF8849wd6CR4IS2
         bgKaGdHLEWjdehPrIwPMbbpSF4HjLYxx2wEWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732297016; x=1732901816;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3n7nEmxo8kDo/GdhI+k2+p8juIiYwWmm+yhRX/Vo/Ws=;
        b=iJ/A9xi0M9XvquMAo/Cg6nFVAu4o5Uy3yI3uif1gVqr2QRHyRnsMvJNcJUdGd8+7Lz
         VZHEVSm3zIa2YNBlKz80tWGt4JFuWaf2i63VqNv0OSFHnBD6kI45NJis5xooFvGtHnCt
         p592N9hTiQRl6GqH9c5duF7urNF6bEVtRhihPancZ2s7FiKSGlnFvXiTo3Ih4wHUbPrm
         9w0KsJFMirUVGhJgA4jv+16rSlP1ZkymAsl5aHAwCqIHDeOC+SN5jkXNn+rmK+JTKMuc
         W7u3a9D5QwhRyJUD1HsWK1VN3dDM2j8Hzba0XHdEIgVVXCVBPzXhne01OoM4TE53GlDr
         Xojg==
X-Forwarded-Encrypted: i=1; AJvYcCVGpOLfcdc35vBNA8fEjurGVCf6j8ULKB8vIQOCm4neTFY9iyW9kztuvpNTtzNFED/PibrAHVi4yjnGaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyakBbn3qAKYZooIESOt5D4ycmE3qoZoTzlXn79VF/ZTexcqGAD
	Od0P/HcKohi99XU4cGPY78rquF58XLj6yArzLFdnZ/hYebY8Ydezml+YixkyRQ==
X-Gm-Gg: ASbGncs3dKPUI8F4KyL+wMCnkg3zMKEczipxHqbFC+XfjjBntxoF1/KO1xtIv1peMXD
	ik+NItqHF0maMLVdhsr9ixLwStqX+1F6oIO2VQxcLZgfJ2FVbQR8QQeSwh4PeLhTMM/R3GiMyOA
	0TkeVYu8bc0blOZACwHEpcrEVkbE/Nz1WT4OjLeaDPZqVlEG0tCDWdoFXbnbiT4NGgYp0tcD4XL
	hcbeMo3I/aYfQ0fyzaLk7RDQI85bVpaRB2OYDXy5L5AhdF8YLXscHVsggwgEkFTpqKXjhOdIlsF
	OgoJG7W9l8mgORDSWnUckhv1
X-Google-Smtp-Source: AGHT+IEttBBYBx0GyZV8ei3rWb/Bwt7PQPUrxuqdwAxWwX5z/MVNcS8800PxYersM5EOYbVTr56k5Q==
X-Received: by 2002:a05:620a:4045:b0:7ae:5c67:e19c with SMTP id af79cd13be357-7b5146126c9mr498103685a.55.1732297015932;
        Fri, 22 Nov 2024 09:36:55 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b513fa4e95sm107451285a.33.2024.11.22.09.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 09:36:55 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 17:36:52 +0000
Subject: [PATCH v2] iio: hid-sensor-prox: Fix invalid read_raw for
 attention
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-fix-processed-v2-1-b9f606d3b519@chromium.org>
X-B4-Tracking: v=1; b=H4sIADPBQGcC/3WMQQ6CMBBFr0Jm7RimVoiuvIdhUdsBZgElUyUa0
 rtb2bt8P/+9DRKrcIJrtYHyKkniXMAcKvCjmwdGCYXB1MYSGcJe3rho9JwSB+RA7nJuLHFjoTi
 LcjnsvXtXeJT0jPrZ8yv91n+llZDQ9o6btq3D41Tf/Khxktd0jDpAl3P+AhUj21itAAAA
To: Jiri Kosina <jikos@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The attention channel is a IIO_CHAN_INFO_PROCESSED, not a
IIO_CHAN_INFO_RAW.

Modify prox_read_raw() to support it.

Fixes: 596ef5cf654b ("iio: hid-sensor-prox: Add support for more channels")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Do not change the condition for applying the multiplier.
- Link to v1: https://lore.kernel.org/r/20241121-fix-processed-v1-1-4fae6770db30@chromium.org
---
 drivers/iio/light/hid-sensor-prox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/light/hid-sensor-prox.c b/drivers/iio/light/hid-sensor-prox.c
index e8e7b2999b4c..0daa8d365a6c 100644
--- a/drivers/iio/light/hid-sensor-prox.c
+++ b/drivers/iio/light/hid-sensor-prox.c
@@ -94,6 +94,7 @@ static int prox_read_raw(struct iio_dev *indio_dev,
 	*val2 = 0;
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
+	case IIO_CHAN_INFO_PROCESSED:
 		if (chan->scan_index >= prox_state->num_channels)
 			return -EINVAL;
 		address = prox_state->channel2usage[chan->scan_index];

---
base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
change-id: 20241121-fix-processed-ed1a95641e64

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


