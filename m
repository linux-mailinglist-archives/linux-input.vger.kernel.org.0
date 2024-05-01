Return-Path: <linux-input+bounces-3360-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7B08B922D
	for <lists+linux-input@lfdr.de>; Thu,  2 May 2024 01:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EFC11F22177
	for <lists+linux-input@lfdr.de>; Wed,  1 May 2024 23:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDC617C6B;
	Wed,  1 May 2024 23:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuTqAG9Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59EF168AE6
	for <linux-input@vger.kernel.org>; Wed,  1 May 2024 23:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714605572; cv=none; b=V22n98e2BGF1dyf6GEI76R/ttCdj3elXWK17Uflz41BoYCdEl+owx0BDob2cpqNNtjKHbcnL5OvnHD+2amwkbVrw8Sf3WRPwUv9hWN6WKKUqamzK0Xvx/Fl60xLtkpo4FFCNujnNgzzYFLR5xeLX7FvHZWSIUfKFXe3WMsz3BOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714605572; c=relaxed/simple;
	bh=nBY9S8c8QdfWD8g/CYSLZDWEaFAYcFdxxsLO0qvfL7g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dnZ+6j2uDz44ZpCpUuTdEk2W1JGxHg29lDQtdXh344crwF36/godJ2ojcaSQsI6nZu3aj5oQjyApkIVHFsUDX05SGAapKFoHKqK6tkNawZ9Sc6XOOSahsVDMuZttReMRg3zyk3BSUos7425ADjCBaIncEBgFgG++/APf0r0dTpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuTqAG9Z; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-43969307359so45948921cf.2
        for <linux-input@vger.kernel.org>; Wed, 01 May 2024 16:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714605569; x=1715210369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Faj6mBwkcM8+iwPfWFp7MzzCyHrRTO4Sz/v8daJosHI=;
        b=LuTqAG9ZrIap8BPudlRxp8nPiYDp6w8LvVhO04S2BNDjEXnzzfHbIvzGV2MRmTOOfK
         fV71HVpEavnAjD03VHJky6O00jD09jXktfY0dst4co+fGt3lbP7uhNZMkr6bGjrPIGIE
         8hIV8GrEWmKVe8hZBb6eaWdcdPin7Ci5WrSzDSCWvPKHpxw87uJeGLCFHj1eH0zXk2um
         F7a/69A66PXQh3oiqyzBVV9XMQM9gyvgFP8yRl2buw7gTnlkfbVyXFVQ/FoUA4wzhAPV
         T/ncTsQt8aSgxxzCxApAPBb3tw04reg/UwvdH7tgIc7UXBTAETu77sCNOLNj4vk86/bK
         FCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714605569; x=1715210369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Faj6mBwkcM8+iwPfWFp7MzzCyHrRTO4Sz/v8daJosHI=;
        b=dvK9XKt6F3Hj5Y5+s5Xl1/02Ec/WefVdvtWqflik6a1rDAOT1GGnRj2gUTfGb4aX0V
         F0QFUbavygr9ZkQQN5VKZWqTSkN0W0Jf1c8u9veOQyNbJYiFvCuNG0dXMGe8IzAJbksv
         mwxQmV1Qcz/vk+liYNGy7ae98+RD7FMv7erNK+tB847cQJMgR6uTfL7jxxGyV2IG+inf
         6BdoolvS6J+KcnY512K7KZVqp4gNLL0eeYge65rYa0hkE4VtKdxPc7W8XUt3BkMuEcrg
         r8Tjkih2etdPVMOROWjXI5mGD2I9ueCnQ+IllasrlKdceAOlEEdUECoL6MdqJGH5/+0z
         SAng==
X-Gm-Message-State: AOJu0YzW8hGFF2GSYwQCJqV1pWMN+XZP1KEgcy69oK+idpY11YqpA3RG
	alKYme1/scHrhVroJXAsjKmfN71JEkBu+Cmt8h+9juWpaTHyg00AR8E2gg==
X-Google-Smtp-Source: AGHT+IF1iseABXKfnkfMZwW0zIJbCanlyZxTiZwmxhewhhctxVSRKHLtF+YE3GrBJozi8Sx6ECCVWg==
X-Received: by 2002:a05:622a:56:b0:43a:dedc:2f27 with SMTP id y22-20020a05622a005600b0043adedc2f27mr4730437qtw.47.1714605569003;
        Wed, 01 May 2024 16:19:29 -0700 (PDT)
Received: from mythra.localnet ([2603:6010:d800:cbd::b76])
        by smtp.gmail.com with ESMTPSA id h2-20020ac85682000000b004365ab2894asm12770503qta.51.2024.05.01.16.19.28
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 16:19:28 -0700 (PDT)
From: Carson <crange76@gmail.com>
To: linux-input@vger.kernel.org
Subject: gamecube wiiu adapter device driver
Date: Wed, 01 May 2024 19:19:27 -0400
Message-ID: <2513000.XAFRqVoOGU@mythra>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi everyone! A friend suggested to me to try playing a game with a gamecube 
controller and I had the hardware so I plugged it in and for the first time 
ever it didn't just work. I found this program 

> https://github.com/ToadKing/wii-u-gc-adapter

which works but I felt like this should be moved into the kernel where it can 
be maintained aswell. I feel like most the hard work has been done I just 
wanted to reach out before I do any of it. Encase someone just merged it or is 
already working on it.



