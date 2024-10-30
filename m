Return-Path: <linux-input+bounces-7784-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEEA9B7007
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 23:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 834E5282FE1
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 22:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6247D213EF6;
	Wed, 30 Oct 2024 22:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUvC7UIQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954441E377F;
	Wed, 30 Oct 2024 22:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730328707; cv=none; b=rSWTpglHdyqdpsM7QkrQR1IUik6LLQuYBuizR2J7m1htERQ+D3l8WLid3HPFphSVLb9lUdnV4QI04T7ABOFyX3vtNN4i2lxrdmWdqx9pQUGjbj+4HpHpfrJuklytIrzTEPr54TKctzi65C68yEIHzf+FFL7iupNwyAPYkYTdHrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730328707; c=relaxed/simple;
	bh=nNa3dandOYrQncECAtYJrrGr/qHVyc7Xx9V/xoWKAlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8xR56qxLZLxZjthFduhApesGce5eggP7LaisW3GhBoVIBQJ8CcYGHxXvQ/91GaV57jj0kTZABsuQ6YdwT1CNhCMk0R8Tj+I3xRiOv0uJ5Vemmzp8FcyTADTef9fDyA7oyXOwnnByuGuyXmuFLC89jIuPznKFw3TeLqwmjvUOJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUvC7UIQ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7d916b6a73aso307854a12.1;
        Wed, 30 Oct 2024 15:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730328704; x=1730933504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tZRCk2bBPg/lDFOZ6OFaWGIga5V+/XV5F5FjTujAlwk=;
        b=CUvC7UIQdoOJMG/7ta/mtN6tB3e2Ft2sjpTCkkVwqL4WrmLSHg7YWNgcw4OTwiTF+V
         p9UTfxjWGduhZGU/qZUwaPAq5ZOl+ve30Iu1drlUOLgXItzGzaFQVxjS+Rhr+uv0APGo
         t7k1PD48NszFcqHPUA9X6a3SMmftiRl53LP0qBdhQNNqPp8N+iyu9Vi2XxStg1g4BpWk
         2nMT945Mb1Sx34Jy/ob3Xhex2ev5jhFLJgU+svgVK/at9T/C19umeEzsKsCwbBm9APzv
         DVsc1DvAHQ77we/WzeJ5mUveH/wvUd2sqew+jSk/wpRRYLUXcKKItYd1SOEVu8Gv1p3b
         4NNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730328704; x=1730933504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZRCk2bBPg/lDFOZ6OFaWGIga5V+/XV5F5FjTujAlwk=;
        b=cY/2iJUpRJO2JeW6+NZkS22eIVCPd1dIPQzGl5FHqu4d1Izr0OuEJrHxumCCPNlzaT
         2kQSCTmp1xHnDc4lnuVepVn1Y0MkLmrMPA+hK7ML4fEAMTm8fZ33AVJEhbt30LH6dTmK
         6r7XJx1KSU7GAWC5NgYiwi0ULnDDPRDFiE34QHmo+t0bzG5ncSHPXxmWAvK+U4XcklUK
         P9zvBM89m+dkJ9nO1QIh39aJ7bVvCL0zA/IqUKfu+d0QAinOd3L/VVDqAFgShDYEou9h
         AYb1yOpnS/Y1lVJXqKb4qx8mb4uEGYimKG5OqaInU1kKm1MRiQAvJXF+4Cm7zvA8MMJw
         q1kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd72O8/fcjWgRoeLyY179Uk23rFWZjfpyrxTO2RAtt0B/0S58/Ua2PSeV3o+ZDwryGOSPY88vNYgNgBw==@vger.kernel.org, AJvYcCWKn6HwJaQMKvyiijvs7lRz9U2n3b8Z8b8jK70kZ8StDmqWfjiXaIzWuATZo/xkKc0QBA+ZHX2hYIKbB9Jn@vger.kernel.org
X-Gm-Message-State: AOJu0YwVIo2+bcgOOg1qgHP8ckaSMuYCiJbG2oJalxPGnYExxSOFVwti
	mHR92CqYT9c5M/c5+Ppt1v3LMpoeE22r1MHtXn0EhyVXz3xlDkT+
X-Google-Smtp-Source: AGHT+IH0Epi711Hk2bnt5aad2kBfc6Knhio0ilVwA0BRPkzEM2oMdLy76CjdAKXMBZAJfQd50p5BaQ==
X-Received: by 2002:a05:6a20:b68a:b0:1d9:1784:49f with SMTP id adf61e73a8af0-1d9a8516a38mr20283448637.46.1730328703192;
        Wed, 30 Oct 2024 15:51:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9bd7:a771:2e97:d35c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee455b4cd4sm102265a12.50.2024.10.30.15.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 15:51:42 -0700 (PDT)
Date: Wed, 30 Oct 2024 15:51:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Shivam Chaudhary <cvam0000@gmail.com>
Cc: u.kleine-koenig@pengutronix.de, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Driver:input:misc:drv2667: Fix typo 'contol'
Message-ID: <ZyK4fI4wqZEkbESu@google.com>
References: <20241028204048.128542-1-cvam0000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028204048.128542-1-cvam0000@gmail.com>

Hi Shivam,

On Tue, Oct 29, 2024 at 02:10:48AM +0530, Shivam Chaudhary wrote:
> This patch will fix typo 'contol' to 'control'.

This typo has already been fixed.

Thanks.

-- 
Dmitry

