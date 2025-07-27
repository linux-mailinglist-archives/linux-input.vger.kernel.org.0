Return-Path: <linux-input+bounces-13694-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A740B12E8D
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 10:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71292165205
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 08:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74333148850;
	Sun, 27 Jul 2025 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRqrpQgg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11418645
	for <linux-input@vger.kernel.org>; Sun, 27 Jul 2025 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753604581; cv=none; b=gy4Fst7LIqNPTUyA++Avok1a6hUc8DfQGIAW9rlcze1nWmtETll1giZLXQ/T86j3g3aSOn2IQEn6uthOm9IfGA9YTg9rJclciRlyshPOdEXOaULZen4xk58xP7xY0TWoGUscm5l9wrlx+QfMawyG3m/+uaHr/v3ol8uinMNZv/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753604581; c=relaxed/simple;
	bh=yf67BQLolAI6tQcawSF9yF4KvAVWk7GD4QVs5D9NgMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIntnUjmH4cKib0q1ofEWYXH0KeeTKIZxhqwUm4LsZVQF2eoYj14efPRfhdfHLUP8yZTeW4sX0bFdgND8LKk/mINCwaJVHp607rTwuB9Sr1Tg3rWClMccUm3/4gE4aRU8EPYSlHf904SBt7ZjvPsn8Vlf0mKhsz3Rq87bPi1sx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRqrpQgg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2349f096605so41259925ad.3
        for <linux-input@vger.kernel.org>; Sun, 27 Jul 2025 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753604579; x=1754209379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AxuwyzCpekoX6Q8D0bNW7Sy7Vn+d6NwNC7WPxvRCB94=;
        b=jRqrpQggzXgnYXXe8uc0l/SJ6yc8qAt1u8gYmSA6+h0zfbHkSIa9n9tC4mCNC+T7Ks
         DXG73QELaTKD0DX3GMsRcDUNz1gavIhmcnbluR5JTO1aoQpnXov4JrM+A0Ne3zOE5KmN
         ZNoeo6cyA6oPgEqGPdE/Vbek+I4r9vKXgAfOOyr0ULB8zJamMQdc6Q9t9lYkKDuKByQK
         APdKDdb2MqzuXWjJmvS9GD9HPzhWZkY89fPHhWFlDXp2ftu59bmcbFd323dc2gDHNS/a
         ktQ2XAWSrb/lqRwQaFKM992rAGT/sfVBdfI1YSC9y3i6q9Bl4Fch7AWVcDmLZMGyFcZN
         tMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753604579; x=1754209379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxuwyzCpekoX6Q8D0bNW7Sy7Vn+d6NwNC7WPxvRCB94=;
        b=cg101VZGzkxiA1dfuQnOr7iFE+xmq/zpDtt+Ia9rTmJ749A3r5Kk9A/rfbm1+65AXq
         EucP7uLavNXfQW1mzfffYug33itaAUKOuILaMD5NVTImLYUkprGQoiPUdh8pPRwE2A+Y
         zob2gE19ANovAzWgN6qEZyBgOo7c4jiEqkszg0Gng5WW/5R34iaKKzRWdCcBlSFzZoOV
         BAeq/eg63z7Dxe2U8VkJK/TKIySRRNjFH0XIZg/jSx80rA2FdzdehPcNMpOLTKuPnNVE
         NQXwVBlSVyk/uw4lAgp4CNdheLFU5F+FE2+7BCop2UAwE8pKsx/ea3K4wrCH2sHzypht
         5f2w==
X-Forwarded-Encrypted: i=1; AJvYcCUIMZyn6hljKzAPWUXai/u9GdLqygkO82jvKy7Hhu3E/w0Z7fIUb+TsnwNl9pNvNo3uD4PzFHm3U2HcdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSpND+s0bTYnSKu/uHtphWeIR01fY7nHfvM8w2D8dLOZDNYBuv
	4xD+XBDrhbITWvICbquLkBgvF3hNGWGCJU0LMSHzhRR0m3C7LfGnO7FSAzlPYA==
X-Gm-Gg: ASbGncuRDxWsAj0Gtj+Z+reXF4vzqCfz0XG7fj2EpOPC943L+y/kbGdhhHG7uLLYEzN
	CKGO3u1FoSGfOlnnQTpG+RnEIzRJa7GKmA8+h8YlTXs/DK2lSDtTYfSvU78dXo21r25KEAXmJNR
	el2bm4SLUMBCHLphQB9RXI3nMOvjJd0jA1OdujJwK5JJ0VCWX7cAXVaSlp4e5u/9+XwpMZNqBS1
	EIgu/ubhpBd08DKueCFP8YS0Aac7SE5Q+pxFPPG+HZbBShO53P3gtmkLLx94dxUl2tG5T2MukVl
	XTjZ0bgGY5BDPXIerfKPpxm5INga/C9s2xjJCf14WwrRmfBohhytUOttUaqBUwo/r+9bGF+7pM6
	ymOC0VDLWtjy2Yy9KQ67Furg=
X-Google-Smtp-Source: AGHT+IFX/jNqxEHQfjS6oh3ZtYL5PXOkT+TvV2KNRchV3u2/gXOysEtQ81OyUMSWFM1xVw5te99NiQ==
X-Received: by 2002:a17:903:4b03:b0:23f:fdeb:4171 with SMTP id d9443c01a7336-23ffdeb42ecmr24391885ad.39.1753604579273;
        Sun, 27 Jul 2025 01:22:59 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:152b:d3db:2a19:4eb0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31eac4d5f2asm1834468a91.9.2025.07.27.01.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:22:58 -0700 (PDT)
Date: Sun, 27 Jul 2025 01:22:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: Add and document BTN_GRIP*
Message-ID: <hfbsreq43b4usu2hzfinp5ogpypuyia457hzljkfq6q2ezf254@xzzbksads7b4>
References: <20250702040102.125432-1-vi@endrift.com>
 <20250702040102.125432-2-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702040102.125432-2-vi@endrift.com>

On Tue, Jul 01, 2025 at 09:01:00PM -0700, Vicki Pfau wrote:
> Many controllers these days have started including grip buttons. As there has
> been no particular assigned BTN_* constants for these, they've been
> hapharzardly assigned to BTN_TRIGGER_HAPPY*. Unfortunately, the assignemnt of
> these has varied significantly between drivers. This patch adds and documents
> new constants for these grip buttons.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied, thank you.

-- 
Dmitry

