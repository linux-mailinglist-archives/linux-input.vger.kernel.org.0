Return-Path: <linux-input+bounces-10314-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CC9A434E9
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5384617A448
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991242566F1;
	Tue, 25 Feb 2025 06:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8h69YGi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31069254B18;
	Tue, 25 Feb 2025 06:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740463614; cv=none; b=RI8LK6ddrqZ/lhelHd+zfS6Z6GP0FRjLcPJy9ECOSoaXQGsfysZhz/UwO9wLQWhPuU3G5IPumJL1cNF5j4chIv7v3Xc8ySko34dY6MGYSTD7UVDTDrL24+J9s0ydf6Zuulxyv+QP92scbR12Is/rtE1cmVB/PRCg4bY8sGNm9cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740463614; c=relaxed/simple;
	bh=fU1fqUnYw2h+EOVeTywhFqS4gkbUcn4MgBI6LtkruSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnA1jzLEUsrd+89xC7iJoAza9IppN8OuagZzM5Nn8ayg0S0sUi5oG8dX9Xpxg0L6G+7VjS1+JIRw8udMJMpSBAyOpWo6ut816e/LG2w5puYwgax7z2p8DMuzLCjCjkKLjGE1wlz6ZhxkIYNCkkh+RPZnPujQfNctaksh3M7/h8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8h69YGi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22128b7d587so100318525ad.3;
        Mon, 24 Feb 2025 22:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740463612; x=1741068412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qpLbYY3a8G6+noHchTGji9pm7nDKnaJPinYLsobaH7c=;
        b=d8h69YGidtPoI2dwxdugtE6TZ2UemnxQxtPpTxsLYsED8bAp/ZdL3TG1uIOSeYfstF
         HOGadKv1Cfp5bW6bfZ3e//bwsAaaALjfvZ2f3fbpbv4KXIzaCYtdvfaW3iUjGvJv54u4
         QmX+Oc8U/ObVPrsVS7ClV4iNlW6eAGB35b6CrljrXlu4kLpcheYZlUzyM165tl8bjF0J
         mWxo9rh8b4aJU7/U1YTAgu59yY6xTv3e4YKlNcHcqqCfM08gZm4d6p74Qhhamgr/Hhxf
         O7TKC4foNmyf12rZAGatUqJilQ1Mq1UB6x/PAPeu9OHTkR0sAXQf3E4aP25F91v5FJ12
         oAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740463612; x=1741068412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpLbYY3a8G6+noHchTGji9pm7nDKnaJPinYLsobaH7c=;
        b=jHFMP3fZSofQudrgFIwfyA3i5Ixa0uabsvCZNn/KEantqFLsM80e3IZrvYXKnPB+uK
         lnlhiIxteEJAXQGRjBAUpBwL5PyF76c3dNUkqYy/o5nOmJk2YsTypzaENLkVXYcAfLve
         tR+2ukJ2mqsrBMtp7iv8Msvj8mSdSwAj4Y39Tp5OQUb7keeusrOJQ4JJHIIn59HYfI5M
         XOdM7bJuJSv8IoSAAcEgLFOciI+qD9/CcfAqdUWAYqgsVyUdapHhG/aMx/2MCqdIsDNq
         TO3Zmad21kjLCI46w2PA9xvSthuHSPwteRAGdo5LhtFvDr6W/TOxAp8fg9YT90iUEW/A
         27ig==
X-Forwarded-Encrypted: i=1; AJvYcCUGLYZ9eU71tFA95B3u9LsWirGyj/IZH4XaWSg2wDCiXkMvMNdCSomiIISX2Ou8A63zGTfxJ0YE/bWWOX0=@vger.kernel.org, AJvYcCWNWTPm5HXKugXocVsH0Cfu67EY2o/cws84FkcCoc1E9twZtO0EkcAcJPBLpOTlyhdExXj9XwWdAi7jCQ==@vger.kernel.org, AJvYcCX+D4q1oqbA/3eiYJ72WPP7KSxQMjDtDbHXDxWRzESyZcJtcmx5E1khfzmi87kxTvuMpHYWRPNVHDPu+oEO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+WahWGGVIOoAW/t3lGD8MTJSVpUL/qzJmAuceE+hgA1/B87x2
	vV5QvnkGoBZqtc39DlkX5EqYGEk/vDgEa7YzaNukt+YHqJJVUogk
X-Gm-Gg: ASbGncvq+wleOwPZbdeg1A9NQSVy1OvrhwDpx8evu6i1cz6WO7qV+Lrk9BbIwdudeTw
	8K8QpibtZlXuQU/DVbyG9NABH8zkxHBpbGqFQpteF47q8JmyPhuKDGYsdshl9Y9+i/O+eGUW7+5
	wtw0rWc7bcALGOM/6wnvXkrOWWo0atNbJVFFm8QnSQ2i75yZPY02KDgwBRMjJANkYdcxfLiilfr
	u3FITWOsEHsX++TdjSdInSxRFTW+k0DeXY7/CEpcgaWseK/4pw/4XolY9oTetw4N2hBLWb0YGlT
	1K440GIHSe41feTZuTyE73901bE=
X-Google-Smtp-Source: AGHT+IEaNuk7hgbrxOieRM9csy171AjtxJkiET5sWOVsdbQD7Gu7W6CKINnNRbiZrXi6/5JgfJzDKA==
X-Received: by 2002:a05:6a00:4649:b0:730:9567:c3d4 with SMTP id d2e1a72fcca58-73426c8d910mr29554264b3a.3.1740463612112;
        Mon, 24 Feb 2025 22:06:52 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6fa079sm681486b3a.58.2025.02.24.22.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:06:51 -0800 (PST)
Date: Mon, 24 Feb 2025 22:06:49 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andras Sebok <sebokandris2009@gmail.com>
Cc: markuss.broks@gmail.com, linux-input@vger.kernel.org,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] input/touchscreen: imagis: document ist3038h
Message-ID: <Z71d-YFUTkJZ4fp7@google.com>
References: <20250224090354.102903-2-sebokandris2009@gmail.com>
 <20250224090354.102903-4-sebokandris2009@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224090354.102903-4-sebokandris2009@gmail.com>

On Mon, Feb 24, 2025 at 10:03:56AM +0100, Andras Sebok wrote:
> Signed-off-by: Andras Sebok <sebokandris2009@gmail.com>

Applied after updating commit description, thank you.

-- 
Dmitry

