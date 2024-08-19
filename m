Return-Path: <linux-input+bounces-5656-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA37956B39
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 14:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8561228335D
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 12:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BFD16BE3C;
	Mon, 19 Aug 2024 12:51:53 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3B1171AA;
	Mon, 19 Aug 2024 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724071913; cv=none; b=VBPxG/imy6DHSYvSlrGTMzZDVQNcNPkLbNU1BGzBklVdlFRNNysKgBLcWdAaPOxV+RwTmgkBMGz8Ca0j9SQVtET2TzzQycD4oP2bXo0AoTpxlgJeuQ1NHSV9pSIJ00JJJrfGOBCxcCcWsTLaWS+tTb+qOa1n2EIyzLjjdmLeeY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724071913; c=relaxed/simple;
	bh=aD7eRSAeEz34K2b+ucFxCsBeMot/0COZmJO4dHpufxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3eNDSvGX/qC78aqps7GxyHtZINMBE8/R2GsIFIjWvvSeK2GoLIDxUxj2HR7VR5MN3C8WTYbu6n/WGd7HFVErhBpTeajavaXra/q3yxPnkIJpuTgfbyaHT/RChLg0i78EOmPwJpB80F10EpqzaCur70NQa35zIIu+pOFOMysla0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so32224085e9.2;
        Mon, 19 Aug 2024 05:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724071910; x=1724676710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+EC3bu3fnbMxKSLDfjnqISb791pQ0A0rqIMVWYbFSo=;
        b=ukJyY8kulaB8zy9ara7PyyrujKT1NBKNYdRpTFmiC9CbgpiviYXj7oe7u72WVQQ7C/
         Wf7cgmtZCQWinNxu1M6JhCxRWarUgKbw7/BoDlh+Xdj/KzXvFNfRH1dYCarZXhRKeLkF
         II77EA1Q6laxWjwy7VFzhujd2aZOOXmM1HJXEFvuJfogRogm50U1h0fkjkaxK8WDiaT+
         Emn0SXjCbafRSR/jH4pR5RiL6Beq7SdZkUcgdBUu7f4qc6kkWFKb+s0bwTghEFkyheQx
         wONKt+CCzLoCgvHr5XH0voOSu4SSsdzAvZEOl4/+WxPTygyGcM++/z6AG5Sm+irZFlhx
         UdBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFJpFm1JnRTic5KAEqCQyKZl/ZRD/0btx8ZnW/ZlM7YiikMwXQM4grbhfApjQoFW+GG3ouCZMFX3383uQQiPmnFrl0WtUgFL8/8yU8UZ1f/p1ayxZj0sXatcb6CzykisN4NJxsjK+lg50xkLIKTjQtVW8XOLsJA+FqfXkaeM9RVH3hcrUzv+fxDBtgIQaPfhD8W7gn2QdcYJKzgV0cCInMuvuMJGEq8NA=
X-Gm-Message-State: AOJu0YwzlsUab7IzbHts2X7Gr7BsT8Cr+9oEc0D5PWGGSmol8X5rygLD
	pBBV8cQ6Z5sFAgL9gRbOvlD2i07j9HPhJlhfbIM4vYaPva6kw3DN
X-Google-Smtp-Source: AGHT+IGsdoSCFM1RsPR/SUFTfgbMSadWdUeXAhVs/U+QwRgFfME8wDjdTZgEqtzJ3ACZg8KuM3pP7A==
X-Received: by 2002:a05:600c:4455:b0:427:d8f7:b718 with SMTP id 5b1f17b1804b1-429ed7e43d7mr76931215e9.24.1724071910198;
        Mon, 19 Aug 2024 05:51:50 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-371898aa496sm10423941f8f.89.2024.08.19.05.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 05:51:49 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:51:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 02/14] Input: samsung-keypad - do not set input device's
 parent explicitly
Message-ID: <p5emvacgxom7muyxgnyh57wqey3egodplnk232dymbi7liacpr@47ezk7dyd6vg>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-3-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819045813.2154642-3-dmitry.torokhov@gmail.com>

On Sun, Aug 18, 2024 at 09:57:59PM -0700, Dmitry Torokhov wrote:
> The driver uses devm_input_allocate_device() to allocate instances of
> input device, which sets the parent appropriately. Remove extraneous
> assignment.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


