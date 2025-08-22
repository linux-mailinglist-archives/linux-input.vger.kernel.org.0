Return-Path: <linux-input+bounces-14250-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9926AB30BFC
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 04:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A98760065D
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 02:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45937247283;
	Fri, 22 Aug 2025 02:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hozn43S9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E8C242D93;
	Fri, 22 Aug 2025 02:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755830697; cv=none; b=ZwBauV6a8SUPFu2Dnl8yVsywDAoQnJD7XyX49JhxyJDUkPt4e9pVBwY3eR30uh63ApSvwUd/MJWLb2QYN+AziCF7X1OzMYZn2zDSic0oZuLNXNxR5LCb3j5nfuAxdR+bAJNPcXUvBLM9Gh/gwLj6RA6MLzXaC7woFAJX7btlMz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755830697; c=relaxed/simple;
	bh=ymmCrP+/+P+LpNntOeSJe6zYTkGwo1FDY5h+FuIYRoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5C56BU4qu+ogOOE7ogWL0RoclZtzQoFr+YjjjsDA49KJqumcjoZZIJgjMhymjb/mB+bcCFSug75pxZsU5SX3QTYigMsxiLh/wB1GusXJ6HDEKLI+PaN+111uwLp5Vbkr1VB5nNnHve9fqPepmOPeUXeyqzAKBZpLLlHc0GWaiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hozn43S9; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b4717ba0d5dso1198535a12.1;
        Thu, 21 Aug 2025 19:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755830695; x=1756435495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uHOsZL5h3AOX8Ev+qfsTMnxg8y5sgs76/JGMQGQVcN8=;
        b=Hozn43S9Gpx3MM8hSNcuPMpOYsnP4kdoTADWf84Qb/87vwXulHE+dhXVB9woc1eCql
         vzBuKO146f+fZNlcXAYs/pno9f6XfsjxA7g+hM13WjKEN8flR/8dmjY2pykEPNOWuk5U
         pn8BFUcVdXoZzzywC3JnSN/r9cQ9X5WDBTOxNtIDwQQx1/nKamzDYGlABzGh8xvHdAvv
         pdfhpYXJsVUboXbFkgpjwshroVThXa8KCaUPtyrQw1jCnNAeP9x47dx+T7TvHPAt/ZX3
         ZNMiniqcbQFEyrjEYLZ71nyDIWiNbTLXnW67EOPnvBl8QttKYmSGN+3mhhMcjff2kdNF
         TApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755830695; x=1756435495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHOsZL5h3AOX8Ev+qfsTMnxg8y5sgs76/JGMQGQVcN8=;
        b=Kw2HfoMRMwQw5yVj2/l3axQfwe4ScKLghM2vlc16YmVdkFZZSjCOZkCWKEQY0bB8B8
         plIzCiJr5UijuKyc25QEKRwOAQqcqUFFUYWrDrIpUgqluYWubiU8h04M25ckjhevVg72
         yh0+sJZz4n+eNxOLrdlxP4i7fWygA+QX3DMtkeObDrFa/0SljzbeeQDE1P+h3fdy0HzO
         QMCcu88uWE+LD+T9t5ZG5JAUvh4k3TST0WoJtBgxWFrMn8iG8AP3egtm+Fwg4yASaCHR
         6nh3TNBuLtRm9aeIKEVEMBpzfK5CueUws2d58/z20wSQyoWiiPMgimcpIt8skfhIeCpj
         ip4A==
X-Forwarded-Encrypted: i=1; AJvYcCURcux4gU0qFChN4yeyh1Q2R81c87uiZFHvIN3EmU7Cl81jE0+wMASeAiCac5I8SnN//U9LFQDeTfmT@vger.kernel.org, AJvYcCXgkoKkHziDzbPp3q+YhQP+21D8yT851XFeSFhMVzXewjzV7Pur8dmjaZPE5lcFsEuAJkBjcijFwKiESB1X@vger.kernel.org, AJvYcCXxh12pDh5+CiAGF9ev2XZ6pBqounOhFjQ3MZwTQTgCbwYtJU93e/eanjElne8SCSrTjBmW5FwM8t16U74=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLQqh+RQfNay+GmWW5bD4iqCIjC6xKO6DMPst4WrGyg4l31Au
	ov+yc53RW57WvbAAcAhwp0NjjV3hNO4imr/e5/1Gt/SDl1GamL+HXl2X
X-Gm-Gg: ASbGncsVo1Rwc9G0t2lKvcz/dr9CTmkIW4bk0UoZD7ece8o9+t8Jok8RYR3GZDUaV/M
	Ht0tXrA3Y5FY0aPpRLj8xUSB1iYbYeBVCzuZHYU//zd1RAucO718xFwSmc2FnsZj6g8Kvp448U7
	IfjiPa2b4cPGrpCVLECWu5tH3DuAhdd2GptAZoHr/6z/iTAFjc/+xIpHoMB0V/Z9egThup31grl
	8S9fsyfWkFjS2akKzrRK+o2MOTN1xQc4lpqTQh6HgCN6WxmscRksVRdzLEweiZZ1mD2etaDCj+j
	KIL5UOaDZtGVdiS2RdvjGmL//E48mfDJRGnWRbxLz6q/ZyXRbfS5HN9gQRhBxtZkrobs/AZ5RUE
	fqT2oNTbM9PvnrVHOH+rgfJX2k7c+ye7s
X-Google-Smtp-Source: AGHT+IG/bG+rHH6H4KxhjjaxQycZZAweGpYfTMuCllHKApJ6KI6vKWQZMMacqTWR/3qipm3upk4BaQ==
X-Received: by 2002:a05:6a20:2450:b0:243:78a:82d2 with SMTP id adf61e73a8af0-24340e2aeddmr1948063637.31.1755830694893;
        Thu, 21 Aug 2025 19:44:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9cb2:179:b04b:be48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77033785903sm262094b3a.66.2025.08.21.19.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 19:44:54 -0700 (PDT)
Date: Thu, 21 Aug 2025 19:44:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [RESEND v2 1/1] dt-bindings: input: convert lpc32xx-key.txt to
 yaml format
Message-ID: <x43o5o4pcmhoudaeoklzanvivvwgytyrubvfwjfigcplaizgzm@ll5mq3nzsgnb>
References: <20250818183814.3603308-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818183814.3603308-1-Frank.Li@nxp.com>

On Mon, Aug 18, 2025 at 02:38:13PM -0400, Frank Li wrote:
> Convert lpc32xx-key.txt to yaml format.
> 
> Additional changes:
> - set maximum of key-row(column) to 4.
> - add ref to matrix-keymap.yaml.
> 
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

