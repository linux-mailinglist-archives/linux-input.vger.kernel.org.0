Return-Path: <linux-input+bounces-15137-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A481BA65CC
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 03:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C1BF3BFB35
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 01:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9C722D785;
	Sun, 28 Sep 2025 01:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Na8nLQkI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856A51D63E6
	for <linux-input@vger.kernel.org>; Sun, 28 Sep 2025 01:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759024462; cv=none; b=lsV2KRP8Hmg5dGgSJPoJUHLvvnAZKiESCb6mKQkOSMBZgYvNHz2TKLLOovPwP+sNEUqAZ569CtIYrN9rePvFmZYcvPgXlbJ2lxP6uJlZjrezpojIfdL3EKiH+SkQZxOon7iRdDyaVXFvRLVgocYkJYhTo55gFbiGpoB+gUta0Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759024462; c=relaxed/simple;
	bh=m6iumLeoTO47Gvr5RQe+Va+QrOiB1iEoYufY/oP9VSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GrVXH4QIDpuiZ5bKcrpWFiKCpYHZIeoR3MomtgA4hiv9oDP1gyv9I9auMFM7A5X4eoTUrzIG9ukgbDALXY4dWf24p57JCfL3UBJbetm1ZpLP9cbtK44mXkH+H0Z3Yeuk16bVsCfcorkoCTSzwpB6HNKatLYeKy1WKNv3U8K87jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Na8nLQkI; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so2156986f8f.1
        for <linux-input@vger.kernel.org>; Sat, 27 Sep 2025 18:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759024458; x=1759629258; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m6iumLeoTO47Gvr5RQe+Va+QrOiB1iEoYufY/oP9VSk=;
        b=Na8nLQkIcCtToQIIFsiX9ks3yFbd83SDC/zV/Iup2mbDwQoeoGv4a+FqwxooQ7gPgQ
         j/k8Bi1T0F3OPYviakQPKXehJTZKnJAgY84lXqUpOfqKlMLbEVOxrXGoqyYudtulhIeD
         duqyixWnys+gb4+r1OqPZjT7MegsMnlDcPlGTVYXemnU8nInNGUn3mcgw9kihghNlBfE
         X+BKyiBz1sv/mrl+yLZbvGdmQ1d7La1mkFDda4ujIj9TnflAe5BRzRgtkXGouCSSi6ZZ
         1sqLVC8sV2mR7YQwohi5BXE7BZI19sEMamLpE7ctlAUTTdzgdORHAHuu++vLc0bS4fCE
         oXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759024458; x=1759629258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6iumLeoTO47Gvr5RQe+Va+QrOiB1iEoYufY/oP9VSk=;
        b=nl7PzjxwLmfiJJ/G61E7lNdBdXd/a2ROzMDGOcvQRjw6prHovDG8Uh6TG9t2zMAEdt
         BVn5mpQxdN6ZOIiYiPR0fKYaiIPIx8jUL3aWNirNesAl7YIuaQGcZCSp+4A0NZWoUxkZ
         Ppqs05LyoiNycsxvvx49kRtCxfGv4Zy/Y5zG3TPcTUdU2M0jTy49vPDs02YVZExbtNSR
         E/hA92niFU4nfYjqxk47Kzv6YF4tthvuiKLHLmXs/grsgzkDFXWVt4DHkZZE1z5WDtKr
         b5UoBk+1MPhvuQDYZB3VXGIGsGVVzrh+9IYh+d6azopkTd5Q0AdWWy21xX5wJVoKgl+R
         Q6JA==
X-Forwarded-Encrypted: i=1; AJvYcCU6Kmad6DG5VTzChgOztUaen0cBsBe91c2IjAOKDDeWLySbfUqBNFPZd62s/mowlxZLlcKwULA354+jSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI0Yi6lV6N+wUGiCMmfRDDHc1KqrQspeJZ3p9d8XHcFMJB5q8D
	O9RhyW4k4s4ptdspHGrUbiDX7JNQG18kPJCps8XY2ltChB4woq5Ra+KF0UXtjET1+NtQj+fUvo7
	c5fc+vCgrFZQ17T7q4kt7T3z4CN8MYIcSXw+hi80=
X-Gm-Gg: ASbGncsCIsJ5A4fIvHyqlUAQQxseBeZFqJOiTHK89t0KJ4ren7bS1oA7eWt2US6CpLp
	dbn6JSlFKW04VXftsthfWSRBCJwa4uNTzxoHeNQLmm7AMYhIAEP0VeGDfaWqMalK94hBqlz6tuu
	FJf1QNVkGAa3Er39C9NRVwiSQdt7BAW5pIeB44p0CyuHZ10GlUJxsGKmCY+JpGCPCBVhTNjLb7u
	S0Uzveb
X-Google-Smtp-Source: AGHT+IHlk3lEjSPs6pKPni0/VHWYcy+JfrlhoqfHrI+dV2PoNCxiScm5z2bGxyQnINgqDFM0BwYjmL4AHSjeu+Gl5PQ=
X-Received: by 2002:a05:6000:430c:b0:3ea:80ec:854c with SMTP id
 ffacd0b85a97d-40e4745deb2mr9786908f8f.19.1759024457661; Sat, 27 Sep 2025
 18:54:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250927234834.2635483-1-mavchatz@protonmail.com>
In-Reply-To: <20250927234834.2635483-1-mavchatz@protonmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Sun, 28 Sep 2025 02:54:06 +0100
X-Gm-Features: AS18NWBjGPl_Y9fGsgnadXbSOrMQCHbo_GQJJYth7Wpt2evSCO5q9vL7k3eHEc4
Message-ID: <CALTg27m8nykJsqNtQnjNcaGpQtPp78+tDnApKa_MEowMXki2Ow@mail.gmail.com>
Subject: Re: [PATCH v5] HID: logitech-dj: Add support for a new lightspeed
 receiver iteration
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net
Content-Type: text/plain; charset="UTF-8"

Still working :)

Tested-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>

Thanks,
Stuart

