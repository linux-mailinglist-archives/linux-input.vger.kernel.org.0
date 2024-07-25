Return-Path: <linux-input+bounces-5164-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 479DD93CA5C
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 23:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4A961F226A5
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 21:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F31413D51B;
	Thu, 25 Jul 2024 21:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsvO6bot"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D066D299;
	Thu, 25 Jul 2024 21:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721944552; cv=none; b=LYuqYn80urQJ70XJXWjW91aG4WHr0WyfiQ1mSKyCfUTL3Sok+ICMUNkoiLys3JseNGeJMdiOPGx0yDp/A4zzY79iIdWKrya1q+TkTV8fGQKTmxkko09MGPUy2tJyuo83rT+7XHJYKPSKFcE5dWd47MSWEejGotqx1AZZgQ9arKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721944552; c=relaxed/simple;
	bh=f/y/eQdO+nZNsf79eD0MTTu44yx0PRUxwcM7ov7dwQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0Q1RYV1alFGXNGFzkbSMXm5RStl9uwwoZio4idtfXyCvMNRTC2HzgnbHwU6zCJnPO7VaPxpkNKc67xK+lBc674nov3fzh9gecwLkxylJKv/5TvQ/A+RhoevBOfgVDXyQvJel00+ope+k5neAsuUjjg8WPtG5Tre/eBQRdgBNWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsvO6bot; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-267b7ef154aso382386fac.0;
        Thu, 25 Jul 2024 14:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721944550; x=1722549350; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tyKmzVZHG6xXf2tfTNoOwez/koflQnQIOHNmdJNoBVw=;
        b=hsvO6botmvyRH7yCYFpsycFZN90AK6QU4GyqGdaRCd8157YN2MSpSh2Zd8GdqPowzW
         +6FBA42T4bFwsdG85TLabKIYgMVqqWec6EgOzxvgJVR+UC1GUW33afC/SZVeeocqFNqw
         I4Gz2U1geR/H1OOmnGC93Cobe2VQQo5YcQWnvAIxOqD/78aj4VXTFP9mu/CuMVY7e+jk
         wWA8aBpOE4YTCfnef3FtgHhgupv9WPFGUCaMTBv8Y2uUFg6X/ugJ7DB8vRgZyJimseXf
         eOwr5lNJUf2GB3wqk6sVN3zzac9pjCU56zqLzG8/vS9cNJzo7/A5BfJlkwxvrV17fQmr
         MimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721944550; x=1722549350;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tyKmzVZHG6xXf2tfTNoOwez/koflQnQIOHNmdJNoBVw=;
        b=MHOv/EFwyOs4yGiWw41/XENk74FsYm26aTP4kVGO7ow5VcmdUQPyyWUUVBr1h98mr+
         P+JsukpL3l5V9anBfuTbaI5ry0OvuRX7Okr6tACv9zNDUgO0VPYEVly88PqDj/QmIvnL
         rkdaFAmY4VPDDDWxhGr2Lq1lbCsBA5/uB8wpVZ6tRoHDs8rE4k7gFXYN5EFbLDdkTB/t
         1kzTjFPhUBEC74Bbd8ZwD3eGmtfeqwr/9aabaaof5FIJl9bzpBcytU84l+5PudQEpzgl
         lO0XKCOtfQ3cce+4Xe1Wu+Qti3nNMdXflgTy23nZXNbAzuGlm/gfhyTLeRIgkpY6Ngjq
         B67A==
X-Forwarded-Encrypted: i=1; AJvYcCWnVHIG0YQmaccQjOQqNbk50iRJFfxPK8AussF/4TgNK92Hvg3MWW6k638f/aN3U3/MupXtYLn08AXsBOLR1o74b5yTqeNMH17BGSrLQ661iriaiE3C/nJKkUEGgN3YStnbR4qtNsjkYaxi1bKyBCpoz3SwWID3UHcIIVP658W+RA59aiDQOHS6LBU=
X-Gm-Message-State: AOJu0YxvSq6XtDNER5Qu9rriDTRoSElacnBJt3LIbEHy2lq1VBGOL+ty
	QMB+oHWzds7exvgmqgNnL6AS9HBKxiZb4h1SJPGNajaSPO2tBZu5
X-Google-Smtp-Source: AGHT+IHvK/U5eN1rm/XknTUDFUH2U4SSW9uh7q0CqsaHxB7a/uis94oIqF2KC6MiPb232MxB5DBUzg==
X-Received: by 2002:a05:6870:d60b:b0:25e:b5ed:998 with SMTP id 586e51a60fabf-264a0baca7emr4830850fac.5.1721944550013;
        Thu, 25 Jul 2024 14:55:50 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2c0d:838d:8114:e714])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead88d9efsm1566349b3a.180.2024.07.25.14.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 14:55:49 -0700 (PDT)
Date: Thu, 25 Jul 2024 14:55:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: vipulkumar.samar@st.com, viresh.kumar@linaro.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: spear-keyboard - Fix a double put in
 spear_kbd_remove()
Message-ID: <ZqLJ4mZaKgzPVMFb@google.com>
References: <cover.1721939824.git.christophe.jaillet@wanadoo.fr>
 <a39197be6248ebe5385e4f352241b4ba5e857c42.1721939824.git.christophe.jaillet@wanadoo.fr>
 <ZqK7HQMtV8oavTsM@google.com>
 <0e4f8499-97b1-49a7-b5af-11203cf625d7@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e4f8499-97b1-49a7-b5af-11203cf625d7@wanadoo.fr>

On Thu, Jul 25, 2024 at 11:34:14PM +0200, Christophe JAILLET wrote:
> Le 25/07/2024 à 22:52, Dmitry Torokhov a écrit :
> > Hi Christophe,
> > 
> > On Thu, Jul 25, 2024 at 10:46:49PM +0200, Christophe JAILLET wrote:
> > > The 'input_dev' is a managed resource allocated with
> > > devm_input_allocate_device(), so there is no need to call
> > > input_unregister_device() in the remove function.
> > > 
> > > In fact, this call was correctly removed in commit 6102752eb354 ("Input:
> > > spear-keyboard - switch to using managed resources"), but silently
> > > re-introduced later in the commit in Fixes.
> > 
> > This change is incorrect as it leads to an active and enabled clock
> > being unprepared to early. We need to unregister input device which in
> > turn will call spear_kbd_close() if needed which will disable the clock
> > in question. Only after that we can unprepare it.
> > 
> > There is also no double put as input core will recognize that input
> > device was unregistered explicitly and will not attempt to unregister it
> > 2nd time through devm:
> 
> Got it.
> 
> Thanks for the review and the detailed explanation.
> Sorry for the noise.
> 
> I'll resend as asked in patch 2/2, if saving some lines of code makes enough
> sense for you.
> But as said in the cover letter, if there is no issue, I'm not sure it worth
> the time for an old driver.

I generally like infrastructure cleanups, unless it is too much trouble.

Thanks.

-- 
Dmitry

