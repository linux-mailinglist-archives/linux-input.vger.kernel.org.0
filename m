Return-Path: <linux-input+bounces-12708-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C317CACD741
	for <lists+linux-input@lfdr.de>; Wed,  4 Jun 2025 06:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691993A6E9F
	for <lists+linux-input@lfdr.de>; Wed,  4 Jun 2025 04:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064F11DE4CA;
	Wed,  4 Jun 2025 04:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3l2sFZR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7797E17548
	for <linux-input@vger.kernel.org>; Wed,  4 Jun 2025 04:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749012013; cv=none; b=ZfKufxDxYtGBbETvcvuHsfLZdR8fBaTFsZUdRWIV2qgT/UQ0Lxc2axkAiFJv8kXmjzYC/72mq/7KxyKa8Gzr2YGame2bUNXzvVh+s9C8A4gOwqUm9xF0YmXH+vuIYLBL41oWCLsk34iT4T6X4+ePY1EvuZ5gp0qNBDFI86aq4Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749012013; c=relaxed/simple;
	bh=QJjFpjk+DmMUtusAwptrM7Ib4N7bR8c9GjPDuTX4E9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gk3CCxYIy8miql0QkvmIY18vRYiVq4aIlefQkioJRsGJaSMvkEvGCA9WINUDU4YcNc4p5fDxrwWAj5VqldMFM4AY8dXVe80xgOZT3dem6w8dfCc9q7xO+PJuu4wWjPXgHlC3NDppgVsF3l7deu/kYbE1zj3yEccnuwZQSrXBkVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3l2sFZR; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7300069c447so4324998a34.2
        for <linux-input@vger.kernel.org>; Tue, 03 Jun 2025 21:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749012011; x=1749616811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g3So0fdjeo2x17Jylaxp9zuihp49qTN0SOHlt5DEXT8=;
        b=I3l2sFZRm2PoymYTgKW3QdZmy7drFgQn+vb0kPG9IgS7/4IwG8l/1nx4ReyDORjTza
         G+IxDWTJmyAMfGwQjrBL6qSFNU0ZWbF+N6CGDArm5Xyngr7Hb43pj30oF8wyQE69Z5en
         DYBNQH9S6sDUXBYDwA7sYFP9Cv4u/rputd3X/A4GdfVO9b/dMwFJkAzCY8eiXTU5zZbi
         J1Zk2ZHB8+roEE1cput1QH4NOxyp/hCCFdsMY7VTCurKw+o42YcoPtdp3jTNljiaziJ2
         Br8qvbrYmy20s3jV2otgfv1Oe7zApVn9KmG8ibnnhg6b0HNgUAOTAlCsaCCGK8AyC4Eb
         NwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749012011; x=1749616811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3So0fdjeo2x17Jylaxp9zuihp49qTN0SOHlt5DEXT8=;
        b=HcyuBflga/OMvqcVpa2IY+whJLbynqS7WTB66SYQrjwlIJbiTKGVnqSgNdj+vE3yVh
         c4Jel/p5/zRSQuS6lhmYp5BqToX4ridRly1NEfFbQXlVmSWVYuEA5Aj0EPJ3Y/owO8jT
         UucxIh0wWTDlG5bAqqckJQffP8NWMBeoaRuKwEPH3srsutB8xMeBiTSWF4ZvzuCNYbPU
         0GXf/l/Adl/17ueFMBaZ3/4/txnkCgtnSTYJG0tW9kOlO0SXlioUzFKaoGc3AIU4snx5
         zdgPjy/MbJhCdng8jHKm2Nt7I9FJu6DQapD927/Nkb6/lMM0mMpLu2T/1hdl5M6Jjjx5
         OEgQ==
X-Gm-Message-State: AOJu0YxAON5kRZtr1/z8CzfSEv8P+pCJVjB4xwxUBj04TLv23BNRIOZ+
	jNhXURrLdimYPXZc+ed6qVPiIV2LTpFP6l8hdorHpMOXR9pPsRpSH5BWgsVDJQ==
X-Gm-Gg: ASbGncv7gJqM3zvttLQHf8XiIkqUeoIH8U+i+hoMGpVrUL5Ho8JuwUmoLlXht4Dep3i
	scrSXvKBbTJeoG33j+Rb97RAXaH/tJqz0yc67+Kfa6JYjs16xIDnI5bw3xTLaRtv2NqFjkT06eF
	E9J1vsJCFvRLUfvmnuL7TK5my1QUmBnGi4h1I3P65SXyxCPga6ozdJVJ8BvsBlZjs7cc8sWauuE
	XssxVOrmpiE0ewTWq2S9LHN1Pi6IkC1KeOJAoHFbaUVlu5oF2va64uD889xczlYdQyA5o8nZZJQ
	POeuRQJUi4iSza9/O5aiVvgYpyMDtm44wV5ZHROTr43+2k5m8w3l
X-Google-Smtp-Source: AGHT+IEUv33f+Z9wpIqPSKa+BxIe9aU+B424wCgE3+0PCqiwJkeAPo5CTkZm+9yuKWQtDBjeLUKtbw==
X-Received: by 2002:a17:903:1107:b0:234:ed31:fca8 with SMTP id d9443c01a7336-235e11cc1edmr19028585ad.27.1749012000550;
        Tue, 03 Jun 2025 21:40:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1679:3775:f8eb:4ab5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e30c697sm8082622a91.36.2025.06.03.21.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 21:39:59 -0700 (PDT)
Date: Tue, 3 Jun 2025 21:39:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: iqs626a - replace snprintf() with scnprintf()
Message-ID: <lu3bafhklyvzrkgpjtr52nkegk6kv7bpkykaaesj67qyn4bckl@ger6hfvujef5>
References: <Z3rV8GTHxLyjBQ5I@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3rV8GTHxLyjBQ5I@nixie71>

On Sun, Jan 05, 2025 at 12:56:48PM -0600, Jeff LaBundy wrote:
> W=1 builds warn that the data written to 'tc_name' is truncated for
> theoretical strings such as "channel-2147483646".
> 
> Solve this problem by replacing snprintf() with scnprintf() so that
> the return value corresponds to what was actually written.
> 
> In practice, the largest string that will be written is "channel-8",
> and the return value is not actually evaluated. Instead, this patch
> ultimately removes the warning without unnecessarily increasing the
> size of 'tc_name' from 10 bytes.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412221136.0S4kRoCC-lkp@intel.com/
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry

