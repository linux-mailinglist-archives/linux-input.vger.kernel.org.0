Return-Path: <linux-input+bounces-9238-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A47FA11345
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 22:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 326CE3A1ADA
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 21:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457841D516A;
	Tue, 14 Jan 2025 21:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFlUarxr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A0229406;
	Tue, 14 Jan 2025 21:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736891004; cv=none; b=qd8PXsRx0ajPMUWxqvi+Tx+6Obwg1n/PtaNGj7FdF3rnYkEmqNRkOStH3e59nptwaB+mkTaR/k5iL7eWHG4wUVlX6hpsvVLNEcsHTcMDdcLlocdtp4bwy+2uoPJdxNDl4OeV1EDHDC6OSMxUNOez+BkyLr5aH4aoT3tkcWZVINE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736891004; c=relaxed/simple;
	bh=52MeMPWIjdHIemw5qV/UBcuRMsT4k/5UPnPdD+KFKpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyoUgivXf94SWNeI1SdUXC4o1Nv4r4TzogoZMPlgMnirldv7XuCHnjJ9bTU4ktq7NB5NSQHPSXb5LLmqnQXxai5LRANi+tLYRjOy4vvexDTgGmWinvT/pOpJ0BfW7jPeBEZLrSB6M060t2jgumwmr4aGI0SsHloLFHE9MovsB5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFlUarxr; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so9949024a91.2;
        Tue, 14 Jan 2025 13:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736891002; x=1737495802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMr9kwDAlGVFQPaTQtoJ9RbDOclYgZmSBJll7Ikf0dM=;
        b=cFlUarxrb+wR8H1MwxwKX0J8IWfJmjW4XtQIQNjSzHhyBgHBMF2+wMgkIZ/SDXWzba
         9lEbVELl+pM9VLFhIwDHUYV3+0qpJqKKtJ9b6mg0iJueCA4KrJP6YnZdM8Ubt8yWnY+F
         Xtm4vCYUnsjNq7SpqC8iR7iMvgJl6dWcM+NHxBFnLa191i4WEmbQbCtplXdr4iEiZrC1
         NSs8VVaxh/dz0fh02ygF3vA5xpCVjI3dWln5olohZYatGxSYxBrWzSOBG5O/N1m3ysWk
         XlM7M1q/Q1WQVpnHATMaItHY8Srgsx4eeWsHYnlvvr4BrXqUGn/gmezr58Jb1Y5sN71l
         STOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736891002; x=1737495802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMr9kwDAlGVFQPaTQtoJ9RbDOclYgZmSBJll7Ikf0dM=;
        b=S+ZNjR4xrm/A8Udp13ERmXtncJGZRV0pw2/y+H3NwrHDHY8Yml03zpQVzydimyBviZ
         myXiSjWV7XMSEiY/OwNBr/8Pa06qRAj0jpusr3qaS7Pe6DKQMeAl7TZDsDoUSc24Yj1B
         yaaq35SVzzZbWwoI5Hj5yECWU6mkrmET/VUzRCDkONOtqdL+0mMuDGmhF0MnN6QxXPHe
         Ue5ndMGxvbBMdPzVodKOUdmBu5ndLzMnrGyZGdzIPoVlP47vM3jSOFOGDyPzMq+y7suH
         WVCyTGr7nnKaNbKYqb7ULOjPGDHyh0Zbl5V/sPXvQWcdux63YBjYQ2KVqgoDak5Ko7sN
         BFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc5Irh9aLfS9b5qP3fNiPgt9ditq/itd8fR1JOMpOcQ0TGJIVYmJaoL1BHceSjLOBoi0qGLvrEFOWyCg==@vger.kernel.org, AJvYcCVnYD+hKUR5y8VsNdVPEqwKp5vW/cMf16qPXUoifts9LG/4PLOKgM1rOyjWxaxGlJ8E/V3EwAZm2WjrKNMQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwAvVs+eKD1envRI7quLQ1Bmn7M0Bw7fKrkFjGg+R1RnSr64HLw
	Xbkl/6tEV7e7C6ixiHe6BS0gKnM/QCHWiavHSm6xI/EpeVR8qUXm02qLQg==
X-Gm-Gg: ASbGncvCb+FUMiR4j4Nz9Ci7/0oqohCYcTch9qjVehVcvD1sauRqGJkFZxOyklheKd+
	LrB4OBf0r3kveKY7AobrzRPmS/0gkk4YM9h2L77Ru7WZCaQC23loBknzU+G4/nZ9SMcA5mjMRoU
	9eANP4YhsHkv18boB6OA+xOGZ8Czs4P1Z/z5lr4RQsbgpfwjBWdJsthLzn+jIwVL3ObRRyCQUZE
	2drSQsCuWeBvN65Ipbm7MdBsm4qgY8GmnuypB3FKNG2hW1SdrmPT3989A==
X-Google-Smtp-Source: AGHT+IGxDp0ZetmFyEa5/h3Rfre1BGEnwwAlsjzDSAo3UF7rsyP80r8F3RuW9med6xHZlb02YH749A==
X-Received: by 2002:a17:90a:c2c8:b0:2ee:70cb:a500 with SMTP id 98e67ed59e1d1-2f548e9a4c9mr34201825a91.1.1736891001791;
        Tue, 14 Jan 2025 13:43:21 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e152:4a95:d7ea:84d5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c22b8fcsm14895a91.47.2025.01.14.13.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 13:43:21 -0800 (PST)
Date: Tue, 14 Jan 2025 13:43:18 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Erick Archer <erick.archer@outlook.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: joystick - use str_off_on() helper in sw_connect()
Message-ID: <Z4badiZd2hlP8Dcp@google.com>
References: <20241202154603.1193-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202154603.1193-2-thorsten.blum@linux.dev>

On Mon, Dec 02, 2024 at 04:46:00PM +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_off_on() helper.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied, thank you.

-- 
Dmitry

