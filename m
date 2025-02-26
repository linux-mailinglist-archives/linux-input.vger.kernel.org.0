Return-Path: <linux-input+bounces-10376-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC700A45146
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 01:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AB783B027B
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 00:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83738EBE;
	Wed, 26 Feb 2025 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCZantaI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20512137E;
	Wed, 26 Feb 2025 00:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740528827; cv=none; b=gZjtmuIGiagnUEOxmVUw1e0S7ngLvBs9zMHCstXXUWReNY17KLFONJZ+AuX1Rp/PbpjXk1fx0kKZaYhQiFjZ7SQ/nkBRmPpn3tfPkndevuMWCmHsfNOADJMx2k22yV6wHnULWQFhA5YfDHEezbShNCjjoU16VSa4P4Zd2HD2+q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740528827; c=relaxed/simple;
	bh=PzVNUG000ct8R44gPVvZYecM1hdlAVm9/GtPbCuWaLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B68GJeNQMv88nCBjgWsiRvIYeZ0HdMp0AUthEEZzw6N7o3HFy+GI7Let6cD+L4vi5rYPFDtjtmmFABjUDzjW2tK1zSP8mhkudN6DiQfbw9P5ZjpVmOAZSsp3bEDRVmRdEK6FEnfhhrl7fjWQQ6GdAcXM4wwBaZ9nzPlILKzbYak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCZantaI; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-222e8d07dc6so5946285ad.1;
        Tue, 25 Feb 2025 16:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740528825; x=1741133625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1CSgXBZpC18wOK2lJ/9iUW5ZA+LG+en5lfcuhMrVRI=;
        b=fCZantaIq6rd1QPcOLYTSiCBar/dFdVYo5X78kQGcwZsd4rE3fiaB1jUWhrCVd9sCU
         c5Z36ZIzqS5MKUzEuPsSjhBj9e5NJJ6CQ5XYhg94+qZ2QZeg2NZfCQPtgNx2Ss+XJJTs
         rORuv/zPiQoFDrKJ/cY8b7kx5h5S5wUx0S/GU8tZuHm0j3ooyhL7ua8cMFVXcACxHrPx
         nLIK+FzXVEvpHnrHCDs4RMEV4Sy2qp6eXYAOoyFAsovql7fEpOPwQ3RsQEwY7rGN+xbz
         hvHxcIGeNQhGAjxp4ZOYJstxzurUR2kzSZcVYdK9qM3N2eCm5DhD8Enr5j2Y0gi1h5s7
         XgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740528825; x=1741133625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1CSgXBZpC18wOK2lJ/9iUW5ZA+LG+en5lfcuhMrVRI=;
        b=MUJz+Eza5XRH0iQp3c/zAEXb6AD14g9JRh5R5kc6/EnCxmYN+8456bnbC1ZKJCDxy/
         Ks98F0i69RymBVSEc8ghTSK6rqIDqPGaytPc5++PMVLNQmKlHtrfcc8UhCzmkcJJoDvN
         lPqAfdI/zBZzP/UBKBE9qR1eccbbKrlLsc+OCNBhU15i8KZNckMiI1Oe3sL9g1sEFcKl
         HhcvX6AeipFqsr1tRHSCzYethTZLRTr9Is4WrrZ0/4h1BrhV1BgGcJkUmV0llpP+GMXY
         pReEDIiSA6WT28lxNjFh072DZsyOBw+GCsqaRG3PZvC08q7qTbZ9vKjwxeNxhMWdcihQ
         9Wjw==
X-Forwarded-Encrypted: i=1; AJvYcCVL5L8bHhTtN0CnZgQcP9COt71+4YaIp/W5hRU6J7tWtS8X25g/muF6RsbhsUKqE9PV6CeO4WKg2lX6@vger.kernel.org, AJvYcCW9OEVbIOYqOSDQhCmkc+uEImTevdI/q7XKzJAFG9Ge2gHYnTtQ9LaLIKYqwzNckOd0S5HOR039aWyNjuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuGccbbuPMec6Z0pAKj7TYIA/gf0vyEntB2z8GrHk5tQZOGbYL
	CwQzuHr1mwmsIIduO2LJFCQ7NyczXCN8Okf68qTjtUDfnu2f5vnM
X-Gm-Gg: ASbGncuRgReZiNK62SDgPf3qF9TUq76KwaclFfKlxron6WF8idsM3Md/18KkJqIgkmP
	BQGycAXkBhuHFo1QKWYQa2QgpUSJP1WS7KDcD44eh4wMkh3Z9hciNbmN88SqH5LtFcVjBFYECdj
	G7ar+xQzbKxPqYZAf13IyjASkZV5xGRX+oJDwnfju9OdRxaBp7fVsiV3336fhHDcIpQhIk+lV3b
	PEcsCclXgLEPuDbKDIkJYXnXFm8GT2ejvfsLCVpDXhfuHDOCp3lEnLf1DmeLQ3tT1TEB/YgooQ9
	AWtDVnHLfN73fiF6UPwJCf5mq5E=
X-Google-Smtp-Source: AGHT+IGR7LbuYILVmABIATut+n7vRvbsBpmGck5ZbKCSeWM8Wgd2Lmt8tZc9+Vn9GkcG72LWIzdHoQ==
X-Received: by 2002:a17:902:d54e:b0:21f:3d0d:2408 with SMTP id d9443c01a7336-2218c3e3876mr412688665ad.10.1740528825188;
        Tue, 25 Feb 2025 16:13:45 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:987e:29fc:176a:2ed5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0a6252sm20231975ad.186.2025.02.25.16.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 16:13:44 -0800 (PST)
Date: Tue, 25 Feb 2025 16:13:41 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, Manuel Traut <manuel.traut@mt.com>
Subject: Re: [PATCH v5 1/7] Input: matrix_keypad - use fsleep for variable
 delay duration
Message-ID: <Z75ctaqUMUOx9bdi@google.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-2-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110054906.354296-2-markus.burri@mt.com>

On Fri, Jan 10, 2025 at 06:49:00AM +0100, Markus Burri wrote:
> The delay is retrieved from a device-tree property, so the duration is
> variable. fsleep guesses the best delay function based on duration.
> 
> see Documentation/timers/delay_sleep_functions.rst
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> 

Applied, thank you.

-- 
Dmitry

