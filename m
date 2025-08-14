Return-Path: <linux-input+bounces-14006-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A5B26305
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 12:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D8C77B1ACF
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 10:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F7C2C0F67;
	Thu, 14 Aug 2025 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WM6SMPss"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689FE25A2D8;
	Thu, 14 Aug 2025 10:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168189; cv=none; b=ms70h43To8j2RgURcNEuYEFMW9Ud/NP8YoqzFGecJOlbZrRPVJZUQT3bTtJxV22I4PWbrjI4AJpTzFCXUOEaiRGxRbeGiitzQpR4Ab2pC8hURtvwSsLSOWEvZ8rIVw8Wek1K15EA77xzFOCoGfj34EgFFeojVjJEs3em7bn4L3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168189; c=relaxed/simple;
	bh=9xh2Nft5Qxdo2gHxv00QeRiNf5440z4bTPZ674GGC18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBX0ehMU1wEtG4UmgCCXnstpDNALjlurVHXRsRqM0Wo0IAEN5xbtcU8yg6XypbFLq5p64tU+cDV7W3+8Qrj6v9dxCIauOTTbSwSiFbFVjnoLOMcsPVA3AhtVQc+vWqhVYltNDr8NW4qtUyklx1VzBrCryfxfGQjbEbZrs4y/DcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WM6SMPss; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so3769775e9.2;
        Thu, 14 Aug 2025 03:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755168186; x=1755772986; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jMgZVJV8GbdzEDE5ofwso5AKnFy8hsBf9wu7z3fU3lo=;
        b=WM6SMPssixKzfGFoKs1teDySWZVTAqDXE1M6KwE06q3J9RPVXHabECJgyvvq8UQhbZ
         xg4DbvDBlBzUpvaH/+xcpj+3M9uZWQgs8b9Nyg+p94a8baaqcRQyGXlRKekQ81x1smQ0
         nzTc2JRjY1s4FuMFQY6hQtmLQ7vfYABII+kk9sOFMsS3A/HieE4Mqqm+LTtd4QaMORUm
         mWz5FiPw/6+jvhPKPYYzY0Sc2oQky6ggNitQCvkxuRRARYNQtPmrSk0URscmujb7yg3h
         HNxqSuVZ4t8e7hnYHHaZn0nOsckjrTR61dAqoKRw/hv1sFrO3LU3D75eWUavvOCnTVse
         bHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168186; x=1755772986;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMgZVJV8GbdzEDE5ofwso5AKnFy8hsBf9wu7z3fU3lo=;
        b=A3GGsxtKM2M23WfUyq8Od97DIBldEin0gsMcynlnD3S98ACKnztPu1G1P8YCajIlVb
         aQRLo/etD6QSBP3Atrt8AJtJnr6Go+TzQex1Gz5tXlplZ0HW0KMW+o050wlx7aj4yEze
         B3rPveFu6qzq7miR4XkMqSavuXOJA5C7hXAkbzJNr+OoFg2GUs6begN28sJwDMhgvGUs
         U+hd7AP1v2ND7lIMhWXn5tn8311xalIAYSiXg6F+6shn6Oo8nhtVh0r7/yEiroi3gzp9
         ah+yNGNazO2SHVTe1g4GBLC6ajA2PVmuy5wN4j6cTe9S8ldKzQZmv+iIIMlpGdj/Mc1w
         aZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCVlcL/7tCIC1Q8nYiMyyoneysC82OUQXLJ6xrTYbv+A0XeFHnLUHljpP/ENWZO5kEKbWSVkAfwmw+7Xefyw@vger.kernel.org, AJvYcCWmyY3cZxYOZxssTZfTOkyObGAvIQ9NC8Ss1dAsNszUFhNOx4Ym/TiV3+BzhsSvXLzEnbS3u4Je97cRMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywTfnK5yfI7jEHsaxNrbfq+YJyPSXhSIhaXgg8gJ13si4RHeNr
	QaUStxqP7EIaZYm6BSp21tCuUcKyn5IbBEKNtLhm+rh6Z4yc6d0eEEwR
X-Gm-Gg: ASbGncsJyIbW5F/R6im9RJIAqzJ6rqW0rOqbAF8TVSxxfP/fkwDobn+QA5m2VYiuv3e
	l9aWb+yO8sa6uDnz/ycCErVVSIGJEe8H/lj02BOsvY2smVAA1+zEQON/wNht1mc6M2a78SZBqYo
	kPs2uPSBvJLTrthCZvM3tw8Pd2rVRx7BLAspzTThHKY/s36R2388RcF/QU38SpzJ8PTZqaZ6inG
	OMSuZq2Sen78HW2fRWQg6hYvaUZXaHXfvSuKsYPjQrexzO5k1On+R4fWOc1n37y+MRK4eXQo6O/
	o2ncwhPjWZNTt33EHzmkizOloogef1h77RDL7iAiSRaNlzWq9SQ0pLu5i9/B96RY6+nmqjdiVNQ
	JpQ6Np+aR1NHvR+4nyVz5Zj7NJEVXUg==
X-Google-Smtp-Source: AGHT+IE8U7YEJr/vjLhJ1eyFnFBHbO16i39TNttYrnx/WJArcafNfbz6A0kvScoL9qfUBS2aW1vLFA==
X-Received: by 2002:a05:600c:35d3:b0:456:1514:5b04 with SMTP id 5b1f17b1804b1-45a1b6554f3mr16357915e9.21.1755168185550;
        Thu, 14 Aug 2025 03:43:05 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76f055sm16789975e9.22.2025.08.14.03.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:43:04 -0700 (PDT)
Date: Thu, 14 Aug 2025 12:43:02 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: bentiss@kernel.org, luguohong@xiaomi.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] HID: input: report battery status changes
 immediately
Message-ID: <aJ29tlqoQYFa-WYt@fedora>
References: <20250806073944.5310-1-jose.exposito89@gmail.com>
 <20250806073944.5310-2-jose.exposito89@gmail.com>
 <4q4qn3p8-6s3s-289n-44s2-43s76qrs2oo4@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4q4qn3p8-6s3s-289n-44s2-43s76qrs2oo4@xreary.bet>

Hi Jiri,

On Mon, Aug 11, 2025 at 01:48:22PM +0200, Jiri Kosina wrote:
> On Wed, 6 Aug 2025, José Expósito wrote:
> 
> > When the battery status changes, report the change immediately to user
> > space.
> 
> Could you please make the changelog a little bit more elaborative, i.e. 
> why is it needed, what user-visible behavior change/improvement it brings, 
> etc.
> 
> I know it's in the e-mail thread, but at least some summary should go also 
> to the commit itself.

Thanks a lot for reviewing these patches.

I sent v3 with a more detailed description of the fix:
https://lore.kernel.org/linux-input/20250814103947.116139-1-jose.exposito89@gmail.com/

Jose

> Thanks,
> 
> -- 
> Jiri Kosina
> SUSE Labs
> 

