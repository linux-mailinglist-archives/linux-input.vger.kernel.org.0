Return-Path: <linux-input+bounces-16490-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B77CAEF5D
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 06:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1AA9303C988
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 05:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD82430149B;
	Tue,  9 Dec 2025 05:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6QaUzQU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0713009FA
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 05:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765258903; cv=none; b=qLVDyY1YdH+XLNd+NOZSqdnDVVwLc1k5WkxCW7+BRoemsMxE9pcmTTlCT+SO/z3i5PIX0SPnvVpnLvkSu6xNNFFEM26TJ5tKoUUOz1Yb4hh6OOt8KIe9DDr/0gMTBIiXcd5rSMQZu6eSt48Ve365WZe/p+WKQJBGCvXbGQprzV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765258903; c=relaxed/simple;
	bh=zSLSl+demqE3EELs8KN+P2CNXNA1rhxB2CbBz18Chns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+KoTFlSfGk41EXemq2AilfTHUknHD5W6689aVr5AigQwRTS7Q8BIuK9WRwqOXt07AvyEQpJhrpbbVkOT/VShu3i2dzdZTLdlCX4Bw0Mey8gT0bNCB2aLwFAG7m3cijzeXIaZP1ZvgCjSP4DzRPTtpukvNHOCFXC+3jK4n3kQLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6QaUzQU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29ba9249e9dso72949695ad.3
        for <linux-input@vger.kernel.org>; Mon, 08 Dec 2025 21:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765258901; x=1765863701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5LHZA5YDa3eruXOPuF/H7ti+YsMo7fQPUEFvvdAmt+U=;
        b=W6QaUzQUIGzWSOoey/Vz5R9d0eLn645cXgskxmrLxjJxBj4ntBe3XdbjjWR0oU30KS
         5CRqUOXFcZPa7LWbUzFqcjtJlwL59lya0WxP15oxbo9PfaHocx7Y4ks0LVLtrMa+yySD
         2lWy7/GEvgnjgAp9D33GOnDFJvHpOs7YA1156lF2b7UAbRmcGCi7EDzIGpnJmRdKM2A7
         E1Or7uOK46DYmybysKLwEGoU+yfC8GirMAxNgNu/Rt0njvKSatZgckdty3HPXKZEnXDe
         8DEub/GcfbuZZHqQBf88yCZORGDd5cySvafh9w5cVb4jCN+PLNvMRGkwXKj2hsjGQOHq
         ySFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765258901; x=1765863701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LHZA5YDa3eruXOPuF/H7ti+YsMo7fQPUEFvvdAmt+U=;
        b=ueCAx/FJfIutMtHmmEeuDYtIEd0fBY6zMBczdv9qSsXSJLw05U8nH3RttX+yK4sNbj
         H9qlpCzVIgY7TUhGmF6GfnmT+xgPezH1dvBzIwSCk4ah2/OR1aqFS1BgOBq5mnxRgbNq
         Yg5WK2gv8C/vy4OsJyJPtUZhiLYKQo4c+83bauBSMvwzzeXCe0l66uqZG0hC0cfVUzSo
         UE2GKp7/sG4+NPZntMctZHLu6EvYWWIMW1TMmSs62xju+8Ctw1GV6cU8VjA+PsrojcmQ
         vMMclYMJJH22F8IE/f07WFwiaaFmOQ1IGBPFTW36f+c0aB+qemkHrNcm3aOIDdTHJ+C9
         RUjg==
X-Forwarded-Encrypted: i=1; AJvYcCV3M7rCwjfmiiUhIuvau+Ix53/B150wyjRo/NvDgtUaP+kop2AppKRIQC59WZBaI5TXFRl9YQaRJSEnjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMLVAV3pNKN/WuQeYw8m7SbQtEFaIo2jYksDHhkKiE4JIaf/DV
	EqmzsF89Au0PzITwnDl08HsWhUc5tKyHoMm4BiAXotiU0HO8umhgH24L
X-Gm-Gg: ASbGnctNMyAU1Pu43HDCotHaMx4zUg86Y0xH6upYUfHKW/mlwgegfTTHcPPXsYk2yK8
	X1InvGE4qWAOKUeUn8PM6B2P6XiWYgn3gVZ0E5UleDFJyKIkdjGT0XlIc3lrXIWITCGErJVQvnf
	Df6bjZXc+8ajev/sfbfs81RrYEZo6i2CTV45wx9W1xREXXAp+laD2kBMK6LI08cWZ6hoz0A6lKB
	IrSG8U7QBPZxbQmF89aVuc/Zr6jruK0uQUH+m3JxN9p8BjkDLl6Ya46N6CxqRBLaVEnWxrzpDVd
	E5rPOaiEyYOMv9OV8XEzsutV4cjNTNx4BC36xtiANjd5OWSnP1axOOHlpKeiLiR21IzCR3oCINn
	AqdXuXANJPun65nzWJfE9NooHv5GpSKDIzfXg3eqTaNLIDaKJk6KeoTBPOOneOQMUQTk8bA+yng
	+9iN+gyGEtunOHDkrsIHo1sJSUc+EdLpGvkn/mFf/bjIsY8vzBNVvo
X-Google-Smtp-Source: AGHT+IG/Um2k31NfRI9ovEMXsbhvXmwyf6UVaKDsBHH/HNkQGRW07a8Dg1HKz/AUBKO2KkgQMD+E2g==
X-Received: by 2002:a05:7022:f89:b0:11d:e40f:ee69 with SMTP id a92af1059eb24-11e032b4024mr9024002c88.36.1765258901340;
        Mon, 08 Dec 2025 21:41:41 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:bf2e:ccbe:6eae:cfa7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7703bd7sm68986088c88.10.2025.12.08.21.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 21:41:40 -0800 (PST)
Date: Mon, 8 Dec 2025 21:41:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hendrik Noack <hendrik-noack@gmx.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: Add support for Wacom W9000-series penabled
 touchscreens
Message-ID: <5zfoikfpctpvphtzmthqb3ue5zc43ueriaaesyyqkvjm3b25re@7w2uo4es5har>
References: <20251205152858.14415-1-hendrik-noack@gmx.de>
 <20251205164952.17709-1-hendrik-noack@gmx.de>
 <k5rhkjmttba4aznb3xa44pqaxepsfkbe5ap6g2ln3rcgunvkky@262tpqra76v7>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <k5rhkjmttba4aznb3xa44pqaxepsfkbe5ap6g2ln3rcgunvkky@262tpqra76v7>

On Mon, Dec 08, 2025 at 09:35:09PM -0800, Dmitry Torokhov wrote:
> Hi Hendrik,
> 
> On Fri, Dec 05, 2025 at 05:49:52PM +0100, Hendrik Noack wrote:
> > +
> > +	struct gpio_desc *flash_mode_gpio;

Forgot to ask - what does this do? We do not seem to be using it except
for requesting.

Thanks.

-- 
Dmitry

