Return-Path: <linux-input+bounces-5321-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B74059472E6
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 03:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 622981F21003
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 01:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FBE27456;
	Mon,  5 Aug 2024 01:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwitmXeC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5621C694;
	Mon,  5 Aug 2024 01:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722820322; cv=none; b=cmi2ze15WEvSEEXuvyaTd0WAqPSsof8lkiLNshUwknqdYVV9h6+PfSPViujVTW3WbxIJXyKMBCjPJSqvtbaj7aQJu6YPjnm6/An7oTV4mS5IGd3Zthzhf7RGvqRnHmhAN9iqzBD5+Tvssl19+zHYBtgV1IoSO9vyKPxMubtUbT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722820322; c=relaxed/simple;
	bh=auQYTtyH06aCKNFBLAQ0ggxxeW4FQdlnjs4LaBRbI7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ke74t+BquaAYnAcFXv3F5vusNG/e+BX1UschwHVRTd6YmeU/Qqm11RKBSQ65GFRw8QxoY7jq7qQ6n20YEaIjIBGVNwS89LCo7n00oFV4Z43oZwZjqpKaCyWaaTfI/BFz086y6QYllSFRo5CJ3yAbAVPWRCA3mZSVvEmDJ9aY44Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwitmXeC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fc65329979so88569115ad.0;
        Sun, 04 Aug 2024 18:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722820320; x=1723425120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nCeHrAfnGJ7SJi9Hmtm1f4gU4iMub9gPkMdPYbKHL9w=;
        b=RwitmXeCGmDI0bg2N6SXgYqWZYlW7G7ZW1l2YNfnjXRJNTwaYXQxb3c9E7GijOMkjW
         trVAx1XlShUUQ3bVWgMWDz1wh/b/1y3YVL2z1WqnXkNlkmERl2I/J4ojD2dleZ6RQZ8M
         G7zjMvg+x6Ev6h4JLkliSIhB2xFL2HvWYlrP6V+FNU+rAK2Rcmp5S7hZksJ9xHtAx6XU
         v7OF/v4RCB9ZlEWJ90d/BBppd7J8UgaPhf96xdpJXXQ9kpzjule33oFVclDD8pdZ/jrk
         RccbQPDQEPBs+ST1hG3HoU5x8UMN1yYJW6N7SdCzXxDRTtevbKaLm2TaMgEUQJ9Uqpa5
         V6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722820320; x=1723425120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCeHrAfnGJ7SJi9Hmtm1f4gU4iMub9gPkMdPYbKHL9w=;
        b=SQEijKKzPt875Wr/rTMqzaQ5Ji4Rc4GtDwqdBbsO5pwRyG3fay8KWzXl9w53IBOsll
         nOR4m2W5Nv74BSHGWenVvKbtudr+jTFrn6My8UlOEiJSIGaad961RI3M88gw2roU0YFR
         3fgihvCMrgAypuZNjtriGCInK2EJQqtnQsv8QSuMr0iIW1K0VV1poY+f5H9Dp+zpkMm+
         Cbip5PDb6SKB43KO0JOuETGWAp35a1nV7YRLS/lkJTV8Vu2vpioPgxKMaptJ4n+u5pFP
         pQMOB8Gk6frWVqT5+DZitDrfQJd52xtkg8hA6+VcJka3xYRRAN63CYOECHUdi3XdBrWh
         TtLw==
X-Gm-Message-State: AOJu0YzS5p8gSMnhF/IawqEj5D409qJgIFvB2jl/1y50SoOGAMDn9tMR
	j07A174YpUcgOXsdJMgKQALjWvKBjdttYK8cyYuQHNxHxUnmXAdjl6laEw==
X-Google-Smtp-Source: AGHT+IGXE7bknaKTSZ8KNveOaJVI6UL8n6RjnxHTE8DulFH9zXnB9+MqKnSBVPzImWNQppp5SVsB5w==
X-Received: by 2002:a17:902:d4c5:b0:1ff:44db:7c4e with SMTP id d9443c01a7336-1ff57281a17mr149607305ad.24.1722820320018;
        Sun, 04 Aug 2024 18:12:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff590583d2sm55691785ad.171.2024.08.04.18.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 18:11:59 -0700 (PDT)
Date: Sun, 4 Aug 2024 18:11:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] Input: tsc2004/5 - fix handling of VIO power supply
Message-ID: <ZrAm3QHCvtmI9TPS@google.com>
References: <20240711172719.1248373-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711172719.1248373-1-dmitry.torokhov@gmail.com>

On Thu, Jul 11, 2024 at 10:27:12AM -0700, Dmitry Torokhov wrote:
> The chip needs to be powered up before calling tsc200x_stop_scan() which
> communicates with it; move the call to enable the regulator earlier in
> tsc200x_probe().
> 
> At the same time switch to using devm_regulator_get_enable() to simplify
> error handling. This also makes sure that regulator is not shut off too
> early when unbinding the driver.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

OK, since there were no objections I applied the series.

Thanks.

-- 
Dmitry

