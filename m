Return-Path: <linux-input+bounces-10378-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C513A4514C
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 01:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B6C37A42E0
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 00:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BF9139B;
	Wed, 26 Feb 2025 00:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeL8ICpC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58D28F6B;
	Wed, 26 Feb 2025 00:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740528852; cv=none; b=MWIzrWsA1fEEecVuf+N151UPzqDlesZ+m6VWpU6xIjlZNl0C85BvZ1vu5Rnysgcn3YmdLbWLXJN6IAfQwcpZbKvKspFEolKNQVzhg6TXP92/j4HgltD68wV/nknCXl9YDP+YYKRZN5tow7ahKD0RtfH4ko3eJiKv7XYj7TT2eYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740528852; c=relaxed/simple;
	bh=+eq8ESR4HuncmGJTwL/17OODCDsruEYP3bI/pNyOpcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdN2QR1TPDu9nhU2cL7YJWh1hskUo0kwhkgV24ttjqaZ/mSeMjoTdHiVmHVGEOtoTqZENs8QvhZmB2OVdc+gBvXSeLHjPSjTR+g8ewZsPhpvcuD/Ks13nS9uuLGg1MRsKvqseSkeHojiR8+s6VM3adBOOZCipBa7mSUyHSxpjUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeL8ICpC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22114b800f7so124822135ad.2;
        Tue, 25 Feb 2025 16:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740528850; x=1741133650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1v5QKjkHMHcYNy4IuBHegZYJHhBS5j7m3XIy0+zFjo=;
        b=ZeL8ICpCbzr3DfSKiw6yjdtakAdUvuAla0uNMVcL+tBOJOhG5HVma7l4bty2/s51Tk
         8UstrDDrd4+NR6v6sA0JX3GEB1zFC6QDcWjEzaZYY+xgZyrO+OAd1oZ6xCChgAelcJ/Y
         lamNPe6Ic4XzUXbKjaRsuiYSSVDpzmvAsxeU7mXQgaERyb+9/UaceigYCUayy8IBbxj/
         jI2PasjEmfzNlBOpVJ8f+pfZFZJnoNMCbhUybKUoZKV2aDm0enF/P7aD0hLhSrWlMEkf
         NJKU6+lADP+lvI8aoO48vsRRTUaDdbdntFjEo7seFzNWGh3QKjd5mh31XnKWpmZiIN15
         2N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740528850; x=1741133650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1v5QKjkHMHcYNy4IuBHegZYJHhBS5j7m3XIy0+zFjo=;
        b=vhrjqN2wrY1zusOvC7dzRRshSzWe3slQomCYhittl3PJExg1OXkcc5k9gHW6nnlaiK
         zO8uliUbhP9Y/BUtanRxRmOGMADJmRp6ToVWRylcmRWZ3RFVuR37OybHu1XqNjcwmhKQ
         aiy2YLUJ4xyAh+RNJpf8qQafCw0uBqm36J5yCs1C2ZFVgHGMJ63Lcz8aJ+JHY7C+uqTF
         Z1kfPX0a1G7OIwPgfwPYd1+uMMSEs56j48/O2upbd6asrnYbnCRhuNPXNrZk8/tL2E+s
         ncMnicNyTD8Py2aSCeE1KZilS1o3teFerml9edRYkfCHENyA4ceoiieSX+k2xVL1pucx
         ja9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7EMXdmIAuxtz7UzQiu1y+fYfX1f97L/Gd2rBkr9TEhTQ/X7j01NZYKmHxmUQ4XBFVNZniUVNbxsNTzng=@vger.kernel.org, AJvYcCXPSF2NrzXqRy+1sZt2y3BLdEVmOLBRH1VZuPEJt2O9t1L8SNWfCMqf4m1yfzZaXtSwnrTgm1y9/ODU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3S8t4DL0ILADwbda334a8K1PQ2jnYciyW7bLf05s/KEf9eqMi
	T6KFf3IJjvkWxFbjoznJgoHH+ZJTchpG1YrK9cKB/IJdGL87/xnOk6jtZw==
X-Gm-Gg: ASbGncuK7anfXj1yAeEZdOz6tEpcnbULwcOwWEoveEFsCqfTzKxFlTwYei/wR7EpDgf
	GBTbu3Po7upGJozpRVEikRkPluSQHTmudOy+Plgp7DXuS7i4wGMSNU/VV0r/7rvFkIeSDFEubpf
	msh5t4wNx4UZ3nPktddvJHDH46GSa/fk11v4C35Vy2YLxxndV72ctwNB+PdEsz4bGAhHo4yz0bu
	eT3tc+akA5BeyeB2WGn/0PMq63vaPg29aBMedv1EmWbGOO3RTAcv0zDjMonpqCu2FK9+MqknZXa
	w29hqE+xBXFIlb4US5C6GbezUnfcpQqwROx2BROK6WvZpQ==
X-Google-Smtp-Source: AGHT+IG8jOjL9PeXnru8FoS8QsnN9zHQPfLveyAAaqO6qZKOVdholZjrtNjlTBiLALLvzgIcScDGEA==
X-Received: by 2002:a05:6a00:3a26:b0:732:56cb:2f83 with SMTP id d2e1a72fcca58-7348be2a234mr2001343b3a.15.1740528850101;
        Tue, 25 Feb 2025 16:14:10 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:987e:29fc:176a:2ed5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a836c9bsm2160225b3a.158.2025.02.25.16.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 16:14:09 -0800 (PST)
Date: Tue, 25 Feb 2025 16:14:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, Manuel Traut <manuel.traut@mt.com>
Subject: Re: [PATCH v5 5/7] dt-bindings: input: matrix_keypad - add settle
 time after enable all columns
Message-ID: <Z75cz2eo7ec1L9DI@google.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-6-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110054906.354296-6-markus.burri@mt.com>

On Fri, Jan 10, 2025 at 06:49:04AM +0100, Markus Burri wrote:
> Matrix_keypad with high capacity need a longer settle time after enable
> all columns.
> Add optional property to specify the settle time
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 

Applied, thank you.

-- 
Dmitry

