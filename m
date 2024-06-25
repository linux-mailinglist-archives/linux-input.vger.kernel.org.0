Return-Path: <linux-input+bounces-4619-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE362916DD4
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 18:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BFB1B22E79
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 16:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1491216D323;
	Tue, 25 Jun 2024 16:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qw/aowst"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812711BC23;
	Tue, 25 Jun 2024 16:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719332075; cv=none; b=aG0QYIi00HAIQ+7lD96FNwE1BldF+Ad8voYnYim3vf8ciqlD1gDXHZqoDH30kiK2x3jigj9m+D8ctMk0N3Scs4nhYhQ4oI2DBaxdZaBbkjUuO2BVJ2/kE/fROzhGARb3UkMmXdYm7FMq1iZq40x6ne9op3CtoSdbFA9VFt94U2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719332075; c=relaxed/simple;
	bh=0cepQ8DTy2dd7hDBl1FBxJREPoxG0e83dtyZ38Xz36I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8ArW2GsjBpVQWWL+fYaV0yfm7sHrOxbzqsOR6FEcAyFWoupYJD0JiFR9LBeJFq5FHmjzOl5Za55/jlvx0QHTu3BcTItN52TySrPIQMSK7x37hN0FHjY2KI61om+vmaVF36RzZvITVbOhl0dqlZWQLbXXPpDVAdlNuhhTAYppew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qw/aowst; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2c81fe42e53so3319871a91.3;
        Tue, 25 Jun 2024 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719332073; x=1719936873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r7lvyqQ/bh+Zu96Z19nUVf4NW7qOys3muVGUV5WCLYg=;
        b=Qw/aowstLlytzT7lI0ixP3URo749A4E4C0Nz/Cn0Hz6MdKrXEzjIk4rMN8V1MktGlV
         utuxnerjs70YaqSEg35zfMpeKQ2s1mZFBLN7sy9P+qKZ2Y/4cmElVMk85iDzIjvV9RXW
         TEG6Uskocl2HEUj90WsoHI+tyY5YFj2GRi+/8V2/8Qn+5NS1wqiiOd7zkL4YSF2JSCsS
         d4/YIERTBaJClnf+X2Qb2NF86Bn9wuwMjW83IcJ2Oy+bO02XQCXjBolxDSrfmtvtiuJ/
         syIQ7KJ04Fg9NeGODHh70LBnlhumkNMl1eyF6WJ6ADMLRkhApzVRbn5BRHwXi7iBtkiu
         /uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719332073; x=1719936873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7lvyqQ/bh+Zu96Z19nUVf4NW7qOys3muVGUV5WCLYg=;
        b=qEdVGXOhIPj2SD7JclgyDKvbVmmwVqeyp90Mal/GGBgimUT3Z/6GZOFqzDZvZXMhbw
         f3Sa4x7ITwozASa3PE/qdYkGYyT7VJrtlGUvztbzgrR5qaTb85mxKaX5cfHSFo8zeZku
         m2gmDJ8snz9aiLnNDgIBwp4keUOvJ+2jLoTY7xRBSevpqjlItSRqel2/zU9xyyU63sY7
         izPoieNy3jcjqR7pn/5Md6bvkz73RyFLPT6psdjrDM67qgSENLiF2/I/Pc/h2oYKNagl
         cCxqZNEi6+jjIeuNXrSG75h9k3xWq1NSRLt3OM5mwtfzEdphvs2DU54chkMxcDpSlU/+
         R+cg==
X-Forwarded-Encrypted: i=1; AJvYcCW+ZiZsPXRQSsg2BN6ZcHMquostXZuELOevpT4M9CGk3E16Si2i0e2cJYK57v7d9mmyb411qAk9/s463DB3xvzy45FNO2vIo9slPuBzAiqzrs4FBwmZ+LX2R+Im5PdVydNjC69/BCv7Kkc=
X-Gm-Message-State: AOJu0YzeCfc4n1CXsWG78z7kGCWOAFRFc4ULYLZEJ7/860qeIoK7SSzS
	CZnQvyDapB0NZZIo3QuXZol7kPiE1oGY56rnkD2od/Q3wmRoJWSW
X-Google-Smtp-Source: AGHT+IGOj7PYUzqYXS7lK06vRPtKJ6R8Xd9yzfHf170bY0pHwHK6TYk2DBv7+efjA2IM3JLNItk1Eg==
X-Received: by 2002:a17:90b:4c41:b0:2c3:213b:d0b1 with SMTP id 98e67ed59e1d1-2c86127e2a8mr6883282a91.5.1719332072587;
        Tue, 25 Jun 2024 09:14:32 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ff4:b46e:2948:c244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819dbcd88sm8951847a91.37.2024.06.25.09.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:14:32 -0700 (PDT)
Date: Tue, 25 Jun 2024 09:14:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: robh@kernel.org, m.felsch@pengutronix.de, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Lalaev <andrei.lalaev@anton-paar.com>
Subject: Re: [PATCH] Input: qt1050 - handle CHIP_ID reading error
Message-ID: <Znrs5QVAuSjH5sCT@google.com>
References: <20240617183018.916234-1-andrey.lalaev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617183018.916234-1-andrey.lalaev@gmail.com>

On Mon, Jun 17, 2024 at 08:30:18PM +0200, Andrei Lalaev wrote:
> From: Andrei Lalaev <andrei.lalaev@anton-paar.com>
> 
> If the device is missing, we get the following error:
> 
>   qt1050 3-0041: ID -1340767592 not supported
> 
> Let's handle this situation and print more informative error
> when reading of CHIP_ID fails:
> 
>   qt1050 3-0041: Failed to read chip ID: -6
> 
> Fixes: cbebf5addec1 ("Input: qt1050 - add Microchip AT42QT1050 support")
> Signed-off-by: Andrei Lalaev <andrei.lalaev@anton-paar.com>

Applied, thank you.

But how did we get into the situation with the chip being missing?
Incorrect DTB for the board?

Thanks.

-- 
Dmitry

