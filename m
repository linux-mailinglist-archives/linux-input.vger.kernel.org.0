Return-Path: <linux-input+bounces-4051-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFE18D882E
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 19:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AF9E28307F
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 17:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62210137925;
	Mon,  3 Jun 2024 17:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ndGzMWND"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3926137924
	for <linux-input@vger.kernel.org>; Mon,  3 Jun 2024 17:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717436684; cv=none; b=XaucI7f18rsLsSxJ0CRjP5QZnOdEr3QApNcvp8AK7IO8rZEuD8HpSULXgPIWzcb9KPQPyZsIzpVs7hiwFKp3Elh+Oaed4UZvjqIBnuAweD8M/ER/bydAdrBBQJINLAw9PXsVQkQRr6bmzLuEPSdM3OlvlgOZySmzEF+/ZTbAykU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717436684; c=relaxed/simple;
	bh=lMtu2JVwA/KSJSy+2YI5/BRZn+6WBrwTivSqrjQEd2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bT/8MzqyEKAcY4wpPu64buw/ZvPOnR2cEWG20UUh8atCr0m882Wws2u6rNSF72hdc9CS7E51o/h9ys1KuTQMSQhvzJBpRvT5f/MJBy0cnoel4JuFEf1Q48CqRwGxi9w9Y6vuAEQuVISHB/mokVS5uHzwpxcXnp/PcKtFLgR59v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ndGzMWND; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2c2039db0c6so1357356a91.1
        for <linux-input@vger.kernel.org>; Mon, 03 Jun 2024 10:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717436682; x=1718041482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hDmbdgIwGf7VK0RE6sWxTQXGMlm7P9+5mFrjuloEf4=;
        b=ndGzMWNDwKhkKQeEg1tExKqT0EscxtHVASexA04yB8AHPIKKqaLRq8Q9OIm7cf7XM4
         Q2ApGKHZAUeUidRxfPEYqlnAmV0jynBzu7yEwmd7RKHaNVqIVeoCVGpWyrv0JjX5KXSZ
         REzUudcwY4hdZvtlo2o9x50NX1fc3vpX3yPx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717436682; x=1718041482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hDmbdgIwGf7VK0RE6sWxTQXGMlm7P9+5mFrjuloEf4=;
        b=qxZMeaV64LL8lXcvNr35JkF/QlfX+BJj8EuKAbIzihVBO9c2k5KmjIN6fApKi17o5q
         E+IACiSUvNrHnRnXPjLRyeUmYYsk0AAu917g4g77pjDcRtwdDrdp46aUsM62SMNG9713
         xXhw5PcZbLiyjyAfdLhWWucNZ3py7V2EpwaUS/sd6FdIfMsJGbs8dAs/xRIcy1AWEVgM
         C63T8+Fz5DfusI27xaUAiufQkKnq+/TG0jguIOolqewwC4oWejYfMNoB2m12qPL+Ai3Z
         rYTs7lJgFDE5NSR3icDaekrBWbcRVNA0yxpE9OY2Kcnpcm241TdMnm6xgivRnIKclOkW
         STdw==
X-Forwarded-Encrypted: i=1; AJvYcCUqfXvVNm6BWmZqxoWysq4yOeDMvFhG5Y1uHEgSvYpI5x4Eb2XpG4x9BSNmbeLBwD9M1t7VGKOzNO7ago+J7Gh8l2khmGJmwMl8aiM=
X-Gm-Message-State: AOJu0Yx2AaWTiAfQtD4e5TIxtxGwI+2ud4aA8RiMhnZyNTuo/sa3W+i6
	/KyhQeDwquQl1HZjZOkGH0LgpiAPQVa7sGslr6wse6eO/JIMX/JR1+ugXDpXiQ==
X-Google-Smtp-Source: AGHT+IFY7pRQP1/kTe8bbV1LTIsRlYPREIpcfS7ZIYolLgFbM/fKqMEjZ/GXJl0BCo3kppn2h6IUxg==
X-Received: by 2002:a17:90a:a881:b0:2bd:b302:95d9 with SMTP id 98e67ed59e1d1-2c252fb2194mr489216a91.0.1717436681776;
        Mon, 03 Jun 2024 10:44:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:200:1da0:8d46:6853:fe12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a777f7d8sm8249050a91.31.2024.06.03.10.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 10:44:41 -0700 (PDT)
Date: Mon, 3 Jun 2024 10:44:39 -0700
From: Aseda Aboagye <aaboagye@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/2] input: Add support for "Do Not Disturb"
Message-ID: <Zl4BBz4Doo8krta_@google.com>
References: <ZldxNQGXy4zWVPu1@google.com>
 <ZldzsCybMzSWnZaQ@google.com>
 <Zljhp-u-s-RPPXDj@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zljhp-u-s-RPPXDj@google.com>


> >  #define KEY_ACCESSIBILITY              0x24e   /* Toggles the system bound accessibility UI/command (HUTRR116) */
> > +#define KEY_DO_NOT_DISTURB             0x24f   /* Toggles the system-wide "Do Not Disturb" control (HUTRR94)*/
> 
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Feel free to merge through HID tree.

Thank you for the review!

-- 
Aseda Aboagye

