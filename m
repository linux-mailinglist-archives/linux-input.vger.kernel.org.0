Return-Path: <linux-input+bounces-14623-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C107AB5389E
	for <lists+linux-input@lfdr.de>; Thu, 11 Sep 2025 18:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EE00165C55
	for <lists+linux-input@lfdr.de>; Thu, 11 Sep 2025 16:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933733568EF;
	Thu, 11 Sep 2025 16:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOKFZT33"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27D120ADD6
	for <linux-input@vger.kernel.org>; Thu, 11 Sep 2025 16:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606619; cv=none; b=XoSY3lgKD3Pk73e9QLCcg5Gjv2am4NWo6zNXbMoicA/Br2zCNJzW4R9LMEzEEBZYFLo9YMZ9ap6SFQH4EMD96kBUE+WoFprMzZmb36kfzZ2GWPrae+qecKUEKTM6yJEJenNRR1jfVjFH3Ox0KF8J6yL09LztrOoy5cm4daui1d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606619; c=relaxed/simple;
	bh=Py8tEk0Ei0y/z+n+ilOScm0a5cfD6f4JKLzbyJg3JSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jumys7Gfd/ReEZgMhkq2RmAHSDFlf81gcCLC3fxHr0AHALjo6LHtaos22d13a+FLP6UTGVKHk6HqZnlvIm4LEEJH1hEmx2sb8pnCrfAt7ordxGnqXTkvB+L7JqxrVR8W1sZF5MCTMdtTQ4obdFaLig/fqZ543wZW5+CxijGuUIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOKFZT33; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so7299795e9.0
        for <linux-input@vger.kernel.org>; Thu, 11 Sep 2025 09:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757606616; x=1758211416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juu37p0WD4XpFBvsQ98g7XcnhD1Q0GfDFr2izWwlv3E=;
        b=hOKFZT33G5qwUdS2bCdUveD7GF71FSAQlw1KjHOQCIvwLPgsjxR/RRFDS0thplWyHD
         puu6zfKlwzB3DJfXj0HBjhVOF+1uq36WYFDI1HB8es1CJ30FR+5OfSksFmtgqqtrFcbN
         Lrl1xViQ8qno31TnG8wsu/sQ1E0Bi2c6lCSO86rZRllp89kw5vmHUZvEHdsW2LyqB/vX
         xEFrSrDQ2jDgzF6yWHSGCFmR+mEhQSBoaQY136QULQsX+iRCKVDUJ6j5gZ++OhJzVTlS
         6oMG3mRYU5R86Cc0BqvMbu7pfcvDDuzO2WJzbSfNt7b+9kVlIGabXdgu9+WOOZweUj9V
         R1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757606616; x=1758211416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juu37p0WD4XpFBvsQ98g7XcnhD1Q0GfDFr2izWwlv3E=;
        b=ZR5/+vtyt/7rmvHy9obs607qbtujfHdeKSg/dNflhlaBIbY+/bqEq+lbH0eeY+U0w/
         m+GWjaGr029uzupFGTniKEHVRzFPPx+VUk/KmFAnbnEJ7BpCy/HaEsE1lpdBIVMTf16h
         nWuR173FnDIAyR3+eE2aIDtfp+jx4RfsV+Bk7n5/YCNt8vAMX4ERthEVqo59XYogahGL
         epvVK0lHSm7+s9GsGR3TH4Uf9nHuXdGHeMaPuhMIo67mzwz4akrEAVstMB3jzzxRO8SD
         IhWhfx7OphqLB5N7UYALukr0tiN9JVD6lDBR5V5hf1I/EyUdZnzkWnwe0KknFlDfwZHJ
         RNjg==
X-Forwarded-Encrypted: i=1; AJvYcCUc7saABOOkeY9LImJdLyn22T3qcsttEeiyjCB97hPzZc/eBB4k7YAvTGRv0hHwQGWP20u1Bfa8ux/uRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO6o9SYuY508cp/HDPLFLYLNNFF/FzN4YvUNJy9SazDu5sV3Zp
	dvClHit5spOzImUkgZkavF6KMHlu5NvJ2ENmCusaSHeijvgTGKoqycro
X-Gm-Gg: ASbGncvosM79UpuyzAARuB2zKfceHl4n2HxH5sGjRXmvGWrPx7GqueTJgWe1oN9BfB6
	eNLQohV8RAj2MSnFkMOuazCR3OrqPBAxPG1Cj468UWe4bWuUyRfSGXiF5dRkFSn9OKfg8DOLd/+
	LdEhqkv+T1schpeW1MO+HKHFHVUJ5MDIW+gGk0cHf2P9TKAo/RQkBmXRFNtyh+fqGrx3KPNqFv1
	BiJwThzO4UUZINICbtm2uernGFbUUcutelZ7A1VbM24gcO2xUGSeRWlyARVvmLzxtLvdwrhQB3i
	TJGuIvy3kY6j5y3ItKSXQKfwOhKY9MZ/u8G9tL/tG17Oglvn77aT/9tgfZlE1fr/KhXB5bgo4Ec
	niGCcPdc1QSuGouqAWMPMTs6NFbn12aPBPcy3GcwXVxqho3HE9Nn8OtPu5bpjPf8jn6Suilc78J
	5QF1mfMaxDAL7XQ2uyBDrPFlXK
X-Google-Smtp-Source: AGHT+IEZsAWaysBc+OQ7PsOUMO9De4gX+5mEaMPhifkhw2MfJOEeCsTWH6E3dD6f9tamKPLvBQt5VA==
X-Received: by 2002:a05:600c:1387:b0:45b:9c93:d237 with SMTP id 5b1f17b1804b1-45dddeb93f1mr166508065e9.14.1757606616075;
        Thu, 11 Sep 2025 09:03:36 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e01baa70dsm31874215e9.15.2025.09.11.09.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:03:34 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/2] input: rmi4: fix RMI_2D clipping
Date: Thu, 11 Sep 2025 18:03:29 +0200
Message-ID: <175760648466.2794963.11623532624737227996.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250903161947.109328-1-clamor95@gmail.com>
References: <20250903161947.109328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 03 Sep 2025 19:19:44 +0300, Svyatoslav Ryhel wrote:
> The physical max_y value was overridden with a clip_y_max value. This
> caused problems when inverting/flipping the screen. Further it messed up
> calculation of resolution.
> 
> Jonas Schwöbel (2):
>   input: rmi4: fix RMI_2D clipping
>   ARM: tegra: p880: set correct touchscreen clipping
> 
> [...]

Applied, thanks!

[2/2] ARM: tegra: p880: set correct touchscreen clipping
      commit: 2fa1118387295b9fa6d70a48011b30184348abd0

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

