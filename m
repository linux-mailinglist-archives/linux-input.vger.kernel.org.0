Return-Path: <linux-input+bounces-7027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB7C98DE37
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 17:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 082A51C22603
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 15:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2B01EEE6;
	Wed,  2 Oct 2024 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3zrXAeL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CF51CFEA3
	for <linux-input@vger.kernel.org>; Wed,  2 Oct 2024 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727881266; cv=none; b=N1+uM/wmtE0l9jQCd7aJROBEyg9J8qob/JxzTxluBoiDpwhaJD6ONAkO5Egni/zQ9/Wl6dGNLJ66sRLyRJMPljkJZIudsB5qZQIMQatn5C+EN9s37aNmHmH9Ihmq0Muknzv2IdDMFBK5+G/EEKzZWT+WIFM72xf2NXQXU4m3S8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727881266; c=relaxed/simple;
	bh=foKJsVhsLFSe13e9Hj6zGnUMfutKaWF4+o8DsRaI4pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVuDplZ9bRyrXi2jPUILGZIhxvBgL1+AnsxzS3kMvuG2PoBaC1j/efbLlCHVW6U6yRqBMr+1Op9/C4cOKlp7gkjQdvOmZcmLTX90xbzHst4/YdqQ7shZE9+Cpo5IMrWDxUI1TRWfcbRPhiUkKwfMc6sOiSyGMhDc1rKlZX0SxVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3zrXAeL; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71b0722f221so5286638b3a.3
        for <linux-input@vger.kernel.org>; Wed, 02 Oct 2024 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727881264; x=1728486064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=++j9KGTQlrzeQXPbJzxyJWHX2BW0Ud7UKGN/yNTyslQ=;
        b=P3zrXAeLVofAEBV2o3Se/6NLsClCsUIg5nR9bBCjzJEdnBrnO2PriPp4jrqlR+5d6W
         b9Ld3FirF9/E7ws5v27hcv3xRNBcLtOY5RkRK9EU28l2/7T0xIdgvljc1UJ2pYNx2xDE
         +xQGi0htiQh1m/SZoIqpaGl3vYuJLZyRzU3rrcLjNL5iXe+okW/vlV238TqMSQSfTv4b
         MNBB4xQBDpl9N0mlIYQWwIW535D9QEe7FUCXBzcCeOq5zk4X5nYeTfry5Y/mcGvjApbi
         YCLkG3o+ViCgFZHihpTbi1ic+7Uv/QOhWIHbDSYFB1bR3PyfBwxpwne0tPPGNqrYG6cV
         In0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727881264; x=1728486064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++j9KGTQlrzeQXPbJzxyJWHX2BW0Ud7UKGN/yNTyslQ=;
        b=kEgXuQz8OA+4rBk03BfnmKX5D8ilLIdLsi7TXRRB6xRw1jlgOfaPIOquCQ6IDyMJgs
         mtEiBH85wIpQS34W9UTSOquc1Dg01fS4JikoKAR3pVhSf4PLIZra0sLEeKfPscIz613K
         pQeU05ZTdLdSpC+X8Idoa5eCBTn44EpFJGrT+aoxfDDGZ1qSPG9OGrC39JvpsTateqYx
         M6SEufphGluSL9IPHfGZvWY6PpPel+O9u7I032qw92JfvHtM1A+tuvZLEjEv2F3CgBOs
         dHPjdORHMaoSoHsjcd+i5OVSCqF6TIMWzpxP4L5ujLzxx2zDQjm274cggkdsrZpiKb6i
         Su8A==
X-Gm-Message-State: AOJu0YxzsBI3A/yNUImCm4cOu2e9nEQrzTzcDA7UxW7en8ab5Q6vZro1
	qEwiKYJOL021ugXNepIBeP2/Lu3jnBFefbhgmplzDYQxqm18x0FT
X-Google-Smtp-Source: AGHT+IHhFKqmBcyOMhPzUBzAQ2HYIyShVdaaD5oY4jt95MTYzKY1WVJX75uIYKUUhUjCrJ7R05PNCw==
X-Received: by 2002:a05:6a00:1490:b0:714:1e28:da95 with SMTP id d2e1a72fcca58-71dc5c7847emr5410254b3a.7.1727881262648;
        Wed, 02 Oct 2024 08:01:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:59b3:a140:3cbe:62fc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26515e40sm9950213b3a.117.2024.10.02.08.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 08:01:02 -0700 (PDT)
Date: Wed, 2 Oct 2024 08:00:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aseda Aboagye <aaboagye@chromium.org>
Cc: linux-input@vger.kernel.org
Subject: Re: hid-input.c && vendor defined usage pages
Message-ID: <Zv1gKyTELpTngKIq@google.com>
References: <ZvNaHt7ePvoUpgy8@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvNaHt7ePvoUpgy8@google.com>

Hi Aseda,

On Tue, Sep 24, 2024 at 07:32:30PM -0500, Aseda Aboagye wrote:
> Perhaps this is a naive question, but why does `hidinput_configure_usage()` in
> `hid-input.c` configure vendor defined usage pages? In actuality, it seems like
> it's mainly handling some HP specific usage pages.  Why aren't those in some
> `hid-hp.c` file that's selected by a kernel config?

It is simply a historic artefact. These usages were mapped way before we
had HID sub-drivers and accompanying infrastructure.

Thanks.

-- 
Dmitry

