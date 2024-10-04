Return-Path: <linux-input+bounces-7077-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D05D1990494
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 15:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D0E11F22916
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 13:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0893F212EE1;
	Fri,  4 Oct 2024 13:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WV4vQLOO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E215B97E;
	Fri,  4 Oct 2024 13:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049086; cv=none; b=bvE1GgZDIwfziq6g9cZM1/FwEzQhDXdD3AS3ASIOEbx9FwLN4SNjB4gMYa5u5U6mC54VhvkDZ0ENVrtejJTtZGkydfsJp2NaE3FGv0txMy1dt8mHAxSZegCFblD/bO77xuQp77RVopSDOBxF9clweegvofg4jVVKg4j9qx3MMyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049086; c=relaxed/simple;
	bh=mVBO5k105eWD0yEN7U6lJL6b+1SCBIusfw11IwgJtPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIPnIM7hW77QmCkiyMIVxl6gqphv43vbNVjBPWWsP6XzFB8KI3DQuYeG05HqTpH4l8CGdwRkF8ECSHyg7ofRU7P/pp0dOcsojAvRwbiL/QqFZL9PVZ1HorIm8g9W3iKE1/zzlGoDVwRjwjIQtly3jUCa1JHGkOMeCsMEpZK1RCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WV4vQLOO; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71dea49e808so480667b3a.1;
        Fri, 04 Oct 2024 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728049085; x=1728653885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TVLq22bs+1l9xY9JOZ8imSDy5KmOLVk2kQhCSbpcWNE=;
        b=WV4vQLOOWUtxnVRWvgQe+/5Mn44GrJebxYIjZhAd4TdM+3ngkhCghXZbF01rxeI0DY
         orEoJf7ephi2DH7zeiavAcq/rFfETbKHHNTV+qtixEh0VZBpClCtgUwHtT7mcQZgWubk
         6LARIch/Qbp0Ox4O8IFOswNotjHHYwUZF9NUMwsyhxYWqxwJYmubywIKCp3F814KaVjq
         zleMSz6K3Dm7SsXh+3AawPCwFSFQR+zrTMXIAzrmMkGcc7z7+wIW4FTHR59VYB5LL5GE
         2H9alEWEFVGP2btHSF8k4p9mil2S9z4rpieNuwrUmWBxxrNXgKjPgV6BUX3/u2Iqz08q
         zDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728049085; x=1728653885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVLq22bs+1l9xY9JOZ8imSDy5KmOLVk2kQhCSbpcWNE=;
        b=J+eRbU/FQlQH8myjPOpKmsU2G774ewA5N7L0UTJC74rda+BClJycrmL+t4Vo/WkDlz
         8bc+c7IZDfNQanyamLqwMC3D+/y5rhoMDHM3pMYbkRclvxU4nTELr3VlNtbnk7K8L+5U
         yA/ENawAYqqe9LwDuk0XyLtR89bxjkVKmhqcXCx2671fiLXk8jtXfQoaXRbGlb+xzXd+
         ca14oStDmQrPrgpBSW4DtXXZwGXxtyG451VPTOGfKDdV4rWp+C7W2AJ88RbjZMA6UGJY
         oNjgx0coR1RL4/LxT6AnXe3nfpGBr5iCv0hdYJjMvHsdQcatG2w1UYXKNn0vk3wbM8sR
         q5gA==
X-Forwarded-Encrypted: i=1; AJvYcCUKORlfR47rSn7fKoQ7dVP/cDy6lYgidfgBfA+DAkjU9klwrmXPqoMLETwqC2gIk2JY6qRtqbq1R9bnKlZnKy+OIsc=@vger.kernel.org, AJvYcCWJ5SS/n1cB03HNWnFNfNQA8snz4MtavwyzKK+EVg42VhdJ9+WtUhK2q2R2m7FzLiQQagl7Yg682oOg@vger.kernel.org, AJvYcCX4vVNTphmVXkFZdmOZk/+xDZ74Q/c+oWD4MkuNZVDtYo5ZuX7LImcwXjRO0JvB7p+LOJLhOoqgQ9c7vvGv@vger.kernel.org, AJvYcCXQniSoFx4uFCJmKeIwTvmSOKFLV07zyM7kptqVJemTo9PtWRiP3vexdvZdCFdnElbZO4z7TZPnf+NMHjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl8eGKrC+n/sX2T8s6j9EtvGbHDbN0nZxPEo8JlLmfUggWYhBp
	ft3bB772+hLmg8v4hLL221OBjcFYxHQn5v5MJ1l3XBH3usQGipXj
X-Google-Smtp-Source: AGHT+IGhEdASi+MxAhYr/5O4xJ1vTIjCaytgyNSnCaXtwTaIfB45CRoPQcP/88bkABWIesSJDpwwIg==
X-Received: by 2002:a05:6a21:9204:b0:1d3:b38:891 with SMTP id adf61e73a8af0-1d6dfa22f7cmr5043217637.6.1728049084632;
        Fri, 04 Oct 2024 06:38:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1b2:add:2542:c298])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9def6ddsm3181637b3a.154.2024.10.04.06.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 06:38:04 -0700 (PDT)
Date: Fri, 4 Oct 2024 06:38:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 00/14] Remove support for platform data from samsung
 keypad
Message-ID: <Zv_vuSrJzpN9IvXV@google.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <803e3902-cec9-49ed-baff-d26e578a8ab7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <803e3902-cec9-49ed-baff-d26e578a8ab7@app.fastmail.com>

On Mon, Aug 19, 2024 at 11:40:56AM +0200, Arnd Bergmann wrote:
> On Mon, Aug 19, 2024, at 06:57, Dmitry Torokhov wrote:
> >
> > This series attempts to rework samsumg=keypad driver to stop using
> > platform data and instead rely on generic device properties only.
> >
> > The first 8 patches are general cleanup/facelift patches.
> >
> > The 9th patch introduces alternative binding that is more compact that
> > the original one, which makes it more suitable for use in legacy (non
> > DT) boards with static device properties. Note that the "new" binding is
> > the standard binding for matrix keypads.
> >
> > Patch #10 implements the new binding in the driver, #11 converts the
> > only user of platform data in the mainline tree to the static device
> > properties, and #12 drops support for platform data from the driver.
> >
> > Patches #13 and #14 are "bonus" converting the rest of crag6410 to use
> > software nodes/properties to describe GPIO keys, LEDs and other
> > peripherals. Note that I believe they fix and issue with recent
> > conversion to GPIO lookup tables - the names of gpiochip structures I
> > think are "GP<N>" ("GPK", "GPL", etc) and not "GPIO<N>".
> 
> I had a (brief) look at the patches, everything looks fine to
> me, thanks for working on this! Let's see what Mark and 
> Krzysztof think.

Mark, were you able to give this a spin? Or should I address the DT
binding comments from Krzysztof and Connor and resent for merge?

Thanks.

-- 
Dmitry

