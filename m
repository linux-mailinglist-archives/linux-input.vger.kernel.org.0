Return-Path: <linux-input+bounces-10323-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7371A43554
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69673189F9CD
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D4F256C80;
	Tue, 25 Feb 2025 06:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCGSSmlA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB7C2561CF;
	Tue, 25 Feb 2025 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740465141; cv=none; b=r0p4NvLm5uwsR5CRygp+b+XB1ln52nuxXW3OtOtma58R8ulGoISoVDzz+FlYj+xGN8/9WlJ9Np53/dIs8egs2hcfLem6XSgwR3/nTNYUQ/r7jSNSXEYmEfO8tkQIEJ4NM+CFjCfC1FevsoOATkgM1ChUHNg2CFYpa136NbeR8wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740465141; c=relaxed/simple;
	bh=Ixb5GZ5cdWjJVoOokMBuLrjgI6hdI2e4FqxS9K+SeFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qjd1KmXW0v1gvTmWRCd+/ayl1qcOKVZwK3D2y6BbH4mzti4vHUMmlgDktqHwzBQdULkJSFHYFBk7soMQG/SRAB9+vqtpQp5e8cavGW9000mxkalHS6HESNkajwDCNjk/I/xHKMzPXwMcsMg/4/xh88IYHd0UStpXay9lZTZw1tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCGSSmlA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22185cddbffso105157455ad.1;
        Mon, 24 Feb 2025 22:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740465139; x=1741069939; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QsE8G0C7eTphuL+cZfC+hk5nly7dBgVS5yTFRbduWdk=;
        b=BCGSSmlAqGgTEfD79dOY2oLnbxTjwjGPRws8OhjIXStd+/8XhuH4AUE8P6fLu2Qe66
         oczIuokb+5+yuqLYM4QCIml/Xrd9kNJ47kAFwfdWOymUD58398JfBD9piCFsFzkpHoN9
         HDeTIhP26cawGzSpAiqjQMi56lnLW48FfYNiFVATDspjaYKvqoTM10SQLrgaWHICETAW
         o5S596O6+lNkcTiKrD1XmQaONiR5IxDLGuM0ixhIqsXmRfWzduKkNtOM1QjIRg0MYbKR
         atXjLy2m2Haj1bO652fRkgHwg/khRek96EXtzTxbhPxuhm3bBHsYOgy8GFFWRcMyX5Pj
         kqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740465139; x=1741069939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QsE8G0C7eTphuL+cZfC+hk5nly7dBgVS5yTFRbduWdk=;
        b=Jvzrt1Aq0yQMMcY9UTJt3EIyZrsN5LBnozVVDH0/hbb63spyPq3IOQ4YGwD7YP+NZl
         rNJK9LQefCN6WVJx5nbuUrJGIYsAKz+dW5jmc54F+aIG1MYuTV06MnToRiIxz/7UifoX
         LtgMdBBOkJq9yMXh5ZTgAAc3sC8BukhpaFg9OiC0cK23TuIp4VwvpRU0yXxWnwcZMnfn
         CQSrs+gqfLyki/KdMdhU7qBZjhQZxpTEee7yuMnnOPUFDMfT2ypoOLTcQ5d8Ec8nEkVG
         77MwqWLrALBqfc7Dl4v3g7ICFLfhDBM0RBs9HCkWBRquYVVRD9mfBjRt3W/R6Tmfi5xi
         qEFw==
X-Forwarded-Encrypted: i=1; AJvYcCWpLniM0umI+3x9chAuQk2abqSlKSQ/0ts2LKXpWQDTueBbP+LqFIw9n5De8lbMIqMs3wnWHm9K3IuGrHWL@vger.kernel.org, AJvYcCXoZj2LUwv67er0vDAb7btSLegJImFBV1TfT/Qp5/25JOlJ/5qGj7OzQp4bCTcFCLduc4uXFJXSD3KOug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNU19YC4aKfGlRLEZNUcP2cmilw5+6W/1EbC9HzXZ7xgDlFixo
	Kp+7IhRrQVQ1rs0p4ZlOalRa2xjTI6gDqvJfF8KjDgGzVQ6je5isoor55w==
X-Gm-Gg: ASbGncvqLga8rQT4k5HgIjtmAXTVVCXT5ierneJzXPLjnc1ZB6v7a4K747GLU8oFVkU
	SZhc4VSnWDvkp5QPq78e6sOM79wnH0CEFXYEYYsZ8ti9dD+OLln/Ja2jysTkRstZd4/pbaxBs7J
	EfcZnPYsJqNpSknf1HHHJczcCR8g+dsxUnk+3OOrCfSt76sQJNL9F/BMUeIn2Q4Br9NiHSA0W68
	MBolPijVL89KNhpDMLiw3RDsL7AIau6czyWP9h564MNYqvW2R0EpRU7FSlCs3AUc69s3BcYa7iD
	JWHOxChE0FgMOaQrW3bSBovzgMc=
X-Google-Smtp-Source: AGHT+IEGRiuhli2KOcdfuRxh3WD1uqd9smZVOAq9HFfdKlTJ3AieSfGYRiJ8BLGj3bnGfMX4DnW3TQ==
X-Received: by 2002:a17:902:d487:b0:220:fffc:7296 with SMTP id d9443c01a7336-2219ff846f7mr232964855ad.6.1740465138621;
        Mon, 24 Feb 2025 22:32:18 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a00ac2esm6646225ad.98.2025.02.24.22.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:32:18 -0800 (PST)
Date: Mon, 24 Feb 2025 22:32:15 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: goodix-berlin - constify 'struct bin_attribute'
Message-ID: <Z71j73PPLO5AwkxA@google.com>
References: <20241222-sysfs-const-bin_attr-input-v1-1-1229dbe5ae71@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241222-sysfs-const-bin_attr-input-v1-1-1229dbe5ae71@weissschuh.net>

On Sun, Dec 22, 2024 at 09:00:43PM +0100, Thomas Weiﬂschuh wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied, thank you.

-- 
Dmitry

