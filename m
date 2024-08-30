Return-Path: <linux-input+bounces-6031-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC64966B53
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 23:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5D8C1C21E92
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 21:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7656616D9DF;
	Fri, 30 Aug 2024 21:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qdi3EDGK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1844015C153;
	Fri, 30 Aug 2024 21:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725053725; cv=none; b=UjOpL4EbXPlTxmI+6DK8vc0Ul35VzfxBCCRHkEUJrBCeq5YFjBqs0hHx9Lqy+zd/UJViRNo6JvZqSZkYzJrSU+c+k5N7IL36+43DhtDkvR6MtzTlIjOG75Jx6zE2u8C/oPWbu/ndoJeuj7MFTBo0owiGq2Z6yvShonTjgnFt9FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725053725; c=relaxed/simple;
	bh=UvFffSAeq30Eqc8C+OPXmdN00zTYvQ9bHawAOmVQmgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pyGFh9BPiOpei7uQDDmav5POeng/6q6WnEturKnydL89cMoKNCWBOnsn0vsNtTVL7YQatV01ewTBL1zxj8OyNSOShSJidkfl/uQ59OgM7A4FFr2fq39NPV0EhKa45IXmB0MfysIiEt5CqsuafqJ8naKL31lxV/BFqclnRb6koC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qdi3EDGK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20202df1c2fso22724605ad.1;
        Fri, 30 Aug 2024 14:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725053723; x=1725658523; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oPJaphb0lUc2jvSU3ZmLhDTup9rl4fMHIHMQDVwmBQ8=;
        b=Qdi3EDGKf39wMqxoLuWxhekxozaA97cfvcvTXRSfd/WE6dsDCFiK1Bh4NdwbsudQ8r
         WZobtGQhWIDYNDrcPa7Nj4oZOHXRfCJ0Dkt0FgzS7DtN+gRpTr8xHvmIgrJxLrqcqcZv
         bGwwMfHqyxNOxmePagY+fsLqSjtu1qV+P6afMkywvOGNkR+4P8WDTO/RinLr7Fr7YDi6
         i0ZHlVudsLOl7OpwnP74F/IOnxg4DWMO8QE8QTjYfrkNmkWmOF/LTPFkwFkflXcitNIP
         CybINyOVQ7XYT4giGWKnDX2XAj/kfqAfkZ/5cnlNniFEubMorQwbxiqPrN7q9T/nVVcP
         c+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725053723; x=1725658523;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oPJaphb0lUc2jvSU3ZmLhDTup9rl4fMHIHMQDVwmBQ8=;
        b=XtHvujXlSXTpZb2DwiGbrkEnl4TW4Qz3zMLDmGHkNnVEj1BdgGaRBLGrsUADrXNhph
         8wTfQpBDtmWxgPq7/JuSRw1/3l3sSsBv7Bj/Rcqnwbr9lz0vCo0VGgn5V9+Q7mY16xLo
         OqJWbyZHYAycgXHUButTL9rM1AtBT0B8echVqeB/fBLeO+6pWsfiRw6S9jlJMKz0Meuj
         3lrzpprdkDoL6VYleMSgMPF6+aqvxq2qm5ChAloOJL+8euVOXjs1Q98aH5G6nr5w6RwI
         83jecLGHtwxPXLL8fQhwvYtGAa9X3hjtMDTA7cOMCusEB4RKM0iRnHXHjKt8Jd02RJod
         uB6A==
X-Forwarded-Encrypted: i=1; AJvYcCWmkY3uFA1yAj0I81tDhtGCxFlyUijLTpp9ob6kj+FYTd7ALXD0C6lROJybMGmJyb4x1O3v+dJzfzxniQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNYe7/x9RdQ8ccBTgsupyQUrj1IC7bCGJhRDY9gslmASdLhsg2
	elE1o7+rwG5y8+Jmk5/LDRi40TaoZTuhq/BqI6O8qnXUtWUsY0PY
X-Google-Smtp-Source: AGHT+IFtMzfNonmObVVF8v+ps9Xr7rgv3GGTaAESTlUavLr/K8n/e7LZQgc0m/DPzonEEwFB2WQ5rA==
X-Received: by 2002:a17:902:b182:b0:1fa:97ec:3a4 with SMTP id d9443c01a7336-2052770f025mr50402605ad.8.1725053722743;
        Fri, 30 Aug 2024 14:35:22 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:bf97:5ce2:737d:1e6f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20549ddda8csm398795ad.258.2024.08.30.14.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 14:35:22 -0700 (PDT)
Date: Fri, 30 Aug 2024 14:35:19 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v6.11-rc5
Message-ID: <ZtI7F8X59jgrGp_7@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.11-rc5

to receive updates for the input subsystem. You will get:

- a fix for Cypress PS/2 touchpad for regression introduced in 6.11
  merge window where timeout condition is incorrectly reported for
  all extended Cypress commands.

Changelog:
---------

Dmitry Torokhov (1):
      Input: cypress_ps2 - fix waiting for command response

Diffstat:
--------

 drivers/input/mouse/cypress_ps2.c | 58 +++++++++------------------------------
 1 file changed, 13 insertions(+), 45 deletions(-)

Thanks.


-- 
Dmitry

