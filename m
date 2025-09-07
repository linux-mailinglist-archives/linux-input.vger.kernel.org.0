Return-Path: <linux-input+bounces-14534-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F18B47AF7
	for <lists+linux-input@lfdr.de>; Sun,  7 Sep 2025 13:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF0113B6A85
	for <lists+linux-input@lfdr.de>; Sun,  7 Sep 2025 11:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB142264AA;
	Sun,  7 Sep 2025 11:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Veerg1xZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF5F18A6DB;
	Sun,  7 Sep 2025 11:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244664; cv=none; b=U5hFBbItqChDY8MAuvxX1a+H30wt8TJLBN8PGdwZ/6pcdlIh7s0cUOMPSbz0WdcbqV6tRNKsD8K2Rkr/VyJ7jokVqDIwcqGzF3dbQZNmTiOX3FQWFfumcYh32gI1gZJwA3tsDofurcmIgr0MyN6Jk8oD19Wz/ck0bGDPlgsbeIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244664; c=relaxed/simple;
	bh=dw0Qr4aMJN9mFdTBVmZDatZgEgVAsfxeUG/I+PDfr+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lsayN8JPdlUeqinKCRNFON8fr7CSTPKPm1WmtUoqjcLOUMPG3tKgeqFooraZLYpLDepPgZ5naedxJ9E34Uyslwk/xcXdXTNKtJJywYalUgNgy1MS3HO1FEFKZW4fezJwOyiofS65NqM6z/ATbx89DYqn67tG93DNEEDlkP5z/VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Veerg1xZ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7722f2f2aa4so4535721b3a.1;
        Sun, 07 Sep 2025 04:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757244662; x=1757849462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dw0Qr4aMJN9mFdTBVmZDatZgEgVAsfxeUG/I+PDfr+Q=;
        b=Veerg1xZfER2tUulabXscf7rNOkSxP+XM6LHtE64vYoWmdKXpVZazh94BB0eBy6xVY
         PNdjFbSPXCWAthBA3HEesQDE/QmEj1ub71wmvl1k0Yhf9EGG+BwOqNPP10NKRUASTHBf
         t/zxgjqOZwVBrY48GeZLh0R5ahugbuMSZVUSq7JRIJhf9EmftgbtZSsuHl96Y3ZwzEE9
         WDXyHbDLtOuNSyN1gCDeVr8dWKp3DmgnzbKxjbDDND1OGmCu2SGlxSeR/tZLE4F5YnCz
         pbekgU3Sgq4SbJZ/hZWtuC7eS+rSDhtwM4NGqMlWBjKI/WvmxGPU4RUE9wd3bugG7bws
         15fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244662; x=1757849462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dw0Qr4aMJN9mFdTBVmZDatZgEgVAsfxeUG/I+PDfr+Q=;
        b=DT6wsX7bzMMIFL3N11cvUE30ZXAb5E/v+t3LPVMNDJqUz79gv+ykbJtbIpO/lpSbgA
         YYc8eyT+0/cDeVE7tG3L+GLJNnlkxc71YgpWvUUNk4r3q/sr9VrYEaQz7LBgFA1QySQ2
         +8kjRzWEQUiISX6acAH/g9sRyqM3gcBkIGVBeeX3V2bfDBxKEl7ihgGjFq/eQJxncoSA
         jrMbDSKHu3q5h2k1ILImFVe+6lWD52LSRpkmvHHNWldk1Q2ShYPjA6cMjb9xyxFWaZhR
         jQ4oKcobUwmzWXLBVXPIEBuBLFyW5llRP4BwAU+dzLlSmxeRyLPGwxL4i5oupXJdsrMo
         +BeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgiVqUJqgv+clWiNEWzKFQhYmTXuK1KHqyt8uomD8CnHWaI0ITGCoXC5tXzo7Wbbz23FPgBpQxGtUoOA==@vger.kernel.org, AJvYcCX8NecOruAToXSv2yXSSnnWB3ZBH9D9EGxajC/qMIT6XtmGZdCREPX08xW4pJaciXlEoLzuikyjlGe40kl2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/LIgbuMAx14XtcCOBxDqoz9wBvJq2fbOWmhMjS6Dziw4IBLIz
	9fRSiHwPXWJ81QFd+n1IdQhcGU5IzBmlEPQ13YuLT9ykE3FRYLm4ZoVv
X-Gm-Gg: ASbGncuImqf8pz8DON1Kfe35TRjyywUyhtGze99xBm2rSxxnQV10ZoBp3edDUPce1ye
	iZKIyUJ6eUBmpC+cXZS7VKm19On92uHotQGK452DOxu1tb8npsgkFndJSGAAMIFCkUaxz+kOZAs
	oqrwgyED3D30Abjo7//G9j+mw3NJuy1LM/zIlVuGgbJv9+8bqqEof36WpbVH8IbBvgYRGHKCvJV
	olZpfBJJFilJfyGExfjAV6aIW41XbGwbNCfUEq0vEKMjEphroU9znHIxr2N5BDpNukrheSS91Nm
	94Y3L+bicvp02wYOl89AA5D1PfvRG98u0i5Nuxmqto2Rx4/t2eURSxZgb+6AI744xsV9/iLw8In
	6iLlnvmQu7XRYxvwfa/AHPPF3YwEQ
X-Google-Smtp-Source: AGHT+IF7jOtmOWwmGAJBJBc8w6e1L5vIwCiYmw7rHesLPPxK/cAl+gvHKAmjQARAwVUOMPUUfl4dyA==
X-Received: by 2002:a05:6a20:2586:b0:252:1cd4:2cd7 with SMTP id adf61e73a8af0-2534441faf4mr7222835637.29.1757244662525;
        Sun, 07 Sep 2025 04:31:02 -0700 (PDT)
Received: from danascape.. ([101.0.63.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4fa1f21415sm11284044a12.18.2025.09.07.04.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:31:02 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: danascape@gmail.com
Cc: bentiss@kernel.org,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND] HID: Xinmeng: Add driver for Xinmeng M71 Keyboard
Date: Sun,  7 Sep 2025 17:00:58 +0530
Message-Id: <20250907113058.22091-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250907111246.9733-1-danascape@gmail.com>
References: <20250907111246.9733-1-danascape@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Sorry but I just found a few changes to do in the driver,
I will update the driver and send a new patch. I have been using
this driver in my system for quite a while now, and am able to read
battery info.

Sincerely,
Saalim Quadri

