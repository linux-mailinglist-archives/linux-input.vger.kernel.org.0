Return-Path: <linux-input+bounces-16735-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DA5CE7930
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 17:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F191830049D7
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 16:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A91D330D43;
	Mon, 29 Dec 2025 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AkVa7Vwb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B632B330B29
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 16:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767025740; cv=none; b=oDCwpScTnqf6ao+eRjClSRsVtPOGxu+L435/Z3zqW9TQGC+bL9Ve6rOr0abG5u4Nm4/bj3fKAlb5+E9ouY2pQiipVLFsiL255cvxiZ4EHLYEWYZ8foJB7B/dT3YrlpzRjOC2nFsDaTeloBsxR9lsY4f5P+tFelsfrPRZxEg29nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767025740; c=relaxed/simple;
	bh=b6RQ1NU9EN8+aXaewi+ayTN9noNZWpegcHiTxkGkE0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNUQPXklz22i4J0ctsPvg/dw8FF2YaNh6HYmoRHrw94VrgQnCSxJkpKgZLV6mNl0y7EBn3pxV+BWK0n9MLYfBAjb0E9QOwJhqHw4NF3eYUeZj3ykq0Ry50yvLWTHWmf6P2brMKWqaKBkkXpDY4oqLE4s90PwcVW79YAG/hw8WXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AkVa7Vwb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso41036125e9.1
        for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 08:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767025736; x=1767630536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/igAIS0exjkZCSnq4MvZu4y+vS5w9AmRp2TM3hljglc=;
        b=AkVa7Vwb0H41574gfBMQD0c1TGUpryUE2cGicvRPTYbN19eJTpH+XlKfyIqytXkLR4
         jAYPkBksjmtxu59QfMkR904LixpEUr+GtWbTAsWuqkI2ylHgUu2OIy8gzzsmO+hMXgQA
         W12+0n4XPZ04h+P07GOjvHPBqM0nIkIsUD0h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767025736; x=1767630536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/igAIS0exjkZCSnq4MvZu4y+vS5w9AmRp2TM3hljglc=;
        b=JrOcIk9R8gqVht3Lig54bntuIBmtcBU5BFeKS0eILG9CmlGi/AHLmlacXs6y69fspl
         fgiLJvh7Z2n9Fk7FD+OaVZhVocxQeG+4rmQtDxvPQ0scHOfyLLuSQ/ihUUpfOLXsUZAC
         Xi+T51A/qoGS5oASKO9kjYS3O8/XJinhpa2lRRIbI2BEXt4Y1FTXpS/f3epRk9t30lgk
         a9wVx1DdxsKcnzDXEKya9WBuk+szfgSluwF83lCPNGvc1kRJIhy69ZFuVoIEmzwq5Tip
         5Kvj8Lags6kUYVz+86qBVLGddKHOLAsunEXltomk51ppQp0rQM2Z6StFSn0Mhsbevj83
         NBkw==
X-Forwarded-Encrypted: i=1; AJvYcCW2gBAClctfMj1rnHNreO7XTaSDnujzfG1PfrImA1LTpPta/MOwTFu5sV/Y55yUvyFaY0TYBjX3mrMGOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFmzJlpIagOIsvtY8FWQdwf+sv+E7T4W6MpUIDaE/I8HQ68onN
	Q/qzw3YaoATSv4ZJ4zw8FBtxrPSCBm7O8Ax2XvY9R3id3RrtlNtCQvFW90Qp6NnWyg==
X-Gm-Gg: AY/fxX4e5XiAYVfNLHvvaDhW6Yhxt8kwmpdeWWfLcTJPEOvCIpSOg5WV0EX+j7lX6OX
	UufSxSNUnkIrtZEOB6Lomxl0H6TlL4RrJ7TBr1lteJyl57WU5apiRUr8YyWe1mXc12bZv42Jl+O
	Bg+BC8Q8QsHqmlm0vkCZUxd5CDo5j/kwia/Q0jno4TiNC0f0VKQpB9xitZTyjEwu8AWkVupbthN
	Xg74qpm36LfbsTNarjJvg/eoDVsTWKEHg3X+YTg2CXLfZKvu2bxNfefBSw0LY1KxlRO6QEjB3++
	rm2hYdVxCNe0fzaoAHou1mgyxtkvDPFccqCAd9s78rBlDnrchi6Z+6L1U+VkSvC0/Nyl/nqvgxh
	2I8H3ch+Jm4JfJfeSYn01pP5OkcKlwrw9IyqJqrAh+7/NXfmLqtO+464edovHraYotMMmp6/ffI
	oUtHJURSvFM2/QYhxQ5q8ukAQUHxeu
X-Google-Smtp-Source: AGHT+IE5z77kWrdvT7wPaMpp9A6RiyApVG0i4Gj+RnPn+57arRtLwhAvau2xJ42Pp4CWwsHrv5arXw==
X-Received: by 2002:a05:600c:b99:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-47d195a6369mr342294615e9.36.1767025736112;
        Mon, 29 Dec 2025 08:28:56 -0800 (PST)
Received: from google.com ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a6c6ebsm248468505e9.4.2025.12.29.08.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 08:28:55 -0800 (PST)
Date: Mon, 29 Dec 2025 16:28:53 +0000
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Simon Glass <sjg@chromium.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: cros_ec_keyb - add function key support
Message-ID: <aVKsRbHP9WqCfWAN@google.com>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
 <20251224152238.485415-2-fabiobaltieri@chromium.org>
 <CAFLszThHmN-eGMwwgUhSFbWcbuOYYs-eFh6d6ZVTXekRGv6Hdg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLszThHmN-eGMwwgUhSFbWcbuOYYs-eFh6d6ZVTXekRGv6Hdg@mail.gmail.com>

On Sat, Dec 27, 2025 at 07:24:33AM -0700, Simon Glass wrote:
> Hi Fabio,
> 
> On Wed, 24 Dec 2025 at 08:22, Fabio Baltieri <fabiobaltieri@chromium.org> wrote:
> >
> > Add support for handling an Fn button and sending separate keycodes for
> > a subset of keys in the matrix defined in the upper half of the keymap.
> >
> > Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
> > ---
> >  drivers/input/keyboard/cros_ec_keyb.c | 120 ++++++++++++++++++++++----
> >  1 file changed, 104 insertions(+), 16 deletions(-)
> >
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> 
> I suggest a function comment for the two new functions you add.

Sure, will do.

> > +               if (code == KEY_FN)
> > +                       return cros_ec_keyb_process_fn_key(ckdev, row, col, state);
> > +
> > +               if (!state) {
> > +                       if (ckdev->fn_key_status[col] & BIT(row)) {
> > +                               pos = MATRIX_SCAN_CODE(row + ckdev->rows, col, ckdev->row_shift);
> > +                               code = keycodes[pos];
> 
> You might want a helper to do this as it is repeated below

Sounds good, adding one for v3

Thanks for the review,
Fabio

