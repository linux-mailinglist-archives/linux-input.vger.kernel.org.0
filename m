Return-Path: <linux-input+bounces-1053-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0908200FC
	for <lists+linux-input@lfdr.de>; Fri, 29 Dec 2023 18:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B7B21F21A19
	for <lists+linux-input@lfdr.de>; Fri, 29 Dec 2023 17:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E473A12B66;
	Fri, 29 Dec 2023 17:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgcjSvWY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8785E12B7C
	for <linux-input@vger.kernel.org>; Fri, 29 Dec 2023 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5534dcfdd61so12208792a12.0
        for <linux-input@vger.kernel.org>; Fri, 29 Dec 2023 09:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703872659; x=1704477459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MISp+xAj79mCRu32Ai0KUFgAejmDRVL7O0JwQoOXg9Q=;
        b=EgcjSvWYyhCFBlHW84yTgBzokaqfoeRtDSBd8p5+v6T54ATragWKbj+kel1U33/eaW
         MlZd6JpwsHBOIb3AHZm98ZEczaul5CZk5xn+w/MR/xRktkh0MIbDFzc1dzl071BOlYHs
         XtauOGQzuzkVGmCEwuoS+9Wjrx6lybnqQEhwJ+8J6GXzBn8TDiv6F/JqDabDfmkvH+uX
         tTDM61UneijNmxDO2sCrbATgOpGuyIPfVv7CLNZ0NzmWNPIteADrd/UYAKmyWzmgkazR
         8kmqqzGs7fBht/697AE9T3pLRvjX0LxUMZ5+kyyEHjveC+feQBO0VUfD7gZDlG0Ut/jW
         fTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703872659; x=1704477459;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MISp+xAj79mCRu32Ai0KUFgAejmDRVL7O0JwQoOXg9Q=;
        b=qn//FXqXv4Hl0+F0vPe+NmXG9Bn/n3QmYMKJlhuIatgm0paADMgqc59bTKJ2Avv3FL
         QN+PwXRzZlEFJbN5nRKhJatQoXeJrG85NixJ8/iyQsOJwMhIqgZ8dSgCzEmTo3/ZE571
         SS6UuQyenJdoc+VwSY7KcOZ9Tj5wGkpZMWvBAF0cfYPn9xd8DfqF/vetXXJTgqFm81zW
         9hXfgCgyCG/CU7Kns5+rkqt5iXZ26u2xzDzNxi/XBqkANMqKSWffgF1LfdRJ5LBtZGh1
         ZTxVu+OT2k+VVZP9cKsljv/JsoMShHs/rRagPHlSjmfSiHlZwYxH6vecQLxvjsdIo+5S
         imWg==
X-Gm-Message-State: AOJu0YzBKHz6v6yUu9y2O+RqalB6/wmxEFxWRJ9gvJ3OkyFEp7u+gkV7
	5qz9Kw+ykWo5phN9kXeqlRZuiu64mHg=
X-Google-Smtp-Source: AGHT+IGbcxZEzeIt+sEvXn/ADZTQZlBuStWszJz5ThWzieAvDSTyolsJmZSOda5qJVncfPlwpuakcQ==
X-Received: by 2002:a50:a6d7:0:b0:553:671f:5caf with SMTP id f23-20020a50a6d7000000b00553671f5cafmr12361089edc.16.1703872658985;
        Fri, 29 Dec 2023 09:57:38 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id cn13-20020a0564020cad00b00554b089f1dcsm7397226edb.38.2023.12.29.09.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 09:57:38 -0800 (PST)
Date: Fri, 29 Dec 2023 19:57:37 +0200
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: linux-input@vger.kernel.org
Cc: xiang.ye@intel.com, hdegoede@redhat.com
Subject: Fixing ISH hingle angle sensor invalid value
Message-ID: <20231229175737.edjdf6c5mfrsyyt5@jekhomev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

I have a device (Lenovo Yoga Book tablet) with a hinge angle sensor
exposed by Intel ISH. This virtual sensor should compute the hingle angle
based on the accelerometers data. It is supported by the
hid-sensor-custom-intel-hinge driver.

The sensor has three channels: angles of base and screen with respect to the
ground, and the hinge angle between them. The base and sceen angles are
reported right, but the hinge angle is always 360°.

What is the correct way to fix this? We can modify the driver and fixup
the hingle angle value in it, or add such quirk in a userspace apllication
like iio-sensor-proxy (this requires to have a blacklist of devices in
userspace apps). Should we try to correct the value of this sensor or
just blacklist it and re-implement the same functionality in userspace
based on accelerometers data?

When fixing this in the driver, we should decide how to distinguish
'fully open' and 'fully closed' states: we may need to check the lid
switch status for this.

-- 
Yauhen Kharuzhy

