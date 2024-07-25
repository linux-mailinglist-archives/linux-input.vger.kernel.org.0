Return-Path: <linux-input+bounces-5162-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3143F93C9ED
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 22:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77F60B21779
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 20:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FFF13B7AE;
	Thu, 25 Jul 2024 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aH0aIWpB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7273861FCE;
	Thu, 25 Jul 2024 20:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721940905; cv=none; b=JlFLLFEQMHmwITlDl1h6mPgNkoHZQBzHdc+JG1Pyor3/0wcKqFIqCxDW9GRwnR3cxYfkuhdh+xfkEqQIt7/QyFSAf7F0UxCtn+0ewTe9ffhv4bc2OMyeILM8vrFMFQr7IYcz+5VZzOMINjIgw1XQOZlWjvDIHFaV7TJZQG8NFzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721940905; c=relaxed/simple;
	bh=K8LW+NrB2evn6pZc+s4SWid7fRlY31iR/EpkNxYRTlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FB18qKdh4UrQTlAAnZCvgdkcmeachBVCN/01phJNz29eemrRZH1gUKA1cMPBj6Tvm2Tn1ZArz0c0QGhg9mUvjtRQULOQ6drMHFr7CnMxU0OCNmWpFxDgW9OF12L9AclKYBH0u59empqV2MM2TZCQ8LzQpj9/cwQxEA32HXGP7eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aH0aIWpB; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7163489149eso237047a12.1;
        Thu, 25 Jul 2024 13:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721940904; x=1722545704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RLXtc+uqVKCqbWVjFHgQL0L5dVQ3MV0FyYC+mRCNVMM=;
        b=aH0aIWpB9QqAvLfb6XeLooPavajfXQ9/l6YBUc1F6b1i1VnPTWGo0c0mJBFHDV0myx
         zYow25ZhOEw40iI+3ZfvJCYL24Cy/FjjtPlEvkt3nIPFSBG2mUxIYJbtCVhS3CGZSq1o
         TH8agh7eqPH/H+NUmn+6mtabm0IxPej3K1M4fUw4tG6Ufb07VwYigScSraSi9KOLOz1s
         cJCAwi1T6C4R73SwYpbxZKjD7y2ns+JheHFmcaATHm0C4Op5BN6Zto65roTquB7aK+68
         a6KY0XSBBTZ2FoEqHcx4G/4JyEyVjG1leMlY7gQwjabAjHVaNN2va1gnRVCkwo8rZ9jo
         jluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721940904; x=1722545704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLXtc+uqVKCqbWVjFHgQL0L5dVQ3MV0FyYC+mRCNVMM=;
        b=aCxpbyXhOGHGXIpYsoAh/efo043zOcKQm0Sg9G2ffuSrf7cqkSDupcq+ykL0BKJFE1
         6NoEqbrsNyxHB/HAgWzgfvQFGwXsgW32YCeypJ4NQByxwENhU0j7xQ0/ciPK1DcYnUzt
         8o5fWYJFld78b4gQfTTRIWi7LfXgT0gAtq7MDI92HSUGhcvOSdcUmvqs/4gLFk6iMjUr
         MMm6xWwadEfwVKsBP6nJ4r5BJZqYsKW6rdAqOuj6cyzByjJm8rPSuQdIxjtvucRZs6uB
         WEKg1cWMPUUQ6VNJGzz8Z/DpywyTUhrKflVnioVE3KBFg1LZfhLT3OKdSn2MVYpDjK0p
         HhyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU3SHtZVqobq/pB1HiYo/DOwtApKCUs2FxDbMj7xKi0E3GuRQ5Tn4lE6RqB9iC7UAGbfzdBO02kDVpzfm+HNvigF0t3W7O+pFL2E+Akpt6VHA7czbNC1dSSnscFsij/bqdocEP1c7LV6hoBISGgXLfRCunqz45lEKv1UumpXDMZotvvJxekPZzp5I=
X-Gm-Message-State: AOJu0Yzv1YxzJwWUqd67MH9cE+zg/IhQa/YRZucwQYPghhqUUe3uKrp4
	UmEpbJwB5dDEojzFFudkQQaPnvXt48mpIxlUlXxOa8Wnf7R/YRtGbez37Q==
X-Google-Smtp-Source: AGHT+IHKxZkD2Dnl6gnx/oHiwCu7THwfC9aAMKNgvKqi3mrLM1I5sg/+VSVlf0hbjMuqWY20kh/82A==
X-Received: by 2002:a17:90b:1c86:b0:2cd:49c6:e2d7 with SMTP id 98e67ed59e1d1-2cf2ea26c3dmr3377595a91.19.1721940903545;
        Thu, 25 Jul 2024 13:55:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2c0d:838d:8114:e714])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28c9cef7sm1996489a91.29.2024.07.25.13.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 13:55:03 -0700 (PDT)
Date: Thu, 25 Jul 2024 13:55:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: vipulkumar.samar@st.com, viresh.kumar@linaro.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: spear-keyboard - Switch to
 devm_clk_get_prepared()
Message-ID: <ZqK7pJ3TaqgwVYpE@google.com>
References: <cover.1721939824.git.christophe.jaillet@wanadoo.fr>
 <ea855328eb4396cd1c44d2b6acc1fc394fcb1508.1721939824.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea855328eb4396cd1c44d2b6acc1fc394fcb1508.1721939824.git.christophe.jaillet@wanadoo.fr>

On Thu, Jul 25, 2024 at 10:46:50PM +0200, Christophe JAILLET wrote:
> Use devm_clk_get_prepared() in order to remove a clk_unprepare() in an
> error handling path of the probe and completely remove the .remove()
> function.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Please refresh after dropping the 1st patch and resend. You may remove
the call to input_unregister_device() in the context of this change as
without explicit call to clk_unprepare() on removal we can fully rely on
devm for cleaning up.

Thanks.

-- 
Dmitry

