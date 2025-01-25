Return-Path: <linux-input+bounces-9509-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6964FA1C05D
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 03:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4AA1167373
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 02:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40EE31F4294;
	Sat, 25 Jan 2025 01:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtVy5irj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10C91E480
	for <linux-input@vger.kernel.org>; Sat, 25 Jan 2025 01:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737770399; cv=none; b=mp50/sEd61zHfyMW5sReztiT5HafZHcV8dz1pQGPrUrBeqoK4X7GTVVHdRnBkihJAV00WSR1rPUICAuskHnq0yNL4Zlh5ifYFpEjOld2+YfHECGGgKDxNIYM/j5df10EYKIV5H+N8jGcTc82jV4gSDya5k1dMxta7PbfbFiOl70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737770399; c=relaxed/simple;
	bh=28Wea1r+Al5v9GphezuHvzjgZUin7smYx83CmLAU33Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cp4FXdlr34DTk6vMabiKNIywwrr5zsBPIs7yKh5+1eMnAE7WfTuk7H15C+2pnD8+VdwcI+0UgjX2rEFYv3wPWibDvJUU2j3/mXZ0E1+nTDED6ztJwWxReFspme/6gWVbLKVdb16b8L13evwLK3u/8w+i3T1Wimhqz+Q2RlcPxtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtVy5irj; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f45526dea0so599735a91.1
        for <linux-input@vger.kernel.org>; Fri, 24 Jan 2025 17:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737770397; x=1738375197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RA0I72eN1MkqXLSoAgMfYt/rG9n7DvBMT13mFde0Utc=;
        b=AtVy5irjih/dOuAc/26T916z/DRRJsJ1h1xuzckKShgFwYuLMll4Of+gXstf1GOIao
         8kIz0qNtwA18XWn8ScXqDxk8SNWeDvu+1tf5zDtc7C6DW7StYSXSu5/omf+dtn19wlp1
         FH2s3Pjo3qlD1yGkuRwLoxPal5NFfXKMBlkODTqMRigLBLd1Qt6OYtw6LKpn9l+VTMte
         KkyPmsPmnhk6OCzXpvNkXLuGi5W5YoKbb9FiHw5W49wFR7p1M8kbEcImmqaJWGtm/qI/
         IkzrWOe1NVejXYlX5j0QTXk0Ny0bDw5LnppxmQT1rI/BoXxZcDshlpO6UVHUqauDFQtr
         x0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737770397; x=1738375197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RA0I72eN1MkqXLSoAgMfYt/rG9n7DvBMT13mFde0Utc=;
        b=fGbRdtdXeR8g1x8i5EqVEkMwYEskL24rbAiykLRvbXpiGSuTXgpSnRIcdkvl0bO4lg
         BzfSiHbYZRtYKKFDi+z1aydshfeHCNUG6RjY+KNvoQOTARP7lQ6HEybHySupKwd5UgRe
         gJJqVRCbkLbFaT2T5MmLLs/V8JltdJ1JBQb1SXbL8NRFdCAV41vhp4ZjC9u0iq2R4sCm
         4bTHppSTYO9IiLCmb9Dzds4e8kHxbJ8VTdHwo+GjYjDmILBU0ap1g9rd5rMp6PfnivVp
         tWgghaykN72CIvcRkE01Zz6vt/g2p3lf8dv/mWh/w5tZK3hVlmd0y143aO1ImwUl6UDk
         1Niw==
X-Gm-Message-State: AOJu0YwoofC1oceX7sa/L+dTxV/blzUq6u2OPzTnYF+CQKKGybMgA+vI
	AO+fu5/bZNiBo66K5Zp+sPtZqyckrl2FIsC5Y5JGOhyuIKS7TzuaEN9N0+bQ
X-Gm-Gg: ASbGncv7QKN2byC2nPzqeOaQFPGby5UXwfWDImNYaZCTUeueuGIHlk88EaC68CtSafO
	o88iF4pznIMsWVyqfobXYPVKaIjQV3lYdlcSVkXtNMa+iaP04RoqaNCBqXqq80Obkfrjiv/WnUw
	BeFCqI2G6sNFgIM4But0JYe79qSe1S5cuV09gOQx98tRGDFet+6DdU6f1r6+m2w1YtSJ/K1knY9
	7kSM8gmWLIL9uK2M9zNYX7h4whW8+5kfMh/7Zau+kMkNlpke0LsTfikLS3TYRShd0S7N8ylBFxH
	B5JMGuTuIQ==
X-Google-Smtp-Source: AGHT+IHRgd68RijQPsD9X8t33+HGQ/nAO7v/kz9vrbfrH2Eh7k1BvwRw0k9nuhDBQ2ePga1VeOJ6WA==
X-Received: by 2002:a05:6a00:a25:b0:72d:356f:8321 with SMTP id d2e1a72fcca58-72dafbf13c9mr16009372b3a.5.1737770396868;
        Fri, 24 Jan 2025 17:59:56 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:bba6:4b7d::1f4b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6d2ca5sm2629342b3a.81.2025.01.24.17.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 17:59:56 -0800 (PST)
From: Nilton Perim Neto <niltonperimneto@gmail.com>
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Nilton Perim Neto <niltonperimneto@gmail.com>
Subject: [PATCH 0/2 v2] Input- xpad - Three devices added to the xpad
Date: Fri, 24 Jan 2025 22:57:32 -0300
Message-ID: <20250125015857.33002-2-niltonperimneto@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added some devices do the xpad table
Changed some to VIDs to better describe them

It was resent because of the following request:
https://lore.kernel.org/linux-input/2025012328-audience-tucking-405d@gregkh/T/#t

Hoping now it is fine,

Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>
---
 drivers/input/joystick/xpad.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.48.1



