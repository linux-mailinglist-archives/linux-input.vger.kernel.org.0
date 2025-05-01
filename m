Return-Path: <linux-input+bounces-12090-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9D5AA59E6
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 05:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAFEC4E1A3C
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 03:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE8F1FCFE9;
	Thu,  1 May 2025 03:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWys+dfl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24EA21A94F;
	Thu,  1 May 2025 03:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746069194; cv=none; b=pc5hCMZLWJxTJpZLD+8D7J5I0DlRamxUowKqwK4+5bTK+x2u5Y2yt11g20Ven5+1zqaTk7dUEsWojsj5/63sT3hvymmZkZV14Tah3BzF0/sVkf1jSkDppEEzhVh4pU8AoYiwHS4C9ma9Q2JQY46EIc9B9+NSHP7pHG2QqDwoTqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746069194; c=relaxed/simple;
	bh=AGNg9Gc7+bOHRoExRYaiS/NU82tTNmNFtGlKZAhT1dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drYGHyzTLpRSHz3J0ta2njESD4tXd21o05ovroDei1tyqN81St8U3otRQbafZdQrbjLOyVWSMw5JIG5E9cTFdMAlZaaGBJDfm7ts3n5y0ygnDbOrXGfyvVhdEDhyR/FlTXMKy8g/i9orGCie4pr3OB0YIXr3TG8emsEoswko+v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWys+dfl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22c3407a87aso7547145ad.3;
        Wed, 30 Apr 2025 20:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746069192; x=1746673992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4UXPVUmEeSr6C4nV6Z7Bb2rypBZbuSq2lfuGKge1zB8=;
        b=bWys+dflcgqjF/yWCHbETFZov9+iLHdFXs9S9rSEltJD5IXVGK6n3WBprkQpHFjdm+
         N/mnuh7/jobFzVqIOMSi7CduEP2YsLH7h57QolrielcFHOytrg4dwGJwBBkuFzqtQ5TY
         yLezGCuVVX6/0lA0EfIot+rVUhAX7tu547rku/WmpvuQNNFuo0Aqcgiv1nRXcvhW3btb
         JpTe6UX4J6yNjcB1zssj9+zRSTbIWYY0rgQFOkrqYiXylgzvIFdBNbhMBlhmvqrMdFOD
         V9Ggg0aNl1XtjcOkUVefrUKJNSQ0RoStPEOUQQdqbojQEe1aa9cqBByBTki6VMO5+9ku
         EEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746069192; x=1746673992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UXPVUmEeSr6C4nV6Z7Bb2rypBZbuSq2lfuGKge1zB8=;
        b=WIDxgA+MnltZom3vPjwV5fromy4NOz8J/e1xTUous9ES4OofN7OEuO6pXC8iaMEtF8
         qu54TfoiN+Wo52wjEjkZGDraS31tnOuKcOXmut4q12RAS6AtmBNLrnV1QK+rQ+vUe/7J
         lfWT6WS322ulXPDiyNvfScJKwReCbUKhWxrkrqdxu5YvKtZUjg5Am46Z9NVR2w7NFq+l
         2WrXOF//8Y5FcHWlYr4Wdtbul4YuhH+N83ItIyb7Q0AD+PXuZ4BEsHmsZPuAEI2LEy07
         0a2+C8WZbL6kpcEGPnvY48akxdhkQ4mCPDNB9jraw+gtK2/SdkZzTuzE4RfjB2qJxbZT
         Vfug==
X-Forwarded-Encrypted: i=1; AJvYcCVMXqgZU6M/jC97T2H8q1neTbyn0rMEZx4XDM8u1TvSfeN5nw5WIrpNBBy03LQfuSzkOQEwDoORb7i9kb0=@vger.kernel.org, AJvYcCX3Gwm7oQL3yI7puf1KeDtHZ1zW/1wBblq5mhcC8z71TbHRdyifvi+mXbcDtzSgIo/+Jb9b3QuN06M=@vger.kernel.org
X-Gm-Message-State: AOJu0YznZgItUjQVnwjndnM9O94MiTaiRnzUhZsQF/wyJRqn98cJ1oeZ
	ulFSWtW50aKZydBD+XOf0JU+f8JsAGGDFEvz8zsWzhb2ykISCfqi
X-Gm-Gg: ASbGncvcCVkom9DPxMPm12ZAxjZSiZA9PpnXCWuq9ikwrCXSmAndx2+bEitKjJfHV92
	OV9xRCctpWq8Dc2NiJAKaHYKHIM+gy14mofp5xT7HdLy6BXcg992ksq95rVZsJlwLQ0q5K1tlfc
	Yhn7tCrheG6gqH8/9sSsVlvLots1roEvk+c9z4l12b+hJyJCeMxap58Ios6dWZXaq5CU+l6taHG
	5MlQe8YxOEI1wH+MEEgm5khTqnEIQa0DJlkuWUg4LNxy4Z4DgWM2/i8xbzdqwfIPdy2fDSxkWqD
	h14jk6YvmNN0GBq5yBR2KdxW+N/bNhSk+XV2zJ+3ng==
X-Google-Smtp-Source: AGHT+IFJp546RTesG/pmd6m/+jvrFqcu+nt1ZKxJ7zXmYGk0juz9zaaRco67qdXKRRzPLM+9M926RQ==
X-Received: by 2002:a17:902:d54b:b0:223:52fc:a15a with SMTP id d9443c01a7336-22e0863f235mr16477055ad.33.1746069191542;
        Wed, 30 Apr 2025 20:13:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:bda7:836a:d9fa:ac5d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbcf7dsm130325055ad.69.2025.04.30.20.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 20:13:11 -0700 (PDT)
Date: Wed, 30 Apr 2025 20:13:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH] Input: edt-ft5x06 - use per-client debugfs directory
Message-ID: <6rid4lbtyisgchnl4grnwzysrbw2wtd4lrkjmw5tcs4xyggafo@tondbi5jhl5w>
References: <20250318091904.22468-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318091904.22468-1-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Tue, Mar 18, 2025 at 10:17:41AM +0100, Wolfram Sang wrote:
> The I2C core now provides a debugfs entry for each client. Let this
> driver use it instead of the custom directory in debugfs root. Further
> improvements by this change: support of multiple instances.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only, by me and buildbots. Trying to cleanup the debugfs a
> little. But not sure if this is too complicated for users. Opinions?

This looks nice and nobody is yelling. Any reason why I shouldn't simply
apply it?

Thanks.

-- 
Dmitry

