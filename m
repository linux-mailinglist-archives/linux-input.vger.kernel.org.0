Return-Path: <linux-input+bounces-4898-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2F292A043
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 12:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECC391C20AF2
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 10:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B2257CB1;
	Mon,  8 Jul 2024 10:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oy1kWw/r"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B653523774
	for <linux-input@vger.kernel.org>; Mon,  8 Jul 2024 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720434752; cv=none; b=M4FvziLbA6pJFUSlqTcRXnHGMWr1JSuvaa1VU6PC/hQGFEcADOiFy4dgqxaNri08UrvG1uUgmRFGF4cZDjxt3bZm2lhJNZQga82nSkW6XarT+uzBdSNw3cYKOA9P1yLMn2XMrPBRWFqqXLXxf/ZQcj8z5R/TZgHHk8nlYFgdLDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720434752; c=relaxed/simple;
	bh=opIlE6v9a/IYC0ghgLUW3d2u49fTE0rfwtlwY52RLSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qd7zhCPNW/eAbSNARK1RJlvuJYAbQ2yOe58mELcQ2T5aiallZuCRcXu6nzjMtwnT7Bm6CyEadTJ5rkq2KdGHlmFObPRyg9mVnrb3l+cmwj2LvXwgHDwxUpdJy84Fjm2C+LFijAfrFyWZCvcbMJvym3HmMR85DNEf4WUsJz5si8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oy1kWw/r; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-58c947a6692so4690537a12.0
        for <linux-input@vger.kernel.org>; Mon, 08 Jul 2024 03:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720434749; x=1721039549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opIlE6v9a/IYC0ghgLUW3d2u49fTE0rfwtlwY52RLSY=;
        b=Oy1kWw/rfAhnt4BiXqcubpkeOfG378YP424FK1P3u38F7TIqAzqfkv8f+wd+uLkarZ
         71yPmGbFqDu0zr0DE7y6QApp7jxwiRH/mE+TRf3PEH8s1AOAAsnTYhXPjYeO6RqJuL6S
         ShAj5uV/Y8nLhIro9GwhnmZJyY+4D1tOXypiwwQlRW/AWR1nrw3Dp7kEm6hFodd/HxbH
         B6vgjbifXBh14ND1iRq/IBemd6aZ6P3ubjekCxAvgCVqTd1OWxjMBPh56AHDyc40xF9L
         wOPI1IidTxqunIr9r6CxMowL7WDBuovbpX2MI1HxVjqoRE3AZCc+mfVWNalrnISWsisY
         JQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720434749; x=1721039549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opIlE6v9a/IYC0ghgLUW3d2u49fTE0rfwtlwY52RLSY=;
        b=krAkn0u1N84aIlppXlBFcCDNmUL0VpD/Tq+tt2uiRUuOxQuygCFK9Yc54vXRKZBPpj
         sg8t6rvpFY27bqhR7FydC16HonHf8v6GIlft2HAJ5KGavmGAZ6V90mZ9le20vAJ70Kmj
         ovbojTJ97jwB89OqNXbTJjH0jpEY4HeMTVH/gw0UskgMoVzoCCXPgwXU7dcaHWIWhrfZ
         clQxpKESGYlQ7/5tMqqCqjrL7s2yTRymhUfIImwWMdY96U/YLIkC/3xoZ0Mv4cxe3xr7
         m3j8G5hB5V9Xn1PJdPj9b5NzPPJOP8BvsEm4FuUOVpq1vAZ06o2DwBVYld0MVIM5dKnw
         y16w==
X-Forwarded-Encrypted: i=1; AJvYcCUTpB+yJQUl+vVw4lT7PlxdlmbbqFB5vdChbtU97azOEkkRXwD9ntOS7O7gRUFUKtoy86wzS6hq4M2EPEUdlse/PBii/e3t/7VRyLU=
X-Gm-Message-State: AOJu0YxojDRQwNo+j6K6EGi5QlbsL8gTl2HTj3CQg24V1XdK2y9qcf7c
	kT+keetUjxhTrw3JJU5xljn7Xd5YLJTiv/f1NaTZgxrEGALWmg5N
X-Google-Smtp-Source: AGHT+IFDpcOj3oRU9Y+Cf4X/3BTgc9VSFTPYCnOSf530qjDoLnL8nLQQ29uQHpPH8hRLpqogxMxT8g==
X-Received: by 2002:a17:906:dc8:b0:a72:44fe:4c4c with SMTP id a640c23a62f3a-a77ba70bedcmr795584066b.47.1720434748984;
        Mon, 08 Jul 2024 03:32:28 -0700 (PDT)
Received: from laptok.lan (89-64-31-171.dynamic.chello.pl. [89.64.31.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77df94db65sm230324066b.140.2024.07.08.03.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 03:32:28 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: bentiss@kernel.org,
	benjamin.tissoires@redhat.com,
	jikos@jikos.cz,
	linux-input@vger.kernel.org,
	michal@nozomi.space,
	tomasz.pakula.oficjalny@gmail.com
Subject: Re: [PATCH] Input: increase max button number to 0x3ff
Date: Mon,  8 Jul 2024 12:32:16 +0200
Message-ID: <20240708103225.542802-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <ww7ozt6alknc763c34gnvi22zmqsm6uzjkkcmhvvjx4ejx5g5b@6t7za6f5iwiw>
References: <ww7ozt6alknc763c34gnvi22zmqsm6uzjkkcmhvvjx4ejx5g5b@6t7za6f5iwiw>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I tested this on my two machines and everythig worked perfectly. evtest
was able to detect all the buttons advertised by the wheelbase. I couldn't
test it in games running through proton as SDL has to be recompiled with
this patch applied and updated (SDL relies on this constant)

If this is a pressing matter, I could resubmit this patch but with the value
increased to 0x333 instead of 0x3ff to cut down on teh mentioned array sizing.
0x333 wuld still include support for 128 buttons. 0x3ff would be more
future-proof, but we can always adjust this value later.

