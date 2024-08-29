Return-Path: <linux-input+bounces-5956-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3F6964EFA
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 21:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C91D283CD2
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 19:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188461BA286;
	Thu, 29 Aug 2024 19:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6DZ7ClO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF771BA265;
	Thu, 29 Aug 2024 19:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724959988; cv=none; b=bE+FmAgwaN435oGI/G4rXcz+x7awd5zz9BeQ3mwOXoMx7IGtkeeDqg4M2AfSJi4cmV1QzUNL9gJiNlHY/uQTrDpOJdppCVLpmWsP8k0iv9Gt6vAjcZztQUX2NLP0jveokcv20wvu4AAmNHXxjJoDsLhW5yMIstDQKN3cMHr2ek0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724959988; c=relaxed/simple;
	bh=GBDDkzUAbVINT6/6B/P9Cmuwkof/oaKjPmszp17nzu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYlml12leXstIzztVk3RCd1MtzUGkPUA0HTVlIDFPyoVvoAPp37LPLcxgzu3GFj9v2zpLHWELbHfpPusAmLPclg+m6t0qRcp5cVPgrPorO4+2Ea5fgMTOFkux1Gpo/i/qq9KvY7tpdz+OySc+OhFX2voYLpbl5hjLqA40MkPxEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6DZ7ClO; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-201df0b2df4so8520015ad.0;
        Thu, 29 Aug 2024 12:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724959986; x=1725564786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qznaN3NEb2ypagTBHgxz8GL17MvrIvhApiAqmnziyQE=;
        b=K6DZ7ClO+a+Ykw4maaXGNuWmhWZcf+x0QAiLYJVyVmhFOPhQKlW7D9MnaXl0x44FLx
         uHAP8G+II/XPZGYh9Op9/yXo6cQG8rEdCl+2LNoUuoyJ0X8yRylIfUw1prSmZNihghjJ
         FCEZ/RBSHKpRcQRhpozyUSotqxM8KlUYtmCu6FgK2WylqnV6thGv8hT6Wc2zlFf/O44V
         uYtmRZ/O4e5ZwXOrRuTj4+1zNUB5L/UbxmRnjLWLNGTu/+1s5WIcxicoQh4aLIYykE75
         uimW7Db5Pk5/QX5vgedmjbrR0WKUrFgx3IjKiFjqJsISlNWEjfhENx7fjyusaf+LWjZt
         gQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724959986; x=1725564786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qznaN3NEb2ypagTBHgxz8GL17MvrIvhApiAqmnziyQE=;
        b=uf72ZRo3jx9kkhn1Fz4xjabbjjhKnmEmG4v0rs67Z2pTElOOfchUfsQa2XkH3pUFkS
         2eB2m+r+cxW+uah60fEKGWh9DizMg6RsfmTNJeUToltPT2jaWn9WbLxBlOM9EzoHGgRQ
         sgDGpNd7wPyyxH45P+V2aRQPImTQjF1EmXCOyCg1wcuxhX95SftTDKIr09Fg06+F+OXg
         IbWDqyygGwYMrx83S++CV9okF3XB7LyS0PhiG/8LlHyzXVvtCYWK//JFy3OjXdM8pr8s
         t14lAx0xjDJmXR4ey5IP79hFl60afN5b5lOys6sNM7eRoCWFAxD3+dRZkfdlhuOoguHS
         09Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUBZJmyYQQZAZgSa60LTnLw8hsOHx4kxOHfju0EX7SdIUAPBk95fVmjgDFl4r387qUktvZkwvgxV32bjAA=@vger.kernel.org, AJvYcCUkP3Q55WXC1s7MA/5NWQuQCXTIRjbJNBxpdtSbbMkHPuHA58o9umlQcgOJDgYtcMLJlGiyv06lRG+ijH1T@vger.kernel.org, AJvYcCW8qjqVY9AVdKOnBJncLAE4LEHL8x1KfPr1pTw3H8T/WD6S6TCJeylRETK+2I4KFURwe1UhSOd6T/L4+4R6HWM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw296Mdbbqv+aEVDjQBAFc63o13/sD1rAfLdaEKynAHrK+PWWqh
	I3nByiNXjYhSxhIhkq+NFYoBqfShKIvzxbuAkwwLC2fPALNenR7wlz4pVw==
X-Google-Smtp-Source: AGHT+IE1kdX42CBXZW6diWJI8a7KvhFx2Ns7jy+M6veQkaePzjYd3D4Pw5DSjFrjzKzuJNZftxdQgA==
X-Received: by 2002:a17:902:f545:b0:1fd:6d6d:68e7 with SMTP id d9443c01a7336-2050c470e3dmr38917455ad.43.1724959985491;
        Thu, 29 Aug 2024 12:33:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ed6:5fae:d35c:9c2d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152d041bsm14971615ad.113.2024.08.29.12.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 12:33:04 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:33:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Charles Wang <charles.goodix@gmail.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 next] HID: hid-goodix: Fix type promotion bug in
 goodix_hid_get_raw_report()
Message-ID: <ZtDM7ozPG9Rbeamb@google.com>
References: <a04cfa63-de06-4d09-af80-a567f2db8f12@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a04cfa63-de06-4d09-af80-a567f2db8f12@stanley.mountain>

On Thu, Aug 29, 2024 at 10:30:39PM +0300, Dan Carpenter wrote:
> The issue is GOODIX_HID_PKG_LEN_SIZE is defined as sizeof(u16) which is
> type size_t.  However, goodix_hid_check_ack_status() returns negative
> error codes or potentially a positive but invalid length which is too
> small.  So when we compare "if ((response_data_len <=
> GOODIX_HID_PKG_LEN_SIZE)" then negative error codes are type promoted to
> size_t and counted as a positive large value and treated as valid.
> 
> It would have been easy enough to add some casting to avoid the type
> promotion, however this patch takes a more thourough approach and moves
> the length check into goodix_hid_check_ack_status().  Now the function
> only return negative error codes or zero on success and the length
> pointer is never set to an invalid length.
> 
> Fixes: 75e16c8ce283 ("HID: hid-goodix: Add Goodix HID-over-SPI driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks Dan!

-- 
Dmitry

