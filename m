Return-Path: <linux-input+bounces-12091-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD36AA5A44
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 06:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9D247B7768
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 04:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6B61EE7DC;
	Thu,  1 May 2025 04:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itNoz4lA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003E51C173C;
	Thu,  1 May 2025 04:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746073365; cv=none; b=ThH9l2HQHGbKjxp2OcoAvaj8lLuYfehskQlWmOlqL/OJHFt90fkA06iJD62sI7L2N4T8iFUxJ/1si0oT4R+T2AQfIvlBiFTKFAyq483r7Osz2AFkVcnaeMrMBofHkaVjq3jz166nY+gM9paelbo7Rx5ONK+f0/uSMVsaZ7QFsP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746073365; c=relaxed/simple;
	bh=7ZyQe4/ssmDUiCcq0mHvYRtEythbdO0J6igardf/7dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Azu2meSER4clhKQKh8z04kRI9CtmgQ5suvxCNM+jjN4nzkkXTcjsw8hDE+7AYuB9QvXSF9Z9KC3rjN5HM8osvcHMTB/mX3nq8BNQSW4FoMVM5nL9U5wCSq12DvyyAFZ5jp3vZnagGXg7QSAYb+Q37mfcga6+jrZQ6duQ0wtxxIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itNoz4lA; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso879526b3a.0;
        Wed, 30 Apr 2025 21:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746073363; x=1746678163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kz55G0wgemgGbaXNzPnjc7Uc/wu1LdmPyi84rmiZxcM=;
        b=itNoz4lAeHeCfaDG96UDLRk3/sFRe2a/Xx73dYxRGZdllqdiQCIpmfa+in3MajSklM
         uqDGYZ/B15HJgypFW2rhR0a57akwZmxELSsVGiPYiHVUncKH/lHOdYFpzZXrZsYtp3am
         Ney1VjRXZWuOI3SZjhZjEk3Ro9HfIEXWNMb0DCB0GvCWefgTgfFmVkF5Gbi4oEjz6J3y
         eYu2bz4187eIju04HpKvolq+5dEkBUaR6Cz+4g4V060Q8UQ7pS4Yldn4ixa2lfap8nza
         YIGRRH1H0+6n6wHKH/Rq1LCm6Xy5aZVJ0a52PDJNfUosZXA4Q5xVf7HjBROkaMp1a6XP
         yBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746073363; x=1746678163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kz55G0wgemgGbaXNzPnjc7Uc/wu1LdmPyi84rmiZxcM=;
        b=wi9qxY55oJayhEQbqVxDk6mWQSqsFLAhPAQCAwZEyAhlGqHGiEIy5yayACnYPiu55h
         PrcZGG2o+bws3q6hWAvgg04Oy+Y+YPPdf5cWmQlfeeoNu1MUJ1tdP3Kqfn02RU7wjQFS
         U3eI2HxA+gi8Hw1u1iI4+/VkHSmzV6fT+57yW9UCP/LG5eaMWxzPJJxJoteqCqKMVFE7
         TuNDJmX6GLGpfpY3Pgs2Sj+XvuplzO8ecEoC3iFbRWNmMjAzcGn98BJYHaxR2AFlINTz
         hVDFVTUkY1tUbgokyA2cb1RugsuID+b47T+KqiJ3ahGzot4dzk+Q9JOR3yNuUAXcvRGi
         luRA==
X-Forwarded-Encrypted: i=1; AJvYcCVRWhGUcofKub4n4h0+vvEtZUeXRqh1nlknm/9C6feHz62jbcKnyeCV9T4FcKzUsSs4rPra1gfMFreqoQnE@vger.kernel.org, AJvYcCWnL4FtFwD/1YcsdPkHKhk1WZkKZWSnxcupk2BMCQanym4gVjPC84xS3yZF2QM3KMbH8PQlk5mw252Q@vger.kernel.org, AJvYcCXYjhzB8itLce1wMb0PwX8fBrmruF21alfzJzw0VnV52hTusZbz+pnNI/dsNebYP0rQbbdrE6PPKKLL8Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym7d+Ij4vluWeS8Io2WB8NmQTBNGlRyzJ9ZVCEjz34W2rQnri4
	kykc9yvAG+sq4WwA6Y52E2+7ogTwGeVPkSwuKRkBds098+1/KKwI
X-Gm-Gg: ASbGncuicKWCpSzXKBXzcEhgDVUP5Kc5umoyvd0yLyjaXHBIcgcpJF5V2ZR5GjQqOzI
	B3EnYCfGebz+Gld/7Zop9s8WdZoVmx+bgUjJSHrzN0FH7PQwwC8qQ1FZV7fiJXbswIxLDuRXStK
	Q5Wal+SOfa5xMwgrzb4pv6YvlLTk8irIgxAGPgOMPG/dNG/wReNcR6e2qebcPXpWGXlkLso/GXC
	6xvsZNWv1wYCHCldYAXEvlr0e0OqPnvmxUSEUbh1onGOIFE+q9sAzJoBl+m7ZMAyKeJRlsLa/Hc
	QXduV2DoTvDdPRbKXkRD6E1ILjkcGYLpZhHIGxv+JQ==
X-Google-Smtp-Source: AGHT+IEDnCcb5zMEcujsMt+4jt/xdH1qO5FAWIQ9fZMiaCD6iud+o4dI4Z9b9WrDs2XNCH9tNXONHQ==
X-Received: by 2002:a05:6a00:3e1d:b0:730:97a6:f04 with SMTP id d2e1a72fcca58-7404777ec84mr2561752b3a.7.1746073363086;
        Wed, 30 Apr 2025 21:22:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:bda7:836a:d9fa:ac5d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a9451csm2575849b3a.167.2025.04.30.21.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 21:22:42 -0700 (PDT)
Date: Wed, 30 Apr 2025 21:22:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: crypto: fsl,sec-v4.0-mon: Add
 "power-off-time-sec"
Message-ID: <e5z4nmfakexnn6aqzumpkfkmowjf7yxxcqzgj3xp2zn2glgcfo@obagoezztk4e>
References: <20250315093455.1100-1-ian.ray@gehealthcare.com>
 <20250315093455.1100-2-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315093455.1100-2-ian.ray@gehealthcare.com>

On Sat, Mar 15, 2025 at 11:34:54AM +0200, Ian Ray wrote:
> Update to reference the input.yaml schema, thus enabling the use of the
> common 'power-off-time' property.
> 
> The hardware supports one of four fixed values, and the new property is
> optional.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>

Applied, thank you.

-- 
Dmitry

