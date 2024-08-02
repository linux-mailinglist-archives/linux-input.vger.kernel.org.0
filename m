Return-Path: <linux-input+bounces-5290-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1E194643F
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 22:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74FEF283610
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 20:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7F94D8AE;
	Fri,  2 Aug 2024 20:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjbrsO+U"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915644C61B
	for <linux-input@vger.kernel.org>; Fri,  2 Aug 2024 20:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722629407; cv=none; b=qWmzA2jT/e5OSeszmAFtIz4uB23nMWloLSWcYg6chswzdx6iomUq6et+r/AsTYdITL/q0SBNrz1nbhfoVuOu//J3D/nytrodYLl0B9Yjuvp+iHoAI6m2UdZpUFWV8Ejclajo4NEJgRe8XH7Jz7JB+zDbBdZoCsYBCXDWxcUeeZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722629407; c=relaxed/simple;
	bh=ThV8qOm7LGxdF7+0/2UxAb9eWi4+PJGxQia4AD7m2Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z8U+QEcYyizJBCUrbeswv8HH/BrDR13Vo5WWT2Jbm+VrXQMnD6Dp5B8bWDN+JHNSfpIIV4lePLjYkH8jbaPOkNxpmPgMF3QWcRRsGQHDIqfegXX/koW7Vj/adBhA29ZkMj9R4mH2gJ/Vhj/II9kPXBbk5vtbbWTezk7Lm617M8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjbrsO+U; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7a94478a4eso654025466b.1
        for <linux-input@vger.kernel.org>; Fri, 02 Aug 2024 13:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722629404; x=1723234204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtDgNmRbGDmgNCDwg1knw4L++2rJQFZjkYWq9TEgj+o=;
        b=JjbrsO+UCs+LQGCVwPWnlVZO7rFoyTDXD+o9PeROrCIk2CjJvUzrfpS2n2nw30+dnA
         Rb/ZbqPa2kak6JDJLaJQrBnx6QPrrWFnHK0Kc3QHUurY81fYOcd/D+mqjUYO/vUkYWxB
         ISJHmsrc/6I+byvvL2S0Pa1B0LOTq4uhF3nRt3jfPHkxIoPuytwt3fbTS0ih34NGB0W5
         6gzfGRGJ59twqwi0YYoKIN0C9bL9g4yB4Z0gNDVkheaVdEoKsSyrPG4Sqr68+F0mXQcY
         5KBYoRpoHQbnisjIzNhJKjYLnjYGbyZv4JSvWLTjbretG/lG9ERNwRUJcZ+rNwWBkzv+
         jp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722629404; x=1723234204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtDgNmRbGDmgNCDwg1knw4L++2rJQFZjkYWq9TEgj+o=;
        b=hr9zeZo6MfwVBvIwHMeqXn8wHnI6y/WcN4xgfbcleYcU32Hi047xdHCn7cSnvUazch
         93MHXZPzmbYvXmpACsjXYqD4j1dH117OJ4w5+V6tSeUZu2aeFjUig5aNImWBitTWqHDn
         QiQv3ngSRgWabJiMselKkQ4pCY8x+eMFA8A3Z5jUjbrwlRnnNlNhTYsl++eBVYnVil5U
         MAykRXtKvANTjXs2ma9skPuVWGENSLh+ndF5ky2oujG827B/uiIcQxJlAeQZRoT0M+XH
         Pj/reoYVBH6Q8+eqdgA9qGb9lx6oNkcNTiBVQfoeLeekoMLKk0zafM7Ju6IOmWjuWUqk
         LSeA==
X-Forwarded-Encrypted: i=1; AJvYcCW8iOoQIHsl+w36l+elcxCJMEu53lPKzDRfOf3jKF3rmezhgnvdCFRBtppK4qSbZdRmhPuUlyawR5tJestygxKEtQaNudyZohSlpL0=
X-Gm-Message-State: AOJu0YyAc4lJVaSjyEsAgKnhGsdenWE0KMiqPa5KHfWHMNRQxIsWS2Gt
	Yl0vn1gyd3fpXZ4VPXHPFY8tA2J2tXKmLk5yOJhHKIXmx3g2YXmjlvfUHLjO
X-Google-Smtp-Source: AGHT+IFDhI2i6V3be7KoqdwfiXkLJDv8emPPkHYmGg/iJ+3E423u0Ta5HCsTilLfsmwgOxLBPk2ZUg==
X-Received: by 2002:a17:907:3f1b:b0:a7a:a2e3:3739 with SMTP id a640c23a62f3a-a7dbcc39c1cmr604936766b.20.1722629403369;
        Fri, 02 Aug 2024 13:10:03 -0700 (PDT)
Received: from laptok.lan (89-64-31-171.dynamic.chello.pl. [89.64.31.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7de435ca2fsm637866b.112.2024.08.02.13.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 13:10:03 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
Date: Fri,  2 Aug 2024 22:09:40 +0200
Message-ID: <20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <CACa7zykn0q9XJAUvrqnNATr4DUv3Kc7XujF3vm6sfRB5pE6YNQ>
References: <CACa7zykn0q9XJAUvrqnNATr4DUv3Kc7XujF3vm6sfRB5pE6YNQ>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi. I can't seem to shake the feeling I'm being ignored here. I would love to 
get some input from you Dmitry, as this is an issue that was raised a few
times throught the years and many times, it was left to wither, even with
proper patches submitted and the reasoning explained.

One might think of this as trivial, but this is kind of an ancient limitation
and we ought to improve linux HID compatibility, especially since this is
such an "easy" fix but still has to propagate throught the linux world.

If I'm stepping out of the line, or something is really worng with my
intention here then please let me know, but I know at least in 2020 there
was a similar push to change this and  after Wei Shuai explained his reasons
he was similary ignored.

Me? I just got a new Moza wheel and it too uses button above 80 so I can't
make proper use of it :)

