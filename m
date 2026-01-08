Return-Path: <linux-input+bounces-16864-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BE0D03CD0
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 16:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30C89302D373
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 15:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCB435F8B8;
	Thu,  8 Jan 2026 07:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tzrpe7o/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114C135F8A1
	for <linux-input@vger.kernel.org>; Thu,  8 Jan 2026 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767858086; cv=none; b=R1ZyUonQmU2VIH0dycrvMP7xwLvCxsu76AhlfZWOkQtnB+8tr9bofqchno0dnv2I5w2cXSsriZ457WM8rPF4XQNwAls/W/1lal9aLL6QzyQyqrUAhozJ38rPi+woqQsN2u5skvJYsBce5UBCfyIZ+d/xrhbj5E+gUcjSLzKrtJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767858086; c=relaxed/simple;
	bh=602DVnXltjfj0RQiqmrSqXSWmhDvZ7fAH8Z9Ua5Es9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Otsvx37PWIrCzuei3BRM5W+3smsQehPMbIreQix8AF6WFEArXLPLchQWuZPfnl9ah2qkeyS3YJ4SrsKRGDv8BRhgAR96vHRprBVHTN/LGrpt8OQWDP8PXWenC/d3/Thh3kHIXPgFX53molcn6mwaKkcztWFbgBhXJnc1HcOxXrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tzrpe7o/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477632d9326so17646065e9.1
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 23:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767858081; x=1768462881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=602DVnXltjfj0RQiqmrSqXSWmhDvZ7fAH8Z9Ua5Es9I=;
        b=Tzrpe7o/xgU410bbpgkzHXEjtRNct4eQr+UhnletcIsJbRD04qfPBqG86sDzqTPiKa
         Yq4cxulQ2toxEQDQpud9+ssnYFwWkmr3jphA3e5ZOrcc0/9TkVSqnf7J7UEE0q+4y4Nc
         y8KflnZWptyzwlMoYeeHGxwAIC0SThXLvL0NR9SeKGCvzkUWX7yq3sIhEjjaue453S65
         1mTIOScm89hjTAPG9Ymgva2IF3V0Oix+P6pwjaptkqRkKeb/eBWCjmcsQCbmcKRdjR4j
         zdP2tjLRHtZtyn84VfhCF+zqVDb99ozTVIpjsSTrcZA/1nClUmD0/sn32u4yZnmGuceC
         D4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767858081; x=1768462881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=602DVnXltjfj0RQiqmrSqXSWmhDvZ7fAH8Z9Ua5Es9I=;
        b=Z2XenU1+3/v8xhJBhYuCPH+mRyWlgor4sU1Ms2BPqpZlvRjQnC3kXYpM4iv1ysxbuG
         UiZFBpbgpCsN3Xq7PCMQMnBVsN941BPWVEiXRYPeyzsvDKO3qd6dwRh4YA5fQpju4dPH
         CWr02FLp/j6CIvU3+GS3EgOdDvWtew2h3BT27l9ppzasYMZOiHo98ZQz4+K5LpeghX+q
         JNq5KKYEjBNIGZxLJzgdlrmO5dqnhNAqIMCpboJbZ2jRFZjjDI1oXakyC814oTw/oudC
         cJMWwC2Rj1y9+Hs9DIxPPim27UaQ+8+poaS0KbrtDT/ElUR8tLta0/EpqPyHHzoDLDvC
         QY9A==
X-Forwarded-Encrypted: i=1; AJvYcCWX7fCH7a8L92J54Pp8T8KETbVy4vuQAf3EGP2BQt1Q0755mKxtDam6kHCNxkT6X/FEqcjFibJSthGJEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymmQTrPyU7EgFpsc9CnwPB9letaOJZQo/HoXDVlqL2NeUUUzZb
	no7+BB/VQVm3DzfJ6XyJwz+PuM8M2aOzdMF3JJwMPF7O/x646GsctmiR
X-Gm-Gg: AY/fxX6vVU4zLcyL5zgjR9uRHdRixWsmmEXCaz6+u/OB5DKHFBuJexilSEdENqpPBZi
	SmN1l39qskhR14gnTxwgiEpmD9C7eejB+8F8bdF6J5HuycvCKHtBjlO7AMioc0eb82nTAMRcY1z
	QM9+vU2qf3ivK6K9sz+ZKUYKsMOvYnQvSaSbBa03ZQTh/TiyqipxlTb4ou3Mmmkln/DmE49RqFU
	3wbWWQAFHzdzKg9M/8k1T2rf69AfbVmZ/RRUHSDg0exu37wCAMC0E57etuqi4LtYRUoB2ZO53kK
	XvsbERXSz3HwfGF3OUcRAyWjlZgerhPy9ZrYzTcu9RfAPYMPdvNcVG7mS8hbCaa1Hr3Q6/sBlaM
	CGzQvmqeIVtiG/taV5lwhqUL+K0W0DmzyWO18wjyQ3aksiYzqP3RewOcTpk8SBHIbQhKkLeW2vb
	LUEODLN03y9M4tCsb9MflemBd3e3C7hFUoWglLJ70=
X-Google-Smtp-Source: AGHT+IHOH5fvz0+E8Pfd7Mds6szW9WagTEqn6jKzvLpWeQidjE4PZmeME8JlbRA7Klbdz39QUy1Rqg==
X-Received: by 2002:a05:600c:4f93:b0:477:b642:9dc6 with SMTP id 5b1f17b1804b1-47d84b403f7mr54668165e9.34.1767858081178;
        Wed, 07 Jan 2026 23:41:21 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:c30a:7d00:181d:3ce7:dc15:2476])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8718c610sm30572295e9.15.2026.01.07.23.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 23:41:20 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: benato.denis96@gmail.com,
	ionut_n2001@yahoo.com,
	Ionut Nechita <sunlightlinux@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	superm1@kernel.org
Subject: Re: [PATCH v5 0/4] HID: asus: Add Fn+F5 fan control key support for ROG laptops
Date: Thu,  8 Jan 2026 09:40:26 +0200
Message-ID: <20260108074025.5799-2-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107154219.164514-2-sunlightlinux@gmail.com>
References: <20260107154219.164514-2-sunlightlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

I hope this email finds you well. I wanted to follow up on my v5 patch
series for Fn+F5 fan control key support on Asus ROG laptops, which I
submitted on January 7th.

The series has received Reviewed-by tags from both Mario Limonciello
(AMD) and Denis Benato, and I've addressed all the feedback from
previous versions, including the removal of IS_REACHABLE guards as
suggested by Mario.

I wanted to check if there are any additional changes or improvements
you'd like me to make before this series can be considered for merging
into mainline. I'm happy to address any further feedback.

Also, if you could let me know what the next steps are in the process,
I would appreciate it.

Thank you for your time and guidance.

Best regards,
Ionut

