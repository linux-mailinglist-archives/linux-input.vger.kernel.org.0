Return-Path: <linux-input+bounces-15092-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 646FAB9C3E3
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 23:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25F394C7ECC
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 21:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E9F286412;
	Wed, 24 Sep 2025 21:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csGWOB/H"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4370285C89
	for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758748449; cv=none; b=JVexzzdHKHMSgEGzjojUWVzpnladRQ8DlVzJsQxc8zUvOFWRUrzrwUSrKvPR2R+MyXeug3lvkjWJa1Rc50XcH6q+9FBWwafca/Zi5jEI44GKYSv4XRD5vYTPD9hqLXICTXQcmBX23/GtvLsRE36Un6BP8ph2w1pxvoF8aPS2f0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758748449; c=relaxed/simple;
	bh=tWPoT8hXA8bqdaHaLzPDAH+YrWSf3vmYsx1qgBZ34/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJEPCBIsPa5ofkDKRrMVaHsSdMJDn/zrTaPPhdUJ/0PPj3CfHcrEX0k8HEkhyrQIg9Td3n5pOoaodTF7tVaJoTTBPIictPlIXrLFisn9/ClZR2dhZ7aK2sVboctwgSQO+ZNor4FnZD9qlMkuUQMRYWGiALxDxhSN1jp+RslBNa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csGWOB/H; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b5507d3ccd8so272555a12.0
        for <linux-input@vger.kernel.org>; Wed, 24 Sep 2025 14:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758748447; x=1759353247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qtI+Xxsd8rE3fuveLCvU/MdyjxsiyhC9uH9cXSeRvHU=;
        b=csGWOB/HzJADn0swCXqj9R56mgoUOI0Pin4QmIaWC/74MHyRR3MQIBx1iQ9OgneAfd
         WoEjdvhmSwIunGvKEPvLT1a44KqkX1448zPIKM8NuX+eosNyxTCUF+ZbtmHhMaCaYyed
         RPWFHlkp3iZ6z7P3JjMI307Iki5nTpNOmlsob8rIM6a8e9DwvMTwUsQTT7pr3BONDUTj
         kuGeMrLTh+q6GOq5R4tX3bvZCo8i+WJFDLDziTGpwAzjXYR7Rk9Sv0joOLGkAhs/DMLH
         7MY600cPu1RcDC+Ez1J5Z3L8Bwxqcyhier7x5j26c04FUXkAZoRFolSscdyYHcgxrdnb
         N0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758748447; x=1759353247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtI+Xxsd8rE3fuveLCvU/MdyjxsiyhC9uH9cXSeRvHU=;
        b=JLV1KkFIbrCh2MdGkodTPYWAgtekcMDn9sFi54yI7Nrrw1PjYeVa8WjCGHZHUE0bI8
         gWBW8CVoN2vSXm3zF5xtIy1B0CsajY+lfak4bL6awo8upo4rD7yO1CAFez1xn+5UcJoy
         rQZV/rhuGKBXSUbwi64+vRJOAT9eh1FQ4XgKM/mFiZBAfjpa8lBFl2W7Mxyf3rT4c+ma
         FtLoZy2lSLCJ1xs+W2ldcq1CejWRdP7nOYzojOtNG4I5oqEZqmcejZzOPe9T4nhofvg5
         tS/W0N8YZNnHWM4y6VlxVZoFK40h/N08fm4vRM/srVlJw5Fq3X7zN7GEnMSpcr7lCF+j
         kxdg==
X-Forwarded-Encrypted: i=1; AJvYcCUIlV+NKE5zA6Tp7Uc6331PY+bOXbKYeH9cHEqjheuwdBAkfHVBrNZGDT4E8DTAmHp15MNusZ+B5mMwvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy40wzDW+/WfFKmQjYnrFQHJlVbAuUmSjrciWfHWfxJwcOueO6u
	FLrUGSH73j5eaMKyEikT5MxBDRsFLniBeYOUvinGP/kqEbvi3fLaxWqR
X-Gm-Gg: ASbGncvpRhNZfwqh+nz56yqO6Uqt5LnHAZIMdZf7wCNEtOVhe7bHp5/16mRq0IlRI+t
	3lm+sbND49FDp2MHIRnhsWan5RVLL4jsDjqdoD5bM++25wOyapNM1dYzYn7TqRhjo/jf9RBilp2
	iNpN9zaT0uqOOoaQ8/8LB5fjxp4s5bYBMVp94kSbLqy7yIqBcfBENol0UVDk7akFh9ltH1r8+LL
	i3Q8+eCFBv6DlvzMcUyGEF0vxis5TkV6b59nJAiesMHahlzyRWS/QO/5KOoIvs9BSI04sVpu61+
	Eoa+wQTmTia/RtVYADBurMb37W4TGnIj85plCJ+b++dyC4agbW02F9aLNY5RIIieq3jc2W9iS39
	zGo+oOk9xIcqPEN8MHbCDmw==
X-Google-Smtp-Source: AGHT+IHchnbtWrdhaWeshGUQo0IHCW+W1jq7tB9DCwBzgUE/TOXYECiLeyb7fq0Zi9TPW9Z78gDzfw==
X-Received: by 2002:a17:903:b8f:b0:271:7eba:a49 with SMTP id d9443c01a7336-27ed49dd8bcmr11592285ad.19.1758748446942;
        Wed, 24 Sep 2025 14:14:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5a97:14cb:a5e:6c78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53cbe6dsm206917a12.21.2025.09.24.14.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 14:14:06 -0700 (PDT)
Date: Wed, 24 Sep 2025 14:14:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	sebastian.reichel@collabora.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: touchscreen: convert eeti bindings
 to json schema
Message-ID: <xugkxduy7thmh3x373rcsacfdslnvscdfii23acx3qq2jp73l6@ymxf7g5earka>
References: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>

Hi Dario,

On Sun, Sep 21, 2025 at 07:33:42PM +0200, Dario Binacchi wrote:
> Convert EETI touchscreen controller device tree binding to json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

This conflicts with my tree, could you please rebase against my
"next"branch (or against linux-next)?

Thanks.

-- 
Dmitry

