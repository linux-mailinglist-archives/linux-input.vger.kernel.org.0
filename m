Return-Path: <linux-input+bounces-17227-lists+linux-input=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-input@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJqkI1POb2mgMQAAu9opvQ
	(envelope-from <linux-input+bounces-17227-lists+linux-input=lfdr.de@vger.kernel.org>)
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 19:49:55 +0100
X-Original-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EED6649CAC
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 19:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02C5B9708E7
	for <lists+linux-input@lfdr.de>; Tue, 20 Jan 2026 18:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3E64657F3;
	Tue, 20 Jan 2026 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+2bdaxq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439344657EB
	for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 18:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768933518; cv=none; b=WvdoTBzbhnqhVhaI2RyNeb10k36r9n4wCXMEfYdGT1QY38/TbO635bwwCo8xG6ZUD+jbVezvnEt440Np5yWqQRGGXANqZJIdvhVHRIkMXHWHb5/jp2NNfJvNMP1HVzKEb9udALnpfRsY2xd7IgqACbkNTbCxINMD+906T26up3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768933518; c=relaxed/simple;
	bh=/majb68NZLle+sZZ2y2oJqxlBq+JGPPCK5WcFsqxy1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNqsPoaZvGiILUApmX7xh412BCU7pxtR7glBt3SqCN6sgxYkOIS4fyQPiguLJYmNzqVB4o5n+LN+1CeCLPK07aq8T1Td0Z/nOlCS+IpkP7dDuIOeOmP6JHvpeR1AU124nGfOCfkPe3IQPc1OrMyRwqtMhtFpLgj0+ycSJfKwdjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+2bdaxq; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6f85470b6so2402325eec.1
        for <linux-input@vger.kernel.org>; Tue, 20 Jan 2026 10:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768933515; x=1769538315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xv2BCMRvJI4AEzFRhX5RI8tLqrofx98qgSkyulQwJX4=;
        b=X+2bdaxqFd+bqdlcm2jtfY9dVIxHMeviwkZ0UpBh2325SGKRU0hdZhuNPJ6VjF7clX
         ITZmCmvx/1Lam/HqKevzPs89loXDCwWFkhzM7ixikdK4sCbORColXIhkGcnBj/bRQCEa
         w0BPxwPthqzQ9qHR2Kz7ZBN+u+nC9BEVQGwnxZHbM1kGerO4ekyAXc2Gd8PRqpMiTvb7
         hO5xZV/kcIaN+iS/zZa7TiZ5LxMYh+o2TD9vtw/rSbAOnMTk0yDdahKzPuOHP9k/d6RI
         iiudHGj+6aOkF+qAnGP+Z9Od/5FFHlWwEqz5S1rXmlaGLL5a7wNRxtimXY0sMr1XlXA6
         oWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768933515; x=1769538315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xv2BCMRvJI4AEzFRhX5RI8tLqrofx98qgSkyulQwJX4=;
        b=lk/lmNWDhrRzL0UroIbUQ433E0+3U7kH8NVbteGI6BtigfwU3K/P+PEx2VGWjoE/i6
         YhRRpzWfWK1/oM5RCWBlVS3UgcLZ5nM05BrGncfCsr0Ecr1Ib6O+5LdhBEOJSmf358Iv
         NuWHKIavdZM25tYIgIOalTWiXQZa1PZTY58F0CKQkUU6DTgxiKZK6alCPys+xz24QTGf
         R228ZIxRGPkP0D5H+MObnHGiovDGTZTwCuQvHhZbGTQ9QUz1h4gMj4EyDLW/IwKDswlC
         SKHRMUTljhzBu+QrnLOMZeERsFrhjgEulZ99/0rVo6T+qLTPhL5tX0LgoxOmSUC2aoAN
         pWjQ==
X-Gm-Message-State: AOJu0YzMJsW0w413foEmXyLad70ujHWx7qDCe4vgldrJfSD9rl6wcwWb
	02LYRzdxymNwwByk7t1zWVqG/ESDLMJ6bR1gzn7IOel5T4bEOsrWzEVC
X-Gm-Gg: AZuq6aLs7/jEpcCZjDga3AYr7tMD3Lzmzt4q4rihagYBPIBbwomCzFra/05M0MnD15w
	XOHBMWU+VobKslw6GtCOxWXtm1zRHw8uhwj+MFZ90lnt2cemNiS8Z5HPfB2igbHEUiXPLXU4GWb
	yIjM2Wr74iZBZW+SBsJ2M33Aw3SwagjW0voIw1i8jLBfL0GQKOKYGE8e857T7EupIGhS3icxHrj
	rtWOwP1ot+tTcome9drAqVoMFeCranh6hz8rmzZh/hKliZg9/WaheNHf+3PvkgfiKurwwQxJd3R
	eZkRV8Lh8S9s/RHbxoJbaX6oWGEb/SCQUwxuAAZlxT3KopzDeoAzdm4/HMlZgN+6HTM0n9715vO
	uiLv7kZaJbteMrpllKfUIBiGaq/k6ajo14Kw4BeyuMOn9QdSuYjOtJCWuGX1Es4+KxUKR2opjgu
	8iin86nY38vkRGsj7BhZy9XMiJp3SVjvwKdtXULCfZSMwUFijUBzMMdo4Jwf4C50o=
X-Received: by 2002:a05:7300:6ca1:b0:2b0:59da:f798 with SMTP id 5a478bee46e88-2b6fdc7bff9mr2098244eec.21.1768933514943;
        Tue, 20 Jan 2026 10:25:14 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d631:e554:f0bd:4106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b364579csm17884404eec.23.2026.01.20.10.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:25:14 -0800 (PST)
Date: Tue, 20 Jan 2026 10:25:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Job Noorman <job@noorman.info>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] Input: ili210x - convert to dev_err_probe()
Message-ID: <fw7csyedd56txho4ccx2qmhxpqisvp4uz5ubofatcr6sbvu5hn@vekvo3k55kf6>
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
 <20260117001215.59272-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117001215.59272-2-marek.vasut+renesas@mailbox.org>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-17227-lists,linux-input=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-input@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-input,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,mailbox.org:email]
X-Rspamd-Queue-Id: EED6649CAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Jan 17, 2026 at 01:12:03AM +0100, Marek Vasut wrote:
> Simplify error return handling, use dev_err_probe() where possible.
> No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied, thank you.

-- 
Dmitry

