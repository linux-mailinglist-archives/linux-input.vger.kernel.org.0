Return-Path: <linux-input+bounces-3824-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B15BB8CE7A7
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 17:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39929B21274
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 15:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7DC12C473;
	Fri, 24 May 2024 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SP9oAVGY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20512EC7;
	Fri, 24 May 2024 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716563937; cv=none; b=YHfrLjWxtcrp4d96lMJmm2ZaKoxs/wzii6lv8D94F7btA+JiqDN/YN/o6mCDM6Tu6zDvdWzibQWxI5hHNoxIfSE0g1TulhB0/vhtBHHumSPHJdl6nuPYboH/qinuL/gmy1kW9k7RF/Ezr48Ob/Zh4mfScYtITlszQ1QLBBhsyio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716563937; c=relaxed/simple;
	bh=B6k6qQCQ7RE6o43aRIRTqfgkU/0aOiJtLBaWr+pByx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRCU2xnqs3LC88/4W401sDyBqPWfCk3FvsiOttiH1j/+PfXi1Et4ITWfrDC4Yb/FJSaND9fjze/SnWe3jjP2s+ZDuK2gF5bwiJRPxdlVLpiu7c7+G44V11hoadJO9+8RS6cSXOt1jEjYm6TzMLlH4K1NJReaACr2nI0fNOCzl4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SP9oAVGY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f33d84eaefso15446265ad.3;
        Fri, 24 May 2024 08:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716563935; x=1717168735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSu9rEKkZeH5NZDPLkhnan7YnKsRldyiLYfLLtz2DGs=;
        b=SP9oAVGYdjH4qJqP+TPqHY6PbAY0C+m3ywwR4cEb81gGc1EmsV9fi6NzTGQwNoSIuU
         79CxNTo2UgWcZCFOz3pxsqMM//f4wznu0EavB5dI8JByXjPTvDAbAstVfcU4cpWady8i
         Xbz/GjHfecbETSFCiA6TVs96WCic+eiduraVIy5n66mIvj9YvU0ikvYeDp6eGqx4ysLT
         mj3anmT2BRzmN62OSc8IFeeJ0DCBry0w21MQYInxNNH/0PeUvBQ4ePYxup2+L0tTVkaO
         tWNk58Z2zb357VfMx6VKyTA24WPyt5Io6fx0i78LlRwYfvauWpaVDizd5uyw+ascGCIG
         HoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716563935; x=1717168735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSu9rEKkZeH5NZDPLkhnan7YnKsRldyiLYfLLtz2DGs=;
        b=kUN1xRRe/AWrmKnVon2c6izU9j/7b57sLvcBsouUpjLKLgMwBoCLEHqQuL00HsULLR
         ZMnvHeJ8ENAqIKMSyCKbHAzjbXivi+XoS2f+F+3DH7N4Fo6ys8gto2HV3F1ScHkMz6gL
         E4Olsk4DRnqGai8a96oeVMg+As7WQ/S/c2zKWL1PQGnkxQZN3RzKODmbL2VTEEW0Ny24
         hXGEmjpQV6lj4Jb+Cg2vHOWmCICT5fh3hnuyyvT2HXq5lQMfCjM5SYEWdMOFVa7OAxus
         9v/KZ0FeFRawFwZZR91myxvbZHGVSDqinzxnNC7J+DKh8xCG7NN3OQbre/0Zi/MfpbnZ
         Peyg==
X-Forwarded-Encrypted: i=1; AJvYcCWbm0bXKgL2xG2flzkNile21tBRD3TAdQ5x3zq7DKPhlUnays1TWe9MPV4ENW5BI4vjb7rKsdaR2+8BsrbZD2pmoPEcQA/uqD2UHsE=
X-Gm-Message-State: AOJu0YxCajQwW3p2MCT0CKeCVj4wm5Y0H/Dc6FNWD/Hq+akj/rd0zwoL
	zRFyXeiZvm6lzILZiKxFZdImbHCsNKhh1bDZvDbCaCb9H87cyerzF+8A0w==
X-Google-Smtp-Source: AGHT+IEypr2Cl2lAvLN7gQaw1mI8Y04OYt5QYfEGA4V1Xu00CQVTm6eqWzP7bf3iITw1S9ACYDUU+A==
X-Received: by 2002:a17:902:c944:b0:1f3:2874:d4e with SMTP id d9443c01a7336-1f4486c65f1mr38650045ad.7.1716563935379;
        Fri, 24 May 2024 08:18:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a2db:c673:b8d1:3097])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c75dea9sm15477445ad.11.2024.05.24.08.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 08:18:54 -0700 (PDT)
Date: Fri, 24 May 2024 08:18:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [git pull] Input updates for v6.10-rc0
Message-ID: <ZlCv3HNhfcaEYjHf@google.com>
References: <Zk_rXBV8E8Hwu04W@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zk_rXBV8E8Hwu04W@google.com>

On Thu, May 23, 2024 at 06:20:28PM -0700, Dmitry Torokhov wrote:
> Hi Linus,
> 
> Please pull from:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.10-rc0

Oops, forgot to push the tag, sorry about it. Should be there now.

Thanks.

-- 
Dmitry

