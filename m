Return-Path: <linux-input+bounces-9406-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C30A17679
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 05:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC9F43AA7AD
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 04:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA106197A8F;
	Tue, 21 Jan 2025 04:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUvgs5x2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CFC193070
	for <linux-input@vger.kernel.org>; Tue, 21 Jan 2025 04:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737433232; cv=none; b=dBl+WXA/z334uGzrnPxQKdOGfgFIHWxWUV8A+0NPfw8BIJEbDLlZ5Kn2kcEuWqtZBsP6WzsrddInQYnHSdsN/wVd/ChHofR7wvwuJYIHDROeJbVmGEh+zu26nEvXccfwrhRFZRFDhNGQrwMTS+iUP2rKEjIjChWEBXPsIKbppbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737433232; c=relaxed/simple;
	bh=yY+hIEOvY/oNjACn3INgz0K/pVGLE9uf1R6uuPvkCec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WB1WRk1r/7aVeVoKBQzELU9KU8ULk1jAwZPd+kiYhxYHFvG0Q7TxcU0QIlb7V1PMqFv5xPk+H5Ua6Hkz87YQfs7ZiIZLP92K2egudXu6cTgx8IPkSisZZMvNr6XZy9z68CeJGp6pEuhX6J0P2WlTwwU0hh/XvHj9nYpYG8pgVEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUvgs5x2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21631789fcdso74467335ad.1
        for <linux-input@vger.kernel.org>; Mon, 20 Jan 2025 20:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737433230; x=1738038030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4zzz/WhfAsWrPC4G8EVD2fL5MXAPzXS5/McVGs6u7w8=;
        b=LUvgs5x2UKpD2baJb+LISFXHFQ4eUFnb9ANfA487NjXu0ya+b+fxxMvyRfUNMPmrNh
         fNmbL8KGDrtsUaR+h8m7kQdq4gU7XQSkLoEb9HXRInchGFD7oKTrmrPPdgeetGNnKoJ9
         52W32vcbcOxiB6tJSIzi3PcHY373tYV3rYG45sdlbLlzAKJKIqIB17HsTbq7AOQT/OE8
         eB/HQi/gB5jf6JC8aAefbJ3kdYhhp3l9Y5ED9K+RpZr3sitpalUTD8+SBxQ2SpWtaizl
         GcNBEbMRP4c5PYI+4cBQKYU6aM1YLlGB1/ypUXbKBSfDMfa3Jgy8E3BdGlLUArYgyoX+
         GbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737433230; x=1738038030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zzz/WhfAsWrPC4G8EVD2fL5MXAPzXS5/McVGs6u7w8=;
        b=Lb4xhhLq0rgFfEEtPGR+XRDXt0iJj5E5AElGrQ+qFUul5dcM+k8zDiH+tHDQkw9dGC
         shcJONnp1xDmVEoKPONBT7gmTuYNM21eecVICBozSejVgx/UVqJXHPEbYB76YmgAI7X5
         HxMCDNqRX56AtDJdk3vU/Mcyz53Q2u/lpvb1gN757kfz9VB1wiV7nJpyFi+xl0jwFweQ
         hlv4MiCvuy5okN2hQNes9UQFx1qHZs752t5i5elDT6wdG8EB3Qn4cIXQx1U/SwS2Mi2E
         yVRd2/fR5gp0142fwulIjxlVMyabk2QM2rhr1DIhMiMF5k6D2Jmm+pQtPX6gc6sRE2Ku
         ooBQ==
X-Gm-Message-State: AOJu0Yx457qew1/Knk1DKap1QqPMD3cJSy4hgN0II3Ym+2iQOckuEJzW
	tCtA3AqedA4blKX36PJ/kd3pQJndMqqxZSG8o6GwjF1xewo7f7imPK4FPQ==
X-Gm-Gg: ASbGncuFGmJlcklgq276uPN7nJtNIy0wfKMS1XLgiDwf4c5aSH6/8Ze2gyVYHdRdV8P
	bRum5cJZZkSeouLnk1ZWzoe1xCc9NzqN6H0w19vB8f82pk6wZty3OPylXfCjaBKJz6ZtzTSPnyt
	AZkJNKPqLeCW85aRoiRpMwWwe/PWsqmhVUEscalobu04f0q0ISJZdOQeMMdWc75GKNmQpbxYiOc
	CPBxHJV9Y2pUhbCctd2X6OHE6w/C0lyMGSBKCMzGmuNeUzRvrg4ToGe9I2A2HuKHcs6lbs=
X-Google-Smtp-Source: AGHT+IGlRE7QhGuyNfvAoHg6m/qoQZ8CaH34+qlapRSrGoa4P4AuqPNfA9MPTO4fQ3Tg/ZR3qVU9Uw==
X-Received: by 2002:a05:6a20:6a0b:b0:1e1:a789:1b4d with SMTP id adf61e73a8af0-1eb21711b91mr21891305637.15.1737433230349;
        Mon, 20 Jan 2025 20:20:30 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:9fc4:f41e:933e:403a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7effe4sm7918840b3a.8.2025.01.20.20.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 20:20:29 -0800 (PST)
Date: Mon, 20 Jan 2025 20:20:27 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pavel Rojtberg <rojtberg@gmail.com>
Cc: linux-input@vger.kernel.org, gregkh@linuxfoundation.org,
	Leonardo Brondani Schenkel <leonardo@schenkel.net>
Subject: Re: [PATCH v3 01/11] Input: xpad - improve name of 8BitDo controller
 2dc8:3106
Message-ID: <Z48gi_i5GhFajiSE@google.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
 <20250107192830.414709-2-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107192830.414709-2-rojtberg@gmail.com>

On Tue, Jan 07, 2025 at 08:28:20PM +0100, Pavel Rojtberg wrote:
> From: Leonardo Brondani Schenkel <leonardo@schenkel.net>
> 
> 8BitDo Pro 2 Wired Controller shares the same USB identifier
> (2dc8:3106) as a different device, so amend name to reflect that and
> reduce confusion as the user might think the controller was misdetected.
> 
> I have personally tested it and I can confirm that Pro 2 Wired will also
> not work in XTYPE_XBOXONE mode (buton presses won't register), therefore
> XTYPE_XBOX360 remains appropriate.
> 
> Signed-off-by: Leonardo Brondani Schenkel <leonardo@schenkel.net>
> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>

Applied, thank you.Applied, thank you.

Thanks.

-- 
Dmitry

