Return-Path: <linux-input+bounces-4622-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B964917128
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 21:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F5801F23C28
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 19:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB6D17995B;
	Tue, 25 Jun 2024 19:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmcvwmUn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22231870;
	Tue, 25 Jun 2024 19:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719344243; cv=none; b=pPIEhULhmg0rPrfCLHjwQsGnp/eq9eUPVaGWahiVHQicqLNX7aC+7CNZ9tg8IV9Nk+iMPLi5wmEVViEhzXXpqLlk56D2mwjVoBwiAOgW4bNxXdy5CiUd4/X83DLs2Mylsuaq78nG6bKfgwkRnHjLn5TECFQhi4XvXlUaVj5MmUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719344243; c=relaxed/simple;
	bh=xyVb4qrcCw86v65yoBR8M9Bn51y9iq92v+MMh2VhOnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bly5ma+i+EIB792j3PlArrClgFHym3xUr1HaKcMCYPsvHZpYqQox16AWcRIZQDgO9DtkZ6p+xfRX+o152Rc6Cf7SvbNrwP3EfcZJeyfOAgTfSyO55UUDKAMlHDsVlpx6/fz9nDhvL8V6kfwk3Vms+wELK96U6D8FgYVQN0QQE6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmcvwmUn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-424ad991c1cso963435e9.1;
        Tue, 25 Jun 2024 12:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719344240; x=1719949040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyVb4qrcCw86v65yoBR8M9Bn51y9iq92v+MMh2VhOnY=;
        b=QmcvwmUnDC+Pi6bwCSlagR3Px0TFRetm/qhinb2AtlQ3WLYNw04CRQA78L8Omz3/KY
         8ChfXM5cw6J3f551fStIEJp7XVRDD+cuD4rxbR84GcCiVlnwzoHN9MdTm8Pk1j2PvMnu
         0H7mvZhKnsRMDMAcljifytl5QGsSWzT+wY5QTrC7y1QLtoUWO7bH17FhSuWPne4pNDEQ
         UTOV3VxXGVe/GQVJ6wHX2PUBPpNIX/fh/BfVMTNoHXWgSUfpG88iwX77eZgsKcCYrJEj
         KaDDKFmFD9mfLGnhOoazyiCxh0gig/a71F71MjeXQz9mkP1BwC1d2Bb/wBzj9l+GGrsq
         Gb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719344240; x=1719949040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyVb4qrcCw86v65yoBR8M9Bn51y9iq92v+MMh2VhOnY=;
        b=Heo0+VFbbpfgshANPrGnNs3KIWybg7Oe18Lb2DGXJyPGj5j+Cf2fxhDKmslqCORstz
         sQznQaK/9WnFeHhCSDhYPULt/cw+UcWdDjyH0qlCy6RmuNrOLqaCLxss92TPPh5p1ldz
         xjie/dw/Eh9L/2bYXeKNdx3E1Panz1VWAL58YCAGwkG63tT9wKQzuyiTCVplvDv7TNdH
         cuGBsfRuXUju7igJ9hxDt0HlgglKT7VSGuevC9ksni1n6gzwLI4J9NQw4Kjv0gErdIV4
         ksg88CTTzoifovTlOWRnz0S2+ExeMK7GVsC37hqXm5n8uOD4/KztxkUzE8tQ4l7Quig4
         aVLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD9lyeNcVMuEmeO/LEt9Y8iy/w7vze8+twgm04mMYv0tcTRnhlo/RK7YermiglUdtoJAHyLWXk/Zo+Eq3kvzKeS/IX15WBL1R0Rtl0b3j8oIcXL6c95ZoJ3m30bVrPo5hDlWioq5S2dFs=
X-Gm-Message-State: AOJu0Yxh3fB/4Jm5gv9xlkZsyZtoFk/YEQDEgQWd2iZocysDZ4neKLWX
	D4EaI5cFSqwjDI3jFDAIhPr2qX8aVbZ1qvz1uE0nlAlek2PPF5i/
X-Google-Smtp-Source: AGHT+IGffx1paoEXgxZp5JsjudXLzJHi3TSHG8vCTB62Z+ses3XHb09wR9B2NpwWPyDIczWiClWGng==
X-Received: by 2002:a05:600c:3b18:b0:422:1a82:3ed2 with SMTP id 5b1f17b1804b1-4248cc58702mr68106885e9.27.1719344239792;
        Tue, 25 Jun 2024 12:37:19 -0700 (PDT)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e100-e800-c687-22dd-17e6-d8eb.cable.dynamic.v6.surfer.at. [2a02:8388:e100:e800:c687:22dd:17e6:d8eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0bea05sm222020425e9.18.2024.06.25.12.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 12:37:19 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: andrey.lalaev@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	m.felsch@pengutronix.de
Subject: Re: [PATCH] Input: qt1050 - handle CHIP_ID reading error
Date: Tue, 25 Jun 2024 21:35:05 +0200
Message-ID: <20240625193633.35731-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <Znrs5QVAuSjH5sCT@google.com>
References: <Znrs5QVAuSjH5sCT@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

> But how did we get into the situation with the chip being missing?

In my case, this chip is a part of an external board.
So, for example, I see this message in the case of a bad cable connection.

Also, I prefer to see messages with error codes instead of random values from a stack :)

P.S. sorry for the previous email, I made a typo in git-send-email args.

Best regards,
Andrei Lalaev

