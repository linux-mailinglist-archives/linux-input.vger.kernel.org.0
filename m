Return-Path: <linux-input+bounces-8315-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 621429DC204
	for <lists+linux-input@lfdr.de>; Fri, 29 Nov 2024 11:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 289272822C9
	for <lists+linux-input@lfdr.de>; Fri, 29 Nov 2024 10:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0371217DFE3;
	Fri, 29 Nov 2024 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0XRLVeq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214EE156C72
	for <linux-input@vger.kernel.org>; Fri, 29 Nov 2024 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732875436; cv=none; b=uzSO9WQqYh5lZ9XSERBLQmRpSjAMAlKM/ijCl1MHUWYeDKdvQqZDIwTUGXq55GUPZEXmHj0fd9+8WEpHhHDBLRF6uGu4rQr95fFevWEioiuhUBCuepcZO8hOka08vru7+LFxTmoONALVm8KZUrJUFd3d+pNvGQKDVthLiab1CY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732875436; c=relaxed/simple;
	bh=M71k6fppN6xV463i5xMitlihv2EHMbPQd8qlsiqHBYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ue2RURSrg9PyvRMK7ULcpbLlfVvNBxOIHBKbfL22say6p05jrCZcne063MpkhwyHeIsxbDleH5IGdvOZRtcaA0A3JPYFAoE0o/w6qMy9STUYiBXy55qX0vIMYkxij5u9mGcSWSBYuKTAms3MPtHlr9DRS+0sQ2ZCQKFoBwPGQQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0XRLVeq; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53de852a287so1737326e87.2
        for <linux-input@vger.kernel.org>; Fri, 29 Nov 2024 02:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732875433; x=1733480233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M71k6fppN6xV463i5xMitlihv2EHMbPQd8qlsiqHBYg=;
        b=B0XRLVequSnqWRjkWtcLtPf1NdDFbNIWNT/55UQ/mER/7wt2cGSVQfpPGop3zCqyCy
         TMKxx7U7EUordvMkq8zPHiW3lUmGHc2qWOT/DVLOl/5SNQ+j4INfT/TPKSJIEn8zQitp
         azgcRHscyizQBPsXmqb9f8lHWGo2UKtUuJLwLOer5cn67PO+7oTS8pPiFhFs8TeCP1tk
         +vTmjphQbUuGJsml6P1LBDwpCFTwj4Nq0T8+P3di1jFYZRTUKmtGUnFAgHmimk8G9IdI
         HY0ptc45dQAFS8iff/KAHNqfJZYycuIpV7HMg7LSIcz75sckk4dDzceV100N0ewo/qio
         1znQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732875433; x=1733480233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M71k6fppN6xV463i5xMitlihv2EHMbPQd8qlsiqHBYg=;
        b=BoDeAU8kkUgqHKl8Y05E0dfSL0Yvd/MO9v1BoAFDksho+z5cKHIrJF72uFRY18otnW
         ItqknGmkgLuYE172crKpPETDrxaYYKgUNYucaMXwTMIKOKzMYpzSb2WpcIqyTOYkqIKM
         6RmJnmN5ydjOFHxuTgp/R3vb1mA62mITakcglN3PCXKGMcUpiGu/6/+ryN1tS8gk69Ps
         LfEYn+xCuFgaQ51O+V+QrJPg3ONNd84V+AzOuy8tVj/h09a5/Z/ogE4RaWjAALwbfWtE
         whIaFZSJAzdpW54gYMwmoMLFETxetTk1IIrODMPOhumW/Q61sT7cRn/eGffnOih+9sbL
         2VpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoFwu+JmZa7ocbP2mHLu7bYu2dkGw1EOrP+nxodBOP3n/s92RL+WFRgdDlp3zrtY6586p4q7jRV40tbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+zfImpwdXR4KJ41hxzuSdc3bm5kdtQHaACD9qrRmDgMOpTye
	9/Xfu7cZFvv5WuaFRrmCUfnzuj+Imzo+vP6uqAt2aOkvO1nrzhencXFPs6vw1bmPwG/1z7bAvLX
	eKhXFRTSxaCIMde4HZtbUQQuarPgwkkhbD8Cr2KPZfplACPTzwTw=
X-Gm-Gg: ASbGncupDX/5hs00EvU15BQ4/2yvw8mL10i14CLVqQnTBTQm8boGdEYyM69rckMt9sC
	qPHQCeQykdEf8wlckJM9RU7n//QniE4E=
X-Google-Smtp-Source: AGHT+IHsgFbzClrBYfEFLufjcHJSY9BVx1yMAHpzLueAWoM1d4Mtai5958T8vHB4BDFRgLnlbKD/8tkWebNyM9HrsEE=
X-Received: by 2002:a05:6512:3d88:b0:53d:ed6d:71cc with SMTP id
 2adb3069b0e04-53df00c645cmr3259605e87.8.1732875433264; Fri, 29 Nov 2024
 02:17:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126172240.6044-1-raag.jadav@intel.com>
In-Reply-To: <20241126172240.6044-1-raag.jadav@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Nov 2024 11:17:02 +0100
Message-ID: <CACRpkdZqdE8gQCre=zR2cN17oKfwBSnWuVwzQsbRO7-ENVnPNg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Introduce devm_kmemdup_array() helper
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, dmitry.torokhov@gmail.com, 
	broonie@kernel.org, pierre-louis.bossart@linux.dev, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 6:22=E2=80=AFPM Raag Jadav <raag.jadav@intel.com> w=
rote:

> This series introduces a more robust and cleaner devm_kmemdup_array()
> helper and uses it across drivers.

For the series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

It seems like Andy will push it to me which is excellent.

Yours,
Linus Walleij

