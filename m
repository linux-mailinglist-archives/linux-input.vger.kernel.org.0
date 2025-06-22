Return-Path: <linux-input+bounces-12990-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D77AAE2F8E
	for <lists+linux-input@lfdr.de>; Sun, 22 Jun 2025 13:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3CE1892328
	for <lists+linux-input@lfdr.de>; Sun, 22 Jun 2025 11:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6A21A8401;
	Sun, 22 Jun 2025 11:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUeTKK1w"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5398F6C;
	Sun, 22 Jun 2025 11:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750591969; cv=none; b=awOoK5vU8yua6PR+evA9mwe++Io43YBSg9S6kuAci9kH66+q5C7szLv2pvVhtkjFTLUuxsU5+nXThWpTGrFzS9LjTPyNR6cIYWrqmfYxgVL6XeftbWcUJwrZpP+6uFBVa6WBd8GTkxuNZnGpk8O8P5y8zXN/bK7rTH1J0NlG8qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750591969; c=relaxed/simple;
	bh=IJiv3hE1wDMzwaAq3JfeL4/9M01bCH9YX87/pK7mNnU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bjl2skvNwiSzca/JEWg6IGLJtf/ZgvCjeH14ehBN23wtKmjqiNRIeNi4g8Uguuo3boJ+QjSJXuReJzgMRO2h5dqA/Pu2umWysicC+1drahFqsqq0WjwjBlFO7Jd37+nQyuyrL5A48DH066h0nKNGE/UQgt3kgKSNSgvUu0Np0kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUeTKK1w; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-236470b2dceso33607135ad.0;
        Sun, 22 Jun 2025 04:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750591967; x=1751196767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JxlHCW5J5W//sSxxNrD+r8cZizDDAra8GMTsBk/cjyY=;
        b=OUeTKK1wYEPKsGN2aZdbxJQXtXXYZfGkw75d4Xr8EFRBf/zae5kuRYQn9hW1rUVvXD
         rLHuyUssm4xLblOf00/5NNRhgcTxfyTfNG2W1YkccXuslor1H8tqwBB/gZto5T49kFbm
         Hf0pjnets7FVrLXODCLW3tJz2KTKouVFdkr9JaRU+EgDvgLK0jwJoIYBWhBLXBJyAWSC
         nmvdF0avuMe9ivzgITkmhEIu2KPxXSYsBPY8yHgBw1NTJ4MEPkTU30+nIYPrgpIvsQ48
         WSNTelrGKq4GzTG4RlZgfcWsLuOlgtp/eUqDY3WidrZY8PPRh1f39Z29KXU6dpx50lWP
         6Ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750591967; x=1751196767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxlHCW5J5W//sSxxNrD+r8cZizDDAra8GMTsBk/cjyY=;
        b=qyw+u+9fQsunrD6pgsAUDmgVLamJ4q5Jgpl41YXpHuwapoxy2b3gAGzhqXh3jwHTw/
         kPKRgOhLP7O++P+xIX87GFbQwGlk796qsZO/Rs65o90UcQi1fmHpI991fj5RYhDhHX6X
         fPUWpdD0qQfW8xSYf+nKzzVkr9WUnsHAKlHOWibkcaaUrKumpRaVYy4QixCIfA/nzURG
         Q9A5r0WLxcuQkR7WpzEQO6CNW4jW0Wm/nWyEqGfnlXLnzNkpjAR/0Ecyxgk6L9LD2Syx
         N5ONZb70rOJrYYDClCwOGrjLx9YyMJUzuryC8i5kpIaA6v10HLsx4jJvk02dWtmTGFz1
         ZlKw==
X-Forwarded-Encrypted: i=1; AJvYcCVXbNTqvAulW5NADsgbOyXrk3zfSvUBTZaqGtLSu2jEtBes0cL3SmelYvf/jhVCf+wTffaTJbllqj/VWTzD@vger.kernel.org, AJvYcCVxF0MD1wwpXkVJx7IJHjmV+ZP7msZfKxVHWAw4fc2K1Nga8W+p2anQFReEyc2VsEMndjR8RWOWh+ICzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrhqeGRuUdSUK1jZQs+2S0p50F6wyFH0DojMdK++4QtSgYGcvc
	5LSh5cOPGKndgJPIbYpPjoCDvweF7l61wG+2n8eOm3oXFSSo5Rp+YNvi
X-Gm-Gg: ASbGncvNreVfmzKubmU8UTBgXsCQbg9yv8MKLKhGAZg2FsW95+hJfjfb+v+FCBGqoPT
	NUZFyw3CdVrPgX5Mmtiv+N8KcvLtEm2qImmVnxS4X290XeGLPpt60aRyg1shOKuaMxu0anD1Dlp
	TL8oung1N5uMjS7EW0jbOdAbJennZrhOxbxCL52OhD7xFdQfLwQbz66FYMsn9z+Gy3IV6BDZNhv
	gSXaGzeLkJbY/Hyk1wvaZU2oQD1g9EZ4/cH5dT4AwJJhCMKC+FTy8TdykSjqsgF/roiK+cPiS8L
	jwKIB9eTw7q8cqR0MSm6Yifr1W1mYxYHZ49RjXpMLjMreN/Av0IUHR9gNFAgulKyMnAC6HF5flg
	Wf06aPyE8dg==
X-Google-Smtp-Source: AGHT+IHHFbj/kq9EPq21LTyPgUqm27w+L1j9eV2b86yHj5xiuvp6tZ/8OE0FT2bcCqrou9weIAS9jg==
X-Received: by 2002:a17:902:f68b:b0:236:6f5f:cab4 with SMTP id d9443c01a7336-237d9875dffmr152612645ad.5.1750591967141;
        Sun, 22 Jun 2025 04:32:47 -0700 (PDT)
Received: from danascape.tail34aafc.ts.net ([2402:e280:218d:2e5:cdf6:1ef3:8163:b6ad])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83c0b61sm59506555ad.54.2025.06.22.04.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 04:32:46 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: lains@riseup.net
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	gregkh@linuxfoundation.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] Writing a Driver for Xinmeng M71 Keyboard (Battery Status Support)
Date: Sun, 22 Jun 2025 17:02:42 +0530
Message-Id: <20250622113242.183562-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

I'm currently working with a Xinmeng M71 wireless keyboard, which is recognized by the kernel as a hid-generic device and functions well.

I'd like to extend its support in Linux by writing a driver that can expose its battery status to userspace,
I used hidtools to record descriptors of the keyboards, I discharged my keyboard over the week and charged it and recorded the responses from it,
like when it started charging/discharging, I saw hex values change reporting me the percentage of the charge

E: 000002.772731 20 13 0a 01 00 04 05 63 01 00 00 00 00 00 00 00 00 00 00 00 8b
# ReportID: 19 /Array ['0a', '01', '0xff020002', '04', '05', '63', '11', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '9b'] 
E: 000005.642942 20 13 0a 01 00 04 05 63 11 00 00 00 00 00 00 00 00 00 00 00 9b
# ReportID: 19 /Array ['0a', '01', '0xff020002', '04', '05', '64', '11', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '0xff020002', '9c'] 
E: 000005.860767 20 13 0a 01 00 04 05 64 11 00 00 00 00 00 00 00 00 00 00 00 9c

I would appreciate guidance on, how can I continue this, I am familiar with Linux Kernel and writing drivers, but would like to ask some pointers regarding the same.
I saw a reference that logitech HID driver uses it, but it looked quite complex to me.

I'm comfortable writing kernel C code but relatively new to the HID subsystem. Any documentation pointers, example patches, or suggestions to get started would be highly appreciated.

Looking forward to your responses.

Thank you very much,

Sincerely,
Saalim Quadri

