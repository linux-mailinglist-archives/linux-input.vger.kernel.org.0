Return-Path: <linux-input+bounces-16523-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CD8CB1F25
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 06:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEC603004C8C
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 05:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B84258EC3;
	Wed, 10 Dec 2025 05:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ev31/y3J"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F52219A89
	for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 05:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765343854; cv=none; b=KBd0vBC/ywyYwNcJ1AU8JcfOXX9R18ZZ9uzD11C8pu+cdAzZlPW67WB4C5lClsmrH7WjoVcEzv16Yo2eOg4kDfVJti11X9hxRVV+lS4/mAqtb0Wc0cHcVQsIvS1oYS6wWh9woCRibsWJSCYReeJllDt22v7Ay8j80GYZoGdn3eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765343854; c=relaxed/simple;
	bh=qExcs/8cNN5eagvc96t1kzVCjlrfymwy5INWit9g7qI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ktx69HEKTnrVwQ7SNqwSO5Aza2HbqtDfao/4i/hfDycrKvaJ4nOIRzahczJfbycSh9huTXdvQfdIJ0jnr4h0rCwVEezZnXmSsj+x6eYU1zYKCTZxvqbH2jrIucRG2JempUtiR3J6IYeyZf7omwNx0oBF6mLIssf7GFIrdWq3kjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ev31/y3J; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7ba55660769so5486944b3a.1
        for <linux-input@vger.kernel.org>; Tue, 09 Dec 2025 21:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765343851; x=1765948651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qExcs/8cNN5eagvc96t1kzVCjlrfymwy5INWit9g7qI=;
        b=Ev31/y3JtN0kTpRzSGzbY8HCzLfJjL3fuIHVLCFFnfp3BsRYMdF9CmRPoWf77h8yUS
         4tv1N6dGXxr0oKm17MNsOy5w1qq5rRY6dmwdBb11+TkjeXwQdGMEZITgkh71hMBf6+0S
         U4Uv/kI9Wnv3+EUDI5B+ESxcI7/ZG7N6bGORBFTB16q8N07enurlRMZmvZW+IYBakh5h
         98wOoXWjuCxt0NZnRNZSPblr+QaFGHZ74VqDVx+Q/VIFb6cC9q8XErmFkLosd2tfq92T
         G8VR23+Xa4N0EznkIgFiDrMwzpBuz2SapAJ3OqysiGFTmJf9WN49hIO0WclaFF0pPgco
         s4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765343851; x=1765948651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qExcs/8cNN5eagvc96t1kzVCjlrfymwy5INWit9g7qI=;
        b=KJJMGEBhLnItN6QghAJ5OvYPYzhoXPNk6xXqZh8QaI+NxV1Pb8C/GNsh3EZggT5HdM
         NtazgW8MvnJwzJfJNepupaEtH3I1QyyBWUKfBtv3Lyi83cIYkpI8F4su6u+IyuR6mzV0
         XKbXhDqhO0EWuOJPXW4bIhu5uUc0odF9SPkDy+LKH6x1FpeUlIC5q7zPA/kB6s1JTWXq
         R1HpI+K9DxqmAgzsyaFgitMtfGjzpbZunFxNScFZcj7lXT0x14HbpF3kvEfGycPs+SSK
         JHBuSpXzK48t/btf8Z26QI/lv87LYeq/BRrcqNro0z1Dq1RgOK3MuloRjVMJkzcSt/ck
         dX4w==
X-Gm-Message-State: AOJu0Yxy1tDhO40XVOwFKz7ANz4eJxvzJOBVqOg3CLLEPPaHjy08B2wi
	L2Begzik9Lkk1V/qZcD3c2MeYnV+zF23c61jA0XUuuwDYP/vuMiBOMWr
X-Gm-Gg: ASbGncstTFrcZE3eXS1Zsq4FeoQfUMwxVDUJL4wJNlWkoK+/lFggugwpKoaxLIZNM5m
	+6F6MjkgUf9D/T53HmRqBNotFp68bIZipBlMKTN1NMMtfBSMNhndzaKTw2CkrF0eu1TXCJJuoAg
	icAJL17/HPS+qQ/l3oWjI272sAd0cmIqqX3csy4+uaJSPFeY8KGLLtUD8plMgx1aau0c8mkblqB
	Y6g/t2Ytux/LDAiFMxOEECKSyc15mjwlje3Ef/znkQccrg8gainS9UxiryN5T1S+OmVFDXnpU55
	syh+pYSljNvF1iCXHikWrNO8Z575iqrQ8DQYYLciwv1pIWoZJ4B14lJOvBIpKCx5KQjqd2xUR5o
	XSeM1ZGsetugG9tZDwfslUuBv5HiEOkmunWFQsztCgWajpPxEJxwxWbCPwdSta7u/h24HLRBICA
	4TvE6Lfc9dbUaOzeJnj1PlvgkWhcN9nmSQE9v+HdMq
X-Google-Smtp-Source: AGHT+IE7dAyrhHFXDV0DqTye5pV+Kje0+qShbKFX11hx5UetNm9KCsnU9gUS/FqIteY29lCKfQuyRQ==
X-Received: by 2002:a05:6a21:328a:b0:366:19a5:e122 with SMTP id adf61e73a8af0-366e1006f05mr1239285637.2.1765343850958;
        Tue, 09 Dec 2025 21:17:30 -0800 (PST)
Received: from localhost.localdomain ([121.190.139.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f046sm172108995ad.61.2025.12.09.21.17.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Dec 2025 21:17:30 -0800 (PST)
From: Minseong Kim <ii4gsp@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	stable@vger.kernel.org,
	Minseong Kim <ii4gsp@gmail.com>
Subject: Re: [PATCH] input: synaptics_i2c - cancel delayed work before freeing device
Date: Wed, 10 Dec 2025 14:17:24 +0900
Message-Id: <20251210051724.13564-1-ii4gsp@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <xeski4dr32zbxvupofis5azlq2s6fwtnuya7f3kjfz5t7c2wnq@jbvlajechlrd>
References: <20251210032027.11700-1-ii4gsp@gmail.com> <xeski4dr32zbxvupofis5azlq2s6fwtnuya7f3kjfz5t7c2wnq@jbvlajechlrd>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dmitry,

Thanks for the review.

Understood that cancel_delayed_work_sync() is already called from the
close() handler, and that resume() can restart polling regardless of
open state. If we keep this driver, I can send a v2 that adds an open-state
guard in resume().

However, if this driver is no longer used and Mike confirms there are no
remaining users, I have no objections to removing it instead.

Thanks,
Minseong

