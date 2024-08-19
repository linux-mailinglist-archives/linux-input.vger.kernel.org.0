Return-Path: <linux-input+bounces-5635-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 803489562A8
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 06:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D8F01F22273
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 04:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAB645007;
	Mon, 19 Aug 2024 04:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoUl13lC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1BE2BD19;
	Mon, 19 Aug 2024 04:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724041918; cv=none; b=Mx2whuOHw+2dfXEYACnnY5iRYHHrSAKiDNwK8vN7Yxv5JyKHfgq9N2EmmVLkSIzQtvHgsw+5tk0Z7AzeW75szYLHlISfPqVWZLj6BFceexmnPv4f7v86cRwGDCF9xPBsp+1cJnn5dyqaX5ZaMJ+7iR9cF6hKmiD4T3jLmqb2LbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724041918; c=relaxed/simple;
	bh=U+EGGC9xM1D1d10amOKd5j6vNWdUdynEEyMYIdLcd88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKjml+bZMjE2A/+28mnsIlbAjGqMBfkIuZVdq7Vn1qcwQuNSUR54EcgT4P6ZE5/Sm7T9KMAL8plC7aeqC2MnaSAgM6tQ0KiT4UHks+/e35lA9oAGzwEnZjw42tcOxzl/EB47aML67DgaoNeW/bV1e5/ctMUQmCW1Unm/qUKtzjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoUl13lC; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7a18ba4143bso2374410a12.2;
        Sun, 18 Aug 2024 21:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724041916; x=1724646716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pjEw3wQOMf1AKn43BEx21ZcKh5pn+wfGqK3TxJhADLk=;
        b=IoUl13lCvQ1RprjUx3//Q0ItYKmAZxG8omkb3wK4Rz4upr9IAjB689szQvoOwtsNHi
         vekhsuLdcjwAdx63tLYc0PgerAkw39tYPJdCCpf6NlzsIKq5HFiucMAgR0r9Z4BsOpNB
         8Gt5tmzYaays76ACw9mrCEjzgq3kCV9qk+WpfXKZLHf+MSvd7vKqWLy41uVdJyR05m5/
         tLXCjp8t4i7+g9QoBNh9ScxIr5xRNioQ3dDobNuLF2u1oJD+smlieblkZkgYqqASIjyW
         Ag6bPDD9JkY+kJGRCQCY9R7hdT7juaTnin37JOl7LN+ErMOw3B8HcTcrcveGesDGEGhV
         y5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724041916; x=1724646716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjEw3wQOMf1AKn43BEx21ZcKh5pn+wfGqK3TxJhADLk=;
        b=U0AOvQ7JCCVidOhPybk1Mw0aJY35EHJjdAoDMN0n0iXy+V44xnJ+95g8Ygl9MP0sQv
         1pWPwI4bLFTrm+qann3Mz8nuytFDWwVlnN/xKfcJ78rU3C7aGF9wyOQrIPkdFeKhfcY0
         YLCvuhfn9nJsrNe3SmUgVvWIhtVtxA39jNzTwxzUSdEtksS3tdvyUDGQI2fz3iDWLHM1
         VYI/AXdagdc86S6v67cL7/ZRDtYIWLkPvfSkuD4BP/LidQSKJZ4QWazTFkUuaoVPja82
         NqJ7h9P6tT6NQr13f8kWzBUX+cy9mqlb/NPNVas68yDNMDKYY1dTYaIDiGy3uDbyV0Tc
         hfAg==
X-Forwarded-Encrypted: i=1; AJvYcCU1qgJ0XcMDoY6tNEWQDjOva3c8pEHnbvat7ce0ZD/UN3Gx3ZesbEHchYlHjL+UP9G9soEl1fiU1zLpAnHRo3sOyfKfUAe0evyb5FclwprL40DBVhs/1pLBnoxfXrE6+wzG4kzL52qxqHs=
X-Gm-Message-State: AOJu0Yziy3pJntjCTGH92zDs9wtC79OdY/PUBGZVHyFCVLHFbGZ52otl
	69tgBh0kWbePDl3iRAFnveHvGaGA99iW+/GgdfvyfARAKoJUj/Qg
X-Google-Smtp-Source: AGHT+IF4MZ7GWBIIa+SeQgRUZIEcXrAn1USWIEwcTi8KCIlmk9Rq26wkTu9Kh7gV3HogBI221/DBQQ==
X-Received: by 2002:a17:90b:19c9:b0:2d3:c0b9:7c2a with SMTP id 98e67ed59e1d1-2d3dfd8bef4mr8247906a91.20.1724041915591;
        Sun, 18 Aug 2024 21:31:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3bc1b86casm8823439a91.1.2024.08.18.21.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:31:55 -0700 (PDT)
Date: Sun, 18 Aug 2024 21:31:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: hdegoede@redhat.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i8042: Use new forcenorestore quirk to replace
 old buggy quirk combination
Message-ID: <ZsLKuKpBzh9fg5qM@google.com>
References: <20240104183118.779778-1-wse@tuxedocomputers.com>
 <20240104183118.779778-3-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104183118.779778-3-wse@tuxedocomputers.com>

On Thu, Jan 04, 2024 at 07:31:18PM +0100, Werner Sembach wrote:
> The old quirk combination sometimes cause a laggy keyboard after boot. With
> the new quirk the initial issue of an unresponsive keyboard after s3 resume
> is also fixed, but it doesn't have the negative side effect of the
> sometimes laggy keyboard.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org

Applied, thank you.

-- 
Dmitry

