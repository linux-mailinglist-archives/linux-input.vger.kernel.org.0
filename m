Return-Path: <linux-input+bounces-13695-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 649D3B12E8E
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 10:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8FD189B361
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 08:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3141DAC95;
	Sun, 27 Jul 2025 08:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqwBQViK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5615C148850
	for <linux-input@vger.kernel.org>; Sun, 27 Jul 2025 08:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753604593; cv=none; b=c2l+5asK2NsVasWI6FMO3gLV07kaD9l7+L/0vWEnV+zZIhX0X01TlWp5DR9TW4KGlEUsyWOGGhJRE8SAdFkPkxsbi6o1i7Kt5a4il42RHQd/LpKsI3kt0Kssxq7sZ/o2E8SLs3LL39lWk/MDz132kJ7DvRGaKwS2d3qg0ySDcb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753604593; c=relaxed/simple;
	bh=1x9SX7gRXicZb4dzuP2tsUCe12nAaiyVPCgEQAoN9eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmYXxl+7HQTlPxj6TdHo6tXBbxAEg8TPvssDK74ltUX3VdD21T9VP8DauiE2i4kR/zbQmKgBgogF0M+ZofPyOurqHkfjwpgWZwfCB071YAjGpyXskmvYkAZiT3rAOPXnUrWf/3NEWZz6YdDg6Rn1NlM6hHeO9H9gN0kbYEa5tS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqwBQViK; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-75bd436d970so2142571b3a.3
        for <linux-input@vger.kernel.org>; Sun, 27 Jul 2025 01:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753604590; x=1754209390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n/YifcEuV/Y5cyzE+FQRNXUoHN1Fm8z0NXQm/ZxshsQ=;
        b=VqwBQViK+1d9Sq9XpCMyRHkAlJjA4bk7JR71gHtj/HMEozpXKWvQ5Rl0rIgaLnDru9
         TGrJv+6yMMYb7uMEaS9MqNb3fOGLZhTSzGUVvCNAWk9SCpTrHDhR8dDrCseF+yIgS+bJ
         Oa5I2KnSQq0dUI5BIks8UkdUiyer/ojHR2yObGGhSGx9B5QYLZRHl9XwSh3AU+2CIdq9
         DFZtrcDGU4XSNFCqG+NHOXDlpB5p68LfrgjlmtOiydBmJpCnwNZ1fMTE3pEu1FiD9UCf
         ky+Dt6xIxvbgcmAWFdXEVsHbh3N6iHTGCTJG6AjoQXnfafOsJQEIOdiDZjF+RtVA+WIA
         m8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753604590; x=1754209390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/YifcEuV/Y5cyzE+FQRNXUoHN1Fm8z0NXQm/ZxshsQ=;
        b=BuVQ4DtP5/jaQ+qAoWyUql6osPTLYVVja/toyjkMkw3SsIAbmQdyErpnHtEbFMqO3q
         J1GyKVhV2es58PIG+uE9pfi1+bvyVxxzIc5CfobvPYxfa6wGtBvkMlofMr5W73oiE72c
         zgxtJSgobE8Adwt8Fnrq+h9uSygQg5nFvE7SlU5i0oq3ksZ0l5sLLKbvcxk4YKSVMT0b
         KxXTgMuJJFEJtHGPLN+RVOz41ISLn6TGuGphXmDezhZQO/GPduIvagKeJnDvY1dP/ekV
         7+V/SCelAJW9rHvP0Wol5AJSJ2t3diMwmX5TRosQ8cbrHsAGDusSE56A2V9Rd3WaRxv0
         kYlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWudkfGFZMLrNde7hVKR3lnyJpgxP7AJwerD/wzzs5gK0d9wd5ALQPK48UUIwDr/rF+yjr+dSrYga2zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy77Rdta3aW7EZxrlB6NX8WyRFVI7NJV0UhbvfED2pTmTjCMaXI
	bLBh/CdsQgYOFsRgCzNTgoicoTbp+faxfi/pgNoD4uvEHivNEZDDbXGB
X-Gm-Gg: ASbGncubEuy0iI/a16wvsq19DbVwvMEwyobLh2BeNcL5+Q9gOP0xSx1iBiWBfH+rKIE
	7Yijm4YZWSLS58hvxs3V76y9k46wotR7Kufe7mwXalt3nVw4UiSdlWxFLRLlzE9wYbPnjOiibcM
	gd5nCvbSPfTbWzh3xVPCncxnayJNLETIIyBmqy2XV1wJWUOJYbbvFO29Ds0sskfTvxSBV7LZolf
	qL7Y2+jFNwmPXP6CzJ+ZGMepbnQPc3NZSn/we5MF4ckrrxz4nbssPdZ/dNq+WV9qCmosXmlxEH3
	5IgTGCtNZCa7P5Zv1MuKz+6pnFOgddht0Vh8oKOAjwtVtDeFVdizvliIAeFL77mijjnPlCSCdvX
	6ylQeRRE+3B1xyiAKVlSRuBY=
X-Google-Smtp-Source: AGHT+IHiVe6GMzAKUnlq5GCgf+rlXrOtzjGEMqWiOZW6C01PgKu5/5QgiWbl5+U56llV9SphjNqtFg==
X-Received: by 2002:a05:6a00:4fd0:b0:748:e8c7:5a38 with SMTP id d2e1a72fcca58-76334fa72bdmr11105063b3a.23.1753604590560;
        Sun, 27 Jul 2025 01:23:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:152b:d3db:2a19:4eb0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76677c0519esm1745030b3a.129.2025.07.27.01.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:23:09 -0700 (PDT)
Date: Sun, 27 Jul 2025 01:23:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Input - xpad: Use new BTN_GRIP* buttons
Message-ID: <3sbs3c3hcd3qzfgnt2gcnb73yq3hqscosr3lbsort2z5gj6kaj@vhw3tt3wyn53>
References: <20250717000143.1902875-1-vi@endrift.com>
 <20250717000143.1902875-3-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717000143.1902875-3-vi@endrift.com>

On Wed, Jul 16, 2025 at 05:01:39PM -0700, Vicki Pfau wrote:
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied, thank you.

-- 
Dmitry

