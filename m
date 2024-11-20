Return-Path: <linux-input+bounces-8159-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B01C9D332B
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 06:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C48AF2833C2
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 05:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04553156991;
	Wed, 20 Nov 2024 05:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEHpUqMF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A17156669;
	Wed, 20 Nov 2024 05:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732080976; cv=none; b=GwfcmqIjAmAa9YcHj4O/6c8y9JbvtVXlNUJ89E2nt/hg6LYxMMmjV0skgoP4UdYQvxMqBBwh8dHWlZVTst4Po7Cwp2JMD53SjH9E9OOJKssuYwrzkifbnjDsbwlmABNivzruOqLWHl6qWX8Eqo+owjC371ol/i4YMx8nQ7qIgqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732080976; c=relaxed/simple;
	bh=3mq5+iqMIwmAGAbAOZ3WJy+zC/nZcG1A/YxkXZxMR4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRkmQ8xiClJLGwjwGuEfTYgSPFHaz/RkqPntWwNuBD6t8h/LEoWMLhuwSuUT3W0YRelIzB3Na/qpeo+JDtPlbQTwp5Cw8dLvwwlB5swW+J1NwcFSs6/1yVDqw6s1t8MzDCHz7Oi/VT6bKoALTEarZ6yyfpnq6dyF5A5Ua6UAzVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEHpUqMF; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7181eb9ad46so999034a34.1;
        Tue, 19 Nov 2024 21:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732080974; x=1732685774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xRwcqVhrMWWtuyE+OLPL5NHoUdOo/BxzRoMgxzXnrkA=;
        b=LEHpUqMFcUGVu14pwjTdnRteTdwXYYBTQIVhK5wXbWEDFhgconjzrRktpWf3OEABsa
         yK+pOHhBe+T7vwMAa+pbMlcrKrrPe6jCeFXA+b1AkvYAjN+hRjt8zgCHzk0lG8v9L14T
         6Mf9nWh1rShaW1nOP2yfsoZTYAMVpCAFjtZaq0BvK1c8/IiSIavhAppjjBks47Dfxy8+
         RLcVThWV5J3KIY2TigtJLPar1pnuqXd5heCvdPz77+8pmtgGLvQqt9ub4ggLqmSqXoI3
         ZKevqOsCJhiUl1X8t/hkRzNAtXM8JhTvDs8sOs5pb/ZHyPN1Th83WM0J69B11mntFOU8
         p4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732080974; x=1732685774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRwcqVhrMWWtuyE+OLPL5NHoUdOo/BxzRoMgxzXnrkA=;
        b=loBma73rctN+Q+cxyiPm0oPPQroPrAgmWrRJxqVhF3xdzdAEvTK26a05o6IaTbiS45
         9qLn3ex0FC6jLrmolWrf2s6qNobTpO3QwgYxVt7EclroCQqiz2W6b6s2aIMifbxXe7+H
         tk0unHc4k5WasXUa5ulBdI8QJe0HvClRPkNvERvRBuG/RWWbcQj8OL+qEdqCTB3aQcZK
         fcRKWJXx5qFIn2RrcRBn20R4oLJ3zCop77xmFUfIQHz0WNrxy8U7UeV8V2bO61FHJV8U
         mCjqUx7916DBpoON9A8KBPiTTG78CFGKvP16urp6oVpGCvSVE3LI5vSxH4VlgXgNMKA5
         t2Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVNu0MA86Qv4Zb1uOTAJGe5LHDPopGylqvY2j6qZZnSwlhjLV2hkye8GDKhag6fOBZW+XPL3RGcEJFEIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTRao7IKpp9A9YzM2abbF/5viEMyR8Q+tyhVlDpdgRrSYhvTFo
	oW3L7xXac5PTEJaNfwoDce5BaVSdWD+05tQElqIYZ3CuzwF4mG3/
X-Google-Smtp-Source: AGHT+IEINX116vl4gIhEO+YETzlb+ZEQU0ZOmoguc1OJHWnXur7CYB6qLK517Onlg3HZrRiY5MLnfw==
X-Received: by 2002:a9d:7b54:0:b0:70f:7123:1f34 with SMTP id 46e09a7af769-71ab3216af2mr1408427a34.30.1732080974485;
        Tue, 19 Nov 2024 21:36:14 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:4fd4:a79d:4d7b:917f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1c3224asm8639311a12.29.2024.11.19.21.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 21:36:14 -0800 (PST)
Date: Tue, 19 Nov 2024 21:36:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 06/15] Input: sun4i-lradc-keys - don't include
 'pm_wakeup.h' directly
Message-ID: <Zz11SwzIYTgkgbty@google.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
 <20241118072917.3853-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118072917.3853-7-wsa+renesas@sang-engineering.com>

On Mon, Nov 18, 2024 at 08:29:05AM +0100, Wolfram Sang wrote:
> The header clearly states that it does not want to be included directly,
> only via 'device.h'. 'platform_device.h' works equally well. Remove the
> direct inclusion.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied, thank you.

-- 
Dmitry

