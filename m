Return-Path: <linux-input+bounces-15354-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 074A6BCBA4D
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 06:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABFA740791E
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 04:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9269B288AD;
	Fri, 10 Oct 2025 04:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NW/wymcg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D8D36B
	for <linux-input@vger.kernel.org>; Fri, 10 Oct 2025 04:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760070783; cv=none; b=ImB1qXpv34mBZjpFIfWMGf/tjjwWZx03S7rHuJWmixiIKfZ5P3SOYiXbqrqbaBj9aHK5/EG9gjfCnSVvOknGylz4Iq9Vi7/jaxGy4FYX3xafAlpqsZVhqzjR9wyZr+kB8lmif3KKJBZciknhYmc+5phx5q7IJV344rtlJIXjPOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760070783; c=relaxed/simple;
	bh=APHRDZKb8OTyJiR/60IqzEZI8O/4asDnn65gfyJn2l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3/iuuJq1IcEzhLDwPCt+T6c8eJNg4ZV8f0D32Um0ekCZGxkvy0N0aK7nyLYPHHLJrHqqJhyVbZGvkAA2WSE7YEvWPGnAI1pSjWahJ64cnkZzbIGn35teKaGraTPIjhRENVd31jSTbrcEj2XcgHunL+f4m19N1pQuIJ23i2S6R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NW/wymcg; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b556284db11so1471015a12.0
        for <linux-input@vger.kernel.org>; Thu, 09 Oct 2025 21:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760070780; x=1760675580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XyrJveybM04Rr3oor0udXqV9lwgmjbA61MhuNWVw9RI=;
        b=NW/wymcgAvp0lG8tdNQYl7muanxUq1sU1c/BuX/nkTledT/Hi7f37nhTMT7XwLP0tx
         RXc6DWw6QvAMMpXp4eHXjQ4U6IUKt5VeRRG4tLCY0D2M2WUezxm4t8tKchfcVVwSjbWR
         2gG4yetccP/ApjULz+jw1KNiDKwSbkAOIMwxMrUIpYtS3XNqLpBpPo1vFCdlOWP3AUVx
         WQoVGCXBxkP/TRAsH0n1MAdc9D/o+JURKnE3FsuKE9wlIj1jsbXujo/CGCcT+kLs/jkp
         DrUq9cztPl5bmJe15NYq4wev4HsqlI7mz8hr5Gk4QezMFlR8B540StXh/NaldDiBq8Uc
         Rlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760070780; x=1760675580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyrJveybM04Rr3oor0udXqV9lwgmjbA61MhuNWVw9RI=;
        b=HERsmsnIvTxOXqUXahvOWRL44/la1iC4gMeGkhnr/1J/6Pv4OlEWJRGy3DS1cNMCDw
         9Ca32fNPjYIeoFOW79elN16MtcEzdZgNwmTUnYH0KVTj897SbA633Dd002hhUN12d4o3
         XKUMBpL7/cVurLsQnN65y7+00A/WfA4Hbccscwt3Uv/LWQA8RysCDtgGOYfuEcc5VlYN
         ic5FxI636+IVZh0FJ1Gim+bQfFTnQDuqCCYfI1WezdNjJ2D7z4MpD7JEtoe/Y9G3Y6Nk
         SAaSnfwqgUeE5GVPg7uv175fQ3OzJI/LT5Dg+FcwIAy5G8fVeAvYB9J4SLt5h6KT8gC0
         wEbQ==
X-Gm-Message-State: AOJu0YwCIDyusQhoZCAH0L/GHpGRvJJmSd5waN6PQ+XfkxxCBvjAGuWB
	tLCoUcaUCCGKIbFG5xbzUtFeTenjeCJCekbnswlPHbCiSEIopdx3M82q
X-Gm-Gg: ASbGncvspX+sNmygfOx5KnPjg8Op/N5inQaA0odn3Qie2sw8PM5UHjdC778Xcp6o7oS
	mU8aweXCxelDdSwQkNSF5tzrtf+5qvkPIXz1Ggw3BCk5aAilQ7/JId4XYG0vgrxLGrRB76Ie4vD
	GFvlB4gNjyavlgWrG/dFQIX/oozqSGYILJau+AjV3NDaNPlbqtNA6m8p6IfqCY0n4Flk49aumSt
	gWfmDrmj+J6gJdyF/tmT0kz/VQ8ISvoGuFOu6Z9f8z2cZcB0qAJgbD00wq8grLN9IG6lt8Ckyxv
	r9J3/CjvwgNX0cLmWiVmePUHz3cGhayGZnsWOIwET09X9Tpnm+tnF9oJ3J33jGUTrrBiOOfIFaW
	ivLxuIYQ8hZK3mL7rUHOk9Qd0iiFE/528wDt0EY9XD28lTUS2CJMNpsZqRIaPsbBKD2zVovS9FX
	TItywy
X-Google-Smtp-Source: AGHT+IF/aSv29EhfdhK2CMhN/u7bpz1gACAeA9/CuTwh5MOIndiBmVlguk5UcGWXYXQyIWoP36aFxQ==
X-Received: by 2002:a05:6a20:7493:b0:320:3da8:34d7 with SMTP id adf61e73a8af0-32da813b89emr12829534637.22.1760070779616;
        Thu, 09 Oct 2025 21:32:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c593:2dc:16de:acd1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-799283c1a14sm1487114b3a.0.2025.10.09.21.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 21:32:59 -0700 (PDT)
Date: Thu, 9 Oct 2025 21:32:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-input@vger.kernel.org, Nick Dyer <nick@shmanahar.org>
Subject: Re: [PATCH] Input: atmel_mxt_ts - allow reset GPIO to sleep
Message-ID: <zddx3fqotz223sff25wkbsjbh5opg3haseujyjtfhqh6ujytxo@jjlaeybstv27>
References: <20251005023335.166483-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005023335.166483-1-marek.vasut@mailbox.org>

On Sun, Oct 05, 2025 at 04:33:10AM +0200, Marek Vasut wrote:
> The reset GPIO is not toggled in any critical section where it couldn't
> sleep, allow the reset GPIO to sleep. This allows the driver to operate
> reset GPIOs connected to I2C GPIO expanders.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Tagged for stable and applied, thank you.

-- 
Dmitry

